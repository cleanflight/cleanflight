	.file	"gyro_sync.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed gyro_sync.i -mtune=generic -march=x86-64
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
	.comm	targetLooptime,4,4
	.section	.bss.mpuDividerDrops,"aw",@nobits
	.type	mpuDividerDrops, @object
	.size	mpuDividerDrops, 1
mpuDividerDrops:
	.zero	1
	.section	.text.gyroSyncCheckUpdate,"ax",@progbits
	.globl	gyroSyncCheckUpdate
	.type	gyroSyncCheckUpdate, @function
gyroSyncCheckUpdate:
.LFB2:
	.file 1 "src/main/drivers/gyro_sync.c"
	.loc 1 37 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 38 0
	movq	gyro+24(%rip), %rax	# gyro.isDataReady, D.2596
	testq	%rax, %rax	# D.2596
	je	.L2	#,
	.loc 1 38 0 is_stmt 0 discriminator 1
	movq	gyro+24(%rip), %rax	# gyro.isDataReady, D.2596
	call	*%rax	# D.2596
	testb	%al, %al	# D.2597
	je	.L2	#,
	.loc 1 38 0 discriminator 3
	movl	$1, %eax	#, D.2595
	jmp	.L3	#
.L2:
	.loc 1 38 0 discriminator 4
	movl	$0, %eax	#, D.2595
.L3:
	.loc 1 38 0 discriminator 6
	andl	$1, %eax	#, D.2597
	.loc 1 39 0 is_stmt 1 discriminator 6
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	gyroSyncCheckUpdate, .-gyroSyncCheckUpdate
	.section	.text.gyroSetSampleRate,"ax",@progbits
	.globl	gyroSetSampleRate
	.type	gyroSetSampleRate, @function
gyroSetSampleRate:
.LFB3:
	.loc 1 42 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# looptime, looptime
	movl	%ecx, %eax	# gyroSyncDenominator, tmp93
	movb	%sil, -24(%rbp)	# tmp91, lpf
	movb	%dl, -28(%rbp)	# tmp92, gyroSync
	movb	%al, -32(%rbp)	# tmp93, gyroSyncDenominator
	.loc 1 43 0
	cmpb	$0, -28(%rbp)	#, gyroSync
	je	.L6	#,
.LBB2:
	.loc 1 45 0
	cmpb	$0, -24(%rbp)	#, lpf
	jne	.L7	#,
	.loc 1 46 0
	movl	$125, -4(%rbp)	#, gyroSamplePeriod
	jmp	.L8	#
.L7:
	.loc 1 48 0
	movl	$1000, -4(%rbp)	#, gyroSamplePeriod
.L8:
	.loc 1 50 0
	movzbl	-32(%rbp), %eax	# gyroSyncDenominator, tmp94
	subl	$1, %eax	#, D.2598
	movb	%al, mpuDividerDrops(%rip)	# D.2598, mpuDividerDrops
	.loc 1 51 0
	movzbl	-32(%rbp), %eax	# gyroSyncDenominator, D.2599
	imull	-4(%rbp), %eax	# gyroSamplePeriod, D.2599
	movl	%eax, targetLooptime(%rip)	# D.2600, targetLooptime
.LBE2:
	.loc 1 56 0
	jmp	.L10	#
.L6:
	.loc 1 53 0
	movb	$0, mpuDividerDrops(%rip)	#, mpuDividerDrops
	.loc 1 54 0
	movl	-20(%rbp), %eax	# looptime, tmp95
	movl	%eax, targetLooptime(%rip)	# tmp95, targetLooptime
.L10:
	.loc 1 56 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	gyroSetSampleRate, .-gyroSetSampleRate
	.section	.text.gyroMPU6xxxCalculateDivider,"ax",@progbits
	.globl	gyroMPU6xxxCalculateDivider
	.type	gyroMPU6xxxCalculateDivider, @function
