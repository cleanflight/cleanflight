	.file	"serial_usb_vcp.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed serial_usb_vcp.i -mtune=generic
# -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections
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
	movl	$1, %eax	#, D.4965
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
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 69 0
	movl	receiveLength(%rip), %eax	# receiveLength, D.4966
	.loc 1 70 0
	popq	%rbp	#
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
	movq	%rax, -8(%rbp)	# tmp92, D.4970
	xorl	%eax, %eax	# tmp92
	.loc 1 78 0
	leaq	-9(%rbp), %rax	#, tmp90
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	usbRead	#
	movl	%eax, -16(%rbp)	# D.4968, len
	.loc 1 80 0
	movzbl	-9(%rbp), %eax	# buf, D.4969
	.loc 1 81 0
	movq	-8(%rbp), %rdx	# D.4970, tmp93
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
	movl	$-1, %eax	#, D.4973
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
	movq	-8(%rbp), %rax	# s, D.4974
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
	.long	0x632
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF1998
	.byte	0xc
	.long	.LASF1999
	.long	.LASF2000
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1921
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1922
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1923
	.uleb128 0x4
	.long	.LASF1925
	.byte	0x2
	.byte	0x30
	.long	0x54
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1924
	.uleb128 0x4
	.long	.LASF1926
	.byte	0x2
	.byte	0x31
	.long	0x66
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1927
	.uleb128 0x4
	.long	.LASF1928
	.byte	0x2
	.byte	0x33
	.long	0x78
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1929
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1930
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1931
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1932
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1933
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1934
	.uleb128 0x6
	.long	.LASF1938
	.byte	0x4
	.long	0x78
	.byte	0x3
	.byte	0x14
	.long	0xc7
	.uleb128 0x7
	.long	.LASF1935
	.byte	0x1
	.uleb128 0x7
	.long	.LASF1936
	.byte	0x2
	.uleb128 0x7
	.long	.LASF1937
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF1938
	.byte	0x3
	.byte	0x18
	.long	0xa4
	.uleb128 0x6
	.long	.LASF1939
	.byte	0x4
	.long	0x78
	.byte	0x3
	.byte	0x1a
	.long	0x113
	.uleb128 0x7
	.long	.LASF1940
	.byte	0
	.uleb128 0x7
	.long	.LASF1941
	.byte	0x1
	.uleb128 0x7
	.long	.LASF1942
	.byte	0
	.uleb128 0x7
	.long	.LASF1943
	.byte	0x2
	.uleb128 0x7
	.long	.LASF1944
	.byte	0
	.uleb128 0x7
	.long	.LASF1945
	.byte	0x4
	.uleb128 0x7
	.long	.LASF1946
	.byte	0
	.uleb128 0x7
	.long	.LASF1947
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF1939
	.byte	0x3
	.byte	0x23
	.long	0xd2
	.uleb128 0x4
	.long	.LASF1948
	.byte	0x3
	.byte	0x25
	.long	0x129
	.uleb128 0x8
	.byte	0x8
	.long	0x12f
	.uleb128 0x9
	.long	0x13a
	.uleb128 0xa
	.long	0x5b
	.byte	0
	.uleb128 0xb
	.long	.LASF1963
	.byte	0x48
	.byte	0x3
	.byte	0x27
	.long	0x1ef
	.uleb128 0xc
	.long	.LASF1949
	.byte	0x3
	.byte	0x29
	.long	0x274
	.byte	0
	.uleb128 0xc
	.long	.LASF1950
	.byte	0x3
	.byte	0x2b
	.long	0x49
	.byte	0x8
	.uleb128 0xc
	.long	.LASF1951
	.byte	0x3
	.byte	0x2c
	.long	0xc7
	.byte	0xc
	.uleb128 0xc
	.long	.LASF1952
	.byte	0x3
	.byte	0x2d
	.long	0x113
	.byte	0x10
	.uleb128 0xc
	.long	.LASF1953
	.byte	0x3
	.byte	0x2f
	.long	0x6d
	.byte	0x14
	.uleb128 0xc
	.long	.LASF1954
	.byte	0x3
	.byte	0x31
	.long	0x6d
	.byte	0x18
	.uleb128 0xc
	.long	.LASF1955
	.byte	0x3
	.byte	0x32
	.long	0x6d
	.byte	0x1c
	.uleb128 0xc
	.long	.LASF1956
	.byte	0x3
	.byte	0x33
	.long	0x27f
	.byte	0x20
	.uleb128 0xc
	.long	.LASF1957
	.byte	0x3
	.byte	0x34
	.long	0x27f
	.byte	0x28
	.uleb128 0xc
	.long	.LASF1958
	.byte	0x3
	.byte	0x35
	.long	0x6d
	.byte	0x30
	.uleb128 0xc
	.long	.LASF1959
	.byte	0x3
	.byte	0x36
	.long	0x6d
	.byte	0x34
	.uleb128 0xc
	.long	.LASF1960
	.byte	0x3
	.byte	0x37
	.long	0x6d
	.byte	0x38
	.uleb128 0xc
	.long	.LASF1961
	.byte	0x3
	.byte	0x38
	.long	0x6d
	.byte	0x3c
	.uleb128 0xc
	.long	.LASF1962
	.byte	0x3
	.byte	0x3b
	.long	0x11e
	.byte	0x40
	.byte	0
	.uleb128 0xb
	.long	.LASF1964
	.byte	0x50
	.byte	0x3
	.byte	0x3e
	.long	0x274
	.uleb128 0xc
	.long	.LASF1965
	.byte	0x3
	.byte	0x3f
	.long	0x2ab
	.byte	0
	.uleb128 0xc
	.long	.LASF1966
	.byte	0x3
	.byte	0x41
	.long	0x2c0
	.byte	0x8
	.uleb128 0xc
	.long	.LASF1967
	.byte	0x3
	.byte	0x42
	.long	0x2c0
	.byte	0x10
	.uleb128 0xc
	.long	.LASF1968
	.byte	0x3
	.byte	0x44
	.long	0x2c0
	.byte	0x18
	.uleb128 0xc
	.long	.LASF1969
	.byte	0x3
	.byte	0x47
	.long	0x2d6
	.byte	0x20
	.uleb128 0xc
	.long	.LASF1970
	.byte	0x3
	.byte	0x49
	.long	0x2f2
	.byte	0x28
	.uleb128 0xc
	.long	.LASF1971
	.byte	0x3
	.byte	0x4b
	.long	0x308
	.byte	0x30
	.uleb128 0xc
	.long	.LASF1972
	.byte	0x3
	.byte	0x4d
	.long	0x323
	.byte	0x38
	.uleb128 0xc
	.long	.LASF1973
	.byte	0x3
	.byte	0x4f
	.long	0x334
	.byte	0x40
	.uleb128 0xc
	.long	.LASF1974
	.byte	0x3
	.byte	0x50
	.long	0x334
	.byte	0x48
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x27a
	.uleb128 0xd
	.long	0x1ef
	.uleb128 0x8
	.byte	0x8
	.long	0x285
	.uleb128 0xe
	.long	0x49
	.uleb128 0x4
	.long	.LASF1975
	.byte	0x3
	.byte	0x3c
	.long	0x13a
	.uleb128 0x9
	.long	0x2a5
	.uleb128 0xa
	.long	0x2a5
	.uleb128 0xa
	.long	0x49
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x28a
	.uleb128 0x8
	.byte	0x8
	.long	0x295
	.uleb128 0xf
	.long	0x49
	.long	0x2c0
	.uleb128 0xa
	.long	0x2a5
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x2b1
	.uleb128 0x9
	.long	0x2d6
	.uleb128 0xa
	.long	0x2a5
	.uleb128 0xa
	.long	0x6d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x2c6
	.uleb128 0xf
	.long	0x2eb
	.long	0x2eb
	.uleb128 0xa
	.long	0x2a5
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF1976
	.uleb128 0x8
	.byte	0x8
	.long	0x2dc
	.uleb128 0x9
	.long	0x308
	.uleb128 0xa
	.long	0x2a5
	.uleb128 0xa
	.long	0xc7
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x2f8
	.uleb128 0x9
	.long	0x323
	.uleb128 0xa
	.long	0x2a5
	.uleb128 0xa
	.long	0x8d
	.uleb128 0xa
	.long	0x3b
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x30e
	.uleb128 0x9
	.long	0x334
	.uleb128 0xa
	.long	0x2a5
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x329
	.uleb128 0x10
	.byte	0x60
	.byte	0x4
	.byte	0x16
	.long	0x373
	.uleb128 0xc
	.long	.LASF1977
	.byte	0x4
	.byte	0x17
	.long	0x28a
	.byte	0
	.uleb128 0xc
	.long	.LASF1978
	.byte	0x4
	.byte	0x1a
	.long	0x373
	.byte	0x48
	.uleb128 0xc
	.long	.LASF1979
	.byte	0x4
	.byte	0x1b
	.long	0x49
	.byte	0x5c
	.uleb128 0xc
	.long	.LASF1980
	.byte	0x4
	.byte	0x1d
	.long	0x2eb
	.byte	0x5d
	.byte	0
	.uleb128 0x11
	.long	0x49
	.long	0x383
	.uleb128 0x12
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.long	.LASF1981
	.byte	0x4
	.byte	0x1e
	.long	0x33a
	.uleb128 0x13
	.long	.LASF1983
	.byte	0x1
	.byte	0x2b
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c8
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0x2b
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF1953
	.byte	0x1
	.byte	0x2b
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x13
	.long	.LASF1984
	.byte	0x1
	.byte	0x33
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x402
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0x33
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF1951
	.byte	0x1
	.byte	0x33
	.long	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x15
	.long	.LASF1985
	.byte	0x1
	.byte	0x3b
	.long	0x2eb
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x432
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0x3b
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF1986
	.byte	0x1
	.byte	0x41
	.long	0x49
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x462
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0x41
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	.LASF1987
	.byte	0x1
	.byte	0x48
	.long	0x49
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x4ae
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0x48
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.string	"buf"
	.byte	0x1
	.byte	0x4c
	.long	0x4ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x17
	.string	"len"
	.byte	0x1
	.byte	0x4e
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.long	0x49
	.long	0x4be
	.uleb128 0x12
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF1988
	.byte	0x1
	.byte	0x7f
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x4f6
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0x7f
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x7f
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x13
	.long	.LASF1989
	.byte	0x1
	.byte	0x84
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x522
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0x84
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.long	.LASF2001
	.byte	0x1
	.byte	0x89
	.long	0x49
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.long	.LASF1990
	.byte	0x1
	.byte	0xa4
	.long	0x2a5
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x56d
	.uleb128 0x17
	.string	"s"
	.byte	0x1
	.byte	0xa6
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.long	.LASF1991
	.byte	0x1
	.byte	0xab
	.long	0x6d
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x59d
	.uleb128 0x14
	.long	.LASF1982
	.byte	0x1
	.byte	0xab
	.long	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.long	.LASF1992
	.byte	0x1
	.byte	0x29
	.long	0x383
	.uleb128 0x9
	.byte	0x3
	.quad	vcpPort
	.uleb128 0x11
	.long	0x27a
	.long	0x5c2
	.uleb128 0x12
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF1993
	.byte	0x1
	.byte	0x95
	.long	0x5d7
	.uleb128 0x9
	.byte	0x3
	.quad	usbVTable
	.uleb128 0xd
	.long	0x5b2
	.uleb128 0x1d
	.long	.LASF1994
	.byte	0x5
	.byte	0xc8
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x1d
	.long	.LASF1995
	.byte	0x5
	.byte	0xc9
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x1d
	.long	.LASF1996
	.byte	0x5
	.byte	0xca
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x1d
	.long	.LASF1997
	.byte	0x4
	.byte	0x1f
	.long	0x630
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0xe
	.long	0x6d
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
	.file 6 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 7 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x7
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF254
	.file 8 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro2
	.file 9 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro3
	.file 10 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro5
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
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 13 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF452
	.byte	0x4
	.file 14 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro9
	.file 15 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF494
	.file 16 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.file 17 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro12
	.file 18 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro13
	.file 19 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x7
	.long	.LASF524
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 20 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x18
	.long	.LASF531
	.file 21 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x18
	.long	.LASF532
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro15
	.file 22 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF586
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF587
	.file 23 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x17
	.byte	0x5
	.uleb128 0x19
	.long	.LASF588
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 24 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro21
	.file 25 "/usr/include/time.h"
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF453
	.byte	0x3
	.uleb128 0x92
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro24
	.file 26 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xdb
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x16
	.long	.LASF653
	.file 27 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x1b
	.byte	0x3
	.uleb128 0x16
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x4
	.file 28 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF664
	.file 29 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.file 30 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0xde
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro32
	.file 31 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0x10e
	.uleb128 0x1f
	.byte	0x5
	.uleb128 0x13
	.long	.LASF687
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF702
	.file 32 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x1ec
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro34
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x4
	.byte	0x5
	.uleb128 0x2e4
	.long	.LASF706
	.file 33 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ba
	.uleb128 0x21
	.byte	0x4
	.byte	0x6
	.uleb128 0x3c5
	.long	.LASF707
	.byte	0x4
	.file 34 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.file 35 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x23
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.file 36 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0x24
	.byte	0x5
	.uleb128 0x15
	.long	.LASF714
	.byte	0x4
	.byte	0x4
	.file 37 "./src/main/platform.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x25
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.byte	0x4
	.file 38 "./src/main/build/build_config.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x26
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.file 39 "./src/main/common/utils.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x27
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.file 40 "./src/main/drivers/system.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x28
	.byte	0x4
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x3
	.byte	0x4
	.file 41 "./src/main/drivers/serial_uart.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x29
	.file 42 "./src/main/includes.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x2a
	.file 43 "/usr/include/mraa.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x2b
	.file 44 "/usr/include/mraa/pwm.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x2c
	.file 45 "/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x2d
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x3
	.uleb128 0x21
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro45
	.file 46 "/usr/include/libio.h"
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x2e
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF863
	.file 47 "/usr/include/_G_config.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x2f
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x3
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.byte	0x5
	.uleb128 0x10
	.long	.LASF865
	.file 48 "/usr/include/wchar.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x30
	.byte	0x7
	.long	.Ldebug_macro47
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro48
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro49
	.file 49 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x31
	.byte	0x7
	.long	.Ldebug_macro50
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro52
	.file 50 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0xa4
	.uleb128 0x32
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro54
	.file 51 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.byte	0x3
	.uleb128 0x355
	.uleb128 0x33
	.byte	0x4
	.byte	0x4
	.file 52 "/usr/include/fcntl.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0x5
	.uleb128 0x17
	.long	.LASF980
	.file 53 "/usr/include/x86_64-linux-gnu/bits/fcntl.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x35
	.byte	0x7
	.long	.Ldebug_macro55
	.file 54 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"
	.byte	0x3
	.uleb128 0x3d
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro56
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro57
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.file 55 "/usr/include/x86_64-linux-gnu/bits/stat.h"
	.byte	0x3
	.uleb128 0x4d
	.uleb128 0x37
	.byte	0x7
	.long	.Ldebug_macro59
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro60
	.byte	0x4
	.file 56 "/usr/include/mraa/common.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x38
	.file 57 "/usr/include/mraa/types.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x39
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x4
	.byte	0x4
	.file 58 "/usr/include/mraa/aio.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x3a
	.file 59 "/usr/include/unistd.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro62
	.file 60 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h"
	.byte	0x3
	.uleb128 0xcd
	.uleb128 0x3c
	.byte	0x7
	.long	.Ldebug_macro63
	.byte	0x4
	.file 61 "/usr/include/x86_64-linux-gnu/bits/environments.h"
	.byte	0x3
	.uleb128 0xd1
	.uleb128 0x3d
	.byte	0x3
	.uleb128 0x16
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro64
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x3
	.uleb128 0xe5
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro66
	.file 62 "/usr/include/x86_64-linux-gnu/bits/confname.h"
	.byte	0x3
	.uleb128 0x264
	.uleb128 0x3e
	.byte	0x7
	.long	.Ldebug_macro67
	.byte	0x4
	.byte	0x5
	.uleb128 0x369
	.long	.LASF1530
	.file 63 "/usr/include/getopt.h"
	.byte	0x3
	.uleb128 0x36a
	.uleb128 0x3f
	.byte	0x6
	.uleb128 0xbd
	.long	.LASF1531
	.byte	0x4
	.byte	0x4
	.file 64 "/usr/include/mraa/gpio.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x40
	.file 65 "/usr/include/pthread.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1532
	.file 66 "/usr/include/sched.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x42
	.byte	0x7
	.long	.Ldebug_macro68
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro69
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.file 67 "/usr/include/x86_64-linux-gnu/bits/sched.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x43
	.byte	0x7
	.long	.Ldebug_macro70
	.byte	0x4
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1554
	.byte	0x4
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro71
	.byte	0x3
	.uleb128 0x25
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro72
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro73
	.byte	0x4
	.file 68 "/usr/include/x86_64-linux-gnu/bits/setjmp.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x44
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1571
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro74
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 69 "/usr/include/mraa/spi.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x45
	.byte	0x4
	.file 70 "/usr/include/mraa/i2c.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x46
	.byte	0x4
	.file 71 "/usr/include/mraa/uart.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x47
	.byte	0x4
	.file 72 "/usr/include/mraa/uart_ow.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x48
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1593
	.byte	0x4
	.byte	0x4
	.file 73 "/usr/include/errno.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x49
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1594
	.file 74 "/usr/include/x86_64-linux-gnu/bits/errno.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x4a
	.byte	0x7
	.long	.Ldebug_macro75
	.file 75 "/usr/include/linux/errno.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x4b
	.file 76 "/usr/include/x86_64-linux-gnu/asm/errno.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x4c
	.file 77 "/usr/include/asm-generic/errno.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x4d
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1598
	.file 78 "/usr/include/asm-generic/errno-base.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x4e
	.byte	0x7
	.long	.Ldebug_macro76
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro77
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro78
	.byte	0x4
	.byte	0x6
	.uleb128 0x24
	.long	.LASF1735
	.byte	0x4
	.file 79 "/usr/include/termios.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x4f
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1736
	.file 80 "/usr/include/x86_64-linux-gnu/bits/termios.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x50
	.byte	0x7
	.long	.Ldebug_macro79
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1880
	.file 81 "/usr/include/x86_64-linux-gnu/sys/ttydefaults.h"
	.byte	0x3
	.uleb128 0x68
	.uleb128 0x51
	.byte	0x7
	.long	.Ldebug_macro80
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro81
	.byte	0x4
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1920
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
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF385
	.byte	0x5
	.uleb128 0x22
	.long	.LASF386
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF387
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF388
	.byte	0x5
	.uleb128 0x34
	.long	.LASF389
	.byte	0x5
	.uleb128 0x78
	.long	.LASF390
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF391
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF392
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF393
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF394
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF395
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF396
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF397
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF398
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF399
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF400
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF401
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF402
	.byte	0x5
	.uleb128 0xad
	.long	.LASF403
	.byte	0x5
	.uleb128 0xae
	.long	.LASF404
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF405
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF406
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF407
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF408
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF409
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF410
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF411
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF412
	.byte	0x5
	.uleb128 0xba
	.long	.LASF413
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF414
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF415
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF416
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF417
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF418
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF419
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF420
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF421
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF422
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF423
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF424
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF425
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF426
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF427
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF428
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF429
	.byte	0x5
	.uleb128 0xec
	.long	.LASF430
	.byte	0x5
	.uleb128 0xee
	.long	.LASF431
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF432
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF433
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF434
	.byte	0x5
	.uleb128 0x100
	.long	.LASF435
	.byte	0x5
	.uleb128 0x101
	.long	.LASF436
	.byte	0x5
	.uleb128 0x105
	.long	.LASF437
	.byte	0x5
	.uleb128 0x111
	.long	.LASF438
	.byte	0x5
	.uleb128 0x112
	.long	.LASF439
	.byte	0x5
	.uleb128 0x116
	.long	.LASF440
	.byte	0x5
	.uleb128 0x117
	.long	.LASF441
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF442
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF443
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF444
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF445
	.byte	0x5
	.uleb128 0x124
	.long	.LASF446
	.byte	0x5
	.uleb128 0x125
	.long	.LASF447
	.byte	0x5
	.uleb128 0x126
	.long	.LASF448
	.byte	0x5
	.uleb128 0x128
	.long	.LASF449
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF450
	.byte	0x5
	.uleb128 0x130
	.long	.LASF451
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.27.59e2586c75bdbcb991b248ad7257b993,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF453
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF454
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.e1c83cba2098ce92b68f6311de19e6b1,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF456
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF457
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF458
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF459
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF460
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF461
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF462
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF463
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF464
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF465
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF466
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF467
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF468
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF469
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF470
	.byte	0x5
	.uleb128 0xca
	.long	.LASF471
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF472
	.byte	0x6
	.uleb128 0xee
	.long	.LASF473
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF474
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF475
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF476
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF477
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF478
	.byte	0x5
	.uleb128 0x110
	.long	.LASF479
	.byte	0x5
	.uleb128 0x111
	.long	.LASF480
	.byte	0x5
	.uleb128 0x112
	.long	.LASF481
	.byte	0x5
	.uleb128 0x113
	.long	.LASF482
	.byte	0x5
	.uleb128 0x114
	.long	.LASF483
	.byte	0x5
	.uleb128 0x115
	.long	.LASF484
	.byte	0x5
	.uleb128 0x116
	.long	.LASF485
	.byte	0x5
	.uleb128 0x117
	.long	.LASF486
	.byte	0x5
	.uleb128 0x118
	.long	.LASF487
	.byte	0x5
	.uleb128 0x119
	.long	.LASF488
	.byte	0x6
	.uleb128 0x126
	.long	.LASF489
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF490
	.byte	0x6
	.uleb128 0x191
	.long	.LASF491
	.byte	0x5
	.uleb128 0x196
	.long	.LASF492
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF493
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.e401b8bcfee800b540b27abd7cc78de9,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF495
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF496
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF497
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF498
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF499
	.byte	0x5
	.uleb128 0x20
	.long	.LASF500
	.byte	0x5
	.uleb128 0x22
	.long	.LASF501
	.byte	0x5
	.uleb128 0x24
	.long	.LASF502
	.byte	0x5
	.uleb128 0x25
	.long	.LASF503
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF504
	.byte	0x6
	.uleb128 0x2e
	.long	.LASF505
	.byte	0x6
	.uleb128 0x2f
	.long	.LASF506
	.byte	0x6
	.uleb128 0x30
	.long	.LASF507
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF508
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF509
	.byte	0x5
	.uleb128 0x22
	.long	.LASF510
	.byte	0x5
	.uleb128 0x25
	.long	.LASF511
	.byte	0x5
	.uleb128 0x28
	.long	.LASF512
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF513
	.byte	0x5
	.uleb128 0x31
	.long	.LASF514
	.byte	0x5
	.uleb128 0x35
	.long	.LASF515
	.byte	0x5
	.uleb128 0x38
	.long	.LASF516
	.byte	0x5
	.uleb128 0x39
	.long	.LASF517
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF518
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF519
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.19.ff00c9c0f5e9f9a9719c5de76ace57b4,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF520
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF521
	.byte	0x5
	.uleb128 0x20
	.long	.LASF522
	.byte	0x5
	.uleb128 0x21
	.long	.LASF523
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.41.24cced64aef71195a51d4daa8e4f4a95,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF525
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF526
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF527
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF528
	.byte	0x5
	.uleb128 0x30
	.long	.LASF529
	.byte	0x5
	.uleb128 0x34
	.long	.LASF530
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF533
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF534
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF535
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF536
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF537
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF538
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF539
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF540
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF541
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF542
	.byte	0x5
	.uleb128 0x70
	.long	.LASF543
	.byte	0x5
	.uleb128 0x71
	.long	.LASF544
	.byte	0x5
	.uleb128 0x72
	.long	.LASF545
	.byte	0x5
	.uleb128 0x73
	.long	.LASF546
	.byte	0x5
	.uleb128 0x75
	.long	.LASF547
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF548
	.byte	0x5
	.uleb128 0x22
	.long	.LASF549
	.byte	0x5
	.uleb128 0x23
	.long	.LASF550
	.byte	0x5
	.uleb128 0x26
	.long	.LASF551
	.byte	0x5
	.uleb128 0x27
	.long	.LASF552
	.byte	0x5
	.uleb128 0x28
	.long	.LASF553
	.byte	0x5
	.uleb128 0x29
	.long	.LASF554
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF555
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF556
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF557
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF558
	.byte	0x5
	.uleb128 0x33
	.long	.LASF559
	.byte	0x5
	.uleb128 0x34
	.long	.LASF560
	.byte	0x5
	.uleb128 0x35
	.long	.LASF561
	.byte	0x5
	.uleb128 0x36
	.long	.LASF562
	.byte	0x5
	.uleb128 0x37
	.long	.LASF563
	.byte	0x5
	.uleb128 0x38
	.long	.LASF564
	.byte	0x5
	.uleb128 0x39
	.long	.LASF565
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF566
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF567
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF568
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF569
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF570
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF571
	.byte	0x5
	.uleb128 0x40
	.long	.LASF572
	.byte	0x5
	.uleb128 0x41
	.long	.LASF573
	.byte	0x5
	.uleb128 0x42
	.long	.LASF574
	.byte	0x5
	.uleb128 0x43
	.long	.LASF575
	.byte	0x5
	.uleb128 0x44
	.long	.LASF576
	.byte	0x5
	.uleb128 0x45
	.long	.LASF577
	.byte	0x5
	.uleb128 0x46
	.long	.LASF578
	.byte	0x5
	.uleb128 0x47
	.long	.LASF579
	.byte	0x5
	.uleb128 0x48
	.long	.LASF580
	.byte	0x5
	.uleb128 0x49
	.long	.LASF581
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF582
	.byte	0x5
	.uleb128 0x50
	.long	.LASF583
	.byte	0x5
	.uleb128 0x53
	.long	.LASF584
	.byte	0x5
	.uleb128 0x57
	.long	.LASF585
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.38.11ee5fdc0f6cc53a16c505b9233cecef,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF589
	.byte	0x5
	.uleb128 0x61
	.long	.LASF590
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.63.97272d7c64d5db8020003b32e9289502,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF591
	.byte	0x5
	.uleb128 0x40
	.long	.LASF592
	.byte	0x5
	.uleb128 0x41
	.long	.LASF593
	.byte	0x5
	.uleb128 0x42
	.long	.LASF594
	.byte	0x5
	.uleb128 0x44
	.long	.LASF595
	.byte	0x5
	.uleb128 0x45
	.long	.LASF596
	.byte	0x5
	.uleb128 0x46
	.long	.LASF597
	.byte	0x5
	.uleb128 0x47
	.long	.LASF598
	.byte	0x5
	.uleb128 0x49
	.long	.LASF599
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF600
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF601
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF602
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.99.408b6270fa6eb71377201a241ef15f79,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF603
	.byte	0x5
	.uleb128 0x64
	.long	.LASF604
	.byte	0x5
	.uleb128 0x65
	.long	.LASF605
	.byte	0x5
	.uleb128 0x66
	.long	.LASF606
	.byte	0x5
	.uleb128 0x67
	.long	.LASF607
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.50.84aeca2ac6f37d40e1e9b3cef757ba2d,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF608
	.byte	0x5
	.uleb128 0x48
	.long	.LASF609
	.byte	0x5
	.uleb128 0x54
	.long	.LASF610
	.byte	0x5
	.uleb128 0x55
	.long	.LASF611
	.byte	0x5
	.uleb128 0x56
	.long	.LASF612
	.byte	0x5
	.uleb128 0x57
	.long	.LASF613
	.byte	0x5
	.uleb128 0x58
	.long	.LASF614
	.byte	0x5
	.uleb128 0x59
	.long	.LASF615
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF616
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF617
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF618
	.byte	0x5
	.uleb128 0x80
	.long	.LASF619
	.byte	0x5
	.uleb128 0x85
	.long	.LASF620
	.byte	0x5
	.uleb128 0x86
	.long	.LASF621
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF622
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.305f7c1ed78a85c751613a0e1f6565b3,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF623
	.byte	0x5
	.uleb128 0x28
	.long	.LASF624
	.byte	0x5
	.uleb128 0x34
	.long	.LASF625
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF626
	.byte	0x5
	.uleb128 0x42
	.long	.LASF627
	.byte	0x5
	.uleb128 0x47
	.long	.LASF628
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF629
	.byte	0x5
	.uleb128 0x51
	.long	.LASF630
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF631
	.byte	0x5
	.uleb128 0x63
	.long	.LASF632
	.byte	0x5
	.uleb128 0x69
	.long	.LASF633
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF634
	.byte	0x5
	.uleb128 0x75
	.long	.LASF635
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF636
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF637
	.byte	0x5
	.uleb128 0x81
	.long	.LASF638
	.byte	0x5
	.uleb128 0x82
	.long	.LASF639
	.byte	0x5
	.uleb128 0x83
	.long	.LASF640
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.53.beb46e650cd406cb917b6b96b45e640a,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF641
	.byte	0x6
	.uleb128 0x42
	.long	.LASF642
	.byte	0x5
	.uleb128 0x45
	.long	.LASF643
	.byte	0x6
	.uleb128 0x52
	.long	.LASF644
	.byte	0x5
	.uleb128 0x56
	.long	.LASF645
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF646
	.byte	0x5
	.uleb128 0x62
	.long	.LASF647
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF648
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF649
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.847b6907dabda77be90a9ab7ad789e2e,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF473
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF493
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.187.fd8c81c4bff8969f5d23c3a34aa715af,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF650
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF651
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF652
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.28.eb2f3debdbcffd1442ebddaebc4fb6ff,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF654
	.byte	0x5
	.uleb128 0x21
	.long	.LASF655
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF656
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF657
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF658
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF659
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF660
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF661
	.byte	0x5
	.uleb128 0x29
	.long	.LASF638
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF662
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF642
	.byte	0x6
	.uleb128 0x52
	.long	.LASF644
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF646
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF648
	.byte	0x5
	.uleb128 0x72
	.long	.LASF663
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF649
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.25.ae5284cdff565e87a9198d819340325d,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF665
	.byte	0x6
	.uleb128 0x65
	.long	.LASF666
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.49.e9d2041e5035cc68ebd1a20f7dbc8514,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF667
	.byte	0x6
	.uleb128 0x39
	.long	.LASF668
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF669
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF670
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF671
	.byte	0x5
	.uleb128 0x49
	.long	.LASF672
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF673
	.byte	0x5
	.uleb128 0x55
	.long	.LASF674
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF675
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF676
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF677
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF678
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sysmacros.h.20.8a0c33ff175cd9b434a86c0aaa36f0a2,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF679
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF680
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF681
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF682
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.229.67b3f66bd74b06b451caec392a72a945,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF683
	.byte	0x5
	.uleb128 0xec
	.long	.LASF684
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF685
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF686
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypes.h.25.6892b1493314fcf446bbc76e7362acba,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF688
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF689
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF690
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF691
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF692
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF693
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF694
	.byte	0x5
	.uleb128 0x20
	.long	.LASF695
	.byte	0x5
	.uleb128 0x21
	.long	.LASF696
	.byte	0x5
	.uleb128 0x46
	.long	.LASF697
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF698
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF699
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF700
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF701
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF703
	.byte	0x5
	.uleb128 0x17
	.long	.LASF453
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF704
	.byte	0x5
	.uleb128 0x23
	.long	.LASF705
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.07dce69c3b78884144b7f7bd19483461,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF708
	.byte	0x5
	.uleb128 0x21
	.long	.LASF709
	.byte	0x5
	.uleb128 0x22
	.long	.LASF710
	.byte	0x5
	.uleb128 0x23
	.long	.LASF711
	.byte	0x5
	.uleb128 0x34
	.long	.LASF712
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.8394011d5995a16f15d67d04e84a1d69,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF713
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF453
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.04cc7214bceba497b20d15c10fd97511,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF473
	.byte	0x6
	.uleb128 0x191
	.long	.LASF491
	.byte	0x5
	.uleb128 0x196
	.long	.LASF492
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF493
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.target.h.27.fb30bee6923ab05d4360685030e3605d,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF715
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF716
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF717
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF718
	.byte	0x5
	.uleb128 0x21
	.long	.LASF719
	.byte	0x5
	.uleb128 0x22
	.long	.LASF720
	.byte	0x5
	.uleb128 0x23
	.long	.LASF721
	.byte	0x5
	.uleb128 0x24
	.long	.LASF722
	.byte	0x5
	.uleb128 0x25
	.long	.LASF723
	.byte	0x5
	.uleb128 0x26
	.long	.LASF724
	.byte	0x5
	.uleb128 0x29
	.long	.LASF725
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF726
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF727
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF728
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF729
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF730
	.byte	0x5
	.uleb128 0x34
	.long	.LASF731
	.byte	0x5
	.uleb128 0x37
	.long	.LASF732
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF733
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF734
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF735
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF736
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF737
	.byte	0x5
	.uleb128 0x40
	.long	.LASF738
	.byte	0x5
	.uleb128 0x42
	.long	.LASF739
	.byte	0x5
	.uleb128 0x43
	.long	.LASF740
	.byte	0x5
	.uleb128 0x44
	.long	.LASF741
	.byte	0x5
	.uleb128 0x45
	.long	.LASF742
	.byte	0x5
	.uleb128 0x47
	.long	.LASF743
	.byte	0x5
	.uleb128 0x48
	.long	.LASF744
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF745
	.byte	0x5
	.uleb128 0x50
	.long	.LASF746
	.byte	0x5
	.uleb128 0x52
	.long	.LASF747
	.byte	0x5
	.uleb128 0x55
	.long	.LASF748
	.byte	0x5
	.uleb128 0x56
	.long	.LASF749
	.byte	0x5
	.uleb128 0x58
	.long	.LASF750
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF751
	.byte	0x5
	.uleb128 0x60
	.long	.LASF752
	.byte	0x5
	.uleb128 0x62
	.long	.LASF753
	.byte	0x5
	.uleb128 0x63
	.long	.LASF754
	.byte	0x5
	.uleb128 0x64
	.long	.LASF755
	.byte	0x5
	.uleb128 0x65
	.long	.LASF756
	.byte	0x5
	.uleb128 0x66
	.long	.LASF757
	.byte	0x5
	.uleb128 0x67
	.long	.LASF758
	.byte	0x5
	.uleb128 0x68
	.long	.LASF759
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF760
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF761
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF762
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF763
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF764
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF765
	.byte	0x5
	.uleb128 0x71
	.long	.LASF766
	.byte	0x5
	.uleb128 0x72
	.long	.LASF767
	.byte	0x5
	.uleb128 0x73
	.long	.LASF768
	.byte	0x5
	.uleb128 0x74
	.long	.LASF769
	.byte	0x5
	.uleb128 0x75
	.long	.LASF770
	.byte	0x5
	.uleb128 0x76
	.long	.LASF771
	.byte	0x5
	.uleb128 0x79
	.long	.LASF772
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF773
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF774
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF775
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF776
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF777
	.byte	0x5
	.uleb128 0x80
	.long	.LASF778
	.byte	0x5
	.uleb128 0x81
	.long	.LASF779
	.byte	0x5
	.uleb128 0x82
	.long	.LASF780
	.byte	0x5
	.uleb128 0x83
	.long	.LASF781
	.byte	0x5
	.uleb128 0x84
	.long	.LASF782
	.byte	0x5
	.uleb128 0x85
	.long	.LASF783
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF784
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF785
	.byte	0x5
	.uleb128 0x90
	.long	.LASF786
	.byte	0x5
	.uleb128 0x91
	.long	.LASF787
	.byte	0x5
	.uleb128 0x92
	.long	.LASF788
	.byte	0x5
	.uleb128 0x93
	.long	.LASF789
	.byte	0x5
	.uleb128 0x95
	.long	.LASF790
	.byte	0x5
	.uleb128 0x97
	.long	.LASF791
	.byte	0x5
	.uleb128 0x98
	.long	.LASF792
	.byte	0x5
	.uleb128 0x99
	.long	.LASF793
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF794
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF795
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF796
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF797
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF798
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF799
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF800
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF801
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF802
	.byte	0x5
	.uleb128 0xad
	.long	.LASF803
	.byte	0x5
	.uleb128 0xae
	.long	.LASF804
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF805
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF806
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF807
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF808
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF809
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF810
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF811
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF812
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF813
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF814
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF815
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF816
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.build_config.h.20.1bf8432fc8be9a81fe8cce0e3f98279c,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF817
	.byte	0x5
	.uleb128 0x15
	.long	.LASF818
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF819
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF820
	.byte	0x5
	.uleb128 0x20
	.long	.LASF821
	.byte	0x5
	.uleb128 0x21
	.long	.LASF822
	.byte	0x5
	.uleb128 0x27
	.long	.LASF823
	.byte	0x5
	.uleb128 0x28
	.long	.LASF824
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.39.d5a83c17f38162a5dd6f834eaf38f8ef,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF825
	.byte	0x5
	.uleb128 0x28
	.long	.LASF826
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF827
	.byte	0x5
	.uleb128 0x89
	.long	.LASF828
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF829
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF830
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF831
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF832
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF833
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF834
	.byte	0x5
	.uleb128 0x90
	.long	.LASF835
	.byte	0x5
	.uleb128 0x91
	.long	.LASF836
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF837
	.byte	0x6
	.uleb128 0xee
	.long	.LASF473
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF490
	.byte	0x6
	.uleb128 0x191
	.long	.LASF491
	.byte	0x5
	.uleb128 0x196
	.long	.LASF492
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF493
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF838
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.utils.h.23.2b82339877b7c3aa30b5f7b1f680a654,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF839
	.byte	0x5
	.uleb128 0x18
	.long	.LASF840
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF841
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF842
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF843
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF844
	.byte	0x5
	.uleb128 0x20
	.long	.LASF845
	.byte	0x5
	.uleb128 0x21
	.long	.LASF846
	.byte	0x5
	.uleb128 0x23
	.long	.LASF817
	.byte	0x5
	.uleb128 0x24
	.long	.LASF818
	.byte	0x5
	.uleb128 0x26
	.long	.LASF847
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF848
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF849
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF817
	.byte	0x5
	.uleb128 0x34
	.long	.LASF850
	.byte	0x5
	.uleb128 0x35
	.long	.LASF851
	.byte	0x5
	.uleb128 0x36
	.long	.LASF852
	.byte	0x5
	.uleb128 0x37
	.long	.LASF853
	.byte	0x5
	.uleb128 0x44
	.long	.LASF854
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.26.4719156f1aea2bb9662fd6c582dc9a4c,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF855
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF453
	.byte	0x5
	.uleb128 0x20
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.161.19e15733342b50ead2919490b095303e,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF837
	.byte	0x6
	.uleb128 0xee
	.long	.LASF473
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF490
	.byte	0x6
	.uleb128 0x191
	.long	.LASF491
	.byte	0x5
	.uleb128 0x196
	.long	.LASF492
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF493
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF838
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.36.2dd12c1fd035242ad5cfd0152a01be5a,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF856
	.byte	0x5
	.uleb128 0x25
	.long	.LASF857
	.byte	0x5
	.uleb128 0x38
	.long	.LASF858
	.byte	0x6
	.uleb128 0x3a
	.long	.LASF859
	.byte	0x5
	.uleb128 0x42
	.long	.LASF860
	.byte	0x6
	.uleb128 0x44
	.long	.LASF861
	.byte	0x5
	.uleb128 0x48
	.long	.LASF862
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.5.b0f37d9e474454cf6e459063458db32f,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.long	.LASF864
	.byte	0x5
	.uleb128 0xa
	.long	.LASF453
	.byte	0x5
	.uleb128 0xe
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.80.eea3eba2d2a17aace9470a8e0d8218dc,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF866
	.byte	0x6
	.uleb128 0x60
	.long	.LASF867
	.byte	0x6
	.uleb128 0x386
	.long	.LASF867
	.byte	0x6
	.uleb128 0x387
	.long	.LASF868
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.46.5187c97b14fd664662cb32e6b94fc49e,comdat
.Ldebug_macro48:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF869
	.byte	0x5
	.uleb128 0x30
	.long	.LASF870
	.byte	0x5
	.uleb128 0x31
	.long	.LASF871
	.byte	0x5
	.uleb128 0x33
	.long	.LASF872
	.byte	0x5
	.uleb128 0x36
	.long	.LASF873
	.byte	0x5
	.uleb128 0x38
	.long	.LASF874
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.33.a775b9ecae273f33bc59931e9891e4ca,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.long	.LASF875
	.byte	0x5
	.uleb128 0x22
	.long	.LASF876
	.byte	0x5
	.uleb128 0x23
	.long	.LASF877
	.byte	0x5
	.uleb128 0x24
	.long	.LASF878
	.byte	0x5
	.uleb128 0x25
	.long	.LASF879
	.byte	0x5
	.uleb128 0x26
	.long	.LASF880
	.byte	0x5
	.uleb128 0x27
	.long	.LASF881
	.byte	0x5
	.uleb128 0x28
	.long	.LASF882
	.byte	0x5
	.uleb128 0x29
	.long	.LASF883
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF884
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF885
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF886
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF887
	.byte	0x5
	.uleb128 0x30
	.long	.LASF888
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF889
	.byte	0x5
	.uleb128 0x27
	.long	.LASF890
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.51.dab170798ec1df48c625aea7c30e1b63,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x33
	.long	.LASF891
	.byte	0x5
	.uleb128 0x34
	.long	.LASF892
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF893
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF894
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF895
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF896
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF897
	.byte	0x5
	.uleb128 0x50
	.long	.LASF898
	.byte	0x5
	.uleb128 0x51
	.long	.LASF899
	.byte	0x5
	.uleb128 0x52
	.long	.LASF900
	.byte	0x5
	.uleb128 0x53
	.long	.LASF901
	.byte	0x5
	.uleb128 0x54
	.long	.LASF902
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF903
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF904
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF905
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF906
	.byte	0x5
	.uleb128 0x60
	.long	.LASF907
	.byte	0x5
	.uleb128 0x61
	.long	.LASF908
	.byte	0x5
	.uleb128 0x62
	.long	.LASF909
	.byte	0x5
	.uleb128 0x63
	.long	.LASF910
	.byte	0x5
	.uleb128 0x64
	.long	.LASF911
	.byte	0x5
	.uleb128 0x65
	.long	.LASF912
	.byte	0x5
	.uleb128 0x66
	.long	.LASF913
	.byte	0x5
	.uleb128 0x67
	.long	.LASF914
	.byte	0x5
	.uleb128 0x68
	.long	.LASF915
	.byte	0x5
	.uleb128 0x69
	.long	.LASF916
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF917
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF918
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF919
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF920
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF921
	.byte	0x5
	.uleb128 0x70
	.long	.LASF922
	.byte	0x5
	.uleb128 0x71
	.long	.LASF923
	.byte	0x5
	.uleb128 0x75
	.long	.LASF924
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF925
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF926
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF927
	.byte	0x5
	.uleb128 0x80
	.long	.LASF928
	.byte	0x5
	.uleb128 0x81
	.long	.LASF929
	.byte	0x5
	.uleb128 0x82
	.long	.LASF930
	.byte	0x5
	.uleb128 0x83
	.long	.LASF931
	.byte	0x5
	.uleb128 0x84
	.long	.LASF932
	.byte	0x5
	.uleb128 0x85
	.long	.LASF933
	.byte	0x5
	.uleb128 0x86
	.long	.LASF934
	.byte	0x5
	.uleb128 0x87
	.long	.LASF935
	.byte	0x5
	.uleb128 0x88
	.long	.LASF936
	.byte	0x5
	.uleb128 0x89
	.long	.LASF937
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF938
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF939
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF940
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF941
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF942
	.byte	0x5
	.uleb128 0x110
	.long	.LASF943
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF944
	.byte	0x5
	.uleb128 0x140
	.long	.LASF945
	.byte	0x5
	.uleb128 0x141
	.long	.LASF946
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF947
	.byte	0x5
	.uleb128 0x190
	.long	.LASF948
	.byte	0x5
	.uleb128 0x193
	.long	.LASF949
	.byte	0x5
	.uleb128 0x197
	.long	.LASF950
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF951
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF952
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF953
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF954
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF955
	.byte	0x5
	.uleb128 0x1c5
	.long	.LASF956
	.byte	0x5
	.uleb128 0x1c6
	.long	.LASF957
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF958
	.byte	0x5
	.uleb128 0x1c8
	.long	.LASF959
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.80.17b7dd1ca72d8a61987532cb1d80194a,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF960
	.byte	0x5
	.uleb128 0x78
	.long	.LASF961
	.byte	0x5
	.uleb128 0x79
	.long	.LASF962
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF963
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF964
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF965
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF966
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF967
	.byte	0x5
	.uleb128 0x97
	.long	.LASF968
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.23.557290a6cddeba0587f574f29e3a5fb9,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF969
	.byte	0x5
	.uleb128 0x18
	.long	.LASF970
	.byte	0x5
	.uleb128 0x19
	.long	.LASF971
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF972
	.byte	0x6
	.uleb128 0x24
	.long	.LASF973
	.byte	0x5
	.uleb128 0x25
	.long	.LASF974
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.172.df21df34a7396d7da2e08f9b617d582f,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xac
	.long	.LASF975
	.byte	0x5
	.uleb128 0xad
	.long	.LASF976
	.byte	0x5
	.uleb128 0xae
	.long	.LASF977
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF978
	.byte	0x5
	.uleb128 0x249
	.long	.LASF979
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.24.62c7e777a8b210e920ccbb92cfe8b9d8,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF981
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF982
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF983
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF984
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntllinux.h.42.497aaf7c2ab4b1c0485b1e24ddad6e31,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF985
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF986
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF987
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF988
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF989
	.byte	0x5
	.uleb128 0x32
	.long	.LASF990
	.byte	0x5
	.uleb128 0x35
	.long	.LASF991
	.byte	0x5
	.uleb128 0x38
	.long	.LASF992
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF993
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF994
	.byte	0x5
	.uleb128 0x41
	.long	.LASF995
	.byte	0x5
	.uleb128 0x44
	.long	.LASF996
	.byte	0x5
	.uleb128 0x46
	.long	.LASF997
	.byte	0x5
	.uleb128 0x48
	.long	.LASF998
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF999
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1013
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1014
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1015
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1016
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1017
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1018
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1019
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1020
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1021
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1022
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1023
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1024
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1025
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1026
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1027
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1028
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1029
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF1030
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF1031
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1032
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1033
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF1034
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1035
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF1036
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1037
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x118
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x122
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x124
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x126
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF1054
	.byte	0x5
	.uleb128 0x161
	.long	.LASF1055
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1056
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.40.8ff0a2b883e8f8c14f135fe2e029942a,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1057
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF662
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.fa652aa18ecf92239cee124d5533fe97,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF642
	.byte	0x6
	.uleb128 0x52
	.long	.LASF644
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF646
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF648
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF649
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stat.h.23.71443f0579dab3228134d84ad7d61c3e,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1058
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1062
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1063
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1065
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1066
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1067
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1068
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1069
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1070
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1071
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1072
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1073
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1074
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1075
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1076
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1077
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF1078
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1079
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1080
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1081
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1082
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF1083
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1084
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF1085
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1086
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1087
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.79.1b8e643ad8ec15e80ca5a02cd230a858,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x88
	.long	.LASF965
	.byte	0x5
	.uleb128 0x89
	.long	.LASF966
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF967
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF1115
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1116
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF1117
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1118
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.common.h.30.e56d1787b8140cf11356ebb3debd7778,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1125
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.23.a608ae63b1bee638e80d9e2a8598bd8e,comdat
.Ldebug_macro62:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1143
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_opt.h.20.8587404e00639bdcc5f6a74591f95259,comdat
.Ldebug_macro63:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1153
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1154
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1156
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1158
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1159
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1160
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1161
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1162
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1163
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1164
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1165
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1166
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1167
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1168
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1169
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1170
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1171
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1172
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1173
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1174
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1175
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1178
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1192
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1193
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1194
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1195
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1196
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1197
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1198
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1199
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1200
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1201
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1202
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1203
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1204
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1205
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.environments.h.56.c5802092ccc191baeb41f8d355bb878f,comdat
.Ldebug_macro64:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1217
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.213.4c582e35260d661b081322974b7c1e74,comdat
.Ldebug_macro65:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1218
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1219
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1220
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF453
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.259.cf1a01f3dbe75cab9837a40563f75c2b,comdat
.Ldebug_macro66:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x146
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1225
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.confname.h.27.6b00117a32f457cc72e5ac810a9adade,comdat
.Ldebug_macro67:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1263
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1287
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1288
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1289
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1290
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1291
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1292
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1293
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1294
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1295
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1296
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1297
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1298
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1299
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1300
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1301
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1302
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1303
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1304
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1305
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1306
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1307
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1308
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1309
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1310
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1311
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1312
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1313
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1314
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1315
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1316
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1317
	.byte	0x5
	.uleb128 0xde
	.long	.LASF1318
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1319
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1320
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1321
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1322
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1323
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1324
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1325
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1326
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1327
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1328
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1329
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1330
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1331
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1332
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1333
	.byte	0x5
	.uleb128 0xff
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1368
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1369
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1372
	.byte	0x5
	.uleb128 0x152
	.long	.LASF1373
	.byte	0x5
	.uleb128 0x155
	.long	.LASF1374
	.byte	0x5
	.uleb128 0x157
	.long	.LASF1375
	.byte	0x5
	.uleb128 0x159
	.long	.LASF1376
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1377
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1378
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1379
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1380
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1381
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1382
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1383
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1384
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1386
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1387
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1388
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x179
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1395
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x185
	.long	.LASF1397
	.byte	0x5
	.uleb128 0x187
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1405
	.byte	0x5
	.uleb128 0x197
	.long	.LASF1406
	.byte	0x5
	.uleb128 0x199
	.long	.LASF1407
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF1409
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1410
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1411
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1412
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF1413
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF1414
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF1416
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x1c0
	.long	.LASF1426
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF1427
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1428
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1429
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF1430
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF1433
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF1435
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF1436
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF1437
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF1438
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1439
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1440
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF1441
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF1442
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF1443
	.byte	0x5
	.uleb128 0x1e6
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x1e8
	.long	.LASF1445
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF1446
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF1447
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1448
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF1449
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF1450
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF1451
	.byte	0x5
	.uleb128 0x1f9
	.long	.LASF1452
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF1453
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF1454
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1455
	.byte	0x5
	.uleb128 0x203
	.long	.LASF1456
	.byte	0x5
	.uleb128 0x205
	.long	.LASF1457
	.byte	0x5
	.uleb128 0x207
	.long	.LASF1458
	.byte	0x5
	.uleb128 0x209
	.long	.LASF1459
	.byte	0x5
	.uleb128 0x20c
	.long	.LASF1460
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF1461
	.byte	0x5
	.uleb128 0x211
	.long	.LASF1462
	.byte	0x5
	.uleb128 0x218
	.long	.LASF1463
	.byte	0x5
	.uleb128 0x21b
	.long	.LASF1464
	.byte	0x5
	.uleb128 0x21c
	.long	.LASF1465
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF1466
	.byte	0x5
	.uleb128 0x221
	.long	.LASF1467
	.byte	0x5
	.uleb128 0x224
	.long	.LASF1468
	.byte	0x5
	.uleb128 0x225
	.long	.LASF1469
	.byte	0x5
	.uleb128 0x228
	.long	.LASF1470
	.byte	0x5
	.uleb128 0x229
	.long	.LASF1471
	.byte	0x5
	.uleb128 0x22c
	.long	.LASF1472
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1473
	.byte	0x5
	.uleb128 0x230
	.long	.LASF1474
	.byte	0x5
	.uleb128 0x232
	.long	.LASF1475
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1476
	.byte	0x5
	.uleb128 0x236
	.long	.LASF1477
	.byte	0x5
	.uleb128 0x238
	.long	.LASF1478
	.byte	0x5
	.uleb128 0x23a
	.long	.LASF1479
	.byte	0x5
	.uleb128 0x23d
	.long	.LASF1480
	.byte	0x5
	.uleb128 0x23f
	.long	.LASF1481
	.byte	0x5
	.uleb128 0x241
	.long	.LASF1482
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1483
	.byte	0x5
	.uleb128 0x245
	.long	.LASF1484
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1485
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1486
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF1487
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF1488
	.byte	0x5
	.uleb128 0x24f
	.long	.LASF1489
	.byte	0x5
	.uleb128 0x251
	.long	.LASF1490
	.byte	0x5
	.uleb128 0x253
	.long	.LASF1491
	.byte	0x5
	.uleb128 0x255
	.long	.LASF1492
	.byte	0x5
	.uleb128 0x257
	.long	.LASF1493
	.byte	0x5
	.uleb128 0x259
	.long	.LASF1494
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF1495
	.byte	0x5
	.uleb128 0x25e
	.long	.LASF1496
	.byte	0x5
	.uleb128 0x260
	.long	.LASF1497
	.byte	0x5
	.uleb128 0x262
	.long	.LASF1498
	.byte	0x5
	.uleb128 0x264
	.long	.LASF1499
	.byte	0x5
	.uleb128 0x266
	.long	.LASF1500
	.byte	0x5
	.uleb128 0x268
	.long	.LASF1501
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF1502
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF1503
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF1504
	.byte	0x5
	.uleb128 0x270
	.long	.LASF1505
	.byte	0x5
	.uleb128 0x272
	.long	.LASF1506
	.byte	0x5
	.uleb128 0x274
	.long	.LASF1507
	.byte	0x5
	.uleb128 0x276
	.long	.LASF1508
	.byte	0x5
	.uleb128 0x278
	.long	.LASF1509
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF1510
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF1511
	.byte	0x5
	.uleb128 0x27f
	.long	.LASF1512
	.byte	0x5
	.uleb128 0x281
	.long	.LASF1513
	.byte	0x5
	.uleb128 0x283
	.long	.LASF1514
	.byte	0x5
	.uleb128 0x285
	.long	.LASF1515
	.byte	0x5
	.uleb128 0x287
	.long	.LASF1516
	.byte	0x5
	.uleb128 0x289
	.long	.LASF1517
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF1518
	.byte	0x5
	.uleb128 0x28d
	.long	.LASF1519
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF1520
	.byte	0x5
	.uleb128 0x291
	.long	.LASF1521
	.byte	0x5
	.uleb128 0x293
	.long	.LASF1522
	.byte	0x5
	.uleb128 0x295
	.long	.LASF1523
	.byte	0x5
	.uleb128 0x297
	.long	.LASF1524
	.byte	0x5
	.uleb128 0x299
	.long	.LASF1525
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF1526
	.byte	0x5
	.uleb128 0x29d
	.long	.LASF1527
	.byte	0x5
	.uleb128 0x2a0
	.long	.LASF1528
	.byte	0x5
	.uleb128 0x2a2
	.long	.LASF1529
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sched.h.20.03e66e3b847677c1e781b90f4b73f77e,comdat
.Ldebug_macro68:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1533
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF453
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sched.h.31.f838e85546a76474a8c4ae9ddad27ef3,comdat
.Ldebug_macro69:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF638
	.byte	0x5
	.uleb128 0x20
	.long	.LASF662
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sched.h.28.25eb17a9847efe42b26af9ba02dfcd4f,comdat
.Ldebug_macro70:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1534
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1535
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1536
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1537
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF1538
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1539
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1540
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1541
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1542
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1543
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1544
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1545
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1546
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1547
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1548
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1549
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1550
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1551
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1552
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1553
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.26.6a3cabd4f228e226db6723a3b0c81ba6,comdat
.Ldebug_macro71:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1555
	.byte	0x5
	.uleb128 0x23
	.long	.LASF453
	.byte	0x5
	.uleb128 0x24
	.long	.LASF455
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.40.ef4cac57544640468516e1691b64cd57,comdat
.Ldebug_macro72:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1556
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1557
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1558
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1559
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1560
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1561
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1562
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1563
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1564
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1565
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1566
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1567
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1568
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1569
	.byte	0x6
	.uleb128 0x65
	.long	.LASF666
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.8498996832d25894c9c8b3ca182c99ab,comdat
.Ldebug_macro73:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF642
	.byte	0x6
	.uleb128 0x52
	.long	.LASF644
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF646
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF648
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF649
	.byte	0x5
	.uleb128 0x136
	.long	.LASF1570
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthread.h.35.4f9cb94142f84ba1b6ddc012cb580952,comdat
.Ldebug_macro74:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1572
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1573
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1574
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1575
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1576
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1577
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1578
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1579
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF1580
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1581
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1582
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1583
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1584
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1585
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1586
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1587
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF1588
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1589
	.byte	0x5
	.uleb128 0x217
	.long	.LASF1590
	.byte	0x5
	.uleb128 0x298
	.long	.LASF1591
	.byte	0x5
	.uleb128 0x2ad
	.long	.LASF1592
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.21.234adedf0a908ba1512bb39778d0c13a,comdat
.Ldebug_macro75:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x15
	.long	.LASF1595
	.byte	0x6
	.uleb128 0x16
	.long	.LASF1596
	.byte	0x6
	.uleb128 0x17
	.long	.LASF1597
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errnobase.h.2.3ec77d86fa6012e288bd2eb28191253f,comdat
.Ldebug_macro76:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1599
	.byte	0x5
	.uleb128 0x4
	.long	.LASF1600
	.byte	0x5
	.uleb128 0x5
	.long	.LASF1601
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1602
	.byte	0x5
	.uleb128 0x7
	.long	.LASF1603
	.byte	0x5
	.uleb128 0x8
	.long	.LASF1604
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1605
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1606
	.byte	0x5
	.uleb128 0xb
	.long	.LASF1607
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1608
	.byte	0x5
	.uleb128 0xd
	.long	.LASF1609
	.byte	0x5
	.uleb128 0xe
	.long	.LASF1610
	.byte	0x5
	.uleb128 0xf
	.long	.LASF1611
	.byte	0x5
	.uleb128 0x10
	.long	.LASF1612
	.byte	0x5
	.uleb128 0x11
	.long	.LASF1613
	.byte	0x5
	.uleb128 0x12
	.long	.LASF1614
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1615
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1616
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1617
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1618
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1619
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1620
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1621
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1622
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1623
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1624
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1625
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1626
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1627
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1628
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1629
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1630
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1631
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1632
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1633
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.6.6707cf97e82b783d19d3d077217dd04e,comdat
.Ldebug_macro77:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1634
	.byte	0x5
	.uleb128 0x7
	.long	.LASF1635
	.byte	0x5
	.uleb128 0x8
	.long	.LASF1636
	.byte	0x5
	.uleb128 0x11
	.long	.LASF1637
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1638
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1639
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1640
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1641
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1642
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1643
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1644
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1645
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1646
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1647
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1648
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1649
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1650
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1651
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1652
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1653
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1654
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1655
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1656
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1657
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1658
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1659
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1660
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1661
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1662
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1663
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1664
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1665
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1666
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1667
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1668
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1669
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1670
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1671
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1672
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1673
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1674
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1675
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1676
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1677
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1678
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1680
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1681
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1683
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1684
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1685
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1686
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1687
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1688
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1689
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1690
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1691
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1692
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1693
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1694
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1695
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1696
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1697
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1698
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1699
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1700
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1701
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1702
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1703
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1704
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1705
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1706
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1707
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1708
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1709
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1710
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1711
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1712
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1713
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1714
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1715
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1716
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1717
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1718
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1719
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1720
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1721
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1722
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1723
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1724
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1725
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1726
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1727
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1728
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1729
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1730
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1731
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1732
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.27.5f4b88dc9507696aecbaa61ffb4828e0,comdat
.Ldebug_macro78:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1733
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1734
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.termios.h.27.c5da1840ab18d5828f3c6f72c2a620b9,comdat
.Ldebug_macro79:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1737
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1738
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1739
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1740
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1741
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1742
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1743
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1744
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1745
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1746
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1747
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1748
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1749
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1750
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1751
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1752
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1753
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1754
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1755
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1756
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1757
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1758
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1759
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1760
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1761
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1762
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1763
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1764
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1765
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1766
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1767
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1768
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1769
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1770
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1771
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1772
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1773
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1774
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1775
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1776
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1777
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1778
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1779
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1780
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1781
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1782
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1783
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1784
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1785
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1786
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1787
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1788
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1789
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1790
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1791
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1792
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1793
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1794
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1795
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1796
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1797
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1798
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1799
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1800
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1801
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1802
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1803
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1804
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1805
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF1806
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1807
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1808
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1809
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1810
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1811
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1812
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1813
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1814
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1815
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1816
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1817
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1818
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1819
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1820
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1821
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1822
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1823
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1824
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1825
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1826
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1827
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1828
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1829
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1830
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1831
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1832
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1833
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1834
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1835
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF1836
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1837
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF1838
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1839
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1840
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1841
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1842
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1843
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1844
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1845
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1846
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1847
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1848
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1849
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1850
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1851
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1852
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF1853
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1854
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1855
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1856
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1857
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1858
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1859
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1860
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1861
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1862
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1863
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1864
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF1865
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1866
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1867
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1868
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1869
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF1870
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1871
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF1872
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1873
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1874
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1875
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1876
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1877
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1878
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1879
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ttydefaults.h.41.76470547474c31dba482768bc6c29e71,comdat
.Ldebug_macro80:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1881
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1882
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1883
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1884
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1885
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1886
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1887
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1888
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1889
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1890
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1891
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1892
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1893
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1894
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1895
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1896
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1897
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1898
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1899
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1900
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1901
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1902
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1903
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1904
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1905
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1906
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1907
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1908
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.serial_uart.h.29.6d94afffc0f17bc1914eb542c7f4e096,comdat
.Ldebug_macro81:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1909
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1910
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1911
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1912
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1913
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1914
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1915
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1916
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1917
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1918
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1919
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF682:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF617:
	.string	"__ldiv_t_defined 1"
