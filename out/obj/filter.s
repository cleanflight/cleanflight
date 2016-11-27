	.file	"filter.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed filter.i -mtune=generic -march=x86-64 -g
# -std=gnu99 -ffunction-sections -fdata-sections -fverbose-asm
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
	.long	0x46f
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF41
	.byte	0xc
	.long	.LASF42
	.long	.LASF43
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x26
	.long	0x42
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.long	.LASF4
	.byte	0x2
	.byte	0x30
	.long	0x5b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF7
	.byte	0x2
	.byte	0x33
	.long	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.byte	0x8
	.long	0x37
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF15
	.uleb128 0x6
	.long	.LASF18
	.byte	0xc
	.byte	0x3
	.byte	0x14
	.long	0xe1
	.uleb128 0x7
	.long	.LASF16
	.byte	0x3
	.byte	0x15
	.long	0xa4
	.byte	0
	.uleb128 0x8
	.string	"RC"
	.byte	0x3
	.byte	0x16
	.long	0xa4
	.byte	0x4
	.uleb128 0x8
	.string	"dT"
	.byte	0x3
	.byte	0x17
	.long	0xa4
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0x18
	.long	0xb2
	.uleb128 0x6
	.long	.LASF19
	.byte	0x24
	.byte	0x3
	.byte	0x1b
	.long	0x15c
	.uleb128 0x8
	.string	"b0"
	.byte	0x3
	.byte	0x1c
	.long	0xa4
	.byte	0
	.uleb128 0x8
	.string	"b1"
	.byte	0x3
	.byte	0x1c
	.long	0xa4
	.byte	0x4
	.uleb128 0x8
	.string	"b2"
	.byte	0x3
	.byte	0x1c
	.long	0xa4
	.byte	0x8
	.uleb128 0x8
	.string	"a1"
	.byte	0x3
	.byte	0x1c
	.long	0xa4
	.byte	0xc
	.uleb128 0x8
	.string	"a2"
	.byte	0x3
	.byte	0x1c
	.long	0xa4
	.byte	0x10
	.uleb128 0x8
	.string	"x1"
	.byte	0x3
	.byte	0x1d
	.long	0xa4
	.byte	0x14
	.uleb128 0x8
	.string	"x2"
	.byte	0x3
	.byte	0x1d
	.long	0xa4
	.byte	0x18
	.uleb128 0x8
	.string	"y1"
	.byte	0x3
	.byte	0x1d
	.long	0xa4
	.byte	0x1c
	.uleb128 0x8
	.string	"y2"
	.byte	0x3
	.byte	0x1d
	.long	0xa4
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	.LASF20
	.byte	0x3
	.byte	0x1e
	.long	0xec
	.uleb128 0x9
	.long	.LASF26
	.byte	0x1
	.byte	0x20
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ae
	.uleb128 0xa
	.long	.LASF21
	.byte	0x1
	.byte	0x20
	.long	0x1ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.long	.LASF22
	.byte	0x1
	.byte	0x20
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.string	"dT"
	.byte	0x1
	.byte	0x20
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0xe1
	.uleb128 0xc
	.long	.LASF24
	.byte	0x1
	.byte	0x26
	.long	0xa4
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f2
	.uleb128 0xa
	.long	.LASF21
	.byte	0x1
	.byte	0x26
	.long	0x1ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.long	.LASF23
	.byte	0x1
	.byte	0x26
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xc
	.long	.LASF25
	.byte	0x1
	.byte	0x2c
	.long	0xa4
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x24b
	.uleb128 0xa
	.long	.LASF21
	.byte	0x1
	.byte	0x2c
	.long	0x1ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.long	.LASF23
	.byte	0x1
	.byte	0x2c
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.long	.LASF22
	.byte	0x1
	.byte	0x2c
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.string	"dT"
	.byte	0x1
	.byte	0x2c
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0xd
	.long	.LASF27
	.byte	0x1
	.byte	0x3a
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x328
	.uleb128 0xa
	.long	.LASF28
	.byte	0x1
	.byte	0x3a
	.long	0xa4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xa
	.long	.LASF29
	.byte	0x1
	.byte	0x3a
	.long	0x328
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xa
	.long	.LASF30
	.byte	0x1
	.byte	0x3a
	.long	0x69
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xe
	.long	.LASF31
	.byte	0x1
	.byte	0x3c
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xe
	.long	.LASF32
	.byte	0x1
	.byte	0x40
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xf
	.string	"sn"
	.byte	0x1
	.byte	0x40
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xf
	.string	"cs"
	.byte	0x1
	.byte	0x40
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.long	.LASF33
	.byte	0x1
	.byte	0x40
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xf
	.string	"a0"
	.byte	0x1
	.byte	0x41
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.string	"a1"
	.byte	0x1
	.byte	0x41
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.string	"a2"
	.byte	0x1
	.byte	0x41
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.string	"b0"
	.byte	0x1
	.byte	0x41
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.string	"b1"
	.byte	0x1
	.byte	0x41
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xf
	.string	"b2"
	.byte	0x1
	.byte	0x41
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x15c
	.uleb128 0xc
	.long	.LASF34
	.byte	0x1
	.byte	0x5d
	.long	0xa4
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x37a
	.uleb128 0xa
	.long	.LASF35
	.byte	0x1
	.byte	0x5d
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF16
	.byte	0x1
	.byte	0x5d
	.long	0x328
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.long	.LASF36
	.byte	0x1
	.byte	0x5f
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0x70
	.long	0x37
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x3f3
	.uleb128 0xa
	.long	.LASF23
	.byte	0x1
	.byte	0x70
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF38
	.byte	0x1
	.byte	0x70
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.long	.LASF39
	.byte	0x1
	.byte	0x70
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xf
	.string	"sum"
	.byte	0x1
	.byte	0x72
	.long	0x37
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
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	.LASF40
	.byte	0x1
	.byte	0x7c
	.long	0xa4
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x46c
	.uleb128 0xa
	.long	.LASF23
	.byte	0x1
	.byte	0x7c
	.long	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF38
	.byte	0x1
	.byte	0x7c
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.long	.LASF39
	.byte	0x1
	.byte	0x7c
	.long	0x46c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xf
	.string	"sum"
	.byte	0x1
	.byte	0x7e
	.long	0xa4
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
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0xa4
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"state"
.LASF18:
	.string	"pt1Filter_s"
