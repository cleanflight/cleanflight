	.file	"serial_usb_vcp.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed serial_usb_vcp.i -mtune=generic
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
	.comm	U_ID_0,4,4
	.comm	U_ID_1,4,4
	.comm	U_ID_2,4,4
	.comm	receiveLength,4,4
	.section	.bss.vcpPort,"aw",@nobits
	.align 32
	.type	vcpPort, @object
	.size	vcpPort, 96
vcpPort:
	.zero	96
	.section	.text.usbVcpSetBaudRate,"ax",@progbits
	.type	usbVcpSetBaudRate, @function
usbVcpSetBaudRate:
.LFB4:
	.file 1 "src/main/drivers/serial_usb_vcp.c"
	.loc 1 44 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, -12(%rbp)	# baudRate, baudRate
	.loc 1 47 0
	nop
	.loc 1 49 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	usbVcpSetBaudRate, .-usbVcpSetBaudRate
	.section	.text.usbVcpSetMode,"ax",@progbits
	.type	usbVcpSetMode, @function
usbVcpSetMode:
.LFB5:
	.loc 1 52 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, -12(%rbp)	# mode, mode
	.loc 1 57 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	usbVcpSetMode, .-usbVcpSetMode
	.section	.text.isUsbVcpTransmitBufferEmpty,"ax",@progbits
	.type	isUsbVcpTransmitBufferEmpty, @function
isUsbVcpTransmitBufferEmpty:
.LFB6:
	.loc 1 60 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 62 0
	movl	$1, %eax	#, D.4967
	.loc 1 63 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	isUsbVcpTransmitBufferEmpty, .-isUsbVcpTransmitBufferEmpty
	.section	.text.usbVcpAvailable,"ax",@progbits
	.type	usbVcpAvailable, @function
usbVcpAvailable:
.LFB7:
	.loc 1 66 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 68 0
	call	serial_waiting	#
	.loc 1 70 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	usbVcpAvailable, .-usbVcpAvailable
	.section	.text.usbVcpRead,"ax",@progbits
	.type	usbVcpRead, @function
usbVcpRead:
.LFB8:
	.loc 1 73 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# instance, instance
	.loc 1 73 0
	movq	%fs:40, %rax	#, tmp92
	movq	%rax, -8(%rbp)	# tmp92, D.4972
	xorl	%eax, %eax	# tmp92
	.loc 1 78 0
	leaq	-9(%rbp), %rax	#, tmp90
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	usbRead	#
	movl	%eax, -16(%rbp)	# D.4970, len
	.loc 1 80 0
	movzbl	-9(%rbp), %eax	# buf, D.4971
	.loc 1 81 0
	movq	-8(%rbp), %rdx	# D.4972, tmp93
	xorq	%fs:40, %rdx	#, tmp93
	je	.L10	#,
	call	__stack_chk_fail	#
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	usbVcpRead, .-usbVcpRead
	.section	.text.usbVcpWrite,"ax",@progbits
	.type	usbVcpWrite, @function
usbVcpWrite:
.LFB9:
	.loc 1 128 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, %eax	# c, tmp87
	movb	%al, -12(%rbp)	# tmp87, c
	.loc 1 129 0
	leaq	-12(%rbp), %rax	#, tmp88
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	usbWrite	#
	.loc 1 130 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	usbVcpWrite, .-usbVcpWrite
	.section	.text.usbVcpBeginWrite,"ax",@progbits
	.type	usbVcpBeginWrite, @function
usbVcpBeginWrite:
.LFB10:
	.loc 1 133 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 134 0
	nop
	.loc 1 135 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	usbVcpBeginWrite, .-usbVcpBeginWrite
	.section	.text.usbTxBytesFree,"ax",@progbits
	.globl	usbTxBytesFree
	.type	usbTxBytesFree, @function
usbTxBytesFree:
.LFB11:
	.loc 1 138 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 140 0
	movl	$-1, %eax	#, D.4975
	.loc 1 141 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	usbTxBytesFree, .-usbTxBytesFree
	.section	.rodata.usbVTable,"a",@progbits
	.align 32
	.type	usbVTable, @object
	.size	usbVTable, 80
