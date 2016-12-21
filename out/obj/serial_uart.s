	.file	"serial_uart.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed serial_uart.i -mtune=generic
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
	.comm	USB,88,32
	.globl	linecoding
	.section	.data.linecoding,"aw",@progbits
	.align 8
	.type	linecoding, @object
	.size	linecoding, 8
linecoding:
# bitrate:
	.long	115200
# format:
	.byte	0
# paritytype:
	.byte	0
# datatype:
	.byte	8
	.zero	1
	.globl	portname
	.section	.data.portname,"aw",@progbits
	.align 16
	.type	portname, @object
	.size	portname, 20
portname:
	.string	"/dev/ttyMFD2"
	.zero	7
	.comm	rdlen,4,4
	.comm	usb_port,72,32
	.section	.rodata.usbTable,"a",@progbits
	.align 32
	.type	usbTable, @object
	.size	usbTable, 80
usbTable:
# serialWrite:
	.quad	usbVcpWrite
# serialTotalRxWaiting:
	.quad	serial_waiting
# serialTotalTxFree:
	.quad	usbTxBytesFree
# serialRead:
	.quad	usbVcpRead
# serialSetBaudRate:
	.quad	usbVcpSetBaudRate
# isSerialTransmitBufferEmpty:
	.quad	usb_txbuffer_empty
# setMode:
	.quad	usbVcpSetMode
# writeBuf:
	.quad	0
# beginWrite:
	.quad	0
# endWrite:
	.quad	0
	.section	.text.usartInitAllIOSignals,"ax",@progbits
	.globl	usartInitAllIOSignals
	.type	usartInitAllIOSignals, @function
usartInitAllIOSignals:
.LFB4:
	.file 1 "src/main/drivers/serial_uart.c"
	.loc 1 88 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 90 0
	movl	$0, USB+76(%rip)	#, USB.deviceState
	.loc 1 91 0
	movq	usb_port(%rip), %rax	# usb_port, tmp89
	movq	%rax, USB(%rip)	# tmp89, USB.port
	movq	usb_port+8(%rip), %rax	# usb_port, tmp90
	movq	%rax, USB+8(%rip)	# tmp90, USB.port
	movq	usb_port+16(%rip), %rax	# usb_port, tmp91
	movq	%rax, USB+16(%rip)	# tmp91, USB.port
	movq	usb_port+24(%rip), %rax	# usb_port, tmp92
	movq	%rax, USB+24(%rip)	# tmp92, USB.port
	movq	usb_port+32(%rip), %rax	# usb_port, tmp93
	movq	%rax, USB+32(%rip)	# tmp93, USB.port
	movq	usb_port+40(%rip), %rax	# usb_port, tmp94
	movq	%rax, USB+40(%rip)	# tmp94, USB.port
	movq	usb_port+48(%rip), %rax	# usb_port, tmp95
	movq	%rax, USB+48(%rip)	# tmp95, USB.port
	movq	usb_port+56(%rip), %rax	# usb_port, tmp96
	movq	%rax, USB+56(%rip)	# tmp96, USB.port
	movq	usb_port+64(%rip), %rax	# usb_port, tmp97
	movq	%rax, USB+64(%rip)	# tmp97, USB.port
	.loc 1 92 0
	movq	$usbTable, USB(%rip)	#, USB.port.vTable
	.loc 1 95 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	usartInitAllIOSignals, .-usartInitAllIOSignals
	.section	.text.usbInit,"ax",@progbits
	.globl	usbInit
	.type	usbInit, @function
usbInit:
.LFB5:
	.loc 1 99 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 100 0
	call	usbOpen	#
	movl	%eax, -4(%rbp)	# tmp89, fd
	.loc 1 102 0
	movl	-4(%rbp), %eax	# fd, tmp90
	movl	$2, %esi	#,
	movl	%eax, %edi	# tmp90,
	call	tcflush	#
	.loc 1 103 0
	movl	-4(%rbp), %eax	# fd, tmp91
	movl	%eax, %edi	# tmp91,
	call	SetUsbAttributes	#
	.loc 1 104 0
	movl	$USB, %eax	#, D.5128
	.loc 1 105 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	usbInit, .-usbInit
	.section	.rodata
.LC0:
	.string	"Error opening %s: %s\n"
	.section	.text.usbOpen,"ax",@progbits
	.globl	usbOpen
	.type	usbOpen, @function
usbOpen:
.LFB6:
	.loc 1 109 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 110 0
	movl	$1054978, %esi	#,
	movl	$portname, %edi	#,
	movl	$0, %eax	#,
	call	open	#
	movl	%eax, -4(%rbp)	# tmp92, fd
	.loc 1 111 0
	cmpl	$0, -4(%rbp)	#, fd
	jns	.L5	#,
	.loc 1 112 0
	call	__errno_location	#
	.loc 1 112 0
	movl	(%rax), %eax	# *_7, D.5129
	movl	%eax, %edi	# D.5129,
	call	strerror	#
	movq	%rax, %rdx	# D.5131,
	movl	$portname, %esi	#,
	movl	$.LC0, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 113 0
	movl	$1, %edi	#,
	call	exit	#
.L5:
	.loc 1 115 0
	movl	-4(%rbp), %eax	# fd, tmp93
	movl	%eax, USB+72(%rip)	# tmp93, USB.fd
	.loc 1 116 0
	movl	$5, USB+76(%rip)	#, USB.deviceState
	.loc 1 117 0
	movl	-4(%rbp), %eax	# fd, D.5129
	.loc 1 118 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	usbOpen, .-usbOpen
	.section	.rodata
.LC1:
	.string	"Error from tcgetattr: %s\n"
.LC2:
	.string	"Error from tcsetattr: %s\n"
	.section	.text.SetUsbAttributes,"ax",@progbits
	.globl	SetUsbAttributes
	.type	SetUsbAttributes, @function
