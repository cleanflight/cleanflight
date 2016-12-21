	.file	"streambuf.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed streambuf.i -mtune=generic -march=x86-64
# -g -std=gnu99 -ffunction-sections -fdata-sections -fverbose-asm
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
	.long	0x3d1
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF29
	.byte	0xc
	.long	.LASF30
	.long	.LASF31
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x8
	.long	0x52
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x5
	.long	0x4b
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
	.uleb128 0x6
	.long	.LASF8
	.byte	0x2
	.byte	0x30
	.long	0x77
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x6
	.long	.LASF9
	.byte	0x2
	.byte	0x31
	.long	0x37
	.uleb128 0x6
	.long	.LASF10
	.byte	0x2
	.byte	0x33
	.long	0x94
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF11
	.uleb128 0x7
	.long	.LASF32
	.byte	0x10
	.byte	0x3
	.byte	0x19
	.long	0xc0
	.uleb128 0x8
	.string	"ptr"
	.byte	0x3
	.byte	0x1a
	.long	0xc0
	.byte	0
	.uleb128 0x8
	.string	"end"
	.byte	0x3
	.byte	0x1b
	.long	0xc0
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x6c
	.uleb128 0x6
	.long	.LASF12
	.byte	0x3
	.byte	0x1c
	.long	0x9b
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0x17
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x10b
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x17
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"val"
	.byte	0x1
	.byte	0x17
	.long	0x6c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0xc6
	.uleb128 0xb
	.long	.LASF14
	.byte	0x1
	.byte	0x1c
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x14b
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x1c
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"val"
	.byte	0x1
	.byte	0x1c
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xb
	.long	.LASF15
	.byte	0x1
	.byte	0x22
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x185
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x22
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"val"
	.byte	0x1
	.byte	0x22
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xb
	.long	.LASF16
	.byte	0x1
	.byte	0x2a
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cd
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x2a
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF17
	.byte	0x1
	.byte	0x2a
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.string	"len"
	.byte	0x1
	.byte	0x2a
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x1d3
	.uleb128 0xd
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1
	.byte	0x30
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x20e
	.uleb128 0xa
	.string	"dst"
	.byte	0x1
	.byte	0x30
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.byte	0x30
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xe
	.long	.LASF20
	.byte	0x1
	.byte	0x35
	.long	0x6c
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x23e
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x35
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.long	.LASF21
	.byte	0x1
	.byte	0x3a
	.long	0x7e
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x27c
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x3a
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.string	"ret"
	.byte	0x1
	.byte	0x3c
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xf
	.long	.LASF22
	.byte	0x1
	.byte	0x42
	.long	0x89
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x2ba
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x42
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.string	"ret"
	.byte	0x1
	.byte	0x44
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.long	.LASF23
	.byte	0x1
	.byte	0x4c
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x302
	.uleb128 0xa
	.string	"src"
	.byte	0x1
	.byte	0x4c
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF17
	.byte	0x1
	.byte	0x4c
	.long	0x302
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.string	"len"
	.byte	0x1
	.byte	0x4c
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.uleb128 0xe
	.long	.LASF24
	.byte	0x1
	.byte	0x53
	.long	0x3e
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x334
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x53
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	.LASF25
	.byte	0x1
	.byte	0x58
	.long	0xc0
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x364
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x58
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.long	.LASF26
	.byte	0x1
	.byte	0x60
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x39e
	.uleb128 0xa
	.string	"buf"
	.byte	0x1
	.byte	0x60
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF27
	.byte	0x1
	.byte	0x60
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x12
	.long	.LASF33
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
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.byte	0x66
	.long	0xc0
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF30:
	.string	"src/main/common/streambuf.c"
.LASF18:
	.string	"sbufWriteString"
.LASF21:
	.string	"sbufReadU16"
.LASF22:
	.string	"sbufReadU32"
.LASF33:
	.string	"sbufSwitchToReader"
.LASF26:
	.string	"sbufAdvance"
.LASF19:
	.string	"string"
.LASF17:
	.string	"data"
.LASF25:
	.string	"sbufPtr"
.LASF7:
	.string	"unsigned char"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF29:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF14:
	.string	"sbufWriteU16"
.LASF31:
	.string	"/home/aravind/git/cleanflight"
.LASF15:
	.string	"sbufWriteU32"
.LASF13:
	.string	"sbufWriteU8"
.LASF20:
	.string	"sbufReadU8"
.LASF24:
	.string	"sbufBytesRemaining"
.LASF16:
	.string	"sbufWriteData"
.LASF32:
	.string	"sbuf_s"
.LASF28:
	.string	"base"
.LASF11:
	.string	"unsigned int"
.LASF3:
	.string	"char"
.LASF8:
	.string	"uint8_t"
.LASF12:
	.string	"sbuf_t"
.LASF23:
	.string	"sbufReadData"
.LASF1:
	.string	"sizetype"
.LASF5:
	.string	"short int"
.LASF9:
	.string	"uint16_t"
.LASF10:
	.string	"uint32_t"
.LASF6:
	.string	"long int"
.LASF4:
	.string	"signed char"
.LASF27:
	.string	"size"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
