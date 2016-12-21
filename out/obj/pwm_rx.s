	.file	"pwm_rx.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed pwm_rx.i -mtune=generic -march=x86-64 -g
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
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	pwmRxConfig_System,4,4
	.section	.bss.pwmInputPorts,"aw",@nobits
	.align 32
	.type	pwmInputPorts, @object
	.size	pwmInputPorts, 384
pwmInputPorts:
	.zero	384
	.section	.bss.captures,"aw",@nobits
	.align 16
	.type	captures, @object
	.size	captures, 24
captures:
	.zero	24
	.section	.bss.ppmFrameCount,"aw",@nobits
	.type	ppmFrameCount, @object
	.size	ppmFrameCount, 1
ppmFrameCount:
	.zero	1
	.section	.bss.lastPPMFrameCount,"aw",@nobits
	.type	lastPPMFrameCount, @object
	.size	lastPPMFrameCount, 1
lastPPMFrameCount:
	.zero	1
	.section	.bss.ppmCountShift,"aw",@nobits
	.type	ppmCountShift, @object
	.size	ppmCountShift, 1
ppmCountShift:
	.zero	1
	.comm	ppmDev,76,32
	.section	.text.isPPMDataBeingReceived,"ax",@progbits
	.globl	isPPMDataBeingReceived
	.type	isPPMDataBeingReceived, @function
isPPMDataBeingReceived:
.LFB13:
	.file 1 "src/main/drivers/pwm_rx.c"
	.loc 1 119 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 120 0
	movzbl	ppmFrameCount(%rip), %edx	# ppmFrameCount, D.5271
	movzbl	lastPPMFrameCount(%rip), %eax	# lastPPMFrameCount, D.5271
	cmpb	%al, %dl	# D.5271, D.5271
	setne	%al	#, D.5272
	.loc 1 121 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	isPPMDataBeingReceived, .-isPPMDataBeingReceived
	.section	.text.resetPPMDataReceivedState,"ax",@progbits
	.globl	resetPPMDataReceivedState
	.type	resetPPMDataReceivedState, @function
resetPPMDataReceivedState:
.LFB14:
	.loc 1 124 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 125 0
	movzbl	ppmFrameCount(%rip), %eax	# ppmFrameCount, D.5273
	movb	%al, lastPPMFrameCount(%rip)	# D.5273, lastPPMFrameCount
	.loc 1 126 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	resetPPMDataReceivedState, .-resetPPMDataReceivedState
	.section	.text.pwmRxInit,"ax",@progbits
	.globl	pwmRxInit
	.type	pwmRxInit, @function
pwmRxInit:
.LFB15:
	.loc 1 131 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 132 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	pwmRxInit, .-pwmRxInit
	.section	.bss.ppmEvents,"aw",@nobits
	.align 32
	.type	ppmEvents, @object
	.size	ppmEvents, 160
ppmEvents:
	.zero	160
	.section	.bss.ppmEventIndex,"aw",@nobits
	.type	ppmEventIndex, @object
	.size	ppmEventIndex, 1
ppmEventIndex:
	.zero	1
	.section	.text.ppmISREvent,"ax",@progbits
	.globl	ppmISREvent
	.type	ppmISREvent, @function
ppmISREvent:
.LFB16:
	.loc 1 149 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# source, source
	movl	%esi, -8(%rbp)	# capture, capture
	.loc 1 150 0
	movzbl	ppmEventIndex(%rip), %eax	# ppmEventIndex, D.5274
	movzbl	%al, %eax	# D.5274, D.5275
	addl	$1, %eax	#, D.5275
	movslq	%eax, %rcx	# D.5275, D.5276
	movabsq	$-3689348814741910323, %rdx	#, tmp98
	movq	%rcx, %rax	# D.5276, tmp105
	mulq	%rdx	# tmp98
	shrq	$4, %rdx	#, D.5276
	movq	%rdx, %rax	# D.5276, tmp99
	salq	$2, %rax	#, tmp99
	addq	%rdx, %rax	# D.5276, tmp99
	salq	$2, %rax	#, tmp100
	subq	%rax, %rcx	# tmp99, D.5276
	movq	%rcx, %rdx	# D.5276, D.5276
	movl	%edx, %eax	# D.5276, D.5274
	movb	%al, ppmEventIndex(%rip)	# D.5274, ppmEventIndex
	.loc 1 152 0
	movzbl	ppmEventIndex(%rip), %eax	# ppmEventIndex, D.5274
	movzbl	%al, %eax	# D.5274, D.5275
	cltq
	movl	-4(%rbp), %edx	# source, tmp102
	movl	%edx, ppmEvents(,%rax,8)	# tmp102, ppmEvents[_10].source
	.loc 1 153 0
	movzbl	ppmEventIndex(%rip), %eax	# ppmEventIndex, D.5274
	movzbl	%al, %eax	# D.5274, D.5275
	cltq
	movl	-8(%rbp), %edx	# capture, tmp104
	movl	%edx, ppmEvents+4(,%rax,8)	# tmp104, ppmEvents[_14].capture
	.loc 1 154 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	ppmISREvent, .-ppmISREvent
	.section	.text.ppmInit,"ax",@progbits
	.type	ppmInit, @function
ppmInit:
.LFB17:
	.loc 1 160 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 161 0
	movb	$0, ppmDev(%rip)	#, ppmDev.pulseIndex
	.loc 1 162 0
	movl	$0, ppmDev+4(%rip)	#, ppmDev.currentCapture
	.loc 1 163 0
	movl	$0, ppmDev+8(%rip)	#, ppmDev.currentTime
	.loc 1 164 0
	movl	$0, ppmDev+12(%rip)	#, ppmDev.deltaTime
	.loc 1 165 0
	movl	$0, ppmDev+64(%rip)	#, ppmDev.largeCounter
	.loc 1 166 0
	movb	$-1, ppmDev+68(%rip)	#, ppmDev.numChannels
	.loc 1 167 0
	movb	$-1, ppmDev+69(%rip)	#, ppmDev.numChannelsPrevFrame
	.loc 1 168 0
	movb	$0, ppmDev+70(%rip)	#, ppmDev.stableFramesSeenCount
	.loc 1 169 0
	movb	$0, ppmDev+71(%rip)	#, ppmDev.tracking
	.loc 1 170 0
	movb	$0, ppmDev+72(%rip)	#, ppmDev.overflowed
	.loc 1 171 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	ppmInit, .-ppmInit
	.section	.text.ppmOverflowCallback,"ax",@progbits
	.type	ppmOverflowCallback, @function
ppmOverflowCallback:
.LFB18:
	.loc 1 174 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# cbRec, cbRec
	movl	%esi, %eax	# capture, tmp92
	movw	%ax, -12(%rbp)	# tmp92, capture
	.loc 1 176 0
	movzwl	-12(%rbp), %eax	# capture, D.5277
	movl	%eax, %esi	# D.5277,
	movl	$0, %edi	#,
	call	ppmISREvent	#
	.loc 1 178 0
	movl	ppmDev+64(%rip), %edx	# ppmDev.largeCounter, D.5277
	movzwl	-12(%rbp), %eax	# capture, D.5277
	addl	%edx, %eax	# D.5277, D.5277
	addl	$1, %eax	#, D.5277
	movl	%eax, ppmDev+64(%rip)	# D.5277, ppmDev.largeCounter
	.loc 1 179 0
	cmpw	$-1, -12(%rbp)	#, capture
	jne	.L9	#,
	.loc 1 180 0
	movb	$1, ppmDev+72(%rip)	#, ppmDev.overflowed
.L9:
	.loc 1 183 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	ppmOverflowCallback, .-ppmOverflowCallback
	.section	.text.ppmEdgeCallback,"ax",@progbits
	.type	ppmEdgeCallback, @function
ppmEdgeCallback:
.LFB19:
	.loc 1 186 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# cbRec, cbRec
	movl	%esi, %eax	# capture, tmp158
	movw	%ax, -28(%rbp)	# tmp158, capture
	.loc 1 188 0
	movzwl	-28(%rbp), %eax	# capture, D.5279
	movl	%eax, %esi	# D.5279,
	movl	$1, %edi	#,
	call	ppmISREvent	#
	.loc 1 192 0
	movl	ppmDev+8(%rip), %eax	# ppmDev.currentTime, tmp159
	movl	%eax, -8(%rbp)	# tmp159, previousTime
	.loc 1 193 0
	movl	ppmDev+4(%rip), %eax	# ppmDev.currentCapture, tmp160
	movl	%eax, -4(%rbp)	# tmp160, previousCapture
	.loc 1 196 0
	movzwl	-28(%rbp), %eax	# capture, tmp161
	movl	%eax, -12(%rbp)	# tmp161, currentTime
	.loc 1 199 0
	movl	ppmDev+64(%rip), %eax	# ppmDev.largeCounter, D.5279
	addl	%eax, -12(%rbp)	# D.5279, currentTime
	.loc 1 201 0
	movzwl	-28(%rbp), %eax	# capture, D.5279
	cmpl	-4(%rbp), %eax	# previousCapture, D.5279
	jnb	.L11	#,
	.loc 1 202 0
	movzbl	ppmDev+72(%rip), %eax	# ppmDev.overflowed, D.5280
	testb	%al, %al	# D.5280
	je	.L11	#,
	.loc 1 203 0
	addl	$65536, -12(%rbp)	#, currentTime
