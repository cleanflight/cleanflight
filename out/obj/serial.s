	.file	"serial.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed serial.i -mtune=generic -march=x86-64 -g
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
	.section	.text.serialPrint,"ax",@progbits
	.globl	serialPrint
	.type	serialPrint, @function
serialPrint:
.LFB0:
	.file 1 "src/main/drivers/serial.c"
	.loc 1 27 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# instance, instance
	movq	%rsi, -32(%rbp)	# str, str
	.loc 1 29 0
	jmp	.L2	#
.L3:
	.loc 1 30 0
	movzbl	-1(%rbp), %edx	# ch, D.2533
	movq	-24(%rbp), %rax	# instance, tmp90
	movl	%edx, %esi	# D.2533,
	movq	%rax, %rdi	# tmp90,
	call	serialWrite	#
.L2:
	.loc 1 29 0
	movq	-32(%rbp), %rax	# str, D.2531
	leaq	1(%rax), %rdx	#, tmp91
	movq	%rdx, -32(%rbp)	# tmp91, str
	movzbl	(%rax), %eax	# *_5, D.2532
	movb	%al, -1(%rbp)	# D.2532, ch
	cmpb	$0, -1(%rbp)	#, ch
	jne	.L3	#,
	.loc 1 32 0
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
	.loc 1 35 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 36 0
	movq	-8(%rbp), %rax	# instance, tmp89
	movl	20(%rax), %eax	# instance_2(D)->baudRate, D.2534
	.loc 1 37 0
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
	.loc 1 40 0
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
	.loc 1 41 0
	movq	-8(%rbp), %rax	# instance, tmp91
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2535
	movq	(%rax), %rax	# _3->serialWrite, D.2536
	movzbl	-12(%rbp), %ecx	# ch, D.2537
	movq	-8(%rbp), %rdx	# instance, tmp92
	movl	%ecx, %esi	# D.2537,
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2536
	.loc 1 42 0
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
	.loc 1 46 0
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
	.loc 1 47 0
	movq	-24(%rbp), %rax	# instance, tmp94
	movq	(%rax), %rax	# instance_7(D)->vTable, D.2538
	movq	56(%rax), %rax	# _8->writeBuf, D.2539
	testq	%rax, %rax	# D.2539
	je	.L8	#,
	.loc 1 48 0
	movq	-24(%rbp), %rax	# instance, tmp95
	movq	(%rax), %rax	# instance_7(D)->vTable, D.2538
	movq	56(%rax), %rax	# _10->writeBuf, D.2539
	movl	-36(%rbp), %edx	# count, tmp96
	movq	-32(%rbp), %rsi	# data, tmp97
	movq	-24(%rbp), %rcx	# instance, tmp98
	movq	%rcx, %rdi	# tmp98,
	call	*%rax	# D.2539
	.loc 1 57 0
	jmp	.L13	#
.L8:
.LBB2:
	.loc 1 50 0
	movq	-32(%rbp), %rax	# data, tmp99
	movq	%rax, -8(%rbp)	# tmp99, p
	jmp	.L10	#
.L12:
	.loc 1 52 0
	nop
.L11:
	.loc 1 52 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax	# instance, tmp100
	movq	%rax, %rdi	# tmp100,
	call	serialTxBytesFree	#
	testb	%al, %al	# D.2540
	je	.L11	#,
	.loc 1 54 0 is_stmt 1 discriminator 2
	movq	-8(%rbp), %rax	# p, tmp101
	movzbl	(%rax), %eax	# *p_2, D.2540
	movzbl	%al, %edx	# D.2540, D.2541
	movq	-24(%rbp), %rax	# instance, tmp102
	movl	%edx, %esi	# D.2541,
	movq	%rax, %rdi	# tmp102,
	call	serialWrite	#
	.loc 1 50 0 discriminator 2
	subl	$1, -36(%rbp)	#, count
	addq	$1, -8(%rbp)	#, p
