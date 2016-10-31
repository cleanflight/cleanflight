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
	.section	.text.systemInit,"ax",@progbits
	.globl	systemInit
	.type	systemInit, @function
systemInit:
.LFB2:
	.file 1 "src/main/drivers/system.c"
	.loc 1 45 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 68 0
	call	usartInitAllIOSignals	#
	.loc 1 82 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	systemInit, .-systemInit
	.section	.text.SysTick_Handler,"ax",@progbits
	.globl	SysTick_Handler
	.type	SysTick_Handler, @function
SysTick_Handler:
.LFB3:
	.loc 1 97 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 98 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.2637
	addl	$1, %eax	#, D.2637
	movl	%eax, sysTickUptime(%rip)	# D.2637, sysTickUptime
	.loc 1 99 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	SysTick_Handler, .-SysTick_Handler
	.section	.text.millis,"ax",@progbits
	.globl	millis
	.type	millis, @function
millis:
.LFB4:
	.loc 1 121 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 122 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.2638
	.loc 1 123 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	millis, .-millis
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x10e
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF741
	.byte	0xc
	.long	.LASF742
	.long	.LASF743
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF725
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF726
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF727
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF728
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF729
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF730
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF731
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF732
	.uleb128 0x4
	.long	.LASF744
	.byte	0x2
	.byte	0x33
	.long	0x77
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF733
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF734
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF735
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF736
	.uleb128 0x5
	.long	.LASF737
	.byte	0x1
	.byte	0x2c
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.long	.LASF738
	.byte	0x1
	.byte	0x60
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.long	.LASF745
	.byte	0x1
	.byte	0x78
	.long	0x6c
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF739
	.byte	0x1
	.byte	0x26
	.long	0x6c
	.uleb128 0x9
	.byte	0x3
	.quad	usTicks
	.uleb128 0x8
	.long	.LASF740
	.byte	0x1
	.byte	0x28
	.long	0x10c
	.uleb128 0x9
	.byte	0x3
	.quad	sysTickUptime
	.uleb128 0x9
	.long	0x6c
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
	.uleb128 0x6
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
	.uleb128 0x2117
	.uleb128 0x19
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.file 3 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 4 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x4
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
	.byte	0x7
	.long	.Ldebug_macro7
	.file 10 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 11 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x15
	.long	.LASF408
	.byte	0x4
	.byte	0x4
	.file 12 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.file 13 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF414
	.file 14 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x7
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
	.file 15 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF501
	.file 16 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.file 17 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro15
	.file 18 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro16
	.file 19 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x7
	.long	.LASF531
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro17
	.file 20 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x18
	.long	.LASF538
	.file 21 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x18
	.long	.LASF539
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.file 22 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF593
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF594
	.file 23 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x17
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
	.file 24 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro24
	.file 25 "/usr/include/time.h"
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF385
	.byte	0x3
	.uleb128 0x92
	.uleb128 0xa
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
	.uleb128 0x7
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
	.uleb128 0x19
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
	.uleb128 0x7
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
	.uleb128 0xa
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
	.file 34 "src/main/drivers/serial_uart.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro39
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
	.section	.debug_macro,"G",@progbits,wm4.serial_uart.h.26.e75c8f65474ad7b5502b5457fb95997d,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF715
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF716
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF717
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF718
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF719
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF720
	.byte	0x5
	.uleb128 0x20
	.long	.LASF721
	.byte	0x5
	.uleb128 0x21
	.long	.LASF722
	.byte	0x5
	.uleb128 0x22
	.long	.LASF723
	.byte	0x5
	.uleb128 0x23
	.long	.LASF724
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF514:
	.string	"P_PGID"
.LASF394:
	.string	"_SIZE_T_ "
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF668:
	.string	"__sigset_t_defined "
.LASF742:
	.string	"src/main/drivers/system.c"
.LASF679:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF455:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF496:
	.string	"__INT_WCHAR_T_H "
