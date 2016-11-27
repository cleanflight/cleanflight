	.file	"typeconversion.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed typeconversion.i -mtune=generic
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
	.section	.text.uli2a,"ax",@progbits
	.globl	uli2a
	.type	uli2a, @function
uli2a:
.LFB0:
	.file 1 "src/main/common/typeconversion.c"
	.loc 1 26 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# num, num
	movl	%esi, -28(%rbp)	# base, base
	movl	%edx, -32(%rbp)	# uc, uc
	movq	%rcx, -40(%rbp)	# bf, bf
	.loc 1 27 0
	movl	$0, -12(%rbp)	#, n
	.loc 1 28 0
	movl	$1, -8(%rbp)	#, d
	.loc 1 29 0
	jmp	.L2	#
.L3:
	.loc 1 30 0
	movl	-8(%rbp), %eax	# d, tmp99
	imull	-28(%rbp), %eax	# base, tmp98
	movl	%eax, -8(%rbp)	# tmp98, d
.L2:
	.loc 1 29 0
	movl	-8(%rbp), %esi	# d, D.3430
	movq	-24(%rbp), %rax	# num, tmp102
	movl	$0, %edx	#, tmp101
	divq	%rsi	# D.3430
	movq	%rax, %rdx	# tmp100, D.3430
	movl	-28(%rbp), %eax	# base, D.3430
	cmpq	%rax, %rdx	# D.3430, D.3430
	jnb	.L3	#,
	.loc 1 31 0
	jmp	.L4	#
.L10:
.LBB2:
	.loc 1 32 0
	movl	-8(%rbp), %edi	# d, D.3430
	movq	-24(%rbp), %rax	# num, tmp105
	movl	$0, %edx	#, tmp104
	divq	%rdi	# D.3430
	movl	%eax, -4(%rbp)	# D.3430, dgt
	.loc 1 33 0
	movl	-8(%rbp), %ecx	# d, D.3430
	movq	-24(%rbp), %rax	# num, tmp107
	movl	$0, %edx	#, tmp108
	divq	%rcx	# D.3430
	movq	%rdx, -24(%rbp)	# tmp108, num
	.loc 1 34 0
	movl	-8(%rbp), %eax	# d, tmp113
	movl	$0, %edx	#, tmp112
	divl	-28(%rbp)	# base
	movl	%eax, -8(%rbp)	# tmp111, d
	.loc 1 35 0
	cmpl	$0, -12(%rbp)	#, n
	jne	.L5	#,
	.loc 1 35 0 is_stmt 0 discriminator 1
	cmpl	$0, -4(%rbp)	#, dgt
	jg	.L5	#,
	.loc 1 35 0 discriminator 2
	cmpl	$0, -8(%rbp)	#, d
	jne	.L4	#,
.L5:
	.loc 1 36 0 is_stmt 1
	movq	-40(%rbp), %rax	# bf, D.3431
	leaq	1(%rax), %rdx	#, tmp114
	movq	%rdx, -40(%rbp)	# tmp114, bf
	cmpl	$9, -4(%rbp)	#, dgt
	jle	.L6	#,
	.loc 1 36 0 is_stmt 0 discriminator 1
	cmpl	$0, -32(%rbp)	#, uc
	je	.L7	#,
	.loc 1 36 0 discriminator 3
	movl	$55, %edx	#, D.3429
	jmp	.L9	#
.L7:
	.loc 1 36 0 discriminator 4
	movl	$87, %edx	#, D.3429
	jmp	.L9	#
.L6:
	.loc 1 36 0 discriminator 2
	movl	$48, %edx	#, D.3429
.L9:
	.loc 1 36 0 discriminator 8
	movl	-4(%rbp), %ecx	# dgt, tmp115
	addl	%ecx, %edx	# D.3429, D.3429
	movb	%dl, (%rax)	# D.3432, *_25
	.loc 1 37 0 is_stmt 1 discriminator 8
	addl	$1, -12(%rbp)	#, n
.L4:
.LBE2:
	.loc 1 31 0
	cmpl	$0, -8(%rbp)	#, d
	jne	.L10	#,
	.loc 1 40 0
	movq	-40(%rbp), %rax	# bf, tmp116
	movb	$0, (%rax)	#, *bf_2
	.loc 1 41 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	uli2a, .-uli2a
	.section	.text.li2a,"ax",@progbits
	.globl	li2a
	.type	li2a, @function
li2a:
.LFB1:
	.loc 1 44 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# num, num
	movq	%rsi, -16(%rbp)	# bf, bf
	.loc 1 45 0
	cmpq	$0, -8(%rbp)	#, num
	jns	.L12	#,
	.loc 1 46 0
	negq	-8(%rbp)	# num
	.loc 1 47 0
	movq	-16(%rbp), %rax	# bf, D.3435
	leaq	1(%rax), %rdx	#, tmp89
	movq	%rdx, -16(%rbp)	# tmp89, bf
	movb	$45, (%rax)	#, *_8
.L12:
	.loc 1 49 0
	movq	-8(%rbp), %rax	# num, D.3436
	movq	-16(%rbp), %rdx	# bf, tmp90
	movq	%rdx, %rcx	# tmp90,
	movl	$0, %edx	#,
	movl	$10, %esi	#,
	movq	%rax, %rdi	# D.3436,
	call	uli2a	#
	.loc 1 50 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	li2a, .-li2a
	.section	.text.ui2a,"ax",@progbits
	.globl	ui2a
	.type	ui2a, @function
