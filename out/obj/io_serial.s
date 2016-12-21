	.file	"io_serial.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed io_serial.i -mtune=generic -march=x86-64
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
	.comm	receiveLength,4,4
	.comm	serialConfig_System,28,16
	.section	.text.serialConfig,"ax",@progbits
	.type	serialConfig, @function
serialConfig:
.LFB8:
	.file 1 "./src/main/io/io_serial.h"
	.loc 1 101 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 101 0
	movl	$serialConfig_System, %eax	#, D.5609
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	serialConfig, .-serialConfig
	.section	.bss.serialPortUsageList,"aw",@nobits
	.align 32
	.type	serialPortUsageList, @object
	.size	serialPortUsageList, 48
serialPortUsageList:
	.zero	48
	.globl	serialPortIdentifiers
	.section	.rodata.serialPortIdentifiers,"a",@progbits
	.align 8
	.type	serialPortIdentifiers, @object
	.size	serialPortIdentifiers, 8
serialPortIdentifiers:
	.long	20
	.zero	4
	.section	.bss.serialPortCount,"aw",@nobits
	.type	serialPortCount, @object
	.size	serialPortCount, 1
serialPortCount:
	.zero	1
	.globl	baudRates
	.section	.rodata.baudRates,"a",@progbits
	.align 32
	.type	baudRates, @object
	.size	baudRates, 32
baudRates:
	.long	0
	.long	9600
	.long	19200
	.long	38400
	.long	57600
	.long	115200
	.long	230400
	.long	250000
	.section	.text.lookupBaudRateIndex,"ax",@progbits
	.globl	lookupBaudRateIndex
	.type	lookupBaudRateIndex, @function
lookupBaudRateIndex:
.LFB9:
	.file 2 "src/main/io/io_serial.c"
	.loc 2 95 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# baudRate, baudRate
	.loc 2 98 0
	movb	$0, -1(%rbp)	#, index
	jmp	.L4	#
.L7:
	.loc 2 99 0
	movzbl	-1(%rbp), %eax	# index, D.5611
	cltq
	movl	baudRates(,%rax,4), %eax	# baudRates, D.5612
	cmpl	-20(%rbp), %eax	# baudRate, D.5612
	jne	.L5	#,
	.loc 2 100 0
	movzbl	-1(%rbp), %eax	# index, D.5610
	jmp	.L6	#
.L5:
	.loc 2 98 0 discriminator 2
	movzbl	-1(%rbp), %eax	# index, D.5613
	addl	$1, %eax	#, tmp93
	movb	%al, -1(%rbp)	# tmp93, index
.L4:
	.loc 2 98 0 is_stmt 0 discriminator 1
	cmpb	$7, -1(%rbp)	#, index
	jbe	.L7	#,
	.loc 2 103 0 is_stmt 1
	movl	$0, %eax	#, D.5610
.L6:
	.loc 2 104 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	lookupBaudRateIndex, .-lookupBaudRateIndex
	.section	.text.findSerialPortUsageByIdentifier,"ax",@progbits
	.type	findSerialPortUsageByIdentifier, @function
findSerialPortUsageByIdentifier:
.LFB10:
	.loc 2 107 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# identifier, identifier
	.loc 2 109 0
	movb	$0, -9(%rbp)	#, index
	jmp	.L9	#
.L12:
.LBB2:
	.loc 2 110 0
	movzbl	-9(%rbp), %eax	# index, D.5615
	movslq	%eax, %rdx	# D.5615, tmp92
	movq	%rdx, %rax	# tmp92, tmp93
	addq	%rax, %rax	# tmp93
	addq	%rdx, %rax	# tmp92, tmp93
	salq	$3, %rax	#, tmp94
	addq	$serialPortUsageList, %rax	#, tmp95
	movq	%rax, -8(%rbp)	# tmp95, candidate
	.loc 2 111 0
	movq	-8(%rbp), %rax	# candidate, tmp96
	movl	(%rax), %eax	# candidate_5->identifier, D.5616
	cmpl	-20(%rbp), %eax	# identifier, D.5616
	jne	.L10	#,
	.loc 2 112 0
	movq	-8(%rbp), %rax	# candidate, D.5614
	jmp	.L11	#
.L10:
.LBE2:
	.loc 2 109 0 discriminator 2
	movzbl	-9(%rbp), %eax	# index, D.5617
	addl	$1, %eax	#, tmp97
	movb	%al, -9(%rbp)	# tmp97, index
.L9:
	.loc 2 109 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%rbp)	#, index
	jbe	.L12	#,
	.loc 2 115 0 is_stmt 1
	movl	$0, %eax	#, D.5614
.L11:
	.loc 2 116 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	findSerialPortUsageByIdentifier, .-findSerialPortUsageByIdentifier
	.section	.text.findSerialPortUsageByPort,"ax",@progbits
	.globl	findSerialPortUsageByPort
	.type	findSerialPortUsageByPort, @function
findSerialPortUsageByPort:
.LFB11:
	.loc 2 119 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# serialPort, serialPort
	.loc 2 121 0
	movb	$0, -9(%rbp)	#, index
	jmp	.L14	#
.L17:
.LBB3:
	.loc 2 122 0
	movzbl	-9(%rbp), %eax	# index, D.5619
	movslq	%eax, %rdx	# D.5619, tmp92
	movq	%rdx, %rax	# tmp92, tmp93
	addq	%rax, %rax	# tmp93
	addq	%rdx, %rax	# tmp92, tmp93
	salq	$3, %rax	#, tmp94
	addq	$serialPortUsageList, %rax	#, tmp95
	movq	%rax, -8(%rbp)	# tmp95, candidate
	.loc 2 123 0
	movq	-8(%rbp), %rax	# candidate, tmp96
	movq	8(%rax), %rax	# candidate_5->serialPort, D.5620
	cmpq	-24(%rbp), %rax	# serialPort, D.5620
	jne	.L15	#,
	.loc 2 124 0
	movq	-8(%rbp), %rax	# candidate, D.5618
	jmp	.L16	#
.L15:
.LBE3:
	.loc 2 121 0 discriminator 2
	movzbl	-9(%rbp), %eax	# index, D.5621
	addl	$1, %eax	#, tmp97
	movb	%al, -9(%rbp)	# tmp97, index
.L14:
	.loc 2 121 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%rbp)	#, index
	jbe	.L17	#,
	.loc 2 127 0 is_stmt 1
	movl	$0, %eax	#, D.5618
.L16:
	.loc 2 128 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	findSerialPortUsageByPort, .-findSerialPortUsageByPort
	.section	.bss.findSerialPortConfigState,"aw",@nobits
	.type	findSerialPortConfigState, @object
	.size	findSerialPortConfigState, 1
findSerialPortConfigState:
	.zero	1
	.section	.text.findSerialPortConfig,"ax",@progbits
	.globl	findSerialPortConfig
	.type	findSerialPortConfig, @function
findSerialPortConfig:
.LFB12:
	.loc 2 137 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, %eax	# mask, tmp90
	movw	%ax, -4(%rbp)	# tmp90, mask
	.loc 2 138 0
	movl	$1, %edx	#,
	movl	$0, %esi	#,
	movl	$findSerialPortConfigState, %edi	#,
	call	memset	#
	.loc 2 140 0
	movzwl	-4(%rbp), %eax	# mask, D.5622
	movl	%eax, %edi	# D.5622,
	call	findNextSerialPortConfig	#
	.loc 2 141 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	findSerialPortConfig, .-findSerialPortConfig
	.section	.text.findNextSerialPortConfig,"ax",@progbits
	.globl	findNextSerialPortConfig
	.type	findNextSerialPortConfig, @function
findNextSerialPortConfig:
.LFB13:
	.loc 2 144 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movl	%edi, %eax	# mask, tmp96
	movw	%ax, -20(%rbp)	# tmp96, mask
	.loc 2 145 0
	jmp	.L21	#
.L23:
.LBB4:
	.loc 2 146 0
	call	serialConfig	#
	movq	%rax, %rcx	#, D.5626
	movzbl	findSerialPortConfigState(%rip), %eax	# findSerialPortConfigState.lastIndex, D.5625
	leal	1(%rax), %edx	#, D.5625
	movb	%dl, findSerialPortConfigState(%rip)	# D.5625, findSerialPortConfigState.lastIndex
	movzbl	%al, %eax	# D.5625, D.5627
	movslq	%eax, %rdx	# D.5627, tmp97
	movq	%rdx, %rax	# tmp97, tmp98
	addq	%rax, %rax	# tmp98
	addq	%rdx, %rax	# tmp97, tmp98
	salq	$2, %rax	#, tmp99
	addq	%rcx, %rax	# D.5626, tmp100
	addq	$4, %rax	#, tmp101
	movq	%rax, -8(%rbp)	# tmp101, candidate
	.loc 2 147 0
	movq	-8(%rbp), %rax	# candidate, tmp102
	movzwl	4(%rax), %eax	# candidate_13->functionMask, D.5628
	andw	-20(%rbp), %ax	# mask, D.5628
	testw	%ax, %ax	# D.5628
	je	.L21	#,
	.loc 2 148 0
	movq	-8(%rbp), %rax	# candidate, D.5624
	jmp	.L22	#