.L11:
	.loc 1 208 0
	movzbl	ppmCountShift(%rip), %eax	# ppmCountShift, D.5281
	movzbl	%al, %eax	# D.5281, D.5282
	movl	%eax, %ecx	# D.5282, tmp198
	shrl	%cl, -12(%rbp)	# tmp198, currentTime
	.loc 1 211 0
	movl	-12(%rbp), %eax	# currentTime, tmp162
	cmpl	-8(%rbp), %eax	# previousTime, tmp162
	jbe	.L12	#,
	.loc 1 212 0
	movzbl	ppmDev+72(%rip), %eax	# ppmDev.overflowed, D.5280
	testb	%al, %al	# D.5280
	je	.L13	#,
	.loc 1 212 0 is_stmt 0 discriminator 1
	movzbl	ppmCountShift(%rip), %eax	# ppmCountShift, D.5281
	movzbl	%al, %eax	# D.5281, D.5282
	movl	$65536, %edx	#, tmp163
	movl	%eax, %ecx	# D.5282, tmp200
	sarl	%cl, %edx	# tmp200, D.5282
	movl	%edx, %eax	# D.5282, D.5282
	movl	%eax, %edx	# D.5282, D.5278
	jmp	.L14	#
.L13:
	.loc 1 212 0 discriminator 2
	movl	$0, %edx	#, D.5278
.L14:
	.loc 1 212 0 discriminator 4
	movl	-8(%rbp), %eax	# previousTime, tmp164
	addl	%eax, %edx	# tmp164, D.5279
	movl	-12(%rbp), %eax	# currentTime, tmp165
	subl	%edx, %eax	# D.5279, D.5279
	movl	%eax, ppmDev+12(%rip)	# D.5279, ppmDev.deltaTime
	jmp	.L15	#
.L12:
	.loc 1 214 0 is_stmt 1
	movzbl	ppmCountShift(%rip), %eax	# ppmCountShift, D.5281
	movzbl	%al, %eax	# D.5281, D.5282
	movl	$65536, %edx	#, tmp166
	movl	%eax, %ecx	# D.5282, tmp202
	sarl	%cl, %edx	# tmp202, D.5282
	movl	%edx, %eax	# D.5282, D.5282
	movl	%eax, %edx	# D.5282, D.5279
	movl	-12(%rbp), %eax	# currentTime, tmp167
	addl	%edx, %eax	# D.5279, D.5279
	subl	-8(%rbp), %eax	# previousTime, D.5279
	movl	%eax, ppmDev+12(%rip)	# D.5279, ppmDev.deltaTime
.L15:
	.loc 1 217 0
	movb	$0, ppmDev+72(%rip)	#, ppmDev.overflowed
	.loc 1 221 0
	movl	-12(%rbp), %eax	# currentTime, tmp168
	movl	%eax, ppmDev+8(%rip)	# tmp168, ppmDev.currentTime
	.loc 1 222 0
	movzwl	-28(%rbp), %eax	# capture, D.5279
	movl	%eax, ppmDev+4(%rip)	# D.5279, ppmDev.currentCapture
	.loc 1 228 0
	movzbl	deltaIndex.4986(%rip), %eax	# deltaIndex, D.5281
	movzbl	%al, %eax	# D.5281, D.5282
	leal	1(%rax), %ecx	#, D.5282
	movl	$1717986919, %edx	#, tmp170
	movl	%ecx, %eax	# D.5282, tmp196
	imull	%edx	# tmp170
	sarl	$3, %edx	#, tmp171
	movl	%ecx, %eax	# D.5282, tmp172
	sarl	$31, %eax	#, tmp172
	subl	%eax, %edx	# tmp172, D.5282
	movl	%edx, %eax	# D.5282, tmp173
	sall	$2, %eax	#, tmp173
	addl	%edx, %eax	# D.5282, tmp173
	sall	$2, %eax	#, tmp174
	subl	%eax, %ecx	# tmp173, D.5282
	movl	%ecx, %edx	# D.5282, D.5282
	movl	%edx, %eax	# D.5282, D.5281
	movb	%al, deltaIndex.4986(%rip)	# D.5281, deltaIndex
	.loc 1 229 0
	movzbl	deltaIndex.4986(%rip), %eax	# deltaIndex, D.5281
	movzbl	%al, %eax	# D.5281, D.5282
	movl	ppmDev+12(%rip), %edx	# ppmDev.deltaTime, D.5279
	cltq
	movl	%edx, deltaTimes.4985(,%rax,4)	# D.5279, deltaTimes
	.loc 1 238 0
	movzbl	captureIndex.4988(%rip), %eax	# captureIndex, D.5281
	movzbl	%al, %eax	# D.5281, D.5282
	leal	1(%rax), %ecx	#, D.5282
	movl	$1717986919, %edx	#, tmp177
	movl	%ecx, %eax	# D.5282, tmp197
	imull	%edx	# tmp177
	sarl	$3, %edx	#, tmp178
	movl	%ecx, %eax	# D.5282, tmp179
	sarl	$31, %eax	#, tmp179
	subl	%eax, %edx	# tmp179, D.5282
	movl	%edx, %eax	# D.5282, tmp180
	sall	$2, %eax	#, tmp180
	addl	%edx, %eax	# D.5282, tmp180
	sall	$2, %eax	#, tmp181
	subl	%eax, %ecx	# tmp180, D.5282
	movl	%ecx, %edx	# D.5282, D.5282
	movl	%edx, %eax	# D.5282, D.5281
	movb	%al, captureIndex.4988(%rip)	# D.5281, captureIndex
	.loc 1 239 0
	movzbl	captureIndex.4988(%rip), %eax	# captureIndex, D.5281
	movzbl	%al, %eax	# D.5281, D.5282
	movzwl	-28(%rbp), %edx	# capture, D.5279
	cltq
	movl	%edx, captureTimes.4987(,%rax,4)	# D.5279, captureTimes
	.loc 1 244 0
	movl	ppmDev+12(%rip), %eax	# ppmDev.deltaTime, D.5279
	cmpl	$2700, %eax	#, D.5279
	jbe	.L16	#,
	.loc 1 245 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	movzbl	%al, %edx	# D.5281, D.5282
	movzbl	ppmDev+69(%rip), %eax	# ppmDev.numChannelsPrevFrame, D.5283
	movsbl	%al, %eax	# D.5283, D.5282
	cmpl	%eax, %edx	# D.5282, D.5282
	jne	.L17	#,
	.loc 1 246 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	cmpb	$3, %al	#, D.5281
	jbe	.L17	#,
	.loc 1 247 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	cmpb	$12, %al	#, D.5281
	ja	.L17	#,
	.loc 1 250 0
	movzbl	ppmDev+70(%rip), %eax	# ppmDev.stableFramesSeenCount, D.5281
	cmpb	$24, %al	#, D.5281
	ja	.L18	#,
	.loc 1 251 0
	movzbl	ppmDev+70(%rip), %eax	# ppmDev.stableFramesSeenCount, D.5281
	addl	$1, %eax	#, D.5281
	movb	%al, ppmDev+70(%rip)	# D.5281, ppmDev.stableFramesSeenCount
	.loc 1 250 0
	jmp	.L20	#
.L18:
	.loc 1 253 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	movb	%al, ppmDev+68(%rip)	# D.5283, ppmDev.numChannels
	.loc 1 250 0
	jmp	.L20	#
.L17:
	.loc 1 256 0
	movb	$0, ppmDev+70(%rip)	#, ppmDev.stableFramesSeenCount
.L20:
	.loc 1 260 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	movzbl	%al, %edx	# D.5281, D.5282
	movzbl	ppmDev+68(%rip), %eax	# ppmDev.numChannels, D.5283
	movsbl	%al, %eax	# D.5283, D.5282
	cmpl	%eax, %edx	# D.5282, D.5282
	jne	.L21	#,
	.loc 1 260 0 is_stmt 0 discriminator 1
	movzbl	ppmDev+71(%rip), %eax	# ppmDev.tracking, D.5280
	testb	%al, %al	# D.5280
	je	.L21	#,
	.loc 1 262 0 is_stmt 1
	movl	$0, -16(%rbp)	#, i
	jmp	.L22	#
