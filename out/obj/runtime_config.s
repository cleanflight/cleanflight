	.file	"runtime_config.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed runtime_config.i -mtune=generic
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
	.globl	armingFlags
	.section	.bss.armingFlags,"aw",@nobits
	.type	armingFlags, @object
	.size	armingFlags, 1
armingFlags:
	.zero	1
	.globl	stateFlags
	.section	.bss.stateFlags,"aw",@nobits
	.type	stateFlags, @object
	.size	stateFlags, 1
stateFlags:
	.zero	1
	.globl	flightModeFlags
	.section	.bss.flightModeFlags,"aw",@nobits
	.align 2
	.type	flightModeFlags, @object
	.size	flightModeFlags, 2
flightModeFlags:
	.zero	2
	.section	.bss.enabledSensors,"aw",@nobits
	.align 4
	.type	enabledSensors, @object
	.size	enabledSensors, 4
enabledSensors:
	.zero	4
	.section	.text.enableFlightMode,"ax",@progbits
	.globl	enableFlightMode
	.type	enableFlightMode, @function
enableFlightMode:
.LFB0:
	.file 1 "src/main/fc/runtime_config.c"
	.loc 1 35 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# mask, mask
	.loc 1 36 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, tmp93
	movw	%ax, -2(%rbp)	# tmp93, oldVal
	.loc 1 38 0
	movl	-20(%rbp), %eax	# mask, tmp94
	movl	%eax, %edx	# tmp94, D.1996
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.1996
	orl	%edx, %eax	# D.1996, D.1996
	movw	%ax, flightModeFlags(%rip)	# D.1996, flightModeFlags
	.loc 1 39 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.1996
	cmpw	-2(%rbp), %ax	# oldVal, D.1996
	je	.L2	#,
	.loc 1 40 0
	movl	$1, %edi	#,
	call	beeperConfirmationBeeps	#
.L2:
	.loc 1 41 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.1997
	.loc 1 42 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	enableFlightMode, .-enableFlightMode
	.section	.text.disableFlightMode,"ax",@progbits
	.globl	disableFlightMode
	.type	disableFlightMode, @function
disableFlightMode:
.LFB1:
	.loc 1 49 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# mask, mask
	.loc 1 50 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, tmp94
	movw	%ax, -2(%rbp)	# tmp94, oldVal
	.loc 1 52 0
	movl	-20(%rbp), %eax	# mask, tmp95
	notl	%eax	# D.1998
	movl	%eax, %edx	# D.1998, D.1998
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.1998
	andl	%edx, %eax	# D.1998, D.1998
	movw	%ax, flightModeFlags(%rip)	# D.1998, flightModeFlags
	.loc 1 53 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.1998
	cmpw	-2(%rbp), %ax	# oldVal, D.1998
	je	.L5	#,
	.loc 1 54 0
	movl	$1, %edi	#,
	call	beeperConfirmationBeeps	#
.L5:
	.loc 1 55 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.1999
	.loc 1 56 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	disableFlightMode, .-disableFlightMode
	.section	.text.sensors,"ax",@progbits
	.globl	sensors
	.type	sensors, @function
sensors:
.LFB2:
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 1 60 0
	movl	enabledSensors(%rip), %eax	# enabledSensors, D.2000
	andl	-4(%rbp), %eax	# mask, D.2000
	testl	%eax, %eax	# D.2000
	setne	%al	#, D.2001
	.loc 1 61 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	sensors, .-sensors
	.section	.text.sensorsSet,"ax",@progbits
	.globl	sensorsSet
	.type	sensorsSet, @function
sensorsSet:
.LFB3:
	.loc 1 64 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 1 65 0
	movl	enabledSensors(%rip), %eax	# enabledSensors, D.2002
	orl	-4(%rbp), %eax	# mask, D.2002
	movl	%eax, enabledSensors(%rip)	# D.2002, enabledSensors
	.loc 1 66 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	sensorsSet, .-sensorsSet
	.section	.text.sensorsClear,"ax",@progbits
	.globl	sensorsClear
	.type	sensorsClear, @function
sensorsClear:
.LFB4:
	.loc 1 69 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 1 70 0
	movl	-4(%rbp), %eax	# mask, tmp90
	notl	%eax	# D.2003
	movl	%eax, %edx	# D.2003, D.2003
	movl	enabledSensors(%rip), %eax	# enabledSensors, D.2003
	andl	%edx, %eax	# D.2003, D.2003
	movl	%eax, enabledSensors(%rip)	# D.2003, enabledSensors
	.loc 1 71 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sensorsClear, .-sensorsClear
	.section	.text.sensorsMask,"ax",@progbits
	.globl	sensorsMask
	.type	sensorsMask, @function
