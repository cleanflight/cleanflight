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
	.section	.rodata
.LC0:
	.string	"/dev/ttyMFD2"
	.section	.data.portname,"aw",@progbits
	.align 8
	.type	portname, @object
	.size	portname, 8
portname:
	.quad	.LC0
	.comm	rdlen,4,4
	.comm	uart_0,8,8
	.comm	usb_port,72,32
	.section	.rodata.usbTable,"a",@progbits
	.align 32
	.type	usbTable, @object
	.size	usbTable, 80
usbTable:
# isSerialTransmitBufferEmpty:
	.zero	40
	.quad	usb_txbuffer_empty
	.zero	32
	.section	.rodata
.LC1:
	.string	"Second"
.LC2:
	.string	"UART failed to setup"
	.section	.text.usartInitAllIOSignals,"ax",@progbits
	.globl	usartInitAllIOSignals
	.type	usartInitAllIOSignals, @function
usartInitAllIOSignals:
.LFB4:
	.file 1 "src/main/drivers/serial_uart.c"
	.loc 1 70 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 73 0
	movl	$0, USB+76(%rip)	#, USB.deviceState
	.loc 1 74 0
	movq	usb_port(%rip), %rax	# usb_port, tmp91
	movq	%rax, USB(%rip)	# tmp91, USB.port
	movq	usb_port+8(%rip), %rax	# usb_port, tmp92
	movq	%rax, USB+8(%rip)	# tmp92, USB.port
	movq	usb_port+16(%rip), %rax	# usb_port, tmp93
	movq	%rax, USB+16(%rip)	# tmp93, USB.port
	movq	usb_port+24(%rip), %rax	# usb_port, tmp94
	movq	%rax, USB+24(%rip)	# tmp94, USB.port
	movq	usb_port+32(%rip), %rax	# usb_port, tmp95
	movq	%rax, USB+32(%rip)	# tmp95, USB.port
	movq	usb_port+40(%rip), %rax	# usb_port, tmp96
	movq	%rax, USB+40(%rip)	# tmp96, USB.port
	movq	usb_port+48(%rip), %rax	# usb_port, tmp97
	movq	%rax, USB+48(%rip)	# tmp97, USB.port
	movq	usb_port+56(%rip), %rax	# usb_port, tmp98
	movq	%rax, USB+56(%rip)	# tmp98, USB.port
	movq	usb_port+64(%rip), %rax	# usb_port, tmp99
	movq	%rax, USB+64(%rip)	# tmp99, USB.port
	.loc 1 75 0
	movq	$usbTable, USB(%rip)	#, USB.port.vTable
	.loc 1 78 0
	movl	$0, %edi	#,
	call	mraa_uart_init	#
	movq	%rax, uart_0(%rip)	# D.5091, uart_0
	.loc 1 79 0
	movl	$.LC1, %edi	#,
	call	puts	#
	.loc 1 81 0
	movq	uart_0(%rip), %rax	# uart_0, D.5091
	testq	%rax, %rax	# D.5091
	jne	.L1	#,
	.loc 1 83 0
	movl	$.LC2, %edi	#,
	call	puts	#
	.loc 1 84 0
	nop
.L1:
	.loc 1 88 0
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
	.loc 1 92 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 94 0
	call	usbOpen	#
	movl	%eax, -4(%rbp)	# tmp89, fd
	.loc 1 95 0
	movl	-4(%rbp), %eax	# fd, tmp90
	movl	%eax, %edi	# tmp90,
	call	SetUsbAttributes	#
	.loc 1 96 0
	movl	$USB, %eax	#, D.5094
	.loc 1 97 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	usbInit, .-usbInit
	.section	.rodata
.LC3:
	.string	"Error opening %s: %s\n"
	.section	.text.usbOpen,"ax",@progbits
	.globl	usbOpen
	.type	usbOpen, @function
usbOpen:
.LFB6:
	.loc 1 101 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 102 0
	movq	portname(%rip), %rax	# portname, D.5095
	movl	$1054978, %esi	#,
	movq	%rax, %rdi	# D.5095,
	movl	$0, %eax	#,
	call	open	#
	movl	%eax, -4(%rbp)	# tmp94, fd
	.loc 1 103 0
	cmpl	$0, -4(%rbp)	#, fd
	jns	.L6	#,
	.loc 1 104 0
	call	__errno_location	#
	.loc 1 104 0
	movl	(%rax), %eax	# *_8, D.5096
	movl	%eax, %edi	# D.5096,
	call	strerror	#
	movq	%rax, %rdx	#, D.5095
	movq	portname(%rip), %rax	# portname, D.5095
	movq	%rax, %rsi	# D.5095,
	movl	$.LC3, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 105 0
	movl	$1, %edi	#,
	call	exit	#
.L6:
	.loc 1 107 0
	movl	-4(%rbp), %eax	# fd, tmp95
	movl	%eax, USB+72(%rip)	# tmp95, USB.fd
	.loc 1 108 0
	movl	$5, USB+76(%rip)	#, USB.deviceState
	.loc 1 109 0
	movl	-4(%rbp), %eax	# fd, D.5096
	.loc 1 110 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	usbOpen, .-usbOpen
	.section	.rodata
.LC4:
	.string	"Error from tcgetattr: %s\n"
.LC5:
	.string	"Error from tcsetattr: %s\n"
	.section	.text.SetUsbAttributes,"ax",@progbits
	.globl	SetUsbAttributes
	.type	SetUsbAttributes, @function
