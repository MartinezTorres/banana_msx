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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:37: static int banana_msx_open(struct inode *inode, struct file *file) { return 0; }
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:37: static int banana_msx_open(struct inode *inode, struct file *file) { return 0; }
	movs	r0, #0	@,
	bx	lr	@
	.fnend
	.size	banana_msx_open, .-banana_msx_open
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:70: static loff_t banana_msx_llseek(struct file *filp, loff_t offset, int whence) {
	ldr	r1, [sp, #8]	@ whence, whence
	mov	ip, r0	@ filp, tmp130
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:74:     switch (whence) {
	cmp	r1, #1	@ whence,
	beq	.L4		@,
	cmp	r1, #2	@ whence,
	beq	.L5		@,
	cbz	r1, .L10	@ whence,
.L9:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:89:         return -EINVAL;
	mvn	r0, #21	@ <retval>,
	mov	r1, #-1	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:93: }
	pop	{r3, pc}	@
.L4:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:80:         new_pos = filp->f_pos + offset;
	ldrd	r0, r1, [r0, #64]	@ filp_10(D)->f_pos, tmp129, filp,
	adds	r0, r2, r0	@ <retval>, offset, filp_10(D)->f_pos
	adc	r1, r3, r1	@ <retval>, offset, tmp129
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (new_pos < 0 || new_pos > MAPPED_MEMORY_SIZE)
	mov	r2, r0	@ _15, <retval>
	mov	r3, r1	@ _15, <retval>
.L7:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (new_pos < 0 || new_pos > MAPPED_MEMORY_SIZE)
	mov	lr, #1	@ tmp120,
	movt	lr, 2048	@ tmp120,
	cmp	r2, lr	@ _15, tmp120
	sbcs	r3, r3, #0	@ tmp133, _15
	bcs	.L9		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:91:     filp->f_pos = new_pos;
	strd	r0, r1, [ip, #64]	@ <retval>, <retval>, filp,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:93: }
	pop	{r3, pc}	@
.L10:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:76:         new_pos = offset;
	mov	r0, r2	@ <retval>, _15
	mov	r1, r3	@ <retval>, _15
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:77:         break;
	b	.L7		@
.L5:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:84:         new_pos = MAPPED_MEMORY_SIZE + offset;
	adds	r0, r2, #134217728	@ <retval>, offset,
	adc	r1, r3, #0	@ <retval>, offset
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:88:     if (new_pos < 0 || new_pos > MAPPED_MEMORY_SIZE)
	mov	r2, r0	@ _15, <retval>
	mov	r3, r1	@ _15, <retval>
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:85:         break;
	b	.L7		@
	.fnend
	.size	banana_msx_llseek, .-banana_msx_llseek
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
	push	{r4, r5, r6, lr}	@
	.save {r4, r5, r6, lr}
	.pad #8
	sub	sp, sp, #8	@,,
	push	{lr}
	bl	__gnu_mcount_nc
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:96: {
	mov	r0, r1	@ vma, tmp179
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:98:     unsigned long size = (unsigned long)(vma->vm_end - vma->vm_start);
	ldrd	r1, r3, [r1]	@ _2, vma_21(D)->vm_end, vma
	subs	r3, r3, r1	@ size, vma_21(D)->vm_end, _2
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:100:     if (size > MAPPED_MEMORY_SIZE) return -EINVAL;
	cmp	r3, #134217728	@ size,
	bhi	.L14		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:103: 	vma->vm_flags |= VM_IO;
	ldr	r2, [r0, #40]	@ vma_21(D)->vm_flags, vma_21(D)->vm_flags
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:105:     page = virt_to_page((unsigned long)msx.mapped_memory + (vma->vm_pgoff << PAGE_SHIFT)); 
	movw	r4, #:lower16:.LANCHOR0	@ tmp151,
	movt	r4, #:upper16:.LANCHOR0	@ tmp151,
	ldr	r5, [r0, #76]	@ vma_21(D)->vm_pgoff, vma_21(D)->vm_pgoff
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:103: 	vma->vm_flags |= VM_IO;
	orr	r2, r2, #67108864	@ tmp148, vma_21(D)->vm_flags,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:     return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page), size, vma->vm_page_prot);
	ldr	r6, [r0, #36]	@ vma_21(D)->vm_page_prot, vma_21(D)->vm_page_prot
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:103: 	vma->vm_flags |= VM_IO;
	orr	r2, r2, #278528	@ tmp148, tmp148,
	str	r2, [r0, #40]	@ tmp148, vma_21(D)->vm_flags
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:105:     page = virt_to_page((unsigned long)msx.mapped_memory + (vma->vm_pgoff << PAGE_SHIFT)); 
	movw	r2, #:lower16:__pv_phys_pfn_offset	@ tmp158,
	movt	r2, #:upper16:__pv_phys_pfn_offset	@ tmp158,
	ldr	r4, [r4]	@ msx.mapped_memory, msx.mapped_memory
	ldr	r2, [r2]	@ __pv_phys_pfn_offset, __pv_phys_pfn_offset
	add	r4, r4, #1073741824	@ tmp152, msx.mapped_memory,
	add	r4, r4, r5, lsl #12	@ tmp156, tmp152, vma_21(D)->vm_pgoff,
	movs	r5, #36	@ tmp164,
	add	r2, r2, r4, lsr #12	@ __pfn, __pv_phys_pfn_offset, tmp156,
@ ./include/linux/mmzone.h:1356: 	if (unlikely(root >= NR_SECTION_ROOTS))
	cmp	r2, #16777216	@ __pfn,
@ ./include/linux/mmzone.h:1263: 	return pfn >> PFN_SECTION_SHIFT;
	lsr	r4, r2, #16	@ _38, __pfn,
@ ./include/linux/mmzone.h:1363: 	return &mem_section[root][nr & SECTION_ROOT_MASK];
	ittte	cc
	movwcc	lr, #:lower16:mem_section	@ tmp178,
	movtcc	lr, #:upper16:mem_section	@ tmp178,
	addcc	r4, lr, r4, lsl #4	@ _42, tmp178, _38,
@ ./include/linux/mmzone.h:1357: 		return NULL;
	movcs	r4, #0	@ _42,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:105:     page = virt_to_page((unsigned long)msx.mapped_memory + (vma->vm_pgoff << PAGE_SHIFT)); 
	mul	ip, r5, r2	@ tmp163, tmp164, __pfn
	itt	cs
	movwcs	lr, #:lower16:mem_section	@ tmp178,
	movtcs	lr, #:upper16:mem_section	@ tmp178,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:     return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page), size, vma->vm_page_prot);
	movw	r5, #36409	@ tmp175,
	movt	r5, 14563	@ tmp175,
@ ./include/linux/mmzone.h:1391: 	unsigned long map = section->section_mem_map;
	ldr	r4, [r4]	@ map, _43->section_mem_map
@ ./include/linux/mmzone.h:1392: 	map &= SECTION_MAP_MASK;
	bic	r4, r4, #31	@ map, map,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:105:     page = virt_to_page((unsigned long)msx.mapped_memory + (vma->vm_pgoff << PAGE_SHIFT)); 
	add	r2, r4, ip	@ _25, map, tmp163
@ ./include/linux/mm.h:1565: 	return (page->flags >> SECTIONS_PGSHIFT) & SECTIONS_MASK;
	ldr	r4, [r4, ip]	@ MEM[(const struct page *)_25].flags, MEM[(const struct page *)_25].flags
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:     return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page), size, vma->vm_page_prot);
	str	r6, [sp]	@ vma_21(D)->vm_page_prot,
@ ./include/linux/mm.h:1565: 	return (page->flags >> SECTIONS_PGSHIFT) & SECTIONS_MASK;
	lsr	ip, r4, #24	@ tmp166, MEM[(const struct page *)_25].flags,
@ ./include/linux/mmzone.h:1391: 	unsigned long map = section->section_mem_map;
	lsl	ip, ip, #4	@ tmp168, tmp166,
	ldr	r4, [lr, ip]	@ map, MEM <struct mem_section[256][1]> [(struct mem_section *)&mem_section][_34][0].section_mem_map
@ ./include/linux/mmzone.h:1392: 	map &= SECTION_MAP_MASK;
	bic	r4, r4, #31	@ map, map,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:     return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page), size, vma->vm_page_prot);
	subs	r2, r2, r4	@ tmp171, _25, map
	asrs	r2, r2, #2	@ tmp173, tmp171,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:107:     return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page), size, vma->vm_page_prot);
	mul	r2, r5, r2	@, tmp175, tmp173
	bl	remap_pfn_range		@
.L11:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:108: }
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r4, r5, r6, pc}	@
.L14:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:100:     if (size > MAPPED_MEMORY_SIZE) return -EINVAL;
	mvn	r0, #21	@ <retval>,
	b	.L11		@
	.fnend
	.size	banana_msx_mmap, .-banana_msx_mmap
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:55: static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	mov	r5, r3	@ pos, tmp185
	mov	r4, r2	@ count, tmp184
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:59:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	ldrd	r2, r3, [r3]	@ _1, _1, pos
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:55: static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	mov	r6, r1	@ buf, tmp183
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:59:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	cmp	r2, #134217728	@ _1,
	sbcs	r1, r3, #0	@ tmp187, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:59:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	it	ge
	movge	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:59:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	bge	.L16		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:61:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adds	r0, r4, r2	@ tmp175, count, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:61:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	mov	r1, #1	@ tmp143,
	movt	r1, 2048	@ tmp143,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:61:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adc	r3, r3, #0	@ tmp176, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:61:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	cmp	r0, r1	@ tmp175, tmp143
	sbcs	r3, r3, #0	@ tmp188, tmp176
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:63:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	movw	r3, #:lower16:.LANCHOR0	@ tmp144,
	movt	r3, #:upper16:.LANCHOR0	@ tmp144,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:61:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	itet	ge
	rsbge	r7, r2, #134217728	@ <retval>, _1,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movlt	r7, r4	@ <retval>, count
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:61:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	movge	r4, r7	@ count, <retval>
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	cmp	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:63:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	ldr	r3, [r3]	@ msx.mapped_memory, msx.mapped_memory
	add	r8, r3, r2	@ _8, msx.mapped_memory, _1
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	blt	.L20		@,
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
	cbnz	r3, .L22	@ flag,
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
.L22:
@ ./include/linux/uaccess.h:161: 	if (unlikely(res))
	cbnz	r0, .L26	@ n,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:65:     *pos += count;
	ldrd	r3, r2, [r5]	@ *pos_16(D), tmp182, pos
	adds	r3, r3, r4	@ tmp179, *pos_16(D), count
	str	r3, [r5]	@ tmp179, *pos_16(D)
	adc	r2, r2, #0	@ tmp180, tmp182
	str	r2, [r5, #4]	@ tmp180, *pos_16(D)
.L16:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:68: }
	mov	r0, r7	@, <retval>
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}	@
.L20:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movw	r4, #:lower16:.LANCHOR1	@ tmp149,
	movt	r4, #:upper16:.LANCHOR1	@ tmp149,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:63:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	ldrb	r3, [r4]	@ zero_extendqisi2	@ __already_done, __already_done
	cmp	r3, #0	@ __already_done
	bne	.L16	@
	movs	r2, #9	@,
	movs	r1, #216	@,
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	movs	r5, #1	@ tmp152,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:63:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	strb	r5, [r4]	@ tmp152, __already_done
	bl	warn_slowpath_fmt		@
	b	.L16		@
.L26:
@ ./include/linux/uaccess.h:162: 		memset(to + (n - res), 0, res);
	subs	r4, r4, r0	@ tmp160, count, n
@ ./include/linux/fortify-string.h:175: 	return __underlying_memset(p, c, size);
	mov	r2, r0	@, n
	movs	r1, #0	@,
	add	r0, r8, r4	@, _8, tmp160
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:63:     if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/fortify-string.h:175: 	return __underlying_memset(p, c, size);
	bl	memset		@
	b	.L16		@
	.fnend
	.size	banana_msx_write, .-banana_msx_write
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:40: static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {
	mov	r5, r3	@ pos, tmp177
	mov	r4, r2	@ count, tmp176
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:44:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	ldrd	r2, r3, [r3]	@ _1, _1, pos
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:40: static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {
	mov	r6, r1	@ buf, tmp175
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:44:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	cmp	r2, #134217728	@ _1,
	sbcs	r1, r3, #0	@ tmp179, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:44:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	it	ge
	movge	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:44:     if (*pos >= MAPPED_MEMORY_SIZE) return 0;
	bge	.L28		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:46:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adds	r0, r4, r2	@ tmp167, count, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:46:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	mov	r1, #1	@ tmp141,
	movt	r1, 2048	@ tmp141,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:46:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	adc	r3, r3, #0	@ tmp168, _1
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:46:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	cmp	r0, r1	@ tmp167, tmp141
	sbcs	r3, r3, #0	@ tmp180, tmp168
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:48:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	movw	r3, #:lower16:.LANCHOR0	@ tmp142,
	movt	r3, #:upper16:.LANCHOR0	@ tmp142,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:46:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	itet	ge
	rsbge	r7, r2, #134217728	@ <retval>, _1,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movlt	r7, r4	@ <retval>, count
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:46:     if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;
	movge	r4, r7	@ count, <retval>
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	cmp	r7, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:48:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	ldr	r3, [r3]	@ msx.mapped_memory, msx.mapped_memory
	add	r8, r3, r2	@ _8, msx.mapped_memory, _1
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	blt	.L32		@,
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
	cbz	r3, .L38	@ flag,
.L34:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:48:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	cbnz	r0, .L36	@ n,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:50:     *pos += count;
	ldrd	r3, r2, [r5]	@ *pos_16(D), tmp174, pos
	adds	r3, r3, r4	@ tmp171, *pos_16(D), count
	str	r3, [r5]	@ tmp171, *pos_16(D)
	adc	r2, r2, #0	@ tmp172, tmp174
	str	r2, [r5, #4]	@ tmp172, *pos_16(D)
.L28:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:53: }
	mov	r0, r7	@, <retval>
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}	@
.L38:
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
	b	.L34		@
.L32:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movw	r4, #:lower16:.LANCHOR1	@ tmp147,
	movt	r4, #:upper16:.LANCHOR1	@ tmp147,
	ldrb	r3, [r4]	@ zero_extendqisi2	@ __already_done, __already_done
	cbz	r3, .L35	@ __already_done,
.L36:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:48:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
	b	.L28		@
.L35:
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	movs	r2, #9	@,
	movs	r1, #216	@,
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	movs	r5, #1	@ tmp150,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:48:     if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;
	mvn	r7, #13	@ <retval>,
@ ./include/linux/thread_info.h:216: 	if (WARN_ON_ONCE(bytes > INT_MAX))
	strb	r5, [r4]	@ tmp150, __already_done
	bl	warn_slowpath_fmt		@
	b	.L28		@
	.fnend
	.size	banana_msx_read, .-banana_msx_read
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"banana_msx\000"
	.align	2
.LC2:
	.ascii	"\0013Failed to allocate device number\012\000"
	.align	2
.LC3:
	.ascii	"\0016Banana MSX allocated with major: %d, and minor"
	.ascii	": %d\012\000"
	.align	2
.LC4:
	.ascii	"\0013Failed to add device\012\000"
	.align	2
.LC5:
	.ascii	"banana_msx_class\000"
	.align	2
.LC6:
	.ascii	"\0013Failed to create class\012\000"
	.align	2
.LC7:
	.ascii	"\0016Banana MSX: initialized\012\000"
	.align	2
.LC8:
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:185: static int __init banana_msx_init(void) {
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:135:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	mov	r1, #134217728	@,
	mov	r0, #1476395008	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:135:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	movw	r4, #:lower16:.LANCHOR0	@ tmp131,
	movt	r4, #:upper16:.LANCHOR0	@ tmp131,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:135:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	bl	ioremap		@
	mov	r2, r0	@ tmp178,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:135:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	mov	r0, r4	@, tmp131
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:138:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	movw	r6, #:lower16:.LC1	@ tmp132,
	movt	r6, #:upper16:.LC1	@ tmp132,
	mov	r3, r6	@, tmp132
	movs	r1, #0	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:135:     msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);
	str	r2, [r0], #4	@ tmp178, msx.mapped_memory
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:138:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	movs	r2, #1	@,
	bl	alloc_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:138:     if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
	mov	r5, r0	@ <retval>, tmp179
	cbz	r0, .L40	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:139:         pr_err("Failed to allocate device number\n");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:140:         return err;
	b	.L39		@
.L40:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:143:     printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));
	ldr	r1, [r4, #4]	@ _9, d.dev
	movw	r0, #:lower16:.LC3	@,
	movt	r0, #:upper16:.LC3	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:146:     d.cdev.owner = THIS_MODULE;
	movw	r7, #:lower16:__this_module	@ tmp146,
	movt	r7, #:upper16:__this_module	@ tmp146,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:143:     printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));
	ubfx	r2, r1, #0, #20	@, _9,,
	lsrs	r1, r1, #20	@, _9,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:145:     cdev_init(&d.cdev, &banana_msx_fops);
	add	r0, r4, #8	@, tmp131,
	movw	r1, #:lower16:.LANCHOR2	@,
	movt	r1, #:upper16:.LANCHOR2	@,
	bl	cdev_init		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:148:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	ldr	r1, [r4, #4]	@, d.dev
	add	r0, r4, #8	@, tmp131,
	movs	r2, #1	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:146:     d.cdev.owner = THIS_MODULE;
	str	r7, [r4, #44]	@ tmp146, d.cdev.owner
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:148:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	bl	cdev_add		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:148:     if ((err = cdev_add(&d.cdev, d.dev, 1))) {
	mov	r8, r0	@ err, tmp180
	cbz	r0, .L42	@ err,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:149:         pr_err("Failed to add device\n");
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:150:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:151:         return err;
	mov	r5, r8	@ <retval>, err
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:150:         unregister_chrdev_region(d.dev, 1);
	bl	unregister_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:151:         return err;
	b	.L39		@
.L42:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:154:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	add	r2, r4, #76	@, tmp131,
	mov	r0, r7	@, tmp146
	movw	r1, #:lower16:.LC5	@,
	movt	r1, #:upper16:.LC5	@,
	bl	__class_create		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:154:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	cmn	r0, #4096	@ _15,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:154:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	str	r0, [r4, #68]	@ _15, d.class
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:154:     if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
	bls	.L43		@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:155:         pr_err("Failed to create class\n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:156:         cdev_del(&d.cdev);
	add	r0, r4, #8	@, tmp131,
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:157:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ ./include/linux/err.h:31: 	return (long) ptr;
	ldr	r5, [r4, #68]	@ <retval>, d.class
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:158:         return PTR_ERR(d.class);
	b	.L44		@
.L43:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:161:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	ldr	r2, [r4, #4]	@, d.dev
	mov	r3, r5	@, <retval>
	mov	r1, r5	@, tmp3
	str	r6, [sp]	@ tmp132,
	bl	device_create		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:161:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	cmn	r0, #4096	@ _24,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:161:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	str	r0, [r4, #72]	@ _24, d.device
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:161:     if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
	bhi	.L45		@,
.L46:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:190:     printk(KERN_INFO "Banana MSX: initialized\n");
	movw	r0, #:lower16:.LC7	@,
	movt	r0, #:upper16:.LC7	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:192:     return 0;
	movs	r5, #0	@ <retval>,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:190:     printk(KERN_INFO "Banana MSX: initialized\n");
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:192:     return 0;
	b	.L39		@
.L45:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:162:         pr_err("Failed to create device\n");
	movw	r0, #:lower16:.LC8	@,
	movt	r0, #:upper16:.LC8	@,
	bl	_printk		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:163:         class_destroy(d.class);
	ldr	r0, [r4, #68]	@, d.class
	bl	class_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:164:         cdev_del(&d.cdev);
	add	r0, r4, #8	@, tmp131,
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:165:         unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ ./include/linux/err.h:31: 	return (long) ptr;
	ldr	r5, [r4, #72]	@ <retval>, d.device
.L44:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:188:     if ((err = banana_msx_init_device())) return err;
	cmp	r5, #0	@ <retval>
	beq	.L46	@
.L39:
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:193: }
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
.LC9:
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
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:174: 	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	movw	r4, #:lower16:.LANCHOR0	@ tmp118,
	movt	r4, #:upper16:.LANCHOR0	@ tmp118,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:174: 	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	ldr	r1, [r4, #4]	@, d.dev
	ldr	r0, [r4, #68]	@, d.class
	bl	device_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:175: 	class_destroy(d.class);
	ldr	r0, [r4, #68]	@, d.class
	bl	class_destroy		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:176: 	cdev_del(&d.cdev);
	add	r0, r4, #8	@, tmp118,
	bl	cdev_del		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:177: 	unregister_chrdev_region(d.dev, 1);
	ldr	r0, [r4, #4]	@, d.dev
	movs	r1, #1	@,
	bl	unregister_chrdev_region		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:179: 	iounmap(msx.mapped_memory);
	ldr	r0, [r4]	@, msx.mapped_memory
	bl	iounmap		@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:199:     printk(KERN_INFO "Banana MSX: exited\n");
	movw	r0, #:lower16:.LC9	@,
	movt	r0, #:upper16:.LC9	@,
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:200: }
	pop	{r4, lr}	@
@ /home/manel/repos/manel/msx/banana_msx/kernel/module/banana_msx.c:199:     printk(KERN_INFO "Banana MSX: exited\n");
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
	.size	msx, 4
msx:
	.space	4
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
