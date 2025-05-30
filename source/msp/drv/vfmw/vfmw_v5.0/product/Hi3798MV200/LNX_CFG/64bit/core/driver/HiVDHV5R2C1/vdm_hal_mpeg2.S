#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal_mpeg2.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	MP2HAL_V5R2C1_InitHal
	.type	MP2HAL_V5R2C1_InitHal, %function
MP2HAL_V5R2C1_InitHal:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	MP2HAL_V5R2C1_InitHal, .-MP2HAL_V5R2C1_InitHal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_V5R2C1_WriteSliceMsg
	.type	MP2HAL_V5R2C1_WriteSliceMsg, %function
MP2HAL_V5R2C1_WriteSliceMsg:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x26, x21, 236
	mov	x20, x1
	mov	w19, w2
	mov	w22, w3
	str	x21, [x29, 96]
	bl	_mcount
	add	x1, x21, 45056
	ldr	w0, [x26, 32]
	mov	w23, 0
	ldr	w25, [x1, 236]
	cbnz	w0, .L26
.L3:
	cmp	w25, wzr
	ble	.L23
	ldr	x28, .LC15
	add	w0, w19, w23, lsl 5
	mov	w24, 0
	str	w0, [x29, 108]
	.p2align 2
.L18:
	cmp	w24, wzr
	mov	w21, 44
	ble	.L27
	smaddl	x21, w24, w21, x26
	sxtw	x19, w24
	ldr	w0, [x21, -12]
	ldr	w1, [x21, 32]
	cmp	w1, w0
	bls	.L9
.L8:
	ldr	w27, [x21]
	mov	w2, 0
	ldr	w7, [x21, 8]
	mov	w1, 0
	ldr	w0, [x21, 16]
	ubfiz	w8, w27, 3, 4
	bfi	w2, w7, 0, 24
	str	w2, [x29, 124]
	add	w0, w8, w0
	add	x19, x19, x23, sxtw
	bfi	w1, w0, 0, 7
	strb	w1, [x29, 127]
	lsl	x19, x19, 5
	ldr	x1, .LC1
	ldr	w7, [x29, 124]
	mov	w0, 4
	mov	w2, w7
	str	w7, [x20, x19]
	bl	dprint_vfmw
	add	x8, x19, 4
	and	w6, w27, -16
	sub	w6, w6, w22
	mov	w7, 0
	bfi	w7, w6, 0, 24
	ldr	x1, .LC3
	str	w7, [x20, x8]
	mov	w2, w7
	mov	w0, 4
	str	w7, [x29, 124]
	bl	dprint_vfmw
	ldr	w27, [x21, 4]
	ldr	w1, [x21, 12]
	mov	w2, 0
	ldr	w0, [x21, 20]
	ubfiz	w7, w27, 3, 4
	bfi	w2, w1, 0, 24
	mov	w1, 0
	str	w2, [x29, 124]
	add	w0, w7, w0
	bfi	w1, w0, 0, 7
	add	x7, x19, 8
	strb	w1, [x29, 127]
	mov	w0, 4
	ldr	x1, .LC5
	ldr	w2, [x29, 124]
	str	w2, [x20, x7]
	bl	dprint_vfmw
	ldr	w0, [x21, 4]
	cbz	w0, .L10
	and	w6, w27, -16
	mov	w0, 0
	sub	w6, w6, w22
	bfi	w0, w6, 0, 24
	str	w0, [x29, 124]
.L11:
	add	x6, x19, 12
	ldr	w7, [x29, 124]
	ldr	x1, .LC7
	mov	w0, 4
	mov	w2, w7
	add	w24, w24, 1
	str	w7, [x20, x6]
	bl	dprint_vfmw
	str	wzr, [x29, 124]
	ldp	w1, w2, [x21, 36]
	mov	w0, 0
	add	x6, x19, 16
	bfi	w0, w2, 0, 6
	bfi	w0, w1, 6, 1
	strb	w0, [x29, 124]
	ldr	x1, .LC9
	mov	w0, 4
	ldr	w2, [x29, 124]
	str	w2, [x20, x6]
	bl	dprint_vfmw
	ldr	w0, [x21, 32]
	add	x7, x19, 20
	mov	w6, 0
	ldr	x1, .LC11
	bfi	w6, w0, 0, 20
	mov	w0, 4
	str	w6, [x20, x7]
	mov	w2, w6
	str	w6, [x29, 124]
	bl	dprint_vfmw
	cmp	w25, w24
	ble	.L12
	mov	w1, 44
	ldr	w2, [x21, 32]
	smaddl	x0, w24, w1, x26
	ldr	w0, [x0, 32]
	cmp	w2, w0
	bcs	.L14
	b	.L12
	.p2align 3
.L15:
	ldr	w0, [x0, 32]
	cmp	w0, w2
	bhi	.L12
.L14:
	add	w24, w24, 1
	cmp	w25, w24
	smaddl	x0, w24, w1, x26
	bgt	.L15
.L12:
	cmp	w25, w24
	beq	.L28
	mov	w0, 44
	ldr	w1, [x29, 108]
	smaddl	x0, w24, w0, x26
	add	w27, w1, w24, lsl 5
	mov	w21, w27
	ldr	w0, [x0, 32]
	sub	w0, w0, #1
.L17:
	add	x8, x19, 24
	mov	w6, 0
	bfi	w6, w0, 0, 20
	ldr	x1, .LC13
	mov	w2, w6
	mov	w0, 4
	str	w6, [x20, x8]
	add	x19, x19, 28
	str	w6, [x29, 124]
	sub	w24, w24, #1
	bl	dprint_vfmw
	str	w27, [x29, 124]
	mov	w2, w27
	mov	x1, x28
	mov	w0, 4
	str	w21, [x20, x19]
	bl	dprint_vfmw
.L9:
	add	w24, w24, 1
	cmp	w25, w24
	bgt	.L18
.L23:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L10:
	str	wzr, [x29, 124]
	b	.L11
	.p2align 3
.L28:
	ldr	x1, [x29, 96]
	mov	w21, 0
	mov	w27, 0
	ldrh	w0, [x1, 150]
	ldrh	w1, [x1, 146]
	mul	w0, w0, w1
	sub	w0, w0, #1
	b	.L17
	.p2align 3
.L27:
	smaddl	x21, w24, w21, x26
	sxtw	x19, w24
	b	.L8
.L26:
	ldr	x0, [x29, 96]
	mov	w3, 1
	mov	w1, 0
	ldr	w21, [x0, 236]
	ldr	w0, [x26, 16]
	ubfiz	w2, w21, 3, 4
	str	w3, [x29, 124]
	add	w0, w2, w0
	bfi	w1, w0, 0, 7
	strb	w1, [x29, 127]
	ldr	x1, .LC1
	mov	w0, 4
	ldr	w2, [x29, 124]
	str	w2, [x20]
	bl	dprint_vfmw
	and	w0, w21, -16
	mov	w3, 0
	sub	w0, w0, w22
	ldr	x1, .LC3
	bfi	w3, w0, 0, 24
	mov	w0, 4
	mov	w2, w3
	str	w3, [x20, 4]
	str	w3, [x29, 124]
	bl	dprint_vfmw
	ldr	w21, [x26, 4]
	ldr	w0, [x26, 20]
	mov	w1, 0
	ubfiz	w2, w21, 3, 4
	str	wzr, [x29, 124]
	add	w0, w2, w0
	bfi	w1, w0, 0, 7
	strb	w1, [x29, 127]
	ldr	x1, .LC5
	mov	w0, 4
	ldr	w2, [x29, 124]
	str	w2, [x20, 8]
	bl	dprint_vfmw
	ldr	w0, [x26, 4]
	cbnz	w0, .L29
	str	wzr, [x29, 124]
