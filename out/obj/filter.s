	.file	"filter.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed filter.i -mtune=generic -march=x86-64
# -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -fverbose-asm
# -ffat-lto-objects -fstack-protector-strong -Wformat -Wformat-security
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
	.section	.text.pt1FilterInit,"ax",@progbits
	.globl	pt1FilterInit
	.type	pt1FilterInit, @function
pt1FilterInit:
.LFB2:
	.file 1 "src/main/common/filter.c"
	.loc 1 33 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# filter, filter
	movl	%esi, %eax	# f_cut, tmp91
	movss	%xmm0, -16(%rbp)	# dT, dT
	movb	%al, -12(%rbp)	# tmp91, f_cut
	.loc 1 34 0
	movzbl	-12(%rbp), %eax	# f_cut, D.3763
	pxor	%xmm0, %xmm0	# D.3764
	cvtsi2ss	%eax, %xmm0	# D.3763, D.3764
	movss	.LC0(%rip), %xmm1	#, tmp92
	mulss	%xmm1, %xmm0	# tmp92, D.3764
	movss	.LC1(%rip), %xmm1	#, tmp93
	divss	%xmm0, %xmm1	# D.3764, D.3764
	movaps	%xmm1, %xmm0	# D.3764, D.3764
	movq	-8(%rbp), %rax	# filter, tmp94
	movss	%xmm0, 4(%rax)	# D.3764, filter_7(D)->RC
	.loc 1 35 0
	movq	-8(%rbp), %rax	# filter, tmp95
	movss	-16(%rbp), %xmm0	# dT, tmp96
	movss	%xmm0, 8(%rax)	# tmp96, filter_7(D)->dT
	.loc 1 36 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	pt1FilterInit, .-pt1FilterInit
	.section	.text.pt1FilterApply,"ax",@progbits
	.globl	pt1FilterApply
	.type	pt1FilterApply, @function
pt1FilterApply:
.LFB3:
	.loc 1 39 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# filter, filter
	movss	%xmm0, -12(%rbp)	# input, input
	.loc 1 40 0
	movq	-8(%rbp), %rax	# filter, tmp99
	movss	(%rax), %xmm2	# filter_2(D)->state, D.3765
	movq	-8(%rbp), %rax	# filter, tmp100
	movss	8(%rax), %xmm1	# filter_2(D)->dT, D.3765
	movq	-8(%rbp), %rax	# filter, tmp101
	movss	4(%rax), %xmm3	# filter_2(D)->RC, D.3765
	movq	-8(%rbp), %rax	# filter, tmp102
	movss	8(%rax), %xmm0	# filter_2(D)->dT, D.3765
	addss	%xmm3, %xmm0	# D.3765, D.3765
	divss	%xmm0, %xmm1	# D.3765, D.3765
	movq	-8(%rbp), %rax	# filter, tmp103
	movss	(%rax), %xmm3	# filter_2(D)->state, D.3765
	movss	-12(%rbp), %xmm0	# input, tmp104
	subss	%xmm3, %xmm0	# D.3765, D.3765
	mulss	%xmm1, %xmm0	# D.3765, D.3765
	addss	%xmm2, %xmm0	# D.3765, D.3765
	movq	-8(%rbp), %rax	# filter, tmp105
	movss	%xmm0, (%rax)	# D.3765, filter_2(D)->state
	.loc 1 41 0
	movq	-8(%rbp), %rax	# filter, tmp106
	movss	(%rax), %xmm0	# filter_2(D)->state, D.3765
	.loc 1 42 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	pt1FilterApply, .-pt1FilterApply
	.section	.text.pt1FilterApply4,"ax",@progbits
	.globl	pt1FilterApply4
	.type	pt1FilterApply4, @function
pt1FilterApply4:
.LFB4:
	.loc 1 45 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# filter, filter
	movss	%xmm0, -12(%rbp)	# input, input
	movl	%esi, %eax	# f_cut, tmp104
	movss	%xmm1, -20(%rbp)	# dT, dT
	movb	%al, -16(%rbp)	# tmp104, f_cut
	.loc 1 47 0
	movq	-8(%rbp), %rax	# filter, tmp105
	movss	4(%rax), %xmm0	# filter_3(D)->RC, D.3766
	pxor	%xmm1, %xmm1	# tmp106
	ucomiss	%xmm1, %xmm0	# tmp106, D.3766
	jp	.L5	#,
	pxor	%xmm1, %xmm1	# tmp107
	ucomiss	%xmm1, %xmm0	# tmp107, D.3766
	jne	.L5	#,
	.loc 1 48 0
	movzbl	-16(%rbp), %eax	# f_cut, D.3767
	pxor	%xmm0, %xmm0	# D.3766
	cvtsi2ss	%eax, %xmm0	# D.3767, D.3766
	movss	.LC0(%rip), %xmm1	#, tmp108
	mulss	%xmm1, %xmm0	# tmp108, D.3766
	movss	.LC1(%rip), %xmm1	#, tmp109
	divss	%xmm0, %xmm1	# D.3766, D.3766
	movaps	%xmm1, %xmm0	# D.3766, D.3766
	movq	-8(%rbp), %rax	# filter, tmp110
	movss	%xmm0, 4(%rax)	# D.3766, filter_3(D)->RC
	.loc 1 49 0
	movq	-8(%rbp), %rax	# filter, tmp111
	movss	-20(%rbp), %xmm0	# dT, tmp112
	movss	%xmm0, 8(%rax)	# tmp112, filter_3(D)->dT
.L5:
	.loc 1 52 0
	movq	-8(%rbp), %rax	# filter, tmp113
	movss	(%rax), %xmm2	# filter_3(D)->state, D.3766
	movq	-8(%rbp), %rax	# filter, tmp114
	movss	8(%rax), %xmm1	# filter_3(D)->dT, D.3766
	movq	-8(%rbp), %rax	# filter, tmp115
	movss	4(%rax), %xmm3	# filter_3(D)->RC, D.3766
	movq	-8(%rbp), %rax	# filter, tmp116
	movss	8(%rax), %xmm0	# filter_3(D)->dT, D.3766
	addss	%xmm3, %xmm0	# D.3766, D.3766
	divss	%xmm0, %xmm1	# D.3766, D.3766
	movq	-8(%rbp), %rax	# filter, tmp117
	movss	(%rax), %xmm3	# filter_3(D)->state, D.3766
	movss	-12(%rbp), %xmm0	# input, tmp118
	subss	%xmm3, %xmm0	# D.3766, D.3766
	mulss	%xmm1, %xmm0	# D.3766, D.3766
	addss	%xmm2, %xmm0	# D.3766, D.3766
	movq	-8(%rbp), %rax	# filter, tmp119
	movss	%xmm0, (%rax)	# D.3766, filter_3(D)->state
	.loc 1 54 0
	movq	-8(%rbp), %rax	# filter, tmp120
	movss	(%rax), %xmm0	# filter_3(D)->state, D.3766
	.loc 1 55 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	pt1FilterApply4, .-pt1FilterApply4
	.section	.text.BiQuadNewLpf,"ax",@progbits
	.globl	BiQuadNewLpf
	.type	BiQuadNewLpf, @function
BiQuadNewLpf:
.LFB5:
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movss	%xmm0, -52(%rbp)	# filterCutFreq, filterCutFreq
	movq	%rdi, -64(%rbp)	# newState, newState
	movl	%esi, -56(%rbp)	# refreshRate, refreshRate
	.loc 1 62 0
	movl	-56(%rbp), %eax	# refreshRate, tmp102
	testq	%rax, %rax	# tmp102
	js	.L10	#,
	pxor	%xmm0, %xmm0	# D.3768
	cvtsi2ssq	%rax, %xmm0	# tmp102, D.3768
	jmp	.L11	#
.L10:
	movq	%rax, %rdx	# tmp102, tmp104
	shrq	%rdx	# tmp104
	andl	$1, %eax	#, tmp105
	orq	%rax, %rdx	# tmp105, tmp104
	pxor	%xmm0, %xmm0	# tmp103
	cvtsi2ssq	%rdx, %xmm0	# tmp104, tmp103
	addss	%xmm0, %xmm0	# tmp103, D.3768
.L11:
	movss	.LC3(%rip), %xmm1	#, tmp106
	mulss	%xmm1, %xmm0	# tmp106, D.3768
	movss	.LC1(%rip), %xmm1	#, tmp108
	divss	%xmm0, %xmm1	# D.3768, tmp107
	movaps	%xmm1, %xmm0	# tmp107, tmp107
	movss	%xmm0, -44(%rbp)	# tmp107, sampleRate
	.loc 1 68 0
	movss	-52(%rbp), %xmm1	# filterCutFreq, tmp109
	movss	.LC0(%rip), %xmm0	#, tmp110
	mulss	%xmm1, %xmm0	# tmp109, D.3768
	divss	-44(%rbp), %xmm0	# sampleRate, tmp111
	movss	%xmm0, -40(%rbp)	# tmp111, omega
	.loc 1 69 0
	movl	-40(%rbp), %eax	# omega, tmp112
	movl	%eax, -68(%rbp)	# tmp112, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	sinf	#
	movd	%xmm0, %eax	#, tmp113
	movl	%eax, -36(%rbp)	# tmp113, sn
	.loc 1 70 0
	movl	-40(%rbp), %eax	# omega, tmp114
	movl	%eax, -68(%rbp)	# tmp114, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	cosf	#
	movd	%xmm0, %eax	#, tmp115
	movl	%eax, -32(%rbp)	# tmp115, cs
	.loc 1 71 0
	movss	-40(%rbp), %xmm1	# omega, tmp116
	movss	.LC4(%rip), %xmm0	#, tmp117
	mulss	%xmm1, %xmm0	# tmp116, D.3768
	divss	-36(%rbp), %xmm0	# sn, D.3768
	call	sinf	#
	mulss	-36(%rbp), %xmm0	# sn, tmp118
	movss	%xmm0, -28(%rbp)	# tmp118, alpha
	.loc 1 73 0
	movss	.LC1(%rip), %xmm0	#, tmp119
	subss	-32(%rbp), %xmm0	# cs, D.3768
	movss	.LC5(%rip), %xmm1	#, tmp121
	divss	%xmm1, %xmm0	# tmp121, tmp120
	movss	%xmm0, -24(%rbp)	# tmp120, b0
	.loc 1 74 0
	movss	.LC1(%rip), %xmm0	#, tmp123
	subss	-32(%rbp), %xmm0	# cs, tmp122
	movss	%xmm0, -20(%rbp)	# tmp122, b1
	.loc 1 75 0
	movss	.LC1(%rip), %xmm0	#, tmp124
	subss	-32(%rbp), %xmm0	# cs, D.3768
	movss	.LC5(%rip), %xmm1	#, tmp126
	divss	%xmm1, %xmm0	# tmp126, tmp125
	movss	%xmm0, -16(%rbp)	# tmp125, b2
	.loc 1 76 0
	movss	-28(%rbp), %xmm1	# alpha, tmp128
	movss	.LC1(%rip), %xmm0	#, tmp129
	addss	%xmm1, %xmm0	# tmp128, tmp127
	movss	%xmm0, -12(%rbp)	# tmp127, a0
	.loc 1 77 0
	movss	-32(%rbp), %xmm1	# cs, tmp131
	movss	.LC6(%rip), %xmm0	#, tmp132
	mulss	%xmm1, %xmm0	# tmp131, tmp130
	movss	%xmm0, -8(%rbp)	# tmp130, a1
	.loc 1 78 0
	movss	.LC1(%rip), %xmm0	#, tmp134
	subss	-28(%rbp), %xmm0	# alpha, tmp133
	movss	%xmm0, -4(%rbp)	# tmp133, a2
	.loc 1 81 0
	movss	-24(%rbp), %xmm0	# b0, tmp135
	divss	-12(%rbp), %xmm0	# a0, D.3768
	movq	-64(%rbp), %rax	# newState, tmp136
	movss	%xmm0, (%rax)	# D.3768, newState_24(D)->b0
	.loc 1 82 0
	movss	-20(%rbp), %xmm0	# b1, tmp137
	divss	-12(%rbp), %xmm0	# a0, D.3768
	movq	-64(%rbp), %rax	# newState, tmp138
	movss	%xmm0, 4(%rax)	# D.3768, newState_24(D)->b1
	.loc 1 83 0
	movss	-16(%rbp), %xmm0	# b2, tmp139
	divss	-12(%rbp), %xmm0	# a0, D.3768
	movq	-64(%rbp), %rax	# newState, tmp140
	movss	%xmm0, 8(%rax)	# D.3768, newState_24(D)->b2
	.loc 1 84 0
	movss	-8(%rbp), %xmm0	# a1, tmp141
	divss	-12(%rbp), %xmm0	# a0, D.3768
	movq	-64(%rbp), %rax	# newState, tmp142
	movss	%xmm0, 12(%rax)	# D.3768, newState_24(D)->a1
	.loc 1 85 0
	movss	-4(%rbp), %xmm0	# a2, tmp143
	divss	-12(%rbp), %xmm0	# a0, D.3768
	movq	-64(%rbp), %rax	# newState, tmp144
	movss	%xmm0, 16(%rax)	# D.3768, newState_24(D)->a2
	.loc 1 88 0
	movq	-64(%rbp), %rax	# newState, tmp145
	pxor	%xmm0, %xmm0	# tmp146
	movss	%xmm0, 24(%rax)	# tmp146, newState_24(D)->x2
	movq	-64(%rbp), %rax	# newState, tmp147
	movss	24(%rax), %xmm0	# newState_24(D)->x2, D.3768
	movq	-64(%rbp), %rax	# newState, tmp148
	movss	%xmm0, 20(%rax)	# D.3768, newState_24(D)->x1
	.loc 1 89 0
	movq	-64(%rbp), %rax	# newState, tmp149
	pxor	%xmm0, %xmm0	# tmp150
	movss	%xmm0, 32(%rax)	# tmp150, newState_24(D)->y2
	movq	-64(%rbp), %rax	# newState, tmp151
	movss	32(%rax), %xmm0	# newState_24(D)->y2, D.3768
	movq	-64(%rbp), %rax	# newState, tmp152
	movss	%xmm0, 28(%rax)	# D.3768, newState_24(D)->y1
	.loc 1 90 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	BiQuadNewLpf, .-BiQuadNewLpf
	.section	.text.applyBiQuadFilter,"ax",@progbits
	.globl	applyBiQuadFilter
	.type	applyBiQuadFilter, @function
