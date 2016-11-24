	.file	"pilot.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed pilot.i -mtune=generic -march=x86-64
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
	.long	0x284
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF942
	.byte	0xc
	.long	.LASF943
	.long	.LASF944
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF903
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF904
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF905
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF906
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF907
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF908
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF909
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF910
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF911
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF912
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF913
	.uleb128 0x5
	.long	.LASF914
	.byte	0x1
	.byte	0x30
	.long	0x36
	.uleb128 0x5
	.long	.LASF915
	.byte	0x1
	.byte	0x31
	.long	0x3d
	.uleb128 0x5
	.long	.LASF916
	.byte	0x1
	.byte	0x33
	.long	0x2f
	.uleb128 0x5
	.long	.LASF917
	.byte	0x2
	.byte	0x15
	.long	0x82
	.uleb128 0x6
	.byte	0x4
	.long	0x2f
	.byte	0x2
	.byte	0x1d
	.long	0xd2
	.uleb128 0x7
	.long	.LASF918
	.value	0xfff
	.uleb128 0x7
	.long	.LASF919
	.value	0xf000
	.uleb128 0x7
	.long	.LASF920
	.value	0xfff
	.uleb128 0x8
	.long	.LASF921
	.byte	0
	.uleb128 0x7
	.long	.LASF922
	.value	0x8000
	.byte	0
	.uleb128 0x5
	.long	.LASF923
	.byte	0x2
	.byte	0x26
	.long	0xdd
	.uleb128 0x9
	.long	0xed
	.uleb128 0xa
	.long	0x60
	.uleb128 0xa
	.long	0x28
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0x2
	.byte	0x2d
	.long	0x10b
	.uleb128 0xc
	.string	"ptr"
	.byte	0x2
	.byte	0x2e
	.long	0x60
	.uleb128 0xc
	.string	"fn"
	.byte	0x2
	.byte	0x2f
	.long	0x10b
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0xd2
	.uleb128 0xe
	.long	.LASF928
	.byte	0x20
	.byte	0x2
	.byte	0x28
	.long	0x15a
	.uleb128 0xf
	.string	"pgn"
	.byte	0x2
	.byte	0x29
	.long	0x98
	.byte	0
	.uleb128 0x10
	.long	.LASF924
	.byte	0x2
	.byte	0x2a
	.long	0x82
	.byte	0x2
	.uleb128 0x10
	.long	.LASF925
	.byte	0x2
	.byte	0x2b
	.long	0x15a
	.byte	0x8
	.uleb128 0xf
	.string	"ptr"
	.byte	0x2
	.byte	0x2c
	.long	0x160
	.byte	0x10
	.uleb128 0x10
	.long	.LASF926
	.byte	0x2
	.byte	0x30
	.long	0xed
	.byte	0x18
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x77
	.uleb128 0xd
	.byte	0x8
	.long	0x15a
	.uleb128 0x5
	.long	.LASF927
	.byte	0x2
	.byte	0x31
	.long	0x111
	.uleb128 0xe
	.long	.LASF929
	.byte	0xf
	.byte	0x3
	.byte	0x13
	.long	0x18a
	.uleb128 0x10
	.long	.LASF930
	.byte	0x3
	.byte	0x14
	.long	0x18a
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	0x77
	.long	0x19a
	.uleb128 0x12
	.long	0x59
	.byte	0xe
	.byte	0
	.uleb128 0x5
	.long	.LASF931
	.byte	0x3
	.byte	0x15
	.long	0x171
	.uleb128 0x13
	.long	.LASF932
	.byte	0x4
	.byte	0xc8
	.long	0x8d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x13
	.long	.LASF933
	.byte	0x4
	.byte	0xc9
	.long	0x8d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x13
	.long	.LASF934
	.byte	0x4
	.byte	0xca
	.long	0x8d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x13
	.long	.LASF935
	.byte	0x2
	.byte	0x43
	.long	0x1f9
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xd
	.byte	0x8
	.long	0x166
	.uleb128 0x13
	.long	.LASF936
	.byte	0x2
	.byte	0x44
	.long	0x1f9
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x13
	.long	.LASF937
	.byte	0x2
	.byte	0x47
	.long	0x15a
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x13
	.long	.LASF938
	.byte	0x2
	.byte	0x48
	.long	0x15a
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x13
	.long	.LASF939
	.byte	0x5
	.byte	0x2a
	.long	0x19a
	.uleb128 0x9
	.byte	0x3
	.quad	pilotConfig_System
	.uleb128 0x13
	.long	.LASF940
	.byte	0x5
	.byte	0x2c
	.long	0x268
	.uleb128 0x9
	.byte	0x3
	.quad	pgResetTemplate_pilotConfig
	.uleb128 0x14
	.long	0x19a
	.uleb128 0x13
	.long	.LASF941
	.byte	0x5
	.byte	0x2a
	.long	0x282
	.uleb128 0x9
	.byte	0x3
	.quad	pilotConfig_Registry
	.uleb128 0x14
	.long	0x166
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
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x5
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
	.uleb128 0x1d
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 8 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x8
	.file 9 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x18
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
	.byte	0x7
	.long	.Ldebug_macro8
	.file 14 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF430
	.file 15 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.file 16 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro11
	.file 17 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro12
	.file 18 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x12
	.byte	0x5
	.uleb128 0x7
	.long	.LASF460
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro13
	.file 19 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x18
	.long	.LASF467
	.file 20 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x18
	.long	.LASF468
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 21 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF522
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF523
	.file 22 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x19
	.long	.LASF524
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro19
	.file 23 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro20
	.file 24 "/usr/include/time.h"
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro21
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF389
	.byte	0x3
	.uleb128 0x92
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro23
	.file 25 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xdb
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x16
	.long	.LASF590
	.file 26 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x1a
	.byte	0x3
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.file 27 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF601
	.file 28 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.file 29 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0xde
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.file 30 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0x10e
	.uleb128 0x1e
	.byte	0x5
	.uleb128 0x13
	.long	.LASF624
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF639
	.file 31 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x1ec
	.uleb128 0x1f
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro34
	.byte	0x4
	.byte	0x5
	.uleb128 0x2e4
	.long	.LASF643
	.file 32 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ba
	.uleb128 0x20
	.byte	0x4
	.byte	0x6
	.uleb128 0x3c5
	.long	.LASF644
	.byte	0x4
	.file 33 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x21
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x17
	.long	.LASF645
	.file 34 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF712
	.byte	0x4
	.file 35 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x23
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.file 36 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0x24
	.byte	0x5
	.uleb128 0x15
	.long	.LASF714
	.byte	0x4
	.byte	0x4
	.file 37 "./src/main/platform.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x25
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.byte	0x4
	.file 38 "./src/main/build/debug.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x26
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.file 39 "./src/main/config/parameter_group_ids.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x27
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x12
	.long	.LASF902
	.byte	0x4
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
	.long	.LASF259
	.byte	0x6
	.uleb128 0x61
	.long	.LASF260
	.byte	0x6
	.uleb128 0x62
	.long	.LASF261
	.byte	0x6
	.uleb128 0x63
	.long	.LASF262
	.byte	0x6
	.uleb128 0x64
	.long	.LASF263
	.byte	0x6
	.uleb128 0x65
	.long	.LASF264
	.byte	0x6
	.uleb128 0x66
	.long	.LASF265
	.byte	0x6
	.uleb128 0x67
	.long	.LASF266
	.byte	0x6
	.uleb128 0x68
	.long	.LASF267
	.byte	0x6
	.uleb128 0x69
	.long	.LASF268
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF269
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF270
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF271
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF272
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF273
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF274
	.byte	0x6
	.uleb128 0x70
	.long	.LASF275
	.byte	0x6
	.uleb128 0x71
	.long	.LASF276
	.byte	0x6
	.uleb128 0x72
	.long	.LASF277
	.byte	0x6
	.uleb128 0x73
	.long	.LASF278
	.byte	0x6
	.uleb128 0x74
	.long	.LASF279
	.byte	0x6
	.uleb128 0x75
	.long	.LASF280
	.byte	0x6
	.uleb128 0x76
	.long	.LASF281
	.byte	0x6
	.uleb128 0x77
	.long	.LASF282
	.byte	0x6
	.uleb128 0x78
	.long	.LASF283
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF284
	.byte	0x5
	.uleb128 0x88
	.long	.LASF285
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF286
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF287
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF288
	.byte	0x5
	.uleb128 0xce
	.long	.LASF289
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF290
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF291
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF292
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF293
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF294
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF295
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF296
	.byte	0x5
	.uleb128 0x101
	.long	.LASF297
	.byte	0x5
	.uleb128 0x105
	.long	.LASF298
	.byte	0x5
	.uleb128 0x109
	.long	.LASF299
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF262
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF289
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF261
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF288
	.byte	0x5
	.uleb128 0x111
	.long	.LASF300
	.byte	0x6
	.uleb128 0x112
	.long	.LASF301
	.byte	0x5
	.uleb128 0x113
	.long	.LASF302
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF303
	.byte	0x5
	.uleb128 0x141
	.long	.LASF304
	.byte	0x5
	.uleb128 0x154
	.long	.LASF305
	.byte	0x6
	.uleb128 0x161
	.long	.LASF306
	.byte	0x5
	.uleb128 0x162
	.long	.LASF307
	.byte	0x5
	.uleb128 0x166
	.long	.LASF308
	.byte	0x5
	.uleb128 0x167
	.long	.LASF309
	.byte	0x5
	.uleb128 0x169
	.long	.LASF310
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF311
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF312
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF313
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF314
	.byte	0x5
	.uleb128 0x37
	.long	.LASF315
	.byte	0x5
	.uleb128 0x38
	.long	.LASF316
	.byte	0x5
	.uleb128 0x39
	.long	.LASF317
	.byte	0x5
	.uleb128 0x52
	.long	.LASF318
	.byte	0x5
	.uleb128 0x53
	.long	.LASF319
	.byte	0x5
	.uleb128 0x58
	.long	.LASF320
	.byte	0x5
	.uleb128 0x59
	.long	.LASF321
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF322
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF323
	.byte	0x5
	.uleb128 0x65
	.long	.LASF324
	.byte	0x5
	.uleb128 0x66
	.long	.LASF325
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF326
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF327
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF328
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF329
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF330
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF331
	.byte	0x5
	.uleb128 0x84
	.long	.LASF332
	.byte	0x5
	.uleb128 0x85
	.long	.LASF333
	.byte	0x5
	.uleb128 0x88
	.long	.LASF334
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF335
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF336
	.byte	0x5
	.uleb128 0x96
	.long	.LASF337
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF338
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF339
	.byte	0x5
	.uleb128 0xba
	.long	.LASF340
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF341
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF342
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF343
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF344
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF345
	.byte	0x5
	.uleb128 0xec
	.long	.LASF346
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF347
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF348
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF349
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF350
	.byte	0x5
	.uleb128 0x114
	.long	.LASF351
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF352
	.byte	0x5
	.uleb128 0x125
	.long	.LASF353
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF354
	.byte	0x5
	.uleb128 0x133
	.long	.LASF355
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF356
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF357
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF358
	.byte	0x5
	.uleb128 0x157
	.long	.LASF359
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF360
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF361
	.byte	0x5
	.uleb128 0x172
	.long	.LASF362
	.byte	0x5
	.uleb128 0x181
	.long	.LASF363
	.byte	0x5
	.uleb128 0x182
	.long	.LASF364
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF365
	.byte	0x5
	.uleb128 0xa
	.long	.LASF366
	.byte	0x5
	.uleb128 0xc
	.long	.LASF367
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF368
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF369
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF370
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF371
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF372
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF373
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF374
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF375
	.byte	0x5
	.uleb128 0xb
	.long	.LASF376
	.byte	0x5
	.uleb128 0xc
	.long	.LASF377
	.byte	0x5
	.uleb128 0xd
	.long	.LASF378
	.byte	0x5
	.uleb128 0xe
	.long	.LASF379
	.byte	0x5
	.uleb128 0xf
	.long	.LASF380
	.byte	0x5
	.uleb128 0x10
	.long	.LASF381
	.byte	0x5
	.uleb128 0x11
	.long	.LASF382
	.byte	0x5
	.uleb128 0x12
	.long	.LASF383
	.byte	0x5
	.uleb128 0x13
	.long	.LASF384
	.byte	0x5
	.uleb128 0x14
	.long	.LASF385
	.byte	0x5
	.uleb128 0x15
	.long	.LASF386
	.byte	0x5
	.uleb128 0x16
	.long	.LASF387
	.byte	0x5
	.uleb128 0x17
	.long	.LASF388
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.27.59e2586c75bdbcb991b248ad7257b993,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF389
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF390
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF391
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.e1c83cba2098ce92b68f6311de19e6b1,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF392
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF393
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF394
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF395
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF396
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF397
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF398
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF399
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF400
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF401
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF402
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF403
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF404
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF405
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF406
	.byte	0x5
	.uleb128 0xca
	.long	.LASF407
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF408
	.byte	0x6
	.uleb128 0xee
	.long	.LASF409
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF410
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF411
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF412
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF413
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF414
	.byte	0x5
	.uleb128 0x110
	.long	.LASF415
	.byte	0x5
	.uleb128 0x111
	.long	.LASF416
	.byte	0x5
	.uleb128 0x112
	.long	.LASF417
	.byte	0x5
	.uleb128 0x113
	.long	.LASF418
	.byte	0x5
	.uleb128 0x114
	.long	.LASF419
	.byte	0x5
	.uleb128 0x115
	.long	.LASF420
	.byte	0x5
	.uleb128 0x116
	.long	.LASF421
	.byte	0x5
	.uleb128 0x117
	.long	.LASF422
	.byte	0x5
	.uleb128 0x118
	.long	.LASF423
	.byte	0x5
	.uleb128 0x119
	.long	.LASF424
	.byte	0x6
	.uleb128 0x126
	.long	.LASF425
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF426
	.byte	0x6
	.uleb128 0x191
	.long	.LASF427
	.byte	0x5
	.uleb128 0x196
	.long	.LASF428
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF429
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.e401b8bcfee800b540b27abd7cc78de9,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF431
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF432
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF433
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF434
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF435
	.byte	0x5
	.uleb128 0x20
	.long	.LASF436
	.byte	0x5
	.uleb128 0x22
	.long	.LASF437
	.byte	0x5
	.uleb128 0x24
	.long	.LASF438
	.byte	0x5
	.uleb128 0x25
	.long	.LASF439
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF440
	.byte	0x6
	.uleb128 0x2e
	.long	.LASF441
	.byte	0x6
	.uleb128 0x2f
	.long	.LASF442
	.byte	0x6
	.uleb128 0x30
	.long	.LASF443
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF444
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF445
	.byte	0x5
	.uleb128 0x22
	.long	.LASF446
	.byte	0x5
	.uleb128 0x25
	.long	.LASF447
	.byte	0x5
	.uleb128 0x28
	.long	.LASF448
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF449
	.byte	0x5
	.uleb128 0x31
	.long	.LASF450
	.byte	0x5
	.uleb128 0x35
	.long	.LASF451
	.byte	0x5
	.uleb128 0x38
	.long	.LASF452
	.byte	0x5
	.uleb128 0x39
	.long	.LASF453
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF454
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.19.ff00c9c0f5e9f9a9719c5de76ace57b4,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF456
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF457
	.byte	0x5
	.uleb128 0x20
	.long	.LASF458
	.byte	0x5
	.uleb128 0x21
	.long	.LASF459
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.41.24cced64aef71195a51d4daa8e4f4a95,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF461
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF462
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF463
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF464
	.byte	0x5
	.uleb128 0x30
	.long	.LASF465
	.byte	0x5
	.uleb128 0x34
	.long	.LASF466
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF469
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF470
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF471
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF472
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF473
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF474
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF475
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF476
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF477
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF478
	.byte	0x5
	.uleb128 0x70
	.long	.LASF479
	.byte	0x5
	.uleb128 0x71
	.long	.LASF480
	.byte	0x5
	.uleb128 0x72
	.long	.LASF481
	.byte	0x5
	.uleb128 0x73
	.long	.LASF482
	.byte	0x5
	.uleb128 0x75
	.long	.LASF483
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF484
	.byte	0x5
	.uleb128 0x22
	.long	.LASF485
	.byte	0x5
	.uleb128 0x23
	.long	.LASF486
	.byte	0x5
	.uleb128 0x26
	.long	.LASF487
	.byte	0x5
	.uleb128 0x27
	.long	.LASF488
	.byte	0x5
	.uleb128 0x28
	.long	.LASF489
	.byte	0x5
	.uleb128 0x29
	.long	.LASF490
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF491
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF492
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF493
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF494
	.byte	0x5
	.uleb128 0x33
	.long	.LASF495
	.byte	0x5
	.uleb128 0x34
	.long	.LASF496
	.byte	0x5
	.uleb128 0x35
	.long	.LASF497
	.byte	0x5
	.uleb128 0x36
	.long	.LASF498
	.byte	0x5
	.uleb128 0x37
	.long	.LASF499
	.byte	0x5
	.uleb128 0x38
	.long	.LASF500
	.byte	0x5
	.uleb128 0x39
	.long	.LASF501
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF502
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF503
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF504
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF505
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF506
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF507
	.byte	0x5
	.uleb128 0x40
	.long	.LASF508
	.byte	0x5
	.uleb128 0x41
	.long	.LASF509
	.byte	0x5
	.uleb128 0x42
	.long	.LASF510
	.byte	0x5
	.uleb128 0x43
	.long	.LASF511
	.byte	0x5
	.uleb128 0x44
	.long	.LASF512
	.byte	0x5
	.uleb128 0x45
	.long	.LASF513
	.byte	0x5
	.uleb128 0x46
	.long	.LASF514
	.byte	0x5
	.uleb128 0x47
	.long	.LASF515
	.byte	0x5
	.uleb128 0x48
	.long	.LASF516
	.byte	0x5
	.uleb128 0x49
	.long	.LASF517
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF518
	.byte	0x5
	.uleb128 0x50
	.long	.LASF519
	.byte	0x5
	.uleb128 0x53
	.long	.LASF520
	.byte	0x5
	.uleb128 0x57
	.long	.LASF521
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.38.11ee5fdc0f6cc53a16c505b9233cecef,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF525
	.byte	0x5
	.uleb128 0x61
	.long	.LASF526
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.63.97272d7c64d5db8020003b32e9289502,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF527
	.byte	0x5
	.uleb128 0x40
	.long	.LASF528
	.byte	0x5
	.uleb128 0x41
	.long	.LASF529
	.byte	0x5
	.uleb128 0x42
	.long	.LASF530
	.byte	0x5
	.uleb128 0x44
	.long	.LASF531
	.byte	0x5
	.uleb128 0x45
	.long	.LASF532
	.byte	0x5
	.uleb128 0x46
	.long	.LASF533
	.byte	0x5
	.uleb128 0x47
	.long	.LASF534
	.byte	0x5
	.uleb128 0x49
	.long	.LASF535
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF536
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF537
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF538
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.99.408b6270fa6eb71377201a241ef15f79,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF539
	.byte	0x5
	.uleb128 0x64
	.long	.LASF540
	.byte	0x5
	.uleb128 0x65
	.long	.LASF541
	.byte	0x5
	.uleb128 0x66
	.long	.LASF542
	.byte	0x5
	.uleb128 0x67
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.50.84aeca2ac6f37d40e1e9b3cef757ba2d,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF544
	.byte	0x5
	.uleb128 0x48
	.long	.LASF545
	.byte	0x5
	.uleb128 0x54
	.long	.LASF546
	.byte	0x5
	.uleb128 0x55
	.long	.LASF547
	.byte	0x5
	.uleb128 0x56
	.long	.LASF548
	.byte	0x5
	.uleb128 0x57
	.long	.LASF549
	.byte	0x5
	.uleb128 0x58
	.long	.LASF550
	.byte	0x5
	.uleb128 0x59
	.long	.LASF551
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF552
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF553
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF554
	.byte	0x5
	.uleb128 0x80
	.long	.LASF555
	.byte	0x5
	.uleb128 0x85
	.long	.LASF556
	.byte	0x5
	.uleb128 0x86
	.long	.LASF557
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF558
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.305f7c1ed78a85c751613a0e1f6565b3,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF559
	.byte	0x5
	.uleb128 0x28
	.long	.LASF560
	.byte	0x5
	.uleb128 0x34
	.long	.LASF561
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF562
	.byte	0x5
	.uleb128 0x42
	.long	.LASF563
	.byte	0x5
	.uleb128 0x47
	.long	.LASF564
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF565
	.byte	0x5
	.uleb128 0x51
	.long	.LASF566
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF567
	.byte	0x5
	.uleb128 0x63
	.long	.LASF568
	.byte	0x5
	.uleb128 0x69
	.long	.LASF569
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF570
	.byte	0x5
	.uleb128 0x75
	.long	.LASF571
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF572
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF573
	.byte	0x5
	.uleb128 0x81
	.long	.LASF574
	.byte	0x5
	.uleb128 0x82
	.long	.LASF575
	.byte	0x5
	.uleb128 0x83
	.long	.LASF576
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.53.beb46e650cd406cb917b6b96b45e640a,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF577
	.byte	0x6
	.uleb128 0x42
	.long	.LASF578
	.byte	0x5
	.uleb128 0x45
	.long	.LASF579
	.byte	0x6
	.uleb128 0x52
	.long	.LASF580
	.byte	0x5
	.uleb128 0x56
	.long	.LASF581
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF582
	.byte	0x5
	.uleb128 0x62
	.long	.LASF583
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF584
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF585
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.847b6907dabda77be90a9ab7ad789e2e,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF409
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF429
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.187.bd5a05039b505b3620e6973f1b2ffeb1,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF586
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF587
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF588
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF589
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.28.eb2f3debdbcffd1442ebddaebc4fb6ff,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF591
	.byte	0x5
	.uleb128 0x21
	.long	.LASF592
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF593
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF594
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF595
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF596
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF597
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF598
	.byte	0x5
	.uleb128 0x29
	.long	.LASF574
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF599
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF578
	.byte	0x6
	.uleb128 0x52
	.long	.LASF580
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF582
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF584
	.byte	0x5
	.uleb128 0x72
	.long	.LASF600
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF585
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.25.ae5284cdff565e87a9198d819340325d,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF602
	.byte	0x6
	.uleb128 0x65
	.long	.LASF603
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.49.e9d2041e5035cc68ebd1a20f7dbc8514,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF604
	.byte	0x6
	.uleb128 0x39
	.long	.LASF605
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF606
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF607
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF608
	.byte	0x5
	.uleb128 0x49
	.long	.LASF609
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF610
	.byte	0x5
	.uleb128 0x55
	.long	.LASF611
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF612
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF613
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF614
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF615
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sysmacros.h.20.8a0c33ff175cd9b434a86c0aaa36f0a2,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF616
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF617
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF618
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF619
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.229.67b3f66bd74b06b451caec392a72a945,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF620
	.byte	0x5
	.uleb128 0xec
	.long	.LASF621
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF622
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF623
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypes.h.25.6892b1493314fcf446bbc76e7362acba,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF625
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF626
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF627
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF628
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF629
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF630
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF631
	.byte	0x5
	.uleb128 0x20
	.long	.LASF632
	.byte	0x5
	.uleb128 0x21
	.long	.LASF633
	.byte	0x5
	.uleb128 0x46
	.long	.LASF634
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF635
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF636
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF637
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF638
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF640
	.byte	0x5
	.uleb128 0x17
	.long	.LASF389
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF641
	.byte	0x5
	.uleb128 0x23
	.long	.LASF642
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF646
	.byte	0x5
	.uleb128 0x22
	.long	.LASF647
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF648
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.52.8bda5d4f6e37fcdcd6c952c7de376f68,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x34
	.long	.LASF649
	.byte	0x5
	.uleb128 0x78
	.long	.LASF650
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF651
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF652
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF653
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF654
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF655
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF656
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF657
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF658
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF659
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF660
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF661
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF662
	.byte	0x5
	.uleb128 0xad
	.long	.LASF663
	.byte	0x5
	.uleb128 0xae
	.long	.LASF664
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF665
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF666
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF667
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF668
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF669
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF670
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF671
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF672
	.byte	0x5
	.uleb128 0xba
	.long	.LASF673
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF674
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF675
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF676
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF677
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF678
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF679
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF680
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF681
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF682
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF683
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF684
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF685
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF686
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF687
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF688
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF689
	.byte	0x5
	.uleb128 0xec
	.long	.LASF690
	.byte	0x5
	.uleb128 0xee
	.long	.LASF691
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF692
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF693
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF694
	.byte	0x5
	.uleb128 0x100
	.long	.LASF695
	.byte	0x5
	.uleb128 0x101
	.long	.LASF696
	.byte	0x5
	.uleb128 0x105
	.long	.LASF697
	.byte	0x5
	.uleb128 0x111
	.long	.LASF698
	.byte	0x5
	.uleb128 0x112
	.long	.LASF699
	.byte	0x5
	.uleb128 0x116
	.long	.LASF700
	.byte	0x5
	.uleb128 0x117
	.long	.LASF701
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF702
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF703
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF704
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF705
	.byte	0x5
	.uleb128 0x124
	.long	.LASF706
	.byte	0x5
	.uleb128 0x125
	.long	.LASF707
	.byte	0x5
	.uleb128 0x126
	.long	.LASF708
	.byte	0x5
	.uleb128 0x128
	.long	.LASF709
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF710
	.byte	0x5
	.uleb128 0x130
	.long	.LASF711
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.8394011d5995a16f15d67d04e84a1d69,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF713
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF389
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF391
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.04cc7214bceba497b20d15c10fd97511,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF409
	.byte	0x6
	.uleb128 0x191
	.long	.LASF427
	.byte	0x5
	.uleb128 0x196
	.long	.LASF428
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF429
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.target.h.27.fb30bee6923ab05d4360685030e3605d,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF715
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF716
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF717
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF718
	.byte	0x5
	.uleb128 0x21
	.long	.LASF719
	.byte	0x5
	.uleb128 0x22
	.long	.LASF720
	.byte	0x5
	.uleb128 0x23
	.long	.LASF721
	.byte	0x5
	.uleb128 0x24
	.long	.LASF722
	.byte	0x5
	.uleb128 0x25
	.long	.LASF723
	.byte	0x5
	.uleb128 0x26
	.long	.LASF724
	.byte	0x5
	.uleb128 0x29
	.long	.LASF725
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF726
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF727
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF728
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF729
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF730
	.byte	0x5
	.uleb128 0x34
	.long	.LASF731
	.byte	0x5
	.uleb128 0x37
	.long	.LASF732
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF733
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF734
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF735
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF736
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF737
	.byte	0x5
	.uleb128 0x40
	.long	.LASF738
	.byte	0x5
	.uleb128 0x42
	.long	.LASF739
	.byte	0x5
	.uleb128 0x43
	.long	.LASF740
	.byte	0x5
	.uleb128 0x44
	.long	.LASF741
	.byte	0x5
	.uleb128 0x45
	.long	.LASF742
	.byte	0x5
	.uleb128 0x47
	.long	.LASF743
	.byte	0x5
	.uleb128 0x48
	.long	.LASF744
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF745
	.byte	0x5
	.uleb128 0x50
	.long	.LASF746
	.byte	0x5
	.uleb128 0x52
	.long	.LASF747
	.byte	0x5
	.uleb128 0x55
	.long	.LASF748
	.byte	0x5
	.uleb128 0x56
	.long	.LASF749
	.byte	0x5
	.uleb128 0x58
	.long	.LASF750
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF751
	.byte	0x5
	.uleb128 0x60
	.long	.LASF752
	.byte	0x5
	.uleb128 0x62
	.long	.LASF753
	.byte	0x5
	.uleb128 0x63
	.long	.LASF754
	.byte	0x5
	.uleb128 0x64
	.long	.LASF755
	.byte	0x5
	.uleb128 0x65
	.long	.LASF756
	.byte	0x5
	.uleb128 0x66
	.long	.LASF757
	.byte	0x5
	.uleb128 0x67
	.long	.LASF758
	.byte	0x5
	.uleb128 0x68
	.long	.LASF759
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF760
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF761
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF762
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF763
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF764
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF765
	.byte	0x5
	.uleb128 0x71
	.long	.LASF766
	.byte	0x5
	.uleb128 0x72
	.long	.LASF767
	.byte	0x5
	.uleb128 0x73
	.long	.LASF768
	.byte	0x5
	.uleb128 0x74
	.long	.LASF769
	.byte	0x5
	.uleb128 0x75
	.long	.LASF770
	.byte	0x5
	.uleb128 0x76
	.long	.LASF771
	.byte	0x5
	.uleb128 0x79
	.long	.LASF772
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF773
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF774
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF775
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF776
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF777
	.byte	0x5
	.uleb128 0x80
	.long	.LASF778
	.byte	0x5
	.uleb128 0x81
	.long	.LASF779
	.byte	0x5
	.uleb128 0x82
	.long	.LASF780
	.byte	0x5
	.uleb128 0x83
	.long	.LASF781
	.byte	0x5
	.uleb128 0x84
	.long	.LASF782
	.byte	0x5
	.uleb128 0x85
	.long	.LASF783
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF784
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF785
	.byte	0x5
	.uleb128 0x90
	.long	.LASF786
	.byte	0x5
	.uleb128 0x91
	.long	.LASF787
	.byte	0x5
	.uleb128 0x92
	.long	.LASF788
	.byte	0x5
	.uleb128 0x93
	.long	.LASF789
	.byte	0x5
	.uleb128 0x95
	.long	.LASF790
	.byte	0x5
	.uleb128 0x97
	.long	.LASF791
	.byte	0x5
	.uleb128 0x98
	.long	.LASF792
	.byte	0x5
	.uleb128 0x99
	.long	.LASF793
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF794
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF795
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF796
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF797
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF798
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF799
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF800
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF801
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF802
	.byte	0x5
	.uleb128 0xad
	.long	.LASF803
	.byte	0x5
	.uleb128 0xae
	.long	.LASF804
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF805
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF806
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF807
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF808
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF809
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF810
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF811
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF812
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF813
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF814
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF815
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF816
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.debug.h.18.6574db8528ee4536a81057c3a08cdb4d,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.long	.LASF817
	.byte	0x5
	.uleb128 0x15
	.long	.LASF818
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF819
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF820
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.parameter_group.h.56.2c35fb08513b9e011c03a8315cc978c7,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF821
	.byte	0x5
	.uleb128 0x45
	.long	.LASF822
	.byte	0x5
	.uleb128 0x49
	.long	.LASF823
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF824
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF825
	.byte	0x5
	.uleb128 0x52
	.long	.LASF826
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF827
	.byte	0x5
	.uleb128 0x65
	.long	.LASF828
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF829
	.byte	0x5
	.uleb128 0x76
	.long	.LASF830
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF831
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF832
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF833
	.byte	0x5
	.uleb128 0x93
	.long	.LASF834
	.byte	0x5
	.uleb128 0x99
	.long	.LASF835
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF836
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF837
	.byte	0x5
	.uleb128 0xba
	.long	.LASF838
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF839
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF840
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF841
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF842
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF843
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.parameter_group_ids.h.19.97eecbb0e939074d5396400ea27f9f00,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF844
	.byte	0x5
	.uleb128 0x14
	.long	.LASF845
	.byte	0x5
	.uleb128 0x15
	.long	.LASF846
	.byte	0x5
	.uleb128 0x16
	.long	.LASF847
	.byte	0x5
	.uleb128 0x17
	.long	.LASF848
	.byte	0x5
	.uleb128 0x18
	.long	.LASF849
	.byte	0x5
	.uleb128 0x19
	.long	.LASF850
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF851
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF852
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF853
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF854
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF855
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF856
	.byte	0x5
	.uleb128 0x20
	.long	.LASF857
	.byte	0x5
	.uleb128 0x21
	.long	.LASF858
	.byte	0x5
	.uleb128 0x22
	.long	.LASF859
	.byte	0x5
	.uleb128 0x23
	.long	.LASF860
	.byte	0x5
	.uleb128 0x24
	.long	.LASF861
	.byte	0x5
	.uleb128 0x25
	.long	.LASF862
	.byte	0x5
	.uleb128 0x26
	.long	.LASF863
	.byte	0x5
	.uleb128 0x27
	.long	.LASF864
	.byte	0x5
	.uleb128 0x28
	.long	.LASF865
	.byte	0x5
	.uleb128 0x29
	.long	.LASF866
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF867
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF868
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF869
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF870
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF871
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF872
	.byte	0x5
	.uleb128 0x30
	.long	.LASF873
	.byte	0x5
	.uleb128 0x31
	.long	.LASF874
	.byte	0x5
	.uleb128 0x32
	.long	.LASF875
	.byte	0x5
	.uleb128 0x33
	.long	.LASF876
	.byte	0x5
	.uleb128 0x34
	.long	.LASF877
	.byte	0x5
	.uleb128 0x35
	.long	.LASF878
	.byte	0x5
	.uleb128 0x36
	.long	.LASF879
	.byte	0x5
	.uleb128 0x37
	.long	.LASF880
	.byte	0x5
	.uleb128 0x38
	.long	.LASF881
	.byte	0x5
	.uleb128 0x39
	.long	.LASF882
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF883
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF884
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF885
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF886
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF887
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF888
	.byte	0x5
	.uleb128 0x40
	.long	.LASF889
	.byte	0x5
	.uleb128 0x41
	.long	.LASF890
	.byte	0x5
	.uleb128 0x42
	.long	.LASF891
	.byte	0x5
	.uleb128 0x43
	.long	.LASF892
	.byte	0x5
	.uleb128 0x44
	.long	.LASF893
	.byte	0x5
	.uleb128 0x47
	.long	.LASF894
	.byte	0x5
	.uleb128 0x48
	.long	.LASF895
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF896
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF897
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF898
	.byte	0x5
	.uleb128 0x50
	.long	.LASF899
	.byte	0x5
	.uleb128 0x51
	.long	.LASF900
	.byte	0x5
	.uleb128 0x52
	.long	.LASF901
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF657:
	.string	"INT32_MAX (2147483647)"