.LASF696:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF336:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF414:
	.string	"_STDINT_H 1"
.LASF492:
	.string	"_WCHAR_T_DEFINED_ "
.LASF525:
	.string	"__W_CONTINUED 0xffff"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF580:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF590:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF633:
	.string	"__dev_t_defined "
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF600:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF333:
	.string	"__flexarr []"
.LASF717:
	.string	"UART2_RX_BUFFER_SIZE 256"
.LASF494:
	.string	"_WCHAR_T_H "
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF689:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF532:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF675:
	.string	"__NFDBITS"
.LASF352:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF465:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF339:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF635:
	.string	"__mode_t_defined "
.LASF671:
	.string	"__need_timeval "
.LASF451:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF741:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF424:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF745:
	.string	"millis"
.LASF417:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF704:
	.string	"__have_pthread_attr_t 1"
.LASF281:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF571:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF389:
	.string	"_SIZE_T "
.LASF506:
	.string	"WCONTINUED 8"
.LASF653:
	.string	"__clockid_time_t"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF708:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF499:
	.string	"_BSD_WCHAR_T_"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF569:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF365:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF733:
	.string	"unsigned int"
.LASF306:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF690:
	.string	"__blksize_t_defined "
.LASF386:
	.string	"__need_NULL "
.LASF684:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF287:
	.string	"_POSIX_SOURCE"
.LASF267:
	.string	"__USE_XOPEN2K"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF739:
	.string	"usTicks"
.LASF418:
	.string	"__int8_t_defined "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF519:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF620:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF669:
	.string	"__need_timespec "
.LASF259:
	.string	"__USE_ISOCXX11"
.LASF393:
	.string	"__SIZE_T "
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF302:
	.string	"__GNU_LIBRARY__"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF372:
	.string	"__stub_chflags "
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF374:
	.string	"__stub_fchflags "
.LASF437:
	.string	"INT_LEAST8_MAX (127)"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF531:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF399:
	.string	"_SIZE_T_DECLARED "
.LASF589:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
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
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF421:
	.string	"INT8_MIN (-128)"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF382:
	.string	"__stub_sigreturn "
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF542:
	.string	"__S32_TYPE int"
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
.LASF442:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF638:
	.string	"__off_t_defined "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF586:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF516:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF594:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF426:
	.string	"INT16_MAX (32767)"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF695:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF464:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF501:
	.string	"_STDLIB_H 1"
.LASF266:
	.string	"__USE_UNIX98"
.LASF301:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF297:
	.string	"_ATFILE_SOURCE"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF313:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF522:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF688:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF473:
	.string	"INT16_C(c) c"
.LASF605:
	.string	"le32toh(x) (x)"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF392:
	.string	"_T_SIZE "
.LASF439:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF431:
	.string	"UINT32_MAX (4294967295U)"
.LASF298:
	.string	"_ATFILE_SOURCE 1"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF311:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF641:
	.string	"__ssize_t_defined "
.LASF711:
	.string	"alloca"
.LASF391:
	.string	"_T_SIZE_ "
.LASF744:
	.string	"uint32_t"
.LASF482:
	.string	"_GCC_WRAP_STDINT_H "
.LASF632:
	.string	"__ino_t_defined "
.LASF398:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF440:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF359:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF401:
	.string	"_GCC_SIZE_T "
.LASF604:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF564:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF239:
	.string	"__unix__ 1"
.LASF349:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF598:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF694:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF698:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF395:
	.string	"_BSD_SIZE_T_ "
.LASF538:
	.string	"_BITS_BYTESWAP_H 1"
.LASF381:
	.string	"__stub_setlogin "
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF610:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF639:
	.string	"__pid_t_defined "
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF735:
	.string	"long long unsigned int"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF615:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF312:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF636:
	.string	"__nlink_t_defined "
.LASF530:
	.string	"__PDP_ENDIAN 3412"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF691:
	.string	"__blkcnt_t_defined "
