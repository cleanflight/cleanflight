	.file	"serial.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed serial.i -mtune=generic -march=x86-64
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
	.section	.text.serialPrint,"ax",@progbits
	.globl	serialPrint
	.type	serialPrint, @function
serialPrint:
.LFB0:
	.file 1 "src/main/drivers/serial.c"
	.loc 1 26 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# instance, instance
	movq	%rsi, -32(%rbp)	# str, str
	.loc 1 28 0
	jmp	.L2	#
.L3:
	.loc 1 29 0
	movzbl	-1(%rbp), %edx	# ch, D.2078
	movq	-24(%rbp), %rax	# instance, tmp90
	movl	%edx, %esi	# D.2078,
	movq	%rax, %rdi	# tmp90,
	call	serialWrite	#
.L2:
	.loc 1 28 0
	movq	-32(%rbp), %rax	# str, D.2076
	leaq	1(%rax), %rdx	#, tmp91
	movq	%rdx, -32(%rbp)	# tmp91, str
	movzbl	(%rax), %eax	# *_5, D.2077
	movb	%al, -1(%rbp)	# D.2077, ch
	cmpb	$0, -1(%rbp)	#, ch
	jne	.L3	#,
	.loc 1 31 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	serialPrint, .-serialPrint
	.section	.text.serialGetBaudRate,"ax",@progbits
	.globl	serialGetBaudRate
	.type	serialGetBaudRate, @function
serialGetBaudRate:
.LFB1:
	.loc 1 34 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 35 0
	movq	-8(%rbp), %rax	# instance, tmp89
	movl	20(%rax), %eax	# instance_2(D)->baudRate, D.2079
	.loc 1 36 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	serialGetBaudRate, .-serialGetBaudRate
	.section	.text.serialWrite,"ax",@progbits
	.globl	serialWrite
	.type	serialWrite, @function
serialWrite:
.LFB2:
	.loc 1 39 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, %eax	# ch, tmp90
	movb	%al, -12(%rbp)	# tmp90, ch
	.loc 1 40 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2080
	movq	(%rax), %rax	# _3->serialWrite, D.2081
	movzbl	-12(%rbp), %ecx	# ch, D.2082
	movq	-8(%rbp), %rdx	# instance, tmp92
	movl	%ecx, %esi	# D.2082,
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2081
	.loc 1 41 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	serialWrite, .-serialWrite
	.section	.text.serialWriteBuf,"ax",@progbits
	.globl	serialWriteBuf
	.type	serialWriteBuf, @function
serialWriteBuf:
.LFB3:
	.loc 1 45 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# instance, instance
	movq	%rsi, -32(%rbp)	# data, data
	movl	%edx, -36(%rbp)	# count, count
	.loc 1 46 0
	movq	-24(%rbp), %rax	# instance, tmp94
	movq	(%rax), %rax	# instance_7(D)->vTable, D.2083
	movq	56(%rax), %rax	# _8->writeBuf, D.2084
	testq	%rax, %rax	# D.2084
	je	.L8	#,
	.loc 1 47 0
	movq	-24(%rbp), %rax	# instance, tmp95
	movq	(%rax), %rax	# instance_7(D)->vTable, D.2083
	movq	56(%rax), %rax	# _10->writeBuf, D.2084
	movl	-36(%rbp), %edx	# count, tmp96
	movq	-32(%rbp), %rsi	# data, tmp97
	movq	-24(%rbp), %rcx	# instance, tmp98
	movq	%rcx, %rdi	# tmp98,
	call	*%rax	# D.2084
	.loc 1 57 0
	jmp	.L13	#
.L8:
.LBB2:
	.loc 1 49 0
	movq	-32(%rbp), %rax	# data, tmp99
	movq	%rax, -8(%rbp)	# tmp99, p
	jmp	.L10	#
.L12:
	.loc 1 51 0
	nop
.L11:
	.loc 1 51 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax	# instance, tmp100
	movq	%rax, %rdi	# tmp100,
	call	serialTxBytesFree	#
	testb	%al, %al	# D.2085
	je	.L11	#,
	.loc 1 54 0 is_stmt 1 discriminator 2
	movq	-8(%rbp), %rax	# p, tmp101
	movzbl	(%rax), %eax	# *p_2, D.2085
	movzbl	%al, %edx	# D.2085, D.2086
	movq	-24(%rbp), %rax	# instance, tmp102
	movl	%edx, %esi	# D.2086,
	movq	%rax, %rdi	# tmp102,
	call	serialWrite	#
	.loc 1 49 0 discriminator 2
	subl	$1, -36(%rbp)	#, count
	addq	$1, -8(%rbp)	#, p
.L10:
	.loc 1 49 0 is_stmt 0 discriminator 1
	cmpl	$0, -36(%rbp)	#, count
	jg	.L12	#,
.L13:
.LBE2:
	.loc 1 57 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	serialWriteBuf, .-serialWriteBuf
	.section	.text.serialRxBytesWaiting,"ax",@progbits
	.globl	serialRxBytesWaiting
	.type	serialRxBytesWaiting, @function
serialRxBytesWaiting:
.LFB4:
	.loc 1 60 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 61 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2087
	movq	8(%rax), %rax	# _3->serialTotalRxWaiting, D.2088
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2088
	.loc 1 62 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	serialRxBytesWaiting, .-serialRxBytesWaiting
	.section	.text.serialTxBytesFree,"ax",@progbits
	.globl	serialTxBytesFree
	.type	serialTxBytesFree, @function