.L23:
	.loc 1 263 0 discriminator 3
	movl	-16(%rbp), %eax	# i, tmp184
	cltq
	addq	$4, %rax	#, tmp185
	movl	ppmDev(,%rax,4), %eax	# ppmDev.captures, D.5279
	movl	%eax, %edx	# D.5279, D.5284
	movl	-16(%rbp), %eax	# i, tmp187
	cltq
	movw	%dx, captures(%rax,%rax)	# D.5284, captures
	.loc 1 262 0 discriminator 3
	addl	$1, -16(%rbp)	#, i
.L22:
	.loc 1 262 0 is_stmt 0 discriminator 1
	movzbl	ppmDev+68(%rip), %eax	# ppmDev.numChannels, D.5283
	movsbl	%al, %eax	# D.5283, D.5282
	cmpl	-16(%rbp), %eax	# i, D.5282
	jg	.L23	#,
	.loc 1 265 0 is_stmt 1
	movzbl	ppmDev+68(%rip), %eax	# ppmDev.numChannels, D.5283
	movsbl	%al, %eax	# D.5283, tmp188
	movl	%eax, -16(%rbp)	# tmp188, i
	jmp	.L24	#
.L25:
	.loc 1 266 0 discriminator 3
	movl	-16(%rbp), %eax	# i, tmp190
	cltq
	movw	$0, captures(%rax,%rax)	#, captures
	.loc 1 265 0 discriminator 3
	addl	$1, -16(%rbp)	#, i
.L24:
	.loc 1 265 0 is_stmt 0 discriminator 1
	cmpl	$11, -16(%rbp)	#, i
	jle	.L25	#,
	.loc 1 268 0 is_stmt 1
	movzbl	ppmFrameCount(%rip), %eax	# ppmFrameCount, D.5281
	addl	$1, %eax	#, D.5281
	movb	%al, ppmFrameCount(%rip)	# D.5281, ppmFrameCount
.L21:
	.loc 1 271 0
	movb	$1, ppmDev+71(%rip)	#, ppmDev.tracking
	.loc 1 272 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	movb	%al, ppmDev+69(%rip)	# D.5283, ppmDev.numChannelsPrevFrame
	.loc 1 273 0
	movb	$0, ppmDev(%rip)	#, ppmDev.pulseIndex
	.loc 1 292 0
	jmp	.L30	#
.L16:
	.loc 1 277 0
	movzbl	ppmDev+71(%rip), %eax	# ppmDev.tracking, D.5280
	testb	%al, %al	# D.5280
	je	.L30	#,
	.loc 1 279 0
	movl	ppmDev+12(%rip), %eax	# ppmDev.deltaTime, D.5279
	cmpl	$750, %eax	#, D.5279
	jbe	.L27	#,
	.loc 1 280 0
	movl	ppmDev+12(%rip), %eax	# ppmDev.deltaTime, D.5279
	cmpl	$2249, %eax	#, D.5279
	ja	.L27	#,
	.loc 1 281 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	cmpb	$11, %al	#, D.5281
	ja	.L27	#,
	.loc 1 282 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	movzbl	%al, %edx	# D.5281, D.5282
	movl	ppmDev+12(%rip), %eax	# ppmDev.deltaTime, D.5279
	movslq	%edx, %rdx	# D.5282, tmp191
	addq	$4, %rdx	#, tmp192
	movl	%eax, ppmDev(,%rdx,4)	# D.5279, ppmDev.captures
	.loc 1 283 0
	movzbl	ppmDev(%rip), %eax	# ppmDev.pulseIndex, D.5281
	addl	$1, %eax	#, D.5281
	movb	%al, ppmDev(%rip)	# D.5281, ppmDev.pulseIndex
	.loc 1 292 0
	jmp	.L30	#
.L27:
	.loc 1 286 0
	movb	$0, ppmDev+71(%rip)	#, ppmDev.tracking
	.loc 1 287 0
	movl	$0, -16(%rbp)	#, i
	jmp	.L28	#
.L29:
	.loc 1 288 0 discriminator 3
	movl	-16(%rbp), %eax	# i, tmp194
	cltq
	addq	$4, %rax	#, tmp195
	movl	$0, ppmDev(,%rax,4)	#, ppmDev.captures
	.loc 1 287 0 discriminator 3
	addl	$1, -16(%rbp)	#, i
.L28:
	.loc 1 287 0 is_stmt 0 discriminator 1
	cmpl	$11, -16(%rbp)	#, i
	jle	.L29	#,
.L30:
	.loc 1 292 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	ppmEdgeCallback, .-ppmEdgeCallback
	.section	.text.isPWMDataBeingReceived,"ax",@progbits
	.globl	isPWMDataBeingReceived
	.type	isPWMDataBeingReceived, @function
isPWMDataBeingReceived:
.LFB20:
	.loc 1 297 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 299 0
	movl	$0, -4(%rbp)	#, channel
	jmp	.L32	#
.L35:
	.loc 1 300 0
	movl	-4(%rbp), %eax	# channel, tmp91
	cltq
	movzwl	captures(%rax,%rax), %eax	# captures, D.5286
	testw	%ax, %ax	# D.5286
	je	.L33	#,
	.loc 1 301 0
	movl	$1, %eax	#, D.5285
	jmp	.L34	#
.L33:
	.loc 1 299 0 discriminator 2
	addl	$1, -4(%rbp)	#, channel
.L32:
	.loc 1 299 0 is_stmt 0 discriminator 1
	cmpl	$11, -4(%rbp)	#, channel
	jle	.L35	#,
	.loc 1 304 0 is_stmt 1
	movl	$0, %eax	#, D.5285
.L34:
	.loc 1 305 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	isPWMDataBeingReceived, .-isPWMDataBeingReceived
	.section	.text.pwmOverflowCallback,"ax",@progbits
	.type	pwmOverflowCallback, @function
pwmOverflowCallback:
.LFB21:
	.loc 1 308 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# cbRec, cbRec
	movl	%esi, %eax	# capture, tmp93
	movw	%ax, -28(%rbp)	# tmp93, capture
.LBB2:
	.loc 1 310 0
	movq	-24(%rbp), %rax	# cbRec, tmp94
	movq	%rax, -16(%rbp)	# tmp94, __mptr
	movq	-16(%rbp), %rax	# __mptr, tmp95
	subq	$32, %rax	#, D.5287
.LBE2:
	movq	%rax, -8(%rbp)	# D.5287, pwmInputPort
	.loc 1 312 0
	movq	-8(%rbp), %rax	# pwmInputPort, tmp96
	movzbl	12(%rax), %eax	# pwmInputPort_5->missedEvents, D.5288
	leal	1(%rax), %edx	#, D.5288
	movq	-8(%rbp), %rax	# pwmInputPort, tmp97
	movb	%dl, 12(%rax)	# D.5288, pwmInputPort_5->missedEvents
	movq	-8(%rbp), %rax	# pwmInputPort, tmp98
	movzbl	12(%rax), %eax	# pwmInputPort_5->missedEvents, D.5288
	cmpb	$10, %al	#, D.5288
	jbe	.L38	#,
	.loc 1 313 0
	movq	-8(%rbp), %rax	# pwmInputPort, tmp99
	movzbl	4(%rax), %eax	# pwmInputPort_5->channel, D.5288
	movzbl	%al, %eax	# D.5288, D.5289
	cltq
	movw	$0, captures(%rax,%rax)	#, captures
	.loc 1 314 0
	movq	-8(%rbp), %rax	# pwmInputPort, tmp101
	movb	$0, 12(%rax)	#, pwmInputPort_5->missedEvents
.L38:
	.loc 1 316 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	pwmOverflowCallback, .-pwmOverflowCallback
	.section	.text.pwmEdgeCallback,"ax",@progbits
	.type	pwmEdgeCallback, @function
pwmEdgeCallback:
.LFB22:
	.loc 1 319 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# cbRec, cbRec
	movl	%esi, %eax	# capture, tmp101
	movw	%ax, -44(%rbp)	# tmp101, capture
.LBB3:
	.loc 1 320 0
	movq	-40(%rbp), %rax	# cbRec, tmp102
	movq	%rax, -24(%rbp)	# tmp102, __mptr
	movq	-24(%rbp), %rax	# __mptr, tmp103
	subq	$24, %rax	#, D.5290
