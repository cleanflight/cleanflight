	.file	"streambuf.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed streambuf.i -mtune=generic -march=x86-64
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
	.section	.text.sbufWriteU8,"ax",@progbits
	.globl	sbufWriteU8
	.type	sbufWriteU8, @function
sbufWriteU8:
.LFB0:
	.file 1 "src/main/common/streambuf.c"
	.loc 1 24 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# dst, dst
	movl	%esi, %eax	# val, tmp89
	movb	%al, -12(%rbp)	# tmp89, val
	.loc 1 25 0
	movq	-8(%rbp), %rax	# dst, tmp90
	movq	(%rax), %rax	# dst_2(D)->ptr, D.2201
	leaq	1(%rax), %rcx	#, D.2201
	movq	-8(%rbp), %rdx	# dst, tmp91
	movq	%rcx, (%rdx)	# D.2201, dst_2(D)->ptr
	movzbl	-12(%rbp), %edx	# val, tmp92
	movb	%dl, (%rax)	# tmp92, *_4
	.loc 1 26 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sbufWriteU8, .-sbufWriteU8
	.section	.text.sbufWriteU16,"ax",@progbits
	.globl	sbufWriteU16
	.type	sbufWriteU16, @function
sbufWriteU16:
.LFB1:
	.loc 1 29 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# dst, dst
	movl	%esi, %eax	# val, tmp92
	movw	%ax, -12(%rbp)	# tmp92, val
	.loc 1 30 0
	movzwl	-12(%rbp), %eax	# val, tmp93
	movzbl	%al, %edx	# D.2202, D.2203
	movq	-8(%rbp), %rax	# dst, tmp94
	movl	%edx, %esi	# D.2203,
	movq	%rax, %rdi	# tmp94,
	call	sbufWriteU8	#
	.loc 1 31 0
	movzwl	-12(%rbp), %eax	# val, tmp95
	shrw	$8, %ax	#, D.2204
	movzbl	%al, %edx	# D.2202, D.2203
	movq	-8(%rbp), %rax	# dst, tmp96
	movl	%edx, %esi	# D.2203,
	movq	%rax, %rdi	# tmp96,
	call	sbufWriteU8	#
	.loc 1 32 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	sbufWriteU16, .-sbufWriteU16
	.section	.text.sbufWriteU32,"ax",@progbits
	.globl	sbufWriteU32
	.type	sbufWriteU32, @function
sbufWriteU32:
.LFB2:
	.loc 1 35 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# dst, dst
	movl	%esi, -12(%rbp)	# val, val
	.loc 1 36 0
	movl	-12(%rbp), %eax	# val, tmp98
	movzbl	%al, %edx	# D.2205, D.2206
	movq	-8(%rbp), %rax	# dst, tmp99
	movl	%edx, %esi	# D.2206,
	movq	%rax, %rdi	# tmp99,
	call	sbufWriteU8	#
	.loc 1 37 0
	movl	-12(%rbp), %eax	# val, tmp100
	shrl	$8, %eax	#, D.2207
	movzbl	%al, %edx	# D.2205, D.2206
	movq	-8(%rbp), %rax	# dst, tmp101
	movl	%edx, %esi	# D.2206,
	movq	%rax, %rdi	# tmp101,
	call	sbufWriteU8	#
	.loc 1 38 0
	movl	-12(%rbp), %eax	# val, tmp102
	shrl	$16, %eax	#, D.2207
	movzbl	%al, %edx	# D.2205, D.2206
	movq	-8(%rbp), %rax	# dst, tmp103
	movl	%edx, %esi	# D.2206,
	movq	%rax, %rdi	# tmp103,
	call	sbufWriteU8	#
	.loc 1 39 0
	movl	-12(%rbp), %eax	# val, tmp104
	shrl	$24, %eax	#, D.2207
	movzbl	%al, %edx	# D.2205, D.2206
	movq	-8(%rbp), %rax	# dst, tmp105
	movl	%edx, %esi	# D.2206,
	movq	%rax, %rdi	# tmp105,
	call	sbufWriteU8	#
	.loc 1 40 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	sbufWriteU32, .-sbufWriteU32
	.section	.text.sbufWriteData,"ax",@progbits
	.globl	sbufWriteData
	.type	sbufWriteData, @function