SetUsbAttributes:
.LFB7:
	.loc 1 114 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	#,
	movl	%edi, -84(%rbp)	# fd, fd
	.loc 1 114 0
	movq	%fs:40, %rax	#, tmp115
	movq	%rax, -8(%rbp)	# tmp115, D.5103
	xorl	%eax, %eax	# tmp115
	.loc 1 117 0
	leaq	-80(%rbp), %rdx	#, tmp109
	movl	-84(%rbp), %eax	# fd, tmp110
	movq	%rdx, %rsi	# tmp109,
	movl	%eax, %edi	# tmp110,
	call	tcgetattr	#
	testl	%eax, %eax	# D.5099
	jns	.L9	#,
	.loc 1 118 0
	call	__errno_location	#
	.loc 1 118 0
	movl	(%rax), %eax	# *_36, D.5099
	movl	%eax, %edi	# D.5099,
	call	strerror	#
	movq	%rax, %rsi	# D.5102,
	movl	$.LC4, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 119 0
	movl	$1, %edi	#,
	call	exit	#
.L9:
	.loc 1 122 0
	movl	linecoding(%rip), %edx	# linecoding.bitrate, D.5100
	leaq	-80(%rbp), %rax	#, tmp111
	movl	%edx, %esi	# D.5100,
	movq	%rax, %rdi	# tmp111,
	call	cfsetospeed	#
	.loc 1 123 0
	movl	linecoding(%rip), %edx	# linecoding.bitrate, D.5100
	leaq	-80(%rbp), %rax	#, tmp112
	movl	%edx, %esi	# D.5100,
	movq	%rax, %rdi	# tmp112,
	call	cfsetispeed	#
	.loc 1 128 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5100
	orl	$2176, %eax	#, D.5100
	movl	%eax, -72(%rbp)	# D.5100, tty.c_cflag
	.loc 1 129 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5100
	andl	$-49, %eax	#, D.5100
	movl	%eax, -72(%rbp)	# D.5100, tty.c_cflag
	.loc 1 130 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5100
	orl	$48, %eax	#, D.5100
	movl	%eax, -72(%rbp)	# D.5100, tty.c_cflag
	.loc 1 131 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5100
	andb	$254, %ah	#, D.5100
	movl	%eax, -72(%rbp)	# D.5100, tty.c_cflag
	.loc 1 132 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5100
	andl	$-65, %eax	#, D.5100
	movl	%eax, -72(%rbp)	# D.5100, tty.c_cflag
	.loc 1 133 0
	movl	-72(%rbp), %eax	# tty.c_cflag, D.5100
	andl	$2147483647, %eax	#, D.5100
	movl	%eax, -72(%rbp)	# D.5100, tty.c_cflag
	.loc 1 135 0
	leaq	-80(%rbp), %rdx	#, tmp113
	movl	-84(%rbp), %eax	# fd, tmp114
	movl	$0, %esi	#,
	movl	%eax, %edi	# tmp114,
	call	tcsetattr	#
	testl	%eax, %eax	# D.5099
	je	.L13	#,
	.loc 1 136 0
	call	__errno_location	#
	.loc 1 136 0
	movl	(%rax), %eax	# *_30, D.5099
	movl	%eax, %edi	# D.5099,
	call	strerror	#
	movq	%rax, %rsi	# D.5102,
	movl	$.LC5, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 137 0
	movl	$1, %edi	#,
	call	exit	#
.L13:
	.loc 1 139 0
	nop
	.loc 1 141 0
	movq	-8(%rbp), %rax	# D.5103, tmp116
	xorq	%fs:40, %rax	#, tmp116
	je	.L12	#,
	call	__stack_chk_fail	#
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	SetUsbAttributes, .-SetUsbAttributes
	.section	.rodata
.LC6:
	.string	"Error from write: %d, %d\n"
	.section	.text.usbWrite,"ax",@progbits
	.globl	usbWrite
	.type	usbWrite, @function
usbWrite:
.LFB8:
	.loc 1 145 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# str, str
	movl	%esi, -28(%rbp)	# len, len
	.loc 1 147 0
	call	usbIsConnected	#
	testb	%al, %al	# D.5109
	jne	.L15	#,
	.loc 1 148 0
	movl	$-1, %eax	#, D.5108
	jmp	.L16	#
.L15:
	.loc 1 150 0
	movl	-28(%rbp), %eax	# len, tmp95
	movslq	%eax, %rdx	# tmp95, D.5110
	movl	USB+72(%rip), %eax	# USB.fd, D.5111
	movq	-24(%rbp), %rcx	# str, tmp96
	movq	%rcx, %rsi	# tmp96,
	movl	%eax, %edi	# D.5111,
	call	write	#
	movl	%eax, -4(%rbp)	# D.5112, wlen
	.loc 1 151 0
	movl	-4(%rbp), %eax	# wlen, tmp97
	cmpl	-28(%rbp), %eax	# len, tmp97
	je	.L17	#,
	.loc 1 153 0
	call	__errno_location	#
	.loc 1 153 0
	movl	(%rax), %edx	# *_15, D.5111
	movl	-4(%rbp), %eax	# wlen, tmp98
	movl	%eax, %esi	# tmp98,
	movl	$.LC6, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 154 0
	movl	$1, %edi	#,
	call	exit	#
.L17:
	.loc 1 157 0
	movl	-4(%rbp), %eax	# wlen, D.5108
.L16:
	.loc 1 158 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	usbWrite, .-usbWrite
	.section	.rodata
.LC7:
	.string	"Error from read"
	.section	.text.usbRead,"ax",@progbits
	.globl	usbRead
	.type	usbRead, @function
usbRead:
.LFB9:
	.loc 1 162 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$192, %rsp	#,
	movq	%rdi, -184(%rbp)	# buf, buf
	movl	%esi, -188(%rbp)	# len, len
	.loc 1 162 0
	movq	%fs:40, %rax	#, tmp149
	movq	%rax, -8(%rbp)	# tmp149, D.5119
	xorl	%eax, %eax	# tmp149
