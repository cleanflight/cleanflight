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
	.section	.text.configureScheduler,"ax",@progbits
	.globl	configureScheduler
	.type	configureScheduler, @function
configureScheduler:
.LFB12:
	.file 1 "src/main/fc/boot.c"
	.loc 1 763 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 764 0
	call	schedulerInit	#
	.loc 1 765 0
	movl	$1, %esi	#,
	movl	$0, %edi	#,
	call	setTaskEnabled	#
	.loc 1 766 0
	movl	$1, %esi	#,
	movl	$1, %edi	#,
	call	setTaskEnabled	#
	.loc 1 808 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	configureScheduler, .-configureScheduler
	.section	.rodata
.LC0:
	.string	"Hello World"
	.section	.text.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB13:
	.loc 1 812 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 813 0
	movl	$.LC0, %edi	#,
	call	puts	#
	.loc 1 814 0
	call	systemInit	#
	.loc 1 815 0
	call	configureScheduler	#
	.loc 1 816 0
	movl	$1, %edi	#,
	call	serialInit	#
	.loc 1 817 0
	call	mspInit	#
	.loc 1 818 0
	call	mspSerialInit	#
.L3:
	.loc 1 820 0 discriminator 1
	call	scheduler	#
	.loc 1 822 0 discriminator 1
	jmp	.L3	#
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/config/parameter_group.h"
	.file 4 "./src/main/config/feature.h"
	.file 5 "./src/main/fc/fc_tasks.h"
	.file 6 "./src/main/io/io_serial.h"
	.file 7 "./src/main/target/edison/target.h"
	.file 8 "./src/main/drivers/serial_uart.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3aa
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF64
	.byte	0xc
	.long	.LASF65
	.long	.LASF66
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
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF14
	.uleb128 0x6
	.byte	0x4
	.long	0x74
	.byte	0x5
	.byte	0x17
	.long	0xea
	.uleb128 0x7
	.long	.LASF15
	.byte	0
	.uleb128 0x7
	.long	.LASF16
	.byte	0x1
	.uleb128 0x7
	.long	.LASF17
	.byte	0x2
	.uleb128 0x7
	.long	.LASF18
	.byte	0x3
	.uleb128 0x7
	.long	.LASF19
	.byte	0x4
	.uleb128 0x7
	.long	.LASF20
	.byte	0x5
	.uleb128 0x7
	.long	.LASF21
	.byte	0x6
	.uleb128 0x7
	.long	.LASF22
	.byte	0x7
	.uleb128 0x7
	.long	.LASF23
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x45
	.uleb128 0x4
	.long	.LASF24
	.byte	0x3
	.byte	0x15
	.long	0x57
	.uleb128 0x4
	.long	.LASF25
	.byte	0x3
	.byte	0x26
	.long	0x106
	.uleb128 0x9
	.long	0x116
	.uleb128 0xa
	.long	0x89
	.uleb128 0xa
	.long	0x37
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.long	0x134
	.uleb128 0xc
	.string	"ptr"
	.byte	0x3
	.byte	0x2e
	.long	0x89
	.uleb128 0xc
	.string	"fn"
	.byte	0x3
	.byte	0x2f
	.long	0x134
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xfb
	.uleb128 0xd
	.long	.LASF30
	.byte	0x20
	.byte	0x3
	.byte	0x28
	.long	0x183
	.uleb128 0xe
	.string	"pgn"
	.byte	0x3
	.byte	0x29
	.long	0xf0
	.byte	0
	.uleb128 0xf
	.long	.LASF26
	.byte	0x3
	.byte	0x2a
	.long	0x57
	.byte	0x2
	.uleb128 0xf
	.long	.LASF27
	.byte	0x3
	.byte	0x2b
	.long	0xea
	.byte	0x8
	.uleb128 0xe
	.string	"ptr"
	.byte	0x3
	.byte	0x2c
	.long	0x183
	.byte	0x10
	.uleb128 0xf
	.long	.LASF28
	.byte	0x3
	.byte	0x30
	.long	0x116
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xea
	.uleb128 0x4
	.long	.LASF29
	.byte	0x3
	.byte	0x31
	.long	0x13a
	.uleb128 0xd
	.long	.LASF31
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.long	0x1ad
	.uleb128 0xf
	.long	.LASF32
	.byte	0x4
	.byte	0x15
	.long	0x69
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF33
	.byte	0x4
	.byte	0x16
	.long	0x194
	.uleb128 0x6
	.byte	0x4
	.long	0x37
	.byte	0x6
	.byte	0x36
	.long	0x201
	.uleb128 0x10
	.long	.LASF34
	.sleb128 -1
	.uleb128 0x7
	.long	.LASF35
	.byte	0
	.uleb128 0x7
	.long	.LASF36
	.byte	0x1
	.uleb128 0x7
	.long	.LASF37
	.byte	0x2
	.uleb128 0x7
	.long	.LASF38
	.byte	0x3
	.uleb128 0x7
	.long	.LASF39
	.byte	0x4
	.uleb128 0x7
	.long	.LASF40
	.byte	0x14
	.uleb128 0x7
	.long	.LASF41
	.byte	0x1e
	.uleb128 0x7
	.long	.LASF42
	.byte	0x1f
	.uleb128 0x7
	.long	.LASF43
	.byte	0x1f
	.byte	0
	.uleb128 0x4
	.long	.LASF44
	.byte	0x6
	.byte	0x41
	.long	0x1b8
	.uleb128 0xd
	.long	.LASF45
	.byte	0xc
	.byte	0x6
	.byte	0x5a
	.long	0x23d
	.uleb128 0xf
	.long	.LASF46
	.byte	0x6
	.byte	0x5b
	.long	0x201
	.byte	0
	.uleb128 0xf
	.long	.LASF47
	.byte	0x6
	.byte	0x5c
	.long	0x57
	.byte	0x4
	.uleb128 0xf
	.long	.LASF48
	.byte	0x6
	.byte	0x5d
	.long	0x23d
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.long	0x45
	.long	0x24d
	.uleb128 0x12
	.long	0x82
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF49
	.byte	0x6
	.byte	0x5e
	.long	0x20c
	.uleb128 0xd
	.long	.LASF50
	.byte	0x1c
	.byte	0x6
	.byte	0x60
	.long	0x27d
	.uleb128 0xf
	.long	.LASF51
	.byte	0x6
	.byte	0x61
	.long	0x45
	.byte	0
	.uleb128 0xf
	.long	.LASF52
	.byte	0x6
	.byte	0x62
	.long	0x27d
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.long	0x24d
	.long	0x28d
	.uleb128 0x12
	.long	0x82
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.long	.LASF53
	.byte	0x6
	.byte	0x63
	.long	0x258
	.uleb128 0x13
	.long	.LASF67
	.byte	0x1
	.value	0x2fa
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF68
	.byte	0x1
	.value	0x32b
	.long	0x37
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF54
	.byte	0x7
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x15
	.long	.LASF55
	.byte	0x7
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x15
	.long	.LASF56
	.byte	0x7
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x15
	.long	.LASF57
	.byte	0x8
	.byte	0x29
	.long	0x324
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0x16
	.long	0x69
	.uleb128 0x15
	.long	.LASF58
	.byte	0x3
	.byte	0x43
	.long	0x33e
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x8
	.byte	0x8
	.long	0x189
	.uleb128 0x15
	.long	.LASF59
	.byte	0x3
	.byte	0x44
	.long	0x33e
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x15
	.long	.LASF60
	.byte	0x3
	.byte	0x47
	.long	0xea
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x15
	.long	.LASF61
	.byte	0x3
	.byte	0x48
	.long	0xea
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x15
	.long	.LASF62
	.byte	0x4
	.byte	0x18
	.long	0x1ad
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x15
	.long	.LASF63
	.byte	0x6
	.byte	0x65
	.long	0x28d
	.uleb128 0x9
	.byte	0x3
	.quad	serialConfig_System
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB12
	.quad	.LFE12
	.quad	.LFB13
	.quad	.LFE13
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF51:
	.string	"reboot_character"
