	.file	"beeper.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed beeper.i -mtune=generic -march=x86-64 -g
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
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	featureConfig_System,4,4
	.comm	rxConfig_System,26,16
	.comm	armingConfig_System,4,1
	.comm	batteryConfig_System,8,8
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.section	.text.beeper,"ax",@progbits
	.globl	beeper
	.type	beeper, @function
beeper:
.LFB23:
	.file 1 "src/main/io/beeper.c"
	.loc 1 383 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# mode, mode
	.loc 1 383 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	beeper, .-beeper
	.section	.text.beeperSilence,"ax",@progbits
	.globl	beeperSilence
	.type	beeperSilence, @function
beeperSilence:
.LFB24:
	.loc 1 384 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 384 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	beeperSilence, .-beeperSilence
	.section	.text.beeperConfirmationBeeps,"ax",@progbits
	.globl	beeperConfirmationBeeps
	.type	beeperConfirmationBeeps, @function
beeperConfirmationBeeps:
.LFB25:
	.loc 1 385 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# beepCount, tmp87
	movb	%al, -4(%rbp)	# tmp87, beepCount
	.loc 1 385 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	beeperConfirmationBeeps, .-beeperConfirmationBeeps
	.section	.text.beeperUpdate,"ax",@progbits
	.globl	beeperUpdate
	.type	beeperUpdate, @function
beeperUpdate:
.LFB26:
	.loc 1 386 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 386 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	beeperUpdate, .-beeperUpdate
	.section	.text.getArmingBeepTimeMicros,"ax",@progbits
	.globl	getArmingBeepTimeMicros
	.type	getArmingBeepTimeMicros, @function
getArmingBeepTimeMicros:
.LFB27:
	.loc 1 387 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 387 0
	movl	$0, %eax	#, D.4301
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	getArmingBeepTimeMicros, .-getArmingBeepTimeMicros
	.section	.text.beeperModeForTableIndex,"ax",@progbits
	.globl	beeperModeForTableIndex
	.type	beeperModeForTableIndex, @function
beeperModeForTableIndex:
.LFB28:
	.loc 1 388 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# idx, idx
	.loc 1 388 0
	movl	$0, %eax	#, D.4302
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	beeperModeForTableIndex, .-beeperModeForTableIndex
	.section	.text.beeperNameForTableIndex,"ax",@progbits
	.globl	beeperNameForTableIndex
	.type	beeperNameForTableIndex, @function
beeperNameForTableIndex:
.LFB29:
	.loc 1 389 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# idx, idx
	.loc 1 389 0
	movl	$0, %eax	#, D.4303
	.loc 1 389 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	beeperNameForTableIndex, .-beeperNameForTableIndex
	.section	.text.beeperTableEntryCount,"ax",@progbits
	.globl	beeperTableEntryCount
	.type	beeperTableEntryCount, @function
