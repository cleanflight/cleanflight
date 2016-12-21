	.file	"version.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed version.i -mtune=generic -march=x86-64 -g
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
	.globl	targetName
	.section	.rodata
.LC0:
	.string	"EDISON"
	.section	.rodata.targetName,"a",@progbits
	.align 8
	.type	targetName, @object
	.size	targetName, 8
targetName:
	.quad	.LC0
	.globl	shortGitRevision
	.section	.rodata
.LC1:
	.string	"096dbf6"
	.section	.rodata.shortGitRevision,"a",@progbits
	.align 8
	.type	shortGitRevision, @object
	.size	shortGitRevision, 8
shortGitRevision:
	.quad	.LC1
	.globl	buildDate
	.section	.rodata
.LC2:
	.string	"Dec 21 2016"
	.section	.rodata.buildDate,"a",@progbits
	.align 8
	.type	buildDate, @object
	.size	buildDate, 8
buildDate:
	.quad	.LC2
	.globl	buildTime
	.section	.rodata
.LC3:
	.string	"15:42:19"
	.section	.rodata.buildTime,"a",@progbits
	.align 8
	.type	buildTime, @object
	.size	buildTime, 8
buildTime:
	.quad	.LC3
	.text
.Letext0:
	.file 1 "src/main/build/version.c"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x85
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF4
	.byte	0xc
	.long	.LASF5
	.long	.LASF6
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x1
	.byte	0x14
	.long	0x44
	.uleb128 0x9
	.byte	0x3
	.quad	targetName
	.uleb128 0x3
	.byte	0x8
	.long	0x3f
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x5
	.long	0x38
	.uleb128 0x5
	.long	0x32
	.uleb128 0x2
	.long	.LASF1
	.byte	0x1
	.byte	0x15
	.long	0x44
	.uleb128 0x9
	.byte	0x3
	.quad	shortGitRevision
	.uleb128 0x2
	.long	.LASF2
	.byte	0x1
	.byte	0x16
	.long	0x44
	.uleb128 0x9
	.byte	0x3
	.quad	buildDate
	.uleb128 0x2
	.long	.LASF3
	.byte	0x1
	.byte	0x17
	.long	0x44
	.uleb128 0x9
	.byte	0x3
	.quad	buildTime
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
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
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
.LASF2:
	.string	"buildDate"
.LASF0:
	.string	"targetName"
.LASF1:
	.string	"shortGitRevision"
.LASF5:
	.string	"src/main/build/version.c"
.LASF3:
	.string	"buildTime"
.LASF4:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF7:
	.string	"char"
.LASF6:
	.string	"/home/aravind/git/cleanflight"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