.LASF45:
	.string	"serialPortConfig_s"
.LASF49:
	.string	"serialPortConfig_t"
.LASF35:
	.string	"SERIAL_PORT_UART1"
.LASF36:
	.string	"SERIAL_PORT_UART2"
.LASF22:
	.string	"TASK_COMPASS"
.LASF1:
	.string	"short int"
.LASF24:
	.string	"pgn_t"
.LASF10:
	.string	"sizetype"
.LASF68:
	.string	"main"
.LASF55:
	.string	"U_ID_1"
.LASF48:
	.string	"baudRates"
.LASF34:
	.string	"SERIAL_PORT_NONE"
.LASF18:
	.string	"TASK_GYROPID"
.LASF4:
	.string	"uint8_t"
.LASF50:
	.string	"serialConfig_s"
.LASF53:
	.string	"serialConfig_t"
.LASF46:
	.string	"identifier"
.LASF62:
	.string	"featureConfig_System"
.LASF12:
	.string	"long long int"
.LASF13:
	.string	"long long unsigned int"
.LASF64:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF2:
	.string	"long int"
.LASF44:
	.string	"serialPortIdentifier_e"
.LASF33:
	.string	"featureConfig_t"
.LASF20:
	.string	"TASK_BATTERY"
.LASF37:
	.string	"SERIAL_PORT_UART3"
