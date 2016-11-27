	.file	"maths.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed maths.i -mtune=generic -march=x86-64 -g
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
	.long	0xef5
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF77
	.byte	0xc
	.long	.LASF78
	.long	.LASF79
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x25
	.long	0x3b
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x5
	.byte	0x4
	.long	0x69
	.byte	0x5
	.byte	0x14
	.long	0xa5
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
	.long	.LASF17
	.byte	0x14
	.byte	0x3
	.byte	0x25
	.long	0xee
	.uleb128 0x8
	.long	.LASF12
	.byte	0x3
	.byte	0x27
	.long	0x77
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.byte	0x3
	.byte	0x27
	.long	0x77
	.byte	0x4
	.uleb128 0x8
	.long	.LASF14
	.byte	0x3
	.byte	0x27
	.long	0x77
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x3
	.byte	0x27
	.long	0x77
	.byte	0xc
	.uleb128 0x9
	.string	"m_n"
	.byte	0x3
	.byte	0x28
	.long	0x4d
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0x29
	.long	0xa5
	.uleb128 0x7
	.long	.LASF18
	.byte	0xc
	.byte	0x3
	.byte	0x2c
	.long	0x124
	.uleb128 0x9
	.string	"X"
	.byte	0x3
	.byte	0x2d
	.long	0x77
	.byte	0
	.uleb128 0x9
	.string	"Y"
	.byte	0x3
	.byte	0x2e
	.long	0x77
	.byte	0x4
	.uleb128 0x9
	.string	"Z"
	.byte	0x3
	.byte	0x2f
	.long	0x77
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.long	0x77
	.long	0x134
	.uleb128 0xb
	.long	0x134
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF19
	.uleb128 0x7
	.long	.LASF20
	.byte	0xc
	.byte	0x3
	.byte	0x39
	.long	0x16c
	.uleb128 0x8
	.long	.LASF21
	.byte	0x3
	.byte	0x3a
	.long	0x77
	.byte	0
	.uleb128 0x8
	.long	.LASF22
	.byte	0x3
	.byte	0x3b
	.long	0x77
	.byte	0x4
	.uleb128 0x9
	.string	"yaw"
	.byte	0x3
	.byte	0x3c
	.long	0x77
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF23
	.byte	0x3
	.byte	0x3d
	.long	0x13b
	.uleb128 0xc
	.byte	0xc
	.byte	0x3
	.byte	0x3f
	.long	0x196
	.uleb128 0xd
	.string	"raw"
	.byte	0x3
	.byte	0x40
	.long	0x124
	.uleb128 0xe
	.long	.LASF24
	.byte	0x3
	.byte	0x41
	.long	0x16c
	.byte	0
	.uleb128 0x3
	.long	.LASF25
	.byte	0x3
	.byte	0x42
	.long	0x177
	.uleb128 0xf
	.long	.LASF27
	.byte	0x4
	.byte	0x41
	.long	0x77
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ea
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x2b
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.long	.LASF26
	.byte	0x1
	.byte	0x2d
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"x2"
	.byte	0x1
	.byte	0x33
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.long	.LASF28
	.byte	0x4
	.byte	0x3f
	.long	0x77
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x218
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x37
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.long	.LASF29
	.byte	0x4
	.byte	0x3c
	.long	0x77
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x27c
	.uleb128 0x10
	.string	"y"
	.byte	0x1
	.byte	0x40
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x40
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.string	"res"
	.byte	0x1
	.byte	0x4a
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.long	.LASF30
	.byte	0x1
	.byte	0x4a
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF31
	.byte	0x1
	.byte	0x4a
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.long	.LASF32
	.byte	0x4
	.byte	0x36
	.long	0x77
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c5
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x5b
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.string	"xa"
	.byte	0x1
	.byte	0x5d
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF33
	.byte	0x1
	.byte	0x5e
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.long	.LASF34
	.byte	0x1
	.byte	0x66
	.long	0x42
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x303
	.uleb128 0x14
	.long	.LASF35
	.byte	0x1
	.byte	0x66
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.long	.LASF36
	.byte	0x1
	.byte	0x66
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.long	.LASF37
	.byte	0x1
	.byte	0x72
	.long	0x4d
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x34f
	.uleb128 0x10
	.string	"amt"
	.byte	0x1
	.byte	0x72
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.string	"low"
	.byte	0x1
	.byte	0x72
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF38
	.byte	0x1
	.byte	0x72
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xf
	.long	.LASF39
	.byte	0x1
	.byte	0x7c
	.long	0x77
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x39b
	.uleb128 0x10
	.string	"amt"
	.byte	0x1
	.byte	0x7c
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.string	"low"
	.byte	0x1
	.byte	0x7c
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF38
	.byte	0x1
	.byte	0x7c
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x15
	.long	.LASF40
	.byte	0x1
	.byte	0x86
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c7
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x86
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0xee
	.uleb128 0x15
	.long	.LASF41
	.byte	0x1
	.byte	0x8b
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x405
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x8b
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x8b
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xf
	.long	.LASF42
	.byte	0x1
	.byte	0x99
	.long	0x77
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x435
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x99
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x13
	.long	.LASF43
	.byte	0x1
	.byte	0x9e
	.long	0x77
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x465
	.uleb128 0x10
	.string	"dev"
	.byte	0x1
	.byte	0x9e
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.long	.LASF44
	.byte	0x1
	.byte	0xa3
	.long	0x77
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x495
	.uleb128 0x14
	.long	.LASF45
	.byte	0x1
	.byte	0xa3
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.long	.LASF46
	.byte	0x1
	.byte	0xa8
	.long	0x4d
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x513
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0xa8
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.long	.LASF47
	.byte	0x1
	.byte	0xa8
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.long	.LASF48
	.byte	0x1
	.byte	0xa8
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.long	.LASF49
	.byte	0x1
	.byte	0xa8
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.long	.LASF50
	.byte	0x1
	.byte	0xa8
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x12
	.string	"a"
	.byte	0x1
	.byte	0xaa
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.string	"b"
	.byte	0x1
	.byte	0xab
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	.LASF51
	.byte	0x1
	.byte	0xb0
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x55b
	.uleb128 0x10
	.string	"src"
	.byte	0x1
	.byte	0xb0
	.long	0x55b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.long	.LASF52
	.byte	0x1
	.byte	0xb0
	.long	0x55b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF53
	.byte	0x1
	.byte	0xb2
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0xf9
	.uleb128 0x17
	.long	.LASF54
	.byte	0x1
	.byte	0xbc
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x629
	.uleb128 0x14
	.long	.LASF55
	.byte	0x1
	.byte	0xbc
	.long	0x629
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x14
	.long	.LASF56
	.byte	0x1
	.byte	0xbc
	.long	0x62f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x11
	.long	.LASF57
	.byte	0x1
	.byte	0xbe
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.long	.LASF58
	.byte	0x1
	.byte	0xbe
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x11
	.long	.LASF59
	.byte	0x1
	.byte	0xbe
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF60
	.byte	0x1
	.byte	0xbe
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.long	.LASF61
	.byte	0x1
	.byte	0xbe
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.long	.LASF62
	.byte	0x1
	.byte	0xbe
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.long	.LASF63
	.byte	0x1
	.byte	0xbf
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.long	.LASF64
	.byte	0x1
	.byte	0xbf
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.long	.LASF65
	.byte	0x1
	.byte	0xbf
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF66
	.byte	0x1
	.byte	0xbf
	.long	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0x196
	.uleb128 0x16
	.byte	0x8
	.long	0x124
	.uleb128 0x17
	.long	.LASF67
	.byte	0x1
	.byte	0xd9
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x68c
	.uleb128 0x10
	.string	"v"
	.byte	0x1
	.byte	0xd9
	.long	0x55b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x14
	.long	.LASF55
	.byte	0x1
	.byte	0xd9
	.long	0x629
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x11
	.long	.LASF68
	.byte	0x1
	.byte	0xdb
	.long	0xf9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x11
	.long	.LASF56
	.byte	0x1
	.byte	0xdd
	.long	0x68c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0xa
	.long	0x77
	.long	0x6a2
	.uleb128 0xb
	.long	0x134
	.byte	0x2
	.uleb128 0xb
	.long	0x134
	.byte	0x2
	.byte	0
	.uleb128 0x13
	.long	.LASF69
	.byte	0x1
	.byte	0xed
	.long	0x42
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x767
	.uleb128 0x10
	.string	"v"
	.byte	0x1
	.byte	0xed
	.long	0x767
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x12
	.string	"p"
	.byte	0x1
	.byte	0xef
	.long	0x76d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x6fe
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0xf0
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x18
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x722
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xf2
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x18
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x746
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xf2
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x19
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xf2
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x8
	.long	0x42
	.uleb128 0xa
	.long	0x42
	.long	0x77d
	.uleb128 0xb
	.long	0x134
	.byte	0x2
	.byte	0
	.uleb128 0x13
	.long	.LASF71
	.byte	0x1
	.byte	0xf6
	.long	0x42
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d6
	.uleb128 0x10
	.string	"v"
	.byte	0x1
	.byte	0xf6
	.long	0x767
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x12
	.string	"p"
	.byte	0x1
	.byte	0xf8
	.long	0x8d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x7da
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0xf9
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x18
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x7ff
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xfb
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x18
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x824
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xfb
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x18
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x849
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xfb
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x18
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x86d
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xfc
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x18
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x891
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xfc
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x18
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x8b5
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xfc
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x19
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0xfd
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x42
	.long	0x8e6
	.uleb128 0xb
	.long	0x134
	.byte	0x4
	.byte	0
	.uleb128 0x1a
	.long	.LASF72
	.byte	0x1
	.value	0x101
	.long	0x42
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xb32
	.uleb128 0x1b
	.string	"v"
	.byte	0x1
	.value	0x101
	.long	0x767
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x103
	.long	0xb32
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x947
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x104
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x18
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.long	0x96d
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x106
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.uleb128 0x18
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x993
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x106
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x18
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.long	0x9b9
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x106
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.uleb128 0x18
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.long	0x9df
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x107
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x18
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0xa05
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x107
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x18
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0xa2b
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x107
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x18
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0xa51
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x108
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.uleb128 0x18
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.long	0xa77
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x108
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x18
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0xa9d
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x108
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0x18
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.long	0xac3
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x109
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x18
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.long	0xae9
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x109
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x18
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.long	0xb0f
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x109
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x19
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x10a
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x42
	.long	0xb42
	.uleb128 0xb
	.long	0x134
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.long	.LASF73
	.byte	0x1
	.value	0x10e
	.long	0x42
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xe72
	.uleb128 0x1b
	.string	"v"
	.byte	0x1
	.value	0x10e
	.long	0x767
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x110
	.long	0xe72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0xba3
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x111
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.uleb128 0x18
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.long	0xbc9
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x113
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.byte	0
	.uleb128 0x18
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.long	0xbef
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x113
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.uleb128 0x18
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0xc15
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x113
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.byte	0
	.uleb128 0x18
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.long	0xc3b
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x114
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x18
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0xc61
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x114
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.byte	0
	.uleb128 0x18
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0xc87
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x114
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x18
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.long	0xcad
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x115
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.uleb128 0x18
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.long	0xcd3
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x115
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x18
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0xcf9
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x115
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.uleb128 0x18
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.long	0xd1f
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x116
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x18
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.long	0xd45
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x116
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x18
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.long	0xd6b
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x116
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x18
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.long	0xd91
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x117
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.uleb128 0x18
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.long	0xdb7
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x117
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x18
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.long	0xddd
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x117
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0x18
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.long	0xe03
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x118
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x18
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.long	0xe29
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x118
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x18
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.long	0xe4f
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x118
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x19
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.uleb128 0x1d
	.long	.LASF70
	.byte	0x1
	.value	0x119
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x42
	.long	0xe82
	.uleb128 0xb
	.long	0x134
	.byte	0x8
	.byte	0
	.uleb128 0x1e
	.long	.LASF80
	.byte	0x1
	.value	0x11d
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.long	.LASF52
	.byte	0x1
	.value	0x11d
	.long	0x767
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF74
	.byte	0x1
	.value	0x11d
	.long	0x767
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF75
	.byte	0x1
	.value	0x11d
	.long	0x767
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.long	.LASF76
	.byte	0x1
	.value	0x11d
	.long	0x4d
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
	.long	0x4d
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF33:
	.string	"result"