serialTxBytesFree:
.LFB5:
	.loc 1 65 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 66 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2090
	movq	16(%rax), %rax	# _3->serialTotalTxFree, D.2091
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2091
	.loc 1 67 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	serialTxBytesFree, .-serialTxBytesFree
	.section	.text.serialRead,"ax",@progbits
	.globl	serialRead
	.type	serialRead, @function
serialRead:
.LFB6:
	.loc 1 70 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 71 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2093
	movq	24(%rax), %rax	# _3->serialRead, D.2094
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2094
	.loc 1 72 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	serialRead, .-serialRead
	.section	.text.serialSetBaudRate,"ax",@progbits
	.globl	serialSetBaudRate
	.type	serialSetBaudRate, @function
serialSetBaudRate:
.LFB7:
	.loc 1 75 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, -12(%rbp)	# baudRate, baudRate
	.loc 1 76 0
	movq	-8(%rbp), %rax	# instance, tmp89
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2096
	movq	32(%rax), %rax	# _3->serialSetBaudRate, D.2097
	movl	-12(%rbp), %ecx	# baudRate, tmp90
	movq	-8(%rbp), %rdx	# instance, tmp91
	movl	%ecx, %esi	# tmp90,
	movq	%rdx, %rdi	# tmp91,
	call	*%rax	# D.2097
	.loc 1 77 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	serialSetBaudRate, .-serialSetBaudRate
	.section	.text.isSerialTransmitBufferEmpty,"ax",@progbits
	.globl	isSerialTransmitBufferEmpty
	.type	isSerialTransmitBufferEmpty, @function
isSerialTransmitBufferEmpty:
.LFB8:
	.loc 1 80 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 81 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2098
	movq	40(%rax), %rax	# _3->isSerialTransmitBufferEmpty, D.2099
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2099
	.loc 1 82 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	isSerialTransmitBufferEmpty, .-isSerialTransmitBufferEmpty
	.section	.text.serialSetMode,"ax",@progbits
	.globl	serialSetMode
	.type	serialSetMode, @function
serialSetMode:
.LFB9:
	.loc 1 85 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, -12(%rbp)	# mode, mode
	.loc 1 86 0
	movq	-8(%rbp), %rax	# instance, tmp89
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2101
	movq	48(%rax), %rax	# _3->setMode, D.2102
	movl	-12(%rbp), %ecx	# mode, tmp90
	movq	-8(%rbp), %rdx	# instance, tmp91
	movl	%ecx, %esi	# tmp90,
	movq	%rdx, %rdi	# tmp91,
	call	*%rax	# D.2102
	.loc 1 87 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	serialSetMode, .-serialSetMode
	.section	.text.serialWriteBufShim,"ax",@progbits
	.globl	serialWriteBufShim
	.type	serialWriteBufShim, @function
serialWriteBufShim:
.LFB10:
	.loc 1 90 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	movq	%rsi, -16(%rbp)	# data, data
	movl	%edx, -20(%rbp)	# count, count
	.loc 1 91 0
	movl	-20(%rbp), %edx	# count, tmp87
	movq	-16(%rbp), %rcx	# data, tmp88
	movq	-8(%rbp), %rax	# instance, tmp89
	movq	%rcx, %rsi	# tmp88,
	movq	%rax, %rdi	# tmp89,
	call	serialWriteBuf	#
	.loc 1 92 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	serialWriteBufShim, .-serialWriteBufShim
	.section	.text.serialBeginWrite,"ax",@progbits
	.globl	serialBeginWrite
	.type	serialBeginWrite, @function
serialBeginWrite:
.LFB11:
	.loc 1 95 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 96 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2103
	movq	64(%rax), %rax	# _4->beginWrite, D.2104
	testq	%rax, %rax	# D.2104
	je	.L27	#,
	.loc 1 97 0
	movq	-8(%rbp), %rax	# instance, tmp92
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2103
	movq	64(%rax), %rax	# _6->beginWrite, D.2104
	movq	-8(%rbp), %rdx	# instance, tmp93
	movq	%rdx, %rdi	# tmp93,
	call	*%rax	# D.2104
.L27:
	.loc 1 98 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	serialBeginWrite, .-serialBeginWrite
	.section	.text.serialEndWrite,"ax",@progbits
	.globl	serialEndWrite
	.type	serialEndWrite, @function
serialEndWrite:
.LFB12:
	.loc 1 101 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 102 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2105
	movq	72(%rax), %rax	# _4->endWrite, D.2106
	testq	%rax, %rax	# D.2106
	je	.L30	#,
	.loc 1 103 0
	movq	-8(%rbp), %rax	# instance, tmp92
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2105
	movq	72(%rax), %rax	# _6->endWrite, D.2106
	movq	-8(%rbp), %rdx	# instance, tmp93
	movq	%rdx, %rdi	# tmp93,
	call	*%rax	# D.2106
