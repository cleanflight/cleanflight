	.file	"msp_serial.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed msp_serial.i -mtune=generic -march=x86-64
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
	.comm	U_ID_0,4,4
	.comm	U_ID_1,4,4
	.comm	U_ID_2,4,4
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	serialConfig_System,28,16
	.comm	receiveLength,4,4
	.globl	mspPostProcessFn
	.section	.bss.mspPostProcessFn,"aw",@nobits
	.align 8
	.type	mspPostProcessFn, @object
	.size	mspPostProcessFn, 8
mspPostProcessFn:
	.zero	8
	.comm	mspPorts,192,32
	.section	.text.resetMspPort,"ax",@progbits
	.type	resetMspPort, @function
resetMspPort:
.LFB9:
	.file 1 "src/main/msp/msp_serial.c"
	.loc 1 53 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# mspPortToReset, mspPortToReset
	movq	%rsi, -16(%rbp)	# serialPort, serialPort
	.loc 1 54 0
	movq	-8(%rbp), %rax	# mspPortToReset, tmp87
	movl	$96, %edx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp87,
	call	memset	#
	.loc 1 56 0
	movq	-8(%rbp), %rax	# mspPortToReset, tmp88
	movq	-16(%rbp), %rdx	# serialPort, tmp89
	movq	%rdx, (%rax)	# tmp89, mspPortToReset_2(D)->port
	.loc 1 57 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	resetMspPort, .-resetMspPort
	.section	.text.mspPortFindFree,"ax",@progbits
	.type	mspPortFindFree, @function
mspPortFindFree:
.LFB10:
	.loc 1 60 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
.LBB2:
	.loc 1 61 0
	movl	$0, -4(%rbp)	#, i
	jmp	.L3	#
.L6:
	.loc 1 62 0
	movl	-4(%rbp), %eax	# i, tmp91
	movslq	%eax, %rdx	# tmp91, tmp90
	movq	%rdx, %rax	# tmp90, tmp93
	addq	%rax, %rax	# tmp93
	addq	%rdx, %rax	# tmp90, tmp93
	salq	$5, %rax	#, tmp94
	addq	$mspPorts, %rax	#, tmp95
	movq	(%rax), %rax	# mspPorts[i_1].port, D.5448
	testq	%rax, %rax	# D.5448
	jne	.L4	#,
	.loc 1 63 0
	movl	-4(%rbp), %eax	# i, tmp97
	movslq	%eax, %rdx	# tmp97, tmp96
	movq	%rdx, %rax	# tmp96, tmp98
	addq	%rax, %rax	# tmp98
	addq	%rdx, %rax	# tmp96, tmp98
	salq	$5, %rax	#, tmp99
	addq	$mspPorts, %rax	#, D.5447
	jmp	.L5	#
.L4:
	.loc 1 61 0 discriminator 2
	addl	$1, -4(%rbp)	#, i
.L3:
	.loc 1 61 0 is_stmt 0 discriminator 1
	cmpl	$1, -4(%rbp)	#, i
	jle	.L6	#,
.LBE2:
	.loc 1 64 0 is_stmt 1
	movl	$0, %eax	#, D.5447
.L5:
	.loc 1 65 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	mspPortFindFree, .-mspPortFindFree
	.section	.rodata
.LC0:
	.string	"Error"
	.section	.text.mspSerialAllocatePorts,"ax",@progbits
	.globl	mspSerialAllocatePorts
	.type	mspSerialAllocatePorts, @function
mspSerialAllocatePorts:
.LFB11:
	.loc 1 68 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
.LBB3:
	.loc 1 69 0
	movl	$513, %edi	#,
	call	findSerialPortConfig	#
	movq	%rax, -24(%rbp)	# tmp94, portConfig
	jmp	.L8	#
.L14:
.LBB4:
	.loc 1 72 0
	movq	-24(%rbp), %rax	# portConfig, tmp95
	movq	%rax, %rdi	# tmp95,
	call	isSerialPortOpen	#
	testb	%al, %al	# D.5449
	jne	.L15	#,
	.loc 1 77 0
	call	mspPortFindFree	#
	movq	%rax, -16(%rbp)	# tmp96, mspPort
	.loc 1 78 0
	cmpq	$0, -16(%rbp)	#, mspPort
	je	.L16	#,
	.loc 1 84 0
	movq	-24(%rbp), %rax	# portConfig, tmp97
	movzwl	4(%rax), %eax	# portConfig_1->functionMask, D.5450
	andw	$513, %ax	#, tmp98
	movw	%ax, -30(%rbp)	# tmp98, function
	.loc 1 87 0
	movb	$0, -31(%rbp)	#, baudRatesIndex
	.loc 1 88 0
	movl	$0, -28(%rbp)	#, mode
	.loc 1 98 0
	movzbl	-31(%rbp), %eax	# baudRatesIndex, D.5451
	movq	-24(%rbp), %rdx	# portConfig, tmp99
	cltq
	movzbl	6(%rdx,%rax), %eax	# portConfig_1->baudRates, D.5452
	.loc 1 97 0
	movzbl	%al, %eax	# D.5452, D.5451
	cltq
	movl	baudRates(,%rax,4), %edx	# baudRates, D.5453
	movzwl	-30(%rbp), %eax	# function, D.5454
	movl	$0, %r9d	#,
	movl	$3, %r8d	#,
	movl	%edx, %ecx	# D.5453,
	movl	$0, %edx	#,
	movl	%eax, %esi	# D.5454,
	movl	$20, %edi	#,
	call	openSerialPort	#
	movq	%rax, -8(%rbp)	# tmp102, serialPort
	.loc 1 99 0
	cmpq	$0, -8(%rbp)	#, serialPort
	je	.L13	#,
	.loc 1 100 0
	movq	-8(%rbp), %rdx	# serialPort, tmp103
	movq	-16(%rbp), %rax	# mspPort, tmp104
	movq	%rdx, %rsi	# tmp103,
	movq	%rax, %rdi	# tmp104,
	call	resetMspPort	#
	.loc 1 101 0
	movq	-16(%rbp), %rax	# mspPort, tmp105
	movl	-28(%rbp), %edx	# mode, tmp106
	movl	%edx, 8(%rax)	# tmp106, mspPort_13->mode
	jmp	.L10	#
.L13:
	.loc 1 103 0
	movl	$.LC0, %edi	#,
	call	puts	#
	jmp	.L10	#
.L15:
	.loc 1 73 0
	nop
.L10:
.LBE4:
	.loc 1 71 0
	movl	$513, %edi	#,
	call	findNextSerialPortConfig	#
	movq	%rax, -24(%rbp)	# tmp107, portConfig
.L8:
	.loc 1 69 0 discriminator 1
	cmpq	$0, -24(%rbp)	#, portConfig
	jne	.L14	#,
	jmp	.L7	#
.L16:
.LBB5:
	.loc 1 81 0
	nop
.L7:
.LBE5:
.LBE3:
	.loc 1 107 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	mspSerialAllocatePorts, .-mspSerialAllocatePorts
	.section	.text.mspSerialReleasePortIfAllocated,"ax",@progbits
	.globl	mspSerialReleasePortIfAllocated
	.type	mspSerialReleasePortIfAllocated, @function
mspSerialReleasePortIfAllocated:
.LFB12:
	.loc 1 110 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# serialPort, serialPort
.LBB6:
	.loc 1 111 0
	movl	$0, -12(%rbp)	#, i
	jmp	.L18	#
.L20:
.LBB7:
	.loc 1 112 0
	movl	-12(%rbp), %eax	# i, tmp90
	movslq	%eax, %rdx	# tmp90, tmp89
	movq	%rdx, %rax	# tmp89, tmp91
	addq	%rax, %rax	# tmp91
	addq	%rdx, %rax	# tmp89, tmp91
	salq	$5, %rax	#, tmp92
	addq	$mspPorts, %rax	#, tmp93
	movq	%rax, -8(%rbp)	# tmp93, mspPort
	.loc 1 113 0
	movq	-8(%rbp), %rax	# mspPort, tmp94
	movq	(%rax), %rax	# mspPort_6->port, D.5456
	cmpq	-24(%rbp), %rax	# serialPort, D.5456
	jne	.L19	#,
	.loc 1 114 0
	movq	-8(%rbp), %rax	# mspPort, tmp95
	movq	(%rax), %rax	# mspPort_6->port, D.5456
	movq	%rax, %rdi	# D.5456,
	call	closeSerialPort	#
	.loc 1 115 0
	movq	-8(%rbp), %rax	# mspPort, tmp96
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp96,
	call	resetMspPort	#
.L19:
.LBE7:
	.loc 1 111 0 discriminator 2
	addl	$1, -12(%rbp)	#, i
.L18:
	.loc 1 111 0 is_stmt 0 discriminator 1
	cmpl	$1, -12(%rbp)	#, i
	jle	.L20	#,
.LBE6:
	.loc 1 118 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	mspSerialReleasePortIfAllocated, .-mspSerialReleasePortIfAllocated
	.section	.text.mspSerialInit,"ax",@progbits
	.globl	mspSerialInit
	.type	mspSerialInit, @function
mspSerialInit:
.LFB13:
	.loc 1 121 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
.LBB8:
	.loc 1 122 0
	movl	$0, -4(%rbp)	#, i
	jmp	.L22	#