.LASF343:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF553:
	.string	"__U64_TYPE unsigned long int"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF280:
	.string	"__KERNEL_STRICT_NAMES "
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF263:
	.string	"__USE_POSIX199506"
.LASF474:
	.string	"INT32_C(c) c"
.LASF656:
	.string	"__need_timespec"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF649:
	.string	"__need_clock_t"
.LASF315:
	.string	"__PMT(args) args"
.LASF478:
	.string	"UINT32_C(c) c ## U"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF662:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF539:
	.string	"_BITS_TYPES_H 1"
.LASF476:
	.string	"UINT8_C(c) c"
.LASF529:
	.string	"__BIG_ENDIAN 4321"
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
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF637:
	.string	"__uid_t_defined "
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF601:
	.string	"le16toh(x) (x)"
.LASF228:
	.string	"__MMX__ 1"
.LASF487:
	.string	"_T_WCHAR_ "
.LASF384:
	.string	"__stub_stty "
.LASF513:
	.string	"P_PID"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF452:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF541:
	.string	"__U16_TYPE unsigned short int"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF485:
	.string	"__WCHAR_T__ "
.LASF295:
	.string	"__USE_XOPEN2K 1"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF599:
	.string	"htole16(x) (x)"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF284:
	.string	"__USE_ISOC99 1"
.LASF562:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF338:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF456:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF370:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF258:
	.string	"__USE_ISOC95"
.LASF497:
	.string	"_GCC_WCHAR_T "
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF676:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF257:
	.string	"__USE_ISOC99"
.LASF293:
	.string	"__USE_POSIX199309 1"
.LASF560:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF643:
	.string	"__key_t_defined "
.LASF409:
	.string	"_STDBOOL_H "
.LASF712:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF699:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF608:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF674:
	.string	"__suseconds_t_defined "
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF379:
	.string	"__stub_putmsg "
.LASF527:
	.string	"_ENDIAN_H 1"
.LASF736:
	.string	"_Bool"
.LASF396:
	.string	"_SIZE_T_DEFINED_ "
.LASF320:
	.string	"__BEGIN_DECLS "
.LASF526:
	.string	"__WCOREFLAG 0x80"
.LASF405:
	.string	"NULL"
.LASF471:
	.string	"WINT_MAX (4294967295u)"
.LASF588:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF581:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF556:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF634:
	.string	"__gid_t_defined "
.LASF425:
	.string	"INT8_MAX (127)"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF682:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF283:
	.string	"_DEFAULT_SOURCE 1"
.LASF430:
	.string	"UINT16_MAX (65535)"
.LASF218:
	.string	"__amd64__ 1"
.LASF449:
	.string	"INT_FAST8_MAX (127)"
.LASF658:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF361:
	.string	"__WORDSIZE 64"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF533:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF678:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF480:
	.string	"INTMAX_C(c) c ## L"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF245:
	.string	"EDISON 1"
.LASF434:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF654:
	.string	"__timer_t_defined 1"
.LASF607:
	.string	"htole64(x) (x)"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF406:
	.string	"NULL ((void *)0)"
.LASF348:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF597:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF719:
	.string	"UART3_RX_BUFFER_SIZE 256"
.LASF373:
	.string	"__stub_fattach "
.LASF466:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF703:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF582:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF422:
	.string	"INT16_MIN (-32767-1)"
.LASF319:
	.string	"__long_double_t long double"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF490:
	.string	"_WCHAR_T_ "
.LASF335:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF631:
	.string	"__u_char_defined "
.LASF477:
	.string	"UINT16_C(c) c"
.LASF629:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF318:
	.string	"__ptr_t void *"
.LASF500:
	.string	"__need_wchar_t"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF728:
	.string	"char"
.LASF709:
	.string	"__malloc_and_calloc_defined "
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF509:
	.string	"__WALL 0x40000000"
.LASF470:
	.string	"WINT_MIN (0u)"
