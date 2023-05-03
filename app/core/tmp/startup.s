
tmp/startup.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <quit_hypervisor_mode>:
                                        ;};
                                        ;
                                        ;static void __attribute__ ((noinline)) quit_hypervisor_mode(void) {
                                        ;	
                                        ;	uint32_t cpsr;
                                        ;	asm volatile ("mrs %0, cpsr" : "=r" (cpsr));
   0:	e10f3000 	mrs	r3, CPSR
                                        ;	if ( (cpsr & 0x1F) == 0x1a) {
   4:	e203301f 	and	r3, r3, #31
   8:	e353001a 	cmp	r3, #26
   c:	112fff1e 	bxne	lr
                                        ;
                                        ;		asm volatile ("msr SPSR_hyp, %0\n" :: "r" (0x000001d3));
  10:	e30031d3 	movw	r3, #467	; 0x1d3
  14:	e16ef303 	msr	SPSR_hyp, r3
                                        ;		asm volatile ("msr ELR_hyp, %0\n" :: "r" (startup));
  18:	e3003000 	movw	r3, #0
  1c:	e3403000 	movt	r3, #0
  20:	e12ef303 	msr	ELR_hyp, r3
                                        ;		asm volatile ("eret\n");
  24:	e160006e 	eret
                                        ;	}
                                        ;}
  28:	e12fff1e 	bx	lr

