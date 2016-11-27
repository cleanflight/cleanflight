	.file	"system.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed system.i -mtune=generic -march=x86-64 -g
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
	.comm	U_ID_0,4,4
	.comm	U_ID_1,4,4
	.comm	U_ID_2,4,4
	.comm	receiveLength,4,4
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
.LFB6:
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
	movq	current(%rip), %rdx	# current.tv_sec, D.5369
	movq	start(%rip), %rax	# start.tv_sec, D.5369
	subq	%rax, %rdx	# D.5369, D.5369
	movq	%rdx, %rax	# D.5369, D.5369
	imulq	$1000000000, %rax, %rdx	#, D.5369, D.5369
	movq	current+8(%rip), %rax	# current.tv_nsec, D.5369
	addq	%rax, %rdx	# D.5369, D.5369
	movq	start+8(%rip), %rax	# start.tv_nsec, D.5369
	movq	%rdx, %rcx	# D.5369, D.5369
	subq	%rax, %rcx	# D.5369, D.5369
	movabsq	$2361183241434822607, %rdx	#, tmp101
	movq	%rcx, %rax	# D.5369, tmp105
	imulq	%rdx	# tmp101
	sarq	$7, %rdx	#, tmp102
	movq	%rcx, %rax	# D.5369, tmp103
	sarq	$63, %rax	#, tmp103
	subq	%rax, %rdx	# tmp103, D.5369
	movq	%rdx, %rax	# D.5369, D.5369
	movl	%eax, sysTickUptime(%rip)	# D.5370, sysTickUptime
	.loc 1 62 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.5370
	movl	%eax, usTicks(%rip)	# D.5370, usTicks
	.loc 1 65 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.5371
	.loc 1 66 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	micros, .-micros
	.section	.text.millis,"ax",@progbits
	.globl	millis
	.type	millis, @function
millis:
.LFB7:
	.loc 1 70 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 71 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.5372
	movl	$274877907, %edx	#, tmp91
	mull	%edx	# tmp91
	movl	%edx, %eax	# tmp90, D.5373
	shrl	$6, %eax	#, D.5373
	.loc 1 72 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	millis, .-millis
	.section	.rodata
.LC0:
	.string	"First"
.LC1:
	.string	"Original:%lu\n"
	.section	.text.systemInit,"ax",@progbits
	.globl	systemInit
	.type	systemInit, @function
systemInit:
.LFB8:
	.loc 1 76 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 77 0
	movl	$.LC0, %edi	#,
	call	puts	#
	.loc 1 78 0
	call	usartInitAllIOSignals	#
	.loc 1 80 0
	movl	$start, %esi	#,
	movl	$4, %edi	#,
	call	clock_gettime	#
	.loc 1 81 0
	movq	start(%rip), %rax	# start.tv_sec, D.5374
	imulq	$1000000000, %rax, %rdx	#, D.5374, D.5374
	movq	start+8(%rip), %rax	# start.tv_nsec, D.5374
	leaq	(%rdx,%rax), %rcx	#, D.5374
	movabsq	$2361183241434822607, %rdx	#, tmp93
	movq	%rcx, %rax	# D.5374, tmp96
	imulq	%rdx	# tmp93
	sarq	$7, %rdx	#, tmp94
	movq	%rcx, %rax	# D.5374, tmp95
	sarq	$63, %rax	#, tmp95
	subq	%rax, %rdx	# tmp95, D.5374
	movq	%rdx, %rax	# D.5374, D.5374
	movq	%rax, %rsi	# D.5374,
	movl	$.LC1, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 82 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	systemInit, .-systemInit
	.section	.text.delay,"ax",@progbits
	.globl	delay
	.type	delay, @function
delay:
.LFB9:
	.loc 1 85 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# ms, ms
	.loc 1 86 0
	movl	-4(%rbp), %eax	# ms, tmp88
	imull	$1000, %eax, %eax	#, tmp88, D.5377
	movl	%eax, %edi	# D.5377,
	call	usleep	#
	.loc 1 87 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	delay, .-delay
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/time.h"
	.file 5 "./src/main/target/edison/target.h"
	.file 6 "src/main/drivers/serial_uart.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1f2
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF27
	.byte	0xc
	.long	.LASF28
	.long	.LASF29
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0x33
	.long	0x73
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x8b
	.long	0x5a
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0xaf
	.long	0x5a
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x5
	.long	.LASF30
	.byte	0x10
	.byte	0x4
	.byte	0x78
	.long	0xbc
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0x7a
	.long	0x7a
	.byte	0
	.uleb128 0x6
	.long	.LASF14
	.byte	0x4
	.byte	0x7b
	.long	0x85
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF16
	.uleb128 0x7
	.long	.LASF17
	.byte	0x1
	.byte	0x3a
	.long	0x68
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF18
	.byte	0x1
	.byte	0x45
	.long	0x68
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.long	.LASF31
	.byte	0x1
	.byte	0x4b
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.long	.LASF32
	.byte	0x1
	.byte	0x54
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x148
	.uleb128 0xb
	.string	"ms"
	.byte	0x1
	.byte	0x54
	.long	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.byte	0x2a
	.long	0x68
	.uleb128 0x9
	.byte	0x3
	.quad	usTicks
	.uleb128 0xc
	.long	.LASF20
	.byte	0x1
	.byte	0x2f
	.long	0x172
	.uleb128 0x9
	.byte	0x3
	.quad	sysTickUptime
	.uleb128 0xd
	.long	0x68
	.uleb128 0xe
	.long	.LASF21
	.byte	0x5
	.byte	0xc8
	.long	0x68
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0xe
	.long	.LASF22
	.byte	0x5
	.byte	0xc9
	.long	0x68
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0xe
	.long	.LASF23
	.byte	0x5
	.byte	0xca
	.long	0x68
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0xe
	.long	.LASF24
	.byte	0x6
	.byte	0x29
	.long	0x172
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0xe
	.long	.LASF25
	.byte	0x1
	.byte	0x32
	.long	0x97
	.uleb128 0x9
	.byte	0x3
	.quad	start
	.uleb128 0xe
	.long	.LASF26
	.byte	0x1
	.byte	0x33
	.long	0x97
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
	.uleb128 0xd
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x5c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
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
.LASF10:
	.string	"__time_t"
.LASF25:
	.string	"start"
.LASF14:
	.string	"tv_nsec"
.LASF24:
	.string	"receiveLength"
.LASF17:
	.string	"micros"
.LASF31:
	.string	"systemInit"
.LASF30:
	.string	"timespec"
.LASF15:
	.string	"long long unsigned int"
.LASF32:
	.string	"delay"
.LASF23:
	.string	"U_ID_2"
.LASF7:
	.string	"unsigned char"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF27:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF29:
	.string	"/home/aravind/git/cleanflight"
.LASF8:
	.string	"unsigned int"
.LASF3:
	.string	"char"
.LASF19:
	.string	"usTicks"
.LASF1:
	.string	"sizetype"
.LASF13:
	.string	"tv_sec"
.LASF12:
	.string	"long long int"
.LASF22:
	.string	"U_ID_1"
.LASF28:
	.string	"src/main/drivers/system.c"
.LASF5:
	.string	"short int"
.LASF21:
	.string	"U_ID_0"
.LASF26:
	.string	"current"
.LASF9:
	.string	"uint32_t"
.LASF6:
	.string	"long int"
.LASF18:
	.string	"millis"
.LASF4:
	.string	"signed char"
.LASF16:
	.string	"_Bool"
.LASF11:
	.string	"__syscall_slong_t"
.LASF20:
	.string	"sysTickUptime"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
