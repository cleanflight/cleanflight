	.file	"bus_i2c_edison.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed bus_i2c_edison.i -mtune=generic
# -march=x86-64 -ggdb3 -Wall -Wpedantic -Wextra -Wunsafe-loop-optimizations
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
	movl	-20(%rbp), %eax	# index, D.4721
	movl	%eax, %edi	# D.4721,
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
	.file 5 "/usr/include/mraa/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1ff
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF1836
	.byte	0xc
	.long	.LASF1837
	.long	.LASF1838
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1792
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1793
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1794
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1795
	.uleb128 0x4
	.long	.LASF1797
	.byte	0x2
	.byte	0x31
	.long	0x5b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1796
	.uleb128 0x4
	.long	.LASF1798
	.byte	0x2
	.byte	0x33
	.long	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1799
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1800
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1801
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1802
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1803
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1804
	.uleb128 0x5
	.byte	0x4
	.long	0x6d
	.byte	0x5
	.byte	0x27
	.long	0x11e
	.uleb128 0x6
	.long	.LASF1805
	.byte	0
	.uleb128 0x6
	.long	.LASF1806
	.byte	0x1
	.uleb128 0x6
	.long	.LASF1807
	.byte	0x2
	.uleb128 0x6
	.long	.LASF1808
	.byte	0x3
	.uleb128 0x6
	.long	.LASF1809
	.byte	0x4
	.uleb128 0x6
	.long	.LASF1810
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1811
	.byte	0x6
	.uleb128 0x6
	.long	.LASF1812
	.byte	0x7
	.uleb128 0x6
	.long	.LASF1813
	.byte	0x8
	.uleb128 0x6
	.long	.LASF1814
	.byte	0x9
	.uleb128 0x6
	.long	.LASF1815
	.byte	0xa
	.uleb128 0x6
	.long	.LASF1816
	.byte	0xb
	.uleb128 0x6
	.long	.LASF1817
	.byte	0xc
	.uleb128 0x6
	.long	.LASF1818
	.byte	0xd
	.uleb128 0x7
	.long	.LASF1819
	.value	0x100
	.uleb128 0x7
	.long	.LASF1820
	.value	0x500
	.uleb128 0x6
	.long	.LASF1821
	.byte	0x60
	.uleb128 0x6
	.long	.LASF1822
	.byte	0x61
	.uleb128 0x6
	.long	.LASF1823
	.byte	0x62
	.uleb128 0x6
	.long	.LASF1824
	.byte	0x63
	.byte	0
	.uleb128 0x4
	.long	.LASF1825
	.byte	0x3
	.byte	0x35
	.long	0x129
	.uleb128 0x8
	.byte	0x8
	.long	0x12f
	.uleb128 0x9
	.long	.LASF1839
	.uleb128 0xa
	.long	.LASF1830
	.byte	0x4
	.long	0x6d
	.byte	0x4
	.byte	0x18
	.long	0x15d
	.uleb128 0x6
	.long	.LASF1826
	.byte	0
	.uleb128 0x6
	.long	.LASF1827
	.byte	0x1
	.uleb128 0x6
	.long	.LASF1828
	.byte	0x6
	.uleb128 0x6
	.long	.LASF1829
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF1830
	.byte	0x4
	.byte	0x1d
	.long	0x134
	.uleb128 0xb
	.long	.LASF1840
	.byte	0x1
	.byte	0x49
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a2
	.uleb128 0xc
	.long	.LASF1841
	.byte	0x1
	.byte	0x49
	.long	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xd
	.string	"i2c"
	.byte	0x1
	.byte	0x4c
	.long	0x11e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	.LASF1831
	.byte	0x1
	.byte	0x3b
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	i2cTimeout
	.uleb128 0xe
	.long	.LASF1832
	.byte	0x1
	.byte	0x3d
	.long	0x1cc
	.uleb128 0x9
	.byte	0x3
	.quad	i2c1ErrorCount
	.uleb128 0xf
	.long	0x50
	.uleb128 0xe
	.long	.LASF1833
	.byte	0x1
	.byte	0x3e
	.long	0x1cc
	.uleb128 0x9
	.byte	0x3
	.quad	i2c2ErrorCount
	.uleb128 0xe
	.long	.LASF1834
	.byte	0x1
	.byte	0x46
	.long	0x1fb
	.uleb128 0x9
	.byte	0x3
	.quad	i2cOverClock
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF1835
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
	.file 15 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro10
	.file 16 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF499
	.file 17 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 18 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro13
	.file 19 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro14
	.file 20 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x7
	.long	.LASF529
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro15
	.file 21 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x18
	.long	.LASF536
	.file 22 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x18
	.long	.LASF537
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.file 23 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF591
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF592
	.file 24 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x18
	.byte	0x5
	.uleb128 0x19
	.long	.LASF593
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro21
	.file 25 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro22
	.file 26 "/usr/include/time.h"
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF458
	.byte	0x3
	.uleb128 0x92
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.file 27 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xdb
	.uleb128 0x1b
	.byte	0x5
	.uleb128 0x16
	.long	.LASF658
	.file 28 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x1c
	.byte	0x3
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 29 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF669
	.file 30 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.file 31 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0xde
	.uleb128 0x1f
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.file 32 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0x10e
	.uleb128 0x20
	.byte	0x5
	.uleb128 0x13
	.long	.LASF692
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro34
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF707
	.file 33 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x1ec
	.uleb128 0x21
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x5
	.uleb128 0x2e4
	.long	.LASF711
	.file 34 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ba
	.uleb128 0x22
	.byte	0x4
	.byte	0x6
	.uleb128 0x3c5
	.long	.LASF712
	.byte	0x4
	.file 35 "./src/main/includes.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x23
	.file 36 "/usr/include/mraa.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x24
	.file 37 "/usr/include/mraa/pwm.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x25
	.file 38 "/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x26
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro39
	.file 39 "/usr/include/libio.h"
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x27
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF721
	.file 40 "/usr/include/_G_config.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x28
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x5
	.uleb128 0x10
	.long	.LASF723
	.file 41 "/usr/include/wchar.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x29
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro43
	.file 42 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x2a
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro46
	.file 43 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0xa4
	.uleb128 0x2b
	.byte	0x7
	.long	.Ldebug_macro47
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro48
	.file 44 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.byte	0x3
	.uleb128 0x355
	.uleb128 0x2c
	.byte	0x4
	.byte	0x4
	.file 45 "/usr/include/fcntl.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x2d
	.byte	0x5
	.uleb128 0x17
	.long	.LASF838
	.file 46 "/usr/include/x86_64-linux-gnu/bits/fcntl.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x7
	.long	.Ldebug_macro49
	.file 47 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"
	.byte	0x3
	.uleb128 0x3d
	.uleb128 0x2f
	.byte	0x7
	.long	.Ldebug_macro50
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x4
	.file 48 "/usr/include/x86_64-linux-gnu/bits/stat.h"
	.byte	0x3
	.uleb128 0x4d
	.uleb128 0x30
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro54
	.byte	0x4
	.file 49 "/usr/include/mraa/common.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x31
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x4
	.byte	0x4
	.file 50 "/usr/include/mraa/aio.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x32
	.file 51 "/usr/include/unistd.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x33
	.byte	0x7
	.long	.Ldebug_macro56
	.file 52 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h"
	.byte	0x3
	.uleb128 0xcd
	.uleb128 0x34
	.byte	0x7
	.long	.Ldebug_macro57
	.byte	0x4
	.file 53 "/usr/include/x86_64-linux-gnu/bits/environments.h"
	.byte	0x3
	.uleb128 0xd1
	.uleb128 0x35
	.byte	0x3
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro59
	.byte	0x3
	.uleb128 0xe5
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro60
	.file 54 "/usr/include/x86_64-linux-gnu/bits/confname.h"
	.byte	0x3
	.uleb128 0x264
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x4
	.byte	0x5
	.uleb128 0x369
	.long	.LASF1388
	.file 55 "/usr/include/getopt.h"
	.byte	0x3
	.uleb128 0x36a
	.uleb128 0x37
	.byte	0x6
	.uleb128 0xbd
	.long	.LASF1389
	.byte	0x4
	.byte	0x4
	.file 56 "/usr/include/mraa/gpio.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x38
	.file 57 "/usr/include/pthread.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x39
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1390
	.file 58 "/usr/include/sched.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x3a
	.byte	0x7
	.long	.Ldebug_macro62
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro63
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x4
	.file 59 "/usr/include/x86_64-linux-gnu/bits/sched.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro64
	.byte	0x4
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1412
	.byte	0x4
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro66
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro52
	.file 60 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0xdd
	.uleb128 0x3c
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1428
	.byte	0x4
	.byte	0x5
	.uleb128 0x136
	.long	.LASF1429
	.byte	0x4
	.file 61 "/usr/include/x86_64-linux-gnu/bits/setjmp.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x3d
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1430
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro67
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 62 "/usr/include/mraa/spi.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x3e
	.byte	0x4
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x3
	.byte	0x4
	.file 63 "/usr/include/mraa/uart.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x3f
	.byte	0x4
	.file 64 "/usr/include/mraa/uart_ow.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x40
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1452
	.byte	0x4
	.byte	0x4
	.file 65 "/usr/include/errno.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1453
	.file 66 "/usr/include/x86_64-linux-gnu/bits/errno.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x42
	.byte	0x7
	.long	.Ldebug_macro68
	.file 67 "/usr/include/linux/errno.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x43
	.file 68 "/usr/include/x86_64-linux-gnu/asm/errno.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x44
	.file 69 "/usr/include/asm-generic/errno.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x45
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1457
	.file 70 "/usr/include/asm-generic/errno-base.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x46
	.byte	0x7
	.long	.Ldebug_macro69
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro70
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro71
	.byte	0x4
	.byte	0x6
	.uleb128 0x24
	.long	.LASF1594
	.byte	0x4
	.file 71 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x47
	.byte	0x7
	.long	.Ldebug_macro72
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x4
	.file 72 "/usr/include/termios.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x48
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1596
	.file 73 "/usr/include/x86_64-linux-gnu/bits/termios.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x49
	.byte	0x7
	.long	.Ldebug_macro73
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1740
	.file 74 "/usr/include/x86_64-linux-gnu/sys/ttydefaults.h"
	.byte	0x3
	.uleb128 0x68
	.uleb128 0x4a
	.byte	0x7
	.long	.Ldebug_macro74
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro75
	.byte	0x4
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1772
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1773
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1774
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1775
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1776
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1777
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1778
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1779
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1780
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1781
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1782
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1783
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1784
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1785
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1786
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1787
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1788
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1789
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1790
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1791
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
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.27.59e2586c75bdbcb991b248ad7257b993,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF458
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF459
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.e1c83cba2098ce92b68f6311de19e6b1,comdat
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
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF479
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF480
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF481
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF482
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF483
	.byte	0x5
	.uleb128 0x110
	.long	.LASF484
	.byte	0x5
	.uleb128 0x111
	.long	.LASF485
	.byte	0x5
	.uleb128 0x112
	.long	.LASF486
	.byte	0x5
	.uleb128 0x113
	.long	.LASF487
	.byte	0x5
	.uleb128 0x114
	.long	.LASF488
	.byte	0x5
	.uleb128 0x115
	.long	.LASF489
	.byte	0x5
	.uleb128 0x116
	.long	.LASF490
	.byte	0x5
	.uleb128 0x117
	.long	.LASF491
	.byte	0x5
	.uleb128 0x118
	.long	.LASF492
	.byte	0x5
	.uleb128 0x119
	.long	.LASF493
	.byte	0x6
	.uleb128 0x126
	.long	.LASF494
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF495
	.byte	0x6
	.uleb128 0x191
	.long	.LASF496
	.byte	0x5
	.uleb128 0x196
	.long	.LASF497
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.e401b8bcfee800b540b27abd7cc78de9,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF500
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF501
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF502
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF503
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF504
	.byte	0x5
	.uleb128 0x20
	.long	.LASF505
	.byte	0x5
	.uleb128 0x22
	.long	.LASF506
	.byte	0x5
	.uleb128 0x24
	.long	.LASF507
	.byte	0x5
	.uleb128 0x25
	.long	.LASF508
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF509
	.byte	0x6
	.uleb128 0x2e
	.long	.LASF510
	.byte	0x6
	.uleb128 0x2f
	.long	.LASF511
	.byte	0x6
	.uleb128 0x30
	.long	.LASF512
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF513
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF514
	.byte	0x5
	.uleb128 0x22
	.long	.LASF515
	.byte	0x5
	.uleb128 0x25
	.long	.LASF516
	.byte	0x5
	.uleb128 0x28
	.long	.LASF517
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF518
	.byte	0x5
	.uleb128 0x31
	.long	.LASF519
	.byte	0x5
	.uleb128 0x35
	.long	.LASF520
	.byte	0x5
	.uleb128 0x38
	.long	.LASF521
	.byte	0x5
	.uleb128 0x39
	.long	.LASF522
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF523
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF524
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.19.ff00c9c0f5e9f9a9719c5de76ace57b4,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF525
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF526
	.byte	0x5
	.uleb128 0x20
	.long	.LASF527
	.byte	0x5
	.uleb128 0x21
	.long	.LASF528
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.41.24cced64aef71195a51d4daa8e4f4a95,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF530
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF531
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF532
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF533
	.byte	0x5
	.uleb128 0x30
	.long	.LASF534
	.byte	0x5
	.uleb128 0x34
	.long	.LASF535
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF538
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF539
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF540
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF541
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF542
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF543
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF544
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF545
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF546
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF547
	.byte	0x5
	.uleb128 0x70
	.long	.LASF548
	.byte	0x5
	.uleb128 0x71
	.long	.LASF549
	.byte	0x5
	.uleb128 0x72
	.long	.LASF550
	.byte	0x5
	.uleb128 0x73
	.long	.LASF551
	.byte	0x5
	.uleb128 0x75
	.long	.LASF552
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF553
	.byte	0x5
	.uleb128 0x22
	.long	.LASF554
	.byte	0x5
	.uleb128 0x23
	.long	.LASF555
	.byte	0x5
	.uleb128 0x26
	.long	.LASF556
	.byte	0x5
	.uleb128 0x27
	.long	.LASF557
	.byte	0x5
	.uleb128 0x28
	.long	.LASF558
	.byte	0x5
	.uleb128 0x29
	.long	.LASF559
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF560
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF561
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF562
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF563
	.byte	0x5
	.uleb128 0x33
	.long	.LASF564
	.byte	0x5
	.uleb128 0x34
	.long	.LASF565
	.byte	0x5
	.uleb128 0x35
	.long	.LASF566
	.byte	0x5
	.uleb128 0x36
	.long	.LASF567
	.byte	0x5
	.uleb128 0x37
	.long	.LASF568
	.byte	0x5
	.uleb128 0x38
	.long	.LASF569
	.byte	0x5
	.uleb128 0x39
	.long	.LASF570
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF571
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF572
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF573
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF574
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF575
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF576
	.byte	0x5
	.uleb128 0x40
	.long	.LASF577
	.byte	0x5
	.uleb128 0x41
	.long	.LASF578
	.byte	0x5
	.uleb128 0x42
	.long	.LASF579
	.byte	0x5
	.uleb128 0x43
	.long	.LASF580
	.byte	0x5
	.uleb128 0x44
	.long	.LASF581
	.byte	0x5
	.uleb128 0x45
	.long	.LASF582
	.byte	0x5
	.uleb128 0x46
	.long	.LASF583
	.byte	0x5
	.uleb128 0x47
	.long	.LASF584
	.byte	0x5
	.uleb128 0x48
	.long	.LASF585
	.byte	0x5
	.uleb128 0x49
	.long	.LASF586
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF587
	.byte	0x5
	.uleb128 0x50
	.long	.LASF588
	.byte	0x5
	.uleb128 0x53
	.long	.LASF589
	.byte	0x5
	.uleb128 0x57
	.long	.LASF590
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.38.11ee5fdc0f6cc53a16c505b9233cecef,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF594
	.byte	0x5
	.uleb128 0x61
	.long	.LASF595
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.63.97272d7c64d5db8020003b32e9289502,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF596
	.byte	0x5
	.uleb128 0x40
	.long	.LASF597
	.byte	0x5
	.uleb128 0x41
	.long	.LASF598
	.byte	0x5
	.uleb128 0x42
	.long	.LASF599
	.byte	0x5
	.uleb128 0x44
	.long	.LASF600
	.byte	0x5
	.uleb128 0x45
	.long	.LASF601
	.byte	0x5
	.uleb128 0x46
	.long	.LASF602
	.byte	0x5
	.uleb128 0x47
	.long	.LASF603
	.byte	0x5
	.uleb128 0x49
	.long	.LASF604
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF605
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF606
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF607
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.99.408b6270fa6eb71377201a241ef15f79,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF608
	.byte	0x5
	.uleb128 0x64
	.long	.LASF609
	.byte	0x5
	.uleb128 0x65
	.long	.LASF610
	.byte	0x5
	.uleb128 0x66
	.long	.LASF611
	.byte	0x5
	.uleb128 0x67
	.long	.LASF612
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.50.84aeca2ac6f37d40e1e9b3cef757ba2d,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF613
	.byte	0x5
	.uleb128 0x48
	.long	.LASF614
	.byte	0x5
	.uleb128 0x54
	.long	.LASF615
	.byte	0x5
	.uleb128 0x55
	.long	.LASF616
	.byte	0x5
	.uleb128 0x56
	.long	.LASF617
	.byte	0x5
	.uleb128 0x57
	.long	.LASF618
	.byte	0x5
	.uleb128 0x58
	.long	.LASF619
	.byte	0x5
	.uleb128 0x59
	.long	.LASF620
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF621
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF622
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF623
	.byte	0x5
	.uleb128 0x80
	.long	.LASF624
	.byte	0x5
	.uleb128 0x85
	.long	.LASF625
	.byte	0x5
	.uleb128 0x86
	.long	.LASF626
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF627
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.305f7c1ed78a85c751613a0e1f6565b3,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF628
	.byte	0x5
	.uleb128 0x28
	.long	.LASF629
	.byte	0x5
	.uleb128 0x34
	.long	.LASF630
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF631
	.byte	0x5
	.uleb128 0x42
	.long	.LASF632
	.byte	0x5
	.uleb128 0x47
	.long	.LASF633
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF634
	.byte	0x5
	.uleb128 0x51
	.long	.LASF635
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF636
	.byte	0x5
	.uleb128 0x63
	.long	.LASF637
	.byte	0x5
	.uleb128 0x69
	.long	.LASF638
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF639
	.byte	0x5
	.uleb128 0x75
	.long	.LASF640
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF641
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF642
	.byte	0x5
	.uleb128 0x81
	.long	.LASF643
	.byte	0x5
	.uleb128 0x82
	.long	.LASF644
	.byte	0x5
	.uleb128 0x83
	.long	.LASF645
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.53.beb46e650cd406cb917b6b96b45e640a,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF646
	.byte	0x6
	.uleb128 0x42
	.long	.LASF647
	.byte	0x5
	.uleb128 0x45
	.long	.LASF648
	.byte	0x6
	.uleb128 0x52
	.long	.LASF649
	.byte	0x5
	.uleb128 0x56
	.long	.LASF650
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF651
	.byte	0x5
	.uleb128 0x62
	.long	.LASF652
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF653
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.847b6907dabda77be90a9ab7ad789e2e,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.187.fd8c81c4bff8969f5d23c3a34aa715af,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF655
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF656
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF657
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.28.eb2f3debdbcffd1442ebddaebc4fb6ff,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF659
	.byte	0x5
	.uleb128 0x21
	.long	.LASF660
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF661
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF662
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF663
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF664
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF665
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF666
	.byte	0x5
	.uleb128 0x29
	.long	.LASF643
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF667
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF647
	.byte	0x6
	.uleb128 0x52
	.long	.LASF649
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF651
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF653
	.byte	0x5
	.uleb128 0x72
	.long	.LASF668
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.25.ae5284cdff565e87a9198d819340325d,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF670
	.byte	0x6
	.uleb128 0x65
	.long	.LASF671
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.49.e9d2041e5035cc68ebd1a20f7dbc8514,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF672
	.byte	0x6
	.uleb128 0x39
	.long	.LASF673
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF674
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF675
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF676
	.byte	0x5
	.uleb128 0x49
	.long	.LASF677
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF678
	.byte	0x5
	.uleb128 0x55
	.long	.LASF679
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF680
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF681
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF682
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF683
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sysmacros.h.20.8a0c33ff175cd9b434a86c0aaa36f0a2,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF684
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF685
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF686
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF687
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.229.67b3f66bd74b06b451caec392a72a945,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF688
	.byte	0x5
	.uleb128 0xec
	.long	.LASF689
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF690
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF691
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypes.h.25.6892b1493314fcf446bbc76e7362acba,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF693
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF694
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF695
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF696
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF697
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF698
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF699
	.byte	0x5
	.uleb128 0x20
	.long	.LASF700
	.byte	0x5
	.uleb128 0x21
	.long	.LASF701
	.byte	0x5
	.uleb128 0x46
	.long	.LASF702
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF703
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF704
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF705
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF706
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF708
	.byte	0x5
	.uleb128 0x17
	.long	.LASF458
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF709
	.byte	0x5
	.uleb128 0x23
	.long	.LASF710
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.26.4719156f1aea2bb9662fd6c582dc9a4c,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF713
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF458
	.byte	0x5
	.uleb128 0x20
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.04cc7214bceba497b20d15c10fd97511,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x191
	.long	.LASF496
	.byte	0x5
	.uleb128 0x196
	.long	.LASF497
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.36.2dd12c1fd035242ad5cfd0152a01be5a,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF714
	.byte	0x5
	.uleb128 0x25
	.long	.LASF715
	.byte	0x5
	.uleb128 0x38
	.long	.LASF716
	.byte	0x6
	.uleb128 0x3a
	.long	.LASF717
	.byte	0x5
	.uleb128 0x42
	.long	.LASF718
	.byte	0x6
	.uleb128 0x44
	.long	.LASF719
	.byte	0x5
	.uleb128 0x48
	.long	.LASF720
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.5.b0f37d9e474454cf6e459063458db32f,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.long	.LASF722
	.byte	0x5
	.uleb128 0xa
	.long	.LASF458
	.byte	0x5
	.uleb128 0xe
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.80.eea3eba2d2a17aace9470a8e0d8218dc,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF724
	.byte	0x6
	.uleb128 0x60
	.long	.LASF725
	.byte	0x6
	.uleb128 0x386
	.long	.LASF725
	.byte	0x6
	.uleb128 0x387
	.long	.LASF726
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.46.5187c97b14fd664662cb32e6b94fc49e,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF727
	.byte	0x5
	.uleb128 0x30
	.long	.LASF728
	.byte	0x5
	.uleb128 0x31
	.long	.LASF729
	.byte	0x5
	.uleb128 0x33
	.long	.LASF730
	.byte	0x5
	.uleb128 0x36
	.long	.LASF731
	.byte	0x5
	.uleb128 0x38
	.long	.LASF732
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.33.a775b9ecae273f33bc59931e9891e4ca,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.long	.LASF733
	.byte	0x5
	.uleb128 0x22
	.long	.LASF734
	.byte	0x5
	.uleb128 0x23
	.long	.LASF735
	.byte	0x5
	.uleb128 0x24
	.long	.LASF736
	.byte	0x5
	.uleb128 0x25
	.long	.LASF737
	.byte	0x5
	.uleb128 0x26
	.long	.LASF738
	.byte	0x5
	.uleb128 0x27
	.long	.LASF739
	.byte	0x5
	.uleb128 0x28
	.long	.LASF740
	.byte	0x5
	.uleb128 0x29
	.long	.LASF741
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF742
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF743
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF744
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF745
	.byte	0x5
	.uleb128 0x30
	.long	.LASF746
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF747
	.byte	0x5
	.uleb128 0x27
	.long	.LASF748
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.51.dab170798ec1df48c625aea7c30e1b63,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x33
	.long	.LASF749
	.byte	0x5
	.uleb128 0x34
	.long	.LASF750
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF751
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF752
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF753
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF754
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF755
	.byte	0x5
	.uleb128 0x50
	.long	.LASF756
	.byte	0x5
	.uleb128 0x51
	.long	.LASF757
	.byte	0x5
	.uleb128 0x52
	.long	.LASF758
	.byte	0x5
	.uleb128 0x53
	.long	.LASF759
	.byte	0x5
	.uleb128 0x54
	.long	.LASF760
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF761
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF762
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF763
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF764
	.byte	0x5
	.uleb128 0x60
	.long	.LASF765
	.byte	0x5
	.uleb128 0x61
	.long	.LASF766
	.byte	0x5
	.uleb128 0x62
	.long	.LASF767
	.byte	0x5
	.uleb128 0x63
	.long	.LASF768
	.byte	0x5
	.uleb128 0x64
	.long	.LASF769
	.byte	0x5
	.uleb128 0x65
	.long	.LASF770
	.byte	0x5
	.uleb128 0x66
	.long	.LASF771
	.byte	0x5
	.uleb128 0x67
	.long	.LASF772
	.byte	0x5
	.uleb128 0x68
	.long	.LASF773
	.byte	0x5
	.uleb128 0x69
	.long	.LASF774
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF775
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF776
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF777
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF778
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF779
	.byte	0x5
	.uleb128 0x70
	.long	.LASF780
	.byte	0x5
	.uleb128 0x71
	.long	.LASF781
	.byte	0x5
	.uleb128 0x75
	.long	.LASF782
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF783
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF784
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF785
	.byte	0x5
	.uleb128 0x80
	.long	.LASF786
	.byte	0x5
	.uleb128 0x81
	.long	.LASF787
	.byte	0x5
	.uleb128 0x82
	.long	.LASF788
	.byte	0x5
	.uleb128 0x83
	.long	.LASF789
	.byte	0x5
	.uleb128 0x84
	.long	.LASF790
	.byte	0x5
	.uleb128 0x85
	.long	.LASF791
	.byte	0x5
	.uleb128 0x86
	.long	.LASF792
	.byte	0x5
	.uleb128 0x87
	.long	.LASF793
	.byte	0x5
	.uleb128 0x88
	.long	.LASF794
	.byte	0x5
	.uleb128 0x89
	.long	.LASF795
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF796
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF797
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF798
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF799
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF800
	.byte	0x5
	.uleb128 0x110
	.long	.LASF801
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF802
	.byte	0x5
	.uleb128 0x140
	.long	.LASF803
	.byte	0x5
	.uleb128 0x141
	.long	.LASF804
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF805
	.byte	0x5
	.uleb128 0x190
	.long	.LASF806
	.byte	0x5
	.uleb128 0x193
	.long	.LASF807
	.byte	0x5
	.uleb128 0x197
	.long	.LASF808
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF809
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF810
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF811
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF812
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF813
	.byte	0x5
	.uleb128 0x1c5
	.long	.LASF814
	.byte	0x5
	.uleb128 0x1c6
	.long	.LASF815
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF816
	.byte	0x5
	.uleb128 0x1c8
	.long	.LASF817
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.80.17b7dd1ca72d8a61987532cb1d80194a,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF818
	.byte	0x5
	.uleb128 0x78
	.long	.LASF819
	.byte	0x5
	.uleb128 0x79
	.long	.LASF820
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF821
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF822
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF823
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF824
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF825
	.byte	0x5
	.uleb128 0x97
	.long	.LASF826
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.23.557290a6cddeba0587f574f29e3a5fb9,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF827
	.byte	0x5
	.uleb128 0x18
	.long	.LASF828
	.byte	0x5
	.uleb128 0x19
	.long	.LASF829
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF830
	.byte	0x6
	.uleb128 0x24
	.long	.LASF831
	.byte	0x5
	.uleb128 0x25
	.long	.LASF832
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.172.df21df34a7396d7da2e08f9b617d582f,comdat
.Ldebug_macro48:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xac
	.long	.LASF833
	.byte	0x5
	.uleb128 0xad
	.long	.LASF834
	.byte	0x5
	.uleb128 0xae
	.long	.LASF835
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF836
	.byte	0x5
	.uleb128 0x249
	.long	.LASF837
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.24.62c7e777a8b210e920ccbb92cfe8b9d8,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF839
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF840
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF841
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF842
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntllinux.h.42.497aaf7c2ab4b1c0485b1e24ddad6e31,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF843
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF844
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF845
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF846
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF847
	.byte	0x5
	.uleb128 0x32
	.long	.LASF848
	.byte	0x5
	.uleb128 0x35
	.long	.LASF849
	.byte	0x5
	.uleb128 0x38
	.long	.LASF850
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF851
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF852
	.byte	0x5
	.uleb128 0x41
	.long	.LASF853
	.byte	0x5
	.uleb128 0x44
	.long	.LASF854
	.byte	0x5
	.uleb128 0x46
	.long	.LASF855
	.byte	0x5
	.uleb128 0x48
	.long	.LASF856
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF857
	.byte	0x5
	.uleb128 0x52
	.long	.LASF858
	.byte	0x5
	.uleb128 0x55
	.long	.LASF859
	.byte	0x5
	.uleb128 0x58
	.long	.LASF860
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF861
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF862
	.byte	0x5
	.uleb128 0x61
	.long	.LASF863
	.byte	0x5
	.uleb128 0x64
	.long	.LASF864
	.byte	0x5
	.uleb128 0x69
	.long	.LASF865
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF866
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF867
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF868
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF869
	.byte	0x5
	.uleb128 0x90
	.long	.LASF870
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF871
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF872
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF873
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF874
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF875
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF876
	.byte	0x5
	.uleb128 0xab
	.long	.LASF877
	.byte	0x5
	.uleb128 0xae
	.long	.LASF878
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF879
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF880
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF881
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF882
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF883
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF884
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF885
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF886
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF887
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF888
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF889
	.byte	0x5
	.uleb128 0xda
	.long	.LASF890
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF891
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF892
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF893
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF894
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF895
	.byte	0x5
	.uleb128 0xea
	.long	.LASF896
	.byte	0x5
	.uleb128 0x115
	.long	.LASF897
	.byte	0x5
	.uleb128 0x116
	.long	.LASF898
	.byte	0x5
	.uleb128 0x117
	.long	.LASF899
	.byte	0x5
	.uleb128 0x118
	.long	.LASF900
	.byte	0x5
	.uleb128 0x119
	.long	.LASF901
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF902
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF903
	.byte	0x5
	.uleb128 0x122
	.long	.LASF904
	.byte	0x5
	.uleb128 0x123
	.long	.LASF905
	.byte	0x5
	.uleb128 0x124
	.long	.LASF906
	.byte	0x5
	.uleb128 0x125
	.long	.LASF907
	.byte	0x5
	.uleb128 0x126
	.long	.LASF908
	.byte	0x5
	.uleb128 0x127
	.long	.LASF909
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF910
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF911
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF912
	.byte	0x5
	.uleb128 0x161
	.long	.LASF913
	.byte	0x5
	.uleb128 0x167
	.long	.LASF914
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.40.8ff0a2b883e8f8c14f135fe2e029942a,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF915
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF667
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.fa652aa18ecf92239cee124d5533fe97,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF647
	.byte	0x6
	.uleb128 0x52
	.long	.LASF649
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF651
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF653
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stat.h.23.71443f0579dab3228134d84ad7d61c3e,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF916
	.byte	0x5
	.uleb128 0x25
	.long	.LASF917
	.byte	0x5
	.uleb128 0x26
	.long	.LASF918
	.byte	0x5
	.uleb128 0x29
	.long	.LASF919
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF920
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF921
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF922
	.byte	0x5
	.uleb128 0x60
	.long	.LASF923
	.byte	0x5
	.uleb128 0xac
	.long	.LASF924
	.byte	0x5
	.uleb128 0xad
	.long	.LASF925
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF926
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF927
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF928
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF929
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF930
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF931
	.byte	0x5
	.uleb128 0xba
	.long	.LASF932
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF933
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF934
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF935
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF936
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF937
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF938
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF939
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF940
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF941
	.byte	0x5
	.uleb128 0xca
	.long	.LASF942
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF943
	.byte	0x5
	.uleb128 0xce
	.long	.LASF944
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF945
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.79.1b8e643ad8ec15e80ca5a02cd230a858,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF946
	.byte	0x5
	.uleb128 0x50
	.long	.LASF947
	.byte	0x5
	.uleb128 0x51
	.long	.LASF948
	.byte	0x5
	.uleb128 0x52
	.long	.LASF949
	.byte	0x5
	.uleb128 0x53
	.long	.LASF950
	.byte	0x5
	.uleb128 0x55
	.long	.LASF951
	.byte	0x5
	.uleb128 0x58
	.long	.LASF952
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF953
	.byte	0x5
	.uleb128 0x60
	.long	.LASF954
	.byte	0x5
	.uleb128 0x61
	.long	.LASF955
	.byte	0x5
	.uleb128 0x65
	.long	.LASF956
	.byte	0x5
	.uleb128 0x68
	.long	.LASF957
	.byte	0x5
	.uleb128 0x69
	.long	.LASF958
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF959
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF960
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF961
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF962
	.byte	0x5
	.uleb128 0x70
	.long	.LASF963
	.byte	0x5
	.uleb128 0x72
	.long	.LASF964
	.byte	0x5
	.uleb128 0x74
	.long	.LASF965
	.byte	0x5
	.uleb128 0x75
	.long	.LASF966
	.byte	0x5
	.uleb128 0x76
	.long	.LASF967
	.byte	0x5
	.uleb128 0x78
	.long	.LASF968
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF969
	.byte	0x5
	.uleb128 0x80
	.long	.LASF970
	.byte	0x5
	.uleb128 0x81
	.long	.LASF971
	.byte	0x5
	.uleb128 0x82
	.long	.LASF972
	.byte	0x5
	.uleb128 0x88
	.long	.LASF823
	.byte	0x5
	.uleb128 0x89
	.long	.LASF824
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF825
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF973
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF974
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF975
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF976
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.common.h.30.e56d1787b8140cf11356ebb3debd7778,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF977
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF978
	.byte	0x5
	.uleb128 0x21
	.long	.LASF979
	.byte	0x5
	.uleb128 0x22
	.long	.LASF980
	.byte	0x5
	.uleb128 0x24
	.long	.LASF981
	.byte	0x5
	.uleb128 0x25
	.long	.LASF982
	.byte	0x5
	.uleb128 0x29
	.long	.LASF983
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.23.a608ae63b1bee638e80d9e2a8598bd8e,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF984
	.byte	0x5
	.uleb128 0x22
	.long	.LASF985
	.byte	0x5
	.uleb128 0x35
	.long	.LASF986
	.byte	0x5
	.uleb128 0x43
	.long	.LASF987
	.byte	0x5
	.uleb128 0x46
	.long	.LASF988
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF989
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF990
	.byte	0x5
	.uleb128 0x52
	.long	.LASF991
	.byte	0x5
	.uleb128 0x56
	.long	.LASF992
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF993
	.byte	0x5
	.uleb128 0x64
	.long	.LASF994
	.byte	0x5
	.uleb128 0x67
	.long	.LASF995
	.byte	0x5
	.uleb128 0x68
	.long	.LASF996
	.byte	0x5
	.uleb128 0x69
	.long	.LASF997
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF998
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF999
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1001
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_opt.h.20.8587404e00639bdcc5f6a74591f95259,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1050
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1051
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1052
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1053
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1054
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1055
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1056
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1057
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1058
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1059
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1060
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1061
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1062
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1063
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.environments.h.56.c5802092ccc191baeb41f8d355bb878f,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1075
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.213.4c582e35260d661b081322974b7c1e74,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1076
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1077
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1078
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF458
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.259.cf1a01f3dbe75cab9837a40563f75c2b,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF969
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF970
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF971
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF972
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x146
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1083
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.confname.h.27.6b00117a32f457cc72e5ac810a9adade,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1146
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1147
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1148
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1149
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1150
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1151
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1152
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1153
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1154
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1155
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1156
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1157
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1158
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1159
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1160
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1161
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1162
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1163
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1164
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1165
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1166
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1167
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1168
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1169
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1170
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1171
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1172
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1173
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1174
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1175
	.byte	0x5
	.uleb128 0xde
	.long	.LASF1176
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1177
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1178
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1179
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1180
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1181
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1182
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1183
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1184
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1185
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1186
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1187
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1188
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1189
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1190
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1191
	.byte	0x5
	.uleb128 0xff
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x152
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x155
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x157
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x159
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x179
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x185
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x187
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1263
	.byte	0x5
	.uleb128 0x197
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x199
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x1c0
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1287
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF1288
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1289
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1290
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x1e6
	.long	.LASF1302
	.byte	0x5
	.uleb128 0x1e8
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF1305
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF1309
	.byte	0x5
	.uleb128 0x1f9
	.long	.LASF1310
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x203
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x205
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x207
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x209
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x20c
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF1319
	.byte	0x5
	.uleb128 0x211
	.long	.LASF1320
	.byte	0x5
	.uleb128 0x218
	.long	.LASF1321
	.byte	0x5
	.uleb128 0x21b
	.long	.LASF1322
	.byte	0x5
	.uleb128 0x21c
	.long	.LASF1323
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF1324
	.byte	0x5
	.uleb128 0x221
	.long	.LASF1325
	.byte	0x5
	.uleb128 0x224
	.long	.LASF1326
	.byte	0x5
	.uleb128 0x225
	.long	.LASF1327
	.byte	0x5
	.uleb128 0x228
	.long	.LASF1328
	.byte	0x5
	.uleb128 0x229
	.long	.LASF1329
	.byte	0x5
	.uleb128 0x22c
	.long	.LASF1330
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1331
	.byte	0x5
	.uleb128 0x230
	.long	.LASF1332
	.byte	0x5
	.uleb128 0x232
	.long	.LASF1333
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x236
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x238
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x23a
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x23d
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x23f
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x241
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x245
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x24f
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x251
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x253
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x255
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x257
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x259
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x25e
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x260
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x262
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x264
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x266
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x268
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x270
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x272
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x274
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x276
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x278
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF1368
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF1369
	.byte	0x5
	.uleb128 0x27f
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x281
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x283
	.long	.LASF1372
	.byte	0x5
	.uleb128 0x285
	.long	.LASF1373
	.byte	0x5
	.uleb128 0x287
	.long	.LASF1374
	.byte	0x5
	.uleb128 0x289
	.long	.LASF1375
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF1376
	.byte	0x5
	.uleb128 0x28d
	.long	.LASF1377
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF1378
	.byte	0x5
	.uleb128 0x291
	.long	.LASF1379
	.byte	0x5
	.uleb128 0x293
	.long	.LASF1380
	.byte	0x5
	.uleb128 0x295
	.long	.LASF1381
	.byte	0x5
	.uleb128 0x297
	.long	.LASF1382
	.byte	0x5
	.uleb128 0x299
	.long	.LASF1383
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF1384
	.byte	0x5
	.uleb128 0x29d
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x2a0
	.long	.LASF1386
	.byte	0x5
	.uleb128 0x2a2
	.long	.LASF1387
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sched.h.20.03e66e3b847677c1e781b90f4b73f77e,comdat
.Ldebug_macro62:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF458
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sched.h.31.f838e85546a76474a8c4ae9ddad27ef3,comdat
.Ldebug_macro63:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF643
	.byte	0x5
	.uleb128 0x20
	.long	.LASF667
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sched.h.28.25eb17a9847efe42b26af9ba02dfcd4f,comdat
.Ldebug_macro64:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1395
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1397
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1405
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1406
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1407
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1408
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1409
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1410
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1411
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.26.6a3cabd4f228e226db6723a3b0c81ba6,comdat
.Ldebug_macro65:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1413
	.byte	0x5
	.uleb128 0x23
	.long	.LASF458
	.byte	0x5
	.uleb128 0x24
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.40.ef4cac57544640468516e1691b64cd57,comdat
.Ldebug_macro66:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1414
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1416
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1426
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1427
	.byte	0x6
	.uleb128 0x65
	.long	.LASF671
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthread.h.35.4f9cb94142f84ba1b6ddc012cb580952,comdat
.Ldebug_macro67:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1433
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1435
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1436
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1437
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1438
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF1439
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1440
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1441
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1442
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1443
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1444
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1445
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1446
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF1447
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1448
	.byte	0x5
	.uleb128 0x217
	.long	.LASF1449
	.byte	0x5
	.uleb128 0x298
	.long	.LASF1450
	.byte	0x5
	.uleb128 0x2ad
	.long	.LASF1451
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.21.234adedf0a908ba1512bb39778d0c13a,comdat
.Ldebug_macro68:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x15
	.long	.LASF1454
	.byte	0x6
	.uleb128 0x16
	.long	.LASF1455
	.byte	0x6
	.uleb128 0x17
	.long	.LASF1456
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errnobase.h.2.3ec77d86fa6012e288bd2eb28191253f,comdat
.Ldebug_macro69:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1458
	.byte	0x5
	.uleb128 0x4
	.long	.LASF1459
	.byte	0x5
	.uleb128 0x5
	.long	.LASF1460
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1461
	.byte	0x5
	.uleb128 0x7
	.long	.LASF1462
	.byte	0x5
	.uleb128 0x8
	.long	.LASF1463
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1464
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1465
	.byte	0x5
	.uleb128 0xb
	.long	.LASF1466
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1467
	.byte	0x5
	.uleb128 0xd
	.long	.LASF1468
	.byte	0x5
	.uleb128 0xe
	.long	.LASF1469
	.byte	0x5
	.uleb128 0xf
	.long	.LASF1470
	.byte	0x5
	.uleb128 0x10
	.long	.LASF1471
	.byte	0x5
	.uleb128 0x11
	.long	.LASF1472
	.byte	0x5
	.uleb128 0x12
	.long	.LASF1473
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1474
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1475
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1476
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1477
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1478
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1479
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1480
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1481
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1482
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1483
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1484
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1485
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1486
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1487
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1488
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1489
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1490
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1491
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1492
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.6.6707cf97e82b783d19d3d077217dd04e,comdat
.Ldebug_macro70:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1493
	.byte	0x5
	.uleb128 0x7
	.long	.LASF1494
	.byte	0x5
	.uleb128 0x8
	.long	.LASF1495
	.byte	0x5
	.uleb128 0x11
	.long	.LASF1496
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1497
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1498
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1499
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1500
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1501
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1502
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1503
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1504
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1505
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1506
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1507
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1508
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1509
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1510
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1511
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1512
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1513
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1514
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1515
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1516
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1517
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1518
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1519
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1520
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1521
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1522
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1523
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1524
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1525
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1526
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1527
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1528
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1529
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1530
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1531
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1532
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1533
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1534
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1535
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1536
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1537
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1538
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1539
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1540
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1541
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1542
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1543
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1544
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1545
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1546
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1547
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1548
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1549
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1550
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1551
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1552
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1553
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1554
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1555
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1556
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1557
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1558
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1559
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1560
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1561
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1562
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1563
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1564
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1565
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1566
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1567
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1568
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1569
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1570
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1571
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1572
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1573
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1574
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1575
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1576
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1577
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1578
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1579
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1580
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1581
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1582
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1583
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1584
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1585
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1586
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1587
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1588
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1589
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1590
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1591
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.27.5f4b88dc9507696aecbaa61ffb4828e0,comdat
.Ldebug_macro71:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1592
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1593
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.8394011d5995a16f15d67d04e84a1d69,comdat
.Ldebug_macro72:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1595
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF458
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.termios.h.27.c5da1840ab18d5828f3c6f72c2a620b9,comdat
.Ldebug_macro73:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1597
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1598
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1599
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1600
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1601
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1602
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1603
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1604
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1605
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1606
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1607
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1608
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1609
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1610
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1611
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1612
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1613
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1614
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1615
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1616
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1617
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1618
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1619
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1620
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1621
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1622
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1623
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1624
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1625
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1626
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1627
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1628
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1629
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1630
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1631
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1632
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1633
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1634
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1635
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1636
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1637
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1638
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1639
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1640
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1641
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1642
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1643
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1644
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1645
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1646
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1647
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1648
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1649
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1650
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1651
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1652
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1653
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1654
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1655
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1656
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1657
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1658
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1659
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1660
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1661
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1662
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1663
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1664
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1665
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF1666
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1667
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1668
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1669
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1670
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1671
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1672
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1673
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1674
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1675
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1676
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1677
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1678
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1680
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1681
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1683
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1684
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1685
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1686
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1687
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1688
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1689
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1690
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1691
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1692
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1693
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1694
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1695
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF1696
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1697
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF1698
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1699
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1700
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1701
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1702
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1703
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1704
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1705
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1706
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1707
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1708
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1709
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1710
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1711
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1712
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF1713
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1714
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1715
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1716
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1717
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1718
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1719
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1720
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1721
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1722
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1723
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1724
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF1725
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1726
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1727
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1728
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1729
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF1730
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1731
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF1732
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1733
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1734
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1735
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1736
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1737
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1738
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1739
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ttydefaults.h.41.76470547474c31dba482768bc6c29e71,comdat
.Ldebug_macro74:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1741
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1742
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1743
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1744
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1745
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1746
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1747
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1748
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1749
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1750
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1751
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1752
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1753
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1754
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1755
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1756
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1757
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1758
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1759
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1760
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1761
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1762
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1763
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1764
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1765
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1766
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1767
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1768
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.bus_i2c.h.20.811afd21f5c414d17a32d0a4900984d7,comdat
.Ldebug_macro75:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1769
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1770
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1771
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1807:
	.string	"MRAA_INTEL_EDISON_FAB_C"