.LASF323:
	.string	"__END_NAMESPACE_STD "
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF573:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF220:
	.string	"__x86_64__ 1"
.LASF460:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF508:
	.string	"__WNOTHREAD 0x20000000"
.LASF416:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF574:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF294:
	.string	"__USE_POSIX199506 1"
.LASF235:
	.string	"__linux 1"
.LASF468:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF388:
	.string	"__SIZE_T__ "
.LASF583:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF353:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF356:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF613:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF366:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF740:
	.string	"sysTickUptime"
.LASF351:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF350:
	.string	"__wur "
.LASF423:
	.string	"INT32_MIN (-2147483647-1)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF578:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF325:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF555:
	.string	"_BITS_TYPESIZES_H 1"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
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
.LASF627:
	.string	"EXIT_FAILURE 1"
.LASF554:
	.string	"__STD_TYPE typedef"
.LASF472:
	.string	"INT8_C(c) c"
.LASF300:
	.string	"__USE_ATFILE 1"
.LASF646:
	.string	"__need_timer_t "
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF307:
	.string	"_SYS_CDEFS_H 1"
.LASF616:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF619:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF17:
	.string	"__LP64__ 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF630:
	.string	"_SYS_TYPES_H 1"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF459:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF617:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF342:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF367:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF611:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF16:
	.string	"_LP64 1"
.LASF255:
	.string	"_FEATURES_H 1"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF565:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF544:
	.string	"__SLONGWORD_TYPE long int"
.LASF489:
	.string	"__WCHAR_T "
.LASF734:
	.string	"long long int"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF657:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF723:
	.string	"UART5_RX_BUFFER_SIZE 256"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF504:
	.string	"WSTOPPED 2"
.LASF327:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF387:
	.string	"__size_t__ "
.LASF433:
	.string	"INT_LEAST8_MIN (-128)"
.LASF243:
	.string	"DEBUG 1"
.LASF357:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF738:
	.string	"SysTick_Handler"
.LASF493:
	.string	"_WCHAR_T_DEFINED "
.LASF502:
	.string	"WNOHANG 1"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF308:
	.string	"__PMT"
.LASF483:
	.string	"__need_wchar_t "
.LASF718:
	.string	"UART2_TX_BUFFER_SIZE 256"
.LASF309:
	.string	"__LEAF , __leaf__"
.LASF316:
	.string	"__CONCAT(x,y) x ## y"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF714:
	.string	"__need_malloc_and_calloc"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF552:
	.string	"__S64_TYPE long int"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF486:
	.string	"_WCHAR_T "
.LASF593:
	.string	"__STD_TYPE"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF642:
	.string	"__daddr_t_defined "
.LASF618:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF479:
	.string	"UINT64_C(c) c ## UL"
.LASF303:
	.string	"__GNU_LIBRARY__ 6"
.LASF0:
	.string	"__STDC__ 1"
.LASF230:
	.string	"__SSE2__ 1"
.LASF737:
	.string	"systemInit"
.LASF523:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF286:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF441:
	.string	"UINT_LEAST8_MAX (255)"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF436:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF290:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF457:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF661:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF667:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF743:
	.string	"/home/aravind/git/cleanflight"
.LASF563:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF693:
	.string	"__fsfilcnt_t_defined "
.LASF595:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF720:
	.string	"UART3_TX_BUFFER_SIZE 256"
.LASF512:
	.string	"P_ALL"
.LASF673:
	.string	"__need_timeval"
.LASF640:
	.string	"__id_t_defined "
.LASF518:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF276:
	.string	"__USE_GNU"
.LASF329:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF625:
	.string	"__lldiv_t_defined 1"
.LASF408:
	.string	"_XLOCALE_H 1"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF291:
	.string	"__USE_POSIX 1"
.LASF591:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF664:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF659:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF410:
	.string	"bool _Bool"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF345:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF346:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF305:
	.string	"__GLIBC_MINOR__ 23"
