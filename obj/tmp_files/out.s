	.file	"boot.c"
# GNU C (Ubuntu 4.8.4-2ubuntu1~14.04.3) version 4.8.4 (x86_64-linux-gnu)
#	compiled by GNU C version 4.8.4, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed obj/out.i -mtune=generic -march=x86-64
# -ggdb3 -g -Wall -Wpedantic -Wextra -Wunsafe-loop-optimizations
# -Wdouble-promotion -Wundef -std=gnu99 -ffunction-sections -fdata-sections
# -fverbose-asm -ffat-lto-objects -fstack-protector -Wformat-security
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg -fcommon
# -fdata-sections -fdelete-null-pointer-checks -fdwarf2-cfi-asm
# -fearly-inlining -feliminate-unused-debug-types -ffunction-cse
# -ffunction-sections -fgcse-lm -fgnu-runtime -fgnu-unique -fident
# -finline-atomics -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -fmath-errno -fmerge-debug-strings
# -fmove-loop-invariants -fpeephole -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fshow-column
# -fsigned-zeros -fsplit-ivs-in-unroller -fstack-protector
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
# -ftree-coalesce-vars -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-slp-vectorize -ftree-vect-loop-version
# -funit-at-a-time -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -maccumulate-outgoing-args
# -malign-stringops -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc
# -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse
# -msse2 -mtls-direct-seg-refs

	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"Hello World"
	.section	.text.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "./src/main/fc/boot.c"
	.loc 1 770 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 771 0
	movl	$.LC0, %edi	#,
	call	puts	#
	movl	$0, %eax	#, D.2884
	.loc 1 780 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9c
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF851
	.byte	0x1
	.long	.LASF852
	.long	.LASF853
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF840
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF841
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF842
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF843
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF844
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF845
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF846
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF847
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF848
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF849
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF850
	.uleb128 0x4
	.long	.LASF854
	.byte	0x1
	.value	0x302
	.long	0x3b
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1
	.long	.LASF237
	.byte	0x5
	.uleb128 0x2
	.long	.LASF238
	.byte	0x5
	.uleb128 0x3
	.long	.LASF239
	.byte	0x5
	.uleb128 0x4
	.long	.LASF240
	.byte	0x5
	.uleb128 0x5
	.long	.LASF241
	.byte	0x5
	.uleb128 0x6
	.long	.LASF242
	.file 2 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdbool.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdint.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x4
	.file 5 "/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x17
	.long	.LASF253
	.file 6 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro3
	.file 7 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x176
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro4
	.file 8 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x181
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.file 9 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x18e
	.uleb128 0x9
	.file 10 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 11 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF459
	.byte	0x4
	.file 12 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro10
	.file 13 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF501
	.file 14 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 15 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro13
	.file 16 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro14
	.file 17 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x11
	.byte	0x5
	.uleb128 0x7
	.long	.LASF531
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro15
	.file 18 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x12
	.byte	0x5
	.uleb128 0x18
	.long	.LASF538
	.file 19 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x18
	.long	.LASF539
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.file 20 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF592
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF593
	.file 21 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x19
	.long	.LASF594
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
	.file 22 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro22
	.file 23 "/usr/include/time.h"
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF460
	.byte	0x3
	.uleb128 0x92
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.file 24 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xdb
	.uleb128 0x18
	.byte	0x5
	.uleb128 0x16
	.long	.LASF659
	.file 25 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x19
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 26 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF670
	.file 27 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.file 28 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0xde
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.file 29 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0x10e
	.uleb128 0x1d
	.byte	0x5
	.uleb128 0x13
	.long	.LASF693
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x8
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
	.file 30 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x1ec
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x5
	.uleb128 0x2e5
	.long	.LASF711
	.file 31 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3bb
	.uleb128 0x1f
	.byte	0x4
	.byte	0x6
	.uleb128 0x3c6
	.long	.LASF712
	.byte	0x4
	.file 32 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.file 33 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0xa3
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x15
	.long	.LASF714
	.byte	0x4
	.byte	0x4
	.file 34 "/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x3
	.uleb128 0x21
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro40
	.file 35 "/usr/include/libio.h"
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF723
	.file 36 "/usr/include/_G_config.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x24
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x3
	.uleb128 0xf
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x5
	.uleb128 0x10
	.long	.LASF725
	.file 37 "/usr/include/wchar.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x25
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro44
	.file 38 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x26
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro47
	.file 39 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0xa4
	.uleb128 0x27
	.byte	0x7
	.long	.Ldebug_macro48
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro49
	.file 40 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.byte	0x3
	.uleb128 0x355
	.uleb128 0x28
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdcpredef.h.19.13d357f53e03e35e37f3aa674f978c59,comdat
.Ldebug_macro1:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF243
	.byte	0x5
	.uleb128 0x29
	.long	.LASF244
	.byte	0x5
	.uleb128 0x31
	.long	.LASF245
	.byte	0x5
	.uleb128 0x36
	.long	.LASF246
	.byte	0x5
	.uleb128 0x39
	.long	.LASF247
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.1c9ee6859ce8145f7838a4f2549ccec2,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF248
	.byte	0x5
	.uleb128 0x21
	.long	.LASF249
	.byte	0x5
	.uleb128 0x22
	.long	.LASF250
	.byte	0x5
	.uleb128 0x23
	.long	.LASF251
	.byte	0x5
	.uleb128 0x30
	.long	.LASF252
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.64bab0ddcd04de3a12039e79100a154c,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF254
	.byte	0x6
	.uleb128 0x65
	.long	.LASF255
	.byte	0x6
	.uleb128 0x66
	.long	.LASF256
	.byte	0x6
	.uleb128 0x67
	.long	.LASF257
	.byte	0x6
	.uleb128 0x68
	.long	.LASF258
	.byte	0x6
	.uleb128 0x69
	.long	.LASF259
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF260
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF261
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF262
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF263
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF264
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF265
	.byte	0x6
	.uleb128 0x70
	.long	.LASF266
	.byte	0x6
	.uleb128 0x71
	.long	.LASF267
	.byte	0x6
	.uleb128 0x72
	.long	.LASF268
	.byte	0x6
	.uleb128 0x73
	.long	.LASF269
	.byte	0x6
	.uleb128 0x74
	.long	.LASF270
	.byte	0x6
	.uleb128 0x75
	.long	.LASF271
	.byte	0x6
	.uleb128 0x76
	.long	.LASF272
	.byte	0x6
	.uleb128 0x77
	.long	.LASF273
	.byte	0x6
	.uleb128 0x78
	.long	.LASF274
	.byte	0x6
	.uleb128 0x79
	.long	.LASF275
	.byte	0x6
	.uleb128 0x7a
	.long	.LASF276
	.byte	0x6
	.uleb128 0x7b
	.long	.LASF277
	.byte	0x6
	.uleb128 0x7c
	.long	.LASF278
	.byte	0x6
	.uleb128 0x7d
	.long	.LASF279
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF280
	.byte	0x5
	.uleb128 0x83
	.long	.LASF281
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF282
	.byte	0x6
	.uleb128 0xb9
	.long	.LASF283
	.byte	0x5
	.uleb128 0xba
	.long	.LASF284
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF285
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF286
	.byte	0x6
	.uleb128 0xbd
	.long	.LASF287
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF288
	.byte	0x5
	.uleb128 0xca
	.long	.LASF289
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF290
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF291
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF292
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF293
	.byte	0x6
	.uleb128 0xe5
	.long	.LASF294
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF295
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF296
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF297
	.byte	0x5
	.uleb128 0x100
	.long	.LASF298
	.byte	0x5
	.uleb128 0x104
	.long	.LASF299
	.byte	0x5
	.uleb128 0x108
	.long	.LASF300
	.byte	0x6
	.uleb128 0x109
	.long	.LASF257
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF290
	.byte	0x6
	.uleb128 0x10b
	.long	.LASF256
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF289
	.byte	0x5
	.uleb128 0x110
	.long	.LASF301
	.byte	0x6
	.uleb128 0x111
	.long	.LASF302
	.byte	0x5
	.uleb128 0x112
	.long	.LASF303
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF304
	.byte	0x5
	.uleb128 0x140
	.long	.LASF305
	.byte	0x5
	.uleb128 0x144
	.long	.LASF306
	.byte	0x5
	.uleb128 0x148
	.long	.LASF307
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF308
	.byte	0x6
	.uleb128 0x168
	.long	.LASF309
	.byte	0x5
	.uleb128 0x169
	.long	.LASF310
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF311
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF312
	.byte	0x5
	.uleb128 0x170
	.long	.LASF313
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.deed8300036fdf53f6654237d4653cad,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF314
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF315
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF316
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF317
	.byte	0x5
	.uleb128 0x37
	.long	.LASF318
	.byte	0x5
	.uleb128 0x38
	.long	.LASF319
	.byte	0x5
	.uleb128 0x39
	.long	.LASF320
	.byte	0x5
	.uleb128 0x52
	.long	.LASF321
	.byte	0x5
	.uleb128 0x53
	.long	.LASF322
	.byte	0x5
	.uleb128 0x58
	.long	.LASF323
	.byte	0x5
	.uleb128 0x59
	.long	.LASF324
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF325
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF326
	.byte	0x5
	.uleb128 0x65
	.long	.LASF327
	.byte	0x5
	.uleb128 0x66
	.long	.LASF328
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF329
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF330
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF331
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF332
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF333
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF334
	.byte	0x5
	.uleb128 0x84
	.long	.LASF335
	.byte	0x5
	.uleb128 0x85
	.long	.LASF336
	.byte	0x5
	.uleb128 0x86
	.long	.LASF337
	.byte	0x5
	.uleb128 0x89
	.long	.LASF338
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF339
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF340
	.byte	0x5
	.uleb128 0x97
	.long	.LASF341
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF342
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF343
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF344
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF345
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF346
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF347
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF348
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF349
	.byte	0x5
	.uleb128 0xed
	.long	.LASF350
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF351
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF352
	.byte	0x5
	.uleb128 0xff
	.long	.LASF353
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF354
	.byte	0x5
	.uleb128 0x115
	.long	.LASF355
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF356
	.byte	0x5
	.uleb128 0x126
	.long	.LASF357
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF358
	.byte	0x5
	.uleb128 0x134
	.long	.LASF359
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF360
	.byte	0x5
	.uleb128 0x147
	.long	.LASF361
	.byte	0x5
	.uleb128 0x148
	.long	.LASF362
	.byte	0x5
	.uleb128 0x156
	.long	.LASF363
	.byte	0x5
	.uleb128 0x157
	.long	.LASF364
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF365
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF366
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF367
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF368
	.byte	0x5
	.uleb128 0xa
	.long	.LASF369
	.byte	0x5
	.uleb128 0xc
	.long	.LASF370
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.407.c122ddb2157a4c1fbd957332b50319ec,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x197
	.long	.LASF371
	.byte	0x5
	.uleb128 0x198
	.long	.LASF372
	.byte	0x5
	.uleb128 0x199
	.long	.LASF373
	.byte	0x5
	.uleb128 0x19a
	.long	.LASF374
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF375
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF376
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF377
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.6fb4b470a4f113ab27ac07383b62200b,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF378
	.byte	0x5
	.uleb128 0xb
	.long	.LASF379
	.byte	0x5
	.uleb128 0xc
	.long	.LASF380
	.byte	0x5
	.uleb128 0xd
	.long	.LASF381
	.byte	0x5
	.uleb128 0xe
	.long	.LASF382
	.byte	0x5
	.uleb128 0xf
	.long	.LASF383
	.byte	0x5
	.uleb128 0x10
	.long	.LASF384
	.byte	0x5
	.uleb128 0x11
	.long	.LASF385
	.byte	0x5
	.uleb128 0x12
	.long	.LASF386
	.byte	0x5
	.uleb128 0x13
	.long	.LASF387
	.byte	0x5
	.uleb128 0x14
	.long	.LASF388
	.byte	0x5
	.uleb128 0x15
	.long	.LASF389
	.byte	0x5
	.uleb128 0x16
	.long	.LASF390
	.byte	0x5
	.uleb128 0x17
	.long	.LASF391
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF392
	.byte	0x5
	.uleb128 0x22
	.long	.LASF393
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF394
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.a6cb9043c41c38d1acb1062f4cd2a934,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF395
	.byte	0x5
	.uleb128 0x34
	.long	.LASF396
	.byte	0x5
	.uleb128 0x78
	.long	.LASF397
	.byte	0x5
	.uleb128 0x91
	.long	.LASF102
	.byte	0x5
	.uleb128 0x92
	.long	.LASF110
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF398
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF399
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF400
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF401
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF402
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF403
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF404
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF405
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF406
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF407
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF408
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF409
	.byte	0x5
	.uleb128 0xad
	.long	.LASF410
	.byte	0x5
	.uleb128 0xae
	.long	.LASF411
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF412
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF413
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF414
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF415
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF416
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF417
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF418
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF419
	.byte	0x5
	.uleb128 0xba
	.long	.LASF420
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF421
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF422
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF423
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF424
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF425
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF426
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF427
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF428
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF429
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF430
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF431
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF432
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF433
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF434
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF435
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF436
	.byte	0x5
	.uleb128 0xec
	.long	.LASF437
	.byte	0x5
	.uleb128 0xee
	.long	.LASF438
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF439
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF440
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF441
	.byte	0x5
	.uleb128 0x100
	.long	.LASF442
	.byte	0x5
	.uleb128 0x101
	.long	.LASF443
	.byte	0x5
	.uleb128 0x105
	.long	.LASF444
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF445
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF446
	.byte	0x5
	.uleb128 0x112
	.long	.LASF447
	.byte	0x5
	.uleb128 0x113
	.long	.LASF448
	.byte	0x5
	.uleb128 0x116
	.long	.LASF449
	.byte	0x5
	.uleb128 0x117
	.long	.LASF450
	.byte	0x5
	.uleb128 0x118
	.long	.LASF451
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF452
	.byte	0x5
	.uleb128 0x120
	.long	.LASF453
	.byte	0x5
	.uleb128 0x121
	.long	.LASF454
	.byte	0x5
	.uleb128 0x122
	.long	.LASF455
	.byte	0x5
	.uleb128 0x124
	.long	.LASF456
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF457
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF458
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.27.59e2586c75bdbcb991b248ad7257b993,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF460
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF461
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF462
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.184.aa65fb7281d578229bbad41b91862635,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF463
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF464
	.byte	0x5
	.uleb128 0xba
	.long	.LASF465
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF466
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF467
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF468
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF469
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF470
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF471
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF472
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF473
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF474
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF475
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF476
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF477
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF478
	.byte	0x5
	.uleb128 0xce
	.long	.LASF479
	.byte	0x6
	.uleb128 0xea
	.long	.LASF480
	.byte	0x5
	.uleb128 0x107
	.long	.LASF481
	.byte	0x5
	.uleb128 0x108
	.long	.LASF482
	.byte	0x5
	.uleb128 0x109
	.long	.LASF483
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF484
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF485
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF486
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF487
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF488
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF489
	.byte	0x5
	.uleb128 0x110
	.long	.LASF490
	.byte	0x5
	.uleb128 0x111
	.long	.LASF491
	.byte	0x5
	.uleb128 0x112
	.long	.LASF492
	.byte	0x5
	.uleb128 0x113
	.long	.LASF493
	.byte	0x5
	.uleb128 0x114
	.long	.LASF494
	.byte	0x5
	.uleb128 0x115
	.long	.LASF495
	.byte	0x6
	.uleb128 0x122
	.long	.LASF496
	.byte	0x6
	.uleb128 0x157
	.long	.LASF497
	.byte	0x6
	.uleb128 0x18d
	.long	.LASF498
	.byte	0x5
	.uleb128 0x192
	.long	.LASF499
	.byte	0x6
	.uleb128 0x198
	.long	.LASF500
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.e401b8bcfee800b540b27abd7cc78de9,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF502
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF503
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF504
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF505
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF506
	.byte	0x5
	.uleb128 0x20
	.long	.LASF507
	.byte	0x5
	.uleb128 0x22
	.long	.LASF508
	.byte	0x5
	.uleb128 0x24
	.long	.LASF509
	.byte	0x5
	.uleb128 0x25
	.long	.LASF510
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF511
	.byte	0x6
	.uleb128 0x2e
	.long	.LASF512
	.byte	0x6
	.uleb128 0x2f
	.long	.LASF513
	.byte	0x6
	.uleb128 0x30
	.long	.LASF514
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF515
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF516
	.byte	0x5
	.uleb128 0x22
	.long	.LASF517
	.byte	0x5
	.uleb128 0x25
	.long	.LASF518
	.byte	0x5
	.uleb128 0x28
	.long	.LASF519
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF520
	.byte	0x5
	.uleb128 0x31
	.long	.LASF521
	.byte	0x5
	.uleb128 0x35
	.long	.LASF522
	.byte	0x5
	.uleb128 0x38
	.long	.LASF523
	.byte	0x5
	.uleb128 0x39
	.long	.LASF524
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF525
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF526
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.19.ff00c9c0f5e9f9a9719c5de76ace57b4,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF527
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF528
	.byte	0x5
	.uleb128 0x20
	.long	.LASF529
	.byte	0x5
	.uleb128 0x21
	.long	.LASF530
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.41.24cced64aef71195a51d4daa8e4f4a95,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF532
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF533
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF534
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF535
	.byte	0x5
	.uleb128 0x30
	.long	.LASF536
	.byte	0x5
	.uleb128 0x34
	.long	.LASF537
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF540
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF541
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF542
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF543
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF544
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF545
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF546
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF547
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF548
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF549
	.byte	0x5
	.uleb128 0x70
	.long	.LASF550
	.byte	0x5
	.uleb128 0x71
	.long	.LASF551
	.byte	0x5
	.uleb128 0x72
	.long	.LASF552
	.byte	0x5
	.uleb128 0x73
	.long	.LASF553
	.byte	0x5
	.uleb128 0x75
	.long	.LASF554
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.c4a72432ea65bcf9f35838c785ffdcc8,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF555
	.byte	0x5
	.uleb128 0x22
	.long	.LASF556
	.byte	0x5
	.uleb128 0x23
	.long	.LASF557
	.byte	0x5
	.uleb128 0x26
	.long	.LASF558
	.byte	0x5
	.uleb128 0x27
	.long	.LASF559
	.byte	0x5
	.uleb128 0x28
	.long	.LASF560
	.byte	0x5
	.uleb128 0x29
	.long	.LASF561
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF562
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF563
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF564
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF565
	.byte	0x5
	.uleb128 0x33
	.long	.LASF566
	.byte	0x5
	.uleb128 0x34
	.long	.LASF567
	.byte	0x5
	.uleb128 0x35
	.long	.LASF568
	.byte	0x5
	.uleb128 0x36
	.long	.LASF569
	.byte	0x5
	.uleb128 0x37
	.long	.LASF570
	.byte	0x5
	.uleb128 0x38
	.long	.LASF571
	.byte	0x5
	.uleb128 0x39
	.long	.LASF572
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF573
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF574
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF575
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF576
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF577
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF578
	.byte	0x5
	.uleb128 0x40
	.long	.LASF579
	.byte	0x5
	.uleb128 0x41
	.long	.LASF580
	.byte	0x5
	.uleb128 0x42
	.long	.LASF581
	.byte	0x5
	.uleb128 0x43
	.long	.LASF582
	.byte	0x5
	.uleb128 0x44
	.long	.LASF583
	.byte	0x5
	.uleb128 0x45
	.long	.LASF584
	.byte	0x5
	.uleb128 0x46
	.long	.LASF585
	.byte	0x5
	.uleb128 0x47
	.long	.LASF586
	.byte	0x5
	.uleb128 0x48
	.long	.LASF587
	.byte	0x5
	.uleb128 0x49
	.long	.LASF588
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF589
	.byte	0x5
	.uleb128 0x52
	.long	.LASF590
	.byte	0x5
	.uleb128 0x56
	.long	.LASF591
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.38.11ee5fdc0f6cc53a16c505b9233cecef,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF595
	.byte	0x5
	.uleb128 0x61
	.long	.LASF596
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.63.97272d7c64d5db8020003b32e9289502,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF597
	.byte	0x5
	.uleb128 0x40
	.long	.LASF598
	.byte	0x5
	.uleb128 0x41
	.long	.LASF599
	.byte	0x5
	.uleb128 0x42
	.long	.LASF600
	.byte	0x5
	.uleb128 0x44
	.long	.LASF601
	.byte	0x5
	.uleb128 0x45
	.long	.LASF602
	.byte	0x5
	.uleb128 0x46
	.long	.LASF603
	.byte	0x5
	.uleb128 0x47
	.long	.LASF604
	.byte	0x5
	.uleb128 0x49
	.long	.LASF605
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF606
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF607
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF608
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.99.408b6270fa6eb71377201a241ef15f79,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF609
	.byte	0x5
	.uleb128 0x64
	.long	.LASF610
	.byte	0x5
	.uleb128 0x65
	.long	.LASF611
	.byte	0x5
	.uleb128 0x66
	.long	.LASF612
	.byte	0x5
	.uleb128 0x67
	.long	.LASF613
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.50.84aeca2ac6f37d40e1e9b3cef757ba2d,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF614
	.byte	0x5
	.uleb128 0x48
	.long	.LASF615
	.byte	0x5
	.uleb128 0x54
	.long	.LASF616
	.byte	0x5
	.uleb128 0x55
	.long	.LASF617
	.byte	0x5
	.uleb128 0x56
	.long	.LASF618
	.byte	0x5
	.uleb128 0x57
	.long	.LASF619
	.byte	0x5
	.uleb128 0x58
	.long	.LASF620
	.byte	0x5
	.uleb128 0x59
	.long	.LASF621
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF622
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF623
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF624
	.byte	0x5
	.uleb128 0x80
	.long	.LASF625
	.byte	0x5
	.uleb128 0x85
	.long	.LASF626
	.byte	0x5
	.uleb128 0x86
	.long	.LASF627
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF628
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.305f7c1ed78a85c751613a0e1f6565b3,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF629
	.byte	0x5
	.uleb128 0x28
	.long	.LASF630
	.byte	0x5
	.uleb128 0x34
	.long	.LASF631
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF632
	.byte	0x5
	.uleb128 0x42
	.long	.LASF633
	.byte	0x5
	.uleb128 0x47
	.long	.LASF634
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF635
	.byte	0x5
	.uleb128 0x51
	.long	.LASF636
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF637
	.byte	0x5
	.uleb128 0x63
	.long	.LASF638
	.byte	0x5
	.uleb128 0x69
	.long	.LASF639
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF640
	.byte	0x5
	.uleb128 0x75
	.long	.LASF641
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF642
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF643
	.byte	0x5
	.uleb128 0x81
	.long	.LASF644
	.byte	0x5
	.uleb128 0x82
	.long	.LASF645
	.byte	0x5
	.uleb128 0x83
	.long	.LASF646
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.53.beb46e650cd406cb917b6b96b45e640a,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF647
	.byte	0x6
	.uleb128 0x42
	.long	.LASF648
	.byte	0x5
	.uleb128 0x45
	.long	.LASF649
	.byte	0x6
	.uleb128 0x52
	.long	.LASF650
	.byte	0x5
	.uleb128 0x56
	.long	.LASF651
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF652
	.byte	0x5
	.uleb128 0x62
	.long	.LASF653
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF654
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF655
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.234.7b49b621169e2007451b8fadbcc644ca,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xea
	.long	.LASF480
	.byte	0x6
	.uleb128 0x198
	.long	.LASF500
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.187.fd8c81c4bff8969f5d23c3a34aa715af,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF656
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF657
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF658
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.28.eb2f3debdbcffd1442ebddaebc4fb6ff,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF660
	.byte	0x5
	.uleb128 0x21
	.long	.LASF661
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF662
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF663
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF664
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF665
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF666
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF667
	.byte	0x5
	.uleb128 0x29
	.long	.LASF644
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF668
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF648
	.byte	0x6
	.uleb128 0x52
	.long	.LASF650
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF652
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF654
	.byte	0x5
	.uleb128 0x72
	.long	.LASF669
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF655
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.25.72fdfa5826e4e33a45f01b6b43c97e79,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF671
	.byte	0x6
	.uleb128 0x63
	.long	.LASF672
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.49.5062e7117766526526e41607c5714bde,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF673
	.byte	0x6
	.uleb128 0x39
	.long	.LASF674
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF675
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF676
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF677
	.byte	0x5
	.uleb128 0x49
	.long	.LASF678
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF679
	.byte	0x5
	.uleb128 0x55
	.long	.LASF680
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF681
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF682
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF683
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF684
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sysmacros.h.20.8a0c33ff175cd9b434a86c0aaa36f0a2,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF685
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF686
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF687
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF688
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.229.67b3f66bd74b06b451caec392a72a945,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF689
	.byte	0x5
	.uleb128 0xec
	.long	.LASF690
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF691
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF692
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypes.h.25.62921d237d52f2c25e0d490888cb64e9,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF694
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF695
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF696
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF697
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF698
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF699
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF700
	.byte	0x5
	.uleb128 0x20
	.long	.LASF701
	.byte	0x5
	.uleb128 0x21
	.long	.LASF702
	.byte	0x5
	.uleb128 0x46
	.long	.LASF703
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF704
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF705
	.byte	0x5
	.uleb128 0xbf
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
	.long	.LASF460
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
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.8394011d5995a16f15d67d04e84a1d69,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF713
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF460
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF462
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.234.5fa44232df77937e0d1fcac1468785aa,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xea
	.long	.LASF480
	.byte	0x6
	.uleb128 0x18d
	.long	.LASF498
	.byte	0x5
	.uleb128 0x192
	.long	.LASF499
	.byte	0x6
	.uleb128 0x198
	.long	.LASF500
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.26.4719156f1aea2bb9662fd6c582dc9a4c,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF715
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF460
	.byte	0x5
	.uleb128 0x20
	.long	.LASF462
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.36.2dd12c1fd035242ad5cfd0152a01be5a,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF716
	.byte	0x5
	.uleb128 0x25
	.long	.LASF717
	.byte	0x5
	.uleb128 0x38
	.long	.LASF718
	.byte	0x6
	.uleb128 0x3a
	.long	.LASF719
	.byte	0x5
	.uleb128 0x42
	.long	.LASF720
	.byte	0x6
	.uleb128 0x44
	.long	.LASF721
	.byte	0x5
	.uleb128 0x48
	.long	.LASF722
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.5.b0f37d9e474454cf6e459063458db32f,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.long	.LASF724
	.byte	0x5
	.uleb128 0xa
	.long	.LASF460
	.byte	0x5
	.uleb128 0xe
	.long	.LASF462
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.80.628010d306c9ecbd260f9d4475ab1db1,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF726
	.byte	0x6
	.uleb128 0x60
	.long	.LASF727
	.byte	0x6
	.uleb128 0x383
	.long	.LASF727
	.byte	0x6
	.uleb128 0x384
	.long	.LASF728
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.46.5187c97b14fd664662cb32e6b94fc49e,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF729
	.byte	0x5
	.uleb128 0x30
	.long	.LASF730
	.byte	0x5
	.uleb128 0x31
	.long	.LASF731
	.byte	0x5
	.uleb128 0x33
	.long	.LASF732
	.byte	0x5
	.uleb128 0x36
	.long	.LASF733
	.byte	0x5
	.uleb128 0x38
	.long	.LASF734
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.33.a775b9ecae273f33bc59931e9891e4ca,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.long	.LASF735
	.byte	0x5
	.uleb128 0x22
	.long	.LASF736
	.byte	0x5
	.uleb128 0x23
	.long	.LASF737
	.byte	0x5
	.uleb128 0x24
	.long	.LASF738
	.byte	0x5
	.uleb128 0x25
	.long	.LASF739
	.byte	0x5
	.uleb128 0x26
	.long	.LASF740
	.byte	0x5
	.uleb128 0x27
	.long	.LASF741
	.byte	0x5
	.uleb128 0x28
	.long	.LASF742
	.byte	0x5
	.uleb128 0x29
	.long	.LASF743
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF744
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF745
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF746
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF747
	.byte	0x5
	.uleb128 0x30
	.long	.LASF748
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF749
	.byte	0x5
	.uleb128 0x27
	.long	.LASF750
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.51.981a9f406a7830caa4638ead01d5e3e6,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x33
	.long	.LASF751
	.byte	0x5
	.uleb128 0x34
	.long	.LASF752
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF753
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF754
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF755
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF756
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF757
	.byte	0x5
	.uleb128 0x50
	.long	.LASF758
	.byte	0x5
	.uleb128 0x51
	.long	.LASF759
	.byte	0x5
	.uleb128 0x52
	.long	.LASF760
	.byte	0x5
	.uleb128 0x53
	.long	.LASF761
	.byte	0x5
	.uleb128 0x54
	.long	.LASF762
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF763
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF764
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF765
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF766
	.byte	0x5
	.uleb128 0x60
	.long	.LASF767
	.byte	0x5
	.uleb128 0x61
	.long	.LASF768
	.byte	0x5
	.uleb128 0x62
	.long	.LASF769
	.byte	0x5
	.uleb128 0x63
	.long	.LASF770
	.byte	0x5
	.uleb128 0x64
	.long	.LASF771
	.byte	0x5
	.uleb128 0x65
	.long	.LASF772
	.byte	0x5
	.uleb128 0x66
	.long	.LASF773
	.byte	0x5
	.uleb128 0x67
	.long	.LASF774
	.byte	0x5
	.uleb128 0x68
	.long	.LASF775
	.byte	0x5
	.uleb128 0x69
	.long	.LASF776
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF777
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF778
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF779
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF780
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF781
	.byte	0x5
	.uleb128 0x70
	.long	.LASF782
	.byte	0x5
	.uleb128 0x71
	.long	.LASF783
	.byte	0x5
	.uleb128 0x75
	.long	.LASF784
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF785
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF786
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF787
	.byte	0x5
	.uleb128 0x80
	.long	.LASF788
	.byte	0x5
	.uleb128 0x81
	.long	.LASF789
	.byte	0x5
	.uleb128 0x82
	.long	.LASF790
	.byte	0x5
	.uleb128 0x83
	.long	.LASF791
	.byte	0x5
	.uleb128 0x84
	.long	.LASF792
	.byte	0x5
	.uleb128 0x85
	.long	.LASF793
	.byte	0x5
	.uleb128 0x86
	.long	.LASF794
	.byte	0x5
	.uleb128 0x87
	.long	.LASF795
	.byte	0x5
	.uleb128 0x88
	.long	.LASF796
	.byte	0x5
	.uleb128 0x89
	.long	.LASF797
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF798
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF799
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF800
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF801
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF802
	.byte	0x5
	.uleb128 0x114
	.long	.LASF803
	.byte	0x5
	.uleb128 0x144
	.long	.LASF804
	.byte	0x5
	.uleb128 0x145
	.long	.LASF805
	.byte	0x5
	.uleb128 0x146
	.long	.LASF806
	.byte	0x5
	.uleb128 0x190
	.long	.LASF807
	.byte	0x5
	.uleb128 0x195
	.long	.LASF808
	.byte	0x5
	.uleb128 0x198
	.long	.LASF809
	.byte	0x5
	.uleb128 0x19c
	.long	.LASF810
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF811
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF812
	.byte	0x5
	.uleb128 0x1ba
	.long	.LASF813
	.byte	0x5
	.uleb128 0x1c8
	.long	.LASF814
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF815
	.byte	0x5
	.uleb128 0x1ca
	.long	.LASF816
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF817
	.byte	0x5
	.uleb128 0x1cc
	.long	.LASF818
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF819
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.80.17b7dd1ca72d8a61987532cb1d80194a,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF820
	.byte	0x5
	.uleb128 0x78
	.long	.LASF821
	.byte	0x5
	.uleb128 0x79
	.long	.LASF822
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF823
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF824
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF825
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF826
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF827
	.byte	0x5
	.uleb128 0x97
	.long	.LASF828
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.23.557290a6cddeba0587f574f29e3a5fb9,comdat
.Ldebug_macro48:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF829
	.byte	0x5
	.uleb128 0x18
	.long	.LASF830
	.byte	0x5
	.uleb128 0x19
	.long	.LASF831
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF832
	.byte	0x6
	.uleb128 0x24
	.long	.LASF833
	.byte	0x5
	.uleb128 0x25
	.long	.LASF834
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.172.df21df34a7396d7da2e08f9b617d582f,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xac
	.long	.LASF835
	.byte	0x5
	.uleb128 0xad
	.long	.LASF836
	.byte	0x5
	.uleb128 0xae
	.long	.LASF837
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF838
	.byte	0x5
	.uleb128 0x249
	.long	.LASF839
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF404:
	.string	"INT32_MAX (2147483647)"