.LASF936:
	.string	"__S_TYPEISSEM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF622:
	.string	"__ldiv_t_defined 1"
.LASF1403:
	.string	"__CPU_SET_S(cpu,setsize,cpusetp) (__extension__ ({ size_t __cpu = (cpu); __cpu / 8 < (setsize) ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] |= __CPUMASK (__cpu)) : 0; }))"
.LASF1018:
	.string	"_POSIX_THREADS 200809L"
.LASF928:
	.string	"__S_IFDIR 0040000"
.LASF1577:
	.string	"ENAVAIL 119"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1664:
	.string	"B0 0000000"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF1782:
	.string	"I2C2_SCL_GPIO GPIOF"
.LASF697:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF1070:
	.string	"__ILP32_OFF32_CFLAGS \"-m32\""
.LASF915:
	.string	"__OPEN_NEEDS_MODE(oflag) (((oflag) & O_CREAT) != 0 || ((oflag) & __O_TMPFILE) == __O_TMPFILE)"
.LASF1613:
	.string	"VDISCARD 13"
.LASF1377:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS"
.LASF1149:
	.string	"_SC_LINE_MAX _SC_LINE_MAX"
.LASF1197:
	.string	"_SC_XOPEN_XCU_VERSION _SC_XOPEN_XCU_VERSION"
