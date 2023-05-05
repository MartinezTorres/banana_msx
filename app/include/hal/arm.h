#pragma once

#include <stdint.h>

////////////////////////////////////////////////////////////////////////
//

static constexpr unsigned long long operator ""_K(unsigned long long i) { return        1024 * i; }
static constexpr unsigned long long operator ""_M(unsigned long long i) { return 1024 * 1024 * i; }

////////////////////////////////////////////////////////////////////////
//
#define HAL_BASE_ADDRESS 64_K
//      ^^^^^^^^^^^^^^^ you can't assign the address zero as it is UB.
#define HAL_Module(name, address, size, other) struct __attribute__((__packed__)) { uint8_t PAD_ ## name[address-HAL_BASE_ADDRESS]; union { uint8_t name[size]; struct { other; }; }; }

template<typename T>
static inline T &HAL_map(void *base = 0, intptr_t physical = 0) { 

	uint8_t *p = reinterpret_cast<uint8_t *>(base) + HAL_BASE_ADDRESS - physical;
	return *reinterpret_cast<T *>(p);
}

#define STRUCT(...) struct __attribute__((__packed__)) { __VA_ARGS__ };
#define UNION(...) union { __VA_ARGS__ };

#define HAL_IO(name, offset) struct __attribute__((__packed__)) { uint8_t PAD_ ## name[offset]; volatile CortexA7::u32_u name;}

////////////////////////////////////////////////////////////////////////
//

struct CortexA7 {

	////////////////////////////////////////////////////////////////////
	//
	struct MMU;

	////////////////////////////////////////////////////////////////////
	//

	union u32_u {
		uint32_t DW;
		struct __attribute__((__packed__)) { uint16_t word0, word1; };
		struct __attribute__((__packed__)) { uint8_t byte0, byte1, byte2, byte3; };
		struct __attribute__((__packed__)) { 
			uint8_t bit00 : 1, bit01 : 1, bit02 : 1, bit03 : 1; 
			uint8_t bit04 : 1, bit05 : 1, bit06 : 1, bit07 : 1; 
			uint8_t bit08 : 1, bit09 : 1, bit10 : 1, bit11 : 1; 
			uint8_t bit12 : 1, bit13 : 1, bit14 : 1, bit15 : 1; 
			uint8_t bit16 : 1, bit17 : 1, bit18 : 1, bit19 : 1; 
			uint8_t bit20 : 1, bit21 : 1, bit22 : 1, bit23 : 1; 
			uint8_t bit24 : 1, bit25 : 1, bit26 : 1, bit27 : 1; 
			uint8_t bit28 : 1, bit29 : 1, bit30 : 1, bit31 : 1; 
		};
	};
	
	struct CP15 {		
		
		// https://developer.arm.com/documentation/ddi0464/f/System-Control/Register-descriptions/System-Control-Register?lang=en
		struct SCTLR {
			
			union {
				
				uint32_t raw;
				struct {
			
					uint32_t m:1;        // MMU enable
					uint32_t a:1;        // Alignment check enable
					uint32_t c:1;        // Data cache enable (The caches are disabled when ACTLR.SMP is set to 0 regardless of the value of the cache enable bit.)
					uint32_t res0:7;     //
					//10
					uint32_t sw:1;       // SWP/SWPB enable bit
					uint32_t z:1;        // Branch prediction enable bit
					uint32_t i:1;        // Instruction cache enable
					uint32_t v:1;        // Vectors bit. This bit selects the base address of the exception vectors.
					uint32_t res1:5;     //
					uint32_t wxn:1;      // Regions with write permissions are forced to be XN.
					//20
					uint32_t uwxn:1;     // Regions with unprivileged write permission are forced to be XN for accesses from software executing at PL1
					uint32_t res2:4;     // 
					uint32_t ee:1;       // Exception Endianness bit.
					uint32_t res3:2;     //
					uint32_t tre:1;      // TEX remap enabled.
					uint32_t afe:1;      // Only the simplified model for access permissions is supported.
					//30
					uint32_t te:1;       // Thumb Exception enable. 
					uint32_t res4;       //
				};
			};
		
			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 0\n" : "=r" (raw)); }
			void write() { asm volatile ("mcr p15, 0, %0, c1, c0, 0\n" :: "r" (raw)); }
		};
		
		struct ACTLR {
			
			union {
				
				uint32_t raw;
				struct {
					
					uint32_t res0:6;     //
					uint32_t smp:1;      // Enables coherent requests to the processor.
					uint32_t res1:3;     //
					
					uint32_t dodmbs:1;   // Disable optimized data memory barrier behavior.
					uint32_t l2radis:1;  // L2 Data Cache read-allocate mode disable.
					uint32_t l1radis:1;  // L1 Data Cache read-allocate mode disable.
					uint32_t l1pctl:2;   // L1 Data prefetch control.
					uint32_t ddvm:1;     // Disable Distributed Virtual Memory transactions.
					uint32_t res2:12;    //
					uint32_t ddi:1;      // Disable Dual Issue
					uint32_t res3:3;     //
				};
			};

			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 1\n" : "=r" (raw)); }
			void write() { asm volatile ("mcr p15, 0, %0, c1, c0, 1\n" :: "r" (raw)); }
		};
		
		static void set_branch_prediction(bool enable) { SCTLR sctlr; sctlr.read(); sctlr.z = enable; sctlr.write(); }
		static void set_instruction_cache(bool enable) { SCTLR sctlr; sctlr.read(); sctlr.i = enable; sctlr.write(); }
		static void set_data_cache(bool enable)        { SCTLR sctlr; sctlr.read(); sctlr.c = enable; sctlr.write(); }
		static void set_mmu(bool enable)               { SCTLR sctlr; sctlr.read(); sctlr.m = enable; sctlr.write(); }

		static void set_DACR(uint32_t domains)         { asm volatile ("mcr p15, 0, %0, c3, c0, 0\n" :: "r" (domains)); }
		static void set_TTBR0(uint32_t address)        { asm volatile ("mcr p15, 0, %0, c2, c0, 0\n" :: "r" (address)); }
		
		static uint32_t read_MIDR()                    { uint32_t MIDR; asm volatile ("mrc p15, 0, %0, c0, c0, 0\n" : "=r" (MIDR)); return MIDR; }
		
		static inline void all_barriers() {

			asm volatile ("mcr p15, 0, %0, c7, c5, 0\n" :: "r" (0)); // Invalidate Instruction Cache
			asm volatile ("mcr p15, 0, %0, c7, c5, 6\n" :: "r" (0)); // Invalidate branch prediction array
			asm volatile ("mcr p15, 0, %0, c8, c7, 0\n" :: "r" (0)); // Invalidate entire Unified Main TLB

			asm volatile ("isb\n"); // Instruction Synchronization Barrier operation
			asm volatile ("dsb\n"); // Data Synchronization Barrier operation
			asm volatile ("dmb\n"); // Data Memory Barrier operation.
		}
	} ;
};

////////////////////////////////////////////////////////////////////////
//
#include "mmu.h"
