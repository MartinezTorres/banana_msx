
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


