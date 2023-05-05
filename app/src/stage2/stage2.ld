SECTIONS
{
    .  = stage2_start_address;

    .text : 
    {
        *(entry_point_section)       /* Vector table */
        *(.text)      /* Program code */
    }
    .rodata : 
    {
        *(.rodata)    /* Read only data */
    }
    .data :
    {
        *(.data)      /* Data memory */
    }

    _BSS_START = .;   /* Indicates where BSS section starts in RAM */
    .bss :
    {
        *(.bss)       /* Zero-filled run time allocate data memory */
    }
    _BSS_END = .;     /* Indicates where BSS section ends in RAM */
}  