usbVTable:
# serialWrite:
	.quad	usbVcpWrite
# serialTotalRxWaiting:
	.quad	usbVcpAvailable
# serialTotalTxFree:
	.quad	usbTxBytesFree
# serialRead:
	.quad	usbVcpRead
# serialSetBaudRate:
	.quad	usbVcpSetBaudRate
# isSerialTransmitBufferEmpty:
	.quad	isUsbVcpTransmitBufferEmpty
# setMode:
	.quad	usbVcpSetMode
# writeBuf:
	.quad	0
# beginWrite:
	.quad	0
# endWrite:
	.quad	0
	.section	.text.usbVcpOpen,"ax",@progbits
	.globl	usbVcpOpen
	.type	usbVcpOpen, @function
usbVcpOpen:
.LFB12:
	.loc 1 165 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 166 0
	call	usbInit	#
	movq	%rax, -8(%rbp)	# tmp89, s
	.loc 1 168 0
	movq	-8(%rbp), %rax	# s, D.4976
	.loc 1 169 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	usbVcpOpen, .-usbVcpOpen
	.section	.text.usbVcpGetBaudRate,"ax",@progbits
	.globl	usbVcpGetBaudRate
	.type	usbVcpGetBaudRate, @function
usbVcpGetBaudRate:
.LFB13:
	.loc 1 172 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 174 0
	call	Virtual_Com_Port_GetBaudRate	#
	.loc 1 175 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	usbVcpGetBaudRate, .-usbVcpGetBaudRate
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/drivers/serial.h"
	.file 4 "src/main/drivers/serial_usb_vcp.h"
	.file 5 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x62e
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF77
	.byte	0xc
	.long	.LASF78
	.long	.LASF79
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
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
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
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x6
	.long	.LASF17
	.byte	0x4
	.long	0x74
	.byte	0x3
	.byte	0x14
	.long	0xc3
	.uleb128 0x7
	.long	.LASF14
	.byte	0x1
	.uleb128 0x7
	.long	.LASF15
	.byte	0x2
	.uleb128 0x7
	.long	.LASF16
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF17
	.byte	0x3
	.byte	0x18
	.long	0xa0
	.uleb128 0x6
	.long	.LASF18
	.byte	0x4
	.long	0x74
	.byte	0x3
	.byte	0x1a
	.long	0x10f
	.uleb128 0x7
	.long	.LASF19
	.byte	0
	.uleb128 0x7
	.long	.LASF20
	.byte	0x1
	.uleb128 0x7
	.long	.LASF21
	.byte	0
	.uleb128 0x7
	.long	.LASF22
	.byte	0x2
	.uleb128 0x7
	.long	.LASF23
	.byte	0
	.uleb128 0x7
	.long	.LASF24
	.byte	0x4
	.uleb128 0x7
	.long	.LASF25
	.byte	0
	.uleb128 0x7
	.long	.LASF26
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF18
	.byte	0x3
	.byte	0x23
	.long	0xce
	.uleb128 0x4
	.long	.LASF27
	.byte	0x3
	.byte	0x25
	.long	0x125
	.uleb128 0x8
	.byte	0x8
	.long	0x12b
	.uleb128 0x9
	.long	0x136
	.uleb128 0xa
	.long	0x57
	.byte	0
	.uleb128 0xb
	.long	.LASF42
	.byte	0x48
	.byte	0x3
	.byte	0x27
	.long	0x1eb
	.uleb128 0xc
	.long	.LASF28
	.byte	0x3
	.byte	0x29
	.long	0x270
	.byte	0
	.uleb128 0xc
	.long	.LASF29
	.byte	0x3
	.byte	0x2b
	.long	0x45
	.byte	0x8
	.uleb128 0xc
	.long	.LASF30
	.byte	0x3
	.byte	0x2c
	.long	0xc3
	.byte	0xc
	.uleb128 0xc
	.long	.LASF31
	.byte	0x3
	.byte	0x2d
	.long	0x10f
	.byte	0x10
	.uleb128 0xc
	.long	.LASF32
	.byte	0x3
	.byte	0x2f
	.long	0x69
	.byte	0x14
	.uleb128 0xc
	.long	.LASF33
	.byte	0x3
	.byte	0x31
	.long	0x69
	.byte	0x18
	.uleb128 0xc
	.long	.LASF34
	.byte	0x3
	.byte	0x32
	.long	0x69
	.byte	0x1c
	.uleb128 0xc
	.long	.LASF35
	.byte	0x3
	.byte	0x33
	.long	0x27b
	.byte	0x20
	.uleb128 0xc
	.long	.LASF36
	.byte	0x3
	.byte	0x34
	.long	0x27b
	.byte	0x28
	.uleb128 0xc
	.long	.LASF37
	.byte	0x3
	.byte	0x35
	.long	0x69
	.byte	0x30
	.uleb128 0xc
	.long	.LASF38
	.byte	0x3
	.byte	0x36
	.long	0x69
	.byte	0x34
	.uleb128 0xc
	.long	.LASF39
	.byte	0x3
	.byte	0x37
	.long	0x69
	.byte	0x38
	.uleb128 0xc
	.long	.LASF40
	.byte	0x3
	.byte	0x38
	.long	0x69
	.byte	0x3c
	.uleb128 0xc
	.long	.LASF41
	.byte	0x3
	.byte	0x3b
	.long	0x11a
	.byte	0x40
	.byte	0
	.uleb128 0xb
	.long	.LASF43
	.byte	0x50
	.byte	0x3
	.byte	0x3e
	.long	0x270
	.uleb128 0xc
	.long	.LASF44
	.byte	0x3
	.byte	0x3f
	.long	0x2a7
	.byte	0
	.uleb128 0xc
	.long	.LASF45
	.byte	0x3
	.byte	0x41
	.long	0x2bc
	.byte	0x8
	.uleb128 0xc
	.long	.LASF46
	.byte	0x3
	.byte	0x42
	.long	0x2bc
	.byte	0x10
	.uleb128 0xc
	.long	.LASF47
	.byte	0x3
	.byte	0x44
	.long	0x2bc
	.byte	0x18
	.uleb128 0xc
	.long	.LASF48
	.byte	0x3
	.byte	0x47
	.long	0x2d2
	.byte	0x20
	.uleb128 0xc
	.long	.LASF49
	.byte	0x3
	.byte	0x49
	.long	0x2ee
	.byte	0x28
	.uleb128 0xc
	.long	.LASF50
	.byte	0x3
	.byte	0x4b
	.long	0x304
	.byte	0x30
	.uleb128 0xc
	.long	.LASF51
	.byte	0x3
	.byte	0x4d
	.long	0x31f
	.byte	0x38
	.uleb128 0xc
	.long	.LASF52
	.byte	0x3
	.byte	0x4f
	.long	0x330
	.byte	0x40
	.uleb128 0xc
	.long	.LASF53
	.byte	0x3
	.byte	0x50
	.long	0x330
	.byte	0x48
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x276
	.uleb128 0xd
	.long	0x1eb
	.uleb128 0x8
	.byte	0x8
	.long	0x281
	.uleb128 0xe
	.long	0x45
	.uleb128 0x4
	.long	.LASF54
	.byte	0x3
	.byte	0x3c
	.long	0x136
	.uleb128 0x9
	.long	0x2a1
	.uleb128 0xa
	.long	0x2a1
	.uleb128 0xa
	.long	0x45
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x286
	.uleb128 0x8
	.byte	0x8
	.long	0x291
	.uleb128 0xf
	.long	0x45
	.long	0x2bc
	.uleb128 0xa
	.long	0x2a1
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x2ad
	.uleb128 0x9
	.long	0x2d2
	.uleb128 0xa
	.long	0x2a1
	.uleb128 0xa
	.long	0x69
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x2c2
	.uleb128 0xf
	.long	0x2e7
	.long	0x2e7
	.uleb128 0xa
	.long	0x2a1
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF55
	.uleb128 0x8
	.byte	0x8
	.long	0x2d8
	.uleb128 0x9
	.long	0x304
	.uleb128 0xa
	.long	0x2a1
	.uleb128 0xa
	.long	0xc3
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x2f4
	.uleb128 0x9
	.long	0x31f
	.uleb128 0xa
	.long	0x2a1
	.uleb128 0xa
	.long	0x89
	.uleb128 0xa
	.long	0x37
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x30a
	.uleb128 0x9
	.long	0x330
	.uleb128 0xa
	.long	0x2a1
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x325
	.uleb128 0x10
	.byte	0x60
	.byte	0x4
	.byte	0x16
	.long	0x36f
	.uleb128 0xc
	.long	.LASF56
	.byte	0x4
	.byte	0x17
	.long	0x286
	.byte	0
	.uleb128 0xc
	.long	.LASF57
	.byte	0x4
	.byte	0x1a
	.long	0x36f
	.byte	0x48
	.uleb128 0xc
	.long	.LASF58
	.byte	0x4
	.byte	0x1b
	.long	0x45
	.byte	0x5c
	.uleb128 0xc
	.long	.LASF59
	.byte	0x4
	.byte	0x1d
	.long	0x2e7
	.byte	0x5d
	.byte	0
	.uleb128 0x11
	.long	0x45
	.long	0x37f
	.uleb128 0x12
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	.LASF60
	.byte	0x4
	.byte	0x1e
	.long	0x336
	.uleb128 0x13
	.long	.LASF62
	.byte	0x1
	.byte	0x2b
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c4
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x2b
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF32
	.byte	0x1
	.byte	0x2b
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x13
	.long	.LASF63
	.byte	0x1
	.byte	0x33
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x3fe
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x33
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF30
	.byte	0x1
	.byte	0x33
	.long	0xc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x15
	.long	.LASF64
	.byte	0x1
	.byte	0x3b
	.long	0x2e7
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x42e
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x3b
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF65
	.byte	0x1
	.byte	0x41
	.long	0x45
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x45e
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x41
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF66
	.byte	0x1
	.byte	0x48
	.long	0x45
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x4aa
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x48
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.string	"buf"
	.byte	0x1
	.byte	0x4c
	.long	0x4aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x17
	.string	"len"
	.byte	0x1
	.byte	0x4e
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.long	0x45
	.long	0x4ba
	.uleb128 0x12
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF67
	.byte	0x1
	.byte	0x7f
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x4f2
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x7f
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x7f
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x13
	.long	.LASF68
	.byte	0x1
	.byte	0x84
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x51e
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x84
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.long	.LASF80
	.byte	0x1
	.byte	0x89
	.long	0x45
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.long	.LASF69
	.byte	0x1
	.byte	0xa4
	.long	0x2a1
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x569
	.uleb128 0x17
	.string	"s"
	.byte	0x1
	.byte	0xa6
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.long	.LASF70
	.byte	0x1
	.byte	0xab
	.long	0x69
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x599
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0xab
	.long	0x2a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.long	.LASF71
	.byte	0x1
	.byte	0x29
	.long	0x37f
	.uleb128 0x9
	.byte	0x3
	.quad	vcpPort
	.uleb128 0x11
	.long	0x276
	.long	0x5be
	.uleb128 0x12
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF72
	.byte	0x1
	.byte	0x95
	.long	0x5d3
	.uleb128 0x9
	.byte	0x3
	.quad	usbVTable
	.uleb128 0xd
	.long	0x5ae
	.uleb128 0x1d
	.long	.LASF73
	.byte	0x5
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x1d
	.long	.LASF74
	.byte	0x5
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x1d
	.long	.LASF75
	.byte	0x5
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x1d
	.long	.LASF76
	.byte	0x4
	.byte	0x1f
	.long	0x62c
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0xe
	.long	0x69
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x2117
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.long	0xbc
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
	.quad	.LFB13
	.quad	.LFE13-.LFB13
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
	.quad	.LFB13
	.quad	.LFE13
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF28:
	.string	"vTable"