.L23:
	.loc 1 123 0 discriminator 3
	movl	-4(%rbp), %eax	# i, tmp89
	movslq	%eax, %rdx	# tmp89, tmp88
	movq	%rdx, %rax	# tmp88, tmp90
	addq	%rax, %rax	# tmp90
	addq	%rdx, %rax	# tmp88, tmp90
	salq	$5, %rax	#, tmp91
	addq	$mspPorts, %rax	#, D.5457
	movl	$0, %esi	#,
	movq	%rax, %rdi	# D.5457,
	call	resetMspPort	#
	.loc 1 122 0 discriminator 3
	addl	$1, -4(%rbp)	#, i
.L22:
	.loc 1 122 0 is_stmt 0 discriminator 1
	cmpl	$1, -4(%rbp)	#, i
	jle	.L23	#,
.LBE8:
	.loc 1 125 0 is_stmt 1
	call	mspSerialAllocatePorts	#
	.loc 1 126 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	mspSerialInit, .-mspSerialInit
	.section	.text.mspSerialChecksum,"ax",@progbits
	.type	mspSerialChecksum, @function
mspSerialChecksum:
.LFB14:
	.loc 1 129 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %edx	# checksum, tmp89
	movl	%esi, %eax	# byte, tmp90
	movb	%dl, -4(%rbp)	# tmp89, checksum
	movb	%al, -8(%rbp)	# tmp90, byte
	.loc 1 130 0
	movzbl	-4(%rbp), %eax	# checksum, tmp91
	xorb	-8(%rbp), %al	# byte, D.5458
	.loc 1 131 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	mspSerialChecksum, .-mspSerialChecksum
	.section	.text.mspSerialChecksumBuf,"ax",@progbits
	.type	mspSerialChecksumBuf, @function
mspSerialChecksumBuf:
.LFB15:
	.loc 1 134 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, %eax	# checksum, tmp94
	movq	%rsi, -16(%rbp)	# data, data
	movl	%edx, -8(%rbp)	# len, len
	movb	%al, -4(%rbp)	# tmp94, checksum
	.loc 1 135 0
	jmp	.L27	#
.L28:
	.loc 1 136 0
	movq	-16(%rbp), %rax	# data, D.5460
	leaq	1(%rax), %rdx	#, tmp95
	movq	%rdx, -16(%rbp)	# tmp95, data
	movzbl	(%rax), %eax	# *_11, D.5461
	movzbl	%al, %edx	# D.5461, D.5459
	movzbl	-4(%rbp), %eax	# checksum, D.5459
	movl	%edx, %esi	# D.5459,
	movl	%eax, %edi	# D.5459,
	call	mspSerialChecksum	#
	movb	%al, -4(%rbp)	# tmp96, checksum
.L27:
	.loc 1 135 0
	movl	-8(%rbp), %eax	# len, D.5459
	leal	-1(%rax), %edx	#, tmp97
	movl	%edx, -8(%rbp)	# tmp97, len
	testl	%eax, %eax	# D.5459
	jg	.L28	#,
	.loc 1 139 0
	movzbl	-4(%rbp), %eax	# checksum, D.5462
	.loc 1 140 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	mspSerialChecksumBuf, .-mspSerialChecksumBuf
	.section	.text.mspSerialEncode,"ax",@progbits
	.globl	mspSerialEncode
	.type	mspSerialEncode, @function
mspSerialEncode:
.LFB16:
	.loc 1 143 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# msp, msp
	movq	%rsi, -48(%rbp)	# packet, packet
	.loc 1 143 0
	movq	%fs:40, %rax	#, tmp122
	movq	%rax, -8(%rbp)	# tmp122, D.5470
	xorl	%eax, %eax	# tmp122
	.loc 1 145 0
	movq	-40(%rbp), %rax	# msp, tmp107
	movq	(%rax), %rax	# msp_6(D)->port, D.5464
	movq	%rax, %rdi	# D.5464,
	call	serialBeginWrite	#
	.loc 1 146 0
	movq	-48(%rbp), %rax	# packet, D.5465
	movq	%rax, %rdi	# D.5465,
	call	sbufBytesRemaining	#
	movl	%eax, -20(%rbp)	# tmp108, len
	.loc 1 147 0
	movb	$36, -16(%rbp)	#, hdr
	movb	$77, -15(%rbp)	#, hdr
	movq	-48(%rbp), %rax	# packet, tmp109
	movzwl	18(%rax), %eax	# packet_9(D)->result, D.5466
	testw	%ax, %ax	# D.5466
	js	.L31	#,
	.loc 1 147 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# msp, tmp110
	movl	8(%rax), %eax	# msp_6(D)->mode, D.5467
	testl	%eax, %eax	# D.5467
	jne	.L32	#,
	.loc 1 147 0 discriminator 3
	movl	$62, %eax	#, D.5463
	jmp	.L34	#
.L32:
	.loc 1 147 0 discriminator 4
	movl	$60, %eax	#, D.5463
	jmp	.L34	#
.L31:
	.loc 1 147 0 discriminator 2
	movl	$33, %eax	#, D.5463
.L34:
	.loc 1 147 0 discriminator 8
	movb	%al, -14(%rbp)	# D.5463, hdr
	movl	-20(%rbp), %eax	# len, tmp111
	movb	%al, -13(%rbp)	# D.5463, hdr
	movq	-48(%rbp), %rax	# packet, tmp112
	movzwl	16(%rax), %eax	# packet_9(D)->cmd, D.5466
	movb	%al, -12(%rbp)	# D.5463, hdr
	.loc 1 148 0 is_stmt 1 discriminator 8
	movb	$0, -21(%rbp)	#, csum
	.loc 1 149 0 discriminator 8
	movq	-40(%rbp), %rax	# msp, tmp113
	movq	(%rax), %rax	# msp_6(D)->port, D.5464
	leaq	-16(%rbp), %rcx	#, tmp114
	movl	$5, %edx	#,
	movq	%rcx, %rsi	# tmp114,
	movq	%rax, %rdi	# D.5464,
	call	serialWriteBuf	#
	.loc 1 150 0 discriminator 8
	leaq	-16(%rbp), %rax	#, D.5468
	addq	$3, %rax	#, D.5468
	movzbl	-21(%rbp), %ecx	# csum, D.5469
	movl	$2, %edx	#,
	movq	%rax, %rsi	# D.5468,
	movl	%ecx, %edi	# D.5469,
	call	mspSerialChecksumBuf	#
	movb	%al, -21(%rbp)	# tmp115, csum
	.loc 1 151 0 discriminator 8
	cmpl	$0, -20(%rbp)	#, len
	jle	.L35	#,
	.loc 1 152 0
	movq	-48(%rbp), %rax	# packet, D.5465
	movq	%rax, %rdi	# D.5465,
	call	sbufPtr	#
	movq	%rax, %rcx	#, D.5468
	movq	-40(%rbp), %rax	# msp, tmp116
	movq	(%rax), %rax	# msp_6(D)->port, D.5464
	movl	-20(%rbp), %edx	# len, tmp117
	movq	%rcx, %rsi	# D.5468,
	movq	%rax, %rdi	# D.5464,
	call	serialWriteBuf	#
	.loc 1 153 0
	movq	-48(%rbp), %rax	# packet, D.5465
	movq	%rax, %rdi	# D.5465,
	call	sbufPtr	#
	movq	%rax, %rcx	#, D.5468
	movzbl	-21(%rbp), %eax	# csum, D.5469
	movl	-20(%rbp), %edx	# len, tmp118
	movq	%rcx, %rsi	# D.5468,
	movl	%eax, %edi	# D.5469,
	call	mspSerialChecksumBuf	#
	movb	%al, -21(%rbp)	# tmp119, csum
.L35:
	.loc 1 155 0
	movzbl	-21(%rbp), %edx	# csum, D.5469
	movq	-40(%rbp), %rax	# msp, tmp120
	movq	(%rax), %rax	# msp_6(D)->port, D.5464
	movl	%edx, %esi	# D.5469,
	movq	%rax, %rdi	# D.5464,
	call	serialWrite	#
	.loc 1 156 0
	movq	-40(%rbp), %rax	# msp, tmp121
	movq	(%rax), %rax	# msp_6(D)->port, D.5464
	movq	%rax, %rdi	# D.5464,
	call	serialEndWrite	#
	.loc 1 157 0
	nop
	movq	-8(%rbp), %rax	# D.5470, tmp123
	xorq	%fs:40, %rax	#, tmp123
	je	.L36	#,
	call	__stack_chk_fail	#
.L36:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	mspSerialEncode, .-mspSerialEncode
	.section	.rodata
.LC1:
	.string	"Writing to PC"
	.section	.text.mspSerialProcessReceivedCommand,"ax",@progbits
	.type	mspSerialProcessReceivedCommand, @function