.L5:
	ldr	w2, [x29, 124]
	mov	w0, 4
	ldr	x1, .LC7
	mov	w23, 1
	str	w2, [x20, 12]
	bl	dprint_vfmw
	str	wzr, [x29, 124]
	ldp	w2, w1, [x26, 36]
	mov	w0, 0
	bfi	w0, w1, 0, 6
	ldr	x1, .LC9
	bfi	w0, w2, 6, 1
	strb	w0, [x29, 124]
	mov	w0, 4
	ldr	w2, [x29, 124]
	str	w2, [x20, 16]
	bl	dprint_vfmw
	str	wzr, [x20, 20]
	ldr	x1, .LC11
	mov	w2, 0
	mov	w0, 4
	str	wzr, [x29, 124]
	bl	dprint_vfmw
	ldr	w2, [x26, 32]
	mov	w3, 0
	ldr	x1, .LC13
	mov	w0, 4
	sub	w2, w2, #1
	bfi	w3, w2, 0, 20
	str	w3, [x20, 24]
	mov	w2, w3
	str	w3, [x29, 124]
	bl	dprint_vfmw
	add	w0, w19, 32
	str	w0, [x20, 28]
	b	.L3
.L29:
	and	w0, w21, -16
	mov	w1, 0
	sub	w0, w0, w22
	bfi	w1, w0, 0, 24
	str	w1, [x29, 124]
	b	.L5
	.size	MP2HAL_V5R2C1_WriteSliceMsg, .-MP2HAL_V5R2C1_WriteSliceMsg
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_V5R2C1_MakeReg
	.type	MP2HAL_V5R2C1_MakeReg, %function
MP2HAL_V5R2C1_MakeReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x20, x2
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldrh	w2, [x20, 146]
	mov	w3, 3
	ldrh	w0, [x20, 150]
	ldr	x1, [x19, 16]
	mul	w0, w0, w2
	ldr	w2, [x1]
	sub	w0, w0, #1
	bfi	w2, w0, 0, 20
	str	w2, [x1]
	mov	w2, 1
	ldr	x1, [x19, 16]
	ldrb	w0, [x1, 3]
	orr	w0, w0, 64
	strb	w0, [x1, 3]
	ldr	x1, [x19, 16]
	ldrb	w0, [x1, 3]
	and	w0, w0, 127
	strb	w0, [x1, 3]
	ldr	x0, [x19, 24]
	ldrb	w1, [x0]
	bfi	w1, w3, 0, 4
	strb	w1, [x0]
	ldr	x1, [x19, 24]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 64
	strb	w0, [x1, 1]
	ldr	x1, [x19, 24]
	ldrb	w0, [x1, 1]
	and	w0, w0, 127
	strb	w0, [x1, 1]
	ldr	x0, [x19, 24]
	ldrh	w1, [x0, 2]
	bfi	w1, w2, 0, 12
	strh	w1, [x0, 2]
	ldr	x0, [x19, 24]
	ldrh	w1, [x20, 150]
	cmp	w1, 120
	ldrb	w1, [x0, 3]
	cset	w2, le
	bfi	w1, w2, 5, 1
	strb	w1, [x0, 3]
	mov	w2, 2
	ldr	x1, [x19, 24]
	ldrb	w0, [x1, 3]
	and	w0, w0, 127
	strb	w0, [x1, 3]
	ldr	x1, [x19, 24]
	ldrb	w0, [x1, 3]
	and	w0, w0, -17
	strb	w0, [x1, 3]
	ldr	x1, [x19, 24]
	ldrb	w0, [x1, 3]
	and	w0, w0, -65
	strb	w0, [x1, 3]
	ldr	x1, [x19, 120]
	ldrb	w0, [x1]
	and	w0, w0, -2
	strb	w0, [x1]
	ldr	x0, [x19, 112]
	str	wzr, [x0]
	ldr	x0, [x19, 112]
	ldr	w3, [x20, 196]
	ldrb	w1, [x0]
	bfi	w1, w3, 0, 2
	strb	w1, [x0]
	ldr	x0, [x19, 112]
	ldr	w3, [x20, 192]
	ldrb	w1, [x0]
	bfi	w1, w3, 2, 2
	strb	w1, [x0]
	ldr	x1, [x19, 32]
	ldr	w0, [x21, 72]
	and	w0, w0, -16
	str	w0, [x1]
	ldr	x1, [x19, 40]
	ldr	w0, [x21, 56]
	and	w0, w0, -16
	str	w0, [x1]
	ldr	x1, [x19, 56]
	ldr	w0, [x20, 188]
	and	w0, w0, -256
	str	w0, [x1]
	ldrb	w1, [x20, 3]
	ldr	x3, [x19, 64]
	sub	w1, w1, #1
	ldrh	w0, [x20, 146]
	ldrh	w4, [x20, 150]
	uxtb	w1, w1
	str	w4, [x3]
	cmp	w1, w2
	csinc	w1, w2, wzr, cc
	ldrh	w3, [x20, 150]
	ldr	x2, [x19, 72]
	mul	w0, w1, w0
	mul	w0, w0, w3
	lsl	w0, w0, 8
	str	w0, [x2]
	ldr	w0, [x20, 172]
	cbz	w0, .L35
	ldr	w0, [x20, 164]
	ldr	w2, [x20, 156]
	ldr	x1, [x19, 48]
	add	w0, w2, w0, lsr 3
	and	w0, w0, -16
	str	w0, [x1]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L35:
	ldr	w0, [x20, 160]
	ldr	w2, [x20, 152]
	ldr	x1, [x19, 48]
	add	w0, w2, w0, lsr 3
	and	w0, w0, -16
	str	w0, [x1]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2HAL_V5R2C1_MakeReg, .-MP2HAL_V5R2C1_MakeReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_V5R2C1_MakeDnMsg
	.type	MP2HAL_V5R2C1_MakeDnMsg, %function