.LASF1545:
	.string	"__CPU_SET_S(cpu,setsize,cpusetp) (__extension__ ({ size_t __cpu = (cpu); __cpu / 8 < (setsize) ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] |= __CPUMASK (__cpu)) : 0; }))"
.LASF1160:
	.string	"_POSIX_THREADS 200809L"
.LASF1070:
	.string	"__S_IFDIR 0040000"
.LASF1804:
	.string	"B0 0000000"
.LASF1718:
	.string	"ENAVAIL 119"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF774:
	.string	"I2C2_SCL_GPIO GPIOA"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF818:
	.string	"BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))"
.LASF692:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF1212:
	.string	"__ILP32_OFF32_CFLAGS \"-m32\""
.LASF1169:
	.string	"_POSIX_THREAD_ROBUST_PRIO_PROTECT -1"
.LASF1753:
	.string	"VDISCARD 13"
.LASF1161:
	.string	"_POSIX_REENTRANT_FUNCTIONS 1"
.LASF1291:
	.string	"_SC_LINE_MAX _SC_LINE_MAX"
.LASF1339:
	.string	"_SC_XOPEN_XCU_VERSION _SC_XOPEN_XCU_VERSION"
.LASF1372:
	.string	"_SC_NL_SETMAX _SC_NL_SETMAX"