SetUsbAttributes:
.LFB7:
	.loc 1 122 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	#,
	movl	%edi, -84(%rbp)	# fd, fd
	.loc 1 122 0
	movq	%fs:40, %rax	#, tmp115
	movq	%rax, -8(%rbp)	# tmp115, D.5137
	xorl	%eax, %eax	# tmp115
	.loc 1 125 0
	leaq	-80(%rbp), %rdx	#, tmp109
	movl	-84(%rbp), %eax	# fd, tmp110
	movq	%rdx, %rsi	# tmp109,
	movl	%eax, %edi	# tmp110,
	call	tcgetattr	#
	testl	%eax, %eax	# D.5133
	jns	.L8	#,
	.loc 1 126 0
	call	__errno_location	#
	.loc 1 126 0
	movl	(%rax), %eax	# *_36, D.5133
	movl	%eax, %edi	# D.5133,
	call	strerror	#
	movq	%rax, %rsi	# D.5136,
	movl	$.LC1, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 127 0
	movl	$1, %edi	#,
	call	exit	#
.L8:
	.loc 1 130 0
	movl	linecoding(%rip), %edx	# linecoding.bitrate, D.5134
	leaq	-80(%rbp), %rax	#, tmp111
	movl	%edx, %esi	# D.5134,
	movq	%rax, %rdi	# tmp111,
	call	cfsetospeed	#
	.loc 1 131 0
	movl	linecoding(%rip), %edx	# linecoding.bitrate, D.5134
	leaq	-80(%rbp), %rax	#, tmp112
	movl	%edx, %esi	# D.5134,
	movq	%rax, %rdi	# tmp112,
	call	cfsetispeed	#
	.loc 1 136 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5134
	orl	$2176, %eax	#, D.5134
	movl	%eax, -72(%rbp)	# D.5134, tty.c_cflag
	.loc 1 137 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5134
	andl	$-49, %eax	#, D.5134
	movl	%eax, -72(%rbp)	# D.5134, tty.c_cflag
	.loc 1 138 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5134
	orl	$48, %eax	#, D.5134
	movl	%eax, -72(%rbp)	# D.5134, tty.c_cflag
	.loc 1 139 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5134
	andb	$254, %ah	#, D.5134
	movl	%eax, -72(%rbp)	# D.5134, tty.c_cflag
	.loc 1 140 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5134
	andl	$-65, %eax	#, D.5134
	movl	%eax, -72(%rbp)	# D.5134, tty.c_cflag
	.loc 1 141 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5134
	andl	$2147483647, %eax	#, D.5134
	movl	%eax, -72(%rbp)	# D.5134, tty.c_cflag
	.loc 1 143 0
	leaq	-80(%rbp), %rdx	#, tmp113
	movl	-84(%rbp), %eax	# fd, tmp114
	movl	$0, %esi	#,
	movl	%eax, %edi	# tmp114,
	call	tcsetattr	#
	testl	%eax, %eax	# D.5133
	je	.L12	#,
	.loc 1 144 0
	call	__errno_location	#
	.loc 1 144 0
	movl	(%rax), %eax	# *_30, D.5133
	movl	%eax, %edi	# D.5133,
	call	strerror	#
	movq	%rax, %rsi	# D.5136,
	movl	$.LC2, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 145 0
	movl	$1, %edi	#,
	call	exit	#
.L12:
	.loc 1 147 0
	nop
	.loc 1 149 0
	movq	-8(%rbp), %rax	# D.5137, tmp116
	xorq	%fs:40, %rax	#, tmp116
	je	.L11	#,
	call	__stack_chk_fail	#
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	SetUsbAttributes, .-SetUsbAttributes
	.section	.rodata
.LC3:
	.string	"USB not connected\t%d\n"
	.section	.text.usbWrite,"ax",@progbits
	.globl	usbWrite
	.type	usbWrite, @function
usbWrite:
.LFB8:
	.loc 1 153 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# str, str
	movl	%esi, -28(%rbp)	# len, len
	.loc 1 155 0
	call	usbIsConnected	#
	testb	%al, %al	# D.5143
	jne	.L14	#,
	.loc 1 157 0
	movl	USB+76(%rip), %eax	# USB.deviceState, D.5144
	movl	%eax, %esi	# D.5144,
	movl	$.LC3, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 158 0
	movl	$-1, %eax	#, D.5142
	jmp	.L15	#
.L14:
	.loc 1 161 0
	movl	-28(%rbp), %eax	# len, tmp94
	movslq	%eax, %rdx	# tmp94, D.5145
	movl	USB+72(%rip), %eax	# USB.fd, D.5144
	movq	-24(%rbp), %rcx	# str, tmp95
	movq	%rcx, %rsi	# tmp95,
	movl	%eax, %edi	# D.5144,
	call	write	#
	movl	%eax, -4(%rbp)	# D.5146, wlen
	.loc 1 162 0
	movl	-4(%rbp), %eax	# wlen, D.5142
.L15:
	.loc 1 163 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	usbWrite, .-usbWrite
	.section	.text.usbRead,"ax",@progbits
	.globl	usbRead
	.type	usbRead, @function
usbRead:
.LFB9:
	.loc 1 167 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$192, %rsp	#,
	movq	%rdi, -184(%rbp)	# buf, buf
	movl	%esi, -188(%rbp)	# len, len
	.loc 1 167 0
	movq	%fs:40, %rax	#, tmp145
	movq	%rax, -8(%rbp)	# tmp145, D.5152
	xorl	%eax, %eax	# tmp145
.LBB2:
	.loc 1 169 0
	movl	$0, %eax	#, tmp112
	movl	$16, %ecx	#, tmp113
	leaq	-144(%rbp), %rdx	#, tmp114
	movq	%rdx, %rdi	# tmp114, tmp114
#APP
# 169 "src/main/drivers/serial_uart.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax	# tmp114, __d1
	movl	%ecx, %edx	# tmp113, __d0
	movl	%edx, -164(%rbp)	# __d0, __d0
	movl	%eax, -160(%rbp)	# __d1, __d1
.LBE2:
	.loc 1 170 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5149
	.loc 1 170 0
	leal	63(%rax), %edx	#, tmp116
	testl	%eax, %eax	# tmp115
	cmovs	%edx, %eax	# tmp116,, tmp115
	sarl	$6, %eax	#, tmp117
	movl	%eax, %esi	# tmp117, D.5149
	movslq	%esi, %rax	# D.5149, tmp118
	movq	-144(%rbp,%rax,8), %rdi	# readset.__fds_bits, D.5150
	.loc 1 170 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5149
	.loc 1 170 0
	cltd
	shrl	$26, %edx	#, tmp120
	addl	%edx, %eax	# tmp120, tmp121
	andl	$63, %eax	#, tmp122
	subl	%edx, %eax	# tmp120, tmp123
	.loc 1 170 0
	movl	$1, %edx	#, tmp124
	movl	%eax, %ecx	# D.5149, tmp150
	salq	%cl, %rdx	# tmp150, D.5151
	movq	%rdx, %rax	# D.5151, D.5151
	orq	%rax, %rdi	# D.5150, D.5150
	movq	%rdi, %rdx	# D.5150, D.5150
	movslq	%esi, %rax	# D.5149, tmp125
	movq	%rdx, -144(%rbp,%rax,8)	# D.5150, readset.__fds_bits
	.loc 1 171 0
	movl	$1, -156(%rbp)	#, result