MP2HAL_V5R2C1_MakeDnMsg:
	sub	sp, sp, #80
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	mov	x19, x2
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrh	w0, [x19, 150]
	cmp	w0, 512
	bhi	.L58
	ldrh	w1, [x19, 146]
	cmp	w1, 512
	bhi	.L59
	ldr	x1, [x21]
	sub	w0, w0, #1
	ldrh	w2, [x1]
	bfi	w2, w0, 0, 9
	strh	w2, [x1]
	ldr	x1, [x21]
	ldrh	w0, [x19, 146]
	ldrh	w2, [x1, 2]
	sub	w0, w0, #1
	bfi	w2, w0, 0, 9
	strh	w2, [x1, 2]
	ldr	x0, [x21]
	ldr	w2, [x19, 176]
	ldrb	w1, [x0, 3]
	bfi	w1, w2, 1, 1
	strb	w1, [x0, 3]
	ldr	x0, [x21, 8]
	ldrb	w2, [x19, 5]
	ldrb	w1, [x0]
	bfi	w1, w2, 0, 1
	strb	w1, [x0]
	ldr	x0, [x21, 8]
	ldrb	w2, [x19, 3]
	ldrb	w1, [x0, 1]
	bfi	w1, w2, 0, 2
	strb	w1, [x0, 1]
	ldr	x0, [x21, 8]
	ldrb	w2, [x19, 4]
	ldrb	w1, [x0, 1]
	bfi	w1, w2, 2, 1
	strb	w1, [x0, 1]
	ldr	x0, [x21, 8]
	ldrb	w2, [x19, 7]
	ldrb	w1, [x0, 2]
	bfi	w1, w2, 0, 1
	strb	w1, [x0, 2]
	ldr	x0, [x21, 8]
	ldrb	w2, [x19]
	ldrb	w1, [x0, 3]
	bfi	w1, w2, 0, 3
	strb	w1, [x0, 3]
	ldr	x0, [x21, 8]
	ldrb	w1, [x0, 3]
	ldrb	w2, [x19, 2]
	bfi	w1, w2, 3, 1
	strb	w1, [x0, 3]
	ldr	x0, [x21, 8]
	ldrb	w2, [x19, 1]
	ldrb	w1, [x0, 3]
	bfi	w1, w2, 4, 1
	strb	w1, [x0, 3]
	ldr	x0, [x21, 16]
	ldrb	w2, [x19, 15]
	ldrb	w1, [x0]
	bfi	w1, w2, 0, 4
	strb	w1, [x0]
	ldr	x0, [x21, 16]
	ldrb	w2, [x19, 14]
	ldrb	w1, [x0, 1]
	bfi	w1, w2, 0, 4
	strb	w1, [x0, 1]
	ldr	x0, [x21, 16]
	ldrb	w2, [x19, 13]
	ldrb	w1, [x0, 2]
	bfi	w1, w2, 0, 4
	strb	w1, [x0, 2]
	ldr	x0, [x21, 16]
	ldrb	w2, [x19, 12]
	ldrb	w1, [x0, 3]
	bfi	w1, w2, 0, 4
	strb	w1, [x0, 3]
	ldr	x0, [x21, 16]
	ldrb	w2, [x19, 6]
	ldrb	w1, [x0, 3]
	bfi	w1, w2, 7, 1
	strb	w1, [x0, 3]
	ldr	x0, [x21, 24]
	ldrb	w2, [x19, 11]
	ldrb	w1, [x0]
	bfi	w1, w2, 0, 2
	strb	w1, [x0]
	ldr	x0, [x21, 24]
	ldrb	w1, [x0, 1]
	ldrb	w2, [x19, 10]
	bfi	w1, w2, 0, 1
	strb	w1, [x0, 1]
	ldr	x0, [x21, 24]
	ldrb	w2, [x19, 9]
	ldrb	w1, [x0, 2]
	bfi	w1, w2, 0, 1
	strb	w1, [x0, 2]
	ldr	x0, [x21, 24]
	ldrb	w2, [x19, 8]
	ldrb	w1, [x0, 3]
	bfi	w1, w2, 0, 1
	strb	w1, [x0, 3]
	ldr	x1, [x21, 32]
	ldr	w0, [x19, 180]
	and	w0, w0, -16
	str	w0, [x1]
	ldr	x1, [x21, 40]
	ldr	w0, [x19, 184]
	and	w0, w0, -16
	str	w0, [x1]
	ldr	x1, [x21, 48]
	ldr	w0, [x19, 200]
	and	w0, w0, -16
	str	w0, [x1]
	ldr	x1, [x21, 56]
	ldr	w0, [x19, 224]
	and	w0, w0, -16
	str	w0, [x1]
	ldr	w0, [x19, 152]
	bl	MEM_Phy2Vir
	mov	x22, x0
	ldr	w0, [x19, 156]
	bl	MEM_Phy2Vir
	mov	x24, x0
	ldr	w0, [x19, 172]
	cbz	w0, .L60
	ldp	w0, w23, [x19, 160]
	ldp	w3, w1, [x19, 152]
	ldr	x2, [x21, 64]
	add	w0, w3, w0, lsr 3
	add	w23, w1, w23, lsr 3
	and	w3, w23, -16
	and	w1, w0, -16
	sub	w1, w1, w3
	ldr	w3, [x2]
	and	w0, w0, 15
	bfi	w3, w1, 0, 24
	str	w3, [x2]
	ldr	x1, [x21, 72]
	ldr	w3, [x19, 168]
	ldr	w2, [x1]
	bfi	w2, w3, 0, 24
	str	w2, [x1]
	ldr	x2, [x21, 72]
	ldr	w1, [x19, 160]
	ldrb	w3, [x2, 3]
	and	w1, w1, 7
	add	w0, w1, w0, lsl 3
	bfi	w3, w0, 0, 7
	strb	w3, [x2, 3]
	cbz	x22, .L43
	ldr	w1, [x19, 160]
	ubfx	x1, x1, 3, 29
	add	x0, x22, x1
	ldrb	w2, [x22, x1]
	ldrb	w1, [x0, 7]
	ldrb	w7, [x0, 5]
	ldrb	w6, [x0, 4]
	ldrb	w5, [x0, 3]
	ldrb	w4, [x0, 2]
	ldrb	w3, [x0, 1]
	str	w1, [sp, 8]
	ldr	x1, .LC28
	ldrb	w0, [x0, 6]
	str	w0, [sp]
	mov	w0, 8
	bl	dprint_vfmw
	ldr	w2, [x19, 168]
	ldr	w1, [x19, 160]
	cmp	w2, wzr
	add	w0, w2, 7
	csel	w0, w0, w2, lt
	ubfx	x1, x1, 3, 29
	asr	w0, w0, 3
	add	x0, x1, x0, sxtw
	ldr	x1, .LC30
	sub	x0, x0, #8
	add	x8, x22, x0
	ldrb	w2, [x22, x0]
	ldrb	w0, [x8, 7]
	ldrb	w3, [x8, 1]
	ldrb	w7, [x8, 5]
	ldrb	w6, [x8, 4]
	ldrb	w5, [x8, 3]
	ldrb	w4, [x8, 2]
	str	w0, [sp, 8]
	ldrb	w0, [x8, 6]
	str	w0, [sp]
	mov	w0, 9
	bl	dprint_vfmw
	ldr	w3, [x19, 152]
	mov	w0, 22
	ldr	w2, [x19, 168]
	ldr	x1, .LC32
	add	w2, w3, w2
	bl	dprint_vfmw