ui2a:
.LFB2:
	.loc 1 55 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# num, num
	movl	%esi, -24(%rbp)	# base, base
	movl	%edx, -28(%rbp)	# uc, uc
	movq	%rcx, -40(%rbp)	# bf, bf
	.loc 1 56 0
	movl	$0, -12(%rbp)	#, n
	.loc 1 57 0
	movl	$1, -8(%rbp)	#, d
	.loc 1 58 0
	jmp	.L14	#
.L15:
	.loc 1 59 0
	movl	-8(%rbp), %eax	# d, tmp95
	imull	-24(%rbp), %eax	# base, tmp94
	movl	%eax, -8(%rbp)	# tmp94, d
.L14:
	.loc 1 58 0
	movl	-20(%rbp), %eax	# num, tmp98
	movl	$0, %edx	#, tmp97
	divl	-8(%rbp)	# d
	cmpl	-24(%rbp), %eax	# base, D.3438
	jnb	.L15	#,
	.loc 1 60 0
	jmp	.L16	#
.L22:
.LBB3:
	.loc 1 61 0
	movl	-20(%rbp), %eax	# num, tmp101
	movl	$0, %edx	#, tmp100
	divl	-8(%rbp)	# d
	movl	%eax, -4(%rbp)	# D.3438, dgt
	.loc 1 62 0
	movl	-20(%rbp), %eax	# num, tmp103
	movl	$0, %edx	#, tmp104
	divl	-8(%rbp)	# d
	movl	%edx, -20(%rbp)	# tmp104, num
	.loc 1 63 0
	movl	-8(%rbp), %eax	# d, tmp109
	movl	$0, %edx	#, tmp108
	divl	-24(%rbp)	# base
	movl	%eax, -8(%rbp)	# tmp107, d
	.loc 1 64 0
	cmpl	$0, -12(%rbp)	#, n
	jne	.L17	#,
	.loc 1 64 0 is_stmt 0 discriminator 1
	cmpl	$0, -4(%rbp)	#, dgt
	jg	.L17	#,
	.loc 1 64 0 discriminator 2
	cmpl	$0, -8(%rbp)	#, d
	jne	.L16	#,
.L17:
	.loc 1 65 0 is_stmt 1
	movq	-40(%rbp), %rax	# bf, D.3439
	leaq	1(%rax), %rdx	#, tmp110
	movq	%rdx, -40(%rbp)	# tmp110, bf
	cmpl	$9, -4(%rbp)	#, dgt
	jle	.L18	#,
	.loc 1 65 0 is_stmt 0 discriminator 1
	cmpl	$0, -28(%rbp)	#, uc
	je	.L19	#,
	.loc 1 65 0 discriminator 3
	movl	$55, %edx	#, D.3437
	jmp	.L21	#
.L19:
	.loc 1 65 0 discriminator 4
	movl	$87, %edx	#, D.3437
	jmp	.L21	#
.L18:
	.loc 1 65 0 discriminator 2
	movl	$48, %edx	#, D.3437
.L21:
	.loc 1 65 0 discriminator 8
	movl	-4(%rbp), %ecx	# dgt, tmp111
	addl	%ecx, %edx	# D.3437, D.3437
	movb	%dl, (%rax)	# D.3440, *_21
	.loc 1 66 0 is_stmt 1 discriminator 8
	addl	$1, -12(%rbp)	#, n
.L16:
.LBE3:
	.loc 1 60 0
	cmpl	$0, -8(%rbp)	#, d
	jne	.L22	#,
	.loc 1 69 0
	movq	-40(%rbp), %rax	# bf, tmp112
	movb	$0, (%rax)	#, *bf_2
	.loc 1 70 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	ui2a, .-ui2a
	.section	.text.i2a,"ax",@progbits
	.globl	i2a
	.type	i2a, @function
i2a:
.LFB3:
	.loc 1 73 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# num, num
	movq	%rsi, -16(%rbp)	# bf, bf
	.loc 1 74 0
	cmpl	$0, -4(%rbp)	#, num
	jns	.L24	#,
	.loc 1 75 0
	negl	-4(%rbp)	# num
	.loc 1 76 0
	movq	-16(%rbp), %rax	# bf, D.3441
	leaq	1(%rax), %rdx	#, tmp89
	movq	%rdx, -16(%rbp)	# tmp89, bf
	movb	$45, (%rax)	#, *_8
.L24:
	.loc 1 78 0
	movl	-4(%rbp), %eax	# num, D.3442
	movq	-16(%rbp), %rdx	# bf, tmp90
	movq	%rdx, %rcx	# tmp90,
	movl	$0, %edx	#,
	movl	$10, %esi	#,
	movl	%eax, %edi	# D.3442,
	call	ui2a	#
	.loc 1 79 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	i2a, .-i2a
	.section	.text.a2d,"ax",@progbits
	.globl	a2d
	.type	a2d, @function
