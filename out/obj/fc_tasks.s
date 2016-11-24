	.file	"fc_tasks.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed fc_tasks.i -mtune=generic -march=x86-64
# -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -fverbose-asm
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
	.globl	taskQueueArraySize
	.section	.rodata.taskQueueArraySize,"a",@progbits
	.align 4
	.type	taskQueueArraySize, @object
	.size	taskQueueArraySize, 4
taskQueueArraySize:
	.long	9
	.globl	taskCount
	.section	.rodata.taskCount,"a",@progbits
	.align 4
	.type	taskCount, @object
	.size	taskCount, 4
taskCount:
	.long	8
	.comm	taskQueueArray,72,32
	.section	.rodata
.LC0:
	.string	"Scheduled!"
	.section	.text.print,"ax",@progbits
	.globl	print
	.type	print, @function
print:
.LFB0:
	.file 1 "src/main/fc/fc_tasks.c"
	.loc 1 39 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 40 0
	movl	$.LC0, %edi	#,
	call	puts	#
	.loc 1 41 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print, .-print
	.globl	cfTasks
	.section	.rodata
.LC1:
	.string	"SYSTEM"
.LC2:
	.string	"GYRO/PID"
.LC3:
	.string	"ACCEL"
.LC4:
	.string	"SERIAL"
.LC5:
	.string	"BATTERY"
.LC6:
	.string	"RX"
.LC7:
	.string	"COMPASS"
	.section	.data.cfTasks,"aw",@progbits
	.align 32
	.type	cfTasks, @object
	.size	cfTasks, 512
cfTasks:
# taskName:
	.quad	.LC1
# taskFunc:
	.zero	8
	.quad	taskSystem
# desiredPeriod:
	.long	100000
# staticPriority:
	.byte	5
	.zero	35
	.zero	64
# taskName:
	.quad	.LC2
# taskFunc:
	.zero	8
	.quad	taskMainPidLoopChecker
# desiredPeriod:
	.long	1000
# staticPriority:
	.byte	6
	.zero	35
# taskName:
	.quad	.LC3
# taskFunc:
	.zero	8
	.quad	taskUpdateAccelerometer
# desiredPeriod:
	.long	1000000
# staticPriority:
	.byte	3
	.zero	35
# taskName:
	.quad	.LC4
# taskFunc:
	.zero	8
	.quad	taskHandleSerial
# desiredPeriod:
	.long	10000
# staticPriority:
	.byte	1
	.zero	35
# taskName:
	.quad	.LC5
# taskFunc:
	.zero	8
	.quad	taskUpdateBattery
# desiredPeriod:
	.long	20000
# staticPriority:
	.byte	3
	.zero	35
# taskName:
	.quad	.LC6
# checkFunc:
	.quad	taskUpdateRxCheck
# taskFunc:
	.quad	taskUpdateRxMain
# desiredPeriod:
	.long	20000
# staticPriority:
	.byte	5
	.zero	35
# taskName:
	.quad	.LC7
# taskFunc:
	.zero	8
	.quad	taskUpdateCompass
# desiredPeriod:
	.long	100000