.LASF821:
	.string	"_IOFBF 0"
.LASF554:
	.string	"__STD_TYPE typedef"
.LASF692:
	.string	"__fsfilcnt_t_defined "
.LASF761:
	.string	"_IOS_NOREPLACE 64"
.LASF408:
	.string	"UINT32_MAX (4294967295U)"
.LASF843:
	.string	"unsigned char"
.LASF734:
	.string	"_G_BUFSIZ 8192"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF199:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF631:
	.string	"__ino_t_defined "
.LASF847:
	.string	"sizetype"
.LASF74:
	.string	"__LONG_LONG_MAX__ 9223372036854775807LL"
.LASF829:
	.string	"L_tmpnam 20"
.LASF712:
	.string	"__need_malloc_and_calloc"
.LASF184:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF17:
	.string	"__LP64__ 1"
.LASF818:
	.string	"_IO_cleanup_region_start(_fct,_fp) "
.LASF389:
	.string	"__stub_sigreturn "
.LASF269:
	.string	"__USE_XOPEN2K8XSI"
.LASF825:
	.string	"SEEK_SET 0"
.LASF837:
	.string	"stderr stderr"
.LASF772:
	.string	"_IO_DELETE_DONT_CLOSE 0x40"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF371:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF651:
	.string	"__clockid_t_defined 1"
