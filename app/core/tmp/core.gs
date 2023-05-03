	.cpu cortex-a7
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"core.cc"
	.text
	.section	.text._ZL9_out_nullcPvjj,"axG",%progbits,_ZN3LogILm1048576EE6printfEPKcz,comdat
	.align	2
	.arch armv7ve
	.syntax unified
	.arm
	.fpu softvfp
	.type	_ZL9_out_nullcPvjj, %function
_ZL9_out_nullcPvjj:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	_ZL9_out_nullcPvjj, .-_ZL9_out_nullcPvjj
	.section	.text._ZN3LogILm1048576EE8_out_LogEcPvjj,"axG",%progbits,_ZN3LogILm1048576EE8_out_LogEcPvjj,comdat
	.align	2
	.weak	_ZN3LogILm1048576EE8_out_LogEcPvjj
	.syntax unified
	.arm
	.fpu softvfp
	.type	_ZN3LogILm1048576EE8_out_LogEcPvjj, %function
_ZN3LogILm1048576EE8_out_LogEcPvjj:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1]
	add	r2, r1, r3
	add	r3, r3, #1
	ubfx	r3, r3, #0, #20
	strb	r0, [r2, #4]
	str	r3, [r1]
	bx	lr
	.size	_ZN3LogILm1048576EE8_out_LogEcPvjj, .-_ZN3LogILm1048576EE8_out_LogEcPvjj
	.section	.text._ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0,"axG",%progbits,_ZN3LogILm1048576EE6printfEPKcz,comdat
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0, %function
_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0:
	@ args = 20, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #52
	cmp	r3, #0
	mov	r6, r0
	ldrb	ip, [sp, #88]	@ zero_extendqisi2
	mov	r9, r1
	ldr	r4, [sp, #92]
	mov	r7, r2
	ldr	r10, [sp, #96]
	ldr	r8, [sp, #100]
	ldr	fp, [sp, #104]
	str	ip, [sp, #8]
	bne	.L5
	bic	r2, fp, #16
	ands	r1, fp, #1024
	str	r1, [sp, #12]
	bne	.L6
	str	r1, [sp, #4]
	mov	fp, r2
	b	.L44
.L5:
	and	r2, fp, #1024
	str	r2, [sp, #12]
	and	r2, fp, #16
	str	r2, [sp, #4]
.L44:
	tst	fp, #32
	add	r2, sp, #16
	movne	r0, #65
	moveq	r0, #97
	mov	ip, #0
	sub	r0, r0, #10
.L10:
	udiv	lr, r3, r4
	mls	r1, r4, lr, r3
	add	ip, ip, #1
	cmp	r1, #9
	uxtb	r1, r1
	add	r5, r1, r0
	add	r1, r1, #48
	strbls	r1, [r2], #1
	strbhi	r5, [r2], #1
	cmp	ip, #31
	movls	r1, #0
	movhi	r1, #1
	cmp	r4, r3
	movls	r5, r1
	orrhi	r5, r1, #1
	mov	r3, lr
	cmp	r5, #0
	beq	.L10
	ands	r5, fp, #2
	bne	.L11
.L48:
	cmp	r8, #0
	beq	.L12
	ands	r5, fp, #1
	beq	.L13
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L14
	tst	fp, #12
	beq	.L15
.L14:
	sub	r8, r8, #1
.L15:
	cmp	r10, ip
	movhi	r3, r1
	orrls	r3, r1, #1
	cmp	r3, #0
	beq	.L47
	b	.L17
.L12:
	cmp	r10, ip
	movhi	r3, r1
	orrls	r3, r1, #1
	and	r5, fp, #1
	cmp	r3, #0
	bne	.L18
.L47:
	add	r3, ip, #48
	mov	r0, #48
	add	r3, sp, r3
	sub	r3, r3, #33
.L19:
	strb	r0, [r3, #1]!
	add	ip, ip, #1
	cmp	ip, #31
	movls	r1, #0
	movhi	r1, #1
	cmp	r10, ip
	movhi	r2, r1
	orrls	r2, r1, #1
	cmp	r2, #0
	beq	.L19
.L18:
	cmp	r5, #0
	beq	.L11
.L17:
	cmp	ip, r8
	orrcs	r1, r1, #1
	cmp	r1, #0
	bne	.L51
	add	r3, ip, #48
	mov	r2, #48
	add	r3, sp, r3
	sub	r3, r3, #33
.L20:
	strb	r2, [r3, #1]!
	add	ip, ip, #1
	cmp	ip, #31
	cmpls	ip, r8
	bcc	.L20
.L51:
	mov	r5, #0
.L11:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L92
.L22:
	cmp	r4, #16
	beq	.L93
	cmp	ip, #31
	cmpls	r4, #2
	addeq	r3, ip, #48
	addeq	ip, ip, #1
	addeq	r3, sp, r3
	moveq	r2, #98
	strbeq	r2, [r3, #-32]
.L30:
	cmp	ip, #32
	bne	.L27
.L31:
	tst	fp, #3
	movne	r4, r7
	movne	r10, #32
	bne	.L46
	mov	r10, #32
.L50:
	cmp	r10, r8
	bcs	.L55
.L37:
	add	r4, r7, r8
	mov	fp, r7
	sub	r4, r4, r10
.L40:
	mov	r2, fp
	mvn	r3, #0
	add	fp, fp, #1
	mov	r1, r9
	mov	r0, #32
	blx	r6
	cmp	r4, fp
	bne	.L40
.L36:
	cmp	r10, #0
	beq	.L38
.L46:
	mov	fp, r10
	add	r10, r10, r4
.L41:
	sub	r2, r10, fp
	add	r3, sp, #16
	sub	fp, fp, #1
	mov	r1, r9
	mov	r4, r10
	ldrb	r0, [r3, fp]	@ zero_extendqisi2
	mvn	r3, #0
	blx	r6
	cmp	fp, #0
	bne	.L41
.L38:
	cmp	r5, #0
	beq	.L4
	sub	r7, r4, r7
	cmp	r8, r7
	bls	.L4
.L43:
	mov	r2, r4
	mvn	r3, #0
	mov	r1, r9
	mov	r0, #32
	add	r7, r7, #1
	blx	r6
	cmp	r8, r7
	add	r4, r4, #1
	bhi	.L43
.L4:
	mov	r0, r4
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L92:
	cmp	ip, #0
	bne	.L94
	cmp	r4, #16
	beq	.L53
	cmp	r4, #2
	movne	r3, #48
	movne	ip, #1
	strbne	r3, [sp, #16]
	bne	.L26
	mov	ip, #1
	mov	r3, #98
	strb	r3, [sp, #16]
.L27:
	add	r3, ip, #48
	add	ip, ip, #1
	add	r3, sp, r3
	mov	r2, #48
	strb	r2, [r3, #-32]
.L21:
	cmp	ip, #32
	beq	.L31
.L26:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L32
	add	r3, ip, #48
	add	r10, ip, #1
	add	r3, sp, r3
	mov	r2, #45
	strb	r2, [r3, #-32]
.L33:
	tst	fp, #3
	bne	.L57
	cmp	r8, r10
	bhi	.L37
.L57:
	mov	r4, r7
	b	.L46
.L6:
	ands	r5, fp, #2
	movne	ip, r3
	movne	fp, r2
	bne	.L26
	str	r5, [sp, #4]
	mov	r1, r5
	mov	fp, r2
	mov	ip, r5
	b	.L48
.L32:
	tst	fp, #4
	bne	.L95
	tst	fp, #8
	bne	.L96
	tst	fp, #3
	mov	r10, ip
	beq	.L50
.L55:
	mov	r4, r7
	b	.L36
.L95:
	add	r3, ip, #48
	mov	r2, #43
	add	r3, sp, r3
	add	r10, ip, #1
	strb	r2, [r3, #-32]
	b	.L33
.L13:
	cmp	r10, ip
	orrls	r1, r1, #1
	cmp	r1, #0
	beq	.L47
	b	.L11
.L94:
	cmp	ip, r8
	cmpne	r10, ip
	bne	.L22
	subs	r2, ip, #1
	movne	r3, #1
	moveq	r3, #0
	cmp	r4, #16
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	subne	ip, ip, #2
	beq	.L97
.L24:
	ands	r1, fp, #32
	movne	r2, #0
	andeq	r2, r3, #1
	cmp	r2, #0
	movne	r2, #120
	bne	.L91
	cmp	r1, #0
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L30
	mov	r2, #88
.L91:
	add	r3, ip, #48
	add	ip, ip, #1
	add	r3, sp, r3
	strb	r2, [r3, #-32]
	b	.L30
.L93:
	cmp	ip, #31
	movhi	r3, #0
	movls	r3, #1
	b	.L24
.L96:
	add	r3, ip, #48
	mov	r2, #32
	add	r3, sp, r3
	add	r10, ip, #1
	strb	r2, [r3, #-32]
	b	.L33
.L97:
	mov	ip, r2
	b	.L22
.L53:
	mov	r3, #1
	b	.L24
	.size	_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0, .-_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0
	.text
	.align	2
	.global	_Z25switch_to_supervisor_modev
	.syntax unified
	.arm
	.fpu softvfp
	.type	_Z25switch_to_supervisor_modev, %function
_Z25switch_to_supervisor_modev:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 103 "src/core.cc" 1
	msr ELR_hyp, lr

@ 0 "" 2
@ 104 "src/core.cc" 1
	eret

@ 0 "" 2
	.arm
	.syntax unified
	bx	lr
	.size	_Z25switch_to_supervisor_modev, .-_Z25switch_to_supervisor_modev
	.section	.text._ZN3LogILm1048576EE6printfEPKcz,"axG",%progbits,_ZN3LogILm1048576EE6printfEPKcz,comdat
	.align	2
	.weak	_ZN3LogILm1048576EE6printfEPKcz
	.syntax unified
	.arm
	.fpu softvfp
	.type	_ZN3LogILm1048576EE6printfEPKcz, %function
_ZN3LogILm1048576EE6printfEPKcz:
	@ args = 4, pretend = 12, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #48
	mov	r7, r0
	add	r8, sp, #88
	ldr	r4, [sp, #84]
	str	r8, [sp, #44]
	ldrb	r0, [r4]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L178
	movw	r3, #:lower16:_ZN3LogILm1048576EE8_out_LogEcPvjj
	mov	r5, #0
	movt	r3, #:upper16:_ZN3LogILm1048576EE8_out_LogEcPvjj
	str	r3, [sp, #28]
	b	.L101
.L230:
	mov	r2, r5
	mvn	r3, #0
	mov	r1, r7
	add	r5, r5, #1
	add	r4, r4, #1
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
.L103:
	ldrb	r0, [r4]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L229
.L101:
	cmp	r0, #37
	bne	.L230
	add	r3, r4, #1
	mov	r1, #0
.L104:
	mov	r4, r3
	ldrb	r0, [r3], #1	@ zero_extendqisi2
	sub	r2, r0, #32
	cmp	r2, #16
	ldrls	pc, [pc, r2, asl #2]
	b	.L105
.L107:
	.word	.L111
	.word	.L105
	.word	.L105
	.word	.L110
	.word	.L105
	.word	.L105
	.word	.L105
	.word	.L105
	.word	.L105
	.word	.L105
	.word	.L105
	.word	.L109
	.word	.L105
	.word	.L108
	.word	.L105
	.word	.L105
	.word	.L106
.L105:
	sub	r3, r0, #48
	cmp	r3, #9
	bls	.L231
	cmp	r0, #42
	movne	r6, #0
	bne	.L115
	ldr	r6, [r8], #4
	add	r4, r4, #1
	ldrb	r0, [r4]	@ zero_extendqisi2
	cmp	r6, #0
	orrlt	r1, r1, #2
	rsblt	r6, r6, #0
.L115:
	cmp	r0, #46
	beq	.L232
.L224:
	mov	r9, #0
.L118:
	sub	r3, r0, #104
	cmp	r3, #18
	ldrls	pc, [pc, r3, asl #2]
	b	.L121
.L123:
	.word	.L126
	.word	.L121
	.word	.L125
	.word	.L121
	.word	.L124
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L121
	.word	.L122
.L106:
	orr	r1, r1, #1
	b	.L104
.L108:
	orr	r1, r1, #2
	b	.L104
.L109:
	orr	r1, r1, #4
	b	.L104
.L110:
	orr	r1, r1, #16
	b	.L104
.L111:
	orr	r1, r1, #8
	b	.L104
.L122:
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
.L225:
	orr	r1, r1, #256
	add	r4, r4, #1
.L121:
	sub	r3, r0, #37
	cmp	r3, #83
	ldrls	pc, [pc, r3, asl #2]
	b	.L129
.L131:
	.word	.L135
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L130
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L130
	.word	.L134
	.word	.L130
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L130
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L129
	.word	.L130
	.word	.L133
	.word	.L129
	.word	.L129
	.word	.L132
	.word	.L129
	.word	.L130
	.word	.L129
	.word	.L129
	.word	.L130
.L231:
	mov	r6, #0
	mov	r2, #10
.L112:
	mla	r6, r2, r6, r0
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	sub	r6, r6, #48
	sub	r3, r0, #48
	cmp	r3, #9
	bls	.L112
	cmp	r0, #46
	bne	.L224
.L232:
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	orr	r1, r1, #1024
	add	r3, r4, #1
	sub	r2, r0, #48
	cmp	r2, #9
	bls	.L233
	cmp	r0, #42
	movne	r4, r3
	bne	.L224
	ldr	r9, [r8], #4
	add	r4, r4, #2
	ldrb	r0, [r4]	@ zero_extendqisi2
	bic	r9, r9, r9, asr #31
	b	.L118
.L229:
	mvn	r2, #1
	cmp	r5, r2
	movcc	r2, r5
.L100:
	mvn	r3, #0
	mov	r1, r7
	mov	r0, #0
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	mov	r0, r5
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #12
	bx	lr
.L129:
	mov	r2, r5
	mvn	r3, #0
	mov	r1, r7
	add	r4, r4, #1
	add	r5, r5, #1
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	b	.L103
.L130:
	cmp	r0, #120
	beq	.L183
	cmp	r0, #88
	beq	.L137
	cmp	r0, #111
	beq	.L184
	cmp	r0, #98
	beq	.L185
	bic	ip, r1, #16
	cmp	r0, #105
	mov	lr, #10
	bne	.L177
.L139:
	tst	ip, #1024
	beq	.L174
.L173:
	bic	ip, ip, #1
.L140:
	cmp	r0, #105
	cmpne	r0, #100
	beq	.L174
.L141:
	ands	r1, ip, #512
	bne	.L169
	tst	ip, #256
	bne	.L234
	ldr	r3, [r8], #4
	tst	ip, #64
	uxtbne	r3, r3
	beq	.L235
.L149:
	str	ip, [sp, #16]
	mov	r2, r5
	str	r6, [sp, #12]
	mov	r1, #0
	str	r9, [sp, #8]
	str	lr, [sp, #4]
.L228:
	str	r1, [sp]
	mov	r1, r7
	ldr	r0, [sp, #28]
	bl	_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0
	mov	r5, r0
.L169:
	add	r4, r4, #1
	b	.L103
.L124:
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	cmp	r0, #108
	bne	.L225
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	orr	r1, r1, #768
	add	r4, r4, #2
	b	.L121
.L125:
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	orr	r1, r1, #512
	add	r4, r4, #1
	b	.L121
.L126:
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	cmp	r0, #104
	orrne	r1, r1, #128
	addne	r4, r4, #1
	ldrbeq	r0, [r4, #2]	@ zero_extendqisi2
	orreq	r1, r1, #192
	addeq	r4, r4, #2
	b	.L121
.L133:
	ldr	r3, [r8], #4
	orr	r1, r1, #33
	str	r1, [sp, #16]
	mov	r10, #0
	ldr	r0, [sp, #28]
	mov	r1, #8
	str	r1, [sp, #12]
	mov	fp, #16
	str	r9, [sp, #8]
	mov	r2, r5
	mov	r1, r7
	add	r4, r4, #1
	strd	r10, [sp]
	bl	_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0
	mov	r5, r0
	b	.L103
.L134:
	tst	r1, #2
	beq	.L236
	ldr	r0, [r8], #4
	mov	r2, r5
	mvn	r3, #0
	mov	r1, r7
	uxtb	r0, r0
	add	r9, r5, #1
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	cmp	r6, #1
	movls	r5, r9
	bls	.L169
	add	r5, r5, r6
.L154:
	mov	r2, r9
	mvn	r3, #0
	add	r9, r9, #1
	mov	r1, r7
	mov	r0, #32
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	cmp	r9, r5
	bne	.L154
	b	.L169
.L135:
	mov	r2, r5
	mvn	r3, #0
	mov	r1, r7
	mov	r0, #37
	add	r4, r4, #1
	add	r5, r5, #1
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	b	.L103
.L132:
	ldr	fp, [r8], #4
	cmp	r9, #0
	ldrb	r0, [fp]	@ zero_extendqisi2
	bne	.L155
	cmp	r0, #0
	moveq	r10, r9
	beq	.L157
	mvn	r2, #1
.L156:
	add	r2, r2, #1
	mov	r10, fp
	add	r2, fp, r2
	b	.L158
.L159:
	cmp	r10, r2
	beq	.L226
.L158:
	ldrb	r3, [r10, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L159
.L226:
	sub	r10, r10, fp
.L157:
	ands	r3, r1, #1024
	str	r3, [sp, #32]
	beq	.L160
	cmp	r10, r9
	movcs	r10, r9
.L160:
	ands	r3, r1, #2
	str	r3, [sp, #36]
	beq	.L237
	cmp	r0, #0
	beq	.L227
.L175:
	ldr	r3, [sp, #32]
	cmp	r3, #0
	beq	.L168
	add	r9, r9, r5
	mov	r2, r5
	b	.L167
.L238:
	add	r5, r5, #1
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	ldrb	r0, [fp, #1]!	@ zero_extendqisi2
	mov	r2, r5
	cmp	r0, #0
	beq	.L166
.L167:
	cmp	r9, r5
	mvn	r3, #0
	mov	r1, r7
	bne	.L238
.L166:
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L169
.L227:
	cmp	r6, r10
	mov	r9, r5
	bls	.L169
	add	r5, r5, r6
	sub	r5, r5, r10
.L170:
	mov	r2, r9
	mvn	r3, #0
	add	r9, r9, #1
	mov	r1, r7
	mov	r0, #32
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	cmp	r9, r5
	bne	.L170
	b	.L169
.L233:
	mov	r9, #0
	mov	ip, #10
.L120:
	mla	r9, ip, r9, r0
	ldrb	r0, [r3, #1]!	@ zero_extendqisi2
	sub	r9, r9, #48
	sub	r2, r0, #48
	cmp	r2, #9
	bls	.L120
	mov	r4, r3
	b	.L118
.L155:
	cmp	r0, #0
	beq	.L189
	sub	r2, r9, #1
	b	.L156
.L168:
	mov	r2, r5
	mvn	r3, #0
	mov	r1, r7
	add	r5, r5, #1
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	ldrb	r0, [fp, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L168
	b	.L166
.L137:
	bic	ip, r1, #12
	tst	r1, #1024
	mov	lr, #16
	orr	ip, ip, #32
	bne	.L173
	b	.L141
.L174:
	tst	ip, #512
	bne	.L169
	tst	ip, #256
	bne	.L239
	ldr	r2, [r8], #4
	tst	ip, #64
	uxtbne	r2, r2
	movne	r3, r2
	bne	.L145
	tst	ip, #128
	eoreq	r3, r2, r2, asr #31
	sxthne	r2, r2
	subeq	r3, r3, r2, asr #31
	eorne	r3, r2, r2, asr #31
	subne	r3, r3, r2, asr #31
	uxthne	r3, r3
.L145:
	lsr	r2, r2, #31
	mov	r1, r7
	str	r2, [sp]
	mov	r2, r5
	ldr	r0, [sp, #28]
	str	ip, [sp, #16]
	str	r6, [sp, #12]
	str	r9, [sp, #8]
	str	lr, [sp, #4]
	bl	_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0
	mov	r5, r0
	b	.L169
.L183:
	mov	lr, #16
.L136:
	bic	ip, r1, #12
	tst	r1, #1024
	bne	.L173
	b	.L140
.L178:
	mov	r2, r0
	mov	r5, r0
	b	.L100
.L236:
	cmp	r6, #1
	bls	.L187
	sub	r3, r5, #1
	add	r6, r3, r6
.L153:
	mov	r2, r5
	mvn	r3, #0
	add	r5, r5, #1
	mov	r1, r7
	mov	r0, #32
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	cmp	r5, r6
	bne	.L153
.L152:
	ldr	r0, [r8], #4
	mvn	r3, #0
	mov	r2, r6
	mov	r1, r7
	uxtb	r0, r0
	add	r5, r6, #1
	add	r4, r4, #1
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	b	.L103
.L237:
	cmp	r6, r10
	add	r3, r10, #1
	bls	.L190
	add	r3, r6, r5
	sub	r10, r3, r10
.L163:
	mov	r2, r5
	mvn	r3, #0
	add	r5, r5, #1
	mov	r1, r7
	mov	r0, #32
	bl	_ZN3LogILm1048576EE8_out_LogEcPvjj
	cmp	r5, r10
	bne	.L163
	ldrb	r0, [fp]	@ zero_extendqisi2
	add	r10, r6, #1
.L162:
	cmp	r0, #0
	bne	.L175
	b	.L169
.L184:
	mov	lr, #8
.L138:
	mov	ip, r1
.L177:
	cmp	r0, #100
	movne	r1, ip
	beq	.L139
	b	.L136
.L235:
	tst	ip, #128
	uxthne	r3, r3
	b	.L149
.L185:
	mov	lr, #2
	b	.L138
.L239:
	ldr	r3, [r8], #4
	mov	r2, r5
	ldr	r0, [sp, #28]
	lsr	r1, r3, #31
	cmp	r3, #0
	str	r1, [sp]
	rsblt	r3, r3, #0
	str	ip, [sp, #16]
	mov	r1, r7
	str	r6, [sp, #12]
	str	r9, [sp, #8]
	str	lr, [sp, #4]
	bl	_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0
	mov	r5, r0
	b	.L169
.L234:
	ldr	r3, [r8], #4
	mov	r2, r5
	str	ip, [sp, #16]
	str	r6, [sp, #12]
	str	r9, [sp, #8]
	str	lr, [sp, #4]
	b	.L228
.L189:
	mov	r10, r0
	b	.L157
.L190:
	mov	r10, r3
	b	.L162
.L187:
	mov	r6, r5
	b	.L152
	.size	_ZN3LogILm1048576EE6printfEPKcz, .-_ZN3LogILm1048576EE6printfEPKcz
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Hello \000"
	.align	2
.LC1:
	.ascii	" world ARM!\012\000"
	.align	2
.LC2:
	.ascii	"Done 2!\012\000"
	.align	2
.LC3:
	.ascii	"Not Done 2!\012\000"
	.align	2
.LC4:
	.ascii	"MMU Table at %08x\012\000"
	.align	2
.LC5:
	.ascii	"ACTLR: %08x\012\000"
	.align	2
.LC6:
	.ascii	"SCTLR: %08x\012\000"
	.align	2
.LC7:
	.ascii	"read_MIDR: %08x\012\000"
	.align	2
.LC8:
	.ascii	"read_cpsr: %08x\012\000"
	.align	2
.LC9:
	.ascii	" %d %d %d \012\000"
	.align	2
.LC10:
	.ascii	"%d\012\000"
	.align	2
.LC11:
	.ascii	"%08x\012\000"
	.align	2
.LC12:
	.ascii	"CPU_CLK_GATING_REG %08x\012\000"
	.align	2
.LC13:
	.ascii	"CPU0_RST_CTRL %08x\012\000"
	.align	2
.LC14:
	.ascii	"CPU0_CTRL_REG %08x\012\000"
	.align	2
.LC15:
	.ascii	"CPU0_STATUS_REG %08x\012\000"
	.align	2
.LC16:
	.ascii	"CPU3_RST_CTRL %08x\012\000"
	.align	2
.LC17:
	.ascii	"CPU3_CTRL_REG %08x\012\000"
	.align	2
.LC18:
	.ascii	"CPU3_STATUS_REG %08x\012\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #1560281088
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, r3
	movt	lr, 22656
	movw	r7, #11760
	movt	r7, 1
	movw	r6, #33295
	movt	r6, 65530
	sub	sp, sp, #16
	str	r3, [r1]
	mov	r2, r3
	mov	r5, r3
	mov	r0, lr
	b	.L247
.L241:
	cmp	r8, #2
	bfine	r3, r5, #0, #2
	ldreq	r8, [lr]
	streq	r4, [ip]
	ldreq	r3, [r0, r2, lsl #2]
	strbne	r3, [r0, r2, lsl #2]
	bfieq	r3, r8, #0, #20
	streq	r3, [r0, r2, lsl #2]
.L242:
	ldrb	r3, [r0, r2, lsl #2]	@ zero_extendqisi2
	lsl	r4, r2, #20
	and	ip, r3, #3
	cmp	ip, #3
	beq	.L288
	cmp	ip, #2
	add	lr, lr, #4
	bfcne	r3, #0, #2
	addeq	r1, r1, #8323072
	ldreq	ip, [lr, #-4]
	streq	r4, [r1]
	ldreq	r3, [r0, r2, lsl #2]
	strbne	r3, [r0, r2, lsl #2]
	bfieq	r3, ip, #0, #20
	streq	r3, [r0, r2, lsl #2]
	add	r2, r2, #1
	cmp	r2, #4096
	beq	.L289
.L247:
	lsl	r1, r2, #2
	add	r1, r1, #1476395008
	add	r1, r1, #65536
	add	ip, r1, #8323072
	ldr	r4, [ip]
	str	r5, [ip]
	ldrb	r3, [r0, r2, lsl #2]	@ zero_extendqisi2
	orr	r3, r3, #3
	strb	r3, [r0, r2, lsl #2]
	and	r3, r3, #3
	ldr	r8, [ip]
	sub	r3, r3, #3
	clz	r3, r3
	and	r8, r8, r6
	lsr	r3, r3, #5
	orr	r3, r7, r3, lsl #18
	orr	r3, r3, r8
	str	r3, [ip]
	ldrb	r3, [r0, r2, lsl #2]	@ zero_extendqisi2
	and	r8, r3, #3
	cmp	r8, #3
	bne	.L241
	ldr	r8, [lr]
	str	r4, [ip]
	ldr	r3, [r0, r2, lsl #2]
	bfi	r3, r8, #0, #24
	str	r3, [r0, r2, lsl #2]
	b	.L242
.L288:
	ldr	ip, [lr]
	add	r1, r1, #8323072
	add	lr, lr, #4
	str	r4, [r1]
	ldr	r3, [r0, r2, lsl #2]
	bfi	r3, ip, #0, #24
	str	r3, [r0, r2, lsl #2]
	add	r2, r2, #1
	cmp	r2, #4096
	bne	.L247
.L289:
	mov	lr, #0
	movw	r7, #3564
	movt	lr, 22656
	movw	r6, #61971
	movt	r7, 1
	mov	r8, #32
	movt	r6, 65530
	mov	r4, #0
.L253:
	mov	ip, #1476395008
	b	.L252
.L249:
	cmp	r9, #2
	add	ip, ip, #1048576
	streq	r5, [r2]
	ldreq	r2, [lr, r1, lsl #2]
	strbne	r0, [lr, r1, lsl #2]
	bfieq	r2, r3, #0, #20
	streq	r2, [lr, r1, lsl #2]
	cmp	ip, #1543503872
	beq	.L290
.L252:
	lsr	r1, ip, #20
	mov	r10, #3
	sub	r3, r10, r10
	lsl	r2, r1, #2
	clz	r3, r3
	add	r9, r2, #1476395008
	add	r9, r9, #8388608
	lsr	r3, r3, #5
	mov	r2, r9
	ldr	r5, [r9]
	orr	r0, r7, r3, lsl #18
	str	r4, [r9]
	strb	r10, [lr, r1, lsl #2]
	ldr	r3, [r9]
	and	r3, r3, r6
	orr	r3, r0, r3
	str	r3, [r9]
	uxtb	r0, r3
	and	r9, r3, r10
	cmp	r9, r10
	bfi	r0, r4, #0, #2
	bne	.L249
	str	r5, [r2]
	add	ip, ip, #1048576
	ldr	r2, [lr, r1, lsl #2]
	cmp	ip, #1543503872
	bfi	r2, r3, #0, #24
	str	r2, [lr, r1, lsl #2]
	bne	.L252
.L290:
	subs	r8, r8, #1
	bne	.L253
	mov	r4, #0
	mov	r6, #3552
	movt	r4, 22656
	movw	r5, #61983
	movt	r6, 1
	movt	r5, 65530
	b	.L254
.L256:
	cmp	r0, #2
	add	ip, ip, #1048576
	streq	r7, [r2]
	ldreq	r2, [r4, lr, lsl #2]
	strbne	r1, [r4, lr, lsl #2]
	bfieq	r2, r3, #0, #20
	streq	r2, [r4, lr, lsl #2]
	cmp	ip, #1610612736
	beq	.L291
.L254:
	lsr	lr, ip, #20
	uxtb	r0, r8
	orr	r0, r0, #3
	lsl	r2, lr, #2
	and	r3, r0, #3
	add	r1, r2, #1476395008
	sub	r3, r3, #3
	clz	r3, r3
	add	r1, r1, #8388608
	mov	r2, r1
	ldr	r7, [r1]
	lsr	r3, r3, #5
	str	r8, [r1]
	strb	r0, [r4, lr, lsl #2]
	ldr	r0, [r1]
	orr	r3, r6, r3, lsl #18
	and	r0, r0, r5
	orr	r3, r3, r0
	str	r3, [r1]
	and	r0, r3, #3
	cmp	r0, #3
	uxtb	r1, r3
	bfi	r1, r8, #0, #2
	bne	.L256
	str	r7, [r2]
	add	ip, ip, #1048576
	ldr	r2, [r4, lr, lsl #2]
	cmp	ip, #1610612736
	bfi	r2, r3, #0, #24
	str	r2, [r4, lr, lsl #2]
	bne	.L254
.L291:
	mov	ip, #1560281088
	movw	r1, #:lower16:.LC0
	movt	r1, #:upper16:.LC0
	mov	r2, #72
	ldr	r3, [ip]
.L255:
	add	r0, r3, #1560281088
	add	r3, r3, #1
	ubfx	r3, r3, #0, #20
	strb	r2, [r0, #4]
	str	r3, [ip]
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L255
	movw	r2, #:lower16:.LC1
	mov	r4, #32
	movt	r2, #:upper16:.LC1
	mov	r0, #1560281088
.L260:
	add	r1, r3, #1560281088
	add	r3, r3, #1
	ubfx	r3, r3, #0, #20
	strb	r4, [r1, #4]
	str	r3, [r0]
	ldrb	r4, [r2, #1]!	@ zero_extendqisi2
	cmp	r4, #0
	bne	.L260
	mov	r2, #0
	movw	r1, #:lower16:.LC4
	movt	r2, 22656
	mov	r0, #1560281088
	movt	r1, #:upper16:.LC4
	bl	_ZN3LogILm1048576EE6printfEPKcz
	.syntax divided
@ 117 "src/hal/arm.h" 1
	mrc p15, 0, r2, c1, c0, 1

@ 0 "" 2
	.arm
	.syntax unified
	movw	r1, #:lower16:.LC5
	mov	r0, #1560281088
	movt	r1, #:upper16:.LC5
	bl	_ZN3LogILm1048576EE6printfEPKcz
	.syntax divided
@ 91 "src/hal/arm.h" 1
	mrc p15, 0, r2, c1, c0, 0

@ 0 "" 2
	.arm
	.syntax unified
	movw	r1, #:lower16:.LC6
	mov	r0, #1560281088
	movt	r1, #:upper16:.LC6
	bl	_ZN3LogILm1048576EE6printfEPKcz
	.syntax divided
@ 91 "src/hal/arm.h" 1
	mrc p15, 0, r2, c1, c0, 0

@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, r2, #8, #8
	str	r2, [sp, #8]
	orr	r3, r3, #16
	strb	r3, [sp, #9]
	ldr	r3, [sp, #8]
	.syntax divided
@ 92 "src/hal/arm.h" 1
	mcr p15, 0, r3, c1, c0, 0

@ 0 "" 2
@ 91 "src/hal/arm.h" 1
	mrc p15, 0, r2, c1, c0, 0

@ 0 "" 2
	.arm
	.syntax unified
	ubfx	r3, r2, #8, #8
	str	r2, [sp, #8]
	orr	r3, r3, #8
	strb	r3, [sp, #9]
	ldr	r3, [sp, #8]
	.syntax divided
@ 92 "src/hal/arm.h" 1
	mcr p15, 0, r3, c1, c0, 0

@ 0 "" 2
@ 133 "src/hal/arm.h" 1
	mcr p15, 0, r4, c7, c5, 0

@ 0 "" 2
@ 134 "src/hal/arm.h" 1
	mcr p15, 0, r4, c7, c5, 6

@ 0 "" 2
@ 135 "src/hal/arm.h" 1
	mcr p15, 0, r4, c8, c7, 0

@ 0 "" 2
@ 137 "src/hal/arm.h" 1
	isb

@ 0 "" 2
@ 138 "src/hal/arm.h" 1
	dsb

@ 0 "" 2
@ 139 "src/hal/arm.h" 1
	dmb

@ 0 "" 2
@ 91 "src/hal/arm.h" 1
	mrc p15, 0, r2, c1, c0, 0

@ 0 "" 2
	.arm
	.syntax unified
	movw	r1, #:lower16:.LC6
	mov	r0, #1560281088
	movt	r1, #:upper16:.LC6
	bl	_ZN3LogILm1048576EE6printfEPKcz
	.syntax divided
@ 129 "src/hal/arm.h" 1
	mrc p15, 0, r2, c0, c0, 0

@ 0 "" 2
	.arm
	.syntax unified
	movw	r1, #:lower16:.LC7
	mov	r0, #1560281088
	movt	r1, #:upper16:.LC7
	bl	_ZN3LogILm1048576EE6printfEPKcz
	.syntax divided
@ 170 "src/core.cc" 1
	mrs r2, cpsr
@ 0 "" 2
	.arm
	.syntax unified
	movw	r1, #:lower16:.LC8
	mov	r0, #1560281088
	movt	r1, #:upper16:.LC8
	bl	_ZN3LogILm1048576EE6printfEPKcz
	mov	r3, #0
	movw	r2, #513
	movt	r3, 450
	mov	r1, #12608
	movt	r2, 2
	str	r1, [r3, #84]
	str	r2, [r3, #80]
	ldr	r2, [r3, #3112]
.L261:
	ldr	r1, [r3, #3112]
	cmp	r1, r2
	beq	.L261
	mov	r1, #0
	movw	r0, #13823
	movt	r1, 450
	movt	r0, 366
.L262:
	ldr	r3, [r1, #3112]
	sub	r3, r2, r3
	cmp	r3, r0
	bls	.L262
	ldr	r2, [r1, #3112]
	movw	r3, #34464
	movt	r3, 1
	mov	ip, #0
	movt	ip, 450
	mov	lr, #0
.L266:
	ldr	r1, [ip, #2064]
	ldr	r0, [ip, #2208]
	and	r5, r1, #98304
	cmp	r5, #98304
	mov	r4, r0
	beq	.L292
	add	lr, lr, r0
	subs	r3, r3, #1
	bne	.L266
.L265:
	mov	r3, #0
	movw	r1, #515
	movt	r3, 450
	cmp	lr, #0
	movt	r1, 2
	mov	r0, #12672
	str	r0, [r3, #84]
	mov	ip, #1560281088
	str	r1, [r3, #80]
	bne	.L267
	ldr	r3, [ip]
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	mov	r0, #68
.L268:
	add	lr, r3, #1560281088
	add	r3, r3, #1
	ubfx	r3, r3, #0, #20
	strb	r0, [lr, #4]
	str	r3, [ip]
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L268
.L269:
	mov	r5, #0
	movw	r1, #:lower16:.LC9
	movt	r5, 450
	mov	r0, #1560281088
	movt	r1, #:upper16:.LC9
	ldr	r3, [r5, #3112]
	sub	r4, r2, r3
	str	r4, [sp]
	bl	_ZN3LogILm1048576EE6printfEPKcz
	movw	r2, #33205
	movw	r1, #:lower16:.LC10
	movt	r2, 6990
	mov	r0, #1560281088
	umull	r3, r2, r2, r4
	movt	r1, #:upper16:.LC10
	mov	r4, #4096
	lsr	r2, r2, #8
	movt	r4, 496
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r5, #80]
	movw	r1, #:lower16:.LC11
	movt	r1, #:upper16:.LC11
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r5, #84]
	movw	r1, #:lower16:.LC11
	movt	r1, #:upper16:.LC11
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r4, #3396]
	movw	r1, #:lower16:.LC12
	movt	r1, #:upper16:.LC12
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r4, #3136]
	movw	r1, #:lower16:.LC13
	movt	r1, #:upper16:.LC13
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r4, #3140]
	movw	r1, #:lower16:.LC14
	movt	r1, #:upper16:.LC14
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r4, #3144]
	movw	r1, #:lower16:.LC15
	movt	r1, #:upper16:.LC15
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r4, #3328]
	movw	r1, #:lower16:.LC16
	movt	r1, #:upper16:.LC16
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r4, #3332]
	movw	r1, #:lower16:.LC17
	movt	r1, #:upper16:.LC17
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	ldr	r2, [r4, #3336]
	movw	r1, #:lower16:.LC18
	movt	r1, #:upper16:.LC18
	mov	r0, #1560281088
	bl	_ZN3LogILm1048576EE6printfEPKcz
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L292:
	ubfx	r1, r1, #5, #1
	subs	r3, r3, #1
	bfi	r4, r1, #4, #1
	add	lr, lr, r4
	str	r4, [ip, #2208]
	bne	.L266
	b	.L265
.L267:
	ldr	r3, [ip]
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	mov	r0, #78
.L270:
	add	lr, r3, #1560281088
	add	r3, r3, #1
	ubfx	r3, r3, #0, #20
	strb	r0, [lr, #4]
	str	r3, [ip]
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L270
	b	.L269
	.size	main, .-main
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