a2d:
.LFB4:
	.loc 1 82 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# ch, tmp92
	movb	%al, -4(%rbp)	# tmp92, ch
	.loc 1 83 0
	cmpb	$47, -4(%rbp)	#, ch
	jle	.L26	#,
	.loc 1 83 0 is_stmt 0 discriminator 1
	cmpb	$57, -4(%rbp)	#, ch
	jg	.L26	#,
	.loc 1 84 0 is_stmt 1
	movsbl	-4(%rbp), %eax	# ch, D.3443
	subl	$48, %eax	#, D.3443
	jmp	.L27	#
.L26:
	.loc 1 85 0
	cmpb	$96, -4(%rbp)	#, ch
	jle	.L28	#,
	.loc 1 85 0 is_stmt 0 discriminator 1
	cmpb	$102, -4(%rbp)	#, ch
	jg	.L28	#,
	.loc 1 86 0 is_stmt 1
	movsbl	-4(%rbp), %eax	# ch, D.3443
	subl	$87, %eax	#, D.3443
	jmp	.L27	#
.L28:
	.loc 1 87 0
	cmpb	$64, -4(%rbp)	#, ch
	jle	.L29	#,
	.loc 1 87 0 is_stmt 0 discriminator 1
	cmpb	$70, -4(%rbp)	#, ch
	jg	.L29	#,
	.loc 1 88 0 is_stmt 1
	movsbl	-4(%rbp), %eax	# ch, D.3443
	subl	$55, %eax	#, D.3443
	jmp	.L27	#
.L29:
	.loc 1 90 0
	movl	$-1, %eax	#, D.3443
.L27:
	.loc 1 91 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	a2d, .-a2d
	.section	.text.a2i,"ax",@progbits
	.globl	a2i
	.type	a2i, @function
a2i:
.LFB5:
	.loc 1 94 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$40, %rsp	#,
	movl	%edi, %eax	# ch, tmp92
	movq	%rsi, -32(%rbp)	# src, src
	movl	%edx, -24(%rbp)	# base, base
	movq	%rcx, -40(%rbp)	# nump, nump
	movb	%al, -20(%rbp)	# tmp92, ch
	.loc 1 95 0
	movq	-32(%rbp), %rax	# src, tmp93
	movq	(%rax), %rax	# *src_6(D), tmp94
	movq	%rax, -8(%rbp)	# tmp94, p
	.loc 1 96 0
	movl	$0, -16(%rbp)	#, num
	.loc 1 98 0
	jmp	.L31	#
.L34:
	.loc 1 99 0
	movl	-12(%rbp), %eax	# digit, tmp95
	cmpl	-24(%rbp), %eax	# base, tmp95
	jg	.L36	#,
	.loc 1 101 0
	movl	-16(%rbp), %eax	# num, tmp96
	imull	-24(%rbp), %eax	# base, D.3444
	movl	%eax, %edx	# D.3444, D.3444
	movl	-12(%rbp), %eax	# digit, tmp100
	addl	%edx, %eax	# D.3444, tmp99
	movl	%eax, -16(%rbp)	# tmp99, num
	.loc 1 102 0
	movq	-8(%rbp), %rax	# p, D.3445
	leaq	1(%rax), %rdx	#, tmp101
	movq	%rdx, -8(%rbp)	# tmp101, p
	movzbl	(%rax), %eax	# *_16, tmp102
	movb	%al, -20(%rbp)	# tmp102, ch
.L31:
	.loc 1 98 0
	movsbl	-20(%rbp), %eax	# ch, D.3444
	movl	%eax, %edi	# D.3444,
	call	a2d	#
	movl	%eax, -12(%rbp)	# tmp103, digit
	cmpl	$0, -12(%rbp)	#, digit
	jns	.L34	#,
	jmp	.L33	#
.L36:
	.loc 1 100 0
	nop
.L33:
	.loc 1 104 0
	movq	-32(%rbp), %rax	# src, tmp104
	movq	-8(%rbp), %rdx	# p, tmp105
	movq	%rdx, (%rax)	# tmp105, *src_6(D)
	.loc 1 105 0
	movq	-40(%rbp), %rax	# nump, tmp106
	movl	-16(%rbp), %edx	# num, tmp107
	movl	%edx, (%rax)	# tmp107, *nump_20(D)
	.loc 1 106 0
	movzbl	-20(%rbp), %eax	# ch, D.3446
	.loc 1 107 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	a2i, .-a2i
	.section	.rodata
	.align 8
.LC0:
	.string	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.section	.text._i2a,"ax",@progbits
	.type	_i2a, @function
_i2a:
.LFB6:
	.loc 1 126 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# i, i
	movq	%rsi, -16(%rbp)	# a, a
	movl	%edx, -8(%rbp)	# base, base
	.loc 1 127 0
	movl	-4(%rbp), %eax	# i, tmp95
	movl	$0, %edx	#, tmp94
	divl	-8(%rbp)	# base
	testl	%eax, %eax	# D.3447
	je	.L38	#,
	.loc 1 128 0
	movl	-4(%rbp), %eax	# i, tmp98
	movl	$0, %edx	#, tmp97
	divl	-8(%rbp)	# base
	movl	%eax, %ecx	# tmp96, D.3447
	movl	-8(%rbp), %edx	# base, tmp99
	movq	-16(%rbp), %rax	# a, tmp100
	movq	%rax, %rsi	# tmp100,
	movl	%ecx, %edi	# D.3447,
	call	_i2a	#
	movq	%rax, -16(%rbp)	# tmp101, a