.L43:
	ldr	x1, [x21, 80]
	and	w23, w23, 15
	ldr	w0, [x1]
	and	w0, w0, -16777216
	str	w0, [x1]
	ldr	x1, [x21, 88]
	ldr	w0, [x19, 172]
	ldr	w2, [x1]
	add	w0, w0, 24
	bfi	w2, w0, 0, 24
	str	w2, [x1]
	ldr	x1, [x21, 88]
	ldr	w0, [x19, 164]
	ldrb	w2, [x1, 3]
	and	w0, w0, 7
	add	w0, w0, w23, lsl 3
	bfi	w2, w0, 0, 7
	strb	w2, [x1, 3]
	cbz	x24, .L44
	ldr	w1, [x19, 164]
	ubfx	x1, x1, 3, 29
	add	x0, x24, x1
	ldrb	w2, [x24, x1]
	ldrb	w1, [x0, 7]
	ldrb	w7, [x0, 5]
	ldrb	w6, [x0, 4]
	ldrb	w5, [x0, 3]
	ldrb	w4, [x0, 2]
	ldrb	w3, [x0, 1]
	str	w1, [sp, 8]
	ldr	x1, .LC34
	ldrb	w0, [x0, 6]
	str	w0, [sp]
	mov	w0, 8
	bl	dprint_vfmw
	ldr	w2, [x19, 172]
	ldr	w1, [x19, 164]
	add	w0, w2, 7
	cmp	w2, wzr
	csel	w0, w0, w2, lt
	ubfx	x1, x1, 3, 29
	asr	w0, w0, 3
	add	x0, x1, x0, sxtw
	ldr	x1, .LC36
	sub	x0, x0, #8
	add	x8, x24, x0
	ldrb	w2, [x24, x0]
	ldrb	w0, [x8, 7]
	ldrb	w7, [x8, 5]
	ldrb	w6, [x8, 4]
	ldrb	w5, [x8, 3]
	ldrb	w4, [x8, 2]
	ldrb	w3, [x8, 1]
	str	w0, [sp, 8]
	ldrb	w0, [x8, 6]
	str	w0, [sp]
	mov	w0, 9
	bl	dprint_vfmw
.L44:
	mov	w6, 0
	.p2align 2
.L42:
	mov	w1, w6
	lsl	w5, w6, 1
	add	w10, w6, 16
.L45:
	add	x0, x21, x5, sxtw 3
	add	x7, x19, x1, sxtw
	add	w4, w1, 16
	add	w3, w1, 32
	add	w2, w1, 48
	add	w1, w1, 8
	ldr	x8, [x0, 96]
	add	x4, x19, x4, sxtw
	ldrb	w9, [x7, 80]
	add	x3, x19, x3, sxtw
	add	x2, x19, x2, sxtw
	cmp	w10, w1
	strb	w9, [x8]
	add	w5, w5, 1
	ldr	x8, [x0, 96]
	ldrb	w9, [x4, 80]
	strb	w9, [x8, 1]
	ldr	x8, [x0, 96]
	ldrb	w9, [x3, 80]
	strb	w9, [x8, 2]
	ldr	x8, [x0, 96]
	ldrb	w9, [x2, 80]
	strb	w9, [x8, 3]
	ldr	x8, [x0, 352]
	ldrb	w7, [x7, 16]
	strb	w7, [x8]
	ldr	x7, [x0, 352]
	ldrb	w4, [x4, 16]
	strb	w4, [x7, 1]
	ldr	x4, [x0, 352]
	ldrb	w3, [x3, 16]
	strb	w3, [x4, 2]
	ldr	x0, [x0, 352]
	ldrb	w2, [x2, 16]
	strb	w2, [x0, 3]
	bne	.L45
	add	w6, w6, 1
	cmp	w6, 8
	bne	.L42
	ldr	x2, [x21, 608]
	mov	w0, 0
	ldr	w1, [x20, 1164]
	and	w1, w1, -16
	str	w1, [x2]
.L38:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L60:
	ldr	x2, [x21, 64]
	ldr	w3, [x19, 152]
	ldr	w0, [x19, 160]
	ldr	w1, [x2]
	and	w1, w1, -16777216
	str	w1, [x2]
	add	w0, w3, w0, lsr 3
	ldr	x2, [x21, 72]
	and	w0, w0, 15
	ldr	w1, [x19, 168]
	ldr	w3, [x2]
	add	w1, w1, 24
	bfi	w3, w1, 0, 24
	str	w3, [x2]
	ldr	x2, [x21, 72]
	ldr	w1, [x19, 160]
	ldrb	w3, [x2, 3]
	and	w1, w1, 7
	add	w0, w1, w0, lsl 3
	bfi	w3, w0, 0, 7
	strb	w3, [x2, 3]
	cbz	x22, .L41
	ldr	w1, [x19, 160]
	ubfx	x1, x1, 3, 29
	add	x0, x22, x1
	ldrb	w2, [x22, x1]
	ldrb	w1, [x0, 7]
	ldrb	w7, [x0, 5]
	ldrb	w6, [x0, 4]
	ldrb	w5, [x0, 3]
	ldrb	w4, [x0, 2]
	ldrb	w3, [x0, 1]
	str	w1, [sp, 8]
	ldr	x1, .LC24
	ldrb	w0, [x0, 6]
	str	w0, [sp]
	mov	w0, 8
	bl	dprint_vfmw
	ldr	w2, [x19, 168]
	ldr	w1, [x19, 160]
	add	w0, w2, 7
	cmp	w2, wzr
	csel	w0, w0, w2, lt
	ubfx	x1, x1, 3, 29
	asr	w0, w0, 3
	add	x0, x1, x0, sxtw
	ldr	x1, .LC26
	sub	x0, x0, #8
	add	x8, x22, x0
	ldrb	w2, [x22, x0]
	ldrb	w0, [x8, 7]
	ldrb	w7, [x8, 5]
	ldrb	w6, [x8, 4]
	ldrb	w5, [x8, 3]
	ldrb	w4, [x8, 2]
	ldrb	w3, [x8, 1]
	str	w0, [sp, 8]
	ldrb	w0, [x8, 6]
	str	w0, [sp]
	mov	w0, 9
	bl	dprint_vfmw
.L41:
	ldr	x1, [x21, 80]
	ldr	w0, [x1]
	and	w0, w0, -16777216
	str	w0, [x1]
	ldr	x1, [x21, 88]
	ldr	w0, [x1]
	and	w0, w0, -16777216
	str	w0, [x1]
	ldr	x1, [x21, 88]
	ldrb	w0, [x1, 3]
	and	w0, w0, -128
	strb	w0, [x1, 3]
	b	.L44
.L59:
	ldr	x3, .LC22
.L57:
	ldr	x2, .LC18
	mov	w0, 0
	ldr	x1, .LC20
	bl	dprint_vfmw
	mov	w0, -1
	b	.L38
.L58:
	ldr	x3, .LC17
	b	.L57
	.size	MP2HAL_V5R2C1_MakeDnMsg, .-MP2HAL_V5R2C1_MakeDnMsg
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC18:
	.xword	.LANCHOR0
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
	.align	3
.LC36:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_V5R2C1_CfgReg
	.type	MP2HAL_V5R2C1_CfgReg, %function
MP2HAL_V5R2C1_CfgReg:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	w19, w2
	mov	x23, x1
	mov	x21, x3
	mov	x20, x4
	bl	_mcount
	str	wzr, [x29, 92]
	cmp	w19, wzr
	bgt	.L89
	ldr	x0, [x23]
	cbz	x0, .L76