.LASF1230:
	.string	"_SC_NL_SETMAX _SC_NL_SETMAX"
.LASF488:
	.string	"_WCHAR_T_DEFINED "
.LASF1487:
	.string	"ESPIPE 29"
.LASF1763:
	.string	"CWERASE CTRL('w')"
.LASF658:
	.string	"_SYS_SELECT_H 1"
.LASF1107:
	.string	"_SC_CLK_TCK _SC_CLK_TCK"
.LASF1105:
	.string	"_SC_ARG_MAX _SC_ARG_MAX"
.LASF1671:
	.string	"B300 0000007"
.LASF1310:
	.string	"_SC_V7_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG"
.LASF342:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF1582:
	.string	"EMEDIUMTYPE 124"
.LASF1476:
	.string	"EXDEV 18"
.LASF1144:
	.string	"_SC_BC_SCALE_MAX _SC_BC_SCALE_MAX"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF412:
	.string	"INT_LEAST8_MAX (127)"
.LASF1412:
	.string	"sched_priority __sched_priority"
.LASF750:
	.string	"_IO_va_list __gnuc_va_list"
.LASF304:
	.string	"__USE_MISC 1"
.LASF526:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1049:
	.string	"_POSIX_MESSAGE_PASSING 200809L"
.LASF892:
	.string	"F_SHLCK 8"
.LASF995:
	.string	"_XOPEN_XPG2 1"
.LASF327:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF969:
	.string	"R_OK 4"
.LASF637:
	.string	"__pid_t_defined "
.LASF1176:
	.string	"_SC_GETGR_R_SIZE_MAX _SC_GETGR_R_SIZE_MAX"
.LASF360:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF1341:
	.string	"_CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS"
.LASF1634:
	.string	"ONLCR 0000004"
.LASF1471:
	.string	"EACCES 13"
.LASF921:
	.string	"st_atime st_atim.tv_sec"
.LASF505:
	.string	"WNOWAIT 0x01000000"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF1567:
	.string	"ETOOMANYREFS 109"
.LASF1169:
	.string	"_SC_PII_INTERNET_DGRAM _SC_PII_INTERNET_DGRAM"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF0:
	.string	"__STDC__ 1"
.LASF925:
	.string	"_STATBUF_ST_RDEV "
.LASF1835:
	.string	"_Bool"
.LASF370:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF1727:
	.string	"IEXTEN 0100000"
.LASF1597:
	.string	"NCCS 32"
.LASF1136:
	.string	"_SC_PAGE_SIZE _SC_PAGESIZE"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF1345:
	.string	"_CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS"
.LASF1398:
	.string	"__CPU_SETSIZE 1024"
.LASF695:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF1473:
	.string	"ENOTBLK 15"
.LASF1421:
	.string	"CLOCK_REALTIME_COARSE 5"
.LASF1658:
	.string	"FF1 0100000"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF354:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF1259:
	.string	"_SC_NETWORKING _SC_NETWORKING"
.LASF800:
	.string	"_IO_file_flags _flags"
.LASF1790:
	.string	"I2C2_SDA_PIN_SOURCE GPIO_PinSource10"
.LASF1137:
	.string	"_SC_RTSIG_MAX _SC_RTSIG_MAX"
.LASF1160:
	.string	"_SC_PII_XTI _SC_PII_XTI"
.LASF1550:
	.string	"ENOPROTOOPT 92"
.LASF241:
	.string	"__ELF__ 1"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF1592:
	.string	"ENOTSUP EOPNOTSUPP"
.LASF1830:
	.string	"I2CDevice"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF774:
	.string	"_IO_TIED_PUT_GET 0x400"
.LASF1046:
	.string	"_POSIX_SPAWN 200809L"
.LASF1499:
	.string	"EWOULDBLOCK EAGAIN"
.LASF758:
	.string	"_IOS_NOCREATE 32"
.LASF798:
	.string	"_IO_DONT_CLOSE 0100000"
.LASF1563:
	.string	"ENOBUFS 105"
.LASF480:
	.string	"__WCHAR_T__ "
.LASF1510:
	.string	"EBADE 52"
.LASF1779:
	.string	"I2C1_SDA_PIN GPIO_Pin_7"
.LASF499:
	.string	"_STDLIB_H 1"
.LASF1270:
	.string	"_SC_SYSTEM_DATABASE_R _SC_SYSTEM_DATABASE_R"
.LASF493:
	.string	"_WCHAR_T_DECLARED "
.LASF747:
	.string	"__need___va_list"
.LASF1530:
	.string	"EMULTIHOP 72"
.LASF685:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF1168:
	.string	"_SC_PII_INTERNET_STREAM _SC_PII_INTERNET_STREAM"
.LASF1482:
	.string	"EMFILE 24"
.LASF1833:
	.string	"i2c2ErrorCount"
.LASF254:
	.string	"_STDBOOL_H "
.LASF813:
	.string	"_IO_flockfile(_fp) "
.LASF1458:
	.string	"_ASM_GENERIC_ERRNO_BASE_H "
.LASF1534:
	.string	"ENOTUNIQ 76"
.LASF1725:
	.string	"FLUSHO 0010000"
.LASF1282:
	.string	"_SC_2_PBS_CHECKPOINT _SC_2_PBS_CHECKPOINT"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF340:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF1349:
	.string	"_CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS"
.LASF1118:
	.string	"_SC_PRIORITIZED_IO _SC_PRIORITIZED_IO"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF1797:
	.string	"uint16_t"
.LASF1017:
	.string	"_XOPEN_SHM 1"
.LASF536:
	.string	"_BITS_BYTESWAP_H 1"
.LASF237:
	.string	"linux 1"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF1465:
	.string	"E2BIG 7"
.LASF552:
	.string	"__STD_TYPE typedef"
.LASF868:
	.string	"O_DIRECTORY __O_DIRECTORY"
.LASF485:
	.string	"_WCHAR_T_ "
.LASF1402:
	.string	"__CPU_ZERO_S(setsize,cpusetp) do __builtin_memset (cpusetp, '\\0', setsize); while (0)"
.LASF686:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF317:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF815:
	.string	"_IO_ftrylockfile(_fp) "
.LASF1513:
	.string	"ENOANO 55"
.LASF1164:
	.string	"_SC_POLL _SC_POLL"
.LASF1542:
	.string	"EILSEQ 84"
.LASF701:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF610:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF1697:
	.string	"B460800 0010004"
.LASF1839:
	.string	"_i2c"
.LASF446:
	.string	"WINT_MAX (4294967295u)"
.LASF1455:
	.string	"EILSEQ"
.LASF1187:
	.string	"_SC_THREAD_PRIO_INHERIT _SC_THREAD_PRIO_INHERIT"
.LASF1088:
	.string	"_PC_PATH_MAX _PC_PATH_MAX"
.LASF706:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF1481:
	.string	"ENFILE 23"
.LASF424:
	.string	"INT_FAST8_MAX (127)"
.LASF963:
	.string	"S_IXGRP (S_IXUSR >> 3)"
.LASF541:
	.string	"__U32_TYPE unsigned int"
.LASF779:
	.string	"_IO_USER_LOCK 0x8000"
.LASF1667:
	.string	"B110 0000003"
.LASF1384:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS"
.LASF842:
	.string	"F_SETLKW64 7"
.LASF961:
	.string	"S_IRGRP (S_IRUSR >> 3)"
.LASF1526:
	.string	"EADV 68"
.LASF1376:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS"
.LASF1055:
	.string	"_POSIX_RAW_SOCKETS 200809L"
.LASF1623:
	.string	"INLCR 0000100"
.LASF777:
	.string	"_IO_IS_FILEBUF 0x2000"
.LASF823:
	.string	"SEEK_SET 0"
.LASF1065:
	.string	"_POSIX_V6_LPBIG_OFFBIG -1"
.LASF1578:
	.string	"EISNAM 120"
.LASF279:
	.string	"__USE_MISC"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF659:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF743:
	.string	"_IO_BUFSIZ _G_BUFSIZ"
.LASF1145:
	.string	"_SC_BC_STRING_MAX _SC_BC_STRING_MAX"
.LASF521:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF818:
	.string	"_VA_LIST_DEFINED "
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF634:
	.string	"__nlink_t_defined "
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1043:
	.string	"_POSIX_SHELL 1"
.LASF1013:
	.string	"_POSIX_VDISABLE '\\0'"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF479:
	.string	"__wchar_t__ "
.LASF227:
	.string	"__code_model_small__ 1"
.LASF762:
	.string	"_OLD_STDIO_MAGIC 0xFABC0000"
.LASF941:
	.string	"__S_IREAD 0400"
.LASF854:
	.string	"O_SYNC 04010000"
.LASF270:
	.string	"__USE_XOPEN_EXTENDED"
.LASF1024:
	.string	"_POSIX_THREAD_PRIO_INHERIT 200809L"
.LASF451:
	.string	"UINT8_C(c) c"
.LASF1651:
	.string	"TAB2 0010000"
.LASF593:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF371:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF827:
	.string	"L_tmpnam 20"
.LASF561:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF1255:
	.string	"_SC_FILE_SYSTEM _SC_FILE_SYSTEM"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF1724:
	.string	"ECHOKE 0004000"