.LASF483:
	.string	"__STD_TYPE typedef"
.LASF623:
	.string	"__fsfilcnt_t_defined "
.LASF661:
	.string	"UINT32_MAX (4294967295U)"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF561:
	.string	"__ino_t_defined "
.LASF910:
	.string	"sizetype"
.LASF887:
	.string	"PG_CHANNEL_RANGE_CONFIG 44"
.LASF869:
	.string	"PG_MOTOR_3D_CONFIG 26"
.LASF759:
	.string	"UART1_RX_PINSOURCE GPIO_PinSource7"
.LASF644:
	.string	"__need_malloc_and_calloc"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF17:
	.string	"__LP64__ 1"
.LASF772:
	.string	"USE_I2C "
.LASF386:
	.string	"__stub_sigreturn "
.LASF274:
	.string	"__USE_XOPEN2K8XSI"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF882:
	.string	"PG_THROTTLE_CORRECTION_CONFIG 39"
.LASF368:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF581:
	.string	"__clockid_t_defined 1"
.LASF897:
	.string	"PG_OSD_VIDEO_CONFIG 32769"
.LASF842:
	.string	"PG_REGISTER_PROFILE_WITH_RESET_TEMPLATE(_type,_name,_pgn,_version) extern const _type pgResetTemplate_ ## _name; PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.ptr = (void*)&pgResetTemplate_ ## _name})"