.LASF17:
	.string	"stdev_s"
.LASF16:
	.string	"stdev_t"
.LASF52:
	.string	"dest"
.LASF70:
	.string	"temp"
.LASF1:
	.string	"short int"
.LASF19:
	.string	"sizetype"
.LASF26:
	.string	"xint"
.LASF55:
	.string	"delta"
.LASF12:
	.string	"m_oldM"
.LASF14:
	.string	"m_oldS"
.LASF64:
	.string	"sinzcosx"
.LASF35:
	.string	"value"
.LASF18:
	.string	"fp_vector"
.LASF34:
	.string	"applyDeadband"
.LASF42:
	.string	"devVariance"
.LASF46:
	.string	"scaleRange"
.LASF27:
	.string	"sinf"
.LASF67:
	.string	"rotateV"
.LASF9:
	.string	"float"
.LASF51:
	.string	"normalizeV"
.LASF77:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF4:
	.string	"long int"
.LASF38:
	.string	"high"
.LASF63:
	.string	"coszcosx"
.LASF57:
	.string	"cosx"
.LASF75:
	.string	"array2"
.LASF62:
	.string	"sinz"
.LASF43:
	.string	"devStandardDeviation"
.LASF23:
	.string	"fp_angles_def"
.LASF53:
	.string	"length"