.LASF848:
	.string	"O_EXCL 0200"
.LASF1382:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS"
.LASF1147:
	.string	"_SC_EQUIV_CLASS_MAX _SC_EQUIV_CLASS_MAX"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF608:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF908:
	.string	"POSIX_FADV_DONTNEED __POSIX_FADV_DONTNEED"
.LASF1723:
	.string	"ECHOPRT 0002000"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF1258:
	.string	"_SC_SINGLE_PROCESS _SC_SINGLE_PROCESS"
.LASF1618:
	.string	"BRKINT 0000002"
.LASF589:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF782:
	.string	"_IO_FLAGS2_USER_WBUF 8"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF869:
	.string	"O_NOFOLLOW __O_NOFOLLOW"
.LASF1798:
	.string	"uint32_t"
.LASF649:
	.string	"__need_time_t"
.LASF1761:
	.string	"CLNEXT CTRL('v')"
.LASF1701:
	.string	"B1000000 0010010"
.LASF905:
	.string	"POSIX_FADV_RANDOM 1"
.LASF966:
	.string	"S_IWOTH (S_IWGRP >> 3)"
.LASF979:
	.string	"MRAA_SUB_PLATFORM_BIT_SHIFT 9"
.LASF684:
	.string	"_SYS_SYSMACROS_H 1"
.LASF472:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF1448:
	.string	"PTHREAD_BARRIER_SERIAL_THREAD -1"
.LASF1284:
	.string	"_SC_V6_ILP32_OFFBIG _SC_V6_ILP32_OFFBIG"
.LASF428:
	.string	"UINT_FAST8_MAX (255)"
.LASF655:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF883:
	.string	"__F_GETSIG 11"
.LASF877:
	.string	"F_SETFL 4"
.LASF1059:
	.string	"_POSIX_TRACE -1"
.LASF1688:
	.string	"CREAD 0000200"
.LASF1497:
	.string	"ENOTEMPTY 39"
.LASF810:
	.string	"_IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF1117:
	.string	"_SC_ASYNCHRONOUS_IO _SC_ASYNCHRONOUS_IO"
.LASF1360:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS"
.LASF996:
	.string	"_XOPEN_XPG3 1"
.LASF876:
	.string	"F_GETFL 3"
.LASF490:
	.string	"___int_wchar_t_h "
.LASF1475:
	.string	"EEXIST 17"
.LASF1081:
	.string	"L_SET SEEK_SET"
.LASF261:
	.string	"__USE_ISOC11"
.LASF1573:
	.string	"EINPROGRESS 115"
.LASF744:
	.string	"_IO_va_list _G_va_list"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF916:
	.string	"_BITS_STAT_H 1"
.LASF1554:
	.string	"EPFNOSUPPORT 96"
.LASF315:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF985:
	.string	"_POSIX_VERSION 200809L"
.LASF783:
	.string	"_IO_SKIPWS 01"
.LASF967:
	.string	"S_IXOTH (S_IXGRP >> 3)"
.LASF1423:
	.string	"CLOCK_BOOTTIME 7"
.LASF1775:
	.string	"I2C1_SCL_PIN_SOURCE GPIO_PinSource6"
.LASF1787:
	.string	"I2C2_SDA_GPIO GPIOA"
.LASF965:
	.string	"S_IROTH (S_IRGRP >> 3)"
.LASF1156:
	.string	"_SC_2_FORT_RUN _SC_2_FORT_RUN"
.LASF398:
	.string	"INT32_MIN (-2147483647-1)"
.LASF1514:
	.string	"EBADRQC 56"
.LASF1005:
	.string	"_POSIX_PRIORITY_SCHEDULING 200809L"
.LASF1778:
	.string	"I2C1_SDA_GPIO_AF GPIO_AF_4"
.LASF694:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF1035:
	.string	"_LFS_LARGEFILE 1"
.LASF968:
	.string	"S_IRWXO (S_IRWXG >> 3)"
.LASF1096:
	.string	"_PC_SOCK_MAXBUF _PC_SOCK_MAXBUF"
.LASF1606:
	.string	"VMIN 6"
.LASF548:
	.string	"__SLONG32_TYPE int"
.LASF788:
	.string	"_IO_OCT 040"
.LASF1174:
	.string	"_SC_THREADS _SC_THREADS"
.LASF1535:
	.string	"EBADFD 77"
.LASF1227:
	.string	"_SC_NL_LANGMAX _SC_NL_LANGMAX"
.LASF1050:
	.string	"_POSIX_THREAD_PROCESS_SHARED 200809L"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF766:
	.string	"_IO_NO_READS 4"
.LASF1434:
	.string	"PTHREAD_RWLOCK_INITIALIZER { { 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, 0 } }"
.LASF882:
	.string	"__F_SETSIG 10"
.LASF420:
	.string	"INT_FAST8_MIN (-128)"
.LASF612:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF1756:
	.string	"CSUSP CTRL('z')"
.LASF1179:
	.string	"_SC_TTY_NAME_MAX _SC_TTY_NAME_MAX"
.LASF1385:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS"
.LASF571:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1225:
	.string	"_SC_USHRT_MAX _SC_USHRT_MAX"
.LASF516:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF344:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF547:
	.string	"__UWORD_TYPE unsigned long int"
.LASF1524:
	.string	"EREMOTE 66"
.LASF1095:
	.string	"_PC_PRIO_IO _PC_PRIO_IO"
.LASF1312:
	.string	"_SC_V7_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG"
.LASF1239:
	.string	"_SC_ADVISORY_INFO _SC_ADVISORY_INFO"
.LASF604:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF980:
	.string	"MRAA_SUB_PLATFORM_MASK (1<<MRAA_SUB_PLATFORM_BIT_SHIFT)"
.LASF855:
	.string	"O_FSYNC O_SYNC"
.LASF1558:
	.string	"ENETDOWN 100"
.LASF1731:
	.string	"TCIOFF 2"
.LASF1716:
	.string	"ECHO 0000010"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF377:
	.string	"__stub_chflags "
.LASF1593:
	.string	"errno (*__errno_location ())"
.LASF1394:
	.string	"SCHED_RR 2"
.LASF740:
	.string	"_IO_uid_t __uid_t"
.LASF753:
	.string	"_IOS_INPUT 1"
.LASF1841:
	.string	"index"
.LASF1703:
	.string	"B1500000 0010012"
.LASF724:
	.string	"____mbstate_t_defined 1"
.LASF1480:
	.string	"EINVAL 22"
.LASF1485:
	.string	"EFBIG 27"
.LASF520:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF1296:
	.string	"_SC_LEVEL1_DCACHE_ASSOC _SC_LEVEL1_DCACHE_ASSOC"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF729:
	.string	"_G_HAVE_MREMAP 1"
.LASF447:
	.string	"INT8_C(c) c"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF1501:
	.string	"EIDRM 43"
.LASF475:
	.string	"_GCC_SIZE_T "
.LASF386:
	.string	"__stub_setlogin "
.LASF1135:
	.string	"_SC_PAGESIZE _SC_PAGESIZE"
.LASF893:
	.string	"LOCK_SH 1"
.LASF1277:
	.string	"_SC_2_PBS_LOCATE _SC_2_PBS_LOCATE"
.LASF923:
	.string	"st_ctime st_ctim.tv_sec"
.LASF389:
	.string	"__stub_stty "
.LASF366:
	.string	"__WORDSIZE 64"
.LASF1594:
	.string	"__need_Emath"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF1331:
	.string	"_CS_LFS_LDFLAGS _CS_LFS_LDFLAGS"
.LASF1057:
	.string	"_POSIX_SPORADIC_SERVER -1"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF1293:
	.string	"_SC_LEVEL1_ICACHE_ASSOC _SC_LEVEL1_ICACHE_ASSOC"
.LASF1404:
	.string	"__CPU_CLR_S(cpu,setsize,cpusetp) (__extension__ ({ size_t __cpu = (cpu); __cpu / 8 < (setsize) ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] &= ~__CPUMASK (__cpu)) : 0; }))"
.LASF635:
	.string	"__uid_t_defined "
.LASF1576:
	.string	"ENOTNAM 118"
.LASF324:
	.string	"__long_double_t long double"
.LASF895:
	.string	"LOCK_NB 4"
.LASF1461:
	.string	"ESRCH 3"
.LASF1665:
	.string	"B50 0000001"
.LASF331:
	.string	"__END_NAMESPACE_C99 "
.LASF1066:
	.string	"_XBS5_LPBIG_OFFBIG -1"
.LASF1006:
	.string	"_POSIX_SYNCHRONIZED_IO 200809L"
.LASF946:
	.string	"S_IFMT __S_IFMT"
.LASF1155:
	.string	"_SC_2_FORT_DEV _SC_2_FORT_DEV"
.LASF517:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF1235:
	.string	"_SC_XBS5_LPBIG_OFFBIG _SC_XBS5_LPBIG_OFFBIG"
.LASF540:
	.string	"__S32_TYPE int"
.LASF1741:
	.string	"_SYS_TTYDEFAULTS_H_ "
.LASF1628:
	.string	"IXANY 0004000"
.LASF1272:
	.string	"_SC_TYPED_MEMORY_OBJECTS _SC_TYPED_MEMORY_OBJECTS"
.LASF864:
	.string	"__O_TMPFILE (020000000 | __O_DIRECTORY)"
.LASF677:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF952:
	.string	"S_IFLNK __S_IFLNK"
.LASF473:
	.string	"_SIZE_T_DECLARED "
.LASF1019:
	.string	"_POSIX_REENTRANT_FUNCTIONS 1"
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF471:
	.string	"_SIZE_T_DEFINED "
.LASF664:
	.string	"_SIGSET_H_types 1"
.LASF1389:
	.string	"__need_getopt"
.LASF745:
	.string	"_IO_wint_t wint_t"
.LASF826:
	.string	"P_tmpdir \"/tmp\""
.LASF987:
	.string	"_POSIX2_VERSION __POSIX2_THIS_VERSION"
.LASF351:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF1509:
	.string	"EL2HLT 51"
.LASF383:
	.string	"__stub_lchmod "
.LASF1196:
	.string	"_SC_XOPEN_VERSION _SC_XOPEN_VERSION"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF534:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF481:
	.string	"_WCHAR_T "
.LASF1288:
	.string	"_SC_TRACE _SC_TRACE"
.LASF1388:
	.string	"__need_getopt "
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF1538:
	.string	"ELIBBAD 80"
.LASF1467:
	.string	"EBADF 9"
.LASF1281:
	.string	"_SC_STREAMS _SC_STREAMS"
.LASF728:
	.string	"_G_HAVE_MMAP 1"
.LASF973:
	.string	"F_ULOCK 0"
.LASF1823:
	.string	"MRAA_NULL_PLATFORM"
.LASF839:
	.string	"__O_LARGEFILE 0"
.LASF1661:
	.string	"VT1 0040000"
.LASF709:
	.string	"alloca"
.LASF627:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF1329:
	.string	"_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF1636:
	.string	"ONOCR 0000020"
.LASF1616:
	.string	"VEOL2 16"
.LASF429:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF465:
	.string	"_T_SIZE_ "
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF1738:
	.string	"TCSAFLUSH 2"
.LASF1351:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS"
.LASF1780:
	.string	"I2C1_SDA_PIN_SOURCE GPIO_PinSource7"
.LASF1676:
	.string	"B4800 0000014"
.LASF1045:
	.string	"_POSIX_SPIN_LOCKS 200809L"
.LASF1713:
	.string	"ISIG 0000001"
.LASF1453:
	.string	"_ERRNO_H 1"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF257:
	.string	"false 0"
.LASF1056:
	.string	"_POSIX2_CHAR_TERM 200809L"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF1416:
	.string	"CLOCK_REALTIME 0"
.LASF1706:
	.string	"B3000000 0010015"
.LASF1813:
	.string	"MRAA_INTEL_NUC5"
.LASF296:
	.string	"__USE_POSIX 1"
.LASF997:
	.string	"_XOPEN_XPG4 1"
.LASF265:
	.string	"__USE_POSIX"
.LASF1214:
	.string	"_SC_WORD_BIT _SC_WORD_BIT"
.LASF1223:
	.string	"_SC_UINT_MAX _SC_UINT_MAX"
.LASF378:
	.string	"__stub_fattach "
.LASF632:
	.string	"__gid_t_defined "
.LASF1477:
	.string	"ENODEV 19"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF1805:
	.string	"MRAA_INTEL_GALILEO_GEN1"
.LASF1806:
	.string	"MRAA_INTEL_GALILEO_GEN2"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF1248:
	.string	"_SC_DEVICE_SPECIFIC _SC_DEVICE_SPECIFIC"
.LASF289:
	.string	"__USE_ISOC99 1"
.LASF1097:
	.string	"_PC_FILESIZEBITS _PC_FILESIZEBITS"
.LASF292:
	.string	"_POSIX_SOURCE"
.LASF477:
	.string	"__size_t "
.LASF427:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1121:
	.string	"_SC_MAPPED_FILES _SC_MAPPED_FILES"
.LASF1261:
	.string	"_SC_SPIN_LOCKS _SC_SPIN_LOCKS"
.LASF910:
	.string	"AT_FDCWD -100"
.LASF816:
	.string	"_IO_cleanup_region_start(_fct,_fp) "
.LASF1368:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS"
.LASF337:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF1834:
	.string	"i2cOverClock"
.LASF1808:
	.string	"MRAA_INTEL_DE3815"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF365:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF887:
	.string	"FD_CLOEXEC 1"
.LASF633:
	.string	"__mode_t_defined "
.LASF846:
	.string	"O_RDWR 02"
.LASF1598:
	.string	"_HAVE_STRUCT_TERMIOS_C_ISPEED 1"
.LASF1206:
	.string	"_SC_XOPEN_XPG3 _SC_XOPEN_XPG3"
.LASF1543:
	.string	"ERESTART 85"
.LASF1183:
	.string	"_SC_THREAD_THREADS_MAX _SC_THREAD_THREADS_MAX"
.LASF992:
	.string	"_POSIX2_LOCALEDEF __POSIX2_THIS_VERSION"
.LASF1199:
	.string	"_SC_XOPEN_CRYPT _SC_XOPEN_CRYPT"
.LASF1418:
	.string	"CLOCK_PROCESS_CPUTIME_ID 2"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF1714:
	.string	"ICANON 0000002"
.LASF984:
	.string	"_UNISTD_H 1"
.LASF794:
	.string	"_IO_SCIENTIFIC 04000"
.LASF954:
	.string	"S_ISUID __S_ISUID"
.LASF217:
	.string	"__amd64 1"
.LASF1306:
	.string	"_SC_LEVEL4_CACHE_LINESIZE _SC_LEVEL4_CACHE_LINESIZE"
.LASF1445:
	.string	"PTHREAD_CANCEL_ASYNCHRONOUS PTHREAD_CANCEL_ASYNCHRONOUS"
.LASF1674:
	.string	"B1800 0000012"
.LASF1795:
	.string	"unsigned char"
.LASF1663:
	.string	"CBAUD 0010017"
.LASF618:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF421:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF1646:
	.string	"CR2 0002000"
.LASF1414:
	.string	"_BITS_TIME_H 1"
.LASF1764:
	.string	"CREPRINT CTRL('r')"
.LASF1320:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT _SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF836:
	.string	"getc(_fp) _IO_getc (_fp)"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF1133:
	.string	"_SC_MQ_PRIO_MAX _SC_MQ_PRIO_MAX"
.LASF1650:
	.string	"TAB1 0004000"
.LASF1317:
	.string	"_SC_TRACE_USER_EVENT_MAX _SC_TRACE_USER_EVENT_MAX"
.LASF225:
	.string	"__k8 1"
.LASF1837:
	.string	"src/main/drivers/bus_i2c_edison.c"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF1260:
	.string	"_SC_READER_WRITER_LOCKS _SC_READER_WRITER_LOCKS"
.LASF1711:
	.string	"CMSPAR 010000000000"
.LASF1637:
	.string	"ONLRET 0000040"
.LASF1765:
	.string	"CEOT CEOF"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF926:
	.string	"_STATBUF_ST_NSEC "
.LASF263:
	.string	"__USE_ISOC95"
.LASF262:
	.string	"__USE_ISOC99"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF1090:
	.string	"_PC_CHOWN_RESTRICTED _PC_CHOWN_RESTRICTED"
.LASF1399:
	.string	"__NCPUBITS (8 * sizeof (__cpu_mask))"
.LASF448:
	.string	"INT16_C(c) c"
.LASF1825:
	.string	"mraa_i2c_context"
.LASF1746:
	.string	"TTYDEF_SPEED (B9600)"
.LASF1020:
	.string	"_POSIX_THREAD_SAFE_FUNCTIONS 200809L"
.LASF1077:
	.string	"STDOUT_FILENO 1"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1464:
	.string	"ENXIO 6"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF1672:
	.string	"B600 0000010"
.LASF220:
	.string	"__x86_64__ 1"
.LASF1324:
	.string	"_CS_GNU_LIBC_VERSION _CS_GNU_LIBC_VERSION"
.LASF374:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF1717:
	.string	"ECHOE 0000020"
.LASF532:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF272:
	.string	"__USE_XOPEN2K"
.LASF268:
	.string	"__USE_POSIX199506"
.LASF1462:
	.string	"EINTR 4"
.LASF318:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF239:
	.string	"__unix__ 1"
.LASF1596:
	.string	"_TERMIOS_H 1"
.LASF1715:
	.string	"XCASE 0000004"
.LASF1547:
	.string	"EDESTADDRREQ 89"
.LASF935:
	.string	"__S_TYPEISMQ(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF606:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF1436:
	.string	"PTHREAD_EXPLICIT_SCHED PTHREAD_EXPLICIT_SCHED"
.LASF886:
	.string	"F_DUPFD_CLOEXEC 1030"
.LASF1093:
	.string	"_PC_SYNC_IO _PC_SYNC_IO"
.LASF1002:
	.string	"_BITS_POSIX_OPT_H 1"
.LASF416:
	.string	"UINT_LEAST8_MAX (255)"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1339:
	.string	"_CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS"
.LASF757:
	.string	"_IOS_TRUNC 16"
.LASF355:
	.string	"__wur "
.LASF713:
	.string	"_STDIO_H 1"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF1776:
	.string	"I2C1_SCL_CLK_SOURCE RCC_AHBPeriph_GPIOB"
.LASF1730:
	.string	"TCOON 1"
.LASF519:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF1824:
	.string	"MRAA_UNKNOWN_PLATFORM"
.LASF1391:
	.string	"_SCHED_H 1"
.LASF1116:
	.string	"_SC_TIMERS _SC_TIMERS"
.LASF1786:
	.string	"I2C2_SCL_CLK_SOURCE RCC_AHBPeriph_GPIOF"
