	.file	"compass_sparkfun.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed compass_sparkfun.i -mtune=generic
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
	.section	.text.sparkfun_init,"ax",@progbits
	.globl	sparkfun_init
	.type	sparkfun_init, @function
sparkfun_init:
.LFB10:
	.file 1 "src/main/drivers/compass_sparkfun.c"
	.loc 1 70 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 97 0
	movl	$1, %eax	#, D.6015
	.loc 1 98 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	sparkfun_init, .-sparkfun_init
	.section	.text.sparkfun_read,"ax",@progbits
	.globl	sparkfun_read
	.type	sparkfun_read, @function
sparkfun_read:
.LFB11:
	.loc 1 106 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# magData, magData
	.loc 1 108 0
	movq	imu(%rip), %rax	# imu, D.6016
	movq	%rax, %rdi	# D.6016,
	call	readMag	#
	.loc 1 110 0
	movq	imu(%rip), %rax	# imu, D.6016
	movzwl	12(%rax), %edx	# _4->mx, D.6017
	movq	-8(%rbp), %rax	# magData, tmp98
	movw	%dx, (%rax)	# D.6017, *magData_6(D)
	.loc 1 111 0
	movq	-8(%rbp), %rax	# magData, tmp99
	leaq	2(%rax), %rdx	#, D.6018
	movq	imu(%rip), %rax	# imu, D.6016
	movzwl	14(%rax), %eax	# _9->my, D.6017
	movw	%ax, (%rdx)	# D.6017, *_8
	.loc 1 112 0
	movq	-8(%rbp), %rax	# magData, tmp100
	leaq	4(%rax), %rdx	#, D.6018
	movq	imu(%rip), %rax	# imu, D.6016
	movzwl	16(%rax), %eax	# _13->mz, D.6017
	movw	%ax, (%rdx)	# D.6017, *_12
	.loc 1 146 0
	movl	$1, %eax	#, D.6019
	.loc 1 147 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	sparkfun_read, .-sparkfun_read
	.section	.text.sparkfun_compass_Detect,"ax",@progbits
	.globl	sparkfun_compass_Detect
	.type	sparkfun_compass_Detect, @function
