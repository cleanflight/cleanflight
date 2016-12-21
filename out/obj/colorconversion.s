	.file	"colorconversion.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed colorconversion.i -mtune=generic
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
	.section	.text.hsvToRgb24,"ax",@progbits
	.globl	hsvToRgb24
	.type	hsvToRgb24, @function
hsvToRgb24:
.LFB0:
	.file 1 "src/main/common/colorconversion.c"
	.loc 1 28 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movq	%rdi, -72(%rbp)	# c, c
	.loc 1 28 0
	movq	%fs:40, %rax	#, tmp197
	movq	%rax, -8(%rbp)	# tmp197, D.1945
	xorl	%eax, %eax	# tmp197
	.loc 1 31 0
	movq	-72(%rbp), %rax	# c, tmp118
	movzbl	3(%rax), %eax	# c_4(D)->v, D.1941
	movzbl	%al, %eax	# D.1941, tmp119
	movl	%eax, -52(%rbp)	# tmp119, val
	.loc 1 32 0
	movq	-72(%rbp), %rax	# c, tmp120
	movzbl	2(%rax), %eax	# c_4(D)->s, D.1941
	movzbl	%al, %eax	# D.1941, tmp121
	movl	%eax, -48(%rbp)	# tmp121, isat
	.loc 1 33 0
	movq	-72(%rbp), %rax	# c, tmp122
	movzwl	(%rax), %eax	# c_4(D)->h, D.1942
	movzwl	%ax, %eax	# D.1942, tmp123
	movl	%eax, -56(%rbp)	# tmp123, hue
	.loc 1 35 0
	cmpl	$255, -48(%rbp)	#, isat
	jne	.L2	#,
	.loc 1 36 0
	movl	-52(%rbp), %eax	# val, tmp124
	movb	%al, -32(%rbp)	# D.1941, r.rgb.r
	.loc 1 37 0
	movl	-52(%rbp), %eax	# val, tmp125
	movb	%al, -31(%rbp)	# D.1941, r.rgb.g
	.loc 1 38 0
	movl	-52(%rbp), %eax	# val, tmp126
	movb	%al, -30(%rbp)	# D.1941, r.rgb.b
	jmp	.L3	#
.L2:
.LBB2:
	.loc 1 41 0
	movl	-48(%rbp), %eax	# isat, tmp127
	imull	-52(%rbp), %eax	# val, D.1943
	leal	255(%rax), %edx	#, tmp129
	testl	%eax, %eax	# tmp128
	cmovs	%edx, %eax	# tmp129,, tmp128
	sarl	$8, %eax	#, tmp130
	movl	%eax, -44(%rbp)	# tmp130, base
	.loc 1 44 0
	movl	-56(%rbp), %ecx	# hue, tmp132
	movl	$-2004318071, %edx	#, tmp134
	movl	%ecx, %eax	# tmp132, tmp198
	imull	%edx	# tmp134
	leal	(%rdx,%rcx), %eax	#, tmp135
	sarl	$5, %eax	#, tmp136
	movl	%eax, %edx	# tmp136, tmp136
	movl	%ecx, %eax	# tmp132, tmp137
	sarl	$31, %eax	#, tmp137
	subl	%eax, %edx	# tmp137, tmp131
	movl	%edx, %eax	# tmp131, tmp131
	movl	%eax, -40(%rbp)	# tmp131, sector
	.loc 1 45 0
	movl	-56(%rbp), %ecx	# hue, tmp139
	movl	$-2004318071, %edx	#, tmp141
	movl	%ecx, %eax	# tmp139, tmp199
	imull	%edx	# tmp141
	leal	(%rdx,%rcx), %eax	#, tmp142
	sarl	$5, %eax	#, tmp143
	movl	%eax, %edx	# tmp143, tmp143
	movl	%ecx, %eax	# tmp139, tmp144
	sarl	$31, %eax	#, tmp144
	subl	%eax, %edx	# tmp144, tmp138
	movl	%edx, %eax	# tmp138, tmp138
	movl	%eax, %edx	# tmp138, tmp145
	leal	0(,%rdx,4), %eax	#, tmp146
	movl	%eax, %edx	# tmp146, tmp145
	movl	%edx, %eax	# tmp145, tmp147
	sall	$4, %eax	#, tmp147
	subl	%edx, %eax	# tmp145, tmp147
	subl	%eax, %ecx	# tmp147, tmp148
	movl	%ecx, %eax	# tmp148, tmp148
	movl	%eax, -56(%rbp)	# tmp148, hue
	.loc 1 46 0
	movl	-40(%rbp), %eax	# sector, D.1944
	andl	$1, %eax	#, D.1944
	testl	%eax, %eax	# D.1944
	je	.L4	#,
	.loc 1 47 0
	movl	$60, %eax	#, tmp152
	subl	-56(%rbp), %eax	# hue, tmp151
	movl	%eax, -56(%rbp)	# tmp151, hue