.LASF772:
	.string	"_IO_IN_BACKUP 0x100"
.LASF511:
	.string	"P_PID"
.LASF1181:
	.string	"_SC_THREAD_KEYS_MAX _SC_THREAD_KEYS_MAX"
.LASF646:
	.string	"__clock_t_defined 1"
.LASF1438:
	.string	"PTHREAD_SCOPE_PROCESS PTHREAD_SCOPE_PROCESS"
.LASF288:
	.string	"_DEFAULT_SOURCE 1"
.LASF487:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1226:
	.string	"_SC_NL_ARGMAX _SC_NL_ARGMAX"
.LASF563:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF510:
	.string	"P_ALL"
.LASF1150:
	.string	"_SC_RE_DUP_MAX _SC_RE_DUP_MAX"
.LASF721:
	.string	"_IO_STDIO_H "
.LASF1269:
	.string	"_SC_SYSTEM_DATABASE _SC_SYSTEM_DATABASE"
.LASF1194:
	.string	"_SC_ATEXIT_MAX _SC_ATEXIT_MAX"
.LASF1068:
	.string	"_POSIX_V6_LP64_OFF64 1"
.LASF1749:
	.string	"CEOL _POSIX_VDISABLE"
.LASF326:
	.string	"__END_DECLS "
.LASF1354:
	.string	"_CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS"
.LASF673:
	.string	"__NFDBITS"
.LASF316:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF1789:
	.string	"I2C2_SDA_PIN GPIO_Pin_10"
.LASF395:
	.string	"__intptr_t_defined "
.LASF1541:
	.string	"ELIBEXEC 83"
.LASF403:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF414:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF369:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF381:
	.string	"__stub_getmsg "
.LASF522:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF1742:
	.string	"TTYDEF_IFLAG (BRKINT | ISTRIP | ICRNL | IMAXBEL | IXON | IXANY)"
.LASF988:
	.string	"_POSIX2_C_VERSION __POSIX2_THIS_VERSION"
.LASF240:
	.string	"unix 1"
.LASF1546:
	.string	"ENOTSOCK 88"
.LASF1249:
	.string	"_SC_DEVICE_SPECIFIC_R _SC_DEVICE_SPECIFIC_R"
.LASF692:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF710:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF1729:
	.string	"TCOOFF 0"
.LASF545:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF245:
	.string	"EDISON 1"
.LASF912:
	.string	"AT_REMOVEDIR 0x200"
.LASF275:
	.string	"__USE_XOPEN2K8XSI"
.LASF714:
	.string	"__need_FILE "
.LASF1528:
	.string	"ECOMM 70"
.LASF663:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF652:
	.string	"__timer_t_defined 1"
.LASF1186:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING _SC_THREAD_PRIORITY_SCHEDULING"
.LASF1493:
	.string	"EDEADLK 35"
.LASF431:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF746:
	.string	"__need___va_list "
.LASF1539:
	.string	"ELIBSCN 81"
.LASF1737:
	.string	"TCSADRAIN 1"
.LASF489:
	.string	"_WCHAR_T_H "
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1654:
	.string	"BS0 0000000"
.LASF525:
	.string	"_ENDIAN_H 1"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF1529:
	.string	"EPROTO 71"
.LASF704:
	.string	"__PTHREAD_SPINS 0, 0"
.LASF1718:
	.string	"ECHOK 0000040"
.LASF1162:
	.string	"_SC_PII_INTERNET _SC_PII_INTERNET"
.LASF453:
	.string	"UINT32_C(c) c ## U"
.LASF1693:
	.string	"CBAUDEX 0010000"
.LASF1579:
	.string	"EREMOTEIO 121"
.LASF407:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF1237:
	.string	"_SC_XOPEN_REALTIME _SC_XOPEN_REALTIME"
.LASF1207:
	.string	"_SC_XOPEN_XPG4 _SC_XOPEN_XPG4"
.LASF1390:
	.string	"_PTHREAD_H 1"
.LASF1468:
	.string	"ECHILD 10"
.LASF1511:
	.string	"EBADR 53"
.LASF476:
	.string	"_SIZET_ "
.LASF1042:
	.string	"_POSIX_READER_WRITER_LOCKS 200809L"
.LASF527:
	.string	"__BIG_ENDIAN 4321"
.LASF1748:
	.string	"CEOF CTRL('d')"
.LASF919:
	.string	"_MKNOD_VER_LINUX 0"
.LASF991:
	.string	"_POSIX2_SW_DEV __POSIX2_THIS_VERSION"
.LASF380:
	.string	"__stub_fdetach "
.LASF1283:
	.string	"_SC_V6_ILP32_OFF32 _SC_V6_ILP32_OFF32"
.LASF859:
	.string	"__O_CLOEXEC 02000000"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF284:
	.string	"__KERNEL_STRICT_NAMES"
.LASF711:
	.string	"__COMPAR_FN_T "
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF551:
	.string	"__U64_TYPE unsigned long int"
.LASF1315:
	.string	"_SC_TRACE_NAME_MAX _SC_TRACE_NAME_MAX"
.LASF773:
	.string	"_IO_LINE_BUF 0x200"
.LASF805:
	.string	"_IO_BE(expr,res) __builtin_expect ((expr), res)"
.LASF426:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF575:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF1702:
	.string	"B1152000 0010011"
.LASF898:
	.string	"FFSYNC O_FSYNC"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF790:
	.string	"_IO_SHOWBASE 0200"
.LASF513:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF508:
	.string	"__WCLONE 0x80000000"
.LASF1791:
	.string	"I2C2_SDA_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF907:
	.string	"POSIX_FADV_WILLNEED 3"
.LASF1691:
	.string	"HUPCL 0002000"
.LASF897:
	.string	"FAPPEND O_APPEND"
.LASF277:
	.string	"__USE_LARGEFILE64"
.LASF1044:
	.string	"_POSIX_TIMEOUTS 200809L"
.LASF657:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF356:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF248:
	.string	"__REVISION__ \"042edaa\""
.LASF17:
	.string	"__LP64__ 1"
.LASF875:
	.string	"F_SETFD 2"
.LASF539:
	.string	"__U16_TYPE unsigned short int"
.LASF600:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF742:
	.string	"_IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE"
.LASF1262:
	.string	"_SC_REGEXP _SC_REGEXP"
.LASF1783:
	.string	"I2C2_SCL_GPIO_AF GPIO_AF_4"
.LASF1433:
	.string	"PTHREAD_MUTEX_INITIALIZER { { 0, 0, 0, 0, 0, __PTHREAD_SPINS, { 0, 0 } } }"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF902:
	.string	"__POSIX_FADV_DONTNEED 4"
.LASF590:
	.string	"__FD_SETSIZE 1024"
.LASF611:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF346:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF1559:
	.string	"ENETUNREACH 101"
.LASF1076:
	.string	"STDIN_FILENO 0"
.LASF285:
	.string	"__KERNEL_STRICT_NAMES "
.LASF258:
	.string	"__bool_true_false_are_defined 1"
.LASF716:
	.string	"__FILE_defined 1"
.LASF1441:
	.string	"PTHREAD_COND_INITIALIZER { { 0, 0, 0, 0, 0, (void *) 0, 0, 0 } }"
.LASF1289:
	.string	"_SC_TRACE_EVENT_FILTER _SC_TRACE_EVENT_FILTER"
.LASF1231:
	.string	"_SC_NL_TEXTMAX _SC_NL_TEXTMAX"
.LASF904:
	.string	"POSIX_FADV_NORMAL 0"
.LASF1228:
	.string	"_SC_NL_MSGMAX _SC_NL_MSGMAX"
.LASF1632:
	.string	"OPOST 0000001"
.LASF945:
	.string	"UTIME_OMIT ((1l << 30) - 2l)"
.LASF1110:
	.string	"_SC_STREAM_MAX _SC_STREAM_MAX"
.LASF470:
	.string	"_SIZE_T_DEFINED_ "
.LASF1355:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS"
.LASF1424:
	.string	"CLOCK_REALTIME_ALARM 8"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF533:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF1322:
	.string	"_CS_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1520:
	.string	"ETIME 62"
.LASF1492:
	.string	"ERANGE 34"
.LASF1555:
	.string	"EAFNOSUPPORT 97"
.LASF577:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF931:
	.string	"__S_IFREG 0100000"
.LASF1104:
	.string	"_PC_2_SYMLINKS _PC_2_SYMLINKS"
.LASF379:
	.string	"__stub_fchflags "
.LASF830:
	.string	"L_ctermid 9"
.LASF1743:
	.string	"TTYDEF_OFLAG (OPOST | ONLCR | XTABS)"
.LASF543:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF1075:
	.string	"__LP64_OFF64_LDFLAGS \"-m64\""
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF1698:
	.string	"B500000 0010005"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF1694:
	.string	"B57600 0010001"
.LASF269:
	.string	"__USE_XOPEN"
.LASF1818:
	.string	"MRAA_INTEL_GT_TUCHUCK"
.LASF770:
	.string	"_IO_DELETE_DONT_CLOSE 0x40"
.LASF1689:
	.string	"PARENB 0000400"
.LASF1415:
	.string	"CLOCKS_PER_SEC ((clock_t) 1000000)"
.LASF631:
	.string	"__dev_t_defined "
.LASF367:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF1034:
	.string	"_LFS64_ASYNCHRONOUS_IO 1"
.LASF1605:
	.string	"VTIME 5"
.LASF492:
	.string	"_GCC_WCHAR_T "
.LASF1171:
	.string	"_SC_PII_OSI_CLTS _SC_PII_OSI_CLTS"
.LASF1602:
	.string	"VERASE 2"
.LASF474:
	.string	"___int_size_t_h "
.LASF556:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF653:
	.string	"__need_timer_t"
.LASF1459:
	.string	"EPERM 1"
.LASF443:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF394:
	.string	"__uint32_t_defined "
.LASF719:
	.string	"__need___FILE"
.LASF580:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF373:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF812:
	.string	"_IO_peekc(_fp) _IO_peekc_unlocked (_fp)"
.LASF1560:
	.string	"ENETRESET 102"
.LASF458:
	.string	"__need_size_t "
.LASF1615:
	.string	"VLNEXT 15"
.LASF1370:
	.string	"_CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS"
.LASF843:
	.string	"O_ACCMODE 0003"
.LASF1036:
	.string	"_LFS64_LARGEFILE 1"
.LASF1265:
	.string	"_SC_SIGNALS _SC_SIGNALS"
.LASF650:
	.string	"__clockid_t_defined 1"
.LASF494:
	.string	"_BSD_WCHAR_T_"
.LASF1254:
	.string	"_SC_FILE_LOCKING _SC_FILE_LOCKING"
.LASF1180:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF1190:
	.string	"_SC_NPROCESSORS_CONF _SC_NPROCESSORS_CONF"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF1690:
	.string	"PARODD 0001000"
.LASF1678:
	.string	"B19200 0000016"
.LASF1232:
	.string	"_SC_XBS5_ILP32_OFF32 _SC_XBS5_ILP32_OFF32"
.LASF468:
	.string	"_SIZE_T_ "
.LASF759:
	.string	"_IOS_NOREPLACE 64"
.LASF1719:
	.string	"ECHONL 0000100"
.LASF1682:
	.string	"CSIZE 0000060"
.LASF1007:
	.string	"_POSIX_FSYNC 200809L"
.LASF1012:
	.string	"_POSIX_CHOWN_RESTRICTED 0"
.LASF1172:
	.string	"_SC_PII_OSI_M _SC_PII_OSI_M"
.LASF861:
	.string	"__O_NOATIME 01000000"
.LASF1140:
	.string	"_SC_SIGQUEUE_MAX _SC_SIGQUEUE_MAX"
.LASF478:
	.string	"__need_size_t"
.LASF1659:
	.string	"VTDLY 0040000"
.LASF609:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF1280:
	.string	"_SC_SYMLOOP_MAX _SC_SYMLOOP_MAX"
.LASF1527:
	.string	"ESRMNT 69"
.LASF1809:
	.string	"MRAA_INTEL_MINNOWBOARD_MAX"
.LASF1504:
	.string	"EL3HLT 46"
.LASF1346:
	.string	"_CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS"
.LASF1062:
	.string	"_POSIX_TRACE_LOG -1"
.LASF802:
	.string	"_IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))"
.LASF1777:
	.string	"I2C1_SDA_GPIO GPIOB"
.LASF1710:
	.string	"CIBAUD 002003600000"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF944:
	.string	"UTIME_NOW ((1l << 30) - 1l)"
.LASF1838:
	.string	"/home/aravind/git/cleanflight"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1229:
	.string	"_SC_NL_NMAX _SC_NL_NMAX"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF1722:
	.string	"ECHOCTL 0001000"
.LASF1447:
	.string	"PTHREAD_ONCE_INIT 0"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF457:
	.string	"_GCC_WRAP_STDINT_H "
.LASF1427:
	.string	"TIMER_ABSTIME 1"
.LASF613:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF1732:
	.string	"TCION 3"
.LASF456:
	.string	"UINTMAX_C(c) c ## UL"
.LASF271:
	.string	"__USE_UNIX98"
.LASF707:
	.string	"__malloc_and_calloc_defined "
.LASF970:
	.string	"W_OK 2"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF321:
	.string	"__CONCAT(x,y) x ## y"
.LASF1516:
	.string	"EDEADLOCK EDEADLK"
.LASF796:
	.string	"_IO_UNITBUF 020000"
.LASF1770:
	.string	"I2C_LONG_TIMEOUT ((uint32_t)(10 * I2C_SHORT_TIMEOUT))"
.LASF1091:
	.string	"_PC_NO_TRUNC _PC_NO_TRUNC"
.LASF873:
	.string	"F_DUPFD 0"
.LASF382:
	.string	"__stub_gtty "
.LASF1011:
	.string	"_POSIX_MEMORY_PROTECTION 200809L"
.LASF1640:
	.string	"NLDLY 0000400"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF588:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF665:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF781:
	.string	"_IO_FLAGS2_NOTCANCEL 2"
.LASF797:
	.string	"_IO_STDIO 040000"
.LASF1287:
	.string	"_SC_HOST_NAME_MAX _SC_HOST_NAME_MAX"
.LASF1503:
	.string	"EL2NSYNC 45"
.LASF956:
	.string	"S_ISVTX __S_ISVTX"
.LASF1085:
	.string	"_PC_MAX_CANON _PC_MAX_CANON"
.LASF1114:
	.string	"_SC_REALTIME_SIGNALS _SC_REALTIME_SIGNALS"
.LASF1338:
	.string	"_CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS"
.LASF408:
	.string	"INT_LEAST8_MIN (-128)"
.LASF737:
	.string	"_IO_off_t __off_t"
.LASF642:
	.string	"__need_clock_t "
.LASF1159:
	.string	"_SC_PII _SC_PII"
.LASF1662:
	.string	"XTABS 0014000"
.LASF454:
	.string	"UINT64_C(c) c ## UL"
.LASF1753:
	.string	"CKILL CTRL('u')"
.LASF1609:
	.string	"VSTOP 9"
.LASF690:
	.string	"__fsblkcnt_t_defined "
.LASF1240:
	.string	"_SC_BARRIERS _SC_BARRIERS"
.LASF1221:
	.string	"_SC_SHRT_MIN _SC_SHRT_MIN"
.LASF1454:
	.string	"EDOM"
.LASF1037:
	.string	"_LFS64_STDIO 1"
.LASF1630:
	.string	"IMAXBEL 0020000"
.LASF531:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF748:
	.string	"__GNUC_VA_LIST "
.LASF888:
	.string	"F_RDLCK 0"
.LASF723:
	.string	"__need_mbstate_t "
.LASF691:
	.string	"__fsfilcnt_t_defined "
.LASF1165:
	.string	"_SC_SELECT _SC_SELECT"
.LASF500:
	.string	"WNOHANG 1"
.LASF1358:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS"
.LASF1130:
	.string	"_SC_AIO_PRIO_DELTA_MAX _SC_AIO_PRIO_DELTA_MAX"
.LASF1705:
	.string	"B2500000 0010014"
.LASF726:
	.string	"__need_wint_t"
.LASF696:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF1649:
	.string	"TAB0 0000000"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF845:
	.string	"O_WRONLY 01"
.LASF755:
	.string	"_IOS_ATEND 4"
.LASF307:
	.string	"__GNU_LIBRARY__"
.LASF786:
	.string	"_IO_INTERNAL 010"
.LASF1422:
	.string	"CLOCK_MONOTONIC_COARSE 6"
.LASF1328:
	.string	"_CS_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF305:
	.string	"__USE_ATFILE 1"
.LASF1321:
	.string	"_CS_PATH _CS_PATH"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF1010:
	.string	"_POSIX_MEMLOCK_RANGE 200809L"
.LASF1518:
	.string	"ENOSTR 60"
.LASF756:
	.string	"_IOS_APPEND 8"
.LASF1392:
	.string	"SCHED_OTHER 0"
.LASF821:
	.string	"_IONBF 2"
.LASF1826:
	.string	"I2CDEV_1"
.LASF754:
	.string	"_IOS_OUTPUT 2"
.LASF949:
	.string	"S_IFBLK __S_IFBLK"
.LASF1629:
	.string	"IXOFF 0010000"
.LASF795:
	.string	"_IO_FIXED 010000"
.LASF1709:
	.string	"__MAX_BAUD B4000000"
.LASF1080:
	.string	"__socklen_t_defined "
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF418:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF341:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF1635:
	.string	"OCRNL 0000010"
.LASF1291:
	.string	"_SC_TRACE_LOG _SC_TRACE_LOG"
.LASF1757:
	.string	"CTIME 0"
.LASF828:
	.string	"TMP_MAX 238328"
.LASF230:
	.string	"__SSE2__ 1"
.LASF972:
	.string	"F_OK 0"
.LASF502:
	.string	"WSTOPPED 2"
.LASF496:
	.string	"NULL"
.LASF993:
	.string	"_XOPEN_VERSION 700"
.LASF1565:
	.string	"ENOTCONN 107"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF688:
	.string	"__blksize_t_defined "
.LASF601:
	.string	"htole32(x) (x)"
.LASF702:
	.string	"__have_pthread_attr_t 1"
.LASF1653:
	.string	"BSDLY 0020000"
.LASF503:
	.string	"WEXITED 4"
.LASF1201:
	.string	"_SC_XOPEN_SHM _SC_XOPEN_SHM"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF1581:
	.string	"ENOMEDIUM 123"
.LASF715:
	.string	"__need___FILE "
.LASF1551:
	.string	"EPROTONOSUPPORT 93"
.LASF1028:
	.string	"_POSIX_SEMAPHORES 200809L"
.LASF313:
	.string	"__PMT"