.LASF64:
	.string	"isUsbVcpTransmitBufferEmpty"
.LASF80:
	.string	"usbTxBytesFree"
.LASF62:
	.string	"usbVcpSetBaudRate"
.LASF78:
	.string	"src/main/drivers/serial_usb_vcp.c"
.LASF19:
	.string	"SERIAL_NOT_INVERTED"
.LASF35:
	.string	"rxBuffer"
.LASF44:
	.string	"serialWrite"
.LASF1:
	.string	"short int"
.LASF52:
	.string	"beginWrite"
.LASF10:
	.string	"sizetype"
.LASF16:
	.string	"MODE_RXTX"
.LASF23:
	.string	"SERIAL_PARITY_NO"
.LASF63:
	.string	"usbVcpSetMode"
.LASF32:
	.string	"baudRate"
.LASF45:
	.string	"serialTotalRxWaiting"
.LASF73:
	.string	"U_ID_0"
.LASF69:
	.string	"usbVcpOpen"
.LASF75:
	.string	"U_ID_2"
.LASF58:
	.string	"txAt"
.LASF20:
	.string	"SERIAL_INVERTED"
.LASF70:
	.string	"usbVcpGetBaudRate"
.LASF49:
	.string	"isSerialTransmitBufferEmpty"
.LASF51:
	.string	"writeBuf"