.L30:
	.loc 1 104 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	serialEndWrite, .-serialEndWrite
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "src/main/drivers/serial.h"
	.file 4 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x65c
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF628
	.byte	0xc
	.long	.LASF629
	.long	.LASF630
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF560
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF561
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF562
	.uleb128 0x4
	.long	.LASF564
	.byte	0x2
	.byte	0x30
	.long	0x54
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF563
	.uleb128 0x4
	.long	.LASF565
	.byte	0x2
	.byte	0x31
	.long	0x66
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF566
	.uleb128 0x4
	.long	.LASF567
	.byte	0x2
	.byte	0x33
	.long	0x78
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF568
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF569
	.uleb128 0x5
	.long	.LASF573
	.byte	0x4
	.long	0x78
	.byte	0x3
	.byte	0x14
	.long	0xa9
	.uleb128 0x6
	.long	.LASF570
	.byte	0x1
	.uleb128 0x6
	.long	.LASF571
	.byte	0x2
	.uleb128 0x6
	.long	.LASF572
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF573
	.byte	0x3
	.byte	0x18
	.long	0x86
	.uleb128 0x5
	.long	.LASF574
	.byte	0x4
	.long	0x78
	.byte	0x3
	.byte	0x1a
	.long	0xf5
	.uleb128 0x6
	.long	.LASF575
	.byte	0
	.uleb128 0x6
	.long	.LASF576
	.byte	0x1
	.uleb128 0x6
	.long	.LASF577
	.byte	0
	.uleb128 0x6
	.long	.LASF578
	.byte	0x2
	.uleb128 0x6
	.long	.LASF579
	.byte	0
	.uleb128 0x6
	.long	.LASF580
	.byte	0x4
	.uleb128 0x6
	.long	.LASF581
	.byte	0
	.uleb128 0x6
	.long	.LASF582
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF574
	.byte	0x3
	.byte	0x23
	.long	0xb4
	.uleb128 0x4
	.long	.LASF583
	.byte	0x3
	.byte	0x25
	.long	0x10b
	.uleb128 0x7
	.byte	0x8
	.long	0x111
	.uleb128 0x8
	.long	0x11c
	.uleb128 0x9
	.long	0x5b
	.byte	0
	.uleb128 0xa
	.long	.LASF598
	.byte	0x48
	.byte	0x3
	.byte	0x27
	.long	0x1d1
	.uleb128 0xb
	.long	.LASF584
	.byte	0x3
	.byte	0x29
	.long	0x256
	.byte	0
	.uleb128 0xb
	.long	.LASF585
	.byte	0x3
	.byte	0x2b
	.long	0x49
	.byte	0x8
	.uleb128 0xb
	.long	.LASF586
	.byte	0x3
	.byte	0x2c
	.long	0xa9
	.byte	0xc
	.uleb128 0xb
	.long	.LASF587
	.byte	0x3
	.byte	0x2d
	.long	0xf5
	.byte	0x10
	.uleb128 0xb
	.long	.LASF588
	.byte	0x3
	.byte	0x2f
	.long	0x6d
	.byte	0x14
	.uleb128 0xb
	.long	.LASF589
	.byte	0x3
	.byte	0x31
	.long	0x6d
	.byte	0x18
	.uleb128 0xb
	.long	.LASF590
	.byte	0x3
	.byte	0x32
	.long	0x6d
	.byte	0x1c
	.uleb128 0xb
	.long	.LASF591
	.byte	0x3
	.byte	0x33
	.long	0x261
	.byte	0x20
	.uleb128 0xb
	.long	.LASF592
	.byte	0x3
	.byte	0x34
	.long	0x261
	.byte	0x28
	.uleb128 0xb
	.long	.LASF593
	.byte	0x3
	.byte	0x35
	.long	0x6d
	.byte	0x30
	.uleb128 0xb
	.long	.LASF594
	.byte	0x3
	.byte	0x36
	.long	0x6d
	.byte	0x34
	.uleb128 0xb
	.long	.LASF595
	.byte	0x3
	.byte	0x37
	.long	0x6d
	.byte	0x38
	.uleb128 0xb
	.long	.LASF596
	.byte	0x3
	.byte	0x38
	.long	0x6d
	.byte	0x3c
	.uleb128 0xb
	.long	.LASF597
	.byte	0x3
	.byte	0x3b
	.long	0x100
	.byte	0x40
	.byte	0
	.uleb128 0xa
	.long	.LASF599
	.byte	0x50
	.byte	0x3
	.byte	0x3e
	.long	0x256
	.uleb128 0xb
	.long	.LASF600
	.byte	0x3
	.byte	0x3f
	.long	0x28d
	.byte	0
	.uleb128 0xb
	.long	.LASF601
	.byte	0x3
	.byte	0x41
	.long	0x2a2
	.byte	0x8
	.uleb128 0xb
	.long	.LASF602
	.byte	0x3
	.byte	0x42
	.long	0x2a2
	.byte	0x10
	.uleb128 0xb
	.long	.LASF603
	.byte	0x3
	.byte	0x44
	.long	0x2a2
	.byte	0x18
	.uleb128 0xb
	.long	.LASF604
	.byte	0x3
	.byte	0x47
	.long	0x2b8
	.byte	0x20
	.uleb128 0xb
	.long	.LASF605
	.byte	0x3
	.byte	0x49
	.long	0x2d4
	.byte	0x28
	.uleb128 0xb
	.long	.LASF606
	.byte	0x3
	.byte	0x4b
	.long	0x2ea
	.byte	0x30
	.uleb128 0xb
	.long	.LASF607
	.byte	0x3
	.byte	0x4d
	.long	0x307
	.byte	0x38
	.uleb128 0xb
	.long	.LASF608
	.byte	0x3
	.byte	0x4f
	.long	0x318
	.byte	0x40
	.uleb128 0xb
	.long	.LASF609
	.byte	0x3
	.byte	0x50
	.long	0x318
	.byte	0x48
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x25c
	.uleb128 0xc
	.long	0x1d1
	.uleb128 0x7
	.byte	0x8
	.long	0x267
	.uleb128 0xd
	.long	0x49
	.uleb128 0x4
	.long	.LASF610
	.byte	0x3
	.byte	0x3c
	.long	0x11c
	.uleb128 0x8
	.long	0x287
	.uleb128 0x9
	.long	0x287
	.uleb128 0x9
	.long	0x49
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x26c
	.uleb128 0x7
	.byte	0x8
	.long	0x277
	.uleb128 0xe
	.long	0x49
	.long	0x2a2
	.uleb128 0x9
	.long	0x287
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x293
	.uleb128 0x8
	.long	0x2b8
	.uleb128 0x9
	.long	0x287
	.uleb128 0x9
	.long	0x6d
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x2a8
	.uleb128 0xe
	.long	0x2cd
	.long	0x2cd
	.uleb128 0x9
	.long	0x287
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF611
	.uleb128 0x7
	.byte	0x8
	.long	0x2be
	.uleb128 0x8
	.long	0x2ea
	.uleb128 0x9
	.long	0x287
	.uleb128 0x9
	.long	0xa9
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x2da
	.uleb128 0x8
	.long	0x305
	.uleb128 0x9
	.long	0x287
	.uleb128 0x9
	.long	0x305
	.uleb128 0x9
	.long	0x3b
	.byte	0
	.uleb128 0xf
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.long	0x2f0
	.uleb128 0x8
	.long	0x318
	.uleb128 0x9
	.long	0x287
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x30d
	.uleb128 0x10
	.long	.LASF614
	.byte	0x1
	.byte	0x19
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x365
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x19
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.string	"str"
	.byte	0x1
	.byte	0x19
	.long	0x365
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.string	"ch"
	.byte	0x1
	.byte	0x1b
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x372
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF613
	.uleb128 0xc
	.long	0x36b
	.uleb128 0x14
	.long	.LASF618
	.byte	0x1
	.byte	0x21
	.long	0x6d
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x3a7
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x21
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF600
	.byte	0x1
	.byte	0x26
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x3e0
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x26
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"ch"
	.byte	0x1
	.byte	0x26
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x10
	.long	.LASF615
	.byte	0x1
	.byte	0x2c
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x446
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x2c
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.long	.LASF616
	.byte	0x1
	.byte	0x2c
	.long	0x446
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF617
	.byte	0x1
	.byte	0x2c
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x13
	.string	"p"
	.byte	0x1
	.byte	0x31
	.long	0x446
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x49
	.uleb128 0x16
	.long	.LASF619
	.byte	0x1
	.byte	0x3b
	.long	0x49
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x47c
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x3b
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF620
	.byte	0x1
	.byte	0x40
	.long	0x49
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x4ac
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x40
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF603
	.byte	0x1
	.byte	0x45
	.long	0x49
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x4dc
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x45
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF604
	.byte	0x1
	.byte	0x4a
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x516
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x4a
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF588
	.byte	0x1
	.byte	0x4a
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x16
	.long	.LASF605
	.byte	0x1
	.byte	0x4f
	.long	0x2cd
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x546
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x4f
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF621
	.byte	0x1
	.byte	0x54
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x580
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x54
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF586
	.byte	0x1
	.byte	0x54
	.long	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x10
	.long	.LASF622
	.byte	0x1
	.byte	0x59
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x5c8
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x59
	.long	0x305
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF616
	.byte	0x1
	.byte	0x59
	.long	0x446
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.long	.LASF617
	.byte	0x1
	.byte	0x59
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x10
	.long	.LASF623
	.byte	0x1
	.byte	0x5e
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x5f4
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x5e
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF624
	.byte	0x1
	.byte	0x64
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x620
	.uleb128 0x11
	.long	.LASF612
	.byte	0x1
	.byte	0x64
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	.LASF625
	.byte	0x4
	.byte	0xc8
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x17
	.long	.LASF626
	.byte	0x4
	.byte	0xc9
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x17
	.long	.LASF627
	.byte	0x4
	.byte	0xca
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.file 5 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 7 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x7
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF259
	.file 8 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro3
	.file 9 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.file 10 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.file 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0xb
	.file 12 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 13 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xa
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
	.file 14 "./src/main/platform.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xe
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x17
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
	.section	.debug_macro,"G",@progbits,wm4.target.h.27.fb30bee6923ab05d4360685030e3605d,comdat
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
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF461
	.byte	0x5
	.uleb128 0x21
	.long	.LASF462
	.byte	0x5
	.uleb128 0x22
	.long	.LASF463
	.byte	0x5
	.uleb128 0x23
	.long	.LASF464
	.byte	0x5
	.uleb128 0x24
	.long	.LASF465
	.byte	0x5
	.uleb128 0x25
	.long	.LASF466
	.byte	0x5
	.uleb128 0x26
	.long	.LASF467
	.byte	0x5
	.uleb128 0x29
	.long	.LASF468
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF469
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF470
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF471
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF472
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF473
	.byte	0x5
	.uleb128 0x34
	.long	.LASF474
	.byte	0x5
	.uleb128 0x37
	.long	.LASF475
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF476
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF477
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF478
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF479
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF480
	.byte	0x5
	.uleb128 0x40
	.long	.LASF481
	.byte	0x5
	.uleb128 0x42
	.long	.LASF482
	.byte	0x5
	.uleb128 0x43
	.long	.LASF483
	.byte	0x5
	.uleb128 0x44
	.long	.LASF484
	.byte	0x5
	.uleb128 0x45
	.long	.LASF485
	.byte	0x5
	.uleb128 0x47
	.long	.LASF486
	.byte	0x5
	.uleb128 0x48
	.long	.LASF487
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF488
	.byte	0x5
	.uleb128 0x50
	.long	.LASF489
	.byte	0x5
	.uleb128 0x52
	.long	.LASF490
	.byte	0x5
	.uleb128 0x55
	.long	.LASF491
	.byte	0x5
	.uleb128 0x56
	.long	.LASF492
	.byte	0x5
	.uleb128 0x58
	.long	.LASF493
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF494
	.byte	0x5
	.uleb128 0x60
	.long	.LASF495
	.byte	0x5
	.uleb128 0x62
	.long	.LASF496
	.byte	0x5
	.uleb128 0x63
	.long	.LASF497
	.byte	0x5
	.uleb128 0x64
	.long	.LASF498
	.byte	0x5
	.uleb128 0x65
	.long	.LASF499
	.byte	0x5
	.uleb128 0x66
	.long	.LASF500
	.byte	0x5
	.uleb128 0x67
	.long	.LASF501
	.byte	0x5
	.uleb128 0x68
	.long	.LASF502
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF503
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF504
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF505
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF506
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF507
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF508
	.byte	0x5
	.uleb128 0x71
	.long	.LASF509
	.byte	0x5
	.uleb128 0x72
	.long	.LASF510
	.byte	0x5
	.uleb128 0x73
	.long	.LASF511
	.byte	0x5
	.uleb128 0x74
	.long	.LASF512
	.byte	0x5
	.uleb128 0x75
	.long	.LASF513
	.byte	0x5
	.uleb128 0x76
	.long	.LASF514
	.byte	0x5
	.uleb128 0x79
	.long	.LASF515
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF516
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF517
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF518
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF519
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF520
	.byte	0x5
	.uleb128 0x80
	.long	.LASF521
	.byte	0x5
	.uleb128 0x81
	.long	.LASF522
	.byte	0x5
	.uleb128 0x82
	.long	.LASF523
	.byte	0x5
	.uleb128 0x83
	.long	.LASF524
	.byte	0x5
	.uleb128 0x84
	.long	.LASF525
	.byte	0x5
	.uleb128 0x85
	.long	.LASF526
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF527
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF528
	.byte	0x5
	.uleb128 0x90
	.long	.LASF529
	.byte	0x5
	.uleb128 0x91
	.long	.LASF530
	.byte	0x5
	.uleb128 0x92
	.long	.LASF531
	.byte	0x5
	.uleb128 0x93
	.long	.LASF532
	.byte	0x5
	.uleb128 0x95
	.long	.LASF533
	.byte	0x5
	.uleb128 0x97
	.long	.LASF534
	.byte	0x5
	.uleb128 0x98
	.long	.LASF535
	.byte	0x5
	.uleb128 0x99
	.long	.LASF536
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF537
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF538
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF539
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF540
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF541
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF542
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF543
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF544
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF545
	.byte	0x5
	.uleb128 0xad
	.long	.LASF546
	.byte	0x5
	.uleb128 0xae
	.long	.LASF547
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF548
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF549
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF550
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF551
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF552
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF553
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF554
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF555
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF556
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF557
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF558
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF559
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF264:
	.string	"__USE_ISOCXX11"
