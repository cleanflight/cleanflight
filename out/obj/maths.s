	.file	"maths.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed maths.i -mtune=generic -march=x86-64
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
	.section	.text.sinf,"ax",@progbits
	.globl	sinf
	.type	sinf, @function
sinf:
.LFB0:
	.file 1 "src/main/common/maths.c"
	.loc 1 44 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)	# x, x
	.loc 1 45 0
	movss	-20(%rbp), %xmm0	# x, tmp99
	cvttss2si	%xmm0, %eax	# tmp99, tmp100
	movl	%eax, -8(%rbp)	# tmp100, xint
	.loc 1 46 0
	cmpl	$-32, -8(%rbp)	#, xint
	jl	.L2	#,
	.loc 1 46 0 is_stmt 0 discriminator 2
	cmpl	$32, -8(%rbp)	#, xint
	jle	.L5	#,
.L2:
	.loc 1 46 0 discriminator 3
	pxor	%xmm0, %xmm0	# D.3659
	jmp	.L4	#
.L6:
	.loc 1 47 0 is_stmt 1 discriminator 2
	movss	-20(%rbp), %xmm0	# x, tmp102
	movss	.LC1(%rip), %xmm1	#, tmp103
	subss	%xmm1, %xmm0	# tmp103, tmp101
	movss	%xmm0, -20(%rbp)	# tmp101, x
.L5:
	.loc 1 47 0 is_stmt 0 discriminator 1
	movss	-20(%rbp), %xmm0	# x, tmp104
	ucomiss	.LC2(%rip), %xmm0	#, tmp104
	ja	.L6	#,
	.loc 1 48 0 is_stmt 1
	jmp	.L7	#
.L8:
	.loc 1 48 0 is_stmt 0 discriminator 2
	movss	-20(%rbp), %xmm1	# x, tmp106
	movss	.LC1(%rip), %xmm0	#, tmp107
	addss	%xmm1, %xmm0	# tmp106, tmp105
	movss	%xmm0, -20(%rbp)	# tmp105, x
.L7:
	.loc 1 48 0 discriminator 1
	movss	.LC3(%rip), %xmm0	#, tmp108
	ucomiss	-20(%rbp), %xmm0	# x, tmp108
	ja	.L8	#,
	.loc 1 49 0 is_stmt 1
	movss	-20(%rbp), %xmm0	# x, tmp109
	ucomiss	.LC4(%rip), %xmm0	#, tmp109
	jbe	.L15	#,
	.loc 1 49 0 is_stmt 0 discriminator 1
	movss	-20(%rbp), %xmm0	# x, tmp110
	movss	.LC4(%rip), %xmm1	#, tmp111
	subss	%xmm1, %xmm0	# tmp111, D.3659
	movss	.LC4(%rip), %xmm1	#, tmp113
	subss	%xmm0, %xmm1	# D.3659, tmp112
	movaps	%xmm1, %xmm0	# tmp112, tmp112
	movss	%xmm0, -20(%rbp)	# tmp112, x
	jmp	.L11	#
.L15:
	.loc 1 50 0 is_stmt 1
	movss	.LC5(%rip), %xmm0	#, tmp114
	ucomiss	-20(%rbp), %xmm0	# x, tmp114
	jbe	.L11	#,
	.loc 1 50 0 is_stmt 0 discriminator 1
	movss	-20(%rbp), %xmm1	# x, tmp115
	movss	.LC4(%rip), %xmm0	#, tmp116
	addss	%xmm1, %xmm0	# tmp115, D.3659
	movss	.LC5(%rip), %xmm1	#, tmp118
	subss	%xmm0, %xmm1	# D.3659, tmp117
	movaps	%xmm1, %xmm0	# tmp117, tmp117
	movss	%xmm0, -20(%rbp)	# tmp117, x
.L11:
	.loc 1 51 0 is_stmt 1
	movss	-20(%rbp), %xmm0	# x, tmp120
	mulss	-20(%rbp), %xmm0	# x, tmp119
	movss	%xmm0, -4(%rbp)	# tmp119, x2
	.loc 1 52 0
	movss	-20(%rbp), %xmm0	# x, tmp121
	movaps	%xmm0, %xmm1	# tmp121, D.3659
	mulss	-4(%rbp), %xmm1	# x2, D.3659
	movss	-4(%rbp), %xmm2	# x2, tmp122
	movss	.LC6(%rip), %xmm0	#, tmp123
	mulss	%xmm2, %xmm0	# tmp122, D.3659
	movss	.LC7(%rip), %xmm2	#, tmp124
	subss	%xmm2, %xmm0	# tmp124, D.3659
	mulss	-4(%rbp), %xmm0	# x2, D.3659
	movss	.LC8(%rip), %xmm2	#, tmp125
	addss	%xmm2, %xmm0	# tmp125, D.3659
	mulss	-4(%rbp), %xmm0	# x2, D.3659
	movss	.LC9(%rip), %xmm2	#, tmp126
	subss	%xmm2, %xmm0	# tmp126, D.3659
	mulss	%xmm1, %xmm0	# D.3659, D.3659
	addss	-20(%rbp), %xmm0	# x, D.3659
.L4:
	.loc 1 53 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sinf, .-sinf
	.section	.text.cosf,"ax",@progbits
	.globl	cosf
	.type	cosf, @function
cosf:
.LFB1:
	.loc 1 56 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$8, %rsp	#,
	movss	%xmm0, -4(%rbp)	# x, x
	.loc 1 57 0
	movss	-4(%rbp), %xmm1	# x, tmp90
	movss	.LC4(%rip), %xmm0	#, tmp91
	addss	%xmm1, %xmm0	# tmp90, D.3660
	call	sinf	#
	.loc 1 58 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	cosf, .-cosf
	.section	.text.atan2f,"ax",@progbits
	.globl	atan2f
	.type	atan2f, @function
atan2f:
.LFB2:
	.loc 1 65 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)	# y, y
	movss	%xmm1, -24(%rbp)	# x, x
	.loc 1 75 0
	movss	-24(%rbp), %xmm1	# x, tmp105
	movss	.LC10(%rip), %xmm0	#, tmp106
	andps	%xmm1, %xmm0	# tmp105, tmp104
	movss	%xmm0, -8(%rbp)	# tmp104, absX
	.loc 1 76 0
	movss	-20(%rbp), %xmm1	# y, tmp108
	movss	.LC10(%rip), %xmm0	#, tmp109
	andps	%xmm1, %xmm0	# tmp108, tmp107
	movss	%xmm0, -4(%rbp)	# tmp107, absY
	.loc 1 77 0
	movss	-8(%rbp), %xmm0	# absX, tmp110
	ucomiss	-4(%rbp), %xmm0	# absY, tmp110
	jbe	.L41	#,
	.loc 1 77 0 is_stmt 0 discriminator 1
	movss	-8(%rbp), %xmm0	# absX, D.3661
	jmp	.L21	#
.L41:
	.loc 1 77 0 discriminator 2
	movss	-4(%rbp), %xmm0	# absY, D.3661
.L21:
	.loc 1 77 0 discriminator 4
	movss	%xmm0, -12(%rbp)	# D.3661, res
	.loc 1 78 0 is_stmt 1 discriminator 4
	pxor	%xmm0, %xmm0	# tmp111
	ucomiss	-12(%rbp), %xmm0	# res, tmp111
	jp	.L36	#,
	pxor	%xmm0, %xmm0	# tmp112
	ucomiss	-12(%rbp), %xmm0	# res, tmp112
	je	.L42	#,
.L36:
	.loc 1 78 0 is_stmt 0 discriminator 1
	movss	-4(%rbp), %xmm0	# absY, tmp113
	ucomiss	-8(%rbp), %xmm0	# absX, tmp113
	jbe	.L43	#,
	.loc 1 78 0 discriminator 2
	movss	-8(%rbp), %xmm0	# absX, D.3661
	jmp	.L26	#
.L43:
	.loc 1 78 0 discriminator 3
	movss	-4(%rbp), %xmm0	# absY, D.3661
.L26:
	.loc 1 78 0 discriminator 5
	divss	-12(%rbp), %xmm0	# res, tmp114
	movss	%xmm0, -12(%rbp)	# tmp114, res
	jmp	.L27	#
.L42:
	.loc 1 79 0 is_stmt 1
	pxor	%xmm0, %xmm0	# tmp115
	movss	%xmm0, -12(%rbp)	# tmp115, res
.L27:
	.loc 1 80 0
	movss	-12(%rbp), %xmm1	# res, tmp116
	movss	.LC11(%rip), %xmm0	#, tmp117
	mulss	%xmm1, %xmm0	# tmp116, D.3661
	movss	.LC12(%rip), %xmm1	#, tmp118
	subss	%xmm1, %xmm0	# tmp118, D.3661
	mulss	-12(%rbp), %xmm0	# res, D.3661
	movss	.LC13(%rip), %xmm1	#, tmp119
	subss	%xmm1, %xmm0	# tmp119, D.3661
	mulss	-12(%rbp), %xmm0	# res, D.3661
	movss	.LC14(%rip), %xmm1	#, tmp120
	subss	%xmm1, %xmm0	# tmp120, D.3661
	mulss	-12(%rbp), %xmm0	# res, D.3661
	movss	.LC15(%rip), %xmm1	#, tmp121
	subss	%xmm1, %xmm0	# tmp121, D.3661
	movss	.LC16(%rip), %xmm1	#, tmp122
	xorps	%xmm1, %xmm0	# tmp122, D.3661
	movss	-12(%rbp), %xmm2	# res, tmp123
	movss	.LC17(%rip), %xmm1	#, tmp124
	mulss	%xmm2, %xmm1	# tmp123, D.3661
	movss	.LC18(%rip), %xmm2	#, tmp125
	addss	%xmm2, %xmm1	# tmp125, D.3661
	mulss	-12(%rbp), %xmm1	# res, D.3661
	movss	.LC19(%rip), %xmm2	#, tmp126
	addss	%xmm2, %xmm1	# tmp126, D.3661
	divss	%xmm1, %xmm0	# D.3661, tmp127
	movss	%xmm0, -12(%rbp)	# tmp127, res
	.loc 1 81 0
	movss	-4(%rbp), %xmm0	# absY, tmp128
	ucomiss	-8(%rbp), %xmm0	# absX, tmp128
	jbe	.L28	#,
	.loc 1 81 0 is_stmt 0 discriminator 1
	movss	.LC4(%rip), %xmm0	#, tmp130
	subss	-12(%rbp), %xmm0	# res, tmp129
	movss	%xmm0, -12(%rbp)	# tmp129, res
.L28:
	.loc 1 82 0 is_stmt 1
	pxor	%xmm0, %xmm0	# tmp131
	ucomiss	-24(%rbp), %xmm0	# x, tmp131
	jbe	.L30	#,
	.loc 1 82 0 is_stmt 0 discriminator 1
	movss	.LC2(%rip), %xmm0	#, tmp133
	subss	-12(%rbp), %xmm0	# res, tmp132
	movss	%xmm0, -12(%rbp)	# tmp132, res
.L30:
	.loc 1 83 0 is_stmt 1
	pxor	%xmm0, %xmm0	# tmp134
	ucomiss	-20(%rbp), %xmm0	# y, tmp134
	jbe	.L32	#,
	.loc 1 83 0 is_stmt 0 discriminator 1
	movss	-12(%rbp), %xmm1	# res, tmp136
	movss	.LC16(%rip), %xmm0	#, tmp137
	xorps	%xmm1, %xmm0	# tmp136, tmp135
	movss	%xmm0, -12(%rbp)	# tmp135, res
.L32:
	.loc 1 84 0 is_stmt 1
	movss	-12(%rbp), %xmm0	# res, D.3661
	.loc 1 85 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	atan2f, .-atan2f
	.section	.text.acosf,"ax",@progbits
	.globl	acosf
	.type	acosf, @function
acosf:
.LFB3:
	.loc 1 92 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movss	%xmm0, -20(%rbp)	# x, x
	.loc 1 93 0
	movss	-20(%rbp), %xmm1	# x, tmp98
	movss	.LC10(%rip), %xmm0	#, tmp99
	andps	%xmm1, %xmm0	# tmp98, tmp97
	movss	%xmm0, -8(%rbp)	# tmp97, xa
	.loc 1 94 0
	movss	.LC19(%rip), %xmm0	#, tmp100
	subss	-8(%rbp), %xmm0	# xa, D.3662
	call	sqrtf	#
	movaps	%xmm0, %xmm2	#, D.3662
	movss	-8(%rbp), %xmm1	# xa, tmp101
	movss	.LC20(%rip), %xmm0	#, tmp102
	mulss	%xmm1, %xmm0	# tmp101, D.3662
	movss	.LC21(%rip), %xmm1	#, tmp103
	addss	%xmm1, %xmm0	# tmp103, D.3662
	mulss	-8(%rbp), %xmm0	# xa, D.3662
	movss	.LC22(%rip), %xmm1	#, tmp104
	subss	%xmm1, %xmm0	# tmp104, D.3662
	mulss	-8(%rbp), %xmm0	# xa, D.3662
	movss	.LC23(%rip), %xmm1	#, tmp105
	addss	%xmm1, %xmm0	# tmp105, D.3662
	mulss	%xmm2, %xmm0	# D.3662, tmp106
	movss	%xmm0, -4(%rbp)	# tmp106, result
	.loc 1 95 0
	pxor	%xmm0, %xmm0	# tmp107
	ucomiss	-20(%rbp), %xmm0	# x, tmp107
	jbe	.L49	#,
	.loc 1 96 0
	movss	.LC2(%rip), %xmm0	#, tmp108
	subss	-4(%rbp), %xmm0	# result, D.3662
	jmp	.L47	#
.L49:
	.loc 1 98 0
	movss	-4(%rbp), %xmm0	# result, D.3662
.L47:
	.loc 1 99 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	acosf, .-acosf
	.section	.text.applyDeadband,"ax",@progbits
	.globl	applyDeadband
	.type	applyDeadband, @function
applyDeadband:
.LFB4:
	.loc 1 103 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# value, value
	movl	%esi, -8(%rbp)	# deadband, deadband
	.loc 1 104 0
	movl	-4(%rbp), %eax	# value, tmp91
	cltd
	movl	%edx, %eax	# tmp90, D.3663
	xorl	-4(%rbp), %eax	# value, D.3663
	subl	%edx, %eax	# tmp90, D.3663
	cmpl	-8(%rbp), %eax	# deadband, D.3663
	jge	.L51	#,
	.loc 1 105 0
	movl	$0, -4(%rbp)	#, value
	jmp	.L52	#
.L51:
	.loc 1 106 0
	cmpl	$0, -4(%rbp)	#, value
	jle	.L53	#,
	.loc 1 107 0
	movl	-8(%rbp), %eax	# deadband, tmp92
	subl	%eax, -4(%rbp)	# tmp92, value
	jmp	.L52	#
.L53:
	.loc 1 108 0
	cmpl	$0, -4(%rbp)	#, value
	jns	.L52	#,
	.loc 1 109 0
	movl	-8(%rbp), %eax	# deadband, tmp93
	addl	%eax, -4(%rbp)	# tmp93, value
.L52:
	.loc 1 111 0
	movl	-4(%rbp), %eax	# value, D.3664
	.loc 1 112 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	applyDeadband, .-applyDeadband
	.section	.text.constrain,"ax",@progbits
	.globl	constrain
	.type	constrain, @function
constrain:
.LFB5:
	.loc 1 115 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# amt, amt
	movl	%esi, -8(%rbp)	# low, low
	movl	%edx, -12(%rbp)	# high, high
	.loc 1 116 0
	movl	-4(%rbp), %eax	# amt, tmp89
	cmpl	-8(%rbp), %eax	# low, tmp89
	jge	.L56	#,
	.loc 1 117 0
	movl	-8(%rbp), %eax	# low, D.3665
	jmp	.L57	#