.L21:
	.loc 1 175 0
	cmpl	$-1, -156(%rbp)	#, result
	jne	.L17	#,
.LBB3:
	.loc 1 177 0
	movl	$0, %eax	#, tmp128
	movl	$16, %ecx	#, tmp129
	leaq	-144(%rbp), %rdx	#, tmp130
	movq	%rdx, %rdi	# tmp130, tmp130
#APP
# 177 "src/main/drivers/serial_uart.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax	# tmp130, __d1
	movl	%ecx, %edx	# tmp129, __d0
	movl	%edx, -152(%rbp)	# __d0, __d0
	movl	%eax, -148(%rbp)	# __d1, __d1
.LBE3:
	.loc 1 178 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5149
	.loc 1 178 0
	leal	63(%rax), %edx	#, tmp132
	testl	%eax, %eax	# tmp131
	cmovs	%edx, %eax	# tmp132,, tmp131
	sarl	$6, %eax	#, tmp133
	movl	%eax, %esi	# tmp133, D.5149
	movslq	%esi, %rax	# D.5149, tmp134
	movq	-144(%rbp,%rax,8), %rdi	# readset.__fds_bits, D.5150
	.loc 1 178 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5149
	.loc 1 178 0
	cltd
	shrl	$26, %edx	#, tmp136
	addl	%edx, %eax	# tmp136, tmp137
	andl	$63, %eax	#, tmp138
	subl	%edx, %eax	# tmp136, tmp139
	.loc 1 178 0
	movl	$1, %edx	#, tmp140
	movl	%eax, %ecx	# D.5149, tmp155
	salq	%cl, %rdx	# tmp155, D.5151
	movq	%rdx, %rax	# D.5151, D.5151
	orq	%rax, %rdi	# D.5150, D.5150
	movq	%rdi, %rdx	# D.5150, D.5150
	movslq	%esi, %rax	# D.5149, tmp141
	movq	%rdx, -144(%rbp,%rax,8)	# D.5150, readset.__fds_bits
	jmp	.L21	#
.L17:
	.loc 1 180 0
	cmpl	$0, -156(%rbp)	#, result
	jle	.L21	#,
	.loc 1 182 0
	movl	-188(%rbp), %eax	# len, tmp142
	movslq	%eax, %rdx	# tmp142, D.5151
	movl	USB+72(%rip), %eax	# USB.fd, D.5149
	movq	-184(%rbp), %rcx	# buf, tmp143
	movq	%rcx, %rsi	# tmp143,
	movl	%eax, %edi	# D.5149,
	call	read	#
	movl	%eax, rdlen(%rip)	# D.5149, rdlen
	.loc 1 183 0
	movl	rdlen(%rip), %eax	# rdlen, D.5149
	testl	%eax, %eax	# D.5149
	jle	.L19	#,
	.loc 1 186 0
	movl	-188(%rbp), %eax	# len, D.5148
	jmp	.L22	#
.L19:
	.loc 1 191 0
	movl	$-1, %eax	#, D.5148
.L22:
	.loc 1 195 0 discriminator 1
	movq	-8(%rbp), %rsi	# D.5152, tmp146
	xorq	%fs:40, %rsi	#, tmp146
	je	.L23	#,
	.loc 1 195 0 is_stmt 0
	call	__stack_chk_fail	#
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	usbRead, .-usbRead
	.section	.text.usbIsConnected,"ax",@progbits
	.globl	usbIsConnected
	.type	usbIsConnected, @function
usbIsConnected:
.LFB10:
	.loc 1 198 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 199 0
	movl	USB+76(%rip), %eax	# USB.deviceState, D.5158
	testl	%eax, %eax	# D.5158
	je	.L25	#,
	.loc 1 200 0
	movl	$1, %eax	#, D.5157
	jmp	.L26	#
.L25:
	.loc 1 202 0
	movl	$0, %eax	#, D.5157
.L26:
	.loc 1 203 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	usbIsConnected, .-usbIsConnected
	.section	.text.usbIsConfigured,"ax",@progbits
	.globl	usbIsConfigured
	.type	usbIsConfigured, @function
usbIsConfigured:
.LFB11:
	.loc 1 206 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 207 0
	movl	USB+76(%rip), %eax	# USB.deviceState, D.5159
	cmpl	$5, %eax	#, D.5159
	sete	%al	#, D.5160
	.loc 1 208 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	usbIsConfigured, .-usbIsConfigured
	.section	.text.EP3_OUT_Callback,"ax",@progbits
	.globl	EP3_OUT_Callback
	.type	EP3_OUT_Callback, @function
EP3_OUT_Callback:
.LFB12:
	.loc 1 211 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 212 0
	movl	rdlen(%rip), %eax	# rdlen, D.5162
	movl	%eax, receiveLength(%rip)	# D.5163, receiveLength
	.loc 1 214 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	EP3_OUT_Callback, .-EP3_OUT_Callback
	.section	.text.Virtual_Com_Port_GetBaudRate,"ax",@progbits
	.globl	Virtual_Com_Port_GetBaudRate
	.type	Virtual_Com_Port_GetBaudRate, @function
Virtual_Com_Port_GetBaudRate:
.LFB13:
	.loc 1 217 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 218 0
	movl	linecoding(%rip), %eax	# linecoding.bitrate, D.5164
	.loc 1 219 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	Virtual_Com_Port_GetBaudRate, .-Virtual_Com_Port_GetBaudRate
	.section	.text.usb_txbuffer_empty,"ax",@progbits
	.globl	usb_txbuffer_empty
	.type	usb_txbuffer_empty, @function
