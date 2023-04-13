#include <stdint.h>

extern uint32_t _BSS_START;
extern uint32_t _BSS_END;
extern uint32_t _DATA_ROM_START;
extern uint32_t _DATA_RAM_START;
extern uint32_t _DATA_RAM_END;

void startup();
int main();

// Define the vector table
uint32_t *myvectors[2] 
__attribute__ ((section("boot")))= {
    (uint32_t *)    startup     // code entry point
};

void startup() {
	
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