.LASF341:
	.string	"__flexarr []"
.LASF158:
	.string	"__DECIMAL_DIG__ 21"
.LASF450:
	.string	"INT16_C(c) c"
.LASF309:
	.string	"__GNU_LIBRARY__"
.LASF143:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF667:
	.string	"__sigset_t_defined "
.LASF752:
	.string	"_IO_va_list __gnuc_va_list"
.LASF739:
	.string	"_IO_off_t __off_t"
.LASF791:
	.string	"_IO_HEX 0100"
.LASF169:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF175:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF135:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF440:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF504:
	.string	"WSTOPPED 2"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF104:
	.string	"__UINT8_C(c) c"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF231:
	.string	"linux 1"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF159:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF517:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF352:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF191:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF676:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF592:
	.string	"__STD_TYPE"
.LASF673:
	.string	"__suseconds_t_defined "
.LASF132:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF429:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF321:
	.string	"__P(args) args"
.LASF658:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF464:
	.string	"__SIZE_T__ "
.LASF80:
	.string	"__SIZE_MAX__ 18446744073709551615UL"
.LASF748:
	.string	"__need___va_list "
.LASF809:
	.string	"_IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) && __underflow (_fp) == EOF ? EOF : *(unsigned char *) (_fp)->_IO_read_ptr)"