.LASF337:
	.string	"__flexarr []"
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF703:
	.string	"INT16_C(c) c"
.LASF306:
	.string	"__GNU_LIBRARY__"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF598:
	.string	"__sigset_t_defined "
.LASF832:
	.string	"PG_REGISTER(_type,_name,_pgn,_version) PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF433:
	.string	"WSTOPPED 2"
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
.LASF256:
	.string	"true 1"
.LASF245:
	.string	"EDISON 1"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF901:
	.string	"PG_RESERVED_FOR_TESTING_3 65535"
.LASF446:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF348:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF840:
	.string	"PG_REGISTER_PROFILE(_type,_name,_pgn,_version) PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF607:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF522:
	.string	"__STD_TYPE"
.LASF604:
	.string	"__suseconds_t_defined "
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF682:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF318:
	.string	"__P(args) args"
.LASF589:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF808:
	.string	"HARDWARE_BIND_PLUG "
.LASF393:
	.string	"__SIZE_T__ "
.LASF758:
	.string	"UART1_TX_PINSOURCE GPIO_PinSource6"
.LASF601:
	.string	"__need_timeval "
.LASF816:
	.string	"TARGET_BOARD_IDENTIFIER \"EDISON\""
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF496:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF571:
	.string	"__daddr_t_defined "
