	.file	"bus_i2c_edison.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed bus_i2c_edison.i -mtune=generic
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
	.section	.bss.i2cTimeout,"aw",@nobits
	.align 4
	.type	i2cTimeout, @object
	.size	i2cTimeout, 4
i2cTimeout:
	.zero	4
	.section	.bss.i2c1ErrorCount,"aw",@nobits
	.align 2
	.type	i2c1ErrorCount, @object
	.size	i2c1ErrorCount, 2
i2c1ErrorCount:
	.zero	2
	.section	.bss.i2c2ErrorCount,"aw",@nobits
	.align 2
	.type	i2c2ErrorCount, @object
	.size	i2c2ErrorCount, 2
i2c2ErrorCount:
	.zero	2
	.section	.bss.i2cOverClock,"aw",@nobits
	.type	i2cOverClock, @object
	.size	i2cOverClock, 1
i2cOverClock:
	.zero	1
	.section	.rodata
.LC0:
	.string	"/dev/ttyACM0"
	.section	.text.i2cInit,"ax",@progbits
	.globl	i2cInit
	.type	i2cInit, @function
i2cInit:
.LFB2:
	.file 1 "src/main/drivers/bus_i2c_edison.c"
	.loc 1 74 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# index, index
	.loc 1 75 0
	movl	$.LC0, %esi	#,
	movl	$1280, %edi	#,
	call	mraa_add_subplatform	#
	.loc 1 77 0
	movl	-20(%rbp), %eax	# index, D.4757
	movl	%eax, %edi	# D.4757,
	call	mraa_i2c_init	#
	movq	%rax, -8(%rbp)	# tmp88, i2c
	.loc 1 78 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	i2cInit, .-i2cInit
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/mraa/i2c.h"
	.file 4 "src/main/drivers/bus_i2c.h"
	.file 5 "./src/main/target/edison/target.h"
	.file 6 "/usr/include/mraa/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x23a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF47
	.byte	0xc
	.long	.LASF48
	.long	.LASF49
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x2
	.byte	0x31
	.long	0x57
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF6
	.byte	0x2
	.byte	0x33
	.long	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x5
	.byte	0x4
	.long	0x69
	.byte	0x6
	.byte	0x27
	.long	0x11a
	.uleb128 0x6
	.long	.LASF13
	.byte	0
	.uleb128 0x6
	.long	.LASF14
	.byte	0x1
	.uleb128 0x6
	.long	.LASF15
	.byte	0x2
	.uleb128 0x6
	.long	.LASF16
	.byte	0x3
	.uleb128 0x6
	.long	.LASF17
	.byte	0x4
	.uleb128 0x6
	.long	.LASF18
	.byte	0x5
	.uleb128 0x6
	.long	.LASF19
	.byte	0x6
	.uleb128 0x6
	.long	.LASF20
	.byte	0x7
	.uleb128 0x6
	.long	.LASF21
	.byte	0x8
	.uleb128 0x6
	.long	.LASF22
	.byte	0x9
	.uleb128 0x6
	.long	.LASF23
	.byte	0xa
	.uleb128 0x6
	.long	.LASF24
	.byte	0xb
	.uleb128 0x6
	.long	.LASF25
	.byte	0xc
	.uleb128 0x6
	.long	.LASF26
	.byte	0xd
	.uleb128 0x7
	.long	.LASF27
	.value	0x100
	.uleb128 0x7
	.long	.LASF28
	.value	0x500
	.uleb128 0x6
	.long	.LASF29
	.byte	0x60
	.uleb128 0x6
	.long	.LASF30
	.byte	0x61
	.uleb128 0x6
	.long	.LASF31
	.byte	0x62
	.uleb128 0x6
	.long	.LASF32
	.byte	0x63
	.byte	0
	.uleb128 0x4
	.long	.LASF33
	.byte	0x3
	.byte	0x35
	.long	0x125
	.uleb128 0x8
	.byte	0x8
	.long	0x12b
	.uleb128 0x9
	.long	.LASF50
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.long	0x69
	.byte	0x4
	.byte	0x18
	.long	0x159
	.uleb128 0x6
	.long	.LASF34
	.byte	0
	.uleb128 0x6
	.long	.LASF35
	.byte	0x1
	.uleb128 0x6
	.long	.LASF36
	.byte	0x6
	.uleb128 0x6
	.long	.LASF37
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF38
	.byte	0x4
	.byte	0x1d
	.long	0x130
	.uleb128 0xb
	.long	.LASF51
	.byte	0x1
	.byte	0x49
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x19e
	.uleb128 0xc
	.long	.LASF52
	.byte	0x1
	.byte	0x49
	.long	0x159
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xd
	.string	"i2c"
	.byte	0x1
	.byte	0x4c
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	.LASF39
	.byte	0x1
	.byte	0x3b
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	i2cTimeout
	.uleb128 0xe
	.long	.LASF40
	.byte	0x1
	.byte	0x3d
	.long	0x1c8
	.uleb128 0x9
	.byte	0x3
	.quad	i2c1ErrorCount
	.uleb128 0xf
	.long	0x4c
	.uleb128 0xe
	.long	.LASF41
	.byte	0x1
	.byte	0x3e
	.long	0x1c8
	.uleb128 0x9
	.byte	0x3
	.quad	i2c2ErrorCount
	.uleb128 0xe
	.long	.LASF42
	.byte	0x1
	.byte	0x46
	.long	0x1f7
	.uleb128 0x9
	.byte	0x3
	.quad	i2cOverClock
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF43
	.uleb128 0x10
	.long	.LASF44
	.byte	0x5
	.byte	0xc8
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x10
	.long	.LASF45
	.byte	0x5
	.byte	0xc9
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x10
	.long	.LASF46
	.byte	0x5
	.byte	0xca
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB2
	.quad	.LFE2
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF35:
	.string	"I2CDEV_2"