.LASF567:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF641:
	.string	"__daddr_t_defined "
.LASF816:
	.string	"_IO_funlockfile(_fp) "
.LASF497:
	.string	"__need_wchar_t"
.LASF152:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF714:
	.string	"_XLOCALE_H 1"
.LASF679:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF812:
	.string	"_IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF433:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF621:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF454:
	.string	"UINT16_C(c) c"
.LASF544:
	.string	"__SLONGWORD_TYPE long int"
.LASF479:
	.string	"__size_t "
.LASF398:
	.string	"INT8_MIN (-128)"
.LASF664:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF217:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF551:
	.string	"__ULONG32_TYPE unsigned int"
.LASF773:
	.string	"_IO_LINKED 0x80"
.LASF313:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF559:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF528:
	.string	"__LITTLE_ENDIAN 1234"
.LASF342:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF468:
	.string	"_T_SIZE "
.LASF141:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF407:
	.string	"UINT16_MAX (65535)"
.LASF183:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF428:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF534:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF434:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF424:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF117:
	.string	"__UINT_FAST32_MAX__ 18446744073709551615UL"
.LASF272:
	.string	"__USE_FILE_OFFSET64"
.LASF259:
	.string	"__USE_POSIX"
.LASF70:
	.string	"__SCHAR_MAX__ 127"