.L38:
	.loc 1 129 0
	movl	-4(%rbp), %eax	# i, tmp102
	movl	$0, %edx	#, tmp103
	divl	-8(%rbp)	# base
	movl	%edx, %eax	# tmp103, D.3447
	movl	%eax, %eax	# D.3447, tmp105
	movzbl	.LC0(%rax), %edx	#, D.3448
	movq	-16(%rbp), %rax	# a, tmp106
	movb	%dl, (%rax)	# D.3448, *a_1
	.loc 1 130 0
	movq	-16(%rbp), %rax	# a, tmp107
	addq	$1, %rax	#, D.3449
	.loc 1 131 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_i2a, .-_i2a
	.section	.text.itoa,"ax",@progbits
	.globl	itoa
	.type	itoa, @function
itoa:
.LFB7:
	.loc 1 134 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# i, i
	movq	%rsi, -16(%rbp)	# a, a
	movl	%edx, -8(%rbp)	# base, base
	.loc 1 135 0
	cmpl	$1, -8(%rbp)	#, base
	jle	.L41	#,
	.loc 1 135 0 is_stmt 0 discriminator 1
	cmpl	$36, -8(%rbp)	#, base
	jle	.L42	#,
.L41:
	.loc 1 136 0 is_stmt 1
	movl	$10, -8(%rbp)	#, base
.L42:
	.loc 1 137 0
	cmpl	$0, -4(%rbp)	#, i
	jns	.L43	#,
	.loc 1 138 0
	movq	-16(%rbp), %rax	# a, tmp97
	movb	$45, (%rax)	#, *a_7(D)
	.loc 1 139 0
	movl	-8(%rbp), %eax	# base, D.3451
	movq	-16(%rbp), %rdx	# a, tmp98
	leaq	1(%rdx), %rsi	#, D.3452
	movl	-4(%rbp), %edx	# i, D.3451
	movl	%edx, %ecx	# D.3451, D.3451
	negl	%ecx	# D.3451
	movl	%eax, %edx	# D.3451,
	movl	%ecx, %edi	# D.3451,
	call	_i2a	#
	movb	$0, (%rax)	#, *_14
	jmp	.L44	#
.L43:
	.loc 1 141 0
	movl	-8(%rbp), %edx	# base, D.3451
	movl	-4(%rbp), %eax	# i, D.3451
	movq	-16(%rbp), %rcx	# a, tmp99
	movq	%rcx, %rsi	# tmp99,
	movl	%eax, %edi	# D.3451,
	call	_i2a	#
	movb	$0, (%rax)	#, *_19
.L44:
	.loc 1 142 0
	movq	-16(%rbp), %rax	# a, D.3452
	.loc 1 143 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	itoa, .-itoa
	.section	.rodata
.LC1:
	.string	"."
	.section	.text.ftoa,"ax",@progbits
	.globl	ftoa
	.type	ftoa, @function
ftoa:
.LFB8:
	.loc 1 148 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movss	%xmm0, -68(%rbp)	# x, x
	movq	%rdi, -80(%rbp)	# floatString, floatString
	.loc 1 148 0
	movq	%fs:40, %rax	#, tmp136
	movq	%rax, -8(%rbp)	# tmp136, D.3459
	xorl	%eax, %eax	# tmp136
	.loc 1 151 0
	movq	$0, -32(%rbp)	#, intString2
	movl	$0, -24(%rbp)	#, intString2
	.loc 1 152 0
	movq	$.LC1, -56(%rbp)	#, decimalPoint
	.loc 1 155 0
	movss	-68(%rbp), %xmm0	# x, tmp101
	pxor	%xmm1, %xmm1	# tmp102
	ucomiss	%xmm1, %xmm0	# tmp102, tmp101
	jbe	.L59	#,
	.loc 1 156 0
	movss	-68(%rbp), %xmm1	# x, tmp104
	movss	.LC3(%rip), %xmm0	#, tmp105
	addss	%xmm1, %xmm0	# tmp104, tmp103
	movss	%xmm0, -68(%rbp)	# tmp103, x
	jmp	.L49	#
.L59:
	.loc 1 158 0
	movss	-68(%rbp), %xmm0	# x, tmp107
	movss	.LC3(%rip), %xmm1	#, tmp108
	subss	%xmm1, %xmm0	# tmp108, tmp106
	movss	%xmm0, -68(%rbp)	# tmp106, x
.L49:
	.loc 1 160 0
	movss	-68(%rbp), %xmm1	# x, tmp109
	movss	.LC4(%rip), %xmm0	#, tmp110
	mulss	%xmm1, %xmm0	# tmp109, D.3453
	cvttss2si	%xmm0, %eax	# D.3453, tmp111
	movl	%eax, -60(%rbp)	# tmp111, value
	.loc 1 162 0
	movl	-60(%rbp), %eax	# value, tmp113
	cltd
	movl	%edx, %eax	# tmp112, D.3454
	xorl	-60(%rbp), %eax	# value, D.3454
	subl	%edx, %eax	# tmp112, D.3454
	leaq	-48(%rbp), %rcx	#, tmp114
	movl	$10, %edx	#,
	movq	%rcx, %rsi	# tmp114,
	movl	%eax, %edi	# D.3454,
	call	itoa	#
	.loc 1 164 0
	cmpl	$0, -60(%rbp)	#, value
	js	.L50	#,
	.loc 1 165 0
	movb	$32, -32(%rbp)	#, intString2
	jmp	.L51	#