# staticPriority:
	.byte	3
	.zero	35
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/fc/fc_tasks.h"
	.file 4 "./src/main/scheduler/scheduler.h"
	.file 5 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2bf
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF821
	.byte	0xc
	.long	.LASF822
	.long	.LASF823
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF772
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF773
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF774
	.uleb128 0x4
	.long	.LASF776
	.byte	0x2
	.byte	0x30
	.long	0x54
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF775
	.uleb128 0x4
	.long	.LASF777
	.byte	0x2
	.byte	0x31
	.long	0x66
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF778
	.uleb128 0x4
	.long	.LASF779
	.byte	0x2
	.byte	0x33
	.long	0x78
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF780
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF781
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF782
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF783
	.uleb128 0x5
	.byte	0x8
	.long	0x9a
	.uleb128 0x6
	.long	0x8d
	.uleb128 0x7
	.byte	0x4
	.long	0x78
	.byte	0x3
	.byte	0x14
	.long	0xe2
	.uleb128 0x8
	.long	.LASF784
	.byte	0
	.uleb128 0x8
	.long	.LASF785
	.byte	0x1
	.uleb128 0x8
	.long	.LASF786
	.byte	0x2
	.uleb128 0x8
	.long	.LASF787
	.byte	0x3
	.uleb128 0x8
	.long	.LASF788
	.byte	0x4
	.uleb128 0x8
	.long	.LASF789
	.byte	0x5
	.uleb128 0x8
	.long	.LASF790
	.byte	0x6
	.uleb128 0x8
	.long	.LASF791
	.byte	0x7
	.uleb128 0x8
	.long	.LASF792
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x78
	.byte	0x4
	.byte	0x1a
	.long	0x113
	.uleb128 0x8
	.long	.LASF793
	.byte	0
	.uleb128 0x8
	.long	.LASF794
	.byte	0x1
	.uleb128 0x8
	.long	.LASF795
	.byte	0x3
	.uleb128 0x8
	.long	.LASF796
	.byte	0x5
	.uleb128 0x8
	.long	.LASF797
	.byte	0x6
	.uleb128 0x8
	.long	.LASF798
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF799
	.uleb128 0x9
	.byte	0x40
	.byte	0x4
	.byte	0x30
	.long	0x1bf
	.uleb128 0xa
	.long	.LASF800
	.byte	0x4
	.byte	0x32
	.long	0x94
	.byte	0
	.uleb128 0xa
	.long	.LASF801
	.byte	0x4
	.byte	0x33
	.long	0x1ce
	.byte	0x8
	.uleb128 0xa
	.long	.LASF802
	.byte	0x4
	.byte	0x34
	.long	0x1d5
	.byte	0x10
	.uleb128 0xa
	.long	.LASF803
	.byte	0x4
	.byte	0x35
	.long	0x6d
	.byte	0x18
	.uleb128 0xa
	.long	.LASF804
	.byte	0x4
	.byte	0x36
	.long	0x1db
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF805
	.byte	0x4
	.byte	0x39
	.long	0x5b
	.byte	0x1e
	.uleb128 0xa
	.long	.LASF806
	.byte	0x4
	.byte	0x3a
	.long	0x5b
	.byte	0x20
	.uleb128 0xa
	.long	.LASF807
	.byte	0x4
	.byte	0x3b
	.long	0x6d
	.byte	0x24
	.uleb128 0xa
	.long	.LASF808
	.byte	0x4
	.byte	0x3c
	.long	0x6d
	.byte	0x28
	.uleb128 0xa
	.long	.LASF809
	.byte	0x4
	.byte	0x3f
	.long	0x6d
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF810
	.byte	0x4
	.byte	0x40
	.long	0x6d
	.byte	0x30
	.uleb128 0xa
	.long	.LASF811
	.byte	0x4
	.byte	0x42
	.long	0x6d
	.byte	0x34
	.uleb128 0xa
	.long	.LASF812
	.byte	0x4
	.byte	0x43
	.long	0x6d
	.byte	0x38
	.byte	0
	.uleb128 0xb
	.long	0x113
	.long	0x1ce
	.uleb128 0xc
	.long	0x6d
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x1bf
	.uleb128 0xd
	.uleb128 0x5
	.byte	0x8
	.long	0x1d4
	.uleb128 0x6
	.long	0x49
	.uleb128 0x4
	.long	.LASF813
	.byte	0x4
	.byte	0x45
	.long	0x11a
	.uleb128 0xe
	.long	.LASF824
	.byte	0x1
	.byte	0x26
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.long	.LASF814
	.byte	0x5
	.byte	0xc8
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0xf
	.long	.LASF815
	.byte	0x5
	.byte	0xc9
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0xf
	.long	.LASF816
	.byte	0x5
	.byte	0xca
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x10
	.long	0x253
	.long	0x253
	.uleb128 0x11
	.long	0x86
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x1e0
	.uleb128 0xf
	.long	.LASF817
	.byte	0x1
	.byte	0x24
	.long	0x243
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueueArray
	.uleb128 0xf
	.long	.LASF818
	.byte	0x1
	.byte	0x22
	.long	0x283
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueueArraySize
	.uleb128 0x6
	.long	0x6d
	.uleb128 0xf
	.long	.LASF819
	.byte	0x1
	.byte	0x23
	.long	0x283
	.uleb128 0x9
	.byte	0x3
	.quad	taskCount
	.uleb128 0x10
	.long	0x1e0
	.long	0x2ad
	.uleb128 0x11
	.long	0x86
	.byte	0x7
	.byte	0
	.uleb128 0xf
	.long	.LASF820
	.byte	0x1
	.byte	0x38
	.long	0x29d
	.uleb128 0x9
	.byte	0x3
	.quad	cfTasks
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
	.uleb128 0x13
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB0
	.quad	.LFE0
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
	.file 6 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 7 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 8 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x8
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF259
	.file 9 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro3
	.file 10 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.file 11 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.file 12 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0xc
	.file 13 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 14 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF457
	.byte	0x4
	.file 15 "/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro10
	.file 16 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.file 17 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x11
	.byte	0x5
	.uleb128 0x18
	.long	.LASF482
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro12
	.file 18 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF536
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 19 "/usr/include/libio.h"
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF544
	.file 20 "/usr/include/_G_config.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x5
	.uleb128 0x10
	.long	.LASF546
	.file 21 "/usr/include/wchar.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro19
	.file 22 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro21
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.file 23 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0xa4
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro24
	.file 24 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.byte	0x3
	.uleb128 0x355
	.uleb128 0x18
	.byte	0x4
	.byte	0x4
	.file 25 "./src/main/platform.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x19
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x3
	.byte	0x4
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF771
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
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.07dce69c3b78884144b7f7bd19483461,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF254
	.byte	0x5
	.uleb128 0x21
	.long	.LASF255
	.byte	0x5
	.uleb128 0x22
	.long	.LASF256
	.byte	0x5
	.uleb128 0x23
	.long	.LASF257
	.byte	0x5
	.uleb128 0x34
	.long	.LASF258
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8a17512e4762abcff59e629b80463c10,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF260
	.byte	0x6
	.uleb128 0x61
	.long	.LASF261
	.byte	0x6
	.uleb128 0x62
	.long	.LASF262
	.byte	0x6
	.uleb128 0x63
	.long	.LASF263
	.byte	0x6
	.uleb128 0x64
	.long	.LASF264
	.byte	0x6
	.uleb128 0x65
	.long	.LASF265
	.byte	0x6
	.uleb128 0x66
	.long	.LASF266
	.byte	0x6
	.uleb128 0x67
	.long	.LASF267
	.byte	0x6
	.uleb128 0x68
	.long	.LASF268
	.byte	0x6
	.uleb128 0x69
	.long	.LASF269
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF270
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF271
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF272
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF273
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF274
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF275
	.byte	0x6
	.uleb128 0x70
	.long	.LASF276
	.byte	0x6
	.uleb128 0x71
	.long	.LASF277
	.byte	0x6
	.uleb128 0x72
	.long	.LASF278
	.byte	0x6
	.uleb128 0x73
	.long	.LASF279
	.byte	0x6
	.uleb128 0x74
	.long	.LASF280
	.byte	0x6
	.uleb128 0x75
	.long	.LASF281
	.byte	0x6
	.uleb128 0x76
	.long	.LASF282
	.byte	0x6
	.uleb128 0x77
	.long	.LASF283
	.byte	0x6
	.uleb128 0x78
	.long	.LASF284
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF285
	.byte	0x5
	.uleb128 0x88
	.long	.LASF286
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF287
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF288
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF289
	.byte	0x5
	.uleb128 0xce
	.long	.LASF290
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF291
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF292
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF293
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF294
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF295
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF296
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF297
	.byte	0x5
	.uleb128 0x101
	.long	.LASF298
	.byte	0x5
	.uleb128 0x105
	.long	.LASF299
	.byte	0x5
	.uleb128 0x109
	.long	.LASF300
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF263
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF290
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF262
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF289
	.byte	0x5
	.uleb128 0x111
	.long	.LASF301
	.byte	0x6
	.uleb128 0x112
	.long	.LASF302
	.byte	0x5
	.uleb128 0x113
	.long	.LASF303
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF304
	.byte	0x5
	.uleb128 0x141
	.long	.LASF305
	.byte	0x5
	.uleb128 0x154
	.long	.LASF306
	.byte	0x6
	.uleb128 0x161
	.long	.LASF307
	.byte	0x5
	.uleb128 0x162
	.long	.LASF308
	.byte	0x5
	.uleb128 0x166
	.long	.LASF309
	.byte	0x5
	.uleb128 0x167
	.long	.LASF310
	.byte	0x5
	.uleb128 0x169
	.long	.LASF311
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF312
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF313
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF314
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF315
	.byte	0x5
	.uleb128 0x37
	.long	.LASF316
	.byte	0x5
	.uleb128 0x38
	.long	.LASF317
	.byte	0x5
	.uleb128 0x39
	.long	.LASF318
	.byte	0x5
	.uleb128 0x52
	.long	.LASF319
	.byte	0x5
	.uleb128 0x53
	.long	.LASF320
	.byte	0x5
	.uleb128 0x58
	.long	.LASF321
	.byte	0x5
	.uleb128 0x59
	.long	.LASF322
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF323
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF324
	.byte	0x5
	.uleb128 0x65
	.long	.LASF325
	.byte	0x5
	.uleb128 0x66
	.long	.LASF326
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF327
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF328
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF329
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF330
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF331
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF332
	.byte	0x5
	.uleb128 0x84
	.long	.LASF333
	.byte	0x5
	.uleb128 0x85
	.long	.LASF334
	.byte	0x5
	.uleb128 0x88
	.long	.LASF335
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF336
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF337
	.byte	0x5
	.uleb128 0x96
	.long	.LASF338
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF339
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF340
	.byte	0x5
	.uleb128 0xba
	.long	.LASF341
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF342
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF343
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF344
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF345
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF346
	.byte	0x5
	.uleb128 0xec
	.long	.LASF347
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF348
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF349
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF350
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF351
	.byte	0x5
	.uleb128 0x114
	.long	.LASF352
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF353
	.byte	0x5
	.uleb128 0x125
	.long	.LASF354
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF355
	.byte	0x5
	.uleb128 0x133
	.long	.LASF356
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF357
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF358
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF359
	.byte	0x5
	.uleb128 0x157
	.long	.LASF360
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF361
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF362
	.byte	0x5
	.uleb128 0x172
	.long	.LASF363
	.byte	0x5
	.uleb128 0x181
	.long	.LASF364
	.byte	0x5
	.uleb128 0x182
	.long	.LASF365
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF366
	.byte	0x5
	.uleb128 0xa
	.long	.LASF367
	.byte	0x5
	.uleb128 0xc
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF369
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF370
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF371
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF372
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF373
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF374
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF375
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF376
	.byte	0x5
	.uleb128 0xb
	.long	.LASF377
	.byte	0x5
	.uleb128 0xc
	.long	.LASF378
	.byte	0x5
	.uleb128 0xd
	.long	.LASF379
	.byte	0x5
	.uleb128 0xe
	.long	.LASF380
	.byte	0x5
	.uleb128 0xf
	.long	.LASF381
	.byte	0x5
	.uleb128 0x10
	.long	.LASF382
	.byte	0x5
	.uleb128 0x11
	.long	.LASF383
	.byte	0x5
	.uleb128 0x12
	.long	.LASF384
	.byte	0x5
	.uleb128 0x13
	.long	.LASF385
	.byte	0x5
	.uleb128 0x14
	.long	.LASF386
	.byte	0x5
	.uleb128 0x15
	.long	.LASF387
	.byte	0x5
	.uleb128 0x16
	.long	.LASF388
	.byte	0x5
	.uleb128 0x17
	.long	.LASF389
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF390
	.byte	0x5
	.uleb128 0x22
	.long	.LASF391
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF392
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF393
	.byte	0x5
	.uleb128 0x34
	.long	.LASF394
	.byte	0x5
	.uleb128 0x78
	.long	.LASF395
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF396
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF397
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF398
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF399
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF400
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF401
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF402
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF403
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF404
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF405
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF406
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF407
	.byte	0x5
	.uleb128 0xad
	.long	.LASF408
	.byte	0x5
	.uleb128 0xae
	.long	.LASF409
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF410
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF411
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF412
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF413
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF414
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF415
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF416
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF417
	.byte	0x5
	.uleb128 0xba
	.long	.LASF418
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF419
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF420
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF421
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF422
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF423
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF424
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF425
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF426
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF427
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF428
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF429
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF430
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF431
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF432
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF433
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF434
	.byte	0x5
	.uleb128 0xec
	.long	.LASF435
	.byte	0x5
	.uleb128 0xee
	.long	.LASF436
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF437
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF438
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF439
	.byte	0x5
	.uleb128 0x100
	.long	.LASF440
	.byte	0x5
	.uleb128 0x101
	.long	.LASF441
	.byte	0x5
	.uleb128 0x105
	.long	.LASF442
	.byte	0x5
	.uleb128 0x111
	.long	.LASF443
	.byte	0x5
	.uleb128 0x112
	.long	.LASF444
	.byte	0x5
	.uleb128 0x116
	.long	.LASF445
	.byte	0x5
	.uleb128 0x117
	.long	.LASF446
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF447
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF448
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF449
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF450
	.byte	0x5
	.uleb128 0x124
	.long	.LASF451
	.byte	0x5
	.uleb128 0x125
	.long	.LASF452
	.byte	0x5
	.uleb128 0x126
	.long	.LASF453
	.byte	0x5
	.uleb128 0x128
	.long	.LASF454
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF455
	.byte	0x5
	.uleb128 0x130
	.long	.LASF456
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.26.4719156f1aea2bb9662fd6c582dc9a4c,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF458
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF459
	.byte	0x5
	.uleb128 0x20
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.2ff233552538c6ff9b8575ca8ea52cb3,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF461
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF462
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF463
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF464
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF465
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF466
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF467
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF468
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF469
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF470
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF471
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF472
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF473
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF474
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF475
	.byte	0x5
	.uleb128 0xca
	.long	.LASF476
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF477
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x191
	.long	.LASF479
	.byte	0x5
	.uleb128 0x196
	.long	.LASF480
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF481
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF483
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF484
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF485
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF486
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF487
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF488
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF489
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF490
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF491
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF492
	.byte	0x5
	.uleb128 0x70
	.long	.LASF493
	.byte	0x5
	.uleb128 0x71
	.long	.LASF494
	.byte	0x5
	.uleb128 0x72
	.long	.LASF495
	.byte	0x5
	.uleb128 0x73
	.long	.LASF496
	.byte	0x5
	.uleb128 0x75
	.long	.LASF497
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF498
	.byte	0x5
	.uleb128 0x22
	.long	.LASF499
	.byte	0x5
	.uleb128 0x23
	.long	.LASF500
	.byte	0x5
	.uleb128 0x26
	.long	.LASF501
	.byte	0x5
	.uleb128 0x27
	.long	.LASF502
	.byte	0x5
	.uleb128 0x28
	.long	.LASF503
	.byte	0x5
	.uleb128 0x29
	.long	.LASF504
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF505
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF506
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF507
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF508
	.byte	0x5
	.uleb128 0x33
	.long	.LASF509
	.byte	0x5
	.uleb128 0x34
	.long	.LASF510
	.byte	0x5
	.uleb128 0x35
	.long	.LASF511
	.byte	0x5
	.uleb128 0x36
	.long	.LASF512
	.byte	0x5
	.uleb128 0x37
	.long	.LASF513
	.byte	0x5
	.uleb128 0x38
	.long	.LASF514
	.byte	0x5
	.uleb128 0x39
	.long	.LASF515
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF516
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF517
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF518
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF519
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF520
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF521
	.byte	0x5
	.uleb128 0x40
	.long	.LASF522
	.byte	0x5
	.uleb128 0x41
	.long	.LASF523
	.byte	0x5
	.uleb128 0x42
	.long	.LASF524
	.byte	0x5
	.uleb128 0x43
	.long	.LASF525
	.byte	0x5
	.uleb128 0x44
	.long	.LASF526
	.byte	0x5
	.uleb128 0x45
	.long	.LASF527
	.byte	0x5
	.uleb128 0x46
	.long	.LASF528
	.byte	0x5
	.uleb128 0x47
	.long	.LASF529
	.byte	0x5
	.uleb128 0x48
	.long	.LASF530
	.byte	0x5
	.uleb128 0x49
	.long	.LASF531
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF532
	.byte	0x5
	.uleb128 0x50
	.long	.LASF533
	.byte	0x5
	.uleb128 0x53
	.long	.LASF534
	.byte	0x5
	.uleb128 0x57
	.long	.LASF535
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.36.2dd12c1fd035242ad5cfd0152a01be5a,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF537
	.byte	0x5
	.uleb128 0x25
	.long	.LASF538
	.byte	0x5
	.uleb128 0x38
	.long	.LASF539
	.byte	0x6
	.uleb128 0x3a
	.long	.LASF540
	.byte	0x5
	.uleb128 0x42
	.long	.LASF541
	.byte	0x6
	.uleb128 0x44
	.long	.LASF542
	.byte	0x5
	.uleb128 0x48
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.5.b0f37d9e474454cf6e459063458db32f,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.long	.LASF545
	.byte	0x5
	.uleb128 0xa
	.long	.LASF459
	.byte	0x5
	.uleb128 0xe
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.04cc7214bceba497b20d15c10fd97511,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x191
	.long	.LASF479
	.byte	0x5
	.uleb128 0x196
	.long	.LASF480
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF481
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.80.eea3eba2d2a17aace9470a8e0d8218dc,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF547
	.byte	0x6
	.uleb128 0x60
	.long	.LASF548
	.byte	0x6
	.uleb128 0x386
	.long	.LASF548
	.byte	0x6
	.uleb128 0x387
	.long	.LASF549
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.46.5187c97b14fd664662cb32e6b94fc49e,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF550
	.byte	0x5
	.uleb128 0x30
	.long	.LASF551
	.byte	0x5
	.uleb128 0x31
	.long	.LASF552
	.byte	0x5
	.uleb128 0x33
	.long	.LASF553
	.byte	0x5
	.uleb128 0x36
	.long	.LASF554
	.byte	0x5
	.uleb128 0x38
	.long	.LASF555
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.33.a775b9ecae273f33bc59931e9891e4ca,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.long	.LASF556
	.byte	0x5
	.uleb128 0x22
	.long	.LASF557
	.byte	0x5
	.uleb128 0x23
	.long	.LASF558
	.byte	0x5
	.uleb128 0x24
	.long	.LASF559
	.byte	0x5
	.uleb128 0x25
	.long	.LASF560
	.byte	0x5
	.uleb128 0x26
	.long	.LASF561
	.byte	0x5
	.uleb128 0x27
	.long	.LASF562
	.byte	0x5
	.uleb128 0x28
	.long	.LASF563
	.byte	0x5
	.uleb128 0x29
	.long	.LASF564
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF565
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF566
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF567
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF568
	.byte	0x5
	.uleb128 0x30
	.long	.LASF569
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF570
	.byte	0x5
	.uleb128 0x27
	.long	.LASF571
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.51.dab170798ec1df48c625aea7c30e1b63,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x33
	.long	.LASF572
	.byte	0x5
	.uleb128 0x34
	.long	.LASF573
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF574
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF575
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF576
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF577
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF578
	.byte	0x5
	.uleb128 0x50
	.long	.LASF579
	.byte	0x5
	.uleb128 0x51
	.long	.LASF580
	.byte	0x5
	.uleb128 0x52
	.long	.LASF581
	.byte	0x5
	.uleb128 0x53
	.long	.LASF582
	.byte	0x5
	.uleb128 0x54
	.long	.LASF583
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF584
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF585
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF586
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF587
	.byte	0x5
	.uleb128 0x60
	.long	.LASF588
	.byte	0x5
	.uleb128 0x61
	.long	.LASF589
	.byte	0x5
	.uleb128 0x62
	.long	.LASF590
	.byte	0x5
	.uleb128 0x63
	.long	.LASF591
	.byte	0x5
	.uleb128 0x64
	.long	.LASF592
	.byte	0x5
	.uleb128 0x65
	.long	.LASF593
	.byte	0x5
	.uleb128 0x66
	.long	.LASF594
	.byte	0x5
	.uleb128 0x67
	.long	.LASF595
	.byte	0x5
	.uleb128 0x68
	.long	.LASF596
	.byte	0x5
	.uleb128 0x69
	.long	.LASF597
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF598
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF599
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF600
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF601
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF602
	.byte	0x5
	.uleb128 0x70
	.long	.LASF603
	.byte	0x5
	.uleb128 0x71
	.long	.LASF604
	.byte	0x5
	.uleb128 0x75
	.long	.LASF605
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF606
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF607
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF608
	.byte	0x5
	.uleb128 0x80
	.long	.LASF609
	.byte	0x5
	.uleb128 0x81
	.long	.LASF610
	.byte	0x5
	.uleb128 0x82
	.long	.LASF611
	.byte	0x5
	.uleb128 0x83
	.long	.LASF612
	.byte	0x5
	.uleb128 0x84
	.long	.LASF613
	.byte	0x5
	.uleb128 0x85
	.long	.LASF614
	.byte	0x5
	.uleb128 0x86
	.long	.LASF615
	.byte	0x5
	.uleb128 0x87
	.long	.LASF616
	.byte	0x5
	.uleb128 0x88
	.long	.LASF617
	.byte	0x5
	.uleb128 0x89
	.long	.LASF618
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF619
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF620
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF621
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF622
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF623
	.byte	0x5
	.uleb128 0x110
	.long	.LASF624
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF625
	.byte	0x5
	.uleb128 0x140
	.long	.LASF626
	.byte	0x5
	.uleb128 0x141
	.long	.LASF627
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF628
	.byte	0x5
	.uleb128 0x190
	.long	.LASF629
	.byte	0x5
	.uleb128 0x193
	.long	.LASF630
	.byte	0x5
	.uleb128 0x197
	.long	.LASF631
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF632
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF633
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF634
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF635
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF636
	.byte	0x5
	.uleb128 0x1c5
	.long	.LASF637
	.byte	0x5
	.uleb128 0x1c6
	.long	.LASF638
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF639
	.byte	0x5
	.uleb128 0x1c8
	.long	.LASF640
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.80.2c0b67e94eb93fd8dd1cc22c150ce71c,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF641
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF642
	.byte	0x5
	.uleb128 0x67
	.long	.LASF643
	.byte	0x5
	.uleb128 0x78
	.long	.LASF644
	.byte	0x5
	.uleb128 0x79
	.long	.LASF645
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF646
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF647
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF648
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF649
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF650
	.byte	0x5
	.uleb128 0x97
	.long	.LASF651
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.23.557290a6cddeba0587f574f29e3a5fb9,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF652
	.byte	0x5
	.uleb128 0x18
	.long	.LASF653
	.byte	0x5
	.uleb128 0x19
	.long	.LASF654
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF655
	.byte	0x6
	.uleb128 0x24
	.long	.LASF656
	.byte	0x5
	.uleb128 0x25
	.long	.LASF657
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.172.df21df34a7396d7da2e08f9b617d582f,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xac
	.long	.LASF658
	.byte	0x5
	.uleb128 0xad
	.long	.LASF659
	.byte	0x5
	.uleb128 0xae
	.long	.LASF660
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF661
	.byte	0x5
	.uleb128 0x249
	.long	.LASF662
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.target.h.27.fb30bee6923ab05d4360685030e3605d,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF663
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF664
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF665
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF666
	.byte	0x5
	.uleb128 0x21
	.long	.LASF667
	.byte	0x5
	.uleb128 0x22
	.long	.LASF668
	.byte	0x5
	.uleb128 0x23
	.long	.LASF669
	.byte	0x5
	.uleb128 0x24
	.long	.LASF670
	.byte	0x5
	.uleb128 0x25
	.long	.LASF671
	.byte	0x5
	.uleb128 0x26
	.long	.LASF672
	.byte	0x5
	.uleb128 0x29
	.long	.LASF673
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF674
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF675
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF676
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF677
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF678
	.byte	0x5
	.uleb128 0x34
	.long	.LASF679
	.byte	0x5
	.uleb128 0x37
	.long	.LASF680
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF681
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF682
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF683
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF684
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF685
	.byte	0x5
	.uleb128 0x40
	.long	.LASF686
	.byte	0x5
	.uleb128 0x42
	.long	.LASF687
	.byte	0x5
	.uleb128 0x43
	.long	.LASF688
	.byte	0x5
	.uleb128 0x44
	.long	.LASF689
	.byte	0x5
	.uleb128 0x45
	.long	.LASF690
	.byte	0x5
	.uleb128 0x47
	.long	.LASF691
	.byte	0x5
	.uleb128 0x48
	.long	.LASF692
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF693
	.byte	0x5
	.uleb128 0x50
	.long	.LASF694
	.byte	0x5
	.uleb128 0x52
	.long	.LASF695
	.byte	0x5
	.uleb128 0x55
	.long	.LASF696
	.byte	0x5
	.uleb128 0x56
	.long	.LASF697
	.byte	0x5
	.uleb128 0x58
	.long	.LASF698
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF699
	.byte	0x5
	.uleb128 0x60
	.long	.LASF700
	.byte	0x5
	.uleb128 0x62
	.long	.LASF701
	.byte	0x5
	.uleb128 0x63
	.long	.LASF702
	.byte	0x5
	.uleb128 0x64
	.long	.LASF703
	.byte	0x5
	.uleb128 0x65
	.long	.LASF704
	.byte	0x5
	.uleb128 0x66
	.long	.LASF705
	.byte	0x5
	.uleb128 0x67
	.long	.LASF706
	.byte	0x5
	.uleb128 0x68
	.long	.LASF707
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF708
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF709
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF710
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF711
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF712
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF713
	.byte	0x5
	.uleb128 0x71
	.long	.LASF714
	.byte	0x5
	.uleb128 0x72
	.long	.LASF715
	.byte	0x5
	.uleb128 0x73
	.long	.LASF716
	.byte	0x5
	.uleb128 0x74
	.long	.LASF717
	.byte	0x5
	.uleb128 0x75
	.long	.LASF718
	.byte	0x5
	.uleb128 0x76
	.long	.LASF719
	.byte	0x5
	.uleb128 0x79
	.long	.LASF720
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF721
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF722
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF723
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF724
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF725
	.byte	0x5
	.uleb128 0x80
	.long	.LASF726
	.byte	0x5
	.uleb128 0x81
	.long	.LASF727
	.byte	0x5
	.uleb128 0x82
	.long	.LASF728
	.byte	0x5
	.uleb128 0x83
	.long	.LASF729
	.byte	0x5
	.uleb128 0x84
	.long	.LASF730
	.byte	0x5
	.uleb128 0x85
	.long	.LASF731
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF732
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF733
	.byte	0x5
	.uleb128 0x90
	.long	.LASF734
	.byte	0x5
	.uleb128 0x91
	.long	.LASF735
	.byte	0x5
	.uleb128 0x92
	.long	.LASF736
	.byte	0x5
	.uleb128 0x93
	.long	.LASF737
	.byte	0x5
	.uleb128 0x95
	.long	.LASF738
	.byte	0x5
	.uleb128 0x97
	.long	.LASF739
	.byte	0x5
	.uleb128 0x98
	.long	.LASF740
	.byte	0x5
	.uleb128 0x99
	.long	.LASF741
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF742
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF743
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF744
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF745
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF746
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF747
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF748
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF749
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF750
	.byte	0x5
	.uleb128 0xad
	.long	.LASF751
	.byte	0x5
	.uleb128 0xae
	.long	.LASF752
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF753
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF754
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF755
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF756
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF757
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF758
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF759
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF760
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF761
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF762
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF763
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF764
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.scheduler.h.22.67b0f3cbb70e9dc5f74939aa0db55023,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.long	.LASF765
	.byte	0x5
	.uleb128 0x17
	.long	.LASF766
	.byte	0x5
	.uleb128 0x18
	.long	.LASF767
	.byte	0x5
	.uleb128 0x23
	.long	.LASF768
	.byte	0x5
	.uleb128 0x57
	.long	.LASF769
	.byte	0x5
	.uleb128 0x59
	.long	.LASF770
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF402:
	.string	"INT32_MAX (2147483647)"
