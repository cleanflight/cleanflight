	.file	"build_config.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed build_config.i -mtune=generic
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
.Letext0:
	.file 1 "/usr/include/stdint.h"
	.file 2 "./src/main/config/parameter_group.h"
	.file 3 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1b8
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF23
	.byte	0xc
	.long	.LASF24
	.long	.LASF25
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
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0x15
	.long	0x4b
	.uleb128 0x4
	.long	.LASF11
	.byte	0x2
	.byte	0x26
	.long	0x8c
	.uleb128 0x5
	.long	0x9c
	.uleb128 0x6
	.long	0x9c
	.uleb128 0x6
	.long	0x2b
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.uleb128 0x8
	.byte	0x8
	.byte	0x2
	.byte	0x2d
	.long	0xbc
	.uleb128 0x9
	.string	"ptr"
	.byte	0x2
	.byte	0x2e
	.long	0x9c
	.uleb128 0x9
	.string	"fn"
	.byte	0x2
	.byte	0x2f
	.long	0xbc
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x81
	.uleb128 0xb
	.long	.LASF26
	.byte	0x20
	.byte	0x2
	.byte	0x28
	.long	0x10b
	.uleb128 0xc
	.string	"pgn"
	.byte	0x2
	.byte	0x29
	.long	0x76
	.byte	0
	.uleb128 0xd
	.long	.LASF12
	.byte	0x2
	.byte	0x2a
	.long	0x4b
	.byte	0x2
	.uleb128 0xd
	.long	.LASF13
	.byte	0x2
	.byte	0x2b
	.long	0x10b
	.byte	0x8
	.uleb128 0xc
	.string	"ptr"
	.byte	0x2
	.byte	0x2c
	.long	0x111
	.byte	0x10
	.uleb128 0xd
	.long	.LASF14
	.byte	0x2
	.byte	0x30
	.long	0x9e
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x39
	.uleb128 0xa
	.byte	0x8
	.long	0x10b
	.uleb128 0x4
	.long	.LASF15
	.byte	0x2
	.byte	0x31
	.long	0xc2
	.uleb128 0xe
	.long	.LASF16
	.byte	0x3
	.byte	0xc8
	.long	0x5d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0xe
	.long	.LASF17
	.byte	0x3
	.byte	0xc9
	.long	0x5d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0xe
	.long	.LASF18
	.byte	0x3
	.byte	0xca
	.long	0x5d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0xe
	.long	.LASF19
	.byte	0x2
	.byte	0x43
	.long	0x176
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xa
	.byte	0x8
	.long	0x117
	.uleb128 0xe
	.long	.LASF20
	.byte	0x2
	.byte	0x44
	.long	0x176
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0xe
	.long	.LASF21
	.byte	0x2
	.byte	0x47
	.long	0x10b
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0xe
	.long	.LASF22
	.byte	0x2
	.byte	0x48
	.long	0x10b
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
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
.LASF14:
	.string	"reset"
.LASF19:
	.string	"__pg_registry_start"
.LASF20:
	.string	"__pg_registry_end"
.LASF10:
	.string	"pgn_t"
.LASF22:
	.string	"__pg_resetdata_end"
.LASF3:
	.string	"unsigned char"
.LASF9:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF23:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF25:
	.string	"/home/aravind/git/cleanflight"
.LASF18:
	.string	"U_ID_2"
.LASF26:
	.string	"pgRegistry_s"
.LASF15:
	.string	"pgRegistry_t"
.LASF8:
	.string	"unsigned int"
.LASF13:
	.string	"address"
.LASF4:
	.string	"uint8_t"
.LASF16:
	.string	"U_ID_0"
.LASF17:
	.string	"U_ID_1"
.LASF11:
	.string	"pgResetFunc"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF21:
	.string	"__pg_resetdata_start"
.LASF0:
	.string	"signed char"
.LASF12:
	.string	"size"
.LASF24:
	.string	"src/main/build/build_config.c"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
