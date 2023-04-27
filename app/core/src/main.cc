#include "h3.h"

enum {
	RD = 1<<16, // PA
	WR = 1<<21, // PA
	SLTSL = 1<<17, // PA

	LCD_CS = 1<<8, // PE
	LCD_RESET = 1<<9, // PE
	LCD_DC = 1<<10, // PE

	SYS_CLK = 1<<11, // PE
	MERQ = 1<<12, // PE
	IORQ = 1<<13, // PE
	RESET = 1<<14, // PE
	BUSDIR = 1<<15, // PE
	
	M1 = 1<<2, // PL
	RFSH = 1<<4, // PL

	WAIT = 1<<4, // PC
	IRQ = 1<<7, // PC
};

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


static inline void set_cpu_speed() {
	
	H3.log.printf("Speed: %08x\n", H3.PLL_CPUX_CTRL_REG.DW );

//	H3.PLL_CPUX_CTRL_REG.DW = 0x90001410;
	H3.PLL_CPUX_CTRL_REG.DW = 0x90001810;
//	H3.PLL_CPUX_CTRL_REG.DW = 0x90000810;

	H3.log.printf("Speed: %08x\n", H3.PLL_CPUX_CTRL_REG.DW );
}

static inline void set_caches(bool enable_icache, bool enable_dcache) {
    uint32_t sctlr;
    asm volatile (
        "MRC p15, 0, %[sctlr], c1, c0, 0\n"  // Read the SCTLR into %[sctlr]
        : [sctlr] "=r" (sctlr)              // Define %[sctlr] as an output operand
        :                                   // No inputs
    );
    
    if (enable_icache) {
        sctlr |= (1 << 12); // Set bit 12 (the I-bit) to enable the instruction cache
        sctlr |= (1 << 11); // Set bit 11 to enable branch prediction
    } else {
        sctlr &= ~(1 << 12); // Clear bit 12 (the I-bit) to disable the instruction cache
        sctlr &= ~(1 << 12); // Clear bit 11 to disable branch prediction
    }
    
    if (enable_dcache) {
        sctlr |= (1 << 2); // Set bit 2 (the C-bit) to enable the data cache
    } else {
        sctlr &= ~(1 << 2); // Clear bit 2 (the C-bit) to disable the data cache
    }
    
    asm volatile (
        "MCR p15, 0, %[sctlr], c1, c0, 0\n"  // Write the modified SCTLR value back to the register
        "isb\n"
        "dsb\n"
        :                                   // No outputs
        : [sctlr] "r" (sctlr)               // Define %[sctlr] as an input operand
    );
}


static inline uint32_t read_sctlr() {
    uint32_t sctlr;
    asm volatile (
        "MRC p15, 0, %[sctlr], c1, c0, 0\n"  // Read the SCTLR into %[sctlr]
        : [sctlr] "=r" (sctlr)              // Define %[sctlr] as an output operand
        :                                   // No inputs
    );
    return sctlr;
}



#define UNROLL1(a) do { {a} } while (false)
#define UNROLL8(a) do { {a} {a} {a} {a} {a} {a} {a} {a} } while (false)


extern "C" void main() {

	
	//while (1);

	H3.log.init();
	H3.log << "Hello ";
	H3.log << " world ARM!\n";

	H3.log.printf("read_sctlr %08x\n", read_sctlr() );
	set_caches(false, false);
	H3.log.printf("read_sctlr %08x\n", read_sctlr() );
	set_caches(true, true);
	H3.log.printf("read_sctlr %08x\n", read_sctlr() );
	

	H3.AHB1_APB1_CFG_REG.DW = 0x3140;
	H3.CPUX_AXI_CFG_REG.DW = 0x20201;

	constexpr uint32_t N_ITER = 100000;
	constexpr uint32_t N_REP = 1;

	uint32_t t0 = H3.TMR1_CUR_VALUE_REG.DW;
	uint32_t v = 0;

	uint32_t i = N_ITER;
	while (i--) {
		UNROLL1({
			H3_T::io pa; pa.DW = H3.PA.DATA.DW;
			H3_T::io pe; pe.DW = H3.PE.DATA.DW;
			
			H3_T::io msx_control_bus = pa;
			msx_control_bus.byte3 = pe.byte1;
			
			if (msx_control_bus.bit15 && msx_control_bus.bit16) { 
				pe.bit04 = pa.bit05;
			}
			v += pe.DW;
			//H3.PE.DATA = pe;
		});
	}
	H3.AHB1_APB1_CFG_REG.DW = 0x3180;
	H3.CPUX_AXI_CFG_REG.DW = 0x20203;
	if (v == 0) {
		H3.log << "Done 2!\n";
	} else {
		H3.log << "Not Done 2!\n";
	}
	uint32_t t1 = H3.TMR1_CUR_VALUE_REG.DW;
	int d = t0 - t1;

	H3.log.printf(" %d %d %d \n", t0, t1, d);
	
	H3.log.printf("%d\n", d/(24 * N_REP * (N_ITER / 1000)));
	
	H3.log.printf("%08x\n", H3.CPUX_AXI_CFG_REG.DW );
	
	H3.log.printf("%08x\n", H3.AHB1_APB1_CFG_REG.DW );
	
	H3.log.printf("CPU_CLK_GATING_REG %08x\n", H3.CPU_CLK_GATING_REG.DW );
	
	
	H3.log.printf("CPU0_RST_CTRL %08x\n", H3.CPU0_RST_CTRL.DW );
	H3.log.printf("CPU0_CTRL_REG %08x\n", H3.CPU0_CTRL_REG.DW );
	H3.log.printf("CPU0_STATUS_REG %08x\n", H3.CPU0_STATUS_REG.DW );
	
	H3.log.printf("CPU3_RST_CTRL %08x\n", H3.CPU3_RST_CTRL.DW );
	H3.log.printf("CPU3_CTRL_REG %08x\n", H3.CPU3_CTRL_REG.DW );
	H3.log.printf("CPU3_STATUS_REG %08x\n", H3.CPU3_STATUS_REG.DW );

	
}