.L10:
	.loc 1 50 0 is_stmt 0 discriminator 1
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
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2542
	movq	8(%rax), %rax	# _3->serialTotalRxWaiting, D.2543
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2543
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
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2545
	movq	16(%rax), %rax	# _3->serialTotalTxFree, D.2546
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2546
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
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2548
	movq	24(%rax), %rax	# _3->serialRead, D.2549
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2549
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
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2551
	movq	32(%rax), %rax	# _3->serialSetBaudRate, D.2552
	movl	-12(%rbp), %ecx	# baudRate, tmp90
	movq	-8(%rbp), %rdx	# instance, tmp91
	movl	%ecx, %esi	# tmp90,
	movq	%rdx, %rdi	# tmp91,
	call	*%rax	# D.2552
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
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2553
	movq	40(%rax), %rax	# _3->isSerialTransmitBufferEmpty, D.2554
	movq	-8(%rbp), %rdx	# instance, tmp92
	movq	%rdx, %rdi	# tmp92,
	call	*%rax	# D.2554
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
	movq	(%rax), %rax	# instance_2(D)->vTable, D.2556
	movq	48(%rax), %rax	# _3->setMode, D.2557
	movl	-12(%rbp), %ecx	# mode, tmp90
	movq	-8(%rbp), %rdx	# instance, tmp91
	movl	%ecx, %esi	# tmp90,
	movq	%rdx, %rdi	# tmp91,
	call	*%rax	# D.2557
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
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2558
	movq	64(%rax), %rax	# _4->beginWrite, D.2559
	testq	%rax, %rax	# D.2559
	je	.L27	#,
	.loc 1 97 0
	movq	-8(%rbp), %rax	# instance, tmp92
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2558
	movq	64(%rax), %rax	# _6->beginWrite, D.2559
	movq	-8(%rbp), %rdx	# instance, tmp93
	movq	%rdx, %rdi	# tmp93,
	call	*%rax	# D.2559
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
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2560
	movq	72(%rax), %rax	# _4->endWrite, D.2561
	testq	%rax, %rax	# D.2561
	je	.L30	#,
	.loc 1 103 0
	movq	-8(%rbp), %rax	# instance, tmp92
	movq	(%rax), %rax	# instance_3(D)->vTable, D.2560
	movq	72(%rax), %rax	# _6->endWrite, D.2561
	movq	-8(%rbp), %rdx	# instance, tmp93
	movq	%rdx, %rdi	# tmp93,
	call	*%rax	# D.2561
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
	.long	0x65f
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF69
	.byte	0xc
	.long	.LASF70
	.long	.LASF71
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
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
	.uleb128 0x5
	.byte	0x8
	.long	0x77
	.uleb128 0x6
	.long	0x6a
	.uleb128 0x7
	.long	.LASF9
	.byte	0x2
	.byte	0x30
	.long	0x30
	.uleb128 0x7
	.long	.LASF10
	.byte	0x2
	.byte	0x31
	.long	0x37
	.uleb128 0x7
	.long	.LASF11
	.byte	0x2
	.byte	0x33
	.long	0x3e
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.long	0x3e
	.byte	0x3
	.byte	0x14
	.long	0xc0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x1
	.uleb128 0x9
	.long	.LASF13
	.byte	0x2
	.uleb128 0x9
	.long	.LASF14
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF15
	.byte	0x3
	.byte	0x18
	.long	0x9d
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.long	0x3e
	.byte	0x3
	.byte	0x1a
	.long	0x10c
	.uleb128 0x9
	.long	.LASF17
	.byte	0
	.uleb128 0x9
	.long	.LASF18
	.byte	0x1
	.uleb128 0x9
	.long	.LASF19
	.byte	0
	.uleb128 0x9
	.long	.LASF20
	.byte	0x2
	.uleb128 0x9
	.long	.LASF21
	.byte	0
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.uleb128 0x9
	.long	.LASF23
	.byte	0
	.uleb128 0x9
	.long	.LASF24
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF16
	.byte	0x3
	.byte	0x23
	.long	0xcb
	.uleb128 0x7
	.long	.LASF25
	.byte	0x3
	.byte	0x25
	.long	0x122
	.uleb128 0x5
	.byte	0x8
	.long	0x128
	.uleb128 0xa
	.long	0x133
	.uleb128 0xb
	.long	0x87
	.byte	0
	.uleb128 0xc
	.long	.LASF40
	.byte	0x48
	.byte	0x3
	.byte	0x27
	.long	0x1e8
	.uleb128 0xd
	.long	.LASF26
	.byte	0x3
	.byte	0x29
	.long	0x26d
	.byte	0
	.uleb128 0xd
	.long	.LASF27
	.byte	0x3
	.byte	0x2b
	.long	0x7c
	.byte	0x8
	.uleb128 0xd
	.long	.LASF28
	.byte	0x3
	.byte	0x2c
	.long	0xc0
	.byte	0xc
	.uleb128 0xd
	.long	.LASF29
	.byte	0x3
	.byte	0x2d
	.long	0x10c
	.byte	0x10
	.uleb128 0xd
	.long	.LASF30
	.byte	0x3
	.byte	0x2f
	.long	0x92
	.byte	0x14
	.uleb128 0xd
	.long	.LASF31
	.byte	0x3
	.byte	0x31
	.long	0x92
	.byte	0x18
	.uleb128 0xd
	.long	.LASF32
	.byte	0x3
	.byte	0x32
	.long	0x92
	.byte	0x1c
	.uleb128 0xd
	.long	.LASF33
	.byte	0x3
	.byte	0x33
	.long	0x278
	.byte	0x20
	.uleb128 0xd
	.long	.LASF34
	.byte	0x3
	.byte	0x34
	.long	0x278
	.byte	0x28
	.uleb128 0xd
	.long	.LASF35
	.byte	0x3
	.byte	0x35
	.long	0x92
	.byte	0x30
	.uleb128 0xd
	.long	.LASF36
	.byte	0x3
	.byte	0x36
	.long	0x92
	.byte	0x34
	.uleb128 0xd
	.long	.LASF37
	.byte	0x3
	.byte	0x37
	.long	0x92
	.byte	0x38
	.uleb128 0xd
	.long	.LASF38
	.byte	0x3
	.byte	0x38
	.long	0x92
	.byte	0x3c
	.uleb128 0xd
	.long	.LASF39
	.byte	0x3
	.byte	0x3b
	.long	0x117
	.byte	0x40
	.byte	0
	.uleb128 0xc
	.long	.LASF41
	.byte	0x50
	.byte	0x3
	.byte	0x3e
	.long	0x26d
	.uleb128 0xd
	.long	.LASF42
	.byte	0x3
	.byte	0x3f
	.long	0x2a4
	.byte	0
	.uleb128 0xd
	.long	.LASF43
	.byte	0x3
	.byte	0x41
	.long	0x2b9
	.byte	0x8
	.uleb128 0xd
	.long	.LASF44
	.byte	0x3
	.byte	0x42
	.long	0x2b9
	.byte	0x10
	.uleb128 0xd
	.long	.LASF45
	.byte	0x3
	.byte	0x44
	.long	0x2b9
	.byte	0x18
	.uleb128 0xd
	.long	.LASF46
	.byte	0x3
	.byte	0x47
	.long	0x2cf
	.byte	0x20
	.uleb128 0xd
	.long	.LASF47
	.byte	0x3
	.byte	0x49
	.long	0x2eb
	.byte	0x28
	.uleb128 0xd
	.long	.LASF48
	.byte	0x3
	.byte	0x4b
	.long	0x301
	.byte	0x30
	.uleb128 0xd
	.long	.LASF49
	.byte	0x3
	.byte	0x4d
	.long	0x31c
	.byte	0x38
	.uleb128 0xd
	.long	.LASF50
	.byte	0x3
	.byte	0x4f
	.long	0x32d
	.byte	0x40
	.uleb128 0xd
	.long	.LASF51
	.byte	0x3
	.byte	0x50
	.long	0x32d
	.byte	0x48
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x273
	.uleb128 0x6
	.long	0x1e8
	.uleb128 0x5
	.byte	0x8
	.long	0x27e
	.uleb128 0xe
	.long	0x7c
	.uleb128 0x7
	.long	.LASF52
	.byte	0x3
	.byte	0x3c
	.long	0x133
	.uleb128 0xa
	.long	0x29e
	.uleb128 0xb
	.long	0x29e
	.uleb128 0xb
	.long	0x7c
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x283
	.uleb128 0x5
	.byte	0x8
	.long	0x28e
	.uleb128 0xf
	.long	0x7c
	.long	0x2b9
	.uleb128 0xb
	.long	0x29e
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x2aa
	.uleb128 0xa
	.long	0x2cf
	.uleb128 0xb
	.long	0x29e
	.uleb128 0xb
	.long	0x92
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x2bf
	.uleb128 0xf
	.long	0x2e4
	.long	0x2e4
	.uleb128 0xb
	.long	0x29e
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF53
	.uleb128 0x5
	.byte	0x8
	.long	0x2d5
	.uleb128 0xa
	.long	0x301
	.uleb128 0xb
	.long	0x29e
	.uleb128 0xb
	.long	0xc0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x2f1
	.uleb128 0xa
	.long	0x31c
	.uleb128 0xb
	.long	0x29e
	.uleb128 0xb
	.long	0x68
	.uleb128 0xb
	.long	0x53
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x307
	.uleb128 0xa
	.long	0x32d
	.uleb128 0xb
	.long	0x29e
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x322
	.uleb128 0x10
	.long	.LASF55
	.byte	0x1
	.byte	0x1a
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x37a
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x1a
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.string	"str"
	.byte	0x1
	.byte	0x1a
	.long	0x71
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.string	"ch"
	.byte	0x1
	.byte	0x1c
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x14
	.long	.LASF59
	.byte	0x1
	.byte	0x22
	.long	0x92
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x3aa
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x22
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF42
	.byte	0x1
	.byte	0x27
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x3e3
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x27
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"ch"
	.byte	0x1
	.byte	0x27
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x10
	.long	.LASF56
	.byte	0x1
	.byte	0x2d
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x449
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x2d
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.long	.LASF57
	.byte	0x1
	.byte	0x2d
	.long	0x449
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF58
	.byte	0x1
	.byte	0x2d
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x13
	.string	"p"
	.byte	0x1
	.byte	0x32
	.long	0x449
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x7c
	.uleb128 0x16
	.long	.LASF60
	.byte	0x1
	.byte	0x3b
	.long	0x7c
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x47f
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x3b
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF61
	.byte	0x1
	.byte	0x40
	.long	0x7c
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x4af
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x40
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF45
	.byte	0x1
	.byte	0x45
	.long	0x7c
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x4df
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x45
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF46
	.byte	0x1
	.byte	0x4a
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x519
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x4a
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF30
	.byte	0x1
	.byte	0x4a
	.long	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x16
	.long	.LASF47
	.byte	0x1
	.byte	0x4f
	.long	0x2e4
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x549
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x4f
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF62
	.byte	0x1
	.byte	0x54
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x583
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x54
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF28
	.byte	0x1
	.byte	0x54
	.long	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x10
	.long	.LASF63
	.byte	0x1
	.byte	0x59
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x5cb
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x59
	.long	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF57
	.byte	0x1
	.byte	0x59
	.long	0x449
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.long	.LASF58
	.byte	0x1
	.byte	0x59
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x10
	.long	.LASF64
	.byte	0x1
	.byte	0x5e
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x5f7
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x5e
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF65
	.byte	0x1
	.byte	0x64
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x623
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x64
	.long	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	.LASF66
	.byte	0x4
	.byte	0xc8
	.long	0x92
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x17
	.long	.LASF67
	.byte	0x4
	.byte	0xc9
	.long	0x92
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x17
	.long	.LASF68
	.byte	0x4
	.byte	0xca
	.long	0x92
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF58:
	.string	"count"