.LBB2:
	.loc 1 164 0
	movl	$0, %eax	#, tmp114
	movl	$16, %ecx	#, tmp115
	leaq	-144(%rbp), %rdx	#, tmp116
	movq	%rdx, %rdi	# tmp116, tmp116
#APP
# 164 "src/main/drivers/serial_uart.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax	# tmp116, __d1
	movl	%ecx, %edx	# tmp115, __d0
	movl	%edx, -164(%rbp)	# __d0, __d0
	movl	%eax, -160(%rbp)	# __d1, __d1
.LBE2:
	.loc 1 165 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5116
	.loc 1 165 0
	leal	63(%rax), %edx	#, tmp118
	testl	%eax, %eax	# tmp117
	cmovs	%edx, %eax	# tmp118,, tmp117
	sarl	$6, %eax	#, tmp119
	movl	%eax, %esi	# tmp119, D.5116
	movslq	%esi, %rax	# D.5116, tmp120
	movq	-144(%rbp,%rax,8), %rdi	# readset.__fds_bits, D.5117
	.loc 1 165 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5116
	.loc 1 165 0
	cltd
	shrl	$26, %edx	#, tmp122
	addl	%edx, %eax	# tmp122, tmp123
	andl	$63, %eax	#, tmp124
	subl	%edx, %eax	# tmp122, tmp125
	.loc 1 165 0
	movl	$1, %edx	#, tmp126
	movl	%eax, %ecx	# D.5116, tmp154
	salq	%cl, %rdx	# tmp154, D.5118
	movq	%rdx, %rax	# D.5118, D.5118
	orq	%rax, %rdi	# D.5117, D.5117
	movq	%rdi, %rdx	# D.5117, D.5117
	movslq	%esi, %rax	# D.5116, tmp127
	movq	%rdx, -144(%rbp,%rax,8)	# D.5117, readset.__fds_bits
.L23:
	.loc 1 169 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5116
	leal	1(%rax), %edi	#, D.5116
	leaq	-144(%rbp), %rax	#, tmp128
	movl	$0, %r8d	#,
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp128,
	call	select	#
	movl	%eax, -156(%rbp)	# tmp129, result
	.loc 1 170 0
	cmpl	$-1, -156(%rbp)	#, result
	jne	.L19	#,
.LBB3:
	.loc 1 172 0
	movl	$0, %eax	#, tmp132
	movl	$16, %ecx	#, tmp133
	leaq	-144(%rbp), %rdx	#, tmp134
	movq	%rdx, %rdi	# tmp134, tmp134
#APP
# 172 "src/main/drivers/serial_uart.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax	# tmp134, __d1
	movl	%ecx, %edx	# tmp133, __d0
	movl	%edx, -152(%rbp)	# __d0, __d0
	movl	%eax, -148(%rbp)	# __d1, __d1
.LBE3:
	.loc 1 173 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5116
	.loc 1 173 0
	leal	63(%rax), %edx	#, tmp136
	testl	%eax, %eax	# tmp135
	cmovs	%edx, %eax	# tmp136,, tmp135
	sarl	$6, %eax	#, tmp137
	movl	%eax, %esi	# tmp137, D.5116
	movslq	%esi, %rax	# D.5116, tmp138
	movq	-144(%rbp,%rax,8), %rdi	# readset.__fds_bits, D.5117
	.loc 1 173 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5116
	.loc 1 173 0
	cltd
	shrl	$26, %edx	#, tmp140
	addl	%edx, %eax	# tmp140, tmp141
	andl	$63, %eax	#, tmp142
	subl	%edx, %eax	# tmp140, tmp143
	.loc 1 173 0
	movl	$1, %edx	#, tmp144
	movl	%eax, %ecx	# D.5116, tmp159
	salq	%cl, %rdx	# tmp159, D.5118
	movq	%rdx, %rax	# D.5118, D.5118
	orq	%rax, %rdi	# D.5117, D.5117
	movq	%rdi, %rdx	# D.5117, D.5117
	movslq	%esi, %rax	# D.5116, tmp145
	movq	%rdx, -144(%rbp,%rax,8)	# D.5117, readset.__fds_bits
	jmp	.L23	#
.L19:
	.loc 1 175 0
	cmpl	$0, -156(%rbp)	#, result
	jle	.L23	#,
	.loc 1 177 0
	movl	-188(%rbp), %eax	# len, tmp146
	movslq	%eax, %rdx	# tmp146, D.5118
	movl	USB+72(%rip), %eax	# USB.fd, D.5116
	movq	-184(%rbp), %rcx	# buf, tmp147
	movq	%rcx, %rsi	# tmp147,
	movl	%eax, %edi	# D.5116,
	call	read	#
	movl	%eax, rdlen(%rip)	# D.5116, rdlen
	.loc 1 178 0
	movl	rdlen(%rip), %eax	# rdlen, D.5116
	testl	%eax, %eax	# D.5116
	jle	.L21	#,
	.loc 1 180 0
	movl	-188(%rbp), %eax	# len, D.5115
	jmp	.L24	#
.L21:
	.loc 1 184 0
	movl	$.LC7, %edi	#,
	call	puts	#
	.loc 1 185 0
	movl	$-1, %eax	#, D.5115
.L24:
	.loc 1 189 0 discriminator 1
	movq	-8(%rbp), %rsi	# D.5119, tmp150
	xorq	%fs:40, %rsi	#, tmp150
	je	.L25	#,
	.loc 1 189 0 is_stmt 0
	call	__stack_chk_fail	#
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	usbRead, .-usbRead
	.section	.text.read_child,"ax",@progbits
	.globl	read_child
	.type	read_child, @function