.LASF473:
	.string	"LED1_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF591:
	.string	"rxBuffer"
.LASF285:
	.string	"__KERNEL_STRICT_NAMES "
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF430:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF259:
	.string	"_STDINT_H 1"
.LASF552:
	.string	"BINDPLUG_PORT GPIOB"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF517:
	.string	"I2C2_SCL_GPIO GPIOA"
.LASF217:
	.string	"__amd64 1"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF338:
	.string	"__flexarr []"
.LASF466:
	.string	"LED1_PIN Pin_5"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF496:
	.string	"USE_UART1_TX_DMA "
.LASF480:
	.string	"GYRO_MPU6050_ALIGN CW270_DEG"
.LASF357:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF458:
	.string	"__IO volatile"
.LASF434:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF344:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF426:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF525:
	.string	"I2C2_SDA_PIN_SOURCE GPIO_PinSource10"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF628:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF399:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF312:
	.string	"_SYS_CDEFS_H 1"
.LASF558:
	.string	"TARGET_IO_PORTF (BIT(0)|BIT(1)|BIT(4))"
.LASF392:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF286:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF486:
	.string	"ACC_MPU6050_ALIGN CW270_DEG"
.LASF294:
	.string	"_POSIX_C_SOURCE"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF277:
	.string	"__USE_LARGEFILE64"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF370:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF568:
	.string	"unsigned int"
