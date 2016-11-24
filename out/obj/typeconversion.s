	.file	"typeconversion.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed typeconversion.i -mtune=generic
# -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections
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
	.long	0x4b8
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF633
	.byte	0xc
	.long	.LASF634
	.long	.LASF635
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF600
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF601
	.uleb128 0x3
	.long	.LASF603
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
	.long	.LASF602
	.uleb128 0x3
	.long	.LASF604
	.byte	0x2
	.byte	0x30
	.long	0x5f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF605
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF606
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF607
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF608
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF609
	.uleb128 0x5
	.byte	0x8
	.long	0x8f
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF610
	.uleb128 0x6
	.long	0x88
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF611
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF612
	.uleb128 0x5
	.byte	0x8
	.long	0x88
	.uleb128 0x7
	.long	.LASF614
	.byte	0x1
	.byte	0x19
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x134
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x19
	.long	0x74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF613
	.byte	0x1
	.byte	0x19
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.string	"uc"
	.byte	0x1
	.byte	0x19
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x19
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.string	"n"
	.byte	0x1
	.byte	0x1b
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.string	"d"
	.byte	0x1
	.byte	0x1c
	.long	0x6d
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
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	.LASF615
	.byte	0x1
	.byte	0x2b
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x16d
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x2b
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x2b
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x7
	.long	.LASF616
	.byte	0x1
	.byte	0x36
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f9
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x36
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.long	.LASF613
	.byte	0x1
	.byte	0x36
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.string	"uc"
	.byte	0x1
	.byte	0x36
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x36
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.string	"n"
	.byte	0x1
	.byte	0x38
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.string	"d"
	.byte	0x1
	.byte	0x39
	.long	0x6d
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
	.long	0x46
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
	.long	0x232
	.uleb128 0x8
	.string	"num"
	.byte	0x1
	.byte	0x48
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.string	"bf"
	.byte	0x1
	.byte	0x48
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xe
	.string	"a2d"
	.byte	0x1
	.byte	0x51
	.long	0x46
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x261
	.uleb128 0x8
	.string	"ch"
	.byte	0x1
	.byte	0x51
	.long	0x88
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.string	"a2i"
	.byte	0x1
	.byte	0x5d
	.long	0x88
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2e2
	.uleb128 0x8
	.string	"ch"
	.byte	0x1
	.byte	0x5d
	.long	0x88
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.string	"src"
	.byte	0x1
	.byte	0x5d
	.long	0x2e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x9
	.long	.LASF613
	.byte	0x1
	.byte	0x5d
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF617
	.byte	0x1
	.byte	0x5d
	.long	0x2e8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.string	"p"
	.byte	0x1
	.byte	0x5f
	.long	0x82
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"num"
	.byte	0x1
	.byte	0x60
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.long	.LASF618
	.byte	0x1
	.byte	0x61
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x82
	.uleb128 0x5
	.byte	0x8
	.long	0x46
	.uleb128 0x11
	.long	.LASF636
	.byte	0x1
	.byte	0x7d
	.long	0xa2
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x336
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x7d
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.string	"a"
	.byte	0x1
	.byte	0x7d
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF613
	.byte	0x1
	.byte	0x7d
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.long	.LASF619
	.byte	0x1
	.byte	0x85
	.long	0xa2
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x37e
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x85
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.string	"a"
	.byte	0x1
	.byte	0x85
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF613
	.byte	0x1
	.byte	0x85
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.long	.LASF620
	.byte	0x1
	.byte	0x93
	.long	0xa2
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x405
	.uleb128 0x8
	.string	"x"
	.byte	0x1
	.byte	0x93
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x9
	.long	.LASF621
	.byte	0x1
	.byte	0x93
	.long	0xa2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x10
	.long	.LASF622
	.byte	0x1
	.byte	0x95
	.long	0x3b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x10
	.long	.LASF623
	.byte	0x1
	.byte	0x96
	.long	0x405
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x10
	.long	.LASF624
	.byte	0x1
	.byte	0x97
	.long	0x405
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x10
	.long	.LASF625
	.byte	0x1
	.byte	0x98
	.long	0xa2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x10
	.long	.LASF626
	.byte	0x1
	.byte	0x99
	.long	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -77
	.byte	0
	.uleb128 0x13
	.long	0x88
	.long	0x415
	.uleb128 0x14
	.long	0x7b
	.byte	0xb
	.byte	0
	.uleb128 0x15
	.long	.LASF627
	.byte	0x1
	.byte	0xce
	.long	0x94
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.string	"p"
	.byte	0x1
	.byte	0xce
	.long	0x82
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.long	.LASF628
	.byte	0x1
	.byte	0xd0
	.long	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.long	.LASF629
	.byte	0x1
	.byte	0xd1
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF622
	.byte	0x1
	.byte	0xd1
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.long	.LASF630
	.byte	0x1
	.byte	0xd1
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x49a
	.uleb128 0x10
	.long	.LASF631
	.byte	0x1
	.byte	0xeb
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x10
	.long	.LASF632
	.byte	0x1
	.byte	0xf8
	.long	0x6d
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
	.file 3 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF254
	.file 5 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro2
	.file 6 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro3
	.file 7 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 8 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0x8
	.file 9 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 10 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x7
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
	.file 11 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro9
	.file 12 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.file 13 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x15
	.long	.LASF477
	.byte	0x4
	.byte	0x4
	.file 14 "/usr/include/math.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x18
	.long	.LASF478
	.file 15 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0xf
	.file 16 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x4
	.file 17 "/usr/include/x86_64-linux-gnu/bits/huge_val.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x11
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF498
	.byte	0x4
	.file 18 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x12
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF499
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x19
	.long	.LASF500
	.byte	0x4
	.file 20 "/usr/include/x86_64-linux-gnu/bits/inf.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF501
	.byte	0x4
	.file 21 "/usr/include/x86_64-linux-gnu/bits/nan.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF502
	.byte	0x4
	.file 22 "/usr/include/x86_64-linux-gnu/bits/mathdef.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro13
	.file 23 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
	.byte	0x3
	.uleb128 0x53
	.uleb128 0x17
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x3
	.uleb128 0x68
	.uleb128 0x17
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x3
	.uleb128 0x97
	.uleb128 0x17
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.file 24 "./src/main/build/build_config.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.file 25 "src/main/common/maths.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF598
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF599
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
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.8394011d5995a16f15d67d04e84a1d69,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF453
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF454
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.2ff233552538c6ff9b8575ca8ea52cb3,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF456
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF457
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF458
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF459
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF460
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF461
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF462
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF463
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF464
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF465
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF466
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF467
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF468
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF469
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF470
	.byte	0x5
	.uleb128 0xca
	.long	.LASF471
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF472
	.byte	0x6
	.uleb128 0xee
	.long	.LASF473
	.byte	0x6
	.uleb128 0x191
	.long	.LASF474
	.byte	0x5
	.uleb128 0x196
	.long	.LASF475
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF476
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libmsimddeclstubs.h.34.75644856b74ba3d815155fe5fe7ecc56,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF479
	.byte	0x5
	.uleb128 0x24
	.long	.LASF480
	.byte	0x5
	.uleb128 0x25
	.long	.LASF481
	.byte	0x5
	.uleb128 0x26
	.long	.LASF482
	.byte	0x5
	.uleb128 0x28
	.long	.LASF483
	.byte	0x5
	.uleb128 0x29
	.long	.LASF484
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF485
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF486
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF487
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF488
	.byte	0x5
	.uleb128 0x30
	.long	.LASF489
	.byte	0x5
	.uleb128 0x31
	.long	.LASF490
	.byte	0x5
	.uleb128 0x32
	.long	.LASF491
	.byte	0x5
	.uleb128 0x34
	.long	.LASF492
	.byte	0x5
	.uleb128 0x35
	.long	.LASF493
	.byte	0x5
	.uleb128 0x36
	.long	.LASF494
	.byte	0x5
	.uleb128 0x38
	.long	.LASF495
	.byte	0x5
	.uleb128 0x39
	.long	.LASF496
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF497
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.mathdef.h.23.67c0aa4a204f1f427459dfc651aba565,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF503
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF504
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF505
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.55.cf380f99c57d42476a5252f30065036a,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x37
	.long	.LASF506
	.byte	0x5
	.uleb128 0x39
	.long	.LASF507
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF508
	.byte	0x5
	.uleb128 0x41
	.long	.LASF509
	.byte	0x5
	.uleb128 0x43
	.long	.LASF510
	.byte	0x5
	.uleb128 0x46
	.long	.LASF511
	.byte	0x5
	.uleb128 0x48
	.long	.LASF512
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF513
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF514
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF515
	.byte	0x5
	.uleb128 0x50
	.long	.LASF516
	.byte	0x5
	.uleb128 0x51
	.long	.LASF517
	.byte	0x5
	.uleb128 0x52
	.long	.LASF518
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.84.742292806c6be54f49dc607928a827f7,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x54
	.long	.LASF519
	.byte	0x6
	.uleb128 0x55
	.long	.LASF520
	.byte	0x6
	.uleb128 0x56
	.long	.LASF521
	.byte	0x6
	.uleb128 0x57
	.long	.LASF522
	.byte	0x6
	.uleb128 0x58
	.long	.LASF523
	.byte	0x5
	.uleb128 0x61
	.long	.LASF524
	.byte	0x5
	.uleb128 0x63
	.long	.LASF525
	.byte	0x5
	.uleb128 0x64
	.long	.LASF526
	.byte	0x5
	.uleb128 0x65
	.long	.LASF527
	.byte	0x5
	.uleb128 0x66
	.long	.LASF528
	.byte	0x5
	.uleb128 0x67
	.long	.LASF529
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.105.59ff0f83ebf6a04e70e145cef2d1185e,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x69
	.long	.LASF519
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF520
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF521
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF522
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF523
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF530
	.byte	0x5
	.uleb128 0x91
	.long	.LASF531
	.byte	0x5
	.uleb128 0x92
	.long	.LASF532
	.byte	0x5
	.uleb128 0x93
	.long	.LASF527
	.byte	0x5
	.uleb128 0x94
	.long	.LASF528
	.byte	0x5
	.uleb128 0x95
	.long	.LASF529
	.byte	0x5
	.uleb128 0x96
	.long	.LASF533
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.152.52b052d532b5a6b0eb86a9fe4d5b0433,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x98
	.long	.LASF519
	.byte	0x6
	.uleb128 0x99
	.long	.LASF520
	.byte	0x6
	.uleb128 0x9a
	.long	.LASF521
	.byte	0x6
	.uleb128 0x9b
	.long	.LASF522
	.byte	0x6
	.uleb128 0x9c
	.long	.LASF523
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF534
	.byte	0x6
	.uleb128 0xa2
	.long	.LASF535
	.byte	0x6
	.uleb128 0xa3
	.long	.LASF536
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF537
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF538
	.byte	0x5
	.uleb128 0xda
	.long	.LASF539
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF540
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF541
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF542
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF543
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF544
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF545
	.byte	0x5
	.uleb128 0x124
	.long	.LASF546
	.byte	0x5
	.uleb128 0x132
	.long	.LASF547
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF548
	.byte	0x5
	.uleb128 0x140
	.long	.LASF549
	.byte	0x5
	.uleb128 0x146
	.long	.LASF550
	.byte	0x5
	.uleb128 0x184
	.long	.LASF551
	.byte	0x5
	.uleb128 0x187
	.long	.LASF552
	.byte	0x5
	.uleb128 0x188
	.long	.LASF553
	.byte	0x5
	.uleb128 0x189
	.long	.LASF554
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF555
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF556
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF557
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF558
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF559
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF560
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF561
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF562
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF563
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF564
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF565
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF566
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF567
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF568
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF569
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF570
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF571
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF572
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF573
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF574
	.byte	0x5
	.uleb128 0x1d1
	.long	.LASF575
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF576
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF577
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.build_config.h.20.1bf8432fc8be9a81fe8cce0e3f98279c,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF578
	.byte	0x5
	.uleb128 0x15
	.long	.LASF579
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF580
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF581
	.byte	0x5
	.uleb128 0x20
	.long	.LASF582
	.byte	0x5
	.uleb128 0x21
	.long	.LASF583
	.byte	0x5
	.uleb128 0x27
	.long	.LASF584
	.byte	0x5
	.uleb128 0x28
	.long	.LASF585
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.maths.h.21.5b067f47e9a221ec30aa8aaee7f7dece,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF586
	.byte	0x5
	.uleb128 0x19
	.long	.LASF587
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF588
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF589
	.byte	0x5
	.uleb128 0x21
	.long	.LASF590
	.byte	0x5
	.uleb128 0x22
	.long	.LASF591
	.byte	0x5
	.uleb128 0x23
	.long	.LASF592
	.byte	0x5
	.uleb128 0x62
	.long	.LASF593
	.byte	0x5
	.uleb128 0x63
	.long	.LASF594
	.byte	0x5
	.uleb128 0x64
	.long	.LASF595
	.byte	0x5
	.uleb128 0x65
	.long	.LASF596
	.byte	0x5
	.uleb128 0x66
	.long	.LASF597
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF463:
	.string	"_SIZE_T_ "
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF490:
	.string	"__DECL_SIMD_logf "
