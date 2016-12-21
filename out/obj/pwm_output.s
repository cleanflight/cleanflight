	.file	"pwm_output.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed pwm_output.i -mtune=generic -march=x86-64
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
	.section	.bss.pwmOutputPorts,"aw",@nobits
	.align 32
	.type	pwmOutputPorts, @object
	.size	pwmOutputPorts, 96
pwmOutputPorts:
	.zero	96
	.section	.bss.motors,"aw",@nobits
	.align 32
	.type	motors, @object
	.size	motors, 32
motors:
	.zero	32
	.section	.bss.allocatedOutputPortCount,"aw",@nobits
	.type	allocatedOutputPortCount, @object
	.size	allocatedOutputPortCount, 1
allocatedOutputPortCount:
	.zero	1
	.section	.data.pwmMotorsEnabled,"aw",@progbits
	.type	pwmMotorsEnabled, @object
	.size	pwmMotorsEnabled, 1
pwmMotorsEnabled:
	.byte	1
	.section	.text.pwmOutConfig,"ax",@progbits
	.type	pwmOutConfig, @function
pwmOutConfig:
.LFB6:
	.file 1 "src/main/drivers/pwm_output.c"
	.loc 1 116 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# pin, pin
	movl	%esi, %ecx	# period, tmp102
	movl	%edx, %eax	# value, tmp103
	movw	%cx, -24(%rbp)	# tmp102, period
	movw	%ax, -28(%rbp)	# tmp103, value
	.loc 1 117 0
	movzbl	allocatedOutputPortCount(%rip), %eax	# allocatedOutputPortCount, D.5483
	leal	1(%rax), %edx	#, D.5483
	movb	%dl, allocatedOutputPortCount(%rip)	# D.5483, allocatedOutputPortCount
	movzbl	%al, %eax	# D.5483, D.5484
	movslq	%eax, %rdx	# D.5484, tmp104
	movq	%rdx, %rax	# tmp104, tmp105
	addq	%rax, %rax	# tmp105
	addq	%rdx, %rax	# tmp104, tmp105
	salq	$3, %rax	#, tmp106
	addq	$pwmOutputPorts, %rax	#, tmp107
	movq	%rax, -8(%rbp)	# tmp107, p
	.loc 1 120 0
	movq	-8(%rbp), %rax	# p, tmp108
	movzwl	-24(%rbp), %edx	# period, tmp109
	movw	%dx, 8(%rax)	# tmp109, p_7->period
	.loc 1 121 0
	movzwl	-24(%rbp), %eax	# period, tmp110
	subw	-28(%rbp), %ax	# value, D.5485
	movl	%eax, %edx	# D.5485, D.5485
	movq	-8(%rbp), %rax	# p, tmp111
	movw	%dx, 10(%rax)	# D.5485, p_7->value
	.loc 1 125 0
	movl	-20(%rbp), %eax	# pin, D.5484
	movl	%eax, %edi	# D.5484,
	call	mraa_pwm_init	#
	movq	%rax, %rdx	#, D.5486
	movq	-8(%rbp), %rax	# p, tmp112
	movq	%rdx, (%rax)	# D.5486, p_7->pwm
	.loc 1 127 0
	movq	-8(%rbp), %rax	# p, tmp113
	movzwl	8(%rax), %eax	# p_7->period, D.5485
	movzwl	%ax, %edx	# D.5485, D.5484
	movq	-8(%rbp), %rax	# p, tmp114
	movq	(%rax), %rax	# p_7->pwm, D.5486
	movl	%edx, %esi	# D.5484,
	movq	%rax, %rdi	# D.5486,
	call	mraa_pwm_period_us	#
	.loc 1 130 0
	movq	-8(%rbp), %rax	# p, tmp115
	movzwl	10(%rax), %eax	# p_7->value, D.5485
	movzwl	%ax, %edx	# D.5485, D.5484
	movq	-8(%rbp), %rax	# p, tmp116
	movq	(%rax), %rax	# p_7->pwm, D.5486
	movl	%edx, %esi	# D.5484,
	movq	%rax, %rdi	# D.5486,
	call	mraa_pwm_pulsewidth_us	#
	.loc 1 132 0
	movq	-8(%rbp), %rax	# p, tmp117
	movq	(%rax), %rax	# p_7->pwm, D.5486
	movl	$0, %esi	#,
	movq	%rax, %rdi	# D.5486,
	call	mraa_pwm_enable	#
	.loc 1 142 0
	movq	-8(%rbp), %rax	# p, D.5487
	.loc 1 143 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	pwmOutConfig, .-pwmOutConfig
	.section	.text.pwmWriteBrushed,"ax",@progbits
	.type	pwmWriteBrushed, @function
