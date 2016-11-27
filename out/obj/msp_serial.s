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
	.loc 1 52 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# mspPortToReset, mspPortToReset
	movq	%rsi, -16(%rbp)	# serialPort, serialPort
	.loc 1 53 0
	movq	-8(%rbp), %rax	# mspPortToReset, tmp87
	movl	$96, %edx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp87,
	call	memset	#
	.loc 1 55 0
	movq	-8(%rbp), %rax	# mspPortToReset, tmp88
	movq	-16(%rbp), %rdx	# serialPort, tmp89
	movq	%rdx, (%rax)	# tmp89, mspPortToReset_2(D)->port
	.loc 1 56 0
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
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
.LBB2:
	.loc 1 60 0
	movl	$0, -4(%rbp)	#, i
	jmp	.L3	#
.L6:
	.loc 1 61 0
	movl	-4(%rbp), %eax	# i, tmp91
	movslq	%eax, %rdx	# tmp91, tmp90
	movq	%rdx, %rax	# tmp90, tmp93
	addq	%rax, %rax	# tmp93
	addq	%rdx, %rax	# tmp90, tmp93
	salq	$5, %rax	#, tmp94
	addq	$mspPorts, %rax	#, tmp95
	movq	(%rax), %rax	# mspPorts[i_1].port, D.5379
	testq	%rax, %rax	# D.5379
	jne	.L4	#,
	.loc 1 62 0
	movl	-4(%rbp), %eax	# i, tmp97
	movslq	%eax, %rdx	# tmp97, tmp96
	movq	%rdx, %rax	# tmp96, tmp98
	addq	%rax, %rax	# tmp98
	addq	%rdx, %rax	# tmp96, tmp98
	salq	$5, %rax	#, tmp99
	addq	$mspPorts, %rax	#, D.5378
	jmp	.L5	#
.L4:
	.loc 1 60 0 discriminator 2
	addl	$1, -4(%rbp)	#, i
.L3:
	.loc 1 60 0 is_stmt 0 discriminator 1
	cmpl	$1, -4(%rbp)	#, i
	jle	.L6	#,
.LBE2:
	.loc 1 63 0 is_stmt 1
	movl	$0, %eax	#, D.5378
.L5:
	.loc 1 64 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	mspPortFindFree, .-mspPortFindFree
	.section	.rodata
.LC0:
	.string	"Inside"
	.section	.text.mspSerialAllocatePorts,"ax",@progbits
	.globl	mspSerialAllocatePorts
	.type	mspSerialAllocatePorts, @function
mspSerialAllocatePorts:
.LFB11:
	.loc 1 67 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
.LBB3:
	.loc 1 68 0
	movl	$513, %edi	#,
	call	findSerialPortConfig	#
	movq	%rax, -24(%rbp)	# tmp95, portConfig
	jmp	.L8	#
.L13:
.LBB4:
	.loc 1 71 0
	movl	$.LC0, %edi	#,
	call	puts	#
	.loc 1 72 0
	movq	-24(%rbp), %rax	# portConfig, tmp96
	movq	%rax, %rdi	# tmp96,
	call	isSerialPortOpen	#
	testb	%al, %al	# D.5380
	jne	.L14	#,
	.loc 1 77 0
	call	mspPortFindFree	#
	movq	%rax, -16(%rbp)	# tmp97, mspPort
	.loc 1 78 0
	cmpq	$0, -16(%rbp)	#, mspPort
	je	.L15	#,
	.loc 1 84 0
	movq	-24(%rbp), %rax	# portConfig, tmp98
	movzwl	4(%rax), %eax	# portConfig_1->functionMask, D.5381
	andw	$513, %ax	#, tmp99
	movw	%ax, -30(%rbp)	# tmp99, function
	.loc 1 87 0
	movb	$0, -31(%rbp)	#, baudRatesIndex
	.loc 1 88 0
	movl	$0, -28(%rbp)	#, mode
	.loc 1 98 0
	movzbl	-31(%rbp), %eax	# baudRatesIndex, D.5382
	movq	-24(%rbp), %rdx	# portConfig, tmp100
	cltq
	movzbl	6(%rdx,%rax), %eax	# portConfig_1->baudRates, D.5383
	.loc 1 97 0
	movzbl	%al, %eax	# D.5383, D.5382
	cltq
	movl	baudRates(,%rax,4), %edx	# baudRates, D.5384
	movzwl	-30(%rbp), %esi	# function, D.5385
	movq	-24(%rbp), %rax	# portConfig, tmp103
	movl	(%rax), %eax	# portConfig_1->identifier, D.5386
	movl	$0, %r9d	#,
	movl	$3, %r8d	#,
	movl	%edx, %ecx	# D.5384,
	movl	$0, %edx	#,
	movl	%eax, %edi	# D.5386,
	call	openSerialPort	#
	movq	%rax, -8(%rbp)	# tmp104, serialPort
	.loc 1 99 0
	cmpq	$0, -8(%rbp)	#, serialPort
	je	.L10	#,
	.loc 1 100 0
	movq	-8(%rbp), %rdx	# serialPort, tmp105
	movq	-16(%rbp), %rax	# mspPort, tmp106
	movq	%rdx, %rsi	# tmp105,
	movq	%rax, %rdi	# tmp106,
	call	resetMspPort	#
	.loc 1 101 0
	movq	-16(%rbp), %rax	# mspPort, tmp107
	movl	-28(%rbp), %edx	# mode, tmp108
	movl	%edx, 8(%rax)	# tmp108, mspPort_14->mode
	jmp	.L10	#
.L14:
	.loc 1 73 0
	nop
.L10:
.LBE4:
	.loc 1 70 0
	movl	$513, %edi	#,
	call	findNextSerialPortConfig	#
	movq	%rax, -24(%rbp)	# tmp109, portConfig
.L8:
	.loc 1 68 0 discriminator 1
	cmpq	$0, -24(%rbp)	#, portConfig
	jne	.L13	#,
	jmp	.L7	#
.L15:
.LBB5:
	.loc 1 81 0
	nop
.L7:
.LBE5:
.LBE3:
	.loc 1 106 0
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
	.loc 1 109 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# serialPort, serialPort
.LBB6:
	.loc 1 110 0
	movl	$0, -12(%rbp)	#, i
	jmp	.L17	#
