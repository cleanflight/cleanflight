	.file	"parameter_group.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed parameter_group.i -mtune=generic
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
	.long	0x5b9
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF45
	.byte	0xc
	.long	.LASF46
	.long	.LASF47
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x4
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF6
	.uleb128 0x5
	.long	.LASF8
	.byte	0x3
	.byte	0x30
	.long	0x71
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x5
	.long	.LASF9
	.byte	0x3
	.byte	0x31
	.long	0x45
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF11
	.byte	0x1
	.byte	0x15
	.long	0x78
	.uleb128 0x6
	.byte	0x4
	.long	0x83
	.byte	0x1
	.byte	0x1d
	.long	0xc4
	.uleb128 0x7
	.long	.LASF12
	.value	0xfff
	.uleb128 0x7
	.long	.LASF13
	.value	0xf000
	.uleb128 0x7
	.long	.LASF14
	.value	0xfff
	.uleb128 0x8
	.long	.LASF15
	.byte	0
	.uleb128 0x7
	.long	.LASF16
	.value	0x8000
	.byte	0
	.uleb128 0x5
	.long	.LASF17
	.byte	0x1
	.byte	0x26
	.long	0xcf
	.uleb128 0x9
	.long	0xdf
	.uleb128 0xa
	.long	0xdf
	.uleb128 0xa
	.long	0x37
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.uleb128 0xc
	.byte	0x8
	.byte	0x1
	.byte	0x2d
	.long	0xff
	.uleb128 0xd
	.string	"ptr"
	.byte	0x1
	.byte	0x2e
	.long	0xdf
	.uleb128 0xd
	.string	"fn"
	.byte	0x1
	.byte	0x2f
	.long	0xff
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0xc4
	.uleb128 0xf
	.long	.LASF48
	.byte	0x20
	.byte	0x1
	.byte	0x28
	.long	0x14e
	.uleb128 0x10
	.string	"pgn"
	.byte	0x1
	.byte	0x29
	.long	0x8a
	.byte	0
	.uleb128 0x11
	.long	.LASF18
	.byte	0x1
	.byte	0x2a
	.long	0x78
	.byte	0x2
	.uleb128 0x11
	.long	.LASF19
	.byte	0x1
	.byte	0x2b
	.long	0x14e
	.byte	0x8
	.uleb128 0x10
	.string	"ptr"
	.byte	0x1
	.byte	0x2c
	.long	0x154
	.byte	0x10
	.uleb128 0x11
	.long	.LASF20
	.byte	0x1
	.byte	0x30
	.long	0xe1
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x66
	.uleb128 0xe
	.byte	0x8
	.long	0x14e
	.uleb128 0x5
	.long	.LASF21
	.byte	0x1
	.byte	0x31
	.long	0x105
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF22
	.uleb128 0x12
	.string	"pgN"
	.byte	0x1
	.byte	0x33
	.long	0x78
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x19c
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x33
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x1a2
	.uleb128 0x4
	.long	0x15a
	.uleb128 0x14
	.long	.LASF23
	.byte	0x1
	.byte	0x34
	.long	0x66
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d7
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x34
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.long	.LASF24
	.byte	0x1
	.byte	0x35
	.long	0x78
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x207
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x35
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.long	.LASF25
	.byte	0x1
	.byte	0x36
	.long	0x78
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x237
	.uleb128 0x13
	.string	"reg"
	.byte	0x1
	.byte	0x36
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF36
	.byte	0x2
	.byte	0x19
	.long	0x19c
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x287
	.uleb128 0x13
	.string	"pgn"
	.byte	0x2
	.byte	0x19
	.long	0x8a
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
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF26
	.byte	0x2
	.byte	0x23
	.long	0x14e
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2e1
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x23
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.long	.LASF27
	.byte	0x2
	.byte	0x23
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.long	.LASF28
	.byte	0x2
	.byte	0x25
	.long	0x2e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1a
	.long	.LASF29
	.byte	0x2
	.byte	0x27
	.long	0x14e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.long	0x78
	.uleb128 0x1b
	.long	.LASF49
	.byte	0x2
	.byte	0x2e
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x32e
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x2e
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.long	.LASF29
	.byte	0x2
	.byte	0x2e
	.long	0x14e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF28
	.byte	0x2
	.byte	0x30
	.long	0x2e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x1c
	.long	.LASF30
	.byte	0x2
	.byte	0x3c
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x368
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x3c
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.long	.LASF27
	.byte	0x2
	.byte	0x3c
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1c
	.long	.LASF31
	.byte	0x2
	.byte	0x41
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x394
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x41
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.long	.LASF32
	.byte	0x2
	.byte	0x4a
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x41a
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x4a
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.long	.LASF27
	.byte	0x2
	.byte	0x4a
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x19
	.long	.LASF33
	.byte	0x2
	.byte	0x4a
	.long	0x41a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x19
	.long	.LASF18
	.byte	0x2
	.byte	0x4a
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x19
	.long	.LASF34
	.byte	0x2
	.byte	0x4a
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x16
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x1a
	.long	.LASF35
	.byte	0x2
	.byte	0x4f
	.long	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x420
	.uleb128 0x1d
	.uleb128 0x15
	.long	.LASF37
	.byte	0x2
	.byte	0x54
	.long	0x37
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x48a
	.uleb128 0x13
	.string	"reg"
	.byte	0x2
	.byte	0x54
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x13
	.string	"to"
	.byte	0x2
	.byte	0x54
	.long	0xdf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x19
	.long	.LASF18
	.byte	0x2
	.byte	0x54
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x19
	.long	.LASF27
	.byte	0x2
	.byte	0x54
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1a
	.long	.LASF35
	.byte	0x2
	.byte	0x56
	.long	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x1c
	.long	.LASF38
	.byte	0x2
	.byte	0x5c
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x4f6
	.uleb128 0x19
	.long	.LASF39
	.byte	0x2
	.byte	0x5c
	.long	0x37
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
	.long	0x19c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1a
	.long	.LASF27
	.byte	0x2
	.byte	0x63
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF40
	.byte	0x2
	.byte	0x6a
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x562
	.uleb128 0x19
	.long	.LASF27
	.byte	0x2
	.byte	0x6a
	.long	0x37
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
	.long	0x19c
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
	.long	0x14e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF41
	.byte	0x1
	.byte	0x43
	.long	0x577
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xe
	.byte	0x8
	.long	0x15a
	.uleb128 0x1e
	.long	.LASF42
	.byte	0x1
	.byte	0x44
	.long	0x577
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x1e
	.long	.LASF43
	.byte	0x1
	.byte	0x47
	.long	0x14e
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x1e
	.long	.LASF44
	.byte	0x1
	.byte	0x48
	.long	0x14e
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF44:
	.string	"__pg_resetdata_end"
