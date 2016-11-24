	.file	"parameter_group.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed parameter_group.i -mtune=generic
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
	.section	.text.pgN,"ax",@progbits
	.type	pgN, @function
pgN:
.LFB0:
	.file 1 "src/main/config/parameter_group.h"
	.loc 1 51 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# reg, reg
	.loc 1 51 0
	movq	-8(%rbp), %rax	# reg, tmp90
	movzwl	(%rax), %eax	# reg_2(D)->pgn, D.2337
	andw	$4095, %ax	#, D.2338
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	pgN, .-pgN
	.section	.text.pgVersion,"ax",@progbits
	.type	pgVersion, @function
pgVersion:
.LFB1:
	.loc 1 52 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# reg, reg
	.loc 1 52 0
	movq	-8(%rbp), %rax	# reg, tmp91
	movzwl	(%rax), %eax	# reg_2(D)->pgn, D.2339
	shrw	$12, %ax	#, D.2339
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	pgVersion, .-pgVersion
	.section	.text.pgSize,"ax",@progbits
	.type	pgSize, @function
pgSize:
.LFB2:
	.loc 1 53 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# reg, reg
	.loc 1 53 0
	movq	-8(%rbp), %rax	# reg, tmp90
	movzwl	2(%rax), %eax	# reg_2(D)->size, D.2341
	andw	$4095, %ax	#, D.2342
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	pgSize, .-pgSize
	.section	.text.pgIsSystem,"ax",@progbits
	.type	pgIsSystem, @function
pgIsSystem:
.LFB3:
	.loc 1 54 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# reg, reg
	.loc 1 54 0
	movq	-8(%rbp), %rax	# reg, tmp92
	movzwl	2(%rax), %eax	# reg_2(D)->size, D.2343
	notl	%eax	# tmp93
	shrw	$15, %ax	#, tmp94
	movzbl	%al, %eax	# D.2345, D.2346
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	pgIsSystem, .-pgIsSystem
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.section	.text.pgFind,"ax",@progbits
	.globl	pgFind
	.type	pgFind, @function
pgFind:
.LFB4:
	.file 2 "src/main/config/parameter_group.c"
	.loc 2 26 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movl	%edi, %eax	# pgn, tmp91
	movw	%ax, -20(%rbp)	# tmp91, pgn
.LBB2:
	.loc 2 27 0
	movq	__pg_registry_start(%rip), %rax	# __pg_registry_start, tmp92
	movq	%rax, -8(%rbp)	# tmp92, reg
	jmp	.L10	#
.L13:
	.loc 2 28 0
	movq	-8(%rbp), %rax	# reg, tmp93
	movq	%rax, %rdi	# tmp93,
	call	pgN	#
	cmpw	-20(%rbp), %ax	# pgn, D.2349
	jne	.L11	#,
	.loc 2 29 0
	movq	-8(%rbp), %rax	# reg, D.2347
	jmp	.L12	#
.L11:
	.loc 2 27 0 discriminator 2
	addq	$32, -8(%rbp)	#, reg
.L10:
	.loc 2 27 0 is_stmt 0 discriminator 1
	movq	__pg_registry_end(%rip), %rax	# __pg_registry_end, D.2348
	cmpq	%rax, -8(%rbp)	# D.2348, reg
	jb	.L13	#,
.LBE2:
	.loc 2 32 0 is_stmt 1
	movl	$0, %eax	#, D.2347
.L12:
	.loc 2 33 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	pgFind, .-pgFind
	.section	.text.pgOffset,"ax",@progbits
	.type	pgOffset, @function
pgOffset:
.LFB5:
	.loc 2 36 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# reg, reg
	movl	%esi, %eax	# profileIndex, tmp94
	movb	%al, -28(%rbp)	# tmp94, profileIndex
	.loc 2 37 0
	movq	-24(%rbp), %rax	# reg, tmp95
	movq	%rax, %rdi	# tmp95,
	call	pgSize	#
	movw	%ax, -10(%rbp)	# tmp96, regSize
	.loc 2 39 0
	movq	-24(%rbp), %rax	# reg, tmp97
	movq	8(%rax), %rax	# reg_3(D)->address, tmp98
	movq	%rax, -8(%rbp)	# tmp98, base
	.loc 2 40 0
	movq	-24(%rbp), %rax	# reg, tmp99
	movq	%rax, %rdi	# tmp99,
	call	pgIsSystem	#
	testw	%ax, %ax	# D.2350
	jne	.L15	#,
	.loc 2 41 0
	movzwl	-10(%rbp), %edx	# regSize, D.2351
	movzbl	-28(%rbp), %eax	# profileIndex, D.2351
	imull	%edx, %eax	# D.2351, D.2351
	cltq
	addq	%rax, -8(%rbp)	# D.2352, base
.L15:
	.loc 2 43 0
	movq	-8(%rbp), %rax	# base, D.2353
	.loc 2 44 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	pgOffset, .-pgOffset
	.section	.text.pgResetInstance,"ax",@progbits
	.type	pgResetInstance, @function
pgResetInstance:
.LFB6:
	.loc 2 47 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# reg, reg
	movq	%rsi, -32(%rbp)	# base, base
	.loc 2 48 0
	movq	-24(%rbp), %rax	# reg, tmp97
	movq	%rax, %rdi	# tmp97,
	call	pgSize	#
	movw	%ax, -2(%rbp)	# tmp98, regSize
	.loc 2 50 0
	movzwl	-2(%rbp), %edx	# regSize, D.2354
	movq	-32(%rbp), %rax	# base, tmp99
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp99,
	call	memset	#
	.loc 2 51 0
	movq	-24(%rbp), %rax	# reg, tmp100
	movq	24(%rax), %rdx	# reg_3(D)->reset.ptr, D.2355
	movq	__pg_resetdata_start(%rip), %rax	# __pg_resetdata_start, D.2356
	cmpq	%rax, %rdx	# D.2356, D.2355
	jb	.L18	#,
	.loc 2 51 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax	# reg, tmp101
	movq	24(%rax), %rdx	# reg_3(D)->reset.ptr, D.2355
	movq	__pg_resetdata_end(%rip), %rax	# __pg_resetdata_end, D.2356
	cmpq	%rax, %rdx	# D.2356, D.2355
	jnb	.L18	#,
	.loc 2 53 0 is_stmt 1
	movzwl	-2(%rbp), %edx	# regSize, D.2354
	movq	-24(%rbp), %rax	# reg, tmp102
	movq	24(%rax), %rcx	# reg_3(D)->reset.ptr, D.2355
	movq	-32(%rbp), %rax	# base, tmp103
	movq	%rcx, %rsi	# D.2355,
	movq	%rax, %rdi	# tmp103,
	call	memcpy	#
	.loc 2 58 0
	jmp	.L20	#
.L18:
	.loc 2 54 0
	movq	-24(%rbp), %rax	# reg, tmp104
	movq	24(%rax), %rax	# reg_3(D)->reset.fn, D.2357
	testq	%rax, %rax	# D.2357
	je	.L20	#,
	.loc 2 56 0
	movq	-24(%rbp), %rax	# reg, tmp105
	movq	24(%rax), %rax	# reg_3(D)->reset.fn, D.2357
	movzwl	-2(%rbp), %ecx	# regSize, D.2358
	movq	-32(%rbp), %rdx	# base, tmp106
	movl	%ecx, %esi	# D.2358,
	movq	%rdx, %rdi	# tmp106,
	call	*%rax	# D.2357