.LASF547:
	.string	"isinf(x) __builtin_isinf_sign (x)"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF254:
	.string	"_STDINT_H 1"
.LASF481:
	.string	"__DECL_SIMD_cosf "
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF469:
	.string	"___int_size_t_h "
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF553:
	.string	"SING 2"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF627:
	.string	"fastA2F"
.LASF333:
	.string	"__flexarr []"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF579:
	.string	"BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))"
.LASF352:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF570:
	.string	"M_SQRT2 1.41421356237309504880"
.LASF485:
	.string	"__DECL_SIMD_sinl "
.LASF339:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF399:
	.string	"UINT8_MAX (255)"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF633:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF394:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF525:
	.string	"_Mdouble_ _Mfloat_"
.LASF387:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF281:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF458:
	.string	"_SIZE_T "
.LASF548:
	.string	"MATH_ERRNO 1"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF455:
	.string	"__need_NULL "
.LASF365:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF607:
	.string	"unsigned int"
.LASF306:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF402:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF575:
	.string	"islessequal(x,y) __builtin_islessequal(x, y)"
.LASF287:
	.string	"_POSIX_SOURCE"
.LASF267:
	.string	"__USE_XOPEN2K"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF388:
	.string	"__int8_t_defined "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF491:
	.string	"__DECL_SIMD_logl "