usb_txbuffer_empty:
.LFB14:
	.loc 1 222 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 223 0
	movl	$1, %eax	#, D.5165
	.loc 1 224 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	usb_txbuffer_empty, .-usb_txbuffer_empty
	.section	.text.usb_txbuffer_flush,"ax",@progbits
	.globl	usb_txbuffer_flush
	.type	usb_txbuffer_flush, @function
usb_txbuffer_flush:
.LFB15:
	.loc 1 227 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 228 0
	nop
	.loc 1 229 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	usb_txbuffer_flush, .-usb_txbuffer_flush
	.section	.text.serial_waiting,"ax",@progbits
	.globl	serial_waiting
	.type	serial_waiting, @function
serial_waiting:
.LFB16:
	.loc 1 232 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$192, %rsp	#,
	movq	%rdi, -184(%rbp)	# instance, instance
	.loc 1 232 0
	movq	%fs:40, %rax	#, tmp120
	movq	%rax, -8(%rbp)	# tmp120, D.5170
	xorl	%eax, %eax	# tmp120
.LBB4:
	.loc 1 235 0
	movl	$0, %eax	#, tmp102
	movl	$16, %ecx	#, tmp103
	leaq	-144(%rbp), %rdx	#, tmp104
	movq	%rdx, %rdi	# tmp104, tmp104
#APP
# 235 "src/main/drivers/serial_uart.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax	# tmp104, __d1
	movl	%ecx, %edx	# tmp103, __d0
	movl	%edx, -172(%rbp)	# __d0, __d0
	movl	%eax, -168(%rbp)	# __d1, __d1
.LBE4:
	.loc 1 236 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5166
	.loc 1 236 0
	leal	63(%rax), %edx	#, tmp106
	testl	%eax, %eax	# tmp105
	cmovs	%edx, %eax	# tmp106,, tmp105
	sarl	$6, %eax	#, tmp107
	movl	%eax, %esi	# tmp107, D.5166
	movslq	%esi, %rax	# D.5166, tmp108
	movq	-144(%rbp,%rax,8), %rdi	# readset.__fds_bits, D.5167
	.loc 1 236 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5166
	.loc 1 236 0
	cltd
	shrl	$26, %edx	#, tmp110
	addl	%edx, %eax	# tmp110, tmp111
	andl	$63, %eax	#, tmp112
	subl	%edx, %eax	# tmp110, tmp113
	.loc 1 236 0
	movl	$1, %edx	#, tmp114
	movl	%eax, %ecx	# D.5166, tmp125
	salq	%cl, %rdx	# tmp125, D.5168
	movq	%rdx, %rax	# D.5168, D.5168
	orq	%rax, %rdi	# D.5167, D.5167
	movq	%rdi, %rdx	# D.5167, D.5167
	movslq	%esi, %rax	# D.5166, tmp115
	movq	%rdx, -144(%rbp,%rax,8)	# D.5167, readset.__fds_bits
	.loc 1 239 0
	movq	$1, -160(%rbp)	#, tv.tv_sec
	movq	$1000, -152(%rbp)	#, tv.tv_usec
	.loc 1 241 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5166
	leal	1(%rax), %edi	#, D.5166
	leaq	-160(%rbp), %rdx	#, tmp116
	leaq	-144(%rbp), %rax	#, tmp117
	movq	%rdx, %r8	# tmp116,
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp117,
	call	select	#
	movl	%eax, -164(%rbp)	# D.5166, result
	.loc 1 245 0
	movl	-164(%rbp), %eax	# result, tmp118
	.loc 1 246 0
	movq	-8(%rbp), %rsi	# D.5170, tmp121
	xorq	%fs:40, %rsi	#, tmp121
	je	.L38	#,
	call	__stack_chk_fail	#
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	serial_waiting, .-serial_waiting
	.section	.text.usbVcpWrite,"ax",@progbits
	.type	usbVcpWrite, @function
usbVcpWrite:
.LFB17:
	.loc 1 253 0
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
	.loc 1 254 0
	leaq	-12(%rbp), %rax	#, tmp88
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	usbWrite	#
	.loc 1 255 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	usbVcpWrite, .-usbVcpWrite
	.section	.text.usbTxBytesFree,"ax",@progbits
	.globl	usbTxBytesFree
	.type	usbTxBytesFree, @function
usbTxBytesFree:
.LFB18:
	.loc 1 259 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 262 0
	movl	$-1, %eax	#, D.5173
	.loc 1 263 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	usbTxBytesFree, .-usbTxBytesFree
	.section	.text.usbVcpRead,"ax",@progbits
	.type	usbVcpRead, @function
usbVcpRead:
.LFB19:
	.loc 1 266 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# instance, instance
	.loc 1 266 0
	movq	%fs:40, %rax	#, tmp92
	movq	%rax, -8(%rbp)	# tmp92, D.5175
	xorl	%eax, %eax	# tmp92
	.loc 1 271 0
	leaq	-13(%rbp), %rax	#, tmp89
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	usbRead	#
	movl	%eax, -12(%rbp)	# tmp90, len
	.loc 1 273 0
	movzbl	-13(%rbp), %eax	# buf, D.5174
	.loc 1 274 0
	movq	-8(%rbp), %rdx	# D.5175, tmp93
	xorq	%fs:40, %rdx	#, tmp93
	je	.L44	#,
	call	__stack_chk_fail	#
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	usbVcpRead, .-usbVcpRead
	.section	.text.usbVcpSetBaudRate,"ax",@progbits
	.type	usbVcpSetBaudRate, @function
usbVcpSetBaudRate:
.LFB20:
	.loc 1 277 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, -12(%rbp)	# baudRate, baudRate
	.loc 1 280 0
	nop
	.loc 1 282 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	usbVcpSetBaudRate, .-usbVcpSetBaudRate
	.section	.text.usbVcpSetMode,"ax",@progbits
	.type	usbVcpSetMode, @function
usbVcpSetMode:
.LFB21:
	.loc 1 285 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	movl	%esi, -12(%rbp)	# mode, mode
	.loc 1 290 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	usbVcpSetMode, .-usbVcpSetMode
	.section	.text.usbVcpOpen,"ax",@progbits
	.globl	usbVcpOpen
	.type	usbVcpOpen, @function
