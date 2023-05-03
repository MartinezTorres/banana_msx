	.cpu cortex-a7
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"startup.c"
	.text
	.align	2
	.arch armv7ve
	.syntax unified
	.arm
	.fpu softvfp
	.type	quit_hypervisor_mode, %function
quit_hypervisor_mode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 21 "src/startup.c" 1
	mrs r3, cpsr
@ 0 "" 2
	.arm
	.syntax unified
	and	r3, r3, #31
	cmp	r3, #26
	bxne	lr
	movw	r3, #467
	.syntax divided
@ 24 "src/startup.c" 1
	msr SPSR_hyp, r3

@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:startup
	movt	r3, #:upper16:startup
	.syntax divided
@ 25 "src/startup.c" 1
	msr ELR_hyp, r3

@ 0 "" 2
@ 26 "src/startup.c" 1
	eret

@ 0 "" 2
	.arm
	.syntax unified
	bx	lr
	.size	quit_hypervisor_mode, .-quit_hypervisor_mode
	.align	2
	.global	startup
	.syntax unified
	.arm
	.fpu softvfp
	.type	startup, %function
startup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1476395008
	movw	r0, #:lower16:_BSS_END
	push	{r4, r5, r6, lr}
	mov	r4, #0
	str	r4, [r3]
	movt	r0, #:upper16:_BSS_END
	bl	quit_hypervisor_mode
	movw	r3, #:lower16:_BSS_START
	movt	r3, #:upper16:_BSS_START
	cmp	r3, r0
	beq	.L5
	ubfx	ip, r3, #2, #1
	sub	r2, r0, #4
	sub	r2, r2, r3
	cmp	r2, #20
	lsr	r2, r2, #2
	bls	.L6
	sub	r2, r2, ip
	mov	r1, r3
	cmp	ip, r4
	add	r2, r2, #1
	add	r3, r3, ip, lsl #2
	mov	r5, #0
	lsr	ip, r2, #1
	strne	r4, [r1], #4
	mov	r4, #0
	add	ip, r3, ip, lsl #3
.L8:
	strd	r4, [r3], #8
	cmp	r3, ip
	bne	.L8
	bic	r3, r2, #1
	cmp	r2, r3
	add	r3, r1, r3, lsl #2
	beq	.L5
.L6:
	mov	r1, r3
	mov	r2, #0
	str	r2, [r1], #4
	cmp	r1, r0
	beq	.L5
	str	r2, [r3, #4]
	add	r1, r3, #8
	cmp	r1, r0
	beq	.L5
	str	r2, [r3, #8]
	add	r1, r3, #12
	cmp	r1, r0
	beq	.L5
	str	r2, [r3, #12]
	add	r1, r3, #16
	cmp	r1, r0
	beq	.L5
	str	r2, [r3, #16]
	add	r1, r3, #20
	cmp	r1, r0
	strne	r2, [r3, #20]
.L5:
	movw	r0, #:lower16:_DATA_RAM_START
	movw	r3, #:lower16:_DATA_RAM_END
	movt	r0, #:upper16:_DATA_RAM_START
	movt	r3, #:upper16:_DATA_RAM_END
	cmp	r0, r3
	beq	.L10
	movw	r1, #:lower16:_DATA_ROM_START
	sub	ip, r3, #4
	movt	r1, #:upper16:_DATA_ROM_START
	mov	r2, r0
	sub	ip, ip, r0
	orr	lr, r1, r0
	cmp	ip, #40
	ubfx	lr, lr, #0, #3
	movls	r4, #0
	movhi	r4, #1
	cmp	lr, #0
	movne	r4, #0
	cmp	r4, #0
	beq	.L11
	lsr	ip, ip, #2
	mov	r3, r1
	add	ip, ip, #1
	lsr	lr, ip, #1
	add	lr, r1, lr, lsl #3
.L12:
	ldrd	r4, [r3], #8
	cmp	r3, lr
	strd	r4, [r2], #8
	bne	.L12
	bic	r3, ip, #1
	cmp	ip, r3
	ldrne	r2, [r1, r3, lsl #2]
	strne	r2, [r0, r3, lsl #2]
.L10:
	pop	{r4, r5, r6, lr}
	b	main
.L11:
	sub	r3, r3, r0
	mov	r0, r1
	add	r1, r1, r3
.L14:
	ldr	r3, [r0], #4
	cmp	r0, r1
	str	r3, [r2], #4
	bne	.L14
	pop	{r4, r5, r6, lr}
	b	main
	.size	startup, .-startup
	.global	myvectors
	.section	boot,"aw"
	.align	2
	.type	myvectors, %object
	.size	myvectors, 4
myvectors:
	.word	startup
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