.LASF5:
	.string	"__GNUC__ 5"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF259:
	.string	"__USE_ISOCXX11"
.LASF462:
	.string	"__SIZE_T "
.LASF592:
	.string	"ABS(x) ((x) > 0 ? (x) : -(x))"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF302:
	.string	"__GNU_LIBRARY__"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF359:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF374:
	.string	"__stub_fchflags "
.LASF407:
	.string	"INT_LEAST8_MAX (127)"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF621:
	.string	"floatString"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF568:
	.string	"M_2_PI 0.63661977236758134308"
.LASF468:
	.string	"_SIZE_T_DECLARED "
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF322:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF292:
	.string	"__USE_POSIX2 1"
.LASF285:
	.string	"__USE_ISOC95 1"
.LASF324:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF527:
	.string	"__MATH_DECLARING_DOUBLE 0"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF599:
	.string	"valid_digit(c) ((c) >= '0' && (c) <= '9')"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF382:
	.string	"__stub_sigreturn "
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
.LASF558:
	.string	"HUGE 3.40282347e+38F"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF396:
	.string	"INT16_MAX (32767)"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF535:
	.string	"__MATHDECL"
.LASF467:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF550:
	.string	"math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)"
.LASF434:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF266:
	.string	"__USE_UNIX98"
.LASF301:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF297:
	.string	"_ATFILE_SOURCE"