.LASF469:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF273:
	.string	"__USE_FILE_OFFSET64"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF587:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF400:
	.string	"___int_size_t_h "
.LASF360:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF429:
	.string	"UINT8_MAX (255)"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF385:
	.string	"__need_size_t "
.LASF328:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF275:
	.string	"__USE_ATFILE"
.LASF652:
	.string	"__clockid_t_defined 1"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF404:
	.string	"__need_size_t"
.LASF549:
	.string	"__UWORD_TYPE unsigned long int"
.LASF606:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF495:
	.string	"___int_wchar_t_h "
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF278:
	.string	"__USE_FORTIFY_LEVEL"
.LASF475:
	.string	"INT64_C(c) c ## L"
.LASF535:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF623:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF330:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF481:
	.string	"UINTMAX_C(c) c ## UL"
.LASF317:
	.string	"__STRING(x) #x"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF726:
	.string	"sizetype"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF537:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF219:
	.string	"__x86_64 1"
.LASF722:
	.string	"UART4_TX_BUFFER_SIZE 256"
.LASF548:
	.string	"__SWORD_TYPE long int"
.LASF730:
	.string	"short int"
.LASF453:
	.string	"UINT_FAST8_MAX (255)"
.LASF498:
	.string	"_WCHAR_T_DECLARED "
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF376:
	.string	"__stub_getmsg "
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF647:
	.string	"__need_clockid_t "
.LASF413:
	.string	"__bool_true_false_are_defined 1"
.LASF731:
	.string	"long int"
.LASF415:
	.string	"_BITS_WCHAR_H 1"
.LASF566:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF419:
	.string	"__uint32_t_defined "
.LASF261:
	.string	"__USE_POSIX2"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF450:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF503:
	.string	"WUNTRACED 2"
.LASF407:
	.string	"__need_NULL"
.LASF254:
	.string	"_STRING_H 1"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF561:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF672:
	.string	"_STRUCT_TIMEVAL 1"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF576:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF681:
	.string	"NFDBITS __NFDBITS"
.LASF592:
	.string	"__FD_SETSIZE 1024"
.LASF713:
	.string	"__COMPAR_FN_T "
.LASF380:
	.string	"__stub_revoke "
.LASF364:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF277:
	.string	"__USE_REENTRANT"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF710:
	.string	"_ALLOCA_H 1"
.LASF383:
	.string	"__stub_sstk "
.LASF269:
	.string	"__USE_XOPEN2K8"
.LASF510:
	.string	"__WCLONE 0x80000000"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF665:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF687:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF612:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF264:
	.string	"__USE_XOPEN"
.LASF524:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF467:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF289:
	.string	"_POSIX_C_SOURCE"
.LASF680:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF403:
	.string	"__size_t "
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF341:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF651:
	.string	"__need_time_t"
.LASF274:
	.string	"__USE_MISC"
.LASF628:
	.string	"EXIT_SUCCESS 0"
.LASF701:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF577:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF296:
	.string	"__USE_XOPEN2K8 1"
.LASF507:
	.string	"WNOWAIT 0x01000000"
.LASF326:
	.string	"__END_NAMESPACE_C99 "
.LASF458:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF432:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF448:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF645:
	.string	"__need_time_t "
.LASF511:
	.string	"__ENUM_IDTYPE_T 1"
.LASF540:
	.string	"__S16_TYPE short int"
.LASF282:
	.string	"_DEFAULT_SOURCE"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF602:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF331:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF397:
	.string	"_SIZE_T_DEFINED "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF371:
	.string	"__stub___compat_bdflush "
.LASF484:
	.string	"__wchar_t__ "
.LASF663:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF551:
	.string	"__ULONG32_TYPE unsigned int"
.LASF567:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF579:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF558:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF256:
	.string	"__USE_ISOC11"
.LASF725:
	.string	"long unsigned int"
.LASF575:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF447:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF238:
	.string	"__unix 1"
.LASF715:
	.string	"UART1_RX_BUFFER_SIZE 256"