.L19:
.LBB7:
	.loc 1 111 0
	movl	-12(%rbp), %eax	# i, tmp90
	movslq	%eax, %rdx	# tmp90, tmp89
	movq	%rdx, %rax	# tmp89, tmp91
	addq	%rax, %rax	# tmp91
	addq	%rdx, %rax	# tmp89, tmp91
	salq	$5, %rax	#, tmp92
	addq	$mspPorts, %rax	#, tmp93
	movq	%rax, -8(%rbp)	# tmp93, mspPort
	.loc 1 112 0
	movq	-8(%rbp), %rax	# mspPort, tmp94
	movq	(%rax), %rax	# mspPort_6->port, D.5388
	cmpq	-24(%rbp), %rax	# serialPort, D.5388
	jne	.L18	#,
	.loc 1 113 0
	movq	-8(%rbp), %rax	# mspPort, tmp95
	movq	(%rax), %rax	# mspPort_6->port, D.5388
	movq	%rax, %rdi	# D.5388,
	call	closeSerialPort	#
	.loc 1 114 0
	movq	-8(%rbp), %rax	# mspPort, tmp96
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp96,
	call	resetMspPort	#
.L18:
.LBE7:
	.loc 1 110 0 discriminator 2
	addl	$1, -12(%rbp)	#, i
.L17:
	.loc 1 110 0 is_stmt 0 discriminator 1
	cmpl	$1, -12(%rbp)	#, i
	jle	.L19	#,
.LBE6:
	.loc 1 117 0 is_stmt 1
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
	.loc 1 120 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
.LBB8:
	.loc 1 121 0
	movl	$0, -4(%rbp)	#, i
	jmp	.L21	#
.L22:
	.loc 1 122 0 discriminator 3
	movl	-4(%rbp), %eax	# i, tmp89
	movslq	%eax, %rdx	# tmp89, tmp88
	movq	%rdx, %rax	# tmp88, tmp90
	addq	%rax, %rax	# tmp90
	addq	%rdx, %rax	# tmp88, tmp90
	salq	$5, %rax	#, tmp91
	addq	$mspPorts, %rax	#, D.5389
	movl	$0, %esi	#,
	movq	%rax, %rdi	# D.5389,
	call	resetMspPort	#
	.loc 1 121 0 discriminator 3
	addl	$1, -4(%rbp)	#, i
.L21:
	.loc 1 121 0 is_stmt 0 discriminator 1
	cmpl	$1, -4(%rbp)	#, i
	jle	.L22	#,
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
	xorb	-8(%rbp), %al	# byte, D.5390
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
	jmp	.L26	#
.L27:
	.loc 1 136 0
	movq	-16(%rbp), %rax	# data, D.5392
	leaq	1(%rax), %rdx	#, tmp95
	movq	%rdx, -16(%rbp)	# tmp95, data
	movzbl	(%rax), %eax	# *_11, D.5393
	movzbl	%al, %edx	# D.5393, D.5391
	movzbl	-4(%rbp), %eax	# checksum, D.5391
	movl	%edx, %esi	# D.5391,
	movl	%eax, %edi	# D.5391,
	call	mspSerialChecksum	#
	movb	%al, -4(%rbp)	# tmp96, checksum
.L26:
	.loc 1 135 0
	movl	-8(%rbp), %eax	# len, D.5391
	leal	-1(%rax), %edx	#, tmp97
	movl	%edx, -8(%rbp)	# tmp97, len
	testl	%eax, %eax	# D.5391
	jg	.L27	#,
	.loc 1 139 0
	movzbl	-4(%rbp), %eax	# checksum, D.5394
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
	movq	%rax, -8(%rbp)	# tmp122, D.5402
	xorl	%eax, %eax	# tmp122
	.loc 1 144 0
	movq	-40(%rbp), %rax	# msp, tmp107
	movq	(%rax), %rax	# msp_6(D)->port, D.5396
	movq	%rax, %rdi	# D.5396,
	call	serialBeginWrite	#
	.loc 1 145 0
	movq	-48(%rbp), %rax	# packet, D.5397
	movq	%rax, %rdi	# D.5397,
	call	sbufBytesRemaining	#
	movl	%eax, -20(%rbp)	# tmp108, len
	.loc 1 146 0
	movb	$36, -16(%rbp)	#, hdr
	movb	$77, -15(%rbp)	#, hdr
	movq	-48(%rbp), %rax	# packet, tmp109
	movzwl	18(%rax), %eax	# packet_9(D)->result, D.5398
	testw	%ax, %ax	# D.5398
	js	.L30	#,
	.loc 1 146 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# msp, tmp110
	movl	8(%rax), %eax	# msp_6(D)->mode, D.5399
	testl	%eax, %eax	# D.5399
	jne	.L31	#,
	.loc 1 146 0 discriminator 3
	movl	$62, %eax	#, D.5395
	jmp	.L33	#
.L31:
	.loc 1 146 0 discriminator 4
	movl	$60, %eax	#, D.5395
	jmp	.L33	#
.L30:
	.loc 1 146 0 discriminator 2
	movl	$33, %eax	#, D.5395
.L33:
	.loc 1 146 0 discriminator 8
	movb	%al, -14(%rbp)	# D.5395, hdr
	movl	-20(%rbp), %eax	# len, tmp111
	movb	%al, -13(%rbp)	# D.5395, hdr
	movq	-48(%rbp), %rax	# packet, tmp112
	movzwl	16(%rax), %eax	# packet_9(D)->cmd, D.5398
	movb	%al, -12(%rbp)	# D.5395, hdr
	.loc 1 147 0 is_stmt 1 discriminator 8
	movb	$0, -21(%rbp)	#, csum
	.loc 1 148 0 discriminator 8
	movq	-40(%rbp), %rax	# msp, tmp113
	movq	(%rax), %rax	# msp_6(D)->port, D.5396
	leaq	-16(%rbp), %rcx	#, tmp114
	movl	$5, %edx	#,
	movq	%rcx, %rsi	# tmp114,
	movq	%rax, %rdi	# D.5396,
	call	serialWriteBuf	#
	.loc 1 149 0 discriminator 8
	leaq	-16(%rbp), %rax	#, D.5400
	addq	$3, %rax	#, D.5400
	movzbl	-21(%rbp), %ecx	# csum, D.5401
	movl	$2, %edx	#,
	movq	%rax, %rsi	# D.5400,
	movl	%ecx, %edi	# D.5401,
	call	mspSerialChecksumBuf	#
	movb	%al, -21(%rbp)	# tmp115, csum
	.loc 1 150 0 discriminator 8
	cmpl	$0, -20(%rbp)	#, len
	jle	.L34	#,
	.loc 1 151 0
	movq	-48(%rbp), %rax	# packet, D.5397
	movq	%rax, %rdi	# D.5397,
	call	sbufPtr	#
	movq	%rax, %rcx	#, D.5400
	movq	-40(%rbp), %rax	# msp, tmp116
	movq	(%rax), %rax	# msp_6(D)->port, D.5396
	movl	-20(%rbp), %edx	# len, tmp117
	movq	%rcx, %rsi	# D.5400,
	movq	%rax, %rdi	# D.5396,
	call	serialWriteBuf	#
	.loc 1 152 0
	movq	-48(%rbp), %rax	# packet, D.5397
	movq	%rax, %rdi	# D.5397,
	call	sbufPtr	#
	movq	%rax, %rcx	#, D.5400
	movzbl	-21(%rbp), %eax	# csum, D.5401
	movl	-20(%rbp), %edx	# len, tmp118
	movq	%rcx, %rsi	# D.5400,
	movl	%eax, %edi	# D.5401,
	call	mspSerialChecksumBuf	#
	movb	%al, -21(%rbp)	# tmp119, csum