.L56:
	.loc 1 118 0
	movl	-4(%rbp), %eax	# amt, tmp90
	cmpl	-12(%rbp), %eax	# high, tmp90
	jle	.L58	#,
	.loc 1 119 0
	movl	-12(%rbp), %eax	# high, D.3665
	jmp	.L57	#
.L58:
	.loc 1 121 0
	movl	-4(%rbp), %eax	# amt, D.3665
.L57:
	.loc 1 122 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	constrain, .-constrain
	.section	.text.constrainf,"ax",@progbits
	.globl	constrainf
	.type	constrainf, @function
constrainf:
.LFB6:
	.loc 1 125 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)	# amt, amt
	movss	%xmm1, -8(%rbp)	# low, low
	movss	%xmm2, -12(%rbp)	# high, high
	.loc 1 126 0
	movss	-8(%rbp), %xmm0	# low, tmp89
	ucomiss	-4(%rbp), %xmm0	# amt, tmp89
	jbe	.L67	#,
	.loc 1 127 0
	movss	-8(%rbp), %xmm0	# low, D.3666
	jmp	.L62	#
.L67:
	.loc 1 128 0
	movss	-4(%rbp), %xmm0	# amt, tmp90
	ucomiss	-12(%rbp), %xmm0	# high, tmp90
	jbe	.L68	#,
	.loc 1 129 0
	movss	-12(%rbp), %xmm0	# high, D.3666
	jmp	.L62	#
.L68:
	.loc 1 131 0
	movss	-4(%rbp), %xmm0	# amt, D.3666
.L62:
	.loc 1 132 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	constrainf, .-constrainf
	.section	.text.devClear,"ax",@progbits
	.globl	devClear
	.type	devClear, @function
devClear:
.LFB7:
	.loc 1 135 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# dev, dev
	.loc 1 136 0
	movq	-8(%rbp), %rax	# dev, tmp87
	movl	$0, 16(%rax)	#, dev_2(D)->m_n
	.loc 1 137 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	devClear, .-devClear
	.section	.text.devPush,"ax",@progbits
	.globl	devPush
	.type	devPush, @function
devPush:
.LFB8:
	.loc 1 140 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# dev, dev
	movss	%xmm0, -12(%rbp)	# x, x
	.loc 1 141 0
	movq	-8(%rbp), %rax	# dev, tmp107
	movl	16(%rax), %eax	# dev_3(D)->m_n, D.3667
	leal	1(%rax), %edx	#, D.3667
	movq	-8(%rbp), %rax	# dev, tmp108
	movl	%edx, 16(%rax)	# D.3667, dev_3(D)->m_n
	.loc 1 142 0
	movq	-8(%rbp), %rax	# dev, tmp109
	movl	16(%rax), %eax	# dev_3(D)->m_n, D.3667
	cmpl	$1, %eax	#, D.3667
	jne	.L71	#,
	.loc 1 143 0
	movq	-8(%rbp), %rax	# dev, tmp110
	movss	-12(%rbp), %xmm0	# x, tmp111
	movss	%xmm0, 4(%rax)	# tmp111, dev_3(D)->m_newM
	movq	-8(%rbp), %rax	# dev, tmp112
	movss	4(%rax), %xmm0	# dev_3(D)->m_newM, D.3668
	movq	-8(%rbp), %rax	# dev, tmp113
	movss	%xmm0, (%rax)	# D.3668, dev_3(D)->m_oldM
	.loc 1 144 0
	movq	-8(%rbp), %rax	# dev, tmp114
	pxor	%xmm0, %xmm0	# tmp115
	movss	%xmm0, 8(%rax)	# tmp115, dev_3(D)->m_oldS
	.loc 1 151 0
	jmp	.L73	#
.L71:
	.loc 1 146 0
	movq	-8(%rbp), %rax	# dev, tmp116
	movss	(%rax), %xmm2	# dev_3(D)->m_oldM, D.3668
	movq	-8(%rbp), %rax	# dev, tmp117
	movss	(%rax), %xmm1	# dev_3(D)->m_oldM, D.3668
	movss	-12(%rbp), %xmm0	# x, tmp118
	subss	%xmm1, %xmm0	# D.3668, D.3668
	movq	-8(%rbp), %rax	# dev, tmp119
	movl	16(%rax), %eax	# dev_3(D)->m_n, D.3667
	pxor	%xmm1, %xmm1	# D.3668
	cvtsi2ss	%eax, %xmm1	# D.3667, D.3668
	divss	%xmm1, %xmm0	# D.3668, D.3668
	addss	%xmm2, %xmm0	# D.3668, D.3668
	movq	-8(%rbp), %rax	# dev, tmp120
	movss	%xmm0, 4(%rax)	# D.3668, dev_3(D)->m_newM
	.loc 1 147 0
	movq	-8(%rbp), %rax	# dev, tmp121
	movss	8(%rax), %xmm2	# dev_3(D)->m_oldS, D.3668
	movq	-8(%rbp), %rax	# dev, tmp122
	movss	(%rax), %xmm1	# dev_3(D)->m_oldM, D.3668
	movss	-12(%rbp), %xmm0	# x, tmp123
	subss	%xmm1, %xmm0	# D.3668, D.3668
	movaps	%xmm0, %xmm1	# D.3668, D.3668
	movq	-8(%rbp), %rax	# dev, tmp124
	movss	4(%rax), %xmm3	# dev_3(D)->m_newM, D.3668
	movss	-12(%rbp), %xmm0	# x, tmp125
	subss	%xmm3, %xmm0	# D.3668, D.3668
	mulss	%xmm1, %xmm0	# D.3668, D.3668
	addss	%xmm2, %xmm0	# D.3668, D.3668
	movq	-8(%rbp), %rax	# dev, tmp126
	movss	%xmm0, 12(%rax)	# D.3668, dev_3(D)->m_newS
	.loc 1 148 0
	movq	-8(%rbp), %rax	# dev, tmp127
	movss	4(%rax), %xmm0	# dev_3(D)->m_newM, D.3668
	movq	-8(%rbp), %rax	# dev, tmp128
	movss	%xmm0, (%rax)	# D.3668, dev_3(D)->m_oldM
	.loc 1 149 0
	movq	-8(%rbp), %rax	# dev, tmp129
	movss	12(%rax), %xmm0	# dev_3(D)->m_newS, D.3668
	movq	-8(%rbp), %rax	# dev, tmp130
	movss	%xmm0, 8(%rax)	# D.3668, dev_3(D)->m_oldS
.L73:
	.loc 1 151 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	devPush, .-devPush
	.section	.text.devVariance,"ax",@progbits
	.globl	devVariance
	.type	devVariance, @function
devVariance:
.LFB9:
	.loc 1 154 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# dev, dev
	.loc 1 155 0
	movq	-8(%rbp), %rax	# dev, tmp94
	movl	16(%rax), %eax	# dev_3(D)->m_n, D.3670
	cmpl	$1, %eax	#, D.3670
	jle	.L75	#,
	.loc 1 155 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# dev, tmp95
	movss	12(%rax), %xmm1	# dev_3(D)->m_newS, D.3669
	movq	-8(%rbp), %rax	# dev, tmp96
	movl	16(%rax), %eax	# dev_3(D)->m_n, D.3670
	subl	$1, %eax	#, D.3670
	pxor	%xmm0, %xmm0	# D.3669
	cvtsi2ss	%eax, %xmm0	# D.3670, D.3669
	divss	%xmm0, %xmm1	# D.3669, D.3669
	movaps	%xmm1, %xmm0	# D.3669, D.3669
	jmp	.L77	#
.L75:
	.loc 1 155 0 discriminator 2
	pxor	%xmm0, %xmm0	# D.3669
.L77:
	.loc 1 156 0 is_stmt 1 discriminator 5
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	devVariance, .-devVariance
	.section	.text.devStandardDeviation,"ax",@progbits
	.globl	devStandardDeviation
	.type	devStandardDeviation, @function
devStandardDeviation:
.LFB10:
	.loc 1 159 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# dev, dev
	.loc 1 160 0
	movq	-8(%rbp), %rax	# dev, tmp90
	movq	%rax, %rdi	# tmp90,
	call	devVariance	#
	call	sqrtf	#
	.loc 1 161 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	devStandardDeviation, .-devStandardDeviation
	.section	.text.degreesToRadians,"ax",@progbits
	.globl	degreesToRadians
	.type	degreesToRadians, @function
degreesToRadians:
.LFB11:
	.loc 1 164 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# degrees, tmp90
	movw	%ax, -4(%rbp)	# tmp90, degrees
	.loc 1 165 0
	movswl	-4(%rbp), %eax	# degrees, tmp91
	pxor	%xmm0, %xmm0	# D.3672
	cvtsi2ss	%eax, %xmm0	# tmp91, D.3672
	movss	.LC24(%rip), %xmm1	#, tmp92
	mulss	%xmm1, %xmm0	# tmp92, D.3672
	.loc 1 166 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	degreesToRadians, .-degreesToRadians
	.section	.text.scaleRange,"ax",@progbits
	.globl	scaleRange
	.type	scaleRange, @function
scaleRange:
.LFB12:
	.loc 1 169 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# x, x
	movl	%esi, -24(%rbp)	# srcMin, srcMin
	movl	%edx, -28(%rbp)	# srcMax, srcMax
	movl	%ecx, -32(%rbp)	# destMin, destMin
	movl	%r8d, -36(%rbp)	# destMax, destMax
	.loc 1 170 0
	movl	-36(%rbp), %eax	# destMax, tmp104
	movslq	%eax, %rdx	# tmp104, D.3673
	movl	-32(%rbp), %eax	# destMin, tmp105
	cltq
	movq	%rdx, %rcx	# D.3673, D.3673
	subq	%rax, %rcx	# D.3673, D.3673
	movl	-20(%rbp), %eax	# x, tmp106
	movslq	%eax, %rdx	# tmp106, D.3673
	movl	-24(%rbp), %eax	# srcMin, tmp107
	cltq
	subq	%rax, %rdx	# D.3673, D.3673
	movq	%rdx, %rax	# D.3673, D.3673
	imulq	%rcx, %rax	# D.3673, tmp108
	movq	%rax, -16(%rbp)	# tmp108, a
	.loc 1 171 0
	movl	-28(%rbp), %eax	# srcMax, tmp109
	movslq	%eax, %rdx	# tmp109, D.3673
	movl	-24(%rbp), %eax	# srcMin, tmp110
	cltq
	subq	%rax, %rdx	# D.3673, tmp111
	movq	%rdx, %rax	# tmp111, tmp111
	movq	%rax, -8(%rbp)	# tmp111, b
	.loc 1 172 0
	movq	-16(%rbp), %rax	# a, tmp114
	cqto
	idivq	-8(%rbp)	# b
	movl	%eax, %edx	# D.3673, D.3674
	movl	-36(%rbp), %eax	# destMax, tmp115
	subl	-32(%rbp), %eax	# destMin, D.3675
	subl	%eax, %edx	# D.3674, D.3674
	movl	-36(%rbp), %eax	# destMax, D.3674
	addl	%edx, %eax	# D.3674, D.3674
	.loc 1 173 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	scaleRange, .-scaleRange
	.section	.text.normalizeV,"ax",@progbits
	.globl	normalizeV
	.type	normalizeV, @function
normalizeV:
.LFB13:
	.loc 1 177 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# src, src
	movq	%rsi, -32(%rbp)	# dest, dest
	.loc 1 180 0
	movq	-24(%rbp), %rax	# src, tmp104
	movss	(%rax), %xmm1	# src_3(D)->X, D.3677
	movq	-24(%rbp), %rax	# src, tmp105
	movss	(%rax), %xmm0	# src_3(D)->X, D.3677
	mulss	%xmm0, %xmm1	# D.3677, D.3677
	movq	-24(%rbp), %rax	# src, tmp106
	movss	4(%rax), %xmm2	# src_3(D)->Y, D.3677
	movq	-24(%rbp), %rax	# src, tmp107
	movss	4(%rax), %xmm0	# src_3(D)->Y, D.3677
	mulss	%xmm2, %xmm0	# D.3677, D.3677
	addss	%xmm0, %xmm1	# D.3677, D.3677
	movq	-24(%rbp), %rax	# src, tmp108
	movss	8(%rax), %xmm2	# src_3(D)->Z, D.3677
	movq	-24(%rbp), %rax	# src, tmp109
	movss	8(%rax), %xmm0	# src_3(D)->Z, D.3677
	mulss	%xmm2, %xmm0	# D.3677, D.3677
	addss	%xmm1, %xmm0	# D.3677, D.3677
	call	sqrtf	#
	movd	%xmm0, %eax	#, tmp110
	movl	%eax, -4(%rbp)	# tmp110, length
	.loc 1 181 0
	pxor	%xmm0, %xmm0	# tmp111
	ucomiss	-4(%rbp), %xmm0	# length, tmp111
	jp	.L87	#,
	pxor	%xmm0, %xmm0	# tmp112
	ucomiss	-4(%rbp), %xmm0	# length, tmp112
	jne	.L87	#,
	.loc 1 186 0
	jmp	.L88	#
.L87:
	.loc 1 182 0
	movq	-24(%rbp), %rax	# src, tmp113
	movss	(%rax), %xmm0	# src_3(D)->X, D.3677
	divss	-4(%rbp), %xmm0	# length, D.3677
	movq	-32(%rbp), %rax	# dest, tmp114
	movss	%xmm0, (%rax)	# D.3677, dest_19(D)->X
	.loc 1 183 0
	movq	-24(%rbp), %rax	# src, tmp115
	movss	4(%rax), %xmm0	# src_3(D)->Y, D.3677
	divss	-4(%rbp), %xmm0	# length, D.3677
	movq	-32(%rbp), %rax	# dest, tmp116
	movss	%xmm0, 4(%rax)	# D.3677, dest_19(D)->Y
	.loc 1 184 0
	movq	-24(%rbp), %rax	# src, tmp117
	movss	8(%rax), %xmm0	# src_3(D)->Z, D.3677
	divss	-4(%rbp), %xmm0	# length, D.3677
	movq	-32(%rbp), %rax	# dest, tmp118
	movss	%xmm0, 8(%rax)	# D.3677, dest_19(D)->Z
.L88:
	.loc 1 186 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	normalizeV, .-normalizeV
	.section	.text.buildRotationMatrix,"ax",@progbits
	.globl	buildRotationMatrix
	.type	buildRotationMatrix, @function