.LASF311:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF407:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF508:
	.string	"UART2_RX_PINSOURCE GPIO_PinSource3"
.LASF292:
	.string	"_POSIX_SOURCE"
.LASF272:
	.string	"__USE_XOPEN2K"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF393:
	.string	"__int8_t_defined "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF528:
	.string	"USE_SPI_DEVICE_3 "
.LASF5:
	.string	"__GNUC__ 5"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF510:
	.string	"UART3_RX_PIN GPIO_Pin_11"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF514:
	.string	"UART3_RX_PINSOURCE GPIO_PinSource11"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF307:
	.string	"__GNU_LIBRARY__"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF622:
	.string	"serialWriteBufShim"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF364:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF379:
	.string	"__stub_fchflags "
.LASF412:
	.string	"INT_LEAST8_MAX (127)"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF478:
	.string	"USE_GYRO_MPU6500 "
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF507:
	.string	"UART2_TX_PINSOURCE GPIO_PinSource2"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF327:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF297:
	.string	"__USE_POSIX2 1"
.LASF290:
	.string	"__USE_ISOC95 1"
.LASF329:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF561:
	.string	"short int"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF524:
	.string	"I2C2_SDA_PIN GPIO_Pin_10"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF387:
	.string	"__stub_sigreturn "
.LASF323:
	.string	"__ptr_t void *"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF557:
	.string	"TARGET_IO_PORTD (BIT(2))"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF237:
	.string	"linux 1"
.LASF493:
	.string	"USB_IO "
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF417:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF401:
	.string	"INT16_MAX (32767)"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF542:
	.string	"DEFAULT_RX_FEATURE FEATURE_RX_SERIAL"