beeperTableEntryCount:
.LFB30:
	.loc 1 390 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 390 0
	movl	$0, %eax	#, D.4304
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	beeperTableEntryCount, .-beeperTableEntryCount
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/config/parameter_group.h"
	.file 4 "./src/main/config/feature.h"
	.file 5 "./src/main/rx/rx.h"
	.file 6 "./src/main/fc/rc_controls.h"
	.file 7 "./src/main/sensors/battery.h"
	.file 8 "./src/main/sensors/sensors.h"
	.file 9 "./src/main/io/beeper.h"
	.file 10 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9e0
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF190
	.byte	0xc
	.long	.LASF191
	.long	.LASF192
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x2
	.byte	0x24
	.long	0x34
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x2
	.byte	0x25
	.long	0x46
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x2
	.long	.LASF5
	.byte	0x2
	.byte	0x30
	.long	0x66
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0x31
	.long	0x78
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.long	.LASF9
	.byte	0x2
	.byte	0x33
	.long	0x8a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.long	.LASF16
	.byte	0x3
	.byte	0x15
	.long	0x6d
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3
	.byte	0x26
	.long	0xcc
	.uleb128 0x6
	.long	0xdc
	.uleb128 0x7
	.long	0x9f
	.uleb128 0x7
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.long	0xfa
	.uleb128 0x9
	.string	"ptr"
	.byte	0x3
	.byte	0x2e
	.long	0x9f
	.uleb128 0x9
	.string	"fn"
	.byte	0x3
	.byte	0x2f
	.long	0xfa
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0xc1
	.uleb128 0xb
	.long	.LASF22
	.byte	0x20
	.byte	0x3
	.byte	0x28
	.long	0x149
	.uleb128 0xc
	.string	"pgn"
	.byte	0x3
	.byte	0x29
	.long	0xb6
	.byte	0
	.uleb128 0xd
	.long	.LASF18
	.byte	0x3
	.byte	0x2a
	.long	0x6d
	.byte	0x2
	.uleb128 0xd
	.long	.LASF19
	.byte	0x3
	.byte	0x2b
	.long	0x149
	.byte	0x8
	.uleb128 0xc
	.string	"ptr"
	.byte	0x3
	.byte	0x2c
	.long	0x14f
	.byte	0x10
	.uleb128 0xd
	.long	.LASF20
	.byte	0x3
	.byte	0x30
	.long	0xdc
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x5b
	.uleb128 0xa
	.byte	0x8
	.long	0x149
	.uleb128 0x2
	.long	.LASF21
	.byte	0x3
	.byte	0x31
	.long	0x100
	.uleb128 0xb
	.long	.LASF23
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.long	0x179
	.uleb128 0xd
	.long	.LASF24
	.byte	0x4
	.byte	0x15
	.long	0x7f
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF25
	.byte	0x4
	.byte	0x16
	.long	0x160
	.uleb128 0xb
	.long	.LASF26
	.byte	0x2
	.byte	0x5
	.byte	0x65
	.long	0x1a9
	.uleb128 0xd
	.long	.LASF27
	.byte	0x5
	.byte	0x66
	.long	0x5b
	.byte	0
	.uleb128 0xd
	.long	.LASF28
	.byte	0x5
	.byte	0x67
	.long	0x5b
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF29
	.byte	0x5
	.byte	0x68
	.long	0x184
	.uleb128 0xb
	.long	.LASF30
	.byte	0x4
	.byte	0x5
	.byte	0x6a
	.long	0x1d9
	.uleb128 0xc
	.string	"min"
	.byte	0x5
	.byte	0x6b
	.long	0x6d
	.byte	0
	.uleb128 0xc
	.string	"max"
	.byte	0x5
	.byte	0x6c
	.long	0x6d
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF31
	.byte	0x5
	.byte	0x6d
	.long	0x1b4
	.uleb128 0xb
	.long	.LASF32
	.byte	0x1a
	.byte	0x5
	.byte	0x6f
	.long	0x28d
	.uleb128 0xd
	.long	.LASF33
	.byte	0x5
	.byte	0x70
	.long	0x28d
	.byte	0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x5
	.byte	0x71
	.long	0x5b
	.byte	0x8
	.uleb128 0xd
	.long	.LASF35
	.byte	0x5
	.byte	0x72
	.long	0x5b
	.byte	0x9
	.uleb128 0xd
	.long	.LASF36
	.byte	0x5
	.byte	0x73
	.long	0x5b
	.byte	0xa
	.uleb128 0xd
	.long	.LASF37
	.byte	0x5
	.byte	0x74
	.long	0x5b
	.byte	0xb
	.uleb128 0xd
	.long	.LASF38
	.byte	0x5
	.byte	0x75
	.long	0x5b
	.byte	0xc
	.uleb128 0xd
	.long	.LASF39
	.byte	0x5
	.byte	0x76
	.long	0x5b
	.byte	0xd
	.uleb128 0xd
	.long	.LASF40
	.byte	0x5
	.byte	0x77
	.long	0x5b
	.byte	0xe
	.uleb128 0xd
	.long	.LASF41
	.byte	0x5
	.byte	0x78
	.long	0x6d
	.byte	0x10
	.uleb128 0xd
	.long	.LASF42
	.byte	0x5
	.byte	0x79
	.long	0x6d
	.byte	0x12
	.uleb128 0xd
	.long	.LASF43
	.byte	0x5
	.byte	0x7a
	.long	0x6d
	.byte	0x14
	.uleb128 0xd
	.long	.LASF44
	.byte	0x5
	.byte	0x7c
	.long	0x6d
	.byte	0x16
	.uleb128 0xd
	.long	.LASF45
	.byte	0x5
	.byte	0x7d
	.long	0x6d
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.long	0x5b
	.long	0x29d
	.uleb128 0xf
	.long	0x98
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF46
	.byte	0x5
	.byte	0x7e
	.long	0x1e4
	.uleb128 0x10
	.byte	0x4
	.long	0x8a
	.byte	0x6
	.byte	0x16
	.long	0x363
	.uleb128 0x11
	.long	.LASF47
	.byte	0
	.uleb128 0x11
	.long	.LASF48
	.byte	0x1
	.uleb128 0x11
	.long	.LASF49
	.byte	0x2
	.uleb128 0x11
	.long	.LASF50
	.byte	0x3
	.uleb128 0x11
	.long	.LASF51
	.byte	0x4
	.uleb128 0x11
	.long	.LASF52
	.byte	0x5
	.uleb128 0x11
	.long	.LASF53
	.byte	0x6
	.uleb128 0x11
	.long	.LASF54
	.byte	0x7
	.uleb128 0x11
	.long	.LASF55
	.byte	0x8
	.uleb128 0x11
	.long	.LASF56
	.byte	0x9
	.uleb128 0x11
	.long	.LASF57
	.byte	0xa
	.uleb128 0x11
	.long	.LASF58
	.byte	0xb
	.uleb128 0x11
	.long	.LASF59
	.byte	0xc
	.uleb128 0x11
	.long	.LASF60
	.byte	0xd
	.uleb128 0x11
	.long	.LASF61
	.byte	0xe
	.uleb128 0x11
	.long	.LASF62
	.byte	0xf
	.uleb128 0x11
	.long	.LASF63
	.byte	0x10
	.uleb128 0x11
	.long	.LASF64
	.byte	0x11
	.uleb128 0x11
	.long	.LASF65
	.byte	0x12
	.uleb128 0x11
	.long	.LASF66
	.byte	0x13
	.uleb128 0x11
	.long	.LASF67
	.byte	0x14
	.uleb128 0x11
	.long	.LASF68
	.byte	0x15
	.uleb128 0x11
	.long	.LASF69
	.byte	0x16
	.uleb128 0x11
	.long	.LASF70
	.byte	0x17
	.uleb128 0x11
	.long	.LASF71
	.byte	0x18
	.uleb128 0x11
	.long	.LASF72
	.byte	0x19
	.uleb128 0x11
	.long	.LASF73
	.byte	0x1a
	.uleb128 0x11
	.long	.LASF74
	.byte	0x1b
	.uleb128 0x11
	.long	.LASF75
	.byte	0x1c
	.byte	0
	.uleb128 0x2
	.long	.LASF76
	.byte	0x6
	.byte	0x35
	.long	0x2a8
	.uleb128 0xb
	.long	.LASF77
	.byte	0x2
	.byte	0x6
	.byte	0x74
	.long	0x393
	.uleb128 0xd
	.long	.LASF78
	.byte	0x6
	.byte	0x75
	.long	0x5b
	.byte	0
	.uleb128 0xd
	.long	.LASF79
	.byte	0x6
	.byte	0x76
	.long	0x5b
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF80
	.byte	0x6
	.byte	0x77
	.long	0x36e
	.uleb128 0xb
	.long	.LASF81
	.byte	0x8
	.byte	0x6
	.byte	0x79
	.long	0x3cf
	.uleb128 0xd
	.long	.LASF82
	.byte	0x6
	.byte	0x7a
	.long	0x363
	.byte	0
	.uleb128 0xd
	.long	.LASF83
	.byte	0x6
	.byte	0x7b
	.long	0x5b
	.byte	0x4
	.uleb128 0xd
	.long	.LASF84
	.byte	0x6
	.byte	0x7c
	.long	0x393
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.long	.LASF85
	.byte	0x6
	.byte	0x7d
	.long	0x39e
	.uleb128 0xb
	.long	.LASF86
	.byte	0xa0
	.byte	0x6
	.byte	0x81
	.long	0x3f3
	.uleb128 0xd
	.long	.LASF87
	.byte	0x6
	.byte	0x82
	.long	0x3f3
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x3cf
	.long	0x403
	.uleb128 0xf
	.long	0x98
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.long	.LASF88
	.byte	0x6
	.byte	0x83
	.long	0x3da
	.uleb128 0xb
	.long	.LASF89
	.byte	0x8
	.byte	0x6
	.byte	0x89
	.long	0x463
	.uleb128 0xd
	.long	.LASF90
	.byte	0x6
	.byte	0x8a
	.long	0x5b
	.byte	0
	.uleb128 0xd
	.long	.LASF91
	.byte	0x6
	.byte	0x8b
	.long	0x5b
	.byte	0x1
	.uleb128 0xd
	.long	.LASF92
	.byte	0x6
	.byte	0x8c
	.long	0x5b
	.byte	0x2
	.uleb128 0xd
	.long	.LASF93
	.byte	0x6
	.byte	0x8d
	.long	0x5b
	.byte	0x3
	.uleb128 0xd
	.long	.LASF94
	.byte	0x6
	.byte	0x8e
	.long	0x29
	.byte	0x4
	.uleb128 0xd
	.long	.LASF95
	.byte	0x6
	.byte	0x8f
	.long	0x6d
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF96
	.byte	0x6
	.byte	0x90
	.long	0x40e
	.uleb128 0xb
	.long	.LASF97
	.byte	0x4
	.byte	0x6
	.byte	0x94
	.long	0x4ab
	.uleb128 0xd
	.long	.LASF98
	.byte	0x6
	.byte	0x96
	.long	0x5b
	.byte	0
	.uleb128 0xd
	.long	.LASF99
	.byte	0x6
	.byte	0x97
	.long	0x5b
	.byte	0x1
	.uleb128 0xd
	.long	.LASF100
	.byte	0x6
	.byte	0x98
	.long	0x5b
	.byte	0x2
	.uleb128 0xd
	.long	.LASF101
	.byte	0x6
	.byte	0x99
	.long	0x5b
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF102
	.byte	0x6
	.byte	0x9a
	.long	0x46e
	.uleb128 0xa
	.byte	0x8
	.long	0x4bc
	.uleb128 0x12
	.long	0xa1
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF103
	.uleb128 0xb
	.long	.LASF104
	.byte	0x8
	.byte	0x7
	.byte	0x14
	.long	0x511
	.uleb128 0xd
	.long	.LASF105
	.byte	0x7
	.byte	0x15
	.long	0x5b
	.byte	0
	.uleb128 0xd
	.long	.LASF106
	.byte	0x7
	.byte	0x16
	.long	0x5b
	.byte	0x1
	.uleb128 0xd
	.long	.LASF107
	.byte	0x7
	.byte	0x17
	.long	0x5b
	.byte	0x2
	.uleb128 0xd
	.long	.LASF108
	.byte	0x7
	.byte	0x18
	.long	0x6d
	.byte	0x4
	.uleb128 0xd
	.long	.LASF109
	.byte	0x7
	.byte	0x19
	.long	0x5b
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF110
	.byte	0x7
	.byte	0x1a
	.long	0x4c8
	.uleb128 0x10
	.byte	0x4
	.long	0x8a
	.byte	0x8
	.byte	0x15
	.long	0x541
	.uleb128 0x11
	.long	.LASF111
	.byte	0
	.uleb128 0x11
	.long	.LASF112
	.byte	0x1
	.uleb128 0x11
	.long	.LASF113
	.byte	0x2
	.uleb128 0x11
	.long	.LASF114
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF115
	.byte	0x6
	.byte	0x8
	.byte	0x20
	.long	0x572
	.uleb128 0xd
	.long	.LASF116
	.byte	0x8
	.byte	0x21
	.long	0x3b
	.byte	0
	.uleb128 0xd
	.long	.LASF117
	.byte	0x8
	.byte	0x22
	.long	0x3b
	.byte	0x2
	.uleb128 0xc
	.string	"yaw"
	.byte	0x8
	.byte	0x23
	.long	0x3b
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF118
	.byte	0x8
	.byte	0x24
	.long	0x541
	.uleb128 0x13
	.long	.LASF193
	.byte	0x6
	.byte	0x8
	.byte	0x26
	.long	0x5a0
	.uleb128 0x9
	.string	"raw"
	.byte	0x8
	.byte	0x27
	.long	0x5a0
	.uleb128 0x14
	.long	.LASF119
	.byte	0x8
	.byte	0x28
	.long	0x572
	.byte	0
	.uleb128 0xe
	.long	0x3b
	.long	0x5b0
	.uleb128 0xf
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF120
	.byte	0x8
	.byte	0x29
	.long	0x57d
	.uleb128 0x10
	.byte	0x4
	.long	0x8a
	.byte	0x8
	.byte	0x39
	.long	0x5fe
	.uleb128 0x11
	.long	.LASF121
	.byte	0
	.uleb128 0x11
	.long	.LASF122
	.byte	0x1
	.uleb128 0x11
	.long	.LASF123
	.byte	0x2
	.uleb128 0x11
	.long	.LASF124
	.byte	0x3
	.uleb128 0x11
	.long	.LASF125
	.byte	0x4
	.uleb128 0x11
	.long	.LASF126
	.byte	0x5
	.uleb128 0x11
	.long	.LASF127
	.byte	0x6
	.uleb128 0x11
	.long	.LASF128
	.byte	0x7
	.uleb128 0x11
	.long	.LASF129
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF130
	.byte	0x8
	.byte	0x43
	.long	0x5bb
	.uleb128 0xb
	.long	.LASF131
	.byte	0xc
	.byte	0x8
	.byte	0x45
	.long	0x63a
	.uleb128 0xd
	.long	.LASF132
	.byte	0x8
	.byte	0x46
	.long	0x5fe
	.byte	0
	.uleb128 0xd
	.long	.LASF133
	.byte	0x8
	.byte	0x47
	.long	0x5fe
	.byte	0x4
	.uleb128 0xd
	.long	.LASF134
	.byte	0x8
	.byte	0x48
	.long	0x5fe
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF135
	.byte	0x8
	.byte	0x49
	.long	0x609
	.uleb128 0xb
	.long	.LASF136
	.byte	0x3
	.byte	0x8
	.byte	0x4b
	.long	0x676
	.uleb128 0xd
	.long	.LASF137
	.byte	0x8
	.byte	0x4c
	.long	0x5b
	.byte	0
	.uleb128 0xd
	.long	.LASF138
	.byte	0x8
	.byte	0x4d
	.long	0x5b
	.byte	0x1
	.uleb128 0xd
	.long	.LASF139
	.byte	0x8
	.byte	0x4e
	.long	0x5b
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF140
	.byte	0x8
	.byte	0x4f
	.long	0x645
	.uleb128 0xb
	.long	.LASF141
	.byte	0xc
	.byte	0x8
	.byte	0x51
	.long	0x6a6
	.uleb128 0xd
	.long	.LASF142
	.byte	0x8
	.byte	0x52
	.long	0x5b0
	.byte	0
	.uleb128 0xd
	.long	.LASF143
	.byte	0x8
	.byte	0x53
	.long	0x5b0
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF144
	.byte	0x8
	.byte	0x54
	.long	0x681
	.uleb128 0x10
	.byte	0x4
	.long	0x8a
	.byte	0x9
	.byte	0x14
	.long	0x724
	.uleb128 0x11
	.long	.LASF145
	.byte	0
	.uleb128 0x11
	.long	.LASF146
	.byte	0x1
	.uleb128 0x11
	.long	.LASF147
	.byte	0x2
	.uleb128 0x11
	.long	.LASF148
	.byte	0x3
	.uleb128 0x11
	.long	.LASF149
	.byte	0x4
	.uleb128 0x11
	.long	.LASF150
	.byte	0x5
	.uleb128 0x11
	.long	.LASF151
	.byte	0x6
	.uleb128 0x11
	.long	.LASF152
	.byte	0x7
	.uleb128 0x11
	.long	.LASF153
	.byte	0x8
	.uleb128 0x11
	.long	.LASF154
	.byte	0x9
	.uleb128 0x11
	.long	.LASF155
	.byte	0xa
	.uleb128 0x11
	.long	.LASF156
	.byte	0xb
	.uleb128 0x11
	.long	.LASF157
	.byte	0xc
	.uleb128 0x11
	.long	.LASF158
	.byte	0xd
	.uleb128 0x11
	.long	.LASF159
	.byte	0xe
	.uleb128 0x11
	.long	.LASF160
	.byte	0xf
	.uleb128 0x11
	.long	.LASF161
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.long	.LASF162
	.byte	0x9
	.byte	0x28
	.long	0x6b1
	.uleb128 0x15
	.long	.LASF163
	.byte	0x1
	.value	0x17f
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x75d
	.uleb128 0x16
	.long	.LASF27
	.byte	0x1
	.value	0x17f
	.long	0x724
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.long	.LASF166
	.byte	0x1
	.value	0x180
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF164
	.byte	0x1
	.value	0x181
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x7a5
	.uleb128 0x16
	.long	.LASF165
	.byte	0x1
	.value	0x181
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.long	.LASF167
	.byte	0x1
	.value	0x182
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF170
	.byte	0x1
	.value	0x183
	.long	0x7f
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.long	.LASF168
	.byte	0x1
	.value	0x184
	.long	0x724
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x80f
	.uleb128 0x1a
	.string	"idx"
	.byte	0x1
	.value	0x184
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.long	.LASF169
	.byte	0x1
	.value	0x185
	.long	0x4b6
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x841
	.uleb128 0x1a
	.string	"idx"
	.byte	0x1
	.value	0x185
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.long	.LASF171
	.byte	0x1
	.value	0x186
	.long	0x4d
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.long	.LASF172
	.byte	0xa
	.byte	0xc8
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x1b
	.long	.LASF173
	.byte	0xa
	.byte	0xc9
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x1b
	.long	.LASF174
	.byte	0xa
	.byte	0xca
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x1b
	.long	.LASF175
	.byte	0x3
	.byte	0x43
	.long	0x8b3
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xa
	.byte	0x8
	.long	0x155
	.uleb128 0x1b
	.long	.LASF176
	.byte	0x3
	.byte	0x44
	.long	0x8b3
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x1b
	.long	.LASF177
	.byte	0x3
	.byte	0x47
	.long	0x149
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x1b
	.long	.LASF178
	.byte	0x3
	.byte	0x48
	.long	0x149
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x1b
	.long	.LASF179
	.byte	0x4
	.byte	0x18
	.long	0x179
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x1b
	.long	.LASF180
	.byte	0x5
	.byte	0x80
	.long	0x29d
	.uleb128 0x9
	.byte	0x3
	.quad	rxConfig_System
	.uleb128 0xe
	.long	0x1a9
	.long	0x932
	.uleb128 0xf
	.long	0x98
	.byte	0x11
	.byte	0
	.uleb128 0x1c
	.long	.LASF181
	.byte	0x5
	.byte	0x82
	.long	0x922
	.uleb128 0xe
	.long	0x1d9
	.long	0x94d
	.uleb128 0xf
	.long	0x98
	.byte	0x3
	.byte	0
	.uleb128 0x1c
	.long	.LASF182
	.byte	0x5
	.byte	0x83
	.long	0x93d
	.uleb128 0x1c
	.long	.LASF183
	.byte	0x6
	.byte	0x85
	.long	0x963
	.uleb128 0xa
	.byte	0x8
	.long	0x403
	.uleb128 0x1c
	.long	.LASF184
	.byte	0x6
	.byte	0x92
	.long	0x974
	.uleb128 0xa
	.byte	0x8
	.long	0x463
	.uleb128 0x1b
	.long	.LASF185
	.byte	0x6
	.byte	0x9c
	.long	0x4ab
	.uleb128 0x9
	.byte	0x3
	.quad	armingConfig_System
	.uleb128 0x1b
	.long	.LASF186
	.byte	0x7
	.byte	0x1c
	.long	0x511
	.uleb128 0x9
	.byte	0x3
	.quad	batteryConfig_System
	.uleb128 0x1b
	.long	.LASF187
	.byte	0x8
	.byte	0x56
	.long	0x676
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x1b
	.long	.LASF188
	.byte	0x8
	.byte	0x57
	.long	0x63a
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x1b
	.long	.LASF189
	.byte	0x8
	.byte	0x58
	.long	0x6a6
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
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
	.uleb128 0x3
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
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x17
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
	.uleb128 0x14
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x9c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB23
	.quad	.LFE23
	.quad	.LFB24
	.quad	.LFE24
	.quad	.LFB25
	.quad	.LFE25
	.quad	.LFB26
	.quad	.LFE26
	.quad	.LFB27
	.quad	.LFE27
	.quad	.LFB28
	.quad	.LFE28
	.quad	.LFB29
	.quad	.LFE29
	.quad	.LFB30
	.quad	.LFE30
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF152:
	.string	"BEEPER_BAT_CRIT_LOW"