.LASF644:
	.string	"_IOFBF 0"
.LASF236:
	.string	"__linux__ 1"
.LASF497:
	.string	"__STD_TYPE typedef"
.LASF367:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF582:
	.string	"_IOS_NOREPLACE 64"
.LASF406:
	.string	"UINT32_MAX (4294967295U)"
.LASF580:
	.string	"_IOS_TRUNC 16"
.LASF555:
	.string	"_G_BUFSIZ 8192"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF782:
	.string	"sizetype"
.LASF658:
	.string	"stdin stdin"
.LASF652:
	.string	"L_tmpnam 20"
.LASF707:
	.string	"UART1_RX_PINSOURCE GPIO_PinSource7"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF17:
	.string	"__LP64__ 1"
.LASF639:
	.string	"_IO_cleanup_region_start(_fct,_fp) "
.LASF387:
	.string	"__stub_sigreturn "
.LASF275:
	.string	"__USE_XOPEN2K8XSI"
.LASF648:
	.string	"SEEK_SET 0"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF369:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF338:
	.string	"__flexarr []"
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF448:
	.string	"INT16_C(c) c"
.LASF724:
	.string	"I2C2_SCL_PIN GPIO_Pin_9"
.LASF307:
	.string	"__GNU_LIBRARY__"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF573:
	.string	"_IO_va_list __gnuc_va_list"
