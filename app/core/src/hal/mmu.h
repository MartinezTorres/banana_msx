#pragma once

#include <stdint.h>

namespace MMU {

	enum SectionType { FAULT = 0, SECTION = 2, SUPERSECTION = 3 };

	enum Preset { NORMAL, DEVICE, ORDERED };

	struct Entry {

		union {
		
			uint32_t raw;

			struct { 
				uint32_t section_type        : 2; // Section type (bits[1:0])
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

			Entry old_entry = *this;
			
			raw = address;

			if (section_type == SUPERSECTION) {
				
				pad_supersection = old_entry.pad_supersection;
			
			} else if (section_type == SECTION) {
			
				pad_section = old_entry.pad_section;
			
			} else {
				
				section_type = FAULT;
			}
		}
		
		void configure(SectionType section_type, Preset preset) {
			
			uint32_t address = raw;
			
			raw = 0;
			section_type = section_type;
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
				
				section_type = FAULT;
			}

			// Disable Adress Space ID 
			not_global = 0;
			
			// Shared memory is deprecated. 
			shared = 0;

			present = 1;
			domain = 0;
			
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
}