.L65:
	ldrh	w2, [x22, 146]
	mov	x3, x20
	ldrh	w1, [x22, 150]
	ldr	w0, [x29, 92]
	mul	w1, w1, w2
	mov	w2, w19
	sub	w1, w1, #1
	bfi	w0, w1, 0, 20
	str	w0, [x29, 92]
	ubfx	x1, x0, 24, 6
	ubfx	x0, x0, 16, 6
	orr	w1, w1, 64
	orr	w0, w0, 64
	orr	w1, w1, 1
	strb	w0, [x29, 94]
	and	w0, w1, -3
	strb	w0, [x29, 95]
	mov	w0, 8
	ldr	w24, [x29, 92]
	mov	w1, w24
	bl	MFDE_ConfigReg
	ldr	x1, .LC53
	mov	w2, w24
	mov	w0, 3
	add	x24, x22, 45056
	bl	dprint_vfmw
	ldr	w1, [x24, 244]
	mov	w0, 0
	ldrh	w2, [x22, 150]
	bfi	w0, w1, 4, 1
	mov	w1, 3
	orr	w0, w0, 64
	cmp	w2, 120
	strb	w1, [x29, 92]
	strb	w0, [x29, 93]
	strh	w1, [x29, 94]
	ble	.L77
	strb	wzr, [x22, 144]
	mov	w3, 0
	ldr	w2, [x24, 240]
	and	w2, w2, 1
.L66:
	ldrb	w1, [x29, 95]
	mov	w0, 111
	bfi	w1, w3, 5, 1
	mov	x3, x20
	and	w0, w1, w0
	bfi	w0, w2, 6, 1
	strb	w0, [x29, 95]
	mov	w2, w19
	mov	w0, 12
	ldr	w25, [x29, 92]
	mov	w1, w25
	bl	MFDE_ConfigReg
	ldr	x1, .LC43
	mov	w2, w25
	mov	w0, 3
	bl	dprint_vfmw
	ldr	w1, [x23, 72]
	mov	x3, x20
	mov	w2, w19
	mov	w0, 16
	and	w1, w1, -16
	bl	MFDE_ConfigReg
	ldr	w1, [x23, 56]
	mov	x3, x20
	mov	w2, w19
	mov	w0, 20
	and	w1, w1, -16
	bl	MFDE_ConfigReg
	str	wzr, [x29, 92]
	ldr	w5, [x24, 236]
	mov	w3, 0
	mov	w4, -1
	cbz	w5, .L68
	.p2align 2
.L82:
	sxtw	x2, w3
	lsl	x1, x2, 2
	sub	x1, x1, x2
	lsl	x1, x1, 2
	sub	x1, x1, x2
	add	x1, x22, x1, lsl 2
	mov	x0, x1
	ldr	w2, [x1, 236]
	cbz	w2, .L72
	ldr	w1, [x1, 244]
	and	w2, w2, -16
	cmp	w1, wzr
	ble	.L72
	cmp	w4, w2
	csel	w4, w4, w2, ls
.L72:
	ldr	w1, [x0, 240]
	cbz	w1, .L69
	ldr	w0, [x0, 248]
	and	w1, w1, -16
	cmp	w0, wzr
	ble	.L69
	cmp	w4, w1
	csel	w4, w4, w1, ls
.L69:
	add	w3, w3, 1
	cmp	w3, w5
	bne	.L82
	cmn	w4, #1
	beq	.L68
	mov	w1, w4
	str	w4, [x21]
	mov	x3, x20
	mov	w2, w19
	mov	w0, 24
	str	w4, [x29, 92]
	bl	MFDE_ConfigReg
	ldrh	w1, [x22, 150]
	mov	w0, 4
	mov	x3, x20
	mov	w2, w19
	cmp	w1, 120
	cset	w1, ls
	bl	SCD_ConfigReg
	mov	w1, 3075
	mov	x3, x20
	mov	w2, w19
	mov	w0, 60
	movk	w1, 0x30, lsl 16
	bl	MFDE_ConfigReg
	mov	w1, 3075
	mov	x3, x20
	mov	w2, w19
	mov	w0, 64
	movk	w1, 0x30, lsl 16
	bl	MFDE_ConfigReg
	mov	w1, 3075
	mov	x3, x20
	mov	w2, w19
	mov	w0, 68
	movk	w1, 0x30, lsl 16
	bl	MFDE_ConfigReg
	mov	w1, 3075
	mov	x3, x20
	mov	w2, w19
	mov	w0, 72
	movk	w1, 0x30, lsl 16
	bl	MFDE_ConfigReg
	mov	w1, 3075
	mov	x3, x20
	mov	w2, w19
	mov	w0, 76
	movk	w1, 0x30, lsl 16
	bl	MFDE_ConfigReg
	mov	w1, 3075
	mov	x3, x20
	mov	w2, w19
	mov	w0, 80
	movk	w1, 0x30, lsl 16
	bl	MFDE_ConfigReg
	mov	w1, 3075
	mov	x3, x20
	mov	w2, w19
	mov	w0, 84
	movk	w1, 0x30, lsl 16
	bl	MFDE_ConfigReg
	ldr	w1, [x22, 188]
	mov	w0, 96
	mov	x3, x20
	mov	w2, w19
	and	w1, w1, -16
	bl	MFDE_ConfigReg
	ldr	w1, [x22, 208]
	mov	x3, x20
	mov	w2, w19
	mov	w0, 100
	bl	MFDE_ConfigReg
	ldr	w1, [x22, 212]
	mov	x3, x20
	mov	w2, w19
	mov	w0, 104
	bl	MFDE_ConfigReg
	ldr	x1, .LC47
	mov	w0, 3
	ldr	w2, [x22, 212]
	bl	dprint_vfmw
	str	wzr, [x29, 92]
	ldp	w1, w2, [x22, 192]
	mov	w0, 0
	mov	x3, x20
	bfi	w0, w2, 0, 2
	mov	w2, w19
	bfi	w0, w1, 2, 2
	strb	w0, [x29, 92]
	mov	w0, 148
	ldr	w21, [x29, 92]
	mov	w1, w21
	bl	MFDE_ConfigReg
	ldr	x1, .LC49
	mov	w2, w21
	mov	w0, 3
	bl	dprint_vfmw
	str	wzr, [x29, 92]
	strb	wzr, [x29, 92]
	mov	x3, x20
	mov	w2, w19
	mov	w0, 152
	ldr	w1, [x29, 92]
	bl	MFDE_ConfigReg
	ldr	w21, [x22, 220]
	mov	x3, x20
	mov	w0, 108
	mov	w2, w19
	mov	w1, w21
	bl	MFDE_ConfigReg
	ldr	x1, .LC51
	mov	w2, w21
	mov	w0, 3
	bl	dprint_vfmw
	mov	w0, 32
	mov	x3, x20
	mov	w2, w19
	mov	w1, -1
	bl	MFDE_ConfigReg
	mov	w0, 0
.L85:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L77:
	mov	w0, 1
	strb	w0, [x22, 144]
	mov	w2, 0
	mov	w3, 1
	str	wzr, [x24, 240]
	b	.L66
	.p2align 3
.L76:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L64
	str	x0, [x23]
	b	.L65
.L89:
	ldr	x2, .LC37
	mov	w4, 0
	ldr	x1, .LC39
	mov	w3, w19
	add	x2, x2, 24
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L85
.L68:
	ldr	x1, .LC45
	mov	w2, -1
	mov	w0, 0
	bl	dprint_vfmw
	str	wzr, [x21]
	mov	w0, -1
	b	.L85