.LASF483:
	.string	"_WCHAR_T_DEFINED "
.LASF1007:
	.string	"F_GETLK 5"
.LASF1903:
	.string	"CWERASE CTRL('w')"
.LASF653:
	.string	"_SYS_SELECT_H 1"
.LASF1249:
	.string	"_SC_CLK_TCK _SC_CLK_TCK"
.LASF1247:
	.string	"_SC_ARG_MAX _SC_ARG_MAX"
.LASF1650:
	.string	"EL2HLT 51"
.LASF1452:
	.string	"_SC_V7_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG"
.LASF1954:
	.string	"rxBufferSize"
.LASF786:
	.string	"MPU6500_CS_GPIO_CLK_PERIPHERAL RCC_AHBPeriph_GPIOA"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF337:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF1980:
	.string	"buffering"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF1723:
	.string	"EMEDIUMTYPE 124"
.LASF1593:
	.string	"MRAA_UART_OW_ROMCODE_SIZE 8"
.LASF735:
	.string	"USE_GYRO_MPU6500 "
.LASF263:
	.string	"__USE_POSIX199506"
.LASF1286:
	.string	"_SC_BC_SCALE_MAX _SC_BC_SCALE_MAX"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF539:
	.string	"__SQUAD_TYPE long int"
.LASF1554:
	.string	"sched_priority __sched_priority"
.LASF1919:
	.string	"NUM_THREADS 2"
.LASF892:
	.string	"_IO_va_list __gnuc_va_list"
.LASF718:
	.string	"HW_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF1971:
	.string	"setMode"
.LASF299:
	.string	"__USE_MISC 1"
.LASF521:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1191:
	.string	"_POSIX_MESSAGE_PASSING 200809L"
.LASF1034:
	.string	"F_SHLCK 8"
.LASF1137:
	.string	"_XOPEN_XPG2 1"
.LASF1182:
	.string	"_POSIX_THREAD_CPUTIME 0"
.LASF322:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF1111:
	.string	"R_OK 4"
.LASF632:
	.string	"__pid_t_defined "
.LASF1318:
	.string	"_SC_GETGR_R_SIZE_MAX _SC_GETGR_R_SIZE_MAX"
.LASF355:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF1483:
	.string	"_CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS"
.LASF1774:
	.string	"ONLCR 0000004"
.LASF1612:
	.string	"EACCES 13"
.LASF1063:
	.string	"st_atime st_atim.tv_sec"
.LASF500:
	.string	"WNOWAIT 0x01000000"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF1708:
	.string	"ETOOMANYREFS 109"
.LASF385:
	.string	"_BITS_WCHAR_H 1"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF1949:
	.string	"vTable"
.LASF796:
	.string	"ADC0_CHANNEL ADC_Channel_1"
.LASF782:
	.string	"I2C2_SDA_PIN_SOURCE GPIO_PinSource10"
.LASF1067:
	.string	"_STATBUF_ST_RDEV "