.L34:
	.loc 1 154 0
	movzbl	-21(%rbp), %edx	# csum, D.5401
	movq	-40(%rbp), %rax	# msp, tmp120
	movq	(%rax), %rax	# msp_6(D)->port, D.5396
	movl	%edx, %esi	# D.5401,
	movq	%rax, %rdi	# D.5396,
	call	serialWrite	#
	.loc 1 155 0
	movq	-40(%rbp), %rax	# msp, tmp121
	movq	(%rax), %rax	# msp_6(D)->port, D.5396
	movq	%rax, %rdi	# D.5396,
	call	serialEndWrite	#
	.loc 1 156 0
	nop
	movq	-8(%rbp), %rax	# D.5402, tmp123
	xorq	%fs:40, %rax	#, tmp123
	je	.L35	#,
	call	__stack_chk_fail	#
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	mspSerialEncode, .-mspSerialEncode
	.section	.text.mspSerialProcessReceivedCommand,"ax",@progbits
	.type	mspSerialProcessReceivedCommand, @function
mspSerialProcessReceivedCommand:
.LFB17:
	.loc 1 159 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$384, %rsp	#,
	movq	%rdi, -376(%rbp)	# msp, msp
	.loc 1 159 0
	movq	%fs:40, %rax	#, tmp112
	movq	%rax, -8(%rbp)	# tmp112, D.5411
	xorl	%eax, %eax	# tmp112
	.loc 1 162 0
	leaq	-272(%rbp), %rax	#, tmp95
	movq	%rax, -336(%rbp)	# tmp95, message.buf.ptr
	leaq	-272(%rbp), %rax	#, tmp96
	addq	$256, %rax	#, tmp97
	movq	%rax, -328(%rbp)	# tmp97, message.buf.end
	movw	$-1, -320(%rbp)	#, message.cmd
	movw	$0, -318(%rbp)	#, message.result
	.loc 1 173 0
	movq	-376(%rbp), %rax	# msp, tmp98
	addq	$31, %rax	#, D.5405
	.loc 1 171 0
	movq	%rax, -304(%rbp)	# D.5405, command.buf.ptr
	.loc 1 174 0
	movq	-376(%rbp), %rax	# msp, tmp99
	leaq	31(%rax), %rdx	#, D.5405
	movq	-376(%rbp), %rax	# msp, tmp100
	movzbl	29(%rax), %eax	# msp_7(D)->dataSize, D.5406
	movzbl	%al, %eax	# D.5406, D.5407
	addq	%rdx, %rax	# D.5405, D.5408
	.loc 1 171 0
	movq	%rax, -296(%rbp)	# D.5408, command.buf.end
	.loc 1 176 0
	movq	-376(%rbp), %rax	# msp, tmp101
	movzbl	30(%rax), %eax	# msp_7(D)->cmdMSP, D.5406
	.loc 1 171 0
	movzbl	%al, %eax	# D.5406, D.5409
	movw	%ax, -288(%rbp)	# D.5409, command.cmd
	movw	$0, -286(%rbp)	#, command.result
	.loc 1 180 0
	leaq	-336(%rbp), %rax	#, tmp102
	movq	%rax, -352(%rbp)	# tmp102, reply
	.loc 1 182 0
	movq	-352(%rbp), %rax	# reply, tmp103
	movq	(%rax), %rax	# reply_19->buf.ptr, tmp104
	movq	%rax, -344(%rbp)	# tmp104, outBufHead
	.loc 1 183 0
	movq	-352(%rbp), %rdx	# reply, tmp105
	leaq	-304(%rbp), %rax	#, tmp106
	movq	%rdx, %rsi	# tmp105,
	movq	%rax, %rdi	# tmp106,
	call	mspProcessCommand	#
	movl	%eax, -356(%rbp)	# tmp107, status
	.loc 1 185 0
	cmpl	$0, -356(%rbp)	#, status
	je	.L37	#,
	.loc 1 187 0
	movq	-352(%rbp), %rax	# reply, D.5410
	movq	-344(%rbp), %rdx	# outBufHead, tmp108
	movq	%rdx, %rsi	# tmp108,
	movq	%rax, %rdi	# D.5410,
	call	sbufSwitchToReader	#
	.loc 1 188 0
	movq	-352(%rbp), %rdx	# reply, tmp109
	movq	-376(%rbp), %rax	# msp, tmp110
	movq	%rdx, %rsi	# tmp109,
	movq	%rax, %rdi	# tmp110,
	call	mspSerialEncode	#
.L37:
	.loc 1 191 0
	movq	-376(%rbp), %rax	# msp, tmp111
	movl	$0, 24(%rax)	#, msp_7(D)->c_state
	.loc 1 192 0
	nop
	movq	-8(%rbp), %rax	# D.5411, tmp113
	xorq	%fs:40, %rax	#, tmp113
	je	.L38	#,
	call	__stack_chk_fail	#
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	mspSerialProcessReceivedCommand, .-mspSerialProcessReceivedCommand
	.section	.text.mspSerialProcessReceivedByte,"ax",@progbits
	.type	mspSerialProcessReceivedByte, @function
mspSerialProcessReceivedByte:
.LFB18:
	.loc 1 214 0
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
	.loc 1 215 0
	movq	-24(%rbp), %rax	# msp, tmp110
	movl	24(%rax), %eax	# msp_11(D)->c_state, D.5414
	cmpl	$5, %eax	#, D.5414
	ja	.L40	#,
	movl	%eax, %eax	# D.5414, tmp111
	movq	.L42(,%rax,8), %rax	#, tmp112
	jmp	*%rax	# tmp112
	.section	.rodata.mspSerialProcessReceivedByte,"a",@progbits
	.align 8
	.align 4