applyBiQuadFilter:
.LFB6:
	.loc 1 94 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)	# sample, sample
	movq	%rdi, -32(%rbp)	# state, state
	.loc 1 98 0
	movq	-32(%rbp), %rax	# state, tmp108
	movss	(%rax), %xmm0	# state_2(D)->b0, D.3770
	movaps	%xmm0, %xmm1	# D.3770, D.3770
	mulss	-20(%rbp), %xmm1	# sample, D.3770
	movq	-32(%rbp), %rax	# state, tmp109
	movss	4(%rax), %xmm2	# state_2(D)->b1, D.3770
	movq	-32(%rbp), %rax	# state, tmp110
	movss	20(%rax), %xmm0	# state_2(D)->x1, D.3770
	mulss	%xmm2, %xmm0	# D.3770, D.3770
	addss	%xmm0, %xmm1	# D.3770, D.3770
	movq	-32(%rbp), %rax	# state, tmp111
	movss	8(%rax), %xmm2	# state_2(D)->b2, D.3770
	movq	-32(%rbp), %rax	# state, tmp112
	movss	24(%rax), %xmm0	# state_2(D)->x2, D.3770
	mulss	%xmm2, %xmm0	# D.3770, D.3770
	addss	%xmm1, %xmm0	# D.3770, D.3770
	.loc 1 99 0
	movq	-32(%rbp), %rax	# state, tmp113
	movss	12(%rax), %xmm2	# state_2(D)->a1, D.3770
	movq	-32(%rbp), %rax	# state, tmp114
	movss	28(%rax), %xmm1	# state_2(D)->y1, D.3770
	mulss	%xmm2, %xmm1	# D.3770, D.3770
	.loc 1 98 0
	subss	%xmm1, %xmm0	# D.3770, D.3770
	.loc 1 99 0
	movq	-32(%rbp), %rax	# state, tmp115
	movss	16(%rax), %xmm2	# state_2(D)->a2, D.3770
	movq	-32(%rbp), %rax	# state, tmp116
	movss	32(%rax), %xmm1	# state_2(D)->y2, D.3770
	mulss	%xmm2, %xmm1	# D.3770, D.3770
	.loc 1 98 0
	subss	%xmm1, %xmm0	# D.3770, tmp117
	movss	%xmm0, -4(%rbp)	# tmp117, result
	.loc 1 102 0
	movq	-32(%rbp), %rax	# state, tmp118
	movss	20(%rax), %xmm0	# state_2(D)->x1, D.3770
	movq	-32(%rbp), %rax	# state, tmp119
	movss	%xmm0, 24(%rax)	# D.3770, state_2(D)->x2
	.loc 1 103 0
	movq	-32(%rbp), %rax	# state, tmp120
	movss	-20(%rbp), %xmm0	# sample, tmp121
	movss	%xmm0, 20(%rax)	# tmp121, state_2(D)->x1
	.loc 1 106 0
	movq	-32(%rbp), %rax	# state, tmp122
	movss	28(%rax), %xmm0	# state_2(D)->y1, D.3770
	movq	-32(%rbp), %rax	# state, tmp123
	movss	%xmm0, 32(%rax)	# D.3770, state_2(D)->y2
	.loc 1 107 0
	movq	-32(%rbp), %rax	# state, tmp124
	movss	-4(%rbp), %xmm0	# result, tmp125
	movss	%xmm0, 28(%rax)	# tmp125, state_2(D)->y1
	.loc 1 109 0
	movss	-4(%rbp), %xmm0	# result, D.3770
	.loc 1 110 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	applyBiQuadFilter, .-applyBiQuadFilter
	.section	.text.filterApplyAverage,"ax",@progbits
	.globl	filterApplyAverage
	.type	filterApplyAverage, @function
filterApplyAverage:
.LFB7:
	.loc 1 113 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# input, input
	movl	%esi, %eax	# count, tmp103
	movq	%rdx, -32(%rbp)	# averageState, averageState
	movb	%al, -24(%rbp)	# tmp103, count
	.loc 1 114 0
	movl	$0, -8(%rbp)	#, sum
.LBB2:
	.loc 1 115 0
	movzbl	-24(%rbp), %eax	# count, D.3771
	subl	$1, %eax	#, tmp104
	movl	%eax, -4(%rbp)	# tmp104, ii
	jmp	.L15	#
.L16:
	.loc 1 116 0 discriminator 3
	movl	-4(%rbp), %eax	# ii, tmp105
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3772
	movq	-32(%rbp), %rax	# averageState, tmp106
	addq	%rax, %rdx	# tmp106, D.3773
	movl	-4(%rbp), %eax	# ii, tmp107
	cltq
	salq	$2, %rax	#, D.3772
	leaq	-4(%rax), %rcx	#, D.3774
	movq	-32(%rbp), %rax	# averageState, tmp108
	addq	%rcx, %rax	# D.3774, D.3773
	movl	(%rax), %eax	# *_16, D.3771
	movl	%eax, (%rdx)	# D.3771, *_12
	.loc 1 117 0 discriminator 3
	movl	-4(%rbp), %eax	# ii, tmp109
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3772
	movq	-32(%rbp), %rax	# averageState, tmp110
	addq	%rdx, %rax	# D.3772, D.3773
	movl	(%rax), %eax	# *_21, D.3771
	addl	%eax, -8(%rbp)	# D.3771, sum
	.loc 1 115 0 discriminator 3
	subl	$1, -4(%rbp)	#, ii
.L15:
	.loc 1 115 0 is_stmt 0 discriminator 1
	cmpl	$0, -4(%rbp)	#, ii
	jg	.L16	#,
.LBE2:
	.loc 1 119 0 is_stmt 1
	movq	-32(%rbp), %rax	# averageState, tmp111
	movl	-20(%rbp), %edx	# input, tmp112
	movl	%edx, (%rax)	# tmp112, *averageState_11(D)
	.loc 1 120 0
	movl	-20(%rbp), %eax	# input, tmp113
	addl	%eax, -8(%rbp)	# tmp113, sum
	.loc 1 121 0
	movzbl	-24(%rbp), %esi	# count, D.3771
	movl	-8(%rbp), %eax	# sum, tmp116
	cltd
	idivl	%esi	# D.3771
	.loc 1 122 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	filterApplyAverage, .-filterApplyAverage
	.section	.text.filterApplyAveragef,"ax",@progbits
	.globl	filterApplyAveragef
	.type	filterApplyAveragef, @function
filterApplyAveragef:
.LFB8:
	.loc 1 125 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)	# input, input
	movl	%edi, %eax	# count, tmp104
	movq	%rsi, -32(%rbp)	# averageState, averageState
	movb	%al, -24(%rbp)	# tmp104, count
	.loc 1 126 0
	pxor	%xmm0, %xmm0	# tmp105
	movss	%xmm0, -8(%rbp)	# tmp105, sum
.LBB3:
	.loc 1 127 0
	movzbl	-24(%rbp), %eax	# count, D.3776
	subl	$1, %eax	#, tmp106
	movl	%eax, -4(%rbp)	# tmp106, ii
	jmp	.L19	#
.L20:
	.loc 1 128 0 discriminator 3
	movl	-4(%rbp), %eax	# ii, tmp107
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3777
	movq	-32(%rbp), %rax	# averageState, tmp108
	addq	%rdx, %rax	# D.3777, D.3778
	movl	-4(%rbp), %edx	# ii, tmp109
	movslq	%edx, %rdx	# tmp109, D.3777
	salq	$2, %rdx	#, D.3777
	leaq	-4(%rdx), %rcx	#, D.3779
	movq	-32(%rbp), %rdx	# averageState, tmp110
	addq	%rcx, %rdx	# D.3779, D.3778
	movss	(%rdx), %xmm0	# *_16, D.3780
	movss	%xmm0, (%rax)	# D.3780, *_12
	.loc 1 129 0 discriminator 3
	movl	-4(%rbp), %eax	# ii, tmp111
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3777
	movq	-32(%rbp), %rax	# averageState, tmp112
	addq	%rdx, %rax	# D.3777, D.3778
	movss	(%rax), %xmm0	# *_21, D.3780
	movss	-8(%rbp), %xmm1	# sum, tmp114
	addss	%xmm1, %xmm0	# tmp114, tmp113
	movss	%xmm0, -8(%rbp)	# tmp113, sum
	.loc 1 127 0 discriminator 3
	subl	$1, -4(%rbp)	#, ii
.L19:
	.loc 1 127 0 is_stmt 0 discriminator 1
	cmpl	$0, -4(%rbp)	#, ii
	jg	.L20	#,
.LBE3:
	.loc 1 131 0 is_stmt 1
	movq	-32(%rbp), %rax	# averageState, tmp115
	movss	-20(%rbp), %xmm0	# input, tmp116
	movss	%xmm0, (%rax)	# tmp116, *averageState_11(D)
	.loc 1 132 0
	movss	-8(%rbp), %xmm0	# sum, tmp118
	addss	-20(%rbp), %xmm0	# input, tmp117
	movss	%xmm0, -8(%rbp)	# tmp117, sum
	.loc 1 133 0
	movzbl	-24(%rbp), %eax	# count, D.3776
	pxor	%xmm0, %xmm0	# D.3780
	cvtsi2ss	%eax, %xmm0	# D.3776, D.3780
	movss	-8(%rbp), %xmm1	# sum, tmp119
	divss	%xmm0, %xmm1	# D.3780, D.3780
	movaps	%xmm1, %xmm0	# D.3780, D.3780
	.loc 1 134 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	filterApplyAveragef, .-filterApplyAveragef
	.section	.rodata
	.align 4
.LC0:
	.long	1086918619
	.align 4
.LC1:
	.long	1065353216
	.align 4
.LC3:
	.long	897988541
	.align 4
.LC4:
	.long	1059623626
	.align 4
.LC5:
	.long	1073741824
	.align 4