gyroMPU6xxxCalculateDivider:
.LFB4:
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 60 0
	movzbl	mpuDividerDrops(%rip), %eax	# mpuDividerDrops, D.2601
	.loc 1 61 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	gyroMPU6xxxCalculateDivider, .-gyroMPU6xxxCalculateDivider
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/drivers/sensor.h"
	.file 4 "./src/main/drivers/accgyro.h"
	.file 5 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x279
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF37
	.byte	0xc
	.long	.LASF38
	.long	.LASF39
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x3
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
	.byte	0x4
	.byte	0x4
	.long	.LASF14
	.uleb128 0x5
	.byte	0x8
	.long	0xab
	.uleb128 0x6
	.long	0xb0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF15
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0x15
	.long	0xc2
	.uleb128 0x5
	.byte	0x8
	.long	0xc8
	.uleb128 0x7
	.long	0xb0
	.long	0xd7
	.uleb128 0x8
	.long	0xd7
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x30
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0x19
	.long	0xe8
	.uleb128 0x5
	.byte	0x8
	.long	0xee
	.uleb128 0x9
	.long	0xf9
	.uleb128 0x8
	.long	0x50
	.byte	0
	.uleb128 0x3
	.long	.LASF18
	.byte	0x3
	.byte	0x1a
	.long	0xa5
	.uleb128 0xa
	.long	.LASF40
	.byte	0x28
	.byte	0x4
	.byte	0x1e
	.long	0x14d
	.uleb128 0xb
	.long	.LASF19
	.byte	0x4
	.byte	0x1f
	.long	0xdd
	.byte	0
	.uleb128 0xb
	.long	.LASF20
	.byte	0x4
	.byte	0x20
	.long	0xb7
	.byte	0x8
	.uleb128 0xb
	.long	.LASF21
	.byte	0x4
	.byte	0x21
	.long	0xb7
	.byte	0x10
	.uleb128 0xb
	.long	.LASF22
	.byte	0x4
	.byte	0x22
	.long	0xf9
	.byte	0x18
	.uleb128 0xb
	.long	.LASF23
	.byte	0x4
	.byte	0x23
	.long	0x9e
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	.LASF24
	.byte	0x4
	.byte	0x24
	.long	0x104
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.byte	0x24
	.long	0xb0
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.long	.LASF41
	.byte	0x1
	.byte	0x29
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1eb
	.uleb128 0xe
	.long	.LASF25
	.byte	0x1
	.byte	0x29
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xf
	.string	"lpf"
	.byte	0x1
	.byte	0x29
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.long	.LASF26
	.byte	0x1
	.byte	0x29
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xe
	.long	.LASF27
	.byte	0x1
	.byte	0x29
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x10
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x11
	.long	.LASF30
	.byte	0x1
	.byte	0x2c
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF29
	.byte	0x1
	.byte	0x3a
	.long	0x50
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.long	.LASF31
	.byte	0x1
	.byte	0x22
	.long	0x50
	.uleb128 0x9
	.byte	0x3
	.quad	mpuDividerDrops
	.uleb128 0x13
	.long	.LASF32
	.byte	0x5
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x13
	.long	.LASF33
	.byte	0x5
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x13
	.long	.LASF34
	.byte	0x5
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x13
	.long	.LASF35
	.byte	0x1
	.byte	0x21
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	targetLooptime
	.uleb128 0x14
	.long	.LASF36
	.byte	0x1
	.byte	0x1f
	.long	0x14d
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
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"_Bool"
.LASF14:
	.string	"float"
.LASF41:
	.string	"gyroSetSampleRate"
.LASF28:
	.string	"gyroSyncCheckUpdate"
.LASF26:
	.string	"gyroSync"
.LASF19:
	.string	"init"
.LASF17:
	.string	"sensorGyroInitFuncPtr"
.LASF23:
	.string	"scale"
.LASF21:
	.string	"temperature"
.LASF36:
	.string	"gyro"
.LASF5:
	.string	"unsigned char"
.LASF9:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF16:
	.string	"sensorReadFuncPtr"
.LASF37:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF39:
	.string	"/home/aravind/git/cleanflight"
.LASF29:
	.string	"gyroMPU6xxxCalculateDivider"
.LASF20:
	.string	"read"
.LASF31:
	.string	"mpuDividerDrops"
.LASF8:
	.string	"unsigned int"
.LASF13:
	.string	"long long unsigned int"
.LASF4:
	.string	"uint8_t"
.LASF25:
	.string	"looptime"
.LASF3:
	.string	"int16_t"
.LASF30:
	.string	"gyroSamplePeriod"
.LASF22:
	.string	"isDataReady"
.LASF35:
	.string	"targetLooptime"
.LASF10:
	.string	"sizetype"
.LASF12:
	.string	"long long int"
.LASF33:
	.string	"U_ID_1"
.LASF34:
	.string	"U_ID_2"
.LASF11:
	.string	"char"
.LASF38:
	.string	"src/main/drivers/gyro_sync.c"
.LASF1:
	.string	"short int"
.LASF32:
	.string	"U_ID_0"
.LASF18:
	.string	"sensorIsDataReadyFuncPtr"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF27:
	.string	"gyroSyncDenominator"
.LASF0:
	.string	"signed char"
.LASF40:
	.string	"gyro_s"
.LASF24:
	.string	"gyro_t"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