.L20:
	.loc 2 58 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	pgResetInstance, .-pgResetInstance
	.section	.text.pgReset,"ax",@progbits
	.globl	pgReset
	.type	pgReset, @function
pgReset:
.LFB7:
	.loc 2 61 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# reg, reg
	movl	%esi, -12(%rbp)	# profileIndex, profileIndex
	.loc 2 62 0
	movl	-12(%rbp), %eax	# profileIndex, tmp90
	movzbl	%al, %edx	# D.2359, D.2360
	movq	-8(%rbp), %rax	# reg, tmp91
	movl	%edx, %esi	# D.2360,
	movq	%rax, %rdi	# tmp91,
	call	pgOffset	#
	movq	%rax, %rdx	#, D.2361
	movq	-8(%rbp), %rax	# reg, tmp92
	movq	%rdx, %rsi	# D.2361,
	movq	%rax, %rdi	# tmp92,
	call	pgResetInstance	#
	.loc 2 63 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	pgReset, .-pgReset
	.section	.text.pgResetCurrent,"ax",@progbits
	.globl	pgResetCurrent
	.type	pgResetCurrent, @function
pgResetCurrent:
.LFB8:
	.loc 2 66 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# reg, reg
	.loc 2 67 0
	movq	-8(%rbp), %rax	# reg, tmp91
	movq	%rax, %rdi	# tmp91,
	call	pgIsSystem	#
	testw	%ax, %ax	# D.2362
	je	.L23	#,
	.loc 2 68 0
	movq	-8(%rbp), %rax	# reg, tmp92
	movq	8(%rax), %rdx	# reg_3(D)->address, D.2363
	movq	-8(%rbp), %rax	# reg, tmp93
	movq	%rdx, %rsi	# D.2363,
	movq	%rax, %rdi	# tmp93,
	call	pgResetInstance	#
	.loc 2 72 0
	jmp	.L25	#
.L23:
	.loc 2 70 0
	movq	-8(%rbp), %rax	# reg, tmp94
	movq	16(%rax), %rax	# reg_3(D)->ptr, D.2364
	movq	(%rax), %rdx	# *_8, D.2363
	movq	-8(%rbp), %rax	# reg, tmp95
	movq	%rdx, %rsi	# D.2363,
	movq	%rax, %rdi	# tmp95,
	call	pgResetInstance	#
.L25:
	.loc 2 72 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	pgResetCurrent, .-pgResetCurrent
	.section	.text.pgLoad,"ax",@progbits
	.globl	pgLoad
	.type	pgLoad, @function
pgLoad:
.LFB9:
	.loc 2 75 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# reg, reg
	movl	%esi, -44(%rbp)	# profileIndex, profileIndex
	movq	%rdx, -56(%rbp)	# from, from
	movl	%ecx, -48(%rbp)	# size, size
	movl	%r8d, -60(%rbp)	# version, version
	.loc 2 76 0
	movl	-44(%rbp), %eax	# profileIndex, tmp100
	movzbl	%al, %edx	# D.2366, D.2365
	movq	-40(%rbp), %rax	# reg, tmp101
	movl	%edx, %esi	# D.2365,
	movq	%rax, %rdi	# tmp101,
	call	pgOffset	#
	movq	%rax, %rdx	#, D.2367
	movq	-40(%rbp), %rax	# reg, tmp102
	movq	%rdx, %rsi	# D.2367,
	movq	%rax, %rdi	# tmp102,
	call	pgResetInstance	#
	.loc 2 78 0
	movq	-40(%rbp), %rax	# reg, tmp103
	movq	%rax, %rdi	# tmp103,
	call	pgVersion	#
	movzbl	%al, %eax	# D.2366, D.2365
	cmpl	-60(%rbp), %eax	# version, D.2365
	jne	.L30	#,
.LBB3:
	.loc 2 79 0
	movq	-40(%rbp), %rax	# reg, tmp104
	movq	%rax, %rdi	# tmp104,
	call	pgSize	#
	movzwl	%ax, %eax	# D.2368, D.2365
	cmpl	-48(%rbp), %eax	# size, D.2365
	jg	.L28	#,
	.loc 2 79 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# reg, tmp105
	movq	%rax, %rdi	# tmp105,
	call	pgSize	#
	movzwl	%ax, %eax	# D.2368, D.2365
	jmp	.L29	#
.L28:
	.loc 2 79 0 discriminator 2
	movl	-48(%rbp), %eax	# size, D.2365
.L29:
	.loc 2 79 0 discriminator 4
	movl	%eax, -20(%rbp)	# D.2365, take
	.loc 2 80 0 is_stmt 1 discriminator 4
	movl	-20(%rbp), %eax	# take, tmp106
	movslq	%eax, %rbx	# tmp106, D.2369
	movl	-44(%rbp), %eax	# profileIndex, tmp107
	movzbl	%al, %edx	# D.2366, D.2365
	movq	-40(%rbp), %rax	# reg, tmp108
	movl	%edx, %esi	# D.2365,
	movq	%rax, %rdi	# tmp108,
	call	pgOffset	#
	movq	%rax, %rcx	#, D.2367
	movq	-56(%rbp), %rax	# from, tmp109
	movq	%rbx, %rdx	# D.2369,
	movq	%rax, %rsi	# tmp109,
	movq	%rcx, %rdi	# D.2367,
	call	memcpy	#
.L30:
.LBE3:
	.loc 2 82 0
	nop
	addq	$56, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	pgLoad, .-pgLoad
	.section	.text.pgStore,"ax",@progbits
	.globl	pgStore
	.type	pgStore, @function
pgStore:
.LFB10:
	.loc 2 85 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# reg, reg
	movq	%rsi, -48(%rbp)	# to, to
	movl	%edx, -52(%rbp)	# size, size
	movl	%ecx, %eax	# profileIndex, tmp96
	movb	%al, -56(%rbp)	# tmp96, profileIndex
	.loc 2 86 0
	movq	-40(%rbp), %rax	# reg, tmp97
	movq	%rax, %rdi	# tmp97,
	call	pgSize	#
	movzwl	%ax, %eax	# D.2371, D.2370
	cmpl	-52(%rbp), %eax	# size, D.2370
	jg	.L32	#,
	.loc 2 86 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# reg, tmp98
	movq	%rax, %rdi	# tmp98,
	call	pgSize	#
	movzwl	%ax, %eax	# D.2371, D.2370
	jmp	.L33	#
.L32:
	.loc 2 86 0 discriminator 2
	movl	-52(%rbp), %eax	# size, D.2370
