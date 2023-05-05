#pragma once

#include <stdint.h>
struct CortexA7::MMU {

	enum SectionType { SECTION, SUPERSECTION };

	enum Preset { NORMAL, DEVICE, ORDERED };

	struct Entry {

		union {
		
			uint32_t raw;

			struct { 
				uint32_t type                : 2; // Entry type (bits[1:0])
				uint32_t bufferable          : 1; // Bufferable bit (bit[2])
				uint32_t cacheable           : 1; // Cacheable bit (bit[3])
				uint32_t execute_never       : 1; // eXecute Never bit (bit[4])
				uint32_t domain              : 4; // Domain field (bits[8:5])
				uint32_t present             : 1; // Indicates if the entry is valid or not (bit[9]()
				uint32_t access_permission   : 2; // Access Permissions bits (bits[11:10])
				uint32_t tex                 : 3; // TEX field (bits[14:12])
				uint32_t apx                 : 1; // Access Permissions Extension bit (bit[15])
				uint32_t shared              : 1; // Shared bit (bit[16])
				uint32_t not_global          : 1; // When the NG bit is set to 1, the translation table entry only applies to the ASID that it was inserted for. 
				uint32_t is_supersection     : 1; // Supersection bit (bit[18])
				uint32_t other               : 13; // Supersection bit (bit[19-31])
			};
			
			struct { 
				uint32_t pad_pointer         : 10; 
				uint32_t l2_base_address     : 22; 
			};
			
			struct { 
				uint32_t pad_section         : 20; 
				uint32_t section_address     : 12; 
			};
			
			struct { 
				uint32_t pad_supersection    : 24; 
				uint32_t supersection_address: 8; 
			};
		};
		
		void set_address(uint32_t address) {
			
			if (is_supersection) {
				
				Entry old_entry = *this;
				raw = address;
				pad_supersection = old_entry.pad_supersection;
			
			} else {
			
				Entry old_entry = *this;
				raw = address;
				pad_section = old_entry.pad_section;
			
			}
		}
		
		void configure(SectionType section_type, Preset preset) {
			
			uint32_t address = raw;
			
			raw = 0;
			type = 2;
			is_supersection = (section_type == SUPERSECTION);

			// FULL ACCESS
			apx = 0;
			access_permission = 3;
		
			// https://developer.arm.com/documentation/den0013/d/The-Memory-Management-Unit/Memory-attributes/Memory-types?lang=en	
			if (preset == NORMAL) {

				//Outer and Inner write-back, no allocate on write
				tex = 0;
				bufferable = 1;
				cacheable = 1;
				
				//tex = 5;
				//bufferable = 1;
				//cacheable = 0;
				
				execute_never = 0;
				
			} else if (preset == DEVICE) {

				//bufferable may be an option too
				tex = 2;
				bufferable = 0;
				cacheable = 0;
				execute_never = 1;
				
			} else if (preset == ORDERED) {
				
				tex = 0;
				bufferable = 0;
				cacheable = 0;
				execute_never = 0;

			} else {
				
				type = 0;
			}

			// Disable Adress Space ID 
			not_global = 0;
			
			// Shared memory is deprecated. 
			shared = 1;

			present = 0;
			domain = 15;
			
			//execute_never =  1;
			
			set_address(address);
		}
	};
	
	struct L1_Table {
			
		Entry entries[4096];
		
		void init_linear_mapping(SectionType section_type, Preset preset) {
			
			for (uint32_t i=0; i<4096; i++) {
				
				entries[i].configure(section_type, preset);

				uint32_t address = i * 1024 * 1024;
				entries[i].set_address(address);
			}
		}
		
		Entry &operator[](uint32_t i) { return entries[i]; }
	};

	static void enable(intptr_t page_table_address) {
		
		CortexA7::CP15::set_branch_prediction(false);
		CortexA7::CP15::set_instruction_cache(false);
		CortexA7::CP15::set_data_cache(false);

		//enable_d_side_prefetch();
		
		CortexA7::CP15::all_barriers();


		// Write Translation Table Base Control Register
		asm volatile("mcr p15, 0, %0, c2, c0, 2" : : "r" (0));
		// Set the page table base register
		asm volatile("mcr p15, 0, %0, c2, c0, 0" : : "r" (page_table_address));
		// Set all Domains to Client
		asm volatile("mcr p15, 0, %0, c3, c0, 0" : : "r" (0x55555555));

		CortexA7::CP15::set_mmu(true);

		CortexA7::CP15::all_barriers();

		CortexA7::CP15::set_branch_prediction(true);
		CortexA7::CP15::set_instruction_cache(true);
		CortexA7::CP15::set_data_cache(true);
		
		CortexA7::CP15::all_barriers();
	}


	static void disable() {
		
		CortexA7::CP15::set_branch_prediction(false);
		CortexA7::CP15::set_instruction_cache(false);
		CortexA7::CP15::set_data_cache(false);
		
		CortexA7::CP15::all_barriers();

		CortexA7::CP15::set_mmu(false);

		CortexA7::CP15::all_barriers();
	}	
};