.L42:
	.quad	.L40
	.quad	.L41
	.quad	.L43
	.quad	.L44
	.quad	.L45
	.quad	.L46
	.section	.text.mspSerialProcessReceivedByte
.L40:
	.loc 1 218 0
	cmpb	$36, -28(%rbp)	#, c
	je	.L47	#,
	.loc 1 219 0
	movl	$0, %eax	#, D.5412
	jmp	.L48	#
.L47:
	.loc 1 220 0
	movq	-24(%rbp), %rax	# msp, tmp113
	movl	$1, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 221 0
	jmp	.L49	#
.L41:
	.loc 1 223 0
	cmpb	$77, -28(%rbp)	#, c
	jne	.L50	#,
	.loc 1 223 0 is_stmt 0 discriminator 1
	movl	$2, %edx	#, D.5413
	jmp	.L51	#
.L50:
	.loc 1 223 0 discriminator 2
	movl	$0, %edx	#, D.5413
.L51:
	.loc 1 223 0 discriminator 4
	movq	-24(%rbp), %rax	# msp, tmp114
	movl	%edx, 24(%rax)	# D.5413, msp_11(D)->c_state
	.loc 1 224 0 is_stmt 1 discriminator 4
	jmp	.L49	#
.L43:
	.loc 1 226 0
	movq	-24(%rbp), %rax	# msp, tmp115
	movl	$0, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 227 0
	movzbl	-28(%rbp), %eax	# c, D.5415
	cmpl	$60, %eax	#, D.5415
	je	.L53	#,
	cmpl	$62, %eax	#, D.5415
	je	.L54	#,
	.loc 1 239 0
	jmp	.L56	#
.L53:
	.loc 1 229 0
	movq	-24(%rbp), %rax	# msp, tmp116
	movl	8(%rax), %eax	# msp_11(D)->mode, D.5416
	testl	%eax, %eax	# D.5416
	jne	.L63	#,
	.loc 1 230 0
	movq	-24(%rbp), %rax	# msp, tmp117
	movl	$3, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 232 0
	jmp	.L63	#
.L54:
	.loc 1 234 0
	movq	-24(%rbp), %rax	# msp, tmp118
	movl	8(%rax), %eax	# msp_11(D)->mode, D.5416
	cmpl	$1, %eax	#, D.5416
	jne	.L64	#,
	.loc 1 235 0
	movq	-24(%rbp), %rax	# msp, tmp119
	movl	$3, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 237 0
	jmp	.L64	#
.L63:
	.loc 1 232 0
	nop
	jmp	.L49	#
.L64:
	.loc 1 237 0
	nop
.L56:
	.loc 1 241 0 discriminator 1
	jmp	.L49	#
.L44:
	.loc 1 243 0
	cmpb	$64, -28(%rbp)	#, c
	jbe	.L58	#,
	.loc 1 244 0
	movq	-24(%rbp), %rax	# msp, tmp120
	movl	$0, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 250 0
	jmp	.L49	#
.L58:
	.loc 1 246 0
	movq	-24(%rbp), %rax	# msp, tmp121
	movzbl	-28(%rbp), %edx	# c, tmp122
	movb	%dl, 29(%rax)	# tmp122, msp_11(D)->dataSize
	.loc 1 247 0
	movq	-24(%rbp), %rax	# msp, tmp123
	movb	$0, 28(%rax)	#, msp_11(D)->offset
	.loc 1 248 0
	movq	-24(%rbp), %rax	# msp, tmp124
	movl	$4, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 250 0
	jmp	.L49	#
.L45:
	.loc 1 252 0
	movq	-24(%rbp), %rax	# msp, tmp125
	movzbl	-28(%rbp), %edx	# c, tmp126
	movb	%dl, 30(%rax)	# tmp126, msp_11(D)->cmdMSP
	.loc 1 253 0
	movq	-24(%rbp), %rax	# msp, tmp127
	movl	$5, 24(%rax)	#, msp_11(D)->c_state
	.loc 1 254 0
	jmp	.L49	#
.L46:
	.loc 1 256 0
	movq	-24(%rbp), %rax	# msp, tmp128
	movzbl	28(%rax), %edx	# msp_11(D)->offset, D.5417
	movq	-24(%rbp), %rax	# msp, tmp129
	movzbl	29(%rax), %eax	# msp_11(D)->dataSize, D.5417
	cmpb	%al, %dl	# D.5417, D.5417
	jnb	.L60	#,
	.loc 1 257 0
	movq	-24(%rbp), %rax	# msp, tmp130
	movzbl	28(%rax), %eax	# msp_11(D)->offset, D.5417
	leal	1(%rax), %ecx	#, D.5417
	movq	-24(%rbp), %rdx	# msp, tmp131
	movb	%cl, 28(%rdx)	# D.5417, msp_11(D)->offset
	movzbl	%al, %eax	# D.5417, D.5415
	movq	-24(%rbp), %rdx	# msp, tmp132
	cltq
	movzbl	-28(%rbp), %ecx	# c, tmp134
	movb	%cl, 31(%rdx,%rax)	# tmp134, msp_11(D)->inBuf
	.loc 1 268 0
	jmp	.L65	#
.L60:
.LBB9:
	.loc 1 259 0
	movb	$0, -1(%rbp)	#, checksum
	.loc 1 260 0
	movq	-24(%rbp), %rax	# msp, tmp135
	movzbl	29(%rax), %eax	# msp_11(D)->dataSize, D.5417
	movzbl	%al, %edx	# D.5417, D.5415
	movzbl	-1(%rbp), %eax	# checksum, D.5415
	movl	%edx, %esi	# D.5415,
	movl	%eax, %edi	# D.5415,
	call	mspSerialChecksum	#
	movb	%al, -1(%rbp)	# tmp136, checksum
	.loc 1 261 0
	movq	-24(%rbp), %rax	# msp, tmp137
	movzbl	30(%rax), %eax	# msp_11(D)->cmdMSP, D.5417
	movzbl	%al, %edx	# D.5417, D.5415
	movzbl	-1(%rbp), %eax	# checksum, D.5415
	movl	%edx, %esi	# D.5415,
	movl	%eax, %edi	# D.5415,
	call	mspSerialChecksum	#
	movb	%al, -1(%rbp)	# tmp138, checksum
	.loc 1 262 0
	movq	-24(%rbp), %rax	# msp, tmp139
	movzbl	29(%rax), %eax	# msp_11(D)->dataSize, D.5417
	movzbl	%al, %edx	# D.5417, D.5415
	movq	-24(%rbp), %rax	# msp, tmp140
	leaq	31(%rax), %rcx	#, D.5418
	movzbl	-1(%rbp), %eax	# checksum, D.5415
	movq	%rcx, %rsi	# D.5418,
	movl	%eax, %edi	# D.5415,
	call	mspSerialChecksumBuf	#
	movb	%al, -1(%rbp)	# tmp141, checksum
	.loc 1 263 0
	movzbl	-28(%rbp), %eax	# c, tmp142
	cmpb	-1(%rbp), %al	# checksum, tmp142
	jne	.L62	#,
	.loc 1 264 0
	movq	-24(%rbp), %rax	# msp, tmp143
	movl	$6, 24(%rax)	#, msp_11(D)->c_state
