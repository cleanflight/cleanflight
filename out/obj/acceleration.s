	.file	"acceleration.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed acceleration.i -mtune=generic
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
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	profileSelection_System,1,1
	.comm	batteryConfig_System,8,8
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.comm	boardAlignment_System,6,1
	.comm	featureConfig_System,4,4
	.section	.bss.accelerometerConfig_Storage,"aw",@nobits
	.align 32
	.type	accelerometerConfig_Storage, @object
	.size	accelerometerConfig_Storage, 48
accelerometerConfig_Storage:
	.zero	48
	.comm	accelerometerConfig_ProfileCurrent,8,8
	.globl	accelerometerConfig_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	accelerometerConfig_Registry, @object
	.size	accelerometerConfig_Registry, 32
accelerometerConfig_Registry:
# pgn:
	.value	35
# size:
	.value	-32752
# address:
	.zero	4
	.quad	accelerometerConfig_Storage
# ptr:
	.quad	accelerometerConfig_ProfileCurrent
# reset:
# fn:
	.quad	pgResetFn_accelerometerConfig
	.section	.text.resetRollAndPitchTrims,"ax",@progbits
	.globl	resetRollAndPitchTrims
	.type	resetRollAndPitchTrims, @function
resetRollAndPitchTrims:
.LFB14:
	.file 1 "src/main/sensors/acceleration.c"
	.loc 1 51 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# rollAndPitchTrims, rollAndPitchTrims
	.loc 1 52 0
	movq	-8(%rbp), %rax	# rollAndPitchTrims, tmp87
	movw	$0, (%rax)	#, rollAndPitchTrims_2(D)->values.roll
	movq	-8(%rbp), %rax	# rollAndPitchTrims, tmp88
	movw	$0, 2(%rax)	#, rollAndPitchTrims_2(D)->values.pitch
	.loc 1 56 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	resetRollAndPitchTrims, .-resetRollAndPitchTrims
	.section	.text.pgResetFn_accelerometerConfig,"ax",@progbits
	.globl	pgResetFn_accelerometerConfig
	.type	pgResetFn_accelerometerConfig, @function
pgResetFn_accelerometerConfig:
.LFB15:
	.loc 1 59 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$8, %rsp	#,
	movq	%rdi, -8(%rbp)	# instance, instance
	.loc 1 60 0
	movq	-8(%rbp), %rax	# instance, tmp88
	movq	$0, (%rax)	#, *instance_2(D)
	movq	$0, 8(%rax)	#, *instance_2(D)
	movq	-8(%rbp), %rax	# instance, tmp89
	movb	$15, 4(%rax)	#, instance_2(D)->acc_cut_hz
	movq	-8(%rbp), %rax	# instance, tmp90
	movss	.LC0(%rip), %xmm0	#, tmp91
	movss	%xmm0, 8(%rax)	# tmp91, instance_2(D)->accz_lpf_cutoff
	movq	-8(%rbp), %rax	# instance, tmp92
	movb	$40, 12(%rax)	#, instance_2(D)->accDeadband.xy
	movq	-8(%rbp), %rax	# instance, tmp93
	movb	$40, 13(%rax)	#, instance_2(D)->accDeadband.z
	movq	-8(%rbp), %rax	# instance, tmp94
	movb	$1, 14(%rax)	#, instance_2(D)->acc_unarmedcal
	.loc 1 67 0
	movq	-8(%rbp), %rax	# instance, D.3035
	movq	%rax, %rdi	# D.3035,
	call	resetRollAndPitchTrims	#
	.loc 1 68 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	pgResetFn_accelerometerConfig, .-pgResetFn_accelerometerConfig
	.comm	accADC,12,8
	.comm	acc,24,16
	.globl	accAlign
	.section	.bss.accAlign,"aw",@nobits
	.align 4
	.type	accAlign, @object
	.size	accAlign, 4
accAlign:
	.zero	4
	.globl	calibratingA
	.section	.bss.calibratingA,"aw",@nobits
	.align 2
	.type	calibratingA, @object
	.size	calibratingA, 2
calibratingA:
	.zero	2
	.globl	initialized
	.section	.bss.initialized,"aw",@nobits
	.type	initialized, @object
	.size	initialized, 1
initialized:
	.zero	1
	.section	.bss.accelerationTrims,"aw",@nobits
	.align 8
	.type	accelerationTrims, @object
	.size	accelerationTrims, 8
accelerationTrims:
	.zero	8
	.section	.text.accSetCalibrationCycles,"ax",@progbits
	.globl	accSetCalibrationCycles
	.type	accSetCalibrationCycles, @function
accSetCalibrationCycles:
.LFB16:
	.loc 1 88 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# calibrationCyclesRequired, tmp87
	movw	%ax, -4(%rbp)	# tmp87, calibrationCyclesRequired
	.loc 1 89 0
	movzwl	-4(%rbp), %eax	# calibrationCyclesRequired, tmp88
	movw	%ax, calibratingA(%rip)	# tmp88, calibratingA
	.loc 1 90 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	accSetCalibrationCycles, .-accSetCalibrationCycles
	.section	.text.isAccelerationCalibrationComplete,"ax",@progbits
	.globl	isAccelerationCalibrationComplete
	.type	isAccelerationCalibrationComplete, @function
isAccelerationCalibrationComplete:
.LFB17:
	.loc 1 93 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 94 0
	movzwl	calibratingA(%rip), %eax	# calibratingA, D.3036
	testw	%ax, %ax	# D.3036
	sete	%al	#, D.3037
	.loc 1 95 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	isAccelerationCalibrationComplete, .-isAccelerationCalibrationComplete
	.section	.text.isOnFinalAccelerationCalibrationCycle,"ax",@progbits
	.globl	isOnFinalAccelerationCalibrationCycle
	.type	isOnFinalAccelerationCalibrationCycle, @function
isOnFinalAccelerationCalibrationCycle:
.LFB18:
	.loc 1 98 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 99 0
	movzwl	calibratingA(%rip), %eax	# calibratingA, D.3038
	cmpw	$1, %ax	#, D.3038
	sete	%al	#, D.3039
	.loc 1 100 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	isOnFinalAccelerationCalibrationCycle, .-isOnFinalAccelerationCalibrationCycle
	.section	.text.isOnFirstAccelerationCalibrationCycle,"ax",@progbits
	.globl	isOnFirstAccelerationCalibrationCycle
	.type	isOnFirstAccelerationCalibrationCycle, @function
isOnFirstAccelerationCalibrationCycle:
.LFB19:
	.loc 1 103 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 104 0
	movzwl	calibratingA(%rip), %eax	# calibratingA, D.3040
	cmpw	$400, %ax	#, D.3040
	sete	%al	#, D.3041
	.loc 1 105 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	isOnFirstAccelerationCalibrationCycle, .-isOnFirstAccelerationCalibrationCycle
	.section	.text.performAcclerationCalibration,"ax",@progbits
	.globl	performAcclerationCalibration
	.type	performAcclerationCalibration, @function
performAcclerationCalibration:
.LFB20:
	.loc 1 108 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$24, %rsp	#,
	movq	%rdi, -24(%rbp)	# rollAndPitchTrims, rollAndPitchTrims
	.loc 1 112 0
	movb	$0, -1(%rbp)	#, axis
	jmp	.L11	#
.L13:
	.loc 1 115 0
	call	isOnFirstAccelerationCalibrationCycle	#
	testb	%al, %al	# D.3042
	je	.L12	#,
	.loc 1 116 0
	movzbl	-1(%rbp), %eax	# axis, D.3043
	cltq
	movl	$0, a.2841(,%rax,4)	#, a