buildRotationMatrix:
.LFB14:
	.loc 1 189 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$72, %rsp	#,
	movq	%rdi, -56(%rbp)	# delta, delta
	movq	%rsi, -64(%rbp)	# matrix, matrix
	.loc 1 193 0
	movq	-56(%rbp), %rax	# delta, tmp113
	movl	(%rax), %eax	# delta_2(D)->angles.roll, D.3678
	movl	%eax, -68(%rbp)	# D.3678, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	cosf	#
	movd	%xmm0, %eax	#, tmp114
	movl	%eax, -40(%rbp)	# tmp114, cosx
	.loc 1 194 0
	movq	-56(%rbp), %rax	# delta, tmp115
	movl	(%rax), %eax	# delta_2(D)->angles.roll, D.3678
	movl	%eax, -68(%rbp)	# D.3678, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	sinf	#
	movd	%xmm0, %eax	#, tmp116
	movl	%eax, -36(%rbp)	# tmp116, sinx
	.loc 1 195 0
	movq	-56(%rbp), %rax	# delta, tmp117
	movl	4(%rax), %eax	# delta_2(D)->angles.pitch, D.3678
	movl	%eax, -68(%rbp)	# D.3678, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	cosf	#
	movd	%xmm0, %eax	#, tmp118
	movl	%eax, -32(%rbp)	# tmp118, cosy
	.loc 1 196 0
	movq	-56(%rbp), %rax	# delta, tmp119
	movl	4(%rax), %eax	# delta_2(D)->angles.pitch, D.3678
	movl	%eax, -68(%rbp)	# D.3678, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	sinf	#
	movd	%xmm0, %eax	#, tmp120
	movl	%eax, -28(%rbp)	# tmp120, siny
	.loc 1 197 0
	movq	-56(%rbp), %rax	# delta, tmp121
	movl	8(%rax), %eax	# delta_2(D)->angles.yaw, D.3678
	movl	%eax, -68(%rbp)	# D.3678, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	cosf	#
	movd	%xmm0, %eax	#, tmp122
	movl	%eax, -24(%rbp)	# tmp122, cosz
	.loc 1 198 0
	movq	-56(%rbp), %rax	# delta, tmp123
	movl	8(%rax), %eax	# delta_2(D)->angles.yaw, D.3678
	movl	%eax, -68(%rbp)	# D.3678, %sfp
	movss	-68(%rbp), %xmm0	# %sfp,
	call	sinf	#
	movd	%xmm0, %eax	#, tmp124
	movl	%eax, -20(%rbp)	# tmp124, sinz
	.loc 1 200 0
	movss	-24(%rbp), %xmm0	# cosz, tmp126
	mulss	-40(%rbp), %xmm0	# cosx, tmp125
	movss	%xmm0, -16(%rbp)	# tmp125, coszcosx
	.loc 1 201 0
	movss	-20(%rbp), %xmm0	# sinz, tmp128
	mulss	-40(%rbp), %xmm0	# cosx, tmp127
	movss	%xmm0, -12(%rbp)	# tmp127, sinzcosx
	.loc 1 202 0
	movss	-36(%rbp), %xmm0	# sinx, tmp130
	mulss	-24(%rbp), %xmm0	# cosz, tmp129
	movss	%xmm0, -8(%rbp)	# tmp129, coszsinx
	.loc 1 203 0
	movss	-36(%rbp), %xmm0	# sinx, tmp132
	mulss	-20(%rbp), %xmm0	# sinz, tmp131
	movss	%xmm0, -4(%rbp)	# tmp131, sinzsinx
	.loc 1 205 0
	movss	-24(%rbp), %xmm0	# cosz, tmp133
	mulss	-32(%rbp), %xmm0	# cosy, D.3678
	movq	-64(%rbp), %rax	# matrix, tmp134
	movss	%xmm0, (%rax)	# D.3678, *matrix_20(D)
	.loc 1 206 0
	movss	-32(%rbp), %xmm1	# cosy, tmp135
	movss	.LC16(%rip), %xmm0	#, tmp136
	xorps	%xmm1, %xmm0	# tmp135, D.3678
	mulss	-20(%rbp), %xmm0	# sinz, D.3678
	movq	-64(%rbp), %rax	# matrix, tmp137
	movss	%xmm0, 4(%rax)	# D.3678, *matrix_20(D)
	.loc 1 207 0
	movq	-64(%rbp), %rax	# matrix, tmp138
	movss	-28(%rbp), %xmm0	# siny, tmp139
	movss	%xmm0, 8(%rax)	# tmp139, *matrix_20(D)
	.loc 1 208 0
	movq	-64(%rbp), %rax	# matrix, tmp140
	addq	$12, %rax	#, D.3679
	movss	-8(%rbp), %xmm0	# coszsinx, tmp141
	mulss	-28(%rbp), %xmm0	# siny, D.3678
	addss	-12(%rbp), %xmm0	# sinzcosx, D.3678
	movss	%xmm0, (%rax)	# D.3678, *_26
	.loc 1 209 0
	movq	-64(%rbp), %rax	# matrix, tmp142
	addq	$12, %rax	#, D.3679
	movss	-4(%rbp), %xmm0	# sinzsinx, tmp143
	mulss	-28(%rbp), %xmm0	# siny, D.3678
	movss	-16(%rbp), %xmm1	# coszcosx, tmp144
	subss	%xmm0, %xmm1	# D.3678, D.3678
	movaps	%xmm1, %xmm0	# D.3678, D.3678
	movss	%xmm0, 4(%rax)	# D.3678, *_30
	.loc 1 210 0
	movq	-64(%rbp), %rax	# matrix, tmp145
	addq	$12, %rax	#, D.3679
	movss	-36(%rbp), %xmm1	# sinx, tmp146
	movss	.LC16(%rip), %xmm0	#, tmp147
	xorps	%xmm1, %xmm0	# tmp146, D.3678
	mulss	-32(%rbp), %xmm0	# cosy, D.3678
	movss	%xmm0, 8(%rax)	# D.3678, *_34
	.loc 1 211 0
	movq	-64(%rbp), %rax	# matrix, tmp148
	addq	$24, %rax	#, D.3679
	movss	-16(%rbp), %xmm0	# coszcosx, tmp149
	mulss	-28(%rbp), %xmm0	# siny, D.3678
	movss	-4(%rbp), %xmm1	# sinzsinx, tmp150
	subss	%xmm0, %xmm1	# D.3678, D.3678
	movaps	%xmm1, %xmm0	# D.3678, D.3678
	movss	%xmm0, (%rax)	# D.3678, *_38
	.loc 1 212 0
	movq	-64(%rbp), %rax	# matrix, tmp151
	addq	$24, %rax	#, D.3679
	movss	-12(%rbp), %xmm0	# sinzcosx, tmp152
	mulss	-28(%rbp), %xmm0	# siny, D.3678
	addss	-8(%rbp), %xmm0	# coszsinx, D.3678
	movss	%xmm0, 4(%rax)	# D.3678, *_42
	.loc 1 213 0
	movq	-64(%rbp), %rax	# matrix, tmp153
	addq	$24, %rax	#, D.3679
	movss	-32(%rbp), %xmm0	# cosy, tmp154
	mulss	-40(%rbp), %xmm0	# cosx, D.3678
	movss	%xmm0, 8(%rax)	# D.3678, *_46
	.loc 1 214 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	buildRotationMatrix, .-buildRotationMatrix
	.section	.text.rotateV,"ax",@progbits
	.globl	rotateV
	.type	rotateV, @function