.L21:
.LBE4:
	.loc 2 145 0
	movzbl	findSerialPortConfigState(%rip), %eax	# findSerialPortConfigState.lastIndex, D.5625
	cmpb	$1, %al	#, D.5625
	jbe	.L23	#,
	.loc 2 151 0
	movl	$0, %eax	#, D.5624
.L22:
	.loc 2 152 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	findNextSerialPortConfig, .-findNextSerialPortConfig
	.section	.text.determinePortSharing,"ax",@progbits
	.globl	determinePortSharing
	.type	determinePortSharing, @function
determinePortSharing:
.LFB14:
	.loc 2 159 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# portConfig, portConfig
	movl	%esi, -12(%rbp)	# function, function
	.loc 2 160 0
	cmpq	$0, -8(%rbp)	#, portConfig
	je	.L25	#,
	.loc 2 160 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# portConfig, tmp94
	movzwl	4(%rax), %eax	# portConfig_3(D)->functionMask, D.5630
	movzwl	%ax, %eax	# D.5630, D.5631
	andl	-12(%rbp), %eax	# function, D.5631
	testl	%eax, %eax	# D.5631
	jne	.L26	#,
.L25:
	.loc 2 161 0 is_stmt 1
	movl	$0, %eax	#, D.5629
	jmp	.L27	#
.L26:
	.loc 2 163 0
	movq	-8(%rbp), %rax	# portConfig, tmp95
	movzwl	4(%rax), %eax	# portConfig_3(D)->functionMask, D.5630
	movzwl	%ax, %eax	# D.5630, D.5631
	cmpl	-12(%rbp), %eax	# function, D.5631
	jne	.L28	#,
	.loc 2 163 0 is_stmt 0 discriminator 1
	movl	$1, %eax	#, D.5629
	jmp	.L27	#
.L28:
	.loc 2 163 0 discriminator 2
	movl	$2, %eax	#, D.5629
.L27:
	.loc 2 164 0 is_stmt 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	determinePortSharing, .-determinePortSharing
	.section	.text.isSerialPortShared,"ax",@progbits
	.globl	isSerialPortShared
	.type	isSerialPortShared, @function
isSerialPortShared:
.LFB15:
	.loc 2 167 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# portConfig, portConfig
	movl	%esi, %eax	# functionMask, tmp95
	movl	%edx, -16(%rbp)	# sharedWithFunction, sharedWithFunction
	movw	%ax, -12(%rbp)	# tmp95, functionMask
	.loc 2 168 0
	cmpq	$0, -8(%rbp)	#, portConfig
	je	.L31	#,
	.loc 2 168 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# portConfig, tmp96
	movzwl	4(%rax), %eax	# portConfig_2(D)->functionMask, D.5633
	movzwl	%ax, %eax	# D.5633, D.5634
	andl	-16(%rbp), %eax	# sharedWithFunction, D.5634
	testl	%eax, %eax	# D.5634
	je	.L31	#,
	.loc 2 168 0 discriminator 3
	movq	-8(%rbp), %rax	# portConfig, tmp97
	movzwl	4(%rax), %eax	# portConfig_2(D)->functionMask, D.5633
	andw	-12(%rbp), %ax	# functionMask, D.5633
	testw	%ax, %ax	# D.5633
	je	.L31	#,
	.loc 2 168 0 discriminator 5
	movl	$1, %eax	#, D.5632
	jmp	.L32	#
.L31:
	.loc 2 168 0 discriminator 6
	movl	$0, %eax	#, D.5632
.L32:
	.loc 2 168 0 discriminator 8
	andl	$1, %eax	#, D.5635
	.loc 2 169 0 is_stmt 1 discriminator 8
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	isSerialPortShared, .-isSerialPortShared
	.section	.text.isSerialPortOpen,"ax",@progbits
	.globl	isSerialPortOpen
	.type	isSerialPortOpen, @function
isSerialPortOpen:
.LFB16:
	.loc 2 172 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movq	%rdi, -24(%rbp)	# portConfig, portConfig
	.loc 2 173 0
	movq	-24(%rbp), %rax	# portConfig, tmp92
	movl	(%rax), %eax	# portConfig_3(D)->identifier, D.5637
	movl	%eax, %edi	# D.5637,
	call	findSerialPortUsageByIdentifier	#
	movq	%rax, -8(%rbp)	# tmp93, serialPortUsage
	.loc 2 174 0
	cmpq	$0, -8(%rbp)	#, serialPortUsage
	je	.L35	#,
	.loc 2 174 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# serialPortUsage, tmp94
	movl	16(%rax), %eax	# serialPortUsage_6->function, D.5638
	testl	%eax, %eax	# D.5638
	je	.L35	#,
	.loc 2 174 0 discriminator 3
	movl	$1, %eax	#, D.5636
	jmp	.L36	#
.L35:
	.loc 2 174 0 discriminator 4
	movl	$0, %eax	#, D.5636
.L36:
	.loc 2 174 0 discriminator 6
	andl	$1, %eax	#, D.5639
	.loc 2 175 0 is_stmt 1 discriminator 6
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	isSerialPortOpen, .-isSerialPortOpen
	.section	.bss.findSharedSerialPortState,"aw",@nobits
	.type	findSharedSerialPortState, @object
	.size	findSharedSerialPortState, 1
findSharedSerialPortState:
	.zero	1
	.section	.text.findSharedSerialPort,"ax",@progbits
	.globl	findSharedSerialPort
	.type	findSharedSerialPort, @function
findSharedSerialPort:
.LFB17:
	.loc 2 181 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, %eax	# functionMask, tmp90
	movl	%esi, -8(%rbp)	# sharedWithFunction, sharedWithFunction
	movw	%ax, -4(%rbp)	# tmp90, functionMask
	.loc 2 182 0
	movl	$1, %edx	#,
	movl	$0, %esi	#,
	movl	$findSharedSerialPortState, %edi	#,
	call	memset	#
	.loc 2 184 0
	movzwl	-4(%rbp), %eax	# functionMask, D.5640
	movl	-8(%rbp), %edx	# sharedWithFunction, tmp91
	movl	%edx, %esi	# tmp91,
	movl	%eax, %edi	# D.5640,
	call	findNextSharedSerialPort	#
	.loc 2 185 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	findSharedSerialPort, .-findSharedSerialPort
	.section	.text.findNextSharedSerialPort,"ax",@progbits
	.globl	findNextSharedSerialPort
	.type	findNextSharedSerialPort, @function
findNextSharedSerialPort:
.LFB18:
	.loc 2 188 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movl	%edi, %eax	# functionMask, tmp97
	movl	%esi, -24(%rbp)	# sharedWithFunction, sharedWithFunction
	movw	%ax, -20(%rbp)	# tmp97, functionMask
	.loc 2 189 0
	jmp	.L41	#
.L44:
.LBB5:
	.loc 2 190 0
	call	serialConfig	#
	movq	%rax, %rcx	#, D.5644
	movzbl	findSharedSerialPortState(%rip), %eax	# findSharedSerialPortState.lastIndex, D.5643
	leal	1(%rax), %edx	#, D.5643
	movb	%dl, findSharedSerialPortState(%rip)	# D.5643, findSharedSerialPortState.lastIndex
	movzbl	%al, %eax	# D.5643, D.5645
	movslq	%eax, %rdx	# D.5645, tmp98
	movq	%rdx, %rax	# tmp98, tmp99
	addq	%rax, %rax	# tmp99
	addq	%rdx, %rax	# tmp98, tmp99
	salq	$2, %rax	#, tmp100
	addq	%rcx, %rax	# D.5644, tmp101
	addq	$4, %rax	#, tmp102
	movq	%rax, -16(%rbp)	# tmp102, candidate
	.loc 2 192 0
	movzwl	-20(%rbp), %ecx	# functionMask, D.5645
	movl	-24(%rbp), %edx	# sharedWithFunction, tmp103
	movq	-16(%rbp), %rax	# candidate, tmp104
	movl	%ecx, %esi	# D.5645,
	movq	%rax, %rdi	# tmp104,
	call	isSerialPortShared	#
	testb	%al, %al	# D.5646
	je	.L41	#,
.LBB6:
	.loc 2 193 0
	movq	-16(%rbp), %rax	# candidate, tmp105
	movl	(%rax), %eax	# candidate_13->identifier, D.5647
	movl	%eax, %edi	# D.5647,
	call	findSerialPortUsageByIdentifier	#
	movq	%rax, -8(%rbp)	# tmp106, serialPortUsage
	.loc 2 194 0
	cmpq	$0, -8(%rbp)	#, serialPortUsage
	jne	.L42	#,
	.loc 2 195 0
	jmp	.L41	#
.L42:
	.loc 2 197 0
	movq	-8(%rbp), %rax	# serialPortUsage, tmp107
	movq	8(%rax), %rax	# serialPortUsage_21->serialPort, D.5642
	jmp	.L43	#
.L41:
.LBE6:
.LBE5:
	.loc 2 189 0
	movzbl	findSharedSerialPortState(%rip), %eax	# findSharedSerialPortState.lastIndex, D.5643
	cmpb	$1, %al	#, D.5643
	jbe	.L44	#,
	.loc 2 200 0
	movl	$0, %eax	#, D.5642
