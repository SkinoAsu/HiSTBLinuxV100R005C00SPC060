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
	.file	"vdm_hal_vp6.c"
	.text
	.align	2
	.global	VP6HAL_V300R001_CfgReg
	.type	VP6HAL_V300R001_CfgReg, %function
VP6HAL_V300R001_CfgReg:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	cmp	r2, #1
	mov	r7, r2
	mov	r5, r0
	mov	r9, r1
	bhi	.L23
	cmp	r2, #0
	bgt	.L24
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L25
.L6:
	ldrh	r2, [r5, #52]
	movw	r8, #1208
	ldrh	r3, [r5, #54]
	mov	r10, #0
	mul	r8, r8, r7
	ldr	r4, .L27
	mul	r3, r3, r2
	mov	r1, r10
	mov	r2, #0
	bfi	r2, r10, #7, #1
	ldr	r6, .L27+4
	mov	r0, #3
	sub	r3, r3, #1
	ldr	ip, [r4, r8]
	bfi	r1, r3, #0, #20
	str	r1, [fp, #-48]
	strb	r2, [fp, #-45]
	ldr	r2, [fp, #-48]
	ldr	r1, .L27+8
	str	r2, [ip, #8]
	ldr	r3, [r6, #68]
	blx	r3
	mov	r3, #536870912
	str	r3, [fp, #-48]
	mov	r3, #10
	ldrh	ip, [fp, #-46]
	mov	r0, #3
	ldr	r1, [r5, #188]
	bfi	ip, r10, #0, #12
	strb	r3, [fp, #-48]
	ldrh	r3, [fp, #-48]
	ldr	lr, [r5, #192]
	mov	r2, ip, lsr #8
	mov	r1, r1, lsr #6
	and	r2, r2, #223
	bfi	r3, r1, #4, #9
	bfi	r2, lr, #6, #1
	strh	r3, [fp, #-48]	@ movhi
	ubfx	r3, r3, #8, #5
	strh	ip, [fp, #-46]	@ movhi
	orr	r3, r3, #192
	bfi	r2, r10, #7, #1
	strb	r3, [fp, #-47]
	strb	r2, [fp, #-45]
	ldr	r3, [fp, #-48]
	ldr	ip, [r4, r8]
	ldr	r1, .L27+12
	mov	r2, r3
	str	r3, [ip, #12]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r9, #48]
	mov	r0, #3
	ldr	r1, .L27+16
	bic	r2, r2, #15
	str	r2, [r3, #16]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r9, #32]
	mov	r0, #3
	ldr	r1, .L27+20
	bic	r2, r2, #15
	str	r2, [r3, #20]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r5, #56]
	mov	r0, #3
	ldr	r1, .L27+24
	str	r2, [r3, #24]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r9, #1156]
	mov	r0, #3
	ldr	r1, .L27+28
	bic	r2, r2, #15
	str	r2, [r3, #128]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r2, [r9, #1160]
	str	r10, [fp, #-48]
	mov	r0, #3
	ldr	r3, [r4, r8]
	strh	r2, [fp, #-48]	@ movhi
	ldr	r2, [fp, #-48]
	ldr	r1, .L27+32
	str	r2, [r3, #132]
	ldr	r3, [r6, #68]
	blx	r3
	ldrh	r3, [r5, #52]
	cmp	r3, #256
	bhi	.L10
	movw	r0, #49156
	movt	r0, 63683
	bl	MEM_ReadPhyWord
	orr	r1, r0, #65536
.L8:
	movw	r8, #1208
	ldr	r3, .L27+36
	mul	r8, r8, r7
	ldr	r0, [r3]
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	movw	r3, #3075
	ldr	r2, [r4, r8]
	movt	r3, 48
	ldr	r1, .L27+40
	mov	r0, #3
	str	r3, [r2, #60]
	ldr	r2, [r4, r8]
	str	r3, [r2, #64]
	ldr	r2, [r4, r8]
	str	r3, [r2, #68]
	ldr	r2, [r4, r8]
	str	r3, [r2, #72]
	ldr	r2, [r4, r8]
	str	r3, [r2, #76]
	ldr	r2, [r4, r8]
	str	r3, [r2, #80]
	ldr	r2, [r4, r8]
	str	r3, [r2, #84]
	ldr	r3, [r4, r8]
	ldr	r2, [r5, #172]
	bic	r2, r2, #15
	str	r2, [r3, #96]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r8]
	ldr	r2, [r5, #188]
	mov	r0, #3
	ldr	r1, .L27+44
	str	r2, [r3, #100]
	ldr	r3, [r6, #68]
	blx	r3
	ldrh	r3, [r5, #52]
	cmp	r3, #0
	mov	r3, r3, asl #4
	ble	.L13
	cmp	r3, #2048
	movle	r9, #16
	ble	.L9
.L13:
	sub	r2, r3, #2048
	sub	r2, r2, #1
	cmp	r2, #2048
	movcc	r9, #32
	bcc	.L9
	sub	r2, r3, #4096
	sub	r2, r2, #1
	cmp	r2, #2048
	movcc	r9, #48
	bcs	.L26
.L9:
	ldrh	r1, [r5, #54]
	movw	ip, #1208
	ldr	lr, [r5, #188]
	mov	r0, #3
	add	r2, r1, #1
	mov	r8, #0
	mov	r1, r1, asl #4
	adds	r3, r1, #31
	mov	r2, r2, asr #1
	addmi	r3, r1, #62
	ldr	r1, .L27+48
	mul	r7, ip, r7
	mov	r3, r3, asr #5
	mul	r2, lr, r2
	mov	r3, r3, asl #4
	mla	r2, r9, r3, r2
	ldr	r3, [r4, r7]
	mov	r2, r2, asl #1
	str	r2, [r3, #104]
	ldr	r3, [r6, #68]
	blx	r3
	ldrh	r0, [r5, #54]
	ldr	ip, [r4, r7]
	mov	r2, r8
	ldr	r1, .L27+52
	mov	r0, r0, asl #4
	adds	r3, r0, #31
	addmi	r3, r0, #62
	mov	r0, #3
	bic	r3, r3, #31
	mul	r9, r9, r3
	str	r9, [ip, #108]
	ldr	r3, [r4, r7]
	str	r8, [r3, #152]
	ldr	r3, [r6, #68]
	blx	r3
	ldr	r3, [r4, r7]
	mov	r0, r8
	mvn	r2, #0
	str	r2, [r3, #32]
.L19:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L10:
	movw	r0, #49156
	movt	r0, 63683
	bl	MEM_ReadPhyWord
	uxth	r1, r0
	b	.L8
.L26:
	sub	r3, r3, #6144
	sub	r3, r3, #1
	cmp	r3, #2048
	movcs	r9, #16
	movcc	r9, #64
	b	.L9
.L25:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L7
	str	r3, [r9]
	b	.L6
.L24:
	ldr	r1, .L27+4
	mov	r0, #0
	mov	r3, r2
	str	r0, [sp]
	ldr	r2, .L27+56
	ldr	r4, [r1, #68]
	ldr	r1, .L27+60
	blx	r4
	mvn	r0, #0
	b	.L19
.L23:
	ldr	r3, .L27+4
	mov	r0, #0
	ldr	r1, .L27+64
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L19
.L7:
	ldr	r3, .L27+4
	ldr	r1, .L27+68
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L19
.L28:
	.align	2
.L27:
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	s_RegPhyBaseAddr
	.word	.LC12
	.word	.LC13
	.word	.LC3
	.word	.LC4
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VP6HAL_V300R001_CfgReg, .-VP6HAL_V300R001_CfgReg
	.align	2
	.global	VP6HAL_V300R001_CfgDnMsg
	.type	VP6HAL_V300R001_CfgDnMsg, %function
VP6HAL_V300R001_CfgDnMsg:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	mov	r4, r0
	ldr	r0, [r1, #48]
	mov	r9, r1
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L42
	ldr	r2, [r4, #60]
	mov	r7, #0
	mov	r3, #0
	str	r7, [fp, #-48]
	bfi	r3, r2, #0, #1
	strb	r3, [fp, #-48]
	ldr	r5, .L50
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+4
	ldr	r10, .L50
	str	r2, [r6]
	ldr	r3, [r5, #68]
	blx	r3
	ldrh	r0, [r4, #52]
	ldrh	r1, [r4, #54]
	mov	r2, #0	@ movhi
	sub	r0, r0, #1
	mov	r3, r2	@ movhi
	sub	r1, r1, #1
	bfi	r2, r0, #0, #9
	bfi	r3, r1, #0, #9
	strh	r2, [fp, #-48]	@ movhi
	strh	r3, [fp, #-46]	@ movhi
	mov	r2, r2, lsr #8
	mov	r3, r3, lsr #8
	bfi	r2, r7, #1, #7
	bfi	r3, r7, #1, #7
	strb	r2, [fp, #-47]
	strb	r3, [fp, #-45]
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+8
	str	r2, [r6, #4]
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r3, [r4, #100]
	ldr	ip, [r4, #104]
	mov	r0, #4
	ldr	r1, [r4, #108]
	and	r3, r3, #31
	ldr	r2, [r4, #72]
	bfi	r3, ip, #5, #2
	ldr	ip, [r4, #68]
	mov	r1, r1, lsr #1
	and	r2, r2, #1
	bfi	r3, ip, #7, #1
	str	r7, [fp, #-48]
	bfi	r2, r1, #1, #1
	strb	r3, [fp, #-48]
	strb	r2, [fp, #-47]
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+12
	bfi	r2, r7, #10, #22
	str	r2, [fp, #-48]
	str	r2, [r6, #8]
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r3, [r4, #96]
	ldr	r2, [r4, #92]
	mov	r0, #4
	and	r3, r3, #31
	str	r7, [fp, #-48]
	bfi	r3, r2, #5, #3
	strb	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldr	r1, [r4, #88]
	ldr	r2, [r4, #84]
	bfi	r3, r1, #8, #10
	str	r3, [fp, #-48]
	ldr	r1, .L50+16
	mov	r3, r3, lsr #16
	bfi	r3, r2, #2, #2
	strb	r3, [fp, #-46]
	ldrh	r3, [fp, #-46]
	bfi	r3, r7, #4, #12
	strh	r3, [fp, #-46]	@ movhi
	ldr	r2, [fp, #-48]
	str	r2, [r6, #12]
	ldr	r3, [r5, #68]
	blx	r3
	ldrb	r2, [r4]	@ zero_extendqisi2
	str	r7, [fp, #-48]
	mov	r3, #0
	ldr	r1, [r4, #76]
	bfi	r3, r2, #0, #4
	strb	r3, [fp, #-48]
	mov	r0, #4
	ldrh	r3, [fp, #-48]
	ldr	r2, [r4, #80]
	bfi	r3, r1, #4, #8
	strh	r3, [fp, #-48]	@ movhi
	ldr	r3, [fp, #-48]
	ldr	r1, .L50+20
	bfi	r3, r2, #12, #9
	str	r3, [fp, #-48]
	mov	r3, r3, lsr #16
	bfi	r3, r7, #5, #11
	strh	r3, [fp, #-46]	@ movhi
	ldr	r2, [fp, #-48]
	str	r2, [r6, #16]
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r2, [r4, #160]
	ldr	r1, .L50+24
	mov	r0, #4
	str	r2, [r6, #32]
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r1, [r4, #168]
	ldr	r2, [r4, #164]
	mov	r3, #0
	str	r7, [fp, #-48]
	bfi	r3, r1, #0, #4
	strb	r3, [fp, #-46]
	mov	r0, #4
	ldrh	r3, [fp, #-46]
	strb	r7, [fp, #-47]
	bfi	r3, r7, #4, #12
	strb	r2, [fp, #-48]
	strh	r3, [fp, #-46]	@ movhi
	mov	r7, #0
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+28
	str	r2, [r6, #36]
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r3, [r4, #168]
	ldr	r2, [r4, #116]
	add	r3, r3, #8
	ldr	r0, [r4, #112]
	cmp	r3, r2
	ldr	r1, .L50+32
	addhi	r2, r2, #128
	add	r0, r3, r0
	rsbls	r2, r3, r2
	rsbhi	r2, r3, r2
	mov	r3, r7
	bfi	r3, r0, #0, #25
	str	r3, [fp, #-48]
	mov	r0, #4
	mov	r3, r3, lsr #24
	ldrhi	r8, [r4, #120]
	ldrls	r8, [r4, #120]
	bfi	r3, r2, #1, #7
	strb	r3, [fp, #-45]
	subhi	r8, r8, #16
	ldr	r2, [fp, #-48]
	str	r2, [r6, #64]
	ldr	r3, [r5, #68]
	blx	r3
	mov	r3, r7
	bfi	r3, r8, #0, #24
	str	r3, [fp, #-48]
	strb	r7, [fp, #-45]
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+36
	str	r2, [r6, #68]
	ldr	r3, [r5, #68]
	blx	r3
	ldr	r0, [r4, #120]
	ldr	r3, [r4, #56]
	add	r0, r0, r3
	bl	MEM_Phy2Vir
	cmp	r0, r7
	beq	.L43
.L34:
	ldr	r1, [r4, #124]
	mov	r7, #0
	mov	r3, r7
	ldr	r2, [r4, #128]
	bfi	r3, r1, #0, #25
	str	r3, [fp, #-48]
	ldr	r8, [r5, #68]
	mov	r0, #4
	mov	r3, r3, lsr #24
	ldr	r1, .L50+40
	bfi	r3, r2, #1, #7
	strb	r3, [fp, #-45]
	ldr	r2, [fp, #-48]
	ldr	r10, .L50
	str	r2, [r6, #72]
	blx	r8
	ldr	r1, [r4, #132]
	mov	r2, r7
	ldr	r3, [r5, #68]
	bfi	r2, r1, #0, #24
	str	r2, [fp, #-48]
	strb	r7, [fp, #-45]
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+44
	str	r2, [r6, #76]
	blx	r3
	ldr	r1, [r4, #136]
	mov	r3, r7
	ldr	r2, [r4, #140]
	bfi	r3, r1, #0, #25
	str	r3, [fp, #-48]
	ldr	r8, [r5, #68]
	mov	r0, #4
	mov	r3, r3, lsr #24
	ldr	r1, .L50+48
	bfi	r3, r2, #1, #7
	strb	r3, [fp, #-45]
	ldr	r2, [fp, #-48]
	str	r2, [r6, #80]
	blx	r8
	ldr	r1, [r4, #144]
	mov	r2, r7
	ldr	r3, [r5, #68]
	bfi	r2, r1, #0, #24
	str	r2, [fp, #-48]
	strb	r7, [fp, #-45]
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+52
	str	r2, [r6, #84]
	blx	r3
	ldr	r1, [r4, #148]
	mov	r3, r7
	ldr	r2, [r4, #152]
	bfi	r3, r1, #0, #25
	str	r3, [fp, #-48]
	ldr	r8, [r5, #68]
	mov	r0, #4
	mov	r3, r3, lsr #24
	ldr	r1, .L50+56
	bfi	r3, r2, #1, #7
	strb	r3, [fp, #-45]
	ldr	r2, [fp, #-48]
	str	r2, [r6, #88]
	blx	r8
	ldr	r1, [r4, #156]
	mov	r2, r7
	ldr	r3, [r5, #68]
	bfi	r2, r1, #0, #24
	str	r2, [fp, #-48]
	strb	r7, [fp, #-45]
	mov	r0, #4
	ldr	r2, [fp, #-48]
	ldr	r1, .L50+60
	str	r2, [r6, #92]
	blx	r3
	ldr	r2, [r4, #172]
	ldr	r3, [r5, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L50+64
	str	r2, [r6, #128]
	blx	r3
	ldr	r2, [r4, #176]
	ldr	r3, [r5, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L50+68
	str	r2, [r6, #136]
	blx	r3
	ldr	r2, [r4, #180]
	ldr	r3, [r5, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L50+72
	str	r2, [r6, #140]
	blx	r3
	ldr	r2, [r9, #1136]
	ldr	r3, [r5, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L50+76
	str	r2, [r6, #144]
	blx	r3
	ldr	r2, [r9, #1140]
	ldr	r3, [r5, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L50+80
	str	r2, [r6, #148]
	blx	r3
	ldr	r2, [r9, #1144]
	ldr	r3, [r5, #68]
	mov	r0, #4
	bic	r2, r2, #15
	ldr	r1, .L50+84
	str	r2, [r6, #152]
	blx	r3
	ldr	r8, [r9, #1176]
	ldr	r1, .L50+88
	mov	r0, #4
	bic	r8, r8, #15
	ldr	r3, [r5, #68]
	str	r8, [r6, #156]
	mov	r2, r8
	str	r8, [fp, #-48]
	blx	r3
	mov	r0, r8
	bl	MEM_Phy2Vir
	mov	r6, r0
	ldr	r0, [r9, #1176]
	bl	MEM_Phy2Vir
	cmp	r0, r7
	cmpne	r6, r7
	moveq	r1, #1
	movne	r1, #0
	beq	.L44
	ldr	r3, [r10, #48]
	mov	r2, #4096
	mov	r0, r6
	blx	r3
	ldr	r3, [r10, #52]
	mov	r2, #64
	ldr	r1, [r4, #4]
	mov	r0, r6
	blx	r3
	ldr	r3, [r10, #52]
	mov	r2, #640
	ldr	r1, [r4, #8]
	add	r0, r6, #64
	blx	r3
	ldr	r3, [r10, #52]
	add	r0, r6, #704
	mov	r2, #64
	ldr	r1, [r4, #12]
	blx	r3
	ldr	r3, [r4, #72]
	mov	r0, r8
	cmp	r3, #0
	beq	.L45
	bl	MEM_Phy2Vir
	mov	r6, r0
	adds	r0, r0, #768
	beq	.L46
	ldr	r3, [r10, #52]
	mov	r2, #1536
	ldr	r1, [r4, #44]
	blx	r3
	ldr	r3, [r10, #52]
	mov	r2, #128
	ldr	r1, [r4, #40]
	add	r0, r6, #2304
	blx	r3
	ldr	r3, [r10, #52]
	add	r0, r6, #2432
	mov	r2, #128
	ldr	r1, [r4, #48]
	blx	r3
.L38:
	mov	r0, r8
	bl	MEM_Phy2Vir
	mov	r6, r0
	adds	r0, r0, #2560
	beq	.L47
	ldr	r3, [r5, #52]
	mov	r2, #64
	ldr	r1, [r4, #16]
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #64
	ldr	r1, [r4, #20]
	add	r0, r6, #2624
	ldr	r7, .L50
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #960
	ldr	r1, [r4, #24]
	add	r0, r6, #2688
	blx	r3
	mov	r0, r8
	bl	MEM_Phy2Vir
	adds	r0, r0, #2816
	beq	.L48
	ldr	r3, [r7, #52]
	mov	r2, #960
	ldr	r1, [r4, #24]
	blx	r3
	mov	r0, #0
.L31:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L45:
	bl	MEM_Phy2Vir
	mov	r6, r0
	adds	r0, r0, #768
	beq	.L49
	ldr	r3, [r10, #52]
	mov	r2, #96
	ldr	r1, [r4, #28]
	blx	r3
	ldr	r3, [r10, #52]
	ldr	r1, [r4, #36]
	mov	r2, #32
	add	r0, r6, #864
	blx	r3
	ldr	r3, [r10, #52]
	add	r0, r6, #896
	mov	r2, #576
	ldr	r1, [r4, #32]
	blx	r3
	b	.L38
.L43:
	ldr	r3, [r10, #68]
	movw	r2, #483
	ldr	r1, .L50+92
	mov	r0, #1
	blx	r3
	b	.L34
.L44:
	mov	r3, r0
	str	r6, [sp]
	ldr	r4, [r10, #68]
	mov	r0, r7
	ldr	r2, .L50+96
	ldr	r1, .L50+100
	blx	r4
	mvn	r0, #0
	b	.L31
.L42:
	ldr	r1, .L50
	ldr	r3, .L50+104
	ldr	r2, .L50+96
	ldr	r4, [r1, #68]
	ldr	r1, .L50+108
	blx	r4
	mvn	r0, #0
	b	.L31
.L48:
	ldr	r3, [r7, #68]
	movw	r2, #693
	ldr	r1, .L50+112
	blx	r3
	mvn	r0, #0
	b	.L31
.L47:
	ldr	r3, [r5, #68]
	mov	r2, #672
	ldr	r1, .L50+112
	blx	r3
	mvn	r0, #0
	b	.L31
.L46:
	ldr	r3, [r10, #68]
	mov	r2, #648
	ldr	r1, .L50+112
	blx	r3
	mvn	r0, #0
	b	.L31
.L49:
	ldr	r3, [r10, #68]
	movw	r2, #622
	ldr	r1, .L50+112
	blx	r3
	mvn	r0, #0
	b	.L31
.L51:
	.align	2
.L50:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
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
	.word	.LC25
	.word	.LANCHOR0+24
	.word	.LC39
	.word	.LC14
	.word	.LC15
	.word	.LC40
	UNWIND(.fnend)
	.size	VP6HAL_V300R001_CfgDnMsg, .-VP6HAL_V300R001_CfgDnMsg
	.align	2
	.global	VP6HAL_V300R001_StartDec
	.type	VP6HAL_V300R001_StartDec, %function
VP6HAL_V300R001_StartDec:
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
	bhi	.L63
	cmp	r1, #0
	bgt	.L64
	ldrh	r3, [r0, #52]
	sub	r3, r3, #1
	cmp	r3, #512
	bcs	.L65
	ldrh	r3, [r0, #54]
	sub	r3, r3, #1
	cmp	r3, #512
	bcs	.L66
	movw	r6, #1208
	ldr	r7, .L68
	mul	r6, r6, r1
	add	r8, r6, r7
	ldr	r3, [r6, r7]
	cmp	r3, #0
	beq	.L67
.L59:
	mov	r2, r4
	mov	r1, r8
	mov	r0, r5
	bl	VP6HAL_V300R001_CfgReg
	mov	r2, r4
	mov	r1, r8
	mov	r0, r5
	bl	VP6HAL_V300R001_CfgDnMsg
	mov	r0, #0
.L55:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L67:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L60
	str	r3, [r6, r7]
	b	.L59
.L64:
	ldr	r1, .L68+4
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L68+8
	ldr	r4, [r1, #68]
	ldr	r1, .L68+12
	blx	r4
	mvn	r0, #0
	b	.L55
.L63:
	ldr	r3, .L68+4
	mov	r0, #0
	ldr	r1, .L68+16
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L55
.L65:
	ldr	r1, .L68+4
	mov	r0, #0
	ldr	r3, .L68+20
.L62:
	ldr	r4, [r1, #68]
	ldr	r2, .L68+8
	ldr	r1, .L68+24
	blx	r4
	mvn	r0, #0
	b	.L55
.L66:
	ldr	r1, .L68+4
	mov	r0, #0
	ldr	r3, .L68+28
	b	.L62
.L60:
	ldr	r3, .L68+4
	ldr	r1, .L68+32
	ldr	r3, [r3, #68]
	blx	r3
	mvn	r0, #0
	b	.L55
.L69:
	.align	2
.L68:
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+52
	.word	.LC1
	.word	.LC41
	.word	.LC42
	.word	.LC15
	.word	.LC43
	.word	.LC2
	UNWIND(.fnend)
	.size	VP6HAL_V300R001_StartDec, .-VP6HAL_V300R001_StartDec
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.8502, %object
	.size	__func__.8502, 23
__func__.8502:
	.ascii	"VP6HAL_V300R001_CfgReg\000"
	.space	1
	.type	__func__.8517, %object
	.size	__func__.8517, 25
__func__.8517:
	.ascii	"VP6HAL_V300R001_CfgDnMsg\000"
	.space	3
	.type	__func__.8487, %object
	.size	__func__.8487, 25
__func__.8487:
	.ascii	"VP6HAL_V300R001_StartDec\000"
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
	ASCII(.ascii	"UVOFFSET_1D = 0x%x\012\000" )
.LC4:
	ASCII(.ascii	"FF_APT_EN = 0x%x\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"BASIC_CFG0 = 0x%x\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"BASIC_CFG1 = 0x%x\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"AVM_ADDR = 0x%x\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"VAM_ADDR = 0x%x\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"STREAM_BASE_ADDR = 0x%x\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"PPFD_V300R001_BUF_ADDR = 0x%x\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"PPFD_V200R003_BUF_LEN = 0x%x\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"YSTADDR_1D = 0x%x\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"YSTRIDE_1D = 0x%x\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"can not map down msg virtual address!\000" )
	.space	2
.LC15:
	ASCII(.ascii	"%s: %s\012\000" )
.LC16:
	ASCII(.ascii	"D0 = 0x%x\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"D1 = 0x%x\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"D2 = 0x%x\012\000" )
	.space	1
.LC19:
	ASCII(.ascii	"D3 = 0x%x\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"D4 = 0x%x\012\000" )
	.space	1
.LC21:
	ASCII(.ascii	"D8 = 0x%x\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"D9 = 0x%x\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"D16 = 0x%x\012\000" )
.LC24:
	ASCII(.ascii	"D17 = 0x%x\012\000" )
.LC25:
	ASCII(.ascii	"LINE:%d NULL == tmpAddr.\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"D18 = 0x%x\012\000" )
.LC27:
	ASCII(.ascii	"D19 = 0x%x\012\000" )
.LC28:
	ASCII(.ascii	"D20 = 0x%x\012\000" )
.LC29:
	ASCII(.ascii	"D21 = 0x%x\012\000" )
.LC30:
	ASCII(.ascii	"D22 = 0x%x\012\000" )
.LC31:
	ASCII(.ascii	"D23 = 0x%x\012\000" )
.LC32:
	ASCII(.ascii	"D32 = 0x%x\012\000" )
.LC33:
	ASCII(.ascii	"D34 = 0x%x\012\000" )
.LC34:
	ASCII(.ascii	"D35 = 0x%x\012\000" )
.LC35:
	ASCII(.ascii	"D36 = 0x%x\012\000" )
.LC36:
	ASCII(.ascii	"D37 = 0x%x\012\000" )
.LC37:
	ASCII(.ascii	"D38 = 0x%x\012\000" )
.LC38:
	ASCII(.ascii	"D39 = 0x%x\012\000" )
.LC39:
	ASCII(.ascii	"%s: tmpAddr(%p) = NULL / TabBaseAddr(%p) = NULL\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC40:
	ASCII(.ascii	"line: %d  NULL == TabBaseAddr.\012\000" )
.LC41:
	ASCII(.ascii	"VdhId is wrong! MP2HAL_V200R003_StartDec\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"picture width out of range\000" )
	.space	1
.LC43:
	ASCII(.ascii	"picture height out of range\000" )
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
