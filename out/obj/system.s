	.file	"system.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed system.i -mtune=generic -march=x86-64
# -ggdb3 -Wall -Wpedantic -Wextra -Wunsafe-loop-optimizations
# -Wdouble-promotion -Wundef -std=gnu99 -ffunction-sections -fdata-sections
# -fverbose-asm -ffat-lto-objects -fstack-protector-strong
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
	.section	.bss.usTicks,"aw",@nobits
	.align 4
	.type	usTicks, @object
	.size	usTicks, 4
usTicks:
	.zero	4
	.section	.bss.sysTickUptime,"aw",@nobits
	.align 4
	.type	sysTickUptime, @object
	.size	sysTickUptime, 4
sysTickUptime:
	.zero	4
	.comm	start,16,16
	.comm	current,16,16
	.section	.text.micros,"ax",@progbits
	.globl	micros
	.type	micros, @function
micros:
.LFB2:
	.file 1 "src/main/drivers/system.c"
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 60 0
	movl	$current, %esi	#,
	movl	$4, %edi	#,
	call	clock_gettime	#
	.loc 1 61 0
	movq	current(%rip), %rdx	# current.tv_sec, D.4149
	movq	start(%rip), %rax	# start.tv_sec, D.4149
	subq	%rax, %rdx	# D.4149, D.4149
	movq	%rdx, %rax	# D.4149, D.4149
	imulq	$1000000000, %rax, %rdx	#, D.4149, D.4149
	movq	current+8(%rip), %rax	# current.tv_nsec, D.4149
	addq	%rax, %rdx	# D.4149, D.4149
	movq	start+8(%rip), %rax	# start.tv_nsec, D.4149
	movq	%rdx, %rcx	# D.4149, D.4149
	subq	%rax, %rcx	# D.4149, D.4149
	movabsq	$2361183241434822607, %rdx	#, tmp101
	movq	%rcx, %rax	# D.4149, tmp105
	imulq	%rdx	# tmp101
	sarq	$7, %rdx	#, tmp102
	movq	%rcx, %rax	# D.4149, tmp103
	sarq	$63, %rax	#, tmp103
	subq	%rax, %rdx	# tmp103, D.4149
	movq	%rdx, %rax	# D.4149, D.4149
	movl	%eax, sysTickUptime(%rip)	# D.4150, sysTickUptime
	.loc 1 62 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.4150
	movl	%eax, usTicks(%rip)	# D.4150, usTicks
	.loc 1 65 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.4151
	.loc 1 66 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	micros, .-micros
	.section	.text.millis,"ax",@progbits
	.globl	millis
	.type	millis, @function
millis:
.LFB3:
	.loc 1 70 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 71 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.4152
	movl	$274877907, %edx	#, tmp91
	mull	%edx	# tmp91
	movl	%edx, %eax	# tmp90, D.4153
	shrl	$6, %eax	#, D.4153
	.loc 1 72 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	millis, .-millis
	.section	.rodata
.LC0:
	.string	"Original:%lu\n"
	.section	.text.systemInit,"ax",@progbits
	.globl	systemInit
	.type	systemInit, @function
