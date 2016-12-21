	.file	"boot.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed boot.i -mtune=generic -march=x86-64 -g
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
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	featureConfig_System,4,4
	.comm	serialConfig_System,28,16
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.section	.text.configureScheduler,"ax",@progbits
	.globl	configureScheduler
	.type	configureScheduler, @function
configureScheduler:
.LFB15:
	.file 1 "src/main/fc/boot.c"
	.loc 1 764 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 765 0
	call	schedulerInit	#
	.loc 1 766 0
	movl	$1, %esi	#,
	movl	$0, %edi	#,
	call	setTaskEnabled	#
	.loc 1 767 0
	movl	$1, %esi	#,
	movl	$1, %edi	#,
	call	setTaskEnabled	#
	.loc 1 812 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	configureScheduler, .-configureScheduler
	.section	.text.init,"ax",@progbits
	.globl	init
	.type	init, @function
init:
.LFB16:
	.loc 1 815 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 816 0
	call	systemInit	#
	.loc 1 817 0
	call	configureScheduler	#
	.loc 1 818 0
	movl	$1, %edi	#,
	call	serialInit	#
	.loc 1 819 0
	call	mspInit	#
	.loc 1 820 0
	call	mspSerialInit	#
	.loc 1 826 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	init, .-init
	.section	.rodata
.LC0:
	.string	"Welcome to Cleanflight"
.LC1:
	.string	"init done"
	.section	.text.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB17:
	.loc 1 828 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 829 0
	movl	$.LC0, %edi	#,
	call	puts	#
	.loc 1 831 0
	call	init	#
	.loc 1 833 0
	movl	$.LC1, %edi	#,
	call	puts	#