.LASF560:
	.string	"_IO_off_t __off_t"
.LASF612:
	.string	"_IO_HEX 0100"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF638:
	.string	"_IO_ftrylockfile(_fp) "
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF438:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF745:
	.string	"ADC_CHANNEL_COUNT 1"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF237:
	.string	"linux 1"
.LASF245:
	.string	"EDISON 1"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF349:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF536:
	.string	"__STD_TYPE"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF427:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF319:
	.string	"__P(args) args"
.LASF728:
	.string	"I2C2_SDA_GPIO_AF GPIO_AF_4"
.LASF756:
	.string	"HARDWARE_BIND_PLUG "
.LASF462:
	.string	"__SIZE_T__ "
.LASF569:
	.string	"__need___va_list "
.LASF764:
	.string	"TARGET_BOARD_IDENTIFIER \"EDISON\""
.LASF630:
	.string	"_IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) && __underflow (_fp) == EOF ? EOF : *(unsigned char *) (_fp)->_IO_read_ptr)"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF510:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF579:
	.string	"_IOS_APPEND 8"
.LASF715:
	.string	"UART3_RX_PIN GPIO_Pin_11"
.LASF637:
	.string	"_IO_funlockfile(_fp) "
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF633:
	.string	"_IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF431:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF740:
	.string	"ADC_DMA_CHANNEL DMA2_Channel1"