systemInit:
.LFB4:
	.loc 1 76 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 79 0
	movl	$start, %esi	#,
	movl	$4, %edi	#,
	call	clock_gettime	#
	.loc 1 80 0
	movq	start(%rip), %rax	# start.tv_sec, D.4154
	imulq	$1000000000, %rax, %rdx	#, D.4154, D.4154
	movq	start+8(%rip), %rax	# start.tv_nsec, D.4154
	leaq	(%rdx,%rax), %rcx	#, D.4154
	movabsq	$2361183241434822607, %rdx	#, tmp93
	movq	%rcx, %rax	# D.4154, tmp96
	imulq	%rdx	# tmp93
	sarq	$7, %rdx	#, tmp94
	movq	%rcx, %rax	# D.4154, tmp95
	sarq	$63, %rax	#, tmp95
	subq	%rax, %rdx	# tmp95, D.4154
	movq	%rdx, %rax	# D.4154, D.4154
	movq	%rax, %rsi	# D.4154,
	movl	$.LC0, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 81 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	systemInit, .-systemInit
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/time.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x177
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF1469
	.byte	0xc
	.long	.LASF1470
	.long	.LASF1471
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1446
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1447
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1448
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1449
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1450
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1451
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1452
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1453
	.uleb128 0x4
	.long	.LASF1455
	.byte	0x2
	.byte	0x33
	.long	0x77
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1454
	.uleb128 0x4
	.long	.LASF1456
	.byte	0x3
	.byte	0x8b
	.long	0x5e
	.uleb128 0x4
	.long	.LASF1457
	.byte	0x3
	.byte	0xaf
	.long	0x5e
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1458
	.uleb128 0x5
	.long	.LASF1472
	.byte	0x10
	.byte	0x4
	.byte	0x78
	.long	0xc0
	.uleb128 0x6
	.long	.LASF1459
	.byte	0x4
	.byte	0x7a
	.long	0x7e
	.byte	0
	.uleb128 0x6
	.long	.LASF1460
	.byte	0x4
	.byte	0x7b
	.long	0x89
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1461
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF1462
	.uleb128 0x7
	.long	.LASF1463
	.byte	0x1
	.byte	0x3a
	.long	0x6c
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF1464
	.byte	0x1
	.byte	0x45
	.long	0x6c
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.long	.LASF1473
	.byte	0x1
	.byte	0x4b
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.long	.LASF1465
	.byte	0x1
	.byte	0x2a
	.long	0x6c
	.uleb128 0x9
	.byte	0x3
	.quad	usTicks
	.uleb128 0xa
	.long	.LASF1466
	.byte	0x1
	.byte	0x2f
	.long	0x14b
	.uleb128 0x9
	.byte	0x3
	.quad	sysTickUptime
	.uleb128 0xb
	.long	0x6c
	.uleb128 0xc
	.long	.LASF1467
	.byte	0x1
	.byte	0x32
	.long	0x9b
	.uleb128 0x9
	.byte	0x3
	.quad	start
	.uleb128 0xc
	.long	.LASF1468
	.byte	0x1
	.byte	0x33
	.long	0x9b
	.uleb128 0x9
	.byte	0x3
	.quad	current
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.long	0x4c
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
	.file 5 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 6 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x17
	.long	.LASF254
	.file 7 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.file 8 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro3
	.file 9 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro5
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
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro7
	.file 12 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 13 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x15
	.long	.LASF408
	.byte	0x4
	.byte	0x4
	.file 14 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.file 15 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xf
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF414
	.file 16 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF482
	.byte	0x4
	.file 17 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF501
	.file 18 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro15
	.file 20 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro16
	.file 21 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x7
	.long	.LASF531
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro17
	.file 22 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x18
	.long	.LASF538
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x18
	.long	.LASF539
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.file 23 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF593
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF594
	.file 24 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x18
	.byte	0x5
	.uleb128 0x19
	.long	.LASF595
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro21
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro23
	.file 25 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF385
	.byte	0x3
	.uleb128 0x92
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro27
	.file 26 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xdb
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x16
	.long	.LASF660
	.file 27 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x1b
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.file 28 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF671
	.file 29 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x4
	.file 30 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0xde
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro34
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro35
	.file 31 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0x10e
	.uleb128 0x1f
	.byte	0x5
	.uleb128 0x13
	.long	.LASF694
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF709
	.file 32 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x1ec
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x5
	.uleb128 0x2e4
	.long	.LASF713
	.file 33 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ba
	.uleb128 0x21
	.byte	0x4
	.byte	0x6
	.uleb128 0x3c5
	.long	.LASF714
	.byte	0x4
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x3
	.uleb128 0x25
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.file 34 "src/main/drivers/serial_uart.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x4
	.file 35 "src/main/drivers/timer_setup.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x2
	.long	.LASF741
	.file 36 "/usr/include/unistd.h"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x24
	.byte	0x7
	.long	.Ldebug_macro44
	.file 37 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h"
	.byte	0x3
	.uleb128 0xcd
	.uleb128 0x25
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.file 38 "/usr/include/x86_64-linux-gnu/bits/environments.h"
	.byte	0x3
	.uleb128 0xd1
	.uleb128 0x26
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro47
	.byte	0x3
	.uleb128 0xe5
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro48
	.file 39 "/usr/include/x86_64-linux-gnu/bits/confname.h"
	.byte	0x3
	.uleb128 0x264
	.uleb128 0x27
	.byte	0x7
	.long	.Ldebug_macro49
	.byte	0x4
	.byte	0x5
	.uleb128 0x369
	.long	.LASF1153
	.file 40 "/usr/include/getopt.h"
	.byte	0x3
	.uleb128 0x36a
	.uleb128 0x28
	.byte	0x6
	.uleb128 0xbd
	.long	.LASF1154
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro50
	.byte	0x4
	.file 41 "/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x29
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x3
	.uleb128 0x21
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro52
	.file 42 "/usr/include/libio.h"
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x2a
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1167
	.file 43 "/usr/include/_G_config.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x2b
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x3
	.uleb128 0xf
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.byte	0x5
	.uleb128 0x10
	.long	.LASF1169
	.file 44 "/usr/include/wchar.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x2c
	.byte	0x7
	.long	.Ldebug_macro54
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro56
	.file 45 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x2d
	.byte	0x7
	.long	.Ldebug_macro57
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro59
	.file 46 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0xa4
	.uleb128 0x2e
	.byte	0x7
	.long	.Ldebug_macro60
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro61
	.file 47 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.byte	0x3
	.uleb128 0x355
	.uleb128 0x2f
	.byte	0x4
	.byte	0x4
	.file 48 "/usr/include/signal.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x30
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1281
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro62
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro63
	.file 49 "/usr/include/x86_64-linux-gnu/bits/signum.h"
	.byte	0x3
	.uleb128 0x39
	.uleb128 0x31
	.byte	0x7
	.long	.Ldebug_macro64
	.byte	0x4
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF669
	.file 50 "/usr/include/x86_64-linux-gnu/bits/siginfo.h"
	.byte	0x3
	.uleb128 0x50
	.uleb128 0x32
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro66
	.file 51 "/usr/include/x86_64-linux-gnu/bits/sigaction.h"
	.byte	0x3
	.uleb128 0xf3
	.uleb128 0x33
	.byte	0x7
	.long	.Ldebug_macro67
	.byte	0x4
	.file 52 "/usr/include/x86_64-linux-gnu/bits/sigcontext.h"
	.byte	0x3
	.uleb128 0x132
	.uleb128 0x34
	.byte	0x7
	.long	.Ldebug_macro68
	.byte	0x4
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF385
	.byte	0x3
	.uleb128 0x13c
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 53 "/usr/include/x86_64-linux-gnu/bits/sigstack.h"
	.byte	0x3
	.uleb128 0x143
	.uleb128 0x35
	.byte	0x7
	.long	.Ldebug_macro69
	.byte	0x4
	.file 54 "/usr/include/x86_64-linux-gnu/sys/ucontext.h"
	.byte	0x3
	.uleb128 0x146
	.uleb128 0x36
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1438
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x30
	.byte	0x4
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1439
	.byte	0x4
	.file 55 "/usr/include/x86_64-linux-gnu/bits/sigthread.h"
	.byte	0x3
	.uleb128 0x16a
	.uleb128 0x37
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1440
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro70
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1445
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
	.section	.debug_macro,"G",@progbits,wm4.string.h.30.22986d42631c138e09c46135db8750fc,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF385
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.2ff233552538c6ff9b8575ca8ea52cb3,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF387
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF388
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF389
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF390
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF391
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF392
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF393
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF394
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF395
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF396
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF397
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF398
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF399
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF400
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF401
	.byte	0x5
	.uleb128 0xca
	.long	.LASF402
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF403
	.byte	0x6
	.uleb128 0xee
	.long	.LASF404
	.byte	0x6
	.uleb128 0x191
	.long	.LASF405
	.byte	0x5
	.uleb128 0x196
	.long	.LASF406
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF407
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.07dce69c3b78884144b7f7bd19483461,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF409
	.byte	0x5
	.uleb128 0x21
	.long	.LASF410
	.byte	0x5
	.uleb128 0x22
	.long	.LASF411
	.byte	0x5
	.uleb128 0x23
	.long	.LASF412
	.byte	0x5
	.uleb128 0x34
	.long	.LASF413
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF415
	.byte	0x5
	.uleb128 0x22
	.long	.LASF416
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF417
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF418
	.byte	0x5
	.uleb128 0x34
	.long	.LASF419
	.byte	0x5
	.uleb128 0x78
	.long	.LASF420
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF421
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF422
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF423
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF424
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF425
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF426
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF427
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF428
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF429
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF430
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF431
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF432
	.byte	0x5
	.uleb128 0xad
	.long	.LASF433
	.byte	0x5
	.uleb128 0xae
	.long	.LASF434
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF435
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF436
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF437
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF438
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF439
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF440
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF441
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF442
	.byte	0x5
	.uleb128 0xba
	.long	.LASF443
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF444
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF445
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF446
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF447
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF448
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF449
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF450
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF451
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF452
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF453
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF454
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF455
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF456
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF457
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF458
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF459
	.byte	0x5
	.uleb128 0xec
	.long	.LASF460
	.byte	0x5
	.uleb128 0xee
	.long	.LASF461
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF462
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF463
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF464
	.byte	0x5
	.uleb128 0x100
	.long	.LASF465
	.byte	0x5
	.uleb128 0x101
	.long	.LASF466
	.byte	0x5
	.uleb128 0x105
	.long	.LASF467
	.byte	0x5
	.uleb128 0x111
	.long	.LASF468
	.byte	0x5
	.uleb128 0x112
	.long	.LASF469
	.byte	0x5
	.uleb128 0x116
	.long	.LASF470
	.byte	0x5
	.uleb128 0x117
	.long	.LASF471
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF472
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF473
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF474
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF475
	.byte	0x5
	.uleb128 0x124
	.long	.LASF476
	.byte	0x5
	.uleb128 0x125
	.long	.LASF477
	.byte	0x5
	.uleb128 0x126
	.long	.LASF478
	.byte	0x5
	.uleb128 0x128
	.long	.LASF479
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF480
	.byte	0x5
	.uleb128 0x130
	.long	.LASF481
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.27.59e2586c75bdbcb991b248ad7257b993,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF385
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF483
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.5c3398669aab31a6fd426ff45ca6ab2c,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF404
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF484
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF485
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF486
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF487
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF488
	.byte	0x5
	.uleb128 0x110
	.long	.LASF489
	.byte	0x5
	.uleb128 0x111
	.long	.LASF490
	.byte	0x5
	.uleb128 0x112
	.long	.LASF491
	.byte	0x5
	.uleb128 0x113
	.long	.LASF492
	.byte	0x5
	.uleb128 0x114
	.long	.LASF493
	.byte	0x5
	.uleb128 0x115
	.long	.LASF494
	.byte	0x5
	.uleb128 0x116
	.long	.LASF495
	.byte	0x5
	.uleb128 0x117
	.long	.LASF496
	.byte	0x5
	.uleb128 0x118
	.long	.LASF497
	.byte	0x5
	.uleb128 0x119
	.long	.LASF498
	.byte	0x6
	.uleb128 0x126
	.long	.LASF499
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF500
	.byte	0x6
	.uleb128 0x191
	.long	.LASF405
	.byte	0x5
	.uleb128 0x196
	.long	.LASF406
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF407
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.e401b8bcfee800b540b27abd7cc78de9,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF502
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF503
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF504
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF505
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF506
	.byte	0x5
	.uleb128 0x20
	.long	.LASF507
	.byte	0x5
	.uleb128 0x22
	.long	.LASF508
	.byte	0x5
	.uleb128 0x24
	.long	.LASF509
	.byte	0x5
	.uleb128 0x25
	.long	.LASF510
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF511
	.byte	0x6
	.uleb128 0x2e
	.long	.LASF512
	.byte	0x6
	.uleb128 0x2f
	.long	.LASF513
	.byte	0x6
	.uleb128 0x30
	.long	.LASF514
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF515
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF516
	.byte	0x5
	.uleb128 0x22
	.long	.LASF517
	.byte	0x5
	.uleb128 0x25
	.long	.LASF518
	.byte	0x5
	.uleb128 0x28
	.long	.LASF519
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF520
	.byte	0x5
	.uleb128 0x31
	.long	.LASF521
	.byte	0x5
	.uleb128 0x35
	.long	.LASF522
	.byte	0x5
	.uleb128 0x38
	.long	.LASF523
	.byte	0x5
	.uleb128 0x39
	.long	.LASF524
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF525
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF526
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.19.ff00c9c0f5e9f9a9719c5de76ace57b4,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF527
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF528
	.byte	0x5
	.uleb128 0x20
	.long	.LASF529
	.byte	0x5
	.uleb128 0x21
	.long	.LASF530
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.41.24cced64aef71195a51d4daa8e4f4a95,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF532
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF533
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF534
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF535
	.byte	0x5
	.uleb128 0x30
	.long	.LASF536
	.byte	0x5
	.uleb128 0x34
	.long	.LASF537
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF540
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF541
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF542
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF543
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF544
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF545
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF546
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF547
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF548
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF549
	.byte	0x5
	.uleb128 0x70
	.long	.LASF550
	.byte	0x5
	.uleb128 0x71
	.long	.LASF551
	.byte	0x5
	.uleb128 0x72
	.long	.LASF552
	.byte	0x5
	.uleb128 0x73
	.long	.LASF553
	.byte	0x5
	.uleb128 0x75
	.long	.LASF554
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF555
	.byte	0x5
	.uleb128 0x22
	.long	.LASF556
	.byte	0x5
	.uleb128 0x23
	.long	.LASF557
	.byte	0x5
	.uleb128 0x26
	.long	.LASF558
	.byte	0x5
	.uleb128 0x27
	.long	.LASF559
	.byte	0x5
	.uleb128 0x28
	.long	.LASF560
	.byte	0x5
	.uleb128 0x29
	.long	.LASF561
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF562
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF563
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF564
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF565
	.byte	0x5
	.uleb128 0x33
	.long	.LASF566
	.byte	0x5
	.uleb128 0x34
	.long	.LASF567
	.byte	0x5
	.uleb128 0x35
	.long	.LASF568
	.byte	0x5
	.uleb128 0x36
	.long	.LASF569
	.byte	0x5
	.uleb128 0x37
	.long	.LASF570
	.byte	0x5
	.uleb128 0x38
	.long	.LASF571
	.byte	0x5
	.uleb128 0x39
	.long	.LASF572
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF573
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF574
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF575
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF576
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF577
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF578
	.byte	0x5
	.uleb128 0x40
	.long	.LASF579
	.byte	0x5
	.uleb128 0x41
	.long	.LASF580
	.byte	0x5
	.uleb128 0x42
	.long	.LASF581
	.byte	0x5
	.uleb128 0x43
	.long	.LASF582
	.byte	0x5
	.uleb128 0x44
	.long	.LASF583
	.byte	0x5
	.uleb128 0x45
	.long	.LASF584
	.byte	0x5
	.uleb128 0x46
	.long	.LASF585
	.byte	0x5
	.uleb128 0x47
	.long	.LASF586
	.byte	0x5
	.uleb128 0x48
	.long	.LASF587
	.byte	0x5
	.uleb128 0x49
	.long	.LASF588
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF589
	.byte	0x5
	.uleb128 0x50
	.long	.LASF590
	.byte	0x5
	.uleb128 0x53
	.long	.LASF591
	.byte	0x5
	.uleb128 0x57
	.long	.LASF592
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.38.11ee5fdc0f6cc53a16c505b9233cecef,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF596
	.byte	0x5
	.uleb128 0x61
	.long	.LASF597
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.63.97272d7c64d5db8020003b32e9289502,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF598
	.byte	0x5
	.uleb128 0x40
	.long	.LASF599
	.byte	0x5
	.uleb128 0x41
	.long	.LASF600
	.byte	0x5
	.uleb128 0x42
	.long	.LASF601
	.byte	0x5
	.uleb128 0x44
	.long	.LASF602
	.byte	0x5
	.uleb128 0x45
	.long	.LASF603
	.byte	0x5
	.uleb128 0x46
	.long	.LASF604
	.byte	0x5
	.uleb128 0x47
	.long	.LASF605
	.byte	0x5
	.uleb128 0x49
	.long	.LASF606
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF607
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF608
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF609
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.99.408b6270fa6eb71377201a241ef15f79,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF610
	.byte	0x5
	.uleb128 0x64
	.long	.LASF611
	.byte	0x5
	.uleb128 0x65
	.long	.LASF612
	.byte	0x5
	.uleb128 0x66
	.long	.LASF613
	.byte	0x5
	.uleb128 0x67
	.long	.LASF614
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.50.84aeca2ac6f37d40e1e9b3cef757ba2d,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF615
	.byte	0x5
	.uleb128 0x48
	.long	.LASF616
	.byte	0x5
	.uleb128 0x54
	.long	.LASF617
	.byte	0x5
	.uleb128 0x55
	.long	.LASF618
	.byte	0x5
	.uleb128 0x56
	.long	.LASF619
	.byte	0x5
	.uleb128 0x57
	.long	.LASF620
	.byte	0x5
	.uleb128 0x58
	.long	.LASF621
	.byte	0x5
	.uleb128 0x59
	.long	.LASF622
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF623
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF624
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF625
	.byte	0x5
	.uleb128 0x80
	.long	.LASF626
	.byte	0x5
	.uleb128 0x85
	.long	.LASF627
	.byte	0x5
	.uleb128 0x86
	.long	.LASF628
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF629
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.305f7c1ed78a85c751613a0e1f6565b3,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF630
	.byte	0x5
	.uleb128 0x28
	.long	.LASF631
	.byte	0x5
	.uleb128 0x34
	.long	.LASF632
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF633
	.byte	0x5
	.uleb128 0x42
	.long	.LASF634
	.byte	0x5
	.uleb128 0x47
	.long	.LASF635
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF636
	.byte	0x5
	.uleb128 0x51
	.long	.LASF637
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF638
	.byte	0x5
	.uleb128 0x63
	.long	.LASF639
	.byte	0x5
	.uleb128 0x69
	.long	.LASF640
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF641
	.byte	0x5
	.uleb128 0x75
	.long	.LASF642
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF643
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF644
	.byte	0x5
	.uleb128 0x81
	.long	.LASF645
	.byte	0x5
	.uleb128 0x82
	.long	.LASF646
	.byte	0x5
	.uleb128 0x83
	.long	.LASF647
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.53.beb46e650cd406cb917b6b96b45e640a,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF648
	.byte	0x6
	.uleb128 0x42
	.long	.LASF649
	.byte	0x5
	.uleb128 0x45
	.long	.LASF650
	.byte	0x6
	.uleb128 0x52
	.long	.LASF651
	.byte	0x5
	.uleb128 0x56
	.long	.LASF652
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF653
	.byte	0x5
	.uleb128 0x62
	.long	.LASF654
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF655
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF656
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.847b6907dabda77be90a9ab7ad789e2e,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF404
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF407
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.187.fd8c81c4bff8969f5d23c3a34aa715af,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF657
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF658
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF659
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.28.eb2f3debdbcffd1442ebddaebc4fb6ff,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF661
	.byte	0x5
	.uleb128 0x21
	.long	.LASF662
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF663
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF664
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF665
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF666
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF667
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF668
	.byte	0x5
	.uleb128 0x29
	.long	.LASF645
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF669
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF649
	.byte	0x6
	.uleb128 0x52
	.long	.LASF651
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF653
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF655
	.byte	0x5
	.uleb128 0x72
	.long	.LASF670
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF656
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.25.ae5284cdff565e87a9198d819340325d,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF672
	.byte	0x6
	.uleb128 0x65
	.long	.LASF673
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.49.e9d2041e5035cc68ebd1a20f7dbc8514,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF674
	.byte	0x6
	.uleb128 0x39
	.long	.LASF675
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF676
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF677
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF678
	.byte	0x5
	.uleb128 0x49
	.long	.LASF679
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF680
	.byte	0x5
	.uleb128 0x55
	.long	.LASF681
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF682
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF683
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF684
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF685
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sysmacros.h.20.8a0c33ff175cd9b434a86c0aaa36f0a2,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF686
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF687
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF688
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF689
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.229.67b3f66bd74b06b451caec392a72a945,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF690
	.byte	0x5
	.uleb128 0xec
	.long	.LASF691
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF692
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF693
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypes.h.25.6892b1493314fcf446bbc76e7362acba,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF695
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF696
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF697
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF698
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF699
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF700
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF701
	.byte	0x5
	.uleb128 0x20
	.long	.LASF702
	.byte	0x5
	.uleb128 0x21
	.long	.LASF703
	.byte	0x5
	.uleb128 0x46
	.long	.LASF704
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF705
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF706
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF707
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF708
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF710
	.byte	0x5
	.uleb128 0x17
	.long	.LASF385
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF711
	.byte	0x5
	.uleb128 0x23
	.long	.LASF712
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.26.6a3cabd4f228e226db6723a3b0c81ba6,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF715
	.byte	0x5
	.uleb128 0x23
	.long	.LASF385
	.byte	0x5
	.uleb128 0x24
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.04cc7214bceba497b20d15c10fd97511,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF404
	.byte	0x6
	.uleb128 0x191
	.long	.LASF405
	.byte	0x5
	.uleb128 0x196
	.long	.LASF406
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF407
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.40.ef4cac57544640468516e1691b64cd57,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF716
	.byte	0x5
	.uleb128 0x30
	.long	.LASF717
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF718
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF719
	.byte	0x5
	.uleb128 0x41
	.long	.LASF720
	.byte	0x5
	.uleb128 0x43
	.long	.LASF721
	.byte	0x5
	.uleb128 0x45
	.long	.LASF722
	.byte	0x5
	.uleb128 0x47
	.long	.LASF723
	.byte	0x5
	.uleb128 0x49
	.long	.LASF724
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF725
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF726
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF727
	.byte	0x5
	.uleb128 0x51
	.long	.LASF728
	.byte	0x5
	.uleb128 0x54
	.long	.LASF729
	.byte	0x6
	.uleb128 0x65
	.long	.LASF673
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.8498996832d25894c9c8b3ca182c99ab,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF649
	.byte	0x6
	.uleb128 0x52
	.long	.LASF651
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF653
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF655
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF656
	.byte	0x5
	.uleb128 0x136
	.long	.LASF730
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.serial_uart.h.26.e75c8f65474ad7b5502b5457fb95997d,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF731
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF732
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF733
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF734
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF735
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF736
	.byte	0x5
	.uleb128 0x20
	.long	.LASF737
	.byte	0x5
	.uleb128 0x21
	.long	.LASF738
	.byte	0x5
	.uleb128 0x22
	.long	.LASF739
	.byte	0x5
	.uleb128 0x23
	.long	.LASF740
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.23.a608ae63b1bee638e80d9e2a8598bd8e,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF742
	.byte	0x5
	.uleb128 0x22
	.long	.LASF743
	.byte	0x5
	.uleb128 0x35
	.long	.LASF744
	.byte	0x5
	.uleb128 0x43
	.long	.LASF745
	.byte	0x5
	.uleb128 0x46
	.long	.LASF746
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF747
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF748
	.byte	0x5
	.uleb128 0x52
	.long	.LASF749
	.byte	0x5
	.uleb128 0x56
	.long	.LASF750
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF751
	.byte	0x5
	.uleb128 0x64
	.long	.LASF752
	.byte	0x5
	.uleb128 0x67
	.long	.LASF753
	.byte	0x5
	.uleb128 0x68
	.long	.LASF754
	.byte	0x5
	.uleb128 0x69
	.long	.LASF755
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF756
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF757
	.byte	0x5
	.uleb128 0x73
	.long	.LASF758
	.byte	0x5
	.uleb128 0x76
	.long	.LASF759
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_opt.h.20.8587404e00639bdcc5f6a74591f95259,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF760
	.byte	0x5
	.uleb128 0x17
	.long	.LASF761
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF762
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF763
	.byte	0x5
	.uleb128 0x20
	.long	.LASF764
	.byte	0x5
	.uleb128 0x23
	.long	.LASF765
	.byte	0x5
	.uleb128 0x26
	.long	.LASF766
	.byte	0x5
	.uleb128 0x29
	.long	.LASF767
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF768
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF769
	.byte	0x5
	.uleb128 0x32
	.long	.LASF770
	.byte	0x5
	.uleb128 0x36
	.long	.LASF771
	.byte	0x5
	.uleb128 0x39
	.long	.LASF772
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF773
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF774
	.byte	0x5
	.uleb128 0x42
	.long	.LASF775
	.byte	0x5
	.uleb128 0x45
	.long	.LASF776
	.byte	0x5
	.uleb128 0x48
	.long	.LASF777
	.byte	0x5
	.uleb128 0x49
	.long	.LASF778
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF779
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF780
	.byte	0x5
	.uleb128 0x52
	.long	.LASF781
	.byte	0x5
	.uleb128 0x55
	.long	.LASF782
	.byte	0x5
	.uleb128 0x59
	.long	.LASF783
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF784
	.byte	0x5
	.uleb128 0x60
	.long	.LASF785
	.byte	0x5
	.uleb128 0x64
	.long	.LASF786
	.byte	0x5
	.uleb128 0x67
	.long	.LASF787
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF788
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF789
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF790
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF791
	.byte	0x5
	.uleb128 0x72
	.long	.LASF792
	.byte	0x5
	.uleb128 0x75
	.long	.LASF793
	.byte	0x5
	.uleb128 0x76
	.long	.LASF794
	.byte	0x5
	.uleb128 0x77
	.long	.LASF795
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF796
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF797
	.byte	0x5
	.uleb128 0x80
	.long	.LASF798
	.byte	0x5
	.uleb128 0x83
	.long	.LASF799
	.byte	0x5
	.uleb128 0x86
	.long	.LASF800
	.byte	0x5
	.uleb128 0x89
	.long	.LASF801
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF802
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF803
	.byte	0x5
	.uleb128 0x92
	.long	.LASF804
	.byte	0x5
	.uleb128 0x95
	.long	.LASF805
	.byte	0x5
	.uleb128 0x98
	.long	.LASF806
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF807
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF808
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF809
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF810
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF811
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF812
	.byte	0x5
	.uleb128 0xad
	.long	.LASF813
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF814
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF815
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF816
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF817
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF818
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF819
	.byte	0x5
	.uleb128 0xba
	.long	.LASF820
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF821
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.environments.h.56.c5802092ccc191baeb41f8d355bb878f,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF822
	.byte	0x5
	.uleb128 0x39
	.long	.LASF823
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF824
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF825
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF826
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF827
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF828
	.byte	0x5
	.uleb128 0x60
	.long	.LASF829
	.byte	0x5
	.uleb128 0x65
	.long	.LASF830
	.byte	0x5
	.uleb128 0x66
	.long	.LASF831
	.byte	0x5
	.uleb128 0x68
	.long	.LASF832
	.byte	0x5
	.uleb128 0x69
	.long	.LASF833
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.213.4c582e35260d661b081322974b7c1e74,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF834
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF835
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF836
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF385
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.259.a8d5f172fa0e5d66bde54a31d3d108ae,comdat
.Ldebug_macro48:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x103
	.long	.LASF837
	.byte	0x5
	.uleb128 0x116
	.long	.LASF838
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF839
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF840
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF841
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF842
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF843
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF844
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF845
	.byte	0x5
	.uleb128 0x145
	.long	.LASF846
	.byte	0x5
	.uleb128 0x146
	.long	.LASF847
	.byte	0x5
	.uleb128 0x147
	.long	.LASF848
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.confname.h.27.6b00117a32f457cc72e5ac810a9adade,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF849
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF850
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF851
	.byte	0x5
	.uleb128 0x21
	.long	.LASF852
	.byte	0x5
	.uleb128 0x23
	.long	.LASF853
	.byte	0x5
	.uleb128 0x25
	.long	.LASF854
	.byte	0x5
	.uleb128 0x27
	.long	.LASF855
	.byte	0x5
	.uleb128 0x29
	.long	.LASF856
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF857
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF858
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF859
	.byte	0x5
	.uleb128 0x31
	.long	.LASF860
	.byte	0x5
	.uleb128 0x33
	.long	.LASF861
	.byte	0x5
	.uleb128 0x35
	.long	.LASF862
	.byte	0x5
	.uleb128 0x37
	.long	.LASF863
	.byte	0x5
	.uleb128 0x39
	.long	.LASF864
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF865
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF866
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF867
	.byte	0x5
	.uleb128 0x41
	.long	.LASF868
	.byte	0x5
	.uleb128 0x43
	.long	.LASF869
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF870
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF871
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF872
	.byte	0x5
	.uleb128 0x50
	.long	.LASF873
	.byte	0x5
	.uleb128 0x52
	.long	.LASF874
	.byte	0x5
	.uleb128 0x54
	.long	.LASF875
	.byte	0x5
	.uleb128 0x56
	.long	.LASF876
	.byte	0x5
	.uleb128 0x58
	.long	.LASF877
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF878
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF879
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF880
	.byte	0x5
	.uleb128 0x60
	.long	.LASF881
	.byte	0x5
	.uleb128 0x62
	.long	.LASF882
	.byte	0x5
	.uleb128 0x64
	.long	.LASF883
	.byte	0x5
	.uleb128 0x66
	.long	.LASF884
	.byte	0x5
	.uleb128 0x68
	.long	.LASF885
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF886
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF887
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF888
	.byte	0x5
	.uleb128 0x70
	.long	.LASF889
	.byte	0x5
	.uleb128 0x72
	.long	.LASF890
	.byte	0x5
	.uleb128 0x74
	.long	.LASF891
	.byte	0x5
	.uleb128 0x76
	.long	.LASF892
	.byte	0x5
	.uleb128 0x78
	.long	.LASF893
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF894
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF895
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF896
	.byte	0x5
	.uleb128 0x80
	.long	.LASF897
	.byte	0x5
	.uleb128 0x82
	.long	.LASF898
	.byte	0x5
	.uleb128 0x84
	.long	.LASF899
	.byte	0x5
	.uleb128 0x86
	.long	.LASF900
	.byte	0x5
	.uleb128 0x87
	.long	.LASF901
	.byte	0x5
	.uleb128 0x89
	.long	.LASF902
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF903
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF904
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF905
	.byte	0x5
	.uleb128 0x91
	.long	.LASF906
	.byte	0x5
	.uleb128 0x96
	.long	.LASF907
	.byte	0x5
	.uleb128 0x98
	.long	.LASF908
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF909
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF910
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF911
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF912
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF913
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF914
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF915
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF916
	.byte	0x5
	.uleb128 0xab
	.long	.LASF917
	.byte	0x5
	.uleb128 0xad
	.long	.LASF918
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF919
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF920
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF921
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF922
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF923
	.byte	0x5
	.uleb128 0xba
	.long	.LASF924
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF925
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF926
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF927
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF928
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF929
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF930
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF931
	.byte	0x5
	.uleb128 0xca
	.long	.LASF932
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF933
	.byte	0x5
	.uleb128 0xce
	.long	.LASF934
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF935
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF936
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF937
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF938
	.byte	0x5
	.uleb128 0xda
	.long	.LASF939
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF940
	.byte	0x5
	.uleb128 0xde
	.long	.LASF941
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF942
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF943
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF944
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF945
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF946
	.byte	0x5
	.uleb128 0xea
	.long	.LASF947
	.byte	0x5
	.uleb128 0xec
	.long	.LASF948
	.byte	0x5
	.uleb128 0xee
	.long	.LASF949
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF950
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF951
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF952
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF953
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF954
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF955
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF956
	.byte	0x5
	.uleb128 0xff
	.long	.LASF957
	.byte	0x5
	.uleb128 0x101
	.long	.LASF958
	.byte	0x5
	.uleb128 0x103
	.long	.LASF959
	.byte	0x5
	.uleb128 0x105
	.long	.LASF960
	.byte	0x5
	.uleb128 0x108
	.long	.LASF961
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF962
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF963
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF964
	.byte	0x5
	.uleb128 0x110
	.long	.LASF965
	.byte	0x5
	.uleb128 0x112
	.long	.LASF966
	.byte	0x5
	.uleb128 0x115
	.long	.LASF967
	.byte	0x5
	.uleb128 0x117
	.long	.LASF968
	.byte	0x5
	.uleb128 0x119
	.long	.LASF969
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF970
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF971
	.byte	0x5
	.uleb128 0x120
	.long	.LASF972
	.byte	0x5
	.uleb128 0x123
	.long	.LASF973
	.byte	0x5
	.uleb128 0x125
	.long	.LASF974
	.byte	0x5
	.uleb128 0x127
	.long	.LASF975
	.byte	0x5
	.uleb128 0x129
	.long	.LASF976
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF977
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF978
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF979
	.byte	0x5
	.uleb128 0x131
	.long	.LASF980
	.byte	0x5
	.uleb128 0x133
	.long	.LASF981
	.byte	0x5
	.uleb128 0x135
	.long	.LASF982
	.byte	0x5
	.uleb128 0x137
	.long	.LASF983
	.byte	0x5
	.uleb128 0x139
	.long	.LASF984
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF985
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF986
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF987
	.byte	0x5
	.uleb128 0x141
	.long	.LASF988
	.byte	0x5
	.uleb128 0x143
	.long	.LASF989
	.byte	0x5
	.uleb128 0x145
	.long	.LASF990
	.byte	0x5
	.uleb128 0x148
	.long	.LASF991
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF992
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF993
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF994
	.byte	0x5
	.uleb128 0x150
	.long	.LASF995
	.byte	0x5
	.uleb128 0x152
	.long	.LASF996
	.byte	0x5
	.uleb128 0x155
	.long	.LASF997
	.byte	0x5
	.uleb128 0x157
	.long	.LASF998
	.byte	0x5
	.uleb128 0x159
	.long	.LASF999
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x179
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x185
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x187
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x197
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x199
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x1c0
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1054
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1055
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF1056
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF1057
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF1058
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1062
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1063
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x1e6
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x1e8
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x1f9
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x203
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x205
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x207
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x209
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x20c
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x211
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x218
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x21b
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x21c
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x221
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x224
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x225
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x228
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x229
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x22c
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x230
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x232
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x236
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x238
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x23a
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x23d
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x23f
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x241
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x245
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x24f
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x251
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x253
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x255
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x257
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x259
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x25e
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x260
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x262
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x264
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x266
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x268
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x270
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x272
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x274
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x276
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x278
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x27f
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x281
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x283
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x285
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x287
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x289
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x28d
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x291
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x293
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x295
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x297
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x299
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x29d
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x2a0
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x2a2
	.long	.LASF1152
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.1078.24be2bc9ec99b97d21ee28d24f5968b2,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x436
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x437
	.long	.LASF1156
	.byte	0x5
	.uleb128 0x438
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x439
	.long	.LASF1158
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.26.4719156f1aea2bb9662fd6c582dc9a4c,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1159
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF385
	.byte	0x5
	.uleb128 0x20
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.36.2dd12c1fd035242ad5cfd0152a01be5a,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1160
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1161
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1162
	.byte	0x6
	.uleb128 0x3a
	.long	.LASF1163
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1164
	.byte	0x6
	.uleb128 0x44
	.long	.LASF1165
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1166
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.5.b0f37d9e474454cf6e459063458db32f,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.long	.LASF1168
	.byte	0x5
	.uleb128 0xa
	.long	.LASF385
	.byte	0x5
	.uleb128 0xe
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.80.eea3eba2d2a17aace9470a8e0d8218dc,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1170
	.byte	0x6
	.uleb128 0x60
	.long	.LASF1171
	.byte	0x6
	.uleb128 0x386
	.long	.LASF1171
	.byte	0x6
	.uleb128 0x387
	.long	.LASF1172
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.46.5187c97b14fd664662cb32e6b94fc49e,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1173
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1174
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1175
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1178
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.33.a775b9ecae273f33bc59931e9891e4ca,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1192
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1194
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.51.dab170798ec1df48c625aea7c30e1b63,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x33
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1245
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x140
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x190
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x197
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x1c5
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x1c6
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x1c8
	.long	.LASF1263
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.80.17b7dd1ca72d8a61987532cb1d80194a,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF843
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF844
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF845
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1269
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.23.557290a6cddeba0587f574f29e3a5fb9,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1273
	.byte	0x6
	.uleb128 0x24
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1275
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.172.df21df34a7396d7da2e08f9b617d582f,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1276
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1277
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1280
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.42.f3254b9bc5df253e8b01ac06e87c790a,comdat
.Ldebug_macro62:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1287
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.signal.h.38.4a14efc2703c3c0d68cf889b778c4bb4,comdat
.Ldebug_macro63:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1288
	.byte	0x6
	.uleb128 0x2b
	.long	.LASF1289
	.byte	0x6
	.uleb128 0x33
	.long	.LASF1290
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.signum.h.22.4c1d620de4eecd5f9eeda9c80ba0f113,comdat
.Ldebug_macro64:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1302
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1305
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1309
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1310
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1319
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1320
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1321
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1322
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1323
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1324
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1325
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1326
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1327
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1328
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1329
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1330
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1331
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1332
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1333
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.siginfo.h.29.c3a762f7582f9dff6a2d31f44c9a643d,comdat
.Ldebug_macro65:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1357
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1358
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1359
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1360
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1361
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1362
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1363
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1364
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1365
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1366
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1367
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1368
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1369
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1370
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1371
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1372
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1373
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1374
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1375
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1376
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1377
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1378
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF1379
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF1380
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF1381
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF1382
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1383
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1384
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1385
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF1386
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF1387
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1388
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x111
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x113
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1395
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1397
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x122
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x124
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x126
	.long	.LASF1401
	.byte	0x6
	.uleb128 0x12a
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x130
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1405
	.byte	0x5
	.uleb128 0x157
	.long	.LASF1406
	.byte	0x5
	.uleb128 0x158
	.long	.LASF1407
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1409
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1410
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1411
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.signal.h.184.a49b773039089889dcf4436e98db5b15,comdat
.Ldebug_macro66:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1412
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1413
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigaction.h.36.df07c9e0e47f7c4a9420057185f38c34,comdat
.Ldebug_macro67:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1414
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1416
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1426
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1427
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1428
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1429
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigcontext.h.19.313573bb6ad2ae4efc9150f741b0d1d4,comdat
.Ldebug_macro68:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1430
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1433
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigstack.h.36.385688ed1383a3aea429a07cd7f554d3,comdat
.Ldebug_macro69:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1435
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1436
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1437
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.timer_setup.h.11.5e9a3ea5598637c2d602b11843b52eae,comdat
.Ldebug_macro70:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xb
	.long	.LASF1441
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1442
	.byte	0x5
	.uleb128 0xd
	.long	.LASF1443
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF636:
	.string	"__nlink_t_defined "