.L64:
	ldr	x1, .LC41
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L85
	.size	MP2HAL_V5R2C1_CfgReg, .-MP2HAL_V5R2C1_CfgReg
	.align	3
.LC37:
	.xword	.LANCHOR0
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_V5R2C1_CfgDnMsg
	.type	MP2HAL_V5R2C1_CfgDnMsg, %function
MP2HAL_V5R2C1_CfgDnMsg:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	str	x25, [sp, 80]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, w3
	bl	_mcount
	str	wzr, [x29, 92]
	ldr	w0, [x20, 72]
	bl	MEM_Phy2Vir
	mov	x22, x0
	cbz	x0, .L118
	ldrh	w1, [x19, 150]
	cmp	w1, 512
	bhi	.L119
	ldrh	w2, [x19, 146]
	cmp	w2, 512
	bhi	.L120
	ldrh	w0, [x29, 94]
	sub	w2, w2, #1
	ldr	w4, [x19, 176]
	sub	w1, w1, #1
	ldrh	w3, [x29, 92]
	bfi	w0, w2, 0, 9
	strh	w0, [x29, 94]
	lsr	x0, x0, 8
	bfi	w3, w1, 0, 9
	bfi	w0, w4, 1, 1
	strh	w3, [x29, 92]
	mov	w2, 0
	strb	w0, [x29, 95]
	mov	w0, 0
	mov	w3, 0
	mov	w5, 0
	ldr	w1, [x29, 92]
	mov	w4, 0
	str	w1, [x22]
	mov	w1, 0
	ldrb	w6, [x19]
	bfi	w0, w6, 0, 3
	ldrb	w6, [x19, 3]
	bfi	w2, w6, 0, 2
	ldrb	w6, [x19, 5]
	bfi	w3, w6, 0, 1
	strb	w3, [x29, 92]
	ldrb	w3, [x19, 2]
	bfi	w0, w3, 3, 1
	ldrb	w3, [x19, 1]
	bfi	w0, w3, 4, 1
	strb	w0, [x29, 95]
	mov	w0, 0
	mov	w3, 0
	ldrb	w6, [x19, 4]
	bfi	w2, w6, 2, 1
	strb	w2, [x29, 93]
	ldrb	w2, [x19, 7]
	bfi	w5, w2, 0, 1
	strb	w5, [x29, 94]
	ldr	w2, [x29, 92]
	str	w2, [x22, 4]
	ldrb	w2, [x19, 14]
	ldrb	w5, [x19, 15]
	bfi	w0, w2, 0, 4
	ldrb	w2, [x19, 12]
	bfi	w4, w5, 0, 4
	ldrb	w5, [x19, 13]
	bfi	w1, w2, 0, 4
	ldrb	w2, [x19, 6]
	strb	w0, [x29, 93]
	mov	w0, w1
	bfi	w3, w5, 0, 4
	bfi	w0, w2, 7, 1
	strb	w3, [x29, 94]
	mov	w2, 0
	strb	w0, [x29, 95]
	mov	w3, 0
	strb	w4, [x29, 92]
	mov	w1, 0
	mov	w0, 0
	ldr	w4, [x29, 92]
	str	w4, [x22, 8]
	ldrb	w5, [x19, 11]
	ldrb	w4, [x19, 10]
	bfi	w3, w5, 0, 2
	ldrb	w5, [x19, 9]
	bfi	w2, w4, 0, 1
	ldrb	w4, [x19, 8]
	strb	w3, [x29, 92]
	bfi	w1, w5, 0, 1
	strb	w2, [x29, 93]
	bfi	w0, w4, 0, 1
	strb	w1, [x29, 94]
	strb	w0, [x29, 95]
	ldr	w0, [x29, 92]
	str	w0, [x22, 12]
	ldr	w0, [x19, 180]
	and	w0, w0, -16
	str	w0, [x22, 16]
	ldr	w0, [x19, 184]
	and	w0, w0, -16
	str	w0, [x22, 20]
	ldr	w0, [x19, 200]
	and	w0, w0, -16
	str	w0, [x22, 24]
	ldr	w0, [x19, 224]
	and	w0, w0, -16
	str	w0, [x22, 28]
	str	w0, [x29, 92]
	ldr	w0, [x19, 152]
	bl	MEM_Phy2Vir
	mov	x23, x0
	ldr	w0, [x19, 156]
	bl	MEM_Phy2Vir
	mov	x25, x0
	ldr	w0, [x19, 172]
	cbz	w0, .L121
	ldp	w0, w24, [x19, 160]
	ldp	w1, w2, [x19, 152]
	add	w0, w1, w0, lsr 3
	add	w24, w2, w24, lsr 3
	and	w1, w0, -16
	and	w2, w24, -16
	sub	w1, w1, w2
	mov	w2, 0
	bfi	w2, w1, 0, 24
	str	w2, [x22, 32]
	mov	w2, 0
	and	w0, w0, 15
	ldr	w1, [x19, 168]
	bfi	w2, w1, 0, 24
	ldr	w1, [x19, 160]
	str	w2, [x29, 92]
	and	w1, w1, 7
	add	w0, w1, w0, lsl 3
	mov	w1, 0
	bfi	w1, w0, 0, 7
	strb	w1, [x29, 95]
	ldr	w0, [x29, 92]
	str	w0, [x22, 36]
	cbz	x23, .L98
	ldr	w1, [x19, 160]
	ubfx	x1, x1, 3, 29
	add	x0, x23, x1
	ldrb	w2, [x23, x1]
	ldrb	w1, [x0, 7]
	ldrb	w7, [x0, 5]
	ldrb	w6, [x0, 4]
	ldrb	w5, [x0, 3]
	ldrb	w4, [x0, 2]
	ldrb	w3, [x0, 1]
	str	w1, [sp, 8]
	ldr	x1, .LC64
	ldrb	w0, [x0, 6]
	str	w0, [sp]
	mov	w0, 8
	bl	dprint_vfmw
	ldr	w2, [x19, 168]
	ldr	w1, [x19, 160]
	cmp	w2, wzr
	add	w0, w2, 7
	csel	w0, w0, w2, lt
	ubfx	x1, x1, 3, 29
	asr	w0, w0, 3
	add	x0, x1, x0, sxtw
	ldr	x1, .LC65
	sub	x0, x0, #8
	add	x8, x23, x0
	ldrb	w2, [x23, x0]
	ldrb	w0, [x8, 7]
	ldrb	w3, [x8, 1]
	ldrb	w7, [x8, 5]
	ldrb	w6, [x8, 4]
	ldrb	w5, [x8, 3]
	ldrb	w4, [x8, 2]
	str	w0, [sp, 8]
	ldrb	w0, [x8, 6]
	str	w0, [sp]
	mov	w0, 9
	bl	dprint_vfmw
	ldr	w3, [x19, 152]
	mov	w0, 22
	ldr	w2, [x19, 168]
	ldr	x1, .LC66
	add	w2, w3, w2
	bl	dprint_vfmw