.LASF1976:
	.string	"_Bool"
.LASF365:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF1867:
	.string	"IEXTEN 0100000"
.LASF1737:
	.string	"NCCS 32"
.LASF1278:
	.string	"_SC_PAGE_SIZE _SC_PAGESIZE"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF1487:
	.string	"_CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS"
.LASF1540:
	.string	"__CPU_SETSIZE 1024"
.LASF690:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF310:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF1563:
	.string	"CLOCK_REALTIME_COARSE 5"
.LASF1798:
	.string	"FF1 0100000"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF349:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF1401:
	.string	"_SC_NETWORKING _SC_NETWORKING"
.LASF942:
	.string	"_IO_file_flags _flags"
.LASF1608:
	.string	"EBADF 9"
.LASF1279:
	.string	"_SC_RTSIG_MAX _SC_RTSIG_MAX"
.LASF1302:
	.string	"_SC_PII_XTI _SC_PII_XTI"
.LASF1691:
	.string	"ENOPROTOOPT 92"
.LASF1961:
	.string	"txBufferTail"
.LASF1940:
	.string	"SERIAL_NOT_INVERTED"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF811:
	.string	"TARGET_IO_PORTA 0xffff"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF916:
	.string	"_IO_TIED_PUT_GET 0x400"
.LASF1188:
	.string	"_POSIX_SPAWN 200809L"
.LASF1640:
	.string	"EWOULDBLOCK EAGAIN"
.LASF900:
	.string	"_IOS_NOCREATE 32"
.LASF940:
	.string	"_IO_DONT_CLOSE 0100000"
.LASF1704:
	.string	"ENOBUFS 105"
.LASF475:
	.string	"__WCHAR_T__ "
.LASF1651:
	.string	"EBADE 52"
.LASF494:
	.string	"_STDLIB_H 1"
.LASF1412:
	.string	"_SC_SYSTEM_DATABASE_R _SC_SYSTEM_DATABASE_R"
.LASF488:
	.string	"_WCHAR_T_DECLARED "
.LASF889:
	.string	"__need___va_list"
.LASF1671:
	.string	"EMULTIHOP 72"
.LASF680:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF1310:
	.string	"_SC_PII_INTERNET_STREAM _SC_PII_INTERNET_STREAM"
.LASF1623:
	.string	"EMFILE 24"
.LASF708:
	.string	"_STDBOOL_H "
.LASF955:
	.string	"_IO_flockfile(_fp) "
.LASF1599:
	.string	"_ASM_GENERIC_ERRNO_BASE_H "
.LASF1675:
	.string	"ENOTUNIQ 76"
.LASF807:
	.string	"ALIENFLIGHT "
.LASF1865:
	.string	"FLUSHO 0010000"
.LASF1424:
	.string	"_SC_2_PBS_CHECKPOINT _SC_2_PBS_CHECKPOINT"
.LASF1916:
	.string	"UART4_TX_BUFFER_SIZE 256"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF335:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF1491:
	.string	"_CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS"
.LASF1260:
	.string	"_SC_PRIORITIZED_IO _SC_PRIORITIZED_IO"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF1926:
	.string	"uint16_t"
.LASF1159:
	.string	"_XOPEN_SHM 1"
.LASF531:
	.string	"_BITS_BYTESWAP_H 1"
.LASF237:
	.string	"linux 1"
.LASF1965:
	.string	"serialWrite"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF585:
	.string	"__FD_SETSIZE 1024"
.LASF547:
	.string	"__STD_TYPE typedef"
.LASF1914:
	.string	"UART3_TX_BUFFER_SIZE 256"
.LASF1544:
	.string	"__CPU_ZERO_S(setsize,cpusetp) do __builtin_memset (cpusetp, '\\0', setsize); while (0)"
.LASF681:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF1920:
	.string	"USB_TIMEOUT 50"
.LASF312:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF957:
	.string	"_IO_ftrylockfile(_fp) "
.LASF1114:
	.string	"F_OK 0"
.LASF1654:
	.string	"ENOANO 55"
.LASF1306:
	.string	"_SC_POLL _SC_POLL"
.LASF1683:
	.string	"EILSEQ 84"
.LASF696:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF605:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF1837:
	.string	"B460800 0010004"
.LASF1617:
	.string	"EXDEV 18"
.LASF1596:
	.string	"EILSEQ"
.LASF772:
	.string	"USE_I2C "
.LASF829:
	.string	"_T_PTRDIFF_ "
.LASF1230:
	.string	"_PC_PATH_MAX _PC_PATH_MAX"
.LASF701:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF1622:
	.string	"ENFILE 23"
.LASF419:
	.string	"INT_FAST8_MAX (127)"
.LASF1105:
	.string	"S_IXGRP (S_IXUSR >> 3)"
.LASF536:
	.string	"__U32_TYPE unsigned int"
.LASF987:
	.string	"O_WRONLY 01"
.LASF921:
	.string	"_IO_USER_LOCK 0x8000"
.LASF1526:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS"
.LASF1986:
	.string	"usbVcpAvailable"
.LASF1667:
	.string	"EADV 68"
.LASF1518:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS"
.LASF1197:
	.string	"_POSIX_RAW_SOCKETS 200809L"
.LASF1763:
	.string	"INLCR 0000100"
.LASF919:
	.string	"_IO_IS_FILEBUF 0x2000"
.LASF965:
	.string	"SEEK_SET 0"
.LASF1719:
	.string	"EISNAM 120"
.LASF743:
	.string	"ACC_MPU6050_ALIGN CW270_DEG"
.LASF274:
	.string	"__USE_MISC"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF654:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF1233:
	.string	"_PC_NO_TRUNC _PC_NO_TRUNC"
.LASF1287:
	.string	"_SC_BC_STRING_MAX _SC_BC_STRING_MAX"
.LASF516:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF960:
	.string	"_VA_LIST_DEFINED "
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF629:
	.string	"__nlink_t_defined "
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1185:
	.string	"_POSIX_SHELL 1"
.LASF1155:
	.string	"_POSIX_VDISABLE '\\0'"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF474:
	.string	"__wchar_t__ "
.LASF227:
	.string	"__code_model_small__ 1"
.LASF904:
	.string	"_OLD_STDIO_MAGIC 0xFABC0000"
.LASF1083:
	.string	"__S_IREAD 0400"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF996:
	.string	"O_SYNC 04010000"
.LASF265:
	.string	"__USE_XOPEN_EXTENDED"
.LASF1915:
	.string	"UART4_RX_BUFFER_SIZE 256"
.LASF446:
	.string	"UINT8_C(c) c"
.LASF1207:
	.string	"_POSIX_V6_LPBIG_OFFBIG -1"
.LASF366:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF969:
	.string	"L_tmpnam 20"
.LASF556:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF1397:
	.string	"_SC_FILE_SYSTEM _SC_FILE_SYSTEM"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF1864:
	.string	"ECHOKE 0004000"
.LASF990:
	.string	"O_EXCL 0200"
.LASF766:
	.string	"UART3_TX_PIN GPIO_Pin_10"
.LASF1524:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS"
.LASF1289:
	.string	"_SC_EQUIV_CLASS_MAX _SC_EQUIV_CLASS_MAX"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF603:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF1050:
	.string	"POSIX_FADV_DONTNEED __POSIX_FADV_DONTNEED"
.LASF1863:
	.string	"ECHOPRT 0002000"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF1400:
	.string	"_SC_SINGLE_PROCESS _SC_SINGLE_PROCESS"
.LASF1496:
	.string	"_CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS"
.LASF584:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF924:
	.string	"_IO_FLAGS2_USER_WBUF 8"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF1011:
	.string	"O_NOFOLLOW __O_NOFOLLOW"
.LASF1928:
	.string	"uint32_t"
.LASF644:
	.string	"__need_time_t"
.LASF1539:
	.string	"__cpu_set_t_defined "
.LASF1841:
	.string	"B1000000 0010010"
.LASF1047:
	.string	"POSIX_FADV_RANDOM 1"
.LASF1108:
	.string	"S_IWOTH (S_IWGRP >> 3)"
.LASF1121:
	.string	"MRAA_SUB_PLATFORM_BIT_SHIFT 9"
.LASF679:
	.string	"_SYS_SYSMACROS_H 1"
.LASF467:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF847:
	.string	"BIT(x) (1 << (x))"
.LASF1589:
	.string	"PTHREAD_BARRIER_SERIAL_THREAD -1"
.LASF1834:
	.string	"B57600 0010001"
.LASF1958:
	.string	"rxBufferHead"
.LASF423:
	.string	"UINT_FAST8_MAX (255)"
.LASF650:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF1025:
	.string	"__F_GETSIG 11"
.LASF1019:
	.string	"F_SETFL 4"
.LASF1201:
	.string	"_POSIX_TRACE -1"
.LASF1057:
	.string	"__OPEN_NEEDS_MODE(oflag) (((oflag) & O_CREAT) != 0 || ((oflag) & __O_TMPFILE) == __O_TMPFILE)"
.LASF1828:
	.string	"CREAD 0000200"
.LASF1638:
	.string	"ENOTEMPTY 39"
.LASF1548:
	.string	"__CPU_COUNT_S(setsize,cpusetp) __sched_cpucount (setsize, cpusetp)"
.LASF952:
	.string	"_IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF1259:
	.string	"_SC_ASYNCHRONOUS_IO _SC_ASYNCHRONOUS_IO"
.LASF1973:
	.string	"beginWrite"
.LASF1138:
	.string	"_XOPEN_XPG3 1"
.LASF1018:
	.string	"F_GETFL 3"
.LASF485:
	.string	"___int_wchar_t_h "
.LASF798:
	.string	"ADC_BATTERY ADC_CHANNEL0"
.LASF1616:
	.string	"EEXIST 17"
.LASF1223:
	.string	"L_SET SEEK_SET"
.LASF256:
	.string	"__USE_ISOC11"
.LASF720:
	.string	"LED0_PIN Pin_4"
.LASF1714:
	.string	"EINPROGRESS 115"
.LASF886:
	.string	"_IO_va_list _G_va_list"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF1058:
	.string	"_BITS_STAT_H 1"
.LASF1436:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE _SC_LEVEL1_ICACHE_LINESIZE"
.LASF1820:
	.string	"EXTA B19200"
.LASF1127:
	.string	"_POSIX_VERSION 200809L"
.LASF925:
	.string	"_IO_SKIPWS 01"
.LASF1109:
	.string	"S_IXOTH (S_IXGRP >> 3)"
.LASF1983:
	.string	"usbVcpSetBaudRate"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF747:
	.string	"MAG_AK8963_ALIGN CW0_DEG_FLIP"
.LASF724:
	.string	"LED1_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF1180:
	.string	"_POSIX_SHARED_MEMORY_OBJECTS 200809L"
.LASF1107:
	.string	"S_IROTH (S_IRGRP >> 3)"
.LASF767:
	.string	"UART3_RX_PIN GPIO_Pin_11"
.LASF1981:
	.string	"vcpPort_t"
.LASF393:
	.string	"INT32_MIN (-2147483647-1)"
.LASF1655:
	.string	"EBADRQC 56"
.LASF1147:
	.string	"_POSIX_PRIORITY_SCHEDULING 200809L"
.LASF689:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF844:
	.string	"STR(x) STR_HELPER(x)"
.LASF1177:
	.string	"_LFS_LARGEFILE 1"
.LASF1110:
	.string	"S_IRWXO (S_IRWXG >> 3)"
.LASF1238:
	.string	"_PC_SOCK_MAXBUF _PC_SOCK_MAXBUF"
.LASF1746:
	.string	"VMIN 6"
.LASF543:
	.string	"__SLONG32_TYPE int"
.LASF930:
	.string	"_IO_OCT 040"
.LASF1316:
	.string	"_SC_THREADS _SC_THREADS"
.LASF1292:
	.string	"_SC_RE_DUP_MAX _SC_RE_DUP_MAX"
.LASF1676:
	.string	"EBADFD 77"
.LASF1369:
	.string	"_SC_NL_LANGMAX _SC_NL_LANGMAX"
.LASF1192:
	.string	"_POSIX_THREAD_PROCESS_SHARED 200809L"
.LASF1458:
	.string	"_SC_TRACE_SYS_MAX _SC_TRACE_SYS_MAX"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF908:
	.string	"_IO_NO_READS 4"
.LASF714:
	.string	"_XLOCALE_H 1"
.LASF779:
	.string	"I2C2_SDA_GPIO GPIOA"
.LASF415:
	.string	"INT_FAST8_MIN (-128)"
.LASF607:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF1896:
	.string	"CSUSP CTRL('z')"
.LASF1321:
	.string	"_SC_TTY_NAME_MAX _SC_TTY_NAME_MAX"
.LASF1527:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS"
.LASF566:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1367:
	.string	"_SC_USHRT_MAX _SC_USHRT_MAX"
.LASF1449:
	.string	"_SC_IPV6 _SC_IPV6"
.LASF511:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF339:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF542:
	.string	"__UWORD_TYPE unsigned long int"
.LASF1665:
	.string	"EREMOTE 66"
.LASF1237:
	.string	"_PC_PRIO_IO _PC_PRIO_IO"
.LASF1454:
	.string	"_SC_V7_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG"
.LASF1381:
	.string	"_SC_ADVISORY_INFO _SC_ADVISORY_INFO"
.LASF599:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF1122:
	.string	"MRAA_SUB_PLATFORM_MASK (1<<MRAA_SUB_PLATFORM_BIT_SHIFT)"
.LASF997:
	.string	"O_FSYNC O_SYNC"
.LASF1699:
	.string	"ENETDOWN 100"
.LASF1619:
	.string	"ENOTDIR 20"
.LASF1871:
	.string	"TCIOFF 2"
.LASF1568:
	.string	"CLOCK_TAI 11"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF372:
	.string	"__stub_chflags "
.LASF1734:
	.string	"errno (*__errno_location ())"
.LASF1536:
	.string	"SCHED_RR 2"
.LASF882:
	.string	"_IO_uid_t __uid_t"
.LASF895:
	.string	"_IOS_INPUT 1"
.LASF1843:
	.string	"B1500000 0010012"
.LASF764:
	.string	"UART2_TX_PINSOURCE GPIO_PinSource2"
.LASF866:
	.string	"____mbstate_t_defined 1"
.LASF1621:
	.string	"EINVAL 22"
.LASF1626:
	.string	"EFBIG 27"
.LASF515:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF1438:
	.string	"_SC_LEVEL1_DCACHE_ASSOC _SC_LEVEL1_DCACHE_ASSOC"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF871:
	.string	"_G_HAVE_MREMAP 1"
.LASF442:
	.string	"INT8_C(c) c"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF1642:
	.string	"EIDRM 43"
.LASF470:
	.string	"_GCC_SIZE_T "
.LASF381:
	.string	"__stub_setlogin "
.LASF1936:
	.string	"MODE_TX"
.LASF1277:
	.string	"_SC_PAGESIZE _SC_PAGESIZE"
.LASF1035:
	.string	"LOCK_SH 1"
.LASF815:
	.string	"TARGET_IO_PORTF (BIT(0)|BIT(1)|BIT(4))"
.LASF1464:
	.string	"_CS_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1419:
	.string	"_SC_2_PBS_LOCATE _SC_2_PBS_LOCATE"
.LASF1065:
	.string	"st_ctime st_ctim.tv_sec"
.LASF384:
	.string	"__stub_stty "
.LASF361:
	.string	"__WORDSIZE 64"
.LASF1735:
	.string	"__need_Emath"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF1473:
	.string	"_CS_LFS_LDFLAGS _CS_LFS_LDFLAGS"
.LASF1199:
	.string	"_POSIX_SPORADIC_SERVER -1"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF1435:
	.string	"_SC_LEVEL1_ICACHE_ASSOC _SC_LEVEL1_ICACHE_ASSOC"
.LASF444:
	.string	"INT32_C(c) c"
.LASF630:
	.string	"__uid_t_defined "
.LASF1101:
	.string	"S_IXUSR __S_IEXEC"
.LASF319:
	.string	"__long_double_t long double"
.LASF1037:
	.string	"LOCK_NB 4"
.LASF1602:
	.string	"ESRCH 3"
.LASF1805:
	.string	"B50 0000001"
.LASF326:
	.string	"__END_NAMESPACE_C99 "
.LASF1208:
	.string	"_XBS5_LPBIG_OFFBIG -1"
.LASF1148:
	.string	"_POSIX_SYNCHRONIZED_IO 200809L"
.LASF1088:
	.string	"S_IFMT __S_IFMT"
.LASF1297:
	.string	"_SC_2_FORT_DEV _SC_2_FORT_DEV"
.LASF512:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF1377:
	.string	"_SC_XBS5_LPBIG_OFFBIG _SC_XBS5_LPBIG_OFFBIG"
.LASF535:
	.string	"__S32_TYPE int"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF1881:
	.string	"_SYS_TTYDEFAULTS_H_ "
.LASF1768:
	.string	"IXANY 0004000"
.LASF1414:
	.string	"_SC_TYPED_MEMORY_OBJECTS _SC_TYPED_MEMORY_OBJECTS"
.LASF1006:
	.string	"__O_TMPFILE (020000000 | __O_DIRECTORY)"
.LASF1829:
	.string	"PARENB 0000400"
.LASF588:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF1094:
	.string	"S_IFLNK __S_IFLNK"
.LASF468:
	.string	"_SIZE_T_DECLARED "
.LASF301:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF742:
	.string	"USE_ACC_SPI_MPU6500 "
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF466:
	.string	"_SIZE_T_DEFINED "
.LASF659:
	.string	"_SIGSET_H_types 1"
.LASF1501:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS"
.LASF1531:
	.string	"__need_getopt"
.LASF1024:
	.string	"__F_SETSIG 10"
.LASF849:
	.string	"BX_(x) ((x) - (((x)>>1)&0x77777777) - (((x)>>2)&0x33333333) - (((x)>>3)&0x11111111))"
.LASF887:
	.string	"_IO_wint_t wint_t"
.LASF739:
	.string	"ACC "
.LASF1129:
	.string	"_POSIX2_VERSION __POSIX2_THIS_VERSION"
.LASF346:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF717:
	.string	"HW_PIN Pin_2"
.LASF378:
	.string	"__stub_lchmod "
.LASF1338:
	.string	"_SC_XOPEN_VERSION _SC_XOPEN_VERSION"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF529:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF476:
	.string	"_WCHAR_T "
.LASF1430:
	.string	"_SC_TRACE _SC_TRACE"
.LASF873:
	.string	"_G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF1679:
	.string	"ELIBBAD 80"
.LASF1078:
	.string	"__S_TYPEISSEM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF1423:
	.string	"_SC_STREAMS _SC_STREAMS"
.LASF1695:
	.string	"EPFNOSUPPORT 96"
.LASF870:
	.string	"_G_HAVE_MMAP 1"
.LASF1115:
	.string	"F_ULOCK 0"
.LASF1778:
	.string	"OFILL 0000100"
.LASF981:
	.string	"__O_LARGEFILE 0"
.LASF1801:
	.string	"VT1 0040000"
.LASF704:
	.string	"alloca"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF835:
	.string	"_GCC_PTRDIFF_T "
.LASF1962:
	.string	"callback"
.LASF424:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF460:
	.string	"_T_SIZE_ "
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF1504:
	.string	"_CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS"
.LASF441:
	.string	"WINT_MAX (4294967295u)"
.LASF1816:
	.string	"B4800 0000014"
.LASF1187:
	.string	"_POSIX_SPIN_LOCKS 200809L"
.LASF1853:
	.string	"ISIG 0000001"
.LASF1594:
	.string	"_ERRNO_H 1"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF711:
	.string	"false 0"
.LASF1198:
	.string	"_POSIX2_CHAR_TERM 200809L"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF1987:
	.string	"usbVcpRead"
.LASF1846:
	.string	"B3000000 0010015"
.LASF1126:
	.string	"_UNISTD_H 1"
.LASF291:
	.string	"__USE_POSIX 1"
.LASF1139:
	.string	"_XOPEN_XPG4 1"
.LASF260:
	.string	"__USE_POSIX"
.LASF1356:
	.string	"_SC_WORD_BIT _SC_WORD_BIT"
.LASF1365:
	.string	"_SC_UINT_MAX _SC_UINT_MAX"
.LASF373:
	.string	"__stub_fattach "
.LASF627:
	.string	"__gid_t_defined "
.LASF1618:
	.string	"ENODEV 19"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF1004:
	.string	"__O_PATH 010000000"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF1390:
	.string	"_SC_DEVICE_SPECIFIC _SC_DEVICE_SPECIFIC"
.LASF284:
	.string	"__USE_ISOC99 1"
.LASF1239:
	.string	"_PC_FILESIZEBITS _PC_FILESIZEBITS"
.LASF287:
	.string	"_POSIX_SOURCE"
.LASF472:
	.string	"__size_t "
.LASF1960:
	.string	"txBufferHead"
.LASF422:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1263:
	.string	"_SC_MAPPED_FILES _SC_MAPPED_FILES"
.LASF1403:
	.string	"_SC_SPIN_LOCKS _SC_SPIN_LOCKS"
.LASF716:
	.string	"HW_GPIO GPIOB"
.LASF1951:
	.string	"mode"
.LASF1052:
	.string	"AT_FDCWD -100"
.LASF958:
	.string	"_IO_cleanup_region_start(_fct,_fp) "
.LASF1140:
	.string	"_XOPEN_UNIX 1"
.LASF332:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF1502:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF360:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF1029:
	.string	"FD_CLOEXEC 1"
.LASF824:
	.string	"REQUIRE_PRINTF_LONG_SUPPORT "
.LASF988:
	.string	"O_RDWR 02"
.LASF765:
	.string	"UART2_RX_PINSOURCE GPIO_PinSource3"
.LASF1738:
	.string	"_HAVE_STRUCT_TERMIOS_C_ISPEED 1"
.LASF1348:
	.string	"_SC_XOPEN_XPG3 _SC_XOPEN_XPG3"
.LASF1684:
	.string	"ERESTART 85"
.LASF1325:
	.string	"_SC_THREAD_THREADS_MAX _SC_THREAD_THREADS_MAX"