.LASF171:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF705:
	.string	"__PTHREAD_MUTEX_HAVE_ELISION 1"
.LASF665:
	.string	"_SIGSET_H_types 1"
.LASF662:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF779:
	.string	"_IO_IS_FILEBUF 0x2000"
.LASF88:
	.string	"__INT16_MAX__ 32767"
.LASF806:
	.string	"_IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))"
.LASF111:
	.string	"__INT_FAST8_MAX__ 127"
.LASF381:
	.string	"__stub_fchflags "
.LASF205:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF576:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF133:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF610:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF598:
	.string	"htole16(x) (x)"
.LASF282:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF263:
	.string	"__USE_XOPEN"
.LASF165:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF268:
	.string	"__USE_XOPEN2K8"
.LASF466:
	.string	"_SYS_SIZE_T_H "
.LASF237:
	.string	"DEBUG 1"
.LASF419:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF581:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF311:
	.string	"__GLIBC__ 2"
.LASF842:
	.string	"long int"
.LASF600:
	.string	"le16toh(x) (x)"
.LASF109:
	.string	"__UINT_LEAST64_MAX__ 18446744073709551615UL"
.LASF597:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF301:
	.string	"__USE_XOPEN2K8 1"
.LASF584:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF766:
	.string	"_IO_USER_BUF 1"
.LASF181:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF668:
	.string	"__need_timespec "
.LASF463:
	.string	"__size_t__ "
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF232:
	.string	"__unix 1"
.LASF819:
	.string	"_IO_cleanup_region_end(_Doit) "
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF195:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF395:
	.string	"__int8_t_defined "
.LASF608:
	.string	"le64toh(x) (x)"
.LASF530:
	.string	"__PDP_ENDIAN 3412"
.LASF607:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF854:
	.string	"main"
.LASF834:
	.string	"FOPEN_MAX 16"
.LASF804:
	.string	"_IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF435:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF87:
	.string	"__INT8_MAX__ 127"
.LASF574:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF475:
	.string	"_SIZE_T_DECLARED "
.LASF323:
	.string	"__CONCAT(x,y) x ## y"
.LASF520:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF225:
	.string	"__FXSR__ 1"
.LASF295:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF128:
	.string	"__FLT_MAX_EXP__ 128"
.LASF246:
	.string	"__STDC_ISO_10646__ 201103L"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF349:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF442:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF613:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF243:
	.string	"_STDC_PREDEF_H 1"
.LASF146:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF572:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF448:
	.string	"WINT_MAX (4294967295u)"
.LASF177:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF343:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF578:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF627:
	.string	"EXIT_SUCCESS 0"
.LASF127:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF826:
	.string	"SEEK_CUR 1"
.LASF130:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF763:
	.string	"_IO_MAGIC 0xFBAD0000"
.LASF840:
	.string	"signed char"
.LASF594:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF771:
	.string	"_IO_ERR_SEEN 0x20"
.LASF824:
	.string	"BUFSIZ _IO_BUFSIZ"
.LASF622:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF538:
	.string	"_BITS_BYTESWAP_H 1"
.LASF541:
	.string	"__U16_TYPE unsigned short int"
.LASF490:
	.string	"_WCHAR_T_DEFINED "
.LASF325:
	.string	"__ptr_t void *"
.LASF189:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF830:
	.string	"TMP_MAX 238328"
.LASF137:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF556:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF387:
	.string	"__stub_revoke "
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 4"
.LASF656:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF708:
	.string	"_ALLOCA_H 1"
.LASF751:
	.string	"_IO_va_list"
.LASF723:
	.string	"_IO_STDIO_H "
.LASF800:
	.string	"_IO_DONT_CLOSE 0100000"
.LASF630:
	.string	"__u_char_defined "
.LASF474:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF476:
	.string	"___int_size_t_h "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF289:
	.string	"__USE_ISOC99 1"
.LASF129:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF322:
	.string	"__PMT(args) args"
.LASF182:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF420:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF774:
	.string	"_IO_IN_BACKUP 0x100"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF728:
	.string	"__need_wint_t"
.LASF142:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF108:
	.string	"__UINT32_C(c) c ## U"
.LASF638:
	.string	"__pid_t_defined "
.LASF637:
	.string	"__off_t_defined "
.LASF82:
	.string	"__INTMAX_C(c) c ## L"
.LASF156:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF399:
	.string	"INT16_MIN (-32767-1)"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF683:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF652:
	.string	"__clockid_time_t"
.LASF99:
	.string	"__INT_LEAST32_MAX__ 2147483647"
.LASF102:
	.string	"__INT64_C(c) c ## L"
.LASF365:
	.string	"__restrict_arr __restrict"
.LASF312:
	.string	"__GLIBC_MINOR__ 19"
.LASF472:
	.string	"_SIZE_T_DEFINED_ "
.LASF498:
	.string	"NULL"
.LASF84:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF582:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF277:
	.string	"__USE_GNU"
.LASF207:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF415:
	.string	"INT_LEAST16_MAX (32767)"
.LASF848:
	.string	"char"
.LASF192:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF461:
	.string	"__need_wchar_t "
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF69:
	.string	"__GXX_ABI_VERSION 1002"
.LASF725:
	.string	"__need_mbstate_t "
.LASF460:
	.string	"__need_size_t "
.LASF280:
	.string	"__KERNEL_STRICT_NAMES"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF118:
	.string	"__UINT_FAST64_MAX__ 18446744073709551615UL"