.LASF506:
	.string	"UART2_GPIO_AF GPIO_AF_7"
.LASF512:
	.string	"UART3_GPIO GPIOB"
.LASF439:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF271:
	.string	"__USE_UNIX98"
.LASF306:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF302:
	.string	"_ATFILE_SOURCE"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF625:
	.string	"U_ID_0"
.LASF626:
	.string	"U_ID_1"
.LASF627:
	.string	"U_ID_2"
.LASF448:
	.string	"INT16_C(c) c"
.LASF477:
	.string	"USE_GYRO_MPU6050 "
.LASF98:
	.string	"__INT8_C(c) c"
.LASF471:
	.string	"LED1_GPIO_2 GPIOB"
.LASF414:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF406:
	.string	"UINT32_MAX (4294967295U)"
.LASF303:
	.string	"_ATFILE_SOURCE 1"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF316:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF498:
	.string	"UART1_RX_PIN 2"
.LASF567:
	.string	"uint32_t"
.LASF457:
	.string	"_GCC_WRAP_STDINT_H "
.LASF509:
	.string	"UART3_TX_PIN GPIO_Pin_10"
.LASF572:
	.string	"MODE_RXTX"
.LASF415:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF358:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF418:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF584:
	.string	"vTable"
.LASF386:
	.string	"__stub_setlogin "
.LASF239:
	.string	"__unix__ 1"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF577:
	.string	"SERIAL_STOPBITS_1"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF544:
	.string	"SERIAL_RX "
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF533:
	.string	"USE_ADC "
.LASF617:
	.string	"count"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF479:
	.string	"USE_GYRO_SPI_MPU6500 "
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF317:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF395:
	.string	"__intptr_t_defined "
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF348:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF268:
	.string	"__USE_POSIX199506"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF576:
	.string	"SERIAL_INVERTED"
.LASF341:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF492:
	.string	"LED1 "
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF320:
	.string	"__PMT(args) args"
.LASF453:
	.string	"UINT32_C(c) c ## U"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF575:
	.string	"SERIAL_NOT_INVERTED"
.LASF355:
	.string	"__wur "
.LASF464:
	.string	"LED0_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF581:
	.string	"SERIAL_UNIDIR"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF382:
	.string	"__stub_gtty "
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
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
.LASF595:
	.string	"txBufferHead"
.LASF612:
	.string	"instance"
.LASF389:
	.string	"__stub_stty "
.LASF318:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF427:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF481:
	.string	"GYRO_MPU6500_ALIGN CW270_DEG"
.LASF300:
	.string	"__USE_XOPEN2K 1"
.LASF397:
	.string	"INT16_MIN (-32767-1)"
.LASF556:
	.string	"TARGET_IO_PORTC 0xffff"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF289:
	.string	"__USE_ISOC99 1"
.LASF604:
	.string	"serialSetBaudRate"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF284:
	.string	"__KERNEL_STRICT_NAMES"
.LASF431:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF375:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF263:
	.string	"__USE_ISOC95"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF262:
	.string	"__USE_ISOC99"
.LASF298:
	.string	"__USE_POSIX199309 1"
.LASF254:
	.string	"_STDBOOL_H "
.LASF463:
	.string	"LED0_PIN Pin_4"
.LASF603:
	.string	"serialRead"
.LASF590:
	.string	"txBufferSize"
.LASF534:
	.string	"ADC_INSTANCE ADC2"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF586:
	.string	"mode"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF384:
	.string	"__stub_putmsg "
.LASF611:
	.string	"_Bool"
.LASF256:
	.string	"true 1"
.LASF325:
	.string	"__BEGIN_DECLS "
.LASF559:
	.string	"TARGET_BOARD_IDENTIFIER \"EDISON\""
.LASF446:
	.string	"WINT_MAX (4294967295u)"
.LASF400:
	.string	"INT8_MAX (127)"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF549:
	.string	"BIND_PIN Pin_3"
.LASF288:
	.string	"_DEFAULT_SOURCE 1"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF218:
	.string	"__amd64__ 1"
.LASF220:
	.string	"__x86_64__ 1"
.LASF424:
	.string	"INT_FAST8_MAX (127)"
.LASF366:
	.string	"__WORDSIZE 64"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF455:
	.string	"INTMAX_C(c) c ## L"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF245:
	.string	"EDISON 1"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF521:
	.string	"I2C2_SCL_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF353:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF378:
	.string	"__stub_fattach "
.LASF441:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF618:
	.string	"serialGetBaudRate"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF598:
	.string	"serialPort_s"
.LASF601:
	.string	"serialTotalRxWaiting"
.LASF324:
	.string	"__long_double_t long double"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF340:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF452:
	.string	"UINT16_C(c) c"
.LASF499:
	.string	"UART1_GPIO GPIOB"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF599:
	.string	"serialPortVTable"
.LASF462:
	.string	"LED0_GPIO GPIOB"
.LASF536:
	.string	"ADC_AHB_PERIPHERAL RCC_AHBPeriph_DMA2"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF613:
	.string	"char"
.LASF377:
	.string	"__stub_chflags "
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF606:
	.string	"setMode"
.LASF445:
	.string	"WINT_MIN (0u)"
.LASF328:
	.string	"__END_NAMESPACE_STD "
.LASF564:
	.string	"uint8_t"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF461:
	.string	"HW_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF580:
	.string	"SERIAL_PARITY_EVEN"
.LASF435:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF491:
	.string	"LED0 "
.LASF339:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF299:
	.string	"__USE_POSIX199506 1"
.LASF235:
	.string	"__linux 1"