.L12:
	.loc 1 119 0 discriminator 2
	movzbl	-1(%rbp), %ecx	# axis, D.3043
	movzbl	-1(%rbp), %eax	# axis, D.3043
	cltq
	movl	a.2841(,%rax,4), %edx	# a, D.3043
	movzbl	-1(%rbp), %eax	# axis, D.3043
	cltq
	movl	accADC(,%rax,4), %eax	# accADC, D.3043
	addl	%eax, %edx	# D.3043, D.3043
	movslq	%ecx, %rax	# D.3043, tmp123
	movl	%edx, a.2841(,%rax,4)	# D.3043, a
	.loc 1 122 0 discriminator 2
	movzbl	-1(%rbp), %eax	# axis, D.3043
	cltq
	movl	$0, accADC(,%rax,4)	#, accADC
	.loc 1 123 0 discriminator 2
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3044
	movzbl	-1(%rbp), %edx	# axis, D.3043
	movslq	%edx, %rdx	# D.3043, tmp125
	movw	$0, (%rax,%rdx,2)	#, _20->raw
	.loc 1 112 0 discriminator 2
	movzbl	-1(%rbp), %eax	# axis, D.3045
	addl	$1, %eax	#, tmp126
	movb	%al, -1(%rbp)	# tmp126, axis
.L11:
	.loc 1 112 0 is_stmt 0 discriminator 1
	cmpb	$2, -1(%rbp)	#, axis
	jbe	.L13	#,
	.loc 1 126 0 is_stmt 1
	call	isOnFinalAccelerationCalibrationCycle	#
	testb	%al, %al	# D.3042
	je	.L14	#,
	.loc 1 128 0
	movq	accelerationTrims(%rip), %rsi	# accelerationTrims, D.3044
	movl	a.2841(%rip), %eax	# a, D.3043
	leal	200(%rax), %ecx	#, D.3043
	movl	$1374389535, %edx	#, tmp128
	movl	%ecx, %eax	# D.3043, tmp140
	imull	%edx	# tmp128
	sarl	$7, %edx	#, tmp129
	movl	%ecx, %eax	# D.3043, tmp130
	sarl	$31, %eax	#, tmp130
	subl	%eax, %edx	# tmp130, D.3043
	movl	%edx, %eax	# D.3043, D.3043
	movw	%ax, (%rsi)	# D.3046, _27->raw
	.loc 1 129 0
	movq	accelerationTrims(%rip), %rsi	# accelerationTrims, D.3044
	movl	a.2841+4(%rip), %eax	# a, D.3043
	leal	200(%rax), %ecx	#, D.3043
	movl	$1374389535, %edx	#, tmp132
	movl	%ecx, %eax	# D.3043, tmp141
	imull	%edx	# tmp132
	sarl	$7, %edx	#, tmp133
	movl	%ecx, %eax	# D.3043, tmp134
	sarl	$31, %eax	#, tmp134
	subl	%eax, %edx	# tmp134, D.3043
	movl	%edx, %eax	# D.3043, D.3043
	movw	%ax, 2(%rsi)	# D.3046, _33->raw
	.loc 1 130 0
	movq	accelerationTrims(%rip), %rsi	# accelerationTrims, D.3044
	movl	a.2841+8(%rip), %eax	# a, D.3043
	leal	200(%rax), %ecx	#, D.3043
	movl	$1374389535, %edx	#, tmp136
	movl	%ecx, %eax	# D.3043, tmp142
	imull	%edx	# tmp136
	sarl	$7, %edx	#, tmp137
	movl	%ecx, %eax	# D.3043, tmp138
	sarl	$31, %eax	#, tmp138
	subl	%eax, %edx	# tmp138, D.3043
	movl	%edx, %eax	# D.3043, D.3043
	movl	%eax, %edx	# D.3043, D.3047
	movzwl	acc+16(%rip), %eax	# acc.acc_1G, D.3048
	subl	%eax, %edx	# D.3048, D.3047
	movl	%edx, %eax	# D.3047, D.3047
	movw	%ax, 4(%rsi)	# D.3046, _39->raw
	.loc 1 132 0
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp139
	movq	%rax, %rdi	# tmp139,
	call	resetRollAndPitchTrims	#
.L14:
	.loc 1 137 0
	movzwl	calibratingA(%rip), %eax	# calibratingA, D.3048
	subl	$1, %eax	#, D.3048
	movw	%ax, calibratingA(%rip)	# D.3048, calibratingA
	.loc 1 138 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	performAcclerationCalibration, .-performAcclerationCalibration
	.section	.text.performInflightAccelerationCalibration,"ax",@progbits
	.globl	performInflightAccelerationCalibration
	.type	performInflightAccelerationCalibration, @function
performInflightAccelerationCalibration:
.LFB21:
	.loc 1 141 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# rollAndPitchTrims, rollAndPitchTrims
	.loc 1 148 0
	movzwl	InflightcalibratingA(%rip), %eax	# InflightcalibratingA, D.3049
	cmpw	$50, %ax	#, D.3049
	jne	.L16	#,
	.loc 1 149 0
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3050
	movzwl	(%rax), %eax	# _10->raw, D.3051
	movw	%ax, accZero_saved.2851(%rip)	# D.3051, accZero_saved
	.loc 1 150 0
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3050
	movzwl	2(%rax), %eax	# _13->raw, D.3051
	movw	%ax, accZero_saved.2851+2(%rip)	# D.3051, accZero_saved
	.loc 1 151 0
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3050
	movzwl	4(%rax), %eax	# _16->raw, D.3051
	movw	%ax, accZero_saved.2851+4(%rip)	# D.3051, accZero_saved
	.loc 1 152 0
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp136
	movzwl	(%rax), %eax	# rollAndPitchTrims_19(D)->values.roll, D.3051
	movw	%ax, angleTrim_saved.2852(%rip)	# D.3051, angleTrim_saved.values.roll
	.loc 1 153 0
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp137
	movzwl	2(%rax), %eax	# rollAndPitchTrims_19(D)->values.pitch, D.3051
	movw	%ax, angleTrim_saved.2852+2(%rip)	# D.3051, angleTrim_saved.values.pitch
.L16:
	.loc 1 155 0
	movzwl	InflightcalibratingA(%rip), %eax	# InflightcalibratingA, D.3049
	testw	%ax, %ax	# D.3049
	je	.L17	#,
	.loc 1 156 0
	movb	$0, -1(%rbp)	#, axis
	jmp	.L18	#
.L20:
	.loc 1 158 0
	movzwl	InflightcalibratingA(%rip), %eax	# InflightcalibratingA, D.3049
	cmpw	$50, %ax	#, D.3049
	jne	.L19	#,
	.loc 1 159 0
	movzbl	-1(%rbp), %eax	# axis, D.3052
	cltq
	movl	$0, b.2850(,%rax,4)	#, b
.L19:
	.loc 1 161 0 discriminator 2
	movzbl	-1(%rbp), %ecx	# axis, D.3052
	movzbl	-1(%rbp), %eax	# axis, D.3052
	cltq
	movl	b.2850(,%rax,4), %edx	# b, D.3052
	movzbl	-1(%rbp), %eax	# axis, D.3052
	cltq
	movl	accADC(,%rax,4), %eax	# accADC, D.3052
	addl	%eax, %edx	# D.3052, D.3052
	movslq	%ecx, %rax	# D.3052, tmp141
	movl	%edx, b.2850(,%rax,4)	# D.3052, b
	.loc 1 163 0 discriminator 2
	movzbl	-1(%rbp), %eax	# axis, D.3052
	cltq
	movl	$0, accADC(,%rax,4)	#, accADC
	.loc 1 164 0 discriminator 2
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3050
	movzbl	-1(%rbp), %edx	# axis, D.3052
	movslq	%edx, %rdx	# D.3052, tmp143
	movw	$0, (%rax,%rdx,2)	#, _38->raw
	.loc 1 156 0 discriminator 2
	movzbl	-1(%rbp), %eax	# axis, D.3053
	addl	$1, %eax	#, tmp144
	movb	%al, -1(%rbp)	# tmp144, axis