.LASF337:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF770:
	.string	"_IO_EOF_SEEN 0x10"
.LASF609:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF459:
	.string	"_GCC_WRAP_STDINT_H "
.LASF147:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF266:
	.string	"__USE_XOPEN2K"
.LASF508:
	.string	"__WNOTHREAD 0x20000000"
.LASF462:
	.string	"__need_NULL "
.LASF385:
	.string	"__stub_lchmod "
.LASF785:
	.string	"_IO_SKIPWS 01"
.LASF794:
	.string	"_IO_UPPERCASE 01000"
.LASF361:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF149:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF704:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF298:
	.string	"__USE_POSIX199309 1"
.LASF783:
	.string	"_IO_FLAGS2_NOTCANCEL 2"
.LASF426:
	.string	"INT_FAST8_MAX (127)"
.LASF414:
	.string	"INT_LEAST8_MAX (127)"
.LASF455:
	.string	"UINT32_C(c) c ## U"
.LASF97:
	.string	"__INT_LEAST16_MAX__ 32767"
.LASF261:
	.string	"__USE_POSIX199309"
.LASF405:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF176:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF661:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF525:
	.string	"__W_CONTINUED 0xffff"
.LASF112:
	.string	"__INT_FAST16_MAX__ 9223372036854775807L"
.LASF444:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF383:
	.string	"__stub_getmsg "
.LASF718:
	.string	"__FILE_defined 1"
.LASF437:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF265:
	.string	"__USE_UNIX98"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF281:
	.string	"__KERNEL_STRICT_NAMES "
.LASF678:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF601:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF724:
	.string	"_G_config_h 1"
.LASF560:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF781:
	.string	"_IO_USER_LOCK 0x8000"
.LASF200:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF545:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF204:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF235:
	.string	"__ELF__ 1"
.LASF820:
	.string	"_VA_LIST_DEFINED "
.LASF76:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF644:
	.string	"__need_time_t "
.LASF831:
	.string	"FILENAME_MAX 4096"
.LASF698:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF164:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF388:
	.string	"__stub_setlogin "
.LASF170:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF590:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF647:
	.string	"__clock_t_defined 1"
.LASF732:
	.string	"_G_IO_IO_FILE_VERSION 0x20001"
.LASF817:
	.string	"_IO_ftrylockfile(_fp) "
.LASF750:
	.string	"__GNUC_VA_LIST "
.LASF611:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF249:
	.string	"bool _Bool"
.LASF86:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF488:
	.string	"_BSD_WCHAR_T_ "
.LASF740:
	.string	"_IO_off64_t __off64_t"
.LASF625:
	.string	"RAND_MAX 2147483647"
.LASF431:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF722:
	.string	"_STDIO_USES_IOSTREAM "
.LASF595:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF369:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF717:
	.string	"__need___FILE "
.LASF745:
	.string	"_IO_BUFSIZ _G_BUFSIZ"
.LASF726:
	.string	"____mbstate_t_defined 1"
.LASF549:
	.string	"__UWORD_TYPE unsigned long int"
.LASF122:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF115:
	.string	"__UINT_FAST8_MAX__ 255"
.LASF432:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF425:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF596:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF179:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF499:
	.string	"NULL ((void *)0)"
.LASF363:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF121:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF694:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF628:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF89:
	.string	"__INT32_MAX__ 2147483647"
.LASF716:
	.string	"__need_FILE "
.LASF302:
	.string	"_ATFILE_SOURCE"
.LASF286:
	.string	"_BSD_SOURCE 1"
.LASF550:
	.string	"__SLONG32_TYPE int"
.LASF742:
	.string	"_IO_uid_t __uid_t"
.LASF786:
	.string	"_IO_LEFT 02"
.LASF571:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF255:
	.string	"__USE_ISOC11"
.LASF370:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF758:
	.string	"_IOS_APPEND 8"
.LASF674:
	.string	"__NFDBITS"
.LASF624:
	.string	"__lldiv_t_defined 1"
.LASF680:
	.string	"NFDBITS __NFDBITS"
.LASF729:
	.string	"_G_va_list __gnuc_va_list"
.LASF787:
	.string	"_IO_RIGHT 04"
.LASF240:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF136:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF245:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF757:
	.string	"_IOS_ATEND 4"
.LASF505:
	.string	"WEXITED 4"
.LASF438:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF573:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF273:
	.string	"__USE_BSD"
.LASF206:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF539:
	.string	"_BITS_TYPES_H 1"
.LASF406:
	.string	"UINT8_MAX (255)"
.LASF696:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF443:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF5:
	.string	"__GNUC__ 4"
.LASF617:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF453:
	.string	"UINT8_C(c) c"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF292:
	.string	"_POSIX_SOURCE"
.LASF759:
	.string	"_IOS_TRUNC 16"
.LASF290:
	.string	"__USE_ISOC95 1"
.LASF168:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF467:
	.string	"_T_SIZE_ "
.LASF835:
	.string	"stdin stdin"
.LASF693:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF741:
	.string	"_IO_pid_t __pid_t"
.LASF706:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF851:
	.string	"GNU C 4.8.4 -mtune=generic -march=x86-64 -ggdb3 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector"
.LASF220:
	.string	"__k8__ 1"
.LASF16:
	.string	"_LP64 1"
.LASF91:
	.string	"__UINT8_MAX__ 255"
.LASF318:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF514:
	.string	"P_PGID"
.LASF254:
	.string	"_FEATURES_H 1"
.LASF284:
	.string	"_DEFAULT_SOURCE 1"
.LASF618:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF447:
	.string	"WINT_MIN (0u)"
.LASF632:
	.string	"__dev_t_defined "
.LASF645:
	.string	"__need_timer_t "
.LASF72:
	.string	"__INT_MAX__ 2147483647"
.LASF316:
	.string	"__LEAF , __leaf__"
.LASF394:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF185:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF351:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF604:
	.string	"le32toh(x) (x)"
.LASF577:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF197:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF555:
	.string	"_BITS_TYPESIZES_H 1"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF124:
	.string	"__FLT_MANT_DIG__ 24"
.LASF293:
	.string	"_POSIX_SOURCE 1"
.LASF605:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF643:
	.string	"__need_clock_t "
.LASF114:
	.string	"__INT_FAST64_MAX__ 9223372036854775807L"
.LASF795:
	.string	"_IO_SHOWPOS 02000"
.LASF790:
	.string	"_IO_OCT 040"
.LASF802:
	.string	"_IO_file_flags _flags"
.LASF799:
	.string	"_IO_STDIO 040000"
.LASF382:
	.string	"__stub_fdetach "
.LASF291:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF838:
	.string	"getc(_fp) _IO_getc (_fp)"
.LASF223:
	.string	"__SSE__ 1"
.LASF737:
	.string	"_IO_size_t size_t"
.LASF194:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF94:
	.string	"__UINT64_MAX__ 18446744073709551615UL"
.LASF589:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF663:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF659:
	.string	"_SYS_SELECT_H 1"
.LASF484:
	.string	"_T_WCHAR_ "
.LASF749:
	.string	"__need___va_list"
.LASF373:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF260:
	.string	"__USE_POSIX2"
.LASF702:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF202:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF480:
	.string	"__need_size_t"
.LASF612:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF113:
	.string	"__INT_FAST32_MAX__ 9223372036854775807L"
.LASF470:
	.string	"_SIZE_T_ "
.LASF123:
	.string	"__FLT_RADIX__ 2"
.LASF642:
	.string	"__key_t_defined "
.LASF849:
	.string	"long long int"
.LASF509:
	.string	"__WALL 0x40000000"
.LASF811:
	.string	"_IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF77:
	.string	"__WINT_MAX__ 4294967295U"
.LASF500:
	.string	"__need_NULL"
.LASF214:
	.string	"__amd64__ 1"
.LASF502:
	.string	"WNOHANG 1"
.LASF253:
	.string	"_STDINT_H 1"
.LASF331:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF203:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF784:
	.string	"_IO_FLAGS2_USER_WBUF 8"
.LASF813:
	.string	"_IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr - (_fp)->_IO_write_base)"
.LASF356:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF669:
	.string	"__timespec_defined 1"
.LASF216:
	.string	"__x86_64__ 1"
.LASF486:
	.string	"__WCHAR_T "
.LASF827:
	.string	"SEEK_END 2"
.LASF671:
	.string	"_STRUCT_TIMEVAL 1"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF654:
	.string	"__need_timer_t"
.LASF354:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF210:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF533:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF315:
	.string	"__PMT"
