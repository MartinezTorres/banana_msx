#include <stdint.h>

extern uint32_t _BSS_START;
extern uint32_t _BSS_END;
extern uint32_t _DATA_ROM_START;
extern uint32_t _DATA_RAM_START;
extern uint32_t _DATA_RAM_END;

void startup(void);
int main(void);

// Define the vector table
typedef void (*InitType)(void);
InitType myvectors[1] __attribute__ ((section("boot")))= {
    startup     // code entry point
};

static void __attribute__ ((noinline)) quit_hypervisor_mode(void) {
	
	uint32_t cpsr;
	asm volatile ("mrs %0, cpsr" : "=r" (cpsr));
	if ( (cpsr & 0x1F) == 0x1a) {

		asm volatile ("msr SPSR_hyp, %0\n" :: "r" (0x000001d3));
		asm volatile ("msr ELR_hyp, %0\n" :: "r" (startup));
		asm volatile ("eret\n");
	}
}

void startup(void) {

	*((uint32_t *)0x58000000) = 0;

	
	//asm volatile("ldr     sp, =0x58100000"); // init stack;
	quit_hypervisor_mode();
	
    // Set memory in bss segment to zeros 
    uint32_t *bss_start_p = &_BSS_START; 
    uint32_t *bss_end_p   = &_BSS_END;

    while (bss_start_p != bss_end_p)
        *bss_start_p++ = 0;

    // Copy memory in data segment
    uint32_t *data_rom_start_p = &_DATA_ROM_START;
    uint32_t *data_ram_start_p = &_DATA_RAM_START;
    uint32_t *data_ram_end_p   = &_DATA_RAM_END;

    while(data_ram_start_p != data_ram_end_p) 
        *data_ram_start_p++ = *data_rom_start_p++;

    // Go to Main
    main();
}