.LASF13:
	.string	"MODE_TX"
.LASF23:
	.string	"SERIAL_UNIDIR"
.LASF25:
	.string	"serialReceiveCallbackPtr"
.LASF32:
	.string	"txBufferSize"
.LASF61:
	.string	"serialTxBytesFree"
.LASF67:
	.string	"U_ID_1"
.LASF68:
	.string	"U_ID_2"
.LASF54:
	.string	"instance"
.LASF43:
	.string	"serialTotalRxWaiting"
.LASF4:
	.string	"signed char"
.LASF33:
	.string	"rxBuffer"
.LASF6:
	.string	"long int"
.LASF51:
	.string	"endWrite"
.LASF15:
	.string	"portMode_t"
.LASF27:
	.string	"identifier"
.LASF10:
	.string	"uint16_t"
.LASF19:
	.string	"SERIAL_STOPBITS_1"
.LASF20:
	.string	"SERIAL_STOPBITS_2"
.LASF29:
	.string	"options"
.LASF49:
	.string	"writeBuf"
.LASF35:
	.string	"rxBufferHead"
.LASF62:
	.string	"serialSetMode"
.LASF3:
	.string	"unsigned int"
.LASF42:
	.string	"serialWrite"
.LASF45:
	.string	"serialRead"
.LASF69:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF0:
	.string	"long unsigned int"