sparkfun_compass_Detect:
.LFB12:
	.loc 1 151 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# mag, mag
	.loc 1 152 0
	movq	-8(%rbp), %rax	# mag, tmp89
	movq	$sparkfun_init, (%rax)	#, mag_2(D)->init
	.loc 1 153 0
	movq	-8(%rbp), %rax	# mag, tmp90
	movq	$sparkfun_read, 8(%rax)	#, mag_2(D)->read
	.loc 1 154 0
	movl	$1, %eax	#, D.6020
	.loc 1 155 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	sparkfun_compass_Detect, .-sparkfun_compass_Detect
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/config/parameter_group.h"
	.file 4 "src/main/drivers/sensor.h"
	.file 5 "src/main/drivers/drivers_compass.h"
	.file 6 "/usr/include/mraa/i2c.h"
	.file 7 "./src/main/drivers/SFE_LSM9DS0.h"
	.file 8 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x498
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF67
	.byte	0xc
	.long	.LASF68
	.long	.LASF69
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
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF14
	.uleb128 0x3
	.long	.LASF15
	.byte	0x3
	.byte	0x15
	.long	0x62
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0x26
	.long	0xbf
	.uleb128 0x5
	.long	0xcf
	.uleb128 0x6
	.long	0xcf
	.uleb128 0x6
	.long	0x42
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.uleb128 0x8
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.long	0xef
	.uleb128 0x9
	.string	"ptr"
	.byte	0x3
	.byte	0x2e
	.long	0xcf
	.uleb128 0x9
	.string	"fn"
	.byte	0x3
	.byte	0x2f
	.long	0xef
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0xb4
	.uleb128 0xb
	.long	.LASF26
	.byte	0x20
	.byte	0x3
	.byte	0x28
	.long	0x13e
	.uleb128 0xc
	.string	"pgn"
	.byte	0x3
	.byte	0x29
	.long	0xa9
	.byte	0
	.uleb128 0xd
	.long	.LASF17
	.byte	0x3
	.byte	0x2a
	.long	0x62
	.byte	0x2
	.uleb128 0xd
	.long	.LASF18
	.byte	0x3
	.byte	0x2b
	.long	0x13e
	.byte	0x8
	.uleb128 0xc
	.string	"ptr"
	.byte	0x3
	.byte	0x2c
	.long	0x144
	.byte	0x10
	.uleb128 0xd
	.long	.LASF19
	.byte	0x3
	.byte	0x30
	.long	0xd1
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x50
	.uleb128 0xa
	.byte	0x8
	.long	0x13e
	.uleb128 0x3
	.long	.LASF20
	.byte	0x3
	.byte	0x31
	.long	0xf5
	.uleb128 0x3
	.long	.LASF21
	.byte	0x4
	.byte	0x14
	.long	0x160
	.uleb128 0xa
	.byte	0x8
	.long	0x166
	.uleb128 0xe
	.long	0x16b
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF22
	.uleb128 0x3
	.long	.LASF23
	.byte	0x4
	.byte	0x15
	.long	0x17d
	.uleb128 0xa
	.byte	0x8
	.long	0x183
	.uleb128 0xf
	.long	0x16b
	.long	0x192
	.uleb128 0x6
	.long	0x192
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x30
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF24
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF25
	.uleb128 0xb
	.long	.LASF27
	.byte	0x10
	.byte	0x5
	.byte	0x15
	.long	0x1cb
	.uleb128 0xd
	.long	.LASF28
	.byte	0x5
	.byte	0x16
	.long	0x155
	.byte	0
	.uleb128 0xd
	.long	.LASF29
	.byte	0x5
	.byte	0x17
	.long	0x172
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF30
	.byte	0x5
	.byte	0x18
	.long	0x1a6
	.uleb128 0x3
	.long	.LASF31
	.byte	0x6
	.byte	0x35
	.long	0x1e1
	.uleb128 0xa
	.byte	0x8
	.long	0x1e7
	.uleb128 0x10
	.long	.LASF70
	.uleb128 0x11
	.long	.LASF35
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x81
	.long	0x20f
	.uleb128 0x12
	.long	.LASF32
	.byte	0
	.uleb128 0x12
	.long	.LASF33
	.byte	0x1
	.uleb128 0x12
	.long	.LASF34
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF35
	.byte	0x7
	.byte	0x86
	.long	0x1ec
	.uleb128 0x11
	.long	.LASF36
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x89
	.long	0x249
	.uleb128 0x12
	.long	.LASF37
	.byte	0
	.uleb128 0x12
	.long	.LASF38
	.byte	0x1
	.uleb128 0x12
	.long	.LASF39
	.byte	0x2
	.uleb128 0x12
	.long	.LASF40
	.byte	0x3
	.uleb128 0x12
	.long	.LASF41
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF36
	.byte	0x7
	.byte	0x90
	.long	0x21a
	.uleb128 0x11
	.long	.LASF42
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x93
	.long	0x27d
	.uleb128 0x12
	.long	.LASF43
	.byte	0
	.uleb128 0x12
	.long	.LASF44
	.byte	0x1
	.uleb128 0x12
	.long	.LASF45
	.byte	0x2
	.uleb128 0x12
	.long	.LASF46
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF42
	.byte	0x7
	.byte	0x99
	.long	0x254
	.uleb128 0xb
	.long	.LASF47
	.byte	0x40
	.byte	0x7
	.byte	0xdc
	.long	0x363
	.uleb128 0xc
	.string	"gx"
	.byte	0x7
	.byte	0xe2
	.long	0x30
	.byte	0
	.uleb128 0xc
	.string	"gy"
	.byte	0x7
	.byte	0xe2
	.long	0x30
	.byte	0x2
	.uleb128 0xc
	.string	"gz"
	.byte	0x7
	.byte	0xe2
	.long	0x30
	.byte	0x4
	.uleb128 0xc
	.string	"ax"
	.byte	0x7
	.byte	0xe3
	.long	0x30
	.byte	0x6
	.uleb128 0xc
	.string	"ay"
	.byte	0x7
	.byte	0xe3
	.long	0x30
	.byte	0x8
	.uleb128 0xc
	.string	"az"
	.byte	0x7
	.byte	0xe3
	.long	0x30
	.byte	0xa
	.uleb128 0xc
	.string	"mx"
	.byte	0x7
	.byte	0xe4
	.long	0x30
	.byte	0xc
	.uleb128 0xc
	.string	"my"
	.byte	0x7
	.byte	0xe4
	.long	0x30
	.byte	0xe
	.uleb128 0xc
	.string	"mz"
	.byte	0x7
	.byte	0xe4
	.long	0x30
	.byte	0x10
	.uleb128 0xd
	.long	.LASF48
	.byte	0x7
	.byte	0xe5
	.long	0x30
	.byte	0x12
	.uleb128 0xd
	.long	.LASF49
	.byte	0x7
	.byte	0xe7
	.long	0x1d6
	.byte	0x18
	.uleb128 0xc
	.string	"xm"
	.byte	0x7
	.byte	0xe8
	.long	0x1d6
	.byte	0x20
	.uleb128 0xd
	.long	.LASF50
	.byte	0x7
	.byte	0xec
	.long	0x20f
	.byte	0x28
	.uleb128 0xd
	.long	.LASF51
	.byte	0x7
	.byte	0xed
	.long	0x249
	.byte	0x2c
	.uleb128 0xd
	.long	.LASF52
	.byte	0x7
	.byte	0xee
	.long	0x27d
	.byte	0x30
	.uleb128 0xd
	.long	.LASF53
	.byte	0x7
	.byte	0xf3
	.long	0x8d
	.byte	0x34
	.uleb128 0xd
	.long	.LASF54
	.byte	0x7
	.byte	0xf3
	.long	0x8d
	.byte	0x38
	.uleb128 0xd
	.long	.LASF55
	.byte	0x7
	.byte	0xf3
	.long	0x8d
	.byte	0x3c
	.byte	0
	.uleb128 0x3
	.long	.LASF56
	.byte	0x7
	.byte	0xf5
	.long	0x288
	.uleb128 0x13
	.long	.LASF71
	.byte	0x1
	.byte	0x45
	.long	0x16b
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF57
	.byte	0x1
	.byte	0x69
	.long	0x16b
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x3bb
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x69
	.long	0x192
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF58
	.byte	0x1
	.byte	0x96
	.long	0x16b
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x3eb
	.uleb128 0x17
	.string	"mag"
	.byte	0x1
	.byte	0x96
	.long	0x3eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x1cb
	.uleb128 0x18
	.long	.LASF60
	.byte	0x8
	.byte	0xc8
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x18
	.long	.LASF61
	.byte	0x8
	.byte	0xc9
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x18
	.long	.LASF62
	.byte	0x8
	.byte	0xca
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x18
	.long	.LASF63
	.byte	0x3
	.byte	0x43
	.long	0x445
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xa
	.byte	0x8
	.long	0x14a
	.uleb128 0x18
	.long	.LASF64
	.byte	0x3
	.byte	0x44
	.long	0x445
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x18
	.long	.LASF65
	.byte	0x3
	.byte	0x47
	.long	0x13e
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x18
	.long	.LASF66
	.byte	0x3
	.byte	0x48
	.long	0x13e
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x19
	.string	"imu"
	.byte	0x1
	.byte	0x43
	.long	0x495
	.uleb128 0xa
	.byte	0x8
	.long	0x363
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
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
	.uleb128 0xb
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x17
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB11
	.quad	.LFE11
	.quad	.LFB12
	.quad	.LFE12
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF32:
	.string	"G_SCALE_245DPS"