read_child:
.LFB10:
	.loc 1 192 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# i, i
	.loc 1 194 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	read_child, .-read_child
	.section	.text.usbIsConnected,"ax",@progbits
	.globl	usbIsConnected
	.type	usbIsConnected, @function
usbIsConnected:
.LFB11:
	.loc 1 197 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 198 0
	movl	USB+76(%rip), %eax	# USB.deviceState, D.5125
	testl	%eax, %eax	# D.5125
	setne	%al	#, D.5126
	.loc 1 199 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	usbIsConnected, .-usbIsConnected
	.section	.text.usbIsConfigured,"ax",@progbits
	.globl	usbIsConfigured
	.type	usbIsConfigured, @function
usbIsConfigured:
.LFB12:
	.loc 1 202 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 203 0
	movl	USB+76(%rip), %eax	# USB.deviceState, D.5128
	cmpl	$5, %eax	#, D.5128
	sete	%al	#, D.5129
	.loc 1 204 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	usbIsConfigured, .-usbIsConfigured
	.section	.text.EP3_OUT_Callback,"ax",@progbits
	.globl	EP3_OUT_Callback
	.type	EP3_OUT_Callback, @function
EP3_OUT_Callback:
.LFB13:
	.loc 1 207 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 208 0
	movl	rdlen(%rip), %eax	# rdlen, D.5131
	movl	%eax, receiveLength(%rip)	# D.5132, receiveLength
	.loc 1 210 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	EP3_OUT_Callback, .-EP3_OUT_Callback
	.section	.text.Virtual_Com_Port_GetBaudRate,"ax",@progbits
	.globl	Virtual_Com_Port_GetBaudRate
	.type	Virtual_Com_Port_GetBaudRate, @function
Virtual_Com_Port_GetBaudRate:
.LFB14:
	.loc 1 213 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 214 0
	movl	linecoding(%rip), %eax	# linecoding.bitrate, D.5133
	.loc 1 215 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	Virtual_Com_Port_GetBaudRate, .-Virtual_Com_Port_GetBaudRate
	.section	.text.usb_txbuffer_empty,"ax",@progbits
	.globl	usb_txbuffer_empty
	.type	usb_txbuffer_empty, @function
usb_txbuffer_empty:
.LFB15:
	.loc 1 218 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 219 0
	movl	$1, %eax	#, D.5134
	.loc 1 220 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	usb_txbuffer_empty, .-usb_txbuffer_empty
	.section	.text.usb_txbuffer_flush,"ax",@progbits
	.globl	usb_txbuffer_flush
	.type	usb_txbuffer_flush, @function
usb_txbuffer_flush:
.LFB16:
	.loc 1 223 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 224 0
	nop
	.loc 1 225 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	usb_txbuffer_flush, .-usb_txbuffer_flush
	.section	.text.serial_waiting,"ax",@progbits
	.globl	serial_waiting
	.type	serial_waiting, @function
serial_waiting:
.LFB17:
	.loc 1 228 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$160, %rsp	#,
	.loc 1 228 0
	movq	%fs:40, %rax	#, tmp118
	movq	%rax, -8(%rbp)	# tmp118, D.5139
	xorl	%eax, %eax	# tmp118
.LBB4:
	.loc 1 230 0
	movl	$0, %eax	#, tmp102
	movl	$16, %ecx	#, tmp103
	leaq	-144(%rbp), %rdx	#, tmp104
	movq	%rdx, %rdi	# tmp104, tmp104
#APP
# 230 "src/main/drivers/serial_uart.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax	# tmp104, __d1
	movl	%ecx, %edx	# tmp103, __d0
	movl	%edx, -156(%rbp)	# __d0, __d0
	movl	%eax, -152(%rbp)	# __d1, __d1