mspSerialProcessReceivedCommand:
.LFB17:
	.loc 1 160 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$384, %rsp	#,
	movq	%rdi, -376(%rbp)	# msp, msp
	.loc 1 160 0
	movq	%fs:40, %rax	#, tmp112
	movq	%rax, -8(%rbp)	# tmp112, D.5479
	xorl	%eax, %eax	# tmp112
	.loc 1 163 0
	leaq	-272(%rbp), %rax	#, tmp95
	movq	%rax, -336(%rbp)	# tmp95, message.buf.ptr
	leaq	-272(%rbp), %rax	#, tmp96
	addq	$256, %rax	#, tmp97
	movq	%rax, -328(%rbp)	# tmp97, message.buf.end
	movw	$-1, -320(%rbp)	#, message.cmd
	movw	$0, -318(%rbp)	#, message.result
	.loc 1 174 0
	movq	-376(%rbp), %rax	# msp, tmp98
	addq	$31, %rax	#, D.5473
	.loc 1 172 0
	movq	%rax, -304(%rbp)	# D.5473, command.buf.ptr
	.loc 1 175 0
	movq	-376(%rbp), %rax	# msp, tmp99
	leaq	31(%rax), %rdx	#, D.5473
	movq	-376(%rbp), %rax	# msp, tmp100
	movzbl	29(%rax), %eax	# msp_7(D)->dataSize, D.5474
	movzbl	%al, %eax	# D.5474, D.5475
	addq	%rdx, %rax	# D.5473, D.5476
	.loc 1 172 0
	movq	%rax, -296(%rbp)	# D.5476, command.buf.end
	.loc 1 177 0
	movq	-376(%rbp), %rax	# msp, tmp101
	movzbl	30(%rax), %eax	# msp_7(D)->cmdMSP, D.5474
	.loc 1 172 0
	movzbl	%al, %eax	# D.5474, D.5477
	movw	%ax, -288(%rbp)	# D.5477, command.cmd
	movw	$0, -286(%rbp)	#, command.result
	.loc 1 181 0
	leaq	-336(%rbp), %rax	#, tmp102
	movq	%rax, -352(%rbp)	# tmp102, reply
	.loc 1 183 0
	movq	-352(%rbp), %rax	# reply, tmp103
	movq	(%rax), %rax	# reply_19->buf.ptr, tmp104
	movq	%rax, -344(%rbp)	# tmp104, outBufHead
	.loc 1 184 0
	movq	-352(%rbp), %rdx	# reply, tmp105
	leaq	-304(%rbp), %rax	#, tmp106
	movq	%rdx, %rsi	# tmp105,
	movq	%rax, %rdi	# tmp106,
	call	mspProcessCommand	#
	movl	%eax, -356(%rbp)	# tmp107, status
	.loc 1 186 0
	cmpl	$0, -356(%rbp)	#, status
	je	.L38	#,
	.loc 1 187 0
	movl	$.LC1, %edi	#,
	call	puts	#
	.loc 1 189 0
	movq	-352(%rbp), %rax	# reply, D.5478
	movq	-344(%rbp), %rdx	# outBufHead, tmp108
	movq	%rdx, %rsi	# tmp108,
	movq	%rax, %rdi	# D.5478,
	call	sbufSwitchToReader	#
	.loc 1 190 0
	movq	-352(%rbp), %rdx	# reply, tmp109
	movq	-376(%rbp), %rax	# msp, tmp110
	movq	%rdx, %rsi	# tmp109,
	movq	%rax, %rdi	# tmp110,
	call	mspSerialEncode	#
.L38:
	.loc 1 193 0
	movq	-376(%rbp), %rax	# msp, tmp111
	movl	$0, 24(%rax)	#, msp_7(D)->c_state
	.loc 1 194 0
	nop
	movq	-8(%rbp), %rax	# D.5479, tmp113
	xorq	%fs:40, %rax	#, tmp113
	je	.L39	#,
	call	__stack_chk_fail	#
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	mspSerialProcessReceivedCommand, .-mspSerialProcessReceivedCommand
	.section	.rodata
.LC2:
	.string	"processing received command"
	.section	.text.mspSerialProcessReceivedByte,"ax",@progbits
	.type	mspSerialProcessReceivedByte, @function
mspSerialProcessReceivedByte:
.LFB18:
	.loc 1 216 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# msp, msp
	movl	%esi, %eax	# c, tmp109
	movb	%al, -28(%rbp)	# tmp109, c
	.loc 1 218 0
	movq	-24(%rbp), %rax	# msp, tmp110
	movl	24(%rax), %eax	# msp_11(D)->c_state, D.5483
	cmpl	$5, %eax	#, D.5483
	ja	.L41	#,
	movl	%eax, %eax	# D.5483, tmp111
	movq	.L43(,%rax,8), %rax	#, tmp112
	jmp	*%rax	# tmp112
	.section	.rodata.mspSerialProcessReceivedByte,"a",@progbits
	.align 8
	.align 4
.L43:
	.quad	.L41
	.quad	.L42
	.quad	.L44
	.quad	.L45
	.quad	.L46
	.quad	.L47
	.section	.text.mspSerialProcessReceivedByte
.L41:
	.loc 1 221 0
	cmpb	$36, -28(%rbp)	#, c
	je	.L48	#,
	.loc 1 223 0
	cmpb	$77, -28(%rbp)	#, c
	jne	.L49	#,
	.loc 1 225 0
	movq	-24(%rbp), %rax	# msp, tmp113
	movl	$1, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 226 0
	movq	-24(%rbp), %rax	# msp, tmp114
	movl	$77, %esi	#,
	movq	%rax, %rdi	# tmp114,
	call	mspSerialProcessReceivedByte	#
	.loc 1 227 0
	movl	$1, %eax	#, D.5481
	jmp	.L50	#
.L49:
	.loc 1 229 0
	movl	$0, %eax	#, D.5481
	jmp	.L50	#
.L48:
	.loc 1 231 0
	movq	-24(%rbp), %rax	# msp, tmp115
	movl	$1, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 232 0
	jmp	.L51	#
.L42:
	.loc 1 234 0
	cmpb	$77, -28(%rbp)	#, c
	jne	.L52	#,
	.loc 1 234 0 is_stmt 0 discriminator 1
	movl	$2, %edx	#, D.5482
	jmp	.L53	#
.L52:
	.loc 1 234 0 discriminator 2
	movl	$0, %edx	#, D.5482
.L53:
	.loc 1 234 0 discriminator 4
	movq	-24(%rbp), %rax	# msp, tmp116
	movl	%edx, 24(%rax)	# D.5482, msp_11(D)->c_state
	.loc 1 235 0 is_stmt 1 discriminator 4
	jmp	.L51	#
.L44:
	.loc 1 237 0
	movq	-24(%rbp), %rax	# msp, tmp117
	movl	$0, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 238 0
	movzbl	-28(%rbp), %eax	# c, D.5484
	cmpl	$60, %eax	#, D.5484
	je	.L55	#,
	cmpl	$62, %eax	#, D.5484
	je	.L56	#,
	.loc 1 250 0
	jmp	.L58	#
.L55:
	.loc 1 240 0
	movq	-24(%rbp), %rax	# msp, tmp118
	movl	8(%rax), %eax	# msp_11(D)->mode, D.5485
	testl	%eax, %eax	# D.5485
	jne	.L65	#,
	.loc 1 241 0
	movq	-24(%rbp), %rax	# msp, tmp119
	movl	$3, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 243 0
	jmp	.L65	#
.L56:
	.loc 1 245 0
	movq	-24(%rbp), %rax	# msp, tmp120
	movl	8(%rax), %eax	# msp_11(D)->mode, D.5485
	cmpl	$1, %eax	#, D.5485
	jne	.L66	#,
	.loc 1 246 0
	movq	-24(%rbp), %rax	# msp, tmp121
	movl	$3, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 248 0
	jmp	.L66	#
.L65:
	.loc 1 243 0
	nop
	jmp	.L51	#
.L66:
	.loc 1 248 0
	nop
.L58:
	.loc 1 252 0 discriminator 1
	jmp	.L51	#
.L45:
	.loc 1 254 0
	cmpb	$64, -28(%rbp)	#, c
	jbe	.L60	#,
	.loc 1 255 0
	movq	-24(%rbp), %rax	# msp, tmp122
	movl	$0, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 261 0
	jmp	.L51	#
.L60:
	.loc 1 257 0
	movq	-24(%rbp), %rax	# msp, tmp123
	movzbl	-28(%rbp), %edx	# c, tmp124
	movb	%dl, 29(%rax)	# tmp124, msp_11(D)->dataSize
	.loc 1 258 0
	movq	-24(%rbp), %rax	# msp, tmp125
	movb	$0, 28(%rax)	#, msp_11(D)->offset
	.loc 1 259 0
	movq	-24(%rbp), %rax	# msp, tmp126
	movl	$4, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 261 0
	jmp	.L51	#
.L46:
	.loc 1 263 0
	movq	-24(%rbp), %rax	# msp, tmp127
	movzbl	-28(%rbp), %edx	# c, tmp128
	movb	%dl, 30(%rax)	# tmp128, msp_11(D)->cmdMSP
	.loc 1 264 0
	movq	-24(%rbp), %rax	# msp, tmp129
	movl	$5, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 265 0
	jmp	.L51	#
