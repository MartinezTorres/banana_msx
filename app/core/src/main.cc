#include <stdint.h>

static constexpr unsigned long long operator ""_K(unsigned long long i) { return        1024 * i; }
static constexpr unsigned long long operator ""_M(unsigned long long i) { return 1024 * 1024 * i; }
extern "C" typedef void (*InitType)(void);

#define Module(address, name, size, other) struct __attribute__((__packed__)) { uint8_t PAD_ ## name[address-64_K]; union { uint8_t name[size]; struct { other; }; }; }
#define M(...) __VA_ARGS__

template<uint32_t SZ>
struct Log {
	
	uint32_t pos;
	uint8_t data[1<<SZ];
	
	void init() { pos = 0; }
	
	void push(char c) {
		data[pos++] = c;
		pos = pos & ((1<<SZ)-1);
	}

	Log& operator<<(const char *str) {
		
		while (*str) 
			push(*str++);
			
		return *this;
	}	
};

union H3_T {

	typedef volatile uint32_t io;

	Module( 0x01C20C00, IO_TIMER, 1_K, M(
		io TMR_IRQ_EN_REG;
		io TMR_IRQ_STA_REG;
		io pad1[2];
		io TMR0_CTRL_REG;
		io TMR0_INTV_VALUE_REG;
		io pad2[1];
		io TMR1_CTRL_REG;
		io TMR1_INTV_VALUE_REG;
		io TMR1_CUR_VALUE_REG;
	) );
	
	struct GPIO_PORT {
		io CFG0, CFG1, CFG2, CFG3;
		io DAY;
		io DRV0, DRV1;
		io PUL0, PUL1;
		
	};
	
	Module( 0x01C20800, PIO, 1_K, M(
		GPIO_PORT PA, PB, PC, PD, PE, PF, PG, PL;
	) );	

	Module( 0x58000000, RAM, 128_M, M(
		
		volatile InitType init;
		uint8_t stack[2_M - 4];
		uint8_t program[1_M];
		Log<20> log;
	));
};

static H3_T &H3 = *(H3_T *)64_K; // you can't assign the address zero, as it is UB.

MSX_BUSDIR
MSX_MREQ
MSX_WAIT
MSX_RFSH
MSX_INT
MSX_M1
MSX_IORQ
MSX_RESET

PA0  : MSX_A0
PA15 : MSX_A15

PA16 : MSX_RD
PA17 : MSX_SLTSL

PA18 : PCM0_SYNC --> I2C_SYNC
PA19 : PCM0_CLK  --> I2C CLK
PA20 : PCM0_DOUT --> I2C DOUT
PA21 : PCM0_DIN  --> XXX

PC0  : SPI0_MOSI --> LCD_MOSI/DIN
PC1  : SPI0_MISO --> ## LCD_DC
PC2  : SPI0_CLK  --> LCD_SCK
PC3  : SPI0_CS   --> ## LCD_RESET

PC7  : XXX



PE0  : MSX_D0
PE7  : MSX_D7

PE8  : MSX_WAIT#
PE9  : MSX_INT#

PE10 : MSX_IORQ
PE11 : MSX_RESET
PE12 : TWI2_SCK --> ?
PE13 : TWI2_SDA --> ?
PE14 : MSX_MREQ
PE15 : MSX_BUSDIR


PL2  :
PL4  :

missing: RST LCD



/*

struct {
	#define PIO                          0x01C20800
#define PA                           0x00
#define PE                           0x04
#define Pn_CFG0(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x00))
#define Pn_CFG1(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x04))
#define Pn_CFG2(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x08))
#define Pn_CFG3(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x0C))
#define Pn_DAT(reg)                  *((volatile u32 *)(PIO + reg*0x24 + 0x10))
#define Pn_DRV0(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x14))
#define Pn_DRV1(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x18))
#define Pn_DUL0(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x1C))
#define Pn_DUL1(reg)                 *((volatile u32 *)(PIO + reg*0x24 + 0x20))

	// PA WILL BE MAPPED AS FOLLOWS:
	// PA0-15 - ADDRESS
	// PA16 - MREQ
	// PA17 - SLTSL
	// PA18 - CS
	// PC0  - WAIT
	// PA19 - WR
	// PA20 - RD

#define MREQ        (1<<16)	
#define SLTSL       (1<<17)	
#define CS          (1<<18)	
#define WR          (1<<19)	
#define RD          (1<<20)	
 




void ascii8_mapper(void) {

	//u8 *mapped_rom = (u8 *)0x58020000;
	u8 *mapped_zones[4] = {
		(u8 *)0x58020000,
		(u8 *)0x58022000,
		(u8 *)0x58024000,
		(u8 *)0x58028000};
		
	while (1) {
		u32 pa = Pn_DAT(PA);

		if ( ( pa & (MREQ + SLTSL + CS + RD) ) == 0 ) { // let's deal first with a read
			
			Pn_DAT(PE) = mapped_zones[(pa>>14) & 0x03][pa & 0x1FFF];
			Pn_CFG0(PE) = 0x11111111; // set PA7 to output;
			while ( ( Pn_DAT(PA) & CS ) == 0) {}
			Pn_CFG0(PE) = 0x00000000; // set PA7 to input;
			continue;
		}

		if ( pa & CS ) continue;
		if ( ( pa &  (MREQ + SLTSL + CS + WR) ) == 0 ) { // It's a write!
			u32 pe = Pn_DAT(PE);
			pa = pa & 0xF800;
			if (pa == 0x60) { mapped_zones[0] =  (u8 *)(0x58020000 + ( (pe & 0xFF) * 0x2000 ) ); }
			if (pa == 0x68) { mapped_zones[1] =  (u8 *)(0x58020000 + ( (pe & 0xFF) * 0x2000 ) ); }
			if (pa == 0x70) { mapped_zones[2] =  (u8 *)(0x58020000 + ( (pe & 0xFF) * 0x2000 ) ); }
			if (pa == 0x78) { mapped_zones[3] =  (u8 *)(0x58020000 + ( (pe & 0xFF) * 0x2000 ) ); }
		}
	}
}

	
} msx;
*/

extern "C" void main() {

	//while (1);

	H3.log.init();
	H3.log << "Hello world ARM!\n";
	
}