.LASF125:
	.string	"CW270_DEG"
.LASF128:
	.string	"CW180_DEG_FLIP"
.LASF57:
	.string	"BOXGPSHOLD"
.LASF55:
	.string	"BOXCAMTRIG"
.LASF115:
	.string	"int16_flightDynamicsTrims_s"
.LASF78:
	.string	"startStep"
.LASF163:
	.string	"beeper"
.LASF17:
	.string	"pgResetFunc"
.LASF66:
	.string	"BOXTELEMETRY"
.LASF113:
	.string	"SENSOR_INDEX_BARO"
.LASF154:
	.string	"BEEPER_GPS_STATUS"
.LASF144:
	.string	"sensorTrims_t"
.LASF29:
	.string	"rxFailsafeChannelConfig_t"
.LASF15:
	.string	"long long unsigned int"
.LASF127:
	.string	"CW90_DEG_FLIP"
.LASF121:
	.string	"ALIGN_DEFAULT"
.LASF75:
	.string	"CHECKBOX_ITEM_COUNT"
.LASF81:
	.string	"modeActivationCondition_s"
.LASF85:
	.string	"modeActivationCondition_t"
.LASF89:
	.string	"rcControlsConfig_s"
.LASF96:
	.string	"rcControlsConfig_t"
.LASF118:
	.string	"flightDynamicsTrims_def_t"