.LASF388:
	.string	"__stub_sstk "
.LASF329:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF1620:
	.string	"PARMRK 0000010"
.LASF1089:
	.string	"_PC_PIPE_BUF _PC_PIPE_BUF"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF1812:
	.string	"MRAA_BANANA"
.LASF287:
	.string	"_DEFAULT_SOURCE"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF1470:
	.string	"ENOMEM 12"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF1008:
	.string	"_POSIX_MAPPED_FILES 200809L"
.LASF393:
	.string	"__int8_t_defined "
.LASF1173:
	.string	"_SC_T_IOV_MAX _SC_T_IOV_MAX"
.LASF1815:
	.string	"MRAA_INTEL_SOFIA_3GR"
.LASF1647:
	.string	"CR3 0003000"
.LASF1241:
	.string	"_SC_BASE _SC_BASE"
.LASF1466:
	.string	"ENOEXEC 8"
.LASF455:
	.string	"INTMAX_C(c) c ## L"
.LASF1047:
	.string	"_POSIX_TIMERS 200809L"
.LASF792:
	.string	"_IO_UPPERCASE 01000"
.LASF837:
	.string	"putc(_ch,_fp) _IO_putc (_ch, _fp)"
.LASF1383:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS"
.LASF1381:
	.string	"_CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF930:
	.string	"__S_IFBLK 0060000"
.LASF1781:
	.string	"I2C1_SDA_CLK_SOURCE RCC_AHBPeriph_GPIOB"
.LASF1696:
	.string	"B230400 0010003"
.LASF1614:
	.string	"VWERASE 14"
.LASF978:
	.string	"MRAA_PIN_NAME_SIZE 12"
.LASF449:
	.string	"INT32_C(c) c"
.LASF361:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF1327:
	.string	"_CS_POSIX_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF889:
	.string	"F_WRLCK 1"
.LASF504:
	.string	"WCONTINUED 8"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF1026:
	.string	"_POSIX_THREAD_ROBUST_PRIO_INHERIT 200809L"
.LASF1365:
	.string	"_CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS"
.LASF542:
	.string	"__SLONGWORD_TYPE long int"
.LASF1495:
	.string	"ENOLCK 37"
.LASF1544:
	.string	"ESTRPIPE 86"
.LASF981:
	.string	"MRAA_MAIN_PLATFORM_OFFSET 0"
.LASF1128:
	.string	"_SC_AIO_LISTIO_MAX _SC_AIO_LISTIO_MAX"
.LASF1103:
	.string	"_PC_SYMLINK_MAX _PC_SYMLINK_MAX"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF435:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF309:
	.string	"__GLIBC__ 2"
.LASF1205:
	.string	"_SC_XOPEN_XPG2 _SC_XOPEN_XPG2"
.LASF422:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF402:
	.string	"INT32_MAX (2147483647)"
.LASF1432:
	.string	"PTHREAD_CREATE_DETACHED PTHREAD_CREATE_DETACHED"
.LASF1030:
	.string	"_POSIX_ASYNCHRONOUS_IO 200809L"
.LASF749:
	.string	"_IO_va_list"
.LASF1138:
	.string	"_SC_SEM_NSEMS_MAX _SC_SEM_NSEMS_MAX"
.LASF814:
	.string	"_IO_funlockfile(_fp) "
.LASF1309:
	.string	"_SC_V7_ILP32_OFF32 _SC_V7_ILP32_OFF32"
.LASF1680:
	.string	"EXTA B19200"
.LASF319:
	.string	"__P(args) args"
.LASF1642:
	.string	"NL1 0000400"
.LASF825:
	.string	"SEEK_END 2"
.LASF717:
	.string	"__need_FILE"
.LASF434:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF1134:
	.string	"_SC_VERSION _SC_VERSION"
.LASF771:
	.string	"_IO_LINKED 0x80"
.LASF464:
	.string	"_SYS_SIZE_T_H "
.LASF567:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF1552:
	.string	"ESOCKTNOSUPPORT 94"
.LASF1079:
	.string	"__useconds_t_defined "
.LASF785:
	.string	"_IO_RIGHT 04"
.LASF1611:
	.string	"VEOL 11"
.LASF1386:
	.string	"_CS_V6_ENV _CS_V6_ENV"
.LASF1380:
	.string	"_CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS"
.LASF219:
	.string	"__x86_64 1"
.LASF1692:
	.string	"CLOCAL 0004000"
.LASF1143:
	.string	"_SC_BC_DIM_MAX _SC_BC_DIM_MAX"
.LASF1548:
	.string	"EMSGSIZE 90"
.LASF1216:
	.string	"_SC_NZERO _SC_NZERO"
.LASF1409:
	.string	"__CPU_ALLOC_SIZE(count) ((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))"
.LASF283:
	.string	"__USE_FORTIFY_LEVEL"
.LASF840:
	.string	"F_GETLK64 5"
.LASF605:
	.string	"htole64(x) (x)"
.LASF672:
	.string	"__suseconds_t_defined "
.LASF879:
	.string	"__F_GETOWN 9"
.LASF578:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF400:
	.string	"INT8_MAX (127)"
.LASF1584:
	.string	"ENOKEY 126"
.LASF681:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF1784:
	.string	"I2C2_SCL_PIN GPIO_Pin_6"
.LASF670:
	.string	"_STRUCT_TIMEVAL 1"
.LASF909:
	.string	"POSIX_FADV_NOREUSE __POSIX_FADV_NOREUSE"
.LASF1263:
	.string	"_SC_REGEX_VERSION _SC_REGEX_VERSION"
.LASF932:
	.string	"__S_IFIFO 0010000"
.LASF1708:
	.string	"B4000000 0010017"
.LASF274:
	.string	"__USE_XOPEN2K8"
.LASF442:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF733:
	.string	"_IO_fpos_t _G_fpos_t"
.LASF1267:
	.string	"_SC_SPORADIC_SERVER _SC_SPORADIC_SERVER"
.LASF579:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF498:
	.string	"__need_NULL"
.LASF1112:
	.string	"_SC_JOB_CONTROL _SC_JOB_CONTROL"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF1131:
	.string	"_SC_DELAYTIMER_MAX _SC_DELAYTIMER_MAX"
.LASF330:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF368:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF276:
	.string	"__USE_LARGEFILE"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF546:
	.string	"__SWORD_TYPE long int"
.LASF1004:
	.string	"_POSIX_SAVED_IDS 1"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF1561:
	.string	"ECONNABORTED 103"
.LASF1072:
	.string	"__ILP32_OFFBIG_CFLAGS \"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64\""
.LASF298:
	.string	"__USE_POSIX199309 1"
.LASF1586:
	.string	"EKEYREVOKED 128"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF1146:
	.string	"_SC_COLL_WEIGHTS_MAX _SC_COLL_WEIGHTS_MAX"
.LASF1759:
	.string	"CSTART CTRL('q')"
.LASF1151:
	.string	"_SC_CHARCLASS_NAME_MAX _SC_CHARCLASS_NAME_MAX"
.LASF871:
	.string	"O_DSYNC __O_DSYNC"
.LASF1417:
	.string	"CLOCK_MONOTONIC 1"
.LASF1752:
	.string	"CSTATUS _POSIX_VDISABLE"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF1294:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE _SC_LEVEL1_ICACHE_LINESIZE"
.LASF1801:
	.string	"sizetype"
.LASF1491:
	.string	"EDOM 33"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF829:
	.string	"FILENAME_MAX 4096"
.LASF1395:
	.string	"__defined_schedparam 1"
.LASF1771:
	.string	"I2C_DEFAULT_TIMEOUT I2C_SHORT_TIMEOUT"
.LASF1595:
	.string	"_STRING_H 1"
.LASF1319:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT _SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF741:
	.string	"_IO_iconv_t _G_iconv_t"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF564:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1048:
	.string	"_POSIX_BARRIERS 200809L"
.LASF851:
	.string	"O_APPEND 02000"
.LASF1564:
	.string	"EISCONN 106"
.LASF1208:
	.string	"_SC_CHAR_BIT _SC_CHAR_BIT"
.LASF1032:
	.string	"_LFS_ASYNCHRONOUS_IO 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF1307:
	.string	"_SC_IPV6 _SC_IPV6"
.LASF1796:
	.string	"short unsigned int"
.LASF1792:
	.string	"signed char"
.LASF1750:
	.string	"CERASE 0177"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF662:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF1247:
	.string	"_SC_DEVICE_IO _SC_DEVICE_IO"
.LASF1506:
	.string	"ELNRNG 48"
.LASF924:
	.string	"_STATBUF_ST_BLKSIZE "
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF461:
	.string	"__size_t__ "
.LASF300:
	.string	"__USE_XOPEN2K 1"
.LASF1437:
	.string	"PTHREAD_SCOPE_SYSTEM PTHREAD_SCOPE_SYSTEM"
.LASF1297:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE _SC_LEVEL1_DCACHE_LINESIZE"
.LASF1673:
	.string	"B1200 0000011"
.LASF1295:
	.string	"_SC_LEVEL1_DCACHE_SIZE _SC_LEVEL1_DCACHE_SIZE"
.LASF900:
	.string	"FNONBLOCK O_NONBLOCK"
.LASF348:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF648:
	.string	"__time_t_defined 1"
.LASF602:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF680:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF752:
	.string	"EOF (-1)"
.LASF1681:
	.string	"EXTB B38400"
.LASF1016:
	.string	"_XOPEN_REALTIME_THREADS 1"
.LASF1428:
	.string	"_XLOCALE_H 1"
.LASF436:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF376:
	.string	"__stub___compat_bdflush "
.LASF1444:
	.string	"PTHREAD_CANCEL_DEFERRED PTHREAD_CANCEL_DEFERRED"
.LASF784:
	.string	"_IO_LEFT 02"
.LASF1290:
	.string	"_SC_TRACE_INHERIT _SC_TRACE_INHERIT"
.LASF1154:
	.string	"_SC_2_C_DEV _SC_2_C_DEV"
.LASF1243:
	.string	"_SC_C_LANG_SUPPORT_R _SC_C_LANG_SUPPORT_R"
.LASF1115:
	.string	"_SC_PRIORITY_SCHEDULING _SC_PRIORITY_SCHEDULING"
.LASF260:
	.string	"_FEATURES_H 1"
.LASF469:
	.string	"_BSD_SIZE_T_ "
.LASF362:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF1449:
	.string	"__cleanup_fct_attribute "
.LASF350:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF917:
	.string	"_STAT_VER_KERNEL 0"
.LASF1323:
	.string	"_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1125:
	.string	"_SC_MESSAGE_PASSING _SC_MESSAGE_PASSING"
.LASF1101:
	.string	"_PC_REC_XFER_ALIGN _PC_REC_XFER_ALIGN"
.LASF1387:
	.string	"_CS_V7_ENV _CS_V7_ENV"
.LASF1177:
	.string	"_SC_GETPW_R_SIZE_MAX _SC_GETPW_R_SIZE_MAX"
.LASF1157:
	.string	"_SC_2_SW_DEV _SC_2_SW_DEV"
.LASF1003:
	.string	"_POSIX_JOB_CONTROL 1"
.LASF867:
	.string	"F_SETLKW 7"
.LASF1371:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS"
.LASF913:
	.string	"AT_SYMLINK_FOLLOW 0x400"
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF1655:
	.string	"BS1 0020000"
.LASF683:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF937:
	.string	"__S_TYPEISSHM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF565:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1457:
	.string	"_ASM_GENERIC_ERRNO_H "
.LASF687:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF1236:
	.string	"_SC_XOPEN_LEGACY _SC_XOPEN_LEGACY"
.LASF801:
	.string	"__HAVE_COLUMN "
.LASF1683:
	.string	"CS5 0000000"
.LASF906:
	.string	"POSIX_FADV_SEQUENTIAL 2"
.LASF791:
	.string	"_IO_SHOWPOINT 0400"
.LASF1099:
	.string	"_PC_REC_MAX_XFER_SIZE _PC_REC_MAX_XFER_SIZE"
.LASF959:
	.string	"S_IXUSR __S_IEXEC"
.LASF1429:
	.string	"__isleap(year) ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))"
.LASF1456:
	.string	"ERANGE"
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF450:
	.string	"INT64_C(c) c ## L"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF872:
	.string	"O_RSYNC O_SYNC"
.LASF557:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF1760:
	.string	"CSTOP CTRL('s')"
.LASF974:
	.string	"F_LOCK 1"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF1451:
	.string	"pthread_cleanup_pop(execute) do { } while (0); } while (0); __pthread_unregister_cancel (&__cancel_buf); if (execute) __cancel_routine (__cancel_arg); } while (0)"
.LASF314:
	.string	"__LEAF , __leaf__"
.LASF1440:
	.string	"PTHREAD_PROCESS_SHARED PTHREAD_PROCESS_SHARED"
.LASF628:
	.string	"_SYS_TYPES_H 1"
.LASF1364:
	.string	"_CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS"
.LASF616:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF1141:
	.string	"_SC_TIMER_MAX _SC_TIMER_MAX"
.LASF914:
	.string	"AT_EACCESS 0x200"
.LASF1302:
	.string	"_SC_LEVEL3_CACHE_ASSOC _SC_LEVEL3_CACHE_ASSOC"
.LASF880:
	.string	"F_SETOWN __F_SETOWN"
.LASF953:
	.string	"S_IFSOCK __S_IFSOCK"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF1167:
	.string	"_SC_IOV_MAX _SC_IOV_MAX"
.LASF761:
	.string	"_IO_MAGIC 0xFBAD0000"
.LASF1773:
	.string	"I2C1_SCL_GPIO_AF GPIO_AF_4"
.LASF760:
	.string	"_IOS_BIN 128"
.LASF957:
	.string	"S_IRUSR __S_IREAD"
.LASF1356:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS"
.LASF844:
	.string	"O_RDONLY 00"
.LASF375:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF1000:
	.string	"_XOPEN_ENH_I18N 1"
.LASF1067:
	.string	"_POSIX_V7_LP64_OFF64 1"
.LASF423:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF1222:
	.string	"_SC_UCHAR_MAX _SC_UCHAR_MAX"
.LASF1257:
	.string	"_SC_MULTI_PROCESS _SC_MULTI_PROCESS"
.LASF1203:
	.string	"_SC_2_C_VERSION _SC_2_C_VERSION"
.LASF586:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF852:
	.string	"O_NONBLOCK 04000"
.LASF641:
	.string	"__key_t_defined "
.LASF282:
	.string	"__USE_REENTRANT"
.LASF1083:
	.string	"L_XTND SEEK_END"
.LASF1568:
	.string	"ETIMEDOUT 110"
.LASF559:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1163:
	.string	"_SC_PII_OSI _SC_PII_OSI"
.LASF824:
	.string	"SEEK_CUR 1"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF1058:
	.string	"_POSIX_THREAD_SPORADIC_SERVER -1"
.LASF778:
	.string	"_IO_BAD_SEEN 0x4000"
.LASF558:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF535:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF1268:
	.string	"_SC_THREAD_SPORADIC_SERVER _SC_THREAD_SPORADIC_SERVER"
.LASF236:
	.string	"__linux__ 1"
.LASF1772:
	.string	"I2C1_SCL_GPIO GPIOB"
.LASF512:
	.string	"P_PGID"
.LASF1305:
	.string	"_SC_LEVEL4_CACHE_ASSOC _SC_LEVEL4_CACHE_ASSOC"
.LASF323:
	.string	"__ptr_t void *"
.LASF832:
	.string	"FOPEN_MAX 16"
.LASF384:
	.string	"__stub_putmsg "
.LASF1234:
	.string	"_SC_XBS5_LP64_OFF64 _SC_XBS5_LP64_OFF64"
.LASF990:
	.string	"_POSIX2_C_DEV __POSIX2_THIS_VERSION"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF406:
	.string	"UINT32_MAX (4294967295U)"
.LASF226:
	.string	"__k8__ 1"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF291:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF668:
	.string	"__timespec_defined 1"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF264:
	.string	"__USE_ISOCXX11"
.LASF807:
	.string	"_IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) && __underflow (_fp) == EOF ? EOF : *(unsigned char *) (_fp)->_IO_read_ptr)"
.LASF1631:
	.string	"IUTF8 0040000"
.LASF1794:
	.string	"long int"
.LASF1657:
	.string	"FF0 0000000"
.LASF1175:
	.string	"_SC_THREAD_SAFE_FUNCTIONS _SC_THREAD_SAFE_FUNCTIONS"
.LASF1109:
	.string	"_SC_OPEN_MAX _SC_OPEN_MAX"
.LASF1832:
	.string	"i2c1ErrorCount"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF1827:
	.string	"I2CDEV_2"
.LASF1768:
	.string	"CFLUSH CDISCARD"
.LASF1344:
	.string	"_CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS"
.LASF1828:
	.string	"I2CDEV_6"
.LASF1638:
	.string	"OFILL 0000100"
.LASF1271:
	.string	"_SC_TIMEOUTS _SC_TIMEOUTS"
.LASF731:
	.string	"_G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)"
.LASF1739:
	.string	"_IOT_termios _IOT (_IOTS (cflag_t), 4, _IOTS (cc_t), NCCS, _IOTS (speed_t), 2)"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF1198:
	.string	"_SC_XOPEN_UNIX _SC_XOPEN_UNIX"
.LASF396:
	.string	"INT8_MIN (-128)"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF404:
	.string	"UINT8_MAX (255)"
.LASF1452:
	.string	"MRAA_UART_OW_ROMCODE_SIZE 8"
.LASF1253:
	.string	"_SC_FILE_ATTRIBUTES _SC_FILE_ATTRIBUTES"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF833:
	.string	"stdin stdin"
.LASF669:
	.string	"__need_timeval "
.LASF1408:
	.ascii	"__CPU_OP_S(setsize,destset,srcset1,srcset2,op) (__extension_"
	.ascii	"_ ({ cpu_set_t *__dest = (destset); const __cp"
	.string	"u_mask *__arr1 = (srcset1)->__bits; const __cpu_mask *__arr2 = (srcset2)->__bits; size_t __imax = (setsize) / sizeof (__cpu_mask); size_t __i; for (__i = 0; __i < __imax; ++__i) ((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op __arr2[__i]; __dest; }))"
.LASF1537:
	.string	"ELIBACC 79"
.LASF698:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF1502:
	.string	"ECHRNG 44"
.LASF320:
	.string	"__PMT(args) args"
.LASF1063:
	.string	"_POSIX_TYPED_MEMORY_OBJECTS -1"
.LASF1744:
	.string	"TTYDEF_LFLAG (ECHO | ICANON | ISIG | IEXTEN | ECHOE|ECHOKE|ECHOCTL)"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF413:
	.string	"INT_LEAST16_MAX (32767)"
