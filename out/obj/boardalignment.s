	.file	"boardalignment.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed boardalignment.i -mtune=generic
# -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections
# -fverbose-asm -ffat-lto-objects -fstack-protector-strong -Wformat
# -Wformat-security
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcommon -fdata-sections -fdelete-null-pointer-checks
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -ffunction-cse -ffunction-sections -fgcse-lm -fgnu-runtime -fgnu-unique
# -fident -finline-atomics -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
# -fmerge-debug-strings -fpeephole -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fsigned-zeros
# -fsplit-ivs-in-unroller -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
# -ftree-coalesce-vars -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-reassoc -ftree-scev-cprop
# -funit-at-a-time -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mtls-direct-seg-refs -mvzeroupper

	.text
.Ltext0:
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.comm	boardAlignment_System,6,1
	.section	.text.boardAlignment,"ax",@progbits
	.type	boardAlignment, @function
boardAlignment:
.LFB7:
	.file 1 "src/main/sensors/boardalignment.h"
	.loc 1 26 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 26 0
	movl	$boardAlignment_System, %eax	#, D.3491
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	boardAlignment, .-boardAlignment
	.globl	boardAlignment_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	boardAlignment_Registry, @object
	.size	boardAlignment_Registry, 32
boardAlignment_Registry:
# pgn:
	.value	2
# size:
	.value	6
# address:
	.zero	4
	.quad	boardAlignment_System
# ptr:
	.quad	0
# reset:
# ptr:
	.quad	0
	.section	.data.standardBoardAlignment,"aw",@progbits
	.type	standardBoardAlignment, @object
	.size	standardBoardAlignment, 1
standardBoardAlignment:
	.byte	1
	.section	.bss.boardRotation,"aw",@nobits
	.align 32
	.type	boardRotation, @object
	.size	boardRotation, 36
boardRotation:
	.zero	36
	.section	.text.isBoardAlignmentStandard,"ax",@progbits
	.type	isBoardAlignmentStandard, @function
isBoardAlignmentStandard:
.LFB8:
	.file 2 "src/main/sensors/boardalignment.c"
	.loc 2 39 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# boardAlignment, boardAlignment
	.loc 2 40 0
	movq	-8(%rbp), %rax	# boardAlignment, tmp93
	movzwl	(%rax), %eax	# boardAlignment_3(D)->rollDegrees, D.3493
	testw	%ax, %ax	# D.3493
	jne	.L4	#,
	.loc 2 40 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# boardAlignment, tmp94
	movzwl	2(%rax), %eax	# boardAlignment_3(D)->pitchDegrees, D.3493
	testw	%ax, %ax	# D.3493
	jne	.L4	#,
	.loc 2 40 0 discriminator 3
	movq	-8(%rbp), %rax	# boardAlignment, tmp95
	movzwl	4(%rax), %eax	# boardAlignment_3(D)->yawDegrees, D.3493
	testw	%ax, %ax	# D.3493
	jne	.L4	#,
	.loc 2 40 0 discriminator 5
	movl	$1, %eax	#, D.3492
	jmp	.L5	#
.L4:
	.loc 2 40 0 discriminator 6
	movl	$0, %eax	#, D.3492
.L5:
	.loc 2 40 0 discriminator 8
	andl	$1, %eax	#, D.3494
	.loc 2 41 0 is_stmt 1 discriminator 8
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	isBoardAlignmentStandard, .-isBoardAlignmentStandard
	.section	.text.initBoardAlignment,"ax",@progbits
	.globl	initBoardAlignment
	.type	initBoardAlignment, @function