.LBE4:
	.loc 1 231 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5135
	.loc 1 231 0
	leal	63(%rax), %edx	#, tmp106
	testl	%eax, %eax	# tmp105
	cmovs	%edx, %eax	# tmp106,, tmp105
	sarl	$6, %eax	#, tmp107
	movl	%eax, %esi	# tmp107, D.5135
	movslq	%esi, %rax	# D.5135, tmp108
	movq	-144(%rbp,%rax,8), %rdi	# readset.__fds_bits, D.5136
	.loc 1 231 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5135
	.loc 1 231 0
	cltd
	shrl	$26, %edx	#, tmp110
	addl	%edx, %eax	# tmp110, tmp111
	andl	$63, %eax	#, tmp112
	subl	%edx, %eax	# tmp110, tmp113
	.loc 1 231 0
	movl	$1, %edx	#, tmp114
	movl	%eax, %ecx	# D.5135, tmp123
	salq	%cl, %rdx	# tmp123, D.5137
	movq	%rdx, %rax	# D.5137, D.5137
	orq	%rax, %rdi	# D.5136, D.5136
	movq	%rdi, %rdx	# D.5136, D.5136
	movslq	%esi, %rax	# D.5135, tmp115
	movq	%rdx, -144(%rbp,%rax,8)	# D.5136, readset.__fds_bits
	.loc 1 233 0
	movl	USB+72(%rip), %eax	# USB.fd, D.5135
	leal	1(%rax), %edi	#, D.5135
	leaq	-144(%rbp), %rax	#, tmp116
	movl	$0, %r8d	#,
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp116,
	call	select	#
	movl	%eax, -148(%rbp)	# D.5135, result
	.loc 1 234 0
	movl	-148(%rbp), %eax	# result, D.5138
	.loc 1 235 0
	movq	-8(%rbp), %rsi	# D.5139, tmp119
	xorq	%fs:40, %rsi	#, tmp119
	je	.L40	#,
	call	__stack_chk_fail	#
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	serial_waiting, .-serial_waiting
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 4 "/usr/include/mraa/uart.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/termios.h"
	.file 6 "./src/main/drivers/serial.h"
	.file 7 "src/main/drivers/serial_uart.h"
	.file 8 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x915
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF118
	.byte	0xc
	.long	.LASF119
	.long	.LASF120
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
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x36
	.long	0x3e
	.uleb128 0x7
	.byte	0x80
	.byte	0x3
	.byte	0x40
	.long	0xbf
	.uleb128 0x8
	.long	.LASF20
	.byte	0x3
	.byte	0x48
	.long	0xbf
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x9f
	.long	0xcf
	.uleb128 0xa
	.long	0x82
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x4b
	.long	0xaa
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x4
	.long	.LASF16
	.byte	0x4
	.byte	0x30
	.long	0xec
	.uleb128 0x6
	.byte	0x8
	.long	0xf2
	.uleb128 0xb
	.long	.LASF121
	.uleb128 0x4
	.long	.LASF17
	.byte	0x5
	.byte	0x17
	.long	0x50
	.uleb128 0x4
	.long	.LASF18
	.byte	0x5
	.byte	0x18
	.long	0x74
	.uleb128 0x4
	.long	.LASF19
	.byte	0x5
	.byte	0x19
	.long	0x74
	.uleb128 0xc
	.long	.LASF43
	.byte	0x3c
	.byte	0x5
	.byte	0x1c
	.long	0x185
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.byte	0x1e
	.long	0x10d
	.byte	0
	.uleb128 0x8
	.long	.LASF22
	.byte	0x5
	.byte	0x1f
	.long	0x10d
	.byte	0x4
	.uleb128 0x8
	.long	.LASF23
	.byte	0x5
	.byte	0x20
	.long	0x10d
	.byte	0x8
	.uleb128 0x8
	.long	.LASF24
	.byte	0x5
	.byte	0x21
	.long	0x10d
	.byte	0xc
	.uleb128 0x8
	.long	.LASF25
	.byte	0x5
	.byte	0x22
	.long	0xf7
	.byte	0x10
	.uleb128 0x8
	.long	.LASF26
	.byte	0x5
	.byte	0x23
	.long	0x185
	.byte	0x11
	.uleb128 0x8
	.long	.LASF27
	.byte	0x5
	.byte	0x24
	.long	0x102
	.byte	0x34
	.uleb128 0x8
	.long	.LASF28
	.byte	0x5
	.byte	0x25
	.long	0x102
	.byte	0x38
	.byte	0
	.uleb128 0x9
	.long	0xf7
	.long	0x195
	.uleb128 0xa
	.long	0x82
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.long	.LASF32
	.byte	0x4
	.long	0x74
	.byte	0x6
	.byte	0x14
	.long	0x1b8
	.uleb128 0xe
	.long	.LASF29
	.byte	0x1
	.uleb128 0xe
	.long	.LASF30
	.byte	0x2
	.uleb128 0xe
	.long	.LASF31
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF32
	.byte	0x6
	.byte	0x18
	.long	0x195
	.uleb128 0xd
	.long	.LASF33
	.byte	0x4
	.long	0x74
	.byte	0x6
	.byte	0x1a
	.long	0x204
	.uleb128 0xe
	.long	.LASF34
	.byte	0
	.uleb128 0xe
	.long	.LASF35
	.byte	0x1
	.uleb128 0xe
	.long	.LASF36
	.byte	0
	.uleb128 0xe
	.long	.LASF37
	.byte	0x2
	.uleb128 0xe
	.long	.LASF38
	.byte	0
	.uleb128 0xe
	.long	.LASF39
	.byte	0x4
	.uleb128 0xe
	.long	.LASF40
	.byte	0
	.uleb128 0xe
	.long	.LASF41
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF33
	.byte	0x6
	.byte	0x23
	.long	0x1c3
	.uleb128 0x4
	.long	.LASF42
	.byte	0x6
	.byte	0x25
	.long	0x21a
	.uleb128 0x6
	.byte	0x8
	.long	0x220
	.uleb128 0xf
	.long	0x22b
	.uleb128 0x10
	.long	0x57
	.byte	0
	.uleb128 0xc
	.long	.LASF44
	.byte	0x48
	.byte	0x6
	.byte	0x27
	.long	0x2e0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x6
	.byte	0x29
	.long	0x365
	.byte	0
	.uleb128 0x8
	.long	.LASF46
	.byte	0x6
	.byte	0x2b
	.long	0x45
	.byte	0x8
	.uleb128 0x8
	.long	.LASF47
	.byte	0x6
	.byte	0x2c
	.long	0x1b8
	.byte	0xc
	.uleb128 0x8
	.long	.LASF48
	.byte	0x6
	.byte	0x2d
	.long	0x204
	.byte	0x10
	.uleb128 0x8
	.long	.LASF49
	.byte	0x6
	.byte	0x2f
	.long	0x69
	.byte	0x14
	.uleb128 0x8
	.long	.LASF50
	.byte	0x6
	.byte	0x31
	.long	0x69
	.byte	0x18
	.uleb128 0x8
	.long	.LASF51
	.byte	0x6
	.byte	0x32
	.long	0x69
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF52
	.byte	0x6
	.byte	0x33
	.long	0x370
	.byte	0x20
	.uleb128 0x8
	.long	.LASF53
	.byte	0x6
	.byte	0x34
	.long	0x370
	.byte	0x28
	.uleb128 0x8
	.long	.LASF54
	.byte	0x6
	.byte	0x35
	.long	0x69
	.byte	0x30
	.uleb128 0x8
	.long	.LASF55
	.byte	0x6
	.byte	0x36
	.long	0x69
	.byte	0x34
	.uleb128 0x8
	.long	.LASF56
	.byte	0x6
	.byte	0x37
	.long	0x69
	.byte	0x38
	.uleb128 0x8
	.long	.LASF57
	.byte	0x6
	.byte	0x38
	.long	0x69
	.byte	0x3c
	.uleb128 0x8
	.long	.LASF58
	.byte	0x6
	.byte	0x3b
	.long	0x20f
	.byte	0x40
	.byte	0
	.uleb128 0xc
	.long	.LASF59
	.byte	0x50
	.byte	0x6
	.byte	0x3e
	.long	0x365
	.uleb128 0x8
	.long	.LASF60
	.byte	0x6
	.byte	0x3f
	.long	0x39c
	.byte	0
	.uleb128 0x8
	.long	.LASF61
	.byte	0x6
	.byte	0x41
	.long	0x3b1
	.byte	0x8
	.uleb128 0x8
	.long	.LASF62
	.byte	0x6
	.byte	0x42
	.long	0x3b1
	.byte	0x10
	.uleb128 0x8
	.long	.LASF63
	.byte	0x6
	.byte	0x44
	.long	0x3b1
	.byte	0x18
	.uleb128 0x8
	.long	.LASF64
	.byte	0x6
	.byte	0x47
	.long	0x3c7
	.byte	0x20
	.uleb128 0x8
	.long	.LASF65
	.byte	0x6
	.byte	0x49
	.long	0x3e3
	.byte	0x28
	.uleb128 0x8
	.long	.LASF66
	.byte	0x6
	.byte	0x4b
	.long	0x3f9
	.byte	0x30
	.uleb128 0x8
	.long	.LASF67
	.byte	0x6
	.byte	0x4d
	.long	0x414
	.byte	0x38
	.uleb128 0x8
	.long	.LASF68
	.byte	0x6
	.byte	0x4f
	.long	0x425
	.byte	0x40
	.uleb128 0x8
	.long	.LASF69
	.byte	0x6
	.byte	0x50
	.long	0x425
	.byte	0x48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x36b
	.uleb128 0x11
	.long	0x2e0
	.uleb128 0x6
	.byte	0x8
	.long	0x376
	.uleb128 0x12
	.long	0x45
	.uleb128 0x4
	.long	.LASF70
	.byte	0x6
	.byte	0x3c
	.long	0x22b
	.uleb128 0xf
	.long	0x396
	.uleb128 0x10
	.long	0x396
	.uleb128 0x10
	.long	0x45
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x37b
	.uleb128 0x6
	.byte	0x8
	.long	0x386
	.uleb128 0x13
	.long	0x45
	.long	0x3b1
	.uleb128 0x10
	.long	0x396
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3a2
	.uleb128 0xf
	.long	0x3c7
	.uleb128 0x10
	.long	0x396
	.uleb128 0x10
	.long	0x69
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3b7
	.uleb128 0x13
	.long	0x3dc
	.long	0x3dc
	.uleb128 0x10
	.long	0x396
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF71
	.uleb128 0x6
	.byte	0x8
	.long	0x3cd
	.uleb128 0xf
	.long	0x3f9
	.uleb128 0x10
	.long	0x396
	.uleb128 0x10
	.long	0x1b8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3e9
	.uleb128 0xf
	.long	0x414
	.uleb128 0x10
	.long	0x396
	.uleb128 0x10
	.long	0x89
	.uleb128 0x10
	.long	0x37
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3ff
	.uleb128 0xf
	.long	0x425
	.uleb128 0x10
	.long	0x396
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x41a
	.uleb128 0xd
	.long	.LASF72
	.byte	0x4
	.long	0x74
	.byte	0x7
	.byte	0x2b
	.long	0x460
	.uleb128 0xe
	.long	.LASF73
	.byte	0
	.uleb128 0xe
	.long	.LASF74
	.byte	0x1
	.uleb128 0xe
	.long	.LASF75
	.byte	0x2
	.uleb128 0xe
	.long	.LASF76
	.byte	0x3
	.uleb128 0xe
	.long	.LASF77
	.byte	0x4
	.uleb128 0xe
	.long	.LASF78
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.byte	0x34
	.long	0x499
	.uleb128 0x8
	.long	.LASF79
	.byte	0x7
	.byte	0x35
	.long	0x69
	.byte	0
	.uleb128 0x8
	.long	.LASF80
	.byte	0x7
	.byte	0x36
	.long	0x45
	.byte	0x4
	.uleb128 0x8
	.long	.LASF81
	.byte	0x7
	.byte	0x37
	.long	0x45
	.byte	0x5
	.uleb128 0x8
	.long	.LASF82
	.byte	0x7
	.byte	0x38
	.long	0x45
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF83
	.byte	0x7
	.byte	0x39
	.long	0x460
	.uleb128 0x7
	.byte	0x58
	.byte	0x7
	.byte	0x3d
	.long	0x4dc
	.uleb128 0x8
	.long	.LASF84
	.byte	0x7
	.byte	0x3e
	.long	0x37b
	.byte	0
	.uleb128 0x14
	.string	"fd"
	.byte	0x7
	.byte	0x3f
	.long	0x37
	.byte	0x48
	.uleb128 0x8
	.long	.LASF85
	.byte	0x7
	.byte	0x40
	.long	0x37
	.byte	0x4c
	.uleb128 0x8
	.long	.LASF86
	.byte	0x7
	.byte	0x41
	.long	0x3dc
	.byte	0x50
	.byte	0
	.uleb128 0x4
	.long	.LASF87
	.byte	0x7
	.byte	0x42
	.long	0x4a4
	.uleb128 0x15
	.long	.LASF100
	.byte	0x1
	.byte	0x45
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.long	.LASF88
	.byte	0x1
	.byte	0x5b
	.long	0x396
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x52f
	.uleb128 0x17
	.string	"fd"
	.byte	0x1
	.byte	0x5e
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.long	.LASF89
	.byte	0x1
	.byte	0x64
	.long	0x37
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x55e
	.uleb128 0x17
	.string	"fd"
	.byte	0x1
	.byte	0x66
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.long	.LASF105
	.byte	0x1
	.byte	0x71
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x599
	.uleb128 0x19
	.string	"fd"
	.byte	0x1
	.byte	0x71
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x17
	.string	"tty"
	.byte	0x1
	.byte	0x73
	.long	0x118
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x16
	.long	.LASF90
	.byte	0x1
	.byte	0x90
	.long	0x69
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e5
	.uleb128 0x19
	.string	"str"
	.byte	0x1
	.byte	0x90
	.long	0x5e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.string	"len"
	.byte	0x1
	.byte	0x90
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.long	.LASF91
	.byte	0x1
	.byte	0x95
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x45
	.uleb128 0x16
	.long	.LASF92
	.byte	0x1
	.byte	0xa1
	.long	0x69
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x6ad
	.uleb128 0x19
	.string	"buf"
	.byte	0x1
	.byte	0xa1
	.long	0x5e5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x19
	.string	"len"
	.byte	0x1
	.byte	0xa1
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.uleb128 0x1a
	.long	.LASF93
	.byte	0x1
	.byte	0xa3
	.long	0xcf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1a
	.long	.LASF94
	.byte	0x1
	.byte	0xa6
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x1b
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x67c
	.uleb128 0x1a
	.long	.LASF95
	.byte	0x1
	.byte	0xa4
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x1a
	.long	.LASF96
	.byte	0x1
	.byte	0xa4
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.byte	0
	.uleb128 0x1c
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x1a
	.long	.LASF95
	.byte	0x1
	.byte	0xac
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1a
	.long	.LASF96
	.byte	0x1
	.byte	0xac
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF97
	.byte	0x1
	.byte	0xbf
	.long	0x89
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x6db
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0xbf
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.long	.LASF98
	.byte	0x1
	.byte	0xc4
	.long	0x45
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.long	.LASF99
	.byte	0x1
	.byte	0xc9
	.long	0x45
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.byte	0xce
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.long	.LASF102
	.byte	0x1
	.byte	0xd4
	.long	0x69
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.long	.LASF103
	.byte	0x1
	.byte	0xd9
	.long	0x3dc
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x77b
	.uleb128 0x20
	.long	.LASF104
	.byte	0x1
	.byte	0xd9
	.long	0x396
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x21
	.long	.LASF106
	.byte	0x1
	.byte	0xde
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x7a7
	.uleb128 0x20
	.long	.LASF104
	.byte	0x1
	.byte	0xde
	.long	0x396
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF107
	.byte	0x1
	.byte	0xe3
	.long	0x69
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x817
	.uleb128 0x1a
	.long	.LASF93
	.byte	0x1
	.byte	0xe5
	.long	0xcf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1a
	.long	.LASF94
	.byte	0x1
	.byte	0xe8
	.long	0x69
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x1c
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1a
	.long	.LASF95
	.byte	0x1
	.byte	0xe6
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x1a
	.long	.LASF96
	.byte	0x1
	.byte	0xe6
	.long	0x37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x36b
	.long	0x827
	.uleb128 0xa
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF108
	.byte	0x1
	.byte	0x3f
	.long	0x83c
	.uleb128 0x9
	.byte	0x3
	.quad	usbTable
	.uleb128 0x11
	.long	0x817
	.uleb128 0x22
	.long	.LASF109
	.byte	0x8
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x22
	.long	.LASF110
	.byte	0x8
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x22
	.long	.LASF111
	.byte	0x8
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x22
	.long	.LASF112
	.byte	0x7
	.byte	0x29
	.long	0x895
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0x12
	.long	0x69
	.uleb128 0x23
	.string	"USB"
	.byte	0x1
	.byte	0x2e
	.long	0x4dc
	.uleb128 0x9
	.byte	0x3
	.quad	USB
	.uleb128 0x22
	.long	.LASF113
	.byte	0x1
	.byte	0x30
	.long	0x499
	.uleb128 0x9
	.byte	0x3
	.quad	linecoding
	.uleb128 0x22
	.long	.LASF114
	.byte	0x1
	.byte	0x37
	.long	0x8b
	.uleb128 0x9
	.byte	0x3
	.quad	portname
	.uleb128 0x22
	.long	.LASF115
	.byte	0x1
	.byte	0x38
	.long	0x37
	.uleb128 0x9
	.byte	0x3
	.quad	rdlen
	.uleb128 0x22
	.long	.LASF116
	.byte	0x1
	.byte	0x3c
	.long	0xe1
	.uleb128 0x9
	.byte	0x3
	.quad	uart_0
	.uleb128 0x22
	.long	.LASF117
	.byte	0x1
	.byte	0x3d
	.long	0x37b
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
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x2116
	.uleb128 0x19
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.long	0xfc
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF107:
	.string	"serial_waiting"