.LASF173:
	.string	"U_ID_1"
.LASF174:
	.string	"U_ID_2"
.LASF54:
	.string	"BOXCAMSTAB"
.LASF147:
	.string	"BEEPER_RX_LOST_LANDING"
.LASF1:
	.string	"int16_t"
.LASF48:
	.string	"BOXANGLE"
.LASF14:
	.string	"long long int"
.LASF2:
	.string	"signed char"
.LASF111:
	.string	"SENSOR_INDEX_GYRO"
.LASF72:
	.string	"BOXBLACKBOX"
.LASF64:
	.string	"BOXGOV"
.LASF76:
	.string	"boxId_e"
.LASF145:
	.string	"BEEPER_SILENCE"
.LASF4:
	.string	"long int"
.LASF26:
	.string	"rxFailsafeChannelConfiguration_s"
.LASF23:
	.string	"featureConfig_s"
.LASF25:
	.string	"featureConfig_t"
.LASF51:
	.string	"BOXMAG"
.LASF65:
	.string	"BOXOSD"
.LASF123:
	.string	"CW90_DEG"
.LASF30:
	.string	"rxChannelRangeConfiguration_s"
.LASF31:
	.string	"rxChannelRangeConfiguration_t"
.LASF7:
	.string	"uint16_t"