pwmWriteBrushed:
.LFB7:
	.loc 1 146 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %edx	# index, tmp87
	movl	%esi, %eax	# value, tmp88
	movb	%dl, -4(%rbp)	# tmp87, index
	movw	%ax, -8(%rbp)	# tmp88, value
	.loc 1 148 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	pwmWriteBrushed, .-pwmWriteBrushed
	.section	.text.pwmWriteStandard,"ax",@progbits
	.type	pwmWriteStandard, @function
pwmWriteStandard:
.LFB8:
	.loc 1 151 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %edx	# index, tmp93
	movl	%esi, %eax	# value, tmp94
	movb	%dl, -4(%rbp)	# tmp93, index
	movw	%ax, -8(%rbp)	# tmp94, value
	.loc 1 152 0
	movzbl	-4(%rbp), %eax	# index, D.5488
	cltq
	movq	motors(,%rax,8), %rax	# motors, D.5489
	movzbl	-4(%rbp), %edx	# index, D.5488
	movslq	%edx, %rdx	# D.5488, tmp96
	movq	motors(,%rdx,8), %rdx	# motors, D.5489
	movzwl	8(%rdx), %edx	# _6->period, D.5490
	subw	-8(%rbp), %dx	# value, D.5490
	movw	%dx, 10(%rax)	# D.5490, _4->value
	.loc 1 153 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	pwmWriteStandard, .-pwmWriteStandard
	.section	.text.pwmWriteMotor,"ax",@progbits
	.globl	pwmWriteMotor
	.type	pwmWriteMotor, @function
pwmWriteMotor:
.LFB9:
	.loc 1 156 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, %edx	# index, tmp95
	movl	%esi, %eax	# value, tmp96
	movb	%dl, -4(%rbp)	# tmp95, index
	movw	%ax, -8(%rbp)	# tmp96, value
	.loc 1 157 0
	movzbl	-4(%rbp), %eax	# index, D.5491
	cltq
	movq	motors(,%rax,8), %rax	# motors, D.5492
	testq	%rax, %rax	# D.5492
	je	.L7	#,
	.loc 1 157 0 is_stmt 0 discriminator 1
	cmpb	$3, -4(%rbp)	#, index
	ja	.L7	#,
	.loc 1 157 0 discriminator 2
	movzbl	pwmMotorsEnabled(%rip), %eax	# pwmMotorsEnabled, D.5493
	testb	%al, %al	# D.5493
	je	.L7	#,
	.loc 1 158 0 is_stmt 1
	movzbl	-4(%rbp), %eax	# index, D.5491
	cltq
	movq	motors(,%rax,8), %rax	# motors, D.5492
	movq	16(%rax), %rax	# _8->pwmWritePtr, D.5494
	movzwl	-8(%rbp), %ecx	# value, D.5491
	movzbl	-4(%rbp), %edx	# index, D.5491
	movl	%ecx, %esi	# D.5491,
	movl	%edx, %edi	# D.5491,
	call	*%rax	# D.5494
.L7:
	.loc 1 159 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	pwmWriteMotor, .-pwmWriteMotor
	.section	.text.pwmShutdownPulsesForAllMotors,"ax",@progbits
	.globl	pwmShutdownPulsesForAllMotors
	.type	pwmShutdownPulsesForAllMotors, @function