sbufWriteData:
.LFB3:
	.loc 1 43 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# dst, dst
	movq	%rsi, -16(%rbp)	# data, data
	movl	%edx, -20(%rbp)	# len, len
	.loc 1 44 0
	movl	-20(%rbp), %eax	# len, tmp92
	movslq	%eax, %rdx	# tmp92, D.2208
	movq	-8(%rbp), %rax	# dst, tmp93
	movq	(%rax), %rax	# dst_4(D)->ptr, D.2209
	movq	-16(%rbp), %rcx	# data, tmp94
	movq	%rcx, %rsi	# tmp94,
	movq	%rax, %rdi	# D.2209,
	call	memcpy	#
	.loc 1 45 0
	movq	-8(%rbp), %rax	# dst, tmp95
	movq	(%rax), %rdx	# dst_4(D)->ptr, D.2209
	movl	-20(%rbp), %eax	# len, tmp96
	cltq
	addq	%rax, %rdx	# D.2210, D.2209
	movq	-8(%rbp), %rax	# dst, tmp97
	movq	%rdx, (%rax)	# D.2209, dst_4(D)->ptr
	.loc 1 46 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	sbufWriteData, .-sbufWriteData
	.section	.text.sbufWriteString,"ax",@progbits
	.globl	sbufWriteString
	.type	sbufWriteString, @function
sbufWriteString:
.LFB4:
	.loc 1 49 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# dst, dst
	movq	%rsi, -16(%rbp)	# string, string
	.loc 1 50 0
	movq	-16(%rbp), %rax	# string, tmp89
	movq	%rax, %rdi	# tmp89,
	call	strlen	#
	movl	%eax, %edx	# D.2211, D.2212
	movq	-16(%rbp), %rcx	# string, tmp90
	movq	-8(%rbp), %rax	# dst, tmp91
	movq	%rcx, %rsi	# tmp90,
	movq	%rax, %rdi	# tmp91,
	call	sbufWriteData	#
	.loc 1 51 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sbufWriteString, .-sbufWriteString
	.section	.text.sbufReadU8,"ax",@progbits
	.globl	sbufReadU8
	.type	sbufReadU8, @function
sbufReadU8:
.LFB5:
	.loc 1 54 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# src, src
	.loc 1 55 0
	movq	-8(%rbp), %rax	# src, tmp91
	movq	(%rax), %rax	# src_2(D)->ptr, D.2213
	leaq	1(%rax), %rcx	#, D.2213
	movq	-8(%rbp), %rdx	# src, tmp92
	movq	%rcx, (%rdx)	# D.2213, src_2(D)->ptr
	movzbl	(%rax), %eax	# *_4, D.2214
	.loc 1 56 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	sbufReadU8, .-sbufReadU8
	.section	.text.sbufReadU16,"ax",@progbits
	.globl	sbufReadU16
	.type	sbufReadU16, @function
sbufReadU16:
.LFB6:
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movq	%rdi, -24(%rbp)	# src, src
	.loc 1 61 0
	movq	-24(%rbp), %rax	# src, tmp96
	movq	%rax, %rdi	# tmp96,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.2215, tmp97
	movw	%ax, -2(%rbp)	# tmp97, ret
	.loc 1 62 0
	movq	-24(%rbp), %rax	# src, tmp98
	movq	%rax, %rdi	# tmp98,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.2215, D.2216
	sall	$8, %eax	#, D.2216
	movl	%eax, %edx	# D.2216, D.2217
	movzwl	-2(%rbp), %eax	# ret, D.2217
	orl	%edx, %eax	# D.2217, D.2217
	movw	%ax, -2(%rbp)	# D.2217, ret
	.loc 1 63 0
	movzwl	-2(%rbp), %eax	# ret, D.2218
	.loc 1 64 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	sbufReadU16, .-sbufReadU16
	.section	.text.sbufReadU32,"ax",@progbits
	.globl	sbufReadU32
	.type	sbufReadU32, @function
sbufReadU32:
.LFB7:
	.loc 1 67 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movq	%rdi, -24(%rbp)	# src, src
	.loc 1 69 0
	movq	-24(%rbp), %rax	# src, tmp102
	movq	%rax, %rdi	# tmp102,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.2219, tmp103
	movl	%eax, -4(%rbp)	# tmp103, ret
	.loc 1 70 0
	movq	-24(%rbp), %rax	# src, tmp104
	movq	%rax, %rdi	# tmp104,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.2219, D.2220
	sall	$8, %eax	#, D.2220
	orl	%eax, -4(%rbp)	# D.2221, ret
	.loc 1 71 0
	movq	-24(%rbp), %rax	# src, tmp105
	movq	%rax, %rdi	# tmp105,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.2219, D.2220
	sall	$16, %eax	#, D.2220
	orl	%eax, -4(%rbp)	# D.2221, ret
	.loc 1 72 0
	movq	-24(%rbp), %rax	# src, tmp106
	movq	%rax, %rdi	# tmp106,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.2219, D.2220
	sall	$24, %eax	#, D.2220
	orl	%eax, -4(%rbp)	# D.2221, ret
	.loc 1 73 0
	movl	-4(%rbp), %eax	# ret, D.2222
	.loc 1 74 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	sbufReadU32, .-sbufReadU32
	.section	.text.sbufReadData,"ax",@progbits
	.globl	sbufReadData
	.type	sbufReadData, @function
