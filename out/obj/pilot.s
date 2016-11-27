	.file	"pilot.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed pilot.i -mtune=generic -march=x86-64 -g
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
	.comm	pilotConfig_System,15,8
	.globl	pilotConfig_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	pilotConfig_Registry, @object
	.size	pilotConfig_Registry, 32
pilotConfig_Registry:
# pgn:
	.value	47
# size:
	.value	15
# address:
	.zero	4
	.quad	pilotConfig_System
# ptr:
	.quad	0
# reset:
# ptr:
	.quad	pgResetTemplate_pilotConfig
	.globl	pgResetTemplate_pilotConfig
	.section	.pg_resetdata,"a",@progbits
	.align 2
	.type	pgResetTemplate_pilotConfig, @object
	.size	pgResetTemplate_pilotConfig, 15
pgResetTemplate_pilotConfig:
# callsign:
	.string	" CLEANFLIGHT! "
	.text
.Letext0:
	.file 1 "/usr/include/stdint.h"
	.file 2 "./src/main/config/parameter_group.h"
	.file 3 "./src/main/common/pilot.h"
	.file 4 "./src/main/target/edison/target.h"
	.file 5 "src/main/common/pilot.c"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x280
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF39
	.byte	0xc
	.long	.LASF40
	.long	.LASF41
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
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF11
	.byte	0x1
	.byte	0x30
	.long	0x32
	.uleb128 0x5
	.long	.LASF12
	.byte	0x1
	.byte	0x31
	.long	0x39
	.uleb128 0x5
	.long	.LASF13
	.byte	0x1
	.byte	0x33
	.long	0x2b
	.uleb128 0x5
	.long	.LASF14
	.byte	0x2
	.byte	0x15
	.long	0x7e
	.uleb128 0x6
	.byte	0x4
	.long	0x2b
	.byte	0x2
	.byte	0x1d
	.long	0xce
	.uleb128 0x7
	.long	.LASF15
	.value	0xfff
	.uleb128 0x7
	.long	.LASF16
	.value	0xf000
	.uleb128 0x7
	.long	.LASF17
	.value	0xfff
	.uleb128 0x8
	.long	.LASF18
	.byte	0
	.uleb128 0x7
	.long	.LASF19
	.value	0x8000
	.byte	0
	.uleb128 0x5
	.long	.LASF20
	.byte	0x2
	.byte	0x26
	.long	0xd9
	.uleb128 0x9
	.long	0xe9
	.uleb128 0xa
	.long	0x5c
	.uleb128 0xa
	.long	0x24
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0x2
	.byte	0x2d
	.long	0x107
	.uleb128 0xc
	.string	"ptr"
	.byte	0x2
	.byte	0x2e
	.long	0x5c
	.uleb128 0xc
	.string	"fn"
	.byte	0x2
	.byte	0x2f
	.long	0x107
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0xce
	.uleb128 0xe
	.long	.LASF25
	.byte	0x20
	.byte	0x2
	.byte	0x28
	.long	0x156
	.uleb128 0xf
	.string	"pgn"
	.byte	0x2
	.byte	0x29
	.long	0x94
	.byte	0
	.uleb128 0x10
	.long	.LASF21
	.byte	0x2
	.byte	0x2a
	.long	0x7e
	.byte	0x2
	.uleb128 0x10
	.long	.LASF22
	.byte	0x2
	.byte	0x2b
	.long	0x156
	.byte	0x8
	.uleb128 0xf
	.string	"ptr"
	.byte	0x2
	.byte	0x2c
	.long	0x15c
	.byte	0x10
	.uleb128 0x10
	.long	.LASF23
	.byte	0x2
	.byte	0x30
	.long	0xe9
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x73
	.uleb128 0xd
	.byte	0x8
	.long	0x156
	.uleb128 0x5
	.long	.LASF24
	.byte	0x2
	.byte	0x31
	.long	0x10d
	.uleb128 0xe
	.long	.LASF26
	.byte	0xf
	.byte	0x3
	.byte	0x13
	.long	0x186
	.uleb128 0x10
	.long	.LASF27
	.byte	0x3
	.byte	0x14
	.long	0x186
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	0x73
	.long	0x196
	.uleb128 0x12
	.long	0x55
	.byte	0xe
	.byte	0
	.uleb128 0x5
	.long	.LASF28
	.byte	0x3
	.byte	0x15
	.long	0x16d
	.uleb128 0x13
	.long	.LASF29
	.byte	0x4
	.byte	0xc8
	.long	0x89
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x13
	.long	.LASF30
	.byte	0x4
	.byte	0xc9
	.long	0x89
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x13
	.long	.LASF31
	.byte	0x4
	.byte	0xca
	.long	0x89
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x13
	.long	.LASF32
	.byte	0x2
	.byte	0x43
	.long	0x1f5
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xd
	.byte	0x8
	.long	0x162
	.uleb128 0x13
	.long	.LASF33
	.byte	0x2
	.byte	0x44
	.long	0x1f5
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x13
	.long	.LASF34
	.byte	0x2
	.byte	0x47
	.long	0x156
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x13
	.long	.LASF35
	.byte	0x2
	.byte	0x48
	.long	0x156
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x13
	.long	.LASF36
	.byte	0x5
	.byte	0x2a
	.long	0x196
	.uleb128 0x9
	.byte	0x3
	.quad	pilotConfig_System
	.uleb128 0x13
	.long	.LASF37
	.byte	0x5
	.byte	0x2c
	.long	0x264
	.uleb128 0x9
	.byte	0x3
	.quad	pgResetTemplate_pilotConfig
	.uleb128 0x14
	.long	0x196
	.uleb128 0x13
	.long	.LASF38
	.byte	0x5
	.byte	0x2a
	.long	0x27e
	.uleb128 0x9
	.byte	0x3
	.quad	pilotConfig_Registry
	.uleb128 0x14
	.long	0x162
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
	.uleb128 0x5
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
.LASF26:
	.string	"pilotConfig_s"