.LASF534:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF700:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF536:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF707:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF488:
	.string	"_T_WCHAR "
.LASF369:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF446:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF515:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF314:
	.string	"__P(args) args"
.LASF557:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF546:
	.string	"__SQUAD_TYPE long int"
.LASF268:
	.string	"__USE_XOPEN2KXSI"
.LASF340:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
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
.LASF732:
	.string	"unsigned char"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF427:
	.string	"INT32_MAX (2147483647)"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF355:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF463:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF724:
	.string	"UART5_TX_BUFFER_SIZE 256"
.LASF454:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF686:
	.string	"_SYS_SYSMACROS_H 1"
.LASF666:
	.string	"_SIGSET_H_types 1"
.LASF585:
	.string	"__TIMER_T_TYPE void *"
.LASF231:
	.string	"__FXSR__ 1"
.LASF310:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF420:
	.string	"__intptr_t_defined "
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF624:
	.string	"__ldiv_t_defined 1"
.LASF622:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF288:
	.string	"_POSIX_SOURCE 1"
.LASF603:
	.string	"htole32(x) (x)"
.LASF596:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF650:
	.string	"__time_t_defined 1"
.LASF491:
	.string	"_BSD_WCHAR_T_ "
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF334:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF702:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF443:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF226:
	.string	"__k8__ 1"
.LASF559:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF545:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF685:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF705:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF265:
	.string	"__USE_XOPEN_EXTENDED"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF445:
	.string	"INT_FAST8_MIN (-128)"
.LASF272:
	.string	"__USE_LARGEFILE64"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF697:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF444:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF321:
	.string	"__END_DECLS "
.LASF270:
	.string	"__USE_XOPEN2K8XSI"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF584:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF521:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF344:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF461:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF438:
	.string	"INT_LEAST16_MAX (32767)"
.LASF677:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF271:
	.string	"__USE_LARGEFILE"
.LASF505:
	.string	"WEXITED 4"
.LASF729:
	.string	"signed char"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF299:
	.string	"__USE_MISC 1"
.LASF727:
	.string	"short unsigned int"
.LASF644:
	.string	"__need_clock_t "
.LASF706:
	.string	"__PTHREAD_SPINS 0, 0"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF229:
	.string	"__SSE__ 1"
.LASF716:
	.string	"UART1_TX_BUFFER_SIZE 256"
.LASF543:
	.string	"__U32_TYPE unsigned int"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF402:
	.string	"_SIZET_ "
.LASF375:
	.string	"__stub_fdetach "
.LASF390:
	.string	"_SYS_SIZE_T_H "
.LASF660:
	.string	"_SYS_SELECT_H 1"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF528:
	.string	"__LITTLE_ENDIAN 1234"
.LASF241:
	.string	"__ELF__ 1"
.LASF626:
	.string	"RAND_MAX 2147483647"
.LASF670:
	.string	"__timespec_defined 1"
.LASF332:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF411:
	.string	"true 1"
.LASF248:
	.string	"__REVISION__ \"042edaa\""
.LASF572:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF683:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF337:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF568:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF648:
	.string	"__clock_t_defined 1"
.LASF217:
	.string	"__amd64 1"
.LASF520:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF547:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF236:
	.string	"__linux__ 1"
.LASF362:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF692:
	.string	"__fsblkcnt_t_defined "
.LASF655:
	.string	"__need_timer_t"
.LASF517:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF225:
	.string	"__k8 1"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF412:
	.string	"false 0"
.LASF428:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF279:
	.string	"__KERNEL_STRICT_NAMES"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF614:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF621:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF550:
	.string	"__SLONG32_TYPE int"
.LASF260:
	.string	"__USE_POSIX"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF609:
	.string	"le64toh(x) (x)"
.LASF435:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF363:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF570:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF721:
	.string	"UART4_RX_BUFFER_SIZE 256"
.LASF378:
	.string	"__stub_lchmod "
.LASF462:
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