.L43:
	.loc 2 201 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	findNextSharedSerialPort, .-findNextSharedSerialPort
	.section	.text.isSerialConfigValid,"ax",@progbits
	.globl	isSerialConfigValid
	.type	isSerialConfigValid, @function
isSerialConfigValid:
.LFB19:
	.loc 2 207 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# serialConfigToCheck, serialConfigToCheck
	.loc 2 215 0
	movb	$0, -11(%rbp)	#, mspPortCount
	.loc 2 218 0
	movb	$0, -10(%rbp)	#, index
	jmp	.L46	#
.L52:
.LBB7:
	.loc 2 219 0
	movzbl	-10(%rbp), %eax	# index, D.5649
	movslq	%eax, %rdx	# D.5649, tmp139
	movq	%rdx, %rax	# tmp139, tmp140
	addq	%rax, %rax	# tmp140
	addq	%rdx, %rax	# tmp139, tmp140
	salq	$2, %rax	#, tmp141
	movq	-24(%rbp), %rdx	# serialConfigToCheck, tmp143
	addq	%rdx, %rax	# tmp143, tmp142
	addq	$4, %rax	#, tmp144
	movq	%rax, -8(%rbp)	# tmp144, portConfig
	.loc 2 221 0
	movq	-8(%rbp), %rax	# portConfig, tmp145
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$513, %eax	#, D.5649
	testl	%eax, %eax	# D.5649
	je	.L47	#,
	.loc 2 222 0
	movzbl	-11(%rbp), %eax	# mspPortCount, D.5651
	addl	$1, %eax	#, tmp146
	movb	%al, -11(%rbp)	# tmp146, mspPortCount
.L47:
	.loc 2 225 0
	movq	-8(%rbp), %rax	# portConfig, tmp147
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	movzwl	%ax, %edx	# D.5650, D.5649
	movq	-8(%rbp), %rax	# portConfig, tmp148
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	shrw	%ax	# D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$2004318071, %eax	#, D.5649
	subl	%eax, %edx	# D.5649, D.5649
	movq	-8(%rbp), %rax	# portConfig, tmp149
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	shrw	$2, %ax	#, D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$858993459, %eax	#, D.5649
	subl	%eax, %edx	# D.5649, D.5649
	movq	-8(%rbp), %rax	# portConfig, tmp150
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	shrw	$3, %ax	#, D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$286331153, %eax	#, D.5649
	movl	%edx, %ecx	# D.5649, D.5649
	subl	%eax, %ecx	# D.5649, D.5649
	movq	-8(%rbp), %rax	# portConfig, tmp151
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	movzwl	%ax, %edx	# D.5650, D.5649
	movq	-8(%rbp), %rax	# portConfig, tmp152
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	shrw	%ax	# D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$2004318071, %eax	#, D.5649
	subl	%eax, %edx	# D.5649, D.5649
	movq	-8(%rbp), %rax	# portConfig, tmp153
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	shrw	$2, %ax	#, D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$858993459, %eax	#, D.5649
	subl	%eax, %edx	# D.5649, D.5649
	movq	-8(%rbp), %rax	# portConfig, tmp154
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	shrw	$3, %ax	#, D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$286331153, %eax	#, D.5649
	subl	%eax, %edx	# D.5649, D.5649
	movl	%edx, %eax	# D.5649, D.5649
	sarl	$4, %eax	#, D.5649
	addl	%ecx, %eax	# D.5649, D.5649
	andl	$252645135, %eax	#, D.5649
	movl	%eax, %edx	# D.5649, D.5649
	movslq	%edx, %rax	# D.5649, tmp155
	imulq	$-2139062143, %rax, %rax	#, tmp155, tmp156
	shrq	$32, %rax	#, tmp157
	addl	%edx, %eax	# D.5649, tmp158
	sarl	$7, %eax	#, tmp159
	movl	%eax, %ecx	# tmp159, tmp159
	movl	%edx, %eax	# D.5649, tmp160
	sarl	$31, %eax	#, tmp160
	subl	%eax, %ecx	# tmp160, D.5649
	movl	%ecx, %eax	# D.5649, D.5649
	movl	%eax, %ecx	# D.5649, tmp161
	sall	$8, %ecx	#, tmp162
	subl	%eax, %ecx	# D.5649, tmp161
	movl	%edx, %eax	# D.5649, D.5649
	subl	%ecx, %eax	# tmp161, D.5649
	movb	%al, -9(%rbp)	# D.5649, bitCount
	.loc 2 226 0
	cmpb	$1, -9(%rbp)	#, bitCount
	jbe	.L48	#,
	.loc 2 228 0
	cmpb	$2, -9(%rbp)	#, bitCount
	jbe	.L49	#,
	.loc 2 229 0
	movl	$0, %eax	#, D.5648
	jmp	.L50	#
.L49:
	.loc 2 232 0
	movq	-8(%rbp), %rax	# portConfig, tmp163
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$1, %eax	#, D.5649
	testl	%eax, %eax	# D.5649
	jne	.L51	#,
	.loc 2 233 0
	movl	$0, %eax	#, D.5648
	jmp	.L50	#
.L51:
	.loc 2 236 0
	movq	-8(%rbp), %rax	# portConfig, tmp164
	movzwl	4(%rax), %eax	# portConfig_9->functionMask, D.5650
	movzwl	%ax, %eax	# D.5650, D.5649
	andl	$444, %eax	#, D.5649
	testl	%eax, %eax	# D.5649
	jne	.L48	#,
	.loc 2 238 0
	movl	$0, %eax	#, D.5648
	jmp	.L50	#
.L48:
.LBE7:
	.loc 2 218 0 discriminator 2
	movzbl	-10(%rbp), %eax	# index, D.5651
	addl	$1, %eax	#, tmp165
	movb	%al, -10(%rbp)	# tmp165, index
.L46:
	.loc 2 218 0 is_stmt 0 discriminator 1
	cmpb	$1, -10(%rbp)	#, index
	jbe	.L52	#,
	.loc 2 243 0 is_stmt 1
	cmpb	$0, -11(%rbp)	#, mspPortCount
	je	.L53	#,
	.loc 2 243 0 is_stmt 0 discriminator 1
	cmpb	$2, -11(%rbp)	#, mspPortCount
	jbe	.L54	#,
.L53:
	.loc 2 244 0 is_stmt 1
	movl	$0, %eax	#, D.5648
	jmp	.L50	#
.L54:
	.loc 2 246 0
	movl	$1, %eax	#, D.5648
.L50:
	.loc 2 247 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	isSerialConfigValid, .-isSerialConfigValid
	.section	.text.serialFindPortConfiguration,"ax",@progbits
	.globl	serialFindPortConfiguration
	.type	serialFindPortConfiguration, @function
serialFindPortConfiguration:
.LFB20:
	.loc 2 250 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movl	%edi, -20(%rbp)	# identifier, identifier
	.loc 2 252 0
	movb	$0, -9(%rbp)	#, index
	jmp	.L56	#
.L59:
.LBB8:
	.loc 2 253 0
	call	serialConfig	#
	movq	%rax, %rcx	#, D.5653
	movzbl	-9(%rbp), %eax	# index, D.5654
	movslq	%eax, %rdx	# D.5654, tmp93
	movq	%rdx, %rax	# tmp93, tmp94
	addq	%rax, %rax	# tmp94
	addq	%rdx, %rax	# tmp93, tmp94
	salq	$2, %rax	#, tmp95
	addq	%rcx, %rax	# D.5653, tmp96
	addq	$4, %rax	#, tmp97
	movq	%rax, -8(%rbp)	# tmp97, candidate
	.loc 2 254 0
	movq	-8(%rbp), %rax	# candidate, tmp98
	movl	(%rax), %eax	# candidate_10->identifier, D.5655
	cmpl	-20(%rbp), %eax	# identifier, D.5655
	jne	.L57	#,
	.loc 2 255 0
	movq	-8(%rbp), %rax	# candidate, D.5652
	jmp	.L58	#
.L57:
.LBE8:
	.loc 2 252 0 discriminator 2
	movzbl	-9(%rbp), %eax	# index, D.5656
	addl	$1, %eax	#, tmp99
	movb	%al, -9(%rbp)	# tmp99, index
.L56:
	.loc 2 252 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%rbp)	#, index
	jbe	.L59	#,
	.loc 2 258 0 is_stmt 1
	movl	$0, %eax	#, D.5652
.L58:
	.loc 2 259 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	serialFindPortConfiguration, .-serialFindPortConfiguration
	.section	.text.doesConfigurationUsePort,"ax",@progbits
	.globl	doesConfigurationUsePort
	.type	doesConfigurationUsePort, @function
doesConfigurationUsePort:
.LFB21:
	.loc 2 262 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movl	%edi, -20(%rbp)	# identifier, identifier
	.loc 2 263 0
	movl	-20(%rbp), %eax	# identifier, tmp91
	movl	%eax, %edi	# tmp91,
	call	serialFindPortConfiguration	#
	movq	%rax, -8(%rbp)	# tmp92, candidate
	.loc 2 264 0
	cmpq	$0, -8(%rbp)	#, candidate
	je	.L61	#,
	.loc 2 264 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# candidate, tmp93
	movzwl	4(%rax), %eax	# candidate_5->functionMask, D.5658
	testw	%ax, %ax	# D.5658
	je	.L61	#,
	.loc 2 264 0 discriminator 3
	movl	$1, %eax	#, D.5657
	jmp	.L62	#