.LASF30:
	.string	"MODE_TX"
.LASF108:
	.string	"usbTable"
.LASF25:
	.string	"c_line"
.LASF69:
	.string	"endWrite"
.LASF42:
	.string	"serialReceiveCallbackPtr"
.LASF19:
	.string	"tcflag_t"
.LASF51:
	.string	"txBufferSize"
.LASF15:
	.string	"long long unsigned int"
.LASF95:
	.string	"__d0"
.LASF96:
	.string	"__d1"
.LASF27:
	.string	"c_ispeed"
.LASF43:
	.string	"termios"
.LASF76:
	.string	"SUSPENDED"
.LASF79:
	.string	"bitrate"
.LASF104:
	.string	"instance"
.LASF61:
	.string	"serialTotalRxWaiting"
.LASF0:
	.string	"signed char"
.LASF57:
	.string	"txBufferTail"
.LASF101:
	.string	"EP3_OUT_Callback"
.LASF75:
	.string	"POWERED"
.LASF52:
	.string	"rxBuffer"
.LASF112:
	.string	"receiveLength"
.LASF2:
	.string	"long int"
.LASF113:
	.string	"linecoding"
.LASF32:
	.string	"portMode_t"
.LASF89:
	.string	"usbOpen"
.LASF22:
	.string	"c_oflag"