usbVcpOpen:
.LFB22:
	.loc 1 293 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 294 0
	call	usbInit	#
	movq	%rax, -8(%rbp)	# tmp89, s
	.loc 1 296 0
	movq	-8(%rbp), %rax	# s, D.5176
	.loc 1 297 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	usbVcpOpen, .-usbVcpOpen
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.file 5 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/termios.h"
	.file 7 "./src/main/drivers/serial.h"
	.file 8 "src/main/drivers/serial_uart.h"
	.file 9 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa8d
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF126
	.byte	0xc
	.long	.LASF127
	.long	.LASF128
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
	.long	.LASF3
	.byte	0x2
	.byte	0x26
	.long	0x42
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
	.uleb128 0x3
	.long	.LASF12
	.byte	0x3
	.byte	0x8b
	.long	0x49
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0x8d
	.long	0x49
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF15
	.uleb128 0x6
	.long	.LASF25
	.byte	0x10
	.byte	0x4
	.byte	0x1e
	.long	0xdf
	.uleb128 0x7
	.long	.LASF16
	.byte	0x4
	.byte	0x20
	.long	0x94
	.byte	0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x4
	.byte	0x21
	.long	0x9f
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF18
	.byte	0x5
	.byte	0x36
	.long	0x49
	.uleb128 0x8
	.byte	0x80
	.byte	0x5
	.byte	0x40
	.long	0xff
	.uleb128 0x7
	.long	.LASF19
	.byte	0x5
	.byte	0x48
	.long	0xff
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0xdf
	.long	0x10f
	.uleb128 0xa
	.long	0x8d
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF20
	.byte	0x5
	.byte	0x4b
	.long	0xea
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF21
	.uleb128 0x9
	.long	0xac
	.long	0x131
	.uleb128 0xa
	.long	0x8d
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	.LASF22
	.byte	0x6
	.byte	0x17
	.long	0x5b
	.uleb128 0x3
	.long	.LASF23
	.byte	0x6
	.byte	0x18
	.long	0x7f
	.uleb128 0x3
	.long	.LASF24
	.byte	0x6
	.byte	0x19
	.long	0x7f
	.uleb128 0x6
	.long	.LASF26
	.byte	0x3c
	.byte	0x6
	.byte	0x1c
	.long	0x1bf
	.uleb128 0x7
	.long	.LASF27
	.byte	0x6
	.byte	0x1e
	.long	0x147
	.byte	0
	.uleb128 0x7
	.long	.LASF28
	.byte	0x6
	.byte	0x1f
	.long	0x147
	.byte	0x4
	.uleb128 0x7
	.long	.LASF29
	.byte	0x6
	.byte	0x20
	.long	0x147
	.byte	0x8
	.uleb128 0x7
	.long	.LASF30
	.byte	0x6
	.byte	0x21
	.long	0x147
	.byte	0xc
	.uleb128 0x7
	.long	.LASF31
	.byte	0x6
	.byte	0x22
	.long	0x131
	.byte	0x10
	.uleb128 0x7
	.long	.LASF32
	.byte	0x6
	.byte	0x23
	.long	0x1bf
	.byte	0x11
	.uleb128 0x7
	.long	.LASF33
	.byte	0x6
	.byte	0x24
	.long	0x13c
	.byte	0x34
	.uleb128 0x7
	.long	.LASF34
	.byte	0x6
	.byte	0x25
	.long	0x13c
	.byte	0x38
	.byte	0
	.uleb128 0x9
	.long	0x131
	.long	0x1cf
	.uleb128 0xa
	.long	0x8d
	.byte	0x1f
	.byte	0
	.uleb128 0xb
	.long	.LASF38
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x14
	.long	0x1f2
	.uleb128 0xc
	.long	.LASF35
	.byte	0x1
	.uleb128 0xc
	.long	.LASF36
	.byte	0x2
	.uleb128 0xc
	.long	.LASF37
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF38
	.byte	0x7
	.byte	0x18
	.long	0x1cf
	.uleb128 0xb
	.long	.LASF39
	.byte	0x4
	.long	0x7f
	.byte	0x7
	.byte	0x1a
	.long	0x23e
	.uleb128 0xc
	.long	.LASF40
	.byte	0
	.uleb128 0xc
	.long	.LASF41
	.byte	0x1
	.uleb128 0xc
	.long	.LASF42
	.byte	0
	.uleb128 0xc
	.long	.LASF43
	.byte	0x2
	.uleb128 0xc
	.long	.LASF44
	.byte	0
	.uleb128 0xc
	.long	.LASF45
	.byte	0x4
	.uleb128 0xc
	.long	.LASF46
	.byte	0
	.uleb128 0xc
	.long	.LASF47
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF39
	.byte	0x7
	.byte	0x23
	.long	0x1fd
	.uleb128 0x3
	.long	.LASF48
	.byte	0x7
	.byte	0x25
	.long	0x254
	.uleb128 0xd
	.byte	0x8
	.long	0x25a
	.uleb128 0xe
	.long	0x265
	.uleb128 0xf
	.long	0x62
	.byte	0
	.uleb128 0x6
	.long	.LASF49
	.byte	0x48
	.byte	0x7
	.byte	0x27
	.long	0x31a
	.uleb128 0x7
	.long	.LASF50
	.byte	0x7
	.byte	0x29
	.long	0x39f
	.byte	0
	.uleb128 0x7
	.long	.LASF51
	.byte	0x7
	.byte	0x2b
	.long	0x50
	.byte	0x8
	.uleb128 0x7
	.long	.LASF52
	.byte	0x7
	.byte	0x2c
	.long	0x1f2
	.byte	0xc
	.uleb128 0x7
	.long	.LASF53
	.byte	0x7
	.byte	0x2d
	.long	0x23e
	.byte	0x10
	.uleb128 0x7
	.long	.LASF54
	.byte	0x7
	.byte	0x2f
	.long	0x74
	.byte	0x14
	.uleb128 0x7
	.long	.LASF55
	.byte	0x7
	.byte	0x31
	.long	0x74
	.byte	0x18
	.uleb128 0x7
	.long	.LASF56
	.byte	0x7
	.byte	0x32
	.long	0x74
	.byte	0x1c
	.uleb128 0x7
	.long	.LASF57
	.byte	0x7
	.byte	0x33
	.long	0x3aa
	.byte	0x20
	.uleb128 0x7
	.long	.LASF58
	.byte	0x7
	.byte	0x34
	.long	0x3aa
	.byte	0x28
	.uleb128 0x7
	.long	.LASF59
	.byte	0x7
	.byte	0x35
	.long	0x74
	.byte	0x30
	.uleb128 0x7
	.long	.LASF60
	.byte	0x7
	.byte	0x36
	.long	0x74
	.byte	0x34
	.uleb128 0x7
	.long	.LASF61
	.byte	0x7
	.byte	0x37
	.long	0x74
	.byte	0x38
	.uleb128 0x7
	.long	.LASF62
	.byte	0x7
	.byte	0x38
	.long	0x74
	.byte	0x3c
	.uleb128 0x7
	.long	.LASF63
	.byte	0x7
	.byte	0x3b
	.long	0x249
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.long	.LASF64
	.byte	0x50
	.byte	0x7
	.byte	0x3e
	.long	0x39f
	.uleb128 0x7
	.long	.LASF65
	.byte	0x7
	.byte	0x3f
	.long	0x3d6
	.byte	0
	.uleb128 0x7
	.long	.LASF66
	.byte	0x7
	.byte	0x41
	.long	0x3eb
	.byte	0x8
	.uleb128 0x7
	.long	.LASF67
	.byte	0x7
	.byte	0x42
	.long	0x3eb
	.byte	0x10
	.uleb128 0x7
	.long	.LASF68
	.byte	0x7
	.byte	0x44
	.long	0x3eb
	.byte	0x18
	.uleb128 0x7
	.long	.LASF69
	.byte	0x7
	.byte	0x47
	.long	0x401
	.byte	0x20
	.uleb128 0x7
	.long	.LASF70
	.byte	0x7
	.byte	0x49
	.long	0x41d
	.byte	0x28
	.uleb128 0x7
	.long	.LASF71
	.byte	0x7
	.byte	0x4b
	.long	0x433
	.byte	0x30
	.uleb128 0x7
	.long	.LASF72
	.byte	0x7
	.byte	0x4d
	.long	0x44e
	.byte	0x38
	.uleb128 0x7
	.long	.LASF73
	.byte	0x7
	.byte	0x4f
	.long	0x45f
	.byte	0x40
	.uleb128 0x7
	.long	.LASF74
	.byte	0x7
	.byte	0x50
	.long	0x45f
	.byte	0x48
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x3a5
	.uleb128 0x10
	.long	0x31a
	.uleb128 0xd
	.byte	0x8
	.long	0x3b0
	.uleb128 0x11
	.long	0x50
	.uleb128 0x3
	.long	.LASF75
	.byte	0x7
	.byte	0x3c
	.long	0x265
	.uleb128 0xe
	.long	0x3d0
	.uleb128 0xf
	.long	0x3d0
	.uleb128 0xf
	.long	0x50
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x3b5
	.uleb128 0xd
	.byte	0x8
	.long	0x3c0
	.uleb128 0x12
	.long	0x50
	.long	0x3eb
	.uleb128 0xf
	.long	0x3d0
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x3dc
	.uleb128 0xe
	.long	0x401
	.uleb128 0xf
	.long	0x3d0
	.uleb128 0xf
	.long	0x74
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x3f1
	.uleb128 0x12
	.long	0x416
	.long	0x416
	.uleb128 0xf
	.long	0x3d0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF76
	.uleb128 0xd
	.byte	0x8
	.long	0x407
	.uleb128 0xe
	.long	0x433
	.uleb128 0xf
	.long	0x3d0
	.uleb128 0xf
	.long	0x1f2
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x423
	.uleb128 0xe
	.long	0x44e
	.uleb128 0xf
	.long	0x3d0
	.uleb128 0xf
	.long	0xaa
	.uleb128 0xf
	.long	0x42
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x439
	.uleb128 0xe
	.long	0x45f
	.uleb128 0xf
	.long	0x3d0
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x454
	.uleb128 0xb
	.long	.LASF77
	.byte	0x4
	.long	0x7f
	.byte	0x8
	.byte	0x30
	.long	0x49a
	.uleb128 0xc
	.long	.LASF78
	.byte	0
	.uleb128 0xc
	.long	.LASF79
	.byte	0x1
	.uleb128 0xc
	.long	.LASF80
	.byte	0x2
	.uleb128 0xc
	.long	.LASF81
	.byte	0x3
	.uleb128 0xc
	.long	.LASF82
	.byte	0x4
	.uleb128 0xc
	.long	.LASF83
	.byte	0x5
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x8
	.byte	0x39
	.long	0x4d3
	.uleb128 0x7
	.long	.LASF84
	.byte	0x8
	.byte	0x3a
	.long	0x74
	.byte	0
	.uleb128 0x7
	.long	.LASF85
	.byte	0x8
	.byte	0x3b
	.long	0x50
	.byte	0x4
	.uleb128 0x7
	.long	.LASF86
	.byte	0x8
	.byte	0x3c
	.long	0x50
	.byte	0x5
	.uleb128 0x7
	.long	.LASF87
	.byte	0x8
	.byte	0x3d
	.long	0x50
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF88
	.byte	0x8
	.byte	0x3e
	.long	0x49a
	.uleb128 0x8
	.byte	0x58
	.byte	0x8
	.byte	0x42
	.long	0x516
	.uleb128 0x7
	.long	.LASF89
	.byte	0x8
	.byte	0x43
	.long	0x3b5
	.byte	0
	.uleb128 0x13
	.string	"fd"
	.byte	0x8
	.byte	0x44
	.long	0x42
	.byte	0x48
	.uleb128 0x7
	.long	.LASF90
	.byte	0x8
	.byte	0x45
	.long	0x42
	.byte	0x4c
	.uleb128 0x7
	.long	.LASF91
	.byte	0x8
	.byte	0x46
	.long	0x416
	.byte	0x50
	.byte	0
	.uleb128 0x3
	.long	.LASF92
	.byte	0x8
	.byte	0x47
	.long	0x4de
	.uleb128 0x14
	.long	.LASF104
	.byte	0x1
	.byte	0x57
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF93
	.byte	0x1
	.byte	0x62
	.long	0x3d0
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x569
	.uleb128 0x16
	.string	"fd"
	.byte	0x1
	.byte	0x64
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.long	.LASF94
	.byte	0x1
	.byte	0x6c
	.long	0x42
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x598
	.uleb128 0x16
	.string	"fd"
	.byte	0x1
	.byte	0x6e
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.long	.LASF109
	.byte	0x1
	.byte	0x79
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x5d3
	.uleb128 0x18
	.string	"fd"
	.byte	0x1
	.byte	0x79
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x16
	.string	"tty"
	.byte	0x1
	.byte	0x7b
	.long	0x152
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x15
	.long	.LASF95
	.byte	0x1
	.byte	0x98
	.long	0x74
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x61f
	.uleb128 0x18
	.string	"str"
	.byte	0x1
	.byte	0x98
	.long	0x61f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.string	"len"
	.byte	0x1
	.byte	0x98
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.long	.LASF96
	.byte	0x1
	.byte	0xa0
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.long	0x50
	.uleb128 0x15
	.long	.LASF97
	.byte	0x1
	.byte	0xa6
	.long	0x37
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x6e7
	.uleb128 0x18
	.string	"buf"
	.byte	0x1
	.byte	0xa6
	.long	0x61f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x18
	.string	"len"
	.byte	0x1
	.byte	0xa6
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.uleb128 0x19
	.long	.LASF98
	.byte	0x1
	.byte	0xa8
	.long	0x10f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x19
	.long	.LASF99
	.byte	0x1
	.byte	0xab
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x1a
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x6b6
	.uleb128 0x19
	.long	.LASF100
	.byte	0x1
	.byte	0xa9
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.byte	0xa9
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.byte	0
	.uleb128 0x1b
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x19
	.long	.LASF100
	.byte	0x1
	.byte	0xb1
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.byte	0xb1
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF102
	.byte	0x1
	.byte	0xc5
	.long	0x50
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.long	.LASF103
	.byte	0x1
	.byte	0xcd
	.long	0x50
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF105
	.byte	0x1
	.byte	0xd2
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.long	.LASF106
	.byte	0x1
	.byte	0xd8
	.long	0x74
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.long	.LASF107
	.byte	0x1
	.byte	0xdd
	.long	0x416
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x787
	.uleb128 0x1e
	.long	.LASF108
	.byte	0x1
	.byte	0xdd
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1f
	.long	.LASF110
	.byte	0x1
	.byte	0xe2
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x7b3
	.uleb128 0x1e
	.long	.LASF108
	.byte	0x1
	.byte	0xe2
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF111
	.byte	0x1
	.byte	0xe7
	.long	0x50
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x840
	.uleb128 0x1e
	.long	.LASF108
	.byte	0x1
	.byte	0xe7
	.long	0x3d0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x19
	.long	.LASF98
	.byte	0x1
	.byte	0xea
	.long	0x10f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x19
	.long	.LASF99
	.byte	0x1
	.byte	0xed
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x16
	.string	"tv"
	.byte	0x1
	.byte	0xef
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1b
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x19
	.long	.LASF100
	.byte	0x1
	.byte	0xeb
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -188
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.byte	0xeb
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF113
	.byte	0x1
	.byte	0xfc
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x878
	.uleb128 0x1e
	.long	.LASF108
	.byte	0x1
	.byte	0xfc
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.string	"c"
	.byte	0x1
	.byte	0xfc
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x21
	.long	.LASF112
	.byte	0x1
	.value	0x102
	.long	0x50
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x8aa
	.uleb128 0x22
	.long	.LASF108
	.byte	0x1
	.value	0x102
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.long	.LASF129
	.byte	0x1
	.value	0x109
	.long	0x50
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x8fa
	.uleb128 0x22
	.long	.LASF108
	.byte	0x1
	.value	0x109
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x24
	.string	"buf"
	.byte	0x1
	.value	0x10d
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x24
	.string	"len"
	.byte	0x1
	.value	0x10f
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x25
	.long	.LASF114
	.byte	0x1
	.value	0x114
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x937
	.uleb128 0x22
	.long	.LASF108
	.byte	0x1
	.value	0x114
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF54
	.byte	0x1
	.value	0x114
	.long	0x74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x25
	.long	.LASF115
	.byte	0x1
	.value	0x11c
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x974
	.uleb128 0x22
	.long	.LASF108
	.byte	0x1
	.value	0x11c
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF52
	.byte	0x1
	.value	0x11c
	.long	0x1f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x26
	.long	.LASF116
	.byte	0x1
	.value	0x124
	.long	0x3d0
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x9a4
	.uleb128 0x24
	.string	"s"
	.byte	0x1
	.value	0x126
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.long	0x3a5
	.long	0x9b4
	.uleb128 0xa
	.long	0x8d
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF117
	.byte	0x1
	.byte	0x48
	.long	0x9c9
	.uleb128 0x9
	.byte	0x3
	.quad	usbTable
	.uleb128 0x10
	.long	0x9a4
	.uleb128 0x27
	.long	.LASF118
	.byte	0x9
	.byte	0xc8
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x27
	.long	.LASF119
	.byte	0x9
	.byte	0xc9
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x27
	.long	.LASF120
	.byte	0x9
	.byte	0xca
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x27
	.long	.LASF121
	.byte	0x8
	.byte	0x2e
	.long	0xa22
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0x11
	.long	0x74
	.uleb128 0x28
	.string	"USB"
	.byte	0x1
	.byte	0x35
	.long	0x516
	.uleb128 0x9
	.byte	0x3
	.quad	USB
	.uleb128 0x27
	.long	.LASF122
	.byte	0x1
	.byte	0x37
	.long	0x4d3
	.uleb128 0x9
	.byte	0x3
	.quad	linecoding
	.uleb128 0x27
	.long	.LASF123
	.byte	0x1
	.byte	0x41
	.long	0x121
	.uleb128 0x9
	.byte	0x3
	.quad	portname
	.uleb128 0x27
	.long	.LASF124
	.byte	0x1
	.byte	0x43
	.long	0x42
	.uleb128 0x9
	.byte	0x3
	.quad	rdlen
	.uleb128 0x27
	.long	.LASF125
	.byte	0x1
	.byte	0x46
	.long	0x3b5
	.uleb128 0x9
	.byte	0x3
	.quad	usb_port
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
	.uleb128 0x8
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
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x5
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
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x14c
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
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.quad	.LFB22
	.quad	.LFE22-.LFB22
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
	.quad	.LFB20
	.quad	.LFE20
	.quad	.LFB21
	.quad	.LFE21
	.quad	.LFB22
	.quad	.LFE22
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF111:
	.string	"serial_waiting"