.LASF275:
	.string	"__USE_ATFILE"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF313:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF443:
	.string	"INT16_C(c) c"
.LASF586:
	.string	"sq(x) ((x)*(x))"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF461:
	.string	"_T_SIZE "
.LASF409:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF401:
	.string	"UINT32_MAX (4294967295U)"
.LASF298:
	.string	"_ATFILE_SOURCE 1"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF311:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF381:
	.string	"__stub_setlogin "
.LASF507:
	.string	"__MATHCALL_VEC(function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHCALL (function, suffix, args)"
.LASF460:
	.string	"_T_SIZE_ "
.LASF452:
	.string	"_GCC_WRAP_STDINT_H "
.LASF537:
	.string	"FP_NAN 0"
.LASF425:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF410:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF353:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF413:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF590:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF616:
	.string	"ui2a"
.LASF509:
	.string	"__MATHCALL(function,suffix,args) __MATHDECL (_Mdouble_,function,suffix, args)"
.LASF239:
	.string	"__unix__ 1"
.LASF303:
	.string	"__GNU_LIBRARY__ 6"
.LASF556:
	.string	"TLOSS 5"
.LASF464:
	.string	"_BSD_SIZE_T_ "
.LASF516:
	.string	"__MATH_DECLARING_DOUBLE 1"