0000002c <startup>:
                                        ;
                                        ;void startup(void) {
                                        ;
                                        ;	*((uint32_t *)0x58000000) = 0;
  2c:	          e3a03316 	mov	r3, #1476395008	; 0x58000000
                                        ;	
                                        ;    // Set memory in bss segment to zeros 
                                        ;    uint32_t *bss_start_p = &_BSS_START; 
                                        ;    uint32_t *bss_end_p   = &_BSS_END;
                                        ;
                                        ;    while (bss_start_p != bss_end_p)
  30:	          e3000000 	movw	r0, #0
                                        ;void startup(void) {
  34:	          e92d4070 	push	{r4, r5, r6, lr}
                                        ;	*((uint32_t *)0x58000000) = 0;
  38:	          e3a04000 	mov	r4, #0
  3c:	          e5834000 	str	r4, [r3]
                                        ;    while (bss_start_p != bss_end_p)
  40:	          e3400000 	movt	r0, #0
                                        ;	quit_hypervisor_mode();
  44:	          ebffffed 	bl	0 <quit_hypervisor_mode>
                                        ;    while (bss_start_p != bss_end_p)
  48:	          e3003000 	movw	r3, #0
  4c:	          e3403000 	movt	r3, #0
  50:	          e1530000 	cmp	r3, r0
  54:	/-------- 0a00002b 	beq	108 <startup+0xdc>
  58:	|         e7e0c153 	ubfx	ip, r3, #2, #1
  5c:	|         e2402004 	sub	r2, r0, #4
  60:	|         e0422003 	sub	r2, r2, r3
  64:	|         e3520014 	cmp	r2, #20
  68:	|         e1a02122 	lsr	r2, r2, #2
  6c:	|  /----- 9a000010 	bls	b4 <startup+0x88>
  70:	|  |      e042200c 	sub	r2, r2, ip
                                        ;        *bss_start_p++ = 0;
  74:	|  |      e1a01003 	mov	r1, r3
  78:	|  |      e15c0004 	cmp	ip, r4
  7c:	|  |      e2822001 	add	r2, r2, #1
  80:	|  |      e083310c 	add	r3, r3, ip, lsl #2
  84:	|  |      e3a05000 	mov	r5, #0
  88:	|  |      e1a0c0a2 	lsr	ip, r2, #1
  8c:	|  |      14814004 	strne	r4, [r1], #4
  90:	|  |      e3a04000 	mov	r4, #0
  94:	|  |      e083c18c 	add	ip, r3, ip, lsl #3
  98:	|  |  /-> e0c340f8 	strd	r4, [r3], #8
                                        ;    while (bss_start_p != bss_end_p)
  9c:	|  |  |   e153000c 	cmp	r3, ip
  a0:	|  |  \-- 1afffffc 	bne	98 <startup+0x6c>
  a4:	|  |      e3c23001 	bic	r3, r2, #1
  a8:	|  |      e1520003 	cmp	r2, r3
  ac:	|  |      e0813103 	add	r3, r1, r3, lsl #2
  b0:	+--|----- 0a000014 	beq	108 <startup+0xdc>
                                        ;        *bss_start_p++ = 0;
  b4:	|  \----> e1a01003 	mov	r1, r3
  b8:	|         e3a02000 	mov	r2, #0
  bc:	|         e4812004 	str	r2, [r1], #4
                                        ;    while (bss_start_p != bss_end_p)
  c0:	|         e1510000 	cmp	r1, r0
  c4:	+-------- 0a00000f 	beq	108 <startup+0xdc>
                                        ;        *bss_start_p++ = 0;
  c8:	|         e5832004 	str	r2, [r3, #4]
  cc:	|         e2831008 	add	r1, r3, #8
                                        ;    while (bss_start_p != bss_end_p)
  d0:	|         e1510000 	cmp	r1, r0
  d4:	+-------- 0a00000b 	beq	108 <startup+0xdc>
                                        ;        *bss_start_p++ = 0;
  d8:	|         e5832008 	str	r2, [r3, #8]
  dc:	|         e283100c 	add	r1, r3, #12
                                        ;    while (bss_start_p != bss_end_p)
  e0:	|         e1510000 	cmp	r1, r0
  e4:	+-------- 0a000007 	beq	108 <startup+0xdc>
                                        ;        *bss_start_p++ = 0;
  e8:	|         e583200c 	str	r2, [r3, #12]
  ec:	|         e2831010 	add	r1, r3, #16
                                        ;    while (bss_start_p != bss_end_p)
  f0:	|         e1510000 	cmp	r1, r0
  f4:	+-------- 0a000003 	beq	108 <startup+0xdc>
                                        ;        *bss_start_p++ = 0;
  f8:	|         e5832010 	str	r2, [r3, #16]
  fc:	|         e2831014 	add	r1, r3, #20
                                        ;    while (bss_start_p != bss_end_p)
 100:	|         e1510000 	cmp	r1, r0
                                        ;        *bss_start_p++ = 0;
 104:	|         15832014 	strne	r2, [r3, #20]
                                        ;    // Copy memory in data segment
                                        ;    uint32_t *data_rom_start_p = &_DATA_ROM_START;
                                        ;    uint32_t *data_ram_start_p = &_DATA_RAM_START;
                                        ;    uint32_t *data_ram_end_p   = &_DATA_RAM_END;
                                        ;
                                        ;    while(data_ram_start_p != data_ram_end_p) 
 108:	\-------> e3000000 	movw	r0, #0
 10c:	          e3003000 	movw	r3, #0
 110:	          e3400000 	movt	r0, #0
 114:	          e3403000 	movt	r3, #0
 118:	          e1500003 	cmp	r0, r3
 11c:	/-------- 0a00001a 	beq	18c <startup+0x160>
 120:	|         e3001000 	movw	r1, #0
 124:	|         e243c004 	sub	ip, r3, #4
 128:	|         e3401000 	movt	r1, #0
 12c:	|         e1a02000 	mov	r2, r0
 130:	|         e04cc000 	sub	ip, ip, r0
 134:	|         e181e000 	orr	lr, r1, r0
 138:	|         e35c0028 	cmp	ip, #40	; 0x28
 13c:	|         e7e2e05e 	ubfx	lr, lr, #0, #3
 140:	|         93a04000 	movls	r4, #0
 144:	|         83a04001 	movhi	r4, #1
 148:	|         e35e0000 	cmp	lr, #0
 14c:	|         13a04000 	movne	r4, #0
 150:	|         e3540000 	cmp	r4, #0
 154:	|  /----- 0a00000e 	beq	194 <startup+0x168>
 158:	|  |      e1a0c12c 	lsr	ip, ip, #2
 15c:	|  |      e1a03001 	mov	r3, r1
 160:	|  |      e28cc001 	add	ip, ip, #1
 164:	|  |      e1a0e0ac 	lsr	lr, ip, #1
 168:	|  |      e081e18e 	add	lr, r1, lr, lsl #3
                                        ;        *data_ram_start_p++ = *data_rom_start_p++;
 16c:	|  |  /-> e0c340d8 	ldrd	r4, [r3], #8
 170:	|  |  |   e153000e 	cmp	r3, lr
 174:	|  |  |   e0c240f8 	strd	r4, [r2], #8
                                        ;    while(data_ram_start_p != data_ram_end_p) 
 178:	|  |  \-- 1afffffb 	bne	16c <startup+0x140>
 17c:	|  |      e3cc3001 	bic	r3, ip, #1
 180:	|  |      e15c0003 	cmp	ip, r3
                                        ;        *data_ram_start_p++ = *data_rom_start_p++;
 184:	|  |      17912103 	ldrne	r2, [r1, r3, lsl #2]
 188:	|  |      17802103 	strne	r2, [r0, r3, lsl #2]
                                        ;
                                        ;    // Go to Main
                                        ;    main();
                                        ;}
 18c:	\--|----> e8bd4070 	pop	{r4, r5, r6, lr}
                                        ;    main();
 190:	   |  /-- eafffffe 	b	0 <main>
 194:	   \----> e0433000 	sub	r3, r3, r0
                                        ;    uint32_t *data_rom_start_p = &_DATA_ROM_START;
 198:	          e1a00001 	mov	r0, r1
 19c:	          e0811003 	add	r1, r1, r3
                                        ;        *data_ram_start_p++ = *data_rom_start_p++;
 1a0:	      /-> e4903004 	ldr	r3, [r0], #4
                                        ;    while(data_ram_start_p != data_ram_end_p) 
 1a4:	      |   e1500001 	cmp	r0, r1
                                        ;        *data_ram_start_p++ = *data_rom_start_p++;
 1a8:	      |   e4823004 	str	r3, [r2], #4
                                        ;    while(data_ram_start_p != data_ram_end_p) 
 1ac:	      \-- 1afffffb 	bne	1a0 <startup+0x174>
                                        ;}
 1b0:	          e8bd4070 	pop	{r4, r5, r6, lr}
                                        ;    main();
 1b4:	      /-- eafffffe 	b	0 <main>