.LASF443:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF504:
	.string	"UART2_RX_PIN GPIO_Pin_3"
.LASF545:
	.string	"GTUNE "
.LASF516:
	.string	"I2C_DEVICE I2CDEV_6"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF616:
	.string	"data"
.LASF361:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF371:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF391:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF356:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF459:
	.string	"HW_GPIO GPIOB"
.LASF313:
	.string	"__PMT"
.LASF398:
	.string	"INT32_MIN (-2147483647-1)"
.LASF472:
	.string	"LED1_PIN_2 Pin_9"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF330:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF267:
	.string	"__USE_POSIX199309"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF359:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF447:
	.string	"INT8_C(c) c"
.LASF305:
	.string	"__USE_ATFILE 1"
.LASF610:
	.string	"serialPort_t"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF17:
	.string	"__LP64__ 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF405:
	.string	"UINT16_MAX (65535)"
.LASF511:
	.string	"UART3_GPIO_AF GPIO_AF_7"
.LASF347:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF372:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF16:
	.string	"_LP64 1"
.LASF260:
	.string	"_FEATURES_H 1"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF605:
	.string	"isSerialTransmitBufferEmpty"
.LASF219:
	.string	"__x86_64 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF593:
	.string	"rxBufferHead"
.LASF501:
	.string	"UART1_TX_PINSOURCE GPIO_PinSource6"
.LASF332:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF408:
	.string	"INT_LEAST8_MIN (-128)"
.LASF243:
	.string	"DEBUG 1"
.LASF362:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF614:
	.string	"serialPrint"
.LASF543:
	.string	"DEFAULT FEATURES FEATURE_MOTOR_STOP"
.LASF630:
	.string	"/home/aravind/git/cleanflight"
.LASF241:
	.string	"__ELF__ 1"
.LASF321:
	.string	"__CONCAT(x,y) x ## y"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF555:
	.string	"TARGET_IO_PORTB 0xffff"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF454:
	.string	"UINT64_C(c) c ## UL"
.LASF308:
	.string	"__GNU_LIBRARY__ 6"
.LASF0:
	.string	"__STDC__ 1"
.LASF230:
	.string	"__SSE2__ 1"
.LASF467:
	.string	"LED1_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF291:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF529:
	.string	"MPU6500_CS_GPIO_CLK_PERIPHERAL RCC_AHBPeriph_GPIOA"
.LASF416:
	.string	"UINT_LEAST8_MAX (255)"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF554:
	.string	"TARGET_IO_PORTA 0xffff"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF411:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF495:
	.string	"SERIAL_PORT_COUNT 2"
.LASF607:
	.string	"writeBuf"
.LASF295:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF432:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF551:
	.string	"HARDWARE_BIND_PLUG "
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF589:
	.string	"rxBufferSize"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF570:
	.string	"MODE_RX"
.LASF578:
	.string	"SERIAL_STOPBITS_2"
.LASF449:
	.string	"INT32_C(c) c"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF468:
	.string	"LED0_GPIO_2 GPIOB"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF281:
	.string	"__USE_GNU"
.LASF334:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF351:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF629:
	.string	"src/main/drivers/serial.c"
.LASF483:
	.string	"USE_ACC_MPU6050 "
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF296:
	.string	"__USE_POSIX 1"
.LASF553:
	.string	"BINDPLUG_PIN Pin_12"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF497:
	.string	"UART1_TX_PIN 1"
.LASF255:
	.string	"bool _Bool"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF588:
	.string	"baudRate"
.LASF350:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF444:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF278:
	.string	"__USE_FILE_OFFSET64"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF522:
	.string	"I2C2_SDA_GPIO GPIOA"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF365:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF404:
	.string	"UINT8_MAX (255)"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF310:
	.string	"__GLIBC_MINOR__ 23"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF333:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF596:
	.string	"txBufferTail"
.LASF280:
	.string	"__USE_ATFILE"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF565:
	.string	"uint16_t"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF314:
	.string	"__LEAF , __leaf__"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF283:
	.string	"__USE_FORTIFY_LEVEL"
.LASF450:
	.string	"INT64_C(c) c ## L"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF523:
	.string	"I2C2_SDA_GPIO_AF GPIO_AF_4"
.LASF592:
	.string	"txBuffer"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF335:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF456:
	.string	"UINTMAX_C(c) c ## UL"
.LASF322:
	.string	"__STRING(x) #x"
.LASF530:
	.string	"MPU6500_CS_GPIO GPIOA"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF396:
	.string	"INT8_MIN (-128)"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF440:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF482:
	.string	"ACC "
.LASF587:
	.string	"options"
.LASF428:
	.string	"UINT_FAST8_MAX (255)"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF381:
	.string	"__stub_getmsg "
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF619:
	.string	"serialRxBytesWaiting"
.LASF258:
	.string	"__bool_true_false_are_defined 1"
.LASF562:
	.string	"long int"
.LASF390:
	.string	"_BITS_WCHAR_H 1"
.LASF520:
	.string	"I2C2_SCL_PIN_SOURCE GPIO_PinSource9"
.LASF394:
	.string	"__uint32_t_defined "
.LASF266:
	.string	"__USE_POSIX2"
.LASF488:
	.string	"MAG "
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF425:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF571:
	.string	"MODE_TX"
.LASF573:
	.string	"portMode_t"
.LASF515:
	.string	"USE_I2C "
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF502:
	.string	"UART1_RX_PINSOURCE GPIO_PinSource7"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF489:
	.string	"USE_MAG_AK8963 "
.LASF385:
	.string	"__stub_revoke "