.LASF611:
	.string	"float"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF628:
	.string	"frac"
.LASF499:
	.string	"HUGE_VALF (__builtin_huge_valf())"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF504:
	.string	"FP_ILOGB0 (-2147483647 - 1)"
.LASF613:
	.string	"base"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF565:
	.string	"M_PI_2 1.57079632679489661923"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF312:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF390:
	.string	"__intptr_t_defined "
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF488:
	.string	"__DECL_SIMD_sincosl "
.LASF343:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF578:
	.string	"UNUSED(x) (void)(x)"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF280:
	.string	"__KERNEL_STRICT_NAMES "
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF263:
	.string	"__USE_POSIX199506"
.LASF444:
	.string	"INT32_C(c) c"
.LASF336:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF315:
	.string	"__PMT(args) args"
.LASF448:
	.string	"UINT32_C(c) c ## U"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF571:
	.string	"M_SQRT1_2 0.70710678118654752440"
.LASF470:
	.string	"_GCC_SIZE_T "
.LASF511:
	.string	"__MATHCALLX(function,suffix,args,attrib) __MATHDECLX (_Mdouble_,function,suffix, args, attrib)"
.LASF373:
	.string	"__stub_fattach "
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
.LASF545:
	.string	"isnormal(x) __builtin_isnormal (x)"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF517:
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
.LASF622:
	.string	"value"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF422:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF295:
	.string	"__USE_XOPEN2K 1"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
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
.LASF580:
	.string	"STATIC_UNIT_TESTED static"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF483:
	.string	"__DECL_SIMD_sin "
.LASF257:
	.string	"__USE_ISOC99"
.LASF293:
	.string	"__USE_POSIX199309 1"
.LASF629:
	.string	"sign"
.LASF492:
	.string	"__DECL_SIMD_exp "
.LASF494:
	.string	"__DECL_SIMD_expl "
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF379:
	.string	"__stub_putmsg "
.LASF465:
	.string	"_SIZE_T_DEFINED_ "
.LASF320:
	.string	"__BEGIN_DECLS "
.LASF474:
	.string	"NULL"
.LASF441:
	.string	"WINT_MAX (4294967295u)"
.LASF573:
	.string	"isgreaterequal(x,y) __builtin_isgreaterequal(x, y)"
.LASF395:
	.string	"INT8_MAX (127)"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF283:
	.string	"_DEFAULT_SOURCE 1"
.LASF400:
	.string	"UINT16_MAX (65535)"
.LASF218:
	.string	"__amd64__ 1"
.LASF419:
	.string	"INT_FAST8_MAX (127)"
.LASF361:
	.string	"__WORDSIZE 64"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF566:
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
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF479:
	.string	"_BITS_LIBM_SIMD_DECL_STUBS_H 1"
.LASF552:
	.string	"DOMAIN 1"
.LASF475:
	.string	"NULL ((void *)0)"
.LASF348:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF356:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF436:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF392:
	.string	"INT16_MIN (-32767-1)"
.LASF319:
	.string	"__long_double_t long double"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF636:
	.string	"_i2a"
.LASF335:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF447:
	.string	"UINT16_C(c) c"