.L61:
	.loc 2 264 0 discriminator 4
	movl	$0, %eax	#, D.5657
.L62:
	.loc 2 264 0 is_stmt 1 discriminator 6
	andl	$1, %eax	#, D.5659
	.loc 2 265 0 discriminator 6
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	doesConfigurationUsePort, .-doesConfigurationUsePort
	.section	.text.openSerialPort,"ax",@progbits
	.globl	openSerialPort
	.type	openSerialPort, @function
openSerialPort:
.LFB22:
	.loc 2 274 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movl	%edi, -20(%rbp)	# identifier, identifier
	movl	%esi, -24(%rbp)	# function, function
	movq	%rdx, -32(%rbp)	# callback, callback
	movl	%ecx, -36(%rbp)	# baudRate, baudRate
	movl	%r8d, -40(%rbp)	# mode, mode
	movl	%r9d, -44(%rbp)	# options, options
	.loc 2 282 0
	movl	-20(%rbp), %eax	# identifier, tmp91
	movl	%eax, %edi	# tmp91,
	call	findSerialPortUsageByIdentifier	#
	movq	%rax, -8(%rbp)	# tmp92, serialPortUsage
	.loc 2 283 0
	cmpq	$0, -8(%rbp)	#, serialPortUsage
	je	.L65	#,
	.loc 2 283 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# serialPortUsage, tmp93
	movl	16(%rax), %eax	# serialPortUsage_8->function, D.5661
	testl	%eax, %eax	# D.5661
	je	.L66	#,
.L65:
	.loc 2 285 0 is_stmt 1
	movl	$0, %eax	#, D.5660
	jmp	.L67	#
.L66:
	.loc 2 288 0
	movq	$0, -16(%rbp)	#, serialPort
	.loc 2 289 0
	movl	-20(%rbp), %eax	# identifier, identifier
	cmpl	$20, %eax	#, identifier
	je	.L69	#,
	.loc 2 333 0
	jmp	.L70	#
.L69:
	.loc 2 292 0
	call	usbVcpOpen	#
	movq	%rax, -16(%rbp)	# tmp95, serialPort
	.loc 2 293 0
	nop
.L70:
	.loc 2 336 0
	cmpq	$0, -16(%rbp)	#, serialPort
	jne	.L71	#,
	.loc 2 337 0
	movl	$0, %eax	#, D.5660
	jmp	.L67	#
.L71:
	.loc 2 340 0
	movl	-20(%rbp), %eax	# identifier, tmp96
	movl	%eax, %edx	# tmp96, D.5662
	movq	-16(%rbp), %rax	# serialPort, tmp97
	movb	%dl, 8(%rax)	# D.5662, serialPort_1->identifier
	.loc 2 342 0
	movq	-8(%rbp), %rax	# serialPortUsage, tmp98
	movl	-24(%rbp), %edx	# function, tmp99
	movl	%edx, 16(%rax)	# tmp99, serialPortUsage_8->function
	.loc 2 343 0
	movq	-8(%rbp), %rax	# serialPortUsage, tmp100
	movq	-16(%rbp), %rdx	# serialPort, tmp101
	movq	%rdx, 8(%rax)	# tmp101, serialPortUsage_8->serialPort
	.loc 2 345 0
	movq	-16(%rbp), %rax	# serialPort, D.5660
.L67:
	.loc 2 347 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	openSerialPort, .-openSerialPort
	.section	.text.closeSerialPort,"ax",@progbits
	.globl	closeSerialPort
	.type	closeSerialPort, @function
closeSerialPort:
.LFB23:
	.loc 2 350 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movq	%rdi, -24(%rbp)	# serialPort, serialPort
	.loc 2 351 0
	movq	-24(%rbp), %rax	# serialPort, tmp87
	movq	%rax, %rdi	# tmp87,
	call	findSerialPortUsageByPort	#
	movq	%rax, -8(%rbp)	# tmp88, serialPortUsage
	.loc 2 352 0
	cmpq	$0, -8(%rbp)	#, serialPortUsage
	je	.L75	#,
	.loc 2 359 0
	movq	-24(%rbp), %rax	# serialPort, tmp89
	movq	$0, 64(%rax)	#, serialPort_3(D)->callback
	.loc 2 361 0
	movq	-8(%rbp), %rax	# serialPortUsage, tmp90
	movl	$0, 16(%rax)	#, serialPortUsage_5->function
	.loc 2 362 0
	movq	-8(%rbp), %rax	# serialPortUsage, tmp91
	movq	$0, 8(%rax)	#, serialPortUsage_5->serialPort
	jmp	.L72	#
.L75:
	.loc 2 354 0
	nop
.L72:
	.loc 2 363 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	closeSerialPort, .-closeSerialPort
	.section	.text.serialInit,"ax",@progbits
	.globl	serialInit
	.type	serialInit, @function
serialInit:
.LFB24:
	.loc 2 366 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, %eax	# softserialEnabled, tmp93
	movb	%al, -20(%rbp)	# tmp93, softserialEnabled
	.loc 2 369 0
	movb	$2, serialPortCount(%rip)	#, serialPortCount
	.loc 2 370 0
	movl	$48, %edx	#,
	movl	$0, %esi	#,
	movl	$serialPortUsageList, %edi	#,
	call	memset	#
	.loc 2 372 0
	movb	$0, -1(%rbp)	#, index
	jmp	.L77	#
.L79:
	.loc 2 373 0
	movzbl	-1(%rbp), %edx	# index, D.5663
	movzbl	-1(%rbp), %eax	# index, D.5663
	cltq
	movl	serialPortIdentifiers(,%rax,4), %ecx	# serialPortIdentifiers, D.5664
	movslq	%edx, %rdx	# D.5663, tmp95
	movq	%rdx, %rax	# tmp95, tmp97
	addq	%rax, %rax	# tmp97
	addq	%rdx, %rax	# tmp95, tmp97
	salq	$3, %rax	#, tmp98
	addq	$serialPortUsageList, %rax	#, tmp99
	movl	%ecx, (%rax)	# D.5664, serialPortUsageList[_8].identifier
	.loc 2 375 0
	movzbl	-20(%rbp), %eax	# softserialEnabled, tmp100
	xorl	$1, %eax	#, D.5665
	testb	%al, %al	# D.5665
	jne	.L78	#,
	.loc 2 391 0
	call	serialConfig	#
	movw	$1, 20(%rax)	#, _15->portConfigs[1].functionMask
.L78:
	.loc 2 372 0 discriminator 2
	movzbl	-1(%rbp), %eax	# index, D.5667
	addl	$1, %eax	#, tmp101
	movb	%al, -1(%rbp)	# tmp101, index
.L77:
	.loc 2 372 0 is_stmt 0 discriminator 1
	cmpb	$1, -1(%rbp)	#, index
	jbe	.L79	#,
	.loc 2 396 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	serialInit, .-serialInit
	.section	.text.serialRemovePort,"ax",@progbits
	.globl	serialRemovePort
	.type	serialRemovePort, @function
serialRemovePort:
.LFB25:
	.loc 2 399 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# identifier, identifier
.LBB9:
	.loc 2 400 0
	movb	$0, -1(%rbp)	#, index
	jmp	.L81	#
.L83:
	.loc 2 401 0
	movzbl	-1(%rbp), %eax	# index, D.5668
	movslq	%eax, %rdx	# D.5668, tmp93
	movq	%rdx, %rax	# tmp93, tmp95
	addq	%rax, %rax	# tmp95
	addq	%rdx, %rax	# tmp93, tmp95
	salq	$3, %rax	#, tmp96
	addq	$serialPortUsageList, %rax	#, tmp97
	movl	(%rax), %eax	# serialPortUsageList[_6].identifier, D.5669
	cmpl	-20(%rbp), %eax	# identifier, D.5669
	jne	.L82	#,
	.loc 2 402 0
	movzbl	-1(%rbp), %eax	# index, D.5668
	movslq	%eax, %rdx	# D.5668, tmp98
	movq	%rdx, %rax	# tmp98, tmp100
	addq	%rax, %rax	# tmp100
	addq	%rdx, %rax	# tmp98, tmp100
	salq	$3, %rax	#, tmp101
	addq	$serialPortUsageList, %rax	#, tmp102
	movl	$-1, (%rax)	#, serialPortUsageList[_9].identifier
	.loc 2 403 0
	movzbl	serialPortCount(%rip), %eax	# serialPortCount, D.5670
	subl	$1, %eax	#, D.5670
	movb	%al, serialPortCount(%rip)	# D.5670, serialPortCount
.L82:
	.loc 2 400 0 discriminator 2
	movzbl	-1(%rbp), %eax	# index, D.5670
	addl	$1, %eax	#, tmp103
	movb	%al, -1(%rbp)	# tmp103, index
.L81:
	.loc 2 400 0 is_stmt 0 discriminator 1
	cmpb	$1, -1(%rbp)	#, index
	jbe	.L83	#,
