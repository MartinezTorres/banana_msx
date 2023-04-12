	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 2	@ Tag_ABI_PCS_wchar_t
	.file	"banana_msx.c"
@ GNU C89 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (arm-linux-gnueabihf)
@	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mlittle-endian -mabi=aapcs-linux -mfpu=vfp -mthumb -mfloat-abi=soft -mtls-dialect=gnu -march=armv7-a -O2 -O3 -std=gnu90 -p -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -funwind-tables -fno-delete-null-pointer-checks -fno-allow-store-data-races -fstack-protector-strong -fno-stack-clash-protection -fno-strict-overflow -fstack-check=no -fconserve-stack -fstack-protector-strong
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.type	banana_msx_open, %function
banana_msx_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:36: static int banana_msx_open(struct inode *inode, struct file *file) { return 0; }
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:36: static int banana_msx_open(struct inode *inode, struct file *file) { return 0; }
	movs	r0, #0	@,
	bx	lr	@
	.fnend
	.size	banana_msx_open, .-banana_msx_open
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\0016Banana MSX: write %d bytes\012\000"
	.align	2
.LC1:
	.ascii	"include/linux/thread_info.h\000"
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	banana_msx_write, %function
banana_msx_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}	@
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:54: static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	mov	r5, r3	@ pos, tmp187
	mov	r8, r1	@ tmp185, buf
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:56: 	printk(KERN_INFO "Banana MSX: write %d bytes\n", count);
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	mov	r1, r2	@, count
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:54: static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	mov	r4, r2	@ count, tmp186
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:56: 	printk(KERN_INFO "Banana MSX: write %d bytes\n", count);
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:58:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	ldrd	r3, r2, [r5]	@ _1, _1, pos
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:58:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	cmp	r3, #67108864	@ _1,
	sbcs	r1, r2, #0	@ tmp189, _1
	bge	.L10		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:60:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adds	r0, r4, r3	@ tmp177, count, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:60:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	mov	r1, #1	@ tmp145,
	movt	r1, 1024	@ tmp145,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:60:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adc	r2, r2, #0	@ tmp178, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:60:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	cmp	r0, r1	@ tmp177, tmp145
	sbcs	r2, r2, #0	@ tmp190, tmp178
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:62:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	movw	r2, #:lower16:.LANCHOR0	@ tmp146,
	movt	r2, #:upper16:.LANCHOR0	@ tmp146,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:60:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	it	ge
	rsbge	r4, r3, #67108864	@ count, _1,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	mov	r6, r4	@ <retval>, count
	cmp	r4, #0	@ count,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:62:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	ldr	r7, [r2]	@ msx.mapped_memory, msx.mapped_memory
	add	r7, r7, r3	@ _8, _1
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	blt	.L6		@,
@ ./include/linux/thread_info.h:185: 		__check_object_size(ptr, n, to_user);
	movs	r2, #0	@,
	mov	r1, r4	@, count
	mov	r0, r7	@, _8
	bl	__check_object_size		@
@ ./include/linux/uaccess.h:157: 	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
	mov	r3, #-1090519040	@ tmp150,
	.syntax unified
@ 157 "./include/linux/uaccess.h" 1
	.syntax unified
adds r2, r8, r4; sbcscc r2, r2, r3; movcc r3, #0	@ roksum, buf, count, flag
@ 0 "" 2
@ ./include/linux/uaccess.h:157: 	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
	.thumb
	.syntax unified
	cbz	r3, .L7	@ flag,
	mov	r2, r4	@ n, count
	b	.L8		@
.L6:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movw	r4, #:lower16:.LANCHOR1	@ tmp151,
	movt	r4, #:upper16:.LANCHOR1	@ tmp151,
	ldrb	r3, [r4]	@ zero_extendqisi2	@ __already_done, __already_done
	cbnz	r3, .L11	@ __already_done,
	movs	r2, #9	@,
	movs	r1, #216	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	movs	r5, #1	@ tmp154,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:62:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r6, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	strb	r5, [r4]	@ tmp154, __already_done
	bl	warn_slowpath_fmt		@
	b	.L3		@
.L7:
@ ./arch/arm/include/asm/thread_info.h:87: 		(current_stack_pointer & ~(THREAD_SIZE - 1));
	mov	r3, sp	@ current_stack_pointer, current_stack_pointer
	bic	r3, r3, #8160	@ tmp158, current_stack_pointer,
	bic	r3, r3, #31	@ tmp158, tmp158,