.LBE3:
	movq	%rax, -16(%rbp)	# D.5290, pwmInputPort
	.loc 1 321 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp104
	movq	16(%rax), %rax	# pwmInputPort_5->timerHardware, tmp105
	movq	%rax, -8(%rbp)	# tmp105, timerHardwarePtr
	.loc 1 323 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp106
	movzbl	5(%rax), %eax	# pwmInputPort_5->state, D.5291
	testb	%al, %al	# D.5291
	jne	.L40	#,
	.loc 1 324 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp107
	movzwl	-44(%rbp), %edx	# capture, tmp108
	movw	%dx, 6(%rax)	# tmp108, pwmInputPort_5->rise
	.loc 1 325 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp109
	movb	$1, 5(%rax)	#, pwmInputPort_5->state
	.loc 1 327 0
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp110
	movzbl	(%rax), %eax	# timerHardwarePtr_7->channel, D.5291
	movzbl	%al, %ecx	# D.5291, D.5292
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp111
	movq	8(%rax), %rax	# timerHardwarePtr_7->tim, D.5293
	movl	$0, %edx	#,
	movl	%ecx, %esi	# D.5292,
	movq	%rax, %rdi	# D.5293,
	call	pwmICConfig	#
	.loc 1 341 0
	jmp	.L42	#
.L40:
	.loc 1 329 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp112
	movzwl	-44(%rbp), %edx	# capture, tmp113
	movw	%dx, 8(%rax)	# tmp113, pwmInputPort_5->fall
	.loc 1 332 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp114
	movzwl	8(%rax), %edx	# pwmInputPort_5->fall, D.5294
	movq	-16(%rbp), %rax	# pwmInputPort, tmp115
	movzwl	6(%rax), %eax	# pwmInputPort_5->rise, D.5294
	subl	%eax, %edx	# D.5294, D.5294
	movq	-16(%rbp), %rax	# pwmInputPort, tmp116
	movw	%dx, 10(%rax)	# D.5294, pwmInputPort_5->capture
	.loc 1 333 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp117
	movzbl	4(%rax), %eax	# pwmInputPort_5->channel, D.5291
	movzbl	%al, %ecx	# D.5291, D.5292
	movq	-16(%rbp), %rax	# pwmInputPort, tmp118
	movzwl	10(%rax), %edx	# pwmInputPort_5->capture, D.5294
	movslq	%ecx, %rax	# D.5292, tmp119
	movw	%dx, captures(%rax,%rax)	# D.5294, captures
	.loc 1 336 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp120
	movb	$0, 5(%rax)	#, pwmInputPort_5->state
	.loc 1 338 0
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp121
	movzbl	(%rax), %eax	# timerHardwarePtr_7->channel, D.5291
	movzbl	%al, %ecx	# D.5291, D.5292
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp122
	movq	8(%rax), %rax	# timerHardwarePtr_7->tim, D.5293
	movl	$0, %edx	#,
	movl	%ecx, %esi	# D.5292,
	movq	%rax, %rdi	# D.5293,
	call	pwmICConfig	#
	.loc 1 339 0
	movq	-16(%rbp), %rax	# pwmInputPort, tmp123
	movb	$0, 12(%rax)	#, pwmInputPort_5->missedEvents
.L42:
	.loc 1 341 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	pwmEdgeCallback, .-pwmEdgeCallback
	.section	.text.pwmGPIOConfig,"ax",@progbits
	.type	pwmGPIOConfig, @function
pwmGPIOConfig:
.LFB23:
	.loc 1 344 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# gpio, gpio
	movl	%esi, -44(%rbp)	# pin, pin
	movl	%edx, -48(%rbp)	# mode, mode
	.loc 1 344 0
	movq	%fs:40, %rax	#, tmp91
	movq	%rax, -8(%rbp)	# tmp91, D.5297
	xorl	%eax, %eax	# tmp91
	.loc 1 347 0
	movl	-44(%rbp), %eax	# pin, tmp89
	movw	%ax, -32(%rbp)	# D.5295, cfg.pin
	.loc 1 348 0
	movl	-48(%rbp), %eax	# mode, D.5296
	movl	%eax, -16(%rbp)	# D.5296, cfg.mode
	.loc 1 349 0
	movl	$2, -12(%rbp)	#, cfg.speed
	.loc 1 350 0
	leaq	-32(%rbp), %rax	#, tmp90
	movq	%rax, %rdi	# tmp90,
	call	gpioInit	#
	.loc 1 351 0
	nop
	movq	-8(%rbp), %rax	# D.5297, tmp92
	xorq	%fs:40, %rax	#, tmp92
	je	.L44	#,
	call	__stack_chk_fail	#
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	pwmGPIOConfig, .-pwmGPIOConfig
	.section	.text.pwmICConfig,"ax",@progbits
	.globl	pwmICConfig
	.type	pwmICConfig, @function
pwmICConfig:
.LFB24:
	.loc 1 354 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# tim, tim
	movl	%esi, %ecx	# channel, tmp87
	movl	%edx, %eax	# polarity, tmp88
	movb	%cl, -12(%rbp)	# tmp87, channel
	movw	%ax, -16(%rbp)	# tmp88, polarity
	.loc 1 370 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	pwmICConfig, .-pwmICConfig
	.section	.text.pwmInConfig,"ax",@progbits
	.globl	pwmInConfig
	.type	pwmInConfig, @function
pwmInConfig:
.LFB25:
	.loc 1 373 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# timerHardwarePtr, timerHardwarePtr
	movl	%esi, %eax	# channel, tmp99
	movb	%al, -28(%rbp)	# tmp99, channel
	.loc 1 374 0
	movzbl	-28(%rbp), %eax	# channel, D.5300
	movslq	%eax, %rdx	# D.5300, tmp100
	movq	%rdx, %rax	# tmp100, tmp101
	addq	%rax, %rax	# tmp101
	addq	%rdx, %rax	# tmp100, tmp101
	salq	$4, %rax	#, tmp102
	addq	$pwmInputPorts, %rax	#, tmp103
	movq	%rax, -8(%rbp)	# tmp103, self
	.loc 1 376 0
	movq	-8(%rbp), %rax	# self, tmp104
	movb	$0, 5(%rax)	#, self_3->state
	.loc 1 377 0
	movq	-8(%rbp), %rax	# self, tmp105
	movb	$0, 12(%rax)	#, self_3->missedEvents
	.loc 1 378 0
	movq	-8(%rbp), %rax	# self, tmp106
	movzbl	-28(%rbp), %edx	# channel, tmp107
	movb	%dl, 4(%rax)	# tmp107, self_3->channel
	.loc 1 379 0
	movq	-8(%rbp), %rax	# self, tmp108
	movl	$1, (%rax)	#, self_3->mode
	.loc 1 380 0
	movq	-8(%rbp), %rax	# self, tmp109
	movq	-24(%rbp), %rdx	# timerHardwarePtr, tmp110
	movq	%rdx, 16(%rax)	# tmp110, self_3->timerHardware
	.loc 1 382 0
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp111
	movq	16(%rax), %rax	# timerHardwarePtr_9(D)->gpio, D.5301
	movl	16(%rax), %eax	# _11->mode, D.5300
	movl	%eax, %edx	# D.5300, D.5302
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp112
	movq	16(%rax), %rax	# timerHardwarePtr_9(D)->gpio, D.5301
	movzwl	(%rax), %eax	# _14->pin, D.5303
	movzwl	%ax, %ecx	# D.5303, D.5304
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp113
	movq	16(%rax), %rax	# timerHardwarePtr_9(D)->gpio, D.5301
	movl	%ecx, %esi	# D.5304,
	movq	%rax, %rdi	# D.5301,
	call	pwmGPIOConfig	#
	.loc 1 384 0
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp114
	movzbl	(%rax), %eax	# timerHardwarePtr_9(D)->channel, D.5305
	movzbl	%al, %ecx	# D.5305, D.5300
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp115
	movq	8(%rax), %rax	# timerHardwarePtr_9(D)->tim, D.5306
	movl	$0, %edx	#,
	movl	%ecx, %esi	# D.5300,
	movq	%rax, %rdi	# D.5306,
	call	pwmICConfig	#
	.loc 1 387 0
	movl	$65536, %edi	#,
	call	period_to_freq	#
	movl	$1, %edx	#,
	movl	$0, %esi	#,
	movl	$pwmEdgeCallback, %edi	#,
	call	start_timer	#
	.loc 1 392 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	pwmInConfig, .-pwmInConfig
	.section	.text.ppmAvoidPWMTimerClash,"ax",@progbits
	.globl	ppmAvoidPWMTimerClash
	.type	ppmAvoidPWMTimerClash, @function
ppmAvoidPWMTimerClash:
.LFB26:
	.loc 1 398 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# timerHardwarePtr, timerHardwarePtr
	movq	%rsi, -16(%rbp)	# sharedPwmTimer, sharedPwmTimer
	.loc 1 399 0
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp88
	movq	8(%rax), %rax	# timerHardwarePtr_3(D)->tim, D.5308
	cmpq	-16(%rbp), %rax	# sharedPwmTimer, D.5308
	jne	.L49	#,
	.loc 1 400 0
	movb	$3, ppmCountShift(%rip)	#, ppmCountShift