.L18:
	.loc 1 156 0 is_stmt 0 discriminator 1
	cmpb	$2, -1(%rbp)	#, axis
	jbe	.L20	#,
	.loc 1 167 0 is_stmt 1
	movzwl	InflightcalibratingA(%rip), %eax	# InflightcalibratingA, D.3049
	cmpw	$1, %ax	#, D.3049
	jne	.L21	#,
	.loc 1 168 0
	movb	$0, AccInflightCalibrationActive(%rip)	#, AccInflightCalibrationActive
	.loc 1 169 0
	movb	$1, AccInflightCalibrationMeasurementDone(%rip)	#, AccInflightCalibrationMeasurementDone
	.loc 1 170 0
	movl	$12, %edi	#,
	call	beeper	#
	.loc 1 172 0
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3050
	movzwl	accZero_saved.2851(%rip), %edx	# accZero_saved, D.3051
	movw	%dx, (%rax)	# D.3051, _47->raw
	.loc 1 173 0
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3050
	movzwl	accZero_saved.2851+2(%rip), %edx	# accZero_saved, D.3051
	movw	%dx, 2(%rax)	# D.3051, _50->raw
	.loc 1 174 0
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3050
	movzwl	accZero_saved.2851+4(%rip), %edx	# accZero_saved, D.3051
	movw	%dx, 4(%rax)	# D.3051, _53->raw
	.loc 1 175 0
	movzwl	angleTrim_saved.2852(%rip), %edx	# angleTrim_saved.values.roll, D.3051
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp145
	movw	%dx, (%rax)	# D.3051, rollAndPitchTrims_19(D)->values.roll
	.loc 1 176 0
	movzwl	angleTrim_saved.2852+2(%rip), %edx	# angleTrim_saved.values.pitch, D.3051
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp146
	movw	%dx, 2(%rax)	# D.3051, rollAndPitchTrims_19(D)->values.pitch
.L21:
	.loc 1 178 0
	movzwl	InflightcalibratingA(%rip), %eax	# InflightcalibratingA, D.3049
	subl	$1, %eax	#, D.3049
	movw	%ax, InflightcalibratingA(%rip)	# D.3049, InflightcalibratingA
.L17:
	.loc 1 181 0
	movzbl	AccInflightCalibrationSavetoEEProm(%rip), %eax	# AccInflightCalibrationSavetoEEProm, D.3054
	testb	%al, %al	# D.3054
	je	.L23	#,
	.loc 1 182 0
	movb	$0, AccInflightCalibrationSavetoEEProm(%rip)	#, AccInflightCalibrationSavetoEEProm
	.loc 1 183 0
	movq	accelerationTrims(%rip), %rsi	# accelerationTrims, D.3050
	movl	b.2850(%rip), %ecx	# b, D.3052
	movl	$1374389535, %edx	#, tmp148
	movl	%ecx, %eax	# D.3052, tmp160
	imull	%edx	# tmp148
	sarl	$4, %edx	#, tmp149
	movl	%ecx, %eax	# D.3052, tmp150
	sarl	$31, %eax	#, tmp150
	subl	%eax, %edx	# tmp150, D.3052
	movl	%edx, %eax	# D.3052, D.3052
	movw	%ax, (%rsi)	# D.3051, _66->raw
	.loc 1 184 0
	movq	accelerationTrims(%rip), %rsi	# accelerationTrims, D.3050
	movl	b.2850+4(%rip), %ecx	# b, D.3052
	movl	$1374389535, %edx	#, tmp152
	movl	%ecx, %eax	# D.3052, tmp161
	imull	%edx	# tmp152
	sarl	$4, %edx	#, tmp153
	movl	%ecx, %eax	# D.3052, tmp154
	sarl	$31, %eax	#, tmp154
	subl	%eax, %edx	# tmp154, D.3052
	movl	%edx, %eax	# D.3052, D.3052
	movw	%ax, 2(%rsi)	# D.3051, _71->raw
	.loc 1 185 0
	movq	accelerationTrims(%rip), %rsi	# accelerationTrims, D.3050
	movl	b.2850+8(%rip), %ecx	# b, D.3052
	movl	$1374389535, %edx	#, tmp156
	movl	%ecx, %eax	# D.3052, tmp162
	imull	%edx	# tmp156
	sarl	$4, %edx	#, tmp157
	movl	%ecx, %eax	# D.3052, tmp158
	sarl	$31, %eax	#, tmp158
	subl	%eax, %edx	# tmp158, D.3052
	movl	%edx, %eax	# D.3052, D.3052
	movl	%eax, %edx	# D.3052, D.3055
	movzwl	acc+16(%rip), %eax	# acc.acc_1G, D.3049
	subl	%eax, %edx	# D.3049, D.3055
	movl	%edx, %eax	# D.3055, D.3055
	movw	%ax, 4(%rsi)	# D.3051, _76->raw
	.loc 1 187 0
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp159
	movq	%rax, %rdi	# tmp159,
	call	resetRollAndPitchTrims	#
.L23:
	.loc 1 191 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	performInflightAccelerationCalibration, .-performInflightAccelerationCalibration
	.section	.text.applyAccelerationTrims,"ax",@progbits
	.globl	applyAccelerationTrims
	.type	applyAccelerationTrims, @function
applyAccelerationTrims:
.LFB22:
	.loc 1 194 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# accelerationTrims, accelerationTrims
	.loc 1 195 0
	movl	accADC(%rip), %edx	# accADC, D.3056
	movq	-8(%rbp), %rax	# accelerationTrims, tmp99
	movzwl	(%rax), %eax	# accelerationTrims_3(D)->raw, D.3057
	cwtl
	subl	%eax, %edx	# D.3056, D.3056
	movl	%edx, %eax	# D.3056, D.3056
	movl	%eax, accADC(%rip)	# D.3056, accADC
	.loc 1 196 0
	movl	accADC+4(%rip), %edx	# accADC, D.3056
	movq	-8(%rbp), %rax	# accelerationTrims, tmp100
	movzwl	2(%rax), %eax	# accelerationTrims_3(D)->raw, D.3057
	cwtl
	subl	%eax, %edx	# D.3056, D.3056
	movl	%edx, %eax	# D.3056, D.3056
	movl	%eax, accADC+4(%rip)	# D.3056, accADC
	.loc 1 197 0
	movl	accADC+8(%rip), %edx	# accADC, D.3056
	movq	-8(%rbp), %rax	# accelerationTrims, tmp101
	movzwl	4(%rax), %eax	# accelerationTrims_3(D)->raw, D.3057
	cwtl
	subl	%eax, %edx	# D.3056, D.3056
	movl	%edx, %eax	# D.3056, D.3056
	movl	%eax, accADC+8(%rip)	# D.3056, accADC
	.loc 1 198 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	applyAccelerationTrims, .-applyAccelerationTrims
	.section	.text.convertRawACCADCReadingsToInternalType,"ax",@progbits
	.type	convertRawACCADCReadingsToInternalType, @function
convertRawACCADCReadingsToInternalType:
.LFB23:
	.loc 1 201 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# accADCRaw, accADCRaw
	.loc 1 204 0
	movl	$0, -4(%rbp)	#, axis
	jmp	.L26	#
.L27:
	.loc 1 205 0 discriminator 3
	movl	-4(%rbp), %eax	# axis, tmp92
	cltq
	leaq	(%rax,%rax), %rdx	#, D.3058
	movq	-24(%rbp), %rax	# accADCRaw, tmp93
	addq	%rdx, %rax	# D.3058, D.3059
	movzwl	(%rax), %eax	# *_8, D.3060
	movswl	%ax, %edx	# D.3060, D.3061
	movl	-4(%rbp), %eax	# axis, tmp95
	cltq
	movl	%edx, accADC(,%rax,4)	# D.3061, accADC
	.loc 1 204 0 discriminator 3
	addl	$1, -4(%rbp)	#, axis