.L47:
	.loc 1 267 0
	movq	-24(%rbp), %rax	# msp, tmp130
	movzbl	28(%rax), %edx	# msp_11(D)->offset, D.5486
	movq	-24(%rbp), %rax	# msp, tmp131
	movzbl	29(%rax), %eax	# msp_11(D)->dataSize, D.5486
	cmpb	%al, %dl	# D.5486, D.5486
	jnb	.L62	#,
	.loc 1 268 0
	movq	-24(%rbp), %rax	# msp, tmp132
	movzbl	28(%rax), %eax	# msp_11(D)->offset, D.5486
	leal	1(%rax), %ecx	#, D.5486
	movq	-24(%rbp), %rdx	# msp, tmp133
	movb	%cl, 28(%rdx)	# D.5486, msp_11(D)->offset
	movzbl	%al, %eax	# D.5486, D.5484
	movq	-24(%rbp), %rdx	# msp, tmp134
	cltq
	movzbl	-28(%rbp), %ecx	# c, tmp136
	movb	%cl, 31(%rdx,%rax)	# tmp136, msp_11(D)->inBuf
	.loc 1 282 0
	jmp	.L67	#
.L62:
.LBB9:
	.loc 1 270 0
	movb	$0, -1(%rbp)	#, checksum
	.loc 1 271 0
	movq	-24(%rbp), %rax	# msp, tmp137
	movzbl	29(%rax), %eax	# msp_11(D)->dataSize, D.5486
	movzbl	%al, %edx	# D.5486, D.5484
	movzbl	-1(%rbp), %eax	# checksum, D.5484
	movl	%edx, %esi	# D.5484,
	movl	%eax, %edi	# D.5484,
	call	mspSerialChecksum	#
	movb	%al, -1(%rbp)	# tmp138, checksum
	.loc 1 272 0
	movq	-24(%rbp), %rax	# msp, tmp139
	movzbl	30(%rax), %eax	# msp_11(D)->cmdMSP, D.5486
	movzbl	%al, %edx	# D.5486, D.5484
	movzbl	-1(%rbp), %eax	# checksum, D.5484
	movl	%edx, %esi	# D.5484,
	movl	%eax, %edi	# D.5484,
	call	mspSerialChecksum	#
	movb	%al, -1(%rbp)	# tmp140, checksum
	.loc 1 273 0
	movq	-24(%rbp), %rax	# msp, tmp141
	movzbl	29(%rax), %eax	# msp_11(D)->dataSize, D.5486
	movzbl	%al, %edx	# D.5486, D.5484
	movq	-24(%rbp), %rax	# msp, tmp142
	leaq	31(%rax), %rcx	#, D.5487
	movzbl	-1(%rbp), %eax	# checksum, D.5484
	movq	%rcx, %rsi	# D.5487,
	movl	%eax, %edi	# D.5484,
	call	mspSerialChecksumBuf	#
	movb	%al, -1(%rbp)	# tmp143, checksum
	.loc 1 274 0
	movzbl	-28(%rbp), %eax	# c, tmp144
	cmpb	-1(%rbp), %al	# checksum, tmp144
	jne	.L64	#,
	.loc 1 276 0
	movq	-24(%rbp), %rax	# msp, tmp145
	movl	$6, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 277 0
	movl	$.LC2, %edi	#,
	call	puts	#
.LBE9:
	.loc 1 282 0
	jmp	.L67	#
.L64:
.LBB10:
	.loc 1 280 0
	movq	-24(%rbp), %rax	# msp, tmp146
	movl	$0, 24(%rax)	#, msp_11(D)->c_state
.L67:
.LBE10:
	.loc 1 282 0
	nop
.L51:
	.loc 1 284 0
	movl	$1, %eax	#, D.5481
.L50:
	.loc 1 285 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	mspSerialProcessReceivedByte, .-mspSerialProcessReceivedByte
	.section	.rodata
.LC3:
	.string	"Inside"
	.section	.text.mspSerialProcess,"ax",@progbits
	.globl	mspSerialProcess
	.type	mspSerialProcess, @function
mspSerialProcess:
.LFB19:
	.loc 1 288 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$352, %rsp	#,
	.loc 1 288 0
	movq	%fs:40, %rax	#, tmp134
	movq	%rax, -8(%rbp)	# tmp134, D.5496
	xorl	%eax, %eax	# tmp134
	.loc 1 290 0
	movl	$0, -344(%rbp)	#, flag
.LBB11:
	.loc 1 291 0
	movl	$0, -340(%rbp)	#, i
	jmp	.L69	#
.L80:
.LBB12:
	.loc 1 292 0
	movl	-340(%rbp), %eax	# i, tmp102
	movslq	%eax, %rdx	# tmp102, tmp101
	movq	%rdx, %rax	# tmp101, tmp103
	addq	%rax, %rax	# tmp103
	addq	%rdx, %rax	# tmp101, tmp103
	salq	$5, %rax	#, tmp104
	addq	$mspPorts, %rax	#, tmp105
	movq	%rax, -336(%rbp)	# tmp105, msp
	.loc 1 293 0
	movq	-336(%rbp), %rax	# msp, tmp106
	movq	(%rax), %rax	# msp_19->port, D.5489
	testq	%rax, %rax	# D.5489
	je	.L82	#,
	.loc 1 297 0
	jmp	.L72	#
.L75:
.LBB13:
	.loc 1 298 0
	movl	$1, -344(%rbp)	#, flag
	.loc 1 299 0
	movq	-336(%rbp), %rax	# msp, tmp107
	movq	(%rax), %rax	# msp_19->port, D.5489
	movq	%rax, %rdi	# D.5489,
	call	serialRead	#
	movb	%al, -347(%rbp)	# tmp108, c
	.loc 1 300 0
	movzbl	-347(%rbp), %edx	# c, D.5490
	movq	-336(%rbp), %rax	# msp, tmp109
	movl	%edx, %esi	# D.5490,
	movq	%rax, %rdi	# tmp109,
	call	mspSerialProcessReceivedByte	#
	movb	%al, -346(%rbp)	# tmp110, consumed
	.loc 1 306 0
	movq	-336(%rbp), %rax	# msp, tmp111
	movl	24(%rax), %eax	# msp_19->c_state, D.5491
	cmpl	$6, %eax	#, D.5491
	jne	.L72	#,
	.loc 1 307 0
	movq	-336(%rbp), %rax	# msp, tmp112
	movl	8(%rax), %eax	# msp_19->mode, D.5492
	testl	%eax, %eax	# D.5492
	jne	.L83	#,
	.loc 1 308 0
	movq	-336(%rbp), %rax	# msp, tmp113
	movq	%rax, %rdi	# tmp113,
	call	mspSerialProcessReceivedCommand	#
	.loc 1 315 0
	jmp	.L83	#
.L72:
.LBE13:
	.loc 1 297 0
	movq	-336(%rbp), %rax	# msp, tmp114
	movq	(%rax), %rax	# msp_19->port, D.5489
	movq	%rax, %rdi	# D.5489,
	call	serialRxBytesWaiting	#
	movb	%al, -348(%rbp)	# tmp115, bytesWaiting
	cmpb	$0, -348(%rbp)	#, bytesWaiting
	jne	.L75	#,
	jmp	.L74	#
.L83:
.LBB14:
	.loc 1 315 0
	nop
.L74:
.LBE14:
	.loc 1 319 0
	cmpl	$1, -344(%rbp)	#, flag
	jne	.L76	#,
	.loc 1 321 0
	movl	$.LC3, %edi	#,
	call	puts	#
	.loc 1 322 0
	movl	$0, -344(%rbp)	#, flag
.L76:
	.loc 1 326 0
	movq	mspPostProcessFn(%rip), %rax	# mspPostProcessFn, D.5493
	testq	%rax, %rax	# D.5493
	je	.L77	#,
	.loc 1 327 0
	movq	mspPostProcessFn(%rip), %rax	# mspPostProcessFn, D.5493
	movq	-336(%rbp), %rdx	# msp, tmp116
	movq	%rdx, %rdi	# tmp116,
	call	*%rax	# D.5493
	.loc 1 328 0
	movq	$0, mspPostProcessFn(%rip)	#, mspPostProcessFn
.L77:
	.loc 1 333 0
	movq	-336(%rbp), %rax	# msp, tmp117
	movl	24(%rax), %eax	# msp_19->c_state, D.5491
	testl	%eax, %eax	# D.5491
	jne	.L78	#,
	.loc 1 333 0 is_stmt 0 discriminator 1
	movq	-336(%rbp), %rax	# msp, tmp118
	movq	16(%rax), %rax	# msp_19->commandSenderFn, D.5494
	testq	%rax, %rax	# D.5494
	je	.L78	#,
	.loc 1 333 0 discriminator 2
	cmpb	$0, -348(%rbp)	#, bytesWaiting
	jne	.L78	#,