.L33:
	.loc 2 86 0 discriminator 4
	movl	%eax, -20(%rbp)	# D.2370, take
	.loc 2 87 0 is_stmt 1 discriminator 4
	movl	-20(%rbp), %eax	# take, tmp99
	movslq	%eax, %rbx	# tmp99, D.2372
	movzbl	-56(%rbp), %edx	# profileIndex, D.2370
	movq	-40(%rbp), %rax	# reg, tmp100
	movl	%edx, %esi	# D.2370,
	movq	%rax, %rdi	# tmp100,
	call	pgOffset	#
	movq	%rax, %rcx	#, D.2373
	movq	-48(%rbp), %rax	# to, tmp101
	movq	%rbx, %rdx	# D.2372,
	movq	%rcx, %rsi	# D.2373,
	movq	%rax, %rdi	# tmp101,
	call	memcpy	#
	.loc 2 88 0 discriminator 4
	movl	-20(%rbp), %eax	# take, D.2370
	.loc 2 89 0 discriminator 4
	addq	$56, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	pgStore, .-pgStore
	.section	.text.pgResetAll,"ax",@progbits
	.globl	pgResetAll
	.type	pgResetAll, @function
pgResetAll:
.LFB11:
	.loc 2 93 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# profileCount, profileCount
.LBB4:
	.loc 2 94 0
	movq	__pg_registry_start(%rip), %rax	# __pg_registry_start, tmp89
	movq	%rax, -8(%rbp)	# tmp89, reg
	jmp	.L36	#
.L41:
	.loc 2 95 0
	movq	-8(%rbp), %rax	# reg, tmp90
	movq	%rax, %rdi	# tmp90,
	call	pgIsSystem	#
	testw	%ax, %ax	# D.2375
	je	.L37	#,
	.loc 2 96 0
	movq	-8(%rbp), %rax	# reg, tmp91
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	pgReset	#
	jmp	.L38	#
.L37:
.LBB5:
	.loc 2 99 0
	movl	$0, -12(%rbp)	#, profileIndex
	jmp	.L39	#
.L40:
	.loc 2 100 0 discriminator 3
	movl	-12(%rbp), %edx	# profileIndex, tmp92
	movq	-8(%rbp), %rax	# reg, tmp93
	movl	%edx, %esi	# tmp92,
	movq	%rax, %rdi	# tmp93,
	call	pgReset	#
	.loc 2 99 0 discriminator 3
	addl	$1, -12(%rbp)	#, profileIndex
.L39:
	.loc 2 99 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax	# profileIndex, tmp94
	cmpl	-20(%rbp), %eax	# profileCount, tmp94
	jl	.L40	#,
.L38:
.LBE5:
	.loc 2 94 0 is_stmt 1 discriminator 2
	addq	$32, -8(%rbp)	#, reg
.L36:
	.loc 2 94 0 is_stmt 0 discriminator 1
	movq	__pg_registry_end(%rip), %rax	# __pg_registry_end, D.2374
	cmpq	%rax, -8(%rbp)	# D.2374, reg
	jb	.L41	#,
.LBE4:
	.loc 2 104 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	pgResetAll, .-pgResetAll
	.section	.text.pgActivateProfile,"ax",@progbits
	.globl	pgActivateProfile
	.type	pgActivateProfile, @function
pgActivateProfile:
.LFB12:
	.loc 2 107 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movl	%edi, -20(%rbp)	# profileIndex, profileIndex
.LBB6:
	.loc 2 108 0
	movq	__pg_registry_start(%rip), %rax	# __pg_registry_start, tmp92
	movq	%rax, -16(%rbp)	# tmp92, reg
	jmp	.L43	#
.L45:
	.loc 2 109 0
	movq	-16(%rbp), %rax	# reg, tmp93
	movq	%rax, %rdi	# tmp93,
	call	pgIsSystem	#
	testw	%ax, %ax	# D.2377
	jne	.L44	#,
.LBB7:
	.loc 2 110 0
	movl	-20(%rbp), %eax	# profileIndex, tmp94
	movzbl	%al, %edx	# D.2378, D.2379
	movq	-16(%rbp), %rax	# reg, tmp95
	movl	%edx, %esi	# D.2379,
	movq	%rax, %rdi	# tmp95,
	call	pgOffset	#
	movq	%rax, -8(%rbp)	# tmp96, ptr
	.loc 2 111 0
	movq	-16(%rbp), %rax	# reg, tmp97
	movq	16(%rax), %rax	# reg_1->ptr, D.2380
	movq	-8(%rbp), %rdx	# ptr, tmp98
	movq	%rdx, (%rax)	# tmp98, *_14
.L44:
.LBE7:
	.loc 2 108 0 discriminator 2
	addq	$32, -16(%rbp)	#, reg
.L43:
	.loc 2 108 0 is_stmt 0 discriminator 1
	movq	__pg_registry_end(%rip), %rax	# __pg_registry_end, D.2376
	cmpq	%rax, -16(%rbp)	# D.2376, reg
	jb	.L45	#,
.LBE6:
	.loc 2 114 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	pgActivateProfile, .-pgActivateProfile
	.text