.L4:
	.loc 1 48 0
	movl	-52(%rbp), %eax	# val, tmp153
	subl	-44(%rbp), %eax	# base, D.1943
	imull	-56(%rbp), %eax	# hue, D.1943
	movl	%eax, %ecx	# D.1943, D.1943
	movl	$-2004318071, %edx	#, tmp155
	movl	%ecx, %eax	# D.1943, tmp200
	imull	%edx	# tmp155
	leal	(%rdx,%rcx), %eax	#, tmp156
	sarl	$5, %eax	#, tmp157
	movl	%eax, %edx	# tmp157, tmp157
	movl	%ecx, %eax	# D.1943, tmp158
	sarl	$31, %eax	#, tmp158
	subl	%eax, %edx	# tmp158, D.1943
	movl	-44(%rbp), %eax	# base, tmp162
	addl	%edx, %eax	# D.1943, tmp161
	movl	%eax, -36(%rbp)	# tmp161, itp
	.loc 1 50 0
	cmpl	$5, -40(%rbp)	#, sector
	ja	.L3	#,
	movl	-40(%rbp), %eax	# sector, tmp163
	movq	.L6(,%rax,8), %rax	#, tmp164
	jmp	*%rax	# tmp164
	.section	.rodata.hsvToRgb24,"a",@progbits
	.align 8
	.align 4
.L6:
	.quad	.L5
	.quad	.L7
	.quad	.L8
	.quad	.L9
	.quad	.L10
	.quad	.L11
	.section	.text.hsvToRgb24
.L5:
	.loc 1 52 0
	movl	-52(%rbp), %eax	# val, tmp165
	movb	%al, -32(%rbp)	# D.1941, r.rgb.r
	.loc 1 53 0
	movl	-36(%rbp), %eax	# itp, tmp166
	movb	%al, -31(%rbp)	# D.1941, r.rgb.g
	.loc 1 54 0
	movl	-44(%rbp), %eax	# base, tmp167
	movb	%al, -30(%rbp)	# D.1941, r.rgb.b
	.loc 1 55 0
	jmp	.L3	#
.L7:
	.loc 1 58 0
	movl	-36(%rbp), %eax	# itp, tmp168
	movb	%al, -32(%rbp)	# D.1941, r.rgb.r
	.loc 1 59 0
	movl	-52(%rbp), %eax	# val, tmp169
	movb	%al, -31(%rbp)	# D.1941, r.rgb.g
	.loc 1 60 0
	movl	-44(%rbp), %eax	# base, tmp170
	movb	%al, -30(%rbp)	# D.1941, r.rgb.b
	.loc 1 61 0
	jmp	.L3	#
.L8:
	.loc 1 64 0
	movl	-44(%rbp), %eax	# base, tmp171
	movb	%al, -32(%rbp)	# D.1941, r.rgb.r
	.loc 1 65 0
	movl	-52(%rbp), %eax	# val, tmp172
	movb	%al, -31(%rbp)	# D.1941, r.rgb.g
	.loc 1 66 0
	movl	-36(%rbp), %eax	# itp, tmp173
	movb	%al, -30(%rbp)	# D.1941, r.rgb.b
	.loc 1 67 0
	jmp	.L3	#
.L9:
	.loc 1 70 0
	movl	-44(%rbp), %eax	# base, tmp174
	movb	%al, -32(%rbp)	# D.1941, r.rgb.r
	.loc 1 71 0
	movl	-36(%rbp), %eax	# itp, tmp175
	movb	%al, -31(%rbp)	# D.1941, r.rgb.g
	.loc 1 72 0
	movl	-52(%rbp), %eax	# val, tmp176
	movb	%al, -30(%rbp)	# D.1941, r.rgb.b
	.loc 1 73 0
	jmp	.L3	#
.L10:
	.loc 1 76 0
	movl	-36(%rbp), %eax	# itp, tmp177
	movb	%al, -32(%rbp)	# D.1941, r.rgb.r
	.loc 1 77 0
	movl	-44(%rbp), %eax	# base, tmp178
	movb	%al, -31(%rbp)	# D.1941, r.rgb.g
	.loc 1 78 0
	movl	-52(%rbp), %eax	# val, tmp179
	movb	%al, -30(%rbp)	# D.1941, r.rgb.b
	.loc 1 79 0
	jmp	.L3	#
.L11:
	.loc 1 82 0
	movl	-52(%rbp), %eax	# val, tmp180
	movb	%al, -32(%rbp)	# D.1941, r.rgb.r
	.loc 1 83 0
	movl	-44(%rbp), %eax	# base, tmp181
	movb	%al, -31(%rbp)	# D.1941, r.rgb.g
	.loc 1 84 0
	movl	-36(%rbp), %eax	# itp, tmp182
	movb	%al, -30(%rbp)	# D.1941, r.rgb.b
	.loc 1 85 0
	nop