@ ./arch/arm/include/asm/domain.h:89: 	asm(
	.syntax unified
@ 89 "./arch/arm/include/asm/domain.h" 1
	mrc	p15, 0, r9, c3, c0	@ get domain	@ domain
@ 0 "" 2
@ ./arch/arm/include/asm/uaccess.h:32: 	set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
	.thumb
	.syntax unified
	bic	r3, r9, #12	@ tmp160, domain,
@ ./arch/arm/include/asm/uaccess.h:32: 	set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
	orr	r3, r3, #4	@ tmp161, tmp160,
@ ./arch/arm/include/asm/domain.h:99: 	asm volatile(
	.syntax unified
@ 99 "./arch/arm/include/asm/domain.h" 1
	mcr	p15, 0, r3, c3, c0	@ set domain	@ tmp161
@ 0 "" 2
@ ./arch/arm/include/asm/domain.h:102: 	isb();
@ 102 "./arch/arm/include/asm/domain.h" 1
	isb 	
@ 0 "" 2
@ ./arch/arm/include/asm/uaccess.h:538: 	n = arm_copy_from_user(to, from, n);
	.thumb
	.syntax unified
	mov	r2, r4	@, count
	mov	r1, r8	@, buf
	mov	r0, r7	@, _8
	bl	arm_copy_from_user		@
	mov	r2, r0	@ n, tmp188
@ ./arch/arm/include/asm/domain.h:99: 	asm volatile(
	.syntax unified
@ 99 "./arch/arm/include/asm/domain.h" 1
	mcr	p15, 0, r9, c3, c0	@ set domain	@ domain
@ 0 "" 2
@ ./arch/arm/include/asm/domain.h:102: 	isb();
@ 102 "./arch/arm/include/asm/domain.h" 1
	isb 	
@ 0 "" 2
	.thumb
	.syntax unified
.L8:
@ ./include/linux/uaccess.h:161: 	if (unlikely(res))
	cbz	r2, .L9	@ n,
@ ./include/linux/uaccess.h:162: 		memset(to + (n - res), 0, res);
	subs	r0, r4, r2	@ tmp162, count, n
@ ./include/linux/fortify-string.h:175: 	return __underlying_memset(p, c, size);
	movs	r1, #0	@,
	add	r0, r0, r7	@, _8
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:62:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r6, #13	@ <retval>,
@ ./include/linux/fortify-string.h:175: 	return __underlying_memset(p, c, size);
	bl	memset		@
	b	.L3		@
.L10:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:58:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	movs	r6, #0	@ <retval>,
	b	.L3		@
.L11:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:62:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r6, #13	@ <retval>,
	b	.L3		@
.L9:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:64:     *pos += count;
	ldrd	r3, r2, [r5]	@ *pos_18(D), tmp184, pos
	adds	r3, r3, r4	@ tmp181, *pos_18(D), count
	str	r3, [r5]	@ tmp181, *pos_18(D)
	adc	r2, r2, #0	@ tmp182, tmp184
	str	r2, [r5, #4]	@ tmp182, *pos_18(D)
.L3:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:67: }
	mov	r0, r6	@, <retval>
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}	@
	.fnend
	.size	banana_msx_write, .-banana_msx_write
	.text
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.type	banana_msx_release, %function
banana_msx_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
	movs	r0, #0	@,
	bx	lr	@
	.fnend
	.size	banana_msx_release, .-banana_msx_release
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"\0016Banana MSX: read %d bytes\012\000"
	.section	.text.unlikely
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	banana_msx_read, %function
banana_msx_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}	@
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:39: static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {
	mov	r5, r3	@ pos, tmp179
	mov	r6, r1	@ tmp177, buf
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:41: 	printk(KERN_INFO "Banana MSX: read %d bytes\n", count);
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	mov	r1, r2	@, count
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:39: static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {
	mov	r4, r2	@ count, tmp178
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:41: 	printk(KERN_INFO "Banana MSX: read %d bytes\n", count);
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:43:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	ldrd	r3, r2, [r5]	@ _1, _1, pos
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:43:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	cmp	r3, #67108864	@ _1,
	sbcs	r1, r2, #0	@ tmp181, _1
	bge	.L21		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:45:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adds	r0, r4, r3	@ tmp169, count, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:45:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	mov	r1, #1	@ tmp143,
	movt	r1, 1024	@ tmp143,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:45:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adc	r2, r2, #0	@ tmp170, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:45:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	cmp	r0, r1	@ tmp169, tmp143
	sbcs	r2, r2, #0	@ tmp182, tmp170
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:47:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	movw	r2, #:lower16:.LANCHOR0	@ tmp144,
	movt	r2, #:upper16:.LANCHOR0	@ tmp144,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:45:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	it	ge
	rsbge	r4, r3, #67108864	@ count, _1,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	mov	r7, r4	@ <retval>, count
	cmp	r4, #0	@ count,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:47:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	ldr	r2, [r2]	@ msx.mapped_memory, msx.mapped_memory
	add	r8, r2, r3	@ _8, msx.mapped_memory, _1
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	blt	.L16		@,
@ ./include/linux/thread_info.h:185: 		__check_object_size(ptr, n, to_user);
	movs	r2, #1	@,
	mov	r1, r4	@, count
	mov	r0, r8	@, _8
	bl	__check_object_size		@
@ ./include/linux/uaccess.h:177: 	if (access_ok(to, n)) {
	mov	r3, #-1090519040	@ tmp148,
	.syntax unified
@ 177 "./include/linux/uaccess.h" 1
	.syntax unified
adds r2, r6, r4; sbcscc r2, r2, r3; movcc r3, #0	@ roksum, buf, count, flag
@ 0 "" 2
@ ./include/linux/uaccess.h:177: 	if (access_ok(to, n)) {
	.thumb
	.syntax unified
	cbz	r3, .L17	@ flag,
	mov	r0, r4	@ n, count
	b	.L18		@
.L16:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movw	r4, #:lower16:.LANCHOR1	@ tmp149,
	movt	r4, #:upper16:.LANCHOR1	@ tmp149,
	ldrb	r3, [r4]	@ zero_extendqisi2	@ __already_done, __already_done
	cbz	r3, .L19	@ __already_done,
.L20:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:47:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
	b	.L13		@
.L19:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movs	r2, #9	@,
	movs	r1, #216	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	movs	r5, #1	@ tmp152,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:47:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	strb	r5, [r4]	@ tmp152, __already_done
	bl	warn_slowpath_fmt		@
	b	.L13		@
.L17:
@ ./arch/arm/include/asm/thread_info.h:87: 		(current_stack_pointer & ~(THREAD_SIZE - 1));
	mov	r3, sp	@ current_stack_pointer, current_stack_pointer
	bic	r3, r3, #8160	@ tmp156, current_stack_pointer,
	bic	r3, r3, #31	@ tmp156, tmp156,
@ ./arch/arm/include/asm/domain.h:89: 	asm(
	.syntax unified
@ 89 "./arch/arm/include/asm/domain.h" 1
	mrc	p15, 0, r9, c3, c0	@ get domain	@ domain
@ 0 "" 2
@ ./arch/arm/include/asm/uaccess.h:32: 	set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
	.thumb
	.syntax unified
	bic	r3, r9, #12	@ tmp158, domain,
@ ./arch/arm/include/asm/uaccess.h:32: 	set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
	orr	r3, r3, #4	@ tmp159, tmp158,
@ ./arch/arm/include/asm/domain.h:99: 	asm volatile(
	.syntax unified
@ 99 "./arch/arm/include/asm/domain.h" 1
	mcr	p15, 0, r3, c3, c0	@ set domain	@ tmp159
@ 0 "" 2
@ ./arch/arm/include/asm/domain.h:102: 	isb();
@ 102 "./arch/arm/include/asm/domain.h" 1
	isb 	
@ 0 "" 2
@ ./arch/arm/include/asm/uaccess.h:554: 	n = arm_copy_to_user(to, from, n);
	.thumb
	.syntax unified
	mov	r1, r8	@, _8
	mov	r0, r6	@, buf
	mov	r2, r4	@, count
	bl	arm_copy_to_user		@
@ ./arch/arm/include/asm/domain.h:99: 	asm volatile(
	.syntax unified
@ 99 "./arch/arm/include/asm/domain.h" 1
	mcr	p15, 0, r9, c3, c0	@ set domain	@ domain
@ 0 "" 2
@ ./arch/arm/include/asm/domain.h:102: 	isb();
@ 102 "./arch/arm/include/asm/domain.h" 1
	isb 	
@ 0 "" 2
	.thumb
	.syntax unified
.L18:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:47:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	cmp	r0, #0	@ n
	bne	.L20	@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:49:     *pos += count;
	ldrd	r3, r2, [r5]	@ *pos_18(D), tmp176, pos
	adds	r3, r3, r4	@ tmp173, *pos_18(D), count
	str	r3, [r5]	@ tmp173, *pos_18(D)
	adc	r2, r2, #0	@ tmp174, tmp176
	str	r2, [r5, #4]	@ tmp174, *pos_18(D)
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:51:     return count;
	b	.L13		@
.L21:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:43:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	movs	r7, #0	@ <retval>,
.L13:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:52: }
	mov	r0, r7	@, <retval>
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}	@
	.fnend
	.size	banana_msx_read, .-banana_msx_read
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"banana_msx\000"
	.align	2
.LC4:
	.ascii	"\0013Failed to allocate device number\012\000"
	.align	2
.LC5:
	.ascii	"\0016Banana MSX allocated with major: %d, and minor"
	.ascii	": %d\012\000"
	.align	2
.LC6:
	.ascii	"\0013Failed to add device\012\000"
	.align	2
.LC7:
	.ascii	"banana_msx_class\000"
	.align	2
.LC8:
	.ascii	"\0013Failed to create class\012\000"
	.align	2
.LC9:
	.ascii	"\0016Banana MSX: initialized\012\000"
	.align	2
.LC10:
	.ascii	"\0013Failed to create device\012\000"
	.section	.init.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	banana_msx_init, %function
banana_msx_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}	@
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	sub	sp, sp, #8	@,,
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:142: static int __init banana_msx_init(void) {
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:92:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	mov	r1, #67108864	@,
	mov	r0, #1476395008	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:92:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	movw	r4, #:lower16:.LANCHOR0	@ tmp131,
	movt	r4, #:upper16:.LANCHOR0	@ tmp131,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:92:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	bl	ioremap		@
	mov	r2, r0	@ tmp178,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:92:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	mov	r0, r4	@, tmp131
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:95:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	movw	r6, #:lower16:.LC3	@ tmp132,
	movt	r6, #:upper16:.LC3	@ tmp132,
	mov	r3, r6	@, tmp132
	movs	r1, #0	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:92:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	str	r2, [r0], #4	@ tmp178, msx.mapped_memory
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:95:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	movs	r2, #1	@,
	bl	alloc_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:95:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	mov	r5, r0	@ <retval>, tmp179
	cbz	r0, .L23	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:96:         pr_err("Failed to allocate device number\n");
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:97:         return err;
	b	.L22		@
.L23:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:100:     printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));
	ldr	r1, [r4, #4]	@ _9, d.dev
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:103:     d.cdev.owner = THIS_MODULE;
	movw	r7, #:lower16:__this_module	@ tmp146,
	movt	r7, #:upper16:__this_module	@ tmp146,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:100:     printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));
	ubfx	r2, r1, #0, #20	@, _9,,
	lsrs	r1, r1, #20	@, _9,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:102:     cdev_init(&d.cdev, &banana_msx_fops);
	add	r0, r4, #8	@, tmp131,
	movw	r1, #:lower16:.LANCHOR2	@,
	movt	r1, #:upper16:.LANCHOR2	@,
	bl	cdev_init		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:105:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	ldr	r1, [r4, #4]	@, d.dev
	add	r0, r4, #8	@, tmp131,
	movs	r2, #1	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:103:     d.cdev.owner = THIS_MODULE;
	str	r7, [r4, #44]	@ tmp146, d.cdev.owner
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:105:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	bl	cdev_add		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:105:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	mov	r8, r0	@ err, tmp180
	cbz	r0, .L25	@ err,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:106:         pr_err("Failed to add device\n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:108:         return err;
	mov	r5, r8	@ <retval>, err
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:         unregister_chrdev_region(d.dev, 1);
	bl	unregister_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:108:         return err;
	b	.L22		@
.L25:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:111:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	add	r2, r4, #76	@, tmp131,
	mov	r0, r7	@, tmp146
	movw	r1, #:lower16:.LC7	@,
	movt	r1, #:upper16:.LC7	@,
	bl	__class_create		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:111:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	cmn	r0, #4096	@ _15,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:111:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	str	r0, [r4, #68]	@ _15, d.class
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:111:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	bls	.L26		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:112:         pr_err("Failed to create class\n");
	movw	r0, #:lower16:.LC8	@,
	movt	r0, #:upper16:.LC8	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:113:         cdev_del(&d.cdev);
	add	r0, r4, #8	@, tmp131,
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:114:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ ./include/linux/err.h:31: 	return (long) ptr;
	ldr	r5, [r4, #68]	@ <retval>, d.class
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:115:         return PTR_ERR(d.class);
	b	.L27		@
.L26:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:118:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	ldr	r2, [r4, #4]	@, d.dev
	mov	r3, r5	@, <retval>
	mov	r1, r5	@, tmp3
	str	r6, [sp]	@ tmp132,
	bl	device_create		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:118:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	cmn	r0, #4096	@ _24,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:118:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	str	r0, [r4, #72]	@ _24, d.device
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:118:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	bhi	.L28		@,
.L29:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:147:     printk(KERN_INFO "Banana MSX: initialized\n");
	movw	r0, #:lower16:.LC9	@,
	movt	r0, #:upper16:.LC9	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:149:     return 0;
	movs	r5, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:147:     printk(KERN_INFO "Banana MSX: initialized\n");
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:149:     return 0;
	b	.L22		@
.L28:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:119:         pr_err("Failed to create device\n");
	movw	r0, #:lower16:.LC10	@,
	movt	r0, #:upper16:.LC10	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:120:         class_destroy(d.class);
	ldr	r0, [r4, #68]	@, d.class
	bl	class_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:121:         cdev_del(&d.cdev);
	add	r0, r4, #8	@, tmp131,
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:122:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ ./include/linux/err.h:31: 	return (long) ptr;
	ldr	r5, [r4, #72]	@ <retval>, d.device
.L27:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:145:     if ((err = banana_msx_init_device())) return err;
	cmp	r5, #0	@ <retval>
	beq	.L29	@
.L22:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:150: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, pc}	@
	.fnend
	.size	banana_msx_init, .-banana_msx_init
	.global	init_module
	.thumb_set init_module,banana_msx_init
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"\0016Banana MSX: exited\012\000"
	.section	.exit.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	banana_msx_exit, %function
banana_msx_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
	.save {r4, lr}
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:131: 	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	movw	r4, #:lower16:.LANCHOR0	@ tmp118,
	movt	r4, #:upper16:.LANCHOR0	@ tmp118,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:131: 	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	ldr	r1, [r4, #4]	@, d.dev
	ldr	r0, [r4, #68]	@, d.class
	bl	device_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:132: 	class_destroy(d.class);
	ldr	r0, [r4, #68]	@, d.class
	bl	class_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:133: 	cdev_del(&d.cdev);
	add	r0, r4, #8	@, tmp118,
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:134: 	unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:136: 	iounmap(msx.mapped_memory);
	ldr	r0, [r4]	@, msx.mapped_memory
	bl	iounmap		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:156:     printk(KERN_INFO "Banana MSX: exited\n");
	movw	r0, #:lower16:.LC11	@,
	movt	r0, #:upper16:.LC11	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:157: }
	pop	{r4, lr}	@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:156:     printk(KERN_INFO "Banana MSX: exited\n");
	b	_printk		@
	.fnend
	.size	banana_msx_exit, .-banana_msx_exit
	.global	cleanup_module
	.thumb_set cleanup_module,banana_msx_exit
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	banana_msx_fops, %object
	.size	banana_msx_fops, 132
banana_msx_fops:
@ owner:
	.word	__this_module
@ read:
	.space	4
	.word	banana_msx_read
@ write:
	.word	banana_msx_write
@ open:
	.space	40
	.word	banana_msx_open
@ release:
	.space	4
	.word	banana_msx_release
	.space	64
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	msx, %object
	.size	msx, 4
msx:
	.space	4
	.type	d, %object
	.size	d, 72
d:
	.space	72
	.type	__key.9, %object
	.size	__key.9, 0
__key.9:
	.section	.data.once,"aw"
	.set	.LANCHOR1,. + 0
	.type	__already_done.8, %object
	.size	__already_done.8, 1
__already_done.8:
	.space	1
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_description215, %object
	.size	__UNIQUE_ID_description215, 30
__UNIQUE_ID_description215:
	.ascii	"description=Banana MSX Module\000"
	.type	__UNIQUE_ID_author214, %object
	.size	__UNIQUE_ID_author214, 20
__UNIQUE_ID_author214:
	.ascii	"author=Bananananama\000"
	.type	__UNIQUE_ID_license213, %object
	.size	__UNIQUE_ID_license213, 12
__UNIQUE_ID_license213:
	.ascii	"license=GPL\000"
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",%progbits