pwmShutdownPulsesForAllMotors:
.LFB10:
	.loc 1 162 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# motorCount, tmp90
	movb	%al, -20(%rbp)	# tmp90, motorCount
	.loc 1 165 0
	movb	$0, -1(%rbp)	#, index
	jmp	.L9	#
.L10:
	.loc 1 167 0 discriminator 3
	movzbl	-1(%rbp), %eax	# index, D.5495
	cltq
	movq	motors(,%rax,8), %rax	# motors, D.5496
	movw	$0, 10(%rax)	#, _7->value
	.loc 1 165 0 discriminator 3
	movzbl	-1(%rbp), %eax	# index, D.5497
	addl	$1, %eax	#, tmp92
	movb	%al, -1(%rbp)	# tmp92, index
.L9:
	.loc 1 165 0 is_stmt 0 discriminator 1
	movzbl	-1(%rbp), %eax	# index, tmp93
	cmpb	-20(%rbp), %al	# motorCount, tmp93
	jb	.L10	#,
	.loc 1 169 0 is_stmt 1
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	pwmShutdownPulsesForAllMotors, .-pwmShutdownPulsesForAllMotors
	.section	.text.pwmDisableMotors,"ax",@progbits
	.globl	pwmDisableMotors
	.type	pwmDisableMotors, @function
pwmDisableMotors:
.LFB11:
	.loc 1 172 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 173 0
	movb	$0, pwmMotorsEnabled(%rip)	#, pwmMotorsEnabled
	.loc 1 174 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	pwmDisableMotors, .-pwmDisableMotors
	.section	.text.pwmEnableMotors,"ax",@progbits
	.globl	pwmEnableMotors
	.type	pwmEnableMotors, @function
pwmEnableMotors:
.LFB12:
	.loc 1 177 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 178 0
	movb	$1, pwmMotorsEnabled(%rip)	#, pwmMotorsEnabled
	.loc 1 179 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	pwmEnableMotors, .-pwmEnableMotors
	.section	.text.isMotorBrushed,"ax",@progbits
	.globl	isMotorBrushed
	.type	isMotorBrushed, @function
isMotorBrushed:
.LFB13:
	.loc 1 203 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# motorPwmRate, tmp89
	movw	%ax, -4(%rbp)	# tmp89, motorPwmRate
	.loc 1 204 0
	cmpw	$500, -4(%rbp)	#, motorPwmRate
	seta	%al	#, D.5498
	.loc 1 205 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	isMotorBrushed, .-isMotorBrushed
	.section	.text.pwmBrushedMotorConfig,"ax",@progbits
	.globl	pwmBrushedMotorConfig
	.type	pwmBrushedMotorConfig, @function
pwmBrushedMotorConfig:
.LFB14:
	.loc 1 209 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$40, %rsp	#,
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)	# pin, pin
	movl	%ecx, %eax	# idlePulse, tmp98
	movb	%sil, -40(%rbp)	# tmp96, motorIndex
	movw	%dx, -44(%rbp)	# tmp97, motorPwmRate
	movw	%ax, -48(%rbp)	# tmp98, idlePulse
	.loc 1 210 0
	movl	$8000000, -20(%rbp)	#, hz
	.loc 1 211 0
	movzbl	-40(%rbp), %ebx	# motorIndex, D.5499
	movzwl	-48(%rbp), %esi	# idlePulse, D.5499
	movzwl	-44(%rbp), %edi	# motorPwmRate, D.5500
	movl	-20(%rbp), %eax	# hz, tmp101
	movl	$0, %edx	#, tmp100
	divl	%edi	# D.5500
	movzwl	%ax, %ecx	# D.5501, D.5499
	movl	-36(%rbp), %eax	# pin, tmp102
	movl	%esi, %edx	# D.5499,
	movl	%ecx, %esi	# D.5499,
	movl	%eax, %edi	# tmp102,
	call	pwmOutConfig	#
	movq	%rax, %rdx	#, D.5502
	movslq	%ebx, %rax	# D.5499, tmp103
	movq	%rdx, motors(,%rax,8)	# D.5502, motors
	.loc 1 212 0
	movzbl	-40(%rbp), %eax	# motorIndex, D.5499
	cltq
	movq	motors(,%rax,8), %rax	# motors, D.5502
	movq	$pwmWriteBrushed, 16(%rax)	#, _17->pwmWritePtr
	.loc 1 213 0
	nop
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	pwmBrushedMotorConfig, .-pwmBrushedMotorConfig
	.section	.text.pwmBrushlessMotorConfig,"ax",@progbits
	.globl	pwmBrushlessMotorConfig
	.type	pwmBrushlessMotorConfig, @function