.LASF56:
	.string	"LSM9DS0_t"
.LASF31:
	.string	"mraa_i2c_context"
.LASF42:
	.string	"mag_scale"
.LASF68:
	.string	"src/main/drivers/compass_sparkfun.c"
.LASF1:
	.string	"short int"
.LASF15:
	.string	"pgn_t"
.LASF14:
	.string	"sizetype"
.LASF60:
	.string	"U_ID_0"
.LASF61:
	.string	"U_ID_1"
.LASF62:
	.string	"U_ID_2"
.LASF45:
	.string	"M_SCALE_8GS"
.LASF36:
	.string	"accel_scale"
.LASF53:
	.string	"gRes"
.LASF33:
	.string	"G_SCALE_500DPS"
.LASF27:
	.string	"mag_s"
.LASF30:
	.string	"mag_t"
.LASF11:
	.string	"float"
.LASF29:
	.string	"read"
.LASF25:
	.string	"long long int"
.LASF24:
	.string	"long long unsigned int"
.LASF67:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF52:
	.string	"mScale"
.LASF59:
	.string	"magData"
.LASF2:
	.string	"long int"
.LASF18:
	.string	"address"
.LASF50:
	.string	"gScale"
.LASF20:
	.string	"pgRegistry_t"
.LASF38:
	.string	"A_SCALE_4G"
.LASF51:
	.string	"aScale"
.LASF21:
	.string	"sensorInitFuncPtr"
.LASF40:
	.string	"A_SCALE_8G"
.LASF71:
	.string	"sparkfun_init"
.LASF5:
	.string	"unsigned char"
.LASF0:
	.string	"signed char"
.LASF49:
	.string	"gyro"
.LASF8:
	.string	"uint32_t"
.LASF9:
	.string	"unsigned int"
.LASF6:
	.string	"uint16_t"
.LASF46:
	.string	"M_SCALE_12GS"
.LASF41:
	.string	"A_SCALE_16G"
.LASF57:
	.string	"sparkfun_read"
.LASF13:
	.string	"char"
.LASF66:
	.string	"__pg_resetdata_end"
.LASF23:
	.string	"sensorReadFuncPtr"
.LASF7:
	.string	"short unsigned int"
.LASF69:
	.string	"/home/aravind/git/cleanflight"
.LASF22:
	.string	"_Bool"
.LASF35:
	.string	"gyro_scale"
.LASF44:
	.string	"M_SCALE_4GS"
.LASF64:
	.string	"__pg_registry_end"
.LASF54:
	.string	"aRes"
.LASF10:
	.string	"long unsigned int"
.LASF12:
	.string	"double"
.LASF34:
	.string	"G_SCALE_2000DPS"
.LASF63:
	.string	"__pg_registry_start"
.LASF17:
	.string	"size"
.LASF48:
	.string	"temperature"
.LASF19:
	.string	"reset"
.LASF55:
	.string	"mRes"
.LASF4:
	.string	"uint8_t"
.LASF37:
	.string	"A_SCALE_2G"
.LASF70:
	.string	"_i2c"
.LASF3:
	.string	"int16_t"
.LASF26:
	.string	"pgRegistry_s"
.LASF16:
	.string	"pgResetFunc"
.LASF43:
	.string	"M_SCALE_2GS"
.LASF39:
	.string	"A_SCALE_6G"
.LASF47:
	.string	"LSM9DS0"
.LASF65:
	.string	"__pg_resetdata_start"
.LASF28:
	.string	"init"
.LASF58:
	.string	"sparkfun_compass_Detect"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
