#include "bsx.h"

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


#define UNROLL1(a) do { {a} } while (false)
#define UNROLL8(a) do { {a} {a} {a} {a} {a} {a} {a} {a} } while (false)

void switch_to_supervisor_mode(void)
{
    asm volatile ("msr ELR_hyp, lr\n");
    asm volatile ("eret\n");
}

extern "C" void main() {
	
	auto &mem = BSX::MEM();
	auto &io = BSX::IO();

	auto &log = *&mem.log;
	log.init();


	
	mem.mmu_l1_table.init_linear_mapping(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::DEVICE);
	for (int i = 0; i < 32; i++)
		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
	
	for (uint32_t a = intptr_t(mem.RAM_CACHED); a < intptr_t(mem.RAM_CACHED) + sizeof(mem.RAM_CACHED); a += 1_M) {

		uint32_t i = a / 1_M;
		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
		mem.mmu_l1_table[i].configure(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::NORMAL);
		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
	}

	for (uint32_t a = intptr_t(mem.RAM_ORDERED); a < intptr_t(mem.RAM_ORDERED) + sizeof(mem.RAM_ORDERED); a += 1_M) {

		uint32_t i = a / 1_M;
		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
		mem.mmu_l1_table[i].configure(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::ORDERED);
		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
	}
	
	
	
	
	log << "Hello ";
	log << " world ARM!\n";
	
	//CortexA7::MMU::enable( intptr_t(&mem.mmu_l1_table[0]) );
	
	log.printf("MMU Table at %08x\n", intptr_t(&mem.mmu_l1_table[0]) );
	
	{
		CortexA7::CP15::ACTLR r;
		r.read();
		log.printf("ACTLR: %08x\n", r.raw);
	}

	{
		CortexA7::CP15::SCTLR r;
		r.read();
		log.printf("SCTLR: %08x\n", r.raw);
		CortexA7::CP15::set_instruction_cache(true);
		//CortexA7::CP15::set_data_cache(true);
		CortexA7::CP15::set_branch_prediction(true);
		CortexA7::CP15::all_barriers();
		
		r.read();
		log.printf("SCTLR: %08x\n", r.raw);
	}

	log.printf("read_MIDR: %08x\n", CortexA7::CP15::read_MIDR());
	
	{
		uint32_t cpsr;
		asm volatile ("mrs %0, cpsr" : "=r" (cpsr));
		log.printf("read_cpsr: %08x\n", cpsr);
		if ( (cpsr & 0x1F) == 0x1a) {
			//switch_to_supervisor_mode();
		}
	}


	if (0) {
		uint32_t cpsr;
		asm volatile ("mrs %0, cpsr\n" : "=r" (cpsr));
		log.printf("read_cpsr: %08x\n", cpsr);

		uint32_t SPSR_hyp;
		asm volatile ("mrs %0, SPSR_hyp\n" : "=r" (SPSR_hyp));
		log.printf("SPSR_hyp: %08x\n", SPSR_hyp);

		SPSR_hyp = 0x01d3;
		asm volatile ("msr SPSR_hyp, %0\n" :: "r" (SPSR_hyp));

		asm volatile ("mrs %0, SPSR_hyp\n" : "=r" (SPSR_hyp));
		log.printf("SPSR_hyp: %08x\n", SPSR_hyp);
		
		
	}

	io.AHB1_APB1_CFG_REG.DW = 0x3140;
	io.CPUX_AXI_CFG_REG.DW = 0x20201;

	constexpr uint32_t N_ITER = 100000;
	constexpr uint32_t N_REP = 1;
	
	{
		uint32_t t0 = io.TMR1_CUR_VALUE_REG.DW;
		while (t0 == io.TMR1_CUR_VALUE_REG.DW);
		
		while (t0 - io.TMR1_CUR_VALUE_REG.DW < 24000000);
	}
		

	uint32_t t0 = io.TMR1_CUR_VALUE_REG.DW;
	uint32_t v = 0;

	uint32_t i = N_ITER;
	while (i--) {
		UNROLL1({
			CortexA7::u32_u pa; pa.DW = io.PA.DATA.DW;
			CortexA7::u32_u pe; pe.DW = io.PE.DATA.DW;
			
			CortexA7::u32_u msx_control_bus = pa;
			msx_control_bus.byte3 = pe.byte1;
			
			if (msx_control_bus.bit15 && msx_control_bus.bit16) { 
				pe.bit04 = pa.bit05;
				io.PE.DATA.DW = pe.DW;
			}
			v += pe.DW;
		});
	}
	
	io.AHB1_APB1_CFG_REG.DW = 0x3180;
	io.CPUX_AXI_CFG_REG.DW = 0x20203;
	if (v == 0) {
		log << "Done 2!\n";
	} else {
		log << "Not Done 2!\n";
	}
	uint32_t t1 = io.TMR1_CUR_VALUE_REG.DW;
	int d = t0 - t1;

	log.printf(" %d %d %d \n", t0, t1, d);
	
	log.printf("%d\n", d/(24 * N_REP * (N_ITER / 1000)));
	
	log.printf("%08x\n", io.CPUX_AXI_CFG_REG.DW );
	
	log.printf("%08x\n", io.AHB1_APB1_CFG_REG.DW );
	
	log.printf("CPU_CLK_GATING_REG %08x\n", io.CPU_CLK_GATING_REG.DW );
	
	
	log.printf("CPU0_RST_CTRL %08x\n", io.CPU0_RST_CTRL.DW );
	log.printf("CPU0_CTRL_REG %08x\n", io.CPU0_CTRL_REG.DW );
	log.printf("CPU0_STATUS_REG %08x\n", io.CPU0_STATUS_REG.DW );
	
	log.printf("CPU3_RST_CTRL %08x\n", io.CPU3_RST_CTRL.DW );
	log.printf("CPU3_CTRL_REG %08x\n", io.CPU3_CTRL_REG.DW );
	log.printf("CPU3_STATUS_REG %08x\n", io.CPU3_STATUS_REG.DW );

	//CortexA7::MMU::disable();
}