.LASF38:
	.string	"count"
.LASF39:
	.string	"averageState"
.LASF2:
	.string	"long int"
.LASF17:
	.string	"pt1Filter_t"
.LASF31:
	.string	"sampleRate"
.LASF26:
	.string	"pt1FilterInit"
.LASF28:
	.string	"filterCutFreq"
.LASF25:
	.string	"pt1FilterApply4"
.LASF32:
	.string	"omega"
.LASF14:
	.string	"float"
.LASF5:
	.string	"unsigned char"
.LASF23:
	.string	"input"
.LASF9:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF30:
	.string	"refreshRate"
.LASF41:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF27:
	.string	"BiQuadNewLpf"
.LASF29:
	.string	"newState"
.LASF15:
	.string	"double"
.LASF43:
	.string	"/home/aravind/git/cleanflight"
.LASF24:
	.string	"pt1FilterApply"
.LASF8:
	.string	"unsigned int"
.LASF13:
	.string	"long long unsigned int"
.LASF4:
	.string	"uint8_t"
.LASF36:
	.string	"result"
.LASF21:
	.string	"filter"
.LASF42:
	.string	"src/main/common/filter.c"
.LASF34:
	.string	"applyBiQuadFilter"
.LASF3:
	.string	"int32_t"
.LASF10:
	.string	"sizetype"
.LASF12:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF1:
	.string	"short int"
.LASF19:
	.string	"biquad_s"
.LASF20:
	.string	"biquad_t"
.LASF40:
	.string	"filterApplyAveragef"
.LASF7:
	.string	"uint32_t"
.LASF35:
	.string	"sample"
.LASF22:
	.string	"f_cut"
.LASF0:
	.string	"signed char"
.LASF33:
	.string	"alpha"
.LASF37:
	.string	"filterApplyAverage"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