.LASF767:
	.string	"UART3_RX_PIN GPIO_Pin_11"
.LASF426:
	.string	"__need_wchar_t"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF714:
	.string	"_XLOCALE_H 1"
.LASF610:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF686:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF538:
	.string	"le64toh(x) (x)"
.LASF792:
	.string	"ADC_DMA_CHANNEL DMA2_Channel1"
.LASF862:
	.string	"PG_FEATURE_CONFIG 19"
.LASF551:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF707:
	.string	"UINT16_C(c) c"
.LASF473:
	.string	"__SLONGWORD_TYPE long int"
.LASF408:
	.string	"__size_t "
.LASF651:
	.string	"INT8_MIN (-128)"
.LASF595:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF480:
	.string	"__ULONG32_TYPE unsigned int"
.LASF310:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF938:
	.string	"__pg_resetdata_end"
.LASF783:
	.string	"I2C2_SDA_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF338:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF397:
	.string	"_T_SIZE "
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF265:
	.string	"__USE_POSIX2"
.LASF732:
	.string	"USE_MPU_DATA_READY_SIGNAL "
.LASF660:
	.string	"UINT16_MAX (65535)"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF681:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF463:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF677:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF277:
	.string	"__USE_FILE_OFFSET64"
.LASF637:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF264:
	.string	"__USE_POSIX"