.LASF45:
	.string	"degrees"
.LASF5:
	.string	"unsigned char"
.LASF29:
	.string	"atan2f"
.LASF30:
	.string	"absX"
.LASF31:
	.string	"absY"
.LASF0:
	.string	"signed char"
.LASF44:
	.string	"degreesToRadians"
.LASF80:
	.string	"arraySubInt32"
.LASF7:
	.string	"unsigned int"
.LASF25:
	.string	"fp_angles_t"
.LASF28:
	.string	"cosf"
.LASF21:
	.string	"roll"
.LASF6:
	.string	"short unsigned int"
.LASF48:
	.string	"srcMax"
.LASF11:
	.string	"char"
.LASF3:
	.string	"int32_t"
.LASF59:
	.string	"cosy"
.LASF61:
	.string	"cosz"
.LASF58:
	.string	"sinx"
.LASF60:
	.string	"siny"
.LASF79:
	.string	"/home/aravind/git/cleanflight"
.LASF40:
	.string	"devClear"
.LASF66:
	.string	"sinzsinx"
.LASF47:
	.string	"srcMin"
.LASF39:
	.string	"constrainf"
.LASF8:
	.string	"long unsigned int"
.LASF68:
	.string	"v_tmp"
.LASF10:
	.string	"double"
.LASF41:
	.string	"devPush"
.LASF49:
	.string	"destMin"
.LASF13:
	.string	"m_newM"
.LASF15:
	.string	"m_newS"
.LASF37:
	.string	"constrain"
.LASF76:
	.string	"count"
.LASF20:
	.string	"fp_angles"
.LASF69:
	.string	"quickMedianFilter3"
.LASF71:
	.string	"quickMedianFilter5"
.LASF74:
	.string	"array1"
.LASF72:
	.string	"quickMedianFilter7"
.LASF73:
	.string	"quickMedianFilter9"
.LASF2:
	.string	"int16_t"
.LASF65:
	.string	"coszsinx"
.LASF50:
	.string	"destMax"
.LASF54:
	.string	"buildRotationMatrix"
.LASF78:
	.string	"src/main/common/maths.c"
.LASF22:
	.string	"pitch"
.LASF24:
	.string	"angles"
.LASF56:
	.string	"matrix"
.LASF32:
	.string	"acosf"
.LASF36:
	.string	"deadband"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