.L50:
	.loc 1 167 0
	movb	$45, -32(%rbp)	#, intString2
.L51:
	.loc 1 169 0
	leaq	-48(%rbp), %rax	#, tmp115
	movq	%rax, %rdi	# tmp115,
	call	strlen	#
	cmpq	$1, %rax	#, D.3455
	jne	.L52	#,
	.loc 1 170 0
	movb	$48, -31(%rbp)	#, intString2
	.loc 1 171 0
	movb	$48, -30(%rbp)	#, intString2
	.loc 1 172 0
	movb	$48, -29(%rbp)	#, intString2
	.loc 1 173 0
	leaq	-48(%rbp), %rdx	#, tmp116
	leaq	-32(%rbp), %rax	#, tmp117
	movq	%rdx, %rsi	# tmp116,
	movq	%rax, %rdi	# tmp117,
	call	strcat	#
	jmp	.L53	#
.L52:
	.loc 1 174 0
	leaq	-48(%rbp), %rax	#, tmp118
	movq	%rax, %rdi	# tmp118,
	call	strlen	#
	cmpq	$2, %rax	#, D.3455
	jne	.L54	#,
	.loc 1 175 0
	movb	$48, -31(%rbp)	#, intString2
	.loc 1 176 0
	movb	$48, -30(%rbp)	#, intString2
	.loc 1 177 0
	leaq	-48(%rbp), %rdx	#, tmp119
	leaq	-32(%rbp), %rax	#, tmp120
	movq	%rdx, %rsi	# tmp119,
	movq	%rax, %rdi	# tmp120,
	call	strcat	#
	jmp	.L53	#
.L54:
	.loc 1 178 0
	leaq	-48(%rbp), %rax	#, tmp121
	movq	%rax, %rdi	# tmp121,
	call	strlen	#
	cmpq	$3, %rax	#, D.3455
	jne	.L55	#,
	.loc 1 179 0
	movb	$48, -31(%rbp)	#, intString2
	.loc 1 180 0
	leaq	-48(%rbp), %rdx	#, tmp122
	leaq	-32(%rbp), %rax	#, tmp123
	movq	%rdx, %rsi	# tmp122,
	movq	%rax, %rdi	# tmp123,
	call	strcat	#
	jmp	.L53	#
.L55:
	.loc 1 182 0
	leaq	-48(%rbp), %rdx	#, tmp124
	leaq	-32(%rbp), %rax	#, tmp125
	movq	%rdx, %rsi	# tmp124,
	movq	%rax, %rdi	# tmp125,
	call	strcat	#
.L53:
	.loc 1 185 0
	leaq	-32(%rbp), %rax	#, tmp126
	movq	%rax, %rdi	# tmp126,
	call	strlen	#
	subl	$3, %eax	#, tmp127
	movb	%al, -61(%rbp)	# tmp127, dpLocation
	.loc 1 187 0
	movzbl	-61(%rbp), %edx	# dpLocation, D.3455
	leaq	-32(%rbp), %rcx	#, tmp128
	movq	-80(%rbp), %rax	# floatString, tmp129
	movq	%rcx, %rsi	# tmp128,
	movq	%rax, %rdi	# tmp129,
	call	strncpy	#
	.loc 1 188 0
	movzbl	-61(%rbp), %edx	# dpLocation, D.3457
	movq	-80(%rbp), %rax	# floatString, tmp130
	addq	%rdx, %rax	# D.3457, D.3458
	movb	$0, (%rax)	#, *_36
	.loc 1 189 0
	movq	-56(%rbp), %rdx	# decimalPoint, tmp131
	movq	-80(%rbp), %rax	# floatString, tmp132
	movq	%rdx, %rsi	# tmp131,
	movq	%rax, %rdi	# tmp132,
	call	strcat	#
	.loc 1 190 0
	movzbl	-61(%rbp), %eax	# dpLocation, D.3457
	leaq	-32(%rbp), %rdx	#, tmp133
	addq	%rax, %rdx	# D.3457, D.3458
	movq	-80(%rbp), %rax	# floatString, tmp134
	movq	%rdx, %rsi	# D.3458,
	movq	%rax, %rdi	# tmp134,
	call	strcat	#
	.loc 1 192 0
	movq	-80(%rbp), %rax	# floatString, D.3458
	.loc 1 193 0
	movq	-8(%rbp), %rcx	# D.3459, tmp137
	xorq	%fs:40, %rcx	#, tmp137
	je	.L57	#,
	call	__stack_chk_fail	#
.L57:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	ftoa, .-ftoa
	.section	.text.fastA2F,"ax",@progbits
	.globl	fastA2F
	.type	fastA2F, @function
fastA2F:
.LFB9:
	.loc 1 207 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# p, p
	.loc 1 208 0
	movl	$0, -24(%rbp)	#, frac
	.loc 1 212 0
	jmp	.L61	#
.L62:
	.loc 1 213 0
	addq	$1, -40(%rbp)	#, p