.L49:
	.loc 1 402 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	ppmAvoidPWMTimerClash, .-ppmAvoidPWMTimerClash
	.section	.text.ppmInConfig,"ax",@progbits
	.globl	ppmInConfig
	.type	ppmInConfig, @function
ppmInConfig:
.LFB27:
	.loc 1 405 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# timerHardwarePtr, timerHardwarePtr
	.loc 1 406 0
	call	ppmInit	#
	.loc 1 408 0
	movq	$pwmInputPorts, -8(%rbp)	#, self
	.loc 1 410 0
	movq	-8(%rbp), %rax	# self, tmp98
	movl	$0, (%rax)	#, self_3->mode
	.loc 1 411 0
	movq	-8(%rbp), %rax	# self, tmp99
	movq	-24(%rbp), %rdx	# timerHardwarePtr, tmp100
	movq	%rdx, 16(%rax)	# tmp100, self_3->timerHardware
	.loc 1 413 0
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp101
	movq	16(%rax), %rax	# timerHardwarePtr_5(D)->gpio, D.5309
	movl	16(%rax), %eax	# _7->mode, D.5310
	movl	%eax, %edx	# D.5310, D.5311
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp102
	movq	16(%rax), %rax	# timerHardwarePtr_5(D)->gpio, D.5309
	movzwl	(%rax), %eax	# _10->pin, D.5312
	movzwl	%ax, %ecx	# D.5312, D.5313
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp103
	movq	16(%rax), %rax	# timerHardwarePtr_5(D)->gpio, D.5309
	movl	%ecx, %esi	# D.5313,
	movq	%rax, %rdi	# D.5309,
	call	pwmGPIOConfig	#
	.loc 1 415 0
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp104
	movzbl	(%rax), %eax	# timerHardwarePtr_5(D)->channel, D.5314
	movzbl	%al, %ecx	# D.5314, D.5310
	movq	-24(%rbp), %rax	# timerHardwarePtr, tmp105
	movq	8(%rax), %rax	# timerHardwarePtr_5(D)->tim, D.5315
	movl	$0, %edx	#,
	movl	%ecx, %esi	# D.5310,
	movq	%rax, %rdi	# D.5315,
	call	pwmICConfig	#
	.loc 1 418 0
	movl	$65536, %edi	#,
	call	period_to_freq	#
	movl	$1, %edx	#,
	movl	$0, %esi	#,
	movl	$ppmEdgeCallback, %edi	#,
	call	start_timer	#
	.loc 1 424 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	ppmInConfig, .-ppmInConfig
	.section	.text.ppmRead,"ax",@progbits
	.globl	ppmRead
	.type	ppmRead, @function
ppmRead:
.LFB28:
	.loc 1 427 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# channel, tmp90
	movb	%al, -4(%rbp)	# tmp90, channel
	.loc 1 428 0
	movzbl	-4(%rbp), %eax	# channel, D.5317
	cltq
	movzwl	captures(%rax,%rax), %eax	# captures, D.5318
	.loc 1 429 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	ppmRead, .-ppmRead
	.section	.text.pwmRead,"ax",@progbits
	.globl	pwmRead
	.type	pwmRead, @function
pwmRead:
.LFB29:
	.loc 1 432 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# channel, tmp90
	movb	%al, -4(%rbp)	# tmp90, channel
	.loc 1 433 0
	movzbl	-4(%rbp), %eax	# channel, D.5319
	cltq
	movzwl	captures(%rax,%rax), %eax	# captures, D.5320
	.loc 1 434 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	pwmRead, .-pwmRead
	.section	.text.period_to_freq,"ax",@progbits
	.globl	period_to_freq
	.type	period_to_freq, @function
period_to_freq:
.LFB30:
	.loc 1 436 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# period, period
	.loc 1 437 0
	movl	$1000000, %eax	#, tmp92
	movl	$0, %edx	#, tmp91
	divl	-4(%rbp)	# period
	movl	%eax, %eax	# D.5321, tmp93
	testq	%rax, %rax	# tmp93
	js	.L56	#,
	pxor	%xmm0, %xmm0	# D.5322
	cvtsi2ssq	%rax, %xmm0	# tmp93, D.5322
	jmp	.L58	#
.L56:
	movq	%rax, %rdx	# tmp93, tmp95
	shrq	%rdx	# tmp95
	andl	$1, %eax	#, tmp96
	orq	%rax, %rdx	# tmp96, tmp95
	pxor	%xmm0, %xmm0	# tmp94
	cvtsi2ssq	%rdx, %xmm0	# tmp95, tmp94
	addss	%xmm0, %xmm0	# tmp94, D.5322
.L58:
	.loc 1 438 0 discriminator 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	period_to_freq, .-period_to_freq
	.section	.text.freq_to_period,"ax",@progbits
	.globl	freq_to_period
	.type	freq_to_period, @function
freq_to_period:
.LFB31:
	.loc 1 441 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)	# freq, freq
	.loc 1 442 0
	movss	.LC0(%rip), %xmm0	#, tmp90
	divss	-4(%rbp), %xmm0	# freq, D.5323
	cvttss2siq	%xmm0, %rax	# D.5323, tmp91
	.loc 1 443 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	freq_to_period, .-freq_to_period
	.section	.bss.deltaIndex.4986,"aw",@nobits
	.type	deltaIndex.4986, @object
	.size	deltaIndex.4986, 1
deltaIndex.4986:
	.zero	1
	.section	.bss.deltaTimes.4985,"aw",@nobits
	.align 32
	.type	deltaTimes.4985, @object
	.size	deltaTimes.4985, 80
deltaTimes.4985:
	.zero	80
	.section	.bss.captureIndex.4988,"aw",@nobits
	.type	captureIndex.4988, @object
	.size	captureIndex.4988, 1
captureIndex.4988:
	.zero	1
	.section	.bss.captureTimes.4987,"aw",@nobits
	.align 32
	.type	captureTimes.4987, @object
	.size	captureTimes.4987, 80
captureTimes.4987:
	.zero	80
	.section	.rodata
	.align 4