.LASF120:
	.string	"flightDynamicsTrims_t"
.LASF193:
	.string	"flightDynamicsTrims_u"
.LASF149:
	.string	"BEEPER_DISARMING"
.LASF107:
	.string	"vbatwarningcellvoltage"
.LASF98:
	.string	"retarded_arm"
.LASF142:
	.string	"accZero"
.LASF183:
	.string	"modeActivationProfile_ProfileCurrent"
.LASF20:
	.string	"reset"
.LASF59:
	.string	"BOXBEEPERON"
.LASF148:
	.string	"BEEPER_RX_LOST"
.LASF137:
	.string	"acc_hardware"
.LASF187:
	.string	"sensorSelectionConfig_System"
.LASF108:
	.string	"batteryCapacity"
.LASF141:
	.string	"sensorTrims_s"
.LASF10:
	.string	"unsigned int"
.LASF93:
	.string	"alt_hold_fast_change"
.LASF181:
	.string	"failsafeChannelConfigs_SystemArray"
.LASF90:
	.string	"deadband"
.LASF133:
	.string	"acc_align"
.LASF190:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF16:
	.string	"pgn_t"
.LASF34:
	.string	"serialrx_provider"
.LASF11:
	.string	"long unsigned int"
.LASF68:
	.string	"BOXSONAR"