.L61:
	.loc 1 212 0
	movq	-40(%rbp), %rax	# p, tmp119
	movzbl	(%rax), %eax	# *p_1, D.3464
	cmpb	$32, %al	#, D.3464
	je	.L62	#,
	.loc 1 212 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# p, tmp120
	movzbl	(%rax), %eax	# *p_1, D.3464
	cmpb	$9, %al	#, D.3464
	je	.L62	#,
	.loc 1 217 0 is_stmt 1
	movss	.LC5(%rip), %xmm0	#, tmp121
	movss	%xmm0, -20(%rbp)	# tmp121, sign
	.loc 1 218 0
	movq	-40(%rbp), %rax	# p, tmp122
	movzbl	(%rax), %eax	# *p_1, D.3464
	cmpb	$45, %al	#, D.3464
	jne	.L63	#,
	.loc 1 219 0
	movss	.LC6(%rip), %xmm0	#, tmp123
	movss	%xmm0, -20(%rbp)	# tmp123, sign
	.loc 1 220 0
	addq	$1, -40(%rbp)	#, p
	jmp	.L64	#
.L63:
	.loc 1 222 0
	movq	-40(%rbp), %rax	# p, tmp124
	movzbl	(%rax), %eax	# *p_1, D.3464
	cmpb	$43, %al	#, D.3464
	jne	.L64	#,
	.loc 1 223 0
	addq	$1, -40(%rbp)	#, p
.L64:
	.loc 1 227 0
	pxor	%xmm0, %xmm0	# tmp125
	movss	%xmm0, -16(%rbp)	# tmp125, value
	.loc 1 228 0
	jmp	.L65	#
.L67:
	.loc 1 229 0
	movss	-16(%rbp), %xmm1	# value, tmp126
	movss	.LC7(%rip), %xmm0	#, tmp127
	mulss	%xmm0, %xmm1	# tmp127, D.3463
	movq	-40(%rbp), %rax	# p, tmp128
	movzbl	(%rax), %eax	# *p_3, D.3464
	movsbl	%al, %eax	# D.3464, D.3465
	subl	$48, %eax	#, D.3465
	pxor	%xmm0, %xmm0	# D.3463
	cvtsi2ss	%eax, %xmm0	# D.3465, D.3463
	addss	%xmm1, %xmm0	# D.3463, tmp129
	movss	%xmm0, -16(%rbp)	# tmp129, value
	.loc 1 230 0
	addq	$1, -40(%rbp)	#, p
.L65:
	.loc 1 228 0
	movq	-40(%rbp), %rax	# p, tmp130
	movzbl	(%rax), %eax	# *p_3, D.3464
	cmpb	$47, %al	#, D.3464
	jle	.L66	#,
	.loc 1 228 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# p, tmp131
	movzbl	(%rax), %eax	# *p_3, D.3464
	cmpb	$57, %al	#, D.3464
	jle	.L67	#,
.L66:
	.loc 1 234 0 is_stmt 1
	movq	-40(%rbp), %rax	# p, tmp132
	movzbl	(%rax), %eax	# *p_3, D.3464
	cmpb	$46, %al	#, D.3464
	jne	.L68	#,
.LBB4:
	.loc 1 235 0
	movss	.LC7(%rip), %xmm0	#, tmp133
	movss	%xmm0, -8(%rbp)	# tmp133, pow10
	.loc 1 236 0
	addq	$1, -40(%rbp)	#, p
	.loc 1 238 0
	jmp	.L69	#
.L70:
	.loc 1 239 0
	movq	-40(%rbp), %rax	# p, tmp134
	movzbl	(%rax), %eax	# *p_4, D.3464
	movsbl	%al, %eax	# D.3464, D.3465
	subl	$48, %eax	#, D.3465
	pxor	%xmm0, %xmm0	# D.3463
	cvtsi2ss	%eax, %xmm0	# D.3465, D.3463
	divss	-8(%rbp), %xmm0	# pow10, D.3463
	movss	-16(%rbp), %xmm1	# value, tmp136
	addss	%xmm1, %xmm0	# tmp136, tmp135
	movss	%xmm0, -16(%rbp)	# tmp135, value
	.loc 1 240 0
	movss	-8(%rbp), %xmm1	# pow10, tmp138
	movss	.LC7(%rip), %xmm0	#, tmp139
	mulss	%xmm1, %xmm0	# tmp138, tmp137
	movss	%xmm0, -8(%rbp)	# tmp137, pow10
	.loc 1 241 0
	addq	$1, -40(%rbp)	#, p
.L69:
	.loc 1 238 0
	movq	-40(%rbp), %rax	# p, tmp140
	movzbl	(%rax), %eax	# *p_4, D.3464
	cmpb	$47, %al	#, D.3464
	jle	.L68	#,
	.loc 1 238 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# p, tmp141
	movzbl	(%rax), %eax	# *p_4, D.3464
	cmpb	$57, %al	#, D.3464
	jle	.L70	#,
.L68:
.LBE4:
	.loc 1 246 0 is_stmt 1
	movss	.LC5(%rip), %xmm0	#, tmp142
	movss	%xmm0, -12(%rbp)	# tmp142, scale
	.loc 1 247 0
	movq	-40(%rbp), %rax	# p, tmp143
	movzbl	(%rax), %eax	# *p_5, D.3464
	cmpb	$101, %al	#, D.3464
	je	.L71	#,
	.loc 1 247 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# p, tmp144
	movzbl	(%rax), %eax	# *p_5, D.3464
	cmpb	$69, %al	#, D.3464
	jne	.L72	#,