.LASF36:
	.string	"MODE_TX"
.LASF117:
	.string	"usbTable"
.LASF31:
	.string	"c_line"
.LASF74:
	.string	"endWrite"
.LASF48:
	.string	"serialReceiveCallbackPtr"
.LASF56:
	.string	"txBufferSize"
.LASF21:
	.string	"long long unsigned int"
.LASF100:
	.string	"__d0"
.LASF101:
	.string	"__d1"
.LASF33:
	.string	"c_ispeed"
.LASF26:
	.string	"termios"
.LASF81:
	.string	"SUSPENDED"
.LASF84:
	.string	"bitrate"
.LASF108:
	.string	"instance"
.LASF66:
	.string	"serialTotalRxWaiting"
.LASF0:
	.string	"signed char"
.LASF62:
	.string	"txBufferTail"
.LASF105:
	.string	"EP3_OUT_Callback"
.LASF80:
	.string	"POWERED"
.LASF57:
	.string	"rxBuffer"
.LASF121:
	.string	"receiveLength"
.LASF2:
	.string	"long int"
.LASF122:
	.string	"linecoding"
.LASF38:
	.string	"portMode_t"
.LASF94:
	.string	"usbOpen"
.LASF28:
	.string	"c_oflag"
.LASF15:
	.string	"long long int"