.LC0:
	.long	1232348160
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/config/parameter_group.h"
	.file 4 "/usr/include/mraa/gpio.h"
	.file 5 "src/main/drivers/gpio.h"
	.file 6 "./src/main/drivers/timer_setup.h"
	.file 7 "src/main/drivers/pwm_rx.h"
	.file 8 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xbd9
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF133
	.byte	0xc
	.long	.LASF134
	.long	.LASF135
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF2
	.byte	0x2
	.byte	0x24
	.long	0x34
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x2
	.long	.LASF3
	.byte	0x2
	.byte	0x26
	.long	0x4d
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x2
	.long	.LASF5
	.byte	0x2
	.byte	0x30
	.long	0x66
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0x31
	.long	0x78
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.long	.LASF9
	.byte	0x2
	.byte	0x33
	.long	0x8a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.long	.LASF16
	.byte	0x3
	.byte	0x15
	.long	0x6d
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3
	.byte	0x26
	.long	0xcc
	.uleb128 0x6
	.long	0xdc
	.uleb128 0x7
	.long	0x9f
	.uleb128 0x7
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.long	0xfa
	.uleb128 0x9
	.string	"ptr"
	.byte	0x3
	.byte	0x2e
	.long	0x9f
	.uleb128 0x9
	.string	"fn"
	.byte	0x3
	.byte	0x2f
	.long	0xfa
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0xc1
	.uleb128 0xb
	.long	.LASF27
	.byte	0x20
	.byte	0x3
	.byte	0x28
	.long	0x149
	.uleb128 0xc
	.string	"pgn"
	.byte	0x3
	.byte	0x29
	.long	0xb6
	.byte	0
	.uleb128 0xd
	.long	.LASF18
	.byte	0x3
	.byte	0x2a
	.long	0x6d
	.byte	0x2
	.uleb128 0xd
	.long	.LASF19
	.byte	0x3
	.byte	0x2b
	.long	0x149
	.byte	0x8
	.uleb128 0xc
	.string	"ptr"
	.byte	0x3
	.byte	0x2c
	.long	0x14f
	.byte	0x10
	.uleb128 0xd
	.long	.LASF20
	.byte	0x3
	.byte	0x30
	.long	0xdc
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x5b
	.uleb128 0xa
	.byte	0x8
	.long	0x149
	.uleb128 0x2
	.long	.LASF21
	.byte	0x3
	.byte	0x31
	.long	0x100
	.uleb128 0x2
	.long	.LASF22
	.byte	0x4
	.byte	0x37
	.long	0x16b
	.uleb128 0xa
	.byte	0x8
	.long	0x171
	.uleb128 0xe
	.long	.LASF136
	.uleb128 0xf
	.byte	0x4
	.long	0x8a
	.byte	0x5
	.byte	0x4e
	.long	0x194
	.uleb128 0x10
	.string	"In"
	.byte	0
	.uleb128 0x10
	.string	"Out"
	.byte	0x1
	.uleb128 0x10
	.string	"PWM"
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF23
	.byte	0x5
	.byte	0x52
	.long	0x176
	.uleb128 0xf
	.byte	0x4
	.long	0x8a
	.byte	0x5
	.byte	0x56
	.long	0x1be
	.uleb128 0x11
	.long	.LASF24
	.byte	0x1
	.uleb128 0x11
	.long	.LASF25
	.byte	0x2
	.uleb128 0x11
	.long	.LASF26
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF28
	.byte	0x18
	.byte	0x5
	.byte	0x79
	.long	0x1fb
	.uleb128 0xc
	.string	"pin"
	.byte	0x5
	.byte	0x7b
	.long	0x6d
	.byte	0
	.uleb128 0xd
	.long	.LASF29
	.byte	0x5
	.byte	0x7c
	.long	0x160
	.byte	0x8
	.uleb128 0xd
	.long	.LASF30
	.byte	0x5
	.byte	0x7d
	.long	0x4d
	.byte	0x10
	.uleb128 0xd
	.long	.LASF31
	.byte	0x5
	.byte	0x7e
	.long	0x4d
	.byte	0x14
	.byte	0
	.uleb128 0x2
	.long	.LASF32
	.byte	0x5
	.byte	0x7f
	.long	0x1be
	.uleb128 0x12
	.byte	0
	.byte	0x6
	.byte	0x12
	.uleb128 0x2
	.long	.LASF33
	.byte	0x6
	.byte	0x12
	.long	0x206
	.uleb128 0x13
	.byte	0x18
	.byte	0x6
	.byte	0x15
	.long	0x242
	.uleb128 0xd
	.long	.LASF34
	.byte	0x6
	.byte	0x16
	.long	0x5b
	.byte	0
	.uleb128 0xc
	.string	"tim"
	.byte	0x6
	.byte	0x17
	.long	0x242
	.byte	0x8
	.uleb128 0xd
	.long	.LASF35
	.byte	0x6
	.byte	0x18
	.long	0x248
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x20a
	.uleb128 0xa
	.byte	0x8
	.long	0x1fb
	.uleb128 0x2
	.long	.LASF36
	.byte	0x6
	.byte	0x19
	.long	0x215
	.uleb128 0x2
	.long	.LASF37
	.byte	0x6
	.byte	0x1c
	.long	0x6d
	.uleb128 0x2
	.long	.LASF38
	.byte	0x6
	.byte	0x21
	.long	0x26f
	.uleb128 0x6
	.long	0x27f
	.uleb128 0x7
	.long	0x27f
	.uleb128 0x7
	.long	0x6d
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x285
	.uleb128 0xb
	.long	.LASF39
	.byte	0x8
	.byte	0x6
	.byte	0x24
	.long	0x29d
	.uleb128 0xc
	.string	"fn"
	.byte	0x6
	.byte	0x25
	.long	0x2e2
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x6
	.byte	0x22
	.long	0x2a8
	.uleb128 0x6
	.long	0x2b8
	.uleb128 0x7
	.long	0x2b8
	.uleb128 0x7
	.long	0x6d
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x2be
	.uleb128 0xb
	.long	.LASF41
	.byte	0x10
	.byte	0x6
	.byte	0x28
	.long	0x2e2
	.uleb128 0xc
	.string	"fn"
	.byte	0x6
	.byte	0x29
	.long	0x2f3
	.byte	0
	.uleb128 0xd
	.long	.LASF42
	.byte	0x6
	.byte	0x2a
	.long	0x2b8
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x264
	.uleb128 0x2
	.long	.LASF43
	.byte	0x6
	.byte	0x26
	.long	0x285
	.uleb128 0xa
	.byte	0x8
	.long	0x29d
	.uleb128 0x2
	.long	.LASF44
	.byte	0x6
	.byte	0x2b
	.long	0x2be
	.uleb128 0xa
	.byte	0x8
	.long	0x2e8
	.uleb128 0xf
	.byte	0x4
	.long	0x8a
	.byte	0x6
	.byte	0x3b
	.long	0x323
	.uleb128 0x11
	.long	.LASF45
	.byte	0
	.uleb128 0x11
	.long	.LASF46
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.long	0x8a
	.byte	0x7
	.byte	0x14
	.long	0x33c
	.uleb128 0x11
	.long	.LASF47
	.byte	0
	.uleb128 0x11
	.long	.LASF48
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF49
	.byte	0x7
	.byte	0x17
	.long	0x323
	.uleb128 0xb
	.long	.LASF50
	.byte	0x4
	.byte	0x7
	.byte	0x19
	.long	0x360
	.uleb128 0xd
	.long	.LASF51
	.byte	0x7
	.byte	0x1a
	.long	0x33c
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF52
	.byte	0x7
	.byte	0x1b
	.long	0x347
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF53
	.uleb128 0xa
	.byte	0x8
	.long	0x378
	.uleb128 0x14
	.long	0x24e
	.uleb128 0xf
	.byte	0x4
	.long	0x8a
	.byte	0x1
	.byte	0x3a
	.long	0x396
	.uleb128 0x11
	.long	.LASF54
	.byte	0
	.uleb128 0x11
	.long	.LASF55
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF56
	.byte	0x1
	.byte	0x3d
	.long	0x37d
	.uleb128 0x13
	.byte	0x30
	.byte	0x1
	.byte	0x3f
	.long	0x422
	.uleb128 0xd
	.long	.LASF30
	.byte	0x1
	.byte	0x40
	.long	0x396
	.byte	0
	.uleb128 0xd
	.long	.LASF34
	.byte	0x1
	.byte	0x41
	.long	0x5b
	.byte	0x4
	.uleb128 0xd
	.long	.LASF57
	.byte	0x1
	.byte	0x43
	.long	0x5b
	.byte	0x5
	.uleb128 0xd
	.long	.LASF58
	.byte	0x1
	.byte	0x44
	.long	0x259
	.byte	0x6
	.uleb128 0xd
	.long	.LASF59
	.byte	0x1
	.byte	0x45
	.long	0x259
	.byte	0x8
	.uleb128 0xd
	.long	.LASF60
	.byte	0x1
	.byte	0x46
	.long	0x259
	.byte	0xa
	.uleb128 0xd
	.long	.LASF61
	.byte	0x1
	.byte	0x48
	.long	0x5b
	.byte	0xc
	.uleb128 0xd
	.long	.LASF62
	.byte	0x1
	.byte	0x4a
	.long	0x372
	.byte	0x10
	.uleb128 0xd
	.long	.LASF63
	.byte	0x1
	.byte	0x4b
	.long	0x2e8
	.byte	0x18
	.uleb128 0xd
	.long	.LASF64
	.byte	0x1
	.byte	0x4c
	.long	0x2f9
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF65
	.byte	0x1
	.byte	0x4d
	.long	0x3a1
	.uleb128 0xb
	.long	.LASF66
	.byte	0x4c
	.byte	0x1
	.byte	0x5b
	.long	0x4be
	.uleb128 0xd
	.long	.LASF67
	.byte	0x1
	.byte	0x5c
	.long	0x5b
	.byte	0
	.uleb128 0xd
	.long	.LASF68
	.byte	0x1
	.byte	0x5e
	.long	0x7f
	.byte	0x4
	.uleb128 0xd
	.long	.LASF69
	.byte	0x1
	.byte	0x5f
	.long	0x7f
	.byte	0x8
	.uleb128 0xd
	.long	.LASF70
	.byte	0x1
	.byte	0x60
	.long	0x7f
	.byte	0xc
	.uleb128 0xd
	.long	.LASF71
	.byte	0x1
	.byte	0x61
	.long	0x4be
	.byte	0x10
	.uleb128 0xd
	.long	.LASF72
	.byte	0x1
	.byte	0x62
	.long	0x7f
	.byte	0x40
	.uleb128 0xd
	.long	.LASF73
	.byte	0x1
	.byte	0x63
	.long	0x29
	.byte	0x44
	.uleb128 0xd
	.long	.LASF74
	.byte	0x1
	.byte	0x64
	.long	0x29
	.byte	0x45
	.uleb128 0xd
	.long	.LASF75
	.byte	0x1
	.byte	0x65
	.long	0x5b
	.byte	0x46
	.uleb128 0xd
	.long	.LASF76
	.byte	0x1
	.byte	0x67
	.long	0x36b
	.byte	0x47
	.uleb128 0xd
	.long	.LASF77
	.byte	0x1
	.byte	0x68
	.long	0x36b
	.byte	0x48
	.byte	0
	.uleb128 0x15
	.long	0x7f
	.long	0x4ce
	.uleb128 0x16
	.long	0x98
	.byte	0xb
	.byte	0
	.uleb128 0x2
	.long	.LASF78
	.byte	0x1
	.byte	0x69
	.long	0x42d
	.uleb128 0xf
	.byte	0x4
	.long	0x8a
	.byte	0x1
	.byte	0x87
	.long	0x4f2
	.uleb128 0x11
	.long	.LASF79
	.byte	0
	.uleb128 0x11
	.long	.LASF80
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF81
	.byte	0x1
	.byte	0x8a
	.long	0x4d9
	.uleb128 0xb
	.long	.LASF82
	.byte	0x8
	.byte	0x1
	.byte	0x8c
	.long	0x522
	.uleb128 0xd
	.long	.LASF83
	.byte	0x1
	.byte	0x8d
	.long	0x4f2
	.byte	0
	.uleb128 0xd
	.long	.LASF60
	.byte	0x1
	.byte	0x8e
	.long	0x7f
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF84
	.byte	0x1
	.byte	0x8f
	.long	0x4fd
	.uleb128 0x17
	.long	.LASF137
	.byte	0x1
	.byte	0x76
	.long	0x36b
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF85
	.byte	0x1
	.byte	0x7b
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF86
	.byte	0x1
	.byte	0x82
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.long	.LASF102
	.byte	0x1
	.byte	0x94
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x5b6
	.uleb128 0x1a
	.long	.LASF83
	.byte	0x1
	.byte	0x94
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.long	.LASF60
	.byte	0x1
	.byte	0x94
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.long	.LASF138
	.byte	0x1
	.byte	0x9f
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.long	.LASF88
	.byte	0x1
	.byte	0xad
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x609
	.uleb128 0x1a
	.long	.LASF87
	.byte	0x1
	.byte	0xad
	.long	0x609
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF60
	.byte	0x1
	.byte	0xad
	.long	0x259
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x2f9
	.uleb128 0x1c
	.long	.LASF89
	.byte	0x1
	.byte	0xb9
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x6d3
	.uleb128 0x1a
	.long	.LASF87
	.byte	0x1
	.byte	0xb9
	.long	0x304
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF60
	.byte	0x1
	.byte	0xb9
	.long	0x259
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1d
	.string	"i"
	.byte	0x1
	.byte	0xbe
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.long	.LASF90
	.byte	0x1
	.byte	0xc0
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.long	.LASF91
	.byte	0x1
	.byte	0xc1
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.long	.LASF69
	.byte	0x1
	.byte	0xc4
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.long	.LASF92
	.byte	0x1
	.byte	0xe1
	.long	0x6d3
	.uleb128 0x9
	.byte	0x3
	.quad	deltaTimes.4985
	.uleb128 0x1e
	.long	.LASF93
	.byte	0x1
	.byte	0xe2
	.long	0x5b
	.uleb128 0x9
	.byte	0x3
	.quad	deltaIndex.4986
	.uleb128 0x1e
	.long	.LASF94
	.byte	0x1
	.byte	0xeb
	.long	0x6d3
	.uleb128 0x9
	.byte	0x3
	.quad	captureTimes.4987
	.uleb128 0x1e
	.long	.LASF95
	.byte	0x1
	.byte	0xec
	.long	0x5b
	.uleb128 0x9
	.byte	0x3
	.quad	captureIndex.4988
	.byte	0
	.uleb128 0x15
	.long	0x7f
	.long	0x6e3
	.uleb128 0x16
	.long	0x98
	.byte	0x13
	.byte	0
	.uleb128 0x1f
	.long	.LASF110
	.byte	0x1
	.value	0x128
	.long	0x36b
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x715
	.uleb128 0x20
	.long	.LASF34
	.byte	0x1
	.value	0x12a
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x21
	.long	.LASF96
	.byte	0x1
	.value	0x133
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x782
	.uleb128 0x22
	.long	.LASF87
	.byte	0x1
	.value	0x133
	.long	0x609
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.long	.LASF60
	.byte	0x1
	.value	0x133
	.long	0x259
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF97
	.byte	0x1
	.value	0x136
	.long	0x782
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x23
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x20
	.long	.LASF98
	.byte	0x1
	.value	0x136
	.long	0x788
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x422
	.uleb128 0xa
	.byte	0x8
	.long	0x78e
	.uleb128 0x14
	.long	0x2f9
	.uleb128 0x24
	.long	.LASF99
	.byte	0x1
	.value	0x13e
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x80f
	.uleb128 0x22
	.long	.LASF87
	.byte	0x1
	.value	0x13e
	.long	0x304
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x22
	.long	.LASF60
	.byte	0x1
	.value	0x13e
	.long	0x259
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LASF97
	.byte	0x1
	.value	0x140
	.long	0x782
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF100
	.byte	0x1
	.value	0x141
	.long	0x372
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x23
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x20
	.long	.LASF98
	.byte	0x1
	.value	0x140
	.long	0x80f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x815
	.uleb128 0x14
	.long	0x2e8
	.uleb128 0x24
	.long	.LASF101
	.byte	0x1
	.value	0x157
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x875
	.uleb128 0x22
	.long	.LASF35
	.byte	0x1
	.value	0x157
	.long	0x248
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"pin"
	.byte	0x1
	.value	0x157
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x22
	.long	.LASF30
	.byte	0x1
	.value	0x157
	.long	0x194
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x26
	.string	"cfg"
	.byte	0x1
	.value	0x159
	.long	0x1fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x27
	.long	.LASF103
	.byte	0x1
	.value	0x161
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x8c1
	.uleb128 0x25
	.string	"tim"
	.byte	0x1
	.value	0x161
	.long	0x242
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF34
	.byte	0x1
	.value	0x161
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x22
	.long	.LASF104
	.byte	0x1
	.value	0x161
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x28
	.long	.LASF105
	.byte	0x1
	.value	0x174
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x90d
	.uleb128 0x22
	.long	.LASF100
	.byte	0x1
	.value	0x174
	.long	0x372
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.long	.LASF34
	.byte	0x1
	.value	0x174
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF106
	.byte	0x1
	.value	0x176
	.long	0x782
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x27
	.long	.LASF107
	.byte	0x1
	.value	0x18d
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x94a
	.uleb128 0x22
	.long	.LASF100
	.byte	0x1
	.value	0x18d
	.long	0x372
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF108
	.byte	0x1
	.value	0x18d
	.long	0x242
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x28
	.long	.LASF109
	.byte	0x1
	.value	0x194
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x987
	.uleb128 0x22
	.long	.LASF100
	.byte	0x1
	.value	0x194
	.long	0x372
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF106
	.byte	0x1
	.value	0x198
	.long	0x782
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1f
	.long	.LASF111
	.byte	0x1
	.value	0x1aa
	.long	0x6d
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x9b9
	.uleb128 0x22
	.long	.LASF34
	.byte	0x1
	.value	0x1aa
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1f
	.long	.LASF112
	.byte	0x1
	.value	0x1af
	.long	0x6d
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x9eb
	.uleb128 0x22
	.long	.LASF34
	.byte	0x1
	.value	0x1af
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1f
	.long	.LASF113
	.byte	0x1
	.value	0x1b3
	.long	0xa1d
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xa1d
	.uleb128 0x22
	.long	.LASF114
	.byte	0x1
	.value	0x1b3
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF115
	.uleb128 0x1f
	.long	.LASF116
	.byte	0x1
	.value	0x1b8
	.long	0x7f
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xa56
	.uleb128 0x22
	.long	.LASF117
	.byte	0x1
	.value	0x1b8
	.long	0xa1d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.long	0x422
	.long	0xa66
	.uleb128 0x16
	.long	0x98
	.byte	0x7
	.byte	0
	.uleb128 0x1e
	.long	.LASF118
	.byte	0x1
	.byte	0x4f
	.long	0xa56
	.uleb128 0x9
	.byte	0x3
	.quad	pwmInputPorts
	.uleb128 0x15
	.long	0x6d
	.long	0xa8b
	.uleb128 0x16
	.long	0x98
	.byte	0xb
	.byte	0
	.uleb128 0x1e
	.long	.LASF71
	.byte	0x1
	.byte	0x51
	.long	0xa7b
	.uleb128 0x9
	.byte	0x3
	.quad	captures
	.uleb128 0x1e
	.long	.LASF119
	.byte	0x1
	.byte	0x57
	.long	0x5b
	.uleb128 0x9
	.byte	0x3
	.quad	ppmFrameCount
	.uleb128 0x1e
	.long	.LASF120
	.byte	0x1
	.byte	0x58
	.long	0x5b
	.uleb128 0x9
	.byte	0x3
	.quad	lastPPMFrameCount
	.uleb128 0x1e
	.long	.LASF121
	.byte	0x1
	.byte	0x59
	.long	0x5b
	.uleb128 0x9
	.byte	0x3
	.quad	ppmCountShift
	.uleb128 0x15
	.long	0x522
	.long	0xaef
	.uleb128 0x16
	.long	0x98
	.byte	0x13
	.byte	0
	.uleb128 0x1e
	.long	.LASF122
	.byte	0x1
	.byte	0x91
	.long	0xadf
	.uleb128 0x9
	.byte	0x3
	.quad	ppmEvents
	.uleb128 0x1e
	.long	.LASF123
	.byte	0x1
	.byte	0x92
	.long	0x5b
	.uleb128 0x9
	.byte	0x3
	.quad	ppmEventIndex
	.uleb128 0x29
	.long	.LASF124
	.byte	0x8
	.byte	0xc8
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x29
	.long	.LASF125
	.byte	0x8
	.byte	0xc9
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x29
	.long	.LASF126
	.byte	0x8
	.byte	0xca
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x29
	.long	.LASF127
	.byte	0x3
	.byte	0x43
	.long	0xb6d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xa
	.byte	0x8
	.long	0x155
	.uleb128 0x29
	.long	.LASF128
	.byte	0x3
	.byte	0x44
	.long	0xb6d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x29
	.long	.LASF129
	.byte	0x3
	.byte	0x47
	.long	0x149
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x29
	.long	.LASF130
	.byte	0x3
	.byte	0x48
	.long	0x149
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x29
	.long	.LASF131
	.byte	0x7
	.byte	0x1d
	.long	0x360
	.uleb128 0x9
	.byte	0x3
	.quad	pwmRxConfig_System
	.uleb128 0x29
	.long	.LASF132
	.byte	0x1
	.byte	0x6b
	.long	0x4ce
	.uleb128 0x9
	.byte	0x3
	.quad	ppmDev
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
	.uleb128 0x3
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x2117
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.long	0x14c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
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
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.quad	.LFB29
	.quad	.LFE29
	.quad	.LFB30
	.quad	.LFE30
	.quad	.LFB31
	.quad	.LFE31
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF120:
	.string	"lastPPMFrameCount"
