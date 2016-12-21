	.file	"fc_tasks.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed fc_tasks.i -mtune=generic -march=x86-64
# -g -std=gnu99 -ffunction-sections -fdata-sections -fverbose-asm
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
	.globl	cfTasks
	.section	.rodata
.LC0:
	.string	"SYSTEM"
.LC1:
	.string	"SERIAL"
.LC2:
	.string	"COMPASS"
.LC3:
	.string	"ACCEL"
.LC4:
	.string	"GYRO/PID"
	.section	.data.cfTasks,"aw",@progbits
	.align 32
	.type	cfTasks, @object
	.size	cfTasks, 512
cfTasks:
# taskName:
	.quad	.LC0
# taskFunc:
	.zero	8
	.quad	taskSystem
# desiredPeriod:
	.long	100000
# staticPriority:
	.byte	6
	.zero	35
# taskName:
	.quad	.LC1
# taskFunc:
	.zero	8
	.quad	taskHandleSerial
# desiredPeriod:
	.long	10000
# staticPriority:
	.byte	1
	.zero	35
# taskName:
	.quad	.LC2
# taskFunc:
	.zero	8
	.quad	taskUpdateCompass
# desiredPeriod:
	.long	100000
# staticPriority:
	.byte	3
	.zero	35
	.zero	64
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
	.quad	taskMainPidLoopChecker
# desiredPeriod:
	.long	1000
# staticPriority:
	.byte	6
	.zero	35
	.zero	128
	.text
.Letext0:
	.file 1 "/usr/include/stdint.h"
	.file 2 "./src/main/fc/fc_tasks.h"
	.file 3 "./src/main/scheduler/scheduler.h"
	.file 4 "./src/main/target/edison/target.h"
	.file 5 "src/main/fc/fc_tasks.c"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x296
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF49
	.byte	0xc
	.long	.LASF50
	.long	.LASF51
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
	.byte	0x1
	.byte	0x30
	.long	0x44
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x1
	.byte	0x31
	.long	0x56
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x1
	.byte	0x33
	.long	0x68
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x5
	.byte	0x8
	.long	0x8a
	.uleb128 0x6
	.long	0x7d
	.uleb128 0x7
	.byte	0x4
	.long	0x68
	.byte	0x2
	.byte	0x17
	.long	0xd2
	.uleb128 0x8
	.long	.LASF12
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.byte	0x1
	.uleb128 0x8
	.long	.LASF14
	.byte	0x2
	.uleb128 0x8
	.long	.LASF15
	.byte	0x3
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.uleb128 0x8
	.long	.LASF19
	.byte	0x7
	.uleb128 0x8
	.long	.LASF20
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x68
	.byte	0x3
	.byte	0x1a
	.long	0x103
	.uleb128 0x8
	.long	.LASF21
	.byte	0
	.uleb128 0x8
	.long	.LASF22
	.byte	0x1
	.uleb128 0x8
	.long	.LASF23
	.byte	0x3
	.uleb128 0x8
	.long	.LASF24
	.byte	0x5
	.uleb128 0x8
	.long	.LASF25
	.byte	0x6
	.uleb128 0x8
	.long	.LASF26
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF27
	.uleb128 0x9
	.byte	0x40
	.byte	0x3
	.byte	0x30
	.long	0x1af
	.uleb128 0xa
	.long	.LASF28
	.byte	0x3
	.byte	0x32
	.long	0x84
	.byte	0
	.uleb128 0xa
	.long	.LASF29
	.byte	0x3
	.byte	0x33
	.long	0x1be
	.byte	0x8
	.uleb128 0xa
	.long	.LASF30
	.byte	0x3
	.byte	0x34
	.long	0x1c5
	.byte	0x10
	.uleb128 0xa
	.long	.LASF31
	.byte	0x3
	.byte	0x35
	.long	0x5d
	.byte	0x18
	.uleb128 0xa
	.long	.LASF32
	.byte	0x3
	.byte	0x36
	.long	0x1cb
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF33
	.byte	0x3
	.byte	0x39
	.long	0x4b
	.byte	0x1e
	.uleb128 0xa
	.long	.LASF34
	.byte	0x3
	.byte	0x3a
	.long	0x4b
	.byte	0x20
	.uleb128 0xa
	.long	.LASF35
	.byte	0x3
	.byte	0x3b
	.long	0x5d
	.byte	0x24
	.uleb128 0xa
	.long	.LASF36
	.byte	0x3
	.byte	0x3c
	.long	0x5d
	.byte	0x28
	.uleb128 0xa
	.long	.LASF37
	.byte	0x3
	.byte	0x3f
	.long	0x5d
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF38
	.byte	0x3
	.byte	0x40
	.long	0x5d
	.byte	0x30
	.uleb128 0xa
	.long	.LASF39
	.byte	0x3
	.byte	0x42
	.long	0x5d
	.byte	0x34
	.uleb128 0xa
	.long	.LASF40
	.byte	0x3
	.byte	0x43
	.long	0x5d
	.byte	0x38
	.byte	0
	.uleb128 0xb
	.long	0x103
	.long	0x1be
	.uleb128 0xc
	.long	0x5d
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x1af
	.uleb128 0xd
	.uleb128 0x5
	.byte	0x8
	.long	0x1c4
	.uleb128 0x6
	.long	0x39
	.uleb128 0x4
	.long	.LASF41
	.byte	0x3
	.byte	0x45
	.long	0x10a
	.uleb128 0xe
	.long	.LASF42
	.byte	0x4
	.byte	0xc8
	.long	0x5d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0xe
	.long	.LASF43
	.byte	0x4
	.byte	0xc9
	.long	0x5d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0xe
	.long	.LASF44
	.byte	0x4
	.byte	0xca
	.long	0x5d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0xf
	.long	0x22a
	.long	0x22a
	.uleb128 0x10
	.long	0x76
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x1d0
	.uleb128 0xe
	.long	.LASF45
	.byte	0x5
	.byte	0x24
	.long	0x21a
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueueArray
	.uleb128 0xe
	.long	.LASF46
	.byte	0x5
	.byte	0x22
	.long	0x25a
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueueArraySize
	.uleb128 0x6
	.long	0x5d
	.uleb128 0xe
	.long	.LASF47
	.byte	0x5
	.byte	0x23
	.long	0x25a
	.uleb128 0x9
	.byte	0x3
	.quad	taskCount
	.uleb128 0xf
	.long	0x1d0
	.long	0x284
	.uleb128 0x10
	.long	0x76
	.byte	0x7
	.byte	0
	.uleb128 0xe
	.long	.LASF48
	.byte	0x5
	.byte	0x29
	.long	0x274
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
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF31:
	.string	"desiredPeriod"