.LBE9:
	.loc 1 268 0
	jmp	.L65	#
.L62:
.LBB10:
	.loc 1 266 0
	movq	-24(%rbp), %rax	# msp, tmp144
	movl	$0, 24(%rax)	#, msp_11(D)->c_state
.L65:
.LBE10:
	.loc 1 268 0
	nop
.L49:
	.loc 1 270 0
	movl	$1, %eax	#, D.5412
.L48:
	.loc 1 271 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	mspSerialProcessReceivedByte, .-mspSerialProcessReceivedByte
	.section	.text.mspSerialProcess,"ax",@progbits
	.globl	mspSerialProcess
	.type	mspSerialProcess, @function
mspSerialProcess:
.LFB19:
	.loc 1 274 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$336, %rsp	#,
	.loc 1 274 0
	movq	%fs:40, %rax	#, tmp130
	movq	%rax, -8(%rbp)	# tmp130, D.5426
	xorl	%eax, %eax	# tmp130
.LBB11:
	.loc 1 275 0
	movl	$0, -332(%rbp)	#, i
	jmp	.L67	#
.L76:
.LBB12:
	.loc 1 276 0
	movl	-332(%rbp), %eax	# i, tmp100
	movslq	%eax, %rdx	# tmp100, tmp99
	movq	%rdx, %rax	# tmp99, tmp101
	addq	%rax, %rax	# tmp101
	addq	%rdx, %rax	# tmp99, tmp101
	salq	$5, %rax	#, tmp102
	addq	$mspPorts, %rax	#, tmp103
	movq	%rax, -328(%rbp)	# tmp103, msp
	.loc 1 277 0
	movq	-328(%rbp), %rax	# msp, tmp104
	movq	(%rax), %rax	# msp_11->port, D.5419
	testq	%rax, %rax	# D.5419
	je	.L78	#,
	.loc 1 282 0
	jmp	.L70	#
.L73:
.LBB13:
	.loc 1 283 0
	movq	-328(%rbp), %rax	# msp, tmp105
	movq	(%rax), %rax	# msp_11->port, D.5419
	movq	%rax, %rdi	# D.5419,
	call	serialRead	#
	movb	%al, -335(%rbp)	# tmp106, c
	.loc 1 284 0
	movzbl	-335(%rbp), %edx	# c, D.5420
	movq	-328(%rbp), %rax	# msp, tmp107
	movl	%edx, %esi	# D.5420,
	movq	%rax, %rdi	# tmp107,
	call	mspSerialProcessReceivedByte	#
	movb	%al, -334(%rbp)	# tmp108, consumed
	.loc 1 290 0
	movq	-328(%rbp), %rax	# msp, tmp109
	movl	24(%rax), %eax	# msp_11->c_state, D.5421
	cmpl	$6, %eax	#, D.5421
	jne	.L70	#,
	.loc 1 291 0
	movq	-328(%rbp), %rax	# msp, tmp110
	movl	8(%rax), %eax	# msp_11->mode, D.5422
	testl	%eax, %eax	# D.5422
	jne	.L79	#,
	.loc 1 292 0
	movq	-328(%rbp), %rax	# msp, tmp111
	movq	%rax, %rdi	# tmp111,
	call	mspSerialProcessReceivedCommand	#
	.loc 1 299 0
	jmp	.L79	#
.L70:
.LBE13:
	.loc 1 282 0
	movq	-328(%rbp), %rax	# msp, tmp112
	movq	(%rax), %rax	# msp_11->port, D.5419
	movq	%rax, %rdi	# D.5419,
	call	serialRxBytesWaiting	#
	movb	%al, -336(%rbp)	# tmp113, bytesWaiting
	cmpb	$0, -336(%rbp)	#, bytesWaiting
	jne	.L73	#,
	jmp	.L72	#
.L79:
.LBB14:
	.loc 1 299 0
	nop
.L72:
.LBE14:
	.loc 1 302 0
	movq	mspPostProcessFn(%rip), %rax	# mspPostProcessFn, D.5423
	testq	%rax, %rax	# D.5423
	je	.L74	#,
	.loc 1 303 0
	movq	mspPostProcessFn(%rip), %rax	# mspPostProcessFn, D.5423
	movq	-328(%rbp), %rdx	# msp, tmp114
	movq	%rdx, %rdi	# tmp114,
	call	*%rax	# D.5423
	.loc 1 304 0
	movq	$0, mspPostProcessFn(%rip)	#, mspPostProcessFn
.L74:
	.loc 1 308 0
	movq	-328(%rbp), %rax	# msp, tmp115
	movl	24(%rax), %eax	# msp_11->c_state, D.5421
	testl	%eax, %eax	# D.5421
	jne	.L69	#,
	.loc 1 308 0 is_stmt 0 discriminator 1
	movq	-328(%rbp), %rax	# msp, tmp116
	movq	16(%rax), %rax	# msp_11->commandSenderFn, D.5424
	testq	%rax, %rax	# D.5424
	je	.L69	#,
	.loc 1 308 0 discriminator 2
	cmpb	$0, -336(%rbp)	#, bytesWaiting
	jne	.L69	#,