.LBB15:
	.loc 1 335 0 is_stmt 1
	leaq	-272(%rbp), %rax	#, tmp119
	movq	%rax, -304(%rbp)	# tmp119, message.buf.ptr
	leaq	-272(%rbp), %rax	#, tmp120
	addq	$256, %rax	#, tmp121
	movq	%rax, -296(%rbp)	# tmp121, message.buf.end
	movw	$-1, -288(%rbp)	#, message.cmd
	movw	$0, -286(%rbp)	#, message.result
	.loc 1 344 0
	leaq	-304(%rbp), %rax	#, tmp122
	movq	%rax, -328(%rbp)	# tmp122, command
	.loc 1 346 0
	movq	-328(%rbp), %rax	# command, tmp123
	movq	(%rax), %rax	# command_46->buf.ptr, tmp124
	movq	%rax, -320(%rbp)	# tmp124, outBufHead
	.loc 1 348 0
	movq	-336(%rbp), %rax	# msp, tmp125
	movq	16(%rax), %rdx	# msp_19->commandSenderFn, D.5494
	movq	-328(%rbp), %rax	# command, tmp126
	movq	%rax, %rdi	# tmp126,
	movl	$0, %eax	#,
	call	*%rdx	# D.5494
	movb	%al, -345(%rbp)	# tmp127, shouldSend
	.loc 1 350 0
	cmpb	$0, -345(%rbp)	#, shouldSend
	je	.L79	#,
	.loc 1 351 0
	movq	-328(%rbp), %rax	# command, D.5495
	movq	-320(%rbp), %rdx	# outBufHead, tmp128
	movq	%rdx, %rsi	# tmp128,
	movq	%rax, %rdi	# D.5495,
	call	sbufSwitchToReader	#
	.loc 1 353 0
	movq	-328(%rbp), %rdx	# command, tmp129
	movq	-336(%rbp), %rax	# msp, tmp130
	movq	%rdx, %rsi	# tmp129,
	movq	%rax, %rdi	# tmp130,
	call	mspSerialEncode	#
.L79:
	.loc 1 356 0
	movq	-336(%rbp), %rax	# msp, tmp131
	movq	$0, 16(%rax)	#, msp_19->commandSenderFn
.L78:
.LBE15:
	.loc 1 359 0
	movq	mspPorts(%rip), %rax	# mspPorts[0].port, D.5489
	addq	$72, %rax	#, tmp132
	movq	%rax, -312(%rbp)	# tmp132, fd
	.loc 1 360 0
	movq	-312(%rbp), %rax	# fd, tmp133
	movl	(%rax), %eax	# *fd_58, D.5490
	movl	$2, %esi	#,
	movl	%eax, %edi	# D.5490,
	call	tcflush	#
	jmp	.L71	#
.L82:
	.loc 1 294 0
	nop
.L71:
.LBE12:
	.loc 1 291 0 discriminator 2
	addl	$1, -340(%rbp)	#, i
.L69:
	.loc 1 291 0 is_stmt 0 discriminator 1
	cmpl	$1, -340(%rbp)	#, i
	jle	.L80	#,
.LBE11:
	.loc 1 362 0 is_stmt 1
	nop
	movq	-8(%rbp), %rax	# D.5496, tmp135
	xorq	%fs:40, %rax	#, tmp135
	je	.L81	#,
	call	__stack_chk_fail	#