.LASF14:
	.string	"MODE_RX"
.LASF68:
	.string	"usbVcpBeginWrite"
.LASF27:
	.string	"serialReceiveCallbackPtr"
.LASF43:
	.string	"serialPortVTable"
.LASF36:
	.string	"txBuffer"
.LASF29:
	.string	"identifier"
.LASF39:
	.string	"txBufferHead"
.LASF67:
	.string	"usbVcpWrite"
.LASF12:
	.string	"long long int"
.LASF31:
	.string	"options"
.LASF77:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF66:
	.string	"usbVcpRead"
.LASF2:
	.string	"long int"
.LASF40:
	.string	"txBufferTail"
.LASF34:
	.string	"txBufferSize"
.LASF72:
	.string	"usbVTable"
.LASF60:
	.string	"vcpPort_t"
.LASF3:
	.string	"unsigned char"
.LASF38:
	.string	"rxBufferTail"
.LASF76:
	.string	"receiveLength"
.LASF0:
	.string	"signed char"
.LASF13:
	.string	"long long unsigned int"
.LASF7:
	.string	"uint32_t"
.LASF48:
	.string	"serialSetBaudRate"
.LASF8:
	.string	"unsigned int"
.LASF5:
	.string	"uint16_t"
.LASF61:
	.string	"instance"