.LASF452:
	.string	"UINT16_C(c) c"
.LASF487:
	.string	"__SLONGWORD_TYPE long int"
.LASF477:
	.string	"__size_t "
.LASF396:
	.string	"INT8_MIN (-128)"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF494:
	.string	"__ULONG32_TYPE unsigned int"
.LASF594:
	.string	"_IO_LINKED 0x80"
.LASF311:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF731:
	.string	"I2C2_SDA_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF339:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF466:
	.string	"_T_SIZE "
.LASF796:
	.string	"TASK_PRIORITY_HIGH"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF680:
	.string	"USE_MPU_DATA_READY_SIGNAL "
.LASF405:
	.string	"UINT16_MAX (65535)"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF426:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF422:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF278:
	.string	"__USE_FILE_OFFSET64"
.LASF746:
	.string	"ADC_BATTERY ADC_CHANNEL0"
.LASF265:
	.string	"__USE_POSIX"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF479:
	.string	"NULL"
.LASF600:
	.string	"_IO_IS_FILEBUF 0x2000"
.LASF627:
	.string	"_IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))"
.LASF443:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF379:
	.string	"__stub_fchflags "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF823:
	.string	"/home/aravind/git/cleanflight"
.LASF519:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF286:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF808:
	.string	"lastSignaledAt"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF734:
	.string	"MPU6500_CS_GPIO_CLK_PERIPHERAL RCC_AHBPeriph_GPIOA"
.LASF274:
	.string	"__USE_XOPEN2K8"
.LASF464:
	.string	"_SYS_SIZE_T_H "
.LASF677:
	.string	"LED1_PIN_2 Pin_9"
.LASF243:
	.string	"DEBUG 1"
.LASF417:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF309:
	.string	"__GLIBC__ 2"
.LASF774:
	.string	"long int"
.LASF667:
	.string	"LED0_GPIO GPIOB"
.LASF301:
	.string	"__USE_XOPEN2K8 1"
.LASF527:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF587:
	.string	"_IO_USER_BUF 1"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF610:
	.string	"_IO_DEC 020"
.LASF461:
	.string	"__size_t__ "
.LASF688:
	.string	"USE_ACC_MPU6050 "
.LASF238:
	.string	"__unix 1"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF691:
	.string	"ACC_MPU6050_ALIGN CW270_DEG"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF393:
	.string	"__int8_t_defined "
.LASF524:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF657:
	.string	"FOPEN_MAX 16"
.LASF625:
	.string	"_IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF433:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF518:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF517:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF473:
	.string	"_SIZE_T_DECLARED "
.LASF321:
	.string	"__CONCAT(x,y) x ## y"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF328:
	.string	"__END_NAMESPACE_STD "
.LASF726:
	.string	"I2C2_SCL_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF737:
	.string	"MPU6500_SPI_INSTANCE SPI3"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF649:
	.string	"SEEK_CUR 1"
.LASF440:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF785:
	.string	"TEST"
.LASF817:
	.string	"taskQueueArray"
.LASF679:
	.string	"USABLE_TIMER_CHANNEL_COUNT 11"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF632:
	.string	"_IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF446:
	.string	"WINT_MAX (4294967295u)"
.LASF557:
	.string	"_IO_fpos64_t _G_fpos64_t"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF340:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF521:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF736:
	.string	"MPU6500_CS_PIN GPIO_Pin_15"
.LASF504:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF748:
	.string	"DEFAULT FEATURES FEATURE_MOTOR_STOP"
.LASF772:
	.string	"signed char"
.LASF592:
	.string	"_IO_ERR_SEEN 0x20"
.LASF776:
	.string	"uint8_t"
.LASF806:
	.string	"taskAgeCycles"
.LASF484:
	.string	"__U16_TYPE unsigned short int"
.LASF323:
	.string	"__ptr_t void *"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF653:
	.string	"TMP_MAX 238328"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF532:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF499:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF385:
	.string	"__stub_revoke "
.LASF798:
	.string	"TASK_PRIORITY_MAX"
.LASF721:
	.string	"I2C_DEVICE I2CDEV_6"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF515:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF572:
	.string	"_IO_va_list"