.LC6:
	.long	3221225472
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/common/filter.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x473
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF869
	.byte	0xc
	.long	.LASF870
	.long	.LASF871
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF828
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF829
	.uleb128 0x3
	.long	.LASF831
	.byte	0x2
	.byte	0x26
	.long	0x46
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF830
	.uleb128 0x3
	.long	.LASF832
	.byte	0x2
	.byte	0x30
	.long	0x5f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF833
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF834
	.uleb128 0x3
	.long	.LASF835
	.byte	0x2
	.byte	0x33
	.long	0x78
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF836
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF837
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF838
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF839
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF840
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF841
	.uleb128 0x5
	.byte	0x8
	.long	0x3b
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF842
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF843
	.uleb128 0x6
	.long	.LASF846
	.byte	0xc
	.byte	0x3
	.byte	0x14
	.long	0xe5
	.uleb128 0x7
	.long	.LASF844
	.byte	0x3
	.byte	0x15
	.long	0xa8
	.byte	0
	.uleb128 0x8
	.string	"RC"
	.byte	0x3
	.byte	0x16
	.long	0xa8
	.byte	0x4
	.uleb128 0x8
	.string	"dT"
	.byte	0x3
	.byte	0x17
	.long	0xa8
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF845
	.byte	0x3
	.byte	0x18
	.long	0xb6
	.uleb128 0x6
	.long	.LASF847
	.byte	0x24
	.byte	0x3
	.byte	0x1b
	.long	0x160
	.uleb128 0x8
	.string	"b0"
	.byte	0x3
	.byte	0x1c
	.long	0xa8
	.byte	0
	.uleb128 0x8
	.string	"b1"
	.byte	0x3
	.byte	0x1c
	.long	0xa8
	.byte	0x4
	.uleb128 0x8
	.string	"b2"
	.byte	0x3
	.byte	0x1c
	.long	0xa8
	.byte	0x8
	.uleb128 0x8
	.string	"a1"
	.byte	0x3
	.byte	0x1c
	.long	0xa8
	.byte	0xc
	.uleb128 0x8
	.string	"a2"
	.byte	0x3
	.byte	0x1c
	.long	0xa8
	.byte	0x10
	.uleb128 0x8
	.string	"x1"
	.byte	0x3
	.byte	0x1d
	.long	0xa8
	.byte	0x14
	.uleb128 0x8
	.string	"x2"
	.byte	0x3
	.byte	0x1d
	.long	0xa8
	.byte	0x18
	.uleb128 0x8
	.string	"y1"
	.byte	0x3
	.byte	0x1d
	.long	0xa8
	.byte	0x1c
	.uleb128 0x8
	.string	"y2"
	.byte	0x3
	.byte	0x1d
	.long	0xa8
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	.LASF848
	.byte	0x3
	.byte	0x1e
	.long	0xf0
	.uleb128 0x9
	.long	.LASF854
	.byte	0x1
	.byte	0x20
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b2
	.uleb128 0xa
	.long	.LASF849
	.byte	0x1
	.byte	0x20
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.long	.LASF850
	.byte	0x1
	.byte	0x20
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.string	"dT"
	.byte	0x1
	.byte	0x20
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0xe5
	.uleb128 0xc
	.long	.LASF852
	.byte	0x1
	.byte	0x26
	.long	0xa8
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f6
	.uleb128 0xa
	.long	.LASF849
	.byte	0x1
	.byte	0x26
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.long	.LASF851
	.byte	0x1
	.byte	0x26
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xc
	.long	.LASF853
	.byte	0x1
	.byte	0x2c
	.long	0xa8
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x24f
	.uleb128 0xa
	.long	.LASF849
	.byte	0x1
	.byte	0x2c
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.long	.LASF851
	.byte	0x1
	.byte	0x2c
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.long	.LASF850
	.byte	0x1
	.byte	0x2c
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.string	"dT"
	.byte	0x1
	.byte	0x2c
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0xd
	.long	.LASF855
	.byte	0x1
	.byte	0x3a
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x32c
	.uleb128 0xa
	.long	.LASF856
	.byte	0x1
	.byte	0x3a
	.long	0xa8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xa
	.long	.LASF857
	.byte	0x1
	.byte	0x3a
	.long	0x32c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xa
	.long	.LASF858
	.byte	0x1
	.byte	0x3a
	.long	0x6d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xe
	.long	.LASF859
	.byte	0x1
	.byte	0x3c
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xe
	.long	.LASF860
	.byte	0x1
	.byte	0x40
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xf
	.string	"sn"
	.byte	0x1
	.byte	0x40
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xf
	.string	"cs"
	.byte	0x1
	.byte	0x40
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.long	.LASF861
	.byte	0x1
	.byte	0x40
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xf
	.string	"a0"
	.byte	0x1
	.byte	0x41
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.string	"a1"
	.byte	0x1
	.byte	0x41
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.string	"a2"
	.byte	0x1
	.byte	0x41
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.string	"b0"
	.byte	0x1
	.byte	0x41
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.string	"b1"
	.byte	0x1
	.byte	0x41
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xf
	.string	"b2"
	.byte	0x1
	.byte	0x41
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x160
	.uleb128 0xc
	.long	.LASF862
	.byte	0x1
	.byte	0x5d
	.long	0xa8
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x37e
	.uleb128 0xa
	.long	.LASF863
	.byte	0x1
	.byte	0x5d
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF844
	.byte	0x1
	.byte	0x5d
	.long	0x32c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.long	.LASF864
	.byte	0x1
	.byte	0x5f
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.long	.LASF865
	.byte	0x1
	.byte	0x70
	.long	0x3b
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x3f7
	.uleb128 0xa
	.long	.LASF851
	.byte	0x1
	.byte	0x70
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF866
	.byte	0x1
	.byte	0x70
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.long	.LASF867
	.byte	0x1
	.byte	0x70
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xf
	.string	"sum"
	.byte	0x1
	.byte	0x72
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xf
	.string	"ii"
	.byte	0x1
	.byte	0x73
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	.LASF868
	.byte	0x1
	.byte	0x7c
	.long	0xa8
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x470
	.uleb128 0xa
	.long	.LASF851
	.byte	0x1
	.byte	0x7c
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF866
	.byte	0x1
	.byte	0x7c
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.long	.LASF867
	.byte	0x1
	.byte	0x7c
	.long	0x470
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xf
	.string	"sum"
	.byte	0x1
	.byte	0x7e
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xf
	.string	"ii"
	.byte	0x1
	.byte	0x7f
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0xa8
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
	.uleb128 0x2119
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x8c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB2
	.quad	.LFE2
	.quad	.LFB3
	.quad	.LFE3
	.quad	.LFB4
	.quad	.LFE4
	.quad	.LFB5
	.quad	.LFE5
	.quad	.LFB6
	.quad	.LFE6
	.quad	.LFB7
	.quad	.LFE7
	.quad	.LFB8
	.quad	.LFE8
	.quad	0
	.quad	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x1
	.long	.LASF0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2
	.byte	0x5
	.uleb128 0x4
	.long	.LASF3
	.byte	0x5
	.uleb128 0x5
	.long	.LASF4
	.byte	0x5
	.uleb128 0x6
	.long	.LASF5
	.byte	0x5
	.uleb128 0x7
	.long	.LASF6
	.byte	0x5
	.uleb128 0x8
	.long	.LASF7
	.byte	0x5
	.uleb128 0x9
	.long	.LASF8
	.byte	0x5
	.uleb128 0xa
	.long	.LASF9
	.byte	0x5
	.uleb128 0xb
	.long	.LASF10
	.byte	0x5
	.uleb128 0xc
	.long	.LASF11
	.byte	0x5
	.uleb128 0xd
	.long	.LASF12
	.byte	0x5
	.uleb128 0xe
	.long	.LASF13
	.byte	0x5
	.uleb128 0xf
	.long	.LASF14
	.byte	0x5
	.uleb128 0x10
	.long	.LASF15
	.byte	0x5
	.uleb128 0x11
	.long	.LASF16
	.byte	0x5
	.uleb128 0x12
	.long	.LASF17
	.byte	0x5
	.uleb128 0x13
	.long	.LASF18
	.byte	0x5
	.uleb128 0x14
	.long	.LASF19
	.byte	0x5
	.uleb128 0x15
	.long	.LASF20
	.byte	0x5
	.uleb128 0x16
	.long	.LASF21
	.byte	0x5
	.uleb128 0x17
	.long	.LASF22
	.byte	0x5
	.uleb128 0x18
	.long	.LASF23
	.byte	0x5
	.uleb128 0x19
	.long	.LASF24
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF25
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF26
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF27
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF28
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF29
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF30
	.byte	0x5
	.uleb128 0x20
	.long	.LASF31
	.byte	0x5
	.uleb128 0x21
	.long	.LASF32
	.byte	0x5
	.uleb128 0x22
	.long	.LASF33
	.byte	0x5
	.uleb128 0x23
	.long	.LASF34
	.byte	0x5
	.uleb128 0x24
	.long	.LASF35
	.byte	0x5
	.uleb128 0x25
	.long	.LASF36
	.byte	0x5
	.uleb128 0x26
	.long	.LASF37
	.byte	0x5
	.uleb128 0x27
	.long	.LASF38
	.byte	0x5
	.uleb128 0x28
	.long	.LASF39
	.byte	0x5
	.uleb128 0x29
	.long	.LASF40
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF41
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF42
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF43
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF44
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF45
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF46
	.byte	0x5
	.uleb128 0x30
	.long	.LASF47
	.byte	0x5
	.uleb128 0x31
	.long	.LASF48
	.byte	0x5
	.uleb128 0x32
	.long	.LASF49
	.byte	0x5
	.uleb128 0x33
	.long	.LASF50
	.byte	0x5
	.uleb128 0x34
	.long	.LASF51
	.byte	0x5
	.uleb128 0x35
	.long	.LASF52
	.byte	0x5
	.uleb128 0x36
	.long	.LASF53
	.byte	0x5
	.uleb128 0x37
	.long	.LASF54
	.byte	0x5
	.uleb128 0x38
	.long	.LASF55
	.byte	0x5
	.uleb128 0x39
	.long	.LASF56
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF57
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF58
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF59
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF60
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF62
	.byte	0x5
	.uleb128 0x40
	.long	.LASF63
	.byte	0x5
	.uleb128 0x41
	.long	.LASF64
	.byte	0x5
	.uleb128 0x42
	.long	.LASF65
	.byte	0x5
	.uleb128 0x43
	.long	.LASF66
	.byte	0x5
	.uleb128 0x44
	.long	.LASF67
	.byte	0x5
	.uleb128 0x45
	.long	.LASF68
	.byte	0x5
	.uleb128 0x46
	.long	.LASF69
	.byte	0x5
	.uleb128 0x47
	.long	.LASF70
	.byte	0x5
	.uleb128 0x48
	.long	.LASF71
	.byte	0x5
	.uleb128 0x49
	.long	.LASF72
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF73
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF74
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF75
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF76
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF77
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF78
	.byte	0x5
	.uleb128 0x50
	.long	.LASF79
	.byte	0x5
	.uleb128 0x51
	.long	.LASF80
	.byte	0x5
	.uleb128 0x52
	.long	.LASF81
	.byte	0x5
	.uleb128 0x53
	.long	.LASF82
	.byte	0x5
	.uleb128 0x54
	.long	.LASF83
	.byte	0x5
	.uleb128 0x55
	.long	.LASF84
	.byte	0x5
	.uleb128 0x56
	.long	.LASF85
	.byte	0x5
	.uleb128 0x57
	.long	.LASF86
	.byte	0x5
	.uleb128 0x58
	.long	.LASF87
	.byte	0x5
	.uleb128 0x59
	.long	.LASF88
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF89
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF90
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF91
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF92
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF93
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF94
	.byte	0x5
	.uleb128 0x60
	.long	.LASF95
	.byte	0x5
	.uleb128 0x61
	.long	.LASF96
	.byte	0x5
	.uleb128 0x62
	.long	.LASF97
	.byte	0x5
	.uleb128 0x63
	.long	.LASF98
	.byte	0x5
	.uleb128 0x64
	.long	.LASF99
	.byte	0x5
	.uleb128 0x65
	.long	.LASF100
	.byte	0x5
	.uleb128 0x66
	.long	.LASF101
	.byte	0x5
	.uleb128 0x67
	.long	.LASF102
	.byte	0x5
	.uleb128 0x68
	.long	.LASF103
	.byte	0x5
	.uleb128 0x69
	.long	.LASF104
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF105
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF106
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF107
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF108
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF109
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF110
	.byte	0x5
	.uleb128 0x70
	.long	.LASF111
	.byte	0x5
	.uleb128 0x71
	.long	.LASF112
	.byte	0x5
	.uleb128 0x72
	.long	.LASF113
	.byte	0x5
	.uleb128 0x73
	.long	.LASF114
	.byte	0x5
	.uleb128 0x74
	.long	.LASF115
	.byte	0x5
	.uleb128 0x75
	.long	.LASF116
	.byte	0x5
	.uleb128 0x76
	.long	.LASF117
	.byte	0x5
	.uleb128 0x77
	.long	.LASF118
	.byte	0x5
	.uleb128 0x78
	.long	.LASF119
	.byte	0x5
	.uleb128 0x79
	.long	.LASF120
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF121
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF122
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF123
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF124
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF125
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF126
	.byte	0x5
	.uleb128 0x80
	.long	.LASF127
	.byte	0x5
	.uleb128 0x81
	.long	.LASF128
	.byte	0x5
	.uleb128 0x82
	.long	.LASF129
	.byte	0x5
	.uleb128 0x83
	.long	.LASF130
	.byte	0x5
	.uleb128 0x84
	.long	.LASF131
	.byte	0x5
	.uleb128 0x85
	.long	.LASF132
	.byte	0x5
	.uleb128 0x86
	.long	.LASF133
	.byte	0x5
	.uleb128 0x87
	.long	.LASF134
	.byte	0x5
	.uleb128 0x88
	.long	.LASF135
	.byte	0x5
	.uleb128 0x89
	.long	.LASF136
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF137
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF138
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF139
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF140
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF141
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF142
	.byte	0x5
	.uleb128 0x90
	.long	.LASF143
	.byte	0x5
	.uleb128 0x91
	.long	.LASF144
	.byte	0x5
	.uleb128 0x92
	.long	.LASF145
	.byte	0x5
	.uleb128 0x93
	.long	.LASF146
	.byte	0x5
	.uleb128 0x94
	.long	.LASF147
	.byte	0x5
	.uleb128 0x95
	.long	.LASF148
	.byte	0x5
	.uleb128 0x96
	.long	.LASF149
	.byte	0x5
	.uleb128 0x97
	.long	.LASF150
	.byte	0x5
	.uleb128 0x98
	.long	.LASF151
	.byte	0x5
	.uleb128 0x99
	.long	.LASF152
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF153
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF154
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF155
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF156
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF157
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF158
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF159
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF160
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF161
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF162
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF163
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF164
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF165
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF166
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF167
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF168
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF169
	.byte	0x5
	.uleb128 0xab
	.long	.LASF170
	.byte	0x5
	.uleb128 0xac
	.long	.LASF171
	.byte	0x5
	.uleb128 0xad
	.long	.LASF172
	.byte	0x5
	.uleb128 0xae
	.long	.LASF173
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF174
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF175
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF176
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF177
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF178
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF179
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF180
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF181
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF182
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF183
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF184
	.byte	0x5
	.uleb128 0xba
	.long	.LASF185
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF186
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF187
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF188
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF189
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF190
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF191
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF192
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF193
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF194
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF195
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF196
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF197
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF198
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF199
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF200
	.byte	0x5
	.uleb128 0xca
	.long	.LASF201
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF202
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF203
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF204
	.byte	0x5
	.uleb128 0xce
	.long	.LASF205
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF206
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF207
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF208
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF209
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF210
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF211
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF212
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF213
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF214
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF215
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF216
	.byte	0x5
	.uleb128 0xda
	.long	.LASF217
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF218
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF219
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF220
	.byte	0x5
	.uleb128 0xde
	.long	.LASF221
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF222
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF223
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF224
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF225
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF226
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF227
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF228
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF229
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF230
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF231
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF232
	.byte	0x5
	.uleb128 0xea
	.long	.LASF233
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF234
	.byte	0x5
	.uleb128 0xec
	.long	.LASF235
	.byte	0x5
	.uleb128 0xed
	.long	.LASF236
	.byte	0x5
	.uleb128 0xee
	.long	.LASF237
	.byte	0x5
	.uleb128 0xef
	.long	.LASF238
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF239
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF240
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF241
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF242
	.byte	0x5
	.uleb128 0x1
	.long	.LASF243
	.byte	0x5
	.uleb128 0x2
	.long	.LASF244
	.byte	0x5
	.uleb128 0x3
	.long	.LASF245
	.byte	0x5
	.uleb128 0x4
	.long	.LASF246
	.byte	0x5
	.uleb128 0x5
	.long	.LASF247
	.byte	0x5
	.uleb128 0x6
	.long	.LASF248
	.file 4 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x6
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF259
	.file 7 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro3
	.file 8 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro4
	.file 9 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.file 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0xa
	.file 11 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 12 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF457
	.byte	0x4
	.file 13 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro10
	.file 14 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF499
	.file 15 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 16 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro13
	.file 17 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro14
	.file 18 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x12
	.byte	0x5
	.uleb128 0x7
	.long	.LASF529
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro15
	.file 19 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x18
	.long	.LASF536
	.file 20 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x18
	.long	.LASF537
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.file 21 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF591
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF592
	.file 22 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x19
	.long	.LASF593
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro21
	.file 23 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro22
	.file 24 "/usr/include/time.h"
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF458
	.byte	0x3
	.uleb128 0x92
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.file 25 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xdb
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x16
	.long	.LASF658
	.file 26 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x1a
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 27 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF669
	.file 28 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.file 29 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0xde
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.file 30 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0x10e
	.uleb128 0x1e
	.byte	0x5
	.uleb128 0x13
	.long	.LASF692
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro34
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF707
	.file 31 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x1ec
	.uleb128 0x1f
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x5
	.uleb128 0x2e4
	.long	.LASF711
	.file 32 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ba
	.uleb128 0x20
	.byte	0x4
	.byte	0x6
	.uleb128 0x3c5
	.long	.LASF712
	.byte	0x4
	.file 33 "/usr/include/math.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x18
	.long	.LASF713
	.file 34 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x22
	.file 35 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x23
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x4
	.byte	0x4
	.file 36 "/usr/include/x86_64-linux-gnu/bits/huge_val.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x24
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF733
	.byte	0x4
	.file 37 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x25
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF734
	.byte	0x4
	.file 38 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x26
	.byte	0x5
	.uleb128 0x19
	.long	.LASF735
	.byte	0x4
	.file 39 "/usr/include/x86_64-linux-gnu/bits/inf.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x27
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF736
	.byte	0x4
	.file 40 "/usr/include/x86_64-linux-gnu/bits/nan.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x28
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF737
	.byte	0x4
	.file 41 "/usr/include/x86_64-linux-gnu/bits/mathdef.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x29
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro39
	.file 42 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
	.byte	0x3
	.uleb128 0x53
	.uleb128 0x2a
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x3
	.uleb128 0x68
	.uleb128 0x2a
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x3
	.uleb128 0x97
	.uleb128 0x2a
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.file 43 "./src/main/common/axis.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x2b
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF813
	.byte	0x4
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x3
	.byte	0x4
	.file 44 "./src/main/common/maths.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x2c
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x4
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF826
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF827
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdcpredef.h.19.bf2bf6c5fb087dfb5ef2d2297c2795de,comdat
.Ldebug_macro1:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF249
	.byte	0x5
	.uleb128 0x26
	.long	.LASF250
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF251
	.byte	0x5
	.uleb128 0x37
	.long	.LASF252
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF253
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.07dce69c3b78884144b7f7bd19483461,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF254
	.byte	0x5
	.uleb128 0x21
	.long	.LASF255
	.byte	0x5
	.uleb128 0x22
	.long	.LASF256
	.byte	0x5
	.uleb128 0x23
	.long	.LASF257
	.byte	0x5
	.uleb128 0x34
	.long	.LASF258
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8a17512e4762abcff59e629b80463c10,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF260
	.byte	0x6
	.uleb128 0x61
	.long	.LASF261
	.byte	0x6
	.uleb128 0x62
	.long	.LASF262
	.byte	0x6
	.uleb128 0x63
	.long	.LASF263
	.byte	0x6
	.uleb128 0x64
	.long	.LASF264
	.byte	0x6
	.uleb128 0x65
	.long	.LASF265
	.byte	0x6
	.uleb128 0x66
	.long	.LASF266
	.byte	0x6
	.uleb128 0x67
	.long	.LASF267
	.byte	0x6
	.uleb128 0x68
	.long	.LASF268
	.byte	0x6
	.uleb128 0x69
	.long	.LASF269
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF270
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF271
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF272
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF273
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF274
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF275
	.byte	0x6
	.uleb128 0x70
	.long	.LASF276
	.byte	0x6
	.uleb128 0x71
	.long	.LASF277
	.byte	0x6
	.uleb128 0x72
	.long	.LASF278
	.byte	0x6
	.uleb128 0x73
	.long	.LASF279
	.byte	0x6
	.uleb128 0x74
	.long	.LASF280
	.byte	0x6
	.uleb128 0x75
	.long	.LASF281
	.byte	0x6
	.uleb128 0x76
	.long	.LASF282
	.byte	0x6
	.uleb128 0x77
	.long	.LASF283
	.byte	0x6
	.uleb128 0x78
	.long	.LASF284
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF285
	.byte	0x5
	.uleb128 0x88
	.long	.LASF286
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF287
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF288
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF289
	.byte	0x5
	.uleb128 0xce
	.long	.LASF290
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF291
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF292
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF293
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF294
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF295
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF296
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF297
	.byte	0x5
	.uleb128 0x101
	.long	.LASF298
	.byte	0x5
	.uleb128 0x105
	.long	.LASF299
	.byte	0x5
	.uleb128 0x109
	.long	.LASF300
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF263
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF290
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF262
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF289
	.byte	0x5
	.uleb128 0x111
	.long	.LASF301
	.byte	0x6
	.uleb128 0x112
	.long	.LASF302
	.byte	0x5
	.uleb128 0x113
	.long	.LASF303
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF304
	.byte	0x5
	.uleb128 0x141
	.long	.LASF305
	.byte	0x5
	.uleb128 0x154
	.long	.LASF306
	.byte	0x6
	.uleb128 0x161
	.long	.LASF307
	.byte	0x5
	.uleb128 0x162
	.long	.LASF308
	.byte	0x5
	.uleb128 0x166
	.long	.LASF309
	.byte	0x5
	.uleb128 0x167
	.long	.LASF310
	.byte	0x5
	.uleb128 0x169
	.long	.LASF311
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF312
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF313
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF314
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF315
	.byte	0x5
	.uleb128 0x37
	.long	.LASF316
	.byte	0x5
	.uleb128 0x38
	.long	.LASF317
	.byte	0x5
	.uleb128 0x39
	.long	.LASF318
	.byte	0x5
	.uleb128 0x52
	.long	.LASF319
	.byte	0x5
	.uleb128 0x53
	.long	.LASF320
	.byte	0x5
	.uleb128 0x58
	.long	.LASF321
	.byte	0x5
	.uleb128 0x59
	.long	.LASF322
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF323
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF324
	.byte	0x5
	.uleb128 0x65
	.long	.LASF325
	.byte	0x5
	.uleb128 0x66
	.long	.LASF326
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF327
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF328
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF329
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF330
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF331
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF332
	.byte	0x5
	.uleb128 0x84
	.long	.LASF333
	.byte	0x5
	.uleb128 0x85
	.long	.LASF334
	.byte	0x5
	.uleb128 0x88
	.long	.LASF335
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF336
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF337
	.byte	0x5
	.uleb128 0x96
	.long	.LASF338
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF339
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF340
	.byte	0x5
	.uleb128 0xba
	.long	.LASF341
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF342
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF343
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF344
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF345
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF346
	.byte	0x5
	.uleb128 0xec
	.long	.LASF347
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF348
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF349
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF350
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF351
	.byte	0x5
	.uleb128 0x114
	.long	.LASF352
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF353
	.byte	0x5
	.uleb128 0x125
	.long	.LASF354
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF355
	.byte	0x5
	.uleb128 0x133
	.long	.LASF356
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF357
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF358
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF359
	.byte	0x5
	.uleb128 0x157
	.long	.LASF360
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF361
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF362
	.byte	0x5
	.uleb128 0x172
	.long	.LASF363
	.byte	0x5
	.uleb128 0x181
	.long	.LASF364
	.byte	0x5
	.uleb128 0x182
	.long	.LASF365
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF366
	.byte	0x5
	.uleb128 0xa
	.long	.LASF367
	.byte	0x5
	.uleb128 0xc
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF369
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF370
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF371
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF372
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF373
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF374
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF375
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF376
	.byte	0x5
	.uleb128 0xb
	.long	.LASF377
	.byte	0x5
	.uleb128 0xc
	.long	.LASF378
	.byte	0x5
	.uleb128 0xd
	.long	.LASF379
	.byte	0x5
	.uleb128 0xe
	.long	.LASF380
	.byte	0x5
	.uleb128 0xf
	.long	.LASF381
	.byte	0x5
	.uleb128 0x10
	.long	.LASF382
	.byte	0x5
	.uleb128 0x11
	.long	.LASF383
	.byte	0x5
	.uleb128 0x12
	.long	.LASF384
	.byte	0x5
	.uleb128 0x13
	.long	.LASF385
	.byte	0x5
	.uleb128 0x14
	.long	.LASF386
	.byte	0x5
	.uleb128 0x15
	.long	.LASF387
	.byte	0x5
	.uleb128 0x16
	.long	.LASF388
	.byte	0x5
	.uleb128 0x17
	.long	.LASF389
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF390
	.byte	0x5
	.uleb128 0x22
	.long	.LASF391
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF392
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF393
	.byte	0x5
	.uleb128 0x34
	.long	.LASF394
	.byte	0x5
	.uleb128 0x78
	.long	.LASF395
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF396
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF397
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF398
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF399
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF400
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF401
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF402
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF403
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF404
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF405
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF406
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF407
	.byte	0x5
	.uleb128 0xad
	.long	.LASF408
	.byte	0x5
	.uleb128 0xae
	.long	.LASF409
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF410
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF411
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF412
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF413
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF414
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF415
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF416
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF417
	.byte	0x5
	.uleb128 0xba
	.long	.LASF418
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF419
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF420
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF421
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF422
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF423
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF424
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF425
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF426
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF427
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF428
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF429
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF430
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF431
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF432
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF433
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF434
	.byte	0x5
	.uleb128 0xec
	.long	.LASF435
	.byte	0x5
	.uleb128 0xee
	.long	.LASF436
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF437
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF438
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF439
	.byte	0x5
	.uleb128 0x100
	.long	.LASF440
	.byte	0x5
	.uleb128 0x101
	.long	.LASF441
	.byte	0x5
	.uleb128 0x105
	.long	.LASF442
	.byte	0x5
	.uleb128 0x111
	.long	.LASF443
	.byte	0x5
	.uleb128 0x112
	.long	.LASF444
	.byte	0x5
	.uleb128 0x116
	.long	.LASF445
	.byte	0x5
	.uleb128 0x117
	.long	.LASF446
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF447
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF448
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF449
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF450
	.byte	0x5
	.uleb128 0x124
	.long	.LASF451
	.byte	0x5
	.uleb128 0x125
	.long	.LASF452
	.byte	0x5
	.uleb128 0x126
	.long	.LASF453
	.byte	0x5
	.uleb128 0x128
	.long	.LASF454
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF455
	.byte	0x5
	.uleb128 0x130
	.long	.LASF456
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.27.59e2586c75bdbcb991b248ad7257b993,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF458
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF459
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.e1c83cba2098ce92b68f6311de19e6b1,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF461
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF462
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF463
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF464
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF465
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF466
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF467
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF468
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF469
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF470
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF471
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF472
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF473
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF474
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF475
	.byte	0x5
	.uleb128 0xca
	.long	.LASF476
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF477
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF479
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF480
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF481
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF482
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF483
	.byte	0x5
	.uleb128 0x110
	.long	.LASF484
	.byte	0x5
	.uleb128 0x111
	.long	.LASF485
	.byte	0x5
	.uleb128 0x112
	.long	.LASF486
	.byte	0x5
	.uleb128 0x113
	.long	.LASF487
	.byte	0x5
	.uleb128 0x114
	.long	.LASF488
	.byte	0x5
	.uleb128 0x115
	.long	.LASF489
	.byte	0x5
	.uleb128 0x116
	.long	.LASF490
	.byte	0x5
	.uleb128 0x117
	.long	.LASF491
	.byte	0x5
	.uleb128 0x118
	.long	.LASF492
	.byte	0x5
	.uleb128 0x119
	.long	.LASF493
	.byte	0x6
	.uleb128 0x126
	.long	.LASF494
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF495
	.byte	0x6
	.uleb128 0x191
	.long	.LASF496
	.byte	0x5
	.uleb128 0x196
	.long	.LASF497
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.e401b8bcfee800b540b27abd7cc78de9,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF500
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF501
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF502
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF503
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF504
	.byte	0x5
	.uleb128 0x20
	.long	.LASF505
	.byte	0x5
	.uleb128 0x22
	.long	.LASF506
	.byte	0x5
	.uleb128 0x24
	.long	.LASF507
	.byte	0x5
	.uleb128 0x25
	.long	.LASF508
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF509
	.byte	0x6
	.uleb128 0x2e
	.long	.LASF510
	.byte	0x6
	.uleb128 0x2f
	.long	.LASF511
	.byte	0x6
	.uleb128 0x30
	.long	.LASF512
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF513
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF514
	.byte	0x5
	.uleb128 0x22
	.long	.LASF515
	.byte	0x5
	.uleb128 0x25
	.long	.LASF516
	.byte	0x5
	.uleb128 0x28
	.long	.LASF517
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF518
	.byte	0x5
	.uleb128 0x31
	.long	.LASF519
	.byte	0x5
	.uleb128 0x35
	.long	.LASF520
	.byte	0x5
	.uleb128 0x38
	.long	.LASF521
	.byte	0x5
	.uleb128 0x39
	.long	.LASF522
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF523
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF524
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.19.ff00c9c0f5e9f9a9719c5de76ace57b4,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF525
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF526
	.byte	0x5
	.uleb128 0x20
	.long	.LASF527
	.byte	0x5
	.uleb128 0x21
	.long	.LASF528
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.41.24cced64aef71195a51d4daa8e4f4a95,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF530
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF531
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF532
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF533
	.byte	0x5
	.uleb128 0x30
	.long	.LASF534
	.byte	0x5
	.uleb128 0x34
	.long	.LASF535
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF538
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF539
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF540
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF541
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF542
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF543
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF544
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF545
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF546
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF547
	.byte	0x5
	.uleb128 0x70
	.long	.LASF548
	.byte	0x5
	.uleb128 0x71
	.long	.LASF549
	.byte	0x5
	.uleb128 0x72
	.long	.LASF550
	.byte	0x5
	.uleb128 0x73
	.long	.LASF551
	.byte	0x5
	.uleb128 0x75
	.long	.LASF552
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF553
	.byte	0x5
	.uleb128 0x22
	.long	.LASF554
	.byte	0x5
	.uleb128 0x23
	.long	.LASF555
	.byte	0x5
	.uleb128 0x26
	.long	.LASF556
	.byte	0x5
	.uleb128 0x27
	.long	.LASF557
	.byte	0x5
	.uleb128 0x28
	.long	.LASF558
	.byte	0x5
	.uleb128 0x29
	.long	.LASF559
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF560
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF561
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF562
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF563
	.byte	0x5
	.uleb128 0x33
	.long	.LASF564
	.byte	0x5
	.uleb128 0x34
	.long	.LASF565
	.byte	0x5
	.uleb128 0x35
	.long	.LASF566
	.byte	0x5
	.uleb128 0x36
	.long	.LASF567
	.byte	0x5
	.uleb128 0x37
	.long	.LASF568
	.byte	0x5
	.uleb128 0x38
	.long	.LASF569
	.byte	0x5
	.uleb128 0x39
	.long	.LASF570
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF571
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF572
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF573
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF574
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF575
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF576
	.byte	0x5
	.uleb128 0x40
	.long	.LASF577
	.byte	0x5
	.uleb128 0x41
	.long	.LASF578
	.byte	0x5
	.uleb128 0x42
	.long	.LASF579
	.byte	0x5
	.uleb128 0x43
	.long	.LASF580
	.byte	0x5
	.uleb128 0x44
	.long	.LASF581
	.byte	0x5
	.uleb128 0x45
	.long	.LASF582
	.byte	0x5
	.uleb128 0x46
	.long	.LASF583
	.byte	0x5
	.uleb128 0x47
	.long	.LASF584
	.byte	0x5
	.uleb128 0x48
	.long	.LASF585
	.byte	0x5
	.uleb128 0x49
	.long	.LASF586
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF587
	.byte	0x5
	.uleb128 0x50
	.long	.LASF588
	.byte	0x5
	.uleb128 0x53
	.long	.LASF589
	.byte	0x5
	.uleb128 0x57
	.long	.LASF590
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.38.11ee5fdc0f6cc53a16c505b9233cecef,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF594
	.byte	0x5
	.uleb128 0x61
	.long	.LASF595
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.63.97272d7c64d5db8020003b32e9289502,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF596
	.byte	0x5
	.uleb128 0x40
	.long	.LASF597
	.byte	0x5
	.uleb128 0x41
	.long	.LASF598
	.byte	0x5
	.uleb128 0x42
	.long	.LASF599
	.byte	0x5
	.uleb128 0x44
	.long	.LASF600
	.byte	0x5
	.uleb128 0x45
	.long	.LASF601
	.byte	0x5
	.uleb128 0x46
	.long	.LASF602
	.byte	0x5
	.uleb128 0x47
	.long	.LASF603
	.byte	0x5
	.uleb128 0x49
	.long	.LASF604
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF605
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF606
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF607
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.99.408b6270fa6eb71377201a241ef15f79,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF608
	.byte	0x5
	.uleb128 0x64
	.long	.LASF609
	.byte	0x5
	.uleb128 0x65
	.long	.LASF610
	.byte	0x5
	.uleb128 0x66
	.long	.LASF611
	.byte	0x5
	.uleb128 0x67
	.long	.LASF612
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.50.84aeca2ac6f37d40e1e9b3cef757ba2d,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF613
	.byte	0x5
	.uleb128 0x48
	.long	.LASF614
	.byte	0x5
	.uleb128 0x54
	.long	.LASF615
	.byte	0x5
	.uleb128 0x55
	.long	.LASF616
	.byte	0x5
	.uleb128 0x56
	.long	.LASF617
	.byte	0x5
	.uleb128 0x57
	.long	.LASF618
	.byte	0x5
	.uleb128 0x58
	.long	.LASF619
	.byte	0x5
	.uleb128 0x59
	.long	.LASF620
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF621
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF622
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF623
	.byte	0x5
	.uleb128 0x80
	.long	.LASF624
	.byte	0x5
	.uleb128 0x85
	.long	.LASF625
	.byte	0x5
	.uleb128 0x86
	.long	.LASF626
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF627
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.305f7c1ed78a85c751613a0e1f6565b3,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF628
	.byte	0x5
	.uleb128 0x28
	.long	.LASF629
	.byte	0x5
	.uleb128 0x34
	.long	.LASF630
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF631
	.byte	0x5
	.uleb128 0x42
	.long	.LASF632
	.byte	0x5
	.uleb128 0x47
	.long	.LASF633
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF634
	.byte	0x5
	.uleb128 0x51
	.long	.LASF635
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF636
	.byte	0x5
	.uleb128 0x63
	.long	.LASF637
	.byte	0x5
	.uleb128 0x69
	.long	.LASF638
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF639
	.byte	0x5
	.uleb128 0x75
	.long	.LASF640
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF641
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF642
	.byte	0x5
	.uleb128 0x81
	.long	.LASF643
	.byte	0x5
	.uleb128 0x82
	.long	.LASF644
	.byte	0x5
	.uleb128 0x83
	.long	.LASF645
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.53.beb46e650cd406cb917b6b96b45e640a,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF646
	.byte	0x6
	.uleb128 0x42
	.long	.LASF647
	.byte	0x5
	.uleb128 0x45
	.long	.LASF648
	.byte	0x6
	.uleb128 0x52
	.long	.LASF649
	.byte	0x5
	.uleb128 0x56
	.long	.LASF650
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF651
	.byte	0x5
	.uleb128 0x62
	.long	.LASF652
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF653
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.847b6907dabda77be90a9ab7ad789e2e,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.187.fd8c81c4bff8969f5d23c3a34aa715af,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF655
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF656
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF657
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.28.eb2f3debdbcffd1442ebddaebc4fb6ff,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF659
	.byte	0x5
	.uleb128 0x21
	.long	.LASF660
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF661
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF662
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF663
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF664
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF665
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF666
	.byte	0x5
	.uleb128 0x29
	.long	.LASF643
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF667
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF647
	.byte	0x6
	.uleb128 0x52
	.long	.LASF649
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF651
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF653
	.byte	0x5
	.uleb128 0x72
	.long	.LASF668
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.25.ae5284cdff565e87a9198d819340325d,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF670
	.byte	0x6
	.uleb128 0x65
	.long	.LASF671
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.49.e9d2041e5035cc68ebd1a20f7dbc8514,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF672
	.byte	0x6
	.uleb128 0x39
	.long	.LASF673
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF674
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF675
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF676
	.byte	0x5
	.uleb128 0x49
	.long	.LASF677
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF678
	.byte	0x5
	.uleb128 0x55
	.long	.LASF679
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF680
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF681
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF682
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF683
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sysmacros.h.20.8a0c33ff175cd9b434a86c0aaa36f0a2,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF684
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF685
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF686
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF687
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.229.67b3f66bd74b06b451caec392a72a945,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF688
	.byte	0x5
	.uleb128 0xec
	.long	.LASF689
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF690
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF691
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypes.h.25.6892b1493314fcf446bbc76e7362acba,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF693
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF694
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF695
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF696
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF697
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF698
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF699
	.byte	0x5
	.uleb128 0x20
	.long	.LASF700
	.byte	0x5
	.uleb128 0x21
	.long	.LASF701
	.byte	0x5
	.uleb128 0x46
	.long	.LASF702
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF703
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF704
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF705
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF706
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF708
	.byte	0x5
	.uleb128 0x17
	.long	.LASF458
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF709
	.byte	0x5
	.uleb128 0x23
	.long	.LASF710
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libmsimddeclstubs.h.34.75644856b74ba3d815155fe5fe7ecc56,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF714
	.byte	0x5
	.uleb128 0x24
	.long	.LASF715
	.byte	0x5
	.uleb128 0x25
	.long	.LASF716
	.byte	0x5
	.uleb128 0x26
	.long	.LASF717
	.byte	0x5
	.uleb128 0x28
	.long	.LASF718
	.byte	0x5
	.uleb128 0x29
	.long	.LASF719
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF720
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF721
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF722
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF723
	.byte	0x5
	.uleb128 0x30
	.long	.LASF724
	.byte	0x5
	.uleb128 0x31
	.long	.LASF725
	.byte	0x5
	.uleb128 0x32
	.long	.LASF726
	.byte	0x5
	.uleb128 0x34
	.long	.LASF727
	.byte	0x5
	.uleb128 0x35
	.long	.LASF728
	.byte	0x5
	.uleb128 0x36
	.long	.LASF729
	.byte	0x5
	.uleb128 0x38
	.long	.LASF730
	.byte	0x5
	.uleb128 0x39
	.long	.LASF731
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF732
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.mathdef.h.23.67c0aa4a204f1f427459dfc651aba565,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF738
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF739
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF740
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.55.cf380f99c57d42476a5252f30065036a,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x37
	.long	.LASF741
	.byte	0x5
	.uleb128 0x39
	.long	.LASF742
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF743
	.byte	0x5
	.uleb128 0x41
	.long	.LASF744
	.byte	0x5
	.uleb128 0x43
	.long	.LASF745
	.byte	0x5
	.uleb128 0x46
	.long	.LASF746
	.byte	0x5
	.uleb128 0x48
	.long	.LASF747
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF748
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF749
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF750
	.byte	0x5
	.uleb128 0x50
	.long	.LASF751
	.byte	0x5
	.uleb128 0x51
	.long	.LASF752
	.byte	0x5
	.uleb128 0x52
	.long	.LASF753
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.84.742292806c6be54f49dc607928a827f7,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x54
	.long	.LASF754
	.byte	0x6
	.uleb128 0x55
	.long	.LASF755
	.byte	0x6
	.uleb128 0x56
	.long	.LASF756
	.byte	0x6
	.uleb128 0x57
	.long	.LASF757
	.byte	0x6
	.uleb128 0x58
	.long	.LASF758
	.byte	0x5
	.uleb128 0x61
	.long	.LASF759
	.byte	0x5
	.uleb128 0x63
	.long	.LASF760
	.byte	0x5
	.uleb128 0x64
	.long	.LASF761
	.byte	0x5
	.uleb128 0x65
	.long	.LASF762
	.byte	0x5
	.uleb128 0x66
	.long	.LASF763
	.byte	0x5
	.uleb128 0x67
	.long	.LASF764
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.105.59ff0f83ebf6a04e70e145cef2d1185e,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x69
	.long	.LASF754
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF755
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF756
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF757
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF758
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF765
	.byte	0x5
	.uleb128 0x91
	.long	.LASF766
	.byte	0x5
	.uleb128 0x92
	.long	.LASF767
	.byte	0x5
	.uleb128 0x93
	.long	.LASF762
	.byte	0x5
	.uleb128 0x94
	.long	.LASF763
	.byte	0x5
	.uleb128 0x95
	.long	.LASF764
	.byte	0x5
	.uleb128 0x96
	.long	.LASF768
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.152.52b052d532b5a6b0eb86a9fe4d5b0433,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x98
	.long	.LASF754
	.byte	0x6
	.uleb128 0x99
	.long	.LASF755
	.byte	0x6
	.uleb128 0x9a
	.long	.LASF756
	.byte	0x6
	.uleb128 0x9b
	.long	.LASF757
	.byte	0x6
	.uleb128 0x9c
	.long	.LASF758
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF769
	.byte	0x6
	.uleb128 0xa2
	.long	.LASF770
	.byte	0x6
	.uleb128 0xa3
	.long	.LASF771
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF772
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF773
	.byte	0x5
	.uleb128 0xda
	.long	.LASF774
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF775
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF776
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF777
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF778
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF779
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF780
	.byte	0x5
	.uleb128 0x124
	.long	.LASF781
	.byte	0x5
	.uleb128 0x132
	.long	.LASF782
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF783
	.byte	0x5
	.uleb128 0x140
	.long	.LASF784
	.byte	0x5
	.uleb128 0x146
	.long	.LASF785
	.byte	0x5
	.uleb128 0x184
	.long	.LASF786
	.byte	0x5
	.uleb128 0x187
	.long	.LASF787
	.byte	0x5
	.uleb128 0x188
	.long	.LASF788
	.byte	0x5
	.uleb128 0x189
	.long	.LASF789
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF790
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF791
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF792
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF793
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF794
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF795
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF796
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF797
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF798
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF799
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF800
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF801
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF802
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF803
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF804
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF805
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF806
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF807
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF808
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF809
	.byte	0x5
	.uleb128 0x1d1
	.long	.LASF810
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF811
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF812
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.maths.h.21.5b067f47e9a221ec30aa8aaee7f7dece,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF814
	.byte	0x5
	.uleb128 0x19
	.long	.LASF815
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF816
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF817
	.byte	0x5
	.uleb128 0x21
	.long	.LASF818
	.byte	0x5
	.uleb128 0x22
	.long	.LASF819
	.byte	0x5
	.uleb128 0x23
	.long	.LASF820
	.byte	0x5
	.uleb128 0x62
	.long	.LASF821
	.byte	0x5
	.uleb128 0x63
	.long	.LASF822
	.byte	0x5
	.uleb128 0x64
	.long	.LASF823
	.byte	0x5
	.uleb128 0x65
	.long	.LASF824
	.byte	0x5
	.uleb128 0x66
	.long	.LASF825
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF402:
	.string	"INT32_MAX (2147483647)"