.LASF13:
	.string	"MRAA_INTEL_GALILEO_GEN1"
.LASF36:
	.string	"I2CDEV_6"
.LASF25:
	.string	"MRAA_UP"
.LASF16:
	.string	"MRAA_INTEL_DE3815"
.LASF31:
	.string	"MRAA_NULL_PLATFORM"
.LASF50:
	.string	"_i2c"
.LASF24:
	.string	"MRAA_INTEL_CHERRYHILLS"
.LASF38:
	.string	"I2CDevice"
.LASF44:
	.string	"U_ID_0"
.LASF12:
	.string	"long long unsigned int"
.LASF26:
	.string	"MRAA_INTEL_GT_TUCHUCK"
.LASF3:
	.string	"unsigned char"
.LASF15:
	.string	"MRAA_INTEL_EDISON_FAB_C"
.LASF30:
	.string	"MRAA_JSON_PLATFORM"
.LASF34:
	.string	"I2CDEV_1"
.LASF8:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF47:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF51:
	.string	"i2cInit"
.LASF49:
	.string	"/home/aravind/git/cleanflight"
.LASF17:
	.string	"MRAA_INTEL_MINNOWBOARD_MAX"
.LASF33:
	.string	"mraa_i2c_context"
.LASF28:
	.string	"MRAA_GENERIC_FIRMATA"
.LASF23:
	.string	"MRAA_INTEL_SOFIA_3GR"
.LASF29:
	.string	"MRAA_MOCK_PLATFORM"
.LASF7:
	.string	"unsigned int"
.LASF42:
	.string	"i2cOverClock"
.LASF10:
	.string	"char"
.LASF21:
	.string	"MRAA_INTEL_NUC5"
.LASF9:
	.string	"sizetype"
.LASF41:
	.string	"i2c2ErrorCount"
.LASF11:
	.string	"long long int"
.LASF48:
	.string	"src/main/drivers/bus_i2c_edison.c"
.LASF46:
	.string	"U_ID_2"
.LASF22:
	.string	"MRAA_96BOARDS"
.LASF52:
	.string	"index"
.LASF37:
	.string	"I2CDEV_MAX"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF45:
	.string	"U_ID_1"
.LASF6:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF32:
	.string	"MRAA_UNKNOWN_PLATFORM"
.LASF27:
	.string	"MRAA_FTDI_FT4222"
.LASF0:
	.string	"signed char"
.LASF19:
	.string	"MRAA_BEAGLEBONE"
.LASF18:
	.string	"MRAA_RASPBERRY_PI"
.LASF43:
	.string	"_Bool"
.LASF39:
	.string	"i2cTimeout"
.LASF14:
	.string	"MRAA_INTEL_GALILEO_GEN2"
.LASF40:
	.string	"i2c1ErrorCount"
.LASF20:
	.string	"MRAA_BANANA"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