.LASF861:
	.string	"PG_SYSTEM_CONFIG 18"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF427:
	.string	"NULL"
.LASF853:
	.string	"PG_GYRO_CONFIG 10"
.LASF596:
	.string	"_SIGSET_H_types 1"
.LASF593:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF935:
	.string	"__pg_registry_start"
.LASF931:
	.string	"pilotConfig_t"
.LASF378:
	.string	"__stub_fchflags "
.LASF722:
	.string	"LED1_GPIO GPIOB"
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF944:
	.string	"/home/aravind/git/cleanflight"
.LASF505:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF540:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF528:
	.string	"htole16(x) (x)"
.LASF285:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF268:
	.string	"__USE_XOPEN"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF786:
	.string	"MPU6500_CS_GPIO_CLK_PERIPHERAL RCC_AHBPeriph_GPIOA"
.LASF273:
	.string	"__USE_XOPEN2K8"
.LASF395:
	.string	"_SYS_SIZE_T_H "
.LASF342:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF243:
	.string	"DEBUG 1"
.LASF672:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF510:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF308:
	.string	"__GLIBC__ 2"
.LASF909:
	.string	"long int"
.LASF530:
	.string	"le16toh(x) (x)"
.LASF899:
	.string	"PG_RESERVED_FOR_TESTING_1 65533"
.LASF919:
	.string	"PGR_PGN_VERSION_MASK"
.LASF527:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF300:
	.string	"__USE_XOPEN2K8 1"
.LASF513:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF599:
	.string	"__need_timespec "
.LASF392:
	.string	"__size_t__ "
.LASF818:
	.string	"DEBUG_SECTION_TIMES "
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF238:
	.string	"__unix 1"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF743:
	.string	"ACC_MPU6050_ALIGN CW270_DEG"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF588:
	.string	"__int8_t_defined "
.LASF626:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF616:
	.string	"_SYS_SYSMACROS_H 1"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF459:
	.string	"__PDP_ENDIAN 3412"
.LASF537:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF688:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF504:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF503:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF353:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF404:
	.string	"_SIZE_T_DECLARED "
.LASF320:
	.string	"__CONCAT(x,y) x ## y"
.LASF449:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF373:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF920:
	.string	"PGR_SIZE_MASK"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF836:
	.string	"PG_REGISTER_ARR(_type,_size,_name,_pgn,_version) PG_REGISTER_ARR_I(_type, _size, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF778:
	.string	"I2C2_SCL_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF789:
	.string	"MPU6500_SPI_INSTANCE SPI3"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF345:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF695:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF584:
	.string	"__need_timer_t"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF543:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF501:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF870:
	.string	"PG_LED_STRIP_CONFIG 27"
.LASF701:
	.string	"WINT_MAX (4294967295u)"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF339:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF507:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF557:
	.string	"EXIT_SUCCESS 0"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF900:
	.string	"PG_RESERVED_FOR_TESTING_2 65534"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF800:
	.string	"DEFAULT FEATURES FEATURE_MOTOR_STOP"
.LASF907:
	.string	"signed char"
.LASF524:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF914:
	.string	"uint8_t"
.LASF552:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF467:
	.string	"_BITS_BYTESWAP_H 1"
.LASF470:
	.string	"__U16_TYPE unsigned short int"
.LASF322:
	.string	"__ptr_t void *"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF518:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF485:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF384:
	.string	"__stub_revoke "
.LASF828:
	.string	"PG_DECLARE(_type,_name) _type _name ## _System; static inline _type* _name(void) { return &_name ## _System; } struct _dummy"
.LASF773:
	.string	"I2C_DEVICE I2CDEV_6"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF586:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF640:
	.string	"_ALLOCA_H 1"
.LASF750:
	.string	"USB_IO "
.LASF560:
	.string	"__u_char_defined "
.LASF403:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF405:
	.string	"___int_size_t_h "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF288:
	.string	"__USE_ISOC99 1"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF319:
	.string	"__PMT(args) args"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF673:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF760:
	.string	"UART2_TX_PIN GPIO_Pin_2"
.LASF874:
	.string	"PG_TELEMETRY_CONFIG 31"
.LASF921:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF334:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF878:
	.string	"PG_ACCELEROMETER_CONFIG 35"
.LASF810:
	.string	"BINDPLUG_PIN Pin_12"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF782:
	.string	"I2C2_SDA_PIN_SOURCE GPIO_PinSource10"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF824:
	.string	"PG_REGISTRY_SIZE (__pg_registry_end - __pg_registry_start)"
.LASF568:
	.string	"__pid_t_defined "
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF652:
	.string	"INT16_MIN (-32767-1)"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF614:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF582:
	.string	"__clockid_time_t"
.LASF798:
	.string	"ADC_BATTERY ADC_CHANNEL0"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF362:
	.string	"__restrict_arr __restrict"
.LASF375:
	.string	"__stub___compat_bdflush "
.LASF826:
	.string	"PG_FOREACH_PROFILE(_name) PG_FOREACH(_name) if(pgIsSystem(_name)) continue; else"
.LASF401:
	.string	"_SIZE_T_DEFINED_ "
.LASF794:
	.string	"ADC0_GPIO GPIOA"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF511:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF280:
	.string	"__USE_GNU"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF668:
	.string	"INT_LEAST16_MAX (32767)"
.LASF809:
	.string	"BINDPLUG_PORT GPIOB"
.LASF911:
	.string	"char"
.LASF821:
	.string	"PG_PACKED __attribute__((packed))"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF390:
	.string	"__need_wchar_t "
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF896:
	.string	"PG_OSD_FONT_CONFIG 32768"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF389:
	.string	"__need_size_t "
.LASF495:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF283:
	.string	"__KERNEL_STRICT_NAMES"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF359:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF539:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF712:
	.string	"_GCC_WRAP_STDINT_H "
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF309:
	.string	"__GLIBC_MINOR__ 23"
.LASF813:
	.string	"TARGET_IO_PORTC 0xffff"
.LASF271:
	.string	"__USE_XOPEN2K"
.LASF437:
	.string	"__WNOTHREAD 0x20000000"
.LASF391:
	.string	"__need_NULL "
.LASF272:
	.string	"__USE_XOPEN2KXSI"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF815:
	.string	"TARGET_IO_PORTF (BIT(0)|BIT(1)|BIT(4))"
.LASF937:
	.string	"__pg_resetdata_start"
.LASF357:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF635:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF297:
	.string	"__USE_POSIX199309 1"
.LASF679:
	.string	"INT_FAST8_MAX (127)"
.LASF667:
	.string	"INT_LEAST8_MAX (127)"