.LASF1134:
	.string	"_POSIX2_LOCALEDEF __POSIX2_THIS_VERSION"
.LASF1341:
	.string	"_SC_XOPEN_CRYPT _SC_XOPEN_CRYPT"
.LASF1560:
	.string	"CLOCK_PROCESS_CPUTIME_ID 2"
.LASF842:
	.string	"CONCAT(x,y) CONCAT_HELPER(x, y)"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF1854:
	.string	"ICANON 0000002"
.LASF936:
	.string	"_IO_SCIENTIFIC 04000"
.LASF1096:
	.string	"S_ISUID __S_ISUID"
.LASF217:
	.string	"__amd64 1"
.LASF1448:
	.string	"_SC_LEVEL4_CACHE_LINESIZE _SC_LEVEL4_CACHE_LINESIZE"
.LASF1586:
	.string	"PTHREAD_CANCEL_ASYNCHRONOUS PTHREAD_CANCEL_ASYNCHRONOUS"
.LASF1814:
	.string	"B1800 0000012"
.LASF1924:
	.string	"unsigned char"
.LASF1803:
	.string	"CBAUD 0010017"
.LASF613:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF416:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF1786:
	.string	"CR2 0002000"
.LASF1556:
	.string	"_BITS_TIME_H 1"
.LASF1904:
	.string	"CREPRINT CTRL('r')"
.LASF1462:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT _SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF978:
	.string	"getc(_fp) _IO_getc (_fp)"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF836:
	.string	"_PTRDIFF_T_DECLARED "
.LASF1275:
	.string	"_SC_MQ_PRIO_MAX _SC_MQ_PRIO_MAX"
.LASF845:
	.string	"EXPAND_I(x) x"
.LASF1790:
	.string	"TAB1 0004000"
.LASF1459:
	.string	"_SC_TRACE_USER_EVENT_MAX _SC_TRACE_USER_EVENT_MAX"
.LASF225:
	.string	"__k8 1"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF1402:
	.string	"_SC_READER_WRITER_LOCKS _SC_READER_WRITER_LOCKS"
.LASF1851:
	.string	"CMSPAR 010000000000"
.LASF1777:
	.string	"ONLRET 0000040"
.LASF1905:
	.string	"CEOT CEOF"
.LASF1950:
	.string	"identifier"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF773:
	.string	"I2C_DEVICE I2CDEV_6"
.LASF258:
	.string	"__USE_ISOC95"
.LASF257:
	.string	"__USE_ISOC99"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF1232:
	.string	"_PC_CHOWN_RESTRICTED _PC_CHOWN_RESTRICTED"
.LASF1541:
	.string	"__NCPUBITS (8 * sizeof (__cpu_mask))"
.LASF1583:
	.string	"PTHREAD_CANCEL_ENABLE PTHREAD_CANCEL_ENABLE"
.LASF443:
	.string	"INT16_C(c) c"
.LASF1972:
	.string	"writeBuf"
.LASF1162:
	.string	"_POSIX_THREAD_SAFE_FUNCTIONS 200809L"
.LASF733:
	.string	"GYRO "
.LASF1219:
	.string	"STDOUT_FILENO 1"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1605:
	.string	"ENXIO 6"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF793:
	.string	"ADC_AHB_PERIPHERAL RCC_AHBPeriph_DMA2"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF1812:
	.string	"B600 0000010"
.LASF220:
	.string	"__x86_64__ 1"
.LASF790:
	.string	"USE_ADC "
.LASF828:
	.string	"_PTRDIFF_T "
.LASF1466:
	.string	"_CS_GNU_LIBC_VERSION _CS_GNU_LIBC_VERSION"
.LASF369:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF1857:
	.string	"ECHOE 0000020"
.LASF527:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF267:
	.string	"__USE_XOPEN2K"
.LASF819:
	.string	"STATIC_UNIT_TESTED static"
.LASF1603:
	.string	"EINTR 4"
.LASF1974:
	.string	"endWrite"
.LASF313:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF239:
	.string	"__unix__ 1"
.LASF1736:
	.string	"_TERMIOS_H 1"
.LASF1855:
	.string	"XCASE 0000004"
.LASF1688:
	.string	"EDESTADDRREQ 89"
.LASF1901:
	.string	"CLNEXT CTRL('v')"
.LASF601:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF1577:
	.string	"PTHREAD_EXPLICIT_SCHED PTHREAD_EXPLICIT_SCHED"
.LASF1028:
	.string	"F_DUPFD_CLOEXEC 1030"
.LASF1235:
	.string	"_PC_SYNC_IO _PC_SYNC_IO"
.LASF1144:
	.string	"_BITS_POSIX_OPT_H 1"
.LASF411:
	.string	"UINT_LEAST8_MAX (255)"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1859:
	.string	"ECHONL 0000100"
.LASF1481:
	.string	"_CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS"
.LASF899:
	.string	"_IOS_TRUNC 16"
.LASF350:
	.string	"__wur "
.LASF855:
	.string	"_STDIO_H 1"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF1870:
	.string	"TCOON 1"
.LASF514:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF1498:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS"
.LASF778:
	.string	"I2C2_SCL_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF905:
	.string	"_IO_MAGIC_MASK 0xFFFF0000"
.LASF1068:
	.string	"_STATBUF_ST_NSEC "
.LASF914:
	.string	"_IO_IN_BACKUP 0x100"
.LASF506:
	.string	"P_PID"
.LASF1323:
	.string	"_SC_THREAD_KEYS_MAX _SC_THREAD_KEYS_MAX"
.LASF641:
	.string	"__clock_t_defined 1"
.LASF663:
	.string	"__timespec_defined 1"
.LASF283:
	.string	"_DEFAULT_SOURCE 1"
.LASF482:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1368:
	.string	"_SC_NL_ARGMAX _SC_NL_ARGMAX"
.LASF558:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF505:
	.string	"P_ALL"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF863:
	.string	"_IO_STDIO_H "
.LASF1411:
	.string	"_SC_SYSTEM_DATABASE _SC_SYSTEM_DATABASE"
.LASF1336:
	.string	"_SC_ATEXIT_MAX _SC_ATEXIT_MAX"
.LASF1210:
	.string	"_POSIX_V6_LP64_OFF64 1"
.LASF1889:
	.string	"CEOL _POSIX_VDISABLE"
.LASF321:
	.string	"__END_DECLS "
.LASF1151:
	.string	"_POSIX_MEMLOCK 200809L"
.LASF668:
	.string	"__NFDBITS"
.LASF622:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF781:
	.string	"I2C2_SDA_PIN GPIO_Pin_10"
.LASF390:
	.string	"__intptr_t_defined "
.LASF1682:
	.string	"ELIBEXEC 83"
.LASF398:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF409:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF364:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF376:
	.string	"__stub_getmsg "
.LASF517:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF1882:
	.string	"TTYDEF_IFLAG (BRKINT | ISTRIP | ICRNL | IMAXBEL | IXON | IXANY)"
.LASF1912:
	.string	"UART2_TX_BUFFER_SIZE 256"
.LASF1130:
	.string	"_POSIX2_C_VERSION __POSIX2_THIS_VERSION"
.LASF240:
	.string	"unix 1"
.LASF1687:
	.string	"ENOTSOCK 88"
.LASF1391:
	.string	"_SC_DEVICE_SPECIFIC_R _SC_DEVICE_SPECIFIC_R"
.LASF687:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF1869:
	.string	"TCOOFF 0"
.LASF540:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF1573:
	.string	"PTHREAD_CREATE_DETACHED PTHREAD_CREATE_DETACHED"
.LASF245:
	.string	"EDISON 1"
.LASF1054:
	.string	"AT_REMOVEDIR 0x200"
.LASF270:
	.string	"__USE_XOPEN2K8XSI"
.LASF856:
	.string	"__need_FILE "
.LASF1669:
	.string	"ECOMM 70"
.LASF658:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF647:
	.string	"__timer_t_defined 1"
.LASF1328:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING _SC_THREAD_PRIORITY_SCHEDULING"
.LASF1634:
	.string	"EDEADLK 35"
.LASF426:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF888:
	.string	"__need___va_list "
.LASF1680:
	.string	"ELIBSCN 81"
.LASF1877:
	.string	"TCSADRAIN 1"
.LASF484:
	.string	"_WCHAR_T_H "
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF1969:
	.string	"serialSetBaudRate"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1635:
	.string	"ENAMETOOLONG 36"
.LASF1794:
	.string	"BS0 0000000"
.LASF1968:
	.string	"serialRead"
.LASF520:
	.string	"_ENDIAN_H 1"
.LASF1533:
	.string	"_SCHED_H 1"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF1670:
	.string	"EPROTO 71"
.LASF699:
	.string	"__PTHREAD_SPINS 0, 0"
.LASF1858:
	.string	"ECHOK 0000040"
.LASF1304:
	.string	"_SC_PII_INTERNET _SC_PII_INTERNET"
.LASF448:
	.string	"UINT32_C(c) c ## U"
.LASF748:
	.string	"LED0 "
.LASF402:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF1379:
	.string	"_SC_XOPEN_REALTIME _SC_XOPEN_REALTIME"
.LASF1349:
	.string	"_SC_XOPEN_XPG4 _SC_XOPEN_XPG4"
.LASF1532:
	.string	"_PTHREAD_H 1"
.LASF1609:
	.string	"ECHILD 10"
.LASF1652:
	.string	"EBADR 53"
.LASF1184:
	.string	"_POSIX_READER_WRITER_LOCKS 200809L"
.LASF1600:
	.string	"EPERM 1"
.LASF522:
	.string	"__BIG_ENDIAN 4321"
.LASF1956:
	.string	"rxBuffer"
.LASF1061:
	.string	"_MKNOD_VER_LINUX 0"
.LASF1133:
	.string	"_POSIX2_SW_DEV __POSIX2_THIS_VERSION"
.LASF375:
	.string	"__stub_fdetach "
.LASF1425:
	.string	"_SC_V6_ILP32_OFF32 _SC_V6_ILP32_OFF32"
.LASF1955:
	.string	"txBufferSize"
.LASF1944:
	.string	"SERIAL_PARITY_NO"
.LASF1001:
	.string	"__O_CLOEXEC 02000000"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF279:
	.string	"__KERNEL_STRICT_NAMES"
.LASF706:
	.string	"__COMPAR_FN_T "
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF546:
	.string	"__U64_TYPE unsigned long int"
.LASF1457:
	.string	"_SC_TRACE_NAME_MAX _SC_TRACE_NAME_MAX"
.LASF915:
	.string	"_IO_LINE_BUF 0x200"
.LASF947:
	.string	"_IO_BE(expr,res) __builtin_expect ((expr), res)"
.LASF421:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF570:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF1913:
	.string	"UART3_RX_BUFFER_SIZE 256"
.LASF785:
	.string	"USE_SPI_DEVICE_3 "
.LASF1040:
	.string	"FFSYNC O_FSYNC"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF932:
	.string	"_IO_SHOWBASE 0200"
.LASF508:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF1784:
	.string	"CR0 0000000"
.LASF783:
	.string	"I2C2_SDA_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF1049:
	.string	"POSIX_FADV_WILLNEED 3"
.LASF1831:
	.string	"HUPCL 0002000"
.LASF1039:
	.string	"FAPPEND O_APPEND"
.LASF272:
	.string	"__USE_LARGEFILE64"
.LASF1186:
	.string	"_POSIX_TIMEOUTS 200809L"
.LASF652:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF351:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF1086:
	.string	"UTIME_NOW ((1l << 30) - 1l)"
.LASF17:
	.string	"__LP64__ 1"
.LASF1017:
	.string	"F_SETFD 2"
.LASF534:
	.string	"__U16_TYPE unsigned short int"
.LASF1979:
	.string	"txAt"
.LASF595:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF884:
	.string	"_IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE"
.LASF1404:
	.string	"_SC_REGEXP _SC_REGEXP"
.LASF775:
	.string	"I2C2_SCL_GPIO_AF GPIO_AF_4"
.LASF1574:
	.string	"PTHREAD_MUTEX_INITIALIZER { { 0, 0, 0, 0, 0, __PTHREAD_SPINS, { 0, 0 } } }"
.LASF1712:
	.string	"EHOSTUNREACH 113"
.LASF1044:
	.string	"__POSIX_FADV_DONTNEED 4"
.LASF1426:
	.string	"_SC_V6_ILP32_OFFBIG _SC_V6_ILP32_OFFBIG"
.LASF606:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF738:
	.string	"GYRO_MPU6500_ALIGN CW270_DEG"
.LASF341:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF1700:
	.string	"ENETUNREACH 101"
.LASF1218:
	.string	"STDIN_FILENO 0"
.LASF280:
	.string	"__KERNEL_STRICT_NAMES "
.LASF712:
	.string	"__bool_true_false_are_defined 1"
.LASF858:
	.string	"__FILE_defined 1"
.LASF1582:
	.string	"PTHREAD_COND_INITIALIZER { { 0, 0, 0, 0, 0, (void *) 0, 0, 0 } }"
.LASF1431:
	.string	"_SC_TRACE_EVENT_FILTER _SC_TRACE_EVENT_FILTER"
.LASF1373:
	.string	"_SC_NL_TEXTMAX _SC_NL_TEXTMAX"
.LASF1046:
	.string	"POSIX_FADV_NORMAL 0"
.LASF469:
	.string	"___int_size_t_h "
.LASF1772:
	.string	"OPOST 0000001"
.LASF1087:
	.string	"UTIME_OMIT ((1l << 30) - 2l)"
.LASF1909:
	.string	"UART1_RX_BUFFER_SIZE 256"
.LASF465:
	.string	"_SIZE_T_DEFINED_ "
.LASF1566:
	.string	"CLOCK_REALTIME_ALARM 8"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF528:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF998:
	.string	"O_ASYNC 020000"
.LASF1939:
	.string	"portOptions_t"
.LASF1633:
	.string	"ERANGE 34"
.LASF1696:
	.string	"EAFNOSUPPORT 97"
.LASF572:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF746:
	.string	"USE_MAG_AK8963 "
.LASF1925:
	.string	"uint8_t"
.LASF1073:
	.string	"__S_IFREG 0100000"
.LASF1246:
	.string	"_PC_2_SYMLINKS _PC_2_SYMLINKS"
.LASF1444:
	.string	"_SC_LEVEL3_CACHE_ASSOC _SC_LEVEL3_CACHE_ASSOC"
.LASF374:
	.string	"__stub_fchflags "
.LASF972:
	.string	"L_ctermid 9"
.LASF1883:
	.string	"TTYDEF_OFLAG (OPOST | ONLCR | XTABS)"
.LASF538:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF1217:
	.string	"__LP64_OFF64_LDFLAGS \"-m64\""
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF1838:
	.string	"B500000 0010005"
.LASF1469:
	.string	"_CS_POSIX_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF1256:
	.string	"_SC_REALTIME_SIGNALS _SC_REALTIME_SIGNALS"
.LASF1604:
	.string	"EIO 5"
.LASF264:
	.string	"__USE_XOPEN"
.LASF912:
	.string	"_IO_DELETE_DONT_CLOSE 0x40"
.LASF1557:
	.string	"CLOCKS_PER_SEC ((clock_t) 1000000)"
.LASF626:
	.string	"__dev_t_defined "
.LASF362:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF1176:
	.string	"_LFS64_ASYNCHRONOUS_IO 1"
.LASF1745:
	.string	"VTIME 5"
.LASF487:
	.string	"_GCC_WCHAR_T "
.LASF1519:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS"
.LASF1313:
	.string	"_SC_PII_OSI_CLTS _SC_PII_OSI_CLTS"
.LASF1742:
	.string	"VERASE 2"
.LASF1329:
	.string	"_SC_THREAD_PRIO_INHERIT _SC_THREAD_PRIO_INHERIT"
.LASF551:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF648:
	.string	"__need_timer_t"
.LASF519:
	.string	"__WCOREFLAG 0x80"
.LASF438:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF389:
	.string	"__uint32_t_defined "
.LASF1988:
	.string	"usbVcpWrite"
.LASF806:
	.string	"BIND_PIN Pin_3"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF575:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF368:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF954:
	.string	"_IO_peekc(_fp) _IO_peekc_unlocked (_fp)"
.LASF1701:
	.string	"ENETRESET 102"
.LASF453:
	.string	"__need_size_t "
.LASF1755:
	.string	"VLNEXT 15"
.LASF1512:
	.string	"_CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS"
.LASF985:
	.string	"O_ACCMODE 0003"
.LASF1178:
	.string	"_LFS64_LARGEFILE 1"
.LASF1407:
	.string	"_SC_SIGNALS _SC_SIGNALS"
.LASF645:
	.string	"__clockid_t_defined 1"
.LASF489:
	.string	"_BSD_WCHAR_T_"
.LASF1396:
	.string	"_SC_FILE_LOCKING _SC_FILE_LOCKING"
.LASF1322:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF1332:
	.string	"_SC_NPROCESSORS_CONF _SC_NPROCESSORS_CONF"
.LASF1769:
	.string	"IXOFF 0010000"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF1830:
	.string	"PARODD 0001000"
.LASF1818:
	.string	"B19200 0000016"
.LASF1374:
	.string	"_SC_XBS5_ILP32_OFF32 _SC_XBS5_ILP32_OFF32"
.LASF463:
	.string	"_SIZE_T_ "
.LASF901:
	.string	"_IOS_NOREPLACE 64"
.LASF1546:
	.string	"__CPU_CLR_S(cpu,setsize,cpusetp) (__extension__ ({ size_t __cpu = (cpu); __cpu / 8 < (setsize) ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] &= ~__CPUMASK (__cpu)) : 0; }))"
.LASF1822:
	.string	"CSIZE 0000060"
.LASF1149:
	.string	"_POSIX_FSYNC 200809L"
.LASF1154:
	.string	"_POSIX_CHOWN_RESTRICTED 0"
.LASF1314:
	.string	"_SC_PII_OSI_M _SC_PII_OSI_M"
.LASF1112:
	.string	"W_OK 2"
.LASF1282:
	.string	"_SC_SIGQUEUE_MAX _SC_SIGQUEUE_MAX"
.LASF473:
	.string	"__need_size_t"
.LASF1799:
	.string	"VTDLY 0040000"
.LASF604:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF1422:
	.string	"_SC_SYMLOOP_MAX _SC_SYMLOOP_MAX"
.LASF837:
	.string	"__need_ptrdiff_t"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF1668:
	.string	"ESRMNT 69"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF1645:
	.string	"EL3HLT 46"
.LASF1488:
	.string	"_CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS"
.LASF353:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF944:
	.string	"_IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))"
.LASF1850:
	.string	"CIBAUD 002003600000"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF825:
	.string	"_STDDEF_H "
.LASF2000:
	.string	"/home/aravind/git/cleanflight"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1371:
	.string	"_SC_NL_NMAX _SC_NL_NMAX"
.LASF794:
	.string	"ADC0_GPIO GPIOA"
.LASF1862:
	.string	"ECHOCTL 0001000"
.LASF1588:
	.string	"PTHREAD_ONCE_INIT 0"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF452:
	.string	"_GCC_WRAP_STDINT_H "
.LASF1569:
	.string	"TIMER_ABSTIME 1"
.LASF608:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF1872:
	.string	"TCION 3"
.LASF451:
	.string	"UINTMAX_C(c) c ## UL"
.LASF266:
	.string	"__USE_UNIX98"
.LASF702:
	.string	"__malloc_and_calloc_defined "
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF1584:
	.string	"PTHREAD_CANCEL_DISABLE PTHREAD_CANCEL_DISABLE"
.LASF316:
	.string	"__CONCAT(x,y) x ## y"
.LASF1657:
	.string	"EDEADLOCK EDEADLK"
.LASF938:
	.string	"_IO_UNITBUF 020000"
.LASF1997:
	.string	"receiveLength"
.LASF1015:
	.string	"F_DUPFD 0"
.LASF787:
	.string	"MPU6500_CS_GPIO GPIOA"
.LASF377:
	.string	"__stub_gtty "
.LASF1153:
	.string	"_POSIX_MEMORY_PROTECTION 200809L"
.LASF1780:
	.string	"NLDLY 0000400"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF583:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF923:
	.string	"_IO_FLAGS2_NOTCANCEL 2"
.LASF939:
	.string	"_IO_STDIO 040000"
.LASF1429:
	.string	"_SC_HOST_NAME_MAX _SC_HOST_NAME_MAX"
.LASF1644:
	.string	"EL2NSYNC 45"
.LASF1098:
	.string	"S_ISVTX __S_ISVTX"
.LASF1166:
	.string	"_POSIX_THREAD_PRIO_INHERIT 200809L"
.LASF230:
	.string	"__SSE2__ 1"
.LASF1982:
	.string	"instance"
.LASF1480:
	.string	"_CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS"
.LASF403:
	.string	"INT_LEAST8_MIN (-128)"
.LASF758:
	.string	"UART1_TX_PINSOURCE GPIO_PinSource6"
.LASF879:
	.string	"_IO_off_t __off_t"
.LASF637:
	.string	"__need_clock_t "
.LASF1301:
	.string	"_SC_PII _SC_PII"
.LASF1802:
	.string	"XTABS 0014000"
.LASF792:
	.string	"ADC_DMA_CHANNEL DMA2_Channel1"
.LASF449:
	.string	"UINT64_C(c) c ## UL"
.LASF1893:
	.string	"CKILL CTRL('u')"
.LASF1749:
	.string	"VSTOP 9"
.LASF685:
	.string	"__fsblkcnt_t_defined "
.LASF1382:
	.string	"_SC_BARRIERS _SC_BARRIERS"
.LASF1363:
	.string	"_SC_SHRT_MIN _SC_SHRT_MIN"
.LASF1595:
	.string	"EDOM"
.LASF1179:
	.string	"_LFS64_STDIO 1"
.LASF1770:
	.string	"IMAXBEL 0020000"
.LASF526:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF890:
	.string	"__GNUC_VA_LIST "
.LASF1030:
	.string	"F_RDLCK 0"
.LASF865:
	.string	"__need_mbstate_t "