.LASF24:
	.string	"pgSize"
.LASF22:
	.string	"float"
.LASF34:
	.string	"version"
.LASF6:
	.string	"short int"
.LASF11:
	.string	"pgn_t"
.LASF2:
	.string	"sizetype"
.LASF30:
	.string	"pgReset"
.LASF15:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF12:
	.string	"PGR_PGN_MASK"
.LASF32:
	.string	"pgLoad"
.LASF37:
	.string	"pgStore"
.LASF8:
	.string	"uint8_t"
.LASF14:
	.string	"PGR_SIZE_MASK"
.LASF16:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF13:
	.string	"PGR_PGN_VERSION_MASK"
.LASF26:
	.string	"pgOffset"
.LASF45:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF46:
	.string	"src/main/config/parameter_group.c"
.LASF0:
	.string	"long int"
.LASF36:
	.string	"pgFind"
.LASF28:
	.string	"regSize"
.LASF7:
	.string	"unsigned char"
.LASF40:
	.string	"pgActivateProfile"
.LASF35:
	.string	"take"
.LASF5:
	.string	"signed char"
.LASF19:
	.string	"address"
.LASF25:
	.string	"pgIsSystem"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"uint16_t"
.LASF3:
	.string	"short unsigned int"
.LASF4:
	.string	"char"
.LASF47:
	.string	"/home/aravind/git/cleanflight"
.LASF49:
	.string	"pgResetInstance"
.LASF23:
	.string	"pgVersion"
.LASF31:
	.string	"pgResetCurrent"
.LASF1:
	.string	"long unsigned int"
.LASF27:
	.string	"profileIndex"
.LASF41:
	.string	"__pg_registry_start"
.LASF18:
	.string	"size"
.LASF38:
	.string	"pgResetAll"
.LASF20:
	.string	"reset"
.LASF48:
	.string	"pgRegistry_s"
.LASF21:
	.string	"pgRegistry_t"
.LASF42:
	.string	"__pg_registry_end"
.LASF39:
	.string	"profileCount"
.LASF17:
	.string	"pgResetFunc"
.LASF29:
	.string	"base"
.LASF43:
	.string	"__pg_resetdata_start"
.LASF33:
	.string	"from"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