rotateV:
.LFB15:
	.loc 1 218 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movq	%rdi, -72(%rbp)	# v, v
	movq	%rsi, -80(%rbp)	# delta, delta
	.loc 1 218 0
	movq	%fs:40, %rax	#, tmp128
	movq	%rax, -8(%rbp)	# tmp128, D.3682
	xorl	%eax, %eax	# tmp128
	.loc 1 219 0
	movq	-72(%rbp), %rax	# v, tmp120
	movq	(%rax), %rdx	# *v_2(D), tmp121
	movq	%rdx, -64(%rbp)	# tmp121, v_tmp
	movl	8(%rax), %eax	# *v_2(D), tmp122
	movl	%eax, -56(%rbp)	# tmp122, v_tmp
	.loc 1 223 0
	leaq	-48(%rbp), %rdx	#, tmp123
	movq	-80(%rbp), %rax	# delta, tmp124
	movq	%rdx, %rsi	# tmp123,
	movq	%rax, %rdi	# tmp124,
	call	buildRotationMatrix	#
	.loc 1 225 0
	movss	-64(%rbp), %xmm1	# v_tmp.X, D.3681
	movss	-48(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm0, %xmm1	# D.3681, D.3681
	movss	-60(%rbp), %xmm2	# v_tmp.Y, D.3681
	movss	-36(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm2, %xmm0	# D.3681, D.3681
	addss	%xmm0, %xmm1	# D.3681, D.3681
	movss	-56(%rbp), %xmm2	# v_tmp.Z, D.3681
	movss	-24(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm2, %xmm0	# D.3681, D.3681
	addss	%xmm1, %xmm0	# D.3681, D.3681
	movq	-72(%rbp), %rax	# v, tmp125
	movss	%xmm0, (%rax)	# D.3681, v_2(D)->X
	.loc 1 226 0
	movss	-64(%rbp), %xmm1	# v_tmp.X, D.3681
	movss	-44(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm0, %xmm1	# D.3681, D.3681
	movss	-60(%rbp), %xmm2	# v_tmp.Y, D.3681
	movss	-32(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm2, %xmm0	# D.3681, D.3681
	addss	%xmm0, %xmm1	# D.3681, D.3681
	movss	-56(%rbp), %xmm2	# v_tmp.Z, D.3681
	movss	-20(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm2, %xmm0	# D.3681, D.3681
	addss	%xmm1, %xmm0	# D.3681, D.3681
	movq	-72(%rbp), %rax	# v, tmp126
	movss	%xmm0, 4(%rax)	# D.3681, v_2(D)->Y
	.loc 1 227 0
	movss	-64(%rbp), %xmm1	# v_tmp.X, D.3681
	movss	-40(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm0, %xmm1	# D.3681, D.3681
	movss	-60(%rbp), %xmm2	# v_tmp.Y, D.3681
	movss	-28(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm2, %xmm0	# D.3681, D.3681
	addss	%xmm0, %xmm1	# D.3681, D.3681
	movss	-56(%rbp), %xmm2	# v_tmp.Z, D.3681
	movss	-16(%rbp), %xmm0	# matrix, D.3681
	mulss	%xmm2, %xmm0	# D.3681, D.3681
	addss	%xmm1, %xmm0	# D.3681, D.3681
	movq	-72(%rbp), %rax	# v, tmp127
	movss	%xmm0, 8(%rax)	# D.3681, v_2(D)->Z
	.loc 1 228 0
	nop
	movq	-8(%rbp), %rax	# D.3682, tmp129
	xorq	%fs:40, %rax	#, tmp129
	je	.L91	#,
	call	__stack_chk_fail	#
.L91:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	rotateV, .-rotateV
	.section	.text.quickMedianFilter3,"ax",@progbits
	.globl	quickMedianFilter3
	.type	quickMedianFilter3, @function
quickMedianFilter3:
.LFB16:
	.loc 1 238 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	movq	%rdi, -56(%rbp)	# v, v
	.loc 1 238 0
	movq	%fs:40, %rax	#, tmp113
	movq	%rax, -8(%rbp)	# tmp113, D.3689
	xorl	%eax, %eax	# tmp113
.LBB2:
	.loc 1 240 0
	movl	$0, -48(%rbp)	#, i
	jmp	.L93	#
.L94:
	.loc 1 240 0 is_stmt 0 discriminator 3
	movl	-48(%rbp), %eax	# i, tmp102
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3685
	movq	-56(%rbp), %rax	# v, tmp103
	addq	%rdx, %rax	# D.3685, D.3686
	movl	(%rax), %edx	# *_11, D.3687
	movl	-48(%rbp), %eax	# i, tmp105
	cltq
	movl	%edx, -32(%rbp,%rax,4)	# D.3687, p
	addl	$1, -48(%rbp)	#, i
.L93:
	.loc 1 240 0 discriminator 1
	cmpl	$2, -48(%rbp)	#, i
	jle	.L94	#,
.LBE2:
	.loc 1 242 0 is_stmt 1
	movl	-32(%rbp), %edx	# p, D.3687
	movl	-28(%rbp), %eax	# p, D.3687
	cmpl	%eax, %edx	# D.3687, D.3687
	jle	.L95	#,
.LBB3:
	.loc 1 242 0 is_stmt 0 discriminator 1
	movl	-32(%rbp), %eax	# p, tmp106
	movl	%eax, -44(%rbp)	# tmp106, temp
	movl	-28(%rbp), %eax	# p, D.3687
	movl	%eax, -32(%rbp)	# D.3687, p
	movl	-44(%rbp), %eax	# temp, tmp107
	movl	%eax, -28(%rbp)	# tmp107, p
.L95:
.LBE3:
	.loc 1 242 0 discriminator 3
	movl	-28(%rbp), %edx	# p, D.3687
	movl	-24(%rbp), %eax	# p, D.3687
	cmpl	%eax, %edx	# D.3687, D.3687
	jle	.L96	#,
.LBB4:
	.loc 1 242 0 discriminator 4
	movl	-28(%rbp), %eax	# p, tmp108
	movl	%eax, -40(%rbp)	# tmp108, temp
	movl	-24(%rbp), %eax	# p, D.3687
	movl	%eax, -28(%rbp)	# D.3687, p
	movl	-40(%rbp), %eax	# temp, tmp109
	movl	%eax, -24(%rbp)	# tmp109, p
.L96:
.LBE4:
	.loc 1 242 0 discriminator 6
	movl	-32(%rbp), %edx	# p, D.3687
	movl	-28(%rbp), %eax	# p, D.3687
	cmpl	%eax, %edx	# D.3687, D.3687
	jle	.L97	#,
.LBB5:
	.loc 1 242 0 discriminator 7
	movl	-32(%rbp), %eax	# p, tmp110
	movl	%eax, -36(%rbp)	# tmp110, temp
	movl	-28(%rbp), %eax	# p, D.3687
	movl	%eax, -32(%rbp)	# D.3687, p
	movl	-36(%rbp), %eax	# temp, tmp111
	movl	%eax, -28(%rbp)	# tmp111, p
.L97:
.LBE5:
	.loc 1 243 0 is_stmt 1
	movl	-28(%rbp), %eax	# p, D.3688
	.loc 1 244 0
	movq	-8(%rbp), %rcx	# D.3689, tmp114
	xorq	%fs:40, %rcx	#, tmp114
	je	.L99	#,
	call	__stack_chk_fail	#
.L99:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	quickMedianFilter3, .-quickMedianFilter3
	.section	.text.quickMedianFilter5,"ax",@progbits
	.globl	quickMedianFilter5
	.type	quickMedianFilter5, @function
quickMedianFilter5:
.LFB17:
	.loc 1 247 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movq	%rdi, -72(%rbp)	# v, v
	.loc 1 247 0
	movq	%fs:40, %rax	#, tmp133
	movq	%rax, -8(%rbp)	# tmp133, D.3694
	xorl	%eax, %eax	# tmp133
.LBB6:
	.loc 1 249 0
	movl	$0, -64(%rbp)	#, i
	jmp	.L101	#
.L102:
	.loc 1 249 0 is_stmt 0 discriminator 3
	movl	-64(%rbp), %eax	# i, tmp114
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3690
	movq	-72(%rbp), %rax	# v, tmp115
	addq	%rdx, %rax	# D.3690, D.3691
	movl	(%rax), %edx	# *_15, D.3692
	movl	-64(%rbp), %eax	# i, tmp117
	cltq
	movl	%edx, -32(%rbp,%rax,4)	# D.3692, p
	addl	$1, -64(%rbp)	#, i
.L101:
	.loc 1 249 0 discriminator 1
	cmpl	$4, -64(%rbp)	#, i
	jle	.L102	#,
.LBE6:
	.loc 1 251 0 is_stmt 1
	movl	-32(%rbp), %edx	# p, D.3692
	movl	-28(%rbp), %eax	# p, D.3692
	cmpl	%eax, %edx	# D.3692, D.3692
	jle	.L103	#,
.LBB7:
	.loc 1 251 0 is_stmt 0 discriminator 1
	movl	-32(%rbp), %eax	# p, tmp118
	movl	%eax, -60(%rbp)	# tmp118, temp
	movl	-28(%rbp), %eax	# p, D.3692
	movl	%eax, -32(%rbp)	# D.3692, p
	movl	-60(%rbp), %eax	# temp, tmp119
	movl	%eax, -28(%rbp)	# tmp119, p
.L103:
.LBE7:
	.loc 1 251 0 discriminator 3
	movl	-20(%rbp), %edx	# p, D.3692
	movl	-16(%rbp), %eax	# p, D.3692
	cmpl	%eax, %edx	# D.3692, D.3692
	jle	.L104	#,
.LBB8:
	.loc 1 251 0 discriminator 4
	movl	-20(%rbp), %eax	# p, tmp120
	movl	%eax, -56(%rbp)	# tmp120, temp
	movl	-16(%rbp), %eax	# p, D.3692
	movl	%eax, -20(%rbp)	# D.3692, p
	movl	-56(%rbp), %eax	# temp, tmp121
	movl	%eax, -16(%rbp)	# tmp121, p
.L104:
.LBE8:
	.loc 1 251 0 discriminator 6
	movl	-32(%rbp), %edx	# p, D.3692
	movl	-20(%rbp), %eax	# p, D.3692
	cmpl	%eax, %edx	# D.3692, D.3692
	jle	.L105	#,
.LBB9:
	.loc 1 251 0 discriminator 7
	movl	-32(%rbp), %eax	# p, tmp122
	movl	%eax, -52(%rbp)	# tmp122, temp
	movl	-20(%rbp), %eax	# p, D.3692
	movl	%eax, -32(%rbp)	# D.3692, p
	movl	-52(%rbp), %eax	# temp, tmp123
	movl	%eax, -20(%rbp)	# tmp123, p
.L105:
.LBE9:
	.loc 1 252 0 is_stmt 1
	movl	-28(%rbp), %edx	# p, D.3692
	movl	-16(%rbp), %eax	# p, D.3692
	cmpl	%eax, %edx	# D.3692, D.3692
	jle	.L106	#,
.LBB10:
	.loc 1 252 0 is_stmt 0 discriminator 1
	movl	-28(%rbp), %eax	# p, tmp124
	movl	%eax, -48(%rbp)	# tmp124, temp
	movl	-16(%rbp), %eax	# p, D.3692
	movl	%eax, -28(%rbp)	# D.3692, p
	movl	-48(%rbp), %eax	# temp, tmp125
	movl	%eax, -16(%rbp)	# tmp125, p
.L106:
.LBE10:
	.loc 1 252 0 discriminator 3
	movl	-28(%rbp), %edx	# p, D.3692
	movl	-24(%rbp), %eax	# p, D.3692
	cmpl	%eax, %edx	# D.3692, D.3692
	jle	.L107	#,
.LBB11:
	.loc 1 252 0 discriminator 4
	movl	-28(%rbp), %eax	# p, tmp126
	movl	%eax, -44(%rbp)	# tmp126, temp
	movl	-24(%rbp), %eax	# p, D.3692
	movl	%eax, -28(%rbp)	# D.3692, p
	movl	-44(%rbp), %eax	# temp, tmp127
	movl	%eax, -24(%rbp)	# tmp127, p
.L107:
.LBE11:
	.loc 1 252 0 discriminator 6
	movl	-24(%rbp), %edx	# p, D.3692
	movl	-20(%rbp), %eax	# p, D.3692
	cmpl	%eax, %edx	# D.3692, D.3692
	jle	.L108	#,
.LBB12:
	.loc 1 252 0 discriminator 7
	movl	-24(%rbp), %eax	# p, tmp128
	movl	%eax, -40(%rbp)	# tmp128, temp
	movl	-20(%rbp), %eax	# p, D.3692
	movl	%eax, -24(%rbp)	# D.3692, p
	movl	-40(%rbp), %eax	# temp, tmp129
	movl	%eax, -20(%rbp)	# tmp129, p
.L108:
.LBE12:
	.loc 1 253 0 is_stmt 1
	movl	-28(%rbp), %edx	# p, D.3692
	movl	-24(%rbp), %eax	# p, D.3692
	cmpl	%eax, %edx	# D.3692, D.3692
	jle	.L109	#,
.LBB13:
	.loc 1 253 0 is_stmt 0 discriminator 1
	movl	-28(%rbp), %eax	# p, tmp130
	movl	%eax, -36(%rbp)	# tmp130, temp
	movl	-24(%rbp), %eax	# p, D.3692
	movl	%eax, -28(%rbp)	# D.3692, p
	movl	-36(%rbp), %eax	# temp, tmp131
	movl	%eax, -24(%rbp)	# tmp131, p
.L109:
.LBE13:
	.loc 1 254 0 is_stmt 1
	movl	-24(%rbp), %eax	# p, D.3693
	.loc 1 255 0
	movq	-8(%rbp), %rcx	# D.3694, tmp134
	xorq	%fs:40, %rcx	#, tmp134
	je	.L111	#,
	call	__stack_chk_fail	#
.L111:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	quickMedianFilter5, .-quickMedianFilter5
	.section	.text.quickMedianFilter7,"ax",@progbits
	.globl	quickMedianFilter7
	.type	quickMedianFilter7, @function
quickMedianFilter7:
.LFB18:
	.loc 1 258 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	#,
	movq	%rdi, -120(%rbp)	# v, v
	.loc 1 258 0
	movq	%fs:40, %rax	#, tmp163
	movq	%rax, -8(%rbp)	# tmp163, D.3699
	xorl	%eax, %eax	# tmp163
.LBB14:
	.loc 1 260 0
	movl	$0, -104(%rbp)	#, i
	jmp	.L113	#
.L114:
	.loc 1 260 0 is_stmt 0 discriminator 3
	movl	-104(%rbp), %eax	# i, tmp132
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3695
	movq	-120(%rbp), %rax	# v, tmp133
	addq	%rdx, %rax	# D.3695, D.3696
	movl	(%rax), %edx	# *_21, D.3697
	movl	-104(%rbp), %eax	# i, tmp135
	cltq
	movl	%edx, -48(%rbp,%rax,4)	# D.3697, p
	addl	$1, -104(%rbp)	#, i
.L113:
	.loc 1 260 0 discriminator 1
	cmpl	$6, -104(%rbp)	#, i
	jle	.L114	#,
.LBE14:
	.loc 1 262 0 is_stmt 1
	movl	-48(%rbp), %edx	# p, D.3697
	movl	-28(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L115	#,
.LBB15:
	.loc 1 262 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax	# p, tmp136
	movl	%eax, -100(%rbp)	# tmp136, temp
	movl	-28(%rbp), %eax	# p, D.3697
	movl	%eax, -48(%rbp)	# D.3697, p
	movl	-100(%rbp), %eax	# temp, tmp137
	movl	%eax, -28(%rbp)	# tmp137, p
.L115:
.LBE15:
	.loc 1 262 0 discriminator 3
	movl	-48(%rbp), %edx	# p, D.3697
	movl	-36(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L116	#,
.LBB16:
	.loc 1 262 0 discriminator 4
	movl	-48(%rbp), %eax	# p, tmp138
	movl	%eax, -96(%rbp)	# tmp138, temp
	movl	-36(%rbp), %eax	# p, D.3697
	movl	%eax, -48(%rbp)	# D.3697, p
	movl	-96(%rbp), %eax	# temp, tmp139
	movl	%eax, -36(%rbp)	# tmp139, p
.L116:
.LBE16:
	.loc 1 262 0 discriminator 6
	movl	-44(%rbp), %edx	# p, D.3697
	movl	-24(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L117	#,
.LBB17:
	.loc 1 262 0 discriminator 7
	movl	-44(%rbp), %eax	# p, tmp140
	movl	%eax, -92(%rbp)	# tmp140, temp
	movl	-24(%rbp), %eax	# p, D.3697
	movl	%eax, -44(%rbp)	# D.3697, p
	movl	-92(%rbp), %eax	# temp, tmp141
	movl	%eax, -24(%rbp)	# tmp141, p
.L117:
.LBE17:
	.loc 1 263 0 is_stmt 1
	movl	-40(%rbp), %edx	# p, D.3697
	movl	-32(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L118	#,
.LBB18:
	.loc 1 263 0 is_stmt 0 discriminator 1
	movl	-40(%rbp), %eax	# p, tmp142
	movl	%eax, -88(%rbp)	# tmp142, temp
	movl	-32(%rbp), %eax	# p, D.3697
	movl	%eax, -40(%rbp)	# D.3697, p
	movl	-88(%rbp), %eax	# temp, tmp143
	movl	%eax, -32(%rbp)	# tmp143, p
.L118:
.LBE18:
	.loc 1 263 0 discriminator 3
	movl	-48(%rbp), %edx	# p, D.3697
	movl	-44(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L119	#,
.LBB19:
	.loc 1 263 0 discriminator 4
	movl	-48(%rbp), %eax	# p, tmp144
	movl	%eax, -84(%rbp)	# tmp144, temp
	movl	-44(%rbp), %eax	# p, D.3697
	movl	%eax, -48(%rbp)	# D.3697, p
	movl	-84(%rbp), %eax	# temp, tmp145
	movl	%eax, -44(%rbp)	# tmp145, p
.L119:
.LBE19:
	.loc 1 263 0 discriminator 6
	movl	-36(%rbp), %edx	# p, D.3697
	movl	-28(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L120	#,
.LBB20:
	.loc 1 263 0 discriminator 7
	movl	-36(%rbp), %eax	# p, tmp146
	movl	%eax, -80(%rbp)	# tmp146, temp
	movl	-28(%rbp), %eax	# p, D.3697
	movl	%eax, -36(%rbp)	# D.3697, p
	movl	-80(%rbp), %eax	# temp, tmp147
	movl	%eax, -28(%rbp)	# tmp147, p
.L120:
.LBE20:
	.loc 1 264 0 is_stmt 1
	movl	-40(%rbp), %edx	# p, D.3697
	movl	-24(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L121	#,
.LBB21:
	.loc 1 264 0 is_stmt 0 discriminator 1
	movl	-40(%rbp), %eax	# p, tmp148
	movl	%eax, -76(%rbp)	# tmp148, temp
	movl	-24(%rbp), %eax	# p, D.3697
	movl	%eax, -40(%rbp)	# D.3697, p
	movl	-76(%rbp), %eax	# temp, tmp149
	movl	%eax, -24(%rbp)	# tmp149, p
.L121:
.LBE21:
	.loc 1 264 0 discriminator 3
	movl	-40(%rbp), %edx	# p, D.3697
	movl	-36(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L122	#,
.LBB22:
	.loc 1 264 0 discriminator 4
	movl	-40(%rbp), %eax	# p, tmp150
	movl	%eax, -72(%rbp)	# tmp150, temp
	movl	-36(%rbp), %eax	# p, D.3697
	movl	%eax, -40(%rbp)	# D.3697, p
	movl	-72(%rbp), %eax	# temp, tmp151
	movl	%eax, -36(%rbp)	# tmp151, p
.L122:
.LBE22:
	.loc 1 264 0 discriminator 6
	movl	-36(%rbp), %edx	# p, D.3697
	movl	-24(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L123	#,
.LBB23:
	.loc 1 264 0 discriminator 7
	movl	-36(%rbp), %eax	# p, tmp152
	movl	%eax, -68(%rbp)	# tmp152, temp
	movl	-24(%rbp), %eax	# p, D.3697
	movl	%eax, -36(%rbp)	# D.3697, p
	movl	-68(%rbp), %eax	# temp, tmp153
	movl	%eax, -24(%rbp)	# tmp153, p
.L123:
.LBE23:
	.loc 1 265 0 is_stmt 1
	movl	-32(%rbp), %edx	# p, D.3697
	movl	-28(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L124	#,
.LBB24:
	.loc 1 265 0 is_stmt 0 discriminator 1
	movl	-32(%rbp), %eax	# p, tmp154
	movl	%eax, -64(%rbp)	# tmp154, temp
	movl	-28(%rbp), %eax	# p, D.3697
	movl	%eax, -32(%rbp)	# D.3697, p
	movl	-64(%rbp), %eax	# temp, tmp155
	movl	%eax, -28(%rbp)	# tmp155, p
.L124:
.LBE24:
	.loc 1 265 0 discriminator 3
	movl	-44(%rbp), %edx	# p, D.3697
	movl	-32(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L125	#,
.LBB25:
	.loc 1 265 0 discriminator 4
	movl	-44(%rbp), %eax	# p, tmp156
	movl	%eax, -60(%rbp)	# tmp156, temp
	movl	-32(%rbp), %eax	# p, D.3697
	movl	%eax, -44(%rbp)	# D.3697, p
	movl	-60(%rbp), %eax	# temp, tmp157
	movl	%eax, -32(%rbp)	# tmp157, p
.L125:
.LBE25:
	.loc 1 265 0 discriminator 6
	movl	-44(%rbp), %edx	# p, D.3697
	movl	-36(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L126	#,
.LBB26:
	.loc 1 265 0 discriminator 7
	movl	-44(%rbp), %eax	# p, tmp158
	movl	%eax, -56(%rbp)	# tmp158, temp
	movl	-36(%rbp), %eax	# p, D.3697
	movl	%eax, -44(%rbp)	# D.3697, p
	movl	-56(%rbp), %eax	# temp, tmp159
	movl	%eax, -36(%rbp)	# tmp159, p
.L126:
.LBE26:
	.loc 1 266 0 is_stmt 1
	movl	-36(%rbp), %edx	# p, D.3697
	movl	-32(%rbp), %eax	# p, D.3697
	cmpl	%eax, %edx	# D.3697, D.3697
	jle	.L127	#,
.LBB27:
	.loc 1 266 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %eax	# p, tmp160
	movl	%eax, -52(%rbp)	# tmp160, temp
	movl	-32(%rbp), %eax	# p, D.3697
	movl	%eax, -36(%rbp)	# D.3697, p
	movl	-52(%rbp), %eax	# temp, tmp161
	movl	%eax, -32(%rbp)	# tmp161, p
.L127:
.LBE27:
	.loc 1 267 0 is_stmt 1
	movl	-36(%rbp), %eax	# p, D.3698
	.loc 1 268 0
	movq	-8(%rbp), %rcx	# D.3699, tmp164
	xorq	%fs:40, %rcx	#, tmp164
	je	.L129	#,
	call	__stack_chk_fail	#
.L129:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	quickMedianFilter7, .-quickMedianFilter7
	.section	.text.quickMedianFilter9,"ax",@progbits
	.globl	quickMedianFilter9
	.type	quickMedianFilter9, @function
quickMedianFilter9:
.LFB19:
	.loc 1 271 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$144, %rsp	#,
	movq	%rdi, -136(%rbp)	# v, v
	.loc 1 271 0
	movq	%fs:40, %rax	#, tmp193
	movq	%rax, -8(%rbp)	# tmp193, D.3704
	xorl	%eax, %eax	# tmp193
.LBB28:
	.loc 1 273 0
	movl	$0, -128(%rbp)	#, i
	jmp	.L131	#
.L132:
	.loc 1 273 0 is_stmt 0 discriminator 3
	movl	-128(%rbp), %eax	# i, tmp150
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3700
	movq	-136(%rbp), %rax	# v, tmp151
	addq	%rdx, %rax	# D.3700, D.3701
	movl	(%rax), %edx	# *_27, D.3702
	movl	-128(%rbp), %eax	# i, tmp153
	cltq
	movl	%edx, -48(%rbp,%rax,4)	# D.3702, p
	addl	$1, -128(%rbp)	#, i
.L131:
	.loc 1 273 0 discriminator 1
	cmpl	$8, -128(%rbp)	#, i
	jle	.L132	#,
.LBE28:
	.loc 1 275 0 is_stmt 1
	movl	-44(%rbp), %edx	# p, D.3702
	movl	-40(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L133	#,
.LBB29:
	.loc 1 275 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax	# p, tmp154
	movl	%eax, -124(%rbp)	# tmp154, temp
	movl	-40(%rbp), %eax	# p, D.3702
	movl	%eax, -44(%rbp)	# D.3702, p
	movl	-124(%rbp), %eax	# temp, tmp155
	movl	%eax, -40(%rbp)	# tmp155, p
.L133:
.LBE29:
	.loc 1 275 0 discriminator 3
	movl	-32(%rbp), %edx	# p, D.3702
	movl	-28(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L134	#,
.LBB30:
	.loc 1 275 0 discriminator 4
	movl	-32(%rbp), %eax	# p, tmp156
	movl	%eax, -120(%rbp)	# tmp156, temp
	movl	-28(%rbp), %eax	# p, D.3702
	movl	%eax, -32(%rbp)	# D.3702, p
	movl	-120(%rbp), %eax	# temp, tmp157
	movl	%eax, -28(%rbp)	# tmp157, p
.L134:
.LBE30:
	.loc 1 275 0 discriminator 6
	movl	-20(%rbp), %edx	# p, D.3702
	movl	-16(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L135	#,
.LBB31:
	.loc 1 275 0 discriminator 7
	movl	-20(%rbp), %eax	# p, tmp158
	movl	%eax, -116(%rbp)	# tmp158, temp
	movl	-16(%rbp), %eax	# p, D.3702
	movl	%eax, -20(%rbp)	# D.3702, p
	movl	-116(%rbp), %eax	# temp, tmp159
	movl	%eax, -16(%rbp)	# tmp159, p
.L135:
.LBE31:
	.loc 1 276 0 is_stmt 1
	movl	-48(%rbp), %edx	# p, D.3702
	movl	-44(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L136	#,
.LBB32:
	.loc 1 276 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax	# p, tmp160
	movl	%eax, -112(%rbp)	# tmp160, temp
	movl	-44(%rbp), %eax	# p, D.3702
	movl	%eax, -48(%rbp)	# D.3702, p
	movl	-112(%rbp), %eax	# temp, tmp161
	movl	%eax, -44(%rbp)	# tmp161, p
.L136:
.LBE32:
	.loc 1 276 0 discriminator 3
	movl	-36(%rbp), %edx	# p, D.3702
	movl	-32(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L137	#,
.LBB33:
	.loc 1 276 0 discriminator 4
	movl	-36(%rbp), %eax	# p, tmp162
	movl	%eax, -108(%rbp)	# tmp162, temp
	movl	-32(%rbp), %eax	# p, D.3702
	movl	%eax, -36(%rbp)	# D.3702, p
	movl	-108(%rbp), %eax	# temp, tmp163
	movl	%eax, -32(%rbp)	# tmp163, p
.L137:
.LBE33:
	.loc 1 276 0 discriminator 6
	movl	-24(%rbp), %edx	# p, D.3702
	movl	-20(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L138	#,
.LBB34:
	.loc 1 276 0 discriminator 7
	movl	-24(%rbp), %eax	# p, tmp164
	movl	%eax, -104(%rbp)	# tmp164, temp
	movl	-20(%rbp), %eax	# p, D.3702
	movl	%eax, -24(%rbp)	# D.3702, p
	movl	-104(%rbp), %eax	# temp, tmp165
	movl	%eax, -20(%rbp)	# tmp165, p
.L138:
.LBE34:
	.loc 1 277 0 is_stmt 1
	movl	-44(%rbp), %edx	# p, D.3702
	movl	-40(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L139	#,
.LBB35:
	.loc 1 277 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax	# p, tmp166
	movl	%eax, -100(%rbp)	# tmp166, temp
	movl	-40(%rbp), %eax	# p, D.3702
	movl	%eax, -44(%rbp)	# D.3702, p
	movl	-100(%rbp), %eax	# temp, tmp167
	movl	%eax, -40(%rbp)	# tmp167, p
.L139:
.LBE35:
	.loc 1 277 0 discriminator 3
	movl	-32(%rbp), %edx	# p, D.3702
	movl	-28(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L140	#,
.LBB36:
	.loc 1 277 0 discriminator 4
	movl	-32(%rbp), %eax	# p, tmp168
	movl	%eax, -96(%rbp)	# tmp168, temp
	movl	-28(%rbp), %eax	# p, D.3702
	movl	%eax, -32(%rbp)	# D.3702, p
	movl	-96(%rbp), %eax	# temp, tmp169
	movl	%eax, -28(%rbp)	# tmp169, p
.L140:
.LBE36:
	.loc 1 277 0 discriminator 6
	movl	-20(%rbp), %edx	# p, D.3702
	movl	-16(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L141	#,
.LBB37:
	.loc 1 277 0 discriminator 7
	movl	-20(%rbp), %eax	# p, tmp170
	movl	%eax, -92(%rbp)	# tmp170, temp
	movl	-16(%rbp), %eax	# p, D.3702
	movl	%eax, -20(%rbp)	# D.3702, p
	movl	-92(%rbp), %eax	# temp, tmp171
	movl	%eax, -16(%rbp)	# tmp171, p
.L141:
.LBE37:
	.loc 1 278 0 is_stmt 1
	movl	-48(%rbp), %edx	# p, D.3702
	movl	-36(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L142	#,
.LBB38:
	.loc 1 278 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax	# p, tmp172
	movl	%eax, -88(%rbp)	# tmp172, temp
	movl	-36(%rbp), %eax	# p, D.3702
	movl	%eax, -48(%rbp)	# D.3702, p
	movl	-88(%rbp), %eax	# temp, tmp173
	movl	%eax, -36(%rbp)	# tmp173, p
.L142:
.LBE38:
	.loc 1 278 0 discriminator 3
	movl	-28(%rbp), %edx	# p, D.3702
	movl	-16(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L143	#,
.LBB39:
	.loc 1 278 0 discriminator 4
	movl	-28(%rbp), %eax	# p, tmp174
	movl	%eax, -84(%rbp)	# tmp174, temp
	movl	-16(%rbp), %eax	# p, D.3702
	movl	%eax, -28(%rbp)	# D.3702, p
	movl	-84(%rbp), %eax	# temp, tmp175
	movl	%eax, -16(%rbp)	# tmp175, p
.L143:
.LBE39:
	.loc 1 278 0 discriminator 6
	movl	-32(%rbp), %edx	# p, D.3702
	movl	-20(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L144	#,
.LBB40:
	.loc 1 278 0 discriminator 7
	movl	-32(%rbp), %eax	# p, tmp176
	movl	%eax, -80(%rbp)	# tmp176, temp
	movl	-20(%rbp), %eax	# p, D.3702
	movl	%eax, -32(%rbp)	# D.3702, p
	movl	-80(%rbp), %eax	# temp, tmp177
	movl	%eax, -20(%rbp)	# tmp177, p
.L144:
.LBE40:
	.loc 1 279 0 is_stmt 1
	movl	-36(%rbp), %edx	# p, D.3702
	movl	-24(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L145	#,
.LBB41:
	.loc 1 279 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %eax	# p, tmp178
	movl	%eax, -76(%rbp)	# tmp178, temp
	movl	-24(%rbp), %eax	# p, D.3702
	movl	%eax, -36(%rbp)	# D.3702, p
	movl	-76(%rbp), %eax	# temp, tmp179
	movl	%eax, -24(%rbp)	# tmp179, p
.L145:
.LBE41:
	.loc 1 279 0 discriminator 3
	movl	-44(%rbp), %edx	# p, D.3702
	movl	-32(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L146	#,
.LBB42:
	.loc 1 279 0 discriminator 4
	movl	-44(%rbp), %eax	# p, tmp180
	movl	%eax, -72(%rbp)	# tmp180, temp
	movl	-32(%rbp), %eax	# p, D.3702
	movl	%eax, -44(%rbp)	# D.3702, p
	movl	-72(%rbp), %eax	# temp, tmp181
	movl	%eax, -32(%rbp)	# tmp181, p
.L146:
.LBE42:
	.loc 1 279 0 discriminator 6
	movl	-40(%rbp), %edx	# p, D.3702
	movl	-28(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L147	#,
.LBB43:
	.loc 1 279 0 discriminator 7
	movl	-40(%rbp), %eax	# p, tmp182
	movl	%eax, -68(%rbp)	# tmp182, temp
	movl	-28(%rbp), %eax	# p, D.3702
	movl	%eax, -40(%rbp)	# D.3702, p
	movl	-68(%rbp), %eax	# temp, tmp183
	movl	%eax, -28(%rbp)	# tmp183, p
.L147:
.LBE43:
	.loc 1 280 0 is_stmt 1
	movl	-32(%rbp), %edx	# p, D.3702
	movl	-20(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L148	#,
.LBB44:
	.loc 1 280 0 is_stmt 0 discriminator 1
	movl	-32(%rbp), %eax	# p, tmp184
	movl	%eax, -64(%rbp)	# tmp184, temp
	movl	-20(%rbp), %eax	# p, D.3702
	movl	%eax, -32(%rbp)	# D.3702, p
	movl	-64(%rbp), %eax	# temp, tmp185
	movl	%eax, -20(%rbp)	# tmp185, p
.L148:
.LBE44:
	.loc 1 280 0 discriminator 3
	movl	-32(%rbp), %edx	# p, D.3702
	movl	-40(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L149	#,
.LBB45:
	.loc 1 280 0 discriminator 4
	movl	-32(%rbp), %eax	# p, tmp186
	movl	%eax, -60(%rbp)	# tmp186, temp
	movl	-40(%rbp), %eax	# p, D.3702
	movl	%eax, -32(%rbp)	# D.3702, p
	movl	-60(%rbp), %eax	# temp, tmp187
	movl	%eax, -40(%rbp)	# tmp187, p
.L149:
.LBE45:
	.loc 1 280 0 discriminator 6
	movl	-24(%rbp), %edx	# p, D.3702
	movl	-32(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L150	#,
.LBB46:
	.loc 1 280 0 discriminator 7
	movl	-24(%rbp), %eax	# p, tmp188
	movl	%eax, -56(%rbp)	# tmp188, temp
	movl	-32(%rbp), %eax	# p, D.3702
	movl	%eax, -24(%rbp)	# D.3702, p
	movl	-56(%rbp), %eax	# temp, tmp189
	movl	%eax, -32(%rbp)	# tmp189, p
.L150:
.LBE46:
	.loc 1 281 0 is_stmt 1
	movl	-32(%rbp), %edx	# p, D.3702
	movl	-40(%rbp), %eax	# p, D.3702
	cmpl	%eax, %edx	# D.3702, D.3702
	jle	.L151	#,
.LBB47:
	.loc 1 281 0 is_stmt 0 discriminator 1
	movl	-32(%rbp), %eax	# p, tmp190
	movl	%eax, -52(%rbp)	# tmp190, temp
	movl	-40(%rbp), %eax	# p, D.3702
	movl	%eax, -32(%rbp)	# D.3702, p
	movl	-52(%rbp), %eax	# temp, tmp191
	movl	%eax, -40(%rbp)	# tmp191, p
.L151:
.LBE47:
	.loc 1 282 0 is_stmt 1
	movl	-32(%rbp), %eax	# p, D.3703
	.loc 1 283 0
	movq	-8(%rbp), %rcx	# D.3704, tmp194
	xorq	%fs:40, %rcx	#, tmp194
	je	.L153	#,
	call	__stack_chk_fail	#
.L153:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	quickMedianFilter9, .-quickMedianFilter9
	.section	.text.arraySubInt32,"ax",@progbits
	.globl	arraySubInt32
	.type	arraySubInt32, @function
arraySubInt32:
.LFB20:
	.loc 1 286 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# dest, dest
	movq	%rsi, -32(%rbp)	# array1, array1
	movq	%rdx, -40(%rbp)	# array2, array2
	movl	%ecx, -44(%rbp)	# count, count
.LBB48:
	.loc 1 287 0
	movl	$0, -4(%rbp)	#, i
	jmp	.L155	#
.L156:
	.loc 1 288 0 discriminator 3
	movl	-4(%rbp), %eax	# i, tmp99
	cltq
	leaq	0(,%rax,4), %rdx	#, D.3705
	movq	-24(%rbp), %rax	# dest, tmp100
	addq	%rdx, %rax	# D.3705, D.3706
	movl	-4(%rbp), %edx	# i, tmp101
	movslq	%edx, %rdx	# tmp101, D.3705
	leaq	0(,%rdx,4), %rcx	#, D.3705
	movq	-32(%rbp), %rdx	# array1, tmp102
	addq	%rcx, %rdx	# D.3705, D.3706
	movl	(%rdx), %ecx	# *_13, D.3707
	movl	-4(%rbp), %edx	# i, tmp103
	movslq	%edx, %rdx	# tmp103, D.3705
	leaq	0(,%rdx,4), %rsi	#, D.3705
	movq	-40(%rbp), %rdx	# array2, tmp104
	addq	%rsi, %rdx	# D.3705, D.3706
	movl	(%rdx), %edx	# *_18, D.3707
	subl	%edx, %ecx	# D.3707, D.3707
	movl	%ecx, %edx	# D.3707, D.3707
	movl	%edx, (%rax)	# D.3707, *_9
	.loc 1 287 0 discriminator 3
	addl	$1, -4(%rbp)	#, i
.L155:
	.loc 1 287 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax	# i, tmp105
	cmpl	-44(%rbp), %eax	# count, tmp105
	jl	.L156	#,
.LBE48:
	.loc 1 290 0 is_stmt 1
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	arraySubInt32, .-arraySubInt32
	.section	.rodata
	.align 4
.LC1:
	.long	1086918619
	.align 4
.LC2:
	.long	1078530011
	.align 4
.LC3:
	.long	3226013659
	.align 4
.LC4:
	.long	1070141403
	.align 4
.LC5:
	.long	3217625051
	.align 4
.LC6:
	.long	909016218
	.align 4
.LC7:
	.long	961523706
	.align 4
.LC8:
	.long	1007191861
	.align 4
.LC9:
	.long	1042983588
	.align 16
.LC10:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 4
.LC11:
	.long	1028524345
	.align 4
.LC12:
	.long	1050588643
	.align 4
.LC13:
	.long	1041693320
	.align 4
.LC14:
	.long	1065352773
	.align 4
.LC15:
	.long	883482535
	.align 16
.LC16:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC17:
	.long	1059388313
	.align 4
.LC18:
	.long	1041670761
	.align 4
.LC19:
	.long	1065353216
	.align 4
.LC20:
	.long	3164171824
	.align 4
.LC21:
	.long	1033377319
	.align 4
.LC22:
	.long	1046033540
	.align 4
.LC23:
	.long	1070140836
	.align 4
.LC24:
	.long	1016003125
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "src/main/common/maths.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
	.file 5 "src/main/common/axis.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xef9
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF657
	.byte	0xc
	.long	.LASF658
	.long	.LASF659
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF580
	.uleb128 0x3
	.long	.LASF582
	.byte	0x2
	.byte	0x25
	.long	0x3f
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF581
	.uleb128 0x3
	.long	.LASF583
	.byte	0x2
	.byte	0x26
	.long	0x51
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF584
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF585
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF586
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF587
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF588
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF589
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF590
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF591
	.uleb128 0x5
	.byte	0x4
	.long	0x6d
	.byte	0x5
	.byte	0x14
	.long	0xa9
	.uleb128 0x6
	.string	"X"
	.byte	0
	.uleb128 0x6
	.string	"Y"
	.byte	0x1
	.uleb128 0x6
	.string	"Z"
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF597
	.byte	0x14
	.byte	0x3
	.byte	0x25
	.long	0xf2
	.uleb128 0x8
	.long	.LASF592
	.byte	0x3
	.byte	0x27
	.long	0x7b
	.byte	0
	.uleb128 0x8
	.long	.LASF593
	.byte	0x3
	.byte	0x27
	.long	0x7b
	.byte	0x4
	.uleb128 0x8
	.long	.LASF594
	.byte	0x3
	.byte	0x27
	.long	0x7b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF595
	.byte	0x3
	.byte	0x27
	.long	0x7b
	.byte	0xc
	.uleb128 0x9
	.string	"m_n"
	.byte	0x3
	.byte	0x28
	.long	0x51
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF596
	.byte	0x3
	.byte	0x29
	.long	0xa9
	.uleb128 0x7
	.long	.LASF598
	.byte	0xc
	.byte	0x3
	.byte	0x2c
	.long	0x128
	.uleb128 0x9
	.string	"X"
	.byte	0x3
	.byte	0x2d
	.long	0x7b
	.byte	0
	.uleb128 0x9
	.string	"Y"
	.byte	0x3
	.byte	0x2e
	.long	0x7b
	.byte	0x4
	.uleb128 0x9
	.string	"Z"
	.byte	0x3
	.byte	0x2f
	.long	0x7b
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.long	0x7b
	.long	0x138
	.uleb128 0xb
	.long	0x138
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF599
	.uleb128 0x7
	.long	.LASF600
	.byte	0xc
	.byte	0x3
	.byte	0x39
	.long	0x170
	.uleb128 0x8
	.long	.LASF601
	.byte	0x3
	.byte	0x3a
	.long	0x7b
	.byte	0
	.uleb128 0x8
	.long	.LASF602
	.byte	0x3
	.byte	0x3b
	.long	0x7b
	.byte	0x4
	.uleb128 0x9
	.string	"yaw"
	.byte	0x3
	.byte	0x3c
	.long	0x7b
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF603
	.byte	0x3
	.byte	0x3d
	.long	0x13f
	.uleb128 0xc
	.byte	0xc
	.byte	0x3
	.byte	0x3f
	.long	0x19a
	.uleb128 0xd
	.string	"raw"
	.byte	0x3
	.byte	0x40
	.long	0x128
	.uleb128 0xe
	.long	.LASF604
	.byte	0x3
	.byte	0x41
	.long	0x170
	.byte	0
	.uleb128 0x3
	.long	.LASF605
	.byte	0x3
	.byte	0x42
	.long	0x17b
	.uleb128 0xf
	.long	.LASF607
	.byte	0x4
	.byte	0x41
	.long	0x7b
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ee
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x2b
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.long	.LASF606
	.byte	0x1
	.byte	0x2d
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"x2"
	.byte	0x1
	.byte	0x33
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.long	.LASF608
	.byte	0x4
	.byte	0x3f
	.long	0x7b
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x21c
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x37
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.long	.LASF609
	.byte	0x4
	.byte	0x3c
	.long	0x7b
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x280
	.uleb128 0x10
	.string	"y"
	.byte	0x1
	.byte	0x40
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x40
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.string	"res"
	.byte	0x1
	.byte	0x4a
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.long	.LASF610
	.byte	0x1
	.byte	0x4a
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF611
	.byte	0x1
	.byte	0x4a
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.long	.LASF612
	.byte	0x4
	.byte	0x36
	.long	0x7b
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c9
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x5b
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.string	"xa"
	.byte	0x1
	.byte	0x5d
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF613
	.byte	0x1
	.byte	0x5e
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.long	.LASF614
	.byte	0x1
	.byte	0x66
	.long	0x46
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x307
	.uleb128 0x14
	.long	.LASF615
	.byte	0x1
	.byte	0x66
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.long	.LASF616
	.byte	0x1
	.byte	0x66
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.long	.LASF617
	.byte	0x1
	.byte	0x72
	.long	0x51
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x353
	.uleb128 0x10
	.string	"amt"
	.byte	0x1
	.byte	0x72
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.string	"low"
	.byte	0x1
	.byte	0x72
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF618
	.byte	0x1
	.byte	0x72
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xf
	.long	.LASF619
	.byte	0x1
	.byte	0x7c
	.long	0x7b
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x39f
	.uleb128 0x10
	.string	"amt"
	.byte	0x1
	.byte	0x7c
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.string	"low"
	.byte	0x1
	.byte	0x7c
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF618
	.byte	0x1
	.byte	0x7c
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x15
	.long	.LASF620
	.byte	0x1
	.byte	0x86
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x3cb
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x86
	.long	0x3cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0xf2
	.uleb128 0x15
	.long	.LASF621
	.byte	0x1
	.byte	0x8b
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x409
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x8b
	.long	0x3cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x8b
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xf
	.long	.LASF622
	.byte	0x1
	.byte	0x99
	.long	0x7b
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x439
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x99
	.long	0x3cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x13
	.long	.LASF623
	.byte	0x1
	.byte	0x9e
	.long	0x7b
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x469
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x9e
	.long	0x3cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.long	.LASF624
	.byte	0x1
	.byte	0xa3
	.long	0x7b
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x499
	.uleb128 0x14
	.long	.LASF625
	.byte	0x1
	.byte	0xa3
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.long	.LASF626
	.byte	0x1
	.byte	0xa8
	.long	0x51
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x517
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0xa8
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.long	.LASF627
	.byte	0x1
	.byte	0xa8
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.long	.LASF628
	.byte	0x1
	.byte	0xa8
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.long	.LASF629
	.byte	0x1
	.byte	0xa8
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.long	.LASF630
	.byte	0x1
	.byte	0xa8
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x12
	.string	"a"
	.byte	0x1
	.byte	0xaa
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.string	"b"
	.byte	0x1
	.byte	0xab
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	.LASF631
	.byte	0x1
	.byte	0xb0
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x55f
	.uleb128 0x10
	.string	"src"
	.byte	0x1
	.byte	0xb0
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.long	.LASF632
	.byte	0x1
	.byte	0xb0
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF633
	.byte	0x1
	.byte	0xb2
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0xfd
	.uleb128 0x17
	.long	.LASF634
	.byte	0x1
	.byte	0xbc
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x62d
	.uleb128 0x14
	.long	.LASF635
	.byte	0x1
	.byte	0xbc
	.long	0x62d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x14
	.long	.LASF636
	.byte	0x1
	.byte	0xbc
	.long	0x633
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x11
	.long	.LASF637
	.byte	0x1
	.byte	0xbe
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.long	.LASF638
	.byte	0x1
	.byte	0xbe
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x11
	.long	.LASF639
	.byte	0x1
	.byte	0xbe
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF640
	.byte	0x1
	.byte	0xbe
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.long	.LASF641
	.byte	0x1
	.byte	0xbe
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.long	.LASF642
	.byte	0x1
	.byte	0xbe
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.long	.LASF643
	.byte	0x1
	.byte	0xbf
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.long	.LASF644
	.byte	0x1
	.byte	0xbf
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.long	.LASF645
	.byte	0x1
	.byte	0xbf
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF646
	.byte	0x1
	.byte	0xbf
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0x19a
	.uleb128 0x16
	.byte	0x8
	.long	0x128
	.uleb128 0x17
	.long	.LASF647
	.byte	0x1
	.byte	0xd9
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x690
	.uleb128 0x10
	.string	"v"
	.byte	0x1
	.byte	0xd9
	.long	0x55f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x14
	.long	.LASF635
	.byte	0x1
	.byte	0xd9
	.long	0x62d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x11
	.long	.LASF648
	.byte	0x1
	.byte	0xdb
	.long	0xfd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x11
	.long	.LASF636
	.byte	0x1
	.byte	0xdd
	.long	0x690
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0xa
	.long	0x7b
	.long	0x6a6
	.uleb128 0xb
	.long	0x138
	.byte	0x2
	.uleb128 0xb
	.long	0x138
	.byte	0x2
	.byte	0
	.uleb128 0x13
	.long	.LASF649
	.byte	0x1
	.byte	0xed
	.long	0x46
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x76b
	.uleb128 0x10
	.string	"v"
	.byte	0x1
	.byte	0xed
	.long	0x76b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x12
	.string	"p"
	.byte	0x1
	.byte	0xef
	.long	0x771
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x702
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0xf0
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x18
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x726
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xf2
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x18
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x74a
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xf2
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x19
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xf2
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0x46
	.uleb128 0xa
	.long	0x46
	.long	0x781
	.uleb128 0xb
	.long	0x138
	.byte	0x2
	.byte	0
	.uleb128 0x13
	.long	.LASF651
	.byte	0x1
	.byte	0xf6
	.long	0x46
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x8da
	.uleb128 0x10
	.string	"v"
	.byte	0x1
	.byte	0xf6
	.long	0x76b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x12
	.string	"p"
	.byte	0x1
	.byte	0xf8
	.long	0x8da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x7de
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0xf9
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x18
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x803
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xfb
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x18
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x828
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xfb
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x18
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x84d
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xfb
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x18
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x871
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xfc
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x18
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x895
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xfc
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x18
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x8b9
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xfc
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x19
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x11
	.long	.LASF650
	.byte	0x1
	.byte	0xfd
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x46
	.long	0x8ea
	.uleb128 0xb
	.long	0x138
	.byte	0x4
	.byte	0
	.uleb128 0x1a
	.long	.LASF652
	.byte	0x1
	.value	0x101
	.long	0x46
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xb36
	.uleb128 0x1b
	.string	"v"
	.byte	0x1
	.value	0x101
	.long	0x76b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x103
	.long	0xb36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x94b
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x104
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x18
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.long	0x971
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x106
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.uleb128 0x18
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x997
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x106
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x18
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.long	0x9bd
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x106
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.uleb128 0x18
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.long	0x9e3
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x107
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x18
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0xa09
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x107
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x18
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0xa2f
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x107
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x18
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0xa55
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x108
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.uleb128 0x18
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.long	0xa7b
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x108
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x18
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0xaa1
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x108
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0x18
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.long	0xac7
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x109
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x18
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.long	0xaed
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x109
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x18
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.long	0xb13
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x109
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x19
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x10a
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x46
	.long	0xb46
	.uleb128 0xb
	.long	0x138
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.long	.LASF653
	.byte	0x1
	.value	0x10e
	.long	0x46
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xe76
	.uleb128 0x1b
	.string	"v"
	.byte	0x1
	.value	0x10e
	.long	0x76b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x110
	.long	0xe76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0xba7
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x111
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.uleb128 0x18
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.long	0xbcd
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x113
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.byte	0
	.uleb128 0x18
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.long	0xbf3
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x113
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.uleb128 0x18
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0xc19
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x113
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.byte	0
	.uleb128 0x18
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.long	0xc3f
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x114
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x18
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0xc65
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x114
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.byte	0
	.uleb128 0x18
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0xc8b
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x114
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x18
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.long	0xcb1
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x115
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.uleb128 0x18
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.long	0xcd7
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x115
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x18
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0xcfd
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x115
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.uleb128 0x18
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.long	0xd23
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x116
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x18
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.long	0xd49
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x116
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x18
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.long	0xd6f
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x116
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x18
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.long	0xd95
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x117
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.uleb128 0x18
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.long	0xdbb
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x117
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x18
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.long	0xde1
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x117
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0x18
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.long	0xe07
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x118
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x18
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.long	0xe2d
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x118
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x18
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.long	0xe53
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x118
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x19
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.uleb128 0x1d
	.long	.LASF650
	.byte	0x1
	.value	0x119
	.long	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x46
	.long	0xe86
	.uleb128 0xb
	.long	0x138
	.byte	0x8
	.byte	0
	.uleb128 0x1e
	.long	.LASF660
	.byte	0x1
	.value	0x11d
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.long	.LASF632
	.byte	0x1
	.value	0x11d
	.long	0x76b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF654
	.byte	0x1
	.value	0x11d
	.long	0x76b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF655
	.byte	0x1
	.value	0x11d
	.long	0x76b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF656
	.byte	0x1
	.value	0x11d
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x19
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x11f
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
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
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x16c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.quad	.LFB1
	.quad	.LFE1-.LFB1
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
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB0
	.quad	.LFE0
	.quad	.LFB1
	.quad	.LFE1
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
	.quad	.LFB9
	.quad	.LFE9
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB11
	.quad	.LFE11
	.quad	.LFB12
	.quad	.LFE12
	.quad	.LFB13
	.quad	.LFE13
	.quad	.LFB14
	.quad	.LFE14
	.quad	.LFB15
	.quad	.LFE15
	.quad	.LFB16
	.quad	.LFE16
	.quad	.LFB17
	.quad	.LFE17
	.quad	.LFB18
	.quad	.LFE18
	.quad	.LFB19
	.quad	.LFE19
	.quad	.LFB20
	.quad	.LFE20
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
	.file 6 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 7 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x7
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF254
	.file 8 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro2
	.file 9 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro3
	.file 10 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0xb
	.file 12 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 13 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF452
	.byte	0x4
	.file 14 "/usr/include/math.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x18
	.long	.LASF453
	.file 15 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0xf
	.file 16 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x4
	.file 17 "/usr/include/x86_64-linux-gnu/bits/huge_val.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x11
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF473
	.byte	0x4
	.file 18 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x12
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF474
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x19
	.long	.LASF475
	.byte	0x4
	.file 20 "/usr/include/x86_64-linux-gnu/bits/inf.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF476
	.byte	0x4
	.file 21 "/usr/include/x86_64-linux-gnu/bits/nan.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF477
	.byte	0x4
	.file 22 "/usr/include/x86_64-linux-gnu/bits/mathdef.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x3
	.uleb128 0x53
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x3
	.uleb128 0x68
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x3
	.uleb128 0x97
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF553
	.byte	0x4
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.byte	0x5
	.uleb128 0x26
	.long	.LASF566
	.byte	0x5
	.uleb128 0x27
	.long	.LASF567
	.byte	0x5
	.uleb128 0x28
	.long	.LASF568
	.byte	0x5
	.uleb128 0x29
	.long	.LASF569
	.byte	0x5
	.uleb128 0x42
	.long	.LASF570
	.byte	0x5
	.uleb128 0x43
	.long	.LASF571
	.byte	0x5
	.uleb128 0x44
	.long	.LASF572
	.byte	0x5
	.uleb128 0x45
	.long	.LASF573
	.byte	0x5
	.uleb128 0x46
	.long	.LASF574
	.byte	0x5
	.uleb128 0x47
	.long	.LASF575
	.byte	0x5
	.uleb128 0x48
	.long	.LASF576
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF577
	.byte	0x5
	.uleb128 0xea
	.long	.LASF578
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF579
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
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8a17512e4762abcff59e629b80463c10,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF255
	.byte	0x6
	.uleb128 0x61
	.long	.LASF256
	.byte	0x6
	.uleb128 0x62
	.long	.LASF257
	.byte	0x6
	.uleb128 0x63
	.long	.LASF258
	.byte	0x6
	.uleb128 0x64
	.long	.LASF259
	.byte	0x6
	.uleb128 0x65
	.long	.LASF260
	.byte	0x6
	.uleb128 0x66
	.long	.LASF261
	.byte	0x6
	.uleb128 0x67
	.long	.LASF262
	.byte	0x6
	.uleb128 0x68
	.long	.LASF263
	.byte	0x6
	.uleb128 0x69
	.long	.LASF264
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF265
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF266
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF267
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF268
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF269
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF270
	.byte	0x6
	.uleb128 0x70
	.long	.LASF271
	.byte	0x6
	.uleb128 0x71
	.long	.LASF272
	.byte	0x6
	.uleb128 0x72
	.long	.LASF273
	.byte	0x6
	.uleb128 0x73
	.long	.LASF274
	.byte	0x6
	.uleb128 0x74
	.long	.LASF275
	.byte	0x6
	.uleb128 0x75
	.long	.LASF276
	.byte	0x6
	.uleb128 0x76
	.long	.LASF277
	.byte	0x6
	.uleb128 0x77
	.long	.LASF278
	.byte	0x6
	.uleb128 0x78
	.long	.LASF279
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF280
	.byte	0x5
	.uleb128 0x88
	.long	.LASF281
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF282
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF283
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF284
	.byte	0x5
	.uleb128 0xce
	.long	.LASF285
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF286
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF287
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF288
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF289
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF290
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF291
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF292
	.byte	0x5
	.uleb128 0x101
	.long	.LASF293
	.byte	0x5
	.uleb128 0x105
	.long	.LASF294
	.byte	0x5
	.uleb128 0x109
	.long	.LASF295
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF258
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF285
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF257
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF284
	.byte	0x5
	.uleb128 0x111
	.long	.LASF296
	.byte	0x6
	.uleb128 0x112
	.long	.LASF297
	.byte	0x5
	.uleb128 0x113
	.long	.LASF298
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF299
	.byte	0x5
	.uleb128 0x141
	.long	.LASF300
	.byte	0x5
	.uleb128 0x154
	.long	.LASF301
	.byte	0x6
	.uleb128 0x161
	.long	.LASF302
	.byte	0x5
	.uleb128 0x162
	.long	.LASF303
	.byte	0x5
	.uleb128 0x166
	.long	.LASF304
	.byte	0x5
	.uleb128 0x167
	.long	.LASF305
	.byte	0x5
	.uleb128 0x169
	.long	.LASF306
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF307
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF308
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF309
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF310
	.byte	0x5
	.uleb128 0x37
	.long	.LASF311
	.byte	0x5
	.uleb128 0x38
	.long	.LASF312
	.byte	0x5
	.uleb128 0x39
	.long	.LASF313
	.byte	0x5
	.uleb128 0x52
	.long	.LASF314
	.byte	0x5
	.uleb128 0x53
	.long	.LASF315
	.byte	0x5
	.uleb128 0x58
	.long	.LASF316
	.byte	0x5
	.uleb128 0x59
	.long	.LASF317
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF318
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF319
	.byte	0x5
	.uleb128 0x65
	.long	.LASF320
	.byte	0x5
	.uleb128 0x66
	.long	.LASF321
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF322
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF323
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF324
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF325
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF326
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF327
	.byte	0x5
	.uleb128 0x84
	.long	.LASF328
	.byte	0x5
	.uleb128 0x85
	.long	.LASF329
	.byte	0x5
	.uleb128 0x88
	.long	.LASF330
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF331
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF332
	.byte	0x5
	.uleb128 0x96
	.long	.LASF333
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF334
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF335
	.byte	0x5
	.uleb128 0xba
	.long	.LASF336
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF337
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF338
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF339
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF340
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF341
	.byte	0x5
	.uleb128 0xec
	.long	.LASF342
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF343
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF344
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF345
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF346
	.byte	0x5
	.uleb128 0x114
	.long	.LASF347
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF348
	.byte	0x5
	.uleb128 0x125
	.long	.LASF349
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF350
	.byte	0x5
	.uleb128 0x133
	.long	.LASF351
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF352
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF353
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF354
	.byte	0x5
	.uleb128 0x157
	.long	.LASF355
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF356
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF357
	.byte	0x5
	.uleb128 0x172
	.long	.LASF358
	.byte	0x5
	.uleb128 0x181
	.long	.LASF359
	.byte	0x5
	.uleb128 0x182
	.long	.LASF360
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF361
	.byte	0x5
	.uleb128 0xa
	.long	.LASF362
	.byte	0x5
	.uleb128 0xc
	.long	.LASF363
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF364
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF365
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF366
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF367
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF368
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF369
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF370
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF371
	.byte	0x5
	.uleb128 0xb
	.long	.LASF372
	.byte	0x5
	.uleb128 0xc
	.long	.LASF373
	.byte	0x5
	.uleb128 0xd
	.long	.LASF374
	.byte	0x5
	.uleb128 0xe
	.long	.LASF375
	.byte	0x5
	.uleb128 0xf
	.long	.LASF376
	.byte	0x5
	.uleb128 0x10
	.long	.LASF377
	.byte	0x5
	.uleb128 0x11
	.long	.LASF378
	.byte	0x5
	.uleb128 0x12
	.long	.LASF379
	.byte	0x5
	.uleb128 0x13
	.long	.LASF380
	.byte	0x5
	.uleb128 0x14
	.long	.LASF381
	.byte	0x5
	.uleb128 0x15
	.long	.LASF382
	.byte	0x5
	.uleb128 0x16
	.long	.LASF383
	.byte	0x5
	.uleb128 0x17
	.long	.LASF384
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF385
	.byte	0x5
	.uleb128 0x22
	.long	.LASF386
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF387
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF388
	.byte	0x5
	.uleb128 0x34
	.long	.LASF389
	.byte	0x5
	.uleb128 0x78
	.long	.LASF390
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF391
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF392
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF393
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF394
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF395
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF396
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF397
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF398
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF399
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF400
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF401
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF402
	.byte	0x5
	.uleb128 0xad
	.long	.LASF403
	.byte	0x5
	.uleb128 0xae
	.long	.LASF404
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF405
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF406
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF407
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF408
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF409
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF410
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF411
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF412
	.byte	0x5
	.uleb128 0xba
	.long	.LASF413
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF414
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF415
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF416
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF417
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF418
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF419
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF420
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF421
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF422
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF423
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF424
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF425
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF426
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF427
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF428
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF429
	.byte	0x5
	.uleb128 0xec
	.long	.LASF430
	.byte	0x5
	.uleb128 0xee
	.long	.LASF431
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF432
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF433
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF434
	.byte	0x5
	.uleb128 0x100
	.long	.LASF435
	.byte	0x5
	.uleb128 0x101
	.long	.LASF436
	.byte	0x5
	.uleb128 0x105
	.long	.LASF437
	.byte	0x5
	.uleb128 0x111
	.long	.LASF438
	.byte	0x5
	.uleb128 0x112
	.long	.LASF439
	.byte	0x5
	.uleb128 0x116
	.long	.LASF440
	.byte	0x5
	.uleb128 0x117
	.long	.LASF441
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF442
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF443
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF444
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF445
	.byte	0x5
	.uleb128 0x124
	.long	.LASF446
	.byte	0x5
	.uleb128 0x125
	.long	.LASF447
	.byte	0x5
	.uleb128 0x126
	.long	.LASF448
	.byte	0x5
	.uleb128 0x128
	.long	.LASF449
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF450
	.byte	0x5
	.uleb128 0x130
	.long	.LASF451
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libmsimddeclstubs.h.34.75644856b74ba3d815155fe5fe7ecc56,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF454
	.byte	0x5
	.uleb128 0x24
	.long	.LASF455
	.byte	0x5
	.uleb128 0x25
	.long	.LASF456
	.byte	0x5
	.uleb128 0x26
	.long	.LASF457
	.byte	0x5
	.uleb128 0x28
	.long	.LASF458
	.byte	0x5
	.uleb128 0x29
	.long	.LASF459
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF460
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF461
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF462
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF463
	.byte	0x5
	.uleb128 0x30
	.long	.LASF464
	.byte	0x5
	.uleb128 0x31
	.long	.LASF465
	.byte	0x5
	.uleb128 0x32
	.long	.LASF466
	.byte	0x5
	.uleb128 0x34
	.long	.LASF467
	.byte	0x5
	.uleb128 0x35
	.long	.LASF468
	.byte	0x5
	.uleb128 0x36
	.long	.LASF469
	.byte	0x5
	.uleb128 0x38
	.long	.LASF470
	.byte	0x5
	.uleb128 0x39
	.long	.LASF471
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF472
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.mathdef.h.23.67c0aa4a204f1f427459dfc651aba565,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF478
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF479
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF480
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.55.cf380f99c57d42476a5252f30065036a,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x37
	.long	.LASF481
	.byte	0x5
	.uleb128 0x39
	.long	.LASF482
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF483
	.byte	0x5
	.uleb128 0x41
	.long	.LASF484
	.byte	0x5
	.uleb128 0x43
	.long	.LASF485
	.byte	0x5
	.uleb128 0x46
	.long	.LASF486
	.byte	0x5
	.uleb128 0x48
	.long	.LASF487
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF488
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF489
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF490
	.byte	0x5
	.uleb128 0x50
	.long	.LASF491
	.byte	0x5
	.uleb128 0x51
	.long	.LASF492
	.byte	0x5
	.uleb128 0x52
	.long	.LASF493
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.84.742292806c6be54f49dc607928a827f7,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x54
	.long	.LASF494
	.byte	0x6
	.uleb128 0x55
	.long	.LASF495
	.byte	0x6
	.uleb128 0x56
	.long	.LASF496
	.byte	0x6
	.uleb128 0x57
	.long	.LASF497
	.byte	0x6
	.uleb128 0x58
	.long	.LASF498
	.byte	0x5
	.uleb128 0x61
	.long	.LASF499
	.byte	0x5
	.uleb128 0x63
	.long	.LASF500
	.byte	0x5
	.uleb128 0x64
	.long	.LASF501
	.byte	0x5
	.uleb128 0x65
	.long	.LASF502
	.byte	0x5
	.uleb128 0x66
	.long	.LASF503
	.byte	0x5
	.uleb128 0x67
	.long	.LASF504
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.105.59ff0f83ebf6a04e70e145cef2d1185e,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x69
	.long	.LASF494
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF495
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF496
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF497
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF498
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF505
	.byte	0x5
	.uleb128 0x91
	.long	.LASF506
	.byte	0x5
	.uleb128 0x92
	.long	.LASF507
	.byte	0x5
	.uleb128 0x93
	.long	.LASF502
	.byte	0x5
	.uleb128 0x94
	.long	.LASF503
	.byte	0x5
	.uleb128 0x95
	.long	.LASF504
	.byte	0x5
	.uleb128 0x96
	.long	.LASF508
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.152.52b052d532b5a6b0eb86a9fe4d5b0433,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x98
	.long	.LASF494
	.byte	0x6
	.uleb128 0x99
	.long	.LASF495
	.byte	0x6
	.uleb128 0x9a
	.long	.LASF496
	.byte	0x6
	.uleb128 0x9b
	.long	.LASF497
	.byte	0x6
	.uleb128 0x9c
	.long	.LASF498
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF509
	.byte	0x6
	.uleb128 0xa2
	.long	.LASF510
	.byte	0x6
	.uleb128 0xa3
	.long	.LASF511
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF512
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF513
	.byte	0x5
	.uleb128 0xda
	.long	.LASF514
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF515
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF516
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF517
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF518
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF519
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF520
	.byte	0x5
	.uleb128 0x124
	.long	.LASF521
	.byte	0x5
	.uleb128 0x132
	.long	.LASF522
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF523
	.byte	0x5
	.uleb128 0x140
	.long	.LASF524
	.byte	0x5
	.uleb128 0x146
	.long	.LASF525
	.byte	0x5
	.uleb128 0x184
	.long	.LASF526
	.byte	0x5
	.uleb128 0x187
	.long	.LASF527
	.byte	0x5
	.uleb128 0x188
	.long	.LASF528
	.byte	0x5
	.uleb128 0x189
	.long	.LASF529
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF530
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF531
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF532
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF533
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF534
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF535
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF536
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF537
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF538
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF539
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF540
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF541
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF542
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF543
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF544
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF545
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF546
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF547
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF548
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF549
	.byte	0x5
	.uleb128 0x1d1
	.long	.LASF550
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF551
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF552
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.maths.h.21.5b067f47e9a221ec30aa8aaee7f7dece,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF554
	.byte	0x5
	.uleb128 0x19
	.long	.LASF555
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF556
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF557
	.byte	0x5
	.uleb128 0x21
	.long	.LASF558
	.byte	0x5
	.uleb128 0x22
	.long	.LASF559
	.byte	0x5
	.uleb128 0x23
	.long	.LASF560
	.byte	0x5
	.uleb128 0x62
	.long	.LASF561
	.byte	0x5
	.uleb128 0x63
	.long	.LASF562
	.byte	0x5
	.uleb128 0x64
	.long	.LASF563
	.byte	0x5
	.uleb128 0x65
	.long	.LASF564
	.byte	0x5
	.uleb128 0x66
	.long	.LASF565
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF259:
	.string	"__USE_ISOCXX11"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF522:
	.string	"isinf(x) __builtin_isinf_sign (x)"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF254:
	.string	"_STDINT_H 1"
.LASF456:
	.string	"__DECL_SIMD_cosf "
.LASF645:
	.string	"coszsinx"
.LASF637:
	.string	"cosx"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF641:
	.string	"cosz"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF333:
	.string	"__flexarr []"
.LASF610:
	.string	"absX"
.LASF611:
	.string	"absY"
.LASF352:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF545:
	.string	"M_SQRT2 1.41421356237309504880"
.LASF429:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF339:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF627:
	.string	"srcMin"
.LASF421:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF625:
	.string	"degrees"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF657:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF394:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF307:
	.string	"_SYS_CDEFS_H 1"
.LASF500:
	.string	"_Mdouble_ _Mfloat_"
.LASF387:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF523:
	.string	"MATH_ERRNO 1"
.LASF281:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF457:
	.string	"__DECL_SIMD_cosl "
.LASF479:
	.string	"FP_ILOGB0 (-2147483647 - 1)"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF471:
	.string	"__DECL_SIMD_powf "
.LASF365:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF587:
	.string	"unsigned int"
.LASF306:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF402:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF550:
	.string	"islessequal(x,y) __builtin_islessequal(x, y)"
.LASF267:
	.string	"__USE_XOPEN2K"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF388:
	.string	"__int8_t_defined "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF466:
	.string	"__DECL_SIMD_logl "
.LASF5:
	.string	"__GNUC__ 5"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF603:
	.string	"fp_angles_def"
.LASF382:
	.string	"__stub_sigreturn "
.LASF462:
	.string	"__DECL_SIMD_sincosf "
.LASF348:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF602:
	.string	"pitch"
.LASF372:
	.string	"__stub_chflags "
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF359:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF374:
	.string	"__stub_fchflags "
.LASF583:
	.string	"int32_t"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF463:
	.string	"__DECL_SIMD_sincosl "
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF322:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF285:
	.string	"__USE_ISOC95 1"
.LASF324:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF502:
	.string	"__MATH_DECLARING_DOUBLE 0"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF549:
	.string	"isless(x,y) __builtin_isless(x, y)"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF318:
	.string	"__ptr_t void *"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF237:
	.string	"linux 1"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF412:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF533:
	.string	"HUGE 3.40282347e+38F"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF396:
	.string	"INT16_MAX (32767)"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF510:
	.string	"__MATHDECL"
.LASF434:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF266:
	.string	"__USE_UNIX98"
.LASF301:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF297:
	.string	"_ATFILE_SOURCE"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF313:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF409:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF443:
	.string	"INT16_C(c) c"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF575:
	.string	"atanPolyCoef6 0.1471039133652469f"
.LASF646:
	.string	"sinzsinx"
.LASF401:
	.string	"UINT32_MAX (4294967295U)"
.LASF298:
	.string	"_ATFILE_SOURCE 1"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF311:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF532:
	.string	"PLOSS 6"
.LASF381:
	.string	"__stub_setlogin "
.LASF482:
	.string	"__MATHCALL_VEC(function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHCALL (function, suffix, args)"
.LASF613:
	.string	"result"
.LASF452:
	.string	"_GCC_WRAP_STDINT_H "
.LASF512:
	.string	"FP_NAN 0"
.LASF425:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF410:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF353:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF413:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF558:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF622:
	.string	"devVariance"
.LASF484:
	.string	"__MATHCALL(function,suffix,args) __MATHDECL (_Mdouble_,function,suffix, args)"
.LASF239:
	.string	"__unix__ 1"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF531:
	.string	"TLOSS 5"
.LASF460:
	.string	"__DECL_SIMD_sinl "
.LASF491:
	.string	"__MATH_DECLARING_DOUBLE 1"
.LASF589:
	.string	"float"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF474:
	.string	"HUGE_VALF (__builtin_huge_valf())"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF360:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF656:
	.string	"count"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF540:
	.string	"M_PI_2 1.57079632679489661923"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF312:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF582:
	.string	"int16_t"
.LASF390:
	.string	"__intptr_t_defined "
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF643:
	.string	"coszcosx"
.LASF343:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF630:
	.string	"destMax"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF280:
	.string	"__KERNEL_STRICT_NAMES "
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF308:
	.string	"__PMT"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF263:
	.string	"__USE_POSIX199506"
.LASF444:
	.string	"INT32_C(c) c"
.LASF336:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF553:
	.string	"XYZ_AXIS_COUNT 3"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF315:
	.string	"__PMT(args) args"
.LASF618:
	.string	"high"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF350:
	.string	"__wur "
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF486:
	.string	"__MATHCALLX(function,suffix,args,attrib) __MATHDECLX (_Mdouble_,function,suffix, args, attrib)"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF240:
	.string	"unix 1"
.LASF377:
	.string	"__stub_gtty "
.LASF520:
	.string	"isnormal(x) __builtin_isnormal (x)"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF492:
	.string	"_Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_STD"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF228:
	.string	"__MMX__ 1"
.LASF615:
	.string	"value"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF422:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF295:
	.string	"__USE_XOPEN2K 1"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF616:
	.string	"deadband"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF284:
	.string	"__USE_ISOC99 1"
.LASF296:
	.string	"__USE_XOPEN2K8 1"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF279:
	.string	"__KERNEL_STRICT_NAMES"
.LASF426:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF370:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF258:
	.string	"__USE_ISOC95"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF458:
	.string	"__DECL_SIMD_sin "
.LASF257:
	.string	"__USE_ISOC99"
.LASF293:
	.string	"__USE_POSIX199309 1"
.LASF467:
	.string	"__DECL_SIMD_exp "
.LASF469:
	.string	"__DECL_SIMD_expl "
.LASF524:
	.string	"MATH_ERREXCEPT 2"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF379:
	.string	"__stub_putmsg "
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF320:
	.string	"__BEGIN_DECLS "
.LASF299:
	.string	"__USE_MISC 1"
.LASF600:
	.string	"fp_angles"
.LASF536:
	.string	"M_LOG10E 0.43429448190325182765"
.LASF395:
	.string	"INT8_MAX (127)"
.LASF597:
	.string	"stdev_s"
.LASF596:
	.string	"stdev_t"
.LASF283:
	.string	"_DEFAULT_SOURCE 1"
.LASF608:
	.string	"cosf"
.LASF218:
	.string	"__amd64__ 1"
.LASF419:
	.string	"INT_FAST8_MAX (127)"
.LASF369:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF361:
	.string	"__WORDSIZE 64"
.LASF368:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF619:
	.string	"constrainf"
.LASF541:
	.string	"M_PI_4 0.78539816339744830962"
.LASF450:
	.string	"INTMAX_C(c) c ## L"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF245:
	.string	"EDISON 1"
.LASF404:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF639:
	.string	"cosy"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF454:
	.string	"_BITS_LIBM_SIMD_DECL_STUBS_H 1"
.LASF527:
	.string	"DOMAIN 1"
.LASF286:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF373:
	.string	"__stub_fattach "
.LASF436:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF302:
	.string	"__GNU_LIBRARY__"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF392:
	.string	"INT16_MIN (-32767-1)"
.LASF319:
	.string	"__long_double_t long double"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF335:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF447:
	.string	"UINT16_C(c) c"
.LASF551:
	.string	"islessgreater(x,y) __builtin_islessgreater(x, y)"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF514:
	.string	"FP_ZERO 2"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF591:
	.string	"char"
.LASF567:
	.string	"sinPolyCoef5 8.333017292e-3f"
.LASF626:
	.string	"scaleRange"
.LASF501:
	.string	"__MATH_PRECNAME(name,r) name ##f ##r"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF470:
	.string	"__DECL_SIMD_pow "
.LASF440:
	.string	"WINT_MIN (0u)"
.LASF323:
	.string	"__END_NAMESPACE_STD "
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF547:
	.string	"isgreater(x,y) __builtin_isgreater(x, y)"
.LASF485:
	.string	"__MATHDECL(type,function,suffix,args) __MATHDECL_1(type, function,suffix, args); __MATHDECL_1(type, __CONCAT(__,function),suffix, args)"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF220:
	.string	"__x86_64__ 1"
.LASF430:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF386:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF548:
	.string	"isgreaterequal(x,y) __builtin_isgreaterequal(x, y)"
.LASF528:
	.string	"SING 2"
.LASF294:
	.string	"__USE_POSIX199506 1"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF438:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF554:
	.string	"sq(x) ((x)*(x))"
.LASF494:
	.string	"_Mdouble_"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF356:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF660:
	.string	"arraySubInt32"
.LASF351:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF601:
	.string	"roll"
.LASF393:
	.string	"INT32_MIN (-2147483647-1)"
.LASF563:
	.string	"atan2_approx(y,x) atan2f(y,x)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF325:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF506:
	.string	"_Mdouble_ _Mlong_double_"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF621:
	.string	"devPush"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF262:
	.string	"__USE_POSIX199309"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF354:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF605:
	.string	"fp_angles_t"
.LASF442:
	.string	"INT8_C(c) c"
.LASF300:
	.string	"__USE_ATFILE 1"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF476:
	.string	"INFINITY (__builtin_inff())"
.LASF366:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF17:
	.string	"__LP64__ 1"
.LASF562:
	.string	"cos_approx(x) cosf(x)"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF400:
	.string	"UINT16_MAX (65535)"
.LASF489:
	.string	"_Mdouble_ double"
.LASF342:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF367:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF16:
	.string	"_LP64 1"
.LASF255:
	.string	"_FEATURES_H 1"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF647:
	.string	"rotateV"
.LASF219:
	.string	"__x86_64 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF534:
	.string	"M_E 2.7182818284590452354"
.LASF654:
	.string	"array1"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF327:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF576:
	.string	"atanPolyCoef7 0.6444640676891548f"
.LASF403:
	.string	"INT_LEAST8_MIN (-128)"
.LASF243:
	.string	"DEBUG 1"
.LASF357:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF459:
	.string	"__DECL_SIMD_sinf "
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF559:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF241:
	.string	"__ELF__ 1"
.LASF316:
	.string	"__CONCAT(x,y) x ## y"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF487:
	.string	"__MATHDECLX(type,function,suffix,args,attrib) __MATHDECL_1(type, function,suffix, args) __attribute__ (attrib); __MATHDECL_1(type, __CONCAT(__,function),suffix, args) __attribute__ (attrib)"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF628:
	.string	"srcMax"
.LASF594:
	.string	"m_oldS"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF519:
	.string	"isfinite(x) __builtin_isfinite (x)"
.LASF449:
	.string	"UINT64_C(c) c ## UL"
.LASF303:
	.string	"__GNU_LIBRARY__ 6"
.LASF0:
	.string	"__STDC__ 1"
.LASF555:
	.string	"FAST_TRIGONOMETRY "
.LASF230:
	.string	"__SSE2__ 1"
.LASF535:
	.string	"M_LOG2E 1.4426950408889634074"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF504:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_C99"
.LASF411:
	.string	"UINT_LEAST8_MAX (255)"
.LASF478:
	.string	"_MATH_H_MATHDEF 1"
.LASF326:
	.string	"__END_NAMESPACE_C99 "
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF406:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF290:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF427:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF497:
	.string	"__MATH_PRECNAME"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF659:
	.string	"/home/aravind/git/cleanflight"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF453:
	.string	"_MATH_H 1"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF496:
	.string	"_Mdouble_END_NAMESPACE"
.LASF577:
	.string	"QMF_SORT(a,b) { if ((a)>(b)) QMF_SWAP((a),(b)); }"
.LASF557:
	.string	"RAD (M_PIf / 180.0f)"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF276:
	.string	"__USE_GNU"
.LASF329:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF346:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF564:
	.string	"acos_approx(x) acosf(x)"
.LASF521:
	.string	"isnan(x) __builtin_isnan (x)"
.LASF511:
	.string	"__MATHCALL"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF291:
	.string	"__USE_POSIX 1"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF345:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF439:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF273:
	.string	"__USE_FILE_OFFSET64"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF649:
	.string	"quickMedianFilter3"
.LASF651:
	.string	"quickMedianFilter5"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF652:
	.string	"quickMedianFilter7"
.LASF526:
	.string	"X_TLOSS 1.41484755040568800000e+16"
.LASF653:
	.string	"quickMedianFilter9"
.LASF399:
	.string	"UINT8_MAX (255)"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF305:
	.string	"__GLIBC_MINOR__ 23"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF328:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF275:
	.string	"__USE_ATFILE"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF573:
	.string	"atanPolyCoef4 0.3099814292351353f"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF473:
	.string	"HUGE_VAL (__builtin_huge_val())"
.LASF309:
	.string	"__LEAF , __leaf__"
.LASF448:
	.string	"UINT32_C(c) c ## U"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF355:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF278:
	.string	"__USE_FORTIFY_LEVEL"
.LASF445:
	.string	"INT64_C(c) c ## L"
.LASF475:
	.string	"HUGE_VALL (__builtin_huge_vall())"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF334:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF617:
	.string	"constrain"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF507:
	.string	"__MATH_PRECNAME(name,r) name ##l ##r"
.LASF418:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF330:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF451:
	.string	"UINTMAX_C(c) c ## UL"
.LASF317:
	.string	"__STRING(x) #x"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF391:
	.string	"INT8_MIN (-128)"
.LASF644:
	.string	"sinzcosx"
.LASF544:
	.string	"M_2_SQRTPI 1.12837916709551257390"
.LASF344:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF640:
	.string	"siny"
.LASF435:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF606:
	.string	"xint"
.LASF542:
	.string	"M_1_PI 0.31830988618379067154"
.LASF581:
	.string	"short int"
.LASF598:
	.string	"fp_vector"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF376:
	.string	"__stub_getmsg "
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF568:
	.string	"sinPolyCoef7 -1.980661520e-4f"
.LASF584:
	.string	"long int"
.LASF385:
	.string	"_BITS_WCHAR_H 1"
.LASF465:
	.string	"__DECL_SIMD_logf "
.LASF389:
	.string	"__uint32_t_defined "
.LASF261:
	.string	"__USE_POSIX2"
.LASF481:
	.string	"__SIMD_DECL(function) __CONCAT (__DECL_SIMD_, function)"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF420:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF384:
	.string	"__stub_stty "
.LASF633:
	.string	"length"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF634:
	.string	"buildRotationMatrix"
.LASF570:
	.string	"atanPolyCoef1 3.14551665884836e-07f"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF650:
	.string	"temp"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF235:
	.string	"__linux 1"
.LASF539:
	.string	"M_PI 3.14159265358979323846"
.LASF380:
	.string	"__stub_revoke "
.LASF364:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF277:
	.string	"__USE_REENTRANT"
.LASF441:
	.string	"WINT_MAX (4294967295u)"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF383:
	.string	"__stub_sstk "
.LASF408:
	.string	"INT_LEAST16_MAX (32767)"
.LASF632:
	.string	"dest"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF490:
	.string	"__MATH_PRECNAME(name,r) __CONCAT(name,r)"
.LASF658:
	.string	"src/main/common/maths.c"
.LASF455:
	.string	"__DECL_SIMD_cos "
.LASF264:
	.string	"__USE_XOPEN"
.LASF561:
	.string	"sin_approx(x) sinf(x)"
.LASF437:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF289:
	.string	"_POSIX_C_SOURCE"
.LASF407:
	.string	"INT_LEAST8_MAX (127)"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF631:
	.string	"normalizeV"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF341:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF530:
	.string	"UNDERFLOW 4"
.LASF614:
	.string	"applyDeadband"
.LASF274:
	.string	"__USE_MISC"
.LASF468:
	.string	"__DECL_SIMD_expf "
.LASF623:
	.string	"devStandardDeviation"
.LASF629:
	.string	"destMin"
.LASF428:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF655:
	.string	"array2"
.LASF529:
	.string	"OVERFLOW 3"
.LASF505:
	.string	"_Mlong_double_ long double"
.LASF579:
	.string	"QMF_COPY(p,v,n) { int32_t i; for (i=0; i<n; i++) p[i]=v[i]; }"
.LASF282:
	.string	"_DEFAULT_SOURCE"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF493:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_STD"
.LASF518:
	.string	"signbit(x) (sizeof (x) == sizeof (float) ? __builtin_signbitf (x) : sizeof (x) == sizeof (double) ? __builtin_signbit (x) : __builtin_signbitl (x))"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF472:
	.string	"__DECL_SIMD_powl "
.LASF331:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF607:
	.string	"sinf"
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF371:
	.string	"__stub___compat_bdflush "
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF375:
	.string	"__stub_fdetach "
.LASF565:
	.string	"tan_approx(x) tanf(x)"
.LASF599:
	.string	"sizetype"
.LASF304:
	.string	"__GLIBC__ 2"
.LASF256:
	.string	"__USE_ISOC11"
.LASF588:
	.string	"long unsigned int"
.LASF638:
	.string	"sinx"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF642:
	.string	"sinz"
.LASF238:
	.string	"__unix 1"
.LASF560:
	.string	"ABS(x) ((x) > 0 ? (x) : -(x))"
.LASF648:
	.string	"v_tmp"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF593:
	.string	"m_newM"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF508:
	.string	"__MATH_DECLARE_LDOUBLE 1"
.LASF292:
	.string	"__USE_POSIX2 1"
.LASF609:
	.string	"atan2f"
.LASF595:
	.string	"m_newS"
.LASF483:
	.string	"__MATHDECL_VEC(type,function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHDECL(type, function,suffix, args)"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF569:
	.string	"sinPolyCoef9 2.600054768e-6f"
.LASF338:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF495:
	.string	"_Mdouble_BEGIN_NAMESPACE"
.LASF517:
	.string	"fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)"
.LASF314:
	.string	"__P(args) args"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF268:
	.string	"__USE_XOPEN2KXSI"
.LASF340:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF525:
	.string	"math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)"
.LASF225:
	.string	"__k8 1"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF358:
	.string	"__restrict_arr __restrict"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF347:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF585:
	.string	"unsigned char"
.LASF397:
	.string	"INT32_MAX (2147483647)"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF433:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF424:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF515:
	.string	"FP_SUBNORMAL 3"
.LASF636:
	.string	"matrix"
.LASF231:
	.string	"__FXSR__ 1"
.LASF310:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF288:
	.string	"_POSIX_SOURCE 1"
.LASF574:
	.string	"atanPolyCoef5 0.05030176425872175f"
.LASF498:
	.string	"__MATH_DECLARING_DOUBLE"
.LASF552:
	.string	"isunordered(u,v) __builtin_isunordered(u, v)"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF537:
	.string	"M_LN2 0.69314718055994530942"
.LASF226:
	.string	"__k8__ 1"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF265:
	.string	"__USE_XOPEN_EXTENDED"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF415:
	.string	"INT_FAST8_MIN (-128)"
.LASF272:
	.string	"__USE_LARGEFILE64"
.LASF578:
	.string	"QMF_SWAP(a,b) { int32_t temp=(a);(a)=(b);(b)=temp; }"
.LASF503:
	.string	"_Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99"
.LASF513:
	.string	"FP_INFINITE 1"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF349:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF414:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF321:
	.string	"__END_DECLS "
.LASF538:
	.string	"M_LN10 2.30258509299404568402"
.LASF488:
	.string	"__MATHDECL_1(type,function,suffix,args) extern type __MATH_PRECNAME(function,suffix) args __THROW"
.LASF270:
	.string	"__USE_XOPEN2K8XSI"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF431:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF416:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF271:
	.string	"__USE_LARGEFILE"
.LASF592:
	.string	"m_oldM"
.LASF423:
	.string	"UINT_FAST8_MAX (255)"
.LASF580:
	.string	"signed char"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF635:
	.string	"delta"
.LASF509:
	.string	"__MATHDECL_1"
.LASF572:
	.string	"atanPolyCoef3 0.14744007058297684f"
.LASF586:
	.string	"short unsigned int"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF229:
	.string	"__SSE__ 1"
.LASF332:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF556:
	.string	"M_PIf 3.14159265358979323846f"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF604:
	.string	"angles"
.LASF446:
	.string	"UINT8_C(c) c"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF612:
	.string	"acosf"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF571:
	.string	"atanPolyCoef2 0.99997356613987f"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF590:
	.string	"double"
.LASF566:
	.string	"sinPolyCoef3 -1.666665710e-1f"
.LASF543:
	.string	"M_2_PI 0.63661977236758134308"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF337:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF217:
	.string	"__amd64 1"
.LASF546:
	.string	"M_SQRT1_2 0.70710678118654752440"
.LASF236:
	.string	"__linux__ 1"
.LASF362:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF516:
	.string	"FP_NORMAL 4"
.LASF417:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF287:
	.string	"_POSIX_SOURCE"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF398:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF461:
	.string	"__DECL_SIMD_sincos "
.LASF624:
	.string	"degreesToRadians"
.LASF269:
	.string	"__USE_XOPEN2K8"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF477:
	.string	"NAN (__builtin_nanf (\"\"))"
.LASF480:
	.string	"FP_ILOGBNAN (-2147483647 - 1)"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF499:
	.string	"_Mfloat_ float"
.LASF260:
	.string	"__USE_POSIX"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF405:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF363:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF464:
	.string	"__DECL_SIMD_log "
.LASF378:
	.string	"__stub_lchmod "
.LASF432:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF620:
	.string	"devClear"
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