.LASF1587:
	.string	"PTHREAD_CANCELED ((void *) -1)"
.LASF686:
	.string	"__fsfilcnt_t_defined "
.LASF1307:
	.string	"_SC_SELECT _SC_SELECT"
.LASF495:
	.string	"WNOHANG 1"
.LASF1500:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS"
.LASF1272:
	.string	"_SC_AIO_PRIO_DELTA_MAX _SC_AIO_PRIO_DELTA_MAX"
.LASF1845:
	.string	"B2500000 0010014"
.LASF868:
	.string	"__need_wint_t"
.LASF691:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF1789:
	.string	"TAB0 0000000"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF861:
	.string	"__need___FILE"
.LASF723:
	.string	"LED1_PIN Pin_5"
.LASF1989:
	.string	"usbVcpBeginWrite"
.LASF897:
	.string	"_IOS_ATEND 4"
.LASF302:
	.string	"__GNU_LIBRARY__"
.LASF928:
	.string	"_IO_INTERNAL 010"
.LASF1564:
	.string	"CLOCK_MONOTONIC_COARSE 6"
.LASF1470:
	.string	"_CS_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF300:
	.string	"__USE_ATFILE 1"
.LASF1463:
	.string	"_CS_PATH _CS_PATH"
.LASF1152:
	.string	"_POSIX_MEMLOCK_RANGE 200809L"
.LASF1659:
	.string	"ENOSTR 60"
.LASF898:
	.string	"_IOS_APPEND 8"
.LASF1534:
	.string	"SCHED_OTHER 0"
.LASF963:
	.string	"_IONBF 2"
.LASF1637:
	.string	"ENOSYS 38"
.LASF896:
	.string	"_IOS_OUTPUT 2"
.LASF1091:
	.string	"S_IFBLK __S_IFBLK"
.LASF816:
	.string	"TARGET_BOARD_IDENTIFIER \"EDISON\""
.LASF1849:
	.string	"__MAX_BAUD B4000000"
.LASF1222:
	.string	"__socklen_t_defined "
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF413:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF1775:
	.string	"OCRNL 0000010"
.LASF1433:
	.string	"_SC_TRACE_LOG _SC_TRACE_LOG"
.LASF1897:
	.string	"CTIME 0"
.LASF970:
	.string	"TMP_MAX 238328"
.LASF771:
	.string	"UART3_RX_PINSOURCE GPIO_PinSource11"
.LASF1413:
	.string	"_SC_TIMEOUTS _SC_TIMEOUTS"
.LASF497:
	.string	"WSTOPPED 2"
.LASF491:
	.string	"NULL"
.LASF1135:
	.string	"_XOPEN_VERSION 700"
.LASF1706:
	.string	"ENOTCONN 107"
.LASF683:
	.string	"__blksize_t_defined "
.LASF596:
	.string	"htole32(x) (x)"
.LASF697:
	.string	"__have_pthread_attr_t 1"
.LASF1793:
	.string	"BSDLY 0020000"
.LASF498:
	.string	"WEXITED 4"
.LASF1343:
	.string	"_SC_XOPEN_SHM _SC_XOPEN_SHM"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF1722:
	.string	"ENOMEDIUM 123"
.LASF857:
	.string	"__need___FILE "
.LASF311:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF732:
	.string	"USE_MPU_DATA_READY_SIGNAL "
.LASF1156:
	.string	"_POSIX_NO_TRUNC 1"
.LASF1170:
	.string	"_POSIX_SEMAPHORES 200809L"
.LASF308:
	.string	"__PMT"
.LASF383:
	.string	"__stub_sstk "
.LASF324:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF1760:
	.string	"PARMRK 0000010"
.LASF1692:
	.string	"EPROTONOSUPPORT 93"
.LASF1231:
	.string	"_PC_PIPE_BUF _PC_PIPE_BUF"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF282:
	.string	"_DEFAULT_SOURCE"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF1611:
	.string	"ENOMEM 12"
.LASF1530:
	.string	"__need_getopt "
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF1150:
	.string	"_POSIX_MAPPED_FILES 200809L"
.LASF388:
	.string	"__int8_t_defined "
.LASF1315:
	.string	"_SC_T_IOV_MAX _SC_T_IOV_MAX"
.LASF672:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF1787:
	.string	"CR3 0003000"
.LASF1383:
	.string	"_SC_BASE _SC_BASE"
.LASF1607:
	.string	"ENOEXEC 8"
.LASF450:
	.string	"INTMAX_C(c) c ## L"
.LASF1189:
	.string	"_POSIX_TIMERS 200809L"
.LASF934:
	.string	"_IO_UPPERCASE 01000"
.LASF979:
	.string	"putc(_ch,_fp) _IO_putc (_ch, _fp)"
.LASF1525:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS"
.LASF1523:
	.string	"_CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF1836:
	.string	"B230400 0010003"
.LASF1754:
	.string	"VWERASE 14"
.LASF1120:
	.string	"MRAA_PIN_NAME_SIZE 12"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF356:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF1353:
	.string	"_SC_INT_MAX _SC_INT_MAX"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF1031:
	.string	"F_WRLCK 1"
.LASF1894:
	.string	"CMIN 1"
.LASF499:
	.string	"WCONTINUED 8"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF1168:
	.string	"_POSIX_THREAD_ROBUST_PRIO_INHERIT 200809L"
.LASF1507:
	.string	"_CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS"
.LASF537:
	.string	"__SLONGWORD_TYPE long int"
.LASF1636:
	.string	"ENOLCK 37"
.LASF822:
	.string	"UNIT_TESTED "
.LASF1123:
	.string	"MRAA_MAIN_PLATFORM_OFFSET 0"
.LASF1270:
	.string	"_SC_AIO_LISTIO_MAX _SC_AIO_LISTIO_MAX"
.LASF1245:
	.string	"_PC_SYMLINK_MAX _PC_SYMLINK_MAX"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF430:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF304:
	.string	"__GLIBC__ 2"
.LASF1347:
	.string	"_SC_XOPEN_XPG2 _SC_XOPEN_XPG2"
.LASF417:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF397:
	.string	"INT32_MAX (2147483647)"
.LASF480:
	.string	"_WCHAR_T_ "
.LASF1172:
	.string	"_POSIX_ASYNCHRONOUS_IO 200809L"
.LASF891:
	.string	"_IO_va_list"
.LASF1280:
	.string	"_SC_SEM_NSEMS_MAX _SC_SEM_NSEMS_MAX"
.LASF956:
	.string	"_IO_funlockfile(_fp) "
.LASF1451:
	.string	"_SC_V7_ILP32_OFF32 _SC_V7_ILP32_OFF32"
.LASF1471:
	.string	"_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF1567:
	.string	"CLOCK_BOOTTIME_ALARM 9"
.LASF1493:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS"
.LASF314:
	.string	"__P(args) args"
.LASF741:
	.string	"USE_ACC_MPU6500 "
.LASF967:
	.string	"SEEK_END 2"
.LASF859:
	.string	"__need_FILE"
.LASF429:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF407:
	.string	"INT_LEAST8_MAX (127)"
.LASF913:
	.string	"_IO_LINKED 0x80"
.LASF459:
	.string	"_SYS_SIZE_T_H "
.LASF562:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF1693:
	.string	"ESOCKTNOSUPPORT 94"
.LASF1221:
	.string	"__useconds_t_defined "
.LASF927:
	.string	"_IO_RIGHT 04"
.LASF1751:
	.string	"VEOL 11"
.LASF1528:
	.string	"_CS_V6_ENV _CS_V6_ENV"
.LASF1543:
	.string	"__CPUMASK(cpu) ((__cpu_mask) 1 << ((cpu) % __NCPUBITS))"
.LASF1522:
	.string	"_CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS"
.LASF219:
	.string	"__x86_64 1"
.LASF1027:
	.string	"__F_GETOWN_EX 16"
.LASF1832:
	.string	"CLOCAL 0004000"
.LASF1285:
	.string	"_SC_BC_DIM_MAX _SC_BC_DIM_MAX"
.LASF1689:
	.string	"EMSGSIZE 90"
.LASF1227:
	.string	"_PC_MAX_CANON _PC_MAX_CANON"
.LASF1551:
	.string	"__CPU_ALLOC_SIZE(count) ((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))"
.LASF1508:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS"
.LASF1842:
	.string	"B1152000 0010011"
.LASF278:
	.string	"__USE_FORTIFY_LEVEL"
.LASF982:
	.string	"F_GETLK64 5"
.LASF600:
	.string	"htole64(x) (x)"
.LASF1888:
	.string	"CEOF CTRL('d')"
.LASF667:
	.string	"__suseconds_t_defined "
.LASF1021:
	.string	"__F_GETOWN 9"
.LASF751:
	.string	"USE_VCP "
.LASF573:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF395:
	.string	"INT8_MAX (127)"
.LASF1725:
	.string	"ENOKEY 126"
.LASF676:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF665:
	.string	"_STRUCT_TIMEVAL 1"
.LASF1051:
	.string	"POSIX_FADV_NOREUSE __POSIX_FADV_NOREUSE"
.LASF776:
	.string	"I2C2_SCL_PIN GPIO_Pin_9"
.LASF1074:
	.string	"__S_IFIFO 0010000"
.LASF1848:
	.string	"B4000000 0010017"
.LASF269:
	.string	"__USE_XOPEN2K8"
.LASF437:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF875:
	.string	"_IO_fpos_t _G_fpos_t"
.LASF1409:
	.string	"_SC_SPORADIC_SERVER _SC_SPORADIC_SERVER"
.LASF722:
	.string	"LED1_GPIO GPIOB"
.LASF574:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF493:
	.string	"__need_NULL"
.LASF838:
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
.LASF1254:
	.string	"_SC_JOB_CONTROL _SC_JOB_CONTROL"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF1273:
	.string	"_SC_DELAYTIMER_MAX _SC_DELAYTIMER_MAX"
.LASF762:
	.string	"UART2_GPIO GPIOA"
.LASF325:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF363:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF271:
	.string	"__USE_LARGEFILE"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF541:
	.string	"__SWORD_TYPE long int"
.LASF1146:
	.string	"_POSIX_SAVED_IDS 1"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF1702:
	.string	"ECONNABORTED 103"
.LASF1214:
	.string	"__ILP32_OFFBIG_CFLAGS \"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64\""
.LASF1937:
	.string	"MODE_RXTX"
.LASF293:
	.string	"__USE_POSIX199309 1"
.LASF1727:
	.string	"EKEYREVOKED 128"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF810:
	.string	"BINDPLUG_PIN Pin_12"
.LASF1288:
	.string	"_SC_COLL_WEIGHTS_MAX _SC_COLL_WEIGHTS_MAX"
.LASF1899:
	.string	"CSTART CTRL('q')"
.LASF1293:
	.string	"_SC_CHARCLASS_NAME_MAX _SC_CHARCLASS_NAME_MAX"
.LASF1013:
	.string	"O_DSYNC __O_DSYNC"
.LASF1559:
	.string	"CLOCK_MONOTONIC 1"
.LASF1892:
	.string	"CSTATUS _POSIX_VDISABLE"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF1010:
	.string	"O_DIRECTORY __O_DIRECTORY"
.LASF1931:
	.string	"sizetype"
.LASF1632:
	.string	"EDOM 33"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF971:
	.string	"FILENAME_MAX 4096"
.LASF1537:
	.string	"__defined_schedparam 1"
.LASF713:
	.string	"_STRING_H 1"
.LASF1461:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT _SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF883:
	.string	"_IO_iconv_t _G_iconv_t"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF559:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1190:
	.string	"_POSIX_BARRIERS 200809L"
.LASF993:
	.string	"O_APPEND 02000"
.LASF1705:
	.string	"EISCONN 106"
.LASF1350:
	.string	"_SC_CHAR_BIT _SC_CHAR_BIT"
.LASF1174:
	.string	"_LFS_ASYNCHRONOUS_IO 1"
.LASF1661:
	.string	"ETIME 62"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF1927:
	.string	"short unsigned int"
.LASF736:
	.string	"USE_GYRO_SPI_MPU6500 "
.LASF797:
	.string	"ADC_CHANNEL_COUNT 1"
.LASF1921:
	.string	"signed char"
.LASF1890:
	.string	"CERASE 0177"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF657:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF1389:
	.string	"_SC_DEVICE_IO _SC_DEVICE_IO"
.LASF1758:
	.string	"BRKINT 0000002"
.LASF1647:
	.string	"ELNRNG 48"
.LASF1066:
	.string	"_STATBUF_ST_BLKSIZE "
.LASF1993:
	.string	"usbVTable"
.LASF456:
	.string	"__size_t__ "
.LASF295:
	.string	"__USE_XOPEN2K 1"
.LASF1578:
	.string	"PTHREAD_SCOPE_SYSTEM PTHREAD_SCOPE_SYSTEM"
.LASF1439:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE _SC_LEVEL1_DCACHE_LINESIZE"
.LASF1813:
	.string	"B1200 0000011"
.LASF1437:
	.string	"_SC_LEVEL1_DCACHE_SIZE _SC_LEVEL1_DCACHE_SIZE"
.LASF1042:
	.string	"FNONBLOCK O_NONBLOCK"
.LASF343:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF643:
	.string	"__time_t_defined 1"
.LASF597:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF675:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF795:
	.string	"ADC0_GPIO_PIN GPIO_Pin_4"
.LASF894:
	.string	"EOF (-1)"
.LASF1821:
	.string	"EXTB B38400"
.LASF1158:
	.string	"_XOPEN_REALTIME_THREADS 1"
.LASF431:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF371:
	.string	"__stub___compat_bdflush "
.LASF1585:
	.string	"PTHREAD_CANCEL_DEFERRED PTHREAD_CANCEL_DEFERRED"
.LASF926:
	.string	"_IO_LEFT 02"
.LASF1432:
	.string	"_SC_TRACE_INHERIT _SC_TRACE_INHERIT"
.LASF1296:
	.string	"_SC_2_C_DEV _SC_2_C_DEV"
.LASF1385:
	.string	"_SC_C_LANG_SUPPORT_R _SC_C_LANG_SUPPORT_R"
.LASF885:
	.string	"_IO_BUFSIZ _G_BUFSIZ"
.LASF1257:
	.string	"_SC_PRIORITY_SCHEDULING _SC_PRIORITY_SCHEDULING"
.LASF255:
	.string	"_FEATURES_H 1"
.LASF464:
	.string	"_BSD_SIZE_T_ "
.LASF357:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF1811:
	.string	"B300 0000007"
.LASF1590:
	.string	"__cleanup_fct_attribute "
.LASF345:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF1059:
	.string	"_STAT_VER_KERNEL 0"
.LASF1204:
	.string	"_POSIX_TRACE_LOG -1"
.LASF1267:
	.string	"_SC_MESSAGE_PASSING _SC_MESSAGE_PASSING"
.LASF1243:
	.string	"_PC_REC_XFER_ALIGN _PC_REC_XFER_ALIGN"
.LASF503:
	.string	"__WCLONE 0x80000000"
.LASF1319:
	.string	"_SC_GETPW_R_SIZE_MAX _SC_GETPW_R_SIZE_MAX"
.LASF1299:
	.string	"_SC_2_SW_DEV _SC_2_SW_DEV"
.LASF1145:
	.string	"_POSIX_JOB_CONTROL 1"
.LASF1516:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS"
.LASF1009:
	.string	"F_SETLKW 7"
.LASF1513:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS"
.LASF1055:
	.string	"AT_SYMLINK_FOLLOW 0x400"
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF678:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF1079:
	.string	"__S_TYPEISSHM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF560:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1443:
	.string	"_SC_LEVEL3_CACHE_SIZE _SC_LEVEL3_CACHE_SIZE"
.LASF1378:
	.string	"_SC_XOPEN_LEGACY _SC_XOPEN_LEGACY"
.LASF943:
	.string	"__HAVE_COLUMN "
.LASF755:
	.string	"UART1_RX_PIN 2"
.LASF1048:
	.string	"POSIX_FADV_SEQUENTIAL 2"
.LASF933:
	.string	"_IO_SHOWPOINT 0400"
.LASF1241:
	.string	"_PC_REC_MAX_XFER_SIZE _PC_REC_MAX_XFER_SIZE"
.LASF791:
	.string	"ADC_INSTANCE ADC2"
.LASF731:
	.string	"USABLE_TIMER_CHANNEL_COUNT 11"
.LASF1570:
	.string	"__isleap(year) ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))"
.LASF1597:
	.string	"ERANGE"
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF1911:
	.string	"UART2_RX_BUFFER_SIZE 256"
.LASF445:
	.string	"INT64_C(c) c ## L"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF1014:
	.string	"O_RSYNC O_SYNC"
.LASF552:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF1116:
	.string	"F_LOCK 1"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF1592:
	.string	"pthread_cleanup_pop(execute) do { } while (0); } while (0); __pthread_unregister_cancel (&__cancel_buf); if (execute) __cancel_routine (__cancel_arg); } while (0)"
.LASF827:
	.string	"_ANSI_STDDEF_H "
.LASF309:
	.string	"__LEAF , __leaf__"
.LASF1581:
	.string	"PTHREAD_PROCESS_SHARED PTHREAD_PROCESS_SHARED"
.LASF1740:
	.string	"VINTR 0"
.LASF623:
	.string	"_SYS_TYPES_H 1"
.LASF1506:
	.string	"_CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS"
.LASF611:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF1283:
	.string	"_SC_TIMER_MAX _SC_TIMER_MAX"
.LASF1056:
	.string	"AT_EACCESS 0x200"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF1022:
	.string	"F_SETOWN __F_SETOWN"
.LASF1095:
	.string	"S_IFSOCK __S_IFSOCK"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF1309:
	.string	"_SC_IOV_MAX _SC_IOV_MAX"
.LASF903:
	.string	"_IO_MAGIC 0xFBAD0000"
.LASF918:
	.string	"_IO_IS_APPENDING 0x1000"
.LASF902:
	.string	"_IOS_BIN 128"
.LASF1099:
	.string	"S_IRUSR __S_IREAD"
.LASF878:
	.string	"_IO_ssize_t __ssize_t"
.LASF986:
	.string	"O_RDONLY 00"
.LASF370:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF1142:
	.string	"_XOPEN_ENH_I18N 1"
.LASF1209:
	.string	"_POSIX_V7_LP64_OFF64 1"
.LASF418:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF1364:
	.string	"_SC_UCHAR_MAX _SC_UCHAR_MAX"
.LASF1399:
	.string	"_SC_MULTI_PROCESS _SC_MULTI_PROCESS"
.LASF1345:
	.string	"_SC_2_C_VERSION _SC_2_C_VERSION"
.LASF581:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF994:
	.string	"O_NONBLOCK 04000"
.LASF636:
	.string	"__key_t_defined "
.LASF1685:
	.string	"ESTRPIPE 86"
.LASF852:
	.string	"LOG2_32BIT(v) (16*((v)>65535L) + LOG2_16BIT((v)*1L >>16*((v)>65535L)))"
.LASF1225:
	.string	"L_XTND SEEK_END"
.LASF734:
	.string	"USE_GYRO_MPU6050 "
.LASF554:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1305:
	.string	"_SC_PII_OSI _SC_PII_OSI"
.LASF966:
	.string	"SEEK_CUR 1"
.LASF1370:
	.string	"_SC_NL_MSGMAX _SC_NL_MSGMAX"
.LASF1200:
	.string	"_POSIX_THREAD_SPORADIC_SERVER -1"
.LASF920:
	.string	"_IO_BAD_SEEN 0x4000"
.LASF553:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF530:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF1947:
	.string	"SERIAL_BIDIR"
.LASF1410:
	.string	"_SC_THREAD_SPORADIC_SERVER _SC_THREAD_SPORADIC_SERVER"
.LASF236:
	.string	"__linux__ 1"
.LASF507:
	.string	"P_PGID"
.LASF1733:
	.string	"ENOTSUP EOPNOTSUPP"
.LASF729:
	.string	"LED1_PIN_2 Pin_9"
.LASF1447:
	.string	"_SC_LEVEL4_CACHE_ASSOC _SC_LEVEL4_CACHE_ASSOC"
.LASF968:
	.string	"P_tmpdir \"/tmp\""
.LASF318:
	.string	"__ptr_t void *"
.LASF949:
	.string	"_IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) && __underflow (_fp) == EOF ? EOF : *(unsigned char *) (_fp)->_IO_read_ptr)"
.LASF379:
	.string	"__stub_putmsg "
.LASF1376:
	.string	"_SC_XBS5_LP64_OFF64 _SC_XBS5_LP64_OFF64"
.LASF1132:
	.string	"_POSIX2_C_DEV __POSIX2_THIS_VERSION"
.LASF1003:
	.string	"__O_NOATIME 01000000"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF401:
	.string	"UINT32_MAX (4294967295U)"
.LASF1817:
	.string	"B9600 0000015"
.LASF226:
	.string	"__k8__ 1"
.LASF1984:
	.string	"usbVcpSetMode"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF1966:
	.string	"serialTotalRxWaiting"
.LASF700:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF259:
	.string	"__USE_ISOCXX11"
.LASF1771:
	.string	"IUTF8 0040000"
.LASF1923:
	.string	"long int"
.LASF1797:
	.string	"FF0 0000000"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF1317:
	.string	"_SC_THREAD_SAFE_FUNCTIONS _SC_THREAD_SAFE_FUNCTIONS"
.LASF1251:
	.string	"_SC_OPEN_MAX _SC_OPEN_MAX"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF754:
	.string	"UART1_TX_PIN 1"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF1244:
	.string	"_PC_ALLOC_SIZE_MIN _PC_ALLOC_SIZE_MIN"
.LASF1908:
	.string	"CFLUSH CDISCARD"
.LASF1486:
	.string	"_CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS"
.LASF1776:
	.string	"ONOCR 0000020"
.LASF1311:
	.string	"_SC_PII_INTERNET_DGRAM _SC_PII_INTERNET_DGRAM"
.LASF1879:
	.string	"_IOT_termios _IOT (_IOTS (cflag_t), 4, _IOTS (cc_t), NCCS, _IOTS (speed_t), 2)"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF1340:
	.string	"_SC_XOPEN_UNIX _SC_XOPEN_UNIX"