.LASF576:
	.string	"islessgreater(x,y) __builtin_islessgreater(x, y)"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF421:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF539:
	.string	"FP_ZERO 2"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF610:
	.string	"char"
.LASF482:
	.string	"__DECL_SIMD_cosl "
.LASF526:
	.string	"__MATH_PRECNAME(name,r) name ##f ##r"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF495:
	.string	"__DECL_SIMD_pow "
.LASF631:
	.string	"pow10"
.LASF440:
	.string	"WINT_MIN (0u)"
.LASF634:
	.string	"src/main/common/typeconversion.c"
.LASF604:
	.string	"uint8_t"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF572:
	.string	"isgreater(x,y) __builtin_isgreater(x, y)"
.LASF510:
	.string	"__MATHDECL(type,function,suffix,args) __MATHDECL_1(type, function,suffix, args); __MATHDECL_1(type, __CONCAT(__,function),suffix, args)"
.LASF220:
	.string	"__x86_64__ 1"
.LASF430:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF598:
	.string	"white_space(c) ((c) == ' ' || (c) == '\\t')"
.LASF334:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF294:
	.string	"__USE_POSIX199506 1"
.LASF235:
	.string	"__linux 1"
.LASF438:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF457:
	.string	"__SIZE_T__ "
.LASF519:
	.string	"_Mdouble_"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF366:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF386:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF351:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF350:
	.string	"__wur "
.LASF393:
	.string	"INT32_MIN (-2147483647-1)"
.LASF595:
	.string	"atan2_approx(y,x) atan2f(y,x)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF325:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF531:
	.string	"_Mdouble_ _Mlong_double_"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF583:
	.string	"UNIT_TESTED "
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
.LASF497:
	.string	"__DECL_SIMD_powl "
.LASF442:
	.string	"INT8_C(c) c"
.LASF300:
	.string	"__USE_ATFILE 1"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF307:
	.string	"_SYS_CDEFS_H 1"
.LASF501:
	.string	"INFINITY (__builtin_inff())"
.LASF17:
	.string	"__LP64__ 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF429:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF514:
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
.LASF384:
	.string	"__stub_stty "
.LASF219:
	.string	"__x86_64 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF559:
	.string	"M_E 2.7182818284590452354"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF327:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF456:
	.string	"__size_t__ "
.LASF403:
	.string	"INT_LEAST8_MIN (-128)"
.LASF243:
	.string	"DEBUG 1"
.LASF357:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF484:
	.string	"__DECL_SIMD_sinf "
.LASF597:
	.string	"tan_approx(x) tanf(x)"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF308:
	.string	"__PMT"
.LASF591:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF241:
	.string	"__ELF__ 1"
.LASF316:
	.string	"__CONCAT(x,y) x ## y"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF594:
	.string	"cos_approx(x) cosf(x)"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF512:
	.string	"__MATHDECLX(type,function,suffix,args,attrib) __MATHDECL_1(type, function,suffix, args) __attribute__ (attrib); __MATHDECL_1(type, __CONCAT(__,function),suffix, args) __attribute__ (attrib)"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF557:
	.string	"PLOSS 6"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF619:
	.string	"itoa"
.LASF618:
	.string	"digit"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF544:
	.string	"isfinite(x) __builtin_isfinite (x)"
.LASF449:
	.string	"UINT64_C(c) c ## UL"
.LASF630:
	.string	"scale"
.LASF0:
	.string	"__STDC__ 1"
.LASF587:
	.string	"FAST_TRIGONOMETRY "
.LASF230:
	.string	"__SSE2__ 1"
.LASF560:
	.string	"M_LOG2E 1.4426950408889634074"
.LASF286:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF411:
	.string	"UINT_LEAST8_MAX (255)"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF503:
	.string	"_MATH_H_MATHDEF 1"
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
.LASF522:
	.string	"__MATH_PRECNAME"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF623:
	.string	"intString1"
.LASF624:
	.string	"intString2"
.LASF635:
	.string	"/home/aravind/git/cleanflight"