.LASF150:
	.string	"BEEPER_ARMING"
.LASF95:
	.string	"deadband3d_throttle"
.LASF106:
	.string	"vbatmincellvoltage"
.LASF110:
	.string	"batteryConfig_t"
.LASF165:
	.string	"beepCount"
.LASF101:
	.string	"max_arm_angle"
.LASF18:
	.string	"size"
.LASF8:
	.string	"short unsigned int"
.LASF119:
	.string	"values"
.LASF91:
	.string	"yaw_deadband"
.LASF50:
	.string	"BOXBARO"
.LASF156:
	.string	"BEEPER_DISARM_REPEAT"
.LASF171:
	.string	"beeperTableEntryCount"
.LASF53:
	.string	"BOXHEADADJ"
.LASF185:
	.string	"armingConfig_System"
.LASF114:
	.string	"SENSOR_INDEX_MAG"
.LASF139:
	.string	"baro_hardware"
.LASF177:
	.string	"__pg_resetdata_start"
.LASF176:
	.string	"__pg_registry_end"
.LASF52:
	.string	"BOXHEADFREE"
.LASF100:
	.string	"auto_disarm_delay"
.LASF73:
	.string	"BOXFAILSAFE"
.LASF12:
	.string	"sizetype"
.LASF41:
	.string	"midrc"