initBoardAlignment:
.LFB9:
	.loc 2 44 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	.loc 2 44 0
	movq	%fs:40, %rax	#, tmp102
	movq	%rax, -8(%rbp)	# tmp102, D.3500
	xorl	%eax, %eax	# tmp102
	.loc 2 45 0
	call	boardAlignment	#
	movq	%rax, %rdi	# D.3495,
	call	isBoardAlignmentStandard	#
	testb	%al, %al	# D.3496
	jne	.L11	#,
	.loc 2 49 0
	movb	$0, standardBoardAlignment(%rip)	#, standardBoardAlignment
	.loc 2 52 0
	call	boardAlignment	#
	movzwl	(%rax), %eax	# _9->rollDegrees, D.3497
	cwtl
	movl	%eax, %edi	# D.3498,
	call	degreesToRadians	#
	movd	%xmm0, %eax	#, D.3499
	movl	%eax, -32(%rbp)	# D.3499, rotationAngles.angles.roll
	.loc 2 53 0
	call	boardAlignment	#
	movzwl	2(%rax), %eax	# _16->pitchDegrees, D.3497
	cwtl
	movl	%eax, %edi	# D.3498,
	call	degreesToRadians	#
	movd	%xmm0, %eax	#, D.3499
	movl	%eax, -28(%rbp)	# D.3499, rotationAngles.angles.pitch
	.loc 2 54 0
	call	boardAlignment	#
	movzwl	4(%rax), %eax	# _23->yawDegrees, D.3497
	cwtl
	movl	%eax, %edi	# D.3498,
	call	degreesToRadians	#
	movd	%xmm0, %eax	#, D.3499
	movl	%eax, -24(%rbp)	# D.3499, rotationAngles.angles.yaw
	.loc 2 56 0
	leaq	-32(%rbp), %rax	#, tmp101
	movl	$boardRotation, %esi	#,
	movq	%rax, %rdi	# tmp101,
	call	buildRotationMatrix	#
	jmp	.L7	#
.L11:
	.loc 2 46 0
	nop
.L7:
	.loc 2 57 0
	movq	-8(%rbp), %rax	# D.3500, tmp103
	xorq	%fs:40, %rax	#, tmp103
	je	.L10	#,
	call	__stack_chk_fail	#
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	initBoardAlignment, .-initBoardAlignment
	.section	.text.alignBoard,"ax",@progbits
	.type	alignBoard, @function
alignBoard:
.LFB10:
	.loc 2 60 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$40, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# vec, vec
	.loc 2 61 0
	movq	-40(%rbp), %rax	# vec, tmp128
	movl	(%rax), %eax	# *vec_2(D), tmp129
	movl	%eax, -28(%rbp)	# tmp129, x
	.loc 2 62 0
	movq	-40(%rbp), %rax	# vec, tmp130
	movl	4(%rax), %eax	# MEM[(int32_t *)vec_2(D) + 4B], tmp131
	movl	%eax, -24(%rbp)	# tmp131, y
	.loc 2 63 0
	movq	-40(%rbp), %rax	# vec, tmp132
	movl	8(%rax), %eax	# MEM[(int32_t *)vec_2(D) + 8B], tmp133
	movl	%eax, -20(%rbp)	# tmp133, z
	.loc 2 65 0
	movss	boardRotation(%rip), %xmm1	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-28(%rbp), %xmm0	# x, D.3503
	mulss	%xmm0, %xmm1	# D.3503, D.3503
	movss	boardRotation+12(%rip), %xmm2	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-24(%rbp), %xmm0	# y, D.3503
	mulss	%xmm2, %xmm0	# D.3503, D.3503
	addss	%xmm0, %xmm1	# D.3503, D.3503
	movss	boardRotation+24(%rip), %xmm2	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-20(%rbp), %xmm0	# z, D.3503
	mulss	%xmm2, %xmm0	# D.3503, D.3503
	addss	%xmm1, %xmm0	# D.3503, D.3503
	call	lrintf	#
	movl	%eax, %edx	# D.3504, D.3505
	movq	-40(%rbp), %rax	# vec, tmp134
	movl	%edx, (%rax)	# D.3505, *vec_2(D)
	.loc 2 66 0
	movq	-40(%rbp), %rax	# vec, tmp135
	leaq	4(%rax), %rbx	#, D.3506
	movss	boardRotation+4(%rip), %xmm1	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-28(%rbp), %xmm0	# x, D.3503
	mulss	%xmm0, %xmm1	# D.3503, D.3503
	movss	boardRotation+16(%rip), %xmm2	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-24(%rbp), %xmm0	# y, D.3503
	mulss	%xmm2, %xmm0	# D.3503, D.3503
	addss	%xmm0, %xmm1	# D.3503, D.3503
	movss	boardRotation+28(%rip), %xmm2	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-20(%rbp), %xmm0	# z, D.3503
	mulss	%xmm2, %xmm0	# D.3503, D.3503
	addss	%xmm1, %xmm0	# D.3503, D.3503
	call	lrintf	#
	movl	%eax, (%rbx)	# D.3505, *_21
	.loc 2 67 0
	movq	-40(%rbp), %rax	# vec, tmp136
	leaq	8(%rax), %rbx	#, D.3506
	movss	boardRotation+8(%rip), %xmm1	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-28(%rbp), %xmm0	# x, D.3503
	mulss	%xmm0, %xmm1	# D.3503, D.3503
	movss	boardRotation+20(%rip), %xmm2	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-24(%rbp), %xmm0	# y, D.3503
	mulss	%xmm2, %xmm0	# D.3503, D.3503
	addss	%xmm0, %xmm1	# D.3503, D.3503
	movss	boardRotation+32(%rip), %xmm2	# boardRotation, D.3503
	pxor	%xmm0, %xmm0	# D.3503
	cvtsi2ss	-20(%rbp), %xmm0	# z, D.3503
	mulss	%xmm2, %xmm0	# D.3503, D.3503
	addss	%xmm1, %xmm0	# D.3503, D.3503
	call	lrintf	#
	movl	%eax, (%rbx)	# D.3505, *_37
	.loc 2 68 0
	nop
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	alignBoard, .-alignBoard
	.section	.text.alignSensors,"ax",@progbits
	.globl	alignSensors
	.type	alignSensors, @function