.L26:
	.loc 1 204 0 is_stmt 0 discriminator 1
	cmpl	$2, -4(%rbp)	#, axis
	jle	.L27	#,
	.loc 1 207 0 is_stmt 1
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	convertRawACCADCReadingsToInternalType, .-convertRawACCADCReadingsToInternalType
	.section	.text.updateAccelerationReadings,"ax",@progbits
	.globl	updateAccelerationReadings
	.type	updateAccelerationReadings, @function
updateAccelerationReadings:
.LFB24:
	.loc 1 210 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# rollAndPitchTrims, rollAndPitchTrims
	.loc 1 210 0
	movq	%fs:40, %rax	#, tmp105
	movq	%rax, -8(%rbp)	# tmp105, D.3069
	xorl	%eax, %eax	# tmp105
	.loc 1 211 0
	movzbl	initialized(%rip), %eax	# initialized, D.3062
	xorl	$1, %eax	#, D.3062
	testb	%al, %al	# D.3062
	je	.L29	#,
	.loc 1 213 0
	movl	$6, %edi	#,
	call	malloc	#
	movq	%rax, accelerationTrims(%rip)	# D.3063, accelerationTrims
	.loc 1 214 0
	movb	$1, initialized(%rip)	#, initialized
.L29:
	.loc 1 219 0
	movq	acc+8(%rip), %rax	# acc.read, D.3064
	leaq	-16(%rbp), %rdx	#, tmp101
	movq	%rdx, %rdi	# tmp101,
	call	*%rax	# D.3064
	xorl	$1, %eax	#, D.3062
	testb	%al, %al	# D.3062
	jne	.L35	#,
	.loc 1 223 0
	leaq	-16(%rbp), %rax	#, tmp102
	movq	%rax, %rdi	# tmp102,
	call	convertRawACCADCReadingsToInternalType	#
	.loc 1 225 0
	movl	accAlign(%rip), %eax	# accAlign, D.3065
	movzbl	%al, %eax	# D.3066, D.3067
	movl	%eax, %edx	# D.3067,
	movl	$accADC, %esi	#,
	movl	$accADC, %edi	#,
	call	alignSensors	#
	.loc 1 227 0
	call	isAccelerationCalibrationComplete	#
	xorl	$1, %eax	#, D.3062
	testb	%al, %al	# D.3062
	je	.L32	#,
	.loc 1 228 0
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp103
	movq	%rax, %rdi	# tmp103,
	call	performAcclerationCalibration	#
.L32:
	.loc 1 231 0
	movl	$4, %edi	#,
	call	feature	#
	testb	%al, %al	# D.3062
	je	.L33	#,
	.loc 1 232 0
	movq	-24(%rbp), %rax	# rollAndPitchTrims, tmp104
	movq	%rax, %rdi	# tmp104,
	call	performInflightAccelerationCalibration	#
.L33:
	.loc 1 235 0
	movq	accelerationTrims(%rip), %rax	# accelerationTrims, D.3068
	movq	%rax, %rdi	# D.3068,
	call	applyAccelerationTrims	#
	jmp	.L28	#
.L35:
	.loc 1 220 0
	nop
.L28:
	.loc 1 236 0
	movq	-8(%rbp), %rax	# D.3069, tmp106
	xorq	%fs:40, %rax	#, tmp106
	je	.L34	#,
	call	__stack_chk_fail	#
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	updateAccelerationReadings, .-updateAccelerationReadings
	.section	.text.setAccelerationTrims,"ax",@progbits
	.globl	setAccelerationTrims
	.type	setAccelerationTrims, @function
setAccelerationTrims:
.LFB25:
	.loc 1 239 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# accelerationTrimsToUse, accelerationTrimsToUse
	.loc 1 240 0
	movq	-8(%rbp), %rax	# accelerationTrimsToUse, tmp87
	movq	%rax, accelerationTrims(%rip)	# tmp87, accelerationTrims
	.loc 1 241 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	setAccelerationTrims, .-setAccelerationTrims
	.section	.bss.a.2841,"aw",@nobits
	.align 8
	.type	a.2841, @object
	.size	a.2841, 12
a.2841:
	.zero	12
	.section	.bss.accZero_saved.2851,"aw",@nobits
	.align 2
	.type	accZero_saved.2851, @object
	.size	accZero_saved.2851, 6
accZero_saved.2851:
	.zero	6
	.section	.bss.angleTrim_saved.2852,"aw",@nobits
	.align 2
	.type	angleTrim_saved.2852, @object
	.size	angleTrim_saved.2852, 4
angleTrim_saved.2852:
	.zero	4
	.section	.bss.b.2850,"aw",@nobits
	.align 8
	.type	b.2850, @object
	.size	b.2850, 12
b.2850:
	.zero	12
	.section	.rodata
	.align 4