.L4:
	.loc 1 837 0 discriminator 1
	call	scheduler	#
	.loc 1 838 0 discriminator 1
	jmp	.L4	#
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/config/parameter_group.h"
	.file 4 "./src/main/config/feature.h"
	.file 5 "./src/main/fc/fc_tasks.h"
	.file 6 "./src/main/io/io_serial.h"
	.file 7 "./src/main/sensors/sensors.h"
	.file 8 "./src/main/target/edison/target.h"
	.file 9 "./src/main/drivers/serial_uart.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5a3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF104
	.byte	0xc
	.long	.LASF105
	.long	.LASF106
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x25
	.long	0x3b
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
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
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x31
	.long	0x6d
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0x33
	.long	0x7f
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF13
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF14
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF15
	.uleb128 0x6
	.byte	0x4
	.long	0x7f
	.byte	0x5
	.byte	0x17
	.long	0xf5
	.uleb128 0x7
	.long	.LASF16
	.byte	0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x1
	.uleb128 0x7
	.long	.LASF18
	.byte	0x2
	.uleb128 0x7
	.long	.LASF19
	.byte	0x3
	.uleb128 0x7
	.long	.LASF20
	.byte	0x4
	.uleb128 0x7
	.long	.LASF21
	.byte	0x5
	.uleb128 0x7
	.long	.LASF22
	.byte	0x6
	.uleb128 0x7
	.long	.LASF23
	.byte	0x7
	.uleb128 0x7
	.long	.LASF24
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x50
	.uleb128 0x3
	.long	.LASF25
	.byte	0x3
	.byte	0x15
	.long	0x62
	.uleb128 0x3
	.long	.LASF26
	.byte	0x3
	.byte	0x26
	.long	0x111
	.uleb128 0x9
	.long	0x121
	.uleb128 0xa
	.long	0x94
	.uleb128 0xa
	.long	0x42
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.long	0x13f
	.uleb128 0xc
	.string	"ptr"
	.byte	0x3
	.byte	0x2e
	.long	0x94
	.uleb128 0xc
	.string	"fn"
	.byte	0x3
	.byte	0x2f
	.long	0x13f
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x106
	.uleb128 0xd
	.long	.LASF31
	.byte	0x20
	.byte	0x3
	.byte	0x28
	.long	0x18e
	.uleb128 0xe
	.string	"pgn"
	.byte	0x3
	.byte	0x29
	.long	0xfb
	.byte	0
	.uleb128 0xf
	.long	.LASF27
	.byte	0x3
	.byte	0x2a
	.long	0x62
	.byte	0x2
	.uleb128 0xf
	.long	.LASF28
	.byte	0x3
	.byte	0x2b
	.long	0xf5
	.byte	0x8
	.uleb128 0xe
	.string	"ptr"
	.byte	0x3
	.byte	0x2c
	.long	0x18e
	.byte	0x10
	.uleb128 0xf
	.long	.LASF29
	.byte	0x3
	.byte	0x30
	.long	0x121
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xf5
	.uleb128 0x3
	.long	.LASF30
	.byte	0x3
	.byte	0x31
	.long	0x145
	.uleb128 0xd
	.long	.LASF32
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.long	0x1b8
	.uleb128 0xf
	.long	.LASF33
	.byte	0x4
	.byte	0x15
	.long	0x74
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF34
	.byte	0x4
	.byte	0x16
	.long	0x19f
	.uleb128 0x6
	.byte	0x4
	.long	0x42
	.byte	0x6
	.byte	0x36
	.long	0x20c
	.uleb128 0x10
	.long	.LASF35
	.sleb128 -1
	.uleb128 0x7
	.long	.LASF36
	.byte	0
	.uleb128 0x7
	.long	.LASF37
	.byte	0x1
	.uleb128 0x7
	.long	.LASF38
	.byte	0x2
	.uleb128 0x7
	.long	.LASF39
	.byte	0x3
	.uleb128 0x7
	.long	.LASF40
	.byte	0x4
	.uleb128 0x7
	.long	.LASF41
	.byte	0x14
	.uleb128 0x7
	.long	.LASF42
	.byte	0x1e
	.uleb128 0x7
	.long	.LASF43
	.byte	0x1f
	.uleb128 0x7
	.long	.LASF44
	.byte	0x1f
	.byte	0
	.uleb128 0x3
	.long	.LASF45
	.byte	0x6
	.byte	0x41
	.long	0x1c3
	.uleb128 0xd
	.long	.LASF46
	.byte	0xc
	.byte	0x6
	.byte	0x5a
	.long	0x248
	.uleb128 0xf
	.long	.LASF47
	.byte	0x6
	.byte	0x5b
	.long	0x20c
	.byte	0
	.uleb128 0xf
	.long	.LASF48
	.byte	0x6
	.byte	0x5c
	.long	0x62
	.byte	0x4
	.uleb128 0xf
	.long	.LASF49
	.byte	0x6
	.byte	0x5d
	.long	0x248
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.long	0x50
	.long	0x258
	.uleb128 0x12
	.long	0x8d
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF50
	.byte	0x6
	.byte	0x5e
	.long	0x217
	.uleb128 0xd
	.long	.LASF51
	.byte	0x1c
	.byte	0x6
	.byte	0x60
	.long	0x288
	.uleb128 0xf
	.long	.LASF52
	.byte	0x6
	.byte	0x61
	.long	0x50
	.byte	0
	.uleb128 0xf
	.long	.LASF53
	.byte	0x6
	.byte	0x62
	.long	0x288
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.long	0x258
	.long	0x298
	.uleb128 0x12
	.long	0x8d
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF54
	.byte	0x6
	.byte	0x63
	.long	0x263
	.uleb128 0x6
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x15
	.long	0x2c8
	.uleb128 0x7
	.long	.LASF55
	.byte	0
	.uleb128 0x7
	.long	.LASF56
	.byte	0x1
	.uleb128 0x7
	.long	.LASF57
	.byte	0x2
	.uleb128 0x7
	.long	.LASF58
	.byte	0x3
	.byte	0
	.uleb128 0xd
	.long	.LASF59
	.byte	0x6
	.byte	0x7
	.byte	0x20
	.long	0x2f9
	.uleb128 0xf
	.long	.LASF60
	.byte	0x7
	.byte	0x21
	.long	0x30
	.byte	0
	.uleb128 0xf
	.long	.LASF61
	.byte	0x7
	.byte	0x22
	.long	0x30
	.byte	0x2
	.uleb128 0xe
	.string	"yaw"
	.byte	0x7
	.byte	0x23
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF62
	.byte	0x7
	.byte	0x24
	.long	0x2c8
	.uleb128 0x13
	.long	.LASF107
	.byte	0x6
	.byte	0x7
	.byte	0x26
	.long	0x327
	.uleb128 0xc
	.string	"raw"
	.byte	0x7
	.byte	0x27
	.long	0x327
	.uleb128 0x14
	.long	.LASF63
	.byte	0x7
	.byte	0x28
	.long	0x2f9
	.byte	0
	.uleb128 0x11
	.long	0x30
	.long	0x337
	.uleb128 0x12
	.long	0x8d
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF64
	.byte	0x7
	.byte	0x29
	.long	0x304
	.uleb128 0x6
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x39
	.long	0x385
	.uleb128 0x7
	.long	.LASF65
	.byte	0
	.uleb128 0x7
	.long	.LASF66
	.byte	0x1
	.uleb128 0x7
	.long	.LASF67
	.byte	0x2
	.uleb128 0x7
	.long	.LASF68
	.byte	0x3
	.uleb128 0x7
	.long	.LASF69
	.byte	0x4
	.uleb128 0x7
	.long	.LASF70
	.byte	0x5
	.uleb128 0x7
	.long	.LASF71
	.byte	0x6
	.uleb128 0x7
	.long	.LASF72
	.byte	0x7
	.uleb128 0x7
	.long	.LASF73
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF74
	.byte	0x7
	.byte	0x43
	.long	0x342
	.uleb128 0xd
	.long	.LASF75
	.byte	0xc
	.byte	0x7
	.byte	0x45
	.long	0x3c1
	.uleb128 0xf
	.long	.LASF76
	.byte	0x7
	.byte	0x46
	.long	0x385
	.byte	0
	.uleb128 0xf
	.long	.LASF77
	.byte	0x7
	.byte	0x47
	.long	0x385
	.byte	0x4
	.uleb128 0xf
	.long	.LASF78
	.byte	0x7
	.byte	0x48
	.long	0x385
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF79
	.byte	0x7
	.byte	0x49
	.long	0x390
	.uleb128 0xd
	.long	.LASF80
	.byte	0x3
	.byte	0x7
	.byte	0x4b
	.long	0x3fd
	.uleb128 0xf
	.long	.LASF81
	.byte	0x7
	.byte	0x4c
	.long	0x50
	.byte	0
	.uleb128 0xf
	.long	.LASF82
	.byte	0x7
	.byte	0x4d
	.long	0x50
	.byte	0x1
	.uleb128 0xf
	.long	.LASF83
	.byte	0x7
	.byte	0x4e
	.long	0x50
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF84
	.byte	0x7
	.byte	0x4f
	.long	0x3cc
	.uleb128 0xd
	.long	.LASF85
	.byte	0xc
	.byte	0x7
	.byte	0x51
	.long	0x42d
	.uleb128 0xf
	.long	.LASF86
	.byte	0x7
	.byte	0x52
	.long	0x337
	.byte	0
	.uleb128 0xf
	.long	.LASF87
	.byte	0x7
	.byte	0x53
	.long	0x337
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF88
	.byte	0x7
	.byte	0x54
	.long	0x408
	.uleb128 0x15
	.long	.LASF89
	.byte	0x1
	.value	0x2fb
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF90
	.byte	0x1
	.value	0x32e
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.long	.LASF108
	.byte	0x1
	.value	0x33b
	.long	0x42
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	.LASF91
	.byte	0x8
	.byte	0xc8
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x17
	.long	.LASF92
	.byte	0x8
	.byte	0xc9
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x17
	.long	.LASF93
	.byte	0x8
	.byte	0xca
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x17
	.long	.LASF94
	.byte	0x9
	.byte	0x2e
	.long	0x4de
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0x18
	.long	0x74
	.uleb128 0x17
	.long	.LASF95
	.byte	0x3
	.byte	0x43
	.long	0x4f8
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x8
	.byte	0x8
	.long	0x194
	.uleb128 0x17
	.long	.LASF96
	.byte	0x3
	.byte	0x44
	.long	0x4f8
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x17
	.long	.LASF97
	.byte	0x3
	.byte	0x47
	.long	0xf5
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x17
	.long	.LASF98
	.byte	0x3
	.byte	0x48
	.long	0xf5
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x17
	.long	.LASF99
	.byte	0x4
	.byte	0x18
	.long	0x1b8
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x17
	.long	.LASF100
	.byte	0x6
	.byte	0x65
	.long	0x298
	.uleb128 0x9
	.byte	0x3
	.quad	serialConfig_System
	.uleb128 0x17
	.long	.LASF101
	.byte	0x7
	.byte	0x56
	.long	0x3fd
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x17
	.long	.LASF102
	.byte	0x7
	.byte	0x57
	.long	0x3c1
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x17
	.long	.LASF103
	.byte	0x7
	.byte	0x58
	.long	0x42d
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB15
	.quad	.LFE15
	.quad	.LFB16
	.quad	.LFE16
	.quad	.LFB17
	.quad	.LFE17
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF57:
	.string	"SENSOR_INDEX_BARO"