.LASF12:
	.string	"long long int"
.LASF5:
	.string	"uint16_t"
.LASF100:
	.string	"usartInitAllIOSignals"
.LASF87:
	.string	"uartPort_t"
.LASF36:
	.string	"SERIAL_STOPBITS_1"
.LASF37:
	.string	"SERIAL_STOPBITS_2"
.LASF93:
	.string	"readset"
.LASF48:
	.string	"options"
.LASF54:
	.string	"rxBufferHead"
.LASF84:
	.string	"port"
.LASF92:
	.string	"usbRead"
.LASF14:
	.string	"fd_set"
.LASF67:
	.string	"writeBuf"
.LASF24:
	.string	"c_lflag"
.LASF60:
	.string	"serialWrite"
.LASF74:
	.string	"ATTACHED"
.LASF63:
	.string	"serialRead"
.LASF119:
	.string	"src/main/drivers/serial_uart.c"
.LASF118:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF9:
	.string	"long unsigned int"
.LASF18:
	.string	"speed_t"
.LASF115:
	.string	"rdlen"
.LASF6:
	.string	"short unsigned int"
.LASF97:
	.string	"read_child"
.LASF17:
	.string	"cc_t"
.LASF58:
	.string	"callback"
.LASF105:
	.string	"SetUsbAttributes"