alignSensors:
.LFB11:
	.loc 2 71 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# src, src
	movq	%rsi, -16(%rbp)	# dest, dest
	movl	%edx, %eax	# rotation, tmp166
	movb	%al, -20(%rbp)	# tmp166, rotation
	.loc 2 73 0
	movq	-8(%rbp), %rax	# src, tmp167
	movl	$12, %edx	#,
	movq	%rax, %rsi	# tmp167,
	movl	$swap.3320, %edi	#,
	call	memcpy	#
	.loc 2 75 0
	movzbl	-20(%rbp), %eax	# rotation, D.3507
	cmpl	$8, %eax	#, D.3507
	ja	.L14	#,
	movl	%eax, %eax	# D.3507, tmp168
	movq	.L16(,%rax,8), %rax	#, tmp169
	jmp	*%rax	# tmp169
	.section	.rodata.alignSensors,"a",@progbits
	.align 8
	.align 4
.L16:
	.quad	.L14
	.quad	.L14
	.quad	.L15
	.quad	.L17
	.quad	.L18
	.quad	.L19
	.quad	.L20
	.quad	.L21
	.quad	.L22
	.section	.text.alignSensors
.L14:
	.loc 2 78 0
	movl	swap.3320(%rip), %eax	# swap, D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp170
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 79 0
	movq	-16(%rbp), %rax	# dest, tmp171
	addq	$4, %rax	#, D.3509
	movl	swap.3320+4(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_12
	.loc 2 80 0
	movq	-16(%rbp), %rax	# dest, tmp172
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_16
	.loc 2 81 0
	jmp	.L23	#
.L15:
	.loc 2 83 0
	movl	swap.3320+4(%rip), %eax	# swap, D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp173
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 84 0
	movq	-16(%rbp), %rax	# dest, tmp174
	addq	$4, %rax	#, D.3509
	movl	swap.3320(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_23
	.loc 2 85 0
	movq	-16(%rbp), %rax	# dest, tmp175
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_28
	.loc 2 86 0
	jmp	.L23	#
.L17:
	.loc 2 88 0
	movl	swap.3320(%rip), %eax	# swap, D.3508
	negl	%eax	# D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp176
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 89 0
	movq	-16(%rbp), %rax	# dest, tmp177
	addq	$4, %rax	#, D.3509
	movl	swap.3320+4(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_36
	.loc 2 90 0
	movq	-16(%rbp), %rax	# dest, tmp178
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_41
	.loc 2 91 0
	jmp	.L23	#
.L18:
	.loc 2 93 0
	movl	swap.3320+4(%rip), %eax	# swap, D.3508
	negl	%eax	# D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp179
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 94 0
	movq	-16(%rbp), %rax	# dest, tmp180
	addq	$4, %rax	#, D.3509
	movl	swap.3320(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_49
	.loc 2 95 0
	movq	-16(%rbp), %rax	# dest, tmp181
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_53
	.loc 2 96 0
	jmp	.L23	#
.L19:
	.loc 2 98 0
	movl	swap.3320(%rip), %eax	# swap, D.3508
	negl	%eax	# D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp182
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 99 0
	movq	-16(%rbp), %rax	# dest, tmp183
	addq	$4, %rax	#, D.3509
	movl	swap.3320+4(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_61
	.loc 2 100 0
	movq	-16(%rbp), %rax	# dest, tmp184
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_65
	.loc 2 101 0
	jmp	.L23	#
.L20:
	.loc 2 103 0
	movl	swap.3320+4(%rip), %eax	# swap, D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp185
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 104 0
	movq	-16(%rbp), %rax	# dest, tmp186
	addq	$4, %rax	#, D.3509
	movl	swap.3320(%rip), %edx	# swap, D.3508
	movl	%edx, (%rax)	# D.3507, *_73
	.loc 2 105 0
	movq	-16(%rbp), %rax	# dest, tmp187
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_77
	.loc 2 106 0
	jmp	.L23	#
.L21:
	.loc 2 108 0
	movl	swap.3320(%rip), %eax	# swap, D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp188
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 109 0
	movq	-16(%rbp), %rax	# dest, tmp189
	addq	$4, %rax	#, D.3509
	movl	swap.3320+4(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_85
	.loc 2 110 0
	movq	-16(%rbp), %rax	# dest, tmp190
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_90
	.loc 2 111 0
	jmp	.L23	#
.L22:
	.loc 2 113 0
	movl	swap.3320+4(%rip), %eax	# swap, D.3508
	negl	%eax	# D.3508
	movl	%eax, %edx	# D.3508, D.3507
	movq	-16(%rbp), %rax	# dest, tmp191
	movl	%edx, (%rax)	# D.3507, *dest_10(D)
	.loc 2 114 0
	movq	-16(%rbp), %rax	# dest, tmp192
	addq	$4, %rax	#, D.3509
	movl	swap.3320(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_99
	.loc 2 115 0
	movq	-16(%rbp), %rax	# dest, tmp193
	addq	$8, %rax	#, D.3509
	movl	swap.3320+8(%rip), %edx	# swap, D.3508
	negl	%edx	# D.3508
	movl	%edx, (%rax)	# D.3507, *_104
	.loc 2 116 0
	nop
.L23:
	.loc 2 119 0
	movzbl	standardBoardAlignment(%rip), %eax	# standardBoardAlignment, D.3510
	xorl	$1, %eax	#, D.3510
	testb	%al, %al	# D.3510
	je	.L25	#,
	.loc 2 120 0
	movq	-16(%rbp), %rax	# dest, tmp194
	movq	%rax, %rdi	# tmp194,
	call	alignBoard	#
.L25:
	.loc 2 121 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	alignSensors, .-alignSensors
	.section	.bss.swap.3320,"aw",@nobits
	.align 8
	.type	swap.3320, @object
	.size	swap.3320, 12
swap.3320:
	.zero	12
	.text
.Letext0:
	.file 3 "/usr/include/stdint.h"
	.file 4 "./src/main/common/maths.h"
	.file 5 "./src/main/config/parameter_group.h"
	.file 6 "./src/main/common/axis.h"
	.file 7 "src/main/sensors/sensors.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x63d
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF90
	.byte	0xc
	.long	.LASF91
	.long	.LASF92
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x25
	.long	0x3b
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x26
	.long	0x4d
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x3
	.long	.LASF5
	.byte	0x3
	.byte	0x30
	.long	0x66
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF7
	.byte	0x3
	.byte	0x31
	.long	0x78
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.long	.LASF9
	.byte	0x3
	.byte	0x33
	.long	0x8a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF13
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x5
	.long	0x98
	.long	0xc4
	.uleb128 0x6
	.long	0xad
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF28
	.byte	0xc
	.byte	0x4
	.byte	0x39
	.long	0xf5
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.byte	0x3a
	.long	0x98
	.byte	0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.byte	0x3b
	.long	0x98
	.byte	0x4
	.uleb128 0x9
	.string	"yaw"
	.byte	0x4
	.byte	0x3c
	.long	0x98
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF18
	.byte	0x4
	.byte	0x3d
	.long	0xc4
	.uleb128 0xa
	.byte	0xc
	.byte	0x4
	.byte	0x3f
	.long	0x11f
	.uleb128 0xb
	.string	"raw"
	.byte	0x4
	.byte	0x40
	.long	0xb4
	.uleb128 0xc
	.long	.LASF19
	.byte	0x4
	.byte	0x41
	.long	0xf5
	.byte	0
	.uleb128 0x3
	.long	.LASF20
	.byte	0x4
	.byte	0x42
	.long	0x100
	.uleb128 0xd
	.byte	0x4
	.long	0x8a
	.byte	0x6
	.byte	0x14
	.long	0x143
	.uleb128 0xe
	.string	"X"
	.byte	0
	.uleb128 0xe
	.string	"Y"
	.byte	0x1
	.uleb128 0xe
	.string	"Z"
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF21
	.byte	0x5
	.byte	0x15
	.long	0x6d
	.uleb128 0xd
	.byte	0x4
	.long	0x8a
	.byte	0x5
	.byte	0x1d
	.long	0x17d
	.uleb128 0xf
	.long	.LASF22
	.value	0xfff
	.uleb128 0xf
	.long	.LASF23
	.value	0xf000
	.uleb128 0xf
	.long	.LASF24
	.value	0xfff
	.uleb128 0x10
	.long	.LASF25
	.byte	0
	.uleb128 0xf
	.long	.LASF26
	.value	0x8000
	.byte	0
	.uleb128 0x3
	.long	.LASF27
	.byte	0x5
	.byte	0x26
	.long	0x188
	.uleb128 0x11
	.long	0x198
	.uleb128 0x12
	.long	0x198
	.uleb128 0x12
	.long	0x4d
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.byte	0x2d
	.long	0x1b8
	.uleb128 0xb
	.string	"ptr"
	.byte	0x5
	.byte	0x2e
	.long	0x198
	.uleb128 0xb
	.string	"fn"
	.byte	0x5
	.byte	0x2f
	.long	0x1b8
	.byte	0
	.uleb128 0x14
	.byte	0x8
	.long	0x17d
	.uleb128 0x7
	.long	.LASF29
	.byte	0x20
	.byte	0x5
	.byte	0x28
	.long	0x207
	.uleb128 0x9
	.string	"pgn"
	.byte	0x5
	.byte	0x29
	.long	0x143
	.byte	0
	.uleb128 0x8
	.long	.LASF30
	.byte	0x5
	.byte	0x2a
	.long	0x6d
	.byte	0x2
	.uleb128 0x8
	.long	.LASF31
	.byte	0x5
	.byte	0x2b
	.long	0x207
	.byte	0x8
	.uleb128 0x9
	.string	"ptr"
	.byte	0x5
	.byte	0x2c
	.long	0x20d
	.byte	0x10
	.uleb128 0x8
	.long	.LASF32
	.byte	0x5
	.byte	0x30
	.long	0x19a
	.byte	0x18
	.byte	0
	.uleb128 0x14
	.byte	0x8
	.long	0x5b
	.uleb128 0x14
	.byte	0x8
	.long	0x207
	.uleb128 0x3
	.long	.LASF33
	.byte	0x5
	.byte	0x31
	.long	0x1be
	.uleb128 0xd
	.byte	0x4
	.long	0x8a
	.byte	0x7
	.byte	0x15
	.long	0x243
	.uleb128 0x10
	.long	.LASF34
	.byte	0
	.uleb128 0x10
	.long	.LASF35
	.byte	0x1
	.uleb128 0x10
	.long	.LASF36
	.byte	0x2
	.uleb128 0x10
	.long	.LASF37
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF38
	.byte	0x6
	.byte	0x7
	.byte	0x20
	.long	0x274
	.uleb128 0x8
	.long	.LASF16
	.byte	0x7
	.byte	0x21
	.long	0x30
	.byte	0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x7
	.byte	0x22
	.long	0x30
	.byte	0x2
	.uleb128 0x9
	.string	"yaw"
	.byte	0x7
	.byte	0x23
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF39
	.byte	0x7
	.byte	0x24
	.long	0x243
	.uleb128 0x15
	.long	.LASF93
	.byte	0x6
	.byte	0x7
	.byte	0x26
	.long	0x2a2
	.uleb128 0xb
	.string	"raw"
	.byte	0x7
	.byte	0x27
	.long	0x2a2
	.uleb128 0xc
	.long	.LASF40
	.byte	0x7
	.byte	0x28
	.long	0x274
	.byte	0
	.uleb128 0x5
	.long	0x30
	.long	0x2b2
	.uleb128 0x6
	.long	0xad
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF41
	.byte	0x7
	.byte	0x29
	.long	0x27f
	.uleb128 0xd
	.byte	0x4
	.long	0x8a
	.byte	0x7
	.byte	0x39
	.long	0x300
	.uleb128 0x10
	.long	.LASF42
	.byte	0
	.uleb128 0x10
	.long	.LASF43
	.byte	0x1
	.uleb128 0x10
	.long	.LASF44
	.byte	0x2
	.uleb128 0x10
	.long	.LASF45
	.byte	0x3
	.uleb128 0x10
	.long	.LASF46
	.byte	0x4
	.uleb128 0x10
	.long	.LASF47
	.byte	0x5
	.uleb128 0x10
	.long	.LASF48
	.byte	0x6
	.uleb128 0x10
	.long	.LASF49
	.byte	0x7
	.uleb128 0x10
	.long	.LASF50
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF51
	.byte	0x7
	.byte	0x43
	.long	0x2bd
	.uleb128 0x7
	.long	.LASF52
	.byte	0xc
	.byte	0x7
	.byte	0x45
	.long	0x33c
	.uleb128 0x8
	.long	.LASF53
	.byte	0x7
	.byte	0x46
	.long	0x300
	.byte	0
	.uleb128 0x8
	.long	.LASF54
	.byte	0x7
	.byte	0x47
	.long	0x300
	.byte	0x4
	.uleb128 0x8
	.long	.LASF55
	.byte	0x7
	.byte	0x48
	.long	0x300
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF56
	.byte	0x7
	.byte	0x49
	.long	0x30b
	.uleb128 0x7
	.long	.LASF57
	.byte	0x3
	.byte	0x7
	.byte	0x4b
	.long	0x378
	.uleb128 0x8
	.long	.LASF58
	.byte	0x7
	.byte	0x4c
	.long	0x5b
	.byte	0
	.uleb128 0x8
	.long	.LASF59
	.byte	0x7
	.byte	0x4d
	.long	0x5b
	.byte	0x1
	.uleb128 0x8
	.long	.LASF60
	.byte	0x7
	.byte	0x4e
	.long	0x5b
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF61
	.byte	0x7
	.byte	0x4f
	.long	0x347
	.uleb128 0x7
	.long	.LASF62
	.byte	0xc
	.byte	0x7
	.byte	0x51
	.long	0x3a8
	.uleb128 0x8
	.long	.LASF63
	.byte	0x7
	.byte	0x52
	.long	0x2b2
	.byte	0
	.uleb128 0x8
	.long	.LASF64
	.byte	0x7
	.byte	0x53
	.long	0x2b2
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF65
	.byte	0x7
	.byte	0x54
	.long	0x383
	.uleb128 0x7
	.long	.LASF66
	.byte	0x6
	.byte	0x1
	.byte	0x14
	.long	0x3e4
	.uleb128 0x8
	.long	.LASF67
	.byte	0x1
	.byte	0x15
	.long	0x30
	.byte	0
	.uleb128 0x8
	.long	.LASF68
	.byte	0x1
	.byte	0x16
	.long	0x30
	.byte	0x2
	.uleb128 0x8
	.long	.LASF69
	.byte	0x1
	.byte	0x17
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF70
	.byte	0x1
	.byte	0x18
	.long	0x3b3
	.uleb128 0x16
	.long	.LASF72
	.byte	0x1
	.byte	0x1a
	.long	0x40c
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.byte	0x8
	.long	0x3e4
	.uleb128 0x17
	.long	.LASF94
	.byte	0x2
	.byte	0x26
	.long	0x442
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x442
	.uleb128 0x18
	.long	.LASF72
	.byte	0x2
	.byte	0x26
	.long	0x40c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF71
	.uleb128 0x19
	.long	.LASF74
	.byte	0x2
	.byte	0x2b
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x475
	.uleb128 0x1a
	.long	.LASF73
	.byte	0x2
	.byte	0x33
	.long	0x11f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1b
	.long	.LASF95
	.byte	0x2
	.byte	0x3b
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c5
	.uleb128 0x1c
	.string	"vec"
	.byte	0x2
	.byte	0x3b
	.long	0x4c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.string	"x"
	.byte	0x2
	.byte	0x3d
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1d
	.string	"y"
	.byte	0x2
	.byte	0x3e
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.string	"z"
	.byte	0x2
	.byte	0x3f
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x14
	.byte	0x8
	.long	0x42
	.uleb128 0x19
	.long	.LASF75
	.byte	0x2
	.byte	0x46
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x528
	.uleb128 0x1c
	.string	"src"
	.byte	0x2
	.byte	0x46
	.long	0x4c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.long	.LASF76
	.byte	0x2
	.byte	0x46
	.long	0x4c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x18
	.long	.LASF77
	.byte	0x2
	.byte	0x46
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.long	.LASF78
	.byte	0x2
	.byte	0x48
	.long	0x528
	.uleb128 0x9
	.byte	0x3
	.quad	swap.3320
	.byte	0
	.uleb128 0x5
	.long	0x7f
	.long	0x538
	.uleb128 0x6
	.long	0xad
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF79
	.byte	0x2
	.byte	0x23
	.long	0x442
	.uleb128 0x9
	.byte	0x3
	.quad	standardBoardAlignment
	.uleb128 0x5
	.long	0x98
	.long	0x563
	.uleb128 0x6
	.long	0xad
	.byte	0x2
	.uleb128 0x6
	.long	0xad
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF80
	.byte	0x2
	.byte	0x24
	.long	0x54d
	.uleb128 0x9
	.byte	0x3
	.quad	boardRotation
	.uleb128 0x1e
	.long	.LASF81
	.byte	0x5
	.byte	0x43
	.long	0x58d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x14
	.byte	0x8
	.long	0x213
	.uleb128 0x1e
	.long	.LASF82
	.byte	0x5
	.byte	0x44
	.long	0x58d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x1e
	.long	.LASF83
	.byte	0x5
	.byte	0x47
	.long	0x207
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x1e
	.long	.LASF84
	.byte	0x5
	.byte	0x48
	.long	0x207
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x1e
	.long	.LASF85
	.byte	0x7
	.byte	0x56
	.long	0x378
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x1e
	.long	.LASF86
	.byte	0x7
	.byte	0x57
	.long	0x33c
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x1e
	.long	.LASF87
	.byte	0x7
	.byte	0x58
	.long	0x3a8
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x2
	.byte	0x21
	.long	0x3e4
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_System
	.uleb128 0x1e
	.long	.LASF89
	.byte	0x2
	.byte	0x21
	.long	0x63b
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_Registry
	.uleb128 0x1f
	.long	0x213
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x6c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB7
	.quad	.LFE7
	.quad	.LFB8
	.quad	.LFE8
	.quad	.LFB9
	.quad	.LFE9
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB11
	.quad	.LFE11
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF32:
	.string	"reset"
.LASF49:
	.string	"CW180_DEG_FLIP"
.LASF80:
	.string	"boardRotation"
.LASF38:
	.string	"int16_flightDynamicsTrims_s"
.LASF27:
	.string	"pgResetFunc"
.LASF74:
	.string	"initBoardAlignment"
.LASF36:
	.string	"SENSOR_INDEX_BARO"
.LASF62:
	.string	"sensorTrims_s"
.LASF65:
	.string	"sensorTrims_t"
.LASF22:
	.string	"PGR_PGN_MASK"
.LASF63:
	.string	"accZero"
.LASF18:
	.string	"fp_angles_def"
.LASF48:
	.string	"CW90_DEG_FLIP"
.LASF42:
	.string	"ALIGN_DEFAULT"
.LASF40:
	.string	"values"
.LASF39:
	.string	"flightDynamicsTrims_def_t"
.LASF83:
	.string	"__pg_resetdata_start"
.LASF2:
	.string	"int16_t"
.LASF0:
	.string	"signed char"
.LASF34:
	.string	"SENSOR_INDEX_GYRO"
.LASF26:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF95:
	.string	"alignBoard"
.LASF20:
	.string	"fp_angles_t"
.LASF4:
	.string	"long int"
.LASF44:
	.string	"CW90_DEG"
.LASF25:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF88:
	.string	"boardAlignment_System"
.LASF7:
	.string	"uint16_t"
.LASF13:
	.string	"double"
.LASF41:
	.string	"flightDynamicsTrims_t"
.LASF93:
	.string	"flightDynamicsTrims_u"
.LASF91:
	.string	"src/main/sensors/boardalignment.c"
.LASF69:
	.string	"yawDegrees"
.LASF66:
	.string	"boardAlignment_s"
.LASF70:
	.string	"boardAlignment_t"
.LASF72:
	.string	"boardAlignment"
.LASF58:
	.string	"acc_hardware"
.LASF85:
	.string	"sensorSelectionConfig_System"
.LASF10:
	.string	"unsigned int"
.LASF54:
	.string	"acc_align"
.LASF90:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF21:
	.string	"pgn_t"
.LASF11:
	.string	"long unsigned int"
.LASF89:
	.string	"boardAlignment_Registry"
.LASF30:
	.string	"size"
.LASF8:
	.string	"short unsigned int"
.LASF33:
	.string	"pgRegistry_t"
.LASF43:
	.string	"CW0_DEG"
.LASF37:
	.string	"SENSOR_INDEX_MAG"
.LASF82:
	.string	"__pg_registry_end"
.LASF15:
	.string	"sizetype"
.LASF31:
	.string	"address"
.LASF17:
	.string	"pitch"
.LASF24:
	.string	"PGR_SIZE_MASK"
.LASF84:
	.string	"__pg_resetdata_end"
.LASF75:
	.string	"alignSensors"
.LASF16:
	.string	"roll"
.LASF78:
	.string	"swap"
.LASF92:
	.string	"/home/aravind/git/cleanflight"
.LASF12:
	.string	"float"
.LASF81:
	.string	"__pg_registry_start"
.LASF57:
	.string	"sensorSelectionConfig_s"
.LASF59:
	.string	"mag_hardware"
.LASF76:
	.string	"dest"
.LASF79:
	.string	"standardBoardAlignment"
.LASF45:
	.string	"CW180_DEG"
.LASF71:
	.string	"_Bool"
.LASF3:
	.string	"int32_t"
.LASF6:
	.string	"unsigned char"
.LASF67:
	.string	"rollDegrees"
.LASF1:
	.string	"short int"
.LASF47:
	.string	"CW0_DEG_FLIP"
.LASF64:
	.string	"magZero"
.LASF53:
	.string	"gyro_align"
.LASF9:
	.string	"uint32_t"
.LASF46:
	.string	"CW270_DEG"
.LASF29:
	.string	"pgRegistry_s"
.LASF60:
	.string	"baro_hardware"
.LASF14:
	.string	"char"
.LASF51:
	.string	"sensor_align_e"
.LASF19:
	.string	"angles"
.LASF87:
	.string	"sensorTrims_System"
.LASF55:
	.string	"mag_align"
.LASF94:
	.string	"isBoardAlignmentStandard"
.LASF23:
	.string	"PGR_PGN_VERSION_MASK"
.LASF77:
	.string	"rotation"
.LASF52:
	.string	"sensorAlignmentConfig_s"
.LASF56:
	.string	"sensorAlignmentConfig_t"
.LASF28:
	.string	"fp_angles"
.LASF35:
	.string	"SENSOR_INDEX_ACC"
.LASF73:
	.string	"rotationAngles"
.LASF5:
	.string	"uint8_t"
.LASF86:
	.string	"sensorAlignmentConfig_System"
.LASF50:
	.string	"CW270_DEG_FLIP"
.LASF68:
	.string	"pitchDegrees"
.LASF61:
	.string	"sensorSelectionConfig_t"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