.LASF59:
	.string	"buffering"
.LASF65:
	.string	"usbVcpAvailable"
.LASF24:
	.string	"SERIAL_PARITY_EVEN"
.LASF50:
	.string	"setMode"
.LASF74:
	.string	"U_ID_1"
.LASF11:
	.string	"char"
.LASF53:
	.string	"endWrite"
.LASF6:
	.string	"short unsigned int"
.LASF30:
	.string	"mode"
.LASF79:
	.string	"/home/aravind/git/cleanflight"
.LASF55:
	.string	"_Bool"
.LASF25:
	.string	"SERIAL_UNIDIR"
.LASF56:
	.string	"port"
.LASF9:
	.string	"long unsigned int"
.LASF37:
	.string	"rxBufferHead"
.LASF15:
	.string	"MODE_TX"
.LASF47:
	.string	"serialRead"
.LASF17:
	.string	"portMode_t"
.LASF57:
	.string	"txBuf"
.LASF33:
	.string	"rxBufferSize"
.LASF21:
	.string	"SERIAL_STOPBITS_1"
.LASF22:
	.string	"SERIAL_STOPBITS_2"
.LASF4:
	.string	"uint8_t"
.LASF18:
	.string	"portOptions_t"
.LASF71:
	.string	"vcpPort"
.LASF42:
	.string	"serialPort_s"
.LASF54:
	.string	"serialPort_t"
.LASF46:
	.string	"serialTotalTxFree"
.LASF26:
	.string	"SERIAL_BIDIR"
.LASF41:
	.string	"callback"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