.L71:
.LBB5:
	.loc 1 249 0 is_stmt 1
	addq	$1, -40(%rbp)	#, p
	.loc 1 252 0
	movl	$0, -24(%rbp)	#, frac
	.loc 1 253 0
	movq	-40(%rbp), %rax	# p, tmp145
	movzbl	(%rax), %eax	# *p_61, D.3464
	cmpb	$45, %al	#, D.3464
	jne	.L73	#,
	.loc 1 254 0
	movl	$1, -24(%rbp)	#, frac
	.loc 1 255 0
	addq	$1, -40(%rbp)	#, p
	jmp	.L74	#
.L73:
	.loc 1 257 0
	movq	-40(%rbp), %rax	# p, tmp146
	movzbl	(%rax), %eax	# *p_61, D.3464
	cmpb	$43, %al	#, D.3464
	jne	.L74	#,
	.loc 1 258 0
	addq	$1, -40(%rbp)	#, p
.L74:
	.loc 1 262 0
	movl	$0, -4(%rbp)	#, expon
	.loc 1 263 0
	jmp	.L75	#
.L77:
	.loc 1 264 0
	movl	-4(%rbp), %edx	# expon, tmp147
	movl	%edx, %eax	# tmp147, tmp148
	sall	$2, %eax	#, tmp148
	addl	%edx, %eax	# tmp147, tmp148
	addl	%eax, %eax	# tmp149
	movl	%eax, %edx	# tmp148, D.3466
	movq	-40(%rbp), %rax	# p, tmp150
	movzbl	(%rax), %eax	# *p_7, D.3464
	movsbl	%al, %eax	# D.3464, D.3466
	addl	%edx, %eax	# D.3466, D.3466
	subl	$48, %eax	#, tmp151
	movl	%eax, -4(%rbp)	# tmp151, expon
	.loc 1 265 0
	addq	$1, -40(%rbp)	#, p
.L75:
	.loc 1 263 0
	movq	-40(%rbp), %rax	# p, tmp152
	movzbl	(%rax), %eax	# *p_7, D.3464
	cmpb	$47, %al	#, D.3464
	jle	.L76	#,
	.loc 1 263 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# p, tmp153
	movzbl	(%rax), %eax	# *p_7, D.3464
	cmpb	$57, %al	#, D.3464
	jle	.L77	#,
.L76:
	.loc 1 267 0 is_stmt 1
	cmpl	$308, -4(%rbp)	#, expon
	jbe	.L79	#,
	.loc 1 268 0
	movl	$308, -4(%rbp)	#, expon
	.loc 1 272 0
	jmp	.L79	#
.L80:
	.loc 1 273 0
	movss	-12(%rbp), %xmm1	# scale, tmp155
	movss	.LC8(%rip), %xmm0	#, tmp156
	mulss	%xmm1, %xmm0	# tmp155, tmp154
	movss	%xmm0, -12(%rbp)	# tmp154, scale
	.loc 1 274 0
	subl	$8, -4(%rbp)	#, expon
.L79:
	.loc 1 272 0
	cmpl	$7, -4(%rbp)	#, expon
	ja	.L80	#,
	.loc 1 276 0
	jmp	.L81	#
.L82:
	.loc 1 277 0
	movss	-12(%rbp), %xmm1	# scale, tmp158
	movss	.LC7(%rip), %xmm0	#, tmp159
	mulss	%xmm1, %xmm0	# tmp158, tmp157
	movss	%xmm0, -12(%rbp)	# tmp157, scale
	.loc 1 278 0
	subl	$1, -4(%rbp)	#, expon
.L81:
	.loc 1 276 0
	cmpl	$0, -4(%rbp)	#, expon
	jne	.L82	#,
.L72:
.LBE5:
	.loc 1 283 0
	cmpl	$0, -24(%rbp)	#, frac
	je	.L83	#,
	.loc 1 283 0 is_stmt 0 discriminator 1
	movss	-16(%rbp), %xmm0	# value, tmp160
	divss	-12(%rbp), %xmm0	# scale, D.3463
	jmp	.L84	#
.L83:
	.loc 1 283 0 discriminator 2
	movss	-16(%rbp), %xmm0	# value, tmp161
	mulss	-12(%rbp), %xmm0	# scale, D.3463
.L84:
	.loc 1 283 0 discriminator 4
	mulss	-20(%rbp), %xmm0	# sign, D.3463
	.loc 1 284 0 is_stmt 1 discriminator 4
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	fastA2F, .-fastA2F
	.section	.rodata
	.align 4
.LC3:
	.long	973279855
	.align 4
.LC4:
	.long	1148846080
	.align 4
.LC5:
	.long	1065353216
	.align 4
.LC6:
	.long	3212836864
	.align 4
.LC7:
	.long	1092616192
	.align 4
