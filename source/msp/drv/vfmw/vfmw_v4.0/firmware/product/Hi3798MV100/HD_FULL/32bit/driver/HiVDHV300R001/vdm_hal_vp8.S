#include "hi_asm_define.h"
	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"vdm_hal_vp8.c"
	.text
	.align	2
	.global	VP8HAL_V300R001_CfgReg
	.type	VP8HAL_V300R001_CfgReg, %function
VP8HAL_V300R001_CfgReg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	cmp	r2, #1
	mov	r5, r0
	mov	r7, r2
	mov	r0, #0
	mov	r9, r1
	str	r0, [fp, #-40]
	bhi	.L19
	cmp	r2, #0
	bgt	.L20
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L21
.L6:
	ldr	r1, [r5, #2788]
	movw	r8, #1208
	ldr	r2, [r5, #2784]
	mov	r0, #3
	mul	r8, r8, r7
	ldr	r3, [fp, #-40]
	mul	r2, r2, r1
	ldr	r4, .L23
	ldr	r6, .L23+4
	ldr	r1, .L23+8
	sub	r2, r2, #1
	ldr	ip, [r4, r8]
	bfi	r3, r2, #0, #20
	str	r3, [fp, #-40]
	mov	r3, r3, lsr #24
	and	r3, r3, #191
	bfc	r3, #7, #1
	strb	r3, [fp, #-37]
	ldr	r2, [fp, #-40]
	str	r2, [ip, #8]
	ldr	r3, [r6, #68]
	blx	r3
	mov	r3, #536870912
	str	r3, [fp, #-40]
	mov	r3, #12
	ldrh	ip, [fp, #-38]
	mov	r0, #3
	strb	r3, [fp, #-40]
	bfc	ip, #0, #12
	ldr	r1, [r5, #3140]
	ldr	r2, [r5, #2792]
	ubfx	r3, ip, #8, #8
	orr	r3, r3, #32
	strh	ip, [fp, #-38]	@ movhi
	bfi	r3, r1, #6, #1
	ldrh	r1, [fp, #-40]
	mov	r2, r2, lsr #6
	bfc	r3, #7, #1
	bfi	r1, r2, #4, #10
	strb	r3, [fp, #-37]
	ubfx	r2, r1, #8, #8
	strh	r1, [fp, #-40]	@ movhi
	orr	r2, r2, #192
	strb	r2, [fp, #-39]
	ldr	ip, [r4, r8]
	ldr	r3, [fp, #-40]
	ldr	r1, .L23+12
	str	r3, [ip, #12]
	mov	r2, r3
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r9, #48]
	mov	r0, #3
	ldr	r1, .L23+16
	bic	r2, r2, #15
	str	r2, [r3, #16]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r9, #32]
	mov	r0, #3
	ldr	r1, .L23+20
	bic	r2, r2, #15
	str	r2, [r3, #20]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r5, #2812]
	mov	r0, #3
	ldr	r1, .L23+24
	str	r2, [r3, #24]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r9, #1156]
	mov	r0, #3
	ldr	r1, .L23+28
	bic	r2, r2, #15
	str	r2, [r3, #128]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	ip, [r4, r8]
	ldr	r3, [r9, #1160]
	mov	r0, #3
	ldr	r1, .L23+32
	str	r3, [ip, #132]
	mov	r2, r3
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r0, .L23+36
	ldr	r1, [r5, #2784]
	movw	r3, #30480
	movt	r3, 1
	movw	r2, #30480
	cmp	r1, #256
	ldr	r0, [r0]
	movls	r1, r3
	movhi	r1, r2
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	ldr	r3, [r4, r8]
	ldr	r2, [r5, #3116]
	mov	r0, #3
	ldr	r1, .L23+40
	bic	r2, r2, #15
	str	r2, [r3, #96]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r9, [r5, #2792]
	mov	r0, #3
	ldr	r1, .L23+44
	str	r9, [r3, #100]
	mov	r2, r9
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r5, #2784]
	mov	r3, r3, asl #4
	sub	r2, r3, #1
	cmp	r2, #2048
	movcc	r8, #16
	bcc	.L9
	sub	r2, r3, #2048
	sub	r2, r2, #1
	cmp	r2, #2048
	movcc	r8, #32
	bcc	.L9
	sub	r2, r3, #4096
	sub	r2, r2, #1
	cmp	r2, #2048
	movcc	r8, #48
	bcs	.L22
.L9:
	ldr	r1, [r5, #2788]
	movw	r3, #1208
	mul	r7, r3, r7
	add	r2, r1, #1
	mov	r3, r1, asl #4
	mov	r0, #3
	add	r3, r3, #31
	mov	r2, r2, lsr #1
	ldr	r1, .L23+48
	mov	r3, r3, lsr #5
	mul	r2, r9, r2
	mov	r3, r3, asl #4
	ldr	ip, [r4, r7]
	mla	r2, r8, r3, r2
	mov	r2, r2, asl #1
	str	r2, [ip, #104]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r5, #2788]
	ldr	r1, [r4, r7]
	mov	r0, #0
	mvn	r2, #0
	mov	r3, r3, asl #4
	add	r3, r3, #31
	bic	r3, r3, #31
	mul	r8, r8, r3
	str	r8, [r1, #108]
	ldr	r3, [r4, r7]
	str	r2, [r3, #32]
.L16:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L22:
	sub	r3, r3, #6144
	sub	r3, r3, #1
	cmp	r3, #2048
	movcs	r8, #16
	movcc	r8, #64
	b	.L9
.L21:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L7
	str	r3, [r9]
	b	.L6
.L20:
	ldr	r1, .L23+4
	mov	r3, r2
	str	r0, [sp]
	ldr	r2, .L23+52
	ldr	r4, [r1, #68]
	ldr	r1, .L23+56
	blx	r4
	mvn	r0, #0
	b	.L16
.L19:
	ldr	r3, .L23+4
	ldr	r1, .L23+60
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L16
.L7:
	ldr	r3, .L23+4
	ldr	r1, .L23+64
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L16
.L24:
	.align	2
.L23:
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	s_RegPhyBaseAddr
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VP8HAL_V300R001_CfgReg, .-VP8HAL_V300R001_CfgReg
	.align	2
	.global	VP8HAL_V300R001_CfgDnMsg
	.type	VP8HAL_V300R001_CfgDnMsg, %function
VP8HAL_V300R001_CfgDnMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r4, r0
	ldr	r0, [r1, #48]
	mov	r7, r1
	bl	MEM_Phy2Vir
	subs	r9, r0, #0
	beq	.L33
	ldr	r3, [r4, #2796]
	mov	r5, #0
	ldr	r2, [r4, #2800]
	mov	r0, #4
	and	r3, r3, #1
	str	r5, [fp, #-48]
	bfi	r3, r2, #1, #2
	strb	r3, [fp, #-48]
	ldr	r6, .L35
	ldr	r2, [fp, #-48]
	ldr	r1, .L35+4
	ldr	r10, .L35
	str	r2, [r9]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r2, [r4, #2808]
	ldr	r3, [r4, #2804]
	mov	r0, #4
	ldr	r1, .L35+8
	rsb	r2, r3, r2, lsl #1
	add	r2, r2, #1
	str	r2, [r9, #4]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r2, [r4, #2784]
	ldr	r3, [r4, #2788]
	mov	r0, #0	@ movhi
	sub	r2, r2, #1
	mov	r1, r0	@ movhi
	sub	r3, r3, #1
	bfi	r0, r2, #0, #9
	bfi	r1, r3, #0, #9
	strh	r0, [fp, #-48]	@ movhi
	strh	r1, [fp, #-46]	@ movhi
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r1, .L35+12
	str	r2, [r9, #8]
	ldr	r3, [r6, #68]
	blx	r3
	ldrb	r2, [r4, #2752]	@ zero_extendqisi2
	ldrb	r3, [r4, #2753]	@ zero_extendqisi2
	mov	r0, #4
	ldrb	r1, [r4, #2754]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r5, [fp, #-48]
	bfi	r3, r1, #1, #2
	strb	r2, [fp, #-48]
	strb	r3, [fp, #-47]
	ldr	r2, [fp, #-48]
	ldr	r1, .L35+16
	str	r2, [r9, #12]
	ldr	r3, [r6, #68]
	blx	r3
	ldrb	r3, [r4, #2755]	@ zero_extendqisi2
	ldrb	r2, [r4, #2756]	@ zero_extendqisi2
	mov	r0, #4
	ldrb	r1, [r4, #2757]	@ zero_extendqisi2
	and	r3, r3, #1
	bfi	r3, r2, #1, #1
	ldrb	r2, [r4, #2758]	@ zero_extendqisi2
	bfi	r3, r1, #2, #1
	str	r5, [fp, #-48]
	bfi	r3, r2, #3, #1
	strb	r3, [fp, #-48]
	ldr	r2, [fp, #-48]
	ldr	r1, .L35+20
	str	r2, [r9, #16]
	ldr	r3, [r6, #68]
	blx	r3
	ldrb	r3, [r4, #2760]	@ zero_extendqisi2
	ldrb	r2, [r4, #2761]	@ zero_extendqisi2
	mov	r0, #4
	and	r3, r3, #1
	str	r5, [fp, #-48]
	bfi	r3, r2, #1, #2
	ldrb	r2, [r4, #2762]	@ zero_extendqisi2
	strb	r3, [fp, #-48]
	ldrh	r3, [fp, #-48]
	ldrb	ip, [r4, #2763]	@ zero_extendqisi2
	bfi	r3, r2, #3, #6
	ldrb	r2, [r4, #2764]	@ zero_extendqisi2
	strh	r3, [fp, #-48]	@ movhi
	mov	r3, r3, lsr #8
	ldr	r1, .L35+24
	bfi	r3, ip, #1, #3
	bfi	r3, r2, #4, #3
	strb	r3, [fp, #-47]
	ldr	r2, [fp, #-48]
	str	r2, [r9, #20]
	ldr	r3, [r6, #68]
	blx	r3
	ldrb	r3, [r4, #2765]	@ zero_extendqisi2
	ldrb	r1, [r4, #2766]	@ zero_extendqisi2
	mov	r0, #4
	ldrb	r2, [r4, #2767]	@ zero_extendqisi2
	and	r3, r3, #1
	bfi	r3, r1, #1, #4
	str	r5, [fp, #-48]
	ldrb	ip, [r4, #2768]	@ zero_extendqisi2
	bfi	r3, r2, #5, #1
	strb	r3, [fp, #-48]
	ldrh	r1, [fp, #-48]
	ldrb	r3, [r4, #2772]	@ zero_extendqisi2
	ldrb	r2, [fp, #-46]	@ zero_extendqisi2
	bfi	r1, ip, #6, #4
	ldrb	ip, [r4, #2769]	@ zero_extendqisi2
	bfi	r2, r3, #0, #4
	mov	r3, r1, lsr #8
	bfi	r3, ip, #2, #1
	ldrb	ip, [r4, #2773]	@ zero_extendqisi2
	strh	r1, [fp, #-48]	@ movhi
	ldrb	r1, [r4, #2770]	@ zero_extendqisi2
	bfi	r2, ip, #4, #1
	ldrb	ip, [r4, #2771]	@ zero_extendqisi2
	strb	r2, [fp, #-46]
	bfi	r3, r1, #3, #4
	ldrh	r2, [fp, #-46]
	bfi	r3, ip, #7, #1
	ldrb	r1, [r4, #2774]	@ zero_extendqisi2
	strb	r3, [fp, #-47]
	bfi	r2, r1, #5, #4
	strh	r2, [fp, #-46]	@ movhi
	ldr	r2, [fp, #-48]
	ldr	r1, .L35+28
	str	r2, [r9, #24]
	ldr	r3, [r6, #68]
	blx	r3
	ldrb	r2, [r4, #2759]	@ zero_extendqisi2
	str	r5, [fp, #-48]
	mov	r3, #0
	bfi	r3, r2, #0, #7
	strb	r3, [fp, #-48]
	ldr	r2, [fp, #-48]
	mov	r0, #4
	ldr	r1, .L35+32
	str	r2, [r9, #28]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r2, [r4, #2780]
	ldr	r1, .L35+36
	mov	r0, #4
	str	r2, [r9, #32]
	ldr	r3, [r6, #68]
	blx	r3
	ldrb	r2, [r4, #2778]	@ zero_extendqisi2
	ldrb	r1, [r4, #2779]	@ zero_extendqisi2
	mov	r3, #0
	str	r5, [fp, #-48]
	mov	r0, #4
	bfi	r3, r1, #0, #6
	strb	r2, [fp, #-48]
	strb	r3, [fp, #-46]
	mov	r5, #0
	ldr	r2, [fp, #-48]
	ldr	r1, .L35+40
	str	r2, [r9, #36]
	ldr	r3, [r6, #68]
	blx	r3
	ldrb	r2, [r4, #2779]	@ zero_extendqisi2
	ldr	r3, [r4, #2820]
	ldr	r0, [r4, #2816]
	cmp	r2, r3
	ldr	r1, .L35+44
	addhi	r3, r3, #128
	add	r0, r2, r0
	rsbls	r2, r2, r3
	rsbhi	r2, r2, r3
	mov	r3, r5
	bfi	r3, r0, #0, #25
	str	r3, [fp, #-48]
	mov	r0, #4
	mov	r3, r3, lsr #24
	ldrhi	r8, [r4, #2824]
	ldrls	r8, [r4, #2824]
	bfi	r3, r2, #1, #7
	strb	r3, [fp, #-45]
	subhi	r8, r8, #16
	ldr	r2, [fp, #-48]
	str	r2, [r9, #64]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r1, .L35+48
	mov	r2, r5
	mov	r0, #4
	bfi	r2, r8, #0, #24
	str	r2, [fp, #-48]
	str	r2, [r9, #68]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r1, [r4, #2828]
	mov	r3, r5
	ldr	r2, [r4, #2832]
	bfi	r3, r1, #0, #25
	str	r3, [fp, #-48]
	ldr	r8, [r6, #68]
	mov	r0, #4
	mov	r3, r3, lsr #24
	ldr	r1, .L35+52
	bfi	r3, r2, #1, #7
	strb	r3, [fp, #-45]
	ldr	r2, [fp, #-48]
	str	r2, [r9, #72]
	blx	r8
	ldr	r1, [r4, #2836]
	ldr	r3, [r6, #68]
	mov	r2, r5
	mov	r0, #4
	bfi	r2, r1, #0, #24
	ldr	r1, .L35+56
	str	r2, [fp, #-48]
	str	r2, [r9, #76]
	blx	r3
	ldr	ip, [r4, #3036]
	ldr	r1, [r4, #3040]
	mov	r0, #4
	ldr	r2, [r4, #3044]
	ldr	r3, [r4, #3048]
	strb	ip, [fp, #-48]
	strb	r1, [fp, #-47]
	strb	r3, [fp, #-45]
	strb	r2, [fp, #-46]
	ldr	r2, [fp, #-48]
	ldr	r3, [r6, #68]
	ldr	r1, .L35+60
	str	r2, [r9, #80]
	blx	r3
	ldr	ip, [r4, #3052]
	ldr	r1, [r4, #3056]
	mov	r0, #4
	ldr	r2, [r4, #3060]
	ldr	r3, [r4, #3064]
	strb	ip, [fp, #-48]
	strb	r1, [fp, #-47]
	strb	r3, [fp, #-45]
	strb	r2, [fp, #-46]
	ldr	r2, [fp, #-48]
	ldr	r3, [r6, #68]
	ldr	r1, .L35+64
	str	r2, [r9, #84]
	blx	r3
	ldr	ip, [r4, #3068]
	ldr	r1, [r4, #3072]
	mov	r0, #4
	ldr	r2, [r4, #3076]
	ldr	r3, [r4, #3080]
	strb	ip, [fp, #-48]
	strb	r1, [fp, #-47]
	strb	r3, [fp, #-45]
	strb	r2, [fp, #-46]
	ldr	r2, [fp, #-48]
	ldr	r3, [r6, #68]
	ldr	r1, .L35+68
	str	r2, [r9, #88]
	blx	r3
	ldr	ip, [r4, #3084]
	ldr	r1, [r4, #3088]
	mov	r0, #4
	ldr	r2, [r4, #3092]
	ldr	r3, [r4, #3096]
	strb	ip, [fp, #-48]
	strb	r1, [fp, #-47]
	strb	r3, [fp, #-45]
	strb	r2, [fp, #-46]
	ldr	r2, [fp, #-48]
	ldr	r3, [r6, #68]
	ldr	r1, .L35+72
	str	r2, [r9, #92]
	blx	r3
	ldr	ip, [r4, #3100]
	ldr	r1, [r4, #3104]
	mov	r0, #4
	ldr	r2, [r4, #3108]
	ldr	r3, [r4, #3112]
	strb	ip, [fp, #-48]
	strb	r1, [fp, #-47]
	strb	r3, [fp, #-45]
	strb	r2, [fp, #-46]
	ldr	r2, [fp, #-48]
	ldr	r3, [r6, #68]
	ldr	r1, .L35+76
	str	r2, [r9, #96]
	blx	r3
	ldr	r2, [r4, #3136]
	ldr	r3, [r6, #68]
	mov	r0, #4
	ldr	r1, .L35+80
	str	r2, [r9, #100]
	blx	r3
	ldr	r2, [r4, #3116]
	ldr	r3, [r6, #68]
	mov	r0, #4
	ldr	r1, .L35+84
	str	r2, [r9, #128]
	blx	r3
	ldr	r2, [r4, #3120]
	ldr	r3, [r6, #68]
	mov	r0, #4
	ldr	r1, .L35+88
	str	r2, [r9, #132]
	blx	r3
	ldr	r2, [r4, #3124]
	ldr	r3, [r6, #68]
	mov	r0, #4
	ldr	r1, .L35+92
	str	r2, [r9, #136]
	blx	r3
	ldr	r2, [r4, #3128]
	ldr	r3, [r6, #68]
	mov	r0, #4
	ldr	r1, .L35+96
	str	r2, [r9, #140]
	blx	r3
	ldr	r2, [r7, #1136]
	ldr	r3, [r6, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L35+100
	str	r2, [r9, #144]
	blx	r3
	ldr	r2, [r7, #1140]
	ldr	r3, [r6, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L35+104
	str	r2, [r9, #148]
	blx	r3
	ldr	r2, [r7, #1144]
	ldr	r3, [r6, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L35+108
	str	r2, [r9, #152]
	blx	r3
	ldr	r8, [r7, #1180]
	ldr	r3, [r6, #68]
	mov	r0, #4
	bic	r8, r8, #15
	ldr	r1, .L35+112
	str	r8, [r9, #156]
	mov	r2, r8
	str	r8, [fp, #-48]
	blx	r3
	mov	r0, r8
	bl	MEM_Phy2Vir
	cmp	r0, r5
	beq	.L34
	ldr	r3, [r10, #52]
	mov	r2, #2752
	mov	r1, r4
	add	r8, r4, #2832
	blx	r3
	ldr	r2, [r7, #1152]
	ldr	r3, [r10, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L35+116
	str	r2, [r9, #160]
	add	r8, r8, #8
	blx	r3
	mov	r0, r9
	bl	MEM_Vir2Phy
	ldr	r3, [r10, #68]
	ldr	r1, .L35+120
	add	r7, r9, #252
	add	r2, r0, #256
	mov	r0, #4
	str	r2, [r9, #252]
	blx	r3
.L31:
	ldr	r1, [r8, #4]!
	mov	r3, #0
	ldr	ip, [r4, #2876]
	add	r2, r5, #64
	bfi	r3, r1, #0, #25
	str	r3, [fp, #-48]
	ldr	r1, .L35+124
	mov	r0, #4
	mov	r3, r3, lsr #24
	add	r9, r7, #16
	bfi	r3, ip, #1, #7
	strb	r3, [fp, #-45]
	ldr	r3, [fp, #-48]
	str	r3, [r7, #4]
	ldr	r10, [r6, #68]
	blx	r10
	ldr	r1, [r4, #2908]
	add	r2, r5, #65
	mov	r3, #0
	mov	r0, #4
	bfi	r3, r1, #0, #24
	ldr	r1, .L35+124
	str	r3, [fp, #-48]
	str	r3, [r7, #8]
	ldr	r10, [r6, #68]
	blx	r10
	ldr	r2, [r4, #2940]
	mov	r3, #0
	ldr	ip, [r4, #2972]
	bfi	r3, r2, #0, #25
	str	r3, [fp, #-48]
	add	r2, r5, #66
	ldr	r1, .L35+124
	mov	r3, r3, lsr #24
	mov	r0, #4
	bfi	r3, ip, #1, #7
	strb	r3, [fp, #-45]
	ldr	r3, [fp, #-48]
	str	r3, [r7, #12]
	ldr	r10, [r6, #68]
	blx	r10
	ldr	r1, [r4, #3004]
	add	r2, r5, #67
	mov	r0, #4
	mov	r3, #0
	add	r5, r5, #4
	bfi	r3, r1, #0, #24
	ldr	r1, .L35+124
	str	r3, [fp, #-48]
	add	r4, r4, r0
	str	r3, [r7, #16]
	mov	r7, r9
	ldr	r10, [r6, #68]
	blx	r10
	cmp	r5, #32
	bne	.L31
	mov	r0, #0
.L27:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L33:
	ldr	r1, .L35
	ldr	r3, .L35+128
	ldr	r2, .L35+132
	ldr	r4, [r1, #68]
	ldr	r1, .L35+136
	blx	r4
	mvn	r0, #0
	b	.L27
.L34:
	ldr	r3, [r10, #68]
	ldr	r2, .L35+132
	ldr	r1, .L35+140
	blx	r3
	mvn	r0, #0
	b	.L27
.L36:
	.align	2
.L35:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC13
	.word	.LANCHOR0+24
	.word	.LC14
	.word	.LC43
	UNWIND(.fnend)
	.size	VP8HAL_V300R001_CfgDnMsg, .-VP8HAL_V300R001_CfgDnMsg
	.align	2
	.global	VP8HAL_V300R001_StartDec
	.type	VP8HAL_V300R001_StartDec, %function
VP8HAL_V300R001_StartDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r1, #1
	mov	r4, r1
	mov	r5, r0
	bhi	.L48
	cmp	r1, #0
	bgt	.L49
	ldr	r3, [r0, #2784]
	cmp	r3, #512
	bhi	.L47
	ldr	r3, [r0, #2788]
	cmp	r3, #512
	bhi	.L47
	movw	r6, #1208
	ldr	r7, .L51
	mul	r6, r6, r1
	add	r8, r6, r7
	ldr	r3, [r6, r7]
	cmp	r3, #0
	beq	.L50
.L44:
	mov	r2, r4
	mov	r1, r8
	mov	r0, r5
	bl	VP8HAL_V300R001_CfgReg
	mov	r2, r4
	mov	r1, r8
	mov	r0, r5
	bl	VP8HAL_V300R001_CfgDnMsg
	mov	r0, #0
.L40:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L50:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L45
	str	r3, [r6, r7]
	b	.L44
.L49:
	ldr	r1, .L51+4
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L51+8
	ldr	r4, [r1, #68]
	ldr	r1, .L51+12
	blx	r4
	mvn	r0, #0
	b	.L40
.L47:
	ldr	r1, .L51+4
	mov	r0, #0
	ldr	r3, .L51+16
	ldr	r2, .L51+8
	ldr	r4, [r1, #68]
	ldr	r1, .L51+20
	blx	r4
	mvn	r0, #0
	b	.L40
.L48:
	ldr	r3, .L51+4
	mov	r0, #0
	ldr	r1, .L51+24
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L40
.L45:
	ldr	r3, .L51+4
	ldr	r1, .L51+28
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L40
.L52:
	.align	2
.L51:
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+52
	.word	.LC1
	.word	.LC48
	.word	.LC14
	.word	.LC47
	.word	.LC2
	UNWIND(.fnend)
	.size	VP8HAL_V300R001_StartDec, .-VP8HAL_V300R001_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.8139, %object
	.size	__func__.8139, 23
__func__.8139:
	.ascii	"VP8HAL_V300R001_CfgReg\000"
	.space	1
	.type	__func__.8165, %object
	.size	__func__.8165, 25
__func__.8165:
	.ascii	"VP8HAL_V300R001_CfgDnMsg\000"
	.space	3
	.type	__func__.8151, %object
	.size	__func__.8151, 25
__func__.8151:
	.ascii	"VP8HAL_V300R001_StartDec\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"VdhId is wrong! MP2HAL_V200R003_CfgReg\012\000" )
.LC1:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC2:
	ASCII(.ascii	"vdm register virtual address not mapped, reset fail" )
	ASCII(.ascii	"ed!\012\000" )
.LC3:
	ASCII(.ascii	"BASIC_CFG0 = 0x%x\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"BASIC_CFG1 = 0x%x\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"AVM_ADDR = 0x%x\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"VAM_ADDR = 0x%x\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"STREAM_BASE_ADDR = 0x%x\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"PPFD_BUF_ADDR = 0x%x\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"PPFD_BUF_LEN = 0x%x\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"YSTADDR_1D = 0x%x\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"YSTRIDE_1D = 0x%x\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"UVOFFSET_1D = 0x%x\012\000" )
.LC13:
	ASCII(.ascii	"can not map down msg virtual address!\000" )
	.space	2
.LC14:
	ASCII(.ascii	"%s: %s\012\000" )
.LC15:
	ASCII(.ascii	"D0 = 0x%x\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"D1 = 0x%x\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"D2 = 0x%x\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"D3 = 0x%x\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"D4 = 0x%x\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"D5 = 0x%x\012\000" )
	.space	1
.LC21:
	ASCII(.ascii	"D6 = 0x%x\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"D7 = 0x%x\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"D8 = 0x%x\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"D9 = 0x%x\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"D16 = 0x%x\012\000" )
.LC26:
	ASCII(.ascii	"D17 = 0x%x\012\000" )
.LC27:
	ASCII(.ascii	"D18 = 0x%x\012\000" )
.LC28:
	ASCII(.ascii	"D19 = 0x%x\012\000" )
.LC29:
	ASCII(.ascii	"D20 = 0x%x\012\000" )
.LC30:
	ASCII(.ascii	"D21 = 0x%x\012\000" )
.LC31:
	ASCII(.ascii	"D22 = 0x%x\012\000" )
.LC32:
	ASCII(.ascii	"D23 = 0x%x\012\000" )
.LC33:
	ASCII(.ascii	"D24 = 0x%x\012\000" )
.LC34:
	ASCII(.ascii	"D25 = 0x%x\012\000" )
.LC35:
	ASCII(.ascii	"D32 = 0x%x\012\000" )
.LC36:
	ASCII(.ascii	"D33 = 0x%x\012\000" )
.LC37:
	ASCII(.ascii	"D34 = 0x%x\012\000" )
.LC38:
	ASCII(.ascii	"D35 = 0x%x\012\000" )
.LC39:
	ASCII(.ascii	"D36 = 0x%x\012\000" )
.LC40:
	ASCII(.ascii	"D37 = 0x%x\012\000" )
.LC41:
	ASCII(.ascii	"D38 = 0x%x\012\000" )
.LC42:
	ASCII(.ascii	"D39 = 0x%x\012\000" )
.LC43:
	ASCII(.ascii	"%s: u8Tmp = NULL\012\000" )
	.space	2
.LC44:
	ASCII(.ascii	"D40 = 0x%x\012\000" )
.LC45:
	ASCII(.ascii	"D63 = 0x%x\012\000" )
.LC46:
	ASCII(.ascii	"D%d = 0x%x\012\000" )
.LC47:
	ASCII(.ascii	"VdhId is wrong! VP8HAL_V200R003_StartDec\012\000" )
	.space	2
.LC48:
	ASCII(.ascii	"picture width out of range\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