.LASF757:
	.string	"__MATH_PRECNAME"
.LASF780:
	.string	"isnormal(x) __builtin_isnormal (x)"
.LASF552:
	.string	"__STD_TYPE typedef"
.LASF717:
	.string	"__DECL_SIMD_cosl "
.LASF691:
	.string	"__fsfilcnt_t_defined "
.LASF406:
	.string	"UINT32_MAX (4294967295U)"
.LASF738:
	.string	"_MATH_H_MATHDEF 1"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF867:
	.string	"averageState"
.LASF630:
	.string	"__ino_t_defined "
.LASF838:
	.string	"sizetype"
.LASF561:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF712:
	.string	"__need_malloc_and_calloc"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF17:
	.string	"__LP64__ 1"
.LASF387:
	.string	"__stub_sigreturn "
.LASF275:
	.string	"__USE_XOPEN2K8XSI"
.LASF813:
	.string	"XYZ_AXIS_COUNT 3"
.LASF602:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF369:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF650:
	.string	"__clockid_t_defined 1"
.LASF338:
	.string	"__flexarr []"
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF448:
	.string	"INT16_C(c) c"
.LASF831:
	.string	"int32_t"
.LASF307:
	.string	"__GNU_LIBRARY__"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF666:
	.string	"__sigset_t_defined "
