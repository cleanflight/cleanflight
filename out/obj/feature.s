	.file	"feature.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed feature.i -mtune=generic -march=x86-64 -g
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
	.section	.text.featureConfig,"ax",@progbits
	.type	featureConfig, @function
featureConfig:
.LFB4:
	.file 1 "./src/main/config/feature.h"
	.loc 1 24 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 24 0
	movl	$featureConfig_System, %eax	#, D.2457
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	featureConfig, .-featureConfig
	.section	.bss.activeFeaturesLatch,"aw",@nobits
	.align 4
	.type	activeFeaturesLatch, @object
	.size	activeFeaturesLatch, 4
activeFeaturesLatch:
	.zero	4
	.globl	featureConfig_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	featureConfig_Registry, @object
	.size	featureConfig_Registry, 32
featureConfig_Registry:
# pgn:
	.value	19
# size:
	.value	4
# address:
	.zero	4
	.quad	featureConfig_System
# ptr:
	.quad	0
# reset:
# ptr:
	.quad	0
	.section	.text.latchActiveFeatures,"ax",@progbits
	.globl	latchActiveFeatures
	.type	latchActiveFeatures, @function
latchActiveFeatures:
.LFB5:
	.file 2 "src/main/config/feature.c"
	.loc 2 35 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 36 0
	call	featureConfig	#
	movl	(%rax), %eax	# _3->enabledFeatures, D.2459
	movl	%eax, activeFeaturesLatch(%rip)	# D.2459, activeFeaturesLatch
	.loc 2 37 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	latchActiveFeatures, .-latchActiveFeatures
	.section	.text.featureConfigured,"ax",@progbits
	.globl	featureConfigured
	.type	featureConfigured, @function
featureConfigured:
.LFB6:
	.loc 2 40 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$8, %rsp	#,
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 2 41 0
	call	featureConfig	#
	movl	(%rax), %eax	# _3->enabledFeatures, D.2461
	andl	-4(%rbp), %eax	# mask, D.2461
	testl	%eax, %eax	# D.2461
	setne	%al	#, D.2462
	.loc 2 42 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	featureConfigured, .-featureConfigured
	.section	.text.feature,"ax",@progbits
	.globl	feature
	.type	feature, @function
feature:
.LFB7:
	.loc 2 45 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 2 46 0
	movl	activeFeaturesLatch(%rip), %eax	# activeFeaturesLatch, D.2463
	andl	-4(%rbp), %eax	# mask, D.2463
	testl	%eax, %eax	# D.2463
	setne	%al	#, D.2464
	.loc 2 47 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	feature, .-feature
	.section	.text.featureSet,"ax",@progbits
	.globl	featureSet
	.type	featureSet, @function
featureSet:
.LFB8:
	.loc 2 50 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$8, %rsp	#,
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 2 51 0
	call	featureConfig	#
	movl	(%rax), %edx	# _3->enabledFeatures, D.2466
	orl	-4(%rbp), %edx	# mask, D.2466
	movl	%edx, (%rax)	# D.2466, _3->enabledFeatures
	.loc 2 52 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	featureSet, .-featureSet
	.section	.text.featureClear,"ax",@progbits
	.globl	featureClear
	.type	featureClear, @function
featureClear:
.LFB9:
	.loc 2 55 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$8, %rsp	#,
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 2 56 0
	call	featureConfig	#
	movl	(%rax), %edx	# _3->enabledFeatures, D.2468
	movl	-4(%rbp), %ecx	# mask, tmp91
	notl	%ecx	# D.2468
	andl	%ecx, %edx	# D.2468, D.2468
	movl	%edx, (%rax)	# D.2468, _3->enabledFeatures
	.loc 2 57 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	featureClear, .-featureClear
	.section	.text.featureClearAll,"ax",@progbits
	.globl	featureClearAll
	.type	featureClearAll, @function
featureClearAll:
.LFB10:
	.loc 2 60 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 61 0
	call	featureConfig	#
	movl	$0, (%rax)	#, _3->enabledFeatures
	.loc 2 62 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	featureClearAll, .-featureClearAll
	.section	.text.featureMask,"ax",@progbits
	.globl	featureMask
	.type	featureMask, @function