.LBB15:
	.loc 1 311 0 is_stmt 1
	leaq	-272(%rbp), %rax	#, tmp117
	movq	%rax, -304(%rbp)	# tmp117, message.buf.ptr
	leaq	-272(%rbp), %rax	#, tmp118
	addq	$256, %rax	#, tmp119
	movq	%rax, -296(%rbp)	# tmp119, message.buf.end
	movw	$-1, -288(%rbp)	#, message.cmd
	movw	$0, -286(%rbp)	#, message.result
	.loc 1 320 0
	leaq	-304(%rbp), %rax	#, tmp120
	movq	%rax, -320(%rbp)	# tmp120, command
	.loc 1 322 0
	movq	-320(%rbp), %rax	# command, tmp121
	movq	(%rax), %rax	# command_35->buf.ptr, tmp122
	movq	%rax, -312(%rbp)	# tmp122, outBufHead
	.loc 1 324 0
	movq	-328(%rbp), %rax	# msp, tmp123
	movq	16(%rax), %rdx	# msp_11->commandSenderFn, D.5424
	movq	-320(%rbp), %rax	# command, tmp124
	movq	%rax, %rdi	# tmp124,
	movl	$0, %eax	#,
	call	*%rdx	# D.5424
	movb	%al, -333(%rbp)	# tmp125, shouldSend
	.loc 1 326 0
	cmpb	$0, -333(%rbp)	#, shouldSend
	je	.L75	#,
	.loc 1 327 0
	movq	-320(%rbp), %rax	# command, D.5425
	movq	-312(%rbp), %rdx	# outBufHead, tmp126
	movq	%rdx, %rsi	# tmp126,
	movq	%rax, %rdi	# D.5425,
	call	sbufSwitchToReader	#
	.loc 1 329 0
	movq	-320(%rbp), %rdx	# command, tmp127
	movq	-328(%rbp), %rax	# msp, tmp128
	movq	%rdx, %rsi	# tmp127,
	movq	%rax, %rdi	# tmp128,
	call	mspSerialEncode	#
.L75:
	.loc 1 332 0
	movq	-328(%rbp), %rax	# msp, tmp129
	movq	$0, 16(%rax)	#, msp_11->commandSenderFn
	jmp	.L69	#
.L78:
.LBE15:
	.loc 1 278 0
	nop
.L69:
.LBE12:
	.loc 1 275 0 discriminator 2
	addl	$1, -332(%rbp)	#, i
.L67:
	.loc 1 275 0 is_stmt 0 discriminator 1
	cmpl	$1, -332(%rbp)	#, i
	jle	.L76	#,
.LBE11:
	.loc 1 335 0 is_stmt 1
	nop
	movq	-8(%rbp), %rax	# D.5426, tmp131
	xorq	%fs:40, %rax	#, tmp131
	je	.L77	#,
	call	__stack_chk_fail	#
