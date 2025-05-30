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
	.file	"sw_main.c"
	.text
	.align	2
	.type	SchedStatisticsStop, %function
SchedStatisticsStop:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L9
	mov	r5, r0
	ldr	r3, [r4, #64]
	blx	r3
	ldr	r3, [r4, #128]
	movw	r2, #19923
	cmp	r5, #0
	movt	r2, 4194
	rsb	r3, r3, r0
	str	r0, [r4, #120]
	str	r1, [r4, #124]
	umull	r2, r3, r3, r2
	mov	r3, r3, lsr #6
	beq	.L8
	cmp	r3, #41
	movls	r3, #0
	movhi	r3, #1
	cmp	r5, #1
	movne	r3, #0
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldrh	r1, [r4, #138]
	mov	r0, #1
	add	r1, r1, r0
	uxth	r1, r1
	strh	r1, [r4, #138]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AOE_SchedStatisticsShow
.L8:
	cmp	r3, #4
	ldmlsfd	sp, {r4, r5, fp, sp, pc}
	ldrh	r1, [r4, #136]
	mov	r0, r5
	add	r1, r1, #1
	uxth	r1, r1
	strh	r1, [r4, #136]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	AOE_SchedStatisticsShow
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SchedStatisticsStop, .-SchedStatisticsStop
	.align	2
	.type	AoEngineTask, %function
AoEngineTask:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L18
	ldr	r0, [r4, #140]
	mov	r5, r4
	bl	AOE_Init
	mov	r7, r4
	ldr	r3, [r4, #72]
	blx	r3
	mov	r3, #0
	mov	r0, #0
	mov	r1, #0
	strh	r3, [r4, #138]
	strh	r3, [r4, #136]
	str	r3, [r4, #144]
	strd	r0, [r4, #128]
	strd	r0, [r4, #120]
	bl	AOE_SchedStatisticsInit
	movw	r3, #42405
	bfi	r3, r3, #16, #16
	str	r3, [r4, #148]
.L13:
	ldr	r3, [r4, #88]
	blx	r3
	ldr	r3, .L18
	subs	r6, r0, #0
	bne	.L17
	ldr	r3, [r5, #64]
	blx	r3
	strd	r0, [r5, #128]
	bl	AOE_ProcThread_Sw
	mov	r0, r6
	bl	SchedStatisticsStop
	bl	AOE_GetThreadStatus
	cmp	r0, #1
	beq	.L13
	ldr	r3, [r7, #64]
	blx	r3
	ldr	r3, [r7, #68]
	strd	r0, [r7, #128]
	movw	r0, #19264
	movt	r0, 76
	blx	r3
	mov	r0, #1
	bl	SchedStatisticsStop
	b	.L13
.L17:
	ldr	r3, [r3, #76]
	blx	r3
	bl	AOE_DeInit
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AoEngineTask, .-AoEngineTask
	.align	2
	.global	AOE_SwEngineCreate
	.type	AOE_SwEngineCreate, %function
AOE_SwEngineCreate:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L27
	ldr	r5, .L36
	mov	r3, #0
	mov	r0, r5
	str	r3, [r5, #148]
	bl	ASDP_OSAL_InterfaceInit
	ldr	r3, [r5, #80]
	add	r0, r5, #152
	ldr	r2, .L36+4
	ldr	r1, .L36+8
	str	r4, [r5, #140]
	blx	r3
	subs	r4, r0, #0
	bne	.L33
	bl	TIMER_Init
	bl	TIMER_SetEnable
	ldr	r2, [r5, #148]
	movw	r3, #42405
	movt	r3, 42405
	cmp	r2, r3
	beq	.L23
	ldr	r3, [r5, #16]
	mov	r0, #1
	blx	r3
	movw	r4, #511
	mov	r6, r5
	b	.L25
.L35:
	ldr	r3, [r6, #16]
	blx	r3
	subs	r4, r4, #1
	beq	.L34
.L25:
	ldr	r2, [r5, #148]
	movw	r3, #42405
	movt	r3, 42405
	mov	r0, #1
	cmp	r2, r3
	ldr	r7, .L36
	bne	.L35
.L23:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L33:
	ldr	r3, [r5, #4]
	ldr	r0, .L36+12
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L34:
	ldr	r3, [r7, #4]
	ldr	r0, .L36+16
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L27:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.word	AoEngineTask
	.word	.LC0
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	AOE_SwEngineCreate, .-AOE_SwEngineCreate
	.align	2
	.global	AOE_SwEngineDestory
	.type	AOE_SwEngineDestory, %function
AOE_SwEngineDestory:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L39
	bl	TIMER_SetDisable
	bl	TIMER_DeInit
	ldr	r3, [r4, #84]
	ldr	r0, [r4, #152]
	blx	r3
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #152]
	str	r3, [r4, #140]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	AOE_SwEngineDestory, .-AOE_SwEngineDestory
	.global	g_AdspOsalFunc
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"AoEngineTask\000" )
	.space	3
.LC1:
	ASCII(.ascii	"create sw AOE task failed\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"sw AOE running delay more than 512ms\012\000" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_AdspOsalFunc, %object
	.size	g_AdspOsalFunc, 120
g_AdspOsalFunc:
	.space	120
	.type	g_u64EndPts, %object
	.size	g_u64EndPts, 8
g_u64EndPts:
	.space	8
	.type	g_u64BeginPts, %object
	.size	g_u64BeginPts, 8
g_u64BeginPts:
	.space	8
	.type	g_u16ExcuteTimeoutCnt, %object
	.size	g_u16ExcuteTimeoutCnt, 2
g_u16ExcuteTimeoutCnt:
	.space	2
	.type	g_u16SchTimeoutCnt, %object
	.size	g_u16SchTimeoutCnt, 2
g_u16SchTimeoutCnt:
	.space	2
	.type	g_pDspReg, %object
	.size	g_pDspReg, 4
g_pDspReg:
	.space	4
	.type	g_u32cnt, %object
	.size	g_u32cnt, 4
g_u32cnt:
	.space	4
	.type	g_AoeRunningFlag, %object
	.size	g_AoeRunningFlag, 4
g_AoeRunningFlag:
	.space	4
	.type	g_pAOEThread, %object
	.size	g_pAOEThread, 4
g_pAOEThread:
	.space	4
	.ident	"GCC: (gcc-4.9.4 + glibc-2.27 Build by czyong Mon Jul  2 18:10:52 CST 2018) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