.LASF52:
	.string	"reboot_character"
.LASF64:
	.string	"flightDynamicsTrims_t"
.LASF107:
	.string	"flightDynamicsTrims_u"
.LASF46:
	.string	"serialPortConfig_s"
.LASF50:
	.string	"serialPortConfig_t"
.LASF66:
	.string	"CW0_DEG"
.LASF36:
	.string	"SERIAL_PORT_UART1"
.LASF37:
	.string	"SERIAL_PORT_UART2"
.LASF18:
	.string	"TASK_COMPASS"
.LASF1:
	.string	"short int"
.LASF25:
	.string	"pgn_t"
.LASF11:
	.string	"sizetype"
.LASF103:
	.string	"sensorTrims_System"
.LASF87:
	.string	"magZero"
.LASF65:
	.string	"ALIGN_DEFAULT"
.LASF60:
	.string	"roll"
.LASF108:
	.string	"main"
.LASF92:
	.string	"U_ID_1"
.LASF49:
	.string	"baudRates"
.LASF75:
	.string	"sensorAlignmentConfig_s"
.LASF79:
	.string	"sensorAlignmentConfig_t"
.LASF35:
	.string	"SERIAL_PORT_NONE"
.LASF86:
	.string	"accZero"
.LASF102:
	.string	"sensorAlignmentConfig_System"