.LASF6:
	.string	"uint16_t"
.LASF116:
	.string	"usbVcpOpen"
.LASF46:
	.string	"SERIAL_UNIDIR"
.LASF104:
	.string	"usartInitAllIOSignals"
.LASF92:
	.string	"uartPort_t"
.LASF115:
	.string	"usbVcpSetMode"
.LASF112:
	.string	"usbTxBytesFree"
.LASF42:
	.string	"SERIAL_STOPBITS_1"
.LASF43:
	.string	"SERIAL_STOPBITS_2"
.LASF98:
	.string	"readset"
.LASF53:
	.string	"options"
.LASF59:
	.string	"rxBufferHead"
.LASF89:
	.string	"port"
.LASF97:
	.string	"usbRead"
.LASF20:
	.string	"fd_set"
.LASF72:
	.string	"writeBuf"
.LASF30:
	.string	"c_lflag"
.LASF65:
	.string	"serialWrite"
.LASF79:
	.string	"ATTACHED"
.LASF68:
	.string	"serialRead"
.LASF127:
	.string	"src/main/drivers/serial_uart.c"
.LASF126:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF129:
	.string	"usbVcpRead"
.LASF10:
	.string	"long unsigned int"
.LASF13:
	.string	"__suseconds_t"
.LASF25:
	.string	"timeval"