sbufReadData:
.LFB8:
	.loc 1 77 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# src, src
	movq	%rsi, -16(%rbp)	# data, data
	movl	%edx, -20(%rbp)	# len, len
	.loc 1 78 0
	movl	-20(%rbp), %eax	# len, tmp89
	movslq	%eax, %rdx	# tmp89, D.2223
	movq	-8(%rbp), %rax	# src, tmp90
	movq	(%rax), %rcx	# src_4(D)->ptr, D.2224
	movq	-16(%rbp), %rax	# data, tmp91
	movq	%rcx, %rsi	# D.2224,
	movq	%rax, %rdi	# tmp91,
	call	memcpy	#
	.loc 1 79 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	sbufReadData, .-sbufReadData
	.section	.text.sbufBytesRemaining,"ax",@progbits
	.globl	sbufBytesRemaining
	.type	sbufBytesRemaining, @function
sbufBytesRemaining:
.LFB9:
	.loc 1 84 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# buf, buf
	.loc 1 85 0
	movq	-8(%rbp), %rax	# buf, tmp94
	movq	8(%rax), %rax	# buf_2(D)->end, D.2225
	movq	%rax, %rdx	# D.2225, D.2226
	movq	-8(%rbp), %rax	# buf, tmp95
	movq	(%rax), %rax	# buf_2(D)->ptr, D.2225
	subq	%rax, %rdx	# D.2226, D.2226
	movq	%rdx, %rax	# D.2226, D.2226
	.loc 1 86 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	sbufBytesRemaining, .-sbufBytesRemaining
	.section	.text.sbufPtr,"ax",@progbits
	.globl	sbufPtr
	.type	sbufPtr, @function
sbufPtr:
.LFB10:
	.loc 1 89 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# buf, buf
	.loc 1 90 0
	movq	-8(%rbp), %rax	# buf, tmp89
	movq	(%rax), %rax	# buf_2(D)->ptr, D.2228
	.loc 1 91 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	sbufPtr, .-sbufPtr
	.section	.text.sbufAdvance,"ax",@progbits
	.globl	sbufAdvance
	.type	sbufAdvance, @function
sbufAdvance:
.LFB11:
	.loc 1 97 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# buf, buf
	movl	%esi, -12(%rbp)	# size, size
	.loc 1 98 0
	movq	-8(%rbp), %rax	# buf, tmp90
	movq	(%rax), %rdx	# buf_2(D)->ptr, D.2229
	movl	-12(%rbp), %eax	# size, tmp91
	cltq
	addq	%rax, %rdx	# D.2230, D.2229
	movq	-8(%rbp), %rax	# buf, tmp92
	movq	%rdx, (%rax)	# D.2229, buf_2(D)->ptr
	.loc 1 99 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	sbufAdvance, .-sbufAdvance
	.section	.text.sbufSwitchToReader,"ax",@progbits
	.globl	sbufSwitchToReader
	.type	sbufSwitchToReader, @function
