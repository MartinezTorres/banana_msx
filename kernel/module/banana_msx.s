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
	.type	banana_msx_llseek, %function
banana_msx_llseek:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}	@
	.save {r3, lr}
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:97: static loff_t banana_msx_llseek(struct file *filp, loff_t offset, int whence) {
	ldr	r1, [sp, #8]	@ whence, whence
	mov	ip, r0	@ filp, tmp130
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:101:     switch (whence) {
	cmp	r1, #1	@ whence,
	beq	.L2		@,
	cmp	r1, #2	@ whence,
	beq	.L3		@,
	cbz	r1, .L9	@ whence,
.L7:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:116:         return -EINVAL;
	mvn	r0, #21	@ <retval>,
	mov	r1, #-1	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:120: }
	pop	{r3, pc}	@
.L2:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:         new_pos = filp->f_pos + offset;
	ldrd	r0, r1, [r0, #64]	@ filp_10(D)->f_pos, tmp129, filp,
	adds	r0, r2, r0	@ <retval>, offset, filp_10(D)->f_pos
	adc	r1, r3, r1	@ <retval>, offset, tmp129
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:115:     if (new_pos < 0 || new_pos > MAPPED_MEMORY_SIZE)
	mov	r2, r0	@ _15, <retval>
	mov	r3, r1	@ _15, <retval>
.L5:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:115:     if (new_pos < 0 || new_pos > MAPPED_MEMORY_SIZE)
	mov	lr, #1	@ tmp120,
	movt	lr, 2048	@ tmp120,
	cmp	r2, lr	@ _15, tmp120
	sbcs	r3, r3, #0	@ tmp133, _15
	bcs	.L7		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:118:     filp->f_pos = new_pos;
	strd	r0, r1, [ip, #64]	@ <retval>, <retval>, filp,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:120: }
	pop	{r3, pc}	@
.L9:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:103:         new_pos = offset;
	mov	r0, r2	@ <retval>, _15
	mov	r1, r3	@ <retval>, _15
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:104:         break;
	b	.L5		@
.L3:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:111:         new_pos = MAPPED_MEMORY_SIZE + offset;
	adds	r0, r2, #134217728	@ <retval>, offset,
	adc	r1, r3, #0	@ <retval>, offset
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:115:     if (new_pos < 0 || new_pos > MAPPED_MEMORY_SIZE)
	mov	r2, r0	@ _15, <retval>
	mov	r3, r1	@ _15, <retval>
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:112:         break;
	b	.L5		@
	.fnend
	.size	banana_msx_llseek, .-banana_msx_llseek
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\0016Banana MSX: is already closed\012\000"
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
	push	{r3, lr}	@
	.save {r3, lr}
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:53: static int banana_msx_release(struct inode *inode, struct file *file) { 
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:57: 	if (!msx.is_open) {
	movw	r3, #:lower16:.LANCHOR0	@ tmp117,
	movt	r3, #:upper16:.LANCHOR0	@ tmp117,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:57: 	if (!msx.is_open) {
	ldrb	r2, [r3]	@ zero_extendqisi2	@ msx.is_open, msx.is_open
	cbz	r2, .L13	@ msx.is_open,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:62: 	msx.is_open = 0;
	movs	r2, #0	@ tmp121,
	strb	r2, [r3]	@ tmp121, msx.is_open
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:64: 	return 0; 
	mov	r0, r2	@ <retval>, tmp121
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:65: }
	pop	{r3, pc}	@
.L13:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:58: 		printk(KERN_INFO "Banana MSX: is already closed\n");
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:59: 		return -EINVAL;
	mvn	r0, #21	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:65: }
	pop	{r3, pc}	@
	.fnend
	.size	banana_msx_release, .-banana_msx_release
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"\0016Banana MSX: is already open\012\000"
	.text
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
	push	{r3, lr}	@
	.save {r3, lr}
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:39: static int banana_msx_open(struct inode *inode, struct file *file) { 
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:43: 	if (msx.is_open) {
	movw	r3, #:lower16:.LANCHOR0	@ tmp117,
	movt	r3, #:upper16:.LANCHOR0	@ tmp117,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:43: 	if (msx.is_open) {
	ldrb	r0, [r3]	@ zero_extendqisi2	@ msx.is_open, msx.is_open
	cbnz	r0, .L17	@ msx.is_open,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:48: 	msx.is_open = 1;
	movs	r2, #1	@ tmp121,
	strb	r2, [r3]	@ tmp121, msx.is_open
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:51: }
	pop	{r3, pc}	@
.L17:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:44: 		printk(KERN_INFO "Banana MSX: is already open\n");
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:45: 		return -EINVAL;
	mvn	r0, #21	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:51: }
	pop	{r3, pc}	@
	.fnend
	.size	banana_msx_open, .-banana_msx_open
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.type	banana_msx_mmap, %function
banana_msx_mmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
	.save {r4, lr}
	.pad #8
	sub	sp, sp, #8	@,,
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:123: {
	mov	r0, r1	@ vma, tmp129
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:125:     unsigned long size = (unsigned long)(vma->vm_end - vma->vm_start);
	ldrd	r1, r3, [r1]	@ _2, vma_11(D)->vm_end, vma
	subs	r3, r3, r1	@ size, vma_11(D)->vm_end, _2
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:127:     if (size > MAPPED_MEMORY_SIZE) return -EINVAL;
	cmp	r3, #134217728	@ size,
	bhi	.L20		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:129:     vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
	ldrd	r4, r2, [r0, #36]	@ vma_11(D)->vm_page_prot, vma_11(D)->vm_flags, vma,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:131: 	vma->vm_flags |= VM_IO;
	orr	r2, r2, #67108864	@ tmp125, vma_11(D)->vm_flags,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:129:     vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
	bic	r4, r4, #60	@ _4, vma_11(D)->vm_page_prot,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:131: 	vma->vm_flags |= VM_IO;
	orr	r2, r2, #278528	@ tmp125, tmp125,
	strd	r4, r2, [r0, #36]	@ _4, tmp125, vma,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:135:     return remap_pfn_range(vma, vma->vm_start, MAPPED_MEMORY_ADDRESS >> PAGE_SHIFT, size, vma->vm_page_prot);
	str	r4, [sp]	@ _4,
	mov	r2, #360448	@,
	bl	remap_pfn_range		@
.L18:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:136: }
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r4, pc}	@
.L20:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:127:     if (size > MAPPED_MEMORY_SIZE) return -EINVAL;
	mvn	r0, #21	@ <retval>,
	b	.L18		@
	.fnend
	.size	banana_msx_mmap, .-banana_msx_mmap
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"include/linux/thread_info.h\000"
	.text
	.align	1
	.p2align 2,,3
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:82: static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	mov	r5, r3	@ pos, tmp185
	mov	r4, r2	@ count, tmp184
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:86:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	ldrd	r2, r3, [r3]	@ _1, _1, pos
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:82: static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	mov	r6, r1	@ buf, tmp183
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:86:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	cmp	r2, #134217728	@ _1,
	sbcs	r1, r3, #0	@ tmp187, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:86:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	it	ge
	movge	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:86:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	bge	.L21		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adds	r0, r4, r2	@ tmp175, count, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	mov	r1, #1	@ tmp143,
	movt	r1, 2048	@ tmp143,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adc	r3, r3, #0	@ tmp176, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	cmp	r0, r1	@ tmp175, tmp143
	sbcs	r3, r3, #0	@ tmp188, tmp176
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:90:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	movw	r3, #:lower16:.LANCHOR0	@ tmp144,
	movt	r3, #:upper16:.LANCHOR0	@ tmp144,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	itet	ge
	rsbge	r7, r2, #134217728	@ <retval>, _1,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movlt	r7, r4	@ <retval>, count
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	movge	r4, r7	@ count, <retval>
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	cmp	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:90:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	ldr	r3, [r3, #4]	@ msx.mapped_memory, msx.mapped_memory
	add	r8, r3, r2	@ _8, msx.mapped_memory, _1
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	blt	.L25		@,
@ ./include/linux/thread_info.h:185: 		__check_object_size(ptr, n, to_user);
	mov	r0, r8	@, _8
	movs	r2, #0	@,
	mov	r1, r4	@, count
	bl	__check_object_size		@
@ ./include/linux/uaccess.h:157: 	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
	mov	r3, #-1090519040	@ tmp148,
	mov	r0, r4	@ n, count
	.syntax unified
@ 157 "./include/linux/uaccess.h" 1
	.syntax unified
adds r2, r6, r4; sbcscc r2, r2, r3; movcc r3, #0	@ roksum, buf, count, flag
@ 0 "" 2
@ ./include/linux/uaccess.h:157: 	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
	.thumb
	.syntax unified
	cbnz	r3, .L27	@ flag,
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
@ ./arch/arm/include/asm/uaccess.h:538: 	n = arm_copy_from_user(to, from, n);
	.thumb
	.syntax unified
	mov	r1, r6	@, buf
	mov	r2, r4	@, count
	mov	r0, r8	@, _8
	bl	arm_copy_from_user		@
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
.L27:
@ ./include/linux/uaccess.h:161: 	if (unlikely(res))
	cbnz	r0, .L31	@ n,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:92:     *pos += count;
	ldrd	r3, r2, [r5]	@ *pos_16(D), tmp182, pos
	adds	r3, r3, r4	@ tmp179, *pos_16(D), count
	str	r3, [r5]	@ tmp179, *pos_16(D)
	adc	r2, r2, #0	@ tmp180, tmp182
	str	r2, [r5, #4]	@ tmp180, *pos_16(D)
.L21:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:95: }
	mov	r0, r7	@, <retval>
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}	@
.L25:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movw	r4, #:lower16:.LANCHOR1	@ tmp149,
	movt	r4, #:upper16:.LANCHOR1	@ tmp149,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:90:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	ldrb	r3, [r4]	@ zero_extendqisi2	@ __already_done, __already_done
	cmp	r3, #0	@ __already_done
	bne	.L21	@
	movs	r2, #9	@,
	movs	r1, #216	@,
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	movs	r5, #1	@ tmp152,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:90:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	strb	r5, [r4]	@ tmp152, __already_done
	bl	warn_slowpath_fmt		@
	b	.L21		@
.L31:
@ ./include/linux/uaccess.h:162: 		memset(to + (n - res), 0, res);
	subs	r4, r4, r0	@ tmp160, count, n
@ ./include/linux/fortify-string.h:175: 	return __underlying_memset(p, c, size);
	mov	r2, r0	@, n
	movs	r1, #0	@,
	add	r0, r8, r4	@, _8, tmp160
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:90:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/fortify-string.h:175: 	return __underlying_memset(p, c, size);
	bl	memset		@
	b	.L21		@
	.fnend
	.size	banana_msx_write, .-banana_msx_write
	.align	1
	.p2align 2,,3
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:67: static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {
	mov	r5, r3	@ pos, tmp177
	mov	r4, r2	@ count, tmp176
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:71:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	ldrd	r2, r3, [r3]	@ _1, _1, pos
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:67: static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {
	mov	r6, r1	@ buf, tmp175
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:71:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	cmp	r2, #134217728	@ _1,
	sbcs	r1, r3, #0	@ tmp179, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:71:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	it	ge
	movge	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:71:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	bge	.L32		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:73:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adds	r0, r4, r2	@ tmp167, count, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:73:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	mov	r1, #1	@ tmp141,
	movt	r1, 2048	@ tmp141,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:73:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adc	r3, r3, #0	@ tmp168, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:73:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	cmp	r0, r1	@ tmp167, tmp141
	sbcs	r3, r3, #0	@ tmp180, tmp168
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:75:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	movw	r3, #:lower16:.LANCHOR0	@ tmp142,
	movt	r3, #:upper16:.LANCHOR0	@ tmp142,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:73:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	itet	ge
	rsbge	r7, r2, #134217728	@ <retval>, _1,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movlt	r7, r4	@ <retval>, count
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:73:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	movge	r4, r7	@ count, <retval>
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	cmp	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:75:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	ldr	r3, [r3, #4]	@ msx.mapped_memory, msx.mapped_memory
	add	r8, r3, r2	@ _8, msx.mapped_memory, _1
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	blt	.L36		@,
@ ./include/linux/thread_info.h:185: 		__check_object_size(ptr, n, to_user);
	mov	r0, r8	@, _8
	movs	r2, #1	@,
	mov	r1, r4	@, count
	bl	__check_object_size		@
@ ./include/linux/uaccess.h:177: 	if (access_ok(to, n)) {
	mov	r3, #-1090519040	@ tmp146,
	mov	r0, r4	@ n, count
	.syntax unified
@ 177 "./include/linux/uaccess.h" 1
	.syntax unified
adds r2, r6, r4; sbcscc r2, r2, r3; movcc r3, #0	@ roksum, buf, count, flag
@ 0 "" 2
@ ./include/linux/uaccess.h:177: 	if (access_ok(to, n)) {
	.thumb
	.syntax unified
	cbz	r3, .L42	@ flag,
.L38:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:75:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	cbnz	r0, .L40	@ n,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:77:     *pos += count;
	ldrd	r3, r2, [r5]	@ *pos_16(D), tmp174, pos
	adds	r3, r3, r4	@ tmp171, *pos_16(D), count
	str	r3, [r5]	@ tmp171, *pos_16(D)
	adc	r2, r2, #0	@ tmp172, tmp174
	str	r2, [r5, #4]	@ tmp172, *pos_16(D)
.L32:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:80: }
	mov	r0, r7	@, <retval>
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}	@
.L42:
@ ./arch/arm/include/asm/thread_info.h:87: 		(current_stack_pointer & ~(THREAD_SIZE - 1));
	mov	r3, sp	@ current_stack_pointer, current_stack_pointer
	bic	r3, r3, #8160	@ tmp154, current_stack_pointer,
	bic	r3, r3, #31	@ tmp154, tmp154,
@ ./arch/arm/include/asm/domain.h:89: 	asm(
	.syntax unified
@ 89 "./arch/arm/include/asm/domain.h" 1
	mrc	p15, 0, r9, c3, c0	@ get domain	@ domain
@ 0 "" 2
@ ./arch/arm/include/asm/uaccess.h:32: 	set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
	.thumb
	.syntax unified
	bic	r3, r9, #12	@ tmp156, domain,
@ ./arch/arm/include/asm/uaccess.h:32: 	set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
	orr	r3, r3, #4	@ tmp157, tmp156,
@ ./arch/arm/include/asm/domain.h:99: 	asm volatile(
	.syntax unified
@ 99 "./arch/arm/include/asm/domain.h" 1
	mcr	p15, 0, r3, c3, c0	@ set domain	@ tmp157
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
	b	.L38		@
.L36:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movw	r4, #:lower16:.LANCHOR1	@ tmp147,
	movt	r4, #:upper16:.LANCHOR1	@ tmp147,
	ldrb	r3, [r4]	@ zero_extendqisi2	@ __already_done, __already_done
	cbz	r3, .L39	@ __already_done,
.L40:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:75:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
	b	.L32		@
.L39:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movs	r2, #9	@,
	movs	r1, #216	@,
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	movs	r5, #1	@ tmp150,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:75:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	strb	r5, [r4]	@ tmp150, __already_done
	bl	warn_slowpath_fmt		@
	b	.L32		@
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
	push	{r4, r5, r6, r7, r8, r9, lr}	@
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	sub	sp, sp, #12	@,,
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:215: static int __init banana_msx_init(void) {
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:163: 	msx.is_open = 0;
	movw	r4, #:lower16:.LANCHOR0	@ tmp131,
	movt	r4, #:upper16:.LANCHOR0	@ tmp131,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:165:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	mov	r1, #134217728	@,
	mov	r0, #1476395008	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:168:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	movw	r7, #:lower16:.LC3	@ tmp135,
	movt	r7, #:upper16:.LC3	@ tmp135,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:163: 	msx.is_open = 0;
	movs	r5, #0	@ tmp132,
	strb	r5, [r4]	@ tmp132, msx.is_open
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:165:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	bl	ioremap		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:168:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	mov	r1, r5	@, tmp132
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:165:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	str	r0, [r4, #4]	@ tmp181, msx.mapped_memory
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:168:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	mov	r3, r7	@, tmp135
	add	r0, r4, #8	@, tmp131,
	movs	r2, #1	@,
	bl	alloc_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:168:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	mov	r5, r0	@ <retval>, tmp182
	cbz	r0, .L44	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:169:         pr_err("Failed to allocate device number\n");
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:170:         return err;
	b	.L43		@
.L44:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:173:     printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));
	ldr	r1, [r4, #8]	@ _9, d.dev
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:175:     cdev_init(&d.cdev, &banana_msx_fops);
	add	r6, r4, #12	@ tmp147, tmp131,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:173:     printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:176:     d.cdev.owner = THIS_MODULE;
	movw	r8, #:lower16:__this_module	@ tmp149,
	movt	r8, #:upper16:__this_module	@ tmp149,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:173:     printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));
	ubfx	r2, r1, #0, #20	@, _9,,
	lsrs	r1, r1, #20	@, _9,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:175:     cdev_init(&d.cdev, &banana_msx_fops);
	mov	r0, r6	@, tmp147
	movw	r1, #:lower16:.LANCHOR2	@,
	movt	r1, #:upper16:.LANCHOR2	@,
	bl	cdev_init		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:178:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	ldr	r1, [r4, #8]	@, d.dev
	mov	r0, r6	@, tmp147
	movs	r2, #1	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:176:     d.cdev.owner = THIS_MODULE;
	str	r8, [r4, #48]	@ tmp149, d.cdev.owner
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:178:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	bl	cdev_add		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:178:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	mov	r9, r0	@ err, tmp183
	cbz	r0, .L46	@ err,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:179:         pr_err("Failed to add device\n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:180:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #8]	@, d.dev
	movs	r1, #1	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:181:         return err;
	mov	r5, r9	@ <retval>, err
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:180:         unregister_chrdev_region(d.dev, 1);
	bl	unregister_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:181:         return err;
	b	.L43		@
.L46:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:184:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	mov	r0, r8	@, tmp149
	add	r2, r4, #80	@, tmp131,
	movw	r1, #:lower16:.LC7	@,
	movt	r1, #:upper16:.LC7	@,
	bl	__class_create		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:184:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	cmn	r0, #4096	@ _15,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:184:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	str	r0, [r4, #72]	@ _15, d.class
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:184:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	bls	.L47		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:185:         pr_err("Failed to create class\n");
	movw	r0, #:lower16:.LC8	@,
	movt	r0, #:upper16:.LC8	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:186:         cdev_del(&d.cdev);
	mov	r0, r6	@, tmp147
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:187:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #8]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ ./include/linux/err.h:31: 	return (long) ptr;
	ldr	r5, [r4, #72]	@ <retval>, d.class
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:188:         return PTR_ERR(d.class);
	b	.L48		@
.L47:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:191:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	ldr	r2, [r4, #8]	@, d.dev
	mov	r3, r5	@, <retval>
	mov	r1, r5	@, tmp3
	str	r7, [sp]	@ tmp135,
	bl	device_create		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:191:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	cmn	r0, #4096	@ _24,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:191:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	str	r0, [r4, #76]	@ _24, d.device
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:191:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	bhi	.L49		@,
.L50:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:220:     printk(KERN_INFO "Banana MSX: initialized\n");
	movw	r0, #:lower16:.LC9	@,
	movt	r0, #:upper16:.LC9	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:222:     return 0;
	movs	r5, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:220:     printk(KERN_INFO "Banana MSX: initialized\n");
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:222:     return 0;
	b	.L43		@
.L49:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:192:         pr_err("Failed to create device\n");
	movw	r0, #:lower16:.LC10	@,
	movt	r0, #:upper16:.LC10	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:193:         class_destroy(d.class);
	ldr	r0, [r4, #72]	@, d.class
	bl	class_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:194:         cdev_del(&d.cdev);
	mov	r0, r6	@, tmp147
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:195:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #8]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ ./include/linux/err.h:31: 	return (long) ptr;
	ldr	r5, [r4, #76]	@ <retval>, d.device
.L48:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:218:     if ((err = banana_msx_init_device())) return err;
	cmp	r5, #0	@ <retval>
	beq	.L50	@
.L43:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:223: }
	mov	r0, r5	@, <retval>
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, pc}	@
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:204: 	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	movw	r4, #:lower16:.LANCHOR0	@ tmp118,
	movt	r4, #:upper16:.LANCHOR0	@ tmp118,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:204: 	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	ldr	r1, [r4, #8]	@, d.dev
	ldr	r0, [r4, #72]	@, d.class
	bl	device_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:205: 	class_destroy(d.class);
	ldr	r0, [r4, #72]	@, d.class
	bl	class_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:206: 	cdev_del(&d.cdev);
	add	r0, r4, #12	@, tmp118,
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:207: 	unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #8]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:209: 	iounmap(msx.mapped_memory);
	ldr	r0, [r4, #4]	@, msx.mapped_memory
	bl	iounmap		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:229:     printk(KERN_INFO "Banana MSX: exited\n");
	movw	r0, #:lower16:.LC11	@,
	movt	r0, #:upper16:.LC11	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:230: }
	pop	{r4, lr}	@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:229:     printk(KERN_INFO "Banana MSX: exited\n");
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
@ llseek:
	.word	banana_msx_llseek
@ read:
	.word	banana_msx_read
@ write:
	.word	banana_msx_write
@ mmap:
	.space	32
	.word	banana_msx_mmap
@ open:
	.space	4
	.word	banana_msx_open
@ release:
	.space	4
	.word	banana_msx_release
	.space	64
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	msx, %object
	.size	msx, 8
msx:
	.space	8
	.type	d, %object
	.size	d, 72
d:
	.space	72
	.type	__key.11, %object
	.size	__key.11, 0
__key.11:
	.section	.data.once,"aw"
	.set	.LANCHOR1,. + 0
	.type	__already_done.10, %object
	.size	__already_done.10, 1
__already_done.10:
	.space	1
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_description229, %object
	.size	__UNIQUE_ID_description229, 30
__UNIQUE_ID_description229:
	.ascii	"description=Banana MSX Module\000"
	.type	__UNIQUE_ID_author228, %object
	.size	__UNIQUE_ID_author228, 20
__UNIQUE_ID_author228:
	.ascii	"author=Bananananama\000"
	.type	__UNIQUE_ID_license227, %object
	.size	__UNIQUE_ID_license227, 12
__UNIQUE_ID_license227:
	.ascii	"license=GPL\000"
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",%progbits