.LASF427:
	.string	"INT32_MAX (2147483647)"
.LASF1082:
	.string	"_SC_TRACE_USER_EVENT_MAX _SC_TRACE_USER_EVENT_MAX"
.LASF1432:
	.string	"FP_XSTATE_MAGIC2 0x46505845U"
.LASF554:
	.string	"__STD_TYPE typedef"
.LASF1357:
	.string	"si_arch _sifields._sigsys._arch"
.LASF693:
	.string	"__fsfilcnt_t_defined "
.LASF1407:
	.string	"sigev_notify_attributes _sigev_un._sigev_thread._attribute"
.LASF1142:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS"
.LASF1205:
	.string	"_IOS_NOREPLACE 64"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF1203:
	.string	"_IOS_TRUNC 16"
.LASF1178:
	.string	"_G_BUFSIZ 8192"
.LASF766:
	.string	"_POSIX_MAPPED_FILES 200809L"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF699:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF1229:
	.string	"_IO_SKIPWS 01"
.LASF826:
	.string	"_POSIX_V6_LP64_OFF64 1"
.LASF632:
	.string	"__ino_t_defined "
.LASF1447:
	.string	"sizetype"
.LASF873:
	.string	"_SC_NGROUPS_MAX _SC_NGROUPS_MAX"
.LASF1276:
	.string	"stdin stdin"
.LASF1467:
	.string	"start"
.LASF924:
	.string	"_SC_PII _SC_PII"
.LASF864:
	.string	"_PC_REC_MAX_XFER_SIZE _PC_REC_MAX_XFER_SIZE"
.LASF1368:
	.string	"ILL_ILLOPN ILL_ILLOPN"
.LASF714:
	.string	"__need_malloc_and_calloc"
.LASF895:
	.string	"_SC_AIO_PRIO_DELTA_MAX _SC_AIO_PRIO_DELTA_MAX"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF1397:
	.string	"POLL_OUT POLL_OUT"
.LASF1302:
	.string	"SIGFPE 8"
.LASF17:
	.string	"__LP64__ 1"
.LASF1431:
	.string	"FP_XSTATE_MAGIC1 0x46505853U"
.LASF1085:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT _SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF762:
	.string	"_POSIX_SAVED_IDS 1"
.LASF1400:
	.string	"POLL_PRI POLL_PRI"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF270:
	.string	"__USE_XOPEN2K8XSI"
.LASF843:
	.string	"SEEK_SET 0"
.LASF1278:
	.string	"stderr stderr"
.LASF1374:
	.string	"ILL_BADSTK ILL_BADSTK"
.LASF1326:
	.string	"SIGPWR 30"