.LC0:
	.long	1084227584
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/config/parameter_group.h"
	.file 4 "./src/main/common/axis.h"
	.file 5 "./src/main/config/profile.h"
	.file 6 "./src/main/drivers/sensor.h"
	.file 7 "./src/main/drivers/accgyro.h"
	.file 8 "./src/main/fc/config.h"
	.file 9 "./src/main/io/beeper.h"
	.file 10 "./src/main/sensors/battery.h"
	.file 11 "./src/main/sensors/sensors.h"
	.file 12 "./src/main/sensors/boardalignment.h"
	.file 13 "./src/main/config/feature.h"
	.file 14 "./src/main/sensors/acceleration.h"
	.file 15 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb64
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF188
	.byte	0xc
	.long	.LASF189
	.long	.LASF190
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x25
	.long	0x3b
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x26
	.long	0x4d
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x3
	.long	.LASF5
	.byte	0x2
	.byte	0x30
	.long	0x66
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF7
	.byte	0x2
	.byte	0x31
	.long	0x78
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.long	.LASF9
	.byte	0x2
	.byte	0x33
	.long	0x8a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0x4
	.byte	0x14
	.long	0xcf
	.uleb128 0x7
	.string	"X"
	.byte	0
	.uleb128 0x7
	.string	"Y"
	.byte	0x1
	.uleb128 0x7
	.string	"Z"
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0x15
	.long	0x6d
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0x3
	.byte	0x1d
	.long	0x109
	.uleb128 0x8
	.long	.LASF17
	.value	0xfff
	.uleb128 0x8
	.long	.LASF18
	.value	0xf000
	.uleb128 0x8
	.long	.LASF19
	.value	0xfff
	.uleb128 0x9
	.long	.LASF20
	.byte	0
	.uleb128 0x8
	.long	.LASF21
	.value	0x8000
	.byte	0
	.uleb128 0x3
	.long	.LASF22
	.byte	0x3
	.byte	0x26
	.long	0x114
	.uleb128 0xa
	.long	0x124
	.uleb128 0xb
	.long	0x9f
	.uleb128 0xb
	.long	0x4d
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.long	0x142
	.uleb128 0xd
	.string	"ptr"
	.byte	0x3
	.byte	0x2e
	.long	0x9f
	.uleb128 0xd
	.string	"fn"
	.byte	0x3
	.byte	0x2f
	.long	0x142
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x109
	.uleb128 0xf
	.long	.LASF27
	.byte	0x20
	.byte	0x3
	.byte	0x28
	.long	0x191
	.uleb128 0x10
	.string	"pgn"
	.byte	0x3
	.byte	0x29
	.long	0xcf
	.byte	0
	.uleb128 0x11
	.long	.LASF23
	.byte	0x3
	.byte	0x2a
	.long	0x6d
	.byte	0x2
	.uleb128 0x11
	.long	.LASF24
	.byte	0x3
	.byte	0x2b
	.long	0x191
	.byte	0x8
	.uleb128 0x10
	.string	"ptr"
	.byte	0x3
	.byte	0x2c
	.long	0x197
	.byte	0x10
	.uleb128 0x11
	.long	.LASF25
	.byte	0x3
	.byte	0x30
	.long	0x124
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x5b
	.uleb128 0xe
	.byte	0x8
	.long	0x191
	.uleb128 0x3
	.long	.LASF26
	.byte	0x3
	.byte	0x31
	.long	0x148
	.uleb128 0xf
	.long	.LASF28
	.byte	0x1
	.byte	0x5
	.byte	0x16
	.long	0x1c1
	.uleb128 0x11
	.long	.LASF29
	.byte	0x5
	.byte	0x17
	.long	0x5b
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF30
	.byte	0x5
	.byte	0x18
	.long	0x1a8
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF31
	.uleb128 0x3
	.long	.LASF32
	.byte	0x6
	.byte	0x15
	.long	0x1de
	.uleb128 0xe
	.byte	0x8
	.long	0x1e4
	.uleb128 0x12
	.long	0x1cc
	.long	0x1f3
	.uleb128 0xb
	.long	0x1f3
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x30
	.uleb128 0x3
	.long	.LASF33
	.byte	0x6
	.byte	0x18
	.long	0x204
	.uleb128 0xe
	.byte	0x8
	.long	0x20a
	.uleb128 0x13
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF34
	.uleb128 0xf
	.long	.LASF35
	.byte	0x18
	.byte	0x7
	.byte	0x26
	.long	0x24f
	.uleb128 0x11
	.long	.LASF36
	.byte	0x7
	.byte	0x27
	.long	0x1f9
	.byte	0
	.uleb128 0x11
	.long	.LASF37
	.byte	0x7
	.byte	0x28
	.long	0x1d3
	.byte	0x8
	.uleb128 0x11
	.long	.LASF38
	.byte	0x7
	.byte	0x29
	.long	0x6d
	.byte	0x10
	.uleb128 0x11
	.long	.LASF39
	.byte	0x7
	.byte	0x2a
	.long	0xa1
	.byte	0x12
	.byte	0
	.uleb128 0x3
	.long	.LASF40
	.byte	0x7
	.byte	0x2b
	.long	0x212
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0x8
	.byte	0x17
	.long	0x305
	.uleb128 0x9
	.long	.LASF41
	.byte	0x1
	.uleb128 0x9
	.long	.LASF42
	.byte	0x2
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.uleb128 0x9
	.long	.LASF44
	.byte	0x8
	.uleb128 0x9
	.long	.LASF45
	.byte	0x10
	.uleb128 0x9
	.long	.LASF46
	.byte	0x20
	.uleb128 0x9
	.long	.LASF47
	.byte	0x40
	.uleb128 0x9
	.long	.LASF48
	.byte	0x80
	.uleb128 0x8
	.long	.LASF49
	.value	0x100
	.uleb128 0x8
	.long	.LASF50
	.value	0x200
	.uleb128 0x8
	.long	.LASF51
	.value	0x400
	.uleb128 0x8
	.long	.LASF52
	.value	0x800
	.uleb128 0x8
	.long	.LASF53
	.value	0x1000
	.uleb128 0x8
	.long	.LASF54
	.value	0x2000
	.uleb128 0x8
	.long	.LASF55
	.value	0x4000
	.uleb128 0x8
	.long	.LASF56
	.value	0x8000
	.uleb128 0x14
	.long	.LASF57
	.long	0x10000
	.uleb128 0x14
	.long	.LASF58
	.long	0x20000
	.uleb128 0x14
	.long	.LASF59
	.long	0x40000
	.uleb128 0x14
	.long	.LASF60
	.long	0x80000
	.uleb128 0x14
	.long	.LASF61
	.long	0x100000
	.uleb128 0x14
	.long	.LASF62
	.long	0x200000
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0x9
	.byte	0x14
	.long	0x378
	.uleb128 0x9
	.long	.LASF63
	.byte	0
	.uleb128 0x9
	.long	.LASF64
	.byte	0x1
	.uleb128 0x9
	.long	.LASF65
	.byte	0x2
	.uleb128 0x9
	.long	.LASF66
	.byte	0x3
	.uleb128 0x9
	.long	.LASF67
	.byte	0x4
	.uleb128 0x9
	.long	.LASF68
	.byte	0x5
	.uleb128 0x9
	.long	.LASF69
	.byte	0x6
	.uleb128 0x9
	.long	.LASF70
	.byte	0x7
	.uleb128 0x9
	.long	.LASF71
	.byte	0x8
	.uleb128 0x9
	.long	.LASF72
	.byte	0x9
	.uleb128 0x9
	.long	.LASF73
	.byte	0xa
	.uleb128 0x9
	.long	.LASF74
	.byte	0xb
	.uleb128 0x9
	.long	.LASF75
	.byte	0xc
	.uleb128 0x9
	.long	.LASF76
	.byte	0xd
	.uleb128 0x9
	.long	.LASF77
	.byte	0xe
	.uleb128 0x9
	.long	.LASF78
	.byte	0xf
	.uleb128 0x9
	.long	.LASF79
	.byte	0x10
	.byte	0
	.uleb128 0xf
	.long	.LASF80
	.byte	0x8
	.byte	0xa
	.byte	0x14
	.long	0x3c1
	.uleb128 0x11
	.long	.LASF81
	.byte	0xa
	.byte	0x15
	.long	0x5b
	.byte	0
	.uleb128 0x11
	.long	.LASF82
	.byte	0xa
	.byte	0x16
	.long	0x5b
	.byte	0x1
	.uleb128 0x11
	.long	.LASF83
	.byte	0xa
	.byte	0x17
	.long	0x5b
	.byte	0x2
	.uleb128 0x11
	.long	.LASF84
	.byte	0xa
	.byte	0x18
	.long	0x6d
	.byte	0x4
	.uleb128 0x11
	.long	.LASF85
	.byte	0xa
	.byte	0x19
	.long	0x5b
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF86
	.byte	0xa
	.byte	0x1a
	.long	0x378
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0xb
	.byte	0x15
	.long	0x3f1
	.uleb128 0x9
	.long	.LASF87
	.byte	0
	.uleb128 0x9
	.long	.LASF88
	.byte	0x1
	.uleb128 0x9
	.long	.LASF89
	.byte	0x2
	.uleb128 0x9
	.long	.LASF90
	.byte	0x3
	.byte	0
	.uleb128 0xf
	.long	.LASF91
	.byte	0x6
	.byte	0xb
	.byte	0x20
	.long	0x422
	.uleb128 0x11
	.long	.LASF92
	.byte	0xb
	.byte	0x21
	.long	0x30
	.byte	0
	.uleb128 0x11
	.long	.LASF93
	.byte	0xb
	.byte	0x22
	.long	0x30
	.byte	0x2
	.uleb128 0x10
	.string	"yaw"
	.byte	0xb
	.byte	0x23
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF94
	.byte	0xb
	.byte	0x24
	.long	0x3f1
	.uleb128 0x15
	.long	.LASF131
	.byte	0x6
	.byte	0xb
	.byte	0x26
	.long	0x450
	.uleb128 0xd
	.string	"raw"
	.byte	0xb
	.byte	0x27
	.long	0x450
	.uleb128 0x16
	.long	.LASF95
	.byte	0xb
	.byte	0x28
	.long	0x422
	.byte	0
	.uleb128 0x17
	.long	0x30
	.long	0x460
	.uleb128 0x18
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF96
	.byte	0xb
	.byte	0x29
	.long	0x42d
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0xb
	.byte	0x39
	.long	0x4ae
	.uleb128 0x9
	.long	.LASF97
	.byte	0
	.uleb128 0x9
	.long	.LASF98
	.byte	0x1
	.uleb128 0x9
	.long	.LASF99
	.byte	0x2
	.uleb128 0x9
	.long	.LASF100
	.byte	0x3
	.uleb128 0x9
	.long	.LASF101
	.byte	0x4
	.uleb128 0x9
	.long	.LASF102
	.byte	0x5
	.uleb128 0x9
	.long	.LASF103
	.byte	0x6
	.uleb128 0x9
	.long	.LASF104
	.byte	0x7
	.uleb128 0x9
	.long	.LASF105
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF106
	.byte	0xb
	.byte	0x43
	.long	0x46b
	.uleb128 0xf
	.long	.LASF107
	.byte	0xc
	.byte	0xb
	.byte	0x45
	.long	0x4ea
	.uleb128 0x11
	.long	.LASF108
	.byte	0xb
	.byte	0x46
	.long	0x4ae
	.byte	0
	.uleb128 0x11
	.long	.LASF109
	.byte	0xb
	.byte	0x47
	.long	0x4ae
	.byte	0x4
	.uleb128 0x11
	.long	.LASF110
	.byte	0xb
	.byte	0x48
	.long	0x4ae
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF111
	.byte	0xb
	.byte	0x49
	.long	0x4b9
	.uleb128 0xf
	.long	.LASF112
	.byte	0x3
	.byte	0xb
	.byte	0x4b
	.long	0x526
	.uleb128 0x11
	.long	.LASF113
	.byte	0xb
	.byte	0x4c
	.long	0x5b
	.byte	0
	.uleb128 0x11
	.long	.LASF114
	.byte	0xb
	.byte	0x4d
	.long	0x5b
	.byte	0x1
	.uleb128 0x11
	.long	.LASF115
	.byte	0xb
	.byte	0x4e
	.long	0x5b
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF116
	.byte	0xb
	.byte	0x4f
	.long	0x4f5
	.uleb128 0xf
	.long	.LASF117
	.byte	0xc
	.byte	0xb
	.byte	0x51
	.long	0x556
	.uleb128 0x11
	.long	.LASF118
	.byte	0xb
	.byte	0x52
	.long	0x460
	.byte	0
	.uleb128 0x11
	.long	.LASF119
	.byte	0xb
	.byte	0x53
	.long	0x460
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF120
	.byte	0xb
	.byte	0x54
	.long	0x531
	.uleb128 0xf
	.long	.LASF121
	.byte	0x6
	.byte	0xc
	.byte	0x14
	.long	0x592
	.uleb128 0x11
	.long	.LASF122
	.byte	0xc
	.byte	0x15
	.long	0x30
	.byte	0
	.uleb128 0x11
	.long	.LASF123
	.byte	0xc
	.byte	0x16
	.long	0x30
	.byte	0x2
	.uleb128 0x11
	.long	.LASF124
	.byte	0xc
	.byte	0x17
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF125
	.byte	0xc
	.byte	0x18
	.long	0x561
	.uleb128 0xf
	.long	.LASF126
	.byte	0x4
	.byte	0xd
	.byte	0x14
	.long	0x5b6
	.uleb128 0x11
	.long	.LASF127
	.byte	0xd
	.byte	0x15
	.long	0x7f
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF128
	.byte	0xd
	.byte	0x16
	.long	0x59d
	.uleb128 0xf
	.long	.LASF129
	.byte	0x4
	.byte	0xe
	.byte	0x2a
	.long	0x5e6
	.uleb128 0x11
	.long	.LASF92
	.byte	0xe
	.byte	0x2b
	.long	0x30
	.byte	0
	.uleb128 0x11
	.long	.LASF93
	.byte	0xe
	.byte	0x2c
	.long	0x30
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF130
	.byte	0xe
	.byte	0x2d
	.long	0x5c1
	.uleb128 0x15
	.long	.LASF132
	.byte	0x4
	.byte	0xe
	.byte	0x2f
	.long	0x614
	.uleb128 0xd
	.string	"raw"
	.byte	0xe
	.byte	0x30
	.long	0x614
	.uleb128 0x16
	.long	.LASF95
	.byte	0xe
	.byte	0x31
	.long	0x5e6
	.byte	0
	.uleb128 0x17
	.long	0x30
	.long	0x624
	.uleb128 0x18
	.long	0x98
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF133
	.byte	0xe
	.byte	0x32
	.long	0x5f1
	.uleb128 0xf
	.long	.LASF134
	.byte	0x2
	.byte	0xe
	.byte	0x34
	.long	0x651
	.uleb128 0x10
	.string	"xy"
	.byte	0xe
	.byte	0x35
	.long	0x5b
	.byte	0
	.uleb128 0x10
	.string	"z"
	.byte	0xe
	.byte	0x36
	.long	0x5b
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF135
	.byte	0xe
	.byte	0x37
	.long	0x62f
	.uleb128 0xf
	.long	.LASF136
	.byte	0x10
	.byte	0xe
	.byte	0x39
	.long	0x6a5
	.uleb128 0x11
	.long	.LASF137
	.byte	0xe
	.byte	0x3a
	.long	0x624
	.byte	0
	.uleb128 0x11
	.long	.LASF138
	.byte	0xe
	.byte	0x3d
	.long	0x5b
	.byte	0x4
	.uleb128 0x11
	.long	.LASF139
	.byte	0xe
	.byte	0x3e
	.long	0x20b
	.byte	0x8
	.uleb128 0x11
	.long	.LASF140
	.byte	0xe
	.byte	0x3f
	.long	0x651
	.byte	0xc
	.uleb128 0x11
	.long	.LASF141
	.byte	0xe
	.byte	0x40
	.long	0x5b
	.byte	0xe
	.byte	0
	.uleb128 0x3
	.long	.LASF142
	.byte	0xe
	.byte	0x41
	.long	0x65c
	.uleb128 0x19
	.long	.LASF143
	.byte	0x1
	.byte	0x32
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x6dc
	.uleb128 0x1a
	.long	.LASF145
	.byte	0x1
	.byte	0x32
	.long	0x6dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x624
	.uleb128 0x1b
	.long	.LASF144
	.byte	0x1
	.byte	0x3a
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x70e
	.uleb128 0x1a
	.long	.LASF146
	.byte	0x1
	.byte	0x3a
	.long	0x70e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x6a5
	.uleb128 0x19
	.long	.LASF147
	.byte	0x1
	.byte	0x57
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x740
	.uleb128 0x1a
	.long	.LASF148
	.byte	0x1
	.byte	0x57
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.long	.LASF149
	.byte	0x1
	.byte	0x5c
	.long	0x1cc
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.long	.LASF150
	.byte	0x1
	.byte	0x61
	.long	0x1cc
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.long	.LASF151
	.byte	0x1
	.byte	0x66
	.long	0x1cc
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.long	.LASF152
	.byte	0x1
	.byte	0x6b
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x7e4
	.uleb128 0x1a
	.long	.LASF145
	.byte	0x1
	.byte	0x6b
	.long	0x6dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.string	"a"
	.byte	0x1
	.byte	0x6d
	.long	0x7e4
	.uleb128 0x9
	.byte	0x3
	.quad	a.2841
	.uleb128 0x1e
	.long	.LASF153
	.byte	0x1
	.byte	0x6e
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x17
	.long	0x42
	.long	0x7f4
	.uleb128 0x18
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x1b
	.long	.LASF154
	.byte	0x1
	.byte	0x8c
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x86b
	.uleb128 0x1a
	.long	.LASF145
	.byte	0x1
	.byte	0x8c
	.long	0x6dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.long	.LASF153
	.byte	0x1
	.byte	0x8e
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1d
	.string	"b"
	.byte	0x1
	.byte	0x8f
	.long	0x7e4
	.uleb128 0x9
	.byte	0x3
	.quad	b.2850
	.uleb128 0x1e
	.long	.LASF155
	.byte	0x1
	.byte	0x90
	.long	0x450
	.uleb128 0x9
	.byte	0x3
	.quad	accZero_saved.2851
	.uleb128 0x1e
	.long	.LASF156
	.byte	0x1
	.byte	0x91
	.long	0x624
	.uleb128 0x9
	.byte	0x3
	.quad	angleTrim_saved.2852
	.byte	0
	.uleb128 0x19
	.long	.LASF157
	.byte	0x1
	.byte	0xc1
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x897
	.uleb128 0x1a
	.long	.LASF158
	.byte	0x1
	.byte	0xc1
	.long	0x897
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x460
	.uleb128 0x1f
	.long	.LASF191
	.byte	0x1
	.byte	0xc8
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d7
	.uleb128 0x1a
	.long	.LASF159
	.byte	0x1
	.byte	0xc8
	.long	0x1f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.long	.LASF153
	.byte	0x1
	.byte	0xca
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.long	.LASF160
	.byte	0x1
	.byte	0xd1
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x911
	.uleb128 0x1a
	.long	.LASF145
	.byte	0x1
	.byte	0xd1
	.long	0x6dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.long	.LASF159
	.byte	0x1
	.byte	0xd9
	.long	0x450
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x19
	.long	.LASF161
	.byte	0x1
	.byte	0xee
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x93d
	.uleb128 0x1a
	.long	.LASF162
	.byte	0x1
	.byte	0xee
	.long	0x897
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	0x6a5
	.long	0x94d
	.uleb128 0x18
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x1e
	.long	.LASF163
	.byte	0x1
	.byte	0x30
	.long	0x93d
	.uleb128 0x9
	.byte	0x3
	.quad	accelerometerConfig_Storage
	.uleb128 0x1e
	.long	.LASF158
	.byte	0x1
	.byte	0x55
	.long	0x897
	.uleb128 0x9
	.byte	0x3
	.quad	accelerationTrims
	.uleb128 0x20
	.long	.LASF164
	.byte	0xf
	.byte	0xc8
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x20
	.long	.LASF165
	.byte	0xf
	.byte	0xc9
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x20
	.long	.LASF166
	.byte	0xf
	.byte	0xca
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x20
	.long	.LASF167
	.byte	0x3
	.byte	0x43
	.long	0x9cb
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xe
	.byte	0x8
	.long	0x19d
	.uleb128 0x20
	.long	.LASF168
	.byte	0x3
	.byte	0x44
	.long	0x9cb
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x20
	.long	.LASF169
	.byte	0x3
	.byte	0x47
	.long	0x191
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x20
	.long	.LASF170
	.byte	0x3
	.byte	0x48
	.long	0x191
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x20
	.long	.LASF171
	.byte	0x5
	.byte	0x1a
	.long	0x1c1
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_System
	.uleb128 0x20
	.long	.LASF172
	.byte	0xa
	.byte	0x1c
	.long	0x3c1
	.uleb128 0x9
	.byte	0x3
	.quad	batteryConfig_System
	.uleb128 0x20
	.long	.LASF173
	.byte	0xb
	.byte	0x56
	.long	0x526
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x20
	.long	.LASF174
	.byte	0xb
	.byte	0x57
	.long	0x4ea
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x20
	.long	.LASF175
	.byte	0xb
	.byte	0x58
	.long	0x556
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0x20
	.long	.LASF176
	.byte	0xc
	.byte	0x1a
	.long	0x592
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_System
	.uleb128 0x20
	.long	.LASF177
	.byte	0xd
	.byte	0x18
	.long	0x5b6
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x20
	.long	.LASF178
	.byte	0x1
	.byte	0x49
	.long	0x4ae
	.uleb128 0x9
	.byte	0x3
	.quad	accAlign
	.uleb128 0x21
	.string	"acc"
	.byte	0x1
	.byte	0x48
	.long	0x24f
	.uleb128 0x9
	.byte	0x3
	.quad	acc
	.uleb128 0x20
	.long	.LASF179
	.byte	0x1
	.byte	0x46
	.long	0x7e4
	.uleb128 0x9
	.byte	0x3
	.quad	accADC
	.uleb128 0x20
	.long	.LASF180
	.byte	0x1
	.byte	0x30
	.long	0x70e
	.uleb128 0x9
	.byte	0x3
	.quad	accelerometerConfig_ProfileCurrent
	.uleb128 0x20
	.long	.LASF181
	.byte	0x1
	.byte	0x30
	.long	0xb0c
	.uleb128 0x9
	.byte	0x3
	.quad	accelerometerConfig_Registry
	.uleb128 0x22
	.long	0x19d
	.uleb128 0x20
	.long	.LASF182
	.byte	0x1
	.byte	0x4b
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	calibratingA
	.uleb128 0x20
	.long	.LASF183
	.byte	0x1
	.byte	0x4d
	.long	0x1cc
	.uleb128 0x9
	.byte	0x3
	.quad	initialized
	.uleb128 0x23
	.long	.LASF184
	.byte	0x1
	.byte	0x4f
	.long	0x6d
	.uleb128 0x23
	.long	.LASF185
	.byte	0x1
	.byte	0x51
	.long	0x1cc
	.uleb128 0x23
	.long	.LASF186
	.byte	0x1
	.byte	0x52
	.long	0x1cc
	.uleb128 0x23
	.long	.LASF187
	.byte	0x1
	.byte	0x53
	.long	0x1cc
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x17
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
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.long	0xdc
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
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
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF45:
	.string	"FEATURE_MOTOR_STOP"