.LASF20:
	.string	"reset"
.LASF39:
	.string	"timerCCHandlerRec_s"
.LASF36:
	.string	"timerHardware_t"
.LASF76:
	.string	"tracking"
.LASF17:
	.string	"pgResetFunc"
.LASF33:
	.string	"TIM_TypeDef"
.LASF114:
	.string	"period"
.LASF85:
	.string	"resetPPMDataReceivedState"
.LASF15:
	.string	"long long unsigned int"
.LASF24:
	.string	"Speed_10MHz"
.LASF42:
	.string	"next"
.LASF67:
	.string	"pulseIndex"
.LASF59:
	.string	"fall"
.LASF25:
	.string	"Speed_2MHz"
.LASF97:
	.string	"pwmInputPort"
.LASF14:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF117:
	.string	"freq"
.LASF48:
	.string	"INPUT_FILTERING_ENABLED"
.LASF95:
	.string	"captureIndex"
.LASF131:
	.string	"pwmRxConfig_System"
.LASF32:
	.string	"GPIO_TypeDef"
.LASF110:
	.string	"isPWMDataBeingReceived"
.LASF57:
	.string	"state"
.LASF4:
	.string	"long int"
.LASF55:
	.string	"INPUT_MODE_PWM"
.LASF70:
	.string	"deltaTime"