.LASF732:
	.string	"__DECL_SIMD_powl "
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF803:
	.string	"M_2_PI 0.63661977236758134308"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF502:
	.string	"WSTOPPED 2"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF554:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF778:
	.string	"signbit(x) (sizeof (x) == sizeof (float) ? __builtin_signbitf (x) : sizeof (x) == sizeof (double) ? __builtin_signbit (x) : __builtin_signbitl (x))"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF237:
	.string	"linux 1"
.LASF256:
	.string	"true 1"
.LASF245:
	.string	"EDISON 1"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF515:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF417:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF349:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF675:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF591:
	.string	"__STD_TYPE"
.LASF672:
	.string	"__suseconds_t_defined "
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF582:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF427:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF319:
	.string	"__P(args) args"
.LASF657:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF802:
	.string	"M_1_PI 0.31830988618379067154"
.LASF708:
	.string	"_ALLOCA_H 1"
.LASF462:
	.string	"__SIZE_T__ "
.LASF810:
	.string	"islessequal(x,y) __builtin_islessequal(x, y)"
.LASF797:
	.string	"M_LN2 0.69314718055994530942"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF565:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF640:
	.string	"__daddr_t_defined "
.LASF793:
	.string	"HUGE 3.40282347e+38F"
.LASF495:
	.string	"__need_wchar_t"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF824:
	.string	"acos_approx(x) acosf(x)"