.LASF391:
	.string	"INT8_MIN (-128)"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF399:
	.string	"UINT8_MAX (255)"
.LASF336:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF1395:
	.string	"_SC_FILE_ATTRIBUTES _SC_FILE_ATTRIBUTES"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF975:
	.string	"stdin stdin"
.LASF664:
	.string	"__need_timeval "
.LASF1606:
	.string	"E2BIG 7"
.LASF721:
	.string	"LED0_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF1550:
	.ascii	"__CPU_OP_S(setsize,destset,srcset1,srcset2,op) (__extension_"
	.ascii	"_ ({ cpu_set_t *__dest = (destset); const __cp"
	.string	"u_mask *__arr1 = (srcset1)->__bits; const __cpu_mask *__arr2 = (srcset2)->__bits; size_t __imax = (setsize) / sizeof (__cpu_mask); size_t __i; for (__i = 0; __i < __imax; ++__i) ((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op __arr2[__i]; __dest; }))"
.LASF1678:
	.string	"ELIBACC 79"
.LASF693:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF1643:
	.string	"ECHRNG 44"
.LASF1991:
	.string	"usbVcpGetBaudRate"
.LASF315:
	.string	"__PMT(args) args"
.LASF1205:
	.string	"_POSIX_TYPED_MEMORY_OBJECTS -1"
.LASF832:
	.string	"_PTRDIFF_T_ "
.LASF1884:
	.string	"TTYDEF_LFLAG (ECHO | ICANON | ISIG | IEXTEN | ECHOE|ECHOKE|ECHOCTL)"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF408:
	.string	"INT_LEAST16_MAX (32767)"
.LASF1918:
	.string	"UART5_TX_BUFFER_SIZE 256"
.LASF1043:
	.string	"FNDELAY O_NDELAY"
.LASF1326:
	.string	"_SC_THREAD_ATTR_STACKADDR _SC_THREAD_ATTR_STACKADDR"
.LASF1330:
	.string	"_SC_THREAD_PRIO_PROTECT _SC_THREAD_PRIO_PROTECT"
.LASF621:
	.string	"EXIT_SUCCESS 0"
.LASF1467:
	.string	"_CS_GNU_LIBPTHREAD_VERSION _CS_GNU_LIBPTHREAD_VERSION"
.LASF935:
	.string	"_IO_SHOWPOS 02000"
.LASF1549:
	.string	"__CPU_EQUAL_S(setsize,cpusetp1,cpusetp2) (__builtin_memcmp (cpusetp1, cpusetp2, setsize) == 0)"
.LASF1658:
	.string	"EBFONT 59"
.LASF1625:
	.string	"ETXTBSY 26"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF1165:
	.string	"_POSIX_THREAD_ATTR_STACKADDR 200809L"
.LASF1118:
	.string	"F_TEST 3"
.LASF1791:
	.string	"TAB2 0010000"
.LASF707:
	.string	"__need_malloc_and_calloc"
.LASF1441:
	.string	"_SC_LEVEL2_CACHE_ASSOC _SC_LEVEL2_CACHE_ASSOC"
.LASF1453:
	.string	"_SC_V7_LP64_OFF64 _SC_V7_LP64_OFF64"
.LASF307:
	.string	"_SYS_CDEFS_H 1"
.LASF328:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF976:
	.string	"stdout stdout"
.LASF867:
	.string	"__need_mbstate_t"
.LASF1762:
	.string	"ISTRIP 0000040"
.LASF973:
	.string	"FOPEN_MAX"
.LASF1796:
	.string	"FFDLY 0100000"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF1761:
	.string	"INPCK 0000020"
.LASF1631:
	.string	"EPIPE 32"
.LASF959:
	.string	"_IO_cleanup_region_end(_Doit) "
.LASF1898:
	.string	"CDSUSP CTRL('y')"
.LASF462:
	.string	"__SIZE_T "
.LASF580:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF1248:
	.string	"_SC_CHILD_MAX _SC_CHILD_MAX"
.LASF725:
	.string	"LED0_GPIO_2 GPIOB"
.LASF1975:
	.string	"serialPort_t"
.LASF1906:
	.string	"CBRK CEOL"
.LASF1062:
	.string	"_STAT_VER _STAT_VER_LINUX"
.LASF1959:
	.string	"rxBufferTail"
.LASF1421:
	.string	"_SC_2_PBS_TRACK _SC_2_PBS_TRACK"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF1016:
	.string	"F_GETFD 1"
.LASF1020:
	.string	"__F_SETOWN 8"
.LASF564:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF579:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF1792:
	.string	"TAB3 0014000"
.LASF1075:
	.string	"__S_IFLNK 0120000"
.LASF1442:
	.string	"_SC_LEVEL2_CACHE_LINESIZE _SC_LEVEL2_CACHE_LINESIZE"
.LASF1242:
	.string	"_PC_REC_MIN_XFER_SIZE _PC_REC_MIN_XFER_SIZE"
.LASF461:
	.string	"_T_SIZE "
.LASF670:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF1468:
	.string	"_CS_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF1333:
	.string	"_SC_NPROCESSORS_ONLN _SC_NPROCESSORS_ONLN"
.LASF1970:
	.string	"isSerialTransmitBufferEmpty"
.LASF292:
	.string	"__USE_POSIX2 1"
.LASF1203:
	.string	"_POSIX_TRACE_INHERIT -1"
.LASF814:
	.string	"TARGET_IO_PORTD (BIT(2))"
.LASF1555:
	.string	"_TIME_H 1"
.LASF333:
	.string	"__flexarr []"
.LASF281:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF338:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF532:
	.string	"_BITS_TYPES_H 1"
.LASF1930:
	.string	"long unsigned int"
.LASF2001:
	.string	"usbTxBytesFree"
.LASF386:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF412:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF593:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF909:
	.string	"_IO_NO_WRITES 8"
.LASF1757:
	.string	"IGNBRK 0000001"
.LASF823:
	.string	"REQUIRE_CC_ARM_PRINTF_SUPPORT "
.LASF1117:
	.string	"F_TLOCK 2"
.LASF334:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF1887:
	.string	"CTRL(x) (x&037)"
.LASF660:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF1615:
	.string	"EBUSY 16"
.LASF477:
	.string	"_T_WCHAR_ "
.LASF1097:
	.string	"S_ISGID __S_ISGID"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF1465:
	.string	"_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF587:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF405:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF289:
	.string	"_POSIX_C_SOURCE"
.LASF619:
	.string	"RAND_MAX 2147483647"
.LASF1194:
	.string	"_POSIX_CLOCK_SELECTION 200809L"
.LASF1032:
	.string	"F_UNLCK 2"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF1361:
	.string	"_SC_SCHAR_MIN _SC_SCHAR_MIN"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF931:
	.string	"_IO_HEX 0100"
.LASF1228:
	.string	"_PC_MAX_INPUT _PC_MAX_INPUT"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF1284:
	.string	"_SC_BC_BASE_MAX _SC_BC_BASE_MAX"
.LASF669:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1420:
	.string	"_SC_2_PBS_MESSAGE _SC_2_PBS_MESSAGE"
.LASF1171:
	.string	"_POSIX_REALTIME_SIGNALS 200809L"
.LASF1295:
	.string	"_SC_2_C_BIND _SC_2_C_BIND"
.LASF1992:
	.string	"vcpPort"
.LASF1240:
	.string	"_PC_REC_INCR_XFER_SIZE _PC_REC_INCR_XFER_SIZE"
.LASF749:
	.string	"LED1 "
.LASF1281:
	.string	"_SC_SEM_VALUE_MAX _SC_SEM_VALUE_MAX"
.LASF1932:
	.string	"char"
.LASF695:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF1089:
	.string	"S_IFDIR __S_IFDIR"
.LASF1478:
	.string	"_CS_LFS64_LIBS _CS_LFS64_LIBS"
.LASF1741:
	.string	"VQUIT 1"
.LASF555:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF382:
	.string	"__stub_sigreturn "
.LASF1300:
	.string	"_SC_2_LOCALEDEF _SC_2_LOCALEDEF"
.LASF1900:
	.string	"CSTOP CTRL('s')"
.LASF323:
	.string	"__END_NAMESPACE_STD "
.LASF831:
	.string	"__PTRDIFF_T "
.LASF974:
	.string	"FOPEN_MAX 16"
.LASF646:
	.string	"__clockid_time_t"
.LASF941:
	.string	"_IO_BOOLALPHA 0200000"
.LASF737:
	.string	"GYRO_MPU6050_ALIGN CW270_DEG"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF651:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF1703:
	.string	"ECONNRESET 104"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF1012:
	.string	"O_CLOEXEC __O_CLOEXEC"
.LASF1351:
	.string	"_SC_CHAR_MAX _SC_CHAR_MAX"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF576:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF496:
	.string	"WUNTRACED 2"
.LASF1136:
	.string	"_XOPEN_XCU_VERSION 4"
.LASF788:
	.string	"MPU6500_CS_PIN GPIO_Pin_15"
.LASF1750:
	.string	"VSUSP 10"
.LASF290:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF327:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF642:
	.string	"__need_clock_t"
.LASF590:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF387:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF1648:
	.string	"EUNATCH 49"
.LASF1561:
	.string	"CLOCK_THREAD_CPUTIME_ID 3"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF872:
	.string	"_G_IO_IO_FILE_VERSION 0x20001"
.LASF841:
	.string	"CONCAT_HELPER(x,y) x ## y"
.LASF710:
	.string	"true 1"
.LASF1868:
	.string	"EXTPROC 0200000"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF1503:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS"
.LASF352:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1620:
	.string	"EISDIR 21"
.LASF1196:
	.string	"_POSIX_IPV6 200809L"
.LASF1394:
	.string	"_SC_PIPE _SC_PIPE"
.LASF1515:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS"
.LASF1220:
	.string	"STDERR_FILENO 2"
.LASF567:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF436:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF277:
	.string	"__USE_REENTRANT"
.LASF1053:
	.string	"AT_SYMLINK_NOFOLLOW 0x100"
.LASF1103:
	.string	"S_IRGRP (S_IRUSR >> 3)"
.LASF1807:
	.string	"B110 0000003"
.LASF1358:
	.string	"_SC_NZERO _SC_NZERO"
.LASF1844:
	.string	"B2000000 0010013"
.LASF586:
	.string	"__STD_TYPE"
.LASF1352:
	.string	"_SC_CHAR_MIN _SC_CHAR_MIN"
.LASF577:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF984:
	.string	"F_SETLKW64 7"
.LASF414:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF550:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF544:
	.string	"__ULONG32_TYPE unsigned int"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF455:
	.string	"__need_NULL "
.LASF1731:
	.string	"ERFKILL 132"
.LASF1945:
	.string	"SERIAL_PARITY_EVEN"
.LASF1038:
	.string	"LOCK_UN 8"
.LASF1163:
	.string	"_POSIX_THREAD_PRIORITY_SCHEDULING 200809L"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF1102:
	.string	"S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)"
.LASF1835:
	.string	"B115200 0010002"
.LASF1866:
	.string	"PENDIN 0040000"
.LASF1681:
	.string	"ELIBMAX 82"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF1265:
	.string	"_SC_MEMLOCK_RANGE _SC_MEMLOCK_RANGE"
.LASF492:
	.string	"NULL ((void *)0)"
.LASF1580:
	.string	"PTHREAD_PROCESS_PRIVATE PTHREAD_PROCESS_PRIVATE"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF1808:
	.string	"B134 0000004"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF614:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF1384:
	.string	"_SC_C_LANG_SUPPORT _SC_C_LANG_SUPPORT"
.LASF843:
	.string	"STR_HELPER(x) #x"
.LASF922:
	.string	"_IO_FLAGS2_MMAP 1"
.LASF1206:
	.string	"_POSIX_V7_LPBIG_OFFBIG -1"
.LASF1497:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS"
.LASF789:
	.string	"MPU6500_SPI_INSTANCE SPI3"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF1398:
	.string	"_SC_MONOTONIC_CLOCK _SC_MONOTONIC_CLOCK"
.LASF1886:
	.string	"TTYDEF_SPEED (B9600)"
.LASF1946:
	.string	"SERIAL_UNIDIR"
.LASF1355:
	.string	"_SC_LONG_BIT _SC_LONG_BIT"
.LASF394:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1614:
	.string	"ENOTBLK 15"
.LASF820:
	.string	"STATIC_INLINE_UNIT_TESTED static inline"
.LASF1236:
	.string	"_PC_ASYNC_IO _PC_ASYNC_IO"
.LASF1509:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF1815:
	.string	"B2400 0000013"
.LASF1252:
	.string	"_SC_STREAM_MAX _SC_STREAM_MAX"
.LASF439:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF655:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF1484:
	.string	"_CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS"
.LASF367:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF1128:
	.string	"__POSIX2_THIS_VERSION 200809L"
.LASF1558:
	.string	"CLOCK_REALTIME 0"
.LASF490:
	.string	"__need_wchar_t"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF428:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF995:
	.string	"O_NDELAY O_NONBLOCK"
.LASF1119:
	.string	"MRAA_PLATFORM_NAME_MAX_SIZE 64"
.LASF598:
	.string	"le32toh(x) (x)"
.LASF830:
	.string	"_T_PTRDIFF "
.LASF1674:
	.string	"EOVERFLOW 75"
.LASF631:
	.string	"__off_t_defined "
.LASF1571:
	.string	"_BITS_SETJMP_H 1"
.LASF1748:
	.string	"VSTART 8"
.LASF1456:
	.string	"_SC_TRACE_EVENT_NAME_MAX _SC_TRACE_EVENT_NAME_MAX"
.LASF946:
	.string	"_IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))"
.LASF846:
	.string	"EXPAND(x) EXPAND_I(x)"
.LASF757:
	.string	"UART1_GPIO_AF GPIO_AF_7"
.LASF1729:
	.string	"EOWNERDEAD 130"
.LASF235:
	.string	"__linux 1"
.LASF1143:
	.string	"_XOPEN_LEGACY 1"
.LASF306:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF1562:
	.string	"CLOCK_MONOTONIC_RAW 4"
.LASF396:
	.string	"INT16_MAX (32767)"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF1082:
	.string	"__S_ISVTX 01000"
.LASF744:
	.string	"ACC_MPU6500_ALIGN CW270_DEG"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF633:
	.string	"__id_t_defined "
.LASF1716:
	.string	"EUCLEAN 117"
.LASF589:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF1788:
	.string	"TABDLY 0014000"
.LASF640:
	.string	"__need_clockid_t "
.LASF1393:
	.string	"_SC_FIFO _SC_FIFO"
.LASF1521:
	.string	"_CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS"
.LASF893:
	.string	"_IO_UNIFIED_JUMPTABLES 1"
.LASF1697:
	.string	"EADDRINUSE 98"
.LASF1766:
	.string	"IUCLC 0001000"
.LASF1344:
	.string	"_SC_2_CHAR_TERM _SC_2_CHAR_TERM"
.LASF0:
	.string	"__STDC__ 1"
.LASF1891:
	.string	"CINTR CTRL('c')"
.LASF1610:
	.string	"EAGAIN 11"
.LASF404:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF1885:
	.string	"TTYDEF_CFLAG (CREAD | CS7 | PARENB | HUPCL)"
.LASF1576:
	.string	"PTHREAD_INHERIT_SCHED PTHREAD_INHERIT_SCHED"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF756:
	.string	"UART1_GPIO GPIOB"
.LASF1415:
	.string	"_SC_USER_GROUPS _SC_USER_GROUPS"
.LASF950:
	.string	"_IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end, 0) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF1613:
	.string	"EFAULT 14"
.LASF635:
	.string	"__daddr_t_defined "
.LASF354:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF1943:
	.string	"SERIAL_STOPBITS_2"
.LASF1157:
	.string	"_XOPEN_REALTIME 1"
.LASF1342:
	.string	"_SC_XOPEN_ENH_I18N _SC_XOPEN_ENH_I18N"
.LASF1250:
	.string	"_SC_NGROUPS_MAX _SC_NGROUPS_MAX"
.LASF502:
	.string	"__WALL 0x40000000"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF1416:
	.string	"_SC_USER_GROUPS_R _SC_USER_GROUPS_R"
.LASF1071:
	.string	"__S_IFCHR 0020000"
.LASF329:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF1860:
	.string	"NOFLSH 0000200"
.LASF1782:
	.string	"NL1 0000400"
.LASF524:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF241:
	.string	"__ELF__ 1"
.LASF662:
	.string	"__need_timespec "
.LASF330:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF1366:
	.string	"_SC_ULONG_MAX _SC_ULONG_MAX"
.LASF1907:
	.string	"CRPRNT CREPRINT"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF1756:
	.string	"VEOL2 16"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF1193:
	.string	"_POSIX_MONOTONIC_CLOCK 0"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF1572:
	.string	"PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_JOINABLE"
.LASF273:
	.string	"__USE_FILE_OFFSET64"
.LASF518:
	.string	"__W_CONTINUED 0xffff"
.LASF1215:
	.string	"__ILP32_OFFBIG_LDFLAGS \"-m32\""
.LASF977:
	.string	"stderr stderr"
.LASF1823:
	.string	"CS5 0000000"
.LASF1728:
	.string	"EKEYREJECTED 129"
.LASF1269:
	.string	"_SC_SHARED_MEMORY_OBJECTS _SC_SHARED_MEMORY_OBJECTS"
.LASF1324:
	.string	"_SC_THREAD_STACK_MIN _SC_THREAD_STACK_MIN"
.LASF1726:
	.string	"EKEYEXPIRED 127"
.LASF1765:
	.string	"ICRNL 0000400"
.LASF805:
	.string	"BIND_PORT GPIOA"
.LASF1327:
	.string	"_SC_THREAD_ATTR_STACKSIZE _SC_THREAD_ATTR_STACKSIZE"
.LASF348:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF802:
	.string	"GTUNE "
.LASF565:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF917:
	.string	"_IO_CURRENTLY_PUTTING 0x800"
.LASF1224:
	.string	"L_INCR SEEK_CUR"
.LASF523:
	.string	"__PDP_ENDIAN 3412"
.LASF1357:
	.string	"_SC_MB_LEN_MAX _SC_MB_LEN_MAX"
.LASF1517:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS"
.LASF1744:
	.string	"VEOF 4"
.LASF881:
	.string	"_IO_pid_t __pid_t"
.LASF851:
	.string	"LOG2_16BIT(v) (8*((v)>255) + LOG2_8BIT((v) >>8*((v)>255)))"
.LASF661:
	.string	"__sigset_t_defined "
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF525:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF1216:
	.string	"__LP64_OFF64_CFLAGS \"-m64\""
.LASF1045:
	.string	"__POSIX_FADV_NOREUSE 5"
.LASF1833:
	.string	"CBAUDEX 0010000"
.LASF1910:
	.string	"UART1_TX_BUFFER_SIZE 256"
.LASF1827:
	.string	"CSTOPB 0000100"
.LASF862:
	.string	"_STDIO_USES_IOSTREAM "
.LASF286:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF481:
	.string	"_BSD_WCHAR_T_ "
.LASF618:
	.string	"__lldiv_t_defined 1"
.LASF410:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF649:
	.string	"__need_timespec"
.LASF344:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF1779:
	.string	"OFDEL 0000200"
.LASF694:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF1090:
	.string	"S_IFCHR __S_IFCHR"
.LASF1077:
	.string	"__S_TYPEISMQ(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF1598:
	.string	"_ASM_GENERIC_ERRNO_H "
.LASF1629:
	.string	"EROFS 30"
.LASF1743:
	.string	"VKILL 3"
.LASF1730:
	.string	"ENOTRECOVERABLE 131"
.LASF937:
	.string	"_IO_FIXED 010000"
.LASF276:
	.string	"__USE_GNU"
.LASF1434:
	.string	"_SC_LEVEL1_ICACHE_SIZE _SC_LEVEL1_ICACHE_SIZE"
.LASF513:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF261:
	.string	"__USE_POSIX2"
.LASF666:
	.string	"__need_timeval"
.LASF1686:
	.string	"EUSERS 87"
.LASF1346:
	.string	"_SC_2_UPE _SC_2_UPE"
.LASF1106:
	.string	"S_IRWXG (S_IRWXU >> 3)"
.LASF1781:
	.string	"NL0 0000000"
.LASF753:
	.string	"USE_UART1_TX_DMA "
.LASF1274:
	.string	"_SC_MQ_OPEN_MAX _SC_MQ_OPEN_MAX"
.LASF763:
	.string	"UART2_GPIO_AF GPIO_AF_7"
.LASF804:
	.string	"USE_CLI "
.LASF1672:
	.string	"EDOTDOT 73"
.LASF1677:
	.string	"EREMCHG 78"
.LASF992:
	.string	"O_TRUNC 01000"
.LASF1450:
	.string	"_SC_RAW_SOCKETS _SC_RAW_SOCKETS"
.LASF1386:
	.string	"_SC_CLOCK_SELECTION _SC_CLOCK_SELECTION"
.LASF1953:
	.string	"baudRate"
.LASF1271:
	.string	"_SC_AIO_MAX _SC_AIO_MAX"
.LASF1694:
	.string	"EOPNOTSUPP 95"
.LASF1081:
	.string	"__S_ISGID 02000"
.LASF454:
	.string	"__need_wchar_t "
.LASF1005:
	.string	"__O_DSYNC 010000"
.LASF268:
	.string	"__USE_XOPEN2KXSI"
.LASF1824:
	.string	"CS6 0000020"
.LASF1080:
	.string	"__S_ISUID 04000"
.LASF425:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF684:
	.string	"__blkcnt_t_defined "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF1266:
	.string	"_SC_MEMORY_PROTECTION _SC_MEMORY_PROTECTION"
.LASF501:
	.string	"__WNOTHREAD 0x20000000"
.LASF1957:
	.string	"txBuffer"
.LASF478:
	.string	"_T_WCHAR "
.LASF471:
	.string	"_SIZET_ "
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF730:
	.string	"LED1_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF400:
	.string	"UINT16_MAX (65535)"
.LASF869:
	.string	"_G_va_list __gnuc_va_list"