.LASF41:
	.string	"FEATURE_RX_PPM"
.LASF178:
	.string	"accAlign"
.LASF21:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF58:
	.string	"FEATURE_DISPLAY"
.LASF170:
	.string	"__pg_resetdata_end"
.LASF55:
	.string	"FEATURE_RX_MSP"
.LASF20:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF156:
	.string	"angleTrim_saved"
.LASF114:
	.string	"mag_hardware"
.LASF10:
	.string	"unsigned int"
.LASF60:
	.string	"FEATURE_BLACKBOX"
.LASF141:
	.string	"acc_unarmedcal"
.LASF140:
	.string	"accDeadband"
.LASF93:
	.string	"pitch"
.LASF18:
	.string	"PGR_PGN_VERSION_MASK"
.LASF131:
	.string	"flightDynamicsTrims_u"
.LASF74:
	.string	"BEEPER_DISARM_REPEAT"
.LASF71:
	.string	"BEEPER_BAT_LOW"
.LASF19:
	.string	"PGR_SIZE_MASK"
.LASF122:
	.string	"rollDegrees"
.LASF177:
	.string	"featureConfig_System"
.LASF117:
	.string	"sensorTrims_s"
.LASF120:
	.string	"sensorTrims_t"
.LASF108:
	.string	"gyro_align"