.LASF604:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF1416:
	.string	"SA_NOCLDSTOP 1"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF765:
	.string	"_POSIX_FSYNC 200809L"
.LASF364:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF652:
	.string	"__clockid_t_defined 1"
.LASF949:
	.string	"_SC_THREAD_ATTR_STACKADDR _SC_THREAD_ATTR_STACKADDR"
.LASF333:
	.string	"__flexarr []"
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF586:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF781:
	.string	"_POSIX_THREAD_ATTR_STACKADDR 200809L"
.LASF950:
	.string	"_SC_THREAD_ATTR_STACKSIZE _SC_THREAD_ATTR_STACKSIZE"
.LASF473:
	.string	"INT16_C(c) c"
.LASF1256:
	.string	"_IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF1254:
	.string	"_IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end, 0) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF1356:
	.string	"si_syscall _sifields._sigsys._syscall"
.LASF668:
	.string	"__sigset_t_defined "
.LASF1196:
	.string	"_IO_va_list __gnuc_va_list"
.LASF1063:
	.string	"_SC_LEVEL2_CACHE_SIZE _SC_LEVEL2_CACHE_SIZE"
.LASF1410:
	.string	"SIGEV_THREAD SIGEV_THREAD"
.LASF775:
	.string	"_XOPEN_SHM 1"
.LASF1088:
	.string	"_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF1235:
	.string	"_IO_HEX 0100"
.LASF1202:
	.string	"_IOS_APPEND 8"
.LASF1155:
	.string	"F_ULOCK 0"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF889:
	.string	"_SC_MEMORY_PROTECTION _SC_MEMORY_PROTECTION"
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF463:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF1346:
	.string	"si_value _sifields._rt.si_sigval"
.LASF809:
	.string	"_POSIX_MONOTONIC_CLOCK 0"
.LASF903:
	.string	"_SC_SEM_NSEMS_MAX _SC_SEM_NSEMS_MAX"
.LASF504:
	.string	"WSTOPPED 2"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF901:
	.string	"_SC_PAGE_SIZE _SC_PAGESIZE"
.LASF969:
	.string	"_SC_2_UPE _SC_2_UPE"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF237:
	.string	"linux 1"
.LASF1054:
	.string	"_SC_TRACE_EVENT_FILTER _SC_TRACE_EVENT_FILTER"
.LASF245:
	.string	"EDISON 1"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF1333:
	.string	"__SIGRTMAX (_NSIG - 1)"
.LASF517:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF769:
	.string	"_POSIX_MEMORY_PROTECTION 200809L"
.LASF1328:
	.string	"SIGUNUSED 31"
.LASF442:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF1138:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS"
.LASF344:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF913:
	.string	"_SC_EXPR_NEST_MAX _SC_EXPR_NEST_MAX"
.LASF1002:
	.string	"_SC_XOPEN_REALTIME _SC_XOPEN_REALTIME"
.LASF677:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF593:
	.string	"__STD_TYPE"
.LASF674:
	.string	"__suseconds_t_defined "
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF1300:
	.string	"SIGIOT 6"
.LASF452:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF314:
	.string	"__P(args) args"
.LASF1161:
	.string	"__need___FILE "
.LASF659:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF955:
	.string	"_SC_NPROCESSORS_CONF _SC_NPROCESSORS_CONF"
.LASF710:
	.string	"_ALLOCA_H 1"
.LASF388:
	.string	"__SIZE_T__ "
.LASF1182:
	.string	"_IO_ssize_t __ssize_t"
.LASF1444:
	.string	"CLOCK CLOCK_MONOTONIC_RAW"
.LASF671:
	.string	"__need_timeval "
.LASF821:
	.string	"_POSIX_TYPED_MEMORY_OBJECTS -1"
.LASF1253:
	.string	"_IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) && __underflow (_fp) == EOF ? EOF : *(unsigned char *) (_fp)->_IO_read_ptr)"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF567:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF786:
	.string	"_POSIX_SEMAPHORES 200809L"
.LASF642:
	.string	"__daddr_t_defined "
.LASF1422:
	.string	"SA_RESETHAND 0x80000000"
.LASF1312:
	.string	"SIGCHLD 17"
.LASF743:
	.string	"_POSIX_VERSION 200809L"
.LASF1260:
	.string	"_IO_funlockfile(_fp) "
.LASF500:
	.string	"__need_wchar_t"
.LASF1019:
	.string	"_SC_FILE_LOCKING _SC_FILE_LOCKING"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF408:
	.string	"_XLOCALE_H 1"
.LASF1056:
	.string	"_SC_TRACE_LOG _SC_TRACE_LOG"
.LASF959:
	.string	"_SC_ATEXIT_MAX _SC_ATEXIT_MAX"
.LASF906:
	.string	"_SC_TIMER_MAX _SC_TIMER_MAX"
.LASF680:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF726:
	.string	"CLOCK_REALTIME_ALARM 8"
.LASF456:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF1387:
	.string	"BUS_OBJERR BUS_OBJERR"
.LASF875:
	.string	"_SC_STREAM_MAX _SC_STREAM_MAX"
.LASF622:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF477:
	.string	"UINT16_C(c) c"
.LASF544:
	.string	"__SLONGWORD_TYPE long int"
.LASF403:
	.string	"__size_t "
.LASF421:
	.string	"INT8_MIN (-128)"
.LASF665:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF1370:
	.string	"ILL_ILLTRP ILL_ILLTRP"
.LASF551:
	.string	"__ULONG32_TYPE unsigned int"
.LASF802:
	.string	"_POSIX_TIMEOUTS 200809L"
.LASF1246:
	.string	"_IO_file_flags _flags"
.LASF306:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF829:
	.string	"__ILP32_OFF32_LDFLAGS \"-m32\""
.LASF1026:
	.string	"_SC_SPIN_LOCKS _SC_SPIN_LOCKS"
.LASF334:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF392:
	.string	"_T_SIZE "
.LASF1149:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS"
.LASF1099:
	.string	"_CS_LFS64_CFLAGS _CS_LFS64_CFLAGS"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF1384:
	.string	"SEGV_ACCERR SEGV_ACCERR"
.LASF1378:
	.string	"FPE_FLTOVF FPE_FLTOVF"
.LASF1045:
	.string	"_SC_SYMLOOP_MAX _SC_SYMLOOP_MAX"
.LASF430:
	.string	"UINT16_MAX (65535)"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF451:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF534:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF961:
	.string	"_SC_XOPEN_VERSION _SC_XOPEN_VERSION"
.LASF1359:
	.string	"SI_TKILL SI_TKILL"
.LASF1137:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS"
.LASF1344:
	.string	"si_utime _sifields._sigchld.si_utime"
.LASF860:
	.string	"_PC_PRIO_IO _PC_PRIO_IO"
.LASF447:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF795:
	.string	"_LFS64_STDIO 1"
.LASF273:
	.string	"__USE_FILE_OFFSET64"
.LASF1141:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS"
.LASF707:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF753:
	.string	"_XOPEN_XPG2 1"
.LASF260:
	.string	"__USE_POSIX"
.LASF1199:
	.string	"_IOS_INPUT 1"
.LASF1232:
	.string	"_IO_INTERNAL 010"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF243:
	.string	"DEBUG 1"
.LASF1159:
	.string	"_STDIO_H 1"
.LASF1095:
	.string	"_CS_LFS_CFLAGS _CS_LFS_CFLAGS"
.LASF666:
	.string	"_SIGSET_H_types 1"
.LASF964:
	.string	"_SC_XOPEN_CRYPT _SC_XOPEN_CRYPT"
.LASF1255:
	.string	"_IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF581:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1237:
	.string	"_IO_SHOWPOINT 0400"
.LASF883:
	.string	"_SC_PRIORITIZED_IO _SC_PRIORITIZED_IO"
.LASF1117:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS"
.LASF1377:
	.string	"FPE_FLTDIV FPE_FLTDIV"
.LASF1160:
	.string	"__need_FILE "
.LASF468:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF374:
	.string	"__stub_fchflags "
.LASF760:
	.string	"_BITS_POSIX_OPT_H 1"
.LASF691:
	.string	"__blkcnt_t_defined "
.LASF1303:
	.string	"SIGKILL 9"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF1421:
	.string	"SA_NODEFER 0x40000000"
.LASF576:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF611:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF599:
	.string	"htole16(x) (x)"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF264:
	.string	"__USE_XOPEN"
.LASF1029:
	.string	"_SC_SHELL _SC_SHELL"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF269:
	.string	"__USE_XOPEN2K8"
.LASF928:
	.string	"_SC_PII_OSI _SC_PII_OSI"
.LASF740:
	.string	"UART5_TX_BUFFER_SIZE 256"
.LASF1434:
	.string	"SS_ONSTACK SS_ONSTACK"
.LASF390:
	.string	"_SYS_SIZE_T_H "
.LASF930:
	.string	"_SC_SELECT _SC_SELECT"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF423:
	.string	"INT32_MIN (-2147483647-1)"
.LASF958:
	.string	"_SC_AVPHYS_PAGES _SC_AVPHYS_PAGES"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF304:
	.string	"__GLIBC__ 2"
.LASF281:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF1452:
	.string	"long int"
.LASF601:
	.string	"le16toh(x) (x)"
.LASF791:
	.string	"_POSIX_PRIORITIZED_IO 200809L"
.LASF1262:
	.string	"_IO_cleanup_region_start(_fct,_fp) "
.LASF983:
	.string	"_SC_SCHAR_MAX _SC_SCHAR_MAX"
.LASF598:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF1080:
	.string	"_SC_TRACE_NAME_MAX _SC_TRACE_NAME_MAX"
.LASF296:
	.string	"__USE_XOPEN2K8 1"
.LASF584:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF1210:
	.string	"_IO_USER_BUF 1"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF722:
	.string	"CLOCK_MONOTONIC_RAW 4"
.LASF787:
	.string	"_POSIX_REALTIME_SIGNALS 200809L"
.LASF1415:
	.string	"sa_sigaction __sigaction_handler.sa_sigaction"
.LASF669:
	.string	"__need_timespec "
.LASF387:
	.string	"__size_t__ "
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF238:
	.string	"__unix 1"
.LASF763:
	.string	"_POSIX_PRIORITY_SCHEDULING 200809L"
.LASF1321:
	.string	"SIGVTALRM 26"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF1304:
	.string	"SIGUSR1 10"
.LASF863:
	.string	"_PC_REC_INCR_XFER_SIZE _PC_REC_INCR_XFER_SIZE"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF418:
	.string	"__int8_t_defined "
.LASF916:
	.string	"_SC_CHARCLASS_NAME_MAX _SC_CHARCLASS_NAME_MAX"
.LASF696:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF1060:
	.string	"_SC_LEVEL1_DCACHE_SIZE _SC_LEVEL1_DCACHE_SIZE"
.LASF530:
	.string	"__PDP_ENDIAN 3412"
.LASF502:
	.string	"WNOHANG 1"
.LASF360:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF824:
	.string	"_XBS5_LPBIG_OFFBIG -1"
.LASF716:
	.string	"_BITS_TIME_H 1"
.LASF1248:
	.string	"_IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF458:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF575:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1247:
	.string	"__HAVE_COLUMN "
.LASF1293:
	.string	"SIG_IGN ((__sighandler_t) 1)"
.LASF574:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF337:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF316:
	.string	"__CONCAT(x,y) x ## y"
.LASF520:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF1341:
	.string	"si_timerid _sifields._timer.si_tid"
.LASF779:
	.string	"_POSIX_THREAD_PRIORITY_SCHEDULING 200809L"
.LASF1361:
	.string	"SI_ASYNCIO SI_ASYNCIO"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF1369:
	.string	"ILL_ILLADR ILL_ILLADR"
.LASF1010:
	.string	"_SC_CPUTIME _SC_CPUTIME"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF1379:
	.string	"FPE_FLTUND FPE_FLTUND"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF1325:
	.string	"SIGIO 29"
.LASF341:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF465:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF1034:
	.string	"_SC_SYSTEM_DATABASE _SC_SYSTEM_DATABASE"
.LASF887:
	.string	"_SC_MEMLOCK _SC_MEMLOCK"
.LASF655:
	.string	"__need_timer_t"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF1094:
	.string	"_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF614:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF747:
	.string	"_POSIX2_C_BIND __POSIX2_THIS_VERSION"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF1331:
	.string	"SIGRTMAX (__libc_current_sigrtmax ())"
.LASF742:
	.string	"_UNISTD_H 1"
.LASF471:
	.string	"WINT_MAX (4294967295u)"
.LASF1180:
	.string	"_IO_fpos64_t _G_fpos64_t"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF1463:
	.string	"micros"
.LASF736:
	.string	"UART3_TX_BUFFER_SIZE 256"
.LASF578:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF628:
	.string	"EXIT_SUCCESS 0"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF1021:
	.string	"_SC_MONOTONIC_CLOCK _SC_MONOTONIC_CLOCK"
.LASF1366:
	.string	"SI_KERNEL SI_KERNEL"
.LASF1084:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT _SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF1345:
	.string	"si_stime _sifields._sigchld.si_stime"
.LASF1204:
	.string	"_IOS_NOCREATE 32"
.LASF1450:
	.string	"signed char"
.LASF595:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF1215:
	.string	"_IO_ERR_SEEN 0x20"
.LASF820:
	.string	"_POSIX_TRACE_LOG -1"
.LASF623:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF538:
	.string	"_BITS_BYTESWAP_H 1"
.LASF541:
	.string	"__U16_TYPE unsigned short int"
.LASF318:
	.string	"__ptr_t void *"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF761:
	.string	"_POSIX_JOB_CONTROL 1"
.LASF784:
	.string	"_POSIX_THREAD_ROBUST_PRIO_INHERIT 200809L"
.LASF1271:
	.string	"TMP_MAX 238328"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF589:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1143:
	.string	"_CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF657:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF1192:
	.string	"__need___va_list "
.LASF1396:
	.string	"POLL_IN POLL_IN"
.LASF866:
	.string	"_PC_REC_XFER_ALIGN _PC_REC_XFER_ALIGN"
.LASF1103:
	.string	"_CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS"
.LASF572:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF1058:
	.string	"_SC_LEVEL1_ICACHE_ASSOC _SC_LEVEL1_ICACHE_ASSOC"
.LASF1439:
	.string	"NGREG 23"
.LASF1110:
	.string	"_CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS"
.LASF1289:
	.string	"__need_sig_atomic_t"
.LASF248:
	.string	"__REVISION__ \"c69f0d5\""
.LASF631:
	.string	"__u_char_defined "
.LASF733:
	.string	"UART2_RX_BUFFER_SIZE 256"
.LASF398:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF1453:
	.string	"unsigned char"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF284:
	.string	"__USE_ISOC99 1"
.LASF1001:
	.string	"_SC_XOPEN_LEGACY _SC_XOPEN_LEGACY"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF315:
	.string	"__PMT(args) args"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF443:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF1218:
	.string	"_IO_IN_BACKUP 0x100"
.LASF1426:
	.string	"SA_STACK SA_ONSTACK"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF1317:
	.string	"SIGTTOU 22"
.LASF1330:
	.string	"SIGRTMIN (__libc_current_sigrtmin ())"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF730:
	.string	"__isleap(year) ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))"