.LASF19:
	.string	"address"
.LASF191:
	.string	"src/main/io/beeper.c"
.LASF62:
	.string	"BOXLLIGHTS"
.LASF63:
	.string	"BOXCALIB"
.LASF105:
	.string	"vbatmaxcellvoltage"
.LASF159:
	.string	"BEEPER_READY_BEEP"
.LASF58:
	.string	"BOXPASSTHRU"
.LASF166:
	.string	"beeperSilence"
.LASF117:
	.string	"pitch"
.LASF87:
	.string	"modeActivationConditions"
.LASF97:
	.string	"armingConfig_s"
.LASF102:
	.string	"armingConfig_t"
.LASF178:
	.string	"__pg_resetdata_end"
.LASF175:
	.string	"__pg_registry_start"
.LASF92:
	.string	"alt_hold_deadband"
.LASF38:
	.string	"rssi_scale"
.LASF116:
	.string	"roll"
.LASF172:
	.string	"U_ID_0"
.LASF43:
	.string	"maxcheck"
.LASF192:
	.string	"/home/aravind/git/cleanflight"
.LASF36:
	.string	"spektrum_sat_bind"
.LASF136:
	.string	"sensorSelectionConfig_s"
.LASF138:
	.string	"mag_hardware"
.LASF184:
	.string	"rcControlsConfig_ProfileCurrent"