.LASF164:
	.string	"U_ID_0"
.LASF165:
	.string	"U_ID_1"
.LASF166:
	.string	"U_ID_2"
.LASF136:
	.string	"accelerometerConfig_s"
.LASF142:
	.string	"accelerometerConfig_t"
.LASF86:
	.string	"batteryConfig_t"
.LASF9:
	.string	"uint32_t"
.LASF69:
	.string	"BEEPER_ARMING_GPS_FIX"
.LASF173:
	.string	"sensorSelectionConfig_System"
.LASF34:
	.string	"float"
.LASF17:
	.string	"PGR_PGN_MASK"
.LASF68:
	.string	"BEEPER_ARMING"
.LASF73:
	.string	"BEEPER_RX_SET"
.LASF2:
	.string	"int16_t"
.LASF175:
	.string	"sensorTrims_System"
.LASF90:
	.string	"SENSOR_INDEX_MAG"
.LASF78:
	.string	"BEEPER_MULTI_BEEPS"
.LASF15:
	.string	"long long unsigned int"
.LASF138:
	.string	"acc_cut_hz"
.LASF75:
	.string	"BEEPER_ACC_CALIBRATION"
.LASF105:
	.string	"CW270_DEG_FLIP"
.LASF59:
	.string	"FEATURE_ONESHOT125"
.LASF151:
	.string	"isOnFirstAccelerationCalibrationCycle"
.LASF65:
	.string	"BEEPER_RX_LOST_LANDING"
.LASF63:
	.string	"BEEPER_SILENCE"
.LASF183:
	.string	"initialized"
.LASF161:
	.string	"setAccelerationTrims"
.LASF146:
	.string	"instance"
.LASF158:
	.string	"accelerationTrims"
.LASF84:
	.string	"batteryCapacity"
.LASF39:
	.string	"revisionCode"