.Letext0:
	.file 3 "/usr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5bd
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF589
	.byte	0xc
	.long	.LASF590
	.long	.LASF591
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF544
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF545
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF546
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF547
	.uleb128 0x4
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF548
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF549
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF550
	.uleb128 0x5
	.long	.LASF552
	.byte	0x3
	.byte	0x30
	.long	0x75
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF551
	.uleb128 0x5
	.long	.LASF553
	.byte	0x3
	.byte	0x31
	.long	0x49
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF554
	.uleb128 0x5
	.long	.LASF555
	.byte	0x1
	.byte	0x15
	.long	0x7c
	.uleb128 0x6
	.byte	0x4
	.long	0x87
	.byte	0x1
	.byte	0x1d
	.long	0xc8
	.uleb128 0x7
	.long	.LASF556
	.value	0xfff
	.uleb128 0x7
	.long	.LASF557
	.value	0xf000
	.uleb128 0x7
	.long	.LASF558
	.value	0xfff
	.uleb128 0x8
	.long	.LASF559
	.byte	0
	.uleb128 0x7
	.long	.LASF560
	.value	0x8000
	.byte	0
	.uleb128 0x5
	.long	.LASF561
	.byte	0x1
	.byte	0x26
	.long	0xd3
	.uleb128 0x9
	.long	0xe3
	.uleb128 0xa
	.long	0xe3
	.uleb128 0xa
	.long	0x3b
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.uleb128 0xc
	.byte	0x8
	.byte	0x1
	.byte	0x2d
	.long	0x103
	.uleb128 0xd
	.string	"ptr"
	.byte	0x1
	.byte	0x2e
	.long	0xe3
	.uleb128 0xd
	.string	"fn"
	.byte	0x1
	.byte	0x2f
	.long	0x103
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0xc8
	.uleb128 0xf
	.long	.LASF592
	.byte	0x20
	.byte	0x1
	.byte	0x28
	.long	0x152
	.uleb128 0x10
	.string	"pgn"
	.byte	0x1
	.byte	0x29
	.long	0x8e
	.byte	0
	.uleb128 0x11
	.long	.LASF562
	.byte	0x1
	.byte	0x2a
	.long	0x7c
	.byte	0x2
	.uleb128 0x11
	.long	.LASF563
	.byte	0x1
	.byte	0x2b
	.long	0x152
	.byte	0x8
	.uleb128 0x10
	.string	"ptr"
	.byte	0x1
	.byte	0x2c
	.long	0x158
	.byte	0x10
	.uleb128 0x11
	.long	.LASF564
	.byte	0x1
	.byte	0x30
	.long	0xe5
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x6a
	.uleb128 0xe
	.byte	0x8
	.long	0x152
	.uleb128 0x5
	.long	.LASF565
	.byte	0x1
	.byte	0x31
	.long	0x109
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF566
	.uleb128 0x12
	.string	"pgN"
	.byte	0x1
	.byte	0x33
	.long	0x7c
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a0
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x33
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x1a6
	.uleb128 0x4
	.long	0x15e
	.uleb128 0x14
	.long	.LASF567
	.byte	0x1
	.byte	0x34
	.long	0x6a
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x1db
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x34
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.long	.LASF568
	.byte	0x1
	.byte	0x35
	.long	0x7c
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x20b
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x35
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.long	.LASF569
	.byte	0x1
	.byte	0x36
	.long	0x7c
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x23b
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x36
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF580
	.byte	0x2
	.byte	0x19
	.long	0x1a0
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x28b
	.uleb128 0x13
	.string	"pgn"
	.byte	0x2
	.byte	0x19
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x17
	.string	"reg"
	.byte	0x2
	.byte	0x1b
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF570
	.byte	0x2
	.byte	0x23
	.long	0x152
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2e5
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x23
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.long	.LASF571
	.byte	0x2
	.byte	0x23
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.long	.LASF572
	.byte	0x2
	.byte	0x25
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1a
	.long	.LASF573
	.byte	0x2
	.byte	0x27
	.long	0x152
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.long	0x7c
	.uleb128 0x1b
	.long	.LASF593
	.byte	0x2
	.byte	0x2e
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x332
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x2e
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.long	.LASF573
	.byte	0x2
	.byte	0x2e
	.long	0x152
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF572
	.byte	0x2
	.byte	0x30
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x1c
	.long	.LASF574
	.byte	0x2
	.byte	0x3c
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x36c
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x3c
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.long	.LASF571
	.byte	0x2
	.byte	0x3c
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1c
	.long	.LASF575
	.byte	0x2
	.byte	0x41
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x398
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x41
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.long	.LASF576
	.byte	0x2
	.byte	0x4a
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x41e
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x4a
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.long	.LASF571
	.byte	0x2
	.byte	0x4a
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x19
	.long	.LASF577
	.byte	0x2
	.byte	0x4a
	.long	0x41e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x19
	.long	.LASF562
	.byte	0x2
	.byte	0x4a
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x19
	.long	.LASF578
	.byte	0x2
	.byte	0x4a
	.long	0x3b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x16
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x1a
	.long	.LASF579
	.byte	0x2
	.byte	0x4f
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x424
	.uleb128 0x1d
	.uleb128 0x15
	.long	.LASF581
	.byte	0x2
	.byte	0x54
	.long	0x3b
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x48e
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x54
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x13
	.string	"to"
	.byte	0x2
	.byte	0x54
	.long	0xe3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x19
	.long	.LASF562
	.byte	0x2
	.byte	0x54
	.long	0x3b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x19
	.long	.LASF571
	.byte	0x2
	.byte	0x54
	.long	0x6a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1a
	.long	.LASF579
	.byte	0x2
	.byte	0x56
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x1c
	.long	.LASF582
	.byte	0x2
	.byte	0x5c
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x4fa
	.uleb128 0x19
	.long	.LASF583
	.byte	0x2
	.byte	0x5c
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x17
	.string	"reg"
	.byte	0x2
	.byte	0x5e
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1a
	.long	.LASF571
	.byte	0x2
	.byte	0x63
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF584
	.byte	0x2
	.byte	0x6a
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x566
	.uleb128 0x19
	.long	.LASF571
	.byte	0x2
	.byte	0x6a
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x17
	.string	"reg"
	.byte	0x2
	.byte	0x6c
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x17
	.string	"ptr"
	.byte	0x2
	.byte	0x6e
	.long	0x152
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF585
	.byte	0x1
	.byte	0x43
	.long	0x57b
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xe
	.byte	0x8
	.long	0x15e
	.uleb128 0x1e
	.long	.LASF586
	.byte	0x1
	.byte	0x44
	.long	0x57b
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x1e
	.long	.LASF587
	.byte	0x1
	.byte	0x47
	.long	0x152
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x1e
	.long	.LASF588
	.byte	0x1
	.byte	0x48
	.long	0x152
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
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
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1d
	.uleb128 0x26
	.byte	0
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0xec
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
	.quad	0
	.quad	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x2
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
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 6 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x17
	.long	.LASF306
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
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.file 12 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x15
	.long	.LASF439
	.byte	0x4
	.byte	0x4
	.file 13 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x17
	.long	.LASF440
	.file 14 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF508
	.byte	0x4
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 15 "./src/main/common/maths.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
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
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.39.99b5021e28f91cdb161c889e07266673,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF254
	.byte	0x5
	.uleb128 0x28
	.long	.LASF255
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF256
	.byte	0x5
	.uleb128 0x89
	.long	.LASF257
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF258
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF259
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF260
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF261
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF262
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF263
	.byte	0x5
	.uleb128 0x90
	.long	.LASF264
	.byte	0x5
	.uleb128 0x91
	.long	.LASF265
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF266
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF267
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF268
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF269
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF270
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF271
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF272
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF273
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF274
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF275
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF276
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF277
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF278
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF279
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF280
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF281
	.byte	0x5
	.uleb128 0xca
	.long	.LASF282
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF283
	.byte	0x6
	.uleb128 0xee
	.long	.LASF284
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF285
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF286
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF287
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF288
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF289
	.byte	0x5
	.uleb128 0x110
	.long	.LASF290
	.byte	0x5
	.uleb128 0x111
	.long	.LASF291
	.byte	0x5
	.uleb128 0x112
	.long	.LASF292
	.byte	0x5
	.uleb128 0x113
	.long	.LASF293
	.byte	0x5
	.uleb128 0x114
	.long	.LASF294
	.byte	0x5
	.uleb128 0x115
	.long	.LASF295
	.byte	0x5
	.uleb128 0x116
	.long	.LASF296
	.byte	0x5
	.uleb128 0x117
	.long	.LASF297
	.byte	0x5
	.uleb128 0x118
	.long	.LASF298
	.byte	0x5
	.uleb128 0x119
	.long	.LASF299
	.byte	0x6
	.uleb128 0x126
	.long	.LASF300
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF301
	.byte	0x6
	.uleb128 0x191
	.long	.LASF302
	.byte	0x5
	.uleb128 0x196
	.long	.LASF303
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF304
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF305
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8a17512e4762abcff59e629b80463c10,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF307
	.byte	0x6
	.uleb128 0x61
	.long	.LASF308
	.byte	0x6
	.uleb128 0x62
	.long	.LASF309
	.byte	0x6
	.uleb128 0x63
	.long	.LASF310
	.byte	0x6
	.uleb128 0x64
	.long	.LASF311
	.byte	0x6
	.uleb128 0x65
	.long	.LASF312
	.byte	0x6
	.uleb128 0x66
	.long	.LASF313
	.byte	0x6
	.uleb128 0x67
	.long	.LASF314
	.byte	0x6
	.uleb128 0x68
	.long	.LASF315
	.byte	0x6
	.uleb128 0x69
	.long	.LASF316
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF317
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF318
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF319
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF320
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF321
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF322
	.byte	0x6
	.uleb128 0x70
	.long	.LASF323
	.byte	0x6
	.uleb128 0x71
	.long	.LASF324
	.byte	0x6
	.uleb128 0x72
	.long	.LASF325
	.byte	0x6
	.uleb128 0x73
	.long	.LASF326
	.byte	0x6
	.uleb128 0x74
	.long	.LASF327
	.byte	0x6
	.uleb128 0x75
	.long	.LASF328
	.byte	0x6
	.uleb128 0x76
	.long	.LASF329
	.byte	0x6
	.uleb128 0x77
	.long	.LASF330
	.byte	0x6
	.uleb128 0x78
	.long	.LASF331
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF332
	.byte	0x5
	.uleb128 0x88
	.long	.LASF333
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF334
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF335
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF336
	.byte	0x5
	.uleb128 0xce
	.long	.LASF337
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF338
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF339
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF340
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF341
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF342
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF343
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF344
	.byte	0x5
	.uleb128 0x101
	.long	.LASF345
	.byte	0x5
	.uleb128 0x105
	.long	.LASF346
	.byte	0x5
	.uleb128 0x109
	.long	.LASF347
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF310
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF337
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF309
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF336
	.byte	0x5
	.uleb128 0x111
	.long	.LASF348
	.byte	0x6
	.uleb128 0x112
	.long	.LASF349
	.byte	0x5
	.uleb128 0x113
	.long	.LASF350
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF351
	.byte	0x5
	.uleb128 0x141
	.long	.LASF352
	.byte	0x5
	.uleb128 0x154
	.long	.LASF353
	.byte	0x6
	.uleb128 0x161
	.long	.LASF354
	.byte	0x5
	.uleb128 0x162
	.long	.LASF355
	.byte	0x5
	.uleb128 0x166
	.long	.LASF356
	.byte	0x5
	.uleb128 0x167
	.long	.LASF357
	.byte	0x5
	.uleb128 0x169
	.long	.LASF358
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF359
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF360
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF361
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF362
	.byte	0x5
	.uleb128 0x37
	.long	.LASF363
	.byte	0x5
	.uleb128 0x38
	.long	.LASF364
	.byte	0x5
	.uleb128 0x39
	.long	.LASF365
	.byte	0x5
	.uleb128 0x52
	.long	.LASF366
	.byte	0x5
	.uleb128 0x53
	.long	.LASF367
	.byte	0x5
	.uleb128 0x58
	.long	.LASF368
	.byte	0x5
	.uleb128 0x59
	.long	.LASF369
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF370
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF371
	.byte	0x5
	.uleb128 0x65
	.long	.LASF372
	.byte	0x5
	.uleb128 0x66
	.long	.LASF373
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF374
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF375
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF376
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF377
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF378
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF379
	.byte	0x5
	.uleb128 0x84
	.long	.LASF380
	.byte	0x5
	.uleb128 0x85
	.long	.LASF381
	.byte	0x5
	.uleb128 0x88
	.long	.LASF382
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF383
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF384
	.byte	0x5
	.uleb128 0x96
	.long	.LASF385
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF386
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF387
	.byte	0x5
	.uleb128 0xba
	.long	.LASF388
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF389
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF390
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF391
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF392
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF393
	.byte	0x5
	.uleb128 0xec
	.long	.LASF394
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF395
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF396
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF397
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF398
	.byte	0x5
	.uleb128 0x114
	.long	.LASF399
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF400
	.byte	0x5
	.uleb128 0x125
	.long	.LASF401
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF402
	.byte	0x5
	.uleb128 0x133
	.long	.LASF403
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF404
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF405
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF406
	.byte	0x5
	.uleb128 0x157
	.long	.LASF407
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF408
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF409
	.byte	0x5
	.uleb128 0x172
	.long	.LASF410
	.byte	0x5
	.uleb128 0x181
	.long	.LASF411
	.byte	0x5
	.uleb128 0x182
	.long	.LASF412
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF413
	.byte	0x5
	.uleb128 0xa
	.long	.LASF414
	.byte	0x5
	.uleb128 0xc
	.long	.LASF415
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF416
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF417
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF418
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF419
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF420
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF421
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF422
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF423
	.byte	0x5
	.uleb128 0xb
	.long	.LASF424
	.byte	0x5
	.uleb128 0xc
	.long	.LASF425
	.byte	0x5
	.uleb128 0xd
	.long	.LASF426
	.byte	0x5
	.uleb128 0xe
	.long	.LASF427
	.byte	0x5
	.uleb128 0xf
	.long	.LASF428
	.byte	0x5
	.uleb128 0x10
	.long	.LASF429
	.byte	0x5
	.uleb128 0x11
	.long	.LASF430
	.byte	0x5
	.uleb128 0x12
	.long	.LASF431
	.byte	0x5
	.uleb128 0x13
	.long	.LASF432
	.byte	0x5
	.uleb128 0x14
	.long	.LASF433
	.byte	0x5
	.uleb128 0x15
	.long	.LASF434
	.byte	0x5
	.uleb128 0x16
	.long	.LASF435
	.byte	0x5
	.uleb128 0x17
	.long	.LASF436
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.30.22986d42631c138e09c46135db8750fc,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF437
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF438
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.161.19e15733342b50ead2919490b095303e,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF266
	.byte	0x6
	.uleb128 0xee
	.long	.LASF284
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF301
	.byte	0x6
	.uleb128 0x191
	.long	.LASF302
	.byte	0x5
	.uleb128 0x196
	.long	.LASF303
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF304
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF305
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF441
	.byte	0x5
	.uleb128 0x22
	.long	.LASF442
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF443
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF444
	.byte	0x5
	.uleb128 0x34
	.long	.LASF445
	.byte	0x5
	.uleb128 0x78
	.long	.LASF446
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF447
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF448
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF449
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF450
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF451
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF452
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF453
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF454
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF455
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF456
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF457
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF458
	.byte	0x5
	.uleb128 0xad
	.long	.LASF459
	.byte	0x5
	.uleb128 0xae
	.long	.LASF460
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF461
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF462
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF463
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF464
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF465
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF466
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF467
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF468
	.byte	0x5
	.uleb128 0xba
	.long	.LASF469
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF470
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF471
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF472
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF473
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF474
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF475
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF476
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF477
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF478
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF479
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF480
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF481
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF482
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF483
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF484
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF485
	.byte	0x5
	.uleb128 0xec
	.long	.LASF486
	.byte	0x5
	.uleb128 0xee
	.long	.LASF487
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF488
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF489
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF490
	.byte	0x5
	.uleb128 0x100
	.long	.LASF491
	.byte	0x5
	.uleb128 0x101
	.long	.LASF492
	.byte	0x5
	.uleb128 0x105
	.long	.LASF493
	.byte	0x5
	.uleb128 0x111
	.long	.LASF494
	.byte	0x5
	.uleb128 0x112
	.long	.LASF495
	.byte	0x5
	.uleb128 0x116
	.long	.LASF496
	.byte	0x5
	.uleb128 0x117
	.long	.LASF497
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF498
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF499
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF500
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF501
	.byte	0x5
	.uleb128 0x124
	.long	.LASF502
	.byte	0x5
	.uleb128 0x125
	.long	.LASF503
	.byte	0x5
	.uleb128 0x126
	.long	.LASF504
	.byte	0x5
	.uleb128 0x128
	.long	.LASF505
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF506
	.byte	0x5
	.uleb128 0x130
	.long	.LASF507
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.parameter_group.h.56.2c35fb08513b9e011c03a8315cc978c7,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF509
	.byte	0x5
	.uleb128 0x45
	.long	.LASF510
	.byte	0x5
	.uleb128 0x49
	.long	.LASF511
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF512
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF513
	.byte	0x5
	.uleb128 0x52
	.long	.LASF514
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF515
	.byte	0x5
	.uleb128 0x65
	.long	.LASF516
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF517
	.byte	0x5
	.uleb128 0x76
	.long	.LASF518
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF519
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF520
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF521
	.byte	0x5
	.uleb128 0x93
	.long	.LASF522
	.byte	0x5
	.uleb128 0x99
	.long	.LASF523
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF524
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF525
	.byte	0x5
	.uleb128 0xba
	.long	.LASF526
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF527
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF528
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF529
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF530
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF531
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.maths.h.21.5b067f47e9a221ec30aa8aaee7f7dece,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF532
	.byte	0x5
	.uleb128 0x19
	.long	.LASF533
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF534
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF535
	.byte	0x5
	.uleb128 0x21
	.long	.LASF536
	.byte	0x5
	.uleb128 0x22
	.long	.LASF537
	.byte	0x5
	.uleb128 0x23
	.long	.LASF538
	.byte	0x5
	.uleb128 0x62
	.long	.LASF539
	.byte	0x5
	.uleb128 0x63
	.long	.LASF540
	.byte	0x5
	.uleb128 0x64
	.long	.LASF541
	.byte	0x5
	.uleb128 0x65
	.long	.LASF542
	.byte	0x5
	.uleb128 0x66
	.long	.LASF543
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF274:
	.string	"_SIZE_T_ "