.LASF124:
	.string	"rdlen"
.LASF7:
	.string	"short unsigned int"
.LASF24:
	.string	"tcflag_t"
.LASF63:
	.string	"callback"
.LASF109:
	.string	"SetUsbAttributes"
.LASF27:
	.string	"c_iflag"
.LASF34:
	.string	"c_ospeed"
.LASF73:
	.string	"beginWrite"
.LASF87:
	.string	"datatype"
.LASF50:
	.string	"vTable"
.LASF47:
	.string	"SERIAL_BIDIR"
.LASF69:
	.string	"serialSetBaudRate"
.LASF11:
	.string	"sizetype"
.LASF64:
	.string	"serialPortVTable"
.LASF70:
	.string	"isSerialTransmitBufferEmpty"
.LASF16:
	.string	"tv_sec"
.LASF88:
	.string	"LINE_CODING"
.LASF77:
	.string	"_DEVICE_STATE"
.LASF35:
	.string	"MODE_RX"
.LASF113:
	.string	"usbVcpWrite"
.LASF114:
	.string	"usbVcpSetBaudRate"
.LASF118:
	.string	"U_ID_0"
.LASF119:
	.string	"U_ID_1"
.LASF128:
	.string	"/home/aravind/git/cleanflight"
.LASF32:
	.string	"c_cc"
.LASF110:
	.string	"usb_txbuffer_flush"
.LASF76:
	.string	"_Bool"
.LASF3:
	.string	"int32_t"
.LASF5:
	.string	"unsigned char"
.LASF86:
	.string	"paritytype"
.LASF55:
	.string	"rxBufferSize"
.LASF96:
	.string	"wlen"
.LASF39:
	.string	"portOptions_t"
.LASF18:
	.string	"__fd_mask"
.LASF1:
	.string	"short int"
.LASF29:
	.string	"c_cflag"
.LASF120:
	.string	"U_ID_2"
.LASF67:
	.string	"serialTotalTxFree"
.LASF54:
	.string	"baudRate"
.LASF85:
	.string	"format"
.LASF45:
	.string	"SERIAL_PARITY_EVEN"
.LASF91:
	.string	"buffering"
.LASF61:
	.string	"txBufferHead"
.LASF17:
	.string	"tv_usec"
.LASF8:
	.string	"uint32_t"
.LASF103:
	.string	"usbIsConfigured"
.LASF14:
	.string	"char"
.LASF52:
	.string	"mode"
.LASF60:
	.string	"rxBufferTail"
.LASF93:
	.string	"usbInit"
.LASF9:
	.string	"unsigned int"
.LASF125:
	.string	"usb_port"
.LASF37:
	.string	"MODE_RXTX"
.LASF41:
	.string	"SERIAL_INVERTED"
.LASF71:
	.string	"setMode"
.LASF51:
	.string	"identifier"
.LASF102:
	.string	"usbIsConnected"
.LASF95:
	.string	"usbWrite"
.LASF12:
	.string	"__time_t"
.LASF58:
	.string	"txBuffer"
.LASF22:
	.string	"cc_t"
.LASF83:
	.string	"CONFIGURED"
.LASF40:
	.string	"SERIAL_NOT_INVERTED"
.LASF4:
	.string	"uint8_t"
.LASF82:
	.string	"ADDRESSED"
.LASF44:
	.string	"SERIAL_PARITY_NO"
.LASF123:
	.string	"portname"
.LASF78:
	.string	"UNCONNECTED"
.LASF107:
	.string	"usb_txbuffer_empty"
.LASF90:
	.string	"deviceState"
.LASF99:
	.string	"result"
.LASF23:
	.string	"speed_t"
.LASF106:
	.string	"Virtual_Com_Port_GetBaudRate"
.LASF49:
	.string	"serialPort_s"
.LASF75:
	.string	"serialPort_t"
.LASF19:
	.string	"__fds_bits"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