.LASF698:
	.string	"USB_IO "
.LASF621:
	.string	"_IO_DONT_CLOSE 0100000"
.LASF812:
	.string	"totalExecutionTime"
.LASF472:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF474:
	.string	"___int_size_t_h "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF289:
	.string	"__USE_ISOC99 1"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF320:
	.string	"__PMT(args) args"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF418:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF595:
	.string	"_IO_IN_BACKUP 0x100"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF809:
	.string	"averageExecutionTime"
.LASF708:
	.string	"UART2_TX_PIN GPIO_Pin_2"
.LASF549:
	.string	"__need_wint_t"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF758:
	.string	"BINDPLUG_PIN Pin_12"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF397:
	.string	"INT16_MIN (-32767-1)"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF799:
	.string	"_Bool"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF363:
	.string	"__restrict_arr __restrict"
.LASF376:
	.string	"__stub___compat_bdflush "
.LASF537:
	.string	"__need_FILE "
.LASF470:
	.string	"_SIZE_T_DEFINED_ "
.LASF742:
	.string	"ADC0_GPIO GPIOA"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF525:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF281:
	.string	"__USE_GNU"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF413:
	.string	"INT_LEAST16_MAX (32767)"
.LASF757:
	.string	"BINDPLUG_PORT GPIOB"
.LASF783:
	.string	"char"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF546:
	.string	"__need_mbstate_t "
.LASF622:
	.string	"_IO_BOOLALPHA 0200000"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF804:
	.string	"staticPriority"
.LASF509:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF716:
	.string	"UART3_GPIO_AF GPIO_AF_7"
.LASF284:
	.string	"__KERNEL_STRICT_NAMES"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF360:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF291:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF591:
	.string	"_IO_EOF_SEEN 0x10"
.LASF220:
	.string	"__x86_64__ 1"
.LASF457:
	.string	"_GCC_WRAP_STDINT_H "
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF310:
	.string	"__GLIBC_MINOR__ 23"
.LASF761:
	.string	"TARGET_IO_PORTC 0xffff"
.LASF272:
	.string	"__USE_XOPEN2K"
.LASF755:
	.string	"ALIENFLIGHT "
.LASF273:
	.string	"__USE_XOPEN2KXSI"
.LASF606:
	.string	"_IO_SKIPWS 01"
.LASF763:
	.string	"TARGET_IO_PORTF (BIT(0)|BIT(1)|BIT(4))"
.LASF358:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF647:
	.string	"BUFSIZ _IO_BUFSIZ"
.LASF298:
	.string	"__USE_POSIX199309 1"
.LASF604:
	.string	"_IO_FLAGS2_NOTCANCEL 2"
.LASF424:
	.string	"INT_FAST8_MAX (127)"
.LASF412:
	.string	"INT_LEAST8_MAX (127)"
.LASF686:
	.string	"GYRO_MPU6500_ALIGN CW270_DEG"
.LASF765:
	.string	"TASK_PERIOD_HZ(hz) (1000000 / (hz))"
.LASF789:
	.string	"TASK_BATTERY"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF453:
	.string	"UINT32_C(c) c ## U"
.LASF432:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF267:
	.string	"__USE_POSIX199309"
.LASF403:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF539:
	.string	"__FILE_defined 1"
.LASF442:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF381:
	.string	"__stub_getmsg "
.LASF797:
	.string	"TASK_PRIORITY_REALTIME"
.LASF435:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF271:
	.string	"__USE_UNIX98"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF285:
	.string	"__KERNEL_STRICT_NAMES "
.LASF762:
	.string	"TARGET_IO_PORTD (BIT(2))"
.LASF503:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF602:
	.string	"_IO_USER_LOCK 0x8000"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF722:
	.string	"I2C2_SCL_GPIO GPIOA"
.LASF488:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF219:
	.string	"__x86_64 1"
.LASF641:
	.string	"_VA_LIST_DEFINED "
.LASF362:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF459:
	.string	"__need_size_t "
.LASF654:
	.string	"FILENAME_MAX 4096"
.LASF420:
	.string	"INT_FAST8_MIN (-128)"
.LASF611:
	.string	"_IO_OCT 040"
.LASF676:
	.string	"LED1_GPIO_2 GPIOB"
.LASF386:
	.string	"__stub_setlogin "
.LASF613:
	.string	"_IO_SHOWBASE 0200"
.LASF534:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF553:
	.string	"_G_IO_IO_FILE_VERSION 0x20001"
.LASF571:
	.string	"__GNUC_VA_LIST "
.LASF255:
	.string	"bool _Bool"
.LASF701:
	.string	"USE_UART1_TX_DMA "
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF513:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF561:
	.string	"_IO_off64_t __off64_t"
.LASF429:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF543:
	.string	"_STDIO_USES_IOSTREAM "
.LASF684:
	.string	"USE_GYRO_SPI_MPU6500 "
.LASF538:
	.string	"__need___FILE "
.LASF705:
	.string	"UART1_GPIO_AF GPIO_AF_7"
.LASF547:
	.string	"____mbstate_t_defined 1"
.LASF492:
	.string	"__UWORD_TYPE unsigned long int"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF692:
	.string	"ACC_MPU6500_ALIGN CW270_DEG"
.LASF430:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF791:
	.string	"TASK_COMPASS"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF480:
	.string	"NULL ((void *)0)"
.LASF690:
	.string	"USE_ACC_SPI_MPU6500 "
.LASF361:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF666:
	.string	"HW_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF299:
	.string	"__USE_POSIX199506 1"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF410:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF302:
	.string	"_ATFILE_SOURCE"
.LASF493:
	.string	"__SLONG32_TYPE int"
.LASF563:
	.string	"_IO_uid_t __uid_t"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF607:
	.string	"_IO_LEFT 02"
.LASF514:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF590:
	.string	"_IO_NO_WRITES 8"
.LASF368:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF693:
	.string	"MAG "
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF545:
	.string	"_G_config_h 1"
.LASF608:
	.string	"_IO_RIGHT 04"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF578:
	.string	"_IOS_ATEND 4"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF436:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF516:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF663:
	.string	"__IO volatile"
.LASF383:
	.string	"__stub_lchmod "
.LASF482:
	.string	"_BITS_TYPES_H 1"
.LASF404:
	.string	"UINT8_MAX (255)"
.LASF441:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF315:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF292:
	.string	"_POSIX_SOURCE"
.LASF750:
	.string	"GTUNE "
.LASF290:
	.string	"__USE_ISOC95 1"
.LASF819:
	.string	"taskCount"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF465:
	.string	"_T_SIZE_ "
.LASF717:
	.string	"UART3_GPIO GPIOB"
.LASF562:
	.string	"_IO_pid_t __pid_t"
.LASF550:
	.string	"_G_va_list __gnuc_va_list"
.LASF329:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF226:
	.string	"__k8__ 1"
.LASF16:
	.string	"_LP64 1"
.LASF694:
	.string	"USE_MAG_AK8963 "
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF316:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF460:
	.string	"__need_NULL "
.LASF260:
	.string	"_FEATURES_H 1"
.LASF288:
	.string	"_DEFAULT_SOURCE 1"
.LASF445:
	.string	"WINT_MIN (0u)"
.LASF314:
	.string	"__LEAF , __leaf__"
.LASF392:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF348:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF671:
	.string	"LED1_PIN Pin_5"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF498:
	.string	"_BITS_TYPESIZES_H 1"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF792:
	.string	"TASK_COUNT"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF700:
	.string	"SERIAL_PORT_COUNT 2"
.LASF720:
	.string	"USE_I2C "
.LASF616:
	.string	"_IO_SHOWPOS 02000"
.LASF623:
	.string	"_IO_file_flags _flags"
.LASF620:
	.string	"_IO_STDIO 040000"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF380:
	.string	"__stub_fdetach "
.LASF568:
	.string	"_IO_wint_t wint_t"
.LASF661:
	.string	"getc(_fp) _IO_getc (_fp)"
