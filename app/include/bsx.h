#pragma once

#include "hal/h3.h"
#include "util/log.h"

////////////////////////////////////////////////////////////////////////
//
extern "C" typedef void (*InitType)(void);

struct BSX : H3 {

	union MEMMAP_U {
		
		HAL_Module( RAM, 0x58000000, 128_M, STRUCT( ));

		HAL_Module( RAM_CACHED, 0x58000000        , 64_M, STRUCT(
		
			InitType stage1_init;
			uint8_t  stage1[16_K];
			uint8_t  stack[1_M - sizeof(InitType) - 16_K];
			uint8_t  buffer[1_M];

			InitType stage2_init0;
			InitType stage2_init1;
			uint8_t  stage2[6_M - 2 * sizeof(InitType)];

			// Aligned to 8_M
			MMU::L1_Table mmu_l1_table;
			
		));

		HAL_Module( RAM_ORDERED, 0x58000000 + 64_M, 64_M, STRUCT(
		
			uint8_t mapped_cartridge[16_M];
			Log<1_M> log;
		));
	};
	
	static MEMMAP_U &MEM()  { return HAL_map<MEMMAP_U>(); }

};
