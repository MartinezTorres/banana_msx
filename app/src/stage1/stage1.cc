#include <include/bsx.h>

static void __attribute__((target("arm"))) __attribute__ ((naked)) start_stage1() {

	asm volatile (".global stage1_start_address\n");
	asm volatile (".set stage1_start_address,%c0\n" : : "i" (&BSX::MEM().stage1) );	
	asm volatile ("mov sp, %0\n" :: "r" (&BSX::MEM().stack[sizeof(BSX::MEM().stack)-4]) ); // init stack;

	CortexA7::CP15::set_instruction_cache(false);
	CortexA7::CP15::set_data_cache(false);
	CortexA7::CP15::set_branch_prediction(false);
	CortexA7::CP15::all_barriers();

	volatile auto &mem = BSX::MEM();
	{
		
		uint32_t cpsr;
		asm volatile ("mrs %0, cpsr" : "=r" (cpsr));
		if ( (cpsr & 0x1F) == 0x1a) {

			asm volatile ("msr SPSR_hyp, %0\n" :: "r" (0x000001d3));
			asm volatile ("msr ELR_hyp, %0\n" :: "r" (start_stage1));
			asm volatile ("eret\n");
		}
	}

	asm volatile ("cpsid if\n");

	{
		auto &io = BSX::IO();
		
		uint32_t t0 = io.TMR1_CUR_VALUE_REG.DW;
		
		mem.stage1_init = InitType(0xC0FFEE);
		mem.stage2_init = InitType(0xBADC0DE);

		for (;;) {

			uint32_t t1 = io.TMR1_CUR_VALUE_REG.DW;
			
			if ( (t1 >> 18) == (t0 >> 18) ) {
				
				continue;
			}
				
			t0 = t1;			
			io.PL.DATA.DW = io.PL.DATA.DW ^ 1024;

			if (mem.stage2_init != InitType(0xBADC0DE)) {
				
				auto stage2_init = mem.stage2_init;
				mem.stage2_init = InitType(0xBEEF);
				
				(stage2_init)();

				mem.stage2_init = InitType(0xBADC0DE);
			}
		}
	}
	
}
	

InitType entry_point[1] __attribute__ ((section("entry_point_section"))) = { start_stage1 };