.LASF1231:
	.string	"_IO_RIGHT 04"
.LASF1003:
	.string	"_SC_XOPEN_REALTIME_THREADS _SC_XOPEN_REALTIME_THREADS"
.LASF539:
	.string	"_BITS_TYPES_H 1"
.LASF902:
	.string	"_SC_RTSIG_MAX _SC_RTSIG_MAX"
.LASF1172:
	.string	"__need_wint_t"
.LASF811:
	.string	"_POSIX_ADVISORY_INFO 200809L"
.LASF962:
	.string	"_SC_XOPEN_XCU_VERSION _SC_XOPEN_XCU_VERSION"
.LASF920:
	.string	"_SC_2_FORT_DEV _SC_2_FORT_DEV"
.LASF788:
	.string	"_POSIX_ASYNCHRONOUS_IO 200809L"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF1382:
	.string	"FPE_FLTSUB FPE_FLTSUB"
.LASF770:
	.string	"_POSIX_CHOWN_RESTRICTED 0"
.LASF1069:
	.string	"_SC_LEVEL4_CACHE_SIZE _SC_LEVEL4_CACHE_SIZE"
.LASF1100:
	.string	"_CS_LFS64_LDFLAGS _CS_LFS64_LDFLAGS"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF1402:
	.string	"__need_siginfo_t"
.LASF1035:
	.string	"_SC_SYSTEM_DATABASE_R _SC_SYSTEM_DATABASE_R"
.LASF639:
	.string	"__pid_t_defined "
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF422:
	.string	"INT16_MIN (-32767-1)"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF727:
	.string	"CLOCK_BOOTTIME_ALARM 9"
.LASF1457:
	.string	"__syscall_slong_t"
.LASF653:
	.string	"__clockid_time_t"
.LASF1462:
	.string	"_Bool"
.LASF842:
	.string	"F_OK 0"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF358:
	.string	"__restrict_arr __restrict"
.LASF371:
	.string	"__stub___compat_bdflush "
.LASF1107:
	.string	"_CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS"
.LASF1071:
	.string	"_SC_LEVEL4_CACHE_LINESIZE _SC_LEVEL4_CACHE_LINESIZE"
.LASF396:
	.string	"_SIZE_T_DEFINED_ "
.LASF405:
	.string	"NULL"
.LASF925:
	.string	"_SC_PII_XTI _SC_PII_XTI"
.LASF1373:
	.string	"ILL_COPROC ILL_COPROC"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF509:
	.string	"__WALL 0x40000000"
.LASF1033:
	.string	"_SC_THREAD_SPORADIC_SERVER _SC_THREAD_SPORADIC_SERVER"
.LASF276:
	.string	"__USE_GNU"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF438:
	.string	"INT_LEAST16_MAX (32767)"
.LASF1233:
	.string	"_IO_DEC 020"
.LASF1244:
	.string	"_IO_DONT_CLOSE 0100000"
.LASF1449:
	.string	"char"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF483:
	.string	"__need_wchar_t "
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF1466:
	.string	"sysTickUptime"
.LASF1169:
	.string	"__need_mbstate_t "
.LASF1245:
	.string	"_IO_BOOLALPHA 0200000"
.LASF1183:
	.string	"_IO_off_t __off_t"
.LASF1299:
	.string	"SIGABRT 6"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF1282:
	.string	"_SIGSET_H_fns 1"
.LASF954:
	.string	"_SC_THREAD_PROCESS_SHARED _SC_THREAD_PROCESS_SHARED"
.LASF1332:
	.string	"__SIGRTMIN 32"
.LASF385:
	.string	"__need_size_t "
.LASF1156:
	.string	"F_LOCK 1"
.LASF1342:
	.string	"si_overrun _sifields._timer.si_overrun"
.LASF1150:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS"
.LASF841:
	.string	"X_OK 1"
.LASF279:
	.string	"__KERNEL_STRICT_NAMES"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF1046:
	.string	"_SC_STREAMS _SC_STREAMS"
.LASF1324:
	.string	"SIGPOLL SIGIO"
.LASF1016:
	.string	"_SC_FIFO _SC_FIFO"
.LASF355:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF1214:
	.string	"_IO_EOF_SEEN 0x10"
.LASF1471:
	.string	"/home/aravind/git/cleanflight"
.LASF482:
	.string	"_GCC_WRAP_STDINT_H "
.LASF1429:
	.string	"SIG_SETMASK 2"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF305:
	.string	"__GLIBC_MINOR__ 23"
.LASF754:
	.string	"_XOPEN_XPG3 1"
.LASF267:
	.string	"__USE_XOPEN2K"
.LASF1186:
	.string	"_IO_uid_t __uid_t"
.LASF508:
	.string	"__WNOTHREAD 0x20000000"
.LASF1320:
	.string	"SIGXFSZ 25"
.LASF268:
	.string	"__USE_XOPEN2KXSI"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF1238:
	.string	"_IO_UPPERCASE 01000"
.LASF814:
	.string	"_POSIX2_CHAR_TERM 200809L"
.LASF785:
	.string	"_POSIX_THREAD_ROBUST_PRIO_PROTECT -1"
.LASF353:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF382:
	.string	"__stub_sigreturn "
.LASF723:
	.string	"CLOCK_REALTIME_COARSE 5"
.LASF1018:
	.string	"_SC_FILE_ATTRIBUTES _SC_FILE_ATTRIBUTES"
.LASF825:
	.string	"_POSIX_V7_LP64_OFF64 1"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF705:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF293:
	.string	"__USE_POSIX199309 1"
.LASF884:
	.string	"_SC_SYNCHRONIZED_IO _SC_SYNCHRONIZED_IO"
.LASF1227:
	.string	"_IO_FLAGS2_NOTCANCEL 2"
.LASF449:
	.string	"INT_FAST8_MAX (127)"
.LASF813:
	.string	"_POSIX_RAW_SOCKETS 200809L"
.LASF437:
	.string	"INT_LEAST8_MAX (127)"
.LASF1066:
	.string	"_SC_LEVEL3_CACHE_SIZE _SC_LEVEL3_CACHE_SIZE"
.LASF1123:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS"
.LASF808:
	.string	"_POSIX_THREAD_PROCESS_SHARED 200809L"
.LASF888:
	.string	"_SC_MEMLOCK_RANGE _SC_MEMLOCK_RANGE"
.LASF1014:
	.string	"_SC_DEVICE_SPECIFIC_R _SC_DEVICE_SPECIFIC_R"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF1044:
	.string	"_SC_2_PBS_TRACK _SC_2_PBS_TRACK"
.LASF478:
	.string	"UINT32_C(c) c ## U"
.LASF1157:
	.string	"F_TLOCK 2"
.LASF457:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF262:
	.string	"__USE_POSIX199309"
.LASF428:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF991:
	.string	"_SC_NL_ARGMAX _SC_NL_ARGMAX"
.LASF1290:
	.string	"__need_sigset_t"
.LASF981:
	.string	"_SC_NZERO _SC_NZERO"
.LASF1081:
	.string	"_SC_TRACE_SYS_MAX _SC_TRACE_SYS_MAX"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF662:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF525:
	.string	"__W_CONTINUED 0xffff"
.LASF1162:
	.string	"__FILE_defined 1"
.LASF896:
	.string	"_SC_DELAYTIMER_MAX _SC_DELAYTIMER_MAX"
.LASF1067:
	.string	"_SC_LEVEL3_CACHE_ASSOC _SC_LEVEL3_CACHE_ASSOC"
.LASF467:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF376:
	.string	"__stub_getmsg "
.LASF460:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF266:
	.string	"__USE_UNIX98"
.LASF1000:
	.string	"_SC_XBS5_LPBIG_OFFBIG _SC_XBS5_LPBIG_OFFBIG"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF280:
	.string	"__KERNEL_STRICT_NAMES "
.LASF679:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF998:
	.string	"_SC_XBS5_ILP32_OFFBIG _SC_XBS5_ILP32_OFFBIG"
.LASF602:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF1394:
	.string	"CLD_STOPPED CLD_STOPPED"
.LASF1059:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE _SC_LEVEL1_ICACHE_LINESIZE"
.LASF926:
	.string	"_SC_PII_SOCKET _SC_PII_SOCKET"
.LASF560:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF1225:
	.string	"_IO_USER_LOCK 0x8000"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF496:
	.string	"__INT_WCHAR_T_H "
.LASF1144:
	.string	"_CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS"
.LASF545:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF810:
	.string	"_POSIX_CLOCK_SELECTION 200809L"
.LASF404:
	.string	"__need_size_t"
.LASF1464:
	.string	"millis"
.LASF838:
	.string	"__socklen_t_defined "
.LASF219:
	.string	"__x86_64 1"
.LASF1230:
	.string	"_IO_LEFT 02"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF840:
	.string	"W_OK 2"
.LASF780:
	.string	"_POSIX_THREAD_ATTR_STACKSIZE 200809L"
.LASF445:
	.string	"INT_FAST8_MIN (-128)"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF1275:
	.string	"FOPEN_MAX 16"
.LASF381:
	.string	"__stub_setlogin "
.LASF877:
	.string	"_SC_JOB_CONTROL _SC_JOB_CONTROL"
.LASF591:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF648:
	.string	"__clock_t_defined 1"
.LASF729:
	.string	"TIMER_ABSTIME 1"
.LASF1261:
	.string	"_IO_ftrylockfile(_fp) "
.LASF1194:
	.string	"__GNUC_VA_LIST "
.LASF715:
	.string	"_TIME_H 1"
.LASF612:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF975:
	.string	"_SC_CHAR_MIN _SC_CHAR_MIN"
.LASF410:
	.string	"bool _Bool"
.LASF728:
	.string	"CLOCK_TAI 11"
.LASF852:
	.string	"_PC_NAME_MAX _PC_NAME_MAX"
.LASF832:
	.string	"__LP64_OFF64_CFLAGS \"-m64\""
.LASF1350:
	.string	"si_addr_lsb _sifields._sigfault.si_addr_lsb"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1048:
	.string	"_SC_V6_ILP32_OFF32 _SC_V6_ILP32_OFF32"
.LASF968:
	.string	"_SC_2_C_VERSION _SC_2_C_VERSION"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF1412:
	.string	"sigmask(sig) __sigmask(sig)"
.LASF491:
	.string	"_BSD_WCHAR_T_ "
.LASF886:
	.string	"_SC_MAPPED_FILES _SC_MAPPED_FILES"
.LASF919:
	.string	"_SC_2_C_DEV _SC_2_C_DEV"
.LASF626:
	.string	"RAND_MAX 2147483647"
.LASF994:
	.string	"_SC_NL_NMAX _SC_NL_NMAX"
.LASF725:
	.string	"CLOCK_BOOTTIME 7"
.LASF454:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF1115:
	.string	"_CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS"
.LASF1166:
	.string	"_STDIO_USES_IOSTREAM "
.LASF1250:
	.string	"_IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))"
.LASF596:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF1401:
	.string	"POLL_HUP POLL_HUP"
.LASF362:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF1074:
	.string	"_SC_V7_ILP32_OFF32 _SC_V7_ILP32_OFF32"
.LASF1423:
	.string	"SA_INTERRUPT 0x20000000"
.LASF1189:
	.string	"_IO_BUFSIZ _G_BUFSIZ"
.LASF661:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF335:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF549:
	.string	"__UWORD_TYPE unsigned long int"
.LASF796:
	.string	"_POSIX_SHARED_MEMORY_OBJECTS 200809L"
.LASF892:
	.string	"_SC_SHARED_MEMORY_OBJECTS _SC_SHARED_MEMORY_OBJECTS"
.LASF1322:
	.string	"SIGPROF 27"
.LASF455:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF571:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF774:
	.string	"_XOPEN_REALTIME_THREADS 1"
.LASF1011:
	.string	"_SC_THREAD_CPUTIME _SC_THREAD_CPUTIME"
.LASF448:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF597:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF799:
	.string	"_POSIX_REGEXP 1"
.LASF406:
	.string	"NULL ((void *)0)"
.LASF1131:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS"
.LASF1114:
	.string	"_CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS"
.LASF935:
	.string	"_SC_PII_OSI_COTS _SC_PII_OSI_COTS"
.LASF356:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF764:
	.string	"_POSIX_SYNCHRONIZED_IO 200809L"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF695:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF915:
	.string	"_SC_RE_DUP_MAX _SC_RE_DUP_MAX"
.LASF1109:
	.string	"_CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF927:
	.string	"_SC_PII_INTERNET _SC_PII_INTERNET"
.LASF297:
	.string	"_ATFILE_SOURCE"
.LASF837:
	.string	"__useconds_t_defined "
.LASF550:
	.string	"__SLONG32_TYPE int"
.LASF673:
	.string	"__need_timeval"
.LASF600:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF963:
	.string	"_SC_XOPEN_UNIX _SC_XOPEN_UNIX"
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF1104:
	.string	"_CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF1338:
	.string	"__SI_ALIGNMENT "
.LASF1152:
	.string	"_CS_V7_ENV _CS_V7_ENV"
.LASF256:
	.string	"__USE_ISOC11"
.LASF363:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF989:
	.string	"_SC_ULONG_MAX _SC_ULONG_MAX"
.LASF675:
	.string	"__NFDBITS"
.LASF625:
	.string	"__lldiv_t_defined 1"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF681:
	.string	"NFDBITS __NFDBITS"
.LASF1168:
	.string	"_G_config_h 1"
.LASF1217:
	.string	"_IO_LINKED 0x80"
.LASF1055:
	.string	"_SC_TRACE_INHERIT _SC_TRACE_INHERIT"
.LASF684:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF1042:
	.string	"_SC_2_PBS_LOCATE _SC_2_PBS_LOCATE"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF503:
	.string	"WUNTRACED 2"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF1437:
	.string	"SIGSTKSZ 8192"
.LASF1201:
	.string	"_IOS_ATEND 4"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF461:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF807:
	.string	"_POSIX_MESSAGE_PASSING 200809L"
.LASF573:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF378:
	.string	"__stub_lchmod "
.LASF1446:
	.string	"long unsigned int"
.LASF429:
	.string	"UINT8_MAX (255)"
.LASF697:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF466:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF310:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF881:
	.string	"_SC_TIMERS _SC_TIMERS"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF287:
	.string	"_POSIX_SOURCE"
.LASF285:
	.string	"__USE_ISOC95 1"
.LASF1017:
	.string	"_SC_PIPE _SC_PIPE"
.LASF1281:
	.string	"_SIGNAL_H "
.LASF380:
	.string	"__stub_revoke "
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF741:
	.string	"TIMER_SETUP_H "
.LASF391:
	.string	"_T_SIZE_ "
.LASF1130:
	.string	"_CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS"
.LASF608:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF827:
	.string	"_XBS5_LP64_OFF64 1"
.LASF856:
	.string	"_PC_NO_TRUNC _PC_NO_TRUNC"
.LASF694:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF828:
	.string	"__ILP32_OFF32_CFLAGS \"-m32\""
.LASF1185:
	.string	"_IO_pid_t __pid_t"
.LASF1173:
	.string	"_G_va_list __gnuc_va_list"
.LASF324:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF1191:
	.string	"_IO_wint_t wint_t"
.LASF1316:
	.string	"SIGTTIN 21"