.LASF126:
	.string	"U_ID_2"
.LASF72:
	.string	"largeCounter"
.LASF7:
	.string	"uint16_t"
.LASF108:
	.string	"sharedPwmTimer"
.LASF102:
	.string	"ppmISREvent"
.LASF82:
	.string	"ppmISREvent_s"
.LASF84:
	.string	"ppmISREvent_t"
.LASF49:
	.string	"inputFilteringMode_e"
.LASF54:
	.string	"INPUT_MODE_PPM"
.LASF100:
	.string	"timerHardwarePtr"
.LASF90:
	.string	"previousTime"
.LASF45:
	.string	"ONE_SHOT"
.LASF80:
	.string	"SOURCE_EDGE"
.LASF10:
	.string	"unsigned int"
.LASF63:
	.string	"edgeCb"
.LASF133:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF16:
	.string	"pgn_t"
.LASF88:
	.string	"ppmOverflowCallback"
.LASF11:
	.string	"long unsigned int"
.LASF22:
	.string	"mraa_gpio_context"
.LASF96:
	.string	"pwmOverflowCallback"
.LASF62:
	.string	"timerHardware"
.LASF18:
	.string	"size"
.LASF8:
	.string	"short unsigned int"
.LASF65:
	.string	"pwmInputPort_t"
.LASF41:
	.string	"timerOvrHandlerRec_s"
.LASF81:
	.string	"eventSource_e"
.LASF77:
	.string	"overflowed"
.LASF118:
	.string	"pwmInputPorts"
.LASF73:
	.string	"numChannels"
.LASF68:
	.string	"currentCapture"
.LASF138:
	.string	"ppmInit"
.LASF112:
	.string	"pwmRead"
.LASF60:
	.string	"capture"
.LASF129:
	.string	"__pg_resetdata_start"
.LASF86:
	.string	"pwmRxInit"
.LASF128:
	.string	"__pg_registry_end"
.LASF83:
	.string	"source"
.LASF12:
	.string	"sizetype"
.LASF52:
	.string	"pwmRxConfig_t"
.LASF19:
	.string	"address"
.LASF43:
	.string	"timerCCHandlerRec_t"
.LASF98:
	.string	"__mptr"
.LASF74:
	.string	"numChannelsPrevFrame"
.LASF87:
	.string	"cbRec"
.LASF92:
	.string	"deltaTimes"
.LASF91:
	.string	"previousCapture"
.LASF105:
	.string	"pwmInConfig"
.LASF130:
	.string	"__pg_resetdata_end"
.LASF127:
	.string	"__pg_registry_start"
.LASF58:
	.string	"rise"
.LASF124:
	.string	"U_ID_0"
.LASF125:
	.string	"U_ID_1"
.LASF135:
	.string	"/home/aravind/git/cleanflight"
.LASF115:
	.string	"float"
.LASF122:
	.string	"ppmEvents"
.LASF89:
	.string	"ppmEdgeCallback"
.LASF61:
	.string	"missedEvents"
.LASF26:
	.string	"Speed_50MHz"
.LASF53:
	.string	"_Bool"
.LASF3:
	.string	"int32_t"
.LASF6:
	.string	"unsigned char"
.LASF71:
	.string	"captures"
.LASF99:
	.string	"pwmEdgeCallback"
.LASF1:
	.string	"short int"
.LASF44:
	.string	"timerOvrHandlerRec_t"
.LASF101:
	.string	"pwmGPIOConfig"
.LASF34:
	.string	"channel"
.LASF93:
	.string	"deltaIndex"
.LASF137:
	.string	"isPPMDataBeingReceived"
.LASF107:
	.string	"ppmAvoidPWMTimerClash"
.LASF9:
	.string	"uint32_t"
.LASF47:
	.string	"INPUT_FILTERING_DISABLED"
.LASF104:
	.string	"polarity"
.LASF51:
	.string	"inputFilteringMode"
.LASF27:
	.string	"pgRegistry_s"
.LASF21:
	.string	"pgRegistry_t"
.LASF13:
	.string	"char"
.LASF30:
	.string	"mode"
.LASF37:
	.string	"captureCompare_t"
.LASF121:
	.string	"ppmCountShift"
.LASF106:
	.string	"self"
.LASF46:
	.string	"PERIODIC"
.LASF66:
	.string	"ppmDevice_s"
.LASF78:
	.string	"ppmDevice_t"
.LASF134:
	.string	"src/main/drivers/pwm_rx.c"
.LASF38:
	.string	"timerCCHandlerCallback"
.LASF23:
	.string	"GPIO_Mode"
.LASF29:
	.string	"context"
.LASF103:
	.string	"pwmICConfig"
.LASF69:
	.string	"currentTime"
.LASF2:
	.string	"int8_t"
.LASF109:
	.string	"ppmInConfig"
.LASF28:
	.string	"GPIO_TypeDef_s"
.LASF116:
	.string	"freq_to_period"
.LASF113:
	.string	"period_to_freq"
.LASF119:
	.string	"ppmFrameCount"
.LASF50:
	.string	"pwmRxConfig_s"
.LASF123:
	.string	"ppmEventIndex"
.LASF5:
	.string	"uint8_t"
.LASF79:
	.string	"SOURCE_OVERFLOW"
.LASF40:
	.string	"timerOvrHandlerCallback"
.LASF35:
	.string	"gpio"
.LASF31:
	.string	"speed"
.LASF64:
	.string	"overflowCb"
.LASF132:
	.string	"ppmDev"
.LASF136:
	.string	"_gpio"
.LASF56:
	.string	"pwmInputMode_t"
.LASF94:
	.string	"captureTimes"
.LASF111:
	.string	"ppmRead"
.LASF75:
	.string	"stableFramesSeenCount"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