.L77:
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
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc75
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF166
	.byte	0xc
	.long	.LASF167
	.long	.LASF168
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
	.long	.LASF18
	.byte	0x10
	.byte	0x3
	.byte	0x19
	.long	0xd0
	.uleb128 0x7
	.string	"ptr"
	.byte	0x3
	.byte	0x1a
	.long	0xd0
	.byte	0
	.uleb128 0x7
	.string	"end"
	.byte	0x3
	.byte	0x1b
	.long	0xd0
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x50
	.uleb128 0x3
	.long	.LASF15
	.byte	0x3
	.byte	0x1c
	.long	0xab
	.uleb128 0x3
	.long	.LASF16
	.byte	0x4
	.byte	0x15
	.long	0x62
	.uleb128 0x3
	.long	.LASF17
	.byte	0x4
	.byte	0x26
	.long	0xf7
	.uleb128 0x9
	.long	0x107
	.uleb128 0xa
	.long	0x9b
	.uleb128 0xa
	.long	0x42
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.byte	0x2d
	.long	0x125
	.uleb128 0xc
	.string	"ptr"
	.byte	0x4
	.byte	0x2e
	.long	0x9b
	.uleb128 0xc
	.string	"fn"
	.byte	0x4
	.byte	0x2f
	.long	0x125
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xec
	.uleb128 0x6
	.long	.LASF19
	.byte	0x20
	.byte	0x4
	.byte	0x28
	.long	0x174
	.uleb128 0x7
	.string	"pgn"
	.byte	0x4
	.byte	0x29
	.long	0xe1
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
	.long	0xd0
	.byte	0x8
	.uleb128 0x7
	.string	"ptr"
	.byte	0x4
	.byte	0x2c
	.long	0x174
	.byte	0x10
	.uleb128 0xd
	.long	.LASF22
	.byte	0x4
	.byte	0x30
	.long	0x107
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xd0
	.uleb128 0x3
	.long	.LASF23
	.byte	0x4
	.byte	0x31
	.long	0x12b
	.uleb128 0xe
	.long	.LASF27
	.byte	0x4
	.long	0x7f
	.byte	0x5
	.byte	0x14
	.long	0x1a8
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
	.long	0x185
	.uleb128 0xe
	.long	.LASF28
	.byte	0x4
	.long	0x7f
	.byte	0x5
	.byte	0x1a
	.long	0x1f4
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
	.long	0x1b3
	.uleb128 0x3
	.long	.LASF37
	.byte	0x5
	.byte	0x25
	.long	0x20a
	.uleb128 0x8
	.byte	0x8
	.long	0x210
	.uleb128 0x9
	.long	0x21b
	.uleb128 0xa
	.long	0x62
	.byte	0
	.uleb128 0x6
	.long	.LASF38
	.byte	0x48
	.byte	0x5
	.byte	0x27
	.long	0x2d0
	.uleb128 0xd
	.long	.LASF39
	.byte	0x5
	.byte	0x29
	.long	0x355
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
	.long	0x1a8
	.byte	0xc
	.uleb128 0xd
	.long	.LASF42
	.byte	0x5
	.byte	0x2d
	.long	0x1f4
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
	.long	0x360
	.byte	0x20
	.uleb128 0xd
	.long	.LASF47
	.byte	0x5
	.byte	0x34
	.long	0x360
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
	.long	0x1ff
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.long	.LASF53
	.byte	0x50
	.byte	0x5
	.byte	0x3e
	.long	0x355
	.uleb128 0xd
	.long	.LASF54
	.byte	0x5
	.byte	0x3f
	.long	0x38c
	.byte	0
	.uleb128 0xd
	.long	.LASF55
	.byte	0x5
	.byte	0x41
	.long	0x3a1
	.byte	0x8
	.uleb128 0xd
	.long	.LASF56
	.byte	0x5
	.byte	0x42
	.long	0x3a1
	.byte	0x10
	.uleb128 0xd
	.long	.LASF57
	.byte	0x5
	.byte	0x44
	.long	0x3a1
	.byte	0x18
	.uleb128 0xd
	.long	.LASF58
	.byte	0x5
	.byte	0x47
	.long	0x3b7
	.byte	0x20
	.uleb128 0xd
	.long	.LASF59
	.byte	0x5
	.byte	0x49
	.long	0x3d3
	.byte	0x28
	.uleb128 0xd
	.long	.LASF60
	.byte	0x5
	.byte	0x4b
	.long	0x3e9
	.byte	0x30
	.uleb128 0xd
	.long	.LASF61
	.byte	0x5
	.byte	0x4d
	.long	0x404
	.byte	0x38
	.uleb128 0xd
	.long	.LASF62
	.byte	0x5
	.byte	0x4f
	.long	0x415
	.byte	0x40
	.uleb128 0xd
	.long	.LASF63
	.byte	0x5
	.byte	0x50
	.long	0x415
	.byte	0x48
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x35b
	.uleb128 0x10
	.long	0x2d0
	.uleb128 0x8
	.byte	0x8
	.long	0x366
	.uleb128 0x11
	.long	0x50
	.uleb128 0x3
	.long	.LASF64
	.byte	0x5
	.byte	0x3c
	.long	0x21b
	.uleb128 0x9
	.long	0x386
	.uleb128 0xa
	.long	0x386
	.uleb128 0xa
	.long	0x50
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x36b
	.uleb128 0x8
	.byte	0x8
	.long	0x376
	.uleb128 0x12
	.long	0x50
	.long	0x3a1
	.uleb128 0xa
	.long	0x386
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x392
	.uleb128 0x9
	.long	0x3b7
	.uleb128 0xa
	.long	0x386
	.uleb128 0xa
	.long	0x74
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x3a7
	.uleb128 0x12
	.long	0x3cc
	.long	0x3cc
	.uleb128 0xa
	.long	0x386
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF65
	.uleb128 0x8
	.byte	0x8
	.long	0x3bd
	.uleb128 0x9
	.long	0x3e9
	.uleb128 0xa
	.long	0x386
	.uleb128 0xa
	.long	0x1a8
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x3d9
	.uleb128 0x9
	.long	0x404
	.uleb128 0xa
	.long	0x386
	.uleb128 0xa
	.long	0x9b
	.uleb128 0xa
	.long	0x42
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x3ef
	.uleb128 0x9
	.long	0x415
	.uleb128 0xa
	.long	0x386
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x40a
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x14
	.long	0x440
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
	.uleb128 0x6
	.long	.LASF70
	.byte	0x18
	.byte	0x6
	.byte	0x16
	.long	0x471
	.uleb128 0x7
	.string	"buf"
	.byte	0x6
	.byte	0x17
	.long	0xd6
	.byte	0
	.uleb128 0x7
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
	.long	0x440
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x8
	.byte	0x3c
	.long	0x4b3
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
	.long	0x47c
	.uleb128 0x3
	.long	.LASF81
	.byte	0x8
	.byte	0x46
	.long	0x4c9
	.uleb128 0x8
	.byte	0x8
	.long	0x4cf
	.uleb128 0x14
	.long	0x3cc
	.long	0x4da
	.uleb128 0x15
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x8
	.byte	0x4b
	.long	0x4f3
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
	.long	0x4da
	.uleb128 0x6
	.long	.LASF85
	.byte	0x60
	.byte	0x8
	.byte	0x50
	.long	0x56b
	.uleb128 0xd
	.long	.LASF86
	.byte	0x8
	.byte	0x51
	.long	0x386
	.byte	0
	.uleb128 0xd
	.long	.LASF41
	.byte	0x8
	.byte	0x52
	.long	0x4f3
	.byte	0x8
	.uleb128 0xd
	.long	.LASF87
	.byte	0x8
	.byte	0x54
	.long	0x4be
	.byte	0x10
	.uleb128 0xd
	.long	.LASF88
	.byte	0x8
	.byte	0x56
	.long	0x4b3
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
	.long	0x56b
	.byte	0x1f
	.byte	0
	.uleb128 0x16
	.long	0x50
	.long	0x57b
	.uleb128 0x17
	.long	0x8d
	.byte	0x3f
	.byte	0
	.uleb128 0x3
	.long	.LASF93
	.byte	0x8
	.byte	0x5b
	.long	0x4fe
	.uleb128 0x3
	.long	.LASF94
	.byte	0x8
	.byte	0x5f
	.long	0x591
	.uleb128 0x8
	.byte	0x8
	.long	0x597
	.uleb128 0x9
	.long	0x5a2
	.uleb128 0xa
	.long	0x5a2
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x57b
	.uleb128 0x13
	.byte	0x4
	.long	0x7f
	.byte	0x9
	.byte	0x1a
	.long	0x5f9
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
	.long	0x642
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
	.long	0x5f9
	.uleb128 0x6
	.long	.LASF117
	.byte	0xc
	.byte	0x9
	.byte	0x5a
	.long	0x67e
	.uleb128 0xd
	.long	.LASF40
	.byte	0x9
	.byte	0x5b
	.long	0x642
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
	.long	0x67e
	.byte	0x6
	.byte	0
	.uleb128 0x16
	.long	0x50
	.long	0x68e
	.uleb128 0x17
	.long	0x8d
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF120
	.byte	0x9
	.byte	0x5e
	.long	0x64d
	.uleb128 0x6
	.long	.LASF121
	.byte	0x1c
	.byte	0x9
	.byte	0x60
	.long	0x6be
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
	.long	0x6be
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.long	0x68e
	.long	0x6ce
	.uleb128 0x17
	.long	0x8d
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF124
	.byte	0x9
	.byte	0x63
	.long	0x699
	.uleb128 0x1a
	.long	.LASF143
	.byte	0x1
	.byte	0x33
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x713
	.uleb128 0x1b
	.long	.LASF125
	.byte	0x1
	.byte	0x33
	.long	0x5a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.long	.LASF126
	.byte	0x1
	.byte	0x33
	.long	0x386
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1c
	.long	.LASF134
	.byte	0x1
	.byte	0x3a
	.long	0x5a2
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x753
	.uleb128 0x1d
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.byte	0x3c
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF131
	.byte	0x1
	.byte	0x42
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x7dd
	.uleb128 0x1d
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x20
	.long	.LASF127
	.byte	0x1
	.byte	0x44
	.long	0x7dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.long	.Ldebug_ranges0+0
	.uleb128 0x20
	.long	.LASF128
	.byte	0x1
	.byte	0x4d
	.long	0x5a2
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
	.long	0x4f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF126
	.byte	0x1
	.byte	0x61
	.long	0x386
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x68e
	.uleb128 0x1f
	.long	.LASF132
	.byte	0x1
	.byte	0x6c
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x84d
	.uleb128 0x1b
	.long	.LASF126
	.byte	0x1
	.byte	0x6c
	.long	0x386
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.byte	0x6e
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
	.byte	0x6f
	.long	0x5a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF133
	.byte	0x1
	.byte	0x77
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x889
	.uleb128 0x1d
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.byte	0x79
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
	.long	0x8c7
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
	.long	0x913
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
	.long	0xd0
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
	.long	0x977
	.uleb128 0x23
	.string	"msp"
	.byte	0x1
	.byte	0x8e
	.long	0x5a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.long	.LASF141
	.byte	0x1
	.byte	0x8e
	.long	0x977
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1e
	.string	"len"
	.byte	0x1
	.byte	0x91
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.string	"hdr"
	.byte	0x1
	.byte	0x92
	.long	0x97d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF142
	.byte	0x1
	.byte	0x93
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x471
	.uleb128 0x16
	.long	0x50
	.long	0x98d
	.uleb128 0x17
	.long	0x8d
	.byte	0x4
	.byte	0
	.uleb128 0x1a
	.long	.LASF144
	.byte	0x1
	.byte	0x9e
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0xa14
	.uleb128 0x23
	.string	"msp"
	.byte	0x1
	.byte	0x9e
	.long	0x5a2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.uleb128 0x20
	.long	.LASF145
	.byte	0x1
	.byte	0xa0
	.long	0xa14
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x20
	.long	.LASF146
	.byte	0x1
	.byte	0xa2
	.long	0x471
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x20
	.long	.LASF147
	.byte	0x1
	.byte	0xab
	.long	0x471
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x20
	.long	.LASF148
	.byte	0x1
	.byte	0xb4
	.long	0x977
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x20
	.long	.LASF149
	.byte	0x1
	.byte	0xb6
	.long	0xd0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0x20
	.long	.LASF150
	.byte	0x1
	.byte	0xb7
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -372
	.byte	0
	.uleb128 0x16
	.long	0x50
	.long	0xa24
	.uleb128 0x17
	.long	0x8d
	.byte	0xff
	.byte	0
	.uleb128 0x22
	.long	.LASF151
	.byte	0x1
	.byte	0xd5
	.long	0x3cc
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xa75
	.uleb128 0x23
	.string	"msp"
	.byte	0x1
	.byte	0xd5
	.long	0x5a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"c"
	.byte	0x1
	.byte	0xd5
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x30
	.uleb128 0x24
	.long	.LASF136
	.byte	0x1
	.value	0x103
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF152
	.byte	0x1
	.value	0x111
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xb70
	.uleb128 0x1d
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x113
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -348
	.uleb128 0x1d
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x26
	.string	"msp"
	.byte	0x1
	.value	0x114
	.long	0x5a2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.uleb128 0x24
	.long	.LASF153
	.byte	0x1
	.value	0x119
	.long	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x27
	.long	.Ldebug_ranges0+0x60
	.long	0xb0b
	.uleb128 0x26
	.string	"c"
	.byte	0x1
	.value	0x11b
	.long	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -351
	.uleb128 0x24
	.long	.LASF154
	.byte	0x1
	.value	0x11c
	.long	0x3cc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -350
	.byte	0
	.uleb128 0x1d
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x24
	.long	.LASF145
	.byte	0x1
	.value	0x136
	.long	0xa14
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x24
	.long	.LASF146
	.byte	0x1
	.value	0x137
	.long	0x471
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x24
	.long	.LASF147
	.byte	0x1
	.value	0x140
	.long	0x977
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x24
	.long	.LASF149
	.byte	0x1
	.value	0x142
	.long	0xd0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x24
	.long	.LASF155
	.byte	0x1
	.value	0x144
	.long	0x3cc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -349
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF156
	.byte	0xa
	.byte	0xc8
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x28
	.long	.LASF157
	.byte	0xa
	.byte	0xc9
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x28
	.long	.LASF158
	.byte	0xa
	.byte	0xca
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x28
	.long	.LASF159
	.byte	0x4
	.byte	0x43
	.long	0xbc4
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x8
	.byte	0x8
	.long	0x17a
	.uleb128 0x28
	.long	.LASF160
	.byte	0x4
	.byte	0x44
	.long	0xbc4
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x28
	.long	.LASF161
	.byte	0x4
	.byte	0x47
	.long	0xd0
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x28
	.long	.LASF162
	.byte	0x4
	.byte	0x48
	.long	0xd0
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x16
	.long	0x57b
	.long	0xc19
	.uleb128 0x17
	.long	0x8d
	.byte	0x1
	.byte	0
	.uleb128 0x28
	.long	.LASF163
	.byte	0x1
	.byte	0x2f
	.long	0xc09
	.uleb128 0x9
	.byte	0x3
	.quad	mspPorts
	.uleb128 0x28
	.long	.LASF164
	.byte	0x1
	.byte	0x2d
	.long	0x586
	.uleb128 0x9
	.byte	0x3
	.quad	mspPostProcessFn
	.uleb128 0x16
	.long	0xc4e
	.long	0xc4e
	.uleb128 0x29
	.byte	0
	.uleb128 0x10
	.long	0x74
	.uleb128 0x2a
	.long	.LASF119
	.byte	0x9
	.byte	0x33
	.long	0xc5e
	.uleb128 0x10
	.long	0xc43
	.uleb128 0x28
	.long	.LASF165
	.byte	0x9
	.byte	0x65
	.long	0x6ce
	.uleb128 0x9
	.byte	0x3
	.quad	serialConfig_System
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
.LASF158:
	.string	"U_ID_2"