.LASF1051:
	.string	"_SC_V6_LPBIG_OFFBIG _SC_V6_LPBIG_OFFBIG"
.LASF876:
	.string	"_SC_TZNAME_MAX _SC_TZNAME_MAX"
.LASF1171:
	.string	"__need_mbstate_t"
.LASF226:
	.string	"__k8__ 1"
.LASF16:
	.string	"_LP64 1"
.LASF1287:
	.string	"__sigfillset(set) (__extension__ ({ int __cnt = _SIGSET_NWORDS; sigset_t *__set = (set); while (--__cnt >= 0) __set->__val[__cnt] = ~0UL; 0; }))"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF311:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF1339:
	.string	"si_pid _sifields._kill.si_pid"
.LASF386:
	.string	"__need_NULL "
.LASF255:
	.string	"_FEATURES_H 1"
.LASF283:
	.string	"_DEFAULT_SOURCE 1"
.LASF619:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF470:
	.string	"WINT_MIN (0u)"
.LASF505:
	.string	"WEXITED 4"
.LASF646:
	.string	"__need_timer_t "
.LASF1411:
	.string	"SIGEV_THREAD_ID SIGEV_THREAD_ID"
.LASF309:
	.string	"__LEAF , __leaf__"
.LASF417:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF997:
	.string	"_SC_XBS5_ILP32_OFF32 _SC_XBS5_ILP32_OFF32"
.LASF343:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF605:
	.string	"le32toh(x) (x)"
.LASF1335:
	.string	"__have_siginfo_t 1"
.LASF577:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF1294:
	.string	"SIGHUP 1"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF834:
	.string	"STDIN_FILENO 0"
.LASF1093:
	.string	"_CS_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF555:
	.string	"_BITS_TYPESIZES_H 1"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF721:
	.string	"CLOCK_THREAD_CPUTIME_ID 3"
.LASF819:
	.string	"_POSIX_TRACE_INHERIT -1"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF757:
	.string	"_XOPEN_CRYPT 1"
.LASF606:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF644:
	.string	"__need_clock_t "
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF999:
	.string	"_SC_XBS5_LP64_OFF64 _SC_XBS5_LP64_OFF64"
.LASF1239:
	.string	"_IO_SHOWPOS 02000"
.LASF948:
	.string	"_SC_THREAD_THREADS_MAX _SC_THREAD_THREADS_MAX"
.LASF937:
	.string	"_SC_PII_OSI_M _SC_PII_OSI_M"
.LASF993:
	.string	"_SC_NL_MSGMAX _SC_NL_MSGMAX"
.LASF982:
	.string	"_SC_SSIZE_MAX _SC_SSIZE_MAX"
.LASF1243:
	.string	"_IO_STDIO 040000"
.LASF1126:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF375:
	.string	"__stub_fdetach "
.LASF286:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF1279:
	.string	"getc(_fp) _IO_getc (_fp)"
.LASF936:
	.string	"_SC_PII_OSI_CLTS _SC_PII_OSI_CLTS"
.LASF1372:
	.string	"ILL_PRVREG ILL_PRVREG"
.LASF1414:
	.string	"sa_handler __sigaction_handler.sa_handler"
.LASF1027:
	.string	"_SC_REGEXP _SC_REGEXP"
.LASF1012:
	.string	"_SC_DEVICE_IO _SC_DEVICE_IO"
.LASF275:
	.string	"__USE_ATFILE"
.LASF800:
	.string	"_POSIX_READER_WRITER_LOCKS 200809L"
.LASF719:
	.string	"CLOCK_MONOTONIC 1"
.LASF1145:
	.string	"_CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS"
.LASF1297:
	.string	"SIGILL 4"
.LASF229:
	.string	"__SSE__ 1"
.LASF744:
	.string	"__POSIX2_THIS_VERSION 200809L"
.LASF804:
	.string	"_POSIX_SPAWN 200809L"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF590:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF664:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF1337:
	.string	"__SI_PAD_SIZE ((__SI_MAX_SIZE / sizeof (int)) - 4)"
.LASF660:
	.string	"_SYS_SELECT_H 1"
.LASF487:
	.string	"_T_WCHAR_ "
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF1193:
	.string	"__need___va_list"
.LASF1076:
	.string	"_SC_V7_LP64_OFF64 _SC_V7_LP64_OFF64"
.LASF366:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF1329:
	.string	"_NSIG 65"
.LASF261:
	.string	"__USE_POSIX2"
.LASF1375:
	.string	"FPE_INTDIV FPE_INTDIV"
.LASF703:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF1393:
	.string	"CLD_TRAPPED CLD_TRAPPED"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF755:
	.string	"_XOPEN_XPG4 1"
.LASF872:
	.string	"_SC_CLK_TCK _SC_CLK_TCK"
.LASF321:
	.string	"__END_DECLS "
.LASF613:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF1383:
	.string	"SEGV_MAPERR SEGV_MAPERR"
.LASF793:
	.string	"_LFS_LARGEFILE 1"
.LASF394:
	.string	"_SIZE_T_ "
.LASF1265:
	.string	"_IOFBF 0"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF643:
	.string	"__key_t_defined "
.LASF1458:
	.string	"long long int"
.LASF1403:
	.string	"__have_sigevent_t 1"
.LASF862:
	.string	"_PC_FILESIZEBITS _PC_FILESIZEBITS"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF1399:
	.string	"POLL_ERR POLL_ERR"
.LASF484:
	.string	"__wchar_t__ "
.LASF759:
	.string	"_XOPEN_LEGACY 1"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF407:
	.string	"__need_NULL"
.LASF218:
	.string	"__amd64__ 1"
.LASF1098:
	.string	"_CS_LFS_LINTFLAGS _CS_LFS_LINTFLAGS"
.LASF663:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF976:
	.string	"_SC_INT_MAX _SC_INT_MAX"
.LASF414:
	.string	"_STDINT_H 1"
.LASF1292:
	.string	"SIG_DFL ((__sighandler_t) 0)"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF1296:
	.string	"SIGQUIT 3"
.LASF1120:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF1075:
	.string	"_SC_V7_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG"
.LASF1257:
	.string	"_IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr - (_fp)->_IO_write_base)"
.LASF1272:
	.string	"FILENAME_MAX 4096"
.LASF348:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF670:
	.string	"__timespec_defined 1"
.LASF220:
	.string	"__x86_64__ 1"
.LASF489:
	.string	"__WCHAR_T "
.LASF849:
	.string	"_PC_LINK_MAX _PC_LINK_MAX"
.LASF1318:
	.string	"SIGURG 23"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF672:
	.string	"_STRUCT_TIMEVAL 1"
.LASF1129:
	.string	"_CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS"
.LASF803:
	.string	"_POSIX_SPIN_LOCKS 200809L"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF966:
	.string	"_SC_XOPEN_SHM _SC_XOPEN_SHM"
.LASF1068:
	.string	"_SC_LEVEL3_CACHE_LINESIZE _SC_LEVEL3_CACHE_LINESIZE"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF346:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF1028:
	.string	"_SC_REGEX_VERSION _SC_REGEX_VERSION"
.LASF533:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF308:
	.string	"__PMT"
.LASF891:
	.string	"_SC_SEMAPHORES _SC_SEMAPHORES"
.LASF923:
	.string	"_SC_2_LOCALEDEF _SC_2_LOCALEDEF"
.LASF1222:
	.string	"_IO_IS_APPENDING 0x1000"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF1032:
	.string	"_SC_SPORADIC_SERVER _SC_SPORADIC_SERVER"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF1405:
	.string	"__SIGEV_PAD_SIZE ((__SIGEV_MAX_SIZE / sizeof (int)) - 4)"
.LASF1036:
	.string	"_SC_TIMEOUTS _SC_TIMEOUTS"
.LASF749:
	.string	"_POSIX2_SW_DEV __POSIX2_THIS_VERSION"
.LASF294:
	.string	"__USE_POSIX199506 1"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF1440:
	.string	"_BITS_SIGTHREAD_H 1"
.LASF1417:
	.string	"SA_NOCLDWAIT 2"
.LASF552:
	.string	"__S64_TYPE long int"
.LASF519:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF1181:
	.string	"_IO_size_t size_t"
.LASF298:
	.string	"_ATFILE_SOURCE 1"
.LASF546:
	.string	"__SQUAD_TYPE long int"
.LASF1273:
	.string	"L_ctermid 9"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF1135:
	.string	"_CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS"
.LASF857:
	.string	"_PC_VDISABLE _PC_VDISABLE"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF278:
	.string	"__USE_FORTIFY_LEVEL"
.LASF890:
	.string	"_SC_MESSAGE_PASSING _SC_MESSAGE_PASSING"
.LASF1031:
	.string	"_SC_SPAWN _SC_SPAWN"
.LASF1198:
	.string	"EOF (-1)"
.LASF1418:
	.string	"SA_SIGINFO 4"
.LASF1190:
	.string	"_IO_va_list _G_va_list"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF1408:
	.string	"SIGEV_SIGNAL SIGEV_SIGNAL"
.LASF940:
	.string	"_SC_THREAD_SAFE_FUNCTIONS _SC_THREAD_SAFE_FUNCTIONS"
.LASF870:
	.string	"_SC_ARG_MAX _SC_ARG_MAX"
.LASF225:
	.string	"__k8 1"
.LASF1241:
	.string	"_IO_FIXED 010000"
.LASF724:
	.string	"CLOCK_MONOTONIC_COARSE 6"
.LASF425:
	.string	"INT8_MAX (127)"
.LASF582:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF1266:
	.string	"_IOLBF 1"
.LASF1389:
	.string	"BUS_MCEERR_AO BUS_MCEERR_AO"
.LASF1128:
	.string	"_CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS"
.LASF1207:
	.string	"_IO_MAGIC 0xFBAD0000"
.LASF522:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF1454:
	.string	"unsigned int"
.LASF704:
	.string	"__have_pthread_attr_t 1"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF1102:
	.string	"_CS_LFS64_LINTFLAGS _CS_LFS64_LINTFLAGS"
.LASF379:
	.string	"__stub_putmsg "
.LASF899:
	.string	"_SC_VERSION _SC_VERSION"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF645:
	.string	"__need_time_t "
.LASF1295:
	.string	"SIGINT 2"
.LASF1264:
	.string	"_VA_LIST_DEFINED "
.LASF854:
	.string	"_PC_PIPE_BUF _PC_PIPE_BUF"
.LASF274:
	.string	"__USE_MISC"
.LASF882:
	.string	"_SC_ASYNCHRONOUS_IO _SC_ASYNCHRONOUS_IO"
.LASF271:
	.string	"__USE_LARGEFILE"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF409:
	.string	"_STDBOOL_H "
.LASF498:
	.string	"_WCHAR_T_DECLARED "
.LASF295:
	.string	"__USE_XOPEN2K 1"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF1280:
	.string	"putc(_ch,_fp) _IO_putc (_ch, _fp)"
.LASF583:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF812:
	.string	"_POSIX_IPV6 200809L"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF1184:
	.string	"_IO_off64_t __off64_t"
.LASF847:
	.string	"L_INCR SEEK_CUR"
.LASF817:
	.string	"_POSIX_TRACE -1"
.LASF805:
	.string	"_POSIX_TIMERS 200809L"
.LASF543:
	.string	"__U32_TYPE unsigned int"
.LASF1041:
	.string	"_SC_2_PBS_ACCOUNTING _SC_2_PBS_ACCOUNTING"
.LASF1111:
	.string	"_CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS"
.LASF898:
	.string	"_SC_MQ_PRIO_MAX _SC_MQ_PRIO_MAX"
.LASF340:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF912:
	.string	"_SC_EQUIV_CLASS_MAX _SC_EQUIV_CLASS_MAX"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF1251:
	.string	"_IO_BE(expr,res) __builtin_expect ((expr), res)"
.LASF711:
	.string	"alloca"
.LASF330:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF377:
	.string	"__stub_gtty "
.LASF0:
	.string	"__STDC__ 1"
.LASF440:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF580:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF433:
	.string	"INT_LEAST8_MIN (-128)"
.LASF1119:
	.string	"_CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1259:
	.string	"_IO_flockfile(_fp) "
.LASF868:
	.string	"_PC_SYMLINK_MAX _PC_SYMLINK_MAX"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF557:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF861:
	.string	"_PC_SOCK_MAXBUF _PC_SOCK_MAXBUF"
.LASF350:
	.string	"__wur "
.LASF1263:
	.string	"_IO_cleanup_region_end(_Doit) "
.LASF933:
	.string	"_SC_PII_INTERNET_STREAM _SC_PII_INTERNET_STREAM"
.LASF1092:
	.string	"_CS_POSIX_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF412:
	.string	"false 0"
.LASF640:
	.string	"__id_t_defined "
.LASF1468:
	.string	"current"
.LASF1390:
	.string	"CLD_EXITED CLD_EXITED"
.LASF1121:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF472:
	.string	"INT8_C(c) c"
.LASF411:
	.string	"true 1"
.LASF908:
	.string	"_SC_BC_DIM_MAX _SC_BC_DIM_MAX"
.LASF1013:
	.string	"_SC_DEVICE_SPECIFIC _SC_DEVICE_SPECIFIC"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF303:
	.string	"__GNU_LIBRARY__ 6"
.LASF559:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF1323:
	.string	"SIGWINCH 28"
.LASF801:
	.string	"_POSIX_SHELL 1"
.LASF1419:
	.string	"SA_ONSTACK 0x08000000"
.LASF1291:
	.string	"SIG_ERR ((__sighandler_t) -1)"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF1223:
	.string	"_IO_IS_FILEBUF 0x2000"
.LASF1433:
	.string	"FP_XSTATE_MAGIC2_SIZE sizeof(FP_XSTATE_MAGIC2)"
.LASF566:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF516:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF1362:
	.string	"SI_MESGQ SI_MESGQ"
.LASF312:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF365:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF871:
	.string	"_SC_CHILD_MAX _SC_CHILD_MAX"
.LASF515:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF317:
	.string	"__STRING(x) #x"
.LASF1388:
	.string	"BUS_MCEERR_AR BUS_MCEERR_AR"
.LASF1147:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS"
.LASF1424:
	.string	"SA_NOMASK SA_NODEFER"
.LASF1353:
	.string	"si_band _sifields._sigpoll.si_band"
.LASF823:
	.string	"_POSIX_V6_LPBIG_OFFBIG -1"
.LASF1470:
	.string	"src/main/drivers/system.c"
.LASF528:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1050:
	.string	"_SC_V6_LP64_OFF64 _SC_V6_LP64_OFF64"
.LASF400:
	.string	"___int_size_t_h "
.LASF907:
	.string	"_SC_BC_BASE_MAX _SC_BC_BASE_MAX"
.LASF486:
	.string	"_WCHAR_T "
.LASF874:
	.string	"_SC_OPEN_MAX _SC_OPEN_MAX"
.LASF1127:
	.string	"_CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS"
.LASF1351:
	.string	"si_lower _sifields._sigfault.si_addr_bnd._lower"
.LASF1139:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF689:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF869:
	.string	"_PC_2_SYMLINKS _PC_2_SYMLINKS"
.LASF322:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF1004:
	.string	"_SC_ADVISORY_INFO _SC_ADVISORY_INFO"
.LASF738:
	.string	"UART4_TX_BUFFER_SIZE 256"