.LASF1739:
	.string	"_HAVE_STRUCT_TERMIOS_C_OSPEED 1"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF228:
	.string	"__MMX__ 1"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF582:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF826:
	.string	"_STDDEF_H_ "
.LASF1113:
	.string	"X_OK 1"
.LASF298:
	.string	"_ATFILE_SOURCE 1"
.LASF770:
	.string	"UART3_TX_PINSOURCE GPIO_PinSource10"
.LASF726:
	.string	"LED0_PIN_2 Pin_8"
.LASF548:
	.string	"_BITS_TYPESIZES_H 1"
.LASF1213:
	.string	"__ILP32_OFF32_LDFLAGS \"-m32\""
.LASF1649:
	.string	"ENOCSI 50"
.LASF1666:
	.string	"ENOLINK 67"
.LASF1446:
	.string	"_SC_LEVEL4_CACHE_SIZE _SC_LEVEL4_CACHE_SIZE"
.LASF420:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF840:
	.string	"ARRAYEND(x) (&(x)[ARRAYLEN(x)])"
.LASF1026:
	.string	"__F_SETOWN_EX 15"
.LASF964:
	.string	"BUFSIZ _IO_BUFSIZ"
.LASF447:
	.string	"UINT16_C(c) c"
.LASF1717:
	.string	"ENOTNAM 118"
.LASF688:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF703:
	.string	"_ALLOCA_H 1"
.LASF1337:
	.string	"_SC_PASS_MAX _SC_PASS_MAX"
.LASF1656:
	.string	"EBADSLT 57"
.LASF821:
	.string	"INLINE_UNIT_TESTED inline"
.LASF1060:
	.string	"_STAT_VER_LINUX 1"
.LASF433:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF1125:
	.string	"MRAA_RETURN_FOR_ERROR(func) do { mraa_result_t res; res = func; if (res != MRAA_SUCCESS) return res;} while(0)"
.LASF1565:
	.string	"CLOCK_BOOTTIME 7"
.LASF1258:
	.string	"_SC_TIMERS _SC_TIMERS"
.LASF231:
	.string	"__FXSR__ 1"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF594:
	.string	"le16toh(x) (x)"
.LASF1290:
	.string	"_SC_EXPR_NEST_MAX _SC_EXPR_NEST_MAX"
.LASF435:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF1202:
	.string	"_POSIX_TRACE_EVENT_FILTER -1"
.LASF1690:
	.string	"EPROTOTYPE 91"
.LASF656:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF1514:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS"
.LASF1752:
	.string	"VREPRINT 12"
.LASF833:
	.string	"_BSD_PTRDIFF_T_ "
.LASF479:
	.string	"__WCHAR_T "
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF1229:
	.string	"_PC_NAME_MAX _PC_NAME_MAX"
.LASF1941:
	.string	"SERIAL_INVERTED"
.LASF1072:
	.string	"__S_IFBLK 0060000"
.LASF624:
	.string	"__u_char_defined "
.LASF1542:
	.string	"__CPUELT(cpu) ((cpu) / __NCPUBITS)"
.LASF1964:
	.string	"serialPortVTable"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF1978:
	.string	"txBuf"
.LASF610:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF671:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF1942:
	.string	"SERIAL_STOPBITS_1"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF1938:
	.string	"portMode_t"
.LASF1759:
	.string	"IGNPAR 0000004"
.LASF848:
	.string	"BITCOUNT(x) (((BX_(x)+(BX_(x)>>4)) & 0x0F0F0F0F) % 255)"
.LASF1591:
	.ascii	"pthread_cleanup_push(routine,arg) do { __pthread_unwind_buf_"
	.ascii	"t __cancel_buf; void (*__cancel_routine) (void *) = (routine"
	.ascii	"); void *__cancel_arg = (arg); int __not_fir"
	.string	"st_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *) __cancel_buf.__cancel_jmp_buf, 0); if (__glibc_unlikely (__not_first_call)) { __cancel_routine (__cancel_arg); __pthread_unwind_next (&__cancel_buf); } __pthread_register_cancel (&__cancel_buf); do {"
.LASF1104:
	.string	"S_IWGRP (S_IWUSR >> 3)"
.LASF809:
	.string	"BINDPLUG_PORT GPIOB"
.LASF1934:
	.string	"long long unsigned int"
.LASF625:
	.string	"__ino_t_defined "
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF615:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF1093:
	.string	"S_IFIFO __S_IFIFO"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF740:
	.string	"USE_ACC_MPU6050 "
.LASF1720:
	.string	"EREMOTEIO 121"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF1445:
	.string	"_SC_LEVEL3_CACHE_LINESIZE _SC_LEVEL3_CACHE_LINESIZE"
.LASF1721:
	.string	"EDQUOT 122"
.LASF761:
	.string	"UART2_RX_PIN GPIO_Pin_3"
.LASF1253:
	.string	"_SC_TZNAME_MAX _SC_TZNAME_MAX"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF1475:
	.string	"_CS_LFS_LINTFLAGS _CS_LFS_LINTFLAGS"
.LASF1579:
	.string	"PTHREAD_SCOPE_PROCESS PTHREAD_SCOPE_PROCESS"
.LASF745:
	.string	"MAG "
.LASF320:
	.string	"__BEGIN_DECLS "
.LASF1408:
	.string	"_SC_SPAWN _SC_SPAWN"
.LASF358:
	.string	"__restrict_arr __restrict"
.LASF1880:
	.string	"CCEQ(val,c) ((c) == (val) && (val) != _POSIX_VDISABLE)"
.LASF1520:
	.string	"_CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS"
.LASF853:
	.string	"LOG2_64BIT(v) (32*((v)/2L>>31 > 0) + LOG2_32BIT((v)*1L >>16*((v)/2L>>31 > 0) >>16*((v)/2L>>31 > 0)))"
.LASF254:
	.string	"_STDINT_H 1"
.LASF1002:
	.string	"__O_DIRECT 040000"
.LASF628:
	.string	"__mode_t_defined "
.LASF864:
	.string	"_G_config_h 1"
.LASF768:
	.string	"UART3_GPIO_AF GPIO_AF_7"
.LASF1303:
	.string	"_SC_PII_SOCKET _SC_PII_SOCKET"
.LASF1662:
	.string	"ENOSR 63"
.LASF719:
	.string	"LED0_GPIO GPIOB"
.LASF1948:
	.string	"serialReceiveCallbackPtr"
.LASF777:
	.string	"I2C2_SCL_PIN_SOURCE GPIO_PinSource9"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF1917:
	.string	"UART5_RX_BUFFER_SIZE 256"
.LASF294:
	.string	"__USE_POSIX199506 1"
.LASF1226:
	.string	"_PC_LINK_MAX _PC_LINK_MAX"
.LASF1308:
	.string	"_SC_UIO_MAXIOV _SC_UIO_MAXIOV"
.LASF760:
	.string	"UART2_TX_PIN GPIO_Pin_2"
.LASF638:
	.string	"__need_time_t "
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF620:
	.string	"EXIT_FAILURE 1"
.LASF380:
	.string	"__stub_revoke "
.LASF1375:
	.string	"_SC_XBS5_ILP32_OFFBIG _SC_XBS5_ILP32_OFFBIG"
.LASF359:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF1529:
	.string	"_CS_V7_ENV _CS_V7_ENV"
.LASF1418:
	.string	"_SC_2_PBS_ACCOUNTING _SC_2_PBS_ACCOUNTING"
.LASF509:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF1294:
	.string	"_SC_2_VERSION _SC_2_VERSION"
.LASF1477:
	.string	"_CS_LFS64_LDFLAGS _CS_LFS64_LDFLAGS"
.LASF769:
	.string	"UART3_GPIO GPIOB"
.LASF1276:
	.string	"_SC_VERSION _SC_VERSION"
.LASF808:
	.string	"HARDWARE_BIND_PLUG "
.LASF296:
	.string	"__USE_XOPEN2K8 1"
.LASF563:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF951:
	.string	"_IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF1630:
	.string	"EMLINK 31"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF1183:
	.string	"_POSIX_REGEXP 1"
.LASF880:
	.string	"_IO_off64_t __off64_t"
.LASF989:
	.string	"O_CREAT 0100"
.LASF991:
	.string	"O_NOCTTY 0400"
.LASF1428:
	.string	"_SC_V6_LPBIG_OFFBIG _SC_V6_LPBIG_OFFBIG"
.LASF1902:
	.string	"CDISCARD CTRL('o')"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF1826:
	.string	"CS8 0000060"
.LASF634:
	.string	"__ssize_t_defined "
.LASF1359:
	.string	"_SC_SSIZE_MAX _SC_SSIZE_MAX"
.LASF1489:
	.string	"_CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS"
.LASF297:
	.string	"_ATFILE_SOURCE"
.LASF1732:
	.string	"EHWPOISON 133"
.LASF1825:
	.string	"CS7 0000040"
.LASF1839:
	.string	"B576000 0010006"
.LASF860:
	.string	"____FILE_defined 1"
.LASF1994:
	.string	"U_ID_0"
.LASF1995:
	.string	"U_ID_1"
.LASF1996:
	.string	"U_ID_2"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF1538:
	.string	"__need_schedparam"
.LASF1360:
	.string	"_SC_SCHAR_MAX _SC_SCHAR_MAX"
.LASF262:
	.string	"__USE_POSIX199309"
.LASF1852:
	.string	"CRTSCTS 020000000000"
.LASF1963:
	.string	"serialPort_s"
.LASF1255:
	.string	"_SC_SAVED_IDS _SC_SAVED_IDS"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF1440:
	.string	"_SC_LEVEL2_CACHE_SIZE _SC_LEVEL2_CACHE_SIZE"
.LASF1100:
	.string	"S_IWUSR __S_IWRITE"
.LASF1967:
	.string	"serialTotalTxFree"
.LASF1783:
	.string	"CRDLY 0003000"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF340:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF1785:
	.string	"CR1 0001000"
.LASF1405:
	.string	"_SC_REGEX_VERSION _SC_REGEX_VERSION"
.LASF1268:
	.string	"_SC_SEMAPHORES _SC_SEMAPHORES"
.LASF812:
	.string	"TARGET_IO_PORTB 0xffff"
.LASF1552:
	.string	"__CPU_ALLOC(count) __sched_cpualloc (count)"
.LASF1999:
	.string	"src/main/drivers/serial_usb_vcp.c"
.LASF288:
	.string	"_POSIX_SOURCE 1"
.LASF1806:
	.string	"B75 0000002"
.LASF1392:
	.string	"_SC_FD_MGMT _SC_FD_MGMT"
.LASF1627:
	.string	"ENOSPC 28"
.LASF1084:
	.string	"__S_IWRITE 0200"
.LASF1553:
	.string	"__CPU_FREE(cpuset) __sched_cpufree (cpuset)"
.LASF1195:
	.string	"_POSIX_ADVISORY_INFO 200809L"
.LASF705:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF1809:
	.string	"B150 0000005"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF780:
	.string	"I2C2_SDA_GPIO_AF GPIO_AF_4"
.LASF1455:
	.string	"_SC_SS_REPL_MAX _SC_SS_REPL_MAX"
.LASF432:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF799:
	.string	"DEFAULT_RX_FEATURE FEATURE_RX_SERIAL"
.LASF709:
	.string	"bool _Bool"
.LASF834:
	.string	"___int_ptrdiff_t_h "
.LASF1479:
	.string	"_CS_LFS64_LINTFLAGS _CS_LFS64_LINTFLAGS"
.LASF911:
	.string	"_IO_ERR_SEEN 0x20"
.LASF854:
	.string	"container_of(ptr,type,member) ( __extension__ ({ const typeof( ((type *)0)->member ) *__mptr = (ptr); (type *)( (char *)__mptr - offsetof(type,member) );}))"
.LASF1167:
	.string	"_POSIX_THREAD_PRIO_PROTECT 200809L"
.LASF578:
	.string	"__TIMER_T_TYPE void *"
.LASF906:
	.string	"_IO_USER_BUF 1"
.LASF817:
	.string	"UNUSED(x) (void)(x)"
.LASF1810:
	.string	"B200 0000006"
.LASF727:
	.string	"LED0_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF1639:
	.string	"ELOOP 40"
.LASF784:
	.string	"USE_SPI "
.LASF1547:
	.string	"__CPU_ISSET_S(cpu,setsize,cpusetp) (__extension__ ({ size_t __cpu = (cpu); __cpu / 8 < (setsize) ? ((((const __cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)] & __CPUMASK (__cpu))) != 0 : 0; }))"
.LASF1990:
	.string	"usbVcpOpen"
.LASF591:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF983:
	.string	"F_SETLK64 6"
.LASF303:
	.string	"__GNU_LIBRARY__ 6"
.LASF674:
	.string	"NFDBITS __NFDBITS"
.LASF1933:
	.string	"long long int"
.LASF1663:
	.string	"ENONET 64"
.LASF569:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF440:
	.string	"WINT_MIN (0u)"
.LASF1427:
	.string	"_SC_V6_LP64_OFF64 _SC_V6_LP64_OFF64"
.LASF1977:
	.string	"port"
.LASF877:
	.string	"_IO_size_t size_t"
.LASF1998:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF1646:
	.string	"EL3RST 47"
.LASF1417:
	.string	"_SC_2_PBS _SC_2_PBS"
.LASF486:
	.string	"__INT_WCHAR_T_H "
.LASF1711:
	.string	"EHOSTDOWN 112"
.LASF1406:
	.string	"_SC_SHELL _SC_SHELL"
.LASF813:
	.string	"TARGET_IO_PORTC 0xffff"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF1380:
	.string	"_SC_XOPEN_REALTIME_THREADS _SC_XOPEN_REALTIME_THREADS"
.LASF677:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF1008:
	.string	"F_SETLK 6"
.LASF1472:
	.string	"_CS_LFS_CFLAGS _CS_LFS_CFLAGS"
.LASF1181:
	.string	"_POSIX_CPUTIME 0"
.LASF803:
	.string	"USE_QUAD_MIXER_ONLY "
.LASF504:
	.string	"__ENUM_IDTYPE_T 1"
.LASF612:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF1575:
	.string	"PTHREAD_RWLOCK_INITIALIZER { { 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, 0 } }"
.LASF1494:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF1334:
	.string	"_SC_PHYS_PAGES _SC_PHYS_PAGES"
.LASF698:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF1092:
	.string	"S_IFREG __S_IFREG"
.LASF510:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF1505:
	.string	"_CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS"
.LASF1876:
	.string	"TCSANOW 0"
.LASF1354:
	.string	"_SC_INT_MIN _SC_INT_MIN"
.LASF1847:
	.string	"B3500000 0010016"
.LASF1673:
	.string	"EBADMSG 74"
.LASF1141:
	.string	"_XOPEN_CRYPT 1"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF1767:
	.string	"IXON 0002000"
.LASF1664:
	.string	"ENOPKG 65"
.LASF1482:
	.string	"_CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS"
.LASF229:
	.string	"__SSE__ 1"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF1747:
	.string	"VSWTC 7"
.LASF953:
	.string	"_IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr - (_fp)->_IO_write_base)"
.LASF275:
	.string	"__USE_ATFILE"
.LASF962:
	.string	"_IOLBF 1"
.LASF1875:
	.string	"TCIOFLUSH 2"
.LASF1131:
	.string	"_POSIX2_C_BIND __POSIX2_THIS_VERSION"
.LASF1710:
	.string	"ECONNREFUSED 111"
.LASF752:
	.string	"SERIAL_PORT_COUNT 2"
.LASF1064:
	.string	"st_mtime st_mtim.tv_sec"
.LASF1335:
	.string	"_SC_AVPHYS_PAGES _SC_AVPHYS_PAGES"
.LASF759:
	.string	"UART1_RX_PINSOURCE GPIO_PinSource7"
.LASF238:
	.string	"__unix 1"
.LASF1490:
	.string	"_CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF715:
	.string	"__IO volatile"
.LASF1476:
	.string	"_CS_LFS64_CFLAGS _CS_LFS64_CFLAGS"
.LASF1264:
	.string	"_SC_MEMLOCK _SC_MEMLOCK"
.LASF1601:
	.string	"ENOENT 2"
.LASF347:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF1388:
	.string	"_SC_THREAD_CPUTIME _SC_THREAD_CPUTIME"
.LASF1085:
	.string	"__S_IEXEC 0100"
.LASF961:
	.string	"_IOFBF 0"
.LASF427:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF839:
	.string	"ARRAYLEN(x) (sizeof(x) / sizeof((x)[0]))"
.LASF1628:
	.string	"ESPIPE 29"
.LASF1707:
	.string	"ESHUTDOWN 108"
.LASF1724:
	.string	"ECANCELED 125"
.LASF434:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF1298:
	.string	"_SC_2_FORT_RUN _SC_2_FORT_RUN"
.LASF571:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF602:
	.string	"le64toh(x) (x)"
.LASF1511:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS"
.LASF910:
	.string	"_IO_EOF_SEEN 0x10"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF1795:
	.string	"BS1 0020000"
.LASF728:
	.string	"LED1_GPIO_2 GPIOB"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF568:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1076:
	.string	"__S_IFSOCK 0140000"
.LASF639:
	.string	"__need_timer_t "
.LASF1819:
	.string	"B38400 0000017"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF1234:
	.string	"_PC_VDISABLE _PC_VDISABLE"
.LASF392:
	.string	"INT16_MIN (-32767-1)"
.LASF1124:
	.string	"MRAA_SUB_PLATFORM_OFFSET 1"
.LASF561:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF1800:
	.string	"VT0 0000000"
.LASF1211:
	.string	"_XBS5_LP64_OFF64 1"
.LASF1764:
	.string	"IGNCR 0000200"
.LASF801:
	.string	"SERIAL_RX "
.LASF1041:
	.string	"FASYNC O_ASYNC"
.LASF1000:
	.string	"__O_NOFOLLOW 0400000"
.LASF1262:
	.string	"_SC_FSYNC _SC_FSYNC"
.LASF1773:
	.string	"OLCUC 0000002"
.LASF1320:
	.string	"_SC_LOGIN_NAME_MAX _SC_LOGIN_NAME_MAX"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF1474:
	.string	"_CS_LFS_LIBS _CS_LFS_LIBS"
.LASF750:
	.string	"USB_IO "
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF457:
	.string	"__SIZE_T__ "
.LASF1312:
	.string	"_SC_PII_OSI_COTS _SC_PII_OSI_COTS"
.LASF1175:
	.string	"_POSIX_PRIORITIZED_IO 200809L"
.LASF907:
	.string	"_IO_UNBUFFERED 2"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF557:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF218:
	.string	"__amd64__ 1"
.LASF305:
	.string	"__GLIBC_MINOR__ 23"
.LASF1387:
	.string	"_SC_CPUTIME _SC_CPUTIME"
.LASF331:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF317:
	.string	"__STRING(x) #x"
.LASF1861:
	.string	"TOSTOP 0000400"
.LASF1036:
	.string	"LOCK_EX 2"
.LASF874:
	.string	"_G_BUFSIZ 8192"
.LASF850:
	.string	"LOG2_8BIT(v) (8 - 90/(((v)/4+14)|1) - 2/((v)/2+1))"
.LASF1624:
	.string	"ENOTTY 25"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF1874:
	.string	"TCOFLUSH 1"
.LASF1985:
	.string	"isUsbVcpTransmitBufferEmpty"
.LASF1164:
	.string	"_POSIX_THREAD_ATTR_STACKSIZE 200809L"
.LASF1929:
	.string	"unsigned int"
.LASF1713:
	.string	"EALREADY 114"
.LASF1499:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS"
.LASF1653:
	.string	"EXFULL 54"
.LASF1698:
	.string	"EADDRNOTAVAIL 99"
.LASF1495:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS"
.LASF1660:
	.string	"ENODATA 61"
.LASF1362:
	.string	"_SC_SHRT_MAX _SC_SHRT_MAX"
.LASF1492:
	.string	"_CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS"
.LASF1460:
	.string	"_SC_XOPEN_STREAMS _SC_XOPEN_STREAMS"
.LASF342:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF1069:
	.string	"__S_IFMT 0170000"
.LASF1873:
	.string	"TCIFLUSH 0"
.LASF592:
	.string	"htole16(x) (x)"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF929:
	.string	"_IO_DEC 020"
.LASF1510:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS"
.LASF1709:
	.string	"ETIMEDOUT 110"
.LASF876:
	.string	"_IO_fpos64_t _G_fpos64_t"
.LASF549:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF1023:
	.string	"F_GETOWN __F_GETOWN"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF1922:
	.string	"short int"
.LASF800:
	.string	"DEFAULT FEATURES FEATURE_MOTOR_STOP"
.LASF406:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF533:
	.string	"__S16_TYPE short int"
.LASF1173:
	.string	"_POSIX_ASYNC_IO 1"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF1331:
	.string	"_SC_THREAD_PROCESS_SHARED _SC_THREAD_PROCESS_SHARED"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF1878:
	.string	"TCSAFLUSH 2"
.LASF948:
	.string	"_IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF16:
	.string	"_LP64 1"
.LASF1856:
	.string	"ECHO 0000010"
.LASF616:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF545:
	.string	"__S64_TYPE long int"
.LASF458:
	.string	"_SIZE_T "
.LASF673:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF5:
	.string	"__GNUC__ 5"
.LASF1935:
	.string	"MODE_RX"
.LASF243:
	.string	"DEBUG 1"
.LASF999:
	.string	"__O_DIRECTORY 0200000"
.LASF1261:
	.string	"_SC_SYNCHRONIZED_IO _SC_SYNCHRONIZED_IO"
.LASF1535:
	.string	"SCHED_FIFO 1"
.LASF609:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF1840:
	.string	"B921600 0010007"
.LASF1952:
	.string	"options"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF1033:
	.string	"F_EXLCK 4"
.LASF1485:
	.string	"_CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF285:
	.string	"__USE_ISOC95 1"
.LASF1715:
	.string	"ESTALE 116"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF1895:
	.string	"CQUIT 034"
.LASF945:
	.string	"_IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))"
.LASF980:
	.string	"_FCNTL_H 1"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF1641:
	.string	"ENOMSG 42"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