.LASF806:
	.string	"M_SQRT1_2 0.70710678118654752440"
.LASF678:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF431:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF758:
	.string	"__MATH_DECLARING_DOUBLE"
.LASF607:
	.string	"le64toh(x) (x)"
.LASF620:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF452:
	.string	"UINT16_C(c) c"
.LASF542:
	.string	"__SLONGWORD_TYPE long int"
.LASF477:
	.string	"__size_t "
.LASF396:
	.string	"INT8_MIN (-128)"
.LASF663:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF549:
	.string	"__ULONG32_TYPE unsigned int"
.LASF311:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF426:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF796:
	.string	"M_LOG10E 0.43429448190325182765"
.LASF339:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF466:
	.string	"_T_SIZE "
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF723:
	.string	"__DECL_SIMD_sincosl "
.LASF405:
	.string	"UINT16_MAX (65535)"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF862:
	.string	"applyBiQuadFilter"
.LASF532:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF422:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF278:
	.string	"__USE_FILE_OFFSET64"
.LASF705:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF801:
	.string	"M_PI_4 0.78539816339744830962"
.LASF265:
	.string	"__USE_POSIX"
.LASF440:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF496:
	.string	"NULL"
.LASF664:
	.string	"_SIGSET_H_types 1"
.LASF661:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF861:
	.string	"alpha"
.LASF443:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF379:
	.string	"__stub_fchflags "
.LASF864:
	.string	"result"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF871:
	.string	"/home/aravind/git/cleanflight"