.LASF280:
	.string	"__USE_ATFILE"
.LASF229:
	.string	"__SSE__ 1"
.LASF558:
	.string	"_IO_size_t size_t"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF533:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF371:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF266:
	.string	"__USE_POSIX2"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF668:
	.string	"LED0_PIN Pin_4"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF478:
	.string	"__need_size_t"
.LASF468:
	.string	"_SIZE_T_ "
.LASF596:
	.string	"_IO_LINE_BUF 0x200"
.LASF813:
	.string	"cfTask_t"
.LASF807:
	.string	"lastExecutedAt"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF481:
	.string	"__need_NULL"
.LASF218:
	.string	"__amd64__ 1"
.LASF665:
	.string	"HW_PIN Pin_2"
.LASF259:
	.string	"_STDINT_H 1"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF605:
	.string	"_IO_FLAGS2_USER_WBUF 8"
.LASF353:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF486:
	.string	"__U32_TYPE unsigned int"
.LASF784:
	.string	"TASK_SYSTEM"
.LASF805:
	.string	"dynamicPriority"
.LASF351:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF685:
	.string	"GYRO_MPU6050_ALIGN CW270_DEG"
.LASF313:
	.string	"__PMT"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF599:
	.string	"_IO_IS_APPENDING 0x1000"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF520:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF423:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF303:
	.string	"_ATFILE_SOURCE 1"
.LASF489:
	.string	"__SQUAD_TYPE long int"
.LASF655:
	.string	"L_ctermid 9"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF581:
	.string	"_IOS_NOCREATE 32"
.LASF794:
	.string	"TASK_PRIORITY_LOW"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF283:
	.string	"__USE_FORTIFY_LEVEL"
.LASF575:
	.string	"EOF (-1)"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF803:
	.string	"desiredPeriod"
.LASF225:
	.string	"__k8 1"
.LASF400:
	.string	"INT8_MAX (127)"
.LASF820:
	.string	"cfTasks"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF780:
	.string	"unsigned int"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF384:
	.string	"__stub_putmsg "
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF523:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF669:
	.string	"LED0_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF695:
	.string	"MAG_AK8963_ALIGN CW0_DEG_FLIP"
.LASF279:
	.string	"__USE_MISC"
.LASF276:
	.string	"__USE_LARGEFILE"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF254:
	.string	"_STDBOOL_H "
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF673:
	.string	"LED0_GPIO_2 GPIOB"
.LASF300:
	.string	"__USE_XOPEN2K 1"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF662:
	.string	"putc(_ch,_fp) _IO_putc (_ch, _fp)"
.LASF526:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF631:
	.string	"_IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end, 0) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF261:
	.string	"__USE_ISOC11"
.LASF345:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF670:
	.string	"LED1_GPIO GPIOB"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF760:
	.string	"TARGET_IO_PORTB 0xffff"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF628:
	.string	"_IO_BE(expr,res) __builtin_expect ((expr), res)"
.LASF365:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF382:
	.string	"__stub_gtty "
.LASF0:
	.string	"__STDC__ 1"
.LASF415:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF408:
	.string	"INT_LEAST8_MIN (-128)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF500:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF355:
	.string	"__wur "
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF735:
	.string	"MPU6500_CS_GPIO GPIOA"
.LASF615:
	.string	"_IO_UPPERCASE 01000"
.LASF754:
	.string	"BIND_PIN Pin_3"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF447:
	.string	"INT8_C(c) c"
.LASF256:
	.string	"true 1"
.LASF801:
	.string	"checkFunc"
.LASF660:
	.string	"stderr stderr"
.LASF308:
	.string	"__GNU_LIBRARY__ 6"
.LASF502:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF687:
	.string	"ACC "
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF741:
	.string	"ADC_AHB_PERIPHERAL RCC_AHBPeriph_DMA2"
.LASF511:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF317:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF370:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF683:
	.string	"USE_GYRO_MPU6500 "
.LASF322:
	.string	"__STRING(x) #x"
.LASF775:
	.string	"unsigned char"
.LASF786:
	.string	"TASK_GYROPID"
.LASF714:
	.string	"UART3_TX_PIN GPIO_Pin_10"
.LASF723:
	.string	"I2C2_SCL_GPIO_AF GPIO_AF_4"
.LASF747:
	.string	"DEFAULT_RX_FEATURE FEATURE_RX_SERIAL"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF810:
	.string	"taskLatestDeltaTime"
.LASF824:
	.string	"print"
.LASF327:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF373:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF318:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF375:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF463:
	.string	"_SIZE_T "
.LASF589:
	.string	"_IO_NO_READS 4"
.LASF394:
	.string	"__uint32_t_defined "
.LASF664:
	.string	"HW_GPIO GPIOB"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF541:
	.string	"____FILE_defined 1"
.LASF342:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF588:
	.string	"_IO_UNBUFFERED 2"
.LASF564:
	.string	"_IO_iconv_t _G_iconv_t"
.LASF407:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF565:
	.string	"_IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF778:
	.string	"short unsigned int"
.LASF574:
	.string	"_IO_UNIFIED_JUMPTABLES 1"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF467:
	.string	"__SIZE_T "
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF681:
	.string	"GYRO "
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF530:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF263:
	.string	"__USE_ISOC95"
.LASF609:
	.string	"_IO_INTERNAL 010"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF262:
	.string	"__USE_ISOC99"
.LASF332:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF270:
	.string	"__USE_XOPEN_EXTENDED"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF356:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF325:
	.string	"__BEGIN_DECLS "
.LASF770:
	.string	"isSystemOverloaded() (averageSystemLoadPercent >= LOAD_PERCENTAGE_ONE)"
.LASF419:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF689:
	.string	"USE_ACC_MPU6500 "
.LASF458:
	.string	"_STDIO_H 1"
.LASF743:
	.string	"ADC0_GPIO_PIN GPIO_Pin_4"
.LASF818:
	.string	"taskQueueArraySize"
.LASF753:
	.string	"BIND_PORT GPIOA"
.LASF395:
	.string	"__intptr_t_defined "
.LASF535:
	.string	"__FD_SETSIZE 1024"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF508:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF727:
	.string	"I2C2_SDA_GPIO GPIOA"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF529:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF822:
	.string	"src/main/fc/fc_tasks.c"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF678:
	.string	"LED1_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF264:
	.string	"__USE_ISOCXX11"
.LASF703:
	.string	"UART1_RX_PIN 2"
.LASF471:
	.string	"_SIZE_T_DEFINED "
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF643:
	.string	"__ssize_t_defined "
.LASF777:
	.string	"uint16_t"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF730:
	.string	"I2C2_SDA_PIN_SOURCE GPIO_PinSource10"
.LASF706:
	.string	"UART1_TX_PINSOURCE GPIO_PinSource6"
.LASF781:
	.string	"long unsigned int"
.LASF788:
	.string	"TASK_SERIAL"
.LASF295:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF548:
	.string	"__need_mbstate_t"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF672:
	.string	"LED1_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF635:
	.string	"_IO_peekc(_fp) _IO_peekc_unlocked (_fp)"
.LASF268:
	.string	"__USE_POSIX199506"
.LASF449:
	.string	"INT32_C(c) c"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF454:
	.string	"UINT64_C(c) c ## UL"
.LASF744:
	.string	"ADC0_CHANNEL ADC_Channel_1"
.LASF793:
	.string	"TASK_PRIORITY_IDLE"
.LASF231:
	.string	"__FXSR__ 1"
.LASF674:
	.string	"LED0_PIN_2 Pin_8"
.LASF593:
	.string	"_IO_DELETE_DONT_CLOSE 0x40"
.LASF366:
	.string	"__WORDSIZE 64"
.LASF640:
	.string	"_IO_cleanup_region_end(_Doit) "
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF389:
	.string	"__stub_stty "
.LASF227:
	.string	"__code_model_small__ 1"