.LASF36:
	.string	"rxBufferTail"
.LASF57:
	.string	"data"
.LASF2:
	.string	"short unsigned int"
.LASF65:
	.string	"serialEndWrite"
.LASF39:
	.string	"callback"
.LASF24:
	.string	"SERIAL_BIDIR"
.LASF50:
	.string	"beginWrite"
.LASF26:
	.string	"vTable"
.LASF46:
	.string	"serialSetBaudRate"
.LASF7:
	.string	"sizetype"
.LASF41:
	.string	"serialPortVTable"
.LASF47:
	.string	"isSerialTransmitBufferEmpty"
.LASF66:
	.string	"U_ID_0"
.LASF60:
	.string	"serialRxBytesWaiting"
.LASF71:
	.string	"/home/aravind/git/cleanflight"
.LASF59:
	.string	"serialGetBaudRate"
.LASF53:
	.string	"_Bool"
.LASF1:
	.string	"unsigned char"
.LASF31:
	.string	"rxBufferSize"
.LASF5:
	.string	"short int"
.LASF38:
	.string	"txBufferTail"
.LASF44:
	.string	"serialTotalTxFree"
.LASF56:
	.string	"serialWriteBuf"
.LASF30:
	.string	"baudRate"
.LASF22:
	.string	"SERIAL_PARITY_EVEN"
.LASF16:
	.string	"portOptions_t"
.LASF37:
	.string	"txBufferHead"
.LASF11:
	.string	"uint32_t"
.LASF63:
	.string	"serialWriteBufShim"
.LASF8:
	.string	"char"
.LASF28:
	.string	"mode"
.LASF12:
	.string	"MODE_RX"
.LASF14:
	.string	"MODE_RXTX"
.LASF64:
	.string	"serialBeginWrite"
.LASF18:
	.string	"SERIAL_INVERTED"
.LASF48:
	.string	"setMode"
.LASF55:
	.string	"serialPrint"
.LASF70:
	.string	"src/main/drivers/serial.c"
.LASF34:
	.string	"txBuffer"
.LASF17:
	.string	"SERIAL_NOT_INVERTED"
.LASF9:
	.string	"uint8_t"
.LASF21:
	.string	"SERIAL_PARITY_NO"
.LASF40:
	.string	"serialPort_s"
.LASF52:
	.string	"serialPort_t"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