.LASF311:
	.string	"__USE_ISOCXX11"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF297:
	.string	"__INT_WCHAR_T_H "
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF440:
	.string	"_STDINT_H 1"
.LASF523:
	.ascii	"PG_REGISTER_ARR_I(_type,_size,_name,_pgn,_version,_reset) _t"
	.ascii	"ype _name ## _SystemArray[_size]; extern"
	.string	" const pgRegistry_t _name ##_Registry; const pgRegistry_t _name ## _Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = (sizeof(_type) * _size) | PGR_SIZE_SYSTEM_FLAG, .address = (uint8_t*)&_name ## _SystemArray, .ptr = 0, _reset, }"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF577:
	.string	"from"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF560:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF588:
	.string	"__pg_resetdata_end"
.LASF295:
	.string	"_WCHAR_T_H "
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF404:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF570:
	.string	"pgOffset"
.LASF323:
	.string	"__USE_LARGEFILE"
.LASF391:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF559:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF477:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF568:
	.string	"pgSize"
.LASF450:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF359:
	.string	"_SYS_CDEFS_H 1"
.LASF443:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF333:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF269:
	.string	"_SIZE_T "
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF300:
	.string	"_BSD_WCHAR_T_"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF438:
	.string	"__need_NULL "
.LASF281:
	.string	"_GCC_SIZE_T "
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF554:
	.string	"unsigned int"