.LASF584:
	.string	"REQUIRE_CC_ARM_PRINTF_SUPPORT "
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF478:
	.string	"_MATH_H 1"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF521:
	.string	"_Mdouble_END_NAMESPACE"
.LASF589:
	.string	"RAD (M_PIf / 180.0f)"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF276:
	.string	"__USE_GNU"
.LASF329:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF346:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF596:
	.string	"acos_approx(x) acosf(x)"
.LASF549:
	.string	"MATH_ERREXCEPT 2"
.LASF536:
	.string	"__MATHCALL"
.LASF477:
	.string	"_XLOCALE_H 1"
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
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF520:
	.string	"_Mdouble_BEGIN_NAMESPACE"
.LASF305:
	.string	"__GLIBC_MINOR__ 23"
.LASF439:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF273:
	.string	"__USE_FILE_OFFSET64"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF574:
	.string	"isless(x,y) __builtin_isless(x, y)"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF323:
	.string	"__END_NAMESPACE_STD "
.LASF360:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF454:
	.string	"__need_size_t "
.LASF328:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF625:
	.string	"decimalPoint"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF473:
	.string	"__need_size_t"
.LASF309:
	.string	"__LEAF , __leaf__"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF355:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF487:
	.string	"__DECL_SIMD_sincosf "
.LASF278:
	.string	"__USE_FORTIFY_LEVEL"
.LASF445:
	.string	"INT64_C(c) c ## L"
.LASF500:
	.string	"HUGE_VALL (__builtin_huge_vall())"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF532:
	.string	"__MATH_PRECNAME(name,r) name ##l ##r"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF330:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF451:
	.string	"UINTMAX_C(c) c ## UL"
.LASF317:
	.string	"__STRING(x) #x"
.LASF626:
	.string	"dpLocation"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF391:
	.string	"INT8_MIN (-128)"
.LASF569:
	.string	"M_2_SQRTPI 1.12837916709551257390"
.LASF585:
	.string	"REQUIRE_PRINTF_LONG_SUPPORT "
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF435:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF567:
	.string	"M_1_PI 0.31830988618379067154"
.LASF601:
	.string	"short int"
.LASF423:
	.string	"UINT_FAST8_MAX (255)"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF376:
	.string	"__stub_getmsg "
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF602:
	.string	"long int"
.LASF385:
	.string	"_BITS_WCHAR_H 1"
.LASF389:
	.string	"__uint32_t_defined "
.LASF261:
	.string	"__USE_POSIX2"
.LASF506:
	.string	"__SIMD_DECL(function) __CONCAT (__DECL_SIMD_, function)"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF420:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF524:
	.string	"_Mfloat_ float"
.LASF476:
	.string	"__need_NULL"
.LASF453:
	.string	"_STRING_H 1"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF617:
	.string	"nump"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF284:
	.string	"__USE_ISOC99 1"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF546:
	.string	"isnan(x) __builtin_isnan (x)"
.LASF459:
	.string	"_SYS_SIZE_T_H "
.LASF380:
	.string	"__stub_revoke "
.LASF364:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF277:
	.string	"__USE_REENTRANT"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF383:
	.string	"__stub_sstk "
.LASF269:
	.string	"__USE_XOPEN2K8"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF515:
	.string	"__MATH_PRECNAME(name,r) __CONCAT(name,r)"
.LASF264:
	.string	"__USE_XOPEN"
.LASF593:
	.string	"sin_approx(x) sinf(x)"
.LASF437:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF289:
	.string	"_POSIX_C_SOURCE"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF472:
	.string	"__size_t "
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF341:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF555:
	.string	"UNDERFLOW 4"
.LASF274:
	.string	"__USE_MISC"
.LASF493:
	.string	"__DECL_SIMD_expf "
.LASF296:
	.string	"__USE_XOPEN2K8 1"
.LASF326:
	.string	"__END_NAMESPACE_C99 "
.LASF428:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF418:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF554:
	.string	"OVERFLOW 3"
.LASF530:
	.string	"_Mlong_double_ long double"
.LASF282:
	.string	"_DEFAULT_SOURCE"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF518:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_STD"