pwmBrushlessMotorConfig:
.LFB15:
	.loc 1 219 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$40, %rsp	#,
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)	# pin, pin
	movl	%ecx, %eax	# idlePulse, tmp98
	movb	%sil, -40(%rbp)	# tmp96, motorIndex
	movw	%dx, -44(%rbp)	# tmp97, motorPwmRate
	movw	%ax, -48(%rbp)	# tmp98, idlePulse
	.loc 1 220 0
	movl	$1000000, -20(%rbp)	#, hz
	.loc 1 221 0
	movzbl	-40(%rbp), %ebx	# motorIndex, D.5503
	movzwl	-48(%rbp), %esi	# idlePulse, D.5503
	movzwl	-44(%rbp), %edi	# motorPwmRate, D.5504
	movl	-20(%rbp), %eax	# hz, tmp101
	movl	$0, %edx	#, tmp100
	divl	%edi	# D.5504
	movzwl	%ax, %ecx	# D.5505, D.5503
	movl	-36(%rbp), %eax	# pin, tmp102
	movl	%esi, %edx	# D.5503,
	movl	%ecx, %esi	# D.5503,
	movl	%eax, %edi	# tmp102,
	call	pwmOutConfig	#
	movq	%rax, %rdx	#, D.5506
	movslq	%ebx, %rax	# D.5503, tmp103
	movq	%rdx, motors(,%rax,8)	# D.5506, motors
	.loc 1 222 0
	movzbl	-40(%rbp), %eax	# motorIndex, D.5503
	cltq
	movq	motors(,%rax,8), %rax	# motors, D.5506
	movq	$pwmWriteStandard, 16(%rax)	#, _17->pwmWritePtr
	.loc 1 223 0
	nop
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	pwmBrushlessMotorConfig, .-pwmBrushlessMotorConfig
	.section	.text.pwmOneshotMotorConfig,"ax",@progbits
	.globl	pwmOneshotMotorConfig
	.type	pwmOneshotMotorConfig, @function