.LASF428:
	.string	"UINT_FAST8_MAX (255)"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF336:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF814:
	.string	"U_ID_0"
.LASF815:
	.string	"U_ID_1"
.LASF816:
	.string	"U_ID_2"
.LASF469:
	.string	"_BSD_SIZE_T_ "
.LASF334:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF768:
	.string	"TASK_SELF -1"
.LASF269:
	.string	"__USE_XOPEN"
.LASF456:
	.string	"UINTMAX_C(c) c ## UL"
.LASF603:
	.string	"_IO_FLAGS2_MMAP 1"
.LASF795:
	.string	"TASK_PRIORITY_MEDIUM"
.LASF556:
	.string	"_IO_fpos_t _G_fpos_t"
.LASF330:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF485:
	.string	"__S32_TYPE int"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF618:
	.string	"_IO_FIXED 010000"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF444:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF732:
	.string	"USE_SPI "
.LASF346:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF390:
	.string	"_BITS_WCHAR_H 1"
.LASF241:
	.string	"__ELF__ 1"
.LASF769:
	.string	"LOAD_PERCENTAGE_ONE 100"
.LASF305:
	.string	"__USE_ATFILE 1"
.LASF739:
	.string	"ADC_INSTANCE ADC2"
.LASF738:
	.string	"USE_ADC "
.LASF598:
	.string	"_IO_CURRENTLY_PUTTING 0x800"
.LASF646:
	.string	"_IONBF 2"
.LASF642:
	.string	"__off_t_defined "
.LASF601:
	.string	"_IO_BAD_SEEN 0x4000"
.LASF585:
	.string	"_OLD_STDIO_MAGIC 0xFABC0000"
.LASF651:
	.string	"P_tmpdir \"/tmp\""
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF787:
	.string	"TASK_ACCEL"
.LASF719:
	.string	"UART3_RX_PINSOURCE GPIO_PinSource11"
.LASF729:
	.string	"I2C2_SDA_PIN GPIO_Pin_10"
.LASF377:
	.string	"__stub_chflags "
.LASF476:
	.string	"_SIZET_ "
.LASF821:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF528:
	.string	"__TIMER_T_TYPE void *"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF749:
	.string	"SERIAL_RX "
.LASF230:
	.string	"__SSE2__ 1"
.LASF522:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF374:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF359:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF416:
	.string	"UINT_LEAST8_MAX (255)"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF352:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF552:
	.string	"_G_HAVE_MREMAP 1"
.LASF326:
	.string	"__END_DECLS "
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF656:
	.string	"FOPEN_MAX"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF331:
	.string	"__END_NAMESPACE_C99 "
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF773:
	.string	"short int"
.LASF312:
	.string	"_SYS_CDEFS_H 1"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF725:
	.string	"I2C2_SCL_PIN_SOURCE GPIO_PinSource9"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF343:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF713:
	.string	"UART2_RX_PINSOURCE GPIO_PinSource3"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF752:
	.string	"USE_CLI "
.LASF712:
	.string	"UART2_TX_PINSOURCE GPIO_PinSource2"
.LASF490:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF341:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF576:
	.string	"_IOS_INPUT 1"
.LASF507:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF378:
	.string	"__stub_fattach "
.LASF583:
	.string	"_IOS_BIN 128"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF344:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF491:
	.string	"__SWORD_TYPE long int"
.LASF636:
	.string	"_IO_flockfile(_fp) "
.LASF347:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF659:
	.string	"stdout stdout"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF350:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF411:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF645:
	.string	"_IOLBF 1"
.LASF296:
	.string	"__USE_POSIX 1"
.LASF437:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF434:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF496:
	.string	"__U64_TYPE unsigned long int"
.LASF675:
	.string	"LED0_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF554:
	.string	"_G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)"
.LASF257:
	.string	"false 0"
.LASF483:
	.string	"__S16_TYPE short int"
.LASF619:
	.string	"_IO_UNITBUF 020000"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF354:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF617:
	.string	"_IO_SCIENTIFIC 04000"
.LASF357:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF586:
	.string	"_IO_MAGIC_MASK 0xFFFF0000"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF629:
	.string	"_IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF699:
	.string	"USE_VCP "
.LASF544:
	.string	"_IO_STDIO_H "
.LASF733:
	.string	"USE_SPI_DEVICE_3 "
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF626:
	.string	"_IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))"
.LASF372:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF559:
	.string	"_IO_ssize_t __ssize_t"
.LASF704:
	.string	"UART1_GPIO GPIOB"
.LASF512:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF228:
	.string	"__MMX__ 1"
.LASF399:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF767:
	.string	"TASK_PERIOD_US(us) (us)"
.LASF551:
	.string	"_G_HAVE_MMAP 1"
.LASF287:
	.string	"_DEFAULT_SOURCE"
.LASF614:
	.string	"_IO_SHOWPOINT 0400"
.LASF475:
	.string	"_GCC_SIZE_T "
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF414:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF779:
	.string	"uint32_t"
.LASF542:
	.string	"__need___FILE"
.LASF501:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF409:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF709:
	.string	"UART2_RX_PIN GPIO_Pin_3"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF421:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF800:
	.string	"taskName"
.LASF333:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF217:
	.string	"__amd64 1"
.LASF293:
	.string	"_POSIX_SOURCE 1"
.LASF297:
	.string	"__USE_POSIX2 1"
.LASF239:
	.string	"__unix__ 1"
.LASF584:
	.string	"_IO_MAGIC 0xFBAD0000"
.LASF335:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF401:
	.string	"INT16_MAX (32767)"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF505:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF540:
	.string	"__need_FILE"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF506:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF597:
	.string	"_IO_TIED_PUT_GET 0x400"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF324:
	.string	"__long_double_t long double"
.LASF650:
	.string	"SEEK_END 2"
.LASF682:
	.string	"USE_GYRO_MPU6050 "
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF711:
	.string	"UART2_GPIO_AF GPIO_AF_7"
.LASF240:
	.string	"unix 1"
.LASF802:
	.string	"taskFunc"
.LASF751:
	.string	"USE_QUAD_MIXER_ONLY "
.LASF451:
	.string	"UINT8_C(c) c"
.LASF425:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF634:
	.string	"_IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr - (_fp)->_IO_write_base)"
.LASF306:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF495:
	.string	"__S64_TYPE long int"
.LASF304:
	.string	"__USE_MISC 1"
.LASF258:
	.string	"__bool_true_false_are_defined 1"
.LASF531:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF696:
	.string	"LED0 "
.LASF391:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF570:
	.string	"__need___va_list"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF388:
	.string	"__stub_sstk "
.LASF282:
	.string	"__USE_REENTRANT"
.LASF759:
	.string	"TARGET_IO_PORTA 0xffff"
.LASF337:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF766:
	.string	"TASK_PERIOD_MS(ms) ((ms) * 1000)"
.LASF398:
	.string	"INT32_MIN (-2147483647-1)"
.LASF566:
	.string	"_IO_BUFSIZ _G_BUFSIZ"
.LASF811:
	.string	"maxExecutionTime"
.LASF718:
	.string	"UART3_TX_PINSOURCE GPIO_PinSource10"
.LASF771:
	.string	"TASK_QUEUE_ARRAY_SIZE (TASK_COUNT + 1)"
.LASF277:
	.string	"__USE_LARGEFILE64"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF450:
	.string	"INT64_C(c) c ## L"
.LASF790:
	.string	"TASK_RX"
.LASF697:
	.string	"LED1 "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF235:
	.string	"__linux 1"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF702:
	.string	"UART1_TX_PIN 1"
.LASF439:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF577:
	.string	"_IOS_OUTPUT 2"
.LASF294:
	.string	"_POSIX_C_SOURCE"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF455:
	.string	"INTMAX_C(c) c ## L"
.LASF364:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF710:
	.string	"UART2_GPIO GPIOA"
.LASF624:
	.string	"__HAVE_COLUMN "
.LASF567:
	.string	"_IO_va_list _G_va_list"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