.L3:
.LBE2:
	.loc 1 88 0
	movzwl	-32(%rbp), %eax	# r, tmp183
	movw	%ax, -16(%rbp)	# tmp183, D.1937
	movzbl	-30(%rbp), %eax	# r, tmp184
	movb	%al, -14(%rbp)	# tmp184, D.1937
	movl	$0, %eax	#, tmp185
	movzbl	-16(%rbp), %edx	# D.1937, tmp186
	movzbl	%dl, %edx	# tmp186, tmp187
	movb	$0, %al	#, tmp188
	orq	%rdx, %rax	# tmp187, tmp189
	movzbl	-15(%rbp), %edx	# D.1937, tmp190
	movb	%dl, %ah	# tmp190, tmp185
	movzbl	-14(%rbp), %edx	# D.1937, tmp191
	movzbl	%dl, %edx	# tmp191, tmp192
	salq	$16, %rdx	#, tmp193
	andq	$-16711681, %rax	#, tmp194
	orq	%rdx, %rax	# tmp193, tmp195
	.loc 1 89 0
	movq	-8(%rbp), %rsi	# D.1945, tmp201
	xorq	%fs:40, %rsi	#, tmp201
	je	.L13	#,
	call	__stack_chk_fail	#
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	hsvToRgb24, .-hsvToRgb24
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "src/main/common/color.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1c0
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF15
	.byte	0xc
	.long	.LASF16
	.long	.LASF17
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
	.byte	0x2
	.byte	0x30
	.long	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x2
	.byte	0x31
	.long	0x62
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.byte	0x3
	.byte	0x3
	.byte	0x1e
	.long	0x9e
	.uleb128 0x6
	.string	"r"
	.byte	0x3
	.byte	0x1f
	.long	0x45
	.byte	0
	.uleb128 0x6
	.string	"g"
	.byte	0x3
	.byte	0x20
	.long	0x45
	.byte	0x1
	.uleb128 0x6
	.string	"b"
	.byte	0x3
	.byte	0x21
	.long	0x45
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.byte	0x3
	.byte	0x3
	.byte	0x1d
	.long	0xbd
	.uleb128 0x8
	.string	"rgb"
	.byte	0x3
	.byte	0x22
	.long	0x77
	.uleb128 0x8
	.string	"raw"
	.byte	0x3
	.byte	0x23
	.long	0xbd
	.byte	0
	.uleb128 0x9
	.long	0x45
	.long	0xcd
	.uleb128 0xa
	.long	0xcd
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x24
	.long	0x9e
	.uleb128 0xb
	.long	.LASF18
	.byte	0x4
	.byte	0x3
	.byte	0x32
	.long	0x10a
	.uleb128 0x6
	.string	"h"
	.byte	0x3
	.byte	0x33
	.long	0x57
	.byte	0
	.uleb128 0x6
	.string	"s"
	.byte	0x3
	.byte	0x34
	.long	0x45
	.byte	0x2
	.uleb128 0x6
	.string	"v"
	.byte	0x3
	.byte	0x35
	.long	0x45
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x36
	.long	0xdf
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.byte	0x1b
	.long	0xd4
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b8
	.uleb128 0xd
	.string	"c"
	.byte	0x1
	.byte	0x1b
	.long	0x1b8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xe
	.string	"r"
	.byte	0x1
	.byte	0x1d
	.long	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.string	"val"
	.byte	0x1
	.byte	0x1f
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xf
	.long	.LASF12
	.byte	0x1
	.byte	0x20
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xe
	.string	"hue"
	.byte	0x1
	.byte	0x21
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x10
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xf
	.long	.LASF13
	.byte	0x1
	.byte	0x29
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xf
	.long	.LASF14
	.byte	0x1
	.byte	0x2c
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.string	"itp"
	.byte	0x1
	.byte	0x30
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.long	0x1be
	.uleb128 0x12
	.long	0x10a
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
	.uleb128 0x13
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
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
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB0
	.quad	.LFE0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"hsvColor_s"
.LASF10:
	.string	"rgbColor24bpp_t"
.LASF14:
	.string	"sector"
.LASF11:
	.string	"hsvColor_t"
.LASF3:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF15:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF17:
	.string	"/home/aravind/git/cleanflight"
.LASF19:
	.string	"hsvToRgb24"
.LASF13:
	.string	"base"
.LASF7:
	.string	"unsigned int"
.LASF16:
	.string	"src/main/common/colorconversion.c"
.LASF4:
	.string	"uint8_t"
.LASF9:
	.string	"sizetype"
.LASF12:
	.string	"isat"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF2:
	.string	"long int"
.LASF0:
	.string	"signed char"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