.LASF901:
	.string	"FNDELAY O_NDELAY"
.LASF1184:
	.string	"_SC_THREAD_ATTR_STACKADDR _SC_THREAD_ATTR_STACKADDR"
.LASF838:
	.string	"_FCNTL_H 1"
.LASF1188:
	.string	"_SC_THREAD_PRIO_PROTECT _SC_THREAD_PRIO_PROTECT"
.LASF626:
	.string	"EXIT_SUCCESS 0"
.LASF1325:
	.string	"_CS_GNU_LIBPTHREAD_VERSION _CS_GNU_LIBPTHREAD_VERSION"
.LASF793:
	.string	"_IO_SHOWPOS 02000"
.LASF1407:
	.string	"__CPU_EQUAL_S(setsize,cpusetp1,cpusetp2) (__builtin_memcmp (cpusetp1, cpusetp2, setsize) == 0)"
.LASF1517:
	.string	"EBFONT 59"
.LASF1484:
	.string	"ETXTBSY 26"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF463:
	.string	"_SIZE_T "
.LASF1023:
	.string	"_POSIX_THREAD_ATTR_STACKADDR 200809L"
.LASF976:
	.string	"F_TEST 3"
.LASF1009:
	.string	"_POSIX_MEMLOCK 200809L"
.LASF712:
	.string	"__need_malloc_and_calloc"
.LASF1299:
	.string	"_SC_LEVEL2_CACHE_ASSOC _SC_LEVEL2_CACHE_ASSOC"
.LASF312:
	.string	"_SYS_CDEFS_H 1"
.LASF333:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF834:
	.string	"stdout stdout"
.LASF725:
	.string	"__need_mbstate_t"
.LASF1622:
	.string	"ISTRIP 0000040"
.LASF831:
	.string	"FOPEN_MAX"
.LASF1656:
	.string	"FFDLY 0100000"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF390:
	.string	"_BITS_WCHAR_H 1"
.LASF817:
	.string	"_IO_cleanup_region_end(_Doit) "
.LASF1758:
	.string	"CDSUSP CTRL('y')"
.LASF467:
	.string	"__SIZE_T "
.LASF585:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF1106:
	.string	"_SC_CHILD_MAX _SC_CHILD_MAX"
.LASF998:
	.string	"_XOPEN_UNIX 1"
.LASF1766:
	.string	"CBRK CEOL"
.LASF920:
	.string	"_STAT_VER _STAT_VER_LINUX"
.LASF1279:
	.string	"_SC_2_PBS_TRACK _SC_2_PBS_TRACK"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF1278:
	.string	"_SC_2_PBS_MESSAGE _SC_2_PBS_MESSAGE"
.LASF874:
	.string	"F_GETFD 1"
.LASF878:
	.string	"__F_SETOWN 8"
.LASF569:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF584:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF1652:
	.string	"TAB3 0014000"
.LASF1769:
	.string	"I2C_SHORT_TIMEOUT ((uint32_t)0x1000)"
.LASF933:
	.string	"__S_IFLNK 0120000"
.LASF1300:
	.string	"_SC_LEVEL2_CACHE_LINESIZE _SC_LEVEL2_CACHE_LINESIZE"
.LASF1100:
	.string	"_PC_REC_MIN_XFER_SIZE _PC_REC_MIN_XFER_SIZE"
.LASF1040:
	.string	"_POSIX_THREAD_CPUTIME 0"
.LASF675:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF1191:
	.string	"_SC_NPROCESSORS_ONLN _SC_NPROCESSORS_ONLN"
.LASF297:
	.string	"__USE_POSIX2 1"
.LASF1061:
	.string	"_POSIX_TRACE_INHERIT -1"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF1413:
	.string	"_TIME_H 1"
.LASF1644:
	.string	"CR0 0000000"
.LASF338:
	.string	"__flexarr []"
.LASF286:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF343:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF537:
	.string	"_BITS_TYPES_H 1"
.LASF1831:
	.string	"i2cTimeout"
.LASF1800:
	.string	"long unsigned int"
.LASF1419:
	.string	"CLOCK_THREAD_CPUTIME_ID 3"
.LASF391:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF417:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF598:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF767:
	.string	"_IO_NO_WRITES 8"
.LASF1617:
	.string	"IGNBRK 0000001"
.LASF975:
	.string	"F_TLOCK 2"
.LASF339:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF1747:
	.string	"CTRL(x) (x&037)"
.LASF1401:
	.string	"__CPUMASK(cpu) ((__cpu_mask) 1 << ((cpu) % __NCPUBITS))"
.LASF1474:
	.string	"EBUSY 16"
.LASF862:
	.string	"__O_PATH 010000000"
.LASF482:
	.string	"_T_WCHAR_ "
.LASF955:
	.string	"S_ISGID __S_ISGID"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF592:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF410:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF294:
	.string	"_POSIX_C_SOURCE"
.LASF986:
	.string	"__POSIX2_THIS_VERSION 200809L"
.LASF624:
	.string	"RAND_MAX 2147483647"
.LASF1052:
	.string	"_POSIX_CLOCK_SELECTION 200809L"
.LASF890:
	.string	"F_UNLCK 2"
.LASF1366:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS"
.LASF1219:
	.string	"_SC_SCHAR_MIN _SC_SCHAR_MIN"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF789:
	.string	"_IO_HEX 0100"
.LASF1677:
	.string	"B9600 0000015"
.LASF1142:
	.string	"_SC_BC_BASE_MAX _SC_BC_BASE_MAX"
.LASF674:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1316:
	.string	"_SC_TRACE_SYS_MAX _SC_TRACE_SYS_MAX"
.LASF1029:
	.string	"_POSIX_REALTIME_SIGNALS 200809L"
.LASF1153:
	.string	"_SC_2_C_BIND _SC_2_C_BIND"
.LASF1098:
	.string	"_PC_REC_INCR_XFER_SIZE _PC_REC_INCR_XFER_SIZE"
.LASF1139:
	.string	"_SC_SEM_VALUE_MAX _SC_SEM_VALUE_MAX"
.LASF1802:
	.string	"char"
.LASF700:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF947:
	.string	"S_IFDIR __S_IFDIR"
.LASF1336:
	.string	"_CS_LFS64_LIBS _CS_LFS64_LIBS"
.LASF1601:
	.string	"VQUIT 1"
.LASF560:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF387:
	.string	"__stub_sigreturn "
.LASF1158:
	.string	"_SC_2_LOCALEDEF _SC_2_LOCALEDEF"
.LASF544:
	.string	"__SQUAD_TYPE long int"
.LASF328:
	.string	"__END_NAMESPACE_STD "
.LASF651:
	.string	"__clockid_time_t"
.LASF799:
	.string	"_IO_BOOLALPHA 0200000"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF656:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF1562:
	.string	"ECONNRESET 104"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF870:
	.string	"O_CLOEXEC __O_CLOEXEC"
.LASF1209:
	.string	"_SC_CHAR_MAX _SC_CHAR_MAX"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF581:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF501:
	.string	"WUNTRACED 2"
.LASF1571:
	.string	"EHOSTUNREACH 113"
.LASF994:
	.string	"_XOPEN_XCU_VERSION 4"
.LASF1610:
	.string	"VSUSP 10"
.LASF295:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF332:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF647:
	.string	"__need_clock_t"
.LASF595:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF392:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF1507:
	.string	"EUNATCH 49"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF730:
	.string	"_G_IO_IO_FILE_VERSION 0x20001"
.LASF256:
	.string	"true 1"
.LASF1728:
	.string	"EXTPROC 0200000"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF1361:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS"
.LASF357:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1479:
	.string	"EISDIR 21"
.LASF1054:
	.string	"_POSIX_IPV6 200809L"
.LASF1252:
	.string	"_SC_PIPE _SC_PIPE"
.LASF1373:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS"
.LASF1078:
	.string	"STDERR_FILENO 2"
.LASF572:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF441:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF1494:
	.string	"ENAMETOOLONG 36"
.LASF911:
	.string	"AT_SYMLINK_NOFOLLOW 0x100"
.LASF1817:
	.string	"MRAA_UP"
.LASF1301:
	.string	"_SC_LEVEL3_CACHE_SIZE _SC_LEVEL3_CACHE_SIZE"
.LASF1704:
	.string	"B2000000 0010013"
.LASF591:
	.string	"__STD_TYPE"
.LASF1210:
	.string	"_SC_CHAR_MIN _SC_CHAR_MIN"
.LASF582:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF1326:
	.string	"_CS_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF419:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF555:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF549:
	.string	"__ULONG32_TYPE unsigned int"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF460:
	.string	"__need_NULL "
.LASF881:
	.string	"F_GETOWN __F_GETOWN"
.LASF1590:
	.string	"ERFKILL 132"
.LASF1374:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS"
.LASF896:
	.string	"LOCK_UN 8"
.LASF1021:
	.string	"_POSIX_THREAD_PRIORITY_SCHEDULING 200809L"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF960:
	.string	"S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)"
.LASF1695:
	.string	"B115200 0010002"
.LASF1726:
	.string	"PENDIN 0040000"
.LASF1540:
	.string	"ELIBMAX 82"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF1123:
	.string	"_SC_MEMLOCK_RANGE _SC_MEMLOCK_RANGE"
.LASF497:
	.string	"NULL ((void *)0)"
.LASF1439:
	.string	"PTHREAD_PROCESS_PRIVATE PTHREAD_PROCESS_PRIVATE"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF1668:
	.string	"B134 0000004"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF619:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF1242:
	.string	"_SC_C_LANG_SUPPORT _SC_C_LANG_SUPPORT"
.LASF780:
	.string	"_IO_FLAGS2_MMAP 1"
.LASF1064:
	.string	"_POSIX_V7_LPBIG_OFFBIG -1"
.LASF1426:
	.string	"CLOCK_TAI 11"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF1256:
	.string	"_SC_MONOTONIC_CLOCK _SC_MONOTONIC_CLOCK"
.LASF1213:
	.string	"_SC_LONG_BIT _SC_LONG_BIT"
.LASF399:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1734:
	.string	"TCOFLUSH 1"
.LASF1094:
	.string	"_PC_ASYNC_IO _PC_ASYNC_IO"
.LASF1367:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF1675:
	.string	"B2400 0000013"
.LASF1406:
	.string	"__CPU_COUNT_S(setsize,cpusetp) __sched_cpucount (setsize, cpusetp)"
.LASF444:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF660:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF1342:
	.string	"_CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS"
.LASF372:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF1811:
	.string	"MRAA_BEAGLEBONE"
.LASF358:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF495:
	.string	"__need_wchar_t"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF433:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF853:
	.string	"O_NDELAY O_NONBLOCK"
.LASF977:
	.string	"MRAA_PLATFORM_NAME_MAX_SIZE 64"
.LASF603:
	.string	"le32toh(x) (x)"
.LASF1533:
	.string	"EOVERFLOW 75"
.LASF636:
	.string	"__off_t_defined "
.LASF1430:
	.string	"_BITS_SETJMP_H 1"
.LASF1608:
	.string	"VSTART 8"
.LASF1314:
	.string	"_SC_TRACE_EVENT_NAME_MAX _SC_TRACE_EVENT_NAME_MAX"
.LASF804:
	.string	"_IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))"
.LASF1483:
	.string	"ENOTTY 25"
.LASF1588:
	.string	"EOWNERDEAD 130"
.LASF1821:
	.string	"MRAA_MOCK_PLATFORM"
.LASF235:
	.string	"__linux 1"
.LASF1001:
	.string	"_XOPEN_LEGACY 1"
.LASF311:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF1420:
	.string	"CLOCK_MONOTONIC_RAW 4"
.LASF401:
	.string	"INT16_MAX (32767)"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF940:
	.string	"__S_ISVTX 01000"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF638:
	.string	"__id_t_defined "
.LASF1575:
	.string	"EUCLEAN 117"
.LASF594:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF1648:
	.string	"TABDLY 0014000"
.LASF645:
	.string	"__need_clockid_t "
.LASF1251:
	.string	"_SC_FIFO _SC_FIFO"
.LASF1379:
	.string	"_CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS"
.LASF751:
	.string	"_IO_UNIFIED_JUMPTABLES 1"
.LASF1556:
	.string	"EADDRINUSE 98"
.LASF1626:
	.string	"IUCLC 0001000"
.LASF1202:
	.string	"_SC_2_CHAR_TERM _SC_2_CHAR_TERM"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF1751:
	.string	"CINTR CTRL('c')"
.LASF1774:
	.string	"I2C1_SCL_PIN GPIO_Pin_6"
.LASF1469:
	.string	"EAGAIN 11"
.LASF409:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF1745:
	.string	"TTYDEF_CFLAG (CREAD | CS7 | PARENB | HUPCL)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF1273:
	.string	"_SC_USER_GROUPS _SC_USER_GROUPS"
.LASF808:
	.string	"_IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end, 0) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF1472:
	.string	"EFAULT 14"
.LASF640:
	.string	"__daddr_t_defined "
.LASF359:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF1505:
	.string	"EL3RST 47"
.LASF1015:
	.string	"_XOPEN_REALTIME 1"
.LASF1200:
	.string	"_SC_XOPEN_ENH_I18N _SC_XOPEN_ENH_I18N"
.LASF1108:
	.string	"_SC_NGROUPS_MAX _SC_NGROUPS_MAX"
.LASF507:
	.string	"__WALL 0x40000000"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF1274:
	.string	"_SC_USER_GROUPS_R _SC_USER_GROUPS_R"
.LASF929:
	.string	"__S_IFCHR 0020000"
.LASF334:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF1720:
	.string	"NOFLSH 0000200"
.LASF529:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF667:
	.string	"__need_timespec "
.LASF335:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF1224:
	.string	"_SC_ULONG_MAX _SC_ULONG_MAX"
.LASF1767:
	.string	"CRPRNT CREPRINT"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF1051:
	.string	"_POSIX_MONOTONIC_CLOCK 0"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF1431:
	.string	"PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_JOINABLE"
.LASF278:
	.string	"__USE_FILE_OFFSET64"
.LASF523:
	.string	"__W_CONTINUED 0xffff"
.LASF1073:
	.string	"__ILP32_OFFBIG_LDFLAGS \"-m32\""
.LASF835:
	.string	"stderr stderr"
.LASF364:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF1587:
	.string	"EKEYREJECTED 129"
.LASF1127:
	.string	"_SC_SHARED_MEMORY_OBJECTS _SC_SHARED_MEMORY_OBJECTS"
.LASF1182:
	.string	"_SC_THREAD_STACK_MIN _SC_THREAD_STACK_MIN"
.LASF1585:
	.string	"EKEYEXPIRED 127"
.LASF1625:
	.string	"ICRNL 0000400"
.LASF1185:
	.string	"_SC_THREAD_ATTR_STACKSIZE _SC_THREAD_ATTR_STACKSIZE"
.LASF353:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF570:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF775:
	.string	"_IO_CURRENTLY_PUTTING 0x800"
.LASF1082:
	.string	"L_INCR SEEK_CUR"
.LASF528:
	.string	"__PDP_ENDIAN 3412"
.LASF1215:
	.string	"_SC_MB_LEN_MAX _SC_MB_LEN_MAX"
.LASF1604:
	.string	"VEOF 4"
.LASF739:
	.string	"_IO_pid_t __pid_t"
.LASF666:
	.string	"__sigset_t_defined "
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF530:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF1074:
	.string	"__LP64_OFF64_CFLAGS \"-m64\""
.LASF903:
	.string	"__POSIX_FADV_NOREUSE 5"
.LASF1687:
	.string	"CSTOPB 0000100"
.LASF720:
	.string	"_STDIO_USES_IOSTREAM "
.LASF486:
	.string	"_BSD_WCHAR_T_ "
.LASF1820:
	.string	"MRAA_GENERIC_FIRMATA"
.LASF623:
	.string	"__lldiv_t_defined 1"
.LASF415:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF654:
	.string	"__need_timespec"
.LASF349:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF1639:
	.string	"OFDEL 0000200"
.LASF699:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF948:
	.string	"S_IFCHR __S_IFCHR"
.LASF1363:
	.string	"_CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS"
.LASF1488:
	.string	"EROFS 30"
.LASF1603:
	.string	"VKILL 3"
.LASF1589:
	.string	"ENOTRECOVERABLE 131"
.LASF1816:
	.string	"MRAA_INTEL_CHERRYHILLS"
.LASF281:
	.string	"__USE_GNU"
.LASF1292:
	.string	"_SC_LEVEL1_ICACHE_SIZE _SC_LEVEL1_ICACHE_SIZE"
.LASF518:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF266:
	.string	"__USE_POSIX2"
.LASF671:
	.string	"__need_timeval"
.LASF1545:
	.string	"EUSERS 87"
.LASF1204:
	.string	"_SC_2_UPE _SC_2_UPE"
.LASF964:
	.string	"S_IRWXG (S_IRWXU >> 3)"
.LASF1641:
	.string	"NL0 0000000"
.LASF1132:
	.string	"_SC_MQ_OPEN_MAX _SC_MQ_OPEN_MAX"
.LASF1531:
	.string	"EDOTDOT 73"
.LASF1536:
	.string	"EREMCHG 78"
.LASF850:
	.string	"O_TRUNC 01000"
.LASF1308:
	.string	"_SC_RAW_SOCKETS _SC_RAW_SOCKETS"
.LASF1244:
	.string	"_SC_CLOCK_SELECTION _SC_CLOCK_SELECTION"
.LASF1211:
	.string	"_SC_INT_MAX _SC_INT_MAX"
.LASF1129:
	.string	"_SC_AIO_MAX _SC_AIO_MAX"
.LASF1553:
	.string	"EOPNOTSUPP 95"
.LASF939:
	.string	"__S_ISGID 02000"
.LASF459:
	.string	"__need_wchar_t "
.LASF863:
	.string	"__O_DSYNC 010000"
.LASF273:
	.string	"__USE_XOPEN2KXSI"
.LASF1684:
	.string	"CS6 0000020"
.LASF938:
	.string	"__S_ISUID 04000"
.LASF430:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF689:
	.string	"__blkcnt_t_defined "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF1124:
	.string	"_SC_MEMORY_PROTECTION _SC_MEMORY_PROTECTION"
.LASF506:
	.string	"__WNOTHREAD 0x20000000"
.LASF483:
	.string	"_T_WCHAR "
.LASF1359:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF405:
	.string	"UINT16_MAX (65535)"
.LASF727:
	.string	"_G_va_list __gnuc_va_list"
.LASF1599:
	.string	"_HAVE_STRUCT_TERMIOS_C_OSPEED 1"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF228:
	.string	"__MMX__ 1"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF587:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF971:
	.string	"X_OK 1"
.LASF303:
	.string	"_ATFILE_SOURCE 1"