.L81:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	mspSerialProcess, .-mspSerialProcess
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/common/streambuf.h"
	.file 4 "./src/main/config/parameter_group.h"
	.file 5 "./src/main/drivers/serial.h"
	.file 6 "./src/main/msp/msp.h"
	.file 7 "./src/main/fc/fc_serial.h"
	.file 8 "./src/main/msp/msp_serial.h"
	.file 9 "./src/main/io/io_serial.h"
	.file 10 "./src/main/target/edison/target.h"
	.file 11 "./src/main/drivers/serial_uart.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xcb4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF168
	.byte	0xc
	.long	.LASF169
	.long	.LASF170
	.long	.Ldebug_ranges0+0x90
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x25
	.long	0x3b
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.long	.LASF4
	.byte	0x2
	.byte	0x30
	.long	0x5b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x31
	.long	0x6d
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0x33
	.long	0x7f
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x6
	.byte	0x8
	.long	0x42
	.uleb128 0x7
	.long	.LASF18
	.byte	0x10
	.byte	0x3
	.byte	0x19
	.long	0xd6
	.uleb128 0x8
	.string	"ptr"
	.byte	0x3
	.byte	0x1a
	.long	0xd6
	.byte	0
	.uleb128 0x8
	.string	"end"
	.byte	0x3
	.byte	0x1b
	.long	0xd6
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x50
	.uleb128 0x3
	.long	.LASF15
	.byte	0x3
	.byte	0x1c
	.long	0xb1
	.uleb128 0x3
	.long	.LASF16
	.byte	0x4
	.byte	0x15
	.long	0x62
	.uleb128 0x3
	.long	.LASF17
	.byte	0x4
	.byte	0x26
	.long	0xfd
	.uleb128 0x9
	.long	0x10d
	.uleb128 0xa
	.long	0x9b
	.uleb128 0xa
	.long	0x42
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.byte	0x2d
	.long	0x12b
	.uleb128 0xc
	.string	"ptr"
	.byte	0x4
	.byte	0x2e
	.long	0x9b
	.uleb128 0xc
	.string	"fn"
	.byte	0x4
	.byte	0x2f
	.long	0x12b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xf2
	.uleb128 0x7
	.long	.LASF19
	.byte	0x20
	.byte	0x4
	.byte	0x28
	.long	0x17a
	.uleb128 0x8
	.string	"pgn"
	.byte	0x4
	.byte	0x29
	.long	0xe7
	.byte	0
	.uleb128 0xd
	.long	.LASF20
	.byte	0x4
	.byte	0x2a
	.long	0x62
	.byte	0x2
	.uleb128 0xd
	.long	.LASF21
	.byte	0x4
	.byte	0x2b
	.long	0xd6
	.byte	0x8
	.uleb128 0x8
	.string	"ptr"
	.byte	0x4
	.byte	0x2c
	.long	0x17a
	.byte	0x10
	.uleb128 0xd
	.long	.LASF22
	.byte	0x4
	.byte	0x30
	.long	0x10d
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xd6
	.uleb128 0x3
	.long	.LASF23
	.byte	0x4
	.byte	0x31
	.long	0x131
	.uleb128 0xe
	.long	.LASF27
	.byte	0x4
	.long	0x7f
	.byte	0x5
	.byte	0x14
	.long	0x1ae
	.uleb128 0xf
	.long	.LASF24
	.byte	0x1
	.uleb128 0xf
	.long	.LASF25
	.byte	0x2
	.uleb128 0xf
	.long	.LASF26
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF27
	.byte	0x5
	.byte	0x18
	.long	0x18b
	.uleb128 0xe
	.long	.LASF28
	.byte	0x4
	.long	0x7f
	.byte	0x5
	.byte	0x1a
	.long	0x1fa
	.uleb128 0xf
	.long	.LASF29
	.byte	0
	.uleb128 0xf
	.long	.LASF30
	.byte	0x1
	.uleb128 0xf
	.long	.LASF31
	.byte	0
	.uleb128 0xf
	.long	.LASF32
	.byte	0x2
	.uleb128 0xf
	.long	.LASF33
	.byte	0
	.uleb128 0xf
	.long	.LASF34
	.byte	0x4
	.uleb128 0xf
	.long	.LASF35
	.byte	0
	.uleb128 0xf
	.long	.LASF36
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF28
	.byte	0x5
	.byte	0x23
	.long	0x1b9
	.uleb128 0x3
	.long	.LASF37
	.byte	0x5
	.byte	0x25
	.long	0x210
	.uleb128 0x6
	.byte	0x8
	.long	0x216
	.uleb128 0x9
	.long	0x221
	.uleb128 0xa
	.long	0x62
	.byte	0
	.uleb128 0x7
	.long	.LASF38
	.byte	0x48
	.byte	0x5
	.byte	0x27
	.long	0x2d6
	.uleb128 0xd
	.long	.LASF39
	.byte	0x5
	.byte	0x29
	.long	0x35b
	.byte	0
	.uleb128 0xd
	.long	.LASF40
	.byte	0x5
	.byte	0x2b
	.long	0x50
	.byte	0x8
	.uleb128 0xd
	.long	.LASF41
	.byte	0x5
	.byte	0x2c
	.long	0x1ae
	.byte	0xc
	.uleb128 0xd
	.long	.LASF42
	.byte	0x5
	.byte	0x2d
	.long	0x1fa
	.byte	0x10
	.uleb128 0xd
	.long	.LASF43
	.byte	0x5
	.byte	0x2f
	.long	0x74
	.byte	0x14
	.uleb128 0xd
	.long	.LASF44
	.byte	0x5
	.byte	0x31
	.long	0x74
	.byte	0x18
	.uleb128 0xd
	.long	.LASF45
	.byte	0x5
	.byte	0x32
	.long	0x74
	.byte	0x1c
	.uleb128 0xd
	.long	.LASF46
	.byte	0x5
	.byte	0x33
	.long	0x366
	.byte	0x20
	.uleb128 0xd
	.long	.LASF47
	.byte	0x5
	.byte	0x34
	.long	0x366
	.byte	0x28
	.uleb128 0xd
	.long	.LASF48
	.byte	0x5
	.byte	0x35
	.long	0x74
	.byte	0x30
	.uleb128 0xd
	.long	.LASF49
	.byte	0x5
	.byte	0x36
	.long	0x74
	.byte	0x34
	.uleb128 0xd
	.long	.LASF50
	.byte	0x5
	.byte	0x37
	.long	0x74
	.byte	0x38
	.uleb128 0xd
	.long	.LASF51
	.byte	0x5
	.byte	0x38
	.long	0x74
	.byte	0x3c
	.uleb128 0xd
	.long	.LASF52
	.byte	0x5
	.byte	0x3b
	.long	0x205
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	.LASF53
	.byte	0x50
	.byte	0x5
	.byte	0x3e
	.long	0x35b
	.uleb128 0xd
	.long	.LASF54
	.byte	0x5
	.byte	0x3f
	.long	0x392
	.byte	0
	.uleb128 0xd
	.long	.LASF55
	.byte	0x5
	.byte	0x41
	.long	0x3a7
	.byte	0x8
	.uleb128 0xd
	.long	.LASF56
	.byte	0x5
	.byte	0x42
	.long	0x3a7
	.byte	0x10
	.uleb128 0xd
	.long	.LASF57
	.byte	0x5
	.byte	0x44
	.long	0x3a7
	.byte	0x18
	.uleb128 0xd
	.long	.LASF58
	.byte	0x5
	.byte	0x47
	.long	0x3bd
	.byte	0x20
	.uleb128 0xd
	.long	.LASF59
	.byte	0x5
	.byte	0x49
	.long	0x3d9
	.byte	0x28
	.uleb128 0xd
	.long	.LASF60
	.byte	0x5
	.byte	0x4b
	.long	0x3ef
	.byte	0x30
	.uleb128 0xd
	.long	.LASF61
	.byte	0x5
	.byte	0x4d
	.long	0x40a
	.byte	0x38
	.uleb128 0xd
	.long	.LASF62
	.byte	0x5
	.byte	0x4f
	.long	0x41b
	.byte	0x40
	.uleb128 0xd
	.long	.LASF63
	.byte	0x5
	.byte	0x50
	.long	0x41b
	.byte	0x48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x361
	.uleb128 0x10
	.long	0x2d6
	.uleb128 0x6
	.byte	0x8
	.long	0x36c
	.uleb128 0x11
	.long	0x50
	.uleb128 0x3
	.long	.LASF64
	.byte	0x5
	.byte	0x3c
	.long	0x221
	.uleb128 0x9
	.long	0x38c
	.uleb128 0xa
	.long	0x38c
	.uleb128 0xa
	.long	0x50
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x371
	.uleb128 0x6
	.byte	0x8
	.long	0x37c
	.uleb128 0x12
	.long	0x50
	.long	0x3a7
	.uleb128 0xa
	.long	0x38c
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x398
	.uleb128 0x9
	.long	0x3bd
	.uleb128 0xa
	.long	0x38c
	.uleb128 0xa
	.long	0x74
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3ad
	.uleb128 0x12
	.long	0x3d2
	.long	0x3d2
	.uleb128 0xa
	.long	0x38c
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF65
	.uleb128 0x6
	.byte	0x8
	.long	0x3c3
	.uleb128 0x9
	.long	0x3ef
	.uleb128 0xa
	.long	0x38c
	.uleb128 0xa
	.long	0x1ae
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3df
	.uleb128 0x9
	.long	0x40a
	.uleb128 0xa
	.long	0x38c
	.uleb128 0xa
	.long	0x9b
	.uleb128 0xa
	.long	0x42
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3f5
	.uleb128 0x9
	.long	0x41b
	.uleb128 0xa
	.long	0x38c
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x410
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x14
	.long	0x446
	.uleb128 0xf
	.long	.LASF66
	.byte	0
	.uleb128 0xf
	.long	.LASF67
	.byte	0x1
	.uleb128 0xf
	.long	.LASF68
	.byte	0x2
	.uleb128 0xf
	.long	.LASF69
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF70
	.byte	0x18
	.byte	0x6
	.byte	0x16
	.long	0x477
	.uleb128 0x8
	.string	"buf"
	.byte	0x6
	.byte	0x17
	.long	0xdc
	.byte	0
	.uleb128 0x8
	.string	"cmd"
	.byte	0x6
	.byte	0x18
	.long	0x30
	.byte	0x10
	.uleb128 0xd
	.long	.LASF71
	.byte	0x6
	.byte	0x19
	.long	0x30
	.byte	0x12
	.byte	0
	.uleb128 0x3
	.long	.LASF72
	.byte	0x6
	.byte	0x1a
	.long	0x446
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x8
	.byte	0x3c
	.long	0x4b9
	.uleb128 0xf
	.long	.LASF73
	.byte	0
	.uleb128 0xf
	.long	.LASF74
	.byte	0x1
	.uleb128 0xf
	.long	.LASF75
	.byte	0x2
	.uleb128 0xf
	.long	.LASF76
	.byte	0x3
	.uleb128 0xf
	.long	.LASF77
	.byte	0x4
	.uleb128 0xf
	.long	.LASF78
	.byte	0x5
	.uleb128 0xf
	.long	.LASF79
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF80
	.byte	0x8
	.byte	0x44
	.long	0x482
	.uleb128 0x3
	.long	.LASF81
	.byte	0x8
	.byte	0x46
	.long	0x4cf
	.uleb128 0x6
	.byte	0x8
	.long	0x4d5
	.uleb128 0x14
	.long	0x3d2
	.long	0x4e0
	.uleb128 0x15
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x8
	.byte	0x4b
	.long	0x4f9
	.uleb128 0xf
	.long	.LASF82
	.byte	0
	.uleb128 0xf
	.long	.LASF83
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF84
	.byte	0x8
	.byte	0x4e
	.long	0x4e0
	.uleb128 0x7
	.long	.LASF85
	.byte	0x60
	.byte	0x8
	.byte	0x50
	.long	0x571
	.uleb128 0xd
	.long	.LASF86
	.byte	0x8
	.byte	0x51
	.long	0x38c
	.byte	0
	.uleb128 0xd
	.long	.LASF41
	.byte	0x8
	.byte	0x52
	.long	0x4f9
	.byte	0x8
	.uleb128 0xd
	.long	.LASF87
	.byte	0x8
	.byte	0x54
	.long	0x4c4
	.byte	0x10
	.uleb128 0xd
	.long	.LASF88
	.byte	0x8
	.byte	0x56
	.long	0x4b9
	.byte	0x18
	.uleb128 0xd
	.long	.LASF89
	.byte	0x8
	.byte	0x57
	.long	0x50
	.byte	0x1c
	.uleb128 0xd
	.long	.LASF90
	.byte	0x8
	.byte	0x58
	.long	0x50
	.byte	0x1d
	.uleb128 0xd
	.long	.LASF91
	.byte	0x8
	.byte	0x59
	.long	0x50
	.byte	0x1e
	.uleb128 0xd
	.long	.LASF92
	.byte	0x8
	.byte	0x5a
	.long	0x571
	.byte	0x1f
	.byte	0
	.uleb128 0x16
	.long	0x50
	.long	0x581
	.uleb128 0x17
	.long	0x8d
	.byte	0x3f
	.byte	0
	.uleb128 0x3
	.long	.LASF93
	.byte	0x8
	.byte	0x5c
	.long	0x504
	.uleb128 0x3
	.long	.LASF94
	.byte	0x8
	.byte	0x60
	.long	0x597
	.uleb128 0x6
	.byte	0x8
	.long	0x59d
	.uleb128 0x9
	.long	0x5a8
	.uleb128 0xa
	.long	0x5a8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x581
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x9
	.byte	0x1a
	.long	0x5ff
	.uleb128 0xf
	.long	.LASF95
	.byte	0
	.uleb128 0xf
	.long	.LASF96
	.byte	0x1
	.uleb128 0xf
	.long	.LASF97
	.byte	0x2
	.uleb128 0xf
	.long	.LASF98
	.byte	0x4
	.uleb128 0xf
	.long	.LASF99
	.byte	0x8
	.uleb128 0xf
	.long	.LASF100
	.byte	0x10
	.uleb128 0xf
	.long	.LASF101
	.byte	0x20
	.uleb128 0xf
	.long	.LASF102
	.byte	0x40
	.uleb128 0xf
	.long	.LASF103
	.byte	0x80
	.uleb128 0x18
	.long	.LASF104
	.value	0x100
	.uleb128 0x18
	.long	.LASF105
	.value	0x200
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.long	0x42
	.byte	0x9
	.byte	0x36
	.long	0x648
	.uleb128 0x19
	.long	.LASF106
	.sleb128 -1
	.uleb128 0xf
	.long	.LASF107
	.byte	0
	.uleb128 0xf
	.long	.LASF108
	.byte	0x1
	.uleb128 0xf
	.long	.LASF109
	.byte	0x2
	.uleb128 0xf
	.long	.LASF110
	.byte	0x3
	.uleb128 0xf
	.long	.LASF111
	.byte	0x4
	.uleb128 0xf
	.long	.LASF112
	.byte	0x14
	.uleb128 0xf
	.long	.LASF113
	.byte	0x1e
	.uleb128 0xf
	.long	.LASF114
	.byte	0x1f
	.uleb128 0xf
	.long	.LASF115
	.byte	0x1f
	.byte	0
	.uleb128 0x3
	.long	.LASF116
	.byte	0x9
	.byte	0x41
	.long	0x5ff
	.uleb128 0x7
	.long	.LASF117
	.byte	0xc
	.byte	0x9
	.byte	0x5a
	.long	0x684
	.uleb128 0xd
	.long	.LASF40
	.byte	0x9
	.byte	0x5b
	.long	0x648
	.byte	0
	.uleb128 0xd
	.long	.LASF118
	.byte	0x9
	.byte	0x5c
	.long	0x62
	.byte	0x4
	.uleb128 0xd
	.long	.LASF119
	.byte	0x9
	.byte	0x5d
	.long	0x684
	.byte	0x6
	.byte	0
	.uleb128 0x16
	.long	0x50
	.long	0x694
	.uleb128 0x17
	.long	0x8d
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF120
	.byte	0x9
	.byte	0x5e
	.long	0x653
	.uleb128 0x7
	.long	.LASF121
	.byte	0x1c
	.byte	0x9
	.byte	0x60
	.long	0x6c4
	.uleb128 0xd
	.long	.LASF122
	.byte	0x9
	.byte	0x61
	.long	0x50
	.byte	0
	.uleb128 0xd
	.long	.LASF123
	.byte	0x9
	.byte	0x62
	.long	0x6c4
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.long	0x694
	.long	0x6d4
	.uleb128 0x17
	.long	0x8d
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF124
	.byte	0x9
	.byte	0x63
	.long	0x69f
	.uleb128 0x1a
	.long	.LASF143
	.byte	0x1
	.byte	0x34
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x719
	.uleb128 0x1b
	.long	.LASF125
	.byte	0x1
	.byte	0x34
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.long	.LASF126
	.byte	0x1
	.byte	0x34
	.long	0x38c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1c
	.long	.LASF134
	.byte	0x1
	.byte	0x3b
	.long	0x5a8
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x759
	.uleb128 0x1d
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.byte	0x3d
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF131
	.byte	0x1
	.byte	0x43
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x7e3
	.uleb128 0x1d
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x20
	.long	.LASF127
	.byte	0x1
	.byte	0x45
	.long	0x7e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.long	.Ldebug_ranges0+0
	.uleb128 0x20
	.long	.LASF128
	.byte	0x1
	.byte	0x4d
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF129
	.byte	0x1
	.byte	0x54
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -46
	.uleb128 0x20
	.long	.LASF130
	.byte	0x1
	.byte	0x57
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -47
	.uleb128 0x20
	.long	.LASF41
	.byte	0x1
	.byte	0x58
	.long	0x4f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF126
	.byte	0x1
	.byte	0x61
	.long	0x38c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x694
	.uleb128 0x1f
	.long	.LASF132
	.byte	0x1
	.byte	0x6d
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x853
	.uleb128 0x1b
	.long	.LASF126
	.byte	0x1
	.byte	0x6d
	.long	0x38c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.byte	0x6f
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x20
	.long	.LASF128
	.byte	0x1
	.byte	0x70
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF133
	.byte	0x1
	.byte	0x78
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x88f
	.uleb128 0x1d
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.byte	0x7a
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF135
	.byte	0x1
	.byte	0x80
	.long	0x50
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x8cd
	.uleb128 0x1b
	.long	.LASF136
	.byte	0x1
	.byte	0x80
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.long	.LASF137
	.byte	0x1
	.byte	0x80
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF138
	.byte	0x1
	.byte	0x85
	.long	0x50
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x919
	.uleb128 0x1b
	.long	.LASF136
	.byte	0x1
	.byte	0x85
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.long	.LASF139
	.byte	0x1
	.byte	0x85
	.long	0xd6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x23
	.string	"len"
	.byte	0x1
	.byte	0x85
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1f
	.long	.LASF140
	.byte	0x1
	.byte	0x8e
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x97d
	.uleb128 0x23
	.string	"msp"
	.byte	0x1
	.byte	0x8e
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.long	.LASF141
	.byte	0x1
	.byte	0x8e
	.long	0x97d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1e
	.string	"len"
	.byte	0x1
	.byte	0x92
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.string	"hdr"
	.byte	0x1
	.byte	0x93
	.long	0x983
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF142
	.byte	0x1
	.byte	0x94
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x477
	.uleb128 0x16
	.long	0x50
	.long	0x993
	.uleb128 0x17
	.long	0x8d
	.byte	0x4
	.byte	0
	.uleb128 0x1a
	.long	.LASF144
	.byte	0x1
	.byte	0x9f
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0xa1a
	.uleb128 0x23
	.string	"msp"
	.byte	0x1
	.byte	0x9f
	.long	0x5a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.uleb128 0x20
	.long	.LASF145
	.byte	0x1
	.byte	0xa1
	.long	0xa1a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x20
	.long	.LASF146
	.byte	0x1
	.byte	0xa3
	.long	0x477
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x20
	.long	.LASF147
	.byte	0x1
	.byte	0xac
	.long	0x477
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x20
	.long	.LASF148
	.byte	0x1
	.byte	0xb5
	.long	0x97d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x20
	.long	.LASF149
	.byte	0x1
	.byte	0xb7
	.long	0xd6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0x20
	.long	.LASF150
	.byte	0x1
	.byte	0xb8
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -372
	.byte	0
	.uleb128 0x16
	.long	0x50
	.long	0xa2a
	.uleb128 0x17
	.long	0x8d
	.byte	0xff
	.byte	0
	.uleb128 0x22
	.long	.LASF151
	.byte	0x1
	.byte	0xd7
	.long	0x3d2
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xa7b
	.uleb128 0x23
	.string	"msp"
	.byte	0x1
	.byte	0xd7
	.long	0x5a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"c"
	.byte	0x1
	.byte	0xd7
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x30
	.uleb128 0x24
	.long	.LASF136
	.byte	0x1
	.value	0x10e
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF152
	.byte	0x1
	.value	0x11f
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xb95
	.uleb128 0x26
	.string	"fd"
	.byte	0x1
	.value	0x121
	.long	0xab
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x24
	.long	.LASF153
	.byte	0x1
	.value	0x122
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0x1d
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x123
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -356
	.uleb128 0x1d
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x26
	.string	"msp"
	.byte	0x1
	.value	0x124
	.long	0x5a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x24
	.long	.LASF154
	.byte	0x1
	.value	0x128
	.long	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -364
	.uleb128 0x27
	.long	.Ldebug_ranges0+0x60
	.long	0xb30
	.uleb128 0x26
	.string	"c"
	.byte	0x1
	.value	0x12b
	.long	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -363
	.uleb128 0x24
	.long	.LASF155
	.byte	0x1
	.value	0x12c
	.long	0x3d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -362
	.byte	0
	.uleb128 0x1d
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x24
	.long	.LASF145
	.byte	0x1
	.value	0x14e
	.long	0xa1a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x24
	.long	.LASF146
	.byte	0x1
	.value	0x14f
	.long	0x477
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x24
	.long	.LASF147
	.byte	0x1
	.value	0x158
	.long	0x97d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.uleb128 0x24
	.long	.LASF149
	.byte	0x1
	.value	0x15a
	.long	0xd6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x24
	.long	.LASF156
	.byte	0x1
	.value	0x15c
	.long	0x3d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -361
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF157
	.byte	0xa
	.byte	0xc8
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x28
	.long	.LASF158
	.byte	0xa
	.byte	0xc9
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x28
	.long	.LASF159
	.byte	0xa
	.byte	0xca
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x28
	.long	.LASF160
	.byte	0x4
	.byte	0x43
	.long	0xbe9
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x6
	.byte	0x8
	.long	0x180
	.uleb128 0x28
	.long	.LASF161
	.byte	0x4
	.byte	0x44
	.long	0xbe9
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x28
	.long	.LASF162
	.byte	0x4
	.byte	0x47
	.long	0xd6
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x28
	.long	.LASF163
	.byte	0x4
	.byte	0x48
	.long	0xd6
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x16
	.long	0x581
	.long	0xc3e
	.uleb128 0x17
	.long	0x8d
	.byte	0x1
	.byte	0
	.uleb128 0x28
	.long	.LASF164
	.byte	0x1
	.byte	0x30
	.long	0xc2e
	.uleb128 0x9
	.byte	0x3
	.quad	mspPorts
	.uleb128 0x28
	.long	.LASF165
	.byte	0x1
	.byte	0x2e
	.long	0x58c
	.uleb128 0x9
	.byte	0x3
	.quad	mspPostProcessFn
	.uleb128 0x16
	.long	0xc73
	.long	0xc73
	.uleb128 0x29
	.byte	0
	.uleb128 0x10
	.long	0x74
	.uleb128 0x2a
	.long	.LASF119
	.byte	0x9
	.byte	0x33
	.long	0xc83
	.uleb128 0x10
	.long	0xc68
	.uleb128 0x28
	.long	.LASF166
	.byte	0x9
	.byte	0x65
	.long	0x6d4
	.uleb128 0x9
	.byte	0x3
	.quad	serialConfig_System
	.uleb128 0x28
	.long	.LASF167
	.byte	0xb
	.byte	0x2e
	.long	0xcb2
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0x11
	.long	0x74
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0xcc
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB4
	.quad	.LBE4
	.quad	.LBB5
	.quad	.LBE5
	.quad	0
	.quad	0
	.quad	.LBB9
	.quad	.LBE9
	.quad	.LBB10
	.quad	.LBE10
	.quad	0
	.quad	0
	.quad	.LBB13
	.quad	.LBE13
	.quad	.LBB14
	.quad	.LBE14
	.quad	0
	.quad	0
	.quad	.LFB9
	.quad	.LFE9
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB11
	.quad	.LFE11
	.quad	.LFB12
	.quad	.LFE12
	.quad	.LFB13
	.quad	.LFE13
	.quad	.LFB14
	.quad	.LFE14
	.quad	.LFB15
	.quad	.LFE15
	.quad	.LFB16
	.quad	.LFE16
	.quad	.LFB17
	.quad	.LFE17
	.quad	.LFB18
	.quad	.LFE18
	.quad	.LFB19
	.quad	.LFE19
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF149:
	.string	"outBufHead"