.LASF124:
	.string	"CW180_DEG"
.LASF42:
	.string	"mincheck"
.LASF37:
	.string	"rssi_channel"
.LASF169:
	.string	"beeperNameForTableIndex"
.LASF47:
	.string	"BOXARM"
.LASF103:
	.string	"_Bool"
.LASF6:
	.string	"unsigned char"
.LASF49:
	.string	"BOXHORIZON"
.LASF24:
	.string	"enabledFeatures"
.LASF104:
	.string	"batteryConfig_s"
.LASF28:
	.string	"step"
.LASF151:
	.string	"BEEPER_ARMING_GPS_FIX"
.LASF3:
	.string	"short int"
.LASF94:
	.string	"yaw_control_direction"
.LASF126:
	.string	"CW0_DEG_FLIP"
.LASF168:
	.string	"beeperModeForTableIndex"
.LASF182:
	.string	"channelRanges_SystemArray"
.LASF56:
	.string	"BOXGPSHOME"
.LASF153:
	.string	"BEEPER_BAT_LOW"
.LASF143:
	.string	"magZero"
.LASF167:
	.string	"beeperUpdate"
.LASF162:
	.string	"beeperMode_e"
.LASF77:
	.string	"channelRange_s"
.LASF80:
	.string	"channelRange_t"
.LASF180:
	.string	"rxConfig_System"
.LASF186:
	.string	"batteryConfig_System"
.LASF99:
	.string	"disarm_kill_switch"
.LASF22:
	.string	"pgRegistry_s"
.LASF21:
	.string	"pgRegistry_t"
.LASF40:
	.string	"rcSmoothing"
.LASF13:
	.string	"char"
.LASF130:
	.string	"sensor_align_e"
.LASF27:
	.string	"mode"
.LASF155:
	.string	"BEEPER_RX_SET"
.LASF158:
	.string	"BEEPER_ACC_CALIBRATION_FAIL"
.LASF160:
	.string	"BEEPER_MULTI_BEEPS"
.LASF33:
	.string	"rcmap"
.LASF189:
	.string	"sensorTrims_System"
.LASF74:
	.string	"BOXAIRMODE"
.LASF134:
	.string	"mag_align"
.LASF161:
	.string	"BEEPER_ARMED"
.LASF109:
	.string	"amperageMeterSource"
.LASF32:
	.string	"rxConfig_s"
.LASF86:
	.string	"modeActivationProfile_s"
.LASF88:
	.string	"modeActivationProfile_t"
.LASF131:
	.string	"sensorAlignmentConfig_s"
.LASF135:
	.string	"sensorAlignmentConfig_t"
.LASF146:
	.string	"BEEPER_GYRO_CALIBRATED"
.LASF0:
	.string	"int8_t"
.LASF71:
	.string	"BOXSERVO3"
.LASF170:
	.string	"getArmingBeepTimeMicros"
.LASF79:
	.string	"endStep"
.LASF9:
	.string	"uint32_t"
.LASF46:
	.string	"rxConfig_t"
.LASF60:
	.string	"BOXLEDMAX"
.LASF112:
	.string	"SENSOR_INDEX_ACC"
.LASF44:
	.string	"rx_min_usec"
.LASF132:
	.string	"gyro_align"
.LASF45:
	.string	"rx_max_usec"
.LASF61:
	.string	"BOXLEDLOW"
.LASF5:
	.string	"uint8_t"
.LASF83:
	.string	"auxChannelIndex"
.LASF188:
	.string	"sensorAlignmentConfig_System"
.LASF157:
	.string	"BEEPER_ACC_CALIBRATION"
.LASF69:
	.string	"BOXSERVO1"
.LASF70:
	.string	"BOXSERVO2"
.LASF129:
	.string	"CW270_DEG_FLIP"
.LASF164:
	.string	"beeperConfirmationBeeps"
.LASF140:
	.string	"sensorSelectionConfig_t"
.LASF84:
	.string	"range"
.LASF35:
	.string	"sbus_inversion"
.LASF82:
	.string	"modeId"
.LASF122:
	.string	"CW0_DEG"
.LASF39:
	.string	"rssi_ppm_invert"
.LASF179:
	.string	"featureConfig_System"
.LASF67:
	.string	"BOXGTUNE"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