.LASF21:
	.string	"TASK_GYROPID"
.LASF4:
	.string	"uint8_t"
.LASF51:
	.string	"serialConfig_s"
.LASF54:
	.string	"serialConfig_t"
.LASF67:
	.string	"CW90_DEG"
.LASF47:
	.string	"identifier"
.LASF99:
	.string	"featureConfig_System"
.LASF81:
	.string	"acc_hardware"
.LASF13:
	.string	"long long int"
.LASF14:
	.string	"long long unsigned int"
.LASF104:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF88:
	.string	"sensorTrims_t"
.LASF2:
	.string	"long int"
.LASF85:
	.string	"sensorTrims_s"
.LASF45:
	.string	"serialPortIdentifier_e"
.LASF63:
	.string	"values"
.LASF68:
	.string	"CW180_DEG"
.LASF34:
	.string	"featureConfig_t"
.LASF22:
	.string	"TASK_BATTERY"
.LASF38:
	.string	"SERIAL_PORT_UART3"
.LASF39:
	.string	"SERIAL_PORT_UART4"
.LASF40:
	.string	"SERIAL_PORT_UART5"
.LASF32:
	.string	"featureConfig_s"
.LASF100:
	.string	"serialConfig_System"
.LASF69:
	.string	"CW270_DEG"
.LASF58:
	.string	"SENSOR_INDEX_MAG"
.LASF5:
	.string	"unsigned char"
.LASF76:
	.string	"gyro_align"
.LASF84:
	.string	"sensorSelectionConfig_t"
.LASF94:
	.string	"receiveLength"
.LASF20:
	.string	"TASK_ACCEL"
.LASF91:
	.string	"U_ID_0"
.LASF0:
	.string	"signed char"
.LASF28:
	.string	"address"
.LASF8:
	.string	"uint32_t"
.LASF83:
	.string	"baro_hardware"
.LASF9:
	.string	"unsigned int"
.LASF3:
	.string	"int16_t"
.LASF6:
	.string	"uint16_t"
.LASF16:
	.string	"TASK_SYSTEM"
.LASF61:
	.string	"pitch"
.LASF7:
	.string	"short unsigned int"
.LASF55:
	.string	"SENSOR_INDEX_GYRO"
.LASF17:
	.string	"TASK_SERIAL"
.LASF80:
	.string	"sensorSelectionConfig_s"
.LASF12:
	.string	"char"
.LASF98:
	.string	"__pg_resetdata_end"
.LASF59:
	.string	"int16_flightDynamicsTrims_s"
.LASF24:
	.string	"TASK_COUNT"
.LASF70:
	.string	"CW0_DEG_FLIP"
.LASF106:
	.string	"/home/aravind/git/cleanflight"
.LASF15:
	.string	"_Bool"
.LASF42:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF43:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF74:
	.string	"sensor_align_e"
.LASF48:
	.string	"functionMask"
.LASF26:
	.string	"pgResetFunc"
.LASF101:
	.string	"sensorSelectionConfig_System"
.LASF10:
	.string	"long unsigned int"
.LASF105:
	.string	"src/main/fc/boot.c"
.LASF53:
	.string	"portConfigs"
.LASF95:
	.string	"__pg_registry_start"
.LASF27:
	.string	"size"
.LASF62:
	.string	"flightDynamicsTrims_def_t"
.LASF72:
	.string	"CW180_DEG_FLIP"
.LASF29:
	.string	"reset"
.LASF41:
	.string	"SERIAL_PORT_USB_VCP"
.LASF31:
	.string	"pgRegistry_s"
.LASF30:
	.string	"pgRegistry_t"
.LASF56:
	.string	"SENSOR_INDEX_ACC"
.LASF96:
	.string	"__pg_registry_end"
.LASF78:
	.string	"mag_align"
.LASF33:
	.string	"enabledFeatures"
.LASF93:
	.string	"U_ID_2"
.LASF44:
	.string	"SERIAL_PORT_IDENTIFIER_MAX"
.LASF89:
	.string	"configureScheduler"
.LASF23:
	.string	"TASK_RX"
.LASF19:
	.string	"TEST"
.LASF73:
	.string	"CW270_DEG_FLIP"
.LASF82:
	.string	"mag_hardware"
.LASF97:
	.string	"__pg_resetdata_start"
.LASF77:
	.string	"acc_align"
.LASF71:
	.string	"CW90_DEG_FLIP"
.LASF90:
	.string	"init"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