featureMask:
.LFB11:
	.loc 2 65 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 66 0
	call	featureConfig	#
	movl	(%rax), %eax	# _3->enabledFeatures, D.2471
	.loc 2 67 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	featureMask, .-featureMask
	.text
.Letext0:
	.file 3 "/usr/include/stdint.h"
	.file 4 "./src/main/config/parameter_group.h"
	.file 5 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x39a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF44
	.byte	0xc
	.long	.LASF45
	.long	.LASF46
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
	.byte	0x3
	.byte	0x30
	.long	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x3
	.byte	0x31
	.long	0x62
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x3
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
	.uleb128 0x4
	.long	.LASF10
	.byte	0x4
	.byte	0x15
	.long	0x57
	.uleb128 0x5
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0x1d
	.long	0xbc
	.uleb128 0x6
	.long	.LASF11
	.value	0xfff
	.uleb128 0x6
	.long	.LASF12
	.value	0xf000
	.uleb128 0x6
	.long	.LASF13
	.value	0xfff
	.uleb128 0x7
	.long	.LASF14
	.byte	0
	.uleb128 0x6
	.long	.LASF15
	.value	0x8000
	.byte	0
	.uleb128 0x4
	.long	.LASF16
	.byte	0x4
	.byte	0x26
	.long	0xc7
	.uleb128 0x8
	.long	0xd7
	.uleb128 0x9
	.long	0xd7
	.uleb128 0x9
	.long	0x37
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.byte	0x2d
	.long	0xf7
	.uleb128 0xc
	.string	"ptr"
	.byte	0x4
	.byte	0x2e
	.long	0xd7
	.uleb128 0xc
	.string	"fn"
	.byte	0x4
	.byte	0x2f
	.long	0xf7
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0xbc
	.uleb128 0xe
	.long	.LASF21
	.byte	0x20
	.byte	0x4
	.byte	0x28
	.long	0x146
	.uleb128 0xf
	.string	"pgn"
	.byte	0x4
	.byte	0x29
	.long	0x82
	.byte	0
	.uleb128 0x10
	.long	.LASF17
	.byte	0x4
	.byte	0x2a
	.long	0x57
	.byte	0x2
	.uleb128 0x10
	.long	.LASF18
	.byte	0x4
	.byte	0x2b
	.long	0x146
	.byte	0x8
	.uleb128 0xf
	.string	"ptr"
	.byte	0x4
	.byte	0x2c
	.long	0x14c
	.byte	0x10
	.uleb128 0x10
	.long	.LASF19
	.byte	0x4
	.byte	0x30
	.long	0xd9
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x45
	.uleb128 0xd
	.byte	0x8
	.long	0x146
	.uleb128 0x4
	.long	.LASF20
	.byte	0x4
	.byte	0x31
	.long	0xfd
	.uleb128 0xe
	.long	.LASF22
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.long	0x176
	.uleb128 0x10
	.long	.LASF23
	.byte	0x1
	.byte	0x15
	.long	0x69
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x1
	.byte	0x16
	.long	0x15d
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF25
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF26
	.uleb128 0x11
	.long	.LASF47
	.byte	0x1
	.byte	0x18
	.long	0x1ac
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.byte	0x8
	.long	0x176
	.uleb128 0x12
	.long	.LASF33
	.byte	0x2
	.byte	0x22
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.long	.LASF28
	.byte	0x2
	.byte	0x27
	.long	0x1fb
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x1fb
	.uleb128 0x14
	.long	.LASF30
	.byte	0x2
	.byte	0x27
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF27
	.uleb128 0x15
	.long	.LASF29
	.byte	0x2
	.byte	0x2c
	.long	0x1fb
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x232
	.uleb128 0x14
	.long	.LASF30
	.byte	0x2
	.byte	0x2c
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.long	.LASF31
	.byte	0x2
	.byte	0x31
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x25e
	.uleb128 0x14
	.long	.LASF30
	.byte	0x2
	.byte	0x31
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.long	.LASF32
	.byte	0x2
	.byte	0x36
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x28a
	.uleb128 0x14
	.long	.LASF30
	.byte	0x2
	.byte	0x36
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.long	.LASF34
	.byte	0x2
	.byte	0x3b
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	.LASF48
	.byte	0x2
	.byte	0x40
	.long	0x69
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF49
	.byte	0x2
	.byte	0x1e
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	activeFeaturesLatch
	.uleb128 0x19
	.long	.LASF35
	.byte	0x5
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x19
	.long	.LASF36
	.byte	0x5
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x19
	.long	.LASF37
	.byte	0x5
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x19
	.long	.LASF38
	.byte	0x4
	.byte	0x43
	.long	0x329
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xd
	.byte	0x8
	.long	0x152
	.uleb128 0x19
	.long	.LASF39
	.byte	0x4
	.byte	0x44
	.long	0x329
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x19
	.long	.LASF40
	.byte	0x4
	.byte	0x47
	.long	0x146
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x19
	.long	.LASF41
	.byte	0x4
	.byte	0x48
	.long	0x146
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x19
	.long	.LASF42
	.byte	0x2
	.byte	0x20
	.long	0x176
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x19
	.long	.LASF43
	.byte	0x2
	.byte	0x20
	.long	0x398
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_Registry
	.uleb128 0x1a
	.long	0x152
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
	.uleb128 0x5
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x16
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB4
	.quad	.LFE4
	.quad	.LFB5
	.quad	.LFE5
	.quad	.LFB6
	.quad	.LFE6
	.quad	.LFB7
	.quad	.LFE7
	.quad	.LFB8
	.quad	.LFE8
	.quad	.LFB9
	.quad	.LFE9
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB11
	.quad	.LFE11
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF42:
	.string	"featureConfig_System"