pwmOneshotMotorConfig:
.LFB16:
	.loc 1 227 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 3, -24
	movl	%edi, -20(%rbp)	# pin, pin
	movl	%esi, %eax	# motorIndex, tmp91
	movb	%al, -24(%rbp)	# tmp91, motorIndex
	.loc 1 228 0
	movzbl	-24(%rbp), %ebx	# motorIndex, D.5507
	movl	-20(%rbp), %eax	# pin, tmp92
	movl	$0, %edx	#,
	movl	$65535, %esi	#,
	movl	%eax, %edi	# tmp92,
	call	pwmOutConfig	#
	movq	%rax, %rdx	#, D.5508
	movslq	%ebx, %rax	# D.5507, tmp93
	movq	%rdx, motors(,%rax,8)	# D.5508, motors
	.loc 1 229 0
	movzbl	-24(%rbp), %eax	# motorIndex, D.5507
	cltq
	movq	motors(,%rax,8), %rax	# motors, D.5508
	movq	$pwmWriteStandard, 16(%rax)	#, _9->pwmWritePtr
	.loc 1 230 0
	nop
	addq	$24, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	pwmOneshotMotorConfig, .-pwmOneshotMotorConfig
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/mraa/pwm.h"
	.file 4 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x47f
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF43
	.byte	0xc
	.long	.LASF44
	.long	.LASF45
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF14
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF15
	.uleb128 0x4
	.long	.LASF16
	.byte	0x3
	.byte	0x30
	.long	0xb7
	.uleb128 0x5
	.byte	0x8
	.long	0xbd
	.uleb128 0x6
	.long	.LASF46
	.uleb128 0x4
	.long	.LASF17
	.byte	0x1
	.byte	0x2c
	.long	0xcd
	.uleb128 0x5
	.byte	0x8
	.long	0xd3
	.uleb128 0x7
	.long	0xe3
	.uleb128 0x8
	.long	0x45
	.uleb128 0x8
	.long	0x57
	.byte	0
	.uleb128 0x9
	.byte	0x18
	.byte	0x1
	.byte	0x2e
	.long	0x11c
	.uleb128 0xa
	.string	"pwm"
	.byte	0x1
	.byte	0x31
	.long	0xac
	.byte	0
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1
	.byte	0x32
	.long	0x57
	.byte	0x8
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.byte	0x33
	.long	0x57
	.byte	0xa
	.uleb128 0xb
	.long	.LASF20
	.byte	0x1
	.byte	0x34
	.long	0xc2
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.long	.LASF21
	.byte	0x1
	.byte	0x35
	.long	0xe3
	.uleb128 0xc
	.long	.LASF47
	.byte	0x1
	.byte	0x72
	.long	0x17f
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x17f
	.uleb128 0xd
	.string	"pin"
	.byte	0x1
	.byte	0x72
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xe
	.long	.LASF18
	.byte	0x1
	.byte	0x72
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.long	.LASF19
	.byte	0x1
	.byte	0x72
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xf
	.string	"p"
	.byte	0x1
	.byte	0x75
	.long	0x17f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x11c
	.uleb128 0x10
	.long	.LASF23
	.byte	0x1
	.byte	0x91
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x1bf
	.uleb128 0xe
	.long	.LASF22
	.byte	0x1
	.byte	0x91
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.long	.LASF19
	.byte	0x1
	.byte	0x91
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF24
	.byte	0x1
	.byte	0x96
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f9
	.uleb128 0xe
	.long	.LASF22
	.byte	0x1
	.byte	0x96
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.long	.LASF19
	.byte	0x1
	.byte	0x96
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.long	.LASF25
	.byte	0x1
	.byte	0x9b
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x233
	.uleb128 0xe
	.long	.LASF22
	.byte	0x1
	.byte	0x9b
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.long	.LASF19
	.byte	0x1
	.byte	0x9b
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.long	.LASF26
	.byte	0x1
	.byte	0xa1
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x26d
	.uleb128 0xe
	.long	.LASF27
	.byte	0x1
	.byte	0xa1
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.long	.LASF22
	.byte	0x1
	.byte	0xa3
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x14
	.long	.LASF28
	.byte	0x1
	.byte	0xab
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF29
	.byte	0x1
	.byte	0xb0
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF48
	.byte	0x1
	.byte	0xca
	.long	0x9e
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x2cf
	.uleb128 0xe
	.long	.LASF30
	.byte	0x1
	.byte	0xca
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x11
	.long	.LASF31
	.byte	0x1
	.byte	0xd0
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x332
	.uleb128 0xd
	.string	"pin"
	.byte	0x1
	.byte	0xd0
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.long	.LASF32
	.byte	0x1
	.byte	0xd0
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.long	.LASF30
	.byte	0x1
	.byte	0xd0
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xe
	.long	.LASF33
	.byte	0x1
	.byte	0xd0
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xf
	.string	"hz"
	.byte	0x1
	.byte	0xd2
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x11
	.long	.LASF34
	.byte	0x1
	.byte	0xda
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x395
	.uleb128 0xd
	.string	"pin"
	.byte	0x1
	.byte	0xda
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.long	.LASF32
	.byte	0x1
	.byte	0xda
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.long	.LASF30
	.byte	0x1
	.byte	0xda
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xe
	.long	.LASF33
	.byte	0x1
	.byte	0xda
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xf
	.string	"hz"
	.byte	0x1
	.byte	0xdc
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x11
	.long	.LASF35
	.byte	0x1
	.byte	0xe2
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x3cf
	.uleb128 0xd
	.string	"pin"
	.byte	0x1
	.byte	0xe2
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xe
	.long	.LASF32
	.byte	0x1
	.byte	0xe2
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x16
	.long	0x11c
	.long	0x3df
	.uleb128 0x17
	.long	0x82
	.byte	0x3
	.byte	0
	.uleb128 0x13
	.long	.LASF36
	.byte	0x1
	.byte	0x37
	.long	0x3cf
	.uleb128 0x9
	.byte	0x3
	.quad	pwmOutputPorts
	.uleb128 0x16
	.long	0x17f
	.long	0x404
	.uleb128 0x17
	.long	0x82
	.byte	0x3
	.byte	0
	.uleb128 0x13
	.long	.LASF37
	.byte	0x1
	.byte	0x39
	.long	0x3f4
	.uleb128 0x9
	.byte	0x3
	.quad	motors
	.uleb128 0x13
	.long	.LASF38
	.byte	0x1
	.byte	0x3f
	.long	0x45
	.uleb128 0x9
	.byte	0x3
	.quad	allocatedOutputPortCount
	.uleb128 0x13
	.long	.LASF39
	.byte	0x1
	.byte	0x41
	.long	0x9e
	.uleb128 0x9
	.byte	0x3
	.quad	pwmMotorsEnabled
	.uleb128 0x18
	.long	.LASF40
	.byte	0x4
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x18
	.long	.LASF41
	.byte	0x4
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x18
	.long	.LASF42
	.byte	0x4
	.byte	0xca
	.long	0x69
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
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.long	0xcc
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
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
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF28:
	.string	"pwmDisableMotors"