.LASF922:
	.string	"_SC_2_SW_DEV _SC_2_SW_DEV"
.LASF368:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF702:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF313:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF370:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF1101:
	.string	"_CS_LFS64_LIBS _CS_LFS64_LIBS"
.LASF389:
	.string	"_SIZE_T "
.LASF494:
	.string	"_WCHAR_T_H "
.LASF905:
	.string	"_SC_SIGQUEUE_MAX _SC_SIGQUEUE_MAX"
.LASF1315:
	.string	"SIGTSTP 20"
.LASF1212:
	.string	"_IO_NO_READS 4"
.LASF419:
	.string	"__uint32_t_defined "
.LASF687:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF790:
	.string	"_LFS_ASYNCHRONOUS_IO 1"
.LASF990:
	.string	"_SC_USHRT_MAX _SC_USHRT_MAX"
.LASF897:
	.string	"_SC_MQ_OPEN_MAX _SC_MQ_OPEN_MAX"
.LASF708:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF435:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF1164:
	.string	"____FILE_defined 1"
.LASF1140:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS"
.LASF607:
	.string	"htole64(x) (x)"
.LASF1211:
	.string	"_IO_UNBUFFERED 2"
.LASF1187:
	.string	"_IO_iconv_t _G_iconv_t"
.LASF432:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF1175:
	.string	"_G_HAVE_MREMAP 1"
.LASF1136:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS"
.LASF952:
	.string	"_SC_THREAD_PRIO_INHERIT _SC_THREAD_PRIO_INHERIT"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF1213:
	.string	"_IO_NO_WRITES 8"
.LASF1365:
	.string	"SI_USER SI_USER"
.LASF758:
	.string	"_XOPEN_ENH_I18N 1"
.LASF1354:
	.string	"si_fd _sifields._sigpoll.si_fd"
.LASF1005:
	.string	"_SC_BARRIERS _SC_BARRIERS"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF393:
	.string	"__SIZE_T "
.LASF816:
	.string	"_POSIX_THREAD_SPORADIC_SERVER -1"
.LASF527:
	.string	"_ENDIAN_H 1"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF1348:
	.string	"si_ptr _sifields._rt.si_sigval.sival_ptr"
.LASF735:
	.string	"UART3_RX_BUFFER_SIZE 256"
.LASF1151:
	.string	"_CS_V6_ENV _CS_V6_ENV"
.LASF587:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF258:
	.string	"__USE_ISOC95"
.LASF798:
	.string	"_POSIX_THREAD_CPUTIME 0"
.LASF1108:
	.string	"_CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF257:
	.string	"__USE_ISOC99"
.LASF1125:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS"
.LASF327:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF1441:
	.string	"CLOCKID CLOCK_REALTIME"
.LASF794:
	.string	"_LFS64_LARGEFILE 1"
.LASF1047:
	.string	"_SC_2_PBS_CHECKPOINT _SC_2_PBS_CHECKPOINT"
.LASF1376:
	.string	"FPE_INTOVF FPE_INTOVF"
.LASF265:
	.string	"__USE_XOPEN_EXTENDED"
.LASF1472:
	.string	"timespec"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF351:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF1438:
	.string	"_SYS_UCONTEXT_H 1"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF1327:
	.string	"SIGSYS 31"
.LASF320:
	.string	"__BEGIN_DECLS "
.LASF1298:
	.string	"SIGTRAP 5"
.LASF497:
	.string	"_GCC_WCHAR_T "
.LASF858:
	.string	"_PC_SYNC_IO _PC_SYNC_IO"
.LASF444:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF1197:
	.string	"_IO_UNIFIED_JUMPTABLES 1"
.LASF979:
	.string	"_SC_WORD_BIT _SC_WORD_BIT"
.LASF506:
	.string	"WCONTINUED 8"
.LASF618:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF1030:
	.string	"_SC_SIGNALS _SC_SIGNALS"
.LASF1404:
	.string	"__SIGEV_MAX_SIZE 64"
.LASF667:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF737:
	.string	"UART4_RX_BUFFER_SIZE 256"
.LASF420:
	.string	"__intptr_t_defined "
.LASF592:
	.string	"__FD_SETSIZE 1024"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF568:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF943:
	.string	"_SC_LOGIN_NAME_MAX _SC_LOGIN_NAME_MAX"
.LASF1285:
	.string	"__sigword(sig) (((sig) - 1) / (8 * sizeof (unsigned long int)))"
.LASF1428:
	.string	"SIG_UNBLOCK 1"
.LASF1442:
	.string	"SIG SIGRTMIN"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF1461:
	.string	"long long unsigned int"
.LASF980:
	.string	"_SC_MB_LEN_MAX _SC_MB_LEN_MAX"
.LASF1363:
	.string	"SI_TIMER SI_TIMER"
.LASF746:
	.string	"_POSIX2_C_VERSION __POSIX2_THIS_VERSION"
.LASF844:
	.string	"SEEK_CUR 1"
.LASF526:
	.string	"__WCOREFLAG 0x80"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1008:
	.string	"_SC_C_LANG_SUPPORT_R _SC_C_LANG_SUPPORT_R"
.LASF1040:
	.string	"_SC_2_PBS _SC_2_PBS"
.LASF259:
	.string	"__USE_ISOCXX11"
.LASF909:
	.string	"_SC_BC_SCALE_MAX _SC_BC_SCALE_MAX"
.LASF397:
	.string	"_SIZE_T_DEFINED "
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF1473:
	.string	"systemInit"
.LASF641:
	.string	"__ssize_t_defined "
.LASF686:
	.string	"_SYS_SYSMACROS_H 1"
.LASF1091:
	.string	"_CS_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF1228:
	.string	"_IO_FLAGS2_USER_WBUF 8"
.LASF510:
	.string	"__WCLONE 0x80000000"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF1037:
	.string	"_SC_TYPED_MEMORY_OBJECTS _SC_TYPED_MEMORY_OBJECTS"
.LASF441:
	.string	"UINT_LEAST8_MAX (255)"
.LASF609:
	.string	"le64toh(x) (x)"
.LASF771:
	.string	"_POSIX_VDISABLE '\\0'"
.LASF1430:
	.string	"_BITS_SIGCONTEXT_H 1"
.LASF654:
	.string	"__timer_t_defined 1"
.LASF290:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF932:
	.string	"_SC_IOV_MAX _SC_IOV_MAX"
.LASF850:
	.string	"_PC_MAX_CANON _PC_MAX_CANON"
.LASF972:
	.string	"_SC_XOPEN_XPG4 _SC_XOPEN_XPG4"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF521:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF633:
	.string	"__dev_t_defined "
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF638:
	.string	"__off_t_defined "
.LASF1258:
	.string	"_IO_peekc(_fp) _IO_peekc_unlocked (_fp)"
.LASF603:
	.string	"htole32(x) (x)"
.LASF1077:
	.string	"_SC_V7_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG"
.LASF1284:
	.string	"__sigmask(sig) (((unsigned long int) 1) << (((sig) - 1) % (8 * sizeof (unsigned long int))))"
.LASF513:
	.string	"P_PID"
.LASF263:
	.string	"__USE_POSIX199506"
.LASF529:
	.string	"__BIG_ENDIAN 4321"
.LASF474:
	.string	"INT32_C(c) c"
.LASF732:
	.string	"UART1_TX_BUFFER_SIZE 256"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF944:
	.string	"_SC_TTY_NAME_MAX _SC_TTY_NAME_MAX"
.LASF479:
	.string	"UINT64_C(c) c ## UL"
.LASF1219:
	.string	"_IO_LINE_BUF 0x200"
.LASF1113:
	.string	"_CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS"
.LASF845:
	.string	"SEEK_END 2"
.LASF231:
	.string	"__FXSR__ 1"
.LASF911:
	.string	"_SC_COLL_WEIGHTS_MAX _SC_COLL_WEIGHTS_MAX"
.LASF717:
	.string	"CLOCKS_PER_SEC ((clock_t) 1000000)"
.LASF1216:
	.string	"_IO_DELETE_DONT_CLOSE 0x40"
.LASF361:
	.string	"__WORDSIZE 64"
.LASF934:
	.string	"_SC_PII_INTERNET_DGRAM _SC_PII_INTERNET_DGRAM"
.LASF683:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF493:
	.string	"_WCHAR_T_DEFINED "
.LASF782:
	.string	"_POSIX_THREAD_PRIO_INHERIT 200809L"
.LASF859:
	.string	"_PC_ASYNC_IO _PC_ASYNC_IO"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF384:
	.string	"__stub_stty "
.LASF865:
	.string	"_PC_REC_MIN_XFER_SIZE _PC_REC_MIN_XFER_SIZE"
.LASF1385:
	.string	"BUS_ADRALN BUS_ADRALN"
.LASF778:
	.string	"_POSIX_THREAD_SAFE_FUNCTIONS 200809L"
.LASF1398:
	.string	"POLL_MSG POLL_MSG"
.LASF789:
	.string	"_POSIX_ASYNC_IO 1"
.LASF331:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF751:
	.string	"_XOPEN_VERSION 700"
.LASF1064:
	.string	"_SC_LEVEL2_CACHE_ASSOC _SC_LEVEL2_CACHE_ASSOC"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF501:
	.string	"_STDLIB_H 1"
.LASF1456:
	.string	"__time_t"
.LASF395:
	.string	"_BSD_SIZE_T_ "
.LASF867:
	.string	"_PC_ALLOC_SIZE_MIN _PC_ALLOC_SIZE_MIN"
.LASF329:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF1200:
	.string	"_IOS_OUTPUT 2"
.LASF481:
	.string	"UINTMAX_C(c) c ## UL"
.LASF1226:
	.string	"_IO_FLAGS2_MMAP 1"
.LASF1146:
	.string	"_CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS"
.LASF974:
	.string	"_SC_CHAR_MAX _SC_CHAR_MAX"
.LASF1105:
	.string	"_CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS"
.LASF1007:
	.string	"_SC_C_LANG_SUPPORT _SC_C_LANG_SUPPORT"
.LASF488:
	.string	"_T_WCHAR "
.LASF325:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF542:
	.string	"__S32_TYPE int"
.LASF621:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF431:
	.string	"UINT32_MAX (4294967295U)"
.LASF1445:
	.string	"BILLION 1000000000L"
.LASF965:
	.string	"_SC_XOPEN_ENH_I18N _SC_XOPEN_ENH_I18N"
.LASF917:
	.string	"_SC_2_VERSION _SC_2_VERSION"
.LASF1061:
	.string	"_SC_LEVEL1_DCACHE_ASSOC _SC_LEVEL1_DCACHE_ASSOC"
.LASF1009:
	.string	"_SC_CLOCK_SELECTION _SC_CLOCK_SELECTION"
.LASF1070:
	.string	"_SC_LEVEL4_CACHE_ASSOC _SC_LEVEL4_CACHE_ASSOC"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF1406:
	.string	"sigev_notify_function _sigev_un._sigev_thread._function"
.LASF469:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF254:
	.string	"_STRING_H 1"
.LASF415:
	.string	"_BITS_WCHAR_H 1"
.LASF942:
	.string	"_SC_GETPW_R_SIZE_MAX _SC_GETPW_R_SIZE_MAX"
.LASF241:
	.string	"__ELF__ 1"
.LASF475:
	.string	"INT64_C(c) c ## L"
.LASF853:
	.string	"_PC_PATH_MAX _PC_PATH_MAX"
.LASF685:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF1043:
	.string	"_SC_2_PBS_MESSAGE _SC_2_PBS_MESSAGE"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF734:
	.string	"UART2_TX_BUFFER_SIZE 256"
.LASF1221:
	.string	"_IO_CURRENTLY_PUTTING 0x800"
.LASF1336:
	.string	"__SI_MAX_SIZE 128"
.LASF1267:
	.string	"_IONBF 2"
.LASF490:
	.string	"_WCHAR_T_ "
.LASF383:
	.string	"__stub_sstk "
.LASF984:
	.string	"_SC_SCHAR_MIN _SC_SCHAR_MIN"
.LASF1208:
	.string	"_OLD_STDIO_MAGIC 0xFABC0000"
.LASF1269:
	.string	"P_tmpdir \"/tmp\""
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF739:
	.string	"UART5_RX_BUFFER_SIZE 256"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF492:
	.string	"_WCHAR_T_DEFINED_ "
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF996:
	.string	"_SC_NL_TEXTMAX _SC_NL_TEXTMAX"
.LASF956:
	.string	"_SC_NPROCESSORS_ONLN _SC_NPROCESSORS_ONLN"
.LASF1386:
	.string	"BUS_ADRERR BUS_ADRERR"
.LASF978:
	.string	"_SC_LONG_BIT _SC_LONG_BIT"
.LASF745:
	.string	"_POSIX2_VERSION __POSIX2_THIS_VERSION"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF894:
	.string	"_SC_AIO_MAX _SC_AIO_MAX"
.LASF1133:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS"
.LASF1395:
	.string	"CLD_CONTINUED CLD_CONTINUED"
.LASF772:
	.string	"_POSIX_NO_TRUNC 1"
.LASF900:
	.string	"_SC_PAGESIZE _SC_PAGESIZE"
.LASF372:
	.string	"__stub_chflags "
.LASF833:
	.string	"__LP64_OFF64_LDFLAGS \"-m64\""
.LASF1118:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS"
.LASF676:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1334:
	.string	"__have_sigval_t 1"
.LASF402:
	.string	"_SIZET_ "
.LASF1469:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF585:
	.string	"__TIMER_T_TYPE void *"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF1065:
	.string	"_SC_LEVEL2_CACHE_LINESIZE _SC_LEVEL2_CACHE_LINESIZE"
.LASF1224:
	.string	"_IO_BAD_SEEN 0x4000"
.LASF637:
	.string	"__uid_t_defined "
.LASF610:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF1314:
	.string	"SIGSTOP 19"
.LASF731:
	.string	"UART1_RX_BUFFER_SIZE 256"
.LASF1249:
	.string	"_IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))"
.LASF536:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF594:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF939:
	.string	"_SC_THREADS _SC_THREADS"
.LASF230:
	.string	"__SSE2__ 1"
.LASF649:
	.string	"__need_clock_t"
.LASF512:
	.string	"P_ALL"
.LASF885:
	.string	"_SC_FSYNC _SC_FSYNC"
.LASF579:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF369:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF354:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF750:
	.string	"_POSIX2_LOCALEDEF __POSIX2_THIS_VERSION"
.LASF914:
	.string	"_SC_LINE_MAX _SC_LINE_MAX"
.LASF1310:
	.string	"SIGSTKFLT 16"
.LASF347:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF524:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF1307:
	.string	"SIGPIPE 13"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF1364:
	.string	"SI_QUEUE SI_QUEUE"
.LASF453:
	.string	"UINT_FAST8_MAX (255)"
.LASF879:
	.string	"_SC_REALTIME_SIGNALS _SC_REALTIME_SIGNALS"
.LASF929:
	.string	"_SC_POLL _SC_POLL"
.LASF1283:
	.string	"_EXTERN_INLINE __extern_inline"
.LASF1062:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE _SC_LEVEL1_DCACHE_LINESIZE"
.LASF1425:
	.string	"SA_ONESHOT SA_RESETHAND"
