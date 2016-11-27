	.file	"cleanflight_fc.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed cleanflight_fc.i -mtune=generic
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
	.comm	U_ID_0,4,4
	.comm	U_ID_1,4,4
	.comm	U_ID_2,4,4
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.globl	cycleTime
	.section	.bss.cycleTime,"aw",@nobits
	.align 2
	.type	cycleTime, @object
	.size	cycleTime, 2
cycleTime:
	.zero	2
	.comm	dT,4,4
	.comm	magHold,2,2
	.comm	headFreeModeHold,2,2
	.globl	motorControlEnable
	.section	.bss.motorControlEnable,"aw",@nobits
	.type	motorControlEnable, @object
	.size	motorControlEnable, 1
motorControlEnable:
	.zero	1
	.comm	telemTemperature1,2,2
	.section	.bss.disarmAt,"aw",@nobits
	.align 4
	.type	disarmAt, @object
	.size	disarmAt, 4
disarmAt:
	.zero	4
	.section	.bss.isRXDataNew,"aw",@nobits
	.type	isRXDataNew, @object
	.size	isRXDataNew, 1
isRXDataNew:
	.zero	1
	.comm	filteredCycleTime,2,2
	.globl	i
	.section	.bss.i,"aw",@nobits
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.section	.text.taskHandleSerial,"ax",@progbits
	.globl	taskHandleSerial
	.type	taskHandleSerial, @function
taskHandleSerial:
.LFB8:
	.file 1 "src/main/fc/cleanflight_fc.c"
	.loc 1 138 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 139 0
	movl	i(%rip), %eax	# i, D.4450
	addl	$1, %eax	#, D.4450
	movl	%eax, i(%rip)	# D.4450, i
	.loc 1 150 0
	movl	$0, %eax	#,
	call	mspSerialProcess	#
	.loc 1 151 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	taskHandleSerial, .-taskHandleSerial
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 3 "/usr/include/stdint.h"
	.file 4 "./src/main/config/parameter_group.h"
	.file 5 "./src/main/target/edison/target.h"
	.file 6 "./src/main/common/color.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x307
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF42
	.byte	0xc
	.long	.LASF43
	.long	.LASF44
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
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
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF11
	.byte	0x2
	.byte	0xc3
	.long	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x30
	.long	0x3e
	.uleb128 0x5
	.long	.LASF13
	.byte	0x3
	.byte	0x31
	.long	0x45
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0x33
	.long	0x37
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF15
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF16
	.uleb128 0x6
	.byte	0x4
	.long	0x37
	.byte	0x6
	.byte	0x15
	.long	0xd8
	.uleb128 0x7
	.long	.LASF17
	.byte	0
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.uleb128 0x7
	.long	.LASF19
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x8a
	.uleb128 0x5
	.long	.LASF20
	.byte	0x4
	.byte	0x15
	.long	0x95
	.uleb128 0x5
	.long	.LASF21
	.byte	0x4
	.byte	0x26
	.long	0xf4
	.uleb128 0x9
	.long	0x104
	.uleb128 0xa
	.long	0x68
	.uleb128 0xa
	.long	0x30
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.byte	0x2d
	.long	0x122
	.uleb128 0xc
	.string	"ptr"
	.byte	0x4
	.byte	0x2e
	.long	0x68
	.uleb128 0xc
	.string	"fn"
	.byte	0x4
	.byte	0x2f
	.long	0x122
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xe9
	.uleb128 0xd
	.long	.LASF45
	.byte	0x20
	.byte	0x4
	.byte	0x28
	.long	0x171
	.uleb128 0xe
	.string	"pgn"
	.byte	0x4
	.byte	0x29
	.long	0xde
	.byte	0
	.uleb128 0xf
	.long	.LASF22
	.byte	0x4
	.byte	0x2a
	.long	0x95
	.byte	0x2
	.uleb128 0xf
	.long	.LASF23
	.byte	0x4
	.byte	0x2b
	.long	0xd8
	.byte	0x8
	.uleb128 0xe
	.string	"ptr"
	.byte	0x4
	.byte	0x2c
	.long	0x171
	.byte	0x10
	.uleb128 0xf
	.long	.LASF24
	.byte	0x4
	.byte	0x30
	.long	0x104
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xd8
	.uleb128 0x5
	.long	.LASF25
	.byte	0x4
	.byte	0x31
	.long	0x128
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF26
	.uleb128 0x10
	.long	.LASF46
	.byte	0x1
	.byte	0x89
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.long	.LASF27
	.byte	0x1
	.byte	0x7c
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	disarmAt
	.uleb128 0x11
	.long	.LASF28
	.byte	0x1
	.byte	0x82
	.long	0x182
	.uleb128 0x9
	.byte	0x3
	.quad	isRXDataNew
	.uleb128 0x12
	.long	.LASF29
	.byte	0x5
	.byte	0xc8
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x12
	.long	.LASF30
	.byte	0x5
	.byte	0xc9
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x12
	.long	.LASF31
	.byte	0x5
	.byte	0xca
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x12
	.long	.LASF32
	.byte	0x4
	.byte	0x43
	.long	0x220
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x8
	.byte	0x8
	.long	0x177
	.uleb128 0x12
	.long	.LASF33
	.byte	0x4
	.byte	0x44
	.long	0x220
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x12
	.long	.LASF34
	.byte	0x4
	.byte	0x47
	.long	0xd8
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x12
	.long	.LASF35
	.byte	0x4
	.byte	0x48
	.long	0xd8
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x12
	.long	.LASF36
	.byte	0x1
	.byte	0x72
	.long	0x95
	.uleb128 0x9
	.byte	0x3
	.quad	cycleTime
	.uleb128 0x13
	.string	"dT"
	.byte	0x1
	.byte	0x74
	.long	0xab
	.uleb128 0x9
	.byte	0x3
	.quad	dT
	.uleb128 0x12
	.long	.LASF37
	.byte	0x1
	.byte	0x76
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	magHold
	.uleb128 0x12
	.long	.LASF38
	.byte	0x1
	.byte	0x77
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	headFreeModeHold
	.uleb128 0x12
	.long	.LASF39
	.byte	0x1
	.byte	0x79
	.long	0x8a
	.uleb128 0x9
	.byte	0x3
	.quad	motorControlEnable
	.uleb128 0x12
	.long	.LASF40
	.byte	0x1
	.byte	0x7b
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	telemTemperature1
	.uleb128 0x12
	.long	.LASF41
	.byte	0x1
	.byte	0x84
	.long	0x95
	.uleb128 0x9
	.byte	0x3
	.quad	filteredCycleTime
	.uleb128 0x13
	.string	"i"
	.byte	0x1
	.byte	0x85
	.long	0x30
	.uleb128 0x9
	.byte	0x3
	.quad	i
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
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
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB8
	.quad	.LFE8
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"long long int"
.LASF27:
	.string	"disarmAt"