.LC8:
	.long	1287568416
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4b4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF33
	.byte	0xc
	.long	.LASF34
	.long	.LASF35
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.byte	0x8
	.long	0x8b
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x6
	.long	0x84
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x5
	.byte	0x8
	.long	0x84
	.uleb128 0x7
	.long	.LASF14
	.byte	0x1
	.byte	0x19
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x130
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x19
	.long	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0x19
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.string	"uc"
	.byte	0x1
	.byte	0x19
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x19
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.string	"n"
	.byte	0x1
	.byte	0x1b
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.string	"d"
	.byte	0x1
	.byte	0x1c
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xa
	.string	"dgt"
	.byte	0x1
	.byte	0x20
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	.LASF15
	.byte	0x1
	.byte	0x2b
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x169
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x2b
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x2b
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x7
	.long	.LASF16
	.byte	0x1
	.byte	0x36
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f5
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x36
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0x36
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.string	"uc"
	.byte	0x1
	.byte	0x36
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x36
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.string	"n"
	.byte	0x1
	.byte	0x38
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.string	"d"
	.byte	0x1
	.byte	0x39
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xa
	.string	"dgt"
	.byte	0x1
	.byte	0x3d
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xd
	.string	"i2a"
	.byte	0x1
	.byte	0x48
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x22e
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x48
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x48
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xe
	.string	"a2d"
	.byte	0x1
	.byte	0x51
	.long	0x42
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x25d
	.uleb128 0x8
	.string	"ch"
	.byte	0x1
	.byte	0x51
	.long	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.string	"a2i"
	.byte	0x1
	.byte	0x5d
	.long	0x84
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2de
	.uleb128 0x8
	.string	"ch"
	.byte	0x1
	.byte	0x5d
	.long	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.string	"src"
	.byte	0x1
	.byte	0x5d
	.long	0x2de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0x5d
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF17
	.byte	0x1
	.byte	0x5d
	.long	0x2e4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.string	"p"
	.byte	0x1
	.byte	0x5f
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"num"
	.byte	0x1
	.byte	0x60
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.long	.LASF18
	.byte	0x1
	.byte	0x61
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x7e
	.uleb128 0x5
	.byte	0x8
	.long	0x42
	.uleb128 0x11
	.long	.LASF36
	.byte	0x1
	.byte	0x7d
	.long	0x9e
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x332
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x7d
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.string	"a"
	.byte	0x1
	.byte	0x7d
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0x7d
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.long	.LASF19
	.byte	0x1
	.byte	0x85
	.long	0x9e
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x37a
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x85
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.string	"a"
	.byte	0x1
	.byte	0x85
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0x85
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.long	.LASF20
	.byte	0x1
	.byte	0x93
	.long	0x9e
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x401
	.uleb128 0x8
	.string	"x"
	.byte	0x1
	.byte	0x93
	.long	0x90
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x9
	.long	.LASF21
	.byte	0x1
	.byte	0x93
	.long	0x9e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x10
	.long	.LASF22
	.byte	0x1
	.byte	0x95
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x10
	.long	.LASF23
	.byte	0x1
	.byte	0x96
	.long	0x401
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x10
	.long	.LASF24
	.byte	0x1
	.byte	0x97
	.long	0x401
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x10
	.long	.LASF25
	.byte	0x1
	.byte	0x98
	.long	0x9e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x10
	.long	.LASF26
	.byte	0x1
	.byte	0x99
	.long	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -77
	.byte	0
	.uleb128 0x13
	.long	0x84
	.long	0x411
	.uleb128 0x14
	.long	0x77
	.byte	0xb
	.byte	0
	.uleb128 0x15
	.long	.LASF27
	.byte	0x1
	.byte	0xce
	.long	0x90
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.string	"p"
	.byte	0x1
	.byte	0xce
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.long	.LASF28
	.byte	0x1
	.byte	0xd0
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.long	.LASF29
	.byte	0x1
	.byte	0xd1
	.long	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF22
	.byte	0x1
	.byte	0xd1
	.long	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.long	.LASF30
	.byte	0x1
	.byte	0xd1
	.long	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x496
	.uleb128 0x10
	.long	.LASF31
	.byte	0x1
	.byte	0xeb
	.long	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x10
	.long	.LASF32
	.byte	0x1
	.byte	0xf8
	.long	0x69
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x16
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0xbc
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"ui2a"
.LASF1:
	.string	"short int"
.LASF9:
	.string	"sizetype"
.LASF14:
	.string	"uli2a"
.LASF27:
	.string	"fastA2F"
.LASF17:
	.string	"nump"
.LASF21:
	.string	"floatString"
.LASF22:
	.string	"value"
.LASF4:
	.string	"uint8_t"
.LASF15:
	.string	"li2a"
.LASF11:
	.string	"float"
.LASF25:
	.string	"decimalPoint"
.LASF33:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF2:
	.string	"long int"
.LASF19:
	.string	"itoa"
.LASF5:
	.string	"unsigned char"
.LASF0:
	.string	"signed char"
.LASF30:
	.string	"scale"
.LASF7:
	.string	"unsigned int"
.LASF26:
	.string	"dpLocation"
.LASF31:
	.string	"pow10"
.LASF6:
	.string	"short unsigned int"
.LASF23:
	.string	"intString1"
.LASF24:
	.string	"intString2"
.LASF10:
	.string	"char"
.LASF3:
	.string	"int32_t"
.LASF32:
	.string	"expon"
.LASF35:
	.string	"/home/aravind/git/cleanflight"
.LASF20:
	.string	"ftoa"
.LASF8:
	.string	"long unsigned int"
.LASF29:
	.string	"sign"
.LASF12:
	.string	"double"
.LASF28:
	.string	"frac"
.LASF36:
	.string	"_i2a"
.LASF18:
	.string	"digit"
.LASF34:
	.string	"src/main/common/typeconversion.c"
.LASF13:
	.string	"base"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