.LASF28:
	.string	"pilotConfig_t"
.LASF23:
	.string	"reset"
.LASF3:
	.string	"short unsigned int"
.LASF11:
	.string	"uint8_t"
.LASF32:
	.string	"__pg_registry_start"
.LASF33:
	.string	"__pg_registry_end"
.LASF14:
	.string	"pgn_t"
.LASF19:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF29:
	.string	"U_ID_0"
.LASF40:
	.string	"src/main/common/pilot.c"
.LASF30:
	.string	"U_ID_1"
.LASF31:
	.string	"U_ID_2"
.LASF21:
	.string	"size"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"PGR_SIZE_MASK"
.LASF39:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF41:
	.string	"/home/aravind/git/cleanflight"
.LASF2:
	.string	"unsigned char"
.LASF18:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF24:
	.string	"pgRegistry_t"
.LASF25:
	.string	"pgRegistry_s"
.LASF15:
	.string	"PGR_PGN_MASK"
.LASF38:
	.string	"pilotConfig_Registry"
.LASF1:
	.string	"unsigned int"
.LASF22:
	.string	"address"
.LASF10:
	.string	"long long unsigned int"
.LASF37:
	.string	"pgResetTemplate_pilotConfig"
.LASF16:
	.string	"PGR_PGN_VERSION_MASK"
.LASF7:
	.string	"sizetype"
.LASF9:
	.string	"long long int"
.LASF35:
	.string	"__pg_resetdata_end"
.LASF20:
	.string	"pgResetFunc"
.LASF8:
	.string	"char"
.LASF5:
	.string	"short int"
.LASF12:
	.string	"uint16_t"
.LASF13:
	.string	"uint32_t"
.LASF6:
	.string	"long int"
.LASF34:
	.string	"__pg_resetdata_start"
.LASF27:
	.string	"callsign"
.LASF4:
	.string	"signed char"
.LASF36:
	.string	"pilotConfig_System"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