.LASF778:
	.string	"_IO_IS_APPENDING 0x1000"
.LASF145:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF599:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF731:
	.string	"_G_HAVE_MREMAP 1"
.LASF241:
	.string	"__TARGET__ \"NAZE\""
.LASF519:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF303:
	.string	"_ATFILE_SOURCE 1"
.LASF242:
	.string	"__REVISION__ \"d49895e\""
.LASF546:
	.string	"__SQUAD_TYPE long int"
.LASF832:
	.string	"L_ctermid 9"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF422:
	.string	"INT_FAST8_MIN (-128)"
.LASF100:
	.string	"__INT32_C(c) c"
.LASF760:
	.string	"_IOS_NOCREATE 32"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF267:
	.string	"__USE_XOPEN2KXSI"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF279:
	.string	"__USE_FORTIFY_LEVEL"
.LASF754:
	.string	"EOF (-1)"
.LASF188:
	.string	"__USER_LABEL_PREFIX__ "
.LASF116:
	.string	"__UINT_FAST16_MAX__ 18446744073709551615UL"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF219:
	.string	"__k8 1"
.LASF73:
	.string	"__LONG_MAX__ 9223372036854775807L"
.LASF402:
	.string	"INT8_MAX (127)"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF522:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF845:
	.string	"unsigned int"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF386:
	.string	"__stub_putmsg "
.LASF126:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF580:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF275:
	.string	"__USE_MISC"
.LASF270:
	.string	"__USE_LARGEFILE"
.LASF125:
	.string	"__FLT_DIG__ 6"
.LASF248:
	.string	"_STDBOOL_H "
.LASF495:
	.string	"_WCHAR_T_DECLARED "
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF300:
	.string	"__USE_XOPEN2K 1"
.LASF119:
	.string	"__INTPTR_MAX__ 9223372036854775807L"
.LASF839:
	.string	"putc(_ch,_fp) _IO_putc (_ch, _fp)"
.LASF583:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF83:
	.string	"__UINTMAX_MAX__ 18446744073709551615UL"
.LASF810:
	.string	"_IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end, 0) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF543:
	.string	"__U32_TYPE unsigned int"
.LASF348:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF174:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF807:
	.string	"_IO_BE(expr,res) __builtin_expect ((expr), res)"
.LASF709:
	.string	"alloca"
.LASF367:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF384:
	.string	"__stub_gtty "
.LASF482:
	.string	"__WCHAR_T__ "
.LASF417:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF212:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF410:
	.string	"INT_LEAST8_MIN (-128)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF494:
	.string	"_GCC_WCHAR_T "
.LASF557:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF244:
	.string	"__STDC_IEC_559__ 1"
.LASF358:
	.string	"__wur "
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF703:
	.string	"__have_pthread_attr_t 1"
.LASF639:
	.string	"__id_t_defined "
.LASF672:
	.string	"__need_timeval"
.LASF180:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF449:
	.string	"INT8_C(c) c"
.LASF635:
	.string	"__nlink_t_defined "
.LASF670:
	.string	"__need_timeval "
.LASF310:
	.string	"__GNU_LIBRARY__ 6"
.LASF8:
	.string	"__VERSION__ \"4.8.4\""
.LASF196:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF566:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF516:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF319:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF372:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF515:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF324:
	.string	"__STRING(x) #x"
.LASF95:
	.string	"__INT_LEAST8_MAX__ 127"
.LASF110:
	.string	"__UINT64_C(c) c ## UL"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF483:
	.string	"_WCHAR_T "
.LASF166:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF688:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF329:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF375:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF701:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF320:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF377:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF465:
	.string	"_SIZE_T "
.LASF491:
	.string	"_WCHAR_T_H "
.LASF822:
	.string	"_IOLBF 1"
.LASF768:
	.string	"_IO_NO_READS 4"
.LASF615:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF720:
	.string	"____FILE_defined 1"
.LASF775:
	.string	"_IO_LINE_BUF 0x200"
.LASF345:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF606:
	.string	"htole64(x) (x)"
.LASF767:
	.string	"_IO_UNBUFFERED 2"
.LASF743:
	.string	"_IO_iconv_t _G_iconv_t"
.LASF409:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF744:
	.string	"_IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE"
.LASF157:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF96:
	.string	"__INT8_C(c) c"
.LASF769:
	.string	"_IO_NO_WRITES 8"
.LASF844:
	.string	"short unsigned int"
.LASF753:
	.string	"_IO_UNIFIED_JUMPTABLES 1"
.LASF140:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF469:
	.string	"__SIZE_T "
.LASF527:
	.string	"_ENDIAN_H 1"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF173:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF198:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF587:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF257:
	.string	"__USE_ISOC95"
.LASF788:
	.string	"_IO_INTERNAL 010"
.LASF134:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF256:
	.string	"__USE_ISOC99"
.LASF334:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF264:
	.string	"__USE_XOPEN_EXTENDED"
.LASF163:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF359:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF193:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF306:
	.string	"__USE_SVID 1"
.LASF327:
	.string	"__BEGIN_DECLS "
.LASF650:
	.string	"__need_time_t"
.LASF792:
	.string	"_IO_SHOWBASE 0200"
.LASF421:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF715:
	.string	"_STDIO_H 1"
.LASF506:
	.string	"WCONTINUED 8"
.LASF299:
	.string	"__USE_POSIX199506 1"
.LASF666:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF397:
	.string	"__intptr_t_defined "
.LASF591:
	.string	"__FD_SETSIZE 1024"
.LASF503:
	.string	"WUNTRACED 2"
.LASF568:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF565:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF586:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF850:
	.string	"long long unsigned int"
.LASF738:
	.string	"_IO_ssize_t __ssize_t"
.LASF526:
	.string	"__WCOREFLAG 0x80"
.LASF258:
	.string	"__USE_ISOCXX11"
.LASF473:
	.string	"_SIZE_T_DEFINED "
.LASF640:
	.string	"__ssize_t_defined "
.LASF685:
	.string	"_SYS_SYSMACROS_H 1"
.LASF186:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF510:
	.string	"__WCLONE 0x80000000"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF687:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF653:
	.string	"__timer_t_defined 1"
.LASF727:
	.string	"__need_mbstate_t"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF521:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF814:
	.string	"_IO_peekc(_fp) _IO_peekc_unlocked (_fp)"
.LASF602:
	.string	"htole32(x) (x)"
.LASF513:
	.string	"P_PID"
.LASF105:
	.string	"__UINT_LEAST16_MAX__ 65535"
.LASF262:
	.string	"__USE_POSIX199506"
.LASF529:
	.string	"__BIG_ENDIAN 4321"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF456:
	.string	"UINT64_C(c) c ## UL"
.LASF285:
	.string	"_BSD_SOURCE"
.LASF501:
	.string	"_STDLIB_H 1"
.LASF736:
	.string	"_IO_fpos64_t _G_fpos64_t"
.LASF287:
	.string	"_SVID_SOURCE"
.LASF368:
	.string	"__WORDSIZE 64"
.LASF339:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF682:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF695:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF532:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF209:
	.string	"__SIZEOF_INT128__ 16"
.LASF391:
	.string	"__stub_stty "
.LASF221:
	.string	"__code_model_small__ 1"
.LASF172:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF228:
	.string	"__gnu_linux__ 1"
.LASF288:
	.string	"_SVID_SOURCE 1"
.LASF552:
	.string	"__S64_TYPE long int"
.LASF471:
	.string	"_BSD_SIZE_T_ "
.LASF336:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF756:
	.string	"_IOS_OUTPUT 2"
.LASF487:
	.string	"_WCHAR_T_ "
.LASF782:
	.string	"_IO_FLAGS2_MMAP 1"
.LASF801:
	.string	"_IO_BOOLALPHA 0200000"
.LASF485:
	.string	"_T_WCHAR "
.LASF332:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF101:
	.string	"__INT_LEAST64_MAX__ 9223372036854775807L"
.LASF542:
	.string	"__S32_TYPE int"
.LASF620:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF107:
	.string	"__UINT_LEAST32_MAX__ 4294967295U"
.LASF797:
	.string	"_IO_FIXED 010000"
.LASF493:
	.string	"__INT_WCHAR_T_H "
.LASF446:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF713:
	.string	"_STRING_H 1"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF392:
	.string	"_BITS_WCHAR_H 1"
.LASF684:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF777:
	.string	"_IO_CURRENTLY_PUTTING 0x800"
.LASF660:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF823:
	.string	"_IONBF 2"