.LASF738:
	.string	"GYRO_MPU6500_ALIGN CW270_DEG"
.LASF740:
	.string	"USE_ACC_MPU6050 "
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF484:
	.string	"_BITS_TYPESIZES_H 1"
.LASF854:
	.string	"PG_BATTERY_CONFIG 11"
.LASF708:
	.string	"UINT32_C(c) c ## U"
.LASF687:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF266:
	.string	"__USE_POSIX199309"
.LASF658:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF592:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF454:
	.string	"__W_CONTINUED 0xffff"
.LASF697:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF380:
	.string	"__stub_getmsg "
.LASF690:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF270:
	.string	"__USE_UNIX98"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF284:
	.string	"__KERNEL_STRICT_NAMES "
.LASF609:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF841:
	.string	"PG_REGISTER_PROFILE_WITH_RESET_FN(_type,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name})"
.LASF814:
	.string	"TARGET_IO_PORTD (BIT(2))"
.LASF489:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF474:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF902:
	.string	"CALLSIGN_LENGTH 14"
.LASF891:
	.string	"PG_MSP_SERVER_CONFIG 48"
.LASF219:
	.string	"__x86_64 1"
.LASF850:
	.string	"PG_SENSOR_SELECTION_CONFIG 7"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF574:
	.string	"__need_time_t "
.LASF629:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF728:
	.string	"LED1_GPIO_2 GPIOB"
.LASF385:
	.string	"__stub_setlogin "
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF520:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF577:
	.string	"__clock_t_defined 1"
.LASF890:
	.string	"PG_PILOT_CONFIG 47"
.LASF541:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF255:
	.string	"bool _Bool"
.LASF883:
	.string	"PG_COMPASS_CONFIGURATION 40"
.LASF784:
	.string	"USE_SPI "
.LASF753:
	.string	"USE_UART1_TX_DMA "
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF417:
	.string	"_BSD_WCHAR_T_ "
.LASF768:
	.string	"UART3_GPIO_AF GPIO_AF_7"
.LASF555:
	.string	"RAND_MAX 2147483647"
.LASF525:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF366:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF918:
	.string	"PGR_PGN_MASK"
.LASF757:
	.string	"UART1_GPIO_AF GPIO_AF_7"
.LASF591:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF478:
	.string	"__UWORD_TYPE unsigned long int"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF744:
	.string	"ACC_MPU6500_ALIGN CW270_DEG"
.LASF685:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF531:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF526:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF774:
	.string	"I2C2_SCL_GPIO GPIOA"
.LASF428:
	.string	"NULL ((void *)0)"
.LASF742:
	.string	"USE_ACC_SPI_MPU6500 "
.LASF360:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF625:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF718:
	.string	"HW_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF558:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF665:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF301:
	.string	"_ATFILE_SOURCE"
.LASF479:
	.string	"__SLONG32_TYPE int"
.LASF603:
	.string	"__need_timeval"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF500:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF260:
	.string	"__USE_ISOC11"
.LASF367:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF745:
	.string	"MAG "
.LASF605:
	.string	"__NFDBITS"
.LASF852:
	.string	"PG_SENSOR_TRIMS 9"
.LASF554:
	.string	"__lldiv_t_defined 1"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF611:
	.string	"NFDBITS __NFDBITS"
.LASF776:
	.string	"I2C2_SCL_PIN GPIO_Pin_9"
.LASF806:
	.string	"BIND_PIN Pin_3"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF434:
	.string	"WEXITED 4"
.LASF691:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF502:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF715:
	.string	"__IO volatile"
.LASF382:
	.string	"__stub_lchmod "
.LASF468:
	.string	"_BITS_TYPES_H 1"
.LASF659:
	.string	"UINT8_MAX (255)"
.LASF627:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF696:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF314:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF291:
	.string	"_POSIX_SOURCE"
.LASF802:
	.string	"GTUNE "
.LASF289:
	.string	"__USE_ISOC95 1"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF396:
	.string	"_T_SIZE_ "
.LASF925:
	.string	"address"
.LASF624:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF638:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF817:
	.string	"DEBUG16_VALUE_COUNT 4"
.LASF226:
	.string	"__k8__ 1"
.LASF16:
	.string	"_LP64 1"
.LASF746:
	.string	"USE_MAG_AK8963 "
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF315:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF443:
	.string	"P_PGID"
.LASF259:
	.string	"_FEATURES_H 1"
.LASF287:
	.string	"_DEFAULT_SOURCE 1"
.LASF930:
	.string	"callsign"
.LASF548:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF700:
	.string	"WINT_MIN (0u)"
.LASF562:
	.string	"__dev_t_defined "
.LASF575:
	.string	"__need_timer_t "
.LASF313:
	.string	"__LEAF , __leaf__"
.LASF648:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF347:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF534:
	.string	"le32toh(x) (x)"
.LASF506:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF844:
	.string	"PG_FAILSAFE_CONFIG 1"
.LASF719:
	.string	"LED0_GPIO GPIOB"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF292:
	.string	"_POSIX_SOURCE 1"
.LASF752:
	.string	"SERIAL_PORT_COUNT 2"
.LASF535:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF573:
	.string	"__need_clock_t "
.LASF940:
	.string	"pgResetTemplate_pilotConfig"
.LASF833:
	.string	"PG_REGISTER_WITH_RESET_FN(_type,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name })"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF379:
	.string	"__stub_fdetach "
.LASF290:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF279:
	.string	"__USE_ATFILE"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF845:
	.string	"PG_BOARD_ALIGNMENT 2"
.LASF229:
	.string	"__SSE__ 1"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF519:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF594:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF590:
	.string	"_SYS_SELECT_H 1"
.LASF413:
	.string	"_T_WCHAR_ "
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF822:
	.string	"PG_REGISTER_ATTRIBUTES __attribute__ ((section(\".pg_registry\"), used, aligned(4)))"
.LASF370:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF684:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF633:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF409:
	.string	"__need_size_t"
.LASF542:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF399:
	.string	"_SIZE_T_ "
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF572:
	.string	"__key_t_defined "
.LASF912:
	.string	"long long int"
.LASF880:
	.string	"PG_ADJUSTMENT_PROFILE 37"
.LASF438:
	.string	"__WALL 0x40000000"
.LASF410:
	.string	"__wchar_t__ "
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF429:
	.string	"__need_NULL"
.LASF218:
	.string	"__amd64__ 1"
.LASF717:
	.string	"HW_PIN Pin_2"
.LASF431:
	.string	"WNOHANG 1"
.LASF645:
	.string	"_STDINT_H 1"
.LASF846:
	.string	"PG_GIMBAL_CONFIG 3"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF889:
	.string	"PG_SPECIAL_COLOR_CONFIG 46"
.LASF328:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF352:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF600:
	.string	"__timespec_defined 1"
.LASF220:
	.string	"__x86_64__ 1"
.LASF415:
	.string	"__WCHAR_T "
.LASF894:
	.string	"PG_DRIVER_PWM_RX_CONFIG 100"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF602:
	.string	"_STRUCT_TIMEVAL 1"
.LASF868:
	.string	"PG_RC_CONTROLS_CONFIG 25"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF807:
	.string	"ALIENFLIGHT "
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF350:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF462:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF737:
	.string	"GYRO_MPU6050_ALIGN CW270_DEG"
.LASF312:
	.string	"__PMT"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF763:
	.string	"UART2_GPIO_AF GPIO_AF_7"
.LASF529:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF448:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF678:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF302:
	.string	"_ATFILE_SOURCE 1"
.LASF475:
	.string	"__SQUAD_TYPE long int"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF675:
	.string	"INT_FAST8_MIN (-128)"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF282:
	.string	"__USE_FORTIFY_LEVEL"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF225:
	.string	"__k8 1"
.LASF655:
	.string	"INT8_MAX (127)"
.LASF856:
	.string	"PG_SERIAL_CONFIG 13"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF451:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF904:
	.string	"unsigned int"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF849:
	.string	"PG_MOTOR_AND_SERVO_CONFIG 6"
.LASF383:
	.string	"__stub_putmsg "
.LASF585:
	.string	"__need_timespec"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF509:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF721:
	.string	"LED0_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF747:
	.string	"MAG_AK8963_ALIGN CW0_DEG_FLIP"
.LASF843:
	.string	"PG_RESET_TEMPLATE(_type,_name,...) const _type pgResetTemplate_ ## _name PG_RESETDATA_ATTRIBUTES = { __VA_ARGS__ }"
.LASF278:
	.string	"__USE_MISC"
.LASF275:
	.string	"__USE_LARGEFILE"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF254:
	.string	"_STDBOOL_H "
.LASF424:
	.string	"_WCHAR_T_DECLARED "
.LASF725:
	.string	"LED0_GPIO_2 GPIOB"
.LASF299:
	.string	"__USE_XOPEN2K 1"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF512:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF472:
	.string	"__U32_TYPE unsigned int"
.LASF344:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF860:
	.string	"PG_TRANSPONDER_CONFIG 17"