.LASF161:
	.string	"__pg_resetdata_start"
.LASF3:
	.string	"int16_t"
.LASF167:
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
.LASF91:
	.string	"cmdMSP"
.LASF2:
	.string	"long int"
.LASF27:
	.string	"portMode_t"
.LASF9:
	.string	"unsigned int"
.LASF57:
	.string	"serialRead"
.LASF118:
	.string	"functionMask"
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
.LASF166:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF16:
	.string	"pgn_t"
.LASF10:
	.string	"long unsigned int"
.LASF164:
	.string	"mspPostProcessFn"
.LASF154:
	.string	"consumed"
.LASF165:
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
.LASF153:
	.string	"bytesWaiting"
.LASF97:
	.string	"FUNCTION_GPS"
.LASF113:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF114:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF160:
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
.LASF163:
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
.LASF162:
	.string	"__pg_resetdata_end"
.LASF159:
	.string	"__pg_registry_start"
.LASF48:
	.string	"rxBufferHead"
.LASF135:
	.string	"mspSerialChecksum"
.LASF156:
	.string	"U_ID_0"
.LASF107:
	.string	"SERIAL_PORT_UART1"
.LASF168:
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
.LASF157:
	.string	"U_ID_1"
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
.LASF155:
	.string	"shouldSend"
.LASF38:
	.string	"serialPort_s"
.LASF64:
	.string	"serialPort_t"
.LASF92:
	.string	"inBuf"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