.LASF21:
	.string	"c_iflag"
.LASF28:
	.string	"c_ospeed"
.LASF68:
	.string	"beginWrite"
.LASF82:
	.string	"datatype"
.LASF45:
	.string	"vTable"
.LASF41:
	.string	"SERIAL_BIDIR"
.LASF64:
	.string	"serialSetBaudRate"
.LASF10:
	.string	"sizetype"
.LASF59:
	.string	"serialPortVTable"
.LASF65:
	.string	"isSerialTransmitBufferEmpty"
.LASF83:
	.string	"LINE_CODING"
.LASF72:
	.string	"_DEVICE_STATE"
.LASF29:
	.string	"MODE_RX"
.LASF116:
	.string	"uart_0"
.LASF109:
	.string	"U_ID_0"
.LASF110:
	.string	"U_ID_1"
.LASF120:
	.string	"/home/aravind/git/cleanflight"
.LASF26:
	.string	"c_cc"
.LASF106:
	.string	"usb_txbuffer_flush"
.LASF71:
	.string	"_Bool"
.LASF40:
	.string	"SERIAL_UNIDIR"
.LASF3:
	.string	"unsigned char"
.LASF81:
	.string	"paritytype"
.LASF50:
	.string	"rxBufferSize"
.LASF91:
	.string	"wlen"
.LASF33:
	.string	"portOptions_t"
.LASF13:
	.string	"__fd_mask"
.LASF1:
	.string	"short int"
.LASF23:
	.string	"c_cflag"
.LASF111:
	.string	"U_ID_2"
.LASF62:
	.string	"serialTotalTxFree"
.LASF49:
	.string	"baudRate"
.LASF80:
	.string	"format"
.LASF39:
	.string	"SERIAL_PARITY_EVEN"
.LASF86:
	.string	"buffering"
.LASF56:
	.string	"txBufferHead"
.LASF7:
	.string	"uint32_t"
.LASF99:
	.string	"usbIsConfigured"
.LASF11:
	.string	"char"
.LASF47:
	.string	"mode"
.LASF55:
	.string	"rxBufferTail"
.LASF88:
	.string	"usbInit"
.LASF8:
	.string	"unsigned int"
.LASF117:
	.string	"usb_port"
.LASF31:
	.string	"MODE_RXTX"
.LASF16:
	.string	"mraa_uart_context"
.LASF35:
	.string	"SERIAL_INVERTED"
.LASF66:
	.string	"setMode"
.LASF46:
	.string	"identifier"
.LASF98:
	.string	"usbIsConnected"
.LASF90:
	.string	"usbWrite"
.LASF53:
	.string	"txBuffer"
.LASF78:
	.string	"CONFIGURED"
.LASF34:
	.string	"SERIAL_NOT_INVERTED"
.LASF4:
	.string	"uint8_t"
.LASF77:
	.string	"ADDRESSED"
.LASF38:
	.string	"SERIAL_PARITY_NO"
.LASF114:
	.string	"portname"
.LASF73:
	.string	"UNCONNECTED"
.LASF103:
	.string	"usb_txbuffer_empty"
.LASF121:
	.string	"_uart"
.LASF85:
	.string	"deviceState"
.LASF94:
	.string	"result"
.LASF102:
	.string	"Virtual_Com_Port_GetBaudRate"
.LASF44:
	.string	"serialPort_s"
.LASF70:
	.string	"serialPort_t"
.LASF20:
	.string	"__fds_bits"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