.LASF358:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF578:
	.string	"version"
.LASF266:
	.string	"__need_ptrdiff_t"
.LASF319:
	.string	"__USE_XOPEN2K"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF444:
	.string	"__int8_t_defined "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF5:
	.string	"__GNUC__ 5"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF434:
	.string	"__stub_sigreturn "
.LASF400:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF354:
	.string	"__GNU_LIBRARY__"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF593:
	.string	"pgResetInstance"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF411:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF426:
	.string	"__stub_fchflags "
.LASF463:
	.string	"INT_LEAST8_MAX (127)"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF569:
	.string	"pgIsSystem"
.LASF279:
	.string	"_SIZE_T_DECLARED "
.LASF265:
	.string	"_PTRDIFF_T_DECLARED "
.LASF557:
	.string	"PGR_PGN_VERSION_MASK"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF337:
	.string	"__USE_ISOC95 1"
.LASF376:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF589:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF527:
	.ascii	"PG_REGISTER_PROFILE_I(_type,_name,_pgn,_version,_reset) STAT"
	.ascii	"IC_UNIT_TESTED _type _name ## _Storage[MAX_PROFILE_COUNT]; _"
	.ascii	"PG_PROFILE_CURRENT_DECL(_type, _name) extern const pgRegistr"
	.ascii	"y_t _nam"
	.string	"e ## _Registry; const pgRegistry_t _name ## _Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = sizeof(_type) | PGR_SIZE_PROFILE_FLAG, .address = (uint8_t*)&_name ## _Storage, .ptr = (uint8_t **)&_name ## _ProfileCurrent, _reset, }"
.LASF370:
	.string	"__ptr_t void *"
.LASF558:
	.string	"PGR_SIZE_MASK"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF270:
	.string	"_SYS_SIZE_T_H "
.LASF237:
	.string	"linux 1"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF468:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF263:
	.string	"___int_ptrdiff_t_h "
.LASF452:
	.string	"INT16_MAX (32767)"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF586:
	.string	"__pg_registry_end"
.LASF490:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF318:
	.string	"__USE_UNIX98"
.LASF353:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF349:
	.string	"_ATFILE_SOURCE"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF365:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF465:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF499:
	.string	"INT16_C(c) c"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF287:
	.string	"_WCHAR_T "
.LASF457:
	.string	"UINT32_MAX (4294967295U)"
.LASF350:
	.string	"_ATFILE_SOURCE 1"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF363:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF508:
	.string	"_GCC_WRAP_STDINT_H "
.LASF481:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF466:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF293:
	.string	"_WCHAR_T_DEFINED_ "
.LASF469:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF536:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF433:
	.string	"__stub_setlogin "
.LASF239:
	.string	"__unix__ 1"
.LASF280:
	.string	"___int_size_t_h "
.LASF275:
	.string	"_BSD_SIZE_T_ "
.LASF566:
	.string	"float"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF556:
	.string	"PGR_PGN_MASK"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF573:
	.string	"base"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF364:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF278:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF512:
	.string	"PG_REGISTRY_SIZE (__pg_registry_end - __pg_registry_start)"
.LASF395:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF583:
	.string	"profileCount"
.LASF571:
	.string	"profileIndex"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF332:
	.string	"__KERNEL_STRICT_NAMES "
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF360:
	.string	"__PMT"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF315:
	.string	"__USE_POSIX199506"
.LASF500:
	.string	"INT32_C(c) c"
.LASF388:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF515:
	.string	"PG_RESET_CURRENT(_name) do { extern const pgRegistry_t _name ##_Registry; pgResetCurrent(&_name ## _Registry); } while(0)"
.LASF367:
	.string	"__PMT(args) args"
.LASF504:
	.string	"UINT32_C(c) c ## U"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF402:
	.string	"__wur "