.LASF507:
	.string	"WNOWAIT 0x01000000"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF1274:
	.string	"FOPEN_MAX"
.LASF830:
	.string	"__ILP32_OFFBIG_CFLAGS \"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64\""
.LASF1024:
	.string	"_SC_NETWORKING _SC_NETWORKING"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF651:
	.string	"__need_time_t"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF893:
	.string	"_SC_AIO_LISTIO_MAX _SC_AIO_LISTIO_MAX"
.LASF835:
	.string	"STDOUT_FILENO 1"
.LASF615:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF326:
	.string	"__END_NAMESPACE_C99 "
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF1451:
	.string	"short int"
.LASF300:
	.string	"__USE_ATFILE 1"
.LASF1096:
	.string	"_CS_LFS_LDFLAGS _CS_LFS_LDFLAGS"
.LASF783:
	.string	"_POSIX_THREAD_PRIO_PROTECT 200809L"
.LASF617:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF569:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF1132:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS"
.LASF1078:
	.string	"_SC_SS_REPL_MAX _SC_SS_REPL_MAX"
.LASF357:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF307:
	.string	"_SYS_CDEFS_H 1"
.LASF647:
	.string	"__need_clockid_t "
.LASF1052:
	.string	"_SC_HOST_NAME_MAX _SC_HOST_NAME_MAX"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF338:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF690:
	.string	"__blksize_t_defined "
.LASF921:
	.string	"_SC_2_FORT_RUN _SC_2_FORT_RUN"
.LASF678:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF1460:
	.string	"tv_nsec"
.LASF1023:
	.string	"_SC_SINGLE_PROCESS _SC_SINGLE_PROCESS"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1112:
	.string	"_CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS"
.LASF918:
	.string	"_SC_2_C_BIND _SC_2_C_BIND"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF1352:
	.string	"si_upper _sifields._sigfault.si_addr_bnd._upper"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF1025:
	.string	"_SC_READER_WRITER_LOCKS _SC_READER_WRITER_LOCKS"
.LASF698:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF1158:
	.string	"F_TEST 3"
.LASF910:
	.string	"_SC_BC_STRING_MAX _SC_BC_STRING_MAX"
.LASF951:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING _SC_THREAD_PRIORITY_SCHEDULING"
.LASF547:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF1039:
	.string	"_SC_USER_GROUPS_R _SC_USER_GROUPS_R"
.LASF822:
	.string	"_POSIX_V7_LPBIG_OFFBIG -1"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF718:
	.string	"CLOCK_REALTIME 0"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF1236:
	.string	"_IO_SHOWBASE 0200"
.LASF1188:
	.string	"_IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE"
.LASF1116:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS"
.LASF630:
	.string	"_SYS_TYPES_H 1"
.LASF336:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF1358:
	.string	"SI_ASYNCNL SI_ASYNCNL"
.LASF1072:
	.string	"_SC_IPV6 _SC_IPV6"
.LASF1087:
	.string	"_CS_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1347:
	.string	"si_int _sifields._rt.si_sigval.sival_int"
.LASF564:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF373:
	.string	"__stub_fattach "
.LASF1206:
	.string	"_IOS_BIN 128"
.LASF1170:
	.string	"____mbstate_t_defined 1"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF339:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF548:
	.string	"__SWORD_TYPE long int"
.LASF851:
	.string	"_PC_MAX_INPUT _PC_MAX_INPUT"
.LASF342:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF485:
	.string	"__WCHAR_T__ "
.LASF1277:
	.string	"stdout stdout"
.LASF1083:
	.string	"_SC_XOPEN_STREAMS _SC_XOPEN_STREAMS"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF345:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF1079:
	.string	"_SC_TRACE_EVENT_NAME_MAX _SC_TRACE_EVENT_NAME_MAX"
.LASF436:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF561:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF291:
	.string	"__USE_POSIX 1"
.LASF1343:
	.string	"si_status _sifields._sigchld.si_status"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF462:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF1420:
	.string	"SA_RESTART 0x10000000"
.LASF459:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF553:
	.string	"__U64_TYPE unsigned long int"
.LASF511:
	.string	"__ENUM_IDTYPE_T 1"
.LASF977:
	.string	"_SC_INT_MIN _SC_INT_MIN"
.LASF688:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF1371:
	.string	"ILL_PRVOPC ILL_PRVOPC"
.LASF629:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF1436:
	.string	"MINSIGSTKSZ 2048"
.LASF836:
	.string	"STDERR_FILENO 2"
.LASF1097:
	.string	"_CS_LFS_LIBS _CS_LFS_LIBS"
.LASF706:
	.string	"__PTHREAD_SPINS 0, 0"
.LASF1177:
	.string	"_G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)"
.LASF797:
	.string	"_POSIX_CPUTIME 0"
.LASF848:
	.string	"L_XTND SEEK_END"
.LASF540:
	.string	"__S16_TYPE short int"
.LASF988:
	.string	"_SC_UINT_MAX _SC_UINT_MAX"
.LASF1465:
	.string	"usTicks"
.LASF650:
	.string	"__time_t_defined 1"
.LASF986:
	.string	"_SC_SHRT_MIN _SC_SHRT_MIN"
.LASF1234:
	.string	"_IO_OCT 040"
.LASF720:
	.string	"CLOCK_PROCESS_CPUTIME_ID 2"
.LASF1380:
	.string	"FPE_FLTRES FPE_FLTRES"
.LASF701:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF752:
	.string	"_XOPEN_XCU_VERSION 4"
.LASF349:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF1240:
	.string	"_IO_SCIENTIFIC 04000"
.LASF352:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1209:
	.string	"_IO_MAGIC_MASK 0xFFFF0000"
.LASF1360:
	.string	"SI_SIGIO SI_SIGIO"
.LASF985:
	.string	"_SC_SHRT_MAX _SC_SHRT_MAX"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF1252:
	.string	"_IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF495:
	.string	"___int_wchar_t_h "
.LASF1167:
	.string	"_IO_STDIO_H "
.LASF535:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF1020:
	.string	"_SC_FILE_SYSTEM _SC_FILE_SYSTEM"
.LASF960:
	.string	"_SC_PASS_MAX _SC_PASS_MAX"
.LASF1057:
	.string	"_SC_LEVEL1_ICACHE_SIZE _SC_LEVEL1_ICACHE_SIZE"
.LASF776:
	.string	"_POSIX_THREADS 200809L"
.LASF367:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF1340:
	.string	"si_uid _sifields._kill.si_uid"
.LASF399:
	.string	"_SIZE_T_DECLARED "
.LASF846:
	.string	"L_SET SEEK_SET"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF228:
	.string	"__MMX__ 1"
.LASF424:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF992:
	.string	"_SC_NL_LANGMAX _SC_NL_LANGMAX"
.LASF1427:
	.string	"SIG_BLOCK 0"
.LASF1174:
	.string	"_G_HAVE_MMAP 1"
.LASF624:
	.string	"__ldiv_t_defined 1"
.LASF1176:
	.string	"_G_IO_IO_FILE_VERSION 0x20001"
.LASF282:
	.string	"_DEFAULT_SOURCE"
.LASF1134:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS"
.LASF401:
	.string	"_GCC_SIZE_T "
.LASF792:
	.string	"_LFS64_ASYNCHRONOUS_IO 1"
.LASF970:
	.string	"_SC_XOPEN_XPG2 _SC_XOPEN_XPG2"
.LASF556:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF1153:
	.string	"__need_getopt "
.LASF756:
	.string	"_XOPEN_UNIX 1"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF658:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF499:
	.string	"_BSD_WCHAR_T_"
.LASF439:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF531:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF1455:
	.string	"uint32_t"
.LASF1165:
	.string	"__need___FILE"
.LASF558:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF434:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF514:
	.string	"P_PGID"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF1367:
	.string	"ILL_ILLOPC ILL_ILLOPC"
.LASF446:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF1049:
	.string	"_SC_V6_ILP32_OFFBIG _SC_V6_ILP32_OFFBIG"
.LASF328:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF537:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF217:
	.string	"__amd64 1"
.LASF288:
	.string	"_POSIX_SOURCE 1"
.LASF1349:
	.string	"si_addr _sifields._sigfault.si_addr"
.LASF292:
	.string	"__USE_POSIX2 1"
.LASF239:
	.string	"__unix__ 1"
.LASF570:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF523:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF692:
	.string	"__fsblkcnt_t_defined "
.LASF1086:
	.string	"_CS_PATH _CS_PATH"
.LASF426:
	.string	"INT16_MAX (32767)"
.LASF656:
	.string	"__need_timespec"
.LASF806:
	.string	"_POSIX_BARRIERS 200809L"
.LASF1355:
	.string	"si_call_addr _sifields._sigsys._call_addr"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF1443:
	.string	"errExit(msg) do { perror(msg); exit(EXIT_FAILURE); } while (0)"
.LASF562:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF1163:
	.string	"__need_FILE"
.LASF635:
	.string	"__mode_t_defined "
.LASF1311:
	.string	"SIGCLD SIGCHLD"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF563:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF1220:
	.string	"_IO_TIED_PUT_GET 0x400"
.LASF1286:
	.string	"__sigemptyset(set) (__extension__ ({ int __cnt = _SIGSET_NWORDS; sigset_t *__set = (set); while (--__cnt >= 0) __set->__val[__cnt] = 0; 0; }))"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF1179:
	.string	"_IO_fpos_t _G_fpos_t"
.LASF1268:
	.string	"BUFSIZ _IO_BUFSIZ"
.LASF319:
	.string	"__long_double_t long double"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF713:
	.string	"__COMPAR_FN_T "
.LASF240:
	.string	"unix 1"
.LASF1448:
	.string	"short unsigned int"
.LASF1305:
	.string	"SIGSEGV 11"
.LASF476:
	.string	"UINT8_C(c) c"
.LASF450:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF777:
	.string	"_POSIX_REENTRANT_FUNCTIONS 1"
.LASF1391:
	.string	"CLD_KILLED CLD_KILLED"
.LASF236:
	.string	"__linux__ 1"
.LASF301:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF302:
	.string	"__GNU_LIBRARY__"
.LASF1309:
	.string	"SIGTERM 15"
.LASF299:
	.string	"__USE_MISC 1"
.LASF413:
	.string	"__bool_true_false_are_defined 1"
.LASF768:
	.string	"_POSIX_MEMLOCK_RANGE 200809L"
.LASF588:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF839:
	.string	"R_OK 4"
.LASF416:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF323:
	.string	"__END_NAMESPACE_STD "
.LASF957:
	.string	"_SC_PHYS_PAGES _SC_PHYS_PAGES"
.LASF1313:
	.string	"SIGCONT 18"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF1392:
	.string	"CLD_DUMPED CLD_DUMPED"
.LASF518:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF973:
	.string	"_SC_CHAR_BIT _SC_CHAR_BIT"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF748:
	.string	"_POSIX2_C_DEV __POSIX2_THIS_VERSION"
.LASF1015:
	.string	"_SC_FD_MGMT _SC_FD_MGMT"
.LASF277:
	.string	"__USE_REENTRANT"
.LASF634:
	.string	"__gid_t_defined "
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF818:
	.string	"_POSIX_TRACE_EVENT_FILTER -1"
.LASF1073:
	.string	"_SC_RAW_SOCKETS _SC_RAW_SOCKETS"
.LASF332:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF1124:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS"
.LASF1409:
	.string	"SIGEV_NONE SIGEV_NONE"
.LASF627:
	.string	"EXIT_FAILURE 1"
.LASF855:
	.string	"_PC_CHOWN_RESTRICTED _PC_CHOWN_RESTRICTED"
.LASF1195:
	.string	"_IO_va_list"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF1306:
	.string	"SIGUSR2 12"
.LASF1090:
	.string	"_CS_GNU_LIBPTHREAD_VERSION _CS_GNU_LIBPTHREAD_VERSION"
.LASF565:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF831:
	.string	"__ILP32_OFFBIG_LDFLAGS \"-m32\""
.LASF1122:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS"
.LASF938:
	.string	"_SC_T_IOV_MAX _SC_T_IOV_MAX"
.LASF1106:
	.string	"_CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS"
.LASF709:
	.string	"__malloc_and_calloc_defined "
.LASF1381:
	.string	"FPE_FLTINV FPE_FLTINV"
.LASF971:
	.string	"_SC_XOPEN_XPG3 _SC_XOPEN_XPG3"
.LASF880:
	.string	"_SC_PRIORITY_SCHEDULING _SC_PRIORITY_SCHEDULING"
.LASF947:
	.string	"_SC_THREAD_STACK_MIN _SC_THREAD_STACK_MIN"
.LASF941:
	.string	"_SC_GETGR_R_SIZE_MAX _SC_GETGR_R_SIZE_MAX"
.LASF1270:
	.string	"L_tmpnam 20"
.LASF272:
	.string	"__USE_LARGEFILE64"
.LASF1006:
	.string	"_SC_BASE _SC_BASE"
.LASF1288:
	.string	"__sig_atomic_t_defined "
.LASF100:
	.string	"__INT16_C(c) c"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF773:
	.string	"_XOPEN_REALTIME 1"
.LASF1435:
	.string	"SS_DISABLE SS_DISABLE"
.LASF987:
	.string	"_SC_UCHAR_MAX _SC_UCHAR_MAX"
.LASF1089:
	.string	"_CS_GNU_LIBC_VERSION _CS_GNU_LIBC_VERSION"
.LASF1154:
	.string	"__need_getopt"
.LASF1053:
	.string	"_SC_TRACE _SC_TRACE"
.LASF878:
	.string	"_SC_SAVED_IDS _SC_SAVED_IDS"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF946:
	.string	"_SC_THREAD_KEYS_MAX _SC_THREAD_KEYS_MAX"
.LASF532:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF235:
	.string	"__linux 1"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF1413:
	.string	"NSIG _NSIG"
.LASF620:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF953:
	.string	"_SC_THREAD_PRIO_PROTECT _SC_THREAD_PRIO_PROTECT"
.LASF767:
	.string	"_POSIX_MEMLOCK 200809L"
.LASF682:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF815:
	.string	"_POSIX_SPORADIC_SERVER -1"
.LASF1148:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS"
.LASF712:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF1459:
	.string	"tv_sec"
.LASF616:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF464:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF700:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF1301:
	.string	"SIGBUS 7"
.LASF289:
	.string	"_POSIX_C_SOURCE"
.LASF967:
	.string	"_SC_2_CHAR_TERM _SC_2_CHAR_TERM"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF945:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF480:
	.string	"INTMAX_C(c) c ## L"
.LASF1319:
	.string	"SIGXCPU 24"
.LASF904:
	.string	"_SC_SEM_VALUE_MAX _SC_SEM_VALUE_MAX"
.LASF359:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF931:
	.string	"_SC_UIO_MAXIOV _SC_UIO_MAXIOV"
.LASF1308:
	.string	"SIGALRM 14"
.LASF1022:
	.string	"_SC_MULTI_PROCESS _SC_MULTI_PROCESS"
.LASF1242:
	.string	"_IO_UNITBUF 020000"
.LASF1038:
	.string	"_SC_USER_GROUPS _SC_USER_GROUPS"
.LASF995:
	.string	"_SC_NL_SETMAX _SC_NL_SETMAX"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