sbufSwitchToReader:
.LFB12:
	.loc 1 103 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# buf, buf
	movq	%rsi, -16(%rbp)	# base, base
	.loc 1 104 0
	movq	-8(%rbp), %rax	# buf, tmp88
	movq	(%rax), %rdx	# buf_2(D)->ptr, D.2231
	movq	-8(%rbp), %rax	# buf, tmp89
	movq	%rdx, 8(%rax)	# D.2231, buf_2(D)->end
	.loc 1 105 0
	movq	-8(%rbp), %rax	# buf, tmp90
	movq	-16(%rbp), %rdx	# base, tmp91
	movq	%rdx, (%rax)	# tmp91, buf_2(D)->ptr
	.loc 1 106 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	sbufSwitchToReader, .-sbufSwitchToReader
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "src/main/common/streambuf.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3d5
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF507
	.byte	0xc
	.long	.LASF508
	.long	.LASF509
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF478
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF479
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF480
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x8
	.long	0x56
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF481
	.uleb128 0x5
	.long	0x4f
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF482
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF483
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF484
	.uleb128 0x6
	.long	.LASF486
	.byte	0x2
	.byte	0x30
	.long	0x7b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF485
	.uleb128 0x6
	.long	.LASF487
	.byte	0x2
	.byte	0x31
	.long	0x3b
	.uleb128 0x6
	.long	.LASF488
	.byte	0x2
	.byte	0x33
	.long	0x98
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF489
	.uleb128 0x7
	.long	.LASF510
	.byte	0x10
	.byte	0x3
	.byte	0x19
	.long	0xc4
	.uleb128 0x8
	.string	"ptr"
	.byte	0x3
	.byte	0x1a
	.long	0xc4
	.byte	0
	.uleb128 0x8
	.string	"end"
	.byte	0x3
	.byte	0x1b
	.long	0xc4
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x70
	.uleb128 0x6
	.long	.LASF490
	.byte	0x3
	.byte	0x1c
	.long	0x9f
	.uleb128 0x9
	.long	.LASF491
	.byte	0x1
	.byte	0x17
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x10f
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x17
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"val"
	.byte	0x1
	.byte	0x17
	.long	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0xca
	.uleb128 0xb
	.long	.LASF492
	.byte	0x1
	.byte	0x1c
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x14f
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x1c
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"val"
	.byte	0x1
	.byte	0x1c
	.long	0x82
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xb
	.long	.LASF493
	.byte	0x1
	.byte	0x22
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x189
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x22
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"val"
	.byte	0x1
	.byte	0x22
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xb
	.long	.LASF494
	.byte	0x1
	.byte	0x2a
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d1
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x2a
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF495
	.byte	0x1
	.byte	0x2a
	.long	0x1d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.string	"len"
	.byte	0x1
	.byte	0x2a
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x1d7
	.uleb128 0xd
	.uleb128 0xb
	.long	.LASF496
	.byte	0x1
	.byte	0x30
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x212
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x30
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF497
	.byte	0x1
	.byte	0x30
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xe
	.long	.LASF498
	.byte	0x1
	.byte	0x35
	.long	0x70
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x242
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x35
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.long	.LASF499
	.byte	0x1
	.byte	0x3a
	.long	0x82
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x280
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x3a
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.string	"ret"
	.byte	0x1
	.byte	0x3c
	.long	0x82
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xf
	.long	.LASF500
	.byte	0x1
	.byte	0x42
	.long	0x8d
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x2be
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x42
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.string	"ret"
	.byte	0x1
	.byte	0x44
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.long	.LASF501
	.byte	0x1
	.byte	0x4c
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x306
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x4c
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF495
	.byte	0x1
	.byte	0x4c
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.string	"len"
	.byte	0x1
	.byte	0x4c
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.uleb128 0xe
	.long	.LASF502
	.byte	0x1
	.byte	0x53
	.long	0x42
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x338
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x53
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	.LASF503
	.byte	0x1
	.byte	0x58
	.long	0xc4
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x368
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x58
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.long	.LASF504
	.byte	0x1
	.byte	0x60
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x3a2
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x60
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF505
	.byte	0x1
	.byte	0x60
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x12
	.long	.LASF511
	.byte	0x1
	.byte	0x66
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x66
	.long	0x10f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF506
	.byte	0x1
	.byte	0x66
	.long	0xc4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0xec
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.quad	.LFB9
	.quad	.LFE9-.LFB9
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
	.quad	.LFB0
	.quad	.LFE0
	.quad	.LFB1
	.quad	.LFE1
	.quad	.LFB2
	.quad	.LFE2
	.quad	.LFB3
	.quad	.LFE3
	.quad	.LFB4
	.quad	.LFE4
	.quad	.LFB5
	.quad	.LFE5
	.quad	.LFB6
	.quad	.LFE6
	.quad	.LFB7
	.quad	.LFE7
	.quad	.LFB8
	.quad	.LFE8
	.quad	.LFB9
	.quad	.LFE9
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB11
	.quad	.LFE11
	.quad	.LFB12
	.quad	.LFE12
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
	.file 4 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 5 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x17
	.long	.LASF254
	.file 6 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro2
	.file 7 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro3
	.file 8 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 9 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0x9
	.file 10 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro7
	.file 11 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 12 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x15
	.long	.LASF408
	.byte	0x4
	.byte	0x4
	.file 13 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xd
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF409
	.file 14 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF477
	.byte	0x4
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x3
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
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8a17512e4762abcff59e629b80463c10,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF255
	.byte	0x6
	.uleb128 0x61
	.long	.LASF256
	.byte	0x6
	.uleb128 0x62
	.long	.LASF257
	.byte	0x6
	.uleb128 0x63
	.long	.LASF258
	.byte	0x6
	.uleb128 0x64
	.long	.LASF259
	.byte	0x6
	.uleb128 0x65
	.long	.LASF260
	.byte	0x6
	.uleb128 0x66
	.long	.LASF261
	.byte	0x6
	.uleb128 0x67
	.long	.LASF262
	.byte	0x6
	.uleb128 0x68
	.long	.LASF263
	.byte	0x6
	.uleb128 0x69
	.long	.LASF264
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF265
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF266
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF267
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF268
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF269
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF270
	.byte	0x6
	.uleb128 0x70
	.long	.LASF271
	.byte	0x6
	.uleb128 0x71
	.long	.LASF272
	.byte	0x6
	.uleb128 0x72
	.long	.LASF273
	.byte	0x6
	.uleb128 0x73
	.long	.LASF274
	.byte	0x6
	.uleb128 0x74
	.long	.LASF275
	.byte	0x6
	.uleb128 0x75
	.long	.LASF276
	.byte	0x6
	.uleb128 0x76
	.long	.LASF277
	.byte	0x6
	.uleb128 0x77
	.long	.LASF278
	.byte	0x6
	.uleb128 0x78
	.long	.LASF279
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF280
	.byte	0x5
	.uleb128 0x88
	.long	.LASF281
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF282
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF283
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF284
	.byte	0x5
	.uleb128 0xce
	.long	.LASF285
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF286
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF287
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF288
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF289
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF290
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF291
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF292
	.byte	0x5
	.uleb128 0x101
	.long	.LASF293
	.byte	0x5
	.uleb128 0x105
	.long	.LASF294
	.byte	0x5
	.uleb128 0x109
	.long	.LASF295
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF258
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF285
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF257
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF284
	.byte	0x5
	.uleb128 0x111
	.long	.LASF296
	.byte	0x6
	.uleb128 0x112
	.long	.LASF297
	.byte	0x5
	.uleb128 0x113
	.long	.LASF298
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF299
	.byte	0x5
	.uleb128 0x141
	.long	.LASF300
	.byte	0x5
	.uleb128 0x154
	.long	.LASF301
	.byte	0x6
	.uleb128 0x161
	.long	.LASF302
	.byte	0x5
	.uleb128 0x162
	.long	.LASF303
	.byte	0x5
	.uleb128 0x166
	.long	.LASF304
	.byte	0x5
	.uleb128 0x167
	.long	.LASF305
	.byte	0x5
	.uleb128 0x169
	.long	.LASF306
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF307
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF308
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF309
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF310
	.byte	0x5
	.uleb128 0x37
	.long	.LASF311
	.byte	0x5
	.uleb128 0x38
	.long	.LASF312
	.byte	0x5
	.uleb128 0x39
	.long	.LASF313
	.byte	0x5
	.uleb128 0x52
	.long	.LASF314
	.byte	0x5
	.uleb128 0x53
	.long	.LASF315
	.byte	0x5
	.uleb128 0x58
	.long	.LASF316
	.byte	0x5
	.uleb128 0x59
	.long	.LASF317
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF318
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF319
	.byte	0x5
	.uleb128 0x65
	.long	.LASF320
	.byte	0x5
	.uleb128 0x66
	.long	.LASF321
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF322
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF323
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF324
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF325
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF326
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF327
	.byte	0x5
	.uleb128 0x84
	.long	.LASF328
	.byte	0x5
	.uleb128 0x85
	.long	.LASF329
	.byte	0x5
	.uleb128 0x88
	.long	.LASF330
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF331
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF332
	.byte	0x5
	.uleb128 0x96
	.long	.LASF333
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF334
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF335
	.byte	0x5
	.uleb128 0xba
	.long	.LASF336
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF337
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF338
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF339
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF340
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF341
	.byte	0x5
	.uleb128 0xec
	.long	.LASF342
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF343
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF344
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF345
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF346
	.byte	0x5
	.uleb128 0x114
	.long	.LASF347
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF348
	.byte	0x5
	.uleb128 0x125
	.long	.LASF349
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF350
	.byte	0x5
	.uleb128 0x133
	.long	.LASF351
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF352
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF353
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF354
	.byte	0x5
	.uleb128 0x157
	.long	.LASF355
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF356
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF357
	.byte	0x5
	.uleb128 0x172
	.long	.LASF358
	.byte	0x5
	.uleb128 0x181
	.long	.LASF359
	.byte	0x5
	.uleb128 0x182
	.long	.LASF360
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF361
	.byte	0x5
	.uleb128 0xa
	.long	.LASF362
	.byte	0x5
	.uleb128 0xc
	.long	.LASF363
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF364
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF365
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF366
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF367
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF368
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF369
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF370
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF371
	.byte	0x5
	.uleb128 0xb
	.long	.LASF372
	.byte	0x5
	.uleb128 0xc
	.long	.LASF373
	.byte	0x5
	.uleb128 0xd
	.long	.LASF374
	.byte	0x5
	.uleb128 0xe
	.long	.LASF375
	.byte	0x5
	.uleb128 0xf
	.long	.LASF376
	.byte	0x5
	.uleb128 0x10
	.long	.LASF377
	.byte	0x5
	.uleb128 0x11
	.long	.LASF378
	.byte	0x5
	.uleb128 0x12
	.long	.LASF379
	.byte	0x5
	.uleb128 0x13
	.long	.LASF380
	.byte	0x5
	.uleb128 0x14
	.long	.LASF381
	.byte	0x5
	.uleb128 0x15
	.long	.LASF382
	.byte	0x5
	.uleb128 0x16
	.long	.LASF383
	.byte	0x5
	.uleb128 0x17
	.long	.LASF384
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.30.22986d42631c138e09c46135db8750fc,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF385
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.2ff233552538c6ff9b8575ca8ea52cb3,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF387
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF388
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF389
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF390
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF391
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF392
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF393
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF394
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF395
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF396
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF397
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF398
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF399
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF400
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF401
	.byte	0x5
	.uleb128 0xca
	.long	.LASF402
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF403
	.byte	0x6
	.uleb128 0xee
	.long	.LASF404
	.byte	0x6
	.uleb128 0x191
	.long	.LASF405
	.byte	0x5
	.uleb128 0x196
	.long	.LASF406
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF407
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF410
	.byte	0x5
	.uleb128 0x22
	.long	.LASF411
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF412
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF413
	.byte	0x5
	.uleb128 0x34
	.long	.LASF414
	.byte	0x5
	.uleb128 0x78
	.long	.LASF415
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF416
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF417
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF418
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF419
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF420
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF421
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF422
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF423
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF424
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF425
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF426
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF427
	.byte	0x5
	.uleb128 0xad
	.long	.LASF428
	.byte	0x5
	.uleb128 0xae
	.long	.LASF429
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF430
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF431
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF432
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF433
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF434
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF435
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF436
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF437
	.byte	0x5
	.uleb128 0xba
	.long	.LASF438
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF439
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF440
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF441
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF442
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF443
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF444
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF445
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF446
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF447
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF448
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF449
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF450
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF451
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF452
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF453
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF454
	.byte	0x5
	.uleb128 0xec
	.long	.LASF455
	.byte	0x5
	.uleb128 0xee
	.long	.LASF456
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF457
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF458
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF459
	.byte	0x5
	.uleb128 0x100
	.long	.LASF460
	.byte	0x5
	.uleb128 0x101
	.long	.LASF461
	.byte	0x5
	.uleb128 0x105
	.long	.LASF462
	.byte	0x5
	.uleb128 0x111
	.long	.LASF463
	.byte	0x5
	.uleb128 0x112
	.long	.LASF464
	.byte	0x5
	.uleb128 0x116
	.long	.LASF465
	.byte	0x5
	.uleb128 0x117
	.long	.LASF466
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF467
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF468
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF469
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF470
	.byte	0x5
	.uleb128 0x124
	.long	.LASF471
	.byte	0x5
	.uleb128 0x125
	.long	.LASF472
	.byte	0x5
	.uleb128 0x126
	.long	.LASF473
	.byte	0x5
	.uleb128 0x128
	.long	.LASF474
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF475
	.byte	0x5
	.uleb128 0x130
	.long	.LASF476
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF394:
	.string	"_SIZE_T_ "