.LASF38:
	.string	"SERIAL_PORT_UART4"
.LASF39:
	.string	"SERIAL_PORT_UART5"
.LASF31:
	.string	"featureConfig_s"
.LASF3:
	.string	"unsigned char"
.LASF57:
	.string	"receiveLength"
.LASF19:
	.string	"TASK_ACCEL"
.LASF54:
	.string	"U_ID_0"
.LASF0:
	.string	"signed char"
.LASF27:
	.string	"address"
.LASF7:
	.string	"uint32_t"
.LASF8:
	.string	"unsigned int"
.LASF5:
	.string	"uint16_t"
.LASF15:
	.string	"TASK_SYSTEM"
.LASF6:
	.string	"short unsigned int"
.LASF16:
	.string	"TASK_SERIAL"
.LASF11:
	.string	"char"
.LASF61:
	.string	"__pg_resetdata_end"
.LASF23:
	.string	"TASK_COUNT"
.LASF66:
	.string	"/home/aravind/git/cleanflight"
.LASF14:
	.string	"_Bool"
.LASF41:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF42:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF47:
	.string	"functionMask"
.LASF25:
	.string	"pgResetFunc"
.LASF9:
	.string	"long unsigned int"
.LASF65:
	.string	"src/main/fc/boot.c"
.LASF52:
	.string	"portConfigs"
.LASF58:
	.string	"__pg_registry_start"
.LASF26:
	.string	"size"
.LASF63:
	.string	"serialConfig_System"
.LASF28:
	.string	"reset"
.LASF40:
	.string	"SERIAL_PORT_USB_VCP"
.LASF30:
	.string	"pgRegistry_s"
.LASF29:
	.string	"pgRegistry_t"
.LASF59:
	.string	"__pg_registry_end"
.LASF32:
	.string	"enabledFeatures"
.LASF56:
	.string	"U_ID_2"
.LASF43:
	.string	"SERIAL_PORT_IDENTIFIER_MAX"
.LASF67:
	.string	"configureScheduler"
.LASF21:
	.string	"TASK_RX"
.LASF17:
	.string	"TEST"
.LASF60:
	.string	"__pg_resetdata_start"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