.LBE9:
	.loc 2 406 0 is_stmt 1
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	serialRemovePort, .-serialRemovePort
	.section	.text.serialGetAvailablePortCount,"ax",@progbits
	.globl	serialGetAvailablePortCount
	.type	serialGetAvailablePortCount, @function
serialGetAvailablePortCount:
.LFB26:
	.loc 2 409 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 410 0
	movzbl	serialPortCount(%rip), %eax	# serialPortCount, D.5671
	.loc 2 411 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	serialGetAvailablePortCount, .-serialGetAvailablePortCount
	.section	.text.serialIsPortAvailable,"ax",@progbits
	.globl	serialIsPortAvailable
	.type	serialIsPortAvailable, @function
serialIsPortAvailable:
.LFB27:
	.loc 2 414 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# identifier, identifier
.LBB10:
	.loc 2 415 0
	movb	$0, -1(%rbp)	#, index
	jmp	.L87	#
.L90:
	.loc 2 416 0
	movzbl	-1(%rbp), %eax	# index, D.5673
	movslq	%eax, %rdx	# D.5673, tmp92
	movq	%rdx, %rax	# tmp92, tmp94
	addq	%rax, %rax	# tmp94
	addq	%rdx, %rax	# tmp92, tmp94
	salq	$3, %rax	#, tmp95
	addq	$serialPortUsageList, %rax	#, tmp96
	movl	(%rax), %eax	# serialPortUsageList[_4].identifier, D.5674
	cmpl	-20(%rbp), %eax	# identifier, D.5674
	jne	.L88	#,
	.loc 2 417 0
	movl	$1, %eax	#, D.5672
	jmp	.L89	#
.L88:
	.loc 2 415 0 discriminator 2
	movzbl	-1(%rbp), %eax	# index, D.5675
	addl	$1, %eax	#, tmp97
	movb	%al, -1(%rbp)	# tmp97, index
.L87:
	.loc 2 415 0 is_stmt 0 discriminator 1
	cmpb	$1, -1(%rbp)	#, index
	jbe	.L90	#,
.LBE10:
	.loc 2 420 0 is_stmt 1
	movl	$0, %eax	#, D.5672
.L89:
	.loc 2 421 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	serialIsPortAvailable, .-serialIsPortAvailable
	.section	.text.waitForSerialPortToFinishTransmitting,"ax",@progbits
	.globl	waitForSerialPortToFinishTransmitting
	.type	waitForSerialPortToFinishTransmitting, @function
waitForSerialPortToFinishTransmitting:
.LFB28:
	.loc 2 424 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# serialPort, serialPort
	.loc 2 425 0
	jmp	.L92	#
.L93:
	.loc 2 426 0
	movl	$10, %edi	#,
	call	delay	#
.L92:
	.loc 2 425 0
	movq	-8(%rbp), %rax	# serialPort, tmp89
	movq	%rax, %rdi	# tmp89,
	call	isSerialTransmitBufferEmpty	#
	xorl	$1, %eax	#, D.5676
	testb	%al, %al	# D.5676
	jne	.L93	#,
	.loc 2 428 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	waitForSerialPortToFinishTransmitting, .-waitForSerialPortToFinishTransmitting
	.text