.LASF259:
	.string	"__USE_ISOCXX11"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF415:
	.string	"__intptr_t_defined "
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF450:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF409:
	.string	"_STDINT_H 1"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF333:
	.string	"__flexarr []"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF352:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF271:
	.string	"__USE_LARGEFILE"
.LASF339:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF446:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF507:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF419:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF412:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF281:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF389:
	.string	"_SIZE_T "
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF365:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF489:
	.string	"unsigned int"
.LASF306:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF386:
	.string	"__need_NULL "
.LASF287:
	.string	"_POSIX_SOURCE"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF413:
	.string	"__int8_t_defined "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF426:
	.string	"UINT32_MAX (4294967295U)"
.LASF5:
	.string	"__GNUC__ 5"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF382:
	.string	"__stub_sigreturn "
.LASF393:
	.string	"__SIZE_T "
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF302:
	.string	"__GNU_LIBRARY__"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF372:
	.string	"__stub_chflags "
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF359:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF374:
	.string	"__stub_fchflags "
.LASF432:
	.string	"INT_LEAST8_MAX (127)"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF399:
	.string	"_SIZE_T_DECLARED "
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF322:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF285:
	.string	"__USE_ISOC95 1"
.LASF324:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF318:
	.string	"__ptr_t void *"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF237:
	.string	"linux 1"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF496:
	.string	"sbufWriteString"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF437:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF421:
	.string	"INT16_MAX (32767)"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF459:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF266:
	.string	"__USE_UNIX98"
