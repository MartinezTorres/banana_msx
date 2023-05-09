#include "bsx.h"

enum {
	PA_RD = 1<<16, // PA
	PA_WR = 1<<21, // PA
	PA_SLTSL = 1<<17, // PA

	PE_LCD_CS = 1<<8, // PE
	PE_LCD_RESET = 1<<9, // PE
	PE_LCD_DC = 1<<10, // PE

	PE_SYS_CLK = 1<<11, // PE
	PE_MERQ = 1<<12, // PE
	PE_IORQ = 1<<13, // PE
	PE_RESET = 1<<14, // PE
	PE_BUSDIR = 1<<15, // PE

	B_RD = 1<<16,
	B_WR = 1<<21,
	B_SLTSL = 1<<17,

	B_SYS_CLK = 1<<( 24 + 11),
	B_MERQ = 1<<( 24 + 12),
	B_IORQ = 1<<( 24 + 13),
	B_RESET = 1<<( 24 + 14),
	B_BUSDIR = 1<<( 24 + 15),
	
	PL_M1 = 1<<2, // PL
	PL_RFSH = 1<<4, // PL

	PC_WAIT = 1<<4, // PC
	PC_IRQ = 1<<7, // PC
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


#define UNROLL1(a) do { {a} } while (false)
#define UNROLL8(a) do { {a} {a} {a} {a} {a} {a} {a} {a} } while (false)

static inline auto &log() { return *&BSX::MEM().log; }
template<class... Ts> static inline int printf(Ts... args) { return log().printf(args...); }
	
static void main() {
	
	auto &mem = BSX::MEM();
	auto &io = BSX::IO();

	printf("Hello World BANANARMSX!\n");
	
	if(0) {
		CortexA7::CP15::ACTLR r;
		r.read();
		printf("ACTLR: %08x\n", r.raw);
	}

	if(0) {
		CortexA7::CP15::SCTLR r;
		r.read();
		printf("SCTLR: %08x\n", r.raw);
		CortexA7::CP15::set_instruction_cache(true);
		CortexA7::CP15::set_data_cache(false);
		CortexA7::CP15::set_branch_prediction(false);
		CortexA7::CP15::all_barriers();
		
		r.read();
		printf("SCTLR: %08x\n", r.raw);
	}

	printf("read_MIDR: %08x\n", CortexA7::CP15::read_MIDR());
	
	if (0) {
		uint32_t cpsr;
		asm volatile ("mrs %0, cpsr" : "=r" (cpsr));
		printf("read_cpsr: %08x\n", cpsr);
	}

	H3::set_cpu_speed(H3::CPU_1200);
	io.AHB1_APB1_CFG_REG.DW = 0x3140;
	io.CPUX_AXI_CFG_REG.DW = 0x20201;

	constexpr uint32_t N_ITER = 10000;
	constexpr uint32_t N_REP = 1;
	
	{
		uint32_t t0 = io.TMR1_CUR_VALUE_REG.DW;
		while (t0 == io.TMR1_CUR_VALUE_REG.DW);
		
		while (t0 - io.TMR1_CUR_VALUE_REG.DW < 24000000);
	}
	
	//io.PLL_DDR_CTRL_REG.DW = 0x90001A10;

	uint32_t t0 = io.TMR1_CUR_VALUE_REG.DW;
	uint32_t v = 0;

	uint32_t i = N_ITER;
	CortexA7::u32_u pa; pa.DW = io.PA.DATA.DW;
	CortexA7::u32_u pe; pe.DW = io.PE.DATA.DW;
	CortexA7::u32_u pc; pc.DW = io.PC.DATA.DW;
	while (i--) {
		pa.DW = io.PA.DATA.DW;
		pe.DW = io.PE.DATA.DW;
		
		CortexA7::u32_u msx_control_bus = pa;
		msx_control_bus.byte3 = pe.byte1;
		
		if ( msx_control_bus.DW & (B_MREQ + B_SLTSL + B_CS + B_RD) == 0 ) { // This is a read! 

			io.PC.DATA.byte0 = PC_WAIT;
			io.PE.CFG[0] = 0x11111111;
			io.PE.DATA.byte0 = mem.mapped_cartridge[pa.word0];
			io.PC.DATA.byte0 = 0;
			
			while ( msx_control_bus.DW & (B_CS) ) {
				msx_control_bus.byte3 = io.PE.DATA.byte1;
			}
			io.PE.CFG[0] = 0x11111111;
		}
		v += pe.DW + mem.mapped_cartridge[pa.word0];
	}
	H3::set_cpu_speed(H3::CPU_1008);
	io.AHB1_APB1_CFG_REG.DW = 0x3180;
	io.CPUX_AXI_CFG_REG.DW = 0x20203;
	if (v == 0) {
		log() << "Done 2!\n";
	} else {
		log() << "Not Done 2!\n";
	}
	uint32_t t1 = io.TMR1_CUR_VALUE_REG.DW;
	int d = t0 - t1;

	printf(" %d %d %d \n", t0, t1, d);
	
	printf("%d\n", d/(24 * N_REP * (N_ITER / 1000)));
	
	printf("%08x\n", io.CPUX_AXI_CFG_REG.DW );
	
	printf("%08x\n", io.AHB1_APB1_CFG_REG.DW );
	
	printf("CPU_CLK_GATING_REG %08x\n", io.CPU_CLK_GATING_REG.DW );
	printf("PLL_DDR_CTRL_REG %08x\n", io.PLL_DDR_CTRL_REG.DW );
	
	
	printf("CPU0_RST_CTRL %08x\n", io.CPU0_RST_CTRL.DW );
	printf("CPU0_CTRL_REG %08x\n", io.CPU0_CTRL_REG.DW );
	printf("CPU0_STATUS_REG %08x\n", io.CPU0_STATUS_REG.DW );
	
	printf("CPU3_RST_CTRL %08x\n", io.CPU3_RST_CTRL.DW );
	printf("CPU3_CTRL_REG %08x\n", io.CPU3_CTRL_REG.DW );
	printf("CPU3_STATUS_REG %08x\n", io.CPU3_STATUS_REG.DW );
}

static void init_mmu() {

	auto &mem = BSX::MEM();

	log() << "Init MMU\n";

	mem.mmu_l1_table.init_linear_mapping(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::DEVICE);
	for (int i = 0; i < 32; i++)
		printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
	
	if(1) for (uint32_t a = intptr_t(mem.RAM_CACHED); a < intptr_t(mem.RAM_CACHED) + sizeof(mem.RAM_CACHED); a += 1_M) {

		uint32_t i = a / 1_M;
		//printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
		mem.mmu_l1_table[i].configure(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::NORMAL);
		//printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
	}

	if(1) for (uint32_t a = intptr_t(mem.RAM_ORDERED); a < intptr_t(mem.RAM_ORDERED) + sizeof(mem.RAM_ORDERED); a += 1_M) {

		uint32_t i = a / 1_M;
		//printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
		mem.mmu_l1_table[i].configure(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::ORDERED);
		//printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
	}
	
	
	printf("MMU Table at %08x\n", intptr_t(&mem.mmu_l1_table[0]) );
		
	CortexA7::MMU::enable( intptr_t(&mem.mmu_l1_table[0]) );

	log() << "MMU Enabled\n";
		
}

static void deinit_mmu() {

	log() << "Disable MMU\n";

	CortexA7::MMU::disable();	

	log() << "MMU disabled\n";
}
static void start_stage2() {
	
	asm volatile (".global stage2_start_address\n");
	asm volatile (".set stage2_start_address,%c0\n" : : "i" (&BSX::MEM().stage2) );	
	
	extern uint32_t _BSS_START;
	extern uint32_t _BSS_END;
	
    // Set memory in bss segment to zeros 
    uint32_t *bss_start_p = &_BSS_START; 
    uint32_t *bss_end_p   = &_BSS_END;

    while (bss_start_p != bss_end_p) { *bss_start_p++ = 0; }

	// INIT LOG
	log().init();

	// MMU
	init_mmu();

    // Go to Main
    main();	

	deinit_mmu();
}

InitType entry_point[1] __attribute__ ((section("entry_point_section"))) = { start_stage2 };