.LASF81:
	.string	"vbatmaxcellvoltage"
.LASF143:
	.string	"resetRollAndPitchTrims"
.LASF16:
	.string	"pgn_t"
.LASF62:
	.string	"FEATURE_TRANSPONDER"
.LASF121:
	.string	"boardAlignment_s"
.LASF125:
	.string	"boardAlignment_t"
.LASF163:
	.string	"accelerometerConfig_Storage"
.LASF182:
	.string	"calibratingA"
.LASF31:
	.string	"_Bool"
.LASF27:
	.string	"pgRegistry_s"
.LASF26:
	.string	"pgRegistry_t"
.LASF162:
	.string	"accelerationTrimsToUse"
.LASF169:
	.string	"__pg_resetdata_start"
.LASF180:
	.string	"accelerometerConfig_ProfileCurrent"
.LASF89:
	.string	"SENSOR_INDEX_BARO"
.LASF154:
	.string	"performInflightAccelerationCalibration"
.LASF172:
	.string	"batteryConfig_System"
.LASF191:
	.string	"convertRawACCADCReadingsToInternalType"
.LASF115:
	.string	"baro_hardware"
.LASF155:
	.string	"accZero_saved"
.LASF103:
	.string	"CW90_DEG_FLIP"
.LASF139:
	.string	"accz_lpf_cutoff"
.LASF13:
	.string	"char"
.LASF61:
	.string	"FEATURE_CHANNEL_FORWARDING"
.LASF29:
	.string	"current_profile_index"
.LASF102:
	.string	"CW0_DEG_FLIP"
.LASF92:
	.string	"roll"
.LASF153:
	.string	"axis"
.LASF5:
	.string	"uint8_t"
.LASF167:
	.string	"__pg_registry_start"
.LASF179:
	.string	"accADC"
.LASF159:
	.string	"accADCRaw"
.LASF186:
	.string	"AccInflightCalibrationSavetoEEProm"
.LASF14:
	.string	"long long int"
.LASF94:
	.string	"flightDynamicsTrims_def_t"
.LASF113:
	.string	"acc_hardware"
.LASF48:
	.string	"FEATURE_GPS"
.LASF110:
	.string	"mag_align"
.LASF112:
	.string	"sensorSelectionConfig_s"
.LASF116:
	.string	"sensorSelectionConfig_t"
.LASF51:
	.string	"FEATURE_TELEMETRY"
.LASF185:
	.string	"AccInflightCalibrationMeasurementDone"
.LASF33:
	.string	"sensorAccInitFuncPtr"
.LASF23:
	.string	"size"
.LASF54:
	.string	"FEATURE_RX_PARALLEL_PWM"
.LASF99:
	.string	"CW90_DEG"
.LASF190:
	.string	"/home/aravind/git/cleanflight"
.LASF126:
	.string	"featureConfig_s"
.LASF128:
	.string	"featureConfig_t"
.LASF109:
	.string	"acc_align"
.LASF95:
	.string	"values"
.LASF118:
	.string	"accZero"
.LASF157:
	.string	"applyAccelerationTrims"
.LASF168:
	.string	"__pg_registry_end"
.LASF149:
	.string	"isAccelerationCalibrationComplete"
.LASF96:
	.string	"flightDynamicsTrims_t"
.LASF88:
	.string	"SENSOR_INDEX_ACC"
.LASF7:
	.string	"uint16_t"
.LASF148:
	.string	"calibrationCyclesRequired"
.LASF188:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF66:
	.string	"BEEPER_RX_LOST"
.LASF82:
	.string	"vbatmincellvoltage"
.LASF1:
	.string	"short int"
.LASF119:
	.string	"magZero"
.LASF4:
	.string	"long int"
.LASF64:
	.string	"BEEPER_GYRO_CALIBRATED"
.LASF124:
	.string	"yawDegrees"
.LASF174:
	.string	"sensorAlignmentConfig_System"
.LASF152:
	.string	"performAcclerationCalibration"
.LASF44:
	.string	"FEATURE_RX_SERIAL"
.LASF181:
	.string	"accelerometerConfig_Registry"
.LASF101:
	.string	"CW270_DEG"
.LASF123:
	.string	"pitchDegrees"
.LASF80:
	.string	"batteryConfig_s"
.LASF42:
	.string	"FEATURE_VBAT"
.LASF137:
	.string	"accelerometerTrims"
.LASF25:
	.string	"reset"
.LASF187:
	.string	"AccInflightCalibrationActive"
.LASF147:
	.string	"accSetCalibrationCycles"
.LASF106:
	.string	"sensor_align_e"
.LASF49:
	.string	"FEATURE_FAILSAFE"
.LASF37:
	.string	"read"
.LASF87:
	.string	"SENSOR_INDEX_GYRO"
.LASF57:
	.string	"FEATURE_LED_STRIP"
.LASF145:
	.string	"rollAndPitchTrims"
.LASF184:
	.string	"InflightcalibratingA"
.LASF36:
	.string	"init"
.LASF189:
	.string	"src/main/sensors/acceleration.c"
.LASF52:
	.string	"FEATURE_AMPERAGE_METER"
.LASF12:
	.string	"sizetype"
.LASF11:
	.string	"long unsigned int"
.LASF24:
	.string	"address"
.LASF100:
	.string	"CW180_DEG"
.LASF171:
	.string	"profileSelection_System"
.LASF3:
	.string	"int32_t"
.LASF91:
	.string	"int16_flightDynamicsTrims_s"
.LASF76:
	.string	"BEEPER_ACC_CALIBRATION_FAIL"
.LASF104:
	.string	"CW180_DEG_FLIP"
.LASF72:
	.string	"BEEPER_GPS_STATUS"
.LASF6:
	.string	"unsigned char"
.LASF160:
	.string	"updateAccelerationReadings"
.LASF38:
	.string	"acc_1G"
.LASF150:
	.string	"isOnFinalAccelerationCalibrationCycle"
.LASF144:
	.string	"pgResetFn_accelerometerConfig"
.LASF85:
	.string	"amperageMeterSource"
.LASF127:
	.string	"enabledFeatures"
.LASF35:
	.string	"acc_s"
.LASF40:
	.string	"acc_t"
.LASF79:
	.string	"BEEPER_ARMED"
.LASF130:
	.string	"rollAndPitchTrims_t_def"
.LASF53:
	.string	"FEATURE_3D"
.LASF46:
	.string	"FEATURE_SERVO_TILT"
.LASF0:
	.string	"signed char"
.LASF8:
	.string	"short unsigned int"
.LASF129:
	.string	"rollAndPitchTrims_s"
.LASF133:
	.string	"rollAndPitchTrims_t"
.LASF132:
	.string	"rollAndPitchTrims_u"
.LASF32:
	.string	"sensorReadFuncPtr"
.LASF28:
	.string	"profileSelection_s"
.LASF30:
	.string	"profileSelection_t"
.LASF70:
	.string	"BEEPER_BAT_CRIT_LOW"
.LASF83:
	.string	"vbatwarningcellvoltage"
.LASF67:
	.string	"BEEPER_DISARMING"
.LASF107:
	.string	"sensorAlignmentConfig_s"
.LASF111:
	.string	"sensorAlignmentConfig_t"
.LASF77:
	.string	"BEEPER_READY_BEEP"
.LASF97:
	.string	"ALIGN_DEFAULT"
.LASF98:
	.string	"CW0_DEG"
.LASF176:
	.string	"boardAlignment_System"
.LASF134:
	.string	"accDeadband_s"
.LASF135:
	.string	"accDeadband_t"
.LASF47:
	.string	"FEATURE_SOFTSERIAL"
.LASF22:
	.string	"pgResetFunc"
.LASF56:
	.string	"FEATURE_RSSI_ADC"
.LASF43:
	.string	"FEATURE_INFLIGHT_ACC_CAL"
.LASF50:
	.string	"FEATURE_SONAR"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