.LASF1754:
	.string	"CMIN 1"
.LASF553:
	.string	"_BITS_TYPESIZES_H 1"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF1071:
	.string	"__ILP32_OFF32_LDFLAGS \"-m32\""
.LASF1496:
	.string	"ENOSYS 38"
.LASF1525:
	.string	"ENOLINK 67"
.LASF1304:
	.string	"_SC_LEVEL4_CACHE_SIZE _SC_LEVEL4_CACHE_SIZE"
.LASF425:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF884:
	.string	"__F_SETOWN_EX 15"
.LASF822:
	.string	"BUFSIZ _IO_BUFSIZ"
.LASF452:
	.string	"UINT16_C(c) c"
.LASF693:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF363:
	.string	"__restrict_arr __restrict"
.LASF708:
	.string	"_ALLOCA_H 1"
.LASF1195:
	.string	"_SC_PASS_MAX _SC_PASS_MAX"
.LASF1515:
	.string	"EBADSLT 57"
.LASF918:
	.string	"_STAT_VER_LINUX 1"
.LASF438:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF983:
	.string	"MRAA_RETURN_FOR_ERROR(func) do { mraa_result_t res; res = func; if (res != MRAA_SUCCESS) return res;} while(0)"
.LASF1353:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS"
.LASF231:
	.string	"__FXSR__ 1"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF599:
	.string	"le16toh(x) (x)"
.LASF1148:
	.string	"_SC_EXPR_NEST_MAX _SC_EXPR_NEST_MAX"
.LASF440:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF1060:
	.string	"_POSIX_TRACE_EVENT_FILTER -1"
.LASF1549:
	.string	"EPROTOTYPE 91"
.LASF661:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF1372:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS"
.LASF1612:
	.string	"VREPRINT 12"
.LASF484:
	.string	"__WCHAR_T "
.LASF1087:
	.string	"_PC_NAME_MAX _PC_NAME_MAX"
.LASF676:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF885:
	.string	"__F_GETOWN_EX 16"
.LASF629:
	.string	"__u_char_defined "
.LASF1400:
	.string	"__CPUELT(cpu) ((cpu) / __NCPUBITS)"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF615:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF1435:
	.string	"PTHREAD_INHERIT_SCHED PTHREAD_INHERIT_SCHED"
.LASF1425:
	.string	"CLOCK_BOOTTIME_ALARM 9"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF1619:
	.string	"IGNPAR 0000004"
.LASF776:
	.string	"_IO_IS_APPENDING 0x1000"
.LASF1450:
	.ascii	"pthread_cleanup_push(routine,arg) do { __pthread_unwind_buf_"
	.ascii	"t __cancel_buf; void (*__cancel_routine) (void *) = (routine"
	.ascii	"); void *__cancel_arg = (arg); int __not_fir"
	.string	"st_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *) __cancel_buf.__cancel_jmp_buf, 0); if (__glibc_unlikely (__not_first_call)) { __cancel_routine (__cancel_arg); __pthread_unwind_next (&__cancel_buf); } __pthread_register_cancel (&__cancel_buf); do {"
.LASF962:
	.string	"S_IWGRP (S_IWUSR >> 3)"
.LASF1027:
	.string	"_POSIX_THREAD_ROBUST_PRIO_PROTECT -1"
.LASF1804:
	.string	"long long unsigned int"
.LASF630:
	.string	"__ino_t_defined "
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF620:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF1810:
	.string	"MRAA_RASPBERRY_PI"
.LASF951:
	.string	"S_IFIFO __S_IFIFO"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF950:
	.string	"S_IFREG __S_IFREG"
.LASF1443:
	.string	"PTHREAD_CANCEL_DISABLE PTHREAD_CANCEL_DISABLE"
.LASF1508:
	.string	"ENOCSI 50"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF1303:
	.string	"_SC_LEVEL3_CACHE_LINESIZE _SC_LEVEL3_CACHE_LINESIZE"
.LASF1580:
	.string	"EDQUOT 122"
.LASF1814:
	.string	"MRAA_96BOARDS"
.LASF1111:
	.string	"_SC_TZNAME_MAX _SC_TZNAME_MAX"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF1333:
	.string	"_CS_LFS_LINTFLAGS _CS_LFS_LINTFLAGS"
.LASF1785:
	.string	"I2C2_SCL_PIN_SOURCE GPIO_PinSource6"
.LASF325:
	.string	"__BEGIN_DECLS "
.LASF1266:
	.string	"_SC_SPAWN _SC_SPAWN"
.LASF1375:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS"
.LASF1740:
	.string	"CCEQ(val,c) ((c) == (val) && (val) != _POSIX_VDISABLE)"
.LASF1378:
	.string	"_CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS"
.LASF259:
	.string	"_STDINT_H 1"
.LASF860:
	.string	"__O_DIRECT 040000"
.LASF722:
	.string	"_G_config_h 1"
.LASF1161:
	.string	"_SC_PII_SOCKET _SC_PII_SOCKET"
.LASF1521:
	.string	"ENOSR 63"
.LASF1014:
	.string	"_POSIX_NO_TRUNC 1"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF466:
	.string	"_T_SIZE "
.LASF299:
	.string	"__USE_POSIX199506 1"
.LASF1084:
	.string	"_PC_LINK_MAX _PC_LINK_MAX"
.LASF1166:
	.string	"_SC_UIO_MAXIOV _SC_UIO_MAXIOV"
.LASF643:
	.string	"__need_time_t "
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF625:
	.string	"EXIT_FAILURE 1"
.LASF385:
	.string	"__stub_revoke "
.LASF1233:
	.string	"_SC_XBS5_ILP32_OFFBIG _SC_XBS5_ILP32_OFFBIG"
.LASF763:
	.string	"_IO_MAGIC_MASK 0xFFFF0000"
.LASF1463:
	.string	"EIO 5"
.LASF1276:
	.string	"_SC_2_PBS_ACCOUNTING _SC_2_PBS_ACCOUNTING"
.LASF514:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF1152:
	.string	"_SC_2_VERSION _SC_2_VERSION"
.LASF1335:
	.string	"_CS_LFS64_LDFLAGS _CS_LFS64_LDFLAGS"
.LASF301:
	.string	"__USE_XOPEN2K8 1"
.LASF568:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF809:
	.string	"_IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF1489:
	.string	"EMLINK 31"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF1041:
	.string	"_POSIX_REGEXP 1"
.LASF1102:
	.string	"_PC_ALLOC_SIZE_MIN _PC_ALLOC_SIZE_MIN"
.LASF738:
	.string	"_IO_off64_t __off64_t"
.LASF847:
	.string	"O_CREAT 0100"
.LASF849:
	.string	"O_NOCTTY 0400"
.LASF1286:
	.string	"_SC_V6_LPBIG_OFFBIG _SC_V6_LPBIG_OFFBIG"
.LASF1762:
	.string	"CDISCARD CTRL('o')"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF1686:
	.string	"CS8 0000060"
.LASF639:
	.string	"__ssize_t_defined "
.LASF1217:
	.string	"_SC_SSIZE_MAX _SC_SSIZE_MAX"
.LASF1347:
	.string	"_CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS"
.LASF302:
	.string	"_ATFILE_SOURCE"
.LASF1591:
	.string	"EHWPOISON 133"
.LASF1685:
	.string	"CS7 0000040"
.LASF1699:
	.string	"B576000 0010006"
.LASF718:
	.string	"____FILE_defined 1"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF1396:
	.string	"__need_schedparam"
.LASF1218:
	.string	"_SC_SCHAR_MAX _SC_SCHAR_MAX"
.LASF267:
	.string	"__USE_POSIX199309"
.LASF1712:
	.string	"CRTSCTS 020000000000"
.LASF1113:
	.string	"_SC_SAVED_IDS _SC_SAVED_IDS"
.LASF524:
	.string	"__WCOREFLAG 0x80"
.LASF1446:
	.string	"PTHREAD_CANCELED ((void *) -1)"
.LASF1298:
	.string	"_SC_LEVEL2_CACHE_SIZE _SC_LEVEL2_CACHE_SIZE"
.LASF958:
	.string	"S_IWUSR __S_IWRITE"
.LASF1643:
	.string	"CRDLY 0003000"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF345:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF1645:
	.string	"CR1 0001000"
.LASF1126:
	.string	"_SC_SEMAPHORES _SC_SEMAPHORES"
.LASF1393:
	.string	"SCHED_FIFO 1"
.LASF1410:
	.string	"__CPU_ALLOC(count) __sched_cpualloc (count)"
.LASF1038:
	.string	"_POSIX_SHARED_MEMORY_OBJECTS 200809L"
.LASF293:
	.string	"_POSIX_SOURCE 1"
.LASF1666:
	.string	"B75 0000002"
.LASF1250:
	.string	"_SC_FD_MGMT _SC_FD_MGMT"
.LASF1486:
	.string	"ENOSPC 28"
.LASF942:
	.string	"__S_IWRITE 0200"
.LASF1411:
	.string	"__CPU_FREE(cpuset) __sched_cpufree (cpuset)"
.LASF1053:
	.string	"_POSIX_ADVISORY_INFO 200809L"
.LASF1397:
	.string	"__cpu_set_t_defined "
.LASF1669:
	.string	"B150 0000005"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF1788:
	.string	"I2C2_SDA_GPIO_AF GPIO_AF_4"
.LASF1313:
	.string	"_SC_SS_REPL_MAX _SC_SS_REPL_MAX"
.LASF437:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF255:
	.string	"bool _Bool"
.LASF1337:
	.string	"_CS_LFS64_LINTFLAGS _CS_LFS64_LINTFLAGS"
.LASF769:
	.string	"_IO_ERR_SEEN 0x20"
.LASF1025:
	.string	"_POSIX_THREAD_PRIO_PROTECT 200809L"
.LASF583:
	.string	"__TIMER_T_TYPE void *"
.LASF764:
	.string	"_IO_USER_BUF 1"
.LASF1478:
	.string	"ENOTDIR 20"
.LASF1670:
	.string	"B200 0000006"
.LASF1819:
	.string	"MRAA_FTDI_FT4222"
.LASF1498:
	.string	"ELOOP 40"
.LASF1405:
	.string	"__CPU_ISSET_S(cpu,setsize,cpusetp) (__extension__ ({ size_t __cpu = (cpu); __cpu / 8 < (setsize) ? ((((const __cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] & __CPUMASK (__cpu))) != 0 : 0; }))"
.LASF596:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF841:
	.string	"F_SETLK64 6"
.LASF308:
	.string	"__GNU_LIBRARY__ 6"
.LASF679:
	.string	"NFDBITS __NFDBITS"
.LASF1803:
	.string	"long long int"
.LASF1522:
	.string	"ENONET 64"
.LASF574:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF445:
	.string	"WINT_MIN (0u)"
.LASF1285:
	.string	"_SC_V6_LP64_OFF64 _SC_V6_LP64_OFF64"
.LASF735:
	.string	"_IO_size_t size_t"
.LASF1836:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF1275:
	.string	"_SC_2_PBS _SC_2_PBS"
.LASF491:
	.string	"__INT_WCHAR_T_H "
.LASF1369:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS"
.LASF1570:
	.string	"EHOSTDOWN 112"
.LASF1264:
	.string	"_SC_SHELL _SC_SHELL"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF1238:
	.string	"_SC_XOPEN_REALTIME_THREADS _SC_XOPEN_REALTIME_THREADS"
.LASF682:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF866:
	.string	"F_SETLK 6"
.LASF1039:
	.string	"_POSIX_CPUTIME 0"
.LASF509:
	.string	"__ENUM_IDTYPE_T 1"
.LASF617:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF1352:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF1192:
	.string	"_SC_PHYS_PAGES _SC_PHYS_PAGES"
.LASF703:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF865:
	.string	"F_GETLK 5"
.LASF515:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF1736:
	.string	"TCSANOW 0"
.LASF1330:
	.string	"_CS_LFS_CFLAGS _CS_LFS_CFLAGS"
.LASF856:
	.string	"O_ASYNC 020000"
.LASF1707:
	.string	"B3500000 0010016"
.LASF1532:
	.string	"EBADMSG 74"
.LASF999:
	.string	"_XOPEN_CRYPT 1"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF1627:
	.string	"IXON 0002000"
.LASF1523:
	.string	"ENOPKG 65"
.LASF1340:
	.string	"_CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS"
.LASF229:
	.string	"__SSE__ 1"
.LASF1829:
	.string	"I2CDEV_MAX"
.LASF1607:
	.string	"VSWTC 7"
.LASF811:
	.string	"_IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr - (_fp)->_IO_write_base)"
.LASF280:
	.string	"__USE_ATFILE"
.LASF820:
	.string	"_IOLBF 1"
.LASF1735:
	.string	"TCIOFLUSH 2"
.LASF989:
	.string	"_POSIX2_C_BIND __POSIX2_THIS_VERSION"
.LASF1569:
	.string	"ECONNREFUSED 111"
.LASF922:
	.string	"st_mtime st_mtim.tv_sec"
.LASF1840:
	.string	"i2cInit"
.LASF1193:
	.string	"_SC_AVPHYS_PAGES _SC_AVPHYS_PAGES"
.LASF705:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF238:
	.string	"__unix 1"
.LASF1348:
	.string	"_CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF1442:
	.string	"PTHREAD_CANCEL_ENABLE PTHREAD_CANCEL_ENABLE"
.LASF1334:
	.string	"_CS_LFS64_CFLAGS _CS_LFS64_CFLAGS"
.LASF1122:
	.string	"_SC_MEMLOCK _SC_MEMLOCK"
.LASF1460:
	.string	"ENOENT 2"
.LASF352:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF1246:
	.string	"_SC_THREAD_CPUTIME _SC_THREAD_CPUTIME"
.LASF943:
	.string	"__S_IEXEC 0100"
.LASF819:
	.string	"_IOFBF 0"
.LASF432:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF1566:
	.string	"ESHUTDOWN 108"
.LASF1583:
	.string	"ECANCELED 125"
.LASF439:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF576:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF607:
	.string	"le64toh(x) (x)"
.LASF1212:
	.string	"_SC_INT_MIN _SC_INT_MIN"
.LASF768:
	.string	"_IO_EOF_SEEN 0x10"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF1621:
	.string	"INPCK 0000020"
.LASF1086:
	.string	"_PC_MAX_INPUT _PC_MAX_INPUT"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF573:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF934:
	.string	"__S_IFSOCK 0140000"
.LASF644:
	.string	"__need_timer_t "
.LASF1679:
	.string	"B38400 0000017"
.LASF736:
	.string	"_IO_ssize_t __ssize_t"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF1092:
	.string	"_PC_VDISABLE _PC_VDISABLE"
.LASF397:
	.string	"INT16_MIN (-32767-1)"
.LASF982:
	.string	"MRAA_SUB_PLATFORM_OFFSET 1"
.LASF566:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF1660:
	.string	"VT0 0000000"
.LASF1069:
	.string	"_XBS5_LP64_OFF64 1"
.LASF1624:
	.string	"IGNCR 0000200"
.LASF899:
	.string	"FASYNC O_ASYNC"
.LASF858:
	.string	"__O_NOFOLLOW 0400000"
.LASF1120:
	.string	"_SC_FSYNC _SC_FSYNC"
.LASF1633:
	.string	"OLCUC 0000002"
.LASF1178:
	.string	"_SC_LOGIN_NAME_MAX _SC_LOGIN_NAME_MAX"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF1332:
	.string	"_CS_LFS_LIBS _CS_LFS_LIBS"
.LASF1490:
	.string	"EPIPE 32"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF462:
	.string	"__SIZE_T__ "
.LASF1170:
	.string	"_SC_PII_OSI_COTS _SC_PII_OSI_COTS"
.LASF1033:
	.string	"_POSIX_PRIORITIZED_IO 200809L"
.LASF765:
	.string	"_IO_UNBUFFERED 2"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF562:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF218:
	.string	"__amd64__ 1"
.LASF310:
	.string	"__GLIBC_MINOR__ 23"
.LASF1245:
	.string	"_SC_CPUTIME _SC_CPUTIME"
.LASF336:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF322:
	.string	"__STRING(x) #x"
.LASF1721:
	.string	"TOSTOP 0000400"
.LASF894:
	.string	"LOCK_EX 2"
.LASF732:
	.string	"_G_BUFSIZ 8192"
.LASF1318:
	.string	"_SC_XOPEN_STREAMS _SC_XOPEN_STREAMS"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF306:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF1022:
	.string	"_POSIX_THREAD_ATTR_STACKSIZE 200809L"
.LASF1822:
	.string	"MRAA_JSON_PLATFORM"
.LASF1799:
	.string	"unsigned int"
.LASF1572:
	.string	"EALREADY 114"
.LASF1357:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS"
.LASF1512:
	.string	"EXFULL 54"
.LASF1557:
	.string	"EADDRNOTAVAIL 99"
.LASF1519:
	.string	"ENODATA 61"
.LASF1220:
	.string	"_SC_SHRT_MAX _SC_SHRT_MAX"
.LASF1350:
	.string	"_CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS"
.LASF347:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF927:
	.string	"__S_IFMT 0170000"
.LASF1733:
	.string	"TCIFLUSH 0"
.LASF597:
	.string	"htole16(x) (x)"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF787:
	.string	"_IO_DEC 020"
.LASF734:
	.string	"_IO_fpos64_t _G_fpos64_t"
.LASF554:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF1793:
	.string	"short int"
.LASF1600:
	.string	"VINTR 0"
.LASF411:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF538:
	.string	"__S16_TYPE short int"
.LASF1031:
	.string	"_POSIX_ASYNC_IO 1"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF1189:
	.string	"_SC_THREAD_PROCESS_SHARED _SC_THREAD_PROCESS_SHARED"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF806:
	.string	"_IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF16:
	.string	"_LP64 1"
.LASF621:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF550:
	.string	"__S64_TYPE long int"
.LASF1311:
	.string	"_SC_V7_LP64_OFF64 _SC_V7_LP64_OFF64"
.LASF678:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF5:
	.string	"__GNUC__ 5"
.LASF243:
	.string	"DEBUG 1"
.LASF857:
	.string	"__O_DIRECTORY 0200000"
.LASF1119:
	.string	"_SC_SYNCHRONIZED_IO _SC_SYNCHRONIZED_IO"
.LASF614:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF1700:
	.string	"B921600 0010007"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF891:
	.string	"F_EXLCK 4"
.LASF1343:
	.string	"_CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF290:
	.string	"__USE_ISOC95 1"
.LASF1574:
	.string	"ESTALE 116"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF1755:
	.string	"CQUIT 034"
.LASF803:
	.string	"_IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))"
.LASF1362:
	.string	"_CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF1500:
	.string	"ENOMSG 42"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