.LASF47:
	.string	"pwmOutConfig"
.LASF25:
	.string	"pwmWriteMotor"
.LASF15:
	.string	"float"
.LASF24:
	.string	"pwmWriteStandard"
.LASF18:
	.string	"period"
.LASF35:
	.string	"pwmOneshotMotorConfig"
.LASF38:
	.string	"allocatedOutputPortCount"
.LASF33:
	.string	"idlePulse"
.LASF27:
	.string	"motorCount"
.LASF17:
	.string	"pwmWriteFuncPtr"
.LASF44:
	.string	"src/main/drivers/pwm_output.c"
.LASF13:
	.string	"long long unsigned int"
.LASF32:
	.string	"motorIndex"
.LASF3:
	.string	"unsigned char"
.LASF23:
	.string	"pwmWriteBrushed"
.LASF9:
	.string	"long unsigned int"
.LASF6:
	.string	"short unsigned int"
.LASF43:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF29:
	.string	"pwmEnableMotors"
.LASF45:
	.string	"/home/aravind/git/cleanflight"
.LASF16:
	.string	"mraa_pwm_context"
.LASF48:
	.string	"isMotorBrushed"
.LASF26:
	.string	"pwmShutdownPulsesForAllMotors"
.LASF8:
	.string	"unsigned int"
.LASF11:
	.string	"char"
.LASF4:
	.string	"uint8_t"
.LASF39:
	.string	"pwmMotorsEnabled"
.LASF10:
	.string	"sizetype"
.LASF12:
	.string	"long long int"
.LASF41:
	.string	"U_ID_1"
.LASF42:
	.string	"U_ID_2"
.LASF22:
	.string	"index"
.LASF19:
	.string	"value"
.LASF36:
	.string	"pwmOutputPorts"
.LASF1:
	.string	"short int"
.LASF20:
	.string	"pwmWritePtr"
.LASF40:
	.string	"U_ID_0"
.LASF5:
	.string	"uint16_t"
.LASF37:
	.string	"motors"
.LASF21:
	.string	"pwmOutputPort_t"
.LASF46:
	.string	"_pwm"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF34:
	.string	"pwmBrushlessMotorConfig"
.LASF0:
	.string	"signed char"
.LASF31:
	.string	"pwmBrushedMotorConfig"
.LASF14:
	.string	"_Bool"
.LASF30:
	.string	"motorPwmRate"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