.LASF537:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF502:
	.string	"UINT8_C(c) c"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF240:
	.string	"unix 1"
.LASF429:
	.string	"__stub_gtty "
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF513:
	.string	"PG_FOREACH(_name) for (const pgRegistry_t *(_name) = __pg_registry_start; (_name) < __pg_registry_end; _name++)"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF228:
	.string	"__MMX__ 1"
.LASF393:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF436:
	.string	"__stub_stty "
.LASF509:
	.string	"PG_PACKED __attribute__((packed))"
.LASF478:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF524:
	.string	"PG_REGISTER_ARR(_type,_size,_name,_pgn,_version) PG_REGISTER_ARR_I(_type, _size, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF286:
	.string	"__WCHAR_T__ "
.LASF347:
	.string	"__USE_XOPEN2K 1"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF271:
	.string	"_T_SIZE_ "
.LASF260:
	.string	"__PTRDIFF_T "
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF331:
	.string	"__KERNEL_STRICT_NAMES"
.LASF482:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF422:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF310:
	.string	"__USE_ISOC95"
.LASF298:
	.string	"_GCC_WCHAR_T "
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF309:
	.string	"__USE_ISOC99"
.LASF345:
	.string	"__USE_POSIX199309 1"
.LASF489:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF305:
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
.LASF285:
	.string	"__wchar_t__ "
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF431:
	.string	"__stub_putmsg "
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF276:
	.string	"_SIZE_T_DEFINED_ "
.LASF372:
	.string	"__BEGIN_DECLS "
.LASF592:
	.string	"pgRegistry_s"
.LASF565:
	.string	"pgRegistry_t"
.LASF497:
	.string	"WINT_MAX (4294967295u)"
.LASF590:
	.string	"src/main/config/parameter_group.c"
.LASF587:
	.string	"__pg_resetdata_start"
.LASF451:
	.string	"INT8_MAX (127)"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF335:
	.string	"_DEFAULT_SOURCE 1"
.LASF456:
	.string	"UINT16_MAX (65535)"
.LASF218:
	.string	"__amd64__ 1"
.LASF475:
	.string	"INT_FAST8_MAX (127)"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF506:
	.string	"INTMAX_C(c) c ## L"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF245:
	.string	"EDISON 1"
.LASF460:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF303:
	.string	"NULL ((void *)0)"
.LASF467:
	.string	"UINT_LEAST8_MAX (255)"
.LASF338:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF425:
	.string	"__stub_fattach "
.LASF492:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF448:
	.string	"INT16_MIN (-32767-1)"
.LASF371:
	.string	"__long_double_t long double"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF291:
	.string	"_WCHAR_T_ "
.LASF387:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF503:
	.string	"UINT16_C(c) c"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF548:
	.string	"char"
.LASF424:
	.string	"__stub_chflags "
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF543:
	.string	"tan_approx(x) tanf(x)"
.LASF496:
	.string	"WINT_MIN (0u)"
.LASF572:
	.string	"regSize"
.LASF552:
	.string	"uint8_t"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF220:
	.string	"__x86_64__ 1"
.LASF486:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF386:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF346:
	.string	"__USE_POSIX199506 1"
.LASF235:
	.string	"__linux 1"
.LASF494:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF532:
	.string	"sq(x) ((x)*(x))"
.LASF521:
	.string	"PG_REGISTER_WITH_RESET_FN(_type,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name })"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF408:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF418:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF442:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF403:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF282:
	.string	"_SIZET_ "
.LASF449:
	.string	"INT32_MIN (-2147483647-1)"
.LASF541:
	.string	"atan2_approx(y,x) atan2f(y,x)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF377:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF585:
	.string	"__pg_registry_start"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF314:
	.string	"__USE_POSIX199309"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF406:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF301:
	.string	"__need_wchar_t"
.LASF352:
	.string	"__USE_ATFILE 1"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF555:
	.string	"pgn_t"
.LASF17:
	.string	"__LP64__ 1"
.LASF540:
	.string	"cos_approx(x) cosf(x)"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF485:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF394:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF419:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF16:
	.string	"_LP64 1"
.LASF307:
	.string	"_FEATURES_H 1"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF290:
	.string	"__WCHAR_T "
.LASF219:
	.string	"__x86_64 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF374:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF498:
	.string	"INT8_C(c) c"
.LASF379:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF459:
	.string	"INT_LEAST8_MIN (-128)"
.LASF243:
	.string	"DEBUG 1"
.LASF409:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF294:
	.string	"_WCHAR_T_DEFINED "
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF254:
	.string	"_STDDEF_H "
.LASF241:
	.string	"__ELF__ 1"
.LASF368:
	.string	"__CONCAT(x,y) x ## y"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF522:
	.string	"PG_REGISTER_WITH_RESET_TEMPLATE(_type,_name,_pgn,_version) extern const _type pgResetTemplate_ ## _name; PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.ptr = (void*)&pgResetTemplate_ ## _name})"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF516:
	.string	"PG_DECLARE(_type,_name) _type _name ## _System; static inline _type* _name(void) { return &_name ## _System; } struct _dummy"
.LASF505:
	.string	"UINT64_C(c) c ## UL"
.LASF355:
	.string	"__GNU_LIBRARY__ 6"
.LASF0:
	.string	"__STDC__ 1"
.LASF533:
	.string	"FAST_TRIGONOMETRY "
.LASF230:
	.string	"__SSE2__ 1"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF283:
	.string	"__size_t "
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF257:
	.string	"_PTRDIFF_T "
.LASF268:
	.string	"__SIZE_T__ "
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF462:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF342:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF562:
	.string	"size"
.LASF575:
	.string	"pgResetCurrent"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF591:
	.string	"/home/aravind/git/cleanflight"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF535:
	.string	"RAD (M_PIf / 180.0f)"
.LASF385:
	.string	"__flexarr []"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF328:
	.string	"__USE_GNU"
.LASF381:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF398:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF262:
	.string	"_BSD_PTRDIFF_T_ "
.LASF439:
	.string	"_XLOCALE_H 1"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF343:
	.string	"__USE_POSIX 1"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF542:
	.string	"acos_approx(x) acosf(x)"
.LASF528:
	.string	"PG_REGISTER_PROFILE(_type,_name,_pgn,_version) PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF397:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF495:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF325:
	.string	"__USE_FILE_OFFSET64"
.LASF284:
	.string	"__need_size_t"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF526:
	.string	"_PG_PROFILE_CURRENT_DECL(_type,_name) _type *_name ## _ProfileCurrent;"
.LASF375:
	.string	"__END_NAMESPACE_STD "
.LASF412:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF455:
	.string	"UINT8_MAX (255)"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF357:
	.string	"__GLIBC_MINOR__ 23"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF437:
	.string	"__need_size_t "
.LASF380:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF514:
	.string	"PG_FOREACH_PROFILE(_name) PG_FOREACH(_name) if(pgIsSystem(_name)) continue; else"
.LASF327:
	.string	"__USE_ATFILE"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF553:
	.string	"uint16_t"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF258:
	.string	"_T_PTRDIFF_ "
.LASF361:
	.string	"__LEAF , __leaf__"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF296:
	.string	"___int_wchar_t_h "