.LASF457:
	.string	"__LITTLE_ENDIAN 1234"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF812:
	.string	"TARGET_IO_PORTB 0xffff"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF641:
	.string	"alloca"
.LASF917:
	.string	"pgn_t"
.LASF364:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF381:
	.string	"__stub_gtty "
.LASF411:
	.string	"__WCHAR_T__ "
.LASF670:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF663:
	.string	"INT_LEAST8_MIN (-128)"
.LASF928:
	.string	"pgRegistry_s"
.LASF927:
	.string	"pgRegistry_t"
.LASF423:
	.string	"_GCC_WCHAR_T "
.LASF486:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF354:
	.string	"__wur "
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF787:
	.string	"MPU6500_CS_GPIO GPIOA"
.LASF634:
	.string	"__have_pthread_attr_t 1"
.LASF569:
	.string	"__id_t_defined "
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF702:
	.string	"INT8_C(c) c"
.LASF565:
	.string	"__nlink_t_defined "
.LASF227:
	.string	"__code_model_small__ 1"
.LASF307:
	.string	"__GNU_LIBRARY__ 6"
.LASF488:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF739:
	.string	"ACC "
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF793:
	.string	"ADC_AHB_PERIPHERAL RCC_AHBPeriph_DMA2"
.LASF497:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF445:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF316:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF369:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF735:
	.string	"USE_GYRO_MPU6500 "
.LASF444:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF321:
	.string	"__STRING(x) #x"
.LASF905:
	.string	"unsigned char"
.LASF766:
	.string	"UART3_TX_PIN GPIO_Pin_10"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF875:
	.string	"PG_FRSKY_TELEMETRY_CONFIG 32"
.LASF412:
	.string	"_WCHAR_T "
.LASF799:
	.string	"DEFAULT_RX_FEATURE FEATURE_RX_SERIAL"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF619:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF326:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF820:
	.string	"TIME_SECTION_END(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[1][index] = micros(); debug[index] = sectionTimes[1][index] - sectionTimes[0][index]; }"
.LASF831:
	.ascii	"PG_REGISTER_I(_type,_name,_pgn,_version,_reset) _type _name "
	.ascii	"## "
	.string	"_System; extern const pgRegistry_t _name ## _Registry; const pgRegistry_t _name ##_Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = sizeof(_type) | PGR_SIZE_SYSTEM_FLAG, .address = (uint8_t*)&_name ## _System, .ptr = 0, _reset, }"
.LASF231:
	.string	"__FXSR__ 1"
.LASF372:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF632:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF317:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF374:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF394:
	.string	"_SIZE_T "
.LASF420:
	.string	"_WCHAR_T_H "
.LASF649:
	.string	"__uint32_t_defined "
.LASF864:
	.string	"PG_SERVO_MIXER 21"
.LASF866:
	.string	"PG_PROFILE_SELECTION 23"
.LASF855:
	.string	"PG_CONTROL_RATE_PROFILES 12"
.LASF847:
	.string	"PG_MOTOR_MIXER 4"
.LASF716:
	.string	"HW_GPIO GPIOB"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF834:
	.string	"PG_REGISTER_WITH_RESET_TEMPLATE(_type,_name,_pgn,_version) extern const _type pgResetTemplate_ ## _name; PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.ptr = (void*)&pgResetTemplate_ ## _name})"
.LASF839:
	.ascii	"PG_REGISTER_PROFILE_I(_type,_name,_pgn,_version,_reset) STAT"
	.ascii	"IC_UNIT_TESTED _type _name ## _Storage[MAX_PROFILE_COUNT]; _"
	.ascii	"PG_PROFILE_CURRENT_DECL(_type, _name) extern const pgRegistr"
	.ascii	"y_t _nam"
	.string	"e ## _Registry; const pgRegistry_t _name ## _Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = sizeof(_type) | PGR_SIZE_PROFILE_FLAG, .address = (uint8_t*)&_name ## _Storage, .ptr = (uint8_t **)&_name ## _ProfileCurrent, _reset, }"
.LASF871:
	.string	"PG_COLOR_CONFIG 28"
.LASF341:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF536:
	.string	"htole64(x) (x)"
.LASF662:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF857:
	.string	"PG_PID_PROFILE 14"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF729:
	.string	"LED1_PIN_2 Pin_9"
.LASF906:
	.string	"short unsigned int"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF398:
	.string	"__SIZE_T "
.LASF456:
	.string	"_ENDIAN_H 1"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF733:
	.string	"GYRO "
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF516:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF262:
	.string	"__USE_ISOC95"
.LASF835:
	.ascii	"PG_REGISTER_ARR_I(_type,_size,_name,_pgn,_version,_reset) _t"
	.ascii	"ype _name ## _SystemArray[_size]; extern"
	.string	" const pgRegistry_t _name ##_Registry; const pgRegistry_t _name ## _Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = (sizeof(_type) * _size) | PGR_SIZE_SYSTEM_FLAG, .address = (uint8_t*)&_name ## _SystemArray, .ptr = 0, _reset, }"
.LASF693:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF261:
	.string	"__USE_ISOC99"
.LASF769:
	.string	"UART3_GPIO GPIOB"
.LASF331:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF731:
	.string	"USABLE_TIMER_CHANNEL_COUNT 11"
.LASF269:
	.string	"__USE_XOPEN_EXTENDED"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF355:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF324:
	.string	"__BEGIN_DECLS "
.LASF922:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF876:
	.string	"PG_HOTT_TELEMETRY_CONFIG 33"
.LASF580:
	.string	"__need_time_t"
.LASF674:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF741:
	.string	"USE_ACC_MPU6500 "
.LASF795:
	.string	"ADC0_GPIO_PIN GPIO_Pin_4"
.LASF435:
	.string	"WCONTINUED 8"
.LASF547:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF298:
	.string	"__USE_POSIX199506 1"
.LASF597:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF650:
	.string	"__intptr_t_defined "
.LASF521:
	.string	"__FD_SETSIZE 1024"
.LASF432:
	.string	"WUNTRACED 2"
.LASF779:
	.string	"I2C2_SDA_GPIO GPIOA"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF924:
	.string	"size"
.LASF819:
	.string	"TIME_SECTION_BEGIN(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[0][index] = micros(); }"
.LASF515:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF913:
	.string	"long long unsigned int"
.LASF455:
	.string	"__WCOREFLAG 0x80"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF730:
	.string	"LED1_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF263:
	.string	"__USE_ISOCXX11"
.LASF755:
	.string	"UART1_RX_PIN 2"
.LASF402:
	.string	"_SIZE_T_DEFINED "
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF570:
	.string	"__ssize_t_defined "
.LASF915:
	.string	"uint16_t"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF439:
	.string	"__WCLONE 0x80000000"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF618:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF583:
	.string	"__timer_t_defined 1"
.LASF294:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF805:
	.string	"BIND_PORT GPIOA"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF450:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF724:
	.string	"LED1_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF532:
	.string	"htole32(x) (x)"
.LASF442:
	.string	"P_PID"
.LASF267:
	.string	"__USE_POSIX199506"
.LASF458:
	.string	"__BIG_ENDIAN 4321"
.LASF775:
	.string	"I2C2_SCL_GPIO_AF GPIO_AF_4"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF709:
	.string	"UINT64_C(c) c ## UL"
.LASF796:
	.string	"ADC0_CHANNEL ADC_Channel_1"
.LASF430:
	.string	"_STDLIB_H 1"
.LASF726:
	.string	"LED0_PIN_2 Pin_8"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF365:
	.string	"__WORDSIZE 64"
.LASF613:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF419:
	.string	"_WCHAR_T_DEFINED "
.LASF461:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF823:
	.string	"PG_RESETDATA_ATTRIBUTES __attribute__ ((section(\".pg_resetdata\"), used, aligned(2)))"
.LASF736:
	.string	"USE_GYRO_SPI_MPU6500 "
.LASF388:
	.string	"__stub_stty "
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF335:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF567:
	.string	"__off_t_defined "
.LASF932:
	.string	"U_ID_0"
.LASF933:
	.string	"U_ID_1"
.LASF934:
	.string	"U_ID_2"
.LASF400:
	.string	"_BSD_SIZE_T_ "
.LASF333:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF416:
	.string	"_WCHAR_T_ "
.LASF414:
	.string	"_T_WCHAR "
.LASF329:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF471:
	.string	"__S32_TYPE int"
.LASF550:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF422:
	.string	"__INT_WCHAR_T_H "
.LASF699:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF713:
	.string	"_STRING_H 1"
.LASF734:
	.string	"USE_GYRO_MPU6050 "
.LASF646:
	.string	"_BITS_WCHAR_H 1"
.LASF241:
	.string	"__ELF__ 1"
.LASF888:
	.string	"PG_MODE_COLOR_CONFIG 45"
.LASF615:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF304:
	.string	"__USE_ATFILE 1"
.LASF791:
	.string	"ADC_INSTANCE ADC2"
.LASF881:
	.string	"PG_BAROMETER_CONFIG 38"
.LASF711:
	.string	"UINTMAX_C(c) c ## UL"