.L98:
	str	wzr, [x22, 40]
	and	w24, w24, 15
	mov	w3, 0
	mov	w2, 0
	ldr	w0, [x19, 164]
	ldr	w1, [x19, 172]
	and	w0, w0, 7
	add	w1, w1, 24
	add	w0, w0, w24, lsl 3
	bfi	w3, w1, 0, 24
	str	w3, [x29, 92]
	bfi	w2, w0, 0, 7
	strb	w2, [x29, 95]
	ldr	w0, [x29, 92]
	str	w0, [x22, 44]
	cbz	x25, .L99
	ldr	w1, [x19, 164]
	ubfx	x1, x1, 3, 29
	add	x0, x25, x1
	ldrb	w2, [x25, x1]
	ldrb	w1, [x0, 7]
	ldrb	w7, [x0, 5]
	ldrb	w6, [x0, 4]
	ldrb	w5, [x0, 3]
	ldrb	w4, [x0, 2]
	ldrb	w3, [x0, 1]
	str	w1, [sp, 8]
	ldr	x1, .LC67
	ldrb	w0, [x0, 6]
	str	w0, [sp]
	mov	w0, 8
	bl	dprint_vfmw
	ldr	w2, [x19, 172]
	ldr	w1, [x19, 164]
	add	w0, w2, 7
	cmp	w2, wzr
	csel	w0, w0, w2, lt
	ubfx	x1, x1, 3, 29
	asr	w0, w0, 3
	add	x0, x1, x0, sxtw
	ldr	x1, .LC68
	sub	x0, x0, #8
	add	x8, x25, x0
	ldrb	w2, [x25, x0]
	ldrb	w0, [x8, 7]
	ldrb	w7, [x8, 5]
	ldrb	w6, [x8, 4]
	ldrb	w5, [x8, 3]
	ldrb	w4, [x8, 2]
	ldrb	w3, [x8, 1]
	str	w0, [sp, 8]
	ldrb	w0, [x8, 6]
	str	w0, [sp]
	mov	w0, 9
	bl	dprint_vfmw
.L99:
	add	x11, x22, 128
	mov	w6, 0
	.p2align 2
.L97:
	mov	w0, w6
	add	w12, w6, 16
	mov	x4, x11
.L100:
	add	w3, w0, 16
	add	w2, w0, 32
	add	w1, w0, 48
	add	x5, x19, x0, sxtw
	add	x3, x19, x3, sxtw
	add	x2, x19, x2, sxtw
	add	x1, x19, x1, sxtw
	add	w0, w0, 8
	ldrb	w10, [x5, 80]
	cmp	w12, w0
	ldrb	w9, [x3, 80]
	ldrb	w7, [x1, 80]
	ldrb	w8, [x2, 80]
	strb	w10, [x29, 92]
	strb	w9, [x29, 93]
	strb	w8, [x29, 94]
	strb	w7, [x29, 95]
	ldr	w7, [x29, 92]
	str	w7, [x4, -64]
	ldrb	w1, [x1, 16]
	ldrb	w5, [x5, 16]
	ldrb	w3, [x3, 16]
	ldrb	w2, [x2, 16]
	strb	w5, [x29, 92]
	strb	w3, [x29, 93]
	strb	w2, [x29, 94]
	strb	w1, [x29, 95]
	ldr	w1, [x29, 92]
	str	w1, [x4], 4
	bne	.L100
	add	w6, w6, 1
	add	x11, x11, 8
	cmp	w6, 8
	bne	.L97
	ldr	w0, [x20, 1164]
	and	w0, w0, -16
	str	w0, [x22, 192]
	str	w0, [x29, 92]
	ldr	w23, [x20, 72]
	and	w23, w23, -16
	add	w23, w23, 256
	mov	w0, w23
	bl	MEM_Phy2Vir
	cbz	x0, .L122
	mov	x1, x0
	mov	w3, w21
	mov	w2, w23
	mov	x0, x19
	str	w23, [x22, 252]
	str	w23, [x29, 92]
	bl	MP2HAL_V5R2C1_WriteSliceMsg
	ldr	x1, .LC71
	mov	w0, 0
	ldr	w1, [x1]
	tbnz	x1, 4, .L123
.L92:
	add	sp, x29, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L121:
	ldr	w0, [x19, 160]
	mov	w4, 0
	ldr	w1, [x19, 152]
	mov	w3, 0
	str	wzr, [x22, 32]
	add	w0, w1, w0, lsr 3
	ldr	w2, [x19, 168]
	and	w0, w0, 15
	ldr	w1, [x19, 160]
	add	w2, w2, 24
	and	w1, w1, 7
	bfi	w4, w2, 0, 24
	add	w0, w1, w0, lsl 3
	str	w4, [x29, 92]
	bfi	w3, w0, 0, 7
	strb	w3, [x29, 95]
	ldr	w0, [x29, 92]
	str	w0, [x22, 36]
	cbz	x23, .L96
	ldr	w1, [x19, 160]
	ubfx	x1, x1, 3, 29
	add	x0, x23, x1
	ldrb	w2, [x23, x1]
	ldrb	w1, [x0, 7]
	ldrb	w7, [x0, 5]
	ldrb	w6, [x0, 4]
	ldrb	w5, [x0, 3]
	ldrb	w4, [x0, 2]
	ldrb	w3, [x0, 1]
	str	w1, [sp, 8]
	ldr	x1, .LC62
	ldrb	w0, [x0, 6]
	str	w0, [sp]
	mov	w0, 8
	bl	dprint_vfmw
	ldr	w2, [x19, 168]
	ldr	w1, [x19, 160]
	add	w0, w2, 7
	cmp	w2, wzr
	csel	w0, w0, w2, lt
	ubfx	x1, x1, 3, 29
	asr	w0, w0, 3
	add	x0, x1, x0, sxtw
	ldr	x1, .LC63
	sub	x0, x0, #8
	add	x8, x23, x0
	ldrb	w2, [x23, x0]
	ldrb	w0, [x8, 7]
	ldrb	w7, [x8, 5]
	ldrb	w6, [x8, 4]
	ldrb	w5, [x8, 3]
	ldrb	w4, [x8, 2]
	ldrb	w3, [x8, 1]
	str	w0, [sp, 8]
	ldrb	w0, [x8, 6]
	str	w0, [sp]
	mov	w0, 9
	bl	dprint_vfmw
.L96:
	str	wzr, [x22, 40]
	str	wzr, [x29, 92]
	strb	wzr, [x29, 95]
	ldr	w0, [x29, 92]
	str	w0, [x22, 44]
	b	.L99
	.p2align 3
.L123:
	ldr	x4, .LC72
	mov	w0, 4
	ldr	w3, [x20, 72]
	mov	x19, x22
	ldr	x1, .LC74
	mov	w20, 0
	ldr	w2, [x4]
	add	w2, w2, 1
	str	w2, [x4]
	bl	dprint_vfmw
	ldr	x21, .LC76
	.p2align 2
.L103:
	ldp	w4, w5, [x19, 4]
	ldr	w6, [x19, 12]
	mov	w2, w20
	ldr	w3, [x19], 16
	mov	w0, 4
	mov	x1, x21
	add	w20, w20, w0
	bl	dprint_vfmw
	cmp	w20, 64
	bne	.L103
	ldr	x1, .LC78
	mov	w0, 4
	bl	dprint_vfmw
	add	sp, x29, 0
	mov	w0, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
.L120:
	ldr	x2, .LC58
	ldr	x3, .LC61