.LASF288:
	.string	"_T_WCHAR_ "
.LASF330:
	.string	"__USE_FORTIFY_LEVEL"
.LASF501:
	.string	"INT64_C(c) c ## L"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF417:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF382:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF507:
	.string	"UINTMAX_C(c) c ## UL"
.LASF369:
	.string	"__STRING(x) #x"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF447:
	.string	"INT8_MIN (-128)"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF491:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF550:
	.string	"short int"
.LASF479:
	.string	"UINT_FAST8_MAX (255)"
.LASF299:
	.string	"_WCHAR_T_DECLARED "
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF428:
	.string	"__stub_getmsg "
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF430:
	.string	"__stub_lchmod "
.LASF483:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF544:
	.string	"long int"
.LASF441:
	.string	"_BITS_WCHAR_H 1"
.LASF445:
	.string	"__uint32_t_defined "
.LASF313:
	.string	"__USE_POSIX2"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF476:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF304:
	.string	"__need_NULL"
.LASF306:
	.string	"_STRING_H 1"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF510:
	.string	"PG_REGISTER_ATTRIBUTES __attribute__ ((section(\".pg_registry\"), used, aligned(4)))"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF264:
	.string	"_GCC_PTRDIFF_T "
.LASF432:
	.string	"__stub_revoke "
.LASF416:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF329:
	.string	"__USE_REENTRANT"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF435:
	.string	"__stub_sstk "
.LASF321:
	.string	"__USE_XOPEN2K8"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF316:
	.string	"__USE_XOPEN"
.LASF539:
	.string	"sin_approx(x) sinf(x)"
.LASF493:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF341:
	.string	"_POSIX_C_SOURCE"
.LASF564:
	.string	"reset"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF520:
	.string	"PG_REGISTER(_type,_name,_pgn,_version) PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF272:
	.string	"_T_SIZE "
.LASF582:
	.string	"pgResetAll"
.LASF326:
	.string	"__USE_MISC"
.LASF576:
	.string	"pgLoad"
.LASF348:
	.string	"__USE_XOPEN2K8 1"
.LASF378:
	.string	"__END_NAMESPACE_C99 "
.LASF484:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF458:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF474:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF580:
	.string	"pgFind"
.LASF334:
	.string	"_DEFAULT_SOURCE"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF383:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF277:
	.string	"_SIZE_T_DEFINED "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF423:
	.string	"__stub___compat_bdflush "
.LASF518:
	.string	"PG_DECLARE_PROFILE(_type,_name) extern _type *_name ## _ProfileCurrent; static inline _type* _name(void) { return _name ## _ProfileCurrent; } struct _dummy"
.LASF546:
	.string	"sizetype"
.LASF356:
	.string	"__GLIBC__ 2"
.LASF308:
	.string	"__USE_ISOC11"
.LASF545:
	.string	"long unsigned int"
.LASF563:
	.string	"address"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF473:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF238:
	.string	"__unix 1"
.LASF517:
	.ascii	"PG"
	.string	"_DECLARE_ARR(_type,_size,_name) extern _type _name ## _SystemArray[_size]; static inline _type* _name(int _index) { return &_name ## _SystemArray[_index]; } static inline _type (* _name ## _arr(void))[_size] { return &_name ## _SystemArray; } struct _dummy"
.LASF538:
	.string	"ABS(x) ((x) > 0 ? (x) : -(x))"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF344:
	.string	"__USE_POSIX2 1"
.LASF289:
	.string	"_T_WCHAR "
.LASF421:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF531:
	.string	"PG_RESET_TEMPLATE(_type,_name,...) const _type pgResetTemplate_ ## _name PG_RESETDATA_ATTRIBUTES = { __VA_ARGS__ }"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF390:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF472:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF366:
	.string	"__P(args) args"
.LASF320:
	.string	"__USE_XOPEN2KXSI"
.LASF392:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF225:
	.string	"__k8 1"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF410:
	.string	"__restrict_arr __restrict"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF399:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF551:
	.string	"unsigned char"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF453:
	.string	"INT32_MAX (2147483647)"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF407:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF302:
	.string	"NULL"
.LASF480:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF525:
	.string	"PG_REGISTER_ARR_WITH_RESET_FN(_type,_size,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_ARR_I(_type, _size, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name})"
.LASF231:
	.string	"__FXSR__ 1"
.LASF362:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF446:
	.string	"__intptr_t_defined "
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF340:
	.string	"_POSIX_SOURCE 1"
.LASF519:
	.ascii	"PG_REGISTER_I(_type,_name,_pgn,_version,_reset) _type _name "
	.ascii	"## "
	.string	"_System; extern const pgRegistry_t _name ## _Registry; const pgRegistry_t _name ##_Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = sizeof(_type) | PGR_SIZE_SYSTEM_FLAG, .address = (uint8_t*)&_name ## _System, .ptr = 0, _reset, }"
.LASF584:
	.string	"pgActivateProfile"
.LASF292:
	.string	"_BSD_WCHAR_T_ "
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF226:
	.string	"__k8__ 1"
.LASF255:
	.string	"_STDDEF_H_ "
.LASF529:
	.string	"PG_REGISTER_PROFILE_WITH_RESET_FN(_type,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name})"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF317:
	.string	"__USE_XOPEN_EXTENDED"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF471:
	.string	"INT_FAST8_MIN (-128)"
.LASF574:
	.string	"pgReset"
.LASF324:
	.string	"__USE_LARGEFILE64"
.LASF530:
	.string	"PG_REGISTER_PROFILE_WITH_RESET_TEMPLATE(_type,_name,_pgn,_version) extern const _type pgResetTemplate_ ## _name; PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.ptr = (void*)&pgResetTemplate_ ## _name})"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF401:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF470:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF373:
	.string	"__END_DECLS "
.LASF322:
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
.LASF396:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF487:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF464:
	.string	"INT_LEAST16_MAX (32767)"
.LASF549:
	.string	"signed char"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF336:
	.string	"__USE_ISOC99 1"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF351:
	.string	"__USE_MISC 1"
.LASF259:
	.string	"_T_PTRDIFF "
.LASF547:
	.string	"short unsigned int"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF229:
	.string	"__SSE__ 1"
.LASF534:
	.string	"M_PIf 3.14159265358979323846f"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF581:
	.string	"pgStore"
.LASF427:
	.string	"__stub_fdetach "
.LASF273:
	.string	"__SIZE_T "
.LASF511:
	.string	"PG_RESETDATA_ATTRIBUTES __attribute__ ((section(\".pg_resetdata\"), used, aligned(2)))"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF261:
	.string	"_PTRDIFF_T_ "
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF384:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF389:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF217:
	.string	"__amd64 1"
.LASF413:
	.string	"__WORDSIZE 64"
.LASF236:
	.string	"__linux__ 1"
.LASF414:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF339:
	.string	"_POSIX_SOURCE"
.LASF405:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF454:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF256:
	.string	"_ANSI_STDDEF_H "
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF579:
	.string	"take"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF312:
	.string	"__USE_POSIX"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF567:
	.string	"pgVersion"
.LASF461:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF415:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF561:
	.string	"pgResetFunc"
.LASF267:
	.string	"__size_t__ "
.LASF488:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF420:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