.LASF34:
	.string	"SERIAL_PARITY_EVEN"
.LASF105:
	.string	"FUNCTION_MSP_CLIENT"
.LASF22:
	.string	"reset"
.LASF126:
	.string	"serialPort"
.LASF131:
	.string	"mspSerialAllocatePorts"
.LASF144:
	.string	"mspSerialProcessReceivedCommand"
.LASF25:
	.string	"MODE_TX"
.LASF68:
	.string	"BAUDRATE_BLACKBOX"
.LASF136:
	.string	"checksum"
.LASF17:
	.string	"pgResetFunc"
.LASF134:
	.string	"mspPortFindFree"
.LASF63:
	.string	"endWrite"
.LASF37:
	.string	"serialReceiveCallbackPtr"
.LASF130:
	.string	"baudRatesIndex"
.LASF45:
	.string	"txBufferSize"
.LASF13:
	.string	"long long unsigned int"
.LASF115:
	.string	"SERIAL_PORT_IDENTIFIER_MAX"
.LASF123:
	.string	"portConfigs"
.LASF122:
	.string	"reboot_character"
.LASF159:
	.string	"U_ID_2"
.LASF162:
	.string	"__pg_resetdata_start"
.LASF3:
	.string	"int16_t"
.LASF169:
	.string	"src/main/msp/msp_serial.c"