.LASF387:
	.string	"__stub_sstk "
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF777:
	.string	"I2C2_SCL_PIN_SOURCE GPIO_PinSource9"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF653:
	.string	"INT32_MIN (-2147483647-1)"
.LASF788:
	.string	"MPU6500_CS_PIN GPIO_Pin_15"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF872:
	.string	"PG_AIRPLANE_ALT_HOLD_CONFIG 29"
.LASF771:
	.string	"UART3_RX_PINSOURCE GPIO_PinSource11"
.LASF781:
	.string	"I2C2_SDA_PIN GPIO_Pin_10"
.LASF376:
	.string	"__stub_chflags "
.LASF606:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF407:
	.string	"_SIZET_ "
.LASF942:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF514:
	.string	"__TIMER_T_TYPE void *"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF801:
	.string	"SERIAL_RX "
.LASF566:
	.string	"__uid_t_defined "
.LASF617:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF863:
	.string	"PG_MIXER_CONFIG 20"
.LASF465:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF230:
	.string	"__SSE2__ 1"
.LASF578:
	.string	"__need_clock_t"
.LASF441:
	.string	"P_ALL"
.LASF508:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF926:
	.string	"reset"
.LASF885:
	.string	"PG_SERVO_PROFILE 42"
.LASF358:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF671:
	.string	"UINT_LEAST8_MAX (255)"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF851:
	.string	"PG_SENSOR_ALIGNMENT_CONFIG 8"
.LASF351:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF453:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF873:
	.string	"PG_GPS_CONFIG 30"
.LASF683:
	.string	"UINT_FAST8_MAX (255)"
.LASF943:
	.string	"src/main/common/pilot.c"
.LASF325:
	.string	"__END_DECLS "
.LASF436:
	.string	"WNOWAIT 0x01000000"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF544:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF330:
	.string	"__END_NAMESPACE_C99 "
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF908:
	.string	"short int"
.LASF311:
	.string	"_SYS_CDEFS_H 1"
.LASF546:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF361:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF858:
	.string	"PG_GTUNE_CONFIG 15"
.LASF621:
	.string	"__blkcnt_t_defined "
.LASF576:
	.string	"__need_clockid_t "
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF929:
	.string	"pilotConfig_s"
.LASF620:
	.string	"__blksize_t_defined "
.LASF608:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF765:
	.string	"UART2_RX_PINSOURCE GPIO_PinSource3"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF720:
	.string	"LED0_PIN Pin_4"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF628:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF764:
	.string	"UART2_TX_PINSOURCE GPIO_PinSource2"
.LASF476:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF559:
	.string	"_SYS_TYPES_H 1"
.LASF340:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF493:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF377:
	.string	"__stub_fattach "
.LASF936:
	.string	"__pg_registry_end"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF343:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF477:
	.string	"__SWORD_TYPE long int"
.LASF346:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF892:
	.string	"PG_VOLTAGE_METER_CONFIG 49"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF349:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF666:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF490:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF295:
	.string	"__USE_POSIX 1"
.LASF692:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF689:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF482:
	.string	"__U64_TYPE unsigned long int"
.LASF440:
	.string	"__ENUM_IDTYPE_T 1"
.LASF838:
	.string	"_PG_PROFILE_CURRENT_DECL(_type,_name) _type *_name ## _ProfileCurrent;"
.LASF727:
	.string	"LED0_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF636:
	.string	"__PTHREAD_SPINS 0, 0"
.LASF804:
	.string	"USE_CLI "
.LASF257:
	.string	"false 0"
.LASF469:
	.string	"__S16_TYPE short int"
.LASF780:
	.string	"I2C2_SDA_GPIO_AF GPIO_AF_4"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF579:
	.string	"__time_t_defined 1"
.LASF698:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF0:
	.string	"__STDC__ 1"
.LASF631:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF356:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF797:
	.string	"ADC_CHANNEL_COUNT 1"
.LASF421:
	.string	"___int_wchar_t_h "
.LASF751:
	.string	"USE_VCP "
.LASF785:
	.string	"USE_SPI_DEVICE_3 "
.LASF464:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF723:
	.string	"LED1_PIN Pin_5"
.LASF371:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF756:
	.string	"UART1_GPIO GPIOB"
.LASF498:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF228:
	.string	"__MMX__ 1"
.LASF654:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF886:
	.string	"PG_FAILSAFE_CHANNEL_CONFIG 43"
.LASF553:
	.string	"__ldiv_t_defined 1"
.LASF286:
	.string	"_DEFAULT_SOURCE"
.LASF406:
	.string	"_GCC_SIZE_T "
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF587:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF425:
	.string	"_BSD_WCHAR_T_"
.LASF669:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF460:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF916:
	.string	"uint32_t"
.LASF790:
	.string	"USE_ADC "
.LASF487:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF664:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF761:
	.string	"UART2_RX_PIN GPIO_Pin_3"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF676:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF332:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF466:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF217:
	.string	"__amd64 1"
.LASF533:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF296:
	.string	"__USE_POSIX2 1"
.LASF239:
	.string	"__unix__ 1"
.LASF499:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF452:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF622:
	.string	"__fsblkcnt_t_defined "
.LASF656:
	.string	"INT16_MAX (32767)"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF865:
	.string	"PG_IMU_CONFIG 22"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF491:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF893:
	.string	"PG_AMPERAGE_METER_CONFIG 50"
.LASF564:
	.string	"__mode_t_defined "
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF492:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF323:
	.string	"__long_double_t long double"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF643:
	.string	"__COMPAR_FN_T "
.LASF240:
	.string	"unix 1"
.LASF704:
	.string	"INT32_C(c) c"
.LASF803:
	.string	"USE_QUAD_MIXER_ONLY "
.LASF706:
	.string	"UINT8_C(c) c"
.LASF680:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF236:
	.string	"__linux__ 1"
.LASF305:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF481:
	.string	"__S64_TYPE long int"
.LASF303:
	.string	"__USE_MISC 1"
.LASF258:
	.string	"__bool_true_false_are_defined 1"
.LASF923:
	.string	"pgResetFunc"
.LASF517:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF748:
	.string	"LED0 "
.LASF647:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF327:
	.string	"__END_NAMESPACE_STD "
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF447:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF867:
	.string	"PG_RX_CONFIG 24"
.LASF848:
	.string	"PG_BLACKBOX_CONFIG 5"
.LASF281:
	.string	"__USE_REENTRANT"
.LASF811:
	.string	"TARGET_IO_PORTA 0xffff"
.LASF563:
	.string	"__gid_t_defined "
.LASF895:
	.string	"PG_DRIVER_FLASHCHIP_CONFIG 101"
.LASF336:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF556:
	.string	"EXIT_FAILURE 1"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF494:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF639:
	.string	"__malloc_and_calloc_defined "
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF827:
	.string	"PG_RESET_CURRENT(_name) do { extern const pgRegistry_t _name ##_Registry; pgResetCurrent(&_name ## _Registry); } while(0)"
.LASF770:
	.string	"UART3_TX_PINSOURCE GPIO_PinSource10"
.LASF276:
	.string	"__USE_LARGEFILE64"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF549:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF705:
	.string	"INT64_C(c) c ## L"
.LASF877:
	.string	"PG_NAVIGATION_CONFIG 34"
.LASF884:
	.string	"PG_MODE_ACTIVATION_PROFILE 41"
.LASF749:
	.string	"LED1 "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF523:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF235:
	.string	"__linux 1"
.LASF418:
	.string	"_WCHAR_T_DEFINED_ "
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF859:
	.string	"PG_ARMING_CONFIG 16"
.LASF941:
	.string	"pilotConfig_Registry"
.LASF612:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF754:
	.string	"UART1_TX_PIN 1"
.LASF898:
	.string	"PG_OSD_ELEMENT_CONFIG 32770"
.LASF642:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF830:
	.string	"PG_DECLARE_PROFILE(_type,_name) extern _type *_name ## _ProfileCurrent; static inline _type* _name(void) { return _name ## _ProfileCurrent; } struct _dummy"
.LASF545:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF694:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF630:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF293:
	.string	"_POSIX_C_SOURCE"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF825:
	.string	"PG_FOREACH(_name) for (const pgRegistry_t *(_name) = __pg_registry_start; (_name) < __pg_registry_end; _name++)"
.LASF879:
	.string	"PG_RATE_PROFILE_SELECTION 36"
.LASF710:
	.string	"INTMAX_C(c) c ## L"
.LASF903:
	.string	"long unsigned int"
.LASF829:
	.ascii	"PG"
	.string	"_DECLARE_ARR(_type,_size,_name) extern _type _name ## _SystemArray[_size]; static inline _type* _name(int _index) { return &_name ## _SystemArray[_index]; } static inline _type (* _name ## _arr(void))[_size] { return &_name ## _SystemArray; } struct _dummy"
.LASF363:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF762:
	.string	"UART2_GPIO GPIOA"
.LASF939:
	.string	"pilotConfig_System"
.LASF837:
	.string	"PG_REGISTER_ARR_WITH_RESET_FN(_type,_size,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_ARR_I(_type, _size, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name})"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
