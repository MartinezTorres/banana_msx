
tmp/core.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_Z25switch_to_supervisor_modev>:
                                        ;#define UNROLL1(a) do { {a} } while (false)
                                        ;#define UNROLL8(a) do { {a} {a} {a} {a} {a} {a} {a} {a} } while (false)
                                        ;
                                        ;void switch_to_supervisor_mode(void)
                                        ;{
                                        ;    asm volatile ("msr ELR_hyp, lr\n");
   0:	e12ef30e 	msr	ELR_hyp, lr
                                        ;    asm volatile ("eret\n");
   4:	e160006e 	eret
                                        ;}
   8:	e12fff1e 	bx	lr

Disassembly of section .text._ZL9_out_nullcPvjj:

00000000 <_ZL9_out_nullcPvjj>:
                                        ;
                                        ;// internal null output
                                        ;static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
                                        ;{
                                        ;  (void)character; (void)buffer; (void)idx; (void)maxlen;
                                        ;}
   0:	e12fff1e 	bx	lr

Disassembly of section .text._ZN3LogILm1048576EE8_out_LogEcPvjj:

00000000 <_ZN3LogILm1048576EE8_out_LogEcPvjj>:
                                        ;	uint8_t data[SZ];
                                        ;	
                                        ;	void init() { pos = 0; }
                                        ;	
                                        ;	void push(char c) {
                                        ;		data[pos++] = c;
   0:	e5913000 	ldr	r3, [r1]
   4:	e0812003 	add	r2, r1, r3
   8:	e2833001 	add	r3, r3, #1
                                        ;		pos = pos % SZ;
   c:	e7f33053 	ubfx	r3, r3, #0, #20
                                        ;		data[pos++] = c;
  10:	e5c20004 	strb	r0, [r2, #4]
                                        ;		pos = pos % SZ;
  14:	e5813000 	str	r3, [r1]
                                        ;	}
                                        ;
                                        ;	static inline void _out_Log(char character, void* log, size_t , size_t ) {
                                        ;		
                                        ;		((Log *)log)->push(character);
                                        ;	}
  18:	e12fff1e 	bx	lr

Disassembly of section .text._ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0:

00000000 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0>:
                                        ;  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
                                        ;}
                                        ;
                                        ;
                                        ;// internal itoa for 'long' type
                                        ;static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
   0:	                                                                e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   4:	                                                                e24dd034 	sub	sp, sp, #52	; 0x34
                                        ;{
                                        ;  char buf[PRINTF_NTOA_BUFFER_SIZE];
                                        ;  size_t len = 0U;
                                        ;
                                        ;  // no hash for 0 values
                                        ;  if (!value) {
   8:	                                                                e3530000 	cmp	r3, #0
                                        ;static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
   c:	                                                                e1a06000 	mov	r6, r0
  10:	                                                                e5ddc058 	ldrb	ip, [sp, #88]	; 0x58
  14:	                                                                e1a09001 	mov	r9, r1
  18:	                                                                e59d405c 	ldr	r4, [sp, #92]	; 0x5c
  1c:	                                                                e1a07002 	mov	r7, r2
  20:	                                                                e59da060 	ldr	sl, [sp, #96]	; 0x60
  24:	                                                                e59d8064 	ldr	r8, [sp, #100]	; 0x64
  28:	                                                                e59db068 	ldr	fp, [sp, #104]	; 0x68
  2c:	                                                                e58dc008 	str	ip, [sp, #8]
                                        ;  if (!value) {
  30:	                                                         /----- 1a000006 	bne	50 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x50>
                                        ;    flags &= ~FLAGS_HASH;
  34:	                                                         |      e3cb2010 	bic	r2, fp, #16
                                        ;  }
                                        ;
                                        ;  // write if precision != 0 and value is != 0
                                        ;  if (!(flags & FLAGS_PRECISION) || value) {
  38:	                                                         |      e21b1b01 	ands	r1, fp, #1024	; 0x400
  3c:	                                                         |      e58d100c 	str	r1, [sp, #12]
  40:	/--------------------------------------------------------|----- 1a0000b7 	bne	324 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x324>
  44:	|                                                        |      e58d1004 	str	r1, [sp, #4]
                                        ;    flags &= ~FLAGS_HASH;
  48:	|                                                        |      e1a0b002 	mov	fp, r2
  4c:	|                                                        |  /-- ea000003 	b	60 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x60>
                                        ;  if (!(flags & FLAGS_PRECISION) || value) {
  50:	|                                                        \--|-> e20b2b01 	and	r2, fp, #1024	; 0x400
  54:	|                                                           |   e58d200c 	str	r2, [sp, #12]
                                        ;  if (flags & FLAGS_HASH) {
  58:	|                                                           |   e20b2010 	and	r2, fp, #16
  5c:	|                                                           |   e58d2004 	str	r2, [sp, #4]
  60:	|                                                           \-> e31b0020 	tst	fp, #32
  64:	|                                                               e28d2010 	add	r2, sp, #16
  68:	|                                                               13a00041 	movne	r0, #65	; 0x41
  6c:	|                                                               03a00061 	moveq	r0, #97	; 0x61
                                        ;    do {
                                        ;      const char digit = (char)(value % base);
                                        ;      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
  70:	|                                                               e3a0c000 	mov	ip, #0
  74:	|                                                               e240000a 	sub	r0, r0, #10
                                        ;      const char digit = (char)(value % base);
  78:	|                                                           /-> e73ef413 	udiv	lr, r3, r4
  7c:	|                                                           |   e0613e94 	mls	r1, r4, lr, r3
                                        ;      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
  80:	|                                                           |   e28cc001 	add	ip, ip, #1
  84:	|                                                           |   e3510009 	cmp	r1, #9
                                        ;      const char digit = (char)(value % base);
  88:	|                                                           |   e6ef1071 	uxtb	r1, r1
                                        ;      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
  8c:	|                                                           |   e0815000 	add	r5, r1, r0
  90:	|                                                           |   e2811030 	add	r1, r1, #48	; 0x30
  94:	|                                                           |   94c21001 	strbls	r1, [r2], #1
  98:	|                                                           |   84c25001 	strbhi	r5, [r2], #1
                                        ;      value /= base;
                                        ;    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
  9c:	|                                                           |   e35c001f 	cmp	ip, #31
  a0:	|                                                           |   93a01000 	movls	r1, #0
  a4:	|                                                           |   83a01001 	movhi	r1, #1
  a8:	|                                                           |   e1540003 	cmp	r4, r3
  ac:	|                                                           |   91a05001 	movls	r5, r1
  b0:	|                                                           |   83815001 	orrhi	r5, r1, #1
                                        ;      value /= base;
  b4:	|                                                           |   e1a0300e 	mov	r3, lr
                                        ;    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
  b8:	|                                                           |   e3550000 	cmp	r5, #0
  bc:	|                                                           \-- 0affffed 	beq	78 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x78>
                                        ;  if (!(flags & FLAGS_LEFT)) {
  c0:	|                                                               e21b5002 	ands	r5, fp, #2
  c4:	|  /----------------------------------------------------------- 1a000033 	bne	198 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x198>
                                        ;    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  c8:	|  |           /----------------------------------------------> e3580000 	cmp	r8, #0
  cc:	|  |           |                                      /-------- 0a00000d 	beq	108 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x108>
  d0:	|  |           |                                      |         e21b5001 	ands	r5, fp, #1
  d4:	|  |  /--------|--------------------------------------|-------- 0a0000aa 	beq	384 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x384>
  d8:	|  |  |        |                                      |         e59d3008 	ldr	r3, [sp, #8]
  dc:	|  |  |        |                                      |         e3530000 	cmp	r3, #0
  e0:	|  |  |        |                                      |  /----- 1a000001 	bne	ec <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0xec>
  e4:	|  |  |        |                                      |  |      e31b000c 	tst	fp, #12
  e8:	|  |  |        |                                      |  |  /-- 0a000000 	beq	f0 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0xf0>
                                        ;      width--;
  ec:	|  |  |        |                                      |  \--|-> e2488001 	sub	r8, r8, #1
                                        ;    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
  f0:	|  |  |        |                                      |     \-> e15a000c 	cmp	sl, ip
  f4:	|  |  |        |                                      |         81a03001 	movhi	r3, r1
  f8:	|  |  |        |                                      |         93813001 	orrls	r3, r1, #1
  fc:	|  |  |        |                                      |         e3530000 	cmp	r3, #0
 100:	|  |  |  /-----|--------------------------------------|-------- 0a000006 	beq	120 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x120>
 104:	|  |  |  |     |                                   /--|-------- ea000015 	b	160 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x160>
 108:	|  |  |  |     |                                   |  \-------> e15a000c 	cmp	sl, ip
 10c:	|  |  |  |     |                                   |            81a03001 	movhi	r3, r1
 110:	|  |  |  |     |                                   |            93813001 	orrls	r3, r1, #1
                                        ;    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 114:	|  |  |  |     |                                   |            e20b5001 	and	r5, fp, #1
                                        ;    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 118:	|  |  |  |     |                                   |            e3530000 	cmp	r3, #0
 11c:	|  |  |  |     |                                   |     /----- 1a00000d 	bne	158 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x158>
 120:	|  |  |  >-----|-----------------------------------|-----|----> e28c3030 	add	r3, ip, #48	; 0x30
                                        ;      buf[len++] = '0';
 124:	|  |  |  |     |                                   |     |      e3a00030 	mov	r0, #48	; 0x30
 128:	|  |  |  |     |                                   |     |      e08d3003 	add	r3, sp, r3
 12c:	|  |  |  |     |                                   |     |      e2433021 	sub	r3, r3, #33	; 0x21
 130:	|  |  |  |     |                                   |     |  /-> e5e30001 	strb	r0, [r3, #1]!
 134:	|  |  |  |     |                                   |     |  |   e28cc001 	add	ip, ip, #1
                                        ;    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 138:	|  |  |  |     |                                   |     |  |   e35c001f 	cmp	ip, #31
 13c:	|  |  |  |     |                                   |     |  |   93a01000 	movls	r1, #0
 140:	|  |  |  |     |                                   |     |  |   83a01001 	movhi	r1, #1
 144:	|  |  |  |     |                                   |     |  |   e15a000c 	cmp	sl, ip
 148:	|  |  |  |     |                                   |     |  |   81a02001 	movhi	r2, r1
 14c:	|  |  |  |     |                                   |     |  |   93812001 	orrls	r2, r1, #1
 150:	|  |  |  |     |                                   |     |  |   e3520000 	cmp	r2, #0
 154:	|  |  |  |     |                                   |     |  \-- 0afffff5 	beq	130 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x130>
                                        ;    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 158:	|  |  |  |     |                                   |     \----> e3550000 	cmp	r5, #0
 15c:	|  +--|--|-----|-----------------------------------|----------- 0a00000d 	beq	198 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x198>
 160:	|  |  |  |     |                                   \----------> e15c0008 	cmp	ip, r8
 164:	|  |  |  |     |                                                23811001 	orrcs	r1, r1, #1
 168:	|  |  |  |     |                                                e3510000 	cmp	r1, #0
 16c:	|  |  |  |     |                                         /----- 1a000008 	bne	194 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x194>
 170:	|  |  |  |     |                                         |      e28c3030 	add	r3, ip, #48	; 0x30
                                        ;      buf[len++] = '0';
 174:	|  |  |  |     |                                         |      e3a02030 	mov	r2, #48	; 0x30
 178:	|  |  |  |     |                                         |      e08d3003 	add	r3, sp, r3
 17c:	|  |  |  |     |                                         |      e2433021 	sub	r3, r3, #33	; 0x21
 180:	|  |  |  |     |                                         |  /-> e5e32001 	strb	r2, [r3, #1]!
 184:	|  |  |  |     |                                         |  |   e28cc001 	add	ip, ip, #1
                                        ;    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 188:	|  |  |  |     |                                         |  |   e35c001f 	cmp	ip, #31
 18c:	|  |  |  |     |                                         |  |   915c0008 	cmpls	ip, r8
 190:	|  |  |  |     |                                         |  \-- 3afffffa 	bcc	180 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x180>
 194:	|  |  |  |     |                                         \----> e3a05000 	mov	r5, #0
                                        ;  if (flags & FLAGS_HASH) {
 198:	|  >--|--|-----|----------------------------------------------> e59d3004 	ldr	r3, [sp, #4]
 19c:	|  |  |  |     |                                                e3530000 	cmp	r3, #0
 1a0:	|  |  |  |     |                    /-------------------------- 0a00004f 	beq	2e4 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x2e4>
                                        ;    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 1a4:	|  |  |  |     |                    |                           e59d300c 	ldr	r3, [sp, #12]
 1a8:	|  |  |  |     |                    |                           e3530000 	cmp	r3, #0
 1ac:	|  |  |  |     |                    |                 /-------- 0a00003b 	beq	2a0 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x2a0>
                                        ;    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 1b0:	|  |  |  |  /--|--------------------|-----------------|-------> e3540010 	cmp	r4, #16
 1b4:	|  |  |  |  |  |  /-----------------|-----------------|-------- 0a000094 	beq	40c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x40c>
                                        ;    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 1b8:	|  |  |  |  |  |  |                 |                 |         e35c001f 	cmp	ip, #31
 1bc:	|  |  |  |  |  |  |                 |                 |         93540002 	cmpls	r4, #2
                                        ;      buf[len++] = 'b';
 1c0:	|  |  |  |  |  |  |                 |                 |         028c3030 	addeq	r3, ip, #48	; 0x30
 1c4:	|  |  |  |  |  |  |                 |                 |         028cc001 	addeq	ip, ip, #1
 1c8:	|  |  |  |  |  |  |                 |                 |         008d3003 	addeq	r3, sp, r3
 1cc:	|  |  |  |  |  |  |                 |                 |         03a02062 	moveq	r2, #98	; 0x62
 1d0:	|  |  |  |  |  |  |                 |                 |         05432020 	strbeq	r2, [r3, #-32]	; 0xffffffe0
                                        ;    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 1d4:	|  |  |  |  |  |  |  /--------------|-----------------|-------> e35c0020 	cmp	ip, #32
 1d8:	|  |  |  |  |  |  |  |              |              /--|-------- 1a00003c 	bne	2d0 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x2d0>
                                        ;  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 1dc:	|  |  |  |  |  |  |  |              |        /-----|--|-------> e31b0003 	tst	fp, #3
 1e0:	|  |  |  |  |  |  |  |              |        |     |  |         11a04007 	movne	r4, r7
 1e4:	|  |  |  |  |  |  |  |              |        |     |  |         13a0a020 	movne	sl, #32
 1e8:	|  |  |  |  |  |  |  |              |  /-----|-----|--|-------- 1a00000f 	bne	22c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x22c>
 1ec:	|  |  |  |  |  |  |  |              |  |     |     |  |         e3a0a020 	mov	sl, #32
                                        ;    for (size_t i = len; i < width; i++) {
 1f0:	|  |  |  |  |  |  |  |        /-----|--|-----|-----|--|-------> e15a0008 	cmp	sl, r8
 1f4:	|  |  |  |  |  |  |  |     /--|-----|--|-----|-----|--|-------- 2a00005a 	bcs	364 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x364>
 1f8:	|  |  |  |  |  |  |  |     |  |     |  |  /--|-----|--|-------> e0874008 	add	r4, r7, r8
 1fc:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |         e1a0b007 	mov	fp, r7
 200:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |         e044400a 	sub	r4, r4, sl
                                        ;      out(' ', buffer, idx++, maxlen);
 204:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     /-> e1a0200b 	mov	r2, fp
 208:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     |   e3e03000 	mvn	r3, #0
 20c:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     |   e28bb001 	add	fp, fp, #1
 210:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     |   e1a01009 	mov	r1, r9
 214:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     |   e3a00020 	mov	r0, #32
 218:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     |   e12fff36 	blx	r6
                                        ;    for (size_t i = len; i < width; i++) {
 21c:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     |   e154000b 	cmp	r4, fp
 220:	|  |  |  |  |  |  |  |     |  |     |  |  |  |     |  |     \-- 1afffff7 	bne	204 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x204>
                                        ;  while (len) {
 224:	|  |  |  |  |  |  |  |     |  |  /--|--|--|--|-----|--|-------> e35a0000 	cmp	sl, #0
 228:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  /----- 0a00000b 	beq	25c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x25c>
                                        ;    for (size_t i = len; i < width; i++) {
 22c:	|  |  |  |  |  |  |  |     |  |  |  |  >--|--|-----|--|--|----> e1a0b00a 	mov	fp, sl
 230:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |      e08aa004 	add	sl, sl, r4
 234:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  /-> e04a200b 	sub	r2, sl, fp
                                        ;    out(buf[--len], buffer, idx++, maxlen);
 238:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e28d3010 	add	r3, sp, #16
 23c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e24bb001 	sub	fp, fp, #1
 240:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e1a01009 	mov	r1, r9
 244:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e1a0400a 	mov	r4, sl
 248:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e7d3000b 	ldrb	r0, [r3, fp]
 24c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e3e03000 	mvn	r3, #0
 250:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e12fff36 	blx	r6
                                        ;  while (len) {
 254:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e35b0000 	cmp	fp, #0
 258:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  \-- 1afffff5 	bne	234 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x234>
                                        ;  if (flags & FLAGS_LEFT) {
 25c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  \----> e3550000 	cmp	r5, #0
 260:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  /----- 0a00000b 	beq	294 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x294>
                                        ;    while (idx - start_idx < width) {
 264:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |      e0447007 	sub	r7, r4, r7
 268:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |      e1580007 	cmp	r8, r7
 26c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  +----- 9a000008 	bls	294 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x294>
                                        ;      out(' ', buffer, idx++, maxlen);
 270:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  /-> e1a02004 	mov	r2, r4
 274:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e3e03000 	mvn	r3, #0
 278:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e1a01009 	mov	r1, r9
 27c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e3a00020 	mov	r0, #32
                                        ;    while (idx - start_idx < width) {
 280:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e2877001 	add	r7, r7, #1
                                        ;      out(' ', buffer, idx++, maxlen);
 284:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e12fff36 	blx	r6
                                        ;    while (idx - start_idx < width) {
 288:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e1580007 	cmp	r8, r7
                                        ;      out(' ', buffer, idx++, maxlen);
 28c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  |   e2844001 	add	r4, r4, #1
                                        ;    while (idx - start_idx < width) {
 290:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  |  \-- 8afffff6 	bhi	270 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x270>
                                        ;  }
                                        ;
                                        ;  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
                                        ;}
 294:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |  \----> e1a00004 	mov	r0, r4
 298:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |         e28dd034 	add	sp, sp, #52	; 0x34
 29c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |         e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
                                        ;    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 2a0:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  \-------> e35c0000 	cmp	ip, #0
 2a4:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--|----------- 1a00003b 	bne	398 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x398>
                                        ;    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 2a8:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |            e3540010 	cmp	r4, #16
 2ac:	|  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|----------- 0a000062 	beq	43c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x43c>
                                        ;    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 2b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            e3540002 	cmp	r4, #2
                                        ;      buf[len++] = '0';
 2b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            13a03030 	movne	r3, #48	; 0x30
 2b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            13a0c001 	movne	ip, #1
 2bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            15cd3010 	strbne	r3, [sp, #16]
                                        ;    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 2c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- 1a000009 	bne	2ec <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x2ec>
                                        ;      buf[len++] = 'b';
 2c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         e3a0c001 	mov	ip, #1
 2c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         e3a03062 	mov	r3, #98	; 0x62
 2cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         e5cd3010 	strb	r3, [sp, #16]
                                        ;      buf[len++] = '0';
 2d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------> e28c3030 	add	r3, ip, #48	; 0x30
 2d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |         e28cc001 	add	ip, ip, #1
 2d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |         e08d3003 	add	r3, sp, r3
 2dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |         e3a02030 	mov	r2, #48	; 0x30
 2e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |         e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
                                        ;  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 2e4:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|-----|-------> e35c0020 	cmp	ip, #32
 2e8:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  \--|-----|-------- 0affffbb 	beq	1dc <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x1dc>
                                        ;    if (negative) {
 2ec:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     >-------> e59d3008 	ldr	r3, [sp, #8]
 2f0:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     |         e3530000 	cmp	r3, #0
 2f4:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     |  /----- 0a000013 	beq	348 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x348>
                                        ;      buf[len++] = '-';
 2f8:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     |  |      e28c3030 	add	r3, ip, #48	; 0x30
 2fc:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     |  |      e28ca001 	add	sl, ip, #1
 300:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     |  |      e08d3003 	add	r3, sp, r3
 304:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     |  |      e3a0202d 	mov	r2, #45	; 0x2d
 308:	|  |  |  |  |  |  |  |  |  |  |  |     |  |     |     |  |      e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
                                        ;  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 30c:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  /--|-----|--|----> e31b0003 	tst	fp, #3
 310:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     |  |  /-- 1a000001 	bne	31c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x31c>
                                        ;    for (size_t i = len; i < width; i++) {
 314:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     |  |  |   e158000a 	cmp	r8, sl
 318:	|  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|-----|--|--|-- 8affffb6 	bhi	1f8 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x1f8>
 31c:	|  |  |  |  |  |  |  |  |  |  |  |     |     |  |     |  |  \-> e1a04007 	mov	r4, r7
 320:	|  |  |  |  |  |  |  |  |  |  |  |     \-----|--|-----|--|----- eaffffc1 	b	22c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x22c>
                                        ;  if (!(flags & FLAGS_LEFT)) {
 324:	\--|--|--|--|--|--|--|--|--|--|--|-----------|--|-----|--|----> e21b5002 	ands	r5, fp, #2
                                        ;  size_t len = 0U;
 328:	   |  |  |  |  |  |  |  |  |  |  |           |  |     |  |      11a0c003 	movne	ip, r3
                                        ;  if (!(flags & FLAGS_LEFT)) {
 32c:	   |  |  |  |  |  |  |  |  |  |  |           |  |     |  |      11a0b002 	movne	fp, r2
 330:	   |  |  |  |  |  |  |  |  |  |  |           |  |     \--|----- 1affffed 	bne	2ec <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x2ec>
 334:	   |  |  |  |  |  |  |  |  |  |  |           |  |        |      e58d5004 	str	r5, [sp, #4]
 338:	   |  |  |  |  |  |  |  |  |  |  |           |  |        |      e1a01005 	mov	r1, r5
 33c:	   |  |  |  |  |  |  |  |  |  |  |           |  |        |      e1a0b002 	mov	fp, r2
                                        ;  size_t len = 0U;
 340:	   |  |  |  |  |  |  |  |  |  |  |           |  |        |      e1a0c005 	mov	ip, r5
 344:	   |  |  |  |  \--|--|--|--|--|--|-----------|--|--------|----- eaffff5f 	b	c8 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0xc8>
                                        ;    else if (flags & FLAGS_PLUS) {
 348:	   |  |  |  |     |  |  |  |  |  |           |  |        \----> e31b0004 	tst	fp, #4
 34c:	   |  |  |  |     |  |  |  |  |  |           |  |           /-- 1a000006 	bne	36c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x36c>
                                        ;    else if (flags & FLAGS_SPACE) {
 350:	   |  |  |  |     |  |  |  |  |  |           |  |           |   e31b0008 	tst	fp, #8
 354:	   |  |  |  |     |  |  |  |  |  |           |  |  /--------|-- 1a000030 	bne	41c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x41c>
                                        ;  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 358:	   |  |  |  |     |  |  |  |  |  |           |  |  |        |   e31b0003 	tst	fp, #3
 35c:	   |  |  |  |     |  |  |  |  |  |           |  |  |        |   e1a0a00c 	mov	sl, ip
 360:	   |  |  |  |     |  |  |  |  \--|-----------|--|--|--------|-- 0affffa2 	beq	1f0 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x1f0>
 364:	   |  |  |  |     |  |  |  \-----|-----------|--|--|--------|-> e1a04007 	mov	r4, r7
 368:	   |  |  |  |     |  |  |        \-----------|--|--|--------|-- eaffffad 	b	224 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x224>
                                        ;      buf[len++] = '+';  // ignore the space if the '+' exists
 36c:	   |  |  |  |     |  |  |                    |  |  |        \-> e28c3030 	add	r3, ip, #48	; 0x30
 370:	   |  |  |  |     |  |  |                    |  |  |            e3a0202b 	mov	r2, #43	; 0x2b
 374:	   |  |  |  |     |  |  |                    |  |  |            e08d3003 	add	r3, sp, r3
 378:	   |  |  |  |     |  |  |                    |  |  |            e28ca001 	add	sl, ip, #1
 37c:	   |  |  |  |     |  |  |                    |  |  |            e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
 380:	   |  |  |  |     |  |  |                    +--|--|----------- eaffffe1 	b	30c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x30c>
                                        ;    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 384:	   |  \--|--|-----|--|--|--------------------|--|--|----------> e15a000c 	cmp	sl, ip
 388:	   |     |  |     |  |  |                    |  |  |            93811001 	orrls	r1, r1, #1
 38c:	   |     |  |     |  |  |                    |  |  |            e3510000 	cmp	r1, #0
 390:	   |     \--|-----|--|--|--------------------|--|--|----------- 0affff62 	beq	120 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x120>
 394:	   \--------|-----|--|--|--------------------|--|--|----------- eaffff7f 	b	198 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x198>
                                        ;    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 398:	            |     |  |  |                    |  \--|----------> e15c0008 	cmp	ip, r8
 39c:	            |     |  |  |                    |     |            115a000c 	cmpne	sl, ip
 3a0:	            +-----|--|--|--------------------|-----|----------- 1affff82 	bne	1b0 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x1b0>
                                        ;      if (len && (base == 16U)) {
 3a4:	            |     |  |  |                    |     |            e25c2001 	subs	r2, ip, #1
 3a8:	            |     |  |  |                    |     |            13a03001 	movne	r3, #1
 3ac:	            |     |  |  |                    |     |            03a03000 	moveq	r3, #0
 3b0:	            |     |  |  |                    |     |            e3540010 	cmp	r4, #16
 3b4:	            |     |  |  |                    |     |            13a03000 	movne	r3, #0
 3b8:	            |     |  |  |                    |     |            02033001 	andeq	r3, r3, #1
 3bc:	            |     |  |  |                    |     |            e3530000 	cmp	r3, #0
                                        ;        len--;
 3c0:	            |     |  |  |                    |     |            124cc002 	subne	ip, ip, #2
                                        ;      if (len && (base == 16U)) {
 3c4:	            |     |  |  |                    |     |     /----- 0a00001a 	beq	434 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x434>
                                        ;    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 3c8:	            |     |  |  |                    |     |  /--|----> e21b1020 	ands	r1, fp, #32
 3cc:	            |     |  |  |                    |     |  |  |      13a02000 	movne	r2, #0
 3d0:	            |     |  |  |                    |     |  |  |      02032001 	andeq	r2, r3, #1
 3d4:	            |     |  |  |                    |     |  |  |      e3520000 	cmp	r2, #0
                                        ;      buf[len++] = 'x';
 3d8:	            |     |  |  |                    |     |  |  |      13a02078 	movne	r2, #120	; 0x78
                                        ;    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 3dc:	            |     |  |  |                    |     |  |  |  /-- 1a000005 	bne	3f8 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x3f8>
                                        ;    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 3e0:	            |     |  |  |                    |     |  |  |  |   e3510000 	cmp	r1, #0
 3e4:	            |     |  |  |                    |     |  |  |  |   03a03000 	moveq	r3, #0
 3e8:	            |     |  |  |                    |     |  |  |  |   12033001 	andne	r3, r3, #1
 3ec:	            |     |  |  |                    |     |  |  |  |   e3530000 	cmp	r3, #0
 3f0:	            |     |  +--|--------------------|-----|--|--|--|-- 0affff77 	beq	1d4 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x1d4>
                                        ;      buf[len++] = 'X';
 3f4:	            |     |  |  |                    |     |  |  |  |   e3a02058 	mov	r2, #88	; 0x58
 3f8:	            |     |  |  |                    |     |  |  |  \-> e28c3030 	add	r3, ip, #48	; 0x30
 3fc:	            |     |  |  |                    |     |  |  |      e28cc001 	add	ip, ip, #1
 400:	            |     |  |  |                    |     |  |  |      e08d3003 	add	r3, sp, r3
 404:	            |     |  |  |                    |     |  |  |      e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
 408:	            |     |  \--|--------------------|-----|--|--|----- eaffff71 	b	1d4 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x1d4>
                                        ;    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 40c:	            |     \-----|--------------------|-----|--|--|----> e35c001f 	cmp	ip, #31
 410:	            |           |                    |     |  |  |      83a03000 	movhi	r3, #0
 414:	            |           |                    |     |  |  |      93a03001 	movls	r3, #1
 418:	            |           |                    |     |  +--|----- eaffffea 	b	3c8 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x3c8>
                                        ;      buf[len++] = ' ';
 41c:	            |           |                    |     \--|--|----> e28c3030 	add	r3, ip, #48	; 0x30
 420:	            |           |                    |        |  |      e3a02020 	mov	r2, #32
 424:	            |           |                    |        |  |      e08d3003 	add	r3, sp, r3
 428:	            |           |                    |        |  |      e28ca001 	add	sl, ip, #1
 42c:	            |           |                    |        |  |      e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
 430:	            |           |                    \--------|--|----- eaffffb5 	b	30c <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x30c>
                                        ;      len--;
 434:	            |           |                             |  \----> e1a0c002 	mov	ip, r2
 438:	            \-----------|-----------------------------|-------- eaffff5c 	b	1b0 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x1b0>
                                        ;    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 43c:	                        \-----------------------------|-------> e3a03001 	mov	r3, #1
 440:	                                                      \-------- eaffffe0 	b	3c8 <_ZL10_ntoa_longPFvcPvjjEPcjjmbmjjj.constprop.0+0x3c8>

Disassembly of section .text._ZN3LogILm1048576EE6printfEPKcz:

00000000 <_ZN3LogILm1048576EE6printfEPKcz>:
                                        ;		
                                        ;	inline int printf(const char* format, ...) {
   0:	                                                                                                 e92d000e 	push	{r1, r2, r3}
   4:	                                                                                                 e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   8:	                                                                                                 e24dd030 	sub	sp, sp, #48	; 0x30
   c:	                                                                                                 e1a07000 	mov	r7, r0
                                        ;		
                                        ;	  va_list va;
                                        ;	  va_start(va, format);
  10:	                                                                                                 e28d8058 	add	r8, sp, #88	; 0x58
                                        ;	inline int printf(const char* format, ...) {
  14:	                                                                                                 e59d4054 	ldr	r4, [sp, #84]	; 0x54
                                        ;	  va_start(va, format);
  18:	                                                                                                 e58d802c 	str	r8, [sp, #44]	; 0x2c
                                        ;  if (!buffer) {
                                        ;    // use null output function
                                        ;    out = _out_null;
                                        ;  }
                                        ;
                                        ;  while (*format)
  1c:	                                                                                                 e5d40000 	ldrb	r0, [r4]
  20:	                                                                                                 e3500000 	cmp	r0, #0
  24:	   /-------------------------------------------------------------------------------------------- 0a0001c1 	beq	730 <_ZN3LogILm1048576EE6printfEPKcz+0x730>
                                        ;        if (is_ll) {
                                        ;          idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
                                        ;        }
                                        ;        else {
                                        ;#endif
                                        ;          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
  28:	   |                                                                                             e3003000 	movw	r3, #0
                                        ;  while (*format)
  2c:	   |                                                                                             e3a05000 	mov	r5, #0
                                        ;          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
  30:	   |                                                                                             e3403000 	movt	r3, #0
  34:	   |                                                                                             e58d301c 	str	r3, [sp, #28]
  38:	   |                                                                                      /----- ea000008 	b	60 <_ZN3LogILm1048576EE6printfEPKcz+0x60>
                                        ;      out(*format, buffer, idx++, maxlen);
  3c:	   |                                                                                   /--|----> e1a02005 	mov	r2, r5
  40:	   |                                                                                   |  |      e3e03000 	mvn	r3, #0
  44:	   |                                                                                   |  |      e1a01007 	mov	r1, r7
  48:	   |                                                                                   |  |      e2855001 	add	r5, r5, #1
                                        ;      format++;
  4c:	   |                                                                                   |  |      e2844001 	add	r4, r4, #1
                                        ;      out(*format, buffer, idx++, maxlen);
  50:	   |                                                                                   |  |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;  while (*format)
  54:	/--|-----------------------------------------------------------------------------------|--|----> e5d40000 	ldrb	r0, [r4]
  58:	|  |                                                                                   |  |      e3500000 	cmp	r0, #0
  5c:	|  |                                                                       /-----------|--|----- 0a0000bd 	beq	358 <_ZN3LogILm1048576EE6printfEPKcz+0x358>
                                        ;    if (*format != '%') {
  60:	|  |                                                                       |           |  \----> e3500025 	cmp	r0, #37	; 0x25
  64:	|  |                                                                       |           \-------- 1afffff4 	bne	3c <_ZN3LogILm1048576EE6printfEPKcz+0x3c>
                                        ;      format++;
  68:	|  |                                                                       |                     e2843001 	add	r3, r4, #1
                                        ;    flags = 0U;
  6c:	|  |                                                                       |                     e3a01000 	mov	r1, #0
  70:	|  |                                                                       |              /----> e1a04003 	mov	r4, r3
                                        ;      switch (*format) {
  74:	|  |                                                                       |              |      e4d30001 	ldrb	r0, [r3], #1
  78:	|  |                                                                       |              |      e2402020 	sub	r2, r0, #32
  7c:	|  |                                                                       |              |      e3520010 	cmp	r2, #16
  80:	|  |                                                                       |              |      979ff102 	ldrls	pc, [pc, r2, lsl #2]
  84:	|  |                                                                       |              |  /-- ea000010 	b	cc <_ZN3LogILm1048576EE6printfEPKcz+0xcc>
  88:	|  |                                                                       |              |  |   00000184 	.word	0x00000184
  8c:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  90:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  94:	|  |                                                                       |              |  |   0000017c 	.word	0x0000017c
  98:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  9c:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  a0:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  a4:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  a8:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  ac:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  b0:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  b4:	|  |                                                                       |              |  |   00000174 	.word	0x00000174
  b8:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  bc:	|  |                                                                       |              |  |   0000016c 	.word	0x0000016c
  c0:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  c4:	|  |                                                                       |              |  |   000000cc 	.word	0x000000cc
  c8:	|  |                                                                       |              |  |   00000164 	.word	0x00000164
                                        ;    if (_is_digit(*format)) {
  cc:	|  |                                                                       |              |  \-> e2403030 	sub	r3, r0, #48	; 0x30
  d0:	|  |                                                                       |              |      e3530009 	cmp	r3, #9
  d4:	|  |                                                                       |        /-----|----- 9a000087 	bls	2f8 <_ZN3LogILm1048576EE6printfEPKcz+0x2f8>
                                        ;    else if (*format == '*') {
  d8:	|  |                                                                       |        |     |      e350002a 	cmp	r0, #42	; 0x2a
                                        ;    width = 0U;
  dc:	|  |                                                                       |        |     |      13a06000 	movne	r6, #0
                                        ;    else if (*format == '*') {
  e0:	|  |                                                                       |        |     |  /-- 1a000005 	bne	fc <_ZN3LogILm1048576EE6printfEPKcz+0xfc>
                                        ;      const int w = va_arg(va, int);
  e4:	|  |                                                                       |        |     |  |   e4986004 	ldr	r6, [r8], #4
                                        ;      format++;
  e8:	|  |                                                                       |        |     |  |   e2844001 	add	r4, r4, #1
                                        ;    if (*format == '.') {
  ec:	|  |                                                                       |        |     |  |   e5d40000 	ldrb	r0, [r4]
                                        ;      if (w < 0) {
  f0:	|  |                                                                       |        |     |  |   e3560000 	cmp	r6, #0
                                        ;        flags |= FLAGS_LEFT;    // reverse padding
  f4:	|  |                                                                       |        |     |  |   b3811002 	orrlt	r1, r1, #2
                                        ;        width = (unsigned int)-w;
  f8:	|  |                                                                       |        |     |  |   b2666000 	rsblt	r6, r6, #0
                                        ;    if (*format == '.') {
  fc:	|  |                                                                       |        |     |  \-> e350002e 	cmp	r0, #46	; 0x2e
 100:	|  |                                                                       |        |  /--|----- 0a000086 	beq	320 <_ZN3LogILm1048576EE6printfEPKcz+0x320>
                                        ;    precision = 0U;
 104:	|  |                                                                       |     /--|--|--|----> e3a09000 	mov	r9, #0
                                        ;    switch (*format) {
 108:	|  |  /--------------------------------------------------------------------|-----|--|--|--|----> e2403068 	sub	r3, r0, #104	; 0x68
 10c:	|  |  |                                                                    |     |  |  |  |      e3530012 	cmp	r3, #18
 110:	|  |  |                                                                    |     |  |  |  |      979ff103 	ldrls	pc, [pc, r3, lsl #2]
 114:	|  |  |                                                                 /--|-----|--|--|--|----- ea00001f 	b	198 <_ZN3LogILm1048576EE6printfEPKcz+0x198>
 118:	|  |  |                                                                 |  |     |  |  |  |      0000046c 	.word	0x0000046c
 11c:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 120:	|  |  |                                                                 |  |     |  |  |  |      0000045c 	.word	0x0000045c
 124:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 128:	|  |  |                                                                 |  |     |  |  |  |      00000440 	.word	0x00000440
 12c:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 130:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 134:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 138:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 13c:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 140:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 144:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 148:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 14c:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 150:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 154:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 158:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 15c:	|  |  |                                                                 |  |     |  |  |  |      00000198 	.word	0x00000198
 160:	|  |  |                                                                 |  |     |  |  |  |      0000018c 	.word	0x0000018c
                                        ;        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 164:	|  |  |                                                                 |  |     |  |  |  |      e3811001 	orr	r1, r1, #1
                                        ;    } while (n);
 168:	|  |  |                                                                 |  |     |  |  |  +----- eaffffc0 	b	70 <_ZN3LogILm1048576EE6printfEPKcz+0x70>
                                        ;        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 16c:	|  |  |                                                                 |  |     |  |  |  |      e3811002 	orr	r1, r1, #2
                                        ;    } while (n);
 170:	|  |  |                                                                 |  |     |  |  |  +----- eaffffbe 	b	70 <_ZN3LogILm1048576EE6printfEPKcz+0x70>
                                        ;        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 174:	|  |  |                                                                 |  |     |  |  |  |      e3811004 	orr	r1, r1, #4
                                        ;    } while (n);
 178:	|  |  |                                                                 |  |     |  |  |  +----- eaffffbc 	b	70 <_ZN3LogILm1048576EE6printfEPKcz+0x70>
                                        ;        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 17c:	|  |  |                                                                 |  |     |  |  |  |      e3811010 	orr	r1, r1, #16
                                        ;    } while (n);
 180:	|  |  |                                                                 |  |     |  |  |  +----- eaffffba 	b	70 <_ZN3LogILm1048576EE6printfEPKcz+0x70>
                                        ;        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 184:	|  |  |                                                                 |  |     |  |  |  |      e3811008 	orr	r1, r1, #8
                                        ;    } while (n);
 188:	|  |  |                                                                 |  |     |  |  |  \----- eaffffb8 	b	70 <_ZN3LogILm1048576EE6printfEPKcz+0x70>
                                        ;    switch (*format) {
 18c:	|  |  |                                                                 |  |     |  |  |         e5d40001 	ldrb	r0, [r4, #1]
                                        ;        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 190:	|  |  |                                                                 |  |  /--|--|--|-------> e3811c01 	orr	r1, r1, #256	; 0x100
                                        ;        format++;
 194:	|  |  |                                                                 |  |  |  |  |  |         e2844001 	add	r4, r4, #1
                                        ;    switch (*format) {
 198:	|  |  |                                                                 >--|--|--|--|--|-------> e2403025 	sub	r3, r0, #37	; 0x25
 19c:	|  |  |                                                                 |  |  |  |  |  |         e3530053 	cmp	r3, #83	; 0x53
 1a0:	|  |  |                                                                 |  |  |  |  |  |         979ff103 	ldrls	pc, [pc, r3, lsl #2]
 1a4:	|  |  |                                                                 |  |  |  |  |  |  /----- ea000077 	b	388 <_ZN3LogILm1048576EE6printfEPKcz+0x388>
 1a8:	|  |  |                                                                 |  |  |  |  |  |  |      00000524 	.word	0x00000524
 1ac:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1b0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1b4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1b8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1bc:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1c0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1c4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1c8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1cc:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1d0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1d4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1d8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1dc:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1e0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1e4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1e8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1ec:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1f0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1f4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1f8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 1fc:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 200:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 204:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 208:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 20c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 210:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 214:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 218:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 21c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 220:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 224:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 228:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 22c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 230:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 234:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 238:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 23c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 240:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 244:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 248:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 24c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 250:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 254:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 258:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 25c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 260:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 264:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 268:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 26c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 270:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 274:	|  |  |                                                                 |  |  |  |  |  |  |      000003a4 	.word	0x000003a4
 278:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 27c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 280:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 284:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 288:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 28c:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 290:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 294:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 298:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 29c:	|  |  |                                                                 |  |  |  |  |  |  |      000003a4 	.word	0x000003a4
 2a0:	|  |  |                                                                 |  |  |  |  |  |  |      000004cc 	.word	0x000004cc
 2a4:	|  |  |                                                                 |  |  |  |  |  |  |      000003a4 	.word	0x000003a4
 2a8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2ac:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2b0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2b4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2b8:	|  |  |                                                                 |  |  |  |  |  |  |      000003a4 	.word	0x000003a4
 2bc:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2c0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2c4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2c8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2cc:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2d0:	|  |  |                                                                 |  |  |  |  |  |  |      000003a4 	.word	0x000003a4
 2d4:	|  |  |                                                                 |  |  |  |  |  |  |      0000048c 	.word	0x0000048c
 2d8:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2dc:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2e0:	|  |  |                                                                 |  |  |  |  |  |  |      00000544 	.word	0x00000544
 2e4:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2e8:	|  |  |                                                                 |  |  |  |  |  |  |      000003a4 	.word	0x000003a4
 2ec:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2f0:	|  |  |                                                                 |  |  |  |  |  |  |      00000388 	.word	0x00000388
 2f4:	|  |  |                                                                 |  |  |  |  |  |  |      000003a4 	.word	0x000003a4
                                        ;  unsigned int i = 0U;
 2f8:	|  |  |                                                                 |  |  |  |  \--|--|----> e3a06000 	mov	r6, #0
                                        ;    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 2fc:	|  |  |                                                                 |  |  |  |     |  |      e3a0200a 	mov	r2, #10
 300:	|  |  |                                                                 |  |  |  |     |  |  /-> e0260692 	mla	r6, r2, r6, r0
                                        ;  while (_is_digit(**str)) {
 304:	|  |  |                                                                 |  |  |  |     |  |  |   e5f40001 	ldrb	r0, [r4, #1]!
                                        ;    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 308:	|  |  |                                                                 |  |  |  |     |  |  |   e2466030 	sub	r6, r6, #48	; 0x30
                                        ;  while (_is_digit(**str)) {
 30c:	|  |  |                                                                 |  |  |  |     |  |  |   e2403030 	sub	r3, r0, #48	; 0x30
 310:	|  |  |                                                                 |  |  |  |     |  |  |   e3530009 	cmp	r3, #9
 314:	|  |  |                                                                 |  |  |  |     |  |  \-- 9afffff9 	bls	300 <_ZN3LogILm1048576EE6printfEPKcz+0x300>
                                        ;    if (*format == '.') {
 318:	|  |  |                                                                 |  |  |  |     |  |      e350002e 	cmp	r0, #46	; 0x2e
 31c:	|  |  |                                                                 |  |  |  +-----|--|----- 1affff78 	bne	104 <_ZN3LogILm1048576EE6printfEPKcz+0x104>
                                        ;      if (_is_digit(*format)) {
 320:	|  |  |                                                                 |  |  |  |     \--|----> e5d40001 	ldrb	r0, [r4, #1]
                                        ;      flags |= FLAGS_PRECISION;
 324:	|  |  |                                                                 |  |  |  |        |      e3811b01 	orr	r1, r1, #1024	; 0x400
                                        ;      format++;
 328:	|  |  |                                                                 |  |  |  |        |      e2843001 	add	r3, r4, #1
                                        ;      if (_is_digit(*format)) {
 32c:	|  |  |                                                                 |  |  |  |        |      e2402030 	sub	r2, r0, #48	; 0x30
 330:	|  |  |                                                                 |  |  |  |        |      e3520009 	cmp	r2, #9
 334:	|  |  |                                            /--------------------|--|--|--|--------|----- 9a0000bf 	bls	638 <_ZN3LogILm1048576EE6printfEPKcz+0x638>
                                        ;      else if (*format == '*') {
 338:	|  |  |                                            |                    |  |  |  |        |      e350002a 	cmp	r0, #42	; 0x2a
                                        ;      format++;
 33c:	|  |  |                                            |                    |  |  |  |        |      11a04003 	movne	r4, r3
                                        ;      else if (*format == '*') {
 340:	|  |  |                                            |                    |  |  |  \--------|----- 1affff6f 	bne	104 <_ZN3LogILm1048576EE6printfEPKcz+0x104>
                                        ;        precision = prec > 0 ? (unsigned int)prec : 0U;
 344:	|  |  |                                            |                    |  |  |           |      e4989004 	ldr	r9, [r8], #4
                                        ;        format++;
 348:	|  |  |                                            |                    |  |  |           |      e2844002 	add	r4, r4, #2
                                        ;    switch (*format) {
 34c:	|  |  |                                            |                    |  |  |           |      e5d40000 	ldrb	r0, [r4]
                                        ;        precision = prec > 0 ? (unsigned int)prec : 0U;
 350:	|  |  |                                            |                    |  |  |           |      e1c99fc9 	bic	r9, r9, r9, asr #31
                                        ;        format++;
 354:	|  |  +--------------------------------------------|--------------------|--|--|-----------|----- eaffff6b 	b	108 <_ZN3LogILm1048576EE6printfEPKcz+0x108>
 358:	|  |  |                                            |                    |  \--|-----------|----> e3e02001 	mvn	r2, #1
 35c:	|  |  |                                            |                    |     |           |      e1550002 	cmp	r5, r2
 360:	|  |  |                                            |                    |     |           |      31a02005 	movcc	r2, r5
                                        ;        break;
                                        ;    }
                                        ;  }
                                        ;
                                        ;  // termination
                                        ;  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 364:	|  |  |                             /--------------|--------------------|-----|-----------|----> e3e03000 	mvn	r3, #0
 368:	|  |  |                             |              |                    |     |           |      e1a01007 	mov	r1, r7
 36c:	|  |  |                             |              |                    |     |           |      e3a00000 	mov	r0, #0
 370:	|  |  |                             |              |                    |     |           |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;	  const int ret = _vsnprintf(_out_Log, (char *)this, (size_t)-1, format, va);
                                        ;	  va_end(va);
                                        ;	  return ret;
                                        ;	}	
 374:	|  |  |                             |              |                    |     |           |      e1a00005 	mov	r0, r5
 378:	|  |  |                             |              |                    |     |           |      e28dd030 	add	sp, sp, #48	; 0x30
 37c:	|  |  |                             |              |                    |     |           |      e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 380:	|  |  |                             |              |                    |     |           |      e28dd00c 	add	sp, sp, #12
 384:	|  |  |                             |              |                    |     |           |      e12fff1e 	bx	lr
                                        ;        out(*format, buffer, idx++, maxlen);
 388:	|  |  |                             |              |                    |     |           \----> e1a02005 	mov	r2, r5
 38c:	|  |  |                             |              |                    |     |                  e3e03000 	mvn	r3, #0
 390:	|  |  |                             |              |                    |     |                  e1a01007 	mov	r1, r7
                                        ;        format++;
 394:	|  |  |                             |              |                    |     |                  e2844001 	add	r4, r4, #1
                                        ;        out(*format, buffer, idx++, maxlen);
 398:	|  |  |                             |              |                    |     |                  e2855001 	add	r5, r5, #1
 39c:	|  |  |                             |              |                    |     |              /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;        break;
 3a0:	+--|--|-----------------------------|--------------|--------------------|-----|----------------- eaffff2b 	b	54 <_ZN3LogILm1048576EE6printfEPKcz+0x54>
                                        ;        if (*format == 'x' || *format == 'X') {
 3a4:	|  |  |                             |              |                    |     |                  e3500078 	cmp	r0, #120	; 0x78
 3a8:	|  |  |                             |  /-----------|--------------------|-----|----------------- 0a0000db 	beq	71c <_ZN3LogILm1048576EE6printfEPKcz+0x71c>
 3ac:	|  |  |                             |  |           |                    |     |                  e3500058 	cmp	r0, #88	; 0x58
 3b0:	|  |  |                             |  |           |  /-----------------|-----|----------------- 0a0000b7 	beq	694 <_ZN3LogILm1048576EE6printfEPKcz+0x694>
                                        ;        else if (*format == 'o') {
 3b4:	|  |  |                             |  |           |  |                 |     |                  e350006f 	cmp	r0, #111	; 0x6f
 3b8:	|  |  |              /--------------|--|-----------|--|-----------------|-----|----------------- 0a000106 	beq	7d8 <_ZN3LogILm1048576EE6printfEPKcz+0x7d8>
                                        ;        else if (*format == 'b') {
 3bc:	|  |  |              |              |  |           |  |                 |     |                  e3500062 	cmp	r0, #98	; 0x62
 3c0:	|  |  |        /-----|--------------|--|-----------|--|-----------------|-----|----------------- 0a00010d 	beq	7fc <_ZN3LogILm1048576EE6printfEPKcz+0x7fc>
                                        ;          flags &= ~FLAGS_HASH;   // no hash for dec format
 3c4:	|  |  |        |     |              |  |           |  |                 |     |                  e3c1c010 	bic	ip, r1, #16
                                        ;        if ((*format != 'i') && (*format != 'd')) {
 3c8:	|  |  |        |     |              |  |           |  |                 |     |                  e3500069 	cmp	r0, #105	; 0x69
                                        ;          base = 10U;
 3cc:	|  |  |        |     |              |  |           |  |                 |     |                  e3a0e00a 	mov	lr, #10
                                        ;        if ((*format != 'i') && (*format != 'd')) {
 3d0:	|  |  |        |     |     /--------|--|-----------|--|-----------------|-----|----------------- 1a000102 	bne	7e0 <_ZN3LogILm1048576EE6printfEPKcz+0x7e0>
                                        ;        if (flags & FLAGS_PRECISION) {
 3d4:	|  |  |        |     |  /--|--------|--|-----------|--|-----------------|-----|----------------> e31c0b01 	tst	ip, #1024	; 0x400
 3d8:	|  |  |        |     |  |  |        |  |           |  |  /--------------|-----|----------------- 0a0000b3 	beq	6ac <_ZN3LogILm1048576EE6printfEPKcz+0x6ac>
                                        ;          flags &= ~FLAGS_ZEROPAD;
 3dc:	|  |  |        |     |  |  |        |  |     /-----|--|--|--------------|-----|----------------> e3ccc001 	bic	ip, ip, #1
                                        ;        if ((*format == 'i') || (*format == 'd')) {
 3e0:	|  |  |        |     |  |  |        |  |  /--|-----|--|--|--------------|-----|----------------> e3500069 	cmp	r0, #105	; 0x69
 3e4:	|  |  |        |     |  |  |        |  |  |  |     |  |  |              |     |                  13500064 	cmpne	r0, #100	; 0x64
 3e8:	|  |  |        |     |  |  |        |  |  |  |     |  |  +--------------|-----|----------------- 0a0000af 	beq	6ac <_ZN3LogILm1048576EE6printfEPKcz+0x6ac>
                                        ;          if (flags & FLAGS_LONG_LONG) {
 3ec:	|  |  |        |     |  |  |        |  |  |  |     |  |  |  /-----------|-----|----------------> e21c1c02 	ands	r1, ip, #512	; 0x200
 3f0:	|  |  |  /-----|-----|--|--|--------|--|--|--|-----|--|--|--|-----------|-----|----------------- 1a000010 	bne	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;          else if (flags & FLAGS_LONG) {
 3f4:	|  |  |  |     |     |  |  |        |  |  |  |     |  |  |  |           |     |                  e31c0c01 	tst	ip, #256	; 0x100
 3f8:	|  |  |  |  /--|-----|--|--|--------|--|--|--|-----|--|--|--|-----------|-----|----------------- 1a000110 	bne	840 <_ZN3LogILm1048576EE6printfEPKcz+0x840>
                                        ;            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 3fc:	|  |  |  |  |  |     |  |  |        |  |  |  |     |  |  |  |           |     |                  e4983004 	ldr	r3, [r8], #4
 400:	|  |  |  |  |  |     |  |  |        |  |  |  |     |  |  |  |           |     |                  e31c0040 	tst	ip, #64	; 0x40
 404:	|  |  |  |  |  |     |  |  |        |  |  |  |     |  |  |  |           |     |                  16ef3073 	uxtbne	r3, r3
 408:	|  |  |  |  |  |     |  |  |     /--|--|--|--|-----|--|--|--|-----------|-----|----------------- 0a0000f8 	beq	7f0 <_ZN3LogILm1048576EE6printfEPKcz+0x7f0>
                                        ;            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 40c:	|  |  |  |  |  |     |  |  |  /--|--|--|--|--|-----|--|--|--|-----------|-----|----------------> e58dc010 	str	ip, [sp, #16]
 410:	|  |  |  |  |  |     |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e1a02005 	mov	r2, r5
 414:	|  |  |  |  |  |     |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e58d600c 	str	r6, [sp, #12]
 418:	|  |  |  |  |  |     |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e3a01000 	mov	r1, #0
 41c:	|  |  |  |  |  |     |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e58d9008 	str	r9, [sp, #8]
 420:	|  |  |  |  |  |     |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e58de004 	str	lr, [sp, #4]
 424:	|  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|-----|--|--|--|-----------|-----|----------------> e58d1000 	str	r1, [sp]
 428:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e1a01007 	mov	r1, r7
 42c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e59d001c 	ldr	r0, [sp, #28]
 430:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |     |              /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
 434:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e1a05000 	mov	r5, r0
                                        ;        format++;
 438:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|-----------|-----|----------------> e2844001 	add	r4, r4, #1
                                        ;        break;
 43c:	+--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|-----------|-----|----------------- eaffff04 	b	54 <_ZN3LogILm1048576EE6printfEPKcz+0x54>
                                        ;        if (*format == 'l') {
 440:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e5d40001 	ldrb	r0, [r4, #1]
 444:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |     |                  e350006c 	cmp	r0, #108	; 0x6c
 448:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |     \----------------- 1affff50 	bne	190 <_ZN3LogILm1048576EE6printfEPKcz+0x190>
                                        ;    switch (*format) {
 44c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e5d40002 	ldrb	r0, [r4, #2]
                                        ;          flags |= FLAGS_LONG_LONG;
 450:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e3811c03 	orr	r1, r1, #768	; 0x300
                                        ;          format++;
 454:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e2844002 	add	r4, r4, #2
 458:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           +----------------------- eaffff4e 	b	198 <_ZN3LogILm1048576EE6printfEPKcz+0x198>
                                        ;    switch (*format) {
 45c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e5d40001 	ldrb	r0, [r4, #1]
                                        ;        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 460:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e3811c02 	orr	r1, r1, #512	; 0x200
                                        ;        format++;
 464:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e2844001 	add	r4, r4, #1
                                        ;        break;
 468:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           +----------------------- eaffff4a 	b	198 <_ZN3LogILm1048576EE6printfEPKcz+0x198>
                                        ;        if (*format == 'h') {
 46c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e5d40001 	ldrb	r0, [r4, #1]
 470:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        e3500068 	cmp	r0, #104	; 0x68
                                        ;        flags |= FLAGS_SHORT;
 474:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        13811080 	orrne	r1, r1, #128	; 0x80
                                        ;        format++;
 478:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        12844001 	addne	r4, r4, #1
                                        ;    switch (*format) {
 47c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        05d40002 	ldrbeq	r0, [r4, #2]
                                        ;          flags |= FLAGS_CHAR;
 480:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        038110c0 	orreq	r1, r1, #192	; 0xc0
                                        ;          format++;
 484:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           |                        02844002 	addeq	r4, r4, #2
 488:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |           \----------------------- eaffff42 	b	198 <_ZN3LogILm1048576EE6printfEPKcz+0x198>
                                        ;          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 48c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e4983004 	ldr	r3, [r8], #4
                                        ;        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 490:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e3811021 	orr	r1, r1, #33	; 0x21
                                        ;          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 494:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e58d1010 	str	r1, [sp, #16]
 498:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e3a0a000 	mov	sl, #0
 49c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e59d001c 	ldr	r0, [sp, #28]
 4a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e3a01008 	mov	r1, #8
 4a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e58d100c 	str	r1, [sp, #12]
 4a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e3a0b010 	mov	fp, #16
 4ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e58d9008 	str	r9, [sp, #8]
 4b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e1a02005 	mov	r2, r5
 4b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e1a01007 	mov	r1, r7
                                        ;        format++;
 4b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e2844001 	add	r4, r4, #1
                                        ;          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 4bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e1cda0f0 	strd	sl, [sp]
 4c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
 4c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e1a05000 	mov	r5, r0
                                        ;        break;
 4c8:	+--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|----------------------------------- eafffee1 	b	54 <_ZN3LogILm1048576EE6printfEPKcz+0x54>
                                        ;        if (!(flags & FLAGS_LEFT)) {
 4cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |                                    e3110002 	tst	r1, #2
 4d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /-------------------------------- 0a000099 	beq	73c <_ZN3LogILm1048576EE6printfEPKcz+0x73c>
                                        ;        out((char)va_arg(va, int), buffer, idx++, maxlen);
 4d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e4980004 	ldr	r0, [r8], #4
 4d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e1a02005 	mov	r2, r5
 4dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e3e03000 	mvn	r3, #0
 4e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e1a01007 	mov	r1, r7
 4e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e6ef0070 	uxtb	r0, r0
 4e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e2859001 	add	r9, r5, #1
 4ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                             /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;          while (l++ < width) {
 4f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e3560001 	cmp	r6, #1
 4f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 91a05009 	movls	r5, r9
 4f8:	|  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-------------------------------- 9affffce 	bls	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
 4fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e0855006 	add	r5, r5, r6
                                        ;            out(' ', buffer, idx++, maxlen);
 500:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          /----> e1a02009 	mov	r2, r9
 504:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          |      e3e03000 	mvn	r3, #0
 508:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          |      e2899001 	add	r9, r9, #1
 50c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          |      e1a01007 	mov	r1, r7
 510:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          |      e3a00020 	mov	r0, #32
 514:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;          while (l++ < width) {
 518:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          |      e1590005 	cmp	r9, r5
 51c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                          \----- 1afffff7 	bne	500 <_ZN3LogILm1048576EE6printfEPKcz+0x500>
 520:	|  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-------------------------------- eaffffc4 	b	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;        out('%', buffer, idx++, maxlen);
 524:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e1a02005 	mov	r2, r5
 528:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e3e03000 	mvn	r3, #0
 52c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e1a01007 	mov	r1, r7
 530:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e3a00025 	mov	r0, #37	; 0x25
                                        ;        format++;
 534:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e2844001 	add	r4, r4, #1
                                        ;        out('%', buffer, idx++, maxlen);
 538:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e2855001 	add	r5, r5, #1
 53c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                             /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;        break;
 540:	+--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-------------------------------- eafffec3 	b	54 <_ZN3LogILm1048576EE6printfEPKcz+0x54>
                                        ;        const char* p = va_arg(va, char*);
 544:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e498b004 	ldr	fp, [r8], #4
                                        ;        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 548:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e3590000 	cmp	r9, #0
                                        ;  for (s = str; *s && maxsize--; ++s);
 54c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                                 e5db0000 	ldrb	r0, [fp]
                                        ;        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 550:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |        /----------------------- 1a000042 	bne	660 <_ZN3LogILm1048576EE6printfEPKcz+0x660>
                                        ;  for (s = str; *s && maxsize--; ++s);
 554:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |        |                        e3500000 	cmp	r0, #0
 558:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |        |                        01a0a009 	moveq	sl, r9
 55c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--------|----------------------- 0a00000a 	beq	58c <_ZN3LogILm1048576EE6printfEPKcz+0x58c>
 560:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                        e3e02001 	mvn	r2, #1
 564:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  /-------------------> e2822001 	add	r2, r2, #1
                                        ;        const char* p = va_arg(va, char*);
 568:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                     e1a0a00b 	mov	sl, fp
 56c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                     e08b2002 	add	r2, fp, r2
 570:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                 /-- ea000001 	b	57c <_ZN3LogILm1048576EE6printfEPKcz+0x57c>
                                        ;  for (s = str; *s && maxsize--; ++s);
 574:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |              /--|-> e15a0002 	cmp	sl, r2
 578:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           /--|--|-- 0a000002 	beq	588 <_ZN3LogILm1048576EE6printfEPKcz+0x588>
 57c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  \-> e5fa3001 	ldrb	r3, [sl, #1]!
 580:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |      e3530000 	cmp	r3, #0
 584:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  \----- 1afffffa 	bne	574 <_ZN3LogILm1048576EE6printfEPKcz+0x574>
                                        ;  return (unsigned int)(s - str);
 588:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           \-------> e04aa00b 	sub	sl, sl, fp
                                        ;        if (flags & FLAGS_PRECISION) {
 58c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|-------------------> e2113b01 	ands	r3, r1, #1024	; 0x400
 590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                     e58d3020 	str	r3, [sp, #32]
 594:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                 /-- 0a000001 	beq	5a0 <_ZN3LogILm1048576EE6printfEPKcz+0x5a0>
                                        ;          l = (l < precision ? l : precision);
 598:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                 |   e15a0009 	cmp	sl, r9
 59c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                 |   21a0a009 	movcs	sl, r9
                                        ;        if (!(flags & FLAGS_LEFT)) {
 5a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                 \-> e2113002 	ands	r3, r1, #2
 5a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |                     e58d3024 	str	r3, [sp, #36]	; 0x24
 5a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|-------------------- 0a000078 	beq	790 <_ZN3LogILm1048576EE6printfEPKcz+0x790>
                                        ;        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 5ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |                     e3500000 	cmp	r0, #0
 5b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |        /----------- 0a000012 	beq	600 <_ZN3LogILm1048576EE6printfEPKcz+0x600>
 5b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--------|----------> e59d3020 	ldr	r3, [sp, #32]
 5b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |            e3530000 	cmp	r3, #0
 5bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|----------- 0a00002b 	beq	670 <_ZN3LogILm1048576EE6printfEPKcz+0x670>
 5c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |            e0899005 	add	r9, r9, r5
                                        ;  for (s = str; *s && maxsize--; ++s);
 5c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |            e1a02005 	mov	r2, r5
 5c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     /----- ea000005 	b	5e4 <_ZN3LogILm1048576EE6printfEPKcz+0x5e4>
                                        ;          out(*(p++), buffer, idx++, maxlen);
 5cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  /--|----> e2855001 	add	r5, r5, #1
 5d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 5d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |      e5fb0001 	ldrb	r0, [fp, #1]!
                                        ;          out(*(p++), buffer, idx++, maxlen);
 5d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |      e1a02005 	mov	r2, r5
                                        ;        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 5dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |      e3500000 	cmp	r0, #0
 5e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|----- 0a000003 	beq	5f4 <_ZN3LogILm1048576EE6printfEPKcz+0x5f4>
 5e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> e1590005 	cmp	r9, r5
                                        ;          out(*(p++), buffer, idx++, maxlen);
 5e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         e3e03000 	mvn	r3, #0
 5ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         e1a01007 	mov	r1, r7
                                        ;        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 5f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------- 1afffff5 	bne	5cc <_ZN3LogILm1048576EE6printfEPKcz+0x5cc>
                                        ;        if (flags & FLAGS_LEFT) {
 5f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|----------> e59d3024 	ldr	r3, [sp, #36]	; 0x24
 5f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            e3530000 	cmp	r3, #0
 5fc:	|  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----------- 0affff8d 	beq	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;          while (l++ < width) {
 600:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----------> e156000a 	cmp	r6, sl
 604:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               e1a09005 	mov	r9, r5
 608:	|  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------- 9affff8a 	bls	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
 60c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               e0855006 	add	r5, r5, r6
 610:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               e045500a 	sub	r5, r5, sl
                                        ;            out(' ', buffer, idx++, maxlen);
 614:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /----> e1a02009 	mov	r2, r9
 618:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      e3e03000 	mvn	r3, #0
 61c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      e2899001 	add	r9, r9, #1
 620:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      e1a01007 	mov	r1, r7
 624:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      e3a00020 	mov	r0, #32
 628:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;          while (l++ < width) {
 62c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      e1590005 	cmp	r9, r5
 630:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        \----- 1afffff7 	bne	614 <_ZN3LogILm1048576EE6printfEPKcz+0x614>
 634:	|  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------- eaffff7f 	b	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;  unsigned int i = 0U;
 638:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|-------------> e3a09000 	mov	r9, #0
                                        ;    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 63c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |               e3a0c00a 	mov	ip, #10
 640:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |           /-> e029099c 	mla	r9, ip, r9, r0
                                        ;  while (_is_digit(**str)) {
 644:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |           |   e5f30001 	ldrb	r0, [r3, #1]!
                                        ;    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 648:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |           |   e2499030 	sub	r9, r9, #48	; 0x30
                                        ;  while (_is_digit(**str)) {
 64c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |           |   e2402030 	sub	r2, r0, #48	; 0x30
 650:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |           |   e3520009 	cmp	r2, #9
 654:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |           \-- 9afffff9 	bls	640 <_ZN3LogILm1048576EE6printfEPKcz+0x640>
 658:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |               e1a04003 	mov	r4, r3
 65c:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|-------------- eafffea9 	b	108 <_ZN3LogILm1048576EE6printfEPKcz+0x108>
                                        ;  for (s = str; *s && maxsize--; ++s);
 660:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  \--|--|--|-------------> e3500000 	cmp	r0, #0
 664:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  /--|--|--|-------------- 0a00007c 	beq	85c <_ZN3LogILm1048576EE6printfEPKcz+0x85c>
 668:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |               e2492001 	sub	r2, r9, #1
 66c:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  \--|--|-------------- eaffffbc 	b	564 <_ZN3LogILm1048576EE6printfEPKcz+0x564>
                                        ;          out(*(p++), buffer, idx++, maxlen);
 670:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     >--|-------------> e1a02005 	mov	r2, r5
 674:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |               e3e03000 	mvn	r3, #0
 678:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |               e1a01007 	mov	r1, r7
 67c:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |               e2855001 	add	r5, r5, #1
 680:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |           /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 684:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |               e5fb0001 	ldrb	r0, [fp, #1]!
 688:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     |  |               e3500000 	cmp	r0, #0
 68c:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |     \--|-------------- 1afffff7 	bne	670 <_ZN3LogILm1048576EE6printfEPKcz+0x670>
 690:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-------------- eaffffd7 	b	5f4 <_ZN3LogILm1048576EE6printfEPKcz+0x5f4>
                                        ;          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 694:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |     \--|--|--|--|--|--|----------------------> e3c1c00c 	bic	ip, r1, #12
                                        ;        if (flags & FLAGS_PRECISION) {
 698:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                        e3110b01 	tst	r1, #1024	; 0x400
                                        ;          base = 16U;
 69c:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                        e3a0e010 	mov	lr, #16
                                        ;          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 6a0:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                        e38cc020 	orr	ip, ip, #32
                                        ;        if (flags & FLAGS_PRECISION) {
 6a4:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  +--|--------|--|--|--|--|--|----------------------- 1affff4c 	bne	3dc <_ZN3LogILm1048576EE6printfEPKcz+0x3dc>
 6a8:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  \--|--|--|--|----------------------- eaffff4f 	b	3ec <_ZN3LogILm1048576EE6printfEPKcz+0x3ec>
                                        ;          if (flags & FLAGS_LONG_LONG) {
 6ac:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |        \-----|--|--|--|----------------------> e31c0c02 	tst	ip, #512	; 0x200
 6b0:	|  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--------------|--|--|--|----------------------- 1affff60 	bne	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;          else if (flags & FLAGS_LONG) {
 6b4:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |                        e31c0c01 	tst	ip, #256	; 0x100
 6b8:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  /-------------------- 1a000051 	bne	804 <_ZN3LogILm1048576EE6printfEPKcz+0x804>
                                        ;            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 6bc:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e4982004 	ldr	r2, [r8], #4
 6c0:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e31c0040 	tst	ip, #64	; 0x40
 6c4:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     16ef2072 	uxtbne	r2, r2
 6c8:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     11a03002 	movne	r3, r2
 6cc:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 /-- 1a000006 	bne	6ec <_ZN3LogILm1048576EE6printfEPKcz+0x6ec>
 6d0:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 |   e31c0080 	tst	ip, #128	; 0x80
                                        ;            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 6d4:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 |   00223fc2 	eoreq	r3, r2, r2, asr #31
                                        ;            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 6d8:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 |   16bf2072 	sxthne	r2, r2
                                        ;            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 6dc:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 |   00433fc2 	subeq	r3, r3, r2, asr #31
 6e0:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 |   10223fc2 	eorne	r3, r2, r2, asr #31
 6e4:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 |   10433fc2 	subne	r3, r3, r2, asr #31
 6e8:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 |   16ff3073 	uxthne	r3, r3
 6ec:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 \-> e1a02fa2 	lsr	r2, r2, #31
 6f0:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e1a01007 	mov	r1, r7
 6f4:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e58d2000 	str	r2, [sp]
 6f8:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e1a02005 	mov	r2, r5
 6fc:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e59d001c 	ldr	r0, [sp, #28]
 700:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e58dc010 	str	ip, [sp, #16]
 704:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e58d600c 	str	r6, [sp, #12]
 708:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e58d9008 	str	r9, [sp, #8]
 70c:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e58de004 	str	lr, [sp, #4]
 710:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                 /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
 714:	|  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |                     e1a05000 	mov	r5, r0
 718:	|  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--------------|--|--|--|--|-------------------- eaffff46 	b	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;          base = 16U;
 71c:	|  |     |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------|--|--|--|--|-------------------> e3a0e010 	mov	lr, #16
                                        ;          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 720:	|  |     |  |  |  |  |  |  |  |  |  |     |  |  |              |  |  |  |  |           /-------> e3c1c00c 	bic	ip, r1, #12
                                        ;        if (flags & FLAGS_PRECISION) {
 724:	|  |     |  |  |  |  |  |  |  |  |  |     |  |  |              |  |  |  |  |           |         e3110b01 	tst	r1, #1024	; 0x400
 728:	|  |     |  |  |  |  |  |  |  |  |  |     |  \--|--------------|--|--|--|--|-----------|-------- 1affff2b 	bne	3dc <_ZN3LogILm1048576EE6printfEPKcz+0x3dc>
 72c:	|  |     |  |  |  |  |  |  |  |  |  |     \-----|--------------|--|--|--|--|-----------|-------- eaffff2b 	b	3e0 <_ZN3LogILm1048576EE6printfEPKcz+0x3e0>
                                        ;  while (*format)
 730:	|  \-----|--|--|--|--|--|--|--|--|--|-----------|--------------|--|--|--|--|-----------|-------> e1a02000 	mov	r2, r0
 734:	|        |  |  |  |  |  |  |  |  |  |           |              |  |  |  |  |           |         e1a05000 	mov	r5, r0
 738:	|        |  |  |  |  |  |  |  |  |  \-----------|--------------|--|--|--|--|-----------|-------- eaffff09 	b	364 <_ZN3LogILm1048576EE6printfEPKcz+0x364>
                                        ;          while (l++ < width) {
 73c:	|        |  |  |  |  |  |  |  |  |              |              \--|--|--|--|-----------|-------> e3560001 	cmp	r6, #1
 740:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  /--------|-------- 9a000049 	bls	86c <_ZN3LogILm1048576EE6printfEPKcz+0x86c>
 744:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |         e2453001 	sub	r3, r5, #1
 748:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |         e0836006 	add	r6, r3, r6
                                        ;            out(' ', buffer, idx++, maxlen);
 74c:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  /----> e1a02005 	mov	r2, r5
 750:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  |      e3e03000 	mvn	r3, #0
 754:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  |      e2855001 	add	r5, r5, #1
 758:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  |      e1a01007 	mov	r1, r7
 75c:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  |      e3a00020 	mov	r0, #32
 760:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;          while (l++ < width) {
 764:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  |      e1550006 	cmp	r5, r6
 768:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |        |  \----- 1afffff7 	bne	74c <_ZN3LogILm1048576EE6printfEPKcz+0x74c>
                                        ;        out((char)va_arg(va, int), buffer, idx++, maxlen);
 76c:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  /-----|-------> e4980004 	ldr	r0, [r8], #4
 770:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  |     |         e3e03000 	mvn	r3, #0
 774:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  |     |         e1a02006 	mov	r2, r6
 778:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  |     |         e1a01007 	mov	r1, r7
 77c:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  |     |         e6ef0070 	uxtb	r0, r0
 780:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  |     |         e2865001 	add	r5, r6, #1
                                        ;        format++;
 784:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  |     |         e2844001 	add	r4, r4, #1
                                        ;        out((char)va_arg(va, int), buffer, idx++, maxlen);
 788:	|        |  |  |  |  |  |  |  |  |              |                 |  |  |  |  |  |     |     /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;        break;
 78c:	\--------|--|--|--|--|--|--|--|--|--------------|-----------------|--|--|--|--|--|-----|-------- eafffe30 	b	54 <_ZN3LogILm1048576EE6printfEPKcz+0x54>
                                        ;          while (l++ < width) {
 790:	         |  |  |  |  |  |  |  |  |              |                 |  \--|--|--|--|-----|-------> e156000a 	cmp	r6, sl
 794:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |     |         e28a3001 	add	r3, sl, #1
 798:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  /--|-------- 9a000031 	bls	864 <_ZN3LogILm1048576EE6printfEPKcz+0x864>
 79c:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |         e0863005 	add	r3, r6, r5
 7a0:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |         e043a00a 	sub	sl, r3, sl
                                        ;            out(' ', buffer, idx++, maxlen);
 7a4:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  /----> e1a02005 	mov	r2, r5
 7a8:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  |      e3e03000 	mvn	r3, #0
 7ac:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  |      e2855001 	add	r5, r5, #1
 7b0:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  |      e1a01007 	mov	r1, r7
 7b4:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  |      e3a00020 	mov	r0, #32
 7b8:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
                                        ;          while (l++ < width) {
 7bc:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  |      e155000a 	cmp	r5, sl
 7c0:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  \----- 1afffff7 	bne	7a4 <_ZN3LogILm1048576EE6printfEPKcz+0x7a4>
 7c4:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |         e5db0000 	ldrb	r0, [fp]
 7c8:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |         e286a001 	add	sl, r6, #1
                                        ;        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 7cc:	         |  |  |  |  |  |  |  |  |              |                 |     |  |  |  |  |  |  /----> e3500000 	cmp	r0, #0
 7d0:	         |  |  |  |  |  |  |  |  |              |                 \-----|--|--|--|--|--|--|----- 1affff77 	bne	5b4 <_ZN3LogILm1048576EE6printfEPKcz+0x5b4>
 7d4:	         +--|--|--|--|--|--|--|--|--------------|-----------------------|--|--|--|--|--|--|----- eaffff17 	b	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;          base =  8U;
 7d8:	         |  |  |  |  \--|--|--|--|--------------|-----------------------|--|--|--|--|--|--|----> e3a0e008 	mov	lr, #8
                                        ;        format++;
 7dc:	         |  |  |  |     |  |  |  |              |                       |  |  |  |  |  |  |  /-> e1a0c001 	mov	ip, r1
                                        ;        if ((*format != 'i') && (*format != 'd')) {
 7e0:	         |  |  |  |     |  \--|--|--------------|-----------------------|--|--|--|--|--|--|--|-> e3500064 	cmp	r0, #100	; 0x64
 7e4:	         |  |  |  |     |     |  |              |                       |  |  |  |  |  |  |  |   11a0100c 	movne	r1, ip
 7e8:	         |  |  |  |     \-----|--|--------------|-----------------------|--|--|--|--|--|--|--|-- 0afffef9 	beq	3d4 <_ZN3LogILm1048576EE6printfEPKcz+0x3d4>
 7ec:	         |  |  |  |           |  |              |                       |  |  |  |  |  \--|--|-- eaffffcb 	b	720 <_ZN3LogILm1048576EE6printfEPKcz+0x720>
                                        ;            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 7f0:	         |  |  |  |           |  \--------------|-----------------------|--|--|--|--|-----|--|-> e31c0080 	tst	ip, #128	; 0x80
 7f4:	         |  |  |  |           |                 |                       |  |  |  |  |     |  |   16ff3073 	uxthne	r3, r3
 7f8:	         |  |  |  |           \-----------------|-----------------------|--|--|--|--|-----|--|-- eaffff03 	b	40c <_ZN3LogILm1048576EE6printfEPKcz+0x40c>
                                        ;          base =  2U;
 7fc:	         |  |  \--|-----------------------------|-----------------------|--|--|--|--|-----|--|-> e3a0e002 	mov	lr, #2
 800:	         |  |     |                             |                       |  |  |  |  |     |  \-- eafffff5 	b	7dc <_ZN3LogILm1048576EE6printfEPKcz+0x7dc>
                                        ;            const long value = va_arg(va, long);
 804:	         |  |     |                             |                       |  \--|--|--|-----|----> e4983004 	ldr	r3, [r8], #4
                                        ;            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 808:	         |  |     |                             |                       |     |  |  |     |      e1a02005 	mov	r2, r5
 80c:	         |  |     |                             |                       |     |  |  |     |      e59d001c 	ldr	r0, [sp, #28]
 810:	         |  |     |                             |                       |     |  |  |     |      e1a01fa3 	lsr	r1, r3, #31
 814:	         |  |     |                             |                       |     |  |  |     |      e3530000 	cmp	r3, #0
 818:	         |  |     |                             |                       |     |  |  |     |      e58d1000 	str	r1, [sp]
 81c:	         |  |     |                             |                       |     |  |  |     |      b2633000 	rsblt	r3, r3, #0
 820:	         |  |     |                             |                       |     |  |  |     |      e58dc010 	str	ip, [sp, #16]
 824:	         |  |     |                             |                       |     |  |  |     |      e1a01007 	mov	r1, r7
 828:	         |  |     |                             |                       |     |  |  |     |      e58d600c 	str	r6, [sp, #12]
 82c:	         |  |     |                             |                       |     |  |  |     |      e58d9008 	str	r9, [sp, #8]
 830:	         |  |     |                             |                       |     |  |  |     |      e58de004 	str	lr, [sp, #4]
 834:	         |  |     |                             |                       |     |  |  |     |  /-- ebfffffe 	bl	0 <_ZN3LogILm1048576EE6printfEPKcz>
 838:	         |  |     |                             |                       |     |  |  |     |      e1a05000 	mov	r5, r0
 83c:	         \--|-----|-----------------------------|-----------------------|-----|--|--|-----|----- eafffefd 	b	438 <_ZN3LogILm1048576EE6printfEPKcz+0x438>
                                        ;            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 840:	            \-----|-----------------------------|-----------------------|-----|--|--|-----|----> e4983004 	ldr	r3, [r8], #4
 844:	                  |                             |                       |     |  |  |     |      e1a02005 	mov	r2, r5
 848:	                  |                             |                       |     |  |  |     |      e58dc010 	str	ip, [sp, #16]
 84c:	                  |                             |                       |     |  |  |     |      e58d600c 	str	r6, [sp, #12]
 850:	                  |                             |                       |     |  |  |     |      e58d9008 	str	r9, [sp, #8]
 854:	                  |                             |                       |     |  |  |     |      e58de004 	str	lr, [sp, #4]
 858:	                  \-----------------------------|-----------------------|-----|--|--|-----|----- eafffef1 	b	424 <_ZN3LogILm1048576EE6printfEPKcz+0x424>
                                        ;  for (s = str; *s && maxsize--; ++s);
 85c:	                                                |                       \-----|--|--|-----|----> e1a0a000 	mov	sl, r0
 860:	                                                \-----------------------------|--|--|-----|----- eaffff49 	b	58c <_ZN3LogILm1048576EE6printfEPKcz+0x58c>
                                        ;          while (l++ < width) {
 864:	                                                                              |  |  \-----|----> e1a0a003 	mov	sl, r3
 868:	                                                                              |  |        \----- eaffffd7 	b	7cc <_ZN3LogILm1048576EE6printfEPKcz+0x7cc>
                                        ;          while (l++ < width) {
 86c:	                                                                              \--|-------------> e1a06005 	mov	r6, r5
 870:	                                                                                 \-------------- eaffffbd 	b	76c <_ZN3LogILm1048576EE6printfEPKcz+0x76c>

Disassembly of section .text.startup:

00000000 <main>:
                                        ;	void init() { pos = 0; }
   0:	                   e3a03000 	mov	r3, #0
                                        ;extern "C" void main() {
                                        ;	
                                        ;	auto &mem = BSX::MEM();
                                        ;	auto &io = BSX::IO();
                                        ;
                                        ;	auto &log = *&mem.log;
   4:	                   e3a0145d 	mov	r1, #1560281088	; 0x5d000000
                                        ;extern "C" void main() {
   8:	                   e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
                                        ;	log.init();
                                        ;
                                        ;
                                        ;	
                                        ;	mem.mmu_l1_table.init_linear_mapping(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::DEVICE);
   c:	                   e1a0e003 	mov	lr, r3
  10:	                   e345e880 	movt	lr, #22656	; 0x5880
                                        ;
                                        ;				//bufferable may be an option too
                                        ;				tex = 2;
                                        ;				bufferable = 0;
                                        ;				cacheable = 0;
                                        ;				execute_never = 1;
  14:	                   e3027df0 	movw	r7, #11760	; 0x2df0
  18:	                   e3407001 	movt	r7, #1
  1c:	                   e308620f 	movw	r6, #33295	; 0x820f
  20:	                   e34f6ffa 	movt	r6, #65530	; 0xfffa
                                        ;extern "C" void main() {
  24:	                   e24dd010 	sub	sp, sp, #16
  28:	                   e5813000 	str	r3, [r1]
                                        ;			
                                        ;		Entry entries[4096];
                                        ;		
                                        ;		void init_linear_mapping(SectionType section_type, Preset preset) {
                                        ;			
                                        ;			for (uint32_t i=0; i<4096; i++) {
  2c:	                   e1a02003 	mov	r2, r3
                                        ;			raw = 0;
  30:	                   e1a05003 	mov	r5, r3
                                        ;			section_type = section_type_arg;
  34:	                   e1a0000e 	mov	r0, lr
  38:	   /-------------- ea000019 	b	a4 <main+0xa4>
                                        ;			} else if (section_type == SECTION) {
  3c:	   |  /----------> e3580002 	cmp	r8, #2
                                        ;				section_type = FAULT;
  40:	   |  |            17c13015 	bfine	r3, r5, #0, #2
                                        ;				Entry old_entry = *this;
  44:	   |  |            059e8000 	ldreq	r8, [lr]
                                        ;				raw = address;
  48:	   |  |            058c4000 	streq	r4, [ip]
                                        ;				pad_section = old_entry.pad_section;
  4c:	   |  |            07903102 	ldreq	r3, [r0, r2, lsl #2]
                                        ;				section_type = FAULT;
  50:	   |  |            17c03102 	strbne	r3, [r0, r2, lsl #2]
                                        ;				pad_section = old_entry.pad_section;
  54:	   |  |            07d33018 	bfieq	r3, r8, #0, #20
  58:	   |  |            07803102 	streq	r3, [r0, r2, lsl #2]
                                        ;			if (section_type == SUPERSECTION) {
  5c:	   |  |  /-------> e7d03102 	ldrb	r3, [r0, r2, lsl #2]
  60:	   |  |  |         e1a04a02 	lsl	r4, r2, #20
  64:	   |  |  |         e203c003 	and	ip, r3, #3
  68:	   |  |  |         e35c0003 	cmp	ip, #3
  6c:	   |  |  |  /----- 0a000028 	beq	114 <main+0x114>
                                        ;			} else if (section_type == SECTION) {
  70:	   |  |  |  |      e35c0002 	cmp	ip, #2
                                        ;			for (uint32_t i=0; i<4096; i++) {
  74:	   |  |  |  |      e28ee004 	add	lr, lr, #4
                                        ;				section_type = FAULT;
  78:	   |  |  |  |      17c1301f 	bfcne	r3, #0, #2
                                        ;				raw = address;
  7c:	   |  |  |  |      0281187f 	addeq	r1, r1, #8323072	; 0x7f0000
                                        ;				Entry old_entry = *this;
  80:	   |  |  |  |      051ec004 	ldreq	ip, [lr, #-4]
                                        ;				raw = address;
  84:	   |  |  |  |      05814000 	streq	r4, [r1]
                                        ;				pad_section = old_entry.pad_section;
  88:	   |  |  |  |      07903102 	ldreq	r3, [r0, r2, lsl #2]
                                        ;				section_type = FAULT;
  8c:	   |  |  |  |      17c03102 	strbne	r3, [r0, r2, lsl #2]
                                        ;				pad_section = old_entry.pad_section;
  90:	   |  |  |  |      07d3301c 	bfieq	r3, ip, #0, #20
  94:	   |  |  |  |      07803102 	streq	r3, [r0, r2, lsl #2]
                                        ;			for (uint32_t i=0; i<4096; i++) {
  98:	   |  |  |  |      e2822001 	add	r2, r2, #1
  9c:	   |  |  |  |      e3520a01 	cmp	r2, #4096	; 0x1000
  a0:	   |  |  |  |  /-- 0a000025 	beq	13c <main+0x13c>
                                        ;			uint32_t address = raw;
  a4:	   >--|--|--|--|-> e1a01102 	lsl	r1, r2, #2
  a8:	   |  |  |  |  |   e2811316 	add	r1, r1, #1476395008	; 0x58000000
  ac:	   |  |  |  |  |   e2811801 	add	r1, r1, #65536	; 0x10000
  b0:	   |  |  |  |  |   e281c87f 	add	ip, r1, #8323072	; 0x7f0000
  b4:	   |  |  |  |  |   e59c4000 	ldr	r4, [ip]
                                        ;			raw = 0;
  b8:	   |  |  |  |  |   e58c5000 	str	r5, [ip]
                                        ;			section_type = section_type_arg;
  bc:	   |  |  |  |  |   e7d03102 	ldrb	r3, [r0, r2, lsl #2]
  c0:	   |  |  |  |  |   e3833003 	orr	r3, r3, #3
  c4:	   |  |  |  |  |   e7c03102 	strb	r3, [r0, r2, lsl #2]
                                        ;			is_supersection = (section_type == SUPERSECTION);
  c8:	   |  |  |  |  |   e2033003 	and	r3, r3, #3
                                        ;				execute_never = 1;
  cc:	   |  |  |  |  |   e59c8000 	ldr	r8, [ip]
                                        ;			is_supersection = (section_type == SUPERSECTION);
  d0:	   |  |  |  |  |   e2433003 	sub	r3, r3, #3
  d4:	   |  |  |  |  |   e16f3f13 	clz	r3, r3
                                        ;				execute_never = 1;
  d8:	   |  |  |  |  |   e0088006 	and	r8, r8, r6
                                        ;			is_supersection = (section_type == SUPERSECTION);
  dc:	   |  |  |  |  |   e1a032a3 	lsr	r3, r3, #5
                                        ;				execute_never = 1;
  e0:	   |  |  |  |  |   e1873903 	orr	r3, r7, r3, lsl #18
  e4:	   |  |  |  |  |   e1833008 	orr	r3, r3, r8
  e8:	   |  |  |  |  |   e58c3000 	str	r3, [ip]
                                        ;			if (section_type == SUPERSECTION) {
  ec:	   |  |  |  |  |   e7d03102 	ldrb	r3, [r0, r2, lsl #2]
  f0:	   |  |  |  |  |   e2038003 	and	r8, r3, #3
  f4:	   |  |  |  |  |   e3580003 	cmp	r8, #3
  f8:	   |  \--|--|--|-- 1affffcf 	bne	3c <main+0x3c>
                                        ;				Entry old_entry = *this;
  fc:	   |     |  |  |   e59e8000 	ldr	r8, [lr]
                                        ;				raw = address;
 100:	   |     |  |  |   e58c4000 	str	r4, [ip]
                                        ;				pad_supersection = old_entry.pad_supersection;
 104:	   |     |  |  |   e7903102 	ldr	r3, [r0, r2, lsl #2]
 108:	   |     |  |  |   e7d73018 	bfi	r3, r8, #0, #24
 10c:	   |     |  |  |   e7803102 	str	r3, [r0, r2, lsl #2]
 110:	   |     \--|--|-- eaffffd1 	b	5c <main+0x5c>
                                        ;				Entry old_entry = *this;
 114:	   |        \--|-> e59ec000 	ldr	ip, [lr]
                                        ;				raw = address;
 118:	   |           |   e281187f 	add	r1, r1, #8323072	; 0x7f0000
                                        ;			for (uint32_t i=0; i<4096; i++) {
 11c:	   |           |   e28ee004 	add	lr, lr, #4
                                        ;				raw = address;
 120:	   |           |   e5814000 	str	r4, [r1]
                                        ;				pad_supersection = old_entry.pad_supersection;
 124:	   |           |   e7903102 	ldr	r3, [r0, r2, lsl #2]
 128:	   |           |   e7d7301c 	bfi	r3, ip, #0, #24
 12c:	   |           |   e7803102 	str	r3, [r0, r2, lsl #2]
                                        ;			for (uint32_t i=0; i<4096; i++) {
 130:	   |           |   e2822001 	add	r2, r2, #1
 134:	   |           |   e3520a01 	cmp	r2, #4096	; 0x1000
 138:	   \-----------|-- 1affffd9 	bne	a4 <main+0xa4>
                                        ;			section_type = section_type_arg;
 13c:	               \-> e3a0e000 	mov	lr, #0
                                        ;				bufferable = 1;
 140:	                   e3007dec 	movw	r7, #3564	; 0xdec
                                        ;			section_type = section_type_arg;
 144:	                   e345e880 	movt	lr, #22656	; 0x5880
                                        ;				bufferable = 1;
 148:	                   e30f6213 	movw	r6, #61971	; 0xf213
 14c:	                   e3407001 	movt	r7, #1
                                        ;	for (int i = 0; i < 32; i++)
                                        ;		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
                                        ;	
                                        ;	for (uint32_t a = intptr_t(mem.RAM_CACHED); a < intptr_t(mem.RAM_CACHED) + sizeof(mem.RAM_CACHED); a += 1_M) {
 150:	                   e3a08020 	mov	r8, #32
 154:	                   e34f6ffa 	movt	r6, #65530	; 0xfffa
                                        ;			raw = 0;
 158:	                   e3a04000 	mov	r4, #0
 15c:	      /----------> e3a0c316 	mov	ip, #1476395008	; 0x58000000
 160:	      |  /-------- ea000008 	b	188 <main+0x188>
                                        ;			} else if (section_type == SECTION) {
 164:	      |  |     /-> e3590002 	cmp	r9, #2
 168:	      |  |     |   e28cc601 	add	ip, ip, #1048576	; 0x100000
                                        ;				raw = address;
 16c:	      |  |     |   05825000 	streq	r5, [r2]
                                        ;				pad_section = old_entry.pad_section;
 170:	      |  |     |   079e2101 	ldreq	r2, [lr, r1, lsl #2]
                                        ;				section_type = FAULT;
 174:	      |  |     |   17ce0101 	strbne	r0, [lr, r1, lsl #2]
                                        ;				pad_section = old_entry.pad_section;
 178:	      |  |     |   07d32013 	bfieq	r2, r3, #0, #20
 17c:	      |  |     |   078e2101 	streq	r2, [lr, r1, lsl #2]
 180:	      |  |     |   e35c0317 	cmp	ip, #1543503872	; 0x5c000000
 184:	      |  |  /--|-- 0a00001c 	beq	1fc <main+0x1fc>
                                        ;
                                        ;		uint32_t i = a / 1_M;
 188:	      |  >--|--|-> e1a01a2c 	lsr	r1, ip, #20
                                        ;			section_type = section_type_arg;
 18c:	      |  |  |  |   e3a0a003 	mov	sl, #3
                                        ;			is_supersection = (section_type == SUPERSECTION);
 190:	      |  |  |  |   e04a300a 	sub	r3, sl, sl
 194:	      |  |  |  |   e1a02101 	lsl	r2, r1, #2
 198:	      |  |  |  |   e16f3f13 	clz	r3, r3
                                        ;				uint32_t address = i * 1024 * 1024;
                                        ;				entries[i].set_address(address);
                                        ;			}
                                        ;		}
                                        ;		
                                        ;		Entry &operator[](uint32_t i) { return entries[i]; }
 19c:	      |  |  |  |   e2829316 	add	r9, r2, #1476395008	; 0x58000000
 1a0:	      |  |  |  |   e2899502 	add	r9, r9, #8388608	; 0x800000
                                        ;			is_supersection = (section_type == SUPERSECTION);
 1a4:	      |  |  |  |   e1a032a3 	lsr	r3, r3, #5
                                        ;				bufferable = 1;
 1a8:	      |  |  |  |   e1a02009 	mov	r2, r9
                                        ;			uint32_t address = raw;
 1ac:	      |  |  |  |   e5995000 	ldr	r5, [r9]
                                        ;				bufferable = 1;
 1b0:	      |  |  |  |   e1870903 	orr	r0, r7, r3, lsl #18
                                        ;			raw = 0;
 1b4:	      |  |  |  |   e5894000 	str	r4, [r9]
                                        ;			section_type = section_type_arg;
 1b8:	      |  |  |  |   e7cea101 	strb	sl, [lr, r1, lsl #2]
                                        ;				bufferable = 1;
 1bc:	      |  |  |  |   e5993000 	ldr	r3, [r9]
 1c0:	      |  |  |  |   e0033006 	and	r3, r3, r6
 1c4:	      |  |  |  |   e1803003 	orr	r3, r0, r3
 1c8:	      |  |  |  |   e5893000 	str	r3, [r9]
                                        ;			if (section_type == SUPERSECTION) {
 1cc:	      |  |  |  |   e6ef0073 	uxtb	r0, r3
 1d0:	      |  |  |  |   e003900a 	and	r9, r3, sl
 1d4:	      |  |  |  |   e159000a 	cmp	r9, sl
                                        ;				section_type = FAULT;
 1d8:	      |  |  |  |   e7c10014 	bfi	r0, r4, #0, #2
                                        ;			if (section_type == SUPERSECTION) {
 1dc:	      |  |  |  \-- 1affffe0 	bne	164 <main+0x164>
                                        ;				raw = address;
 1e0:	      |  |  |      e5825000 	str	r5, [r2]
                                        ;	for (uint32_t a = intptr_t(mem.RAM_CACHED); a < intptr_t(mem.RAM_CACHED) + sizeof(mem.RAM_CACHED); a += 1_M) {
 1e4:	      |  |  |      e28cc601 	add	ip, ip, #1048576	; 0x100000
                                        ;				pad_supersection = old_entry.pad_supersection;
 1e8:	      |  |  |      e79e2101 	ldr	r2, [lr, r1, lsl #2]
 1ec:	      |  |  |      e35c0317 	cmp	ip, #1543503872	; 0x5c000000
 1f0:	      |  |  |      e7d72013 	bfi	r2, r3, #0, #24
 1f4:	      |  |  |      e78e2101 	str	r2, [lr, r1, lsl #2]
 1f8:	      |  \--|----- 1affffe2 	bne	188 <main+0x188>
                                        ;	for (int i = 0; i < 32; i++)
 1fc:	      |     \----> e2588001 	subs	r8, r8, #1
 200:	      \----------- 1affffd5 	bne	15c <main+0x15c>
                                        ;			section_type = section_type_arg;
 204:	                   e3a04000 	mov	r4, #0
                                        ;			domain = 15;
 208:	                   e3a06ede 	mov	r6, #3552	; 0xde0
                                        ;			section_type = section_type_arg;
 20c:	                   e3454880 	movt	r4, #22656	; 0x5880
                                        ;			domain = 15;
 210:	                   e30f521f 	movw	r5, #61983	; 0xf21f
 214:	                   e3406001 	movt	r6, #1
 218:	                   e34f5ffa 	movt	r5, #65530	; 0xfffa
 21c:	         /-------- ea000008 	b	244 <main+0x244>
                                        ;			} else if (section_type == SECTION) {
 220:	         |     /-> e3500002 	cmp	r0, #2
                                        ;		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
                                        ;		mem.mmu_l1_table[i].configure(CortexA7::MMU::SUPERSECTION, CortexA7::MMU::NORMAL);
                                        ;		//log.printf("MMU %03d: %08x\n", i, mem.mmu_l1_table[i].raw );
                                        ;	}
                                        ;
                                        ;	for (uint32_t a = intptr_t(mem.RAM_ORDERED); a < intptr_t(mem.RAM_ORDERED) + sizeof(mem.RAM_ORDERED); a += 1_M) {
 224:	         |     |   e28cc601 	add	ip, ip, #1048576	; 0x100000
                                        ;				raw = address;
 228:	         |     |   05827000 	streq	r7, [r2]
                                        ;				pad_section = old_entry.pad_section;
 22c:	         |     |   0794210e 	ldreq	r2, [r4, lr, lsl #2]
                                        ;				section_type = FAULT;
 230:	         |     |   17c4110e 	strbne	r1, [r4, lr, lsl #2]
                                        ;				pad_section = old_entry.pad_section;
 234:	         |     |   07d32013 	bfieq	r2, r3, #0, #20
 238:	         |     |   0784210e 	streq	r2, [r4, lr, lsl #2]
 23c:	         |     |   e35c0206 	cmp	ip, #1610612736	; 0x60000000
 240:	         |  /--|-- 0a00001e 	beq	2c0 <main+0x2c0>
                                        ;
                                        ;		uint32_t i = a / 1_M;
 244:	         >--|--|-> e1a0ea2c 	lsr	lr, ip, #20
                                        ;			section_type = section_type_arg;
 248:	         |  |  |   e6ef0078 	uxtb	r0, r8
 24c:	         |  |  |   e3800003 	orr	r0, r0, #3
 250:	         |  |  |   e1a0210e 	lsl	r2, lr, #2
                                        ;			is_supersection = (section_type == SUPERSECTION);
 254:	         |  |  |   e2003003 	and	r3, r0, #3
                                        ;		Entry &operator[](uint32_t i) { return entries[i]; }
 258:	         |  |  |   e2821316 	add	r1, r2, #1476395008	; 0x58000000
                                        ;			is_supersection = (section_type == SUPERSECTION);
 25c:	         |  |  |   e2433003 	sub	r3, r3, #3
 260:	         |  |  |   e16f3f13 	clz	r3, r3
                                        ;		Entry &operator[](uint32_t i) { return entries[i]; }
 264:	         |  |  |   e2811502 	add	r1, r1, #8388608	; 0x800000
                                        ;			domain = 15;
 268:	         |  |  |   e1a02001 	mov	r2, r1
                                        ;			uint32_t address = raw;
 26c:	         |  |  |   e5917000 	ldr	r7, [r1]
                                        ;			is_supersection = (section_type == SUPERSECTION);
 270:	         |  |  |   e1a032a3 	lsr	r3, r3, #5
                                        ;			raw = 0;
 274:	         |  |  |   e5818000 	str	r8, [r1]
                                        ;			section_type = section_type_arg;
 278:	         |  |  |   e7c4010e 	strb	r0, [r4, lr, lsl #2]
                                        ;			domain = 15;
 27c:	         |  |  |   e5910000 	ldr	r0, [r1]
 280:	         |  |  |   e1863903 	orr	r3, r6, r3, lsl #18
 284:	         |  |  |   e0000005 	and	r0, r0, r5
 288:	         |  |  |   e1833000 	orr	r3, r3, r0
 28c:	         |  |  |   e5813000 	str	r3, [r1]
                                        ;			if (section_type == SUPERSECTION) {
 290:	         |  |  |   e2030003 	and	r0, r3, #3
 294:	         |  |  |   e3500003 	cmp	r0, #3
 298:	         |  |  |   e6ef1073 	uxtb	r1, r3
                                        ;				section_type = FAULT;
 29c:	         |  |  |   e7c11018 	bfi	r1, r8, #0, #2
                                        ;			if (section_type == SUPERSECTION) {
 2a0:	         |  |  \-- 1affffde 	bne	220 <main+0x220>
                                        ;				raw = address;
 2a4:	         |  |      e5827000 	str	r7, [r2]
                                        ;	for (uint32_t a = intptr_t(mem.RAM_ORDERED); a < intptr_t(mem.RAM_ORDERED) + sizeof(mem.RAM_ORDERED); a += 1_M) {
 2a8:	         |  |      e28cc601 	add	ip, ip, #1048576	; 0x100000
                                        ;				pad_supersection = old_entry.pad_supersection;
 2ac:	         |  |      e794210e 	ldr	r2, [r4, lr, lsl #2]
 2b0:	         |  |      e35c0206 	cmp	ip, #1610612736	; 0x60000000
 2b4:	         |  |      e7d72013 	bfi	r2, r3, #0, #24
 2b8:	         |  |      e784210e 	str	r2, [r4, lr, lsl #2]
 2bc:	         \--|----- 1affffe0 	bne	244 <main+0x244>
                                        ;		data[pos++] = c;
 2c0:	            \----> e3a0c45d 	mov	ip, #1560281088	; 0x5d000000
 2c4:	                   e3001000 	movw	r1, #0
 2c8:	                   e3401000 	movt	r1, #0
                                        ;		while (*str) 
 2cc:	                   e3a02048 	mov	r2, #72	; 0x48
                                        ;		data[pos++] = c;
 2d0:	                   e59c3000 	ldr	r3, [ip]
 2d4:	               /-> e283045d 	add	r0, r3, #1560281088	; 0x5d000000
 2d8:	               |   e2833001 	add	r3, r3, #1
                                        ;		pos = pos % SZ;
 2dc:	               |   e7f33053 	ubfx	r3, r3, #0, #20
                                        ;		data[pos++] = c;
 2e0:	               |   e5c02004 	strb	r2, [r0, #4]
                                        ;		pos = pos % SZ;
 2e4:	               |   e58c3000 	str	r3, [ip]
                                        ;		while (*str) 
 2e8:	               |   e5f12001 	ldrb	r2, [r1, #1]!
 2ec:	               |   e3520000 	cmp	r2, #0
 2f0:	               \-- 1afffff7 	bne	2d4 <main+0x2d4>
 2f4:	                   e3002000 	movw	r2, #0
 2f8:	                   e3a04020 	mov	r4, #32
 2fc:	                   e3402000 	movt	r2, #0
                                        ;		data[pos++] = c;
 300:	                   e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 304:	               /-> e283145d 	add	r1, r3, #1560281088	; 0x5d000000
 308:	               |   e2833001 	add	r3, r3, #1
                                        ;		pos = pos % SZ;
 30c:	               |   e7f33053 	ubfx	r3, r3, #0, #20
                                        ;		data[pos++] = c;
 310:	               |   e5c14004 	strb	r4, [r1, #4]
                                        ;		pos = pos % SZ;
 314:	               |   e5803000 	str	r3, [r0]
                                        ;		while (*str) 
 318:	               |   e5f24001 	ldrb	r4, [r2, #1]!
 31c:	               |   e3540000 	cmp	r4, #0
 320:	               \-- 1afffff7 	bne	304 <main+0x304>
                                        ;	log << "Hello ";
                                        ;	log << " world ARM!\n";
                                        ;	
                                        ;	//CortexA7::MMU::enable( intptr_t(&mem.mmu_l1_table[0]) );
                                        ;	
                                        ;	log.printf("MMU Table at %08x\n", intptr_t(&mem.mmu_l1_table[0]) );
 324:	                   e3a02000 	mov	r2, #0
 328:	                   e3001000 	movw	r1, #0
 32c:	                   e3452880 	movt	r2, #22656	; 0x5880
 330:	                   e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 334:	                   e3401000 	movt	r1, #0
 338:	               /-- ebfffffe 	bl	0 <main>
                                        ;					uint32_t ddi:1;      // Disable Dual Issue
                                        ;					uint32_t res3:3;     //
                                        ;				};
                                        ;			};
                                        ;
                                        ;			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 1\n" : "=r" (raw)); }
 33c:	                   ee112f30 	mrc	15, 0, r2, cr1, cr0, {1}
                                        ;	
                                        ;	{
                                        ;		CortexA7::CP15::ACTLR r;
                                        ;		r.read();
                                        ;		log.printf("ACTLR: %08x\n", r.raw);
 340:	                   e3001000 	movw	r1, #0
 344:	                   e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 348:	                   e3401000 	movt	r1, #0
 34c:	               /-- ebfffffe 	bl	0 <main>
                                        ;			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 0\n" : "=r" (raw)); }
 350:	                   ee112f10 	mrc	15, 0, r2, cr1, cr0, {0}
                                        ;	}
                                        ;
                                        ;	{
                                        ;		CortexA7::CP15::SCTLR r;
                                        ;		r.read();
                                        ;		log.printf("SCTLR: %08x\n", r.raw);
 354:	                   e3001000 	movw	r1, #0
 358:	                   e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 35c:	                   e3401000 	movt	r1, #0
 360:	               /-- ebfffffe 	bl	0 <main>
 364:	                   ee112f10 	mrc	15, 0, r2, cr1, cr0, {0}
                                        ;			void write() { asm volatile ("mcr p15, 0, %0, c1, c0, 1\n" :: "r" (raw)); }
                                        ;		};
                                        ;		
                                        ;		static void set_branch_prediction(bool enable) { SCTLR sctlr; sctlr.read(); sctlr.z = enable; sctlr.write(); }
                                        ;		static void set_instruction_cache(bool enable) { SCTLR sctlr; sctlr.read(); sctlr.i = enable; sctlr.write(); }
 368:	                   e7e73452 	ubfx	r3, r2, #8, #8
                                        ;			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 0\n" : "=r" (raw)); }
 36c:	                   e58d2008 	str	r2, [sp, #8]
                                        ;		static void set_instruction_cache(bool enable) { SCTLR sctlr; sctlr.read(); sctlr.i = enable; sctlr.write(); }
 370:	                   e3833010 	orr	r3, r3, #16
 374:	                   e5cd3009 	strb	r3, [sp, #9]
                                        ;			void write() { asm volatile ("mcr p15, 0, %0, c1, c0, 0\n" :: "r" (raw)); }
 378:	                   e59d3008 	ldr	r3, [sp, #8]
 37c:	                   ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
                                        ;			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 0\n" : "=r" (raw)); }
 380:	                   ee112f10 	mrc	15, 0, r2, cr1, cr0, {0}
                                        ;		static void set_branch_prediction(bool enable) { SCTLR sctlr; sctlr.read(); sctlr.z = enable; sctlr.write(); }
 384:	                   e7e73452 	ubfx	r3, r2, #8, #8
                                        ;			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 0\n" : "=r" (raw)); }
 388:	                   e58d2008 	str	r2, [sp, #8]
                                        ;		static void set_branch_prediction(bool enable) { SCTLR sctlr; sctlr.read(); sctlr.z = enable; sctlr.write(); }
 38c:	                   e3833008 	orr	r3, r3, #8
 390:	                   e5cd3009 	strb	r3, [sp, #9]
                                        ;			void write() { asm volatile ("mcr p15, 0, %0, c1, c0, 0\n" :: "r" (raw)); }
 394:	                   e59d3008 	ldr	r3, [sp, #8]
 398:	                   ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
                                        ;		
                                        ;		static uint32_t read_MIDR()                    { uint32_t MIDR; asm volatile ("mrc p15, 0, %0, c0, c0, 0\n" : "=r" (MIDR)); return MIDR; }
                                        ;		
                                        ;		static inline void all_barriers() {
                                        ;
                                        ;			asm volatile ("mcr p15, 0, %0, c7, c5, 0\n" :: "r" (0)); // Invalidate Instruction Cache
 39c:	                   ee074f15 	mcr	15, 0, r4, cr7, cr5, {0}
                                        ;			asm volatile ("mcr p15, 0, %0, c7, c5, 6\n" :: "r" (0)); // Invalidate branch prediction array
 3a0:	                   ee074fd5 	mcr	15, 0, r4, cr7, cr5, {6}
                                        ;			asm volatile ("mcr p15, 0, %0, c8, c7, 0\n" :: "r" (0)); // Invalidate entire Unified Main TLB
 3a4:	                   ee084f17 	mcr	15, 0, r4, cr8, cr7, {0}
                                        ;
                                        ;			asm volatile ("isb\n"); // Instruction Synchronization Barrier operation
 3a8:	                   f57ff06f 	isb	sy
                                        ;			asm volatile ("dsb\n"); // Data Synchronization Barrier operation
 3ac:	                   f57ff04f 	dsb	sy
                                        ;			asm volatile ("dmb\n"); // Data Memory Barrier operation.
 3b0:	                   f57ff05f 	dmb	sy
                                        ;			void read()  { asm volatile ("mrc p15, 0, %0, c1, c0, 0\n" : "=r" (raw)); }
 3b4:	                   ee112f10 	mrc	15, 0, r2, cr1, cr0, {0}
                                        ;		//CortexA7::CP15::set_data_cache(true);
                                        ;		CortexA7::CP15::set_branch_prediction(true);
                                        ;		CortexA7::CP15::all_barriers();
                                        ;		
                                        ;		r.read();
                                        ;		log.printf("SCTLR: %08x\n", r.raw);
 3b8:	                   e3001000 	movw	r1, #0
 3bc:	                   e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 3c0:	                   e3401000 	movt	r1, #0
 3c4:	               /-- ebfffffe 	bl	0 <main>
                                        ;		static uint32_t read_MIDR()                    { uint32_t MIDR; asm volatile ("mrc p15, 0, %0, c0, c0, 0\n" : "=r" (MIDR)); return MIDR; }
 3c8:	                   ee102f10 	mrc	15, 0, r2, cr0, cr0, {0}
                                        ;	}
                                        ;
                                        ;	log.printf("read_MIDR: %08x\n", CortexA7::CP15::read_MIDR());
 3cc:	                   e3001000 	movw	r1, #0
 3d0:	                   e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 3d4:	                   e3401000 	movt	r1, #0
 3d8:	               /-- ebfffffe 	bl	0 <main>
                                        ;	
                                        ;	{
                                        ;		uint32_t cpsr;
                                        ;		asm volatile ("mrs %0, cpsr" : "=r" (cpsr));
 3dc:	                   e10f2000 	mrs	r2, CPSR
                                        ;		log.printf("read_cpsr: %08x\n", cpsr);
 3e0:	                   e3001000 	movw	r1, #0
 3e4:	                   e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 3e8:	                   e3401000 	movt	r1, #0
 3ec:	               /-- ebfffffe 	bl	0 <main>
                                        ;		log.printf("SPSR_hyp: %08x\n", SPSR_hyp);
                                        ;		
                                        ;		
                                        ;	}
                                        ;
                                        ;	io.AHB1_APB1_CFG_REG.DW = 0x3140;
 3f0:	                   e3a03000 	mov	r3, #0
                                        ;	io.CPUX_AXI_CFG_REG.DW = 0x20201;
 3f4:	                   e3002201 	movw	r2, #513	; 0x201
                                        ;	io.AHB1_APB1_CFG_REG.DW = 0x3140;
 3f8:	                   e34031c2 	movt	r3, #450	; 0x1c2
 3fc:	                   e3a01dc5 	mov	r1, #12608	; 0x3140
                                        ;	io.CPUX_AXI_CFG_REG.DW = 0x20201;
 400:	                   e3402002 	movt	r2, #2
                                        ;	io.AHB1_APB1_CFG_REG.DW = 0x3140;
 404:	                   e5831054 	str	r1, [r3, #84]	; 0x54
                                        ;	io.CPUX_AXI_CFG_REG.DW = 0x20201;
 408:	                   e5832050 	str	r2, [r3, #80]	; 0x50
                                        ;
                                        ;	constexpr uint32_t N_ITER = 100000;
                                        ;	constexpr uint32_t N_REP = 1;
                                        ;	
                                        ;	{
                                        ;		uint32_t t0 = io.TMR1_CUR_VALUE_REG.DW;
 40c:	                   e5932c28 	ldr	r2, [r3, #3112]	; 0xc28
                                        ;		while (t0 == io.TMR1_CUR_VALUE_REG.DW);
 410:	               /-> e5931c28 	ldr	r1, [r3, #3112]	; 0xc28
 414:	               |   e1510002 	cmp	r1, r2
 418:	               \-- 0afffffc 	beq	410 <main+0x410>
                                        ;		
                                        ;		while (t0 - io.TMR1_CUR_VALUE_REG.DW < 24000000);
 41c:	                   e3a01000 	mov	r1, #0
 420:	                   e30305ff 	movw	r0, #13823	; 0x35ff
 424:	                   e34011c2 	movt	r1, #450	; 0x1c2
 428:	                   e340016e 	movt	r0, #366	; 0x16e
 42c:	               /-> e5913c28 	ldr	r3, [r1, #3112]	; 0xc28
 430:	               |   e0423003 	sub	r3, r2, r3
 434:	               |   e1530000 	cmp	r3, r0
 438:	               \-- 9afffffb 	bls	42c <main+0x42c>
                                        ;	}
                                        ;		
                                        ;
                                        ;	uint32_t t0 = io.TMR1_CUR_VALUE_REG.DW;
 43c:	                   e5912c28 	ldr	r2, [r1, #3112]	; 0xc28
 440:	                   e30836a0 	movw	r3, #34464	; 0x86a0
 444:	                   e3403001 	movt	r3, #1
                                        ;	uint32_t v = 0;
                                        ;
                                        ;	uint32_t i = N_ITER;
                                        ;	while (i--) {
                                        ;		UNROLL1({
 448:	                   e3a0c000 	mov	ip, #0
 44c:	                   e340c1c2 	movt	ip, #450	; 0x1c2
                                        ;	uint32_t v = 0;
 450:	                   e3a0e000 	mov	lr, #0
                                        ;		UNROLL1({
 454:	/----------------> e59c1810 	ldr	r1, [ip, #2064]	; 0x810
 458:	|                  e59c08a0 	ldr	r0, [ip, #2208]	; 0x8a0
 45c:	|                  e2015906 	and	r5, r1, #98304	; 0x18000
 460:	|                  e3550906 	cmp	r5, #98304	; 0x18000
 464:	|                  e1a04000 	mov	r4, r0
 468:	|     /----------- 0a00005a 	beq	5d8 <main+0x5d8>
 46c:	|     |            e08ee000 	add	lr, lr, r0
                                        ;	while (i--) {
 470:	|     |            e2533001 	subs	r3, r3, #1
 474:	+-----|----------- 1afffff6 	bne	454 <main+0x454>
                                        ;			}
                                        ;			v += pe.DW;
                                        ;		});
                                        ;	}
                                        ;	
                                        ;	io.AHB1_APB1_CFG_REG.DW = 0x3180;
 478:	|  /--|----------> e3a03000 	mov	r3, #0
                                        ;	io.CPUX_AXI_CFG_REG.DW = 0x20203;
 47c:	|  |  |            e3001203 	movw	r1, #515	; 0x203
                                        ;	io.AHB1_APB1_CFG_REG.DW = 0x3180;
 480:	|  |  |            e34031c2 	movt	r3, #450	; 0x1c2
                                        ;	if (v == 0) {
 484:	|  |  |            e35e0000 	cmp	lr, #0
                                        ;	io.CPUX_AXI_CFG_REG.DW = 0x20203;
 488:	|  |  |            e3401002 	movt	r1, #2
                                        ;	io.AHB1_APB1_CFG_REG.DW = 0x3180;
 48c:	|  |  |            e3a00dc6 	mov	r0, #12672	; 0x3180
 490:	|  |  |            e5830054 	str	r0, [r3, #84]	; 0x54
                                        ;		data[pos++] = c;
 494:	|  |  |            e3a0c45d 	mov	ip, #1560281088	; 0x5d000000
                                        ;	io.CPUX_AXI_CFG_REG.DW = 0x20203;
 498:	|  |  |            e5831050 	str	r1, [r3, #80]	; 0x50
                                        ;	if (v == 0) {
 49c:	|  |  |  /-------- 1a000054 	bne	5f4 <main+0x5f4>
 4a0:	|  |  |  |         e59c3000 	ldr	r3, [ip]
 4a4:	|  |  |  |         e3001000 	movw	r1, #0
 4a8:	|  |  |  |         e3401000 	movt	r1, #0
                                        ;		while (*str) 
 4ac:	|  |  |  |         e3a00044 	mov	r0, #68	; 0x44
                                        ;		data[pos++] = c;
 4b0:	|  |  |  |     /-> e283e45d 	add	lr, r3, #1560281088	; 0x5d000000
 4b4:	|  |  |  |     |   e2833001 	add	r3, r3, #1
                                        ;		pos = pos % SZ;
 4b8:	|  |  |  |     |   e7f33053 	ubfx	r3, r3, #0, #20
                                        ;		data[pos++] = c;
 4bc:	|  |  |  |     |   e5ce0004 	strb	r0, [lr, #4]
                                        ;		pos = pos % SZ;
 4c0:	|  |  |  |     |   e58c3000 	str	r3, [ip]
                                        ;		while (*str) 
 4c4:	|  |  |  |     |   e5f10001 	ldrb	r0, [r1, #1]!
 4c8:	|  |  |  |     |   e3500000 	cmp	r0, #0
 4cc:	|  |  |  |     \-- 1afffff7 	bne	4b0 <main+0x4b0>
                                        ;		log << "Done 2!\n";
                                        ;	} else {
                                        ;		log << "Not Done 2!\n";
                                        ;	}
                                        ;	uint32_t t1 = io.TMR1_CUR_VALUE_REG.DW;
 4d0:	|  |  |  |  /----> e3a05000 	mov	r5, #0
                                        ;	int d = t0 - t1;
                                        ;
                                        ;	log.printf(" %d %d %d \n", t0, t1, d);
 4d4:	|  |  |  |  |      e3001000 	movw	r1, #0
                                        ;	uint32_t t1 = io.TMR1_CUR_VALUE_REG.DW;
 4d8:	|  |  |  |  |      e34051c2 	movt	r5, #450	; 0x1c2
                                        ;	log.printf(" %d %d %d \n", t0, t1, d);
 4dc:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 4e0:	|  |  |  |  |      e3401000 	movt	r1, #0
                                        ;	uint32_t t1 = io.TMR1_CUR_VALUE_REG.DW;
 4e4:	|  |  |  |  |      e5953c28 	ldr	r3, [r5, #3112]	; 0xc28
                                        ;	int d = t0 - t1;
 4e8:	|  |  |  |  |      e0424003 	sub	r4, r2, r3
                                        ;	log.printf(" %d %d %d \n", t0, t1, d);
 4ec:	|  |  |  |  |      e58d4000 	str	r4, [sp]
 4f0:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	
                                        ;	log.printf("%d\n", d/(24 * N_REP * (N_ITER / 1000)));
 4f4:	|  |  |  |  |      e30821b5 	movw	r2, #33205	; 0x81b5
 4f8:	|  |  |  |  |      e3001000 	movw	r1, #0
 4fc:	|  |  |  |  |      e3412b4e 	movt	r2, #6990	; 0x1b4e
 500:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 504:	|  |  |  |  |      e0823492 	umull	r3, r2, r2, r4
 508:	|  |  |  |  |      e3401000 	movt	r1, #0
                                        ;	
                                        ;	log.printf("%08x\n", io.CPUX_AXI_CFG_REG.DW );
                                        ;	
                                        ;	log.printf("%08x\n", io.AHB1_APB1_CFG_REG.DW );
                                        ;	
                                        ;	log.printf("CPU_CLK_GATING_REG %08x\n", io.CPU_CLK_GATING_REG.DW );
 50c:	|  |  |  |  |      e3a04a01 	mov	r4, #4096	; 0x1000
                                        ;	log.printf("%d\n", d/(24 * N_REP * (N_ITER / 1000)));
 510:	|  |  |  |  |      e1a02422 	lsr	r2, r2, #8
                                        ;	log.printf("CPU_CLK_GATING_REG %08x\n", io.CPU_CLK_GATING_REG.DW );
 514:	|  |  |  |  |      e34041f0 	movt	r4, #496	; 0x1f0
                                        ;	log.printf("%d\n", d/(24 * N_REP * (N_ITER / 1000)));
 518:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	log.printf("%08x\n", io.CPUX_AXI_CFG_REG.DW );
 51c:	|  |  |  |  |      e5952050 	ldr	r2, [r5, #80]	; 0x50
 520:	|  |  |  |  |      e3001000 	movw	r1, #0
 524:	|  |  |  |  |      e3401000 	movt	r1, #0
 528:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 52c:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	log.printf("%08x\n", io.AHB1_APB1_CFG_REG.DW );
 530:	|  |  |  |  |      e5952054 	ldr	r2, [r5, #84]	; 0x54
 534:	|  |  |  |  |      e3001000 	movw	r1, #0
 538:	|  |  |  |  |      e3401000 	movt	r1, #0
 53c:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 540:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	log.printf("CPU_CLK_GATING_REG %08x\n", io.CPU_CLK_GATING_REG.DW );
 544:	|  |  |  |  |      e5942d44 	ldr	r2, [r4, #3396]	; 0xd44
 548:	|  |  |  |  |      e3001000 	movw	r1, #0
 54c:	|  |  |  |  |      e3401000 	movt	r1, #0
 550:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 554:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	
                                        ;	
                                        ;	log.printf("CPU0_RST_CTRL %08x\n", io.CPU0_RST_CTRL.DW );
 558:	|  |  |  |  |      e5942c40 	ldr	r2, [r4, #3136]	; 0xc40
 55c:	|  |  |  |  |      e3001000 	movw	r1, #0
 560:	|  |  |  |  |      e3401000 	movt	r1, #0
 564:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 568:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	log.printf("CPU0_CTRL_REG %08x\n", io.CPU0_CTRL_REG.DW );
 56c:	|  |  |  |  |      e5942c44 	ldr	r2, [r4, #3140]	; 0xc44
 570:	|  |  |  |  |      e3001000 	movw	r1, #0
 574:	|  |  |  |  |      e3401000 	movt	r1, #0
 578:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 57c:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	log.printf("CPU0_STATUS_REG %08x\n", io.CPU0_STATUS_REG.DW );
 580:	|  |  |  |  |      e5942c48 	ldr	r2, [r4, #3144]	; 0xc48
 584:	|  |  |  |  |      e3001000 	movw	r1, #0
 588:	|  |  |  |  |      e3401000 	movt	r1, #0
 58c:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 590:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	
                                        ;	log.printf("CPU3_RST_CTRL %08x\n", io.CPU3_RST_CTRL.DW );
 594:	|  |  |  |  |      e5942d00 	ldr	r2, [r4, #3328]	; 0xd00
 598:	|  |  |  |  |      e3001000 	movw	r1, #0
 59c:	|  |  |  |  |      e3401000 	movt	r1, #0
 5a0:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 5a4:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	log.printf("CPU3_CTRL_REG %08x\n", io.CPU3_CTRL_REG.DW );
 5a8:	|  |  |  |  |      e5942d04 	ldr	r2, [r4, #3332]	; 0xd04
 5ac:	|  |  |  |  |      e3001000 	movw	r1, #0
 5b0:	|  |  |  |  |      e3401000 	movt	r1, #0
 5b4:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 5b8:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;	log.printf("CPU3_STATUS_REG %08x\n", io.CPU3_STATUS_REG.DW );
 5bc:	|  |  |  |  |      e5942d08 	ldr	r2, [r4, #3336]	; 0xd08
 5c0:	|  |  |  |  |      e3001000 	movw	r1, #0
 5c4:	|  |  |  |  |      e3401000 	movt	r1, #0
 5c8:	|  |  |  |  |      e3a0045d 	mov	r0, #1560281088	; 0x5d000000
 5cc:	|  |  |  |  |  /-- ebfffffe 	bl	0 <main>
                                        ;
                                        ;	//CortexA7::MMU::disable();
                                        ;}
 5d0:	|  |  |  |  |      e28dd010 	add	sp, sp, #16
 5d4:	|  |  |  |  |      e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
                                        ;		UNROLL1({
 5d8:	|  |  \--|--|----> e7e012d1 	ubfx	r1, r1, #5, #1
                                        ;	while (i--) {
 5dc:	|  |     |  |      e2533001 	subs	r3, r3, #1
                                        ;		UNROLL1({
 5e0:	|  |     |  |      e7c44211 	bfi	r4, r1, #4, #1
 5e4:	|  |     |  |      e08ee004 	add	lr, lr, r4
 5e8:	|  |     |  |      e58c48a0 	str	r4, [ip, #2208]	; 0x8a0
                                        ;	while (i--) {
 5ec:	\--|-----|--|----- 1affff98 	bne	454 <main+0x454>
 5f0:	   \-----|--|----- eaffffa0 	b	478 <main+0x478>
                                        ;		data[pos++] = c;
 5f4:	         \--|----> e59c3000 	ldr	r3, [ip]
 5f8:	            |      e3001000 	movw	r1, #0
 5fc:	            |      e3401000 	movt	r1, #0
                                        ;		while (*str) 
 600:	            |      e3a0004e 	mov	r0, #78	; 0x4e
                                        ;		data[pos++] = c;
 604:	            |  /-> e283e45d 	add	lr, r3, #1560281088	; 0x5d000000
 608:	            |  |   e2833001 	add	r3, r3, #1
                                        ;		pos = pos % SZ;
 60c:	            |  |   e7f33053 	ubfx	r3, r3, #0, #20
                                        ;		data[pos++] = c;
 610:	            |  |   e5ce0004 	strb	r0, [lr, #4]
                                        ;		pos = pos % SZ;
 614:	            |  |   e58c3000 	str	r3, [ip]
                                        ;		while (*str) 
 618:	            |  |   e5f10001 	ldrb	r0, [r1, #1]!
 61c:	            |  |   e3500000 	cmp	r0, #0
 620:	            |  \-- 1afffff7 	bne	604 <main+0x604>
 624:	            \----- eaffffa9 	b	4d0 <main+0x4d0>