.Letext0:
	.file 3 "/usr/include/stdint.h"
	.file 4 "./src/main/config/parameter_group.h"
	.file 5 "./src/main/drivers/serial.h"
	.file 6 "./src/main/target/edison/target.h"
	.file 7 "./src/main/drivers/serial_usb_vcp.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xde2
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF158
	.byte	0xc
	.long	.LASF159
	.long	.LASF160
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
	.byte	0x3
	.byte	0x30
	.long	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x3
	.byte	0x31
	.long	0x62
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x3
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
	.byte	0x8
	.long	0x45
	.uleb128 0x4
	.long	.LASF14
	.byte	0x4
	.byte	0x15
	.long	0x57
	.uleb128 0x4
	.long	.LASF15
	.byte	0x4
	.byte	0x26
	.long	0xbc
	.uleb128 0x7
	.long	0xcc
	.uleb128 0x8
	.long	0x89
	.uleb128 0x8
	.long	0x37
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.byte	0x4
	.byte	0x2d
	.long	0xea
	.uleb128 0xa
	.string	"ptr"
	.byte	0x4
	.byte	0x2e
	.long	0x89
	.uleb128 0xa
	.string	"fn"
	.byte	0x4
	.byte	0x2f
	.long	0xea
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb1
	.uleb128 0xb
	.long	.LASF34
	.byte	0x20
	.byte	0x4
	.byte	0x28
	.long	0x139
	.uleb128 0xc
	.string	"pgn"
	.byte	0x4
	.byte	0x29
	.long	0xa6
	.byte	0
	.uleb128 0xd
	.long	.LASF16
	.byte	0x4
	.byte	0x2a
	.long	0x57
	.byte	0x2
	.uleb128 0xd
	.long	.LASF17
	.byte	0x4
	.byte	0x2b
	.long	0xa0
	.byte	0x8
	.uleb128 0xc
	.string	"ptr"
	.byte	0x4
	.byte	0x2c
	.long	0x139
	.byte	0x10
	.uleb128 0xd
	.long	.LASF18
	.byte	0x4
	.byte	0x30
	.long	0xcc
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa0
	.uleb128 0x4
	.long	.LASF19
	.byte	0x4
	.byte	0x31
	.long	0xf0
	.uleb128 0xe
	.long	.LASF23
	.byte	0x4
	.long	0x74
	.byte	0x5
	.byte	0x14
	.long	0x16d
	.uleb128 0xf
	.long	.LASF20
	.byte	0x1
	.uleb128 0xf
	.long	.LASF21
	.byte	0x2
	.uleb128 0xf
	.long	.LASF22
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF23
	.byte	0x5
	.byte	0x18
	.long	0x14a
	.uleb128 0xe
	.long	.LASF24
	.byte	0x4
	.long	0x74
	.byte	0x5
	.byte	0x1a
	.long	0x1b9
	.uleb128 0xf
	.long	.LASF25
	.byte	0
	.uleb128 0xf
	.long	.LASF26
	.byte	0x1
	.uleb128 0xf
	.long	.LASF27
	.byte	0
	.uleb128 0xf
	.long	.LASF28
	.byte	0x2
	.uleb128 0xf
	.long	.LASF29
	.byte	0
	.uleb128 0xf
	.long	.LASF30
	.byte	0x4
	.uleb128 0xf
	.long	.LASF31
	.byte	0
	.uleb128 0xf
	.long	.LASF32
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x5
	.byte	0x23
	.long	0x178
	.uleb128 0x4
	.long	.LASF33
	.byte	0x5
	.byte	0x25
	.long	0x1cf
	.uleb128 0x6
	.byte	0x8
	.long	0x1d5
	.uleb128 0x7
	.long	0x1e0
	.uleb128 0x8
	.long	0x57
	.byte	0
	.uleb128 0xb
	.long	.LASF35
	.byte	0x48
	.byte	0x5
	.byte	0x27
	.long	0x295
	.uleb128 0xd
	.long	.LASF36
	.byte	0x5
	.byte	0x29
	.long	0x31a
	.byte	0
	.uleb128 0xd
	.long	.LASF37
	.byte	0x5
	.byte	0x2b
	.long	0x45
	.byte	0x8
	.uleb128 0xd
	.long	.LASF38
	.byte	0x5
	.byte	0x2c
	.long	0x16d
	.byte	0xc
	.uleb128 0xd
	.long	.LASF39
	.byte	0x5
	.byte	0x2d
	.long	0x1b9
	.byte	0x10
	.uleb128 0xd
	.long	.LASF40
	.byte	0x5
	.byte	0x2f
	.long	0x69
	.byte	0x14
	.uleb128 0xd
	.long	.LASF41
	.byte	0x5
	.byte	0x31
	.long	0x69
	.byte	0x18
	.uleb128 0xd
	.long	.LASF42
	.byte	0x5
	.byte	0x32
	.long	0x69
	.byte	0x1c
	.uleb128 0xd
	.long	.LASF43
	.byte	0x5
	.byte	0x33
	.long	0x325
	.byte	0x20
	.uleb128 0xd
	.long	.LASF44
	.byte	0x5
	.byte	0x34
	.long	0x325
	.byte	0x28
	.uleb128 0xd
	.long	.LASF45
	.byte	0x5
	.byte	0x35
	.long	0x69
	.byte	0x30
	.uleb128 0xd
	.long	.LASF46
	.byte	0x5
	.byte	0x36
	.long	0x69
	.byte	0x34
	.uleb128 0xd
	.long	.LASF47
	.byte	0x5
	.byte	0x37
	.long	0x69
	.byte	0x38
	.uleb128 0xd
	.long	.LASF48
	.byte	0x5
	.byte	0x38
	.long	0x69
	.byte	0x3c
	.uleb128 0xd
	.long	.LASF49
	.byte	0x5
	.byte	0x3b
	.long	0x1c4
	.byte	0x40
	.byte	0
	.uleb128 0xb
	.long	.LASF50
	.byte	0x50
	.byte	0x5
	.byte	0x3e
	.long	0x31a
	.uleb128 0xd
	.long	.LASF51
	.byte	0x5
	.byte	0x3f
	.long	0x351
	.byte	0
	.uleb128 0xd
	.long	.LASF52
	.byte	0x5
	.byte	0x41
	.long	0x366
	.byte	0x8
	.uleb128 0xd
	.long	.LASF53
	.byte	0x5
	.byte	0x42
	.long	0x366
	.byte	0x10
	.uleb128 0xd
	.long	.LASF54
	.byte	0x5
	.byte	0x44
	.long	0x366
	.byte	0x18
	.uleb128 0xd
	.long	.LASF55
	.byte	0x5
	.byte	0x47
	.long	0x37c
	.byte	0x20
	.uleb128 0xd
	.long	.LASF56
	.byte	0x5
	.byte	0x49
	.long	0x398
	.byte	0x28
	.uleb128 0xd
	.long	.LASF57
	.byte	0x5
	.byte	0x4b
	.long	0x3ae
	.byte	0x30
	.uleb128 0xd
	.long	.LASF58
	.byte	0x5
	.byte	0x4d
	.long	0x3c9
	.byte	0x38
	.uleb128 0xd
	.long	.LASF59
	.byte	0x5
	.byte	0x4f
	.long	0x3da
	.byte	0x40
	.uleb128 0xd
	.long	.LASF60
	.byte	0x5
	.byte	0x50
	.long	0x3da
	.byte	0x48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x320
	.uleb128 0x10
	.long	0x295
	.uleb128 0x6
	.byte	0x8
	.long	0x32b
	.uleb128 0x11
	.long	0x45
	.uleb128 0x4
	.long	.LASF61
	.byte	0x5
	.byte	0x3c
	.long	0x1e0
	.uleb128 0x7
	.long	0x34b
	.uleb128 0x8
	.long	0x34b
	.uleb128 0x8
	.long	0x45
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x330
	.uleb128 0x6
	.byte	0x8
	.long	0x33b
	.uleb128 0x12
	.long	0x45
	.long	0x366
	.uleb128 0x8
	.long	0x34b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x357
	.uleb128 0x7
	.long	0x37c
	.uleb128 0x8
	.long	0x34b
	.uleb128 0x8
	.long	0x69
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x36c
	.uleb128 0x12
	.long	0x391
	.long	0x391
	.uleb128 0x8
	.long	0x34b
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF62
	.uleb128 0x6
	.byte	0x8
	.long	0x382
	.uleb128 0x7
	.long	0x3ae
	.uleb128 0x8
	.long	0x34b
	.uleb128 0x8
	.long	0x16d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x39e
	.uleb128 0x7
	.long	0x3c9
	.uleb128 0x8
	.long	0x34b
	.uleb128 0x8
	.long	0x89
	.uleb128 0x8
	.long	0x37
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3b4
	.uleb128 0x7
	.long	0x3da
	.uleb128 0x8
	.long	0x34b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3cf
	.uleb128 0x13
	.byte	0x4
	.long	0x74
	.byte	0x1
	.byte	0x14
	.long	0x3ff
	.uleb128 0xf
	.long	.LASF63
	.byte	0
	.uleb128 0xf
	.long	.LASF64
	.byte	0x1
	.uleb128 0xf
	.long	.LASF65
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.long	.LASF66
	.byte	0x1
	.byte	0x18
	.long	0x3e0
	.uleb128 0x13
	.byte	0x4
	.long	0x74
	.byte	0x1
	.byte	0x1a
	.long	0x45b
	.uleb128 0xf
	.long	.LASF67
	.byte	0
	.uleb128 0xf
	.long	.LASF68
	.byte	0x1
	.uleb128 0xf
	.long	.LASF69
	.byte	0x2
	.uleb128 0xf
	.long	.LASF70
	.byte	0x4
	.uleb128 0xf
	.long	.LASF71
	.byte	0x8
	.uleb128 0xf
	.long	.LASF72
	.byte	0x10
	.uleb128 0xf
	.long	.LASF73
	.byte	0x20
	.uleb128 0xf
	.long	.LASF74
	.byte	0x40
	.uleb128 0xf
	.long	.LASF75
	.byte	0x80
	.uleb128 0x14
	.long	.LASF76
	.value	0x100
	.uleb128 0x14
	.long	.LASF77
	.value	0x200
	.byte	0
	.uleb128 0x4
	.long	.LASF78
	.byte	0x1
	.byte	0x26
	.long	0x40a
	.uleb128 0x13
	.byte	0x4
	.long	0x74
	.byte	0x1
	.byte	0x28
	.long	0x4a3
	.uleb128 0xf
	.long	.LASF79
	.byte	0
	.uleb128 0xf
	.long	.LASF80
	.byte	0x1
	.uleb128 0xf
	.long	.LASF81
	.byte	0x2
	.uleb128 0xf
	.long	.LASF82
	.byte	0x3
	.uleb128 0xf
	.long	.LASF83
	.byte	0x4
	.uleb128 0xf
	.long	.LASF84
	.byte	0x5
	.uleb128 0xf
	.long	.LASF85
	.byte	0x6
	.uleb128 0xf
	.long	.LASF86
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.long	.LASF87
	.byte	0x1
	.byte	0x31
	.long	0x466
	.uleb128 0x13
	.byte	0x4
	.long	0x37
	.byte	0x1
	.byte	0x36
	.long	0x4f7
	.uleb128 0x15
	.long	.LASF88
	.sleb128 -1
	.uleb128 0xf
	.long	.LASF89
	.byte	0
	.uleb128 0xf
	.long	.LASF90
	.byte	0x1
	.uleb128 0xf
	.long	.LASF91
	.byte	0x2
	.uleb128 0xf
	.long	.LASF92
	.byte	0x3
	.uleb128 0xf
	.long	.LASF93
	.byte	0x4
	.uleb128 0xf
	.long	.LASF94
	.byte	0x14
	.uleb128 0xf
	.long	.LASF95
	.byte	0x1e
	.uleb128 0xf
	.long	.LASF96
	.byte	0x1f
	.uleb128 0xf
	.long	.LASF97
	.byte	0x1f
	.byte	0
	.uleb128 0x4
	.long	.LASF98
	.byte	0x1
	.byte	0x41
	.long	0x4ae
	.uleb128 0xb
	.long	.LASF99
	.byte	0x18
	.byte	0x1
	.byte	0x4b
	.long	0x533
	.uleb128 0xd
	.long	.LASF37
	.byte	0x1
	.byte	0x4c
	.long	0x4f7
	.byte	0
	.uleb128 0xd
	.long	.LASF100
	.byte	0x1
	.byte	0x4d
	.long	0x34b
	.byte	0x8
	.uleb128 0xd
	.long	.LASF101
	.byte	0x1
	.byte	0x4e
	.long	0x45b
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.long	.LASF102
	.byte	0x1
	.byte	0x4f
	.long	0x502
	.uleb128 0xb
	.long	.LASF103
	.byte	0xc
	.byte	0x1
	.byte	0x5a
	.long	0x56f
	.uleb128 0xd
	.long	.LASF37
	.byte	0x1
	.byte	0x5b
	.long	0x4f7
	.byte	0
	.uleb128 0xd
	.long	.LASF104
	.byte	0x1
	.byte	0x5c
	.long	0x57
	.byte	0x4
	.uleb128 0xd
	.long	.LASF105
	.byte	0x1
	.byte	0x5d
	.long	0x56f
	.byte	0x6
	.byte	0
	.uleb128 0x16
	.long	0x45
	.long	0x57f
	.uleb128 0x17
	.long	0x82
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF106
	.byte	0x1
	.byte	0x5e
	.long	0x53e
	.uleb128 0xb
	.long	.LASF107
	.byte	0x1c
	.byte	0x1
	.byte	0x60
	.long	0x5af
	.uleb128 0xd
	.long	.LASF108
	.byte	0x1
	.byte	0x61
	.long	0x45
	.byte	0
	.uleb128 0xd
	.long	.LASF109
	.byte	0x1
	.byte	0x62
	.long	0x5af
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.long	0x57f
	.long	0x5bf
	.uleb128 0x17
	.long	0x82
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.long	.LASF110
	.byte	0x1
	.byte	0x63
	.long	0x58a
	.uleb128 0xb
	.long	.LASF111
	.byte	0x1
	.byte	0x2
	.byte	0x82
	.long	0x5e3
	.uleb128 0xd
	.long	.LASF112
	.byte	0x2
	.byte	0x83
	.long	0x45
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF113
	.byte	0x2
	.byte	0x84
	.long	0x5ca
	.uleb128 0xb
	.long	.LASF114
	.byte	0x1
	.byte	0x2
	.byte	0x9a
	.long	0x607
	.uleb128 0xd
	.long	.LASF112
	.byte	0x2
	.byte	0x9b
	.long	0x45
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF115
	.byte	0x2
	.byte	0x9c
	.long	0x5ee
	.uleb128 0x18
	.long	.LASF161
	.byte	0x1
	.byte	0x65
	.long	0x62f
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x5bf
	.uleb128 0x19
	.long	.LASF118
	.byte	0x2
	.byte	0x5e
	.long	0x4a3
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x673
	.uleb128 0x1a
	.long	.LASF40
	.byte	0x2
	.byte	0x5e
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.long	.LASF116
	.byte	0x2
	.byte	0x60
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1c
	.long	.LASF162
	.byte	0x2
	.byte	0x6a
	.long	0x6d1
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x6d1
	.uleb128 0x1a
	.long	.LASF37
	.byte	0x2
	.byte	0x6a
	.long	0x4f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.long	.LASF116
	.byte	0x2
	.byte	0x6c
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1d
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1b
	.long	.LASF117
	.byte	0x2
	.byte	0x6e
	.long	0x6d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x533
	.uleb128 0x19
	.long	.LASF119
	.byte	0x2
	.byte	0x76
	.long	0x6d1
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x735
	.uleb128 0x1a
	.long	.LASF100
	.byte	0x2
	.byte	0x76
	.long	0x34b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.long	.LASF116
	.byte	0x2
	.byte	0x78
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1d
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x1b
	.long	.LASF117
	.byte	0x2
	.byte	0x7a
	.long	0x6d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF120
	.byte	0x2
	.byte	0x88
	.long	0x765
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x765
	.uleb128 0x1a
	.long	.LASF121
	.byte	0x2
	.byte	0x88
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x57f
	.uleb128 0x1e
	.long	.LASF122
	.byte	0x2
	.byte	0x8f
	.long	0x765
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x7bb
	.uleb128 0x1a
	.long	.LASF121
	.byte	0x2
	.byte	0x8f
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1b
	.long	.LASF117
	.byte	0x2
	.byte	0x92
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF123
	.byte	0x2
	.byte	0x9e
	.long	0x3ff
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x7f9
	.uleb128 0x1a
	.long	.LASF124
	.byte	0x2
	.byte	0x9e
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF101
	.byte	0x2
	.byte	0x9e
	.long	0x45b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x19
	.long	.LASF125
	.byte	0x2
	.byte	0xa6
	.long	0x391
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x845
	.uleb128 0x1a
	.long	.LASF124
	.byte	0x2
	.byte	0xa6
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF104
	.byte	0x2
	.byte	0xa6
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.long	.LASF126
	.byte	0x2
	.byte	0xa6
	.long	0x45b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1e
	.long	.LASF127
	.byte	0x2
	.byte	0xab
	.long	0x391
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x883
	.uleb128 0x1a
	.long	.LASF124
	.byte	0x2
	.byte	0xab
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.long	.LASF128
	.byte	0x2
	.byte	0xad
	.long	0x6d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.long	.LASF129
	.byte	0x2
	.byte	0xb4
	.long	0x34b
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x8c1
	.uleb128 0x1a
	.long	.LASF104
	.byte	0x2
	.byte	0xb4
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.long	.LASF126
	.byte	0x2
	.byte	0xb4
	.long	0x45b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.long	.LASF130
	.byte	0x2
	.byte	0xbb
	.long	0x34b
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x93f
	.uleb128 0x1a
	.long	.LASF104
	.byte	0x2
	.byte	0xbb
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.long	.LASF126
	.byte	0x2
	.byte	0xbb
	.long	0x45b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1b
	.long	.LASF117
	.byte	0x2
	.byte	0xbe
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x1b
	.long	.LASF128
	.byte	0x2
	.byte	0xc1
	.long	0x6d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF131
	.byte	0x2
	.byte	0xce
	.long	0x391
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x9b9
	.uleb128 0x1a
	.long	.LASF132
	.byte	0x2
	.byte	0xce
	.long	0x62f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.long	.LASF133
	.byte	0x2
	.byte	0xd7
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0x1b
	.long	.LASF116
	.byte	0x2
	.byte	0xd9
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1d
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x1b
	.long	.LASF124
	.byte	0x2
	.byte	0xdb
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.long	.LASF134
	.byte	0x2
	.byte	0xe1
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF135
	.byte	0x2
	.byte	0xf9
	.long	0x765
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xa17
	.uleb128 0x1a
	.long	.LASF37
	.byte	0x2
	.byte	0xf9
	.long	0x4f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.long	.LASF116
	.byte	0x2
	.byte	0xfb
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1d
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x1b
	.long	.LASF117
	.byte	0x2
	.byte	0xfd
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF136
	.byte	0x2
	.value	0x105
	.long	0x391
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xa58
	.uleb128 0x20
	.long	.LASF37
	.byte	0x2
	.value	0x105
	.long	0x4f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.long	.LASF117
	.byte	0x2
	.value	0x107
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.value	0x10b
	.long	0x34b
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xaf3
	.uleb128 0x20
	.long	.LASF37
	.byte	0x2
	.value	0x10c
	.long	0x4f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF101
	.byte	0x2
	.value	0x10d
	.long	0x45b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF49
	.byte	0x2
	.value	0x10e
	.long	0x1c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF40
	.byte	0x2
	.value	0x10f
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF38
	.byte	0x2
	.value	0x110
	.long	0x16d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF39
	.byte	0x2
	.value	0x111
	.long	0x1b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x21
	.long	.LASF128
	.byte	0x2
	.value	0x11a
	.long	0x6d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.long	.LASF100
	.byte	0x2
	.value	0x120
	.long	0x34b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x22
	.long	.LASF138
	.byte	0x2
	.value	0x15d
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xb30
	.uleb128 0x20
	.long	.LASF100
	.byte	0x2
	.value	0x15d
	.long	0x34b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.long	.LASF128
	.byte	0x2
	.value	0x15f
	.long	0x6d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF139
	.byte	0x2
	.value	0x16d
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xb6d
	.uleb128 0x20
	.long	.LASF140
	.byte	0x2
	.value	0x16d
	.long	0x391
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.long	.LASF116
	.byte	0x2
	.value	0x16f
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x23
	.long	.LASF141
	.byte	0x2
	.value	0x18e
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xbbc
	.uleb128 0x20
	.long	.LASF37
	.byte	0x2
	.value	0x18e
	.long	0x4f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x21
	.long	.LASF116
	.byte	0x2
	.value	0x190
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF163
	.byte	0x2
	.value	0x198
	.long	0x45
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x25
	.long	.LASF142
	.byte	0x2
	.value	0x19d
	.long	0x391
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xc2d
	.uleb128 0x20
	.long	.LASF37
	.byte	0x2
	.value	0x19d
	.long	0x4f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x21
	.long	.LASF116
	.byte	0x2
	.value	0x19f
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF143
	.byte	0x2
	.value	0x1a7
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xc5b
	.uleb128 0x20
	.long	.LASF100
	.byte	0x2
	.value	0x1a7
	.long	0x34b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.long	0x533
	.long	0xc6b
	.uleb128 0x17
	.long	0x82
	.byte	0x1
	.byte	0
	.uleb128 0x1b
	.long	.LASF144
	.byte	0x2
	.byte	0x3b
	.long	0xc5b
	.uleb128 0x9
	.byte	0x3
	.quad	serialPortUsageList
	.uleb128 0x1b
	.long	.LASF145
	.byte	0x2
	.byte	0x58
	.long	0x45
	.uleb128 0x9
	.byte	0x3
	.quad	serialPortCount
	.uleb128 0x1b
	.long	.LASF146
	.byte	0x2
	.byte	0x86
	.long	0x5e3
	.uleb128 0x9
	.byte	0x3
	.quad	findSerialPortConfigState
	.uleb128 0x1b
	.long	.LASF147
	.byte	0x2
	.byte	0xb2
	.long	0x607
	.uleb128 0x9
	.byte	0x3
	.quad	findSharedSerialPortState
	.uleb128 0x26
	.long	.LASF148
	.byte	0x6
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x26
	.long	.LASF149
	.byte	0x6
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x26
	.long	.LASF150
	.byte	0x6
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x26
	.long	.LASF151
	.byte	0x4
	.byte	0x43
	.long	0xd13
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x6
	.byte	0x8
	.long	0x13f
	.uleb128 0x26
	.long	.LASF152
	.byte	0x4
	.byte	0x44
	.long	0xd13
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x26
	.long	.LASF153
	.byte	0x4
	.byte	0x47
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x26
	.long	.LASF154
	.byte	0x4
	.byte	0x48
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x26
	.long	.LASF155
	.byte	0x7
	.byte	0x1f
	.long	0xd6d
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0x11
	.long	0x69
	.uleb128 0x16
	.long	0xd82
	.long	0xd82
	.uleb128 0x17
	.long	0x82
	.byte	0x7
	.byte	0
	.uleb128 0x10
	.long	0x69
	.uleb128 0x26
	.long	.LASF105
	.byte	0x2
	.byte	0x5a
	.long	0xd9c
	.uleb128 0x9
	.byte	0x3
	.quad	baudRates
	.uleb128 0x10
	.long	0xd72
	.uleb128 0x16
	.long	0xdb1
	.long	0xdb1
	.uleb128 0x17
	.long	0x82
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.long	0x4f7
	.uleb128 0x26
	.long	.LASF156
	.byte	0x2
	.byte	0x3d
	.long	0xdcb
	.uleb128 0x9
	.byte	0x3
	.quad	serialPortIdentifiers
	.uleb128 0x10
	.long	0xda1
	.uleb128 0x26
	.long	.LASF157
	.byte	0x1
	.byte	0x65
	.long	0x5bf
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x26
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
	.long	0x16c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
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
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.quad	.LFB23
	.quad	.LFE23
	.quad	.LFB24
	.quad	.LFE24
	.quad	.LFB25
	.quad	.LFE25
	.quad	.LFB26
	.quad	.LFE26
	.quad	.LFB27
	.quad	.LFE27
	.quad	.LFB28
	.quad	.LFE28
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF127:
	.string	"isSerialPortOpen"