.LASF301:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF297:
	.string	"_ATFILE_SOURCE"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF313:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF468:
	.string	"INT16_C(c) c"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF392:
	.string	"_T_SIZE "
.LASF434:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF493:
	.string	"sbufWriteU32"
.LASF298:
	.string	"_ATFILE_SOURCE 1"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF311:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF391:
	.string	"_T_SIZE_ "
.LASF488:
	.string	"uint32_t"
.LASF477:
	.string	"_GCC_WRAP_STDINT_H "
.LASF398:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF435:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF353:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF401:
	.string	"_GCC_SIZE_T "
.LASF239:
	.string	"__unix__ 1"
.LASF303:
	.string	"__GNU_LIBRARY__ 6"
.LASF395:
	.string	"_BSD_SIZE_T_ "
.LASF381:
	.string	"__stub_setlogin "
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF506:
	.string	"base"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF312:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF494:
	.string	"sbufWriteData"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF343:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF280:
	.string	"__KERNEL_STRICT_NAMES "
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF263:
	.string	"__USE_POSIX199506"
.LASF469:
	.string	"INT32_C(c) c"
.LASF336:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF315:
	.string	"__PMT(args) args"
.LASF473:
	.string	"UINT32_C(c) c ## U"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF471:
	.string	"UINT8_C(c) c"