.LASF543:
	.string	"signbit(x) (sizeof (x) == sizeof (float) ? __builtin_signbitf (x) : sizeof (x) == sizeof (double) ? __builtin_signbit (x) : __builtin_signbitl (x))"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF331:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF466:
	.string	"_SIZE_T_DEFINED "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF614:
	.string	"uli2a"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF371:
	.string	"__stub___compat_bdflush "
.LASF609:
	.string	"sizetype"
.LASF256:
	.string	"__USE_ISOC11"
.LASF608:
	.string	"long unsigned int"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF414:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF372:
	.string	"__stub_chflags "
.LASF238:
	.string	"__unix 1"
.LASF480:
	.string	"__DECL_SIMD_cos "
.LASF632:
	.string	"expon"
.LASF582:
	.string	"INLINE_UNIT_TESTED inline"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF603:
	.string	"int32_t"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF620:
	.string	"ftoa"
.LASF369:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF508:
	.string	"__MATHDECL_VEC(type,function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHDECL(type, function,suffix, args)"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF498:
	.string	"HUGE_VAL (__builtin_huge_val())"
.LASF338:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF416:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF542:
	.string	"fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)"
.LASF314:
	.string	"__P(args) args"
.LASF561:
	.string	"M_LOG10E 0.43429448190325182765"
.LASF268:
	.string	"__USE_XOPEN2KXSI"
.LASF340:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF225:
	.string	"__k8 1"
.LASF304:
	.string	"__GLIBC__ 2"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF358:
	.string	"__restrict_arr __restrict"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF347:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF605:
	.string	"unsigned char"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF397:
	.string	"INT32_MAX (2147483647)"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF433:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF424:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF540:
	.string	"FP_SUBNORMAL 3"
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
.LASF523:
	.string	"__MATH_DECLARING_DOUBLE"
.LASF577:
	.string	"isunordered(u,v) __builtin_isunordered(u, v)"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF496:
	.string	"__DECL_SIMD_powf "
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF562:
	.string	"M_LN2 0.69314718055994530942"
.LASF226:
	.string	"__k8__ 1"
.LASF533:
	.string	"__MATH_DECLARE_LDOUBLE 1"
.LASF551:
	.string	"X_TLOSS 1.41484755040568800000e+16"
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
.LASF528:
	.string	"_Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99"
.LASF538:
	.string	"FP_INFINITE 1"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF349:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF321:
	.string	"__END_DECLS "
.LASF563:
	.string	"M_LN10 2.30258509299404568402"
.LASF513:
	.string	"__MATHDECL_1(type,function,suffix,args) extern type __MATH_PRECNAME(function,suffix) args __THROW"
.LASF270:
	.string	"__USE_XOPEN2K8XSI"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF615:
	.string	"li2a"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF344:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF431:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF408:
	.string	"INT_LEAST16_MAX (32767)"
.LASF271:
	.string	"__USE_LARGEFILE"
.LASF489:
	.string	"__DECL_SIMD_log "
.LASF600:
	.string	"signed char"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF299:
	.string	"__USE_MISC 1"
.LASF534:
	.string	"__MATHDECL_1"
.LASF606:
	.string	"short unsigned int"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF229:
	.string	"__SSE__ 1"
.LASF588:
	.string	"M_PIf 3.14159265358979323846f"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF471:
	.string	"_SIZET_ "
.LASF375:
	.string	"__stub_fdetach "
.LASF446:
	.string	"UINT8_C(c) c"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF332:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF612:
	.string	"double"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF337:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF217:
	.string	"__amd64 1"
.LASF564:
	.string	"M_PI 3.14159265358979323846"
.LASF236:
	.string	"__linux__ 1"
.LASF362:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF541:
	.string	"FP_NORMAL 4"
.LASF417:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF581:
	.string	"STATIC_INLINE_UNIT_TESTED static inline"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF398:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF486:
	.string	"__DECL_SIMD_sincos "
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF502:
	.string	"NAN (__builtin_nanf (\"\"))"
.LASF505:
	.string	"FP_ILOGBNAN (-2147483647 - 1)"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
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
.LASF529:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_C99"
.LASF378:
	.string	"__stub_lchmod "
.LASF432:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF368:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