.LASF77:
	.string	"FUNCTION_MSP_CLIENT"
.LASF18:
	.string	"reset"
.LASF100:
	.string	"serialPort"
.LASF145:
	.string	"serialPortCount"
.LASF21:
	.string	"MODE_TX"
.LASF122:
	.string	"findNextSerialPortConfig"
.LASF142:
	.string	"serialIsPortAvailable"
.LASF15:
	.string	"pgResetFunc"
.LASF60:
	.string	"endWrite"
.LASF67:
	.string	"FUNCTION_NONE"
.LASF33:
	.string	"serialReceiveCallbackPtr"
.LASF126:
	.string	"sharedWithFunction"
.LASF42:
	.string	"txBufferSize"
.LASF13:
	.string	"long long unsigned int"
.LASF79:
	.string	"BAUD_AUTO"
.LASF97:
	.string	"SERIAL_PORT_IDENTIFIER_MAX"
.LASF109:
	.string	"portConfigs"
.LASF111:
	.string	"findSerialPortConfigState_s"
.LASF113:
	.string	"findSerialPortConfigState_t"
.LASF108:
	.string	"reboot_character"
.LASF135:
	.string	"serialFindPortConfiguration"
.LASF150:
	.string	"U_ID_2"
.LASF153:
	.string	"__pg_resetdata_start"