.LASF55:
	.string	"serialTotalRxWaiting"
.LASF0:
	.string	"signed char"
.LASF125:
	.string	"mspPortToReset"
.LASF129:
	.string	"function"
.LASF46:
	.string	"rxBuffer"
.LASF81:
	.string	"mspCommandSenderFuncPtr"
.LASF167:
	.string	"receiveLength"
.LASF2:
	.string	"long int"
.LASF27:
	.string	"portMode_t"
.LASF9:
	.string	"unsigned int"
.LASF57:
	.string	"serialRead"
.LASF14:
	.string	"long long int"
.LASF147:
	.string	"command"
.LASF6:
	.string	"uint16_t"
.LASF112:
	.string	"SERIAL_PORT_USB_VCP"
.LASF43:
	.string	"baudRate"
.LASF31:
	.string	"SERIAL_STOPBITS_1"
.LASF137:
	.string	"byte"
.LASF73:
	.string	"IDLE"
.LASF158:
	.string	"U_ID_1"
.LASF42:
	.string	"options"
.LASF108:
	.string	"SERIAL_PORT_UART2"
.LASF109:
	.string	"SERIAL_PORT_UART3"
.LASF132:
	.string	"mspSerialReleasePortIfAllocated"
.LASF116:
	.string	"serialPortIdentifier_e"
.LASF90:
	.string	"dataSize"
.LASF104:
	.string	"FUNCTION_TELEMETRY_MAVLINK"
.LASF61:
	.string	"writeBuf"
.LASF54:
	.string	"serialWrite"
.LASF75:
	.string	"HEADER_ARROW"
.LASF168:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF16:
	.string	"pgn_t"
.LASF10:
	.string	"long unsigned int"
.LASF165:
	.string	"mspPostProcessFn"
.LASF155:
	.string	"consumed"
.LASF166:
	.string	"serialConfig_System"
.LASF139:
	.string	"data"
.LASF20:
	.string	"size"
.LASF7:
	.string	"short unsigned int"
.LASF67:
	.string	"BAUDRATE_GPS"
.LASF142:
	.string	"csum"
.LASF18:
	.string	"sbuf_s"
.LASF86:
	.string	"port"
.LASF15:
	.string	"sbuf_t"
.LASF119:
	.string	"baudRates"
.LASF76:
	.string	"HEADER_SIZE"
.LASF52:
	.string	"callback"
.LASF72:
	.string	"mspPacket_t"
.LASF36:
	.string	"SERIAL_BIDIR"
.LASF62:
	.string	"beginWrite"
.LASF154:
	.string	"bytesWaiting"
.LASF97:
	.string	"FUNCTION_GPS"
.LASF113:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF114:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF161:
	.string	"__pg_registry_end"
.LASF58:
	.string	"serialSetBaudRate"
.LASF148:
	.string	"reply"
.LASF138:
	.string	"mspSerialChecksumBuf"
.LASF77:
	.string	"HEADER_CMD"
.LASF11:
	.string	"sizetype"
.LASF164:
	.string	"mspPorts"
.LASF53:
	.string	"serialPortVTable"
.LASF152:
	.string	"mspSerialProcess"
.LASF21:
	.string	"address"
.LASF24:
	.string	"MODE_RX"
.LASF141:
	.string	"packet"
.LASF163:
	.string	"__pg_resetdata_end"
.LASF160:
	.string	"__pg_registry_start"
.LASF48:
	.string	"rxBufferHead"
.LASF135:
	.string	"mspSerialChecksum"
.LASF157:
	.string	"U_ID_0"
.LASF107:
	.string	"SERIAL_PORT_UART1"
.LASF170:
	.string	"/home/aravind/git/cleanflight"
.LASF80:
	.string	"mspState_e"
.LASF110:
	.string	"SERIAL_PORT_UART4"
.LASF111:
	.string	"SERIAL_PORT_UART5"
.LASF28:
	.string	"portOptions_t"
.LASF82:
	.string	"MSP_MODE_SERVER"
.LASF145:
	.string	"outBuf"
.LASF65:
	.string	"_Bool"
.LASF35:
	.string	"SERIAL_UNIDIR"
.LASF5:
	.string	"unsigned char"
.LASF91:
	.string	"cmdMSP"
.LASF44:
	.string	"rxBufferSize"
.LASF85:
	.string	"mspPort_s"
.LASF93:
	.string	"mspPort_t"
.LASF74:
	.string	"HEADER_M"
.LASF1:
	.string	"short int"
.LASF95:
	.string	"FUNCTION_NONE"
.LASF51:
	.string	"txBufferTail"
.LASF88:
	.string	"c_state"
.LASF101:
	.string	"FUNCTION_TELEMETRY_SMARTPORT"
.LASF128:
	.string	"mspPort"
.LASF121:
	.string	"serialConfig_s"
.LASF124:
	.string	"serialConfig_t"
.LASF143:
	.string	"resetMspPort"
.LASF84:
	.string	"mspPortMode_e"
.LASF117:
	.string	"serialPortConfig_s"
.LASF120:
	.string	"serialPortConfig_t"
.LASF50:
	.string	"txBufferHead"
.LASF8:
	.string	"uint32_t"
.LASF56:
	.string	"serialTotalTxFree"
.LASF153:
	.string	"flag"
.LASF19:
	.string	"pgRegistry_s"
.LASF23:
	.string	"pgRegistry_t"
.LASF12:
	.string	"char"
.LASF69:
	.string	"BAUDRATE_TELEMETRY"
.LASF41:
	.string	"mode"
.LASF49:
	.string	"rxBufferTail"
.LASF87:
	.string	"commandSenderFn"
.LASF70:
	.string	"mspPacket_s"
.LASF26:
	.string	"MODE_RXTX"
.LASF127:
	.string	"portConfig"
.LASF98:
	.string	"FUNCTION_TELEMETRY_FRSKY"
.LASF102:
	.string	"FUNCTION_RX_SERIAL"
.LASF118:
	.string	"functionMask"
.LASF89:
	.string	"offset"
.LASF96:
	.string	"FUNCTION_MSP_SERVER"
.LASF79:
	.string	"MESSAGE_RECEIVED"
.LASF30:
	.string	"SERIAL_INVERTED"
.LASF60:
	.string	"setMode"
.LASF40:
	.string	"identifier"
.LASF103:
	.string	"FUNCTION_BLACKBOX"
.LASF39:
	.string	"vTable"
.LASF106:
	.string	"SERIAL_PORT_NONE"
.LASF100:
	.string	"FUNCTION_TELEMETRY_LTM"
.LASF47:
	.string	"txBuffer"
.LASF150:
	.string	"status"
.LASF29:
	.string	"SERIAL_NOT_INVERTED"
.LASF59:
	.string	"isSerialTransmitBufferEmpty"
.LASF4:
	.string	"uint8_t"
.LASF83:
	.string	"MSP_MODE_CLIENT"
.LASF99:
	.string	"FUNCTION_TELEMETRY_HOTT"
.LASF33:
	.string	"SERIAL_PARITY_NO"
.LASF133:
	.string	"mspSerialInit"
.LASF146:
	.string	"message"
.LASF66:
	.string	"BAUDRATE_MSP_SERVER"
.LASF78:
	.string	"HEADER_DATA"
.LASF140:
	.string	"mspSerialEncode"
.LASF32:
	.string	"SERIAL_STOPBITS_2"
.LASF151:
	.string	"mspSerialProcessReceivedByte"
.LASF71:
	.string	"result"
.LASF94:
	.string	"mspPostProcessFuncPtr"
.LASF156:
	.string	"shouldSend"
.LASF38:
	.string	"serialPort_s"
.LASF64:
	.string	"serialPort_t"
.LASF92:
	.string	"inBuf"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