.LASF21:
	.string	"TASK_PRIORITY_IDLE"
.LASF29:
	.string	"checkFunc"
.LASF27:
	.string	"_Bool"
.LASF28:
	.string	"taskName"
.LASF32:
	.string	"staticPriority"
.LASF12:
	.string	"TASK_SYSTEM"
.LASF3:
	.string	"unsigned char"
.LASF19:
	.string	"TASK_RX"
.LASF25:
	.string	"TASK_PRIORITY_REALTIME"
.LASF9:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF16:
	.string	"TASK_ACCEL"
.LASF49:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF40:
	.string	"totalExecutionTime"
.LASF51:
	.string	"/home/aravind/git/cleanflight"
.LASF20:
	.string	"TASK_COUNT"
.LASF13:
	.string	"TASK_SERIAL"
.LASF48:
	.string	"cfTasks"
.LASF33:
	.string	"dynamicPriority"
.LASF46:
	.string	"taskQueueArraySize"
.LASF8:
	.string	"unsigned int"
.LASF41:
	.string	"cfTask_t"
.LASF11:
	.string	"char"
.LASF4:
	.string	"uint8_t"
.LASF18:
	.string	"TASK_BATTERY"
.LASF36:
	.string	"lastSignaledAt"
.LASF30:
	.string	"taskFunc"
.LASF15:
	.string	"TEST"
.LASF47:
	.string	"taskCount"
.LASF10:
	.string	"sizetype"
.LASF14:
	.string	"TASK_COMPASS"
.LASF42:
	.string	"U_ID_0"
.LASF43:
	.string	"U_ID_1"
.LASF44:
	.string	"U_ID_2"
.LASF26:
	.string	"TASK_PRIORITY_MAX"
.LASF38:
	.string	"taskLatestDeltaTime"
.LASF22:
	.string	"TASK_PRIORITY_LOW"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF50:
	.string	"src/main/fc/fc_tasks.c"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF39:
	.string	"maxExecutionTime"
.LASF23:
	.string	"TASK_PRIORITY_MEDIUM"
.LASF45:
	.string	"taskQueueArray"
.LASF0:
	.string	"signed char"
.LASF24:
	.string	"TASK_PRIORITY_HIGH"
.LASF17:
	.string	"TASK_GYROPID"
.LASF37:
	.string	"averageExecutionTime"
.LASF34:
	.string	"taskAgeCycles"
.LASF35:
	.string	"lastExecutedAt"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
