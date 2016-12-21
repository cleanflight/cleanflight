	.file	"profile.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed profile.i -mtune=generic -march=x86-64 -g
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
	.comm	profileSelection_System,1,1
	.section	.text.profileSelection,"ax",@progbits
	.type	profileSelection, @function
profileSelection:
.LFB4:
	.file 1 "./src/main/config/profile.h"
	.loc 1 26 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 26 0
	movl	$profileSelection_System, %eax	#, D.1957
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	profileSelection, .-profileSelection
	.globl	profileSelection_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	profileSelection_Registry, @object
	.size	profileSelection_Registry, 32
profileSelection_Registry:
# pgn:
	.value	23
# size:
	.value	1
# address:
	.zero	4
	.quad	profileSelection_System
# ptr:
	.quad	0
# reset:
# ptr:
	.quad	0
	.section	.text.getCurrentProfile,"ax",@progbits
	.globl	getCurrentProfile
	.type	getCurrentProfile, @function
getCurrentProfile:
.LFB5:
	.file 2 "src/main/config/profile.c"
	.loc 2 33 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 34 0
	call	profileSelection	#
	movzbl	(%rax), %eax	# _3->current_profile_index, D.1959
	.loc 2 35 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	getCurrentProfile, .-getCurrentProfile
	.section	.text.setProfile,"ax",@progbits
	.globl	setProfile
	.type	setProfile, @function
setProfile:
.LFB6:
	.loc 2 38 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$8, %rsp	#,
	movl	%edi, %eax	# profileIndex, tmp88
	movb	%al, -4(%rbp)	# tmp88, profileIndex
	.loc 2 39 0
	cmpb	$2, -4(%rbp)	#, profileIndex
	jbe	.L6	#,
	.loc 2 40 0
	movb	$0, -4(%rbp)	#, profileIndex
.L6:
	.loc 2 42 0
	call	profileSelection	#
	movq	%rax, %rdx	#, D.1960
	movzbl	-4(%rbp), %eax	# profileIndex, tmp89
	movb	%al, (%rdx)	# tmp89, _6->current_profile_index
	.loc 2 43 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	setProfile, .-setProfile
	.text
.Letext0:
	.file 3 "/usr/include/stdint.h"
	.file 4 "./src/main/config/parameter_group.h"
	.file 5 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2b2
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF34
	.byte	0xc
	.long	.LASF35
	.long	.LASF36
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
	.byte	0x1
	.byte	0x1
	.byte	0x16
	.long	0x176
	.uleb128 0x10
	.long	.LASF23
	.byte	0x1
	.byte	0x17
	.long	0x45
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x1
	.byte	0x18
	.long	0x15d
	.uleb128 0x11
	.long	.LASF37
	.byte	0x1
	.byte	0x1a
	.long	0x19e
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.byte	0x8
	.long	0x176
	.uleb128 0x12
	.long	.LASF38
	.byte	0x2
	.byte	0x20
	.long	0x45
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.long	.LASF39
	.byte	0x2
	.byte	0x25
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ed
	.uleb128 0x14
	.long	.LASF40
	.byte	0x2
	.byte	0x25
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.long	.LASF25
	.byte	0x5
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x15
	.long	.LASF26
	.byte	0x5
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x15
	.long	.LASF27
	.byte	0x5
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x15
	.long	.LASF28
	.byte	0x4
	.byte	0x43
	.long	0x241
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xd
	.byte	0x8
	.long	0x152
	.uleb128 0x15
	.long	.LASF29
	.byte	0x4
	.byte	0x44
	.long	0x241
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x15
	.long	.LASF30
	.byte	0x4
	.byte	0x47
	.long	0x146
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x15
	.long	.LASF31
	.byte	0x4
	.byte	0x48
	.long	0x146
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x15
	.long	.LASF32
	.byte	0x2
	.byte	0x1e
	.long	0x176
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_System
	.uleb128 0x15
	.long	.LASF33
	.byte	0x2
	.byte	0x1e
	.long	0x2b0
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_Registry
	.uleb128 0x16
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
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.quad	.LFB6
	.quad	.LFE6-.LFB6
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF33:
	.string	"profileSelection_Registry"
.LASF19:
	.string	"reset"
.LASF31:
	.string	"__pg_resetdata_end"
.LASF23:
	.string	"current_profile_index"
.LASF28:
	.string	"__pg_registry_start"
.LASF32:
	.string	"profileSelection_System"
.LASF29:
	.string	"__pg_registry_end"
.LASF10:
	.string	"pgn_t"
.LASF15:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF25:
	.string	"U_ID_0"
.LASF35:
	.string	"src/main/config/profile.c"
.LASF26:
	.string	"U_ID_1"
.LASF3:
	.string	"unsigned char"
.LASF9:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF13:
	.string	"PGR_SIZE_MASK"
.LASF34:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF36:
	.string	"/home/aravind/git/cleanflight"
.LASF27:
	.string	"U_ID_2"
.LASF14:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF21:
	.string	"pgRegistry_s"
.LASF11:
	.string	"PGR_PGN_MASK"
.LASF20:
	.string	"pgRegistry_t"
.LASF24:
	.string	"profileSelection_t"
.LASF8:
	.string	"unsigned int"
.LASF18:
	.string	"address"
.LASF4:
	.string	"uint8_t"
.LASF39:
	.string	"setProfile"
.LASF12:
	.string	"PGR_PGN_VERSION_MASK"
.LASF37:
	.string	"profileSelection"
.LASF16:
	.string	"pgResetFunc"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF22:
	.string	"profileSelection_s"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF30:
	.string	"__pg_resetdata_start"
.LASF0:
	.string	"signed char"
.LASF17:
	.string	"size"
.LASF38:
	.string	"getCurrentProfile"
.LASF40:
	.string	"profileIndex"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