.LASF19:
	.string	"reset"
.LASF48:
	.string	"featureMask"
.LASF6:
	.string	"short unsigned int"
.LASF38:
	.string	"__pg_registry_start"
.LASF22:
	.string	"featureConfig_s"
.LASF24:
	.string	"featureConfig_t"
.LASF39:
	.string	"__pg_registry_end"
.LASF10:
	.string	"pgn_t"
.LASF15:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF45:
	.string	"src/main/config/feature.c"
.LASF36:
	.string	"U_ID_1"
.LASF33:
	.string	"latchActiveFeatures"
.LASF37:
	.string	"U_ID_2"
.LASF17:
	.string	"size"
.LASF47:
	.string	"featureConfig"
.LASF9:
	.string	"long unsigned int"
.LASF13:
	.string	"PGR_SIZE_MASK"
.LASF28:
	.string	"featureConfigured"
.LASF44:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF46:
	.string	"/home/aravind/git/cleanflight"
.LASF3:
	.string	"unsigned char"
.LASF14:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF34:
	.string	"featureClearAll"
.LASF21:
	.string	"pgRegistry_s"
.LASF11:
	.string	"PGR_PGN_MASK"
.LASF20:
	.string	"pgRegistry_t"
.LASF8:
	.string	"unsigned int"
.LASF43:
	.string	"featureConfig_Registry"
.LASF18:
	.string	"address"
.LASF26:
	.string	"char"
.LASF4:
	.string	"uint8_t"
.LASF12:
	.string	"PGR_PGN_VERSION_MASK"
.LASF25:
	.string	"sizetype"
.LASF35:
	.string	"U_ID_0"
.LASF41:
	.string	"__pg_resetdata_end"
.LASF16:
	.string	"pgResetFunc"
.LASF30:
	.string	"mask"
.LASF23:
	.string	"enabledFeatures"
.LASF49:
	.string	"activeFeaturesLatch"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF29:
	.string	"feature"
.LASF40:
	.string	"__pg_resetdata_start"
.LASF0:
	.string	"signed char"
.LASF31:
	.string	"featureSet"
.LASF32:
	.string	"featureClear"
.LASF27:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