.LASF37:
	.string	"magHold"
.LASF41:
	.string	"filteredCycleTime"
.LASF3:
	.string	"short unsigned int"
.LASF32:
	.string	"__pg_registry_start"
.LASF19:
	.string	"RGB_BLUE"
.LASF24:
	.string	"reset"
.LASF39:
	.string	"motorControlEnable"
.LASF33:
	.string	"__pg_registry_end"
.LASF20:
	.string	"pgn_t"
.LASF46:
	.string	"taskHandleSerial"
.LASF15:
	.string	"float"
.LASF30:
	.string	"U_ID_1"
.LASF36:
	.string	"cycleTime"
.LASF22:
	.string	"size"
.LASF0:
	.string	"long unsigned int"
.LASF42:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF44:
	.string	"/home/aravind/git/cleanflight"
.LASF2:
	.string	"unsigned char"
.LASF45:
	.string	"pgRegistry_s"
.LASF25:
	.string	"pgRegistry_t"
.LASF16:
	.string	"double"
.LASF40:
	.string	"telemTemperature1"
.LASF38:
	.string	"headFreeModeHold"
.LASF1:
	.string	"unsigned int"
.LASF23:
	.string	"address"
.LASF17:
	.string	"RGB_RED"
.LASF12:
	.string	"uint8_t"
.LASF11:
	.string	"int16_t"
.LASF43:
	.string	"src/main/fc/cleanflight_fc.c"
.LASF18:
	.string	"RGB_GREEN"
.LASF7:
	.string	"sizetype"
.LASF29:
	.string	"U_ID_0"
.LASF35:
	.string	"__pg_resetdata_end"
.LASF31:
	.string	"U_ID_2"
.LASF8:
	.string	"char"
.LASF21:
	.string	"pgResetFunc"
.LASF5:
	.string	"short int"
.LASF13:
	.string	"uint16_t"
.LASF14:
	.string	"uint32_t"
.LASF6:
	.string	"long int"
.LASF34:
	.string	"__pg_resetdata_start"
.LASF4:
	.string	"signed char"
.LASF26:
	.string	"_Bool"
.LASF10:
	.string	"long long unsigned int"
.LASF28:
	.string	"isRXDataNew"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