.LASF458:
	.string	"UINTMAX_C(c) c ## UL"
.LASF390:
	.string	"__stub_sstk "
.LASF780:
	.string	"_IO_BAD_SEEN 0x4000"
.LASF764:
	.string	"_OLD_STDIO_MAGIC 0xFABC0000"
.LASF828:
	.string	"P_tmpdir \"/tmp\""
.LASF160:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF208:
	.string	"__SSP__ 1"
.LASF155:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF6:
	.string	"__GNUC_MINOR__ 8"
.LASF201:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF90:
	.string	"__INT64_MAX__ 9223372036854775807L"
.LASF379:
	.string	"__stub_chflags "
.LASF675:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF378:
	.string	"__stub_bdflush "
.LASF478:
	.string	"_SIZET_ "
.LASF585:
	.string	"__TIMER_T_TYPE void *"
.LASF151:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF636:
	.string	"__uid_t_defined "
.LASF686:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF536:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF224:
	.string	"__SSE2__ 1"
.LASF648:
	.string	"__need_clock_t"
.LASF512:
	.string	"P_ALL"
.LASF579:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF376:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF362:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF187:
	.string	"__REGISTER_PREFIX__ "
.LASF418:
	.string	"UINT_LEAST8_MAX (255)"
.LASF139:
	.string	"__DBL_DIG__ 15"
.LASF355:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF524:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF430:
	.string	"UINT_FAST8_MAX (255)"
.LASF328:
	.string	"__END_DECLS "
.LASF507:
	.string	"WNOWAIT 0x01000000"
.LASF236:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF833:
	.string	"FOPEN_MAX"
.LASF218:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF92:
	.string	"__UINT16_MAX__ 65535"
.LASF614:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF93:
	.string	"__UINT32_MAX__ 4294967295U"
.LASF333:
	.string	"__END_NAMESPACE_C99 "
.LASF226:
	.string	"__SSE_MATH__ 1"
.LASF841:
	.string	"short int"
.LASF314:
	.string	"_SYS_CDEFS_H 1"
.LASF616:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF106:
	.string	"__UINT16_C(c) c"
.LASF364:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF190:
	.string	"__NO_INLINE__ 1"
.LASF690:
	.string	"__blkcnt_t_defined "
.LASF646:
	.string	"__need_clockid_t "
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF346:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF689:
	.string	"__blksize_t_defined "
.LASF120:
	.string	"__UINTPTR_MAX__ 18446744073709551615UL"
.LASF150:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF250:
	.string	"true 1"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF697:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF747:
	.string	"_IO_wint_t wint_t"
.LASF796:
	.string	"_IO_SCIENTIFIC 04000"
.LASF547:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF71:
	.string	"__SHRT_MAX__ 32767"
.LASF144:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF629:
	.string	"_SYS_TYPES_H 1"
.LASF344:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF396:
	.string	"__uint32_t_defined "
.LASF755:
	.string	"_IOS_INPUT 1"
.LASF564:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF380:
	.string	"__stub_fattach "
.LASF762:
	.string	"_IOS_BIN 128"
.LASF347:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF548:
	.string	"__SWORD_TYPE long int"
.LASF815:
	.string	"_IO_flockfile(_fp) "
.LASF350:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF836:
	.string	"stdout stdout"
.LASF238:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF353:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF413:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF561:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF296:
	.string	"__USE_POSIX 1"
.LASF439:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF436:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF553:
	.string	"__U64_TYPE unsigned long int"
.LASF511:
	.string	"__ENUM_IDTYPE_T 1"
.LASF789:
	.string	"_IO_DEC 020"
.LASF733:
	.string	"_G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)"
.LASF251:
	.string	"false 0"
.LASF540:
	.string	"__S16_TYPE short int"
.LASF798:
	.string	"_IO_UNITBUF 020000"
.LASF211:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF649:
	.string	"__time_t_defined 1"
.LASF445:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF0:
	.string	"__STDC__ 1"
.LASF215:
	.string	"__x86_64 1"
.LASF700:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF357:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF307:
	.string	"__USE_ATFILE 1"
.LASF360:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF765:
	.string	"_IO_MAGIC_MASK 0xFFFF0000"
.LASF167:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF808:
	.string	"_IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF79:
	.string	"__PTRDIFF_MAX__ 9223372036854775807L"
.LASF492:
	.string	"___int_wchar_t_h "
.LASF148:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF535:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF805:
	.string	"_IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))"
.LASF374:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF569:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF222:
	.string	"__MMX__ 1"
.LASF401:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF227:
	.string	"__SSE2_MATH__ 1"
.LASF730:
	.string	"_G_HAVE_MMAP 1"
.LASF623:
	.string	"__ldiv_t_defined 1"
.LASF274:
	.string	"__USE_SVID"
.LASF283:
	.string	"_DEFAULT_SOURCE"
.LASF793:
	.string	"_IO_SHOWPOINT 0400"
.LASF477:
	.string	"_GCC_SIZE_T "
.LASF412:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF657:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF496:
	.string	"_BSD_WCHAR_T_"
.LASF677:
	.string	"__FD_MASK(d) ((__fd_mask) 1 << ((d) % __NFDBITS))"
.LASF416:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF531:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF721:
	.string	"__need___FILE"
.LASF75:
	.string	"__WCHAR_MAX__ 2147483647"
.LASF558:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF411:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF276:
	.string	"__USE_ATFILE"
.LASF423:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF335:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF537:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF213:
	.string	"__amd64 1"
.LASF603:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF85:
	.string	"__SIG_ATOMIC_MAX__ 2147483647"
.LASF297:
	.string	"__USE_POSIX2 1"
.LASF233:
	.string	"__unix__ 1"
.LASF570:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF523:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF338:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF403:
	.string	"INT16_MAX (32767)"
.LASF655:
	.string	"__need_timespec"
.LASF153:
	.string	"__LDBL_DIG__ 18"
.LASF305:
	.string	"__USE_BSD 1"
.LASF562:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF719:
	.string	"__need_FILE"
.LASF634:
	.string	"__mode_t_defined "
.LASF78:
	.string	"__WINT_MIN__ 0U"
.LASF563:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF776:
	.string	"_IO_TIED_PUT_GET 0x400"
.LASF178:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF735:
	.string	"_IO_fpos_t _G_fpos_t"
.LASF239:
	.string	"NAZE 1"
.LASF326:
	.string	"__long_double_t long double"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF161:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF711:
	.string	"__COMPAR_FN_T "
.LASF575:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF451:
	.string	"INT32_C(c) c"
.LASF481:
	.string	"__wchar_t__ "
.LASF427:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF230:
	.string	"__linux__ 1"
.LASF308:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF154:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF304:
	.string	"__USE_MISC 1"
.LASF252:
	.string	"__bool_true_false_are_defined 1"
.LASF588:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF393:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF330:
	.string	"__END_NAMESPACE_STD "
.LASF518:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF234:
	.string	"unix 1"
.LASF278:
	.string	"__USE_REENTRANT"
.LASF633:
	.string	"__gid_t_defined "
.LASF340:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF626:
	.string	"EXIT_FAILURE 1"
.LASF317:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF131:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF400:
	.string	"INT32_MIN (-2147483647-1)"
.LASF852:
	.string	"./src/main/fc/boot.c"
.LASF707:
	.string	"__malloc_and_calloc_defined "
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF853:
	.string	"/mnt/c/Users/Aravind Sridhar/Documents/GitHub/cleanflight"
.LASF271:
	.string	"__USE_LARGEFILE64"
.LASF98:
	.string	"__INT16_C(c) c"
.LASF247:
	.string	"__STDC_NO_THREADS__ 1"
.LASF162:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF452:
	.string	"INT64_C(c) c ## L"
.LASF619:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF593:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF229:
	.string	"__linux 1"
.LASF489:
	.string	"_WCHAR_T_DEFINED_ "
.LASF681:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF710:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF103:
	.string	"__UINT_LEAST8_MAX__ 255"
.LASF441:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF699:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF294:
	.string	"_POSIX_C_SOURCE"
.LASF138:
	.string	"__DBL_MANT_DIG__ 53"
.LASF457:
	.string	"INTMAX_C(c) c ## L"
.LASF846:
	.string	"long unsigned int"
.LASF366:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF81:
	.string	"__INTMAX_MAX__ 9223372036854775807L"
.LASF803:
	.string	"__HAVE_COLUMN "
.LASF691:
	.string	"__fsblkcnt_t_defined "
.LASF746:
	.string	"_IO_va_list _G_va_list"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