.LASF52:
	.string	"serialTotalRxWaiting"
.LASF0:
	.string	"signed char"
.LASF101:
	.string	"function"
.LASF117:
	.string	"candidate"
.LASF43:
	.string	"rxBuffer"
.LASF155:
	.string	"receiveLength"
.LASF2:
	.string	"long int"
.LASF23:
	.string	"portMode_t"
.LASF64:
	.string	"PORTSHARING_NOT_SHARED"
.LASF12:
	.string	"long long int"
.LASF5:
	.string	"uint16_t"
.LASF94:
	.string	"SERIAL_PORT_USB_VCP"
.LASF129:
	.string	"findSharedSerialPort"
.LASF86:
	.string	"BAUD_250000"
.LASF40:
	.string	"baudRate"
.LASF85:
	.string	"BAUD_230400"
.LASF28:
	.string	"SERIAL_STOPBITS_2"
.LASF121:
	.string	"mask"
.LASF132:
	.string	"serialConfigToCheck"
.LASF90:
	.string	"SERIAL_PORT_UART2"
.LASF99:
	.string	"serialPortUsage_s"
.LASF102:
	.string	"serialPortUsage_t"
.LASF98:
	.string	"serialPortIdentifier_e"
.LASF76:
	.string	"FUNCTION_TELEMETRY_MAVLINK"
.LASF146:
	.string	"findSerialPortConfigState"
.LASF58:
	.string	"writeBuf"
.LASF51:
	.string	"serialWrite"
.LASF54:
	.string	"serialRead"
.LASF158:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF14:
	.string	"pgn_t"
.LASF9:
	.string	"long unsigned int"
.LASF156:
	.string	"serialPortIdentifiers"
.LASF134:
	.string	"bitCount"
.LASF24:
	.string	"portOptions_t"
.LASF157:
	.string	"serialConfig_System"
.LASF16:
	.string	"size"
.LASF6:
	.string	"short unsigned int"
.LASF118:
	.string	"lookupBaudRateIndex"
.LASF27:
	.string	"SERIAL_STOPBITS_1"
.LASF125:
	.string	"isSerialPortShared"
.LASF105:
	.string	"baudRates"
.LASF49:
	.string	"callback"
.LASF45:
	.string	"rxBufferHead"
.LASF32:
	.string	"SERIAL_BIDIR"
.LASF137:
	.string	"openSerialPort"
.LASF138:
	.string	"closeSerialPort"
.LASF59:
	.string	"beginWrite"
.LASF161:
	.string	"serialConfig"
.LASF95:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF96:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF131:
	.string	"isSerialConfigValid"
.LASF152:
	.string	"__pg_registry_end"
.LASF140:
	.string	"softserialEnabled"
.LASF55:
	.string	"serialSetBaudRate"
.LASF144:
	.string	"serialPortUsageList"
.LASF63:
	.string	"PORTSHARING_UNUSED"
.LASF10:
	.string	"sizetype"
.LASF50:
	.string	"serialPortVTable"
.LASF56:
	.string	"isSerialTransmitBufferEmpty"
.LASF17:
	.string	"address"
.LASF87:
	.string	"baudRate_e"
.LASF20:
	.string	"MODE_RX"
.LASF128:
	.string	"serialPortUsage"
.LASF154:
	.string	"__pg_resetdata_end"
.LASF151:
	.string	"__pg_registry_start"
.LASF159:
	.string	"src/main/io/io_serial.c"
.LASF148:
	.string	"U_ID_0"
.LASF89:
	.string	"SERIAL_PORT_UART1"
.LASF160:
	.string	"/home/aravind/git/cleanflight"
.LASF91:
	.string	"SERIAL_PORT_UART3"
.LASF92:
	.string	"SERIAL_PORT_UART4"
.LASF93:
	.string	"SERIAL_PORT_UART5"
.LASF22:
	.string	"MODE_RXTX"
.LASF136:
	.string	"doesConfigurationUsePort"
.LASF162:
	.string	"findSerialPortUsageByIdentifier"
.LASF141:
	.string	"serialRemovePort"
.LASF78:
	.string	"serialPortFunction_e"
.LASF62:
	.string	"_Bool"
.LASF31:
	.string	"SERIAL_UNIDIR"
.LASF3:
	.string	"unsigned char"
.LASF120:
	.string	"findSerialPortConfig"
.LASF41:
	.string	"rxBufferSize"
.LASF114:
	.string	"findSharedSerialPortState_s"
.LASF115:
	.string	"findSharedSerialPortState_t"
.LASF1:
	.string	"short int"
.LASF81:
	.string	"BAUD_19200"
.LASF48:
	.string	"txBufferTail"
.LASF53:
	.string	"serialTotalTxFree"
.LASF82:
	.string	"BAUD_38400"
.LASF130:
	.string	"findNextSharedSerialPort"
.LASF83:
	.string	"BAUD_57600"
.LASF73:
	.string	"FUNCTION_TELEMETRY_SMARTPORT"
.LASF123:
	.string	"determinePortSharing"
.LASF107:
	.string	"serialConfig_s"
.LASF110:
	.string	"serialConfig_t"
.LASF147:
	.string	"findSharedSerialPortState"
.LASF84:
	.string	"BAUD_115200"
.LASF30:
	.string	"SERIAL_PARITY_EVEN"
.LASF103:
	.string	"serialPortConfig_s"
.LASF106:
	.string	"serialPortConfig_t"
.LASF66:
	.string	"portSharing_e"
.LASF47:
	.string	"txBufferHead"
.LASF7:
	.string	"uint32_t"
.LASF149:
	.string	"U_ID_1"
.LASF34:
	.string	"pgRegistry_s"
.LASF19:
	.string	"pgRegistry_t"
.LASF11:
	.string	"char"
.LASF38:
	.string	"mode"
.LASF46:
	.string	"rxBufferTail"
.LASF8:
	.string	"unsigned int"
.LASF143:
	.string	"waitForSerialPortToFinishTransmitting"
.LASF80:
	.string	"BAUD_9600"
.LASF133:
	.string	"mspPortCount"
.LASF139:
	.string	"serialInit"
.LASF124:
	.string	"portConfig"
.LASF70:
	.string	"FUNCTION_TELEMETRY_FRSKY"
.LASF74:
	.string	"FUNCTION_RX_SERIAL"
.LASF104:
	.string	"functionMask"
.LASF68:
	.string	"FUNCTION_MSP_SERVER"
.LASF26:
	.string	"SERIAL_INVERTED"
.LASF57:
	.string	"setMode"
.LASF37:
	.string	"identifier"
.LASF75:
	.string	"FUNCTION_BLACKBOX"
.LASF36:
	.string	"vTable"
.LASF112:
	.string	"lastIndex"
.LASF119:
	.string	"findSerialPortUsageByPort"
.LASF88:
	.string	"SERIAL_PORT_NONE"
.LASF72:
	.string	"FUNCTION_TELEMETRY_LTM"
.LASF44:
	.string	"txBuffer"
.LASF69:
	.string	"FUNCTION_GPS"
.LASF25:
	.string	"SERIAL_NOT_INVERTED"
.LASF4:
	.string	"uint8_t"
.LASF116:
	.string	"index"
.LASF39:
	.string	"options"
.LASF163:
	.string	"serialGetAvailablePortCount"
.LASF71:
	.string	"FUNCTION_TELEMETRY_HOTT"
.LASF65:
	.string	"PORTSHARING_SHARED"
.LASF29:
	.string	"SERIAL_PARITY_NO"
.LASF35:
	.string	"serialPort_s"
.LASF61:
	.string	"serialPort_t"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