.LASF574:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF609:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF597:
	.string	"htole16(x) (x)"
.LASF286:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF269:
	.string	"__USE_XOPEN"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF274:
	.string	"__USE_XOPEN2K8"
.LASF464:
	.string	"_SYS_SIZE_T_H "
.LASF745:
	.string	"__MATHDECL(type,function,suffix,args) __MATHDECL_1(type, function,suffix, args); __MATHDECL_1(type, __CONCAT(__,function),suffix, args)"
.LASF243:
	.string	"DEBUG 1"
.LASF693:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF579:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF309:
	.string	"__GLIBC__ 2"
.LASF830:
	.string	"long int"
.LASF599:
	.string	"le16toh(x) (x)"
.LASF596:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF736:
	.string	"INFINITY (__builtin_inff())"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF784:
	.string	"MATH_ERREXCEPT 2"
.LASF818:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF667:
	.string	"__need_timespec "
.LASF461:
	.string	"__size_t__ "
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF238:
	.string	"__unix 1"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF393:
	.string	"__int8_t_defined "
.LASF762:
	.string	"__MATH_DECLARING_DOUBLE 0"
.LASF694:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF528:
	.string	"__PDP_ENDIAN 3412"
.LASF606:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF433:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF573:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF572:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF847:
	.string	"biquad_s"
.LASF354:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF473:
	.string	"_SIZE_T_DECLARED "
.LASF321:
	.string	"__CONCAT(x,y) x ## y"
.LASF518:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF231:
	.string	"__FXSR__ 1"
.LASF817:
	.string	"RAD (M_PIf / 180.0f)"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF346:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF775:
	.string	"FP_SUBNORMAL 3"
.LASF653:
	.string	"__need_timer_t"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF612:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF726:
	.string	"__DECL_SIMD_logl "
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF446:
	.string	"WINT_MAX (4294967295u)"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF340:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF865:
	.string	"filterApplyAverage"
.LASF626:
	.string	"EXIT_SUCCESS 0"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF783:
	.string	"MATH_ERRNO 1"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF828:
	.string	"signed char"
.LASF593:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF832:
	.string	"uint8_t"
.LASF621:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF536:
	.string	"_BITS_BYTESWAP_H 1"
.LASF539:
	.string	"__U16_TYPE unsigned short int"
.LASF323:
	.string	"__ptr_t void *"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF587:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF860:
	.string	"omega"
.LASF385:
	.string	"__stub_revoke "
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF655:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF368:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF570:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF857:
	.string	"newState"
.LASF781:
	.string	"isnan(x) __builtin_isnan (x)"
.LASF629:
	.string	"__u_char_defined "
.LASF472:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF474:
	.string	"___int_size_t_h "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF289:
	.string	"__USE_ISOC99 1"
.LASF855:
	.string	"BiQuadNewLpf"
.LASF320:
	.string	"__PMT(args) args"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF418:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF727:
	.string	"__DECL_SIMD_exp "
.LASF776:
	.string	"FP_NORMAL 4"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF714:
	.string	"_BITS_LIBM_SIMD_DECL_STUBS_H 1"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF811:
	.string	"islessgreater(x,y) __builtin_islessgreater(x, y)"
.LASF637:
	.string	"__pid_t_defined "
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF397:
	.string	"INT16_MIN (-32767-1)"
.LASF737:
	.string	"NAN (__builtin_nanf (\"\"))"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF682:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF651:
	.string	"__clockid_time_t"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF363:
	.string	"__restrict_arr __restrict"
.LASF376:
	.string	"__stub___compat_bdflush "
.LASF470:
	.string	"_SIZE_T_DEFINED_ "
.LASF755:
	.string	"_Mdouble_BEGIN_NAMESPACE"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF580:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF281:
	.string	"__USE_GNU"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF413:
	.string	"INT_LEAST16_MAX (32767)"
.LASF839:
	.string	"char"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF459:
	.string	"__need_wchar_t "
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF744:
	.string	"__MATHCALL(function,suffix,args) __MATHDECL (_Mdouble_,function,suffix, args)"
.LASF458:
	.string	"__need_size_t "
.LASF779:
	.string	"isfinite(x) __builtin_isfinite (x)"
.LASF564:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF284:
	.string	"__KERNEL_STRICT_NAMES"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF772:
	.string	"FP_NAN 0"
.LASF360:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF608:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF457:
	.string	"_GCC_WRAP_STDINT_H "
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF310:
	.string	"__GLIBC_MINOR__ 23"
.LASF719:
	.string	"__DECL_SIMD_sinf "
.LASF272:
	.string	"__USE_XOPEN2K"
.LASF506:
	.string	"__WNOTHREAD 0x20000000"
.LASF460:
	.string	"__need_NULL "
.LASF273:
	.string	"__USE_XOPEN2KXSI"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF358:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF463:
	.string	"_SIZE_T "
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF703:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF298:
	.string	"__USE_POSIX199309 1"
.LASF424:
	.string	"INT_FAST8_MAX (127)"
.LASF412:
	.string	"INT_LEAST8_MAX (127)"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF843:
	.string	"double"
.LASF453:
	.string	"UINT32_C(c) c ## U"
.LASF432:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF267:
	.string	"__USE_POSIX199309"
.LASF403:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF825:
	.string	"tan_approx(x) tanf(x)"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF660:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF523:
	.string	"__W_CONTINUED 0xffff"
.LASF798:
	.string	"M_LN10 2.30258509299404568402"
.LASF442:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF381:
	.string	"__stub_getmsg "
.LASF863:
	.string	"sample"
.LASF435:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF271:
	.string	"__USE_UNIX98"
.LASF735:
	.string	"HUGE_VALL (__builtin_huge_vall())"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF808:
	.string	"isgreaterequal(x,y) __builtin_isgreaterequal(x, y)"
.LASF285:
	.string	"__KERNEL_STRICT_NAMES "
.LASF677:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF600:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF558:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF851:
	.string	"input"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF856:
	.string	"filterCutFreq"
.LASF219:
	.string	"__x86_64 1"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF643:
	.string	"__need_time_t "
.LASF697:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF756:
	.string	"_Mdouble_END_NAMESPACE"
.LASF386:
	.string	"__stub_setlogin "
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF589:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF749:
	.string	"_Mdouble_ double"
.LASF646:
	.string	"__clock_t_defined 1"
.LASF743:
	.string	"__MATHDECL_VEC(type,function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHDECL(type, function,suffix, args)"
.LASF610:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF255:
	.string	"bool _Bool"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF486:
	.string	"_BSD_WCHAR_T_ "
.LASF624:
	.string	"RAND_MAX 2147483647"
.LASF429:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF594:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF367:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF858:
	.string	"refreshRate"
.LASF659:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF759:
	.string	"_Mfloat_ float"
.LASF547:
	.string	"__UWORD_TYPE unsigned long int"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF430:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF569:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF423:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF595:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF497:
	.string	"NULL ((void *)0)"
.LASF361:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF627:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF753:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_STD"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF768:
	.string	"__MATH_DECLARE_LDOUBLE 1"
.LASF302:
	.string	"_ATFILE_SOURCE"
.LASF739:
	.string	"FP_ILOGB0 (-2147483647 - 1)"
.LASF548:
	.string	"__SLONG32_TYPE int"
.LASF671:
	.string	"__need_timeval"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF261:
	.string	"__USE_ISOC11"
.LASF854:
	.string	"pt1FilterInit"
.LASF673:
	.string	"__NFDBITS"
.LASF623:
	.string	"__lldiv_t_defined 1"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF679:
	.string	"NFDBITS __NFDBITS"
.LASF816:
	.string	"M_PIf 3.14159265358979323846f"
.LASF577:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF503:
	.string	"WEXITED 4"
.LASF436:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF571:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF676:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF383:
	.string	"__stub_lchmod "
.LASF537:
	.string	"_BITS_TYPES_H 1"
.LASF404:
	.string	"UINT8_MAX (255)"
.LASF695:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF441:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF315:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF292:
	.string	"_POSIX_SOURCE"
.LASF815:
	.string	"FAST_TRIGONOMETRY "
.LASF819:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF290:
	.string	"__USE_ISOC95 1"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF465:
	.string	"_T_SIZE_ "
.LASF543:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF692:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF329:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF226:
	.string	"__k8__ 1"
.LASF16:
	.string	"_LP64 1"
.LASF804:
	.string	"M_2_SQRTPI 1.12837916709551257390"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF316:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF512:
	.string	"P_PGID"
.LASF260:
	.string	"_FEATURES_H 1"
.LASF288:
	.string	"_DEFAULT_SOURCE 1"
.LASF617:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF445:
	.string	"WINT_MIN (0u)"
.LASF631:
	.string	"__dev_t_defined "
.LASF644:
	.string	"__need_timer_t "
.LASF314:
	.string	"__LEAF , __leaf__"
.LASF392:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF348:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF603:
	.string	"le32toh(x) (x)"
.LASF848:
	.string	"biquad_t"
.LASF575:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF785:
	.string	"math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)"
.LASF553:
	.string	"_BITS_TYPESIZES_H 1"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF604:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF642:
	.string	"__need_clock_t "
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF742:
	.string	"__MATHCALL_VEC(function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHCALL (function, suffix, args)"
.LASF380:
	.string	"__stub_fdetach "
.LASF291:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF280:
	.string	"__USE_ATFILE"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF229:
	.string	"__SSE__ 1"
.LASF769:
	.string	"__MATHDECL_1"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF588:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF662:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF658:
	.string	"_SYS_SELECT_H 1"
.LASF482:
	.string	"_T_WCHAR_ "
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF868:
	.string	"filterApplyAveragef"
.LASF371:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF266:
	.string	"__USE_POSIX2"
.LASF701:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF800:
	.string	"M_PI_2 1.57079632679489661923"
.LASF478:
	.string	"__need_size_t"
.LASF611:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF468:
	.string	"_SIZE_T_ "
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF641:
	.string	"__key_t_defined "
.LASF840:
	.string	"long long int"
.LASF507:
	.string	"__WALL 0x40000000"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF498:
	.string	"__need_NULL"
.LASF218:
	.string	"__amd64__ 1"
.LASF500:
	.string	"WNOHANG 1"
.LASF259:
	.string	"_STDINT_H 1"
.LASF715:
	.string	"__DECL_SIMD_cos "
.LASF822:
	.string	"cos_approx(x) cosf(x)"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF353:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF668:
	.string	"__timespec_defined 1"
.LASF761:
	.string	"__MATH_PRECNAME(name,r) name ##f ##r"
.LASF220:
	.string	"__x86_64__ 1"
.LASF484:
	.string	"__WCHAR_T "
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF670:
	.string	"_STRUCT_TIMEVAL 1"
.LASF720:
	.string	"__DECL_SIMD_sinl "
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF731:
	.string	"__DECL_SIMD_powf "
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF351:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF859:
	.string	"sampleRate"
.LASF531:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF313:
	.string	"__PMT"
.LASF733:
	.string	"HUGE_VAL (__builtin_huge_val())"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF751:
	.string	"__MATH_DECLARING_DOUBLE 1"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF598:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF517:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF303:
	.string	"_ATFILE_SOURCE 1"
.LASF544:
	.string	"__SQUAD_TYPE long int"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF420:
	.string	"INT_FAST8_MIN (-128)"
.LASF576:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF283:
	.string	"__USE_FORTIFY_LEVEL"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF866:
	.string	"count"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF225:
	.string	"__k8 1"
.LASF400:
	.string	"INT8_MAX (127)"
.LASF750:
	.string	"__MATH_PRECNAME(name,r) __CONCAT(name,r)"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF520:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF836:
	.string	"unsigned int"
.LASF337:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF384:
	.string	"__stub_putmsg "
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF578:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF279:
	.string	"__USE_MISC"
.LASF551:
	.string	"__U64_TYPE unsigned long int"
.LASF276:
	.string	"__USE_LARGEFILE"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF254:
	.string	"_STDBOOL_H "
.LASF493:
	.string	"_WCHAR_T_DECLARED "
.LASF786:
	.string	"X_TLOSS 1.41484755040568800000e+16"
.LASF300:
	.string	"__USE_XOPEN2K 1"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF581:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF541:
	.string	"__U32_TYPE unsigned int"