.LASF373:
	.string	"__stub_fattach "
.LASF510:
	.string	"sbuf_s"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF491:
	.string	"sbufWriteU8"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF240:
	.string	"unix 1"
.LASF377:
	.string	"__stub_gtty "
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF228:
	.string	"__MMX__ 1"
.LASF384:
	.string	"__stub_stty "
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF447:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF295:
	.string	"__USE_XOPEN2K 1"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF338:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF451:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF370:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF258:
	.string	"__USE_ISOC95"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF257:
	.string	"__USE_ISOC99"
.LASF293:
	.string	"__USE_POSIX199309 1"
.LASF511:
	.string	"sbufSwitchToReader"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF379:
	.string	"__stub_putmsg "
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF396:
	.string	"_SIZE_T_DEFINED_ "
.LASF320:
	.string	"__BEGIN_DECLS "
.LASF405:
	.string	"NULL"
.LASF466:
	.string	"WINT_MAX (4294967295u)"
.LASF456:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF420:
	.string	"INT8_MAX (127)"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF283:
	.string	"_DEFAULT_SOURCE 1"
.LASF425:
	.string	"UINT16_MAX (65535)"
.LASF218:
	.string	"__amd64__ 1"
.LASF330:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF361:
	.string	"__WORDSIZE 64"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF475:
	.string	"INTMAX_C(c) c ## L"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF245:
	.string	"EDISON 1"
.LASF429:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF406:
	.string	"NULL ((void *)0)"
.LASF348:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF356:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF461:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF417:
	.string	"INT16_MIN (-32767-1)"
.LASF508:
	.string	"src/main/common/streambuf.c"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF335:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF472:
	.string	"UINT16_C(c) c"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF481:
	.string	"char"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF465:
	.string	"WINT_MIN (0u)"
.LASF323:
	.string	"__END_NAMESPACE_STD "
.LASF486:
	.string	"uint8_t"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF220:
	.string	"__x86_64__ 1"
.LASF455:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF497:
	.string	"string"
.LASF411:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF334:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF294:
	.string	"__USE_POSIX199506 1"
.LASF292:
	.string	"__USE_POSIX2 1"
.LASF463:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF388:
	.string	"__SIZE_T__ "
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF495:
	.string	"data"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF366:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF503:
	.string	"sbufPtr"
.LASF351:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF350:
	.string	"__wur "
.LASF418:
	.string	"INT32_MIN (-2147483647-1)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF325:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF262:
	.string	"__USE_POSIX199309"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF354:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF467:
	.string	"INT8_C(c) c"
.LASF300:
	.string	"__USE_ATFILE 1"
.LASF267:
	.string	"__USE_XOPEN2K"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF307:
	.string	"_SYS_CDEFS_H 1"
.LASF17:
	.string	"__LP64__ 1"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF454:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF342:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF367:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF16:
	.string	"_LP64 1"
.LASF255:
	.string	"_FEATURES_H 1"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF219:
	.string	"__x86_64 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF327:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF387:
	.string	"__size_t__ "
.LASF428:
	.string	"INT_LEAST8_MIN (-128)"
.LASF243:
	.string	"DEBUG 1"
.LASF357:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF308:
	.string	"__PMT"
.LASF241:
	.string	"__ELF__ 1"
.LASF316:
	.string	"__CONCAT(x,y) x ## y"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF499:
	.string	"sbufReadU16"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF474:
	.string	"UINT64_C(c) c ## UL"
.LASF0:
	.string	"__STDC__ 1"
.LASF230:
	.string	"__SSE2__ 1"
.LASF286:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF436:
	.string	"UINT_LEAST8_MAX (255)"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF431:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF290:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF505:
	.string	"size"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF509:
	.string	"/home/aravind/git/cleanflight"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF276:
	.string	"__USE_GNU"