sensorsMask:
.LFB5:
	.loc 1 74 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 75 0
	movl	enabledSensors(%rip), %eax	# enabledSensors, D.2004
	.loc 1 76 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	sensorsMask, .-sensorsMask
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/fc/runtime_config.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x25f
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF35
	.byte	0xc
	.long	.LASF36
	.long	.LASF37
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
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x4
	.long	.LASF4
	.byte	0x2
	.byte	0x30
	.long	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x2
	.byte	0x31
	.long	0x62
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x4
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
	.uleb128 0x5
	.byte	0x4
	.long	0x74
	.byte	0x3
	.byte	0x21
	.long	0xdb
	.uleb128 0x6
	.long	.LASF10
	.byte	0x1
	.uleb128 0x6
	.long	.LASF11
	.byte	0x2
	.uleb128 0x6
	.long	.LASF12
	.byte	0x4
	.uleb128 0x6
	.long	.LASF13
	.byte	0x8
	.uleb128 0x6
	.long	.LASF14
	.byte	0x10
	.uleb128 0x6
	.long	.LASF15
	.byte	0x20
	.uleb128 0x6
	.long	.LASF16
	.byte	0x40
	.uleb128 0x6
	.long	.LASF17
	.byte	0x80
	.uleb128 0x7
	.long	.LASF18
	.value	0x100
	.uleb128 0x7
	.long	.LASF19
	.value	0x200
	.uleb128 0x7
	.long	.LASF20
	.value	0x400
	.uleb128 0x7
	.long	.LASF21
	.value	0x800
	.byte	0
	.uleb128 0x4
	.long	.LASF22
	.byte	0x3
	.byte	0x2e
	.long	0x82
	.uleb128 0x8
	.long	.LASF23
	.byte	0x1
	.byte	0x22
	.long	0x57
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x124
	.uleb128 0x9
	.long	.LASF25
	.byte	0x1
	.byte	0x22
	.long	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF26
	.byte	0x1
	.byte	0x24
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x8
	.long	.LASF24
	.byte	0x1
	.byte	0x30
	.long	0x57
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x162
	.uleb128 0x9
	.long	.LASF25
	.byte	0x1
	.byte	0x30
	.long	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.long	.LASF26
	.byte	0x1
	.byte	0x32
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xb
	.long	.LASF27
	.byte	0x1
	.byte	0x3a
	.long	0x192
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x192
	.uleb128 0x9
	.long	.LASF25
	.byte	0x1
	.byte	0x3a
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF28
	.uleb128 0xc
	.long	.LASF29
	.byte	0x1
	.byte	0x3f
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c5
	.uleb128 0x9
	.long	.LASF25
	.byte	0x1
	.byte	0x3f
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x44
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f1
	.uleb128 0x9
	.long	.LASF25
	.byte	0x1
	.byte	0x44
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xd
	.long	.LASF38
	.byte	0x1
	.byte	0x49
	.long	0x69
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.long	.LASF31
	.byte	0x1
	.byte	0x1c
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	enabledSensors
	.uleb128 0xe
	.long	.LASF32
	.byte	0x1
	.byte	0x18
	.long	0x45
	.uleb128 0x9
	.byte	0x3
	.quad	armingFlags
	.uleb128 0xe
	.long	.LASF33
	.byte	0x1
	.byte	0x1a
	.long	0x57
	.uleb128 0x9
	.byte	0x3
	.quad	flightModeFlags
	.uleb128 0xe
	.long	.LASF34
	.byte	0x1
	.byte	0x19
	.long	0x45
	.uleb128 0x9
	.byte	0x3
	.quad	stateFlags
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
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.long	0x7c
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF20:
	.string	"FAILSAFE_MODE"
.LASF30:
	.string	"sensorsClear"
.LASF32:
	.string	"armingFlags"
.LASF34:
	.string	"stateFlags"
.LASF33:
	.string	"flightModeFlags"
.LASF21:
	.string	"GTUNE_MODE"
.LASF10:
	.string	"ANGLE_MODE"
.LASF23:
	.string	"enableFlightMode"
.LASF29:
	.string	"sensorsSet"
.LASF16:
	.string	"HEADFREE_MODE"
.LASF3:
	.string	"unsigned char"
.LASF9:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF14:
	.string	"GPS_HOME_MODE"
.LASF35:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF37:
	.string	"/home/aravind/git/cleanflight"
.LASF17:
	.string	"UNUSED_MODE"
.LASF12:
	.string	"MAG_MODE"
.LASF24:
	.string	"disableFlightMode"
.LASF8:
	.string	"unsigned int"
.LASF26:
	.string	"oldVal"
.LASF4:
	.string	"uint8_t"
.LASF11:
	.string	"HORIZON_MODE"
.LASF13:
	.string	"BARO_MODE"
.LASF22:
	.string	"flightModeFlags_e"
.LASF31:
	.string	"enabledSensors"
.LASF25:
	.string	"mask"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF18:
	.string	"PASSTHRU_MODE"
.LASF19:
	.string	"SONAR_MODE"
.LASF15:
	.string	"GPS_HOLD_MODE"
.LASF0:
	.string	"signed char"
.LASF36:
	.string	"src/main/fc/runtime_config.c"
.LASF28:
	.string	"_Bool"
.LASF38:
	.string	"sensorsMask"
.LASF27:
	.string	"sensors"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