.L117:
	ldr	x1, .LC59
	mov	w0, 0
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L92
.L119:
	ldr	x2, .LC58
	ldr	x3, .LC60
	b	.L117
.L122:
	ldr	x1, .LC70
	bl	dprint_vfmw
	mov	w0, -1
	b	.L92
.L118:
	ldr	x2, .LC58
	ldr	x3, .LC57
	b	.L117
	.size	MP2HAL_V5R2C1_CfgDnMsg, .-MP2HAL_V5R2C1_CfgDnMsg
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC58:
	.xword	.LANCHOR0
	.align	3
.LC59:
	.xword	.LC19
	.align	3
.LC60:
	.xword	.LC16
	.align	3
.LC61:
	.xword	.LC21
	.align	3
.LC62:
	.xword	.LC23
	.align	3
.LC63:
	.xword	.LC25
	.align	3
.LC64:
	.xword	.LC27
	.align	3
.LC65:
	.xword	.LC29
	.align	3
.LC66:
	.xword	.LC31
	.align	3
.LC67:
	.xword	.LC33
	.align	3
.LC68:
	.xword	.LC35
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC71:
	.xword	g_PrintEnable
	.align	3
.LC72:
	.xword	.LANCHOR1
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2HAL_V5R2C1_StartDec
	.type	MP2HAL_V5R2C1_StartDec, %function
MP2HAL_V5R2C1_StartDec:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	mov	x24, x2
	bl	_mcount
	ldr	x22, .LC79
	sxtw	x0, w20
	cmp	w20, wzr
	lsl	x19, x0, 6
	sub	x19, x19, x0
	lsl	x19, x19, 2
	sub	x0, x19, x0
	add	x19, x19, x0, lsl 2
	add	x23, x19, x22
	bgt	.L130
	ldr	x0, [x19, x22]
	cbz	x0, .L131
.L127:
	ldr	x6, .LC83
	mov	x4, x24
	add	x3, x29, 76
	mov	w2, w20
	mov	x1, x23
	mov	x0, x21
	ldr	w5, [x6]
	add	w5, w5, 1
	str	w5, [x6]
	bl	MP2HAL_V5R2C1_CfgReg
	mov	w19, w0
	cbnz	w0, .L132
	ldr	w3, [x29, 76]
	mov	w2, w20
	mov	x1, x23
	mov	x0, x21
	bl	MP2HAL_V5R2C1_CfgDnMsg
.L126:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L131:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L128
	str	x0, [x19, x22]
	b	.L127
	.p2align 3
.L130:
	ldr	x2, .LC80
	mov	w4, 0
	ldr	x1, .LC81
	mov	w3, w20
	add	x2, x2, 72
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L126
	.p2align 3
.L132:
	ldr	x1, .LC85
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
	b	.L126
.L128:
	ldr	x1, .LC82
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L126
	.size	MP2HAL_V5R2C1_StartDec, .-MP2HAL_V5R2C1_StartDec
	.align	3
.LC79:
	.xword	g_HwMem
	.align	3
.LC80:
	.xword	.LANCHOR0
	.align	3
.LC81:
	.xword	.LC38
	.align	3
.LC82:
	.xword	.LC40
	.align	3
.LC83:
	.xword	.LANCHOR2
	.align	3
.LC85:
	.xword	.LC84
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.11559, %object
	.size	__func__.11559, 24
__func__.11559:
	.string	"MP2HAL_V5R2C1_MakeDnMsg"
	.type	__func__.11594, %object
	.size	__func__.11594, 21
__func__.11594:
	.string	"MP2HAL_V5R2C1_CfgReg"
	.zero	3
	.type	__func__.11617, %object
	.size	__func__.11617, 23
__func__.11617:
	.string	"MP2HAL_V5R2C1_CfgDnMsg"
	.zero	1
	.type	__func__.11515, %object
	.size	__func__.11515, 23
__func__.11515:
	.string	"MP2HAL_V5R2C1_StartDec"
	.data
	.align	2
.LANCHOR2 = . + 0
	.type	FrameNum, %object
	.size	FrameNum, 4
FrameNum:
	.word	-1
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"D0 = %#x \n" )
	.zero	5
.LC2:
	ASCII(.string	"D1 = %#x \n" )
	.zero	5
.LC4:
	ASCII(.string	"D2 = %#x \n" )
	.zero	5
.LC6:
	ASCII(.string	"D3 = %#x \n" )
	.zero	5
.LC8:
	ASCII(.string	"D4 = %#x \n" )
	.zero	5
.LC10:
	ASCII(.string	"D5 = %#x \n" )
	.zero	5
.LC12:
	ASCII(.string	"D6 = %#x \n" )
	.zero	5
.LC14:
	ASCII(.string	"D7 = %#x \n" )
	.zero	5
.LC16:
	ASCII(.string	"picture width out of range" )
	.zero	5
.LC19:
	ASCII(.string	"%s: %s\n" )
.LC21:
	ASCII(.string	"picture height out of range" )
	.zero	4
.LC23:
	ASCII(.string	"Stream Head (8bytes): 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n" )
	.zero	1
.LC25:
	ASCII(.string	"Stream Tail (8bytes): 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n" )
	.zero	1
.LC27:
	ASCII(.string	"1p Stream Head (8bytes): 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n" )
	.zero	6
.LC29:
	ASCII(.string	"1p Stream Tail (8bytes): 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n" )
	.zero	6
.LC31:
	ASCII(.string	"1p last phy addr = 0x%x\n" )
	.zero	7
.LC33:
	ASCII(.string	"2p Stream Head (8bytes): 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n" )
	.zero	6
.LC35:
	ASCII(.string	"2p Stream Tail (8bytes): 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n" )
	.zero	6
.LC38:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC40:
	ASCII(.string	"vdm register virtual address not mapped, reset failed!\n" )
.LC42:
	ASCII(.string	"MPEG2  VREG_V5R2C1_BASIC_CFG1= 0x%x\n" )
	.zero	3
.LC44:
	ASCII(.string	"stream_base_addr = %#x\n" )
.LC46:
	ASCII(.string	"MPEG2  VREG_V5R2C1_UVOFFSET_1D= 0x%x\n" )
	.zero	2
.LC48:
	ASCII(.string	"MPEG2  VREG_V5R2C1_REF_PIC_TYPE= 0x%x\n" )
	.zero	1
.LC50:
	ASCII(.string	"HEAD_INF_OFFSET = 0x%x\n" )
.LC52:
	ASCII(.string	"MPEG2  VREG_V5R2C1_BASIC_CFG0= 0x%x\n" )
	.zero	3
.LC56:
	ASCII(.string	"can not map down msg virtual address!" )
	.zero	2
.LC69:
	ASCII(.string	"Map SlcDnMsgPhyAddr to SlcDnMsgVirAddr is NULL \n" )
	.zero	7
.LC73:
	ASCII(.string	"\n*****No.%2d Down Msg (phy addr: %#8x) *****\n" )
	.zero	2
.LC75:
	ASCII(.string	"\n0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n" )
	.zero	3
.LC77:
	ASCII(.string	"\n***** Down Msg print finished *****\n" )
	.zero	2
.LC84:
	ASCII(.string	"MP2HAL_V200R003_CfgReg ERROR!\n" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	num.11628, %object
	.size	num.11628, 4
num.11628:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