.LASF329:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF346:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF408:
	.string	"_XLOCALE_H 1"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF291:
	.string	"__USE_POSIX 1"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF504:
	.string	"sbufAdvance"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF345:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF305:
	.string	"__GLIBC_MINOR__ 23"
.LASF464:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF273:
	.string	"__USE_FILE_OFFSET64"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF400:
	.string	"___int_size_t_h "
.LASF360:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF424:
	.string	"UINT8_MAX (255)"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF385:
	.string	"__need_size_t "
.LASF328:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF275:
	.string	"__USE_ATFILE"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF487:
	.string	"uint16_t"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF404:
	.string	"__need_size_t"
.LASF309:
	.string	"__LEAF , __leaf__"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF278:
	.string	"__USE_FORTIFY_LEVEL"
.LASF470:
	.string	"INT64_C(c) c ## L"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF500:
	.string	"sbufReadU32"
.LASF476:
	.string	"UINTMAX_C(c) c ## UL"
.LASF317:
	.string	"__STRING(x) #x"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF416:
	.string	"INT8_MIN (-128)"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF460:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF483:
	.string	"short int"
.LASF448:
	.string	"UINT_FAST8_MAX (255)"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF376:
	.string	"__stub_getmsg "
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF452:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF484:
	.string	"long int"
.LASF410:
	.string	"_BITS_WCHAR_H 1"
.LASF414:
	.string	"__uint32_t_defined "
.LASF261:
	.string	"__USE_POSIX2"
.LASF319:
	.string	"__long_double_t long double"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF445:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF407:
	.string	"__need_NULL"
.LASF254:
	.string	"_STRING_H 1"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF284:
	.string	"__USE_ISOC99 1"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF235:
	.string	"__linux 1"
.LASF498:
	.string	"sbufReadU8"
.LASF380:
	.string	"__stub_revoke "
.LASF364:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF277:
	.string	"__USE_REENTRANT"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF383:
	.string	"__stub_sstk "
.LASF269:
	.string	"__USE_XOPEN2K8"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF490:
	.string	"sbuf_t"
.LASF264:
	.string	"__USE_XOPEN"
.LASF462:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF289:
	.string	"_POSIX_C_SOURCE"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF403:
	.string	"__size_t "
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF341:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF274:
	.string	"__USE_MISC"
.LASF296:
	.string	"__USE_XOPEN2K8 1"
.LASF326:
	.string	"__END_NAMESPACE_C99 "
.LASF453:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF427:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF443:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF282:
	.string	"_DEFAULT_SOURCE"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF331:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF397:
	.string	"_SIZE_T_DEFINED "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF371:
	.string	"__stub___compat_bdflush "
.LASF479:
	.string	"sizetype"
.LASF256:
	.string	"__USE_ISOC11"
.LASF478:
	.string	"long unsigned int"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF439:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF238:
	.string	"__unix 1"
.LASF502:
	.string	"sbufBytesRemaining"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF369:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF441:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF314:
	.string	"__P(args) args"
.LASF268:
	.string	"__USE_XOPEN2KXSI"
.LASF340:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF225:
	.string	"__k8 1"
.LASF304:
	.string	"__GLIBC__ 2"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF358:
	.string	"__restrict_arr __restrict"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF347:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF485:
	.string	"unsigned char"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF422:
	.string	"INT32_MAX (2147483647)"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF355:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF458:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF449:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF231:
	.string	"__FXSR__ 1"
.LASF310:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF288:
	.string	"_POSIX_SOURCE 1"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF438:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF226:
	.string	"__k8__ 1"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF265:
	.string	"__USE_XOPEN_EXTENDED"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF440:
	.string	"INT_FAST8_MIN (-128)"
.LASF272:
	.string	"__USE_LARGEFILE64"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF349:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF321:
	.string	"__END_DECLS "
.LASF270:
	.string	"__USE_XOPEN2K8XSI"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF344:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF501:
	.string	"sbufReadData"
.LASF433:
	.string	"INT_LEAST16_MAX (32767)"
.LASF482:
	.string	"signed char"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF299:
	.string	"__USE_MISC 1"
.LASF480:
	.string	"short unsigned int"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF229:
	.string	"__SSE__ 1"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF402:
	.string	"_SIZET_ "
.LASF375:
	.string	"__stub_fdetach "
.LASF390:
	.string	"_SYS_SIZE_T_H "
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF492:
	.string	"sbufWriteU16"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF332:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF337:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF217:
	.string	"__amd64 1"
.LASF236:
	.string	"__linux__ 1"
.LASF362:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF442:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF444:
	.string	"INT_FAST8_MAX (127)"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF423:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF279:
	.string	"__KERNEL_STRICT_NAMES"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF260:
	.string	"__USE_POSIX"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF430:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF363:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF378:
	.string	"__stub_lchmod "
.LASF457:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF368:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