.LASF345:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF526:
	.string	"__LITTLE_ENDIAN 1234"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF767:
	.string	"__MATH_PRECNAME(name,r) name ##l ##r"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF722:
	.string	"__DECL_SIMD_sincosf "
.LASF709:
	.string	"alloca"
.LASF365:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF382:
	.string	"__stub_gtty "
.LASF480:
	.string	"__WCHAR_T__ "
.LASF415:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF408:
	.string	"INT_LEAST8_MIN (-128)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF492:
	.string	"_GCC_WCHAR_T "
.LASF555:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF355:
	.string	"__wur "
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF702:
	.string	"__have_pthread_attr_t 1"
.LASF638:
	.string	"__id_t_defined "
.LASF850:
	.string	"f_cut"
.LASF447:
	.string	"INT8_C(c) c"
.LASF634:
	.string	"__nlink_t_defined "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF669:
	.string	"__need_timeval "
.LASF308:
	.string	"__GNU_LIBRARY__ 6"
.LASF557:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF814:
	.string	"sq(x) ((x)*(x))"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF514:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF317:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF370:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF513:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF322:
	.string	"__STRING(x) #x"
.LASF833:
	.string	"unsigned char"
.LASF791:
	.string	"TLOSS 5"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF730:
	.string	"__DECL_SIMD_pow "
.LASF481:
	.string	"_WCHAR_T "
.LASF734:
	.string	"HUGE_VALF (__builtin_huge_valf())"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF687:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF821:
	.string	"sin_approx(x) sinf(x)"
.LASF327:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF766:
	.string	"_Mdouble_ _Mlong_double_"
.LASF373:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF700:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF729:
	.string	"__DECL_SIMD_expl "
.LASF318:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF375:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF489:
	.string	"_WCHAR_T_H "
.LASF394:
	.string	"__uint32_t_defined "
.LASF706:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF410:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF741:
	.string	"__SIMD_DECL(function) __CONCAT (__DECL_SIMD_, function)"
.LASF342:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF605:
	.string	"htole64(x) (x)"
.LASF763:
	.string	"_Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99"
.LASF407:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF799:
	.string	"M_PI 3.14159265358979323846"
.LASF752:
	.string	"_Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_STD"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF788:
	.string	"SING 2"
.LASF834:
	.string	"short unsigned int"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF467:
	.string	"__SIZE_T "
.LASF525:
	.string	"_ENDIAN_H 1"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF724:
	.string	"__DECL_SIMD_log "
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF585:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF263:
	.string	"__USE_ISOC95"
.LASF805:
	.string	"M_SQRT2 1.41421356237309504880"
.LASF438:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF262:
	.string	"__USE_ISOC99"
.LASF332:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF713:
	.string	"_MATH_H 1"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF270:
	.string	"__USE_XOPEN_EXTENDED"
.LASF820:
	.string	"ABS(x) ((x) > 0 ? (x) : -(x))"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF356:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF853:
	.string	"pt1FilterApply4"
.LASF325:
	.string	"__BEGIN_DECLS "
.LASF649:
	.string	"__need_time_t"
.LASF419:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF504:
	.string	"WCONTINUED 8"
.LASF616:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF299:
	.string	"__USE_POSIX199506 1"
.LASF754:
	.string	"_Mdouble_"
.LASF665:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF395:
	.string	"__intptr_t_defined "
.LASF590:
	.string	"__FD_SETSIZE 1024"
.LASF501:
	.string	"WUNTRACED 2"
.LASF566:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF563:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF584:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF841:
	.string	"long long unsigned int"
.LASF524:
	.string	"__WCOREFLAG 0x80"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF264:
	.string	"__USE_ISOCXX11"
.LASF471:
	.string	"_SIZE_T_DEFINED "
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF639:
	.string	"__ssize_t_defined "
.LASF684:
	.string	"_SYS_SYSMACROS_H 1"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF508:
	.string	"__WCLONE 0x80000000"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF782:
	.string	"isinf(x) __builtin_isinf_sign (x)"
.LASF686:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF652:
	.string	"__timer_t_defined 1"
.LASF295:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF519:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF601:
	.string	"htole32(x) (x)"
.LASF511:
	.string	"P_PID"
.LASF268:
	.string	"__USE_POSIX199506"
.LASF826:
	.string	"M_LN2_FLOAT 0.69314718055994530942f"
.LASF527:
	.string	"__BIG_ENDIAN 4321"
.LASF449:
	.string	"INT32_C(c) c"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF740:
	.string	"FP_ILOGBNAN (-2147483647 - 1)"
.LASF454:
	.string	"UINT64_C(c) c ## UL"
.LASF499:
	.string	"_STDLIB_H 1"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF366:
	.string	"__WORDSIZE 64"
.LASF747:
	.string	"__MATHDECLX(type,function,suffix,args,attrib) __MATHDECL_1(type, function,suffix, args) __attribute__ (attrib); __MATHDECL_1(type, __CONCAT(__,function),suffix, args) __attribute__ (attrib)"
.LASF681:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF488:
	.string	"_WCHAR_T_DEFINED "
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF389:
	.string	"__stub_stty "
.LASF227:
	.string	"__code_model_small__ 1"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF336:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF550:
	.string	"__S64_TYPE long int"
.LASF469:
	.string	"_BSD_SIZE_T_ "
.LASF334:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF485:
	.string	"_WCHAR_T_ "
.LASF483:
	.string	"_T_WCHAR "
.LASF330:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF540:
	.string	"__S32_TYPE int"
.LASF619:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF491:
	.string	"__INT_WCHAR_T_H "
.LASF444:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF728:
	.string	"__DECL_SIMD_expf "
.LASF390:
	.string	"_BITS_WCHAR_H 1"
.LASF241:
	.string	"__ELF__ 1"
.LASF683:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF305:
	.string	"__USE_ATFILE 1"
.LASF456:
	.string	"UINTMAX_C(c) c ## UL"
.LASF636:
	.string	"__off_t_defined "
.LASF795:
	.string	"M_LOG2E 1.4426950408889634074"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF809:
	.string	"isless(x,y) __builtin_isless(x, y)"
.LASF377:
	.string	"__stub_chflags "
.LASF674:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF476:
	.string	"_SIZET_ "
.LASF869:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF583:
	.string	"__TIMER_T_TYPE void *"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF635:
	.string	"__uid_t_defined "
.LASF685:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF716:
	.string	"__DECL_SIMD_cosf "
.LASF534:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF592:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF230:
	.string	"__SSE2__ 1"
.LASF647:
	.string	"__need_clock_t"
.LASF510:
	.string	"P_ALL"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF374:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF359:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF416:
	.string	"UINT_LEAST8_MAX (255)"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF790:
	.string	"UNDERFLOW 4"
.LASF352:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF774:
	.string	"FP_ZERO 2"
.LASF522:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF428:
	.string	"UINT_FAST8_MAX (255)"
.LASF326:
	.string	"__END_DECLS "
.LASF505:
	.string	"WNOWAIT 0x01000000"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF827:
	.string	"BIQUAD_BANDWIDTH 1.9f"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF613:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF331:
	.string	"__END_NAMESPACE_C99 "
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF829:
	.string	"short int"
.LASF312:
	.string	"_SYS_CDEFS_H 1"
.LASF615:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF362:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF689:
	.string	"__blkcnt_t_defined "
.LASF645:
	.string	"__need_clockid_t "
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF343:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF688:
	.string	"__blksize_t_defined "
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF870:
	.string	"src/main/common/filter.c"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF696:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF545:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF807:
	.string	"isgreater(x,y) __builtin_isgreater(x, y)"
.LASF628:
	.string	"_SYS_TYPES_H 1"
.LASF341:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF562:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF378:
	.string	"__stub_fattach "
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF344:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF546:
	.string	"__SWORD_TYPE long int"
.LASF347:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF792:
	.string	"PLOSS 6"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF350:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF411:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF559:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF296:
	.string	"__USE_POSIX 1"
.LASF437:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF771:
	.string	"__MATHCALL"
.LASF434:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF849:
	.string	"filter"
.LASF509:
	.string	"__ENUM_IDTYPE_T 1"
.LASF852:
	.string	"pt1FilterApply"
.LASF704:
	.string	"__PTHREAD_SPINS 0, 0"
.LASF257:
	.string	"false 0"
.LASF538:
	.string	"__S16_TYPE short int"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF648:
	.string	"__time_t_defined 1"
.LASF0:
	.string	"__STDC__ 1"
.LASF699:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF357:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF490:
	.string	"___int_wchar_t_h "
.LASF812:
	.string	"isunordered(u,v) __builtin_isunordered(u, v)"
.LASF533:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF372:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF567:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF228:
	.string	"__MMX__ 1"
.LASF399:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF622:
	.string	"__ldiv_t_defined 1"
.LASF287:
	.string	"_DEFAULT_SOURCE"
.LASF475:
	.string	"_GCC_SIZE_T "
.LASF746:
	.string	"__MATHCALLX(function,suffix,args,attrib) __MATHDECLX (_Mdouble_,function,suffix, args, attrib)"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF656:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF494:
	.string	"_BSD_WCHAR_T_"
.LASF414:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF748:
	.string	"__MATHDECL_1(type,function,suffix,args) extern type __MATH_PRECNAME(function,suffix) args __THROW"
.LASF529:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF835:
	.string	"uint32_t"
.LASF451:
	.string	"UINT8_C(c) c"
.LASF556:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF409:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF721:
	.string	"__DECL_SIMD_sincos "
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF421:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF333:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF535:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF217:
	.string	"__amd64 1"
.LASF293:
	.string	"_POSIX_SOURCE 1"
.LASF297:
	.string	"__USE_POSIX2 1"
.LASF239:
	.string	"__unix__ 1"
.LASF568:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF521:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF335:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF401:
	.string	"INT16_MAX (32767)"
.LASF654:
	.string	"__need_timespec"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF560:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF633:
	.string	"__mode_t_defined "
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF680:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF787:
	.string	"DOMAIN 1"
.LASF718:
	.string	"__DECL_SIMD_sin "
.LASF324:
	.string	"__long_double_t long double"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF711:
	.string	"__COMPAR_FN_T "
.LASF240:
	.string	"unix 1"
.LASF770:
	.string	"__MATHDECL"
.LASF842:
	.string	"float"
.LASF479:
	.string	"__wchar_t__ "
.LASF425:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF764:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_C99"
.LASF236:
	.string	"__linux__ 1"
.LASF306:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF304:
	.string	"__USE_MISC 1"
.LASF258:
	.string	"__bool_true_false_are_defined 1"
.LASF789:
	.string	"OVERFLOW 3"
.LASF586:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF391:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF328:
	.string	"__END_NAMESPACE_STD "
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF516:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF388:
	.string	"__stub_sstk "
.LASF282:
	.string	"__USE_REENTRANT"
.LASF632:
	.string	"__gid_t_defined "
.LASF777:
	.string	"fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)"
.LASF844:
	.string	"state"
.LASF625:
	.string	"EXIT_FAILURE 1"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF398:
	.string	"INT32_MIN (-2147483647-1)"
.LASF707:
	.string	"__malloc_and_calloc_defined "
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF277:
	.string	"__USE_LARGEFILE64"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF618:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF450:
	.string	"INT64_C(c) c ## L"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF530:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF235:
	.string	"__linux 1"
.LASF487:
	.string	"_WCHAR_T_DEFINED_ "
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF773:
	.string	"FP_INFINITE 1"
.LASF846:
	.string	"pt1Filter_s"
.LASF845:
	.string	"pt1Filter_t"
.LASF710:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF760:
	.string	"_Mdouble_ _Mfloat_"
.LASF614:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF439:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF823:
	.string	"atan2_approx(y,x) atan2f(y,x)"
.LASF698:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF794:
	.string	"M_E 2.7182818284590452354"
.LASF294:
	.string	"_POSIX_C_SOURCE"
.LASF301:
	.string	"__USE_XOPEN2K8 1"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF455:
	.string	"INTMAX_C(c) c ## L"
.LASF837:
	.string	"long unsigned int"
.LASF725:
	.string	"__DECL_SIMD_logf "
.LASF364:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF765:
	.string	"_Mlong_double_ long double"
.LASF690:
	.string	"__fsblkcnt_t_defined "
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