.LASF369:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF282:
	.string	"__USE_REENTRANT"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF519:
	.string	"I2C2_SCL_PIN GPIO_Pin_9"
.LASF388:
	.string	"__stub_sstk "
.LASF274:
	.string	"__USE_XOPEN2K8"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF518:
	.string	"I2C2_SCL_GPIO_AF GPIO_AF_4"
.LASF487:
	.string	"ACC_MPU6500_ALIGN CW270_DEG"
.LASF269:
	.string	"__USE_XOPEN"
.LASF526:
	.string	"I2C2_SDA_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF442:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF620:
	.string	"serialTxBytesFree"
.LASF402:
	.string	"INT32_MAX (2147483647)"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF346:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF279:
	.string	"__USE_MISC"
.LASF465:
	.string	"LED1_GPIO GPIOB"
.LASF490:
	.string	"MAG_AK8963_ALIGN CW0_DEG_FLIP"
.LASF301:
	.string	"__USE_XOPEN2K8 1"
.LASF331:
	.string	"__END_NAMESPACE_C99 "
.LASF433:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF423:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF585:
	.string	"identifier"
.LASF550:
	.string	"ALIENFLIGHT "
.LASF527:
	.string	"USE_SPI "
.LASF287:
	.string	"_DEFAULT_SOURCE"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF602:
	.string	"serialTotalTxFree"
.LASF336:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF470:
	.string	"LED0_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF376:
	.string	"__stub___compat_bdflush "
.LASF623:
	.string	"serialBeginWrite"
.LASF537:
	.string	"ADC0_GPIO GPIOA"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF309:
	.string	"__GLIBC__ 2"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF261:
	.string	"__USE_ISOC11"
.LASF569:
	.string	"long unsigned int"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF419:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF609:
	.string	"endWrite"
.LASF238:
	.string	"__unix 1"
.LASF494:
	.string	"USE_VCP "
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF624:
	.string	"serialEndWrite"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF228:
	.string	"__MMX__ 1"
.LASF374:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF532:
	.string	"MPU6500_SPI_INSTANCE SPI3"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF343:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF421:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF319:
	.string	"__P(args) args"
.LASF273:
	.string	"__USE_XOPEN2KXSI"
.LASF345:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF225:
	.string	"__k8 1"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF363:
	.string	"__restrict_arr __restrict"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF352:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF563:
	.string	"unsigned char"
.LASF608:
	.string	"beginWrite"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF360:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF438:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF429:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF546:
	.string	"USE_QUAD_MIXER_ONLY "
.LASF231:
	.string	"__FXSR__ 1"
.LASF315:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF500:
	.string	"UART1_GPIO_AF GPIO_AF_7"
.LASF293:
	.string	"_POSIX_SOURCE 1"
.LASF513:
	.string	"UART3_TX_PINSOURCE GPIO_PinSource10"
.LASF594:
	.string	"rxBufferTail"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF615:
	.string	"serialWriteBuf"
.LASF476:
	.string	"GYRO "
.LASF226:
	.string	"__k8__ 1"
.LASF475:
	.string	"USE_MPU_DATA_READY_SIGNAL "
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF460:
	.string	"HW_PIN Pin_2"
.LASF597:
	.string	"callback"
.LASF270:
	.string	"__USE_XOPEN_EXTENDED"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF420:
	.string	"INT_FAST8_MIN (-128)"
.LASF540:
	.string	"ADC_CHANNEL_COUNT 1"
.LASF583:
	.string	"serialReceiveCallbackPtr"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF354:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF582:
	.string	"SERIAL_BIDIR"
.LASF326:
	.string	"__END_DECLS "
.LASF579:
	.string	"SERIAL_PARITY_NO"
.LASF275:
	.string	"__USE_XOPEN2K8XSI"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF574:
	.string	"portOptions_t"
.LASF349:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF436:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF413:
	.string	"INT_LEAST16_MAX (32767)"
.LASF276:
	.string	"__USE_LARGEFILE"
.LASF474:
	.string	"USABLE_TIMER_CHANNEL_COUNT 11"
.LASF560:
	.string	"signed char"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF304:
	.string	"__USE_MISC 1"
.LASF541:
	.string	"ADC_BATTERY ADC_CHANNEL0"
.LASF566:
	.string	"short unsigned int"
.LASF538:
	.string	"ADC0_GPIO_PIN GPIO_Pin_4"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF229:
	.string	"__SSE__ 1"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF380:
	.string	"__stub_fdetach "
.LASF451:
	.string	"UINT8_C(c) c"
.LASF539:
	.string	"ADC0_CHANNEL ADC_Channel_1"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF337:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF548:
	.string	"BIND_PORT GPIOA"
.LASF621:
	.string	"serialSetMode"
.LASF409:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF547:
	.string	"USE_CLI "
.LASF342:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF485:
	.string	"USE_ACC_SPI_MPU6500 "
.LASF236:
	.string	"__linux__ 1"
.LASF367:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF469:
	.string	"LED0_PIN_2 Pin_8"
.LASF600:
	.string	"serialWrite"
.LASF422:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF503:
	.string	"UART2_TX_PIN GPIO_Pin_2"
.LASF535:
	.string	"ADC_DMA_CHANNEL DMA2_Channel1"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF505:
	.string	"UART2_GPIO GPIOA"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF257:
	.string	"false 0"
.LASF403:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF240:
	.string	"unix 1"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF484:
	.string	"USE_ACC_MPU6500 "
.LASF265:
	.string	"__USE_POSIX"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF410:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF368:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF531:
	.string	"MPU6500_CS_PIN GPIO_Pin_15"
.LASF383:
	.string	"__stub_lchmod "
.LASF437:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF373:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
