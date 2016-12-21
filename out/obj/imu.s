	.file	"imu.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed imu.i -mtune=generic -march=x86-64 -g
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
	.comm	profileSelection_System,1,1
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.comm	gyroConfig_System,4,2
	.comm	mixerConfig_System,6,2
	.comm	motor3DConfig_System,6,2
	.comm	imuConfig_System,12,8
	.comm	gpsConfig_System,16,16
	.comm	accSmooth,6,2
	.comm	accSum,12,8
	.globl	accTimeSum
	.section	.bss.accTimeSum,"aw",@nobits
	.align 4
	.type	accTimeSum, @object
	.size	accTimeSum, 4
accTimeSum:
	.zero	4
	.globl	accSumCount
	.section	.bss.accSumCount,"aw",@nobits
	.align 4
	.type	accSumCount, @object
	.size	accSumCount, 4
accSumCount:
	.zero	4
	.comm	accVelScale,4,4
	.comm	throttleAngleScale,4,4
	.comm	fc_acc,4,4
	.globl	smallAngleCosZ
	.section	.bss.smallAngleCosZ,"aw",@nobits
	.align 4
	.type	smallAngleCosZ, @object
	.size	smallAngleCosZ, 4
smallAngleCosZ:
	.zero	4
	.section	.bss.isAccelUpdatedAtLeastOnce,"aw",@nobits
	.type	isAccelUpdatedAtLeastOnce, @object
	.size	isAccelUpdatedAtLeastOnce, 1
isAccelUpdatedAtLeastOnce:
	.zero	1
	.section	.bss.imuRuntimeConfig,"aw",@nobits
	.align 8
	.type	imuRuntimeConfig, @object
	.size	imuRuntimeConfig, 8
imuRuntimeConfig:
	.zero	8
	.section	.bss.accDeadband,"aw",@nobits
	.align 8
	.type	accDeadband, @object
	.size	accDeadband, 8
accDeadband:
	.zero	8
	.globl	imuConfig_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	imuConfig_Registry, @object
	.size	imuConfig_Registry, 32
imuConfig_Registry:
# pgn:
	.value	22
# size:
	.value	12
# address:
	.zero	4
	.quad	imuConfig_System
# ptr:
	.quad	0
# reset:
# ptr:
	.quad	pgResetTemplate_imuConfig
	.section	.bss.throttleCorrectionConfig_Storage,"aw",@nobits
	.align 8
	.type	throttleCorrectionConfig_Storage, @object
	.size	throttleCorrectionConfig_Storage, 12
throttleCorrectionConfig_Storage:
	.zero	12
	.comm	throttleCorrectionConfig_ProfileCurrent,8,8
	.globl	throttleCorrectionConfig_Registry
	.section	.pg_registry
	.align 8
	.type	throttleCorrectionConfig_Registry, @object
	.size	throttleCorrectionConfig_Registry, 32
throttleCorrectionConfig_Registry:
# pgn:
	.value	39
# size:
	.value	-32764
# address:
	.zero	4
	.quad	throttleCorrectionConfig_Storage
# ptr:
	.quad	throttleCorrectionConfig_ProfileCurrent
# reset:
# ptr:
	.quad	pgResetTemplate_throttleCorrectionConfig
	.globl	pgResetTemplate_imuConfig
	.section	.pg_resetdata,"a",@progbits
	.align 2
	.type	pgResetTemplate_imuConfig, @object
	.size	pgResetTemplate_imuConfig, 12
pgResetTemplate_imuConfig:
# looptime:
	.value	2000
# gyroSync:
	.byte	1
# gyroSyncDenominator:
	.byte	1
# dcm_kp:
	.value	2500
# small_angle:
	.zero	2
	.byte	25
# max_angle_inclination:
	.zero	1
	.value	500
	.globl	pgResetTemplate_throttleCorrectionConfig
	.align 2
	.type	pgResetTemplate_throttleCorrectionConfig, @object
	.size	pgResetTemplate_throttleCorrectionConfig, 4
pgResetTemplate_throttleCorrectionConfig:
# throttle_correction_angle:
	.value	800
# throttle_correction_value:
	.byte	0
	.zero	1
	.section	.data.q0,"aw",@progbits
	.align 4
	.type	q0, @object
	.size	q0, 4
q0:
	.long	1065353216
	.section	.bss.q1,"aw",@nobits
	.align 4
	.type	q1, @object
	.size	q1, 4
q1:
	.zero	4
	.section	.bss.q2,"aw",@nobits
	.align 4
	.type	q2, @object
	.size	q2, 4
q2:
	.zero	4
	.section	.bss.q3,"aw",@nobits
	.align 4
	.type	q3, @object
	.size	q3, 4
q3:
	.zero	4
	.section	.bss.rMat,"aw",@nobits
	.align 32
	.type	rMat, @object
	.size	rMat, 36
rMat:
	.zero	36
	.globl	attitude
	.section	.bss.attitude,"aw",@nobits
	.align 2
	.type	attitude, @object
	.size	attitude, 6
attitude:
	.zero	6
	.section	.bss.gyroScale,"aw",@nobits
	.align 4
	.type	gyroScale, @object
	.size	gyroScale, 4
gyroScale:
	.zero	4
	.section	.text.imuComputeRotationMatrix,"ax",@progbits
	.type	imuComputeRotationMatrix, @function
imuComputeRotationMatrix:
.LFB19:
	.file 1 "src/main/flight/imu.c"
	.loc 1 106 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 107 0
	movss	q1(%rip), %xmm1	# q1, D.4487
	movss	q1(%rip), %xmm0	# q1, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp129
	movss	%xmm0, -36(%rbp)	# tmp129, q1q1
	.loc 1 108 0
	movss	q2(%rip), %xmm1	# q2, D.4487
	movss	q2(%rip), %xmm0	# q2, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp130
	movss	%xmm0, -32(%rbp)	# tmp130, q2q2
	.loc 1 109 0
	movss	q3(%rip), %xmm1	# q3, D.4487
	movss	q3(%rip), %xmm0	# q3, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp131
	movss	%xmm0, -28(%rbp)	# tmp131, q3q3
	.loc 1 111 0
	movss	q0(%rip), %xmm1	# q0, D.4487
	movss	q1(%rip), %xmm0	# q1, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp132
	movss	%xmm0, -24(%rbp)	# tmp132, q0q1
	.loc 1 112 0
	movss	q0(%rip), %xmm1	# q0, D.4487
	movss	q2(%rip), %xmm0	# q2, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp133
	movss	%xmm0, -20(%rbp)	# tmp133, q0q2
	.loc 1 113 0
	movss	q0(%rip), %xmm1	# q0, D.4487
	movss	q3(%rip), %xmm0	# q3, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp134
	movss	%xmm0, -16(%rbp)	# tmp134, q0q3
	.loc 1 114 0
	movss	q1(%rip), %xmm1	# q1, D.4487
	movss	q2(%rip), %xmm0	# q2, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp135
	movss	%xmm0, -12(%rbp)	# tmp135, q1q2
	.loc 1 115 0
	movss	q1(%rip), %xmm1	# q1, D.4487
	movss	q3(%rip), %xmm0	# q3, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp136
	movss	%xmm0, -8(%rbp)	# tmp136, q1q3
	.loc 1 116 0
	movss	q2(%rip), %xmm1	# q2, D.4487
	movss	q3(%rip), %xmm0	# q3, D.4487
	mulss	%xmm1, %xmm0	# D.4487, tmp137
	movss	%xmm0, -4(%rbp)	# tmp137, q2q3
	.loc 1 118 0
	movss	-32(%rbp), %xmm0	# q2q2, tmp138
	addss	%xmm0, %xmm0	# tmp138, D.4487
	movss	.LC0(%rip), %xmm1	#, tmp139
	subss	%xmm0, %xmm1	# D.4487, D.4487
	movss	-28(%rbp), %xmm0	# q3q3, tmp140
	addss	%xmm0, %xmm0	# tmp140, D.4487
	subss	%xmm0, %xmm1	# D.4487, D.4487
	movaps	%xmm1, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat(%rip)	# D.4487, rMat
	.loc 1 119 0
	movss	-12(%rbp), %xmm0	# q1q2, tmp141
	subss	-16(%rbp), %xmm0	# q0q3, D.4487
	addss	%xmm0, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+4(%rip)	# D.4487, rMat
	.loc 1 120 0
	movss	-8(%rbp), %xmm0	# q1q3, tmp142
	addss	-20(%rbp), %xmm0	# q0q2, D.4487
	addss	%xmm0, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+8(%rip)	# D.4487, rMat
	.loc 1 122 0
	movss	-12(%rbp), %xmm0	# q1q2, tmp143
	addss	-16(%rbp), %xmm0	# q0q3, D.4487
	addss	%xmm0, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+12(%rip)	# D.4487, rMat
	.loc 1 123 0
	movss	-36(%rbp), %xmm0	# q1q1, tmp144
	addss	%xmm0, %xmm0	# tmp144, D.4487
	movss	.LC0(%rip), %xmm1	#, tmp145
	subss	%xmm0, %xmm1	# D.4487, D.4487
	movss	-28(%rbp), %xmm0	# q3q3, tmp146
	addss	%xmm0, %xmm0	# tmp146, D.4487
	subss	%xmm0, %xmm1	# D.4487, D.4487
	movaps	%xmm1, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+16(%rip)	# D.4487, rMat
	.loc 1 124 0
	movss	-4(%rbp), %xmm0	# q2q3, tmp147
	subss	-24(%rbp), %xmm0	# q0q1, D.4487
	addss	%xmm0, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+20(%rip)	# D.4487, rMat
	.loc 1 126 0
	movss	-8(%rbp), %xmm0	# q1q3, tmp148
	subss	-20(%rbp), %xmm0	# q0q2, D.4487
	addss	%xmm0, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+24(%rip)	# D.4487, rMat
	.loc 1 127 0
	movss	-4(%rbp), %xmm0	# q2q3, tmp149
	addss	-24(%rbp), %xmm0	# q0q1, D.4487
	addss	%xmm0, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+28(%rip)	# D.4487, rMat
	.loc 1 128 0
	movss	-36(%rbp), %xmm0	# q1q1, tmp150
	addss	%xmm0, %xmm0	# tmp150, D.4487
	movss	.LC0(%rip), %xmm1	#, tmp151
	subss	%xmm0, %xmm1	# D.4487, D.4487
	movss	-32(%rbp), %xmm0	# q2q2, tmp152
	addss	%xmm0, %xmm0	# tmp152, D.4487
	subss	%xmm0, %xmm1	# D.4487, D.4487
	movaps	%xmm1, %xmm0	# D.4487, D.4487
	movss	%xmm0, rMat+32(%rip)	# D.4487, rMat
	.loc 1 129 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	imuComputeRotationMatrix, .-imuComputeRotationMatrix
	.section	.text.imuConfigure,"ax",@progbits
	.globl	imuConfigure
	.type	imuConfigure, @function
imuConfigure:
.LFB20:
	.loc 1 137 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# initialImuRuntimeConfig, initialImuRuntimeConfig
	movq	%rsi, -16(%rbp)	# initialAccDeadband, initialAccDeadband
	movss	%xmm0, -20(%rbp)	# accz_lpf_cutoff, accz_lpf_cutoff
	movl	%edx, %eax	# throttle_correction_angle, tmp90
	movw	%ax, -24(%rbp)	# tmp90, throttle_correction_angle
	.loc 1 138 0
	movq	-8(%rbp), %rax	# initialImuRuntimeConfig, tmp91
	movq	%rax, imuRuntimeConfig(%rip)	# tmp91, imuRuntimeConfig
	.loc 1 139 0
	movq	-16(%rbp), %rax	# initialAccDeadband, tmp92
	movq	%rax, accDeadband(%rip)	# tmp92, accDeadband
	.loc 1 140 0
	movl	-20(%rbp), %eax	# accz_lpf_cutoff, tmp93
	movl	%eax, -28(%rbp)	# tmp93, %sfp
	movss	-28(%rbp), %xmm0	# %sfp,
	call	calculateAccZLowPassFilterRCTimeConstant	#
	movd	%xmm0, %eax	#, D.4488
	movl	%eax, fc_acc(%rip)	# D.4488, fc_acc
	.loc 1 141 0
	movzwl	-24(%rbp), %eax	# throttle_correction_angle, D.4489
	movl	%eax, %edi	# D.4489,
	call	calculateThrottleAngleScale	#
	movd	%xmm0, %eax	#, D.4488
	movl	%eax, throttleAngleScale(%rip)	# D.4488, throttleAngleScale
	.loc 1 142 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	imuConfigure, .-imuConfigure
	.section	.text.calculateThrottleAngleScale,"ax",@progbits
	.globl	calculateThrottleAngleScale
	.type	calculateThrottleAngleScale, @function
calculateThrottleAngleScale:
.LFB21:
	.loc 1 154 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# throttle_correction_angle, tmp92
	movw	%ax, -4(%rbp)	# tmp92, throttle_correction_angle
	.loc 1 155 0
	movzwl	-4(%rbp), %eax	# throttle_correction_angle, D.4491
	pxor	%xmm0, %xmm0	# D.4492
	cvtsi2ss	%eax, %xmm0	# D.4491, D.4492
	movss	.LC1(%rip), %xmm1	#, tmp93
	divss	%xmm0, %xmm1	# D.4492, D.4492
	movaps	%xmm1, %xmm0	# D.4492, D.4492
	movss	.LC2(%rip), %xmm1	#, tmp94
	mulss	%xmm1, %xmm0	# tmp94, D.4492
	.loc 1 156 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	calculateThrottleAngleScale, .-calculateThrottleAngleScale
	.section	.text.calculateAccZLowPassFilterRCTimeConstant,"ax",@progbits
	.globl	calculateAccZLowPassFilterRCTimeConstant
	.type	calculateAccZLowPassFilterRCTimeConstant, @function
calculateAccZLowPassFilterRCTimeConstant:
.LFB22:
	.loc 1 162 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)	# accz_lpf_cutoff, accz_lpf_cutoff
	.loc 1 163 0
	movss	-4(%rbp), %xmm1	# accz_lpf_cutoff, tmp90
	movss	.LC3(%rip), %xmm0	#, tmp91
	mulss	%xmm1, %xmm0	# tmp90, D.4493
	movss	.LC4(%rip), %xmm1	#, tmp92
	divss	%xmm0, %xmm1	# D.4493, D.4493
	movaps	%xmm1, %xmm0	# D.4493, D.4493
	.loc 1 164 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	calculateAccZLowPassFilterRCTimeConstant, .-calculateAccZLowPassFilterRCTimeConstant
	.section	.text.imuResetAccelerationSum,"ax",@progbits
	.globl	imuResetAccelerationSum
	.type	imuResetAccelerationSum, @function
imuResetAccelerationSum:
.LFB23:
	.loc 1 167 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 168 0
	movl	$0, accSum(%rip)	#, accSum
	.loc 1 169 0
	movl	$0, accSum+4(%rip)	#, accSum
	.loc 1 170 0
	movl	$0, accSum+8(%rip)	#, accSum
	.loc 1 171 0
	movl	$0, accSumCount(%rip)	#, accSumCount
	.loc 1 172 0
	movl	$0, accTimeSum(%rip)	#, accTimeSum
	.loc 1 173 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	imuResetAccelerationSum, .-imuResetAccelerationSum
	.section	.text.imuTransformVectorBodyToEarth,"ax",@progbits
	.globl	imuTransformVectorBodyToEarth
	.type	imuTransformVectorBodyToEarth, @function
imuTransformVectorBodyToEarth:
.LFB24:
	.loc 1 176 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# v, v
	.loc 1 180 0
	movss	rMat(%rip), %xmm1	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp118
	movss	(%rax), %xmm0	# v_3(D)->V.X, D.4494
	mulss	%xmm0, %xmm1	# D.4494, D.4494
	movss	rMat+4(%rip), %xmm2	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp119
	movss	4(%rax), %xmm0	# v_3(D)->V.Y, D.4494
	mulss	%xmm2, %xmm0	# D.4494, D.4494
	addss	%xmm0, %xmm1	# D.4494, D.4494
	movss	rMat+8(%rip), %xmm2	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp120
	movss	8(%rax), %xmm0	# v_3(D)->V.Z, D.4494
	mulss	%xmm2, %xmm0	# D.4494, D.4494
	addss	%xmm1, %xmm0	# D.4494, tmp121
	movss	%xmm0, -12(%rbp)	# tmp121, x
	.loc 1 181 0
	movss	rMat+12(%rip), %xmm1	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp122
	movss	(%rax), %xmm0	# v_3(D)->V.X, D.4494
	mulss	%xmm0, %xmm1	# D.4494, D.4494
	movss	rMat+16(%rip), %xmm2	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp123
	movss	4(%rax), %xmm0	# v_3(D)->V.Y, D.4494
	mulss	%xmm2, %xmm0	# D.4494, D.4494
	addss	%xmm0, %xmm1	# D.4494, D.4494
	movss	rMat+20(%rip), %xmm2	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp124
	movss	8(%rax), %xmm0	# v_3(D)->V.Z, D.4494
	mulss	%xmm2, %xmm0	# D.4494, D.4494
	addss	%xmm1, %xmm0	# D.4494, tmp125
	movss	%xmm0, -8(%rbp)	# tmp125, y
	.loc 1 182 0
	movss	rMat+24(%rip), %xmm1	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp126
	movss	(%rax), %xmm0	# v_3(D)->V.X, D.4494
	mulss	%xmm0, %xmm1	# D.4494, D.4494
	movss	rMat+28(%rip), %xmm2	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp127
	movss	4(%rax), %xmm0	# v_3(D)->V.Y, D.4494
	mulss	%xmm2, %xmm0	# D.4494, D.4494
	addss	%xmm0, %xmm1	# D.4494, D.4494
	movss	rMat+32(%rip), %xmm2	# rMat, D.4494
	movq	-24(%rbp), %rax	# v, tmp128
	movss	8(%rax), %xmm0	# v_3(D)->V.Z, D.4494
	mulss	%xmm2, %xmm0	# D.4494, D.4494
	addss	%xmm1, %xmm0	# D.4494, tmp129
	movss	%xmm0, -4(%rbp)	# tmp129, z
	.loc 1 184 0
	movq	-24(%rbp), %rax	# v, tmp130
	movss	-12(%rbp), %xmm0	# x, tmp131
	movss	%xmm0, (%rax)	# tmp131, v_3(D)->V.X
	.loc 1 185 0
	movss	-8(%rbp), %xmm1	# y, tmp132
	movss	.LC5(%rip), %xmm0	#, tmp133
	xorps	%xmm1, %xmm0	# tmp132, D.4494
	movq	-24(%rbp), %rax	# v, tmp134
	movss	%xmm0, 4(%rax)	# D.4494, v_3(D)->V.Y
	.loc 1 186 0
	movq	-24(%rbp), %rax	# v, tmp135
	movss	-4(%rbp), %xmm0	# z, tmp136
	movss	%xmm0, 8(%rax)	# tmp136, v_3(D)->V.Z
	.loc 1 187 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	imuTransformVectorBodyToEarth, .-imuTransformVectorBodyToEarth
	.section	.text.imuCalculateAcceleration,"ax",@progbits
	.globl	imuCalculateAcceleration
	.type	imuCalculateAcceleration, @function
imuCalculateAcceleration:
.LFB25:
	.loc 1 191 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$72, %rsp	#,
	.cfi_offset 3, -24
	movl	%edi, -68(%rbp)	# deltaT, deltaT
	.loc 1 191 0
	movq	%fs:40, %rax	#, tmp176
	movq	%rax, -24(%rbp)	# tmp176, D.4504
	xorl	%eax, %eax	# tmp176
	.loc 1 198 0
	movl	-68(%rbp), %eax	# deltaT, tmp158
	testq	%rax, %rax	# tmp158
	js	.L10	#,
	pxor	%xmm0, %xmm0	# D.4495
	cvtsi2ssq	%rax, %xmm0	# tmp158, D.4495
	jmp	.L11	#
.L10:
	movq	%rax, %rdx	# tmp158, tmp160
	shrq	%rdx	# tmp160
	andl	$1, %eax	#, tmp161
	orq	%rax, %rdx	# tmp161, tmp160
	pxor	%xmm0, %xmm0	# tmp159
	cvtsi2ssq	%rdx, %xmm0	# tmp160, tmp159
	addss	%xmm0, %xmm0	# tmp159, D.4495
.L11:
	movss	.LC6(%rip), %xmm1	#, tmp163
	mulss	%xmm1, %xmm0	# tmp163, tmp162
	movss	%xmm0, -52(%rbp)	# tmp162, dT
	.loc 1 200 0
	movzwl	accSmooth(%rip), %eax	# accSmooth, D.4496
	cwtl
	pxor	%xmm0, %xmm0	# D.4495
	cvtsi2ss	%eax, %xmm0	# tmp164, D.4495
	movss	%xmm0, -48(%rbp)	# D.4495, accel_ned.V.X
	.loc 1 201 0
	movzwl	accSmooth+2(%rip), %eax	# accSmooth, D.4496
	cwtl
	pxor	%xmm0, %xmm0	# D.4495
	cvtsi2ss	%eax, %xmm0	# tmp165, D.4495
	movss	%xmm0, -44(%rbp)	# D.4495, accel_ned.V.Y
	.loc 1 202 0
	movzwl	accSmooth+4(%rip), %eax	# accSmooth, D.4496
	cwtl
	pxor	%xmm0, %xmm0	# D.4495
	cvtsi2ss	%eax, %xmm0	# tmp166, D.4495
	movss	%xmm0, -40(%rbp)	# D.4495, accel_ned.V.Z
	.loc 1 204 0
	leaq	-48(%rbp), %rax	#, tmp167
	movq	%rax, %rdi	# tmp167,
	call	imuTransformVectorBodyToEarth	#
	.loc 1 206 0
	movq	imuRuntimeConfig(%rip), %rax	# imuRuntimeConfig, D.4497
	movzbl	1(%rax), %eax	# _17->acc_unarmedcal, D.4498
	cmpb	$1, %al	#, D.4498
	jne	.L12	#,
	.loc 1 207 0
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.4498
	movzbl	%al, %eax	# D.4498, D.4499
	andl	$4, %eax	#, D.4499
	testl	%eax, %eax	# D.4499
	jne	.L13	#,
	.loc 1 208 0
	movl	accZoffset.3947(%rip), %edx	# accZoffset, D.4499
	movl	accZoffset.3947(%rip), %eax	# accZoffset, D.4499
	leal	63(%rax), %ecx	#, tmp169
	testl	%eax, %eax	# tmp168
	cmovs	%ecx, %eax	# tmp169,, tmp168
	sarl	$6, %eax	#, tmp170
	subl	%eax, %edx	# D.4499, D.4499
	movl	%edx, %eax	# D.4499, D.4499
	movl	%eax, accZoffset.3947(%rip)	# D.4499, accZoffset
	.loc 1 209 0
	movl	accZoffset.3947(%rip), %eax	# accZoffset, D.4499
	pxor	%xmm0, %xmm0	# D.4495
	cvtsi2ss	%eax, %xmm0	# D.4499, D.4495
	movss	-40(%rbp), %xmm1	# accel_ned.V.Z, D.4495
	addss	%xmm1, %xmm0	# D.4495, D.4495
	cvttss2si	%xmm0, %eax	# D.4495, D.4499
	movl	%eax, accZoffset.3947(%rip)	# D.4499, accZoffset
.L13:
	.loc 1 211 0
	movss	-40(%rbp), %xmm1	# accel_ned.V.Z, D.4495
	movl	accZoffset.3947(%rip), %eax	# accZoffset, D.4499
	leal	63(%rax), %edx	#, tmp172
	testl	%eax, %eax	# tmp171
	cmovs	%edx, %eax	# tmp172,, tmp171
	sarl	$6, %eax	#, tmp173
	pxor	%xmm0, %xmm0	# D.4495
	cvtsi2ss	%eax, %xmm0	# D.4499, D.4495
	subss	%xmm0, %xmm1	# D.4495, D.4495
	movaps	%xmm1, %xmm0	# D.4495, D.4495
	movss	%xmm0, -40(%rbp)	# D.4495, accel_ned.V.Z
	jmp	.L14	#
.L12:
	.loc 1 213 0
	movss	-40(%rbp), %xmm1	# accel_ned.V.Z, D.4495
	movzwl	acc+16(%rip), %eax	# acc.acc_1G, D.4500
	movzwl	%ax, %eax	# D.4500, D.4499
	pxor	%xmm0, %xmm0	# D.4495
	cvtsi2ss	%eax, %xmm0	# D.4499, D.4495
	subss	%xmm0, %xmm1	# D.4495, D.4495
	movaps	%xmm1, %xmm0	# D.4495, D.4495
	movss	%xmm0, -40(%rbp)	# D.4495, accel_ned.V.Z
.L14:
	.loc 1 215 0
	movss	fc_acc(%rip), %xmm0	# fc_acc, D.4495
	addss	-52(%rbp), %xmm0	# dT, D.4495
	movss	-52(%rbp), %xmm1	# dT, tmp174
	divss	%xmm0, %xmm1	# D.4495, D.4495
	movss	-40(%rbp), %xmm0	# accel_ned.V.Z, D.4495
	movss	accz_smooth.3948(%rip), %xmm2	# accz_smooth, D.4495
	subss	%xmm2, %xmm0	# D.4495, D.4495
	mulss	%xmm1, %xmm0	# D.4495, D.4495
	movss	accz_smooth.3948(%rip), %xmm1	# accz_smooth, D.4495
	addss	%xmm1, %xmm0	# D.4495, D.4495
	movss	%xmm0, accz_smooth.3948(%rip)	# D.4495, accz_smooth
	.loc 1 218 0
	movq	accDeadband(%rip), %rax	# accDeadband, D.4501
	movzbl	(%rax), %eax	# _55->xy, D.4498
	movzbl	%al, %ebx	# D.4498, D.4499
	movl	-48(%rbp), %eax	# accel_ned.V.X, D.4495
	movl	%eax, -72(%rbp)	# D.4495, %sfp
	movss	-72(%rbp), %xmm0	# %sfp,
	call	lrintf	#
	movl	%ebx, %esi	# D.4499,
	movl	%eax, %edi	# D.4499,
	call	applyDeadband	#
	movl	%eax, %edx	#, D.4499
	movl	accSum(%rip), %eax	# accSum, D.4499
	addl	%edx, %eax	# D.4499, D.4499
	movl	%eax, accSum(%rip)	# D.4499, accSum
	.loc 1 219 0
	movq	accDeadband(%rip), %rax	# accDeadband, D.4501
	movzbl	(%rax), %eax	# _67->xy, D.4498
	movzbl	%al, %ebx	# D.4498, D.4499
	movl	-44(%rbp), %eax	# accel_ned.V.Y, D.4495
	movl	%eax, -72(%rbp)	# D.4495, %sfp
	movss	-72(%rbp), %xmm0	# %sfp,
	call	lrintf	#
	movl	%ebx, %esi	# D.4499,
	movl	%eax, %edi	# D.4499,
	call	applyDeadband	#
	movl	%eax, %edx	#, D.4499
	movl	accSum+4(%rip), %eax	# accSum, D.4499
	addl	%edx, %eax	# D.4499, D.4499
	movl	%eax, accSum+4(%rip)	# D.4499, accSum
	.loc 1 220 0
	movq	accDeadband(%rip), %rax	# accDeadband, D.4501
	movzbl	1(%rax), %eax	# _79->z, D.4498
	movzbl	%al, %ebx	# D.4498, D.4499
	movl	accz_smooth.3948(%rip), %eax	# accz_smooth, D.4495
	movl	%eax, -72(%rbp)	# D.4495, %sfp
	movss	-72(%rbp), %xmm0	# %sfp,
	call	lrintf	#
	movl	%ebx, %esi	# D.4499,
	movl	%eax, %edi	# D.4499,
	call	applyDeadband	#
	movl	%eax, %edx	#, D.4499
	movl	accSum+8(%rip), %eax	# accSum, D.4499
	addl	%edx, %eax	# D.4499, D.4499
	movl	%eax, accSum+8(%rip)	# D.4499, accSum
	.loc 1 223 0
	movl	accTimeSum(%rip), %edx	# accTimeSum, D.4503
	movl	-68(%rbp), %eax	# deltaT, tmp175
	addl	%edx, %eax	# D.4503, D.4503
	movl	%eax, accTimeSum(%rip)	# D.4503, accTimeSum
	.loc 1 224 0
	movl	accSumCount(%rip), %eax	# accSumCount, D.4499
	addl	$1, %eax	#, D.4499
	movl	%eax, accSumCount(%rip)	# D.4499, accSumCount
	.loc 1 225 0
	nop
	movq	-24(%rbp), %rax	# D.4504, tmp177
	xorq	%fs:40, %rax	#, tmp177
	je	.L15	#,
	call	__stack_chk_fail	#
.L15:
	addq	$72, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	imuCalculateAcceleration, .-imuCalculateAcceleration
	.section	.text.invSqrt,"ax",@progbits
	.type	invSqrt, @function
invSqrt:
.LFB26:
	.loc 1 228 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movss	%xmm0, -4(%rbp)	# x, x
	.loc 1 229 0
	movl	-4(%rbp), %eax	# x, tmp90
	movl	%eax, -8(%rbp)	# tmp90, %sfp
	movss	-8(%rbp), %xmm0	# %sfp,
	call	sqrtf	#
	movaps	%xmm0, %xmm1	#, D.4507
	movss	.LC0(%rip), %xmm0	#, tmp91
	divss	%xmm1, %xmm0	# D.4507, D.4507
	.loc 1 230 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	invSqrt, .-invSqrt
	.section	.text.imuUseFastGains,"ax",@progbits
	.type	imuUseFastGains, @function
imuUseFastGains:
.LFB27:
	.loc 1 233 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 234 0
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.4509
	movzbl	%al, %eax	# D.4509, D.4508
	andl	$4, %eax	#, D.4508
	testl	%eax, %eax	# D.4508
	jne	.L19	#,
	.loc 1 234 0 is_stmt 0 discriminator 1
	call	millis	#
	cmpq	$19999, %rax	#, D.4510
	ja	.L19	#,
	.loc 1 234 0 discriminator 3
	movl	$1, %eax	#, D.4508
	jmp	.L20	#
.L19:
	.loc 1 234 0 discriminator 4
	movl	$0, %eax	#, D.4508
.L20:
	.loc 1 234 0 discriminator 6
	andl	$1, %eax	#, D.4511
	.loc 1 235 0 is_stmt 1 discriminator 6
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	imuUseFastGains, .-imuUseFastGains
	.section	.text.imuGetPGainScaleFactor,"ax",@progbits
	.type	imuGetPGainScaleFactor, @function
imuGetPGainScaleFactor:
.LFB28:
	.loc 1 238 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 239 0
	call	imuUseFastGains	#
	testb	%al, %al	# D.4513
	je	.L23	#,
	.loc 1 240 0
	movss	.LC7(%rip), %xmm0	#, D.4512
	jmp	.L24	#
.L23:
	.loc 1 243 0
	movss	.LC0(%rip), %xmm0	#, D.4512
.L24:
	.loc 1 245 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	imuGetPGainScaleFactor, .-imuGetPGainScaleFactor
	.section	.text.imuMahonyAHRSupdate,"ax",@progbits
	.type	imuMahonyAHRSupdate, @function
imuMahonyAHRSupdate:
.LFB29:
	.loc 1 251 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$112, %rsp	#,
	movss	%xmm0, -68(%rbp)	# dt, dt
	movss	%xmm1, -72(%rbp)	# gx, gx
	movss	%xmm2, -76(%rbp)	# gy, gy
	movss	%xmm3, -80(%rbp)	# gz, gz
	movss	%xmm4, -88(%rbp)	# ax, ax
	movss	%xmm5, -92(%rbp)	# ay, ay
	movss	%xmm6, -96(%rbp)	# az, az
	movl	%esi, %ecx	# useMag, tmp227
	movss	%xmm7, -104(%rbp)	# mx, mx
	movl	%edx, %eax	# useYaw, tmp228
	movb	%dil, -84(%rbp)	# tmp226, useAcc
	movb	%cl, -100(%rbp)	# tmp227, useMag
	movb	%al, -108(%rbp)	# tmp228, useYaw
	.loc 1 255 0
	pxor	%xmm0, %xmm0	# tmp229
	movss	%xmm0, -56(%rbp)	# tmp229, ex
	pxor	%xmm0, %xmm0	# tmp230
	movss	%xmm0, -52(%rbp)	# tmp230, ey
	pxor	%xmm0, %xmm0	# tmp231
	movss	%xmm0, -48(%rbp)	# tmp231, ez
	.loc 1 259 0
	movss	-72(%rbp), %xmm0	# gx, tmp232
	movaps	%xmm0, %xmm1	# tmp232, D.4514
	mulss	-72(%rbp), %xmm1	# gx, D.4514
	movss	-76(%rbp), %xmm0	# gy, tmp233
	mulss	-76(%rbp), %xmm0	# gy, D.4514
	addss	%xmm0, %xmm1	# D.4514, D.4514
	movss	-80(%rbp), %xmm0	# gz, tmp234
	mulss	-80(%rbp), %xmm0	# gz, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	call	sqrtf	#
	movd	%xmm0, %eax	#, tmp235
	movl	%eax, -44(%rbp)	# tmp235, spin_rate
	.loc 1 262 0
	cmpb	$0, -108(%rbp)	#, useYaw
	je	.L26	#,
	.loc 1 263 0
	jmp	.L27	#
.L28:
	.loc 1 263 0 is_stmt 0 discriminator 2
	movss	32(%rbp), %xmm0	# yawError, tmp237
	movss	.LC9(%rip), %xmm1	#, tmp238
	subss	%xmm1, %xmm0	# tmp238, tmp236
	movss	%xmm0, 32(%rbp)	# tmp236, yawError
.L27:
	.loc 1 263 0 discriminator 1
	movss	32(%rbp), %xmm0	# yawError, tmp239
	ucomiss	.LC3(%rip), %xmm0	#, tmp239
	ja	.L28	#,
	.loc 1 264 0 is_stmt 1
	jmp	.L29	#
.L30:
	.loc 1 264 0 is_stmt 0 discriminator 2
	movss	32(%rbp), %xmm1	# yawError, tmp241
	movss	.LC9(%rip), %xmm0	#, tmp242
	addss	%xmm1, %xmm0	# tmp241, tmp240
	movss	%xmm0, 32(%rbp)	# tmp240, yawError
.L29:
	.loc 1 264 0 discriminator 1
	movss	.LC10(%rip), %xmm0	#, tmp243
	ucomiss	32(%rbp), %xmm0	# yawError, tmp243
	ja	.L30	#,
	.loc 1 266 0 is_stmt 1
	movss	32(%rbp), %xmm0	# yawError, tmp244
	movss	.LC11(%rip), %xmm1	#, tmp245
	divss	%xmm1, %xmm0	# tmp245, D.4514
	call	sinf	#
	movaps	%xmm0, %xmm1	#, D.4514
	movss	-48(%rbp), %xmm0	# ez, tmp247
	addss	%xmm1, %xmm0	# D.4514, tmp246
	movss	%xmm0, -48(%rbp)	# tmp246, ez
.L26:
	.loc 1 270 0
	movss	-104(%rbp), %xmm0	# mx, tmp248
	movaps	%xmm0, %xmm1	# tmp248, D.4514
	mulss	-104(%rbp), %xmm1	# mx, D.4514
	movss	16(%rbp), %xmm0	# my, tmp249
	mulss	16(%rbp), %xmm0	# my, D.4514
	addss	%xmm0, %xmm1	# D.4514, D.4514
	movss	24(%rbp), %xmm0	# mz, tmp250
	mulss	24(%rbp), %xmm0	# mz, D.4514
	addss	%xmm1, %xmm0	# D.4514, tmp251
	movss	%xmm0, -40(%rbp)	# tmp251, recipNorm
	.loc 1 271 0
	cmpb	$0, -100(%rbp)	#, useMag
	je	.L31	#,
	.loc 1 271 0 is_stmt 0 discriminator 1
	movss	-40(%rbp), %xmm0	# recipNorm, tmp252
	ucomiss	.LC12(%rip), %xmm0	#, tmp252
	jbe	.L31	#,
.LBB2:
	.loc 1 273 0 is_stmt 1
	movl	-40(%rbp), %eax	# recipNorm, tmp253
	movl	%eax, -112(%rbp)	# tmp253, %sfp
	movss	-112(%rbp), %xmm0	# %sfp,
	call	invSqrt	#
	movd	%xmm0, %eax	#, tmp254
	movl	%eax, -40(%rbp)	# tmp254, recipNorm
	.loc 1 274 0
	movss	-104(%rbp), %xmm0	# mx, tmp256
	mulss	-40(%rbp), %xmm0	# recipNorm, tmp255
	movss	%xmm0, -104(%rbp)	# tmp255, mx
	.loc 1 275 0
	movss	16(%rbp), %xmm0	# my, tmp258
	mulss	-40(%rbp), %xmm0	# recipNorm, tmp257
	movss	%xmm0, 16(%rbp)	# tmp257, my
	.loc 1 276 0
	movss	24(%rbp), %xmm0	# mz, tmp260
	mulss	-40(%rbp), %xmm0	# recipNorm, tmp259
	movss	%xmm0, 24(%rbp)	# tmp259, mz
	.loc 1 283 0
	movss	rMat(%rip), %xmm0	# rMat, D.4514
	movaps	%xmm0, %xmm1	# D.4514, D.4514
	mulss	-104(%rbp), %xmm1	# mx, D.4514
	movss	rMat+4(%rip), %xmm0	# rMat, D.4514
	mulss	16(%rbp), %xmm0	# my, D.4514
	addss	%xmm0, %xmm1	# D.4514, D.4514
	movss	rMat+8(%rip), %xmm0	# rMat, D.4514
	mulss	24(%rbp), %xmm0	# mz, D.4514
	addss	%xmm1, %xmm0	# D.4514, tmp261
	movss	%xmm0, -36(%rbp)	# tmp261, hx
	.loc 1 284 0
	movss	rMat+12(%rip), %xmm0	# rMat, D.4514
	movaps	%xmm0, %xmm1	# D.4514, D.4514
	mulss	-104(%rbp), %xmm1	# mx, D.4514
	movss	rMat+16(%rip), %xmm0	# rMat, D.4514
	mulss	16(%rbp), %xmm0	# my, D.4514
	addss	%xmm0, %xmm1	# D.4514, D.4514
	movss	rMat+20(%rip), %xmm0	# rMat, D.4514
	mulss	24(%rbp), %xmm0	# mz, D.4514
	addss	%xmm1, %xmm0	# D.4514, tmp262
	movss	%xmm0, -32(%rbp)	# tmp262, hy
	.loc 1 285 0
	movss	-36(%rbp), %xmm0	# hx, tmp263
	movaps	%xmm0, %xmm1	# tmp263, D.4514
	mulss	-36(%rbp), %xmm1	# hx, D.4514
	movss	-32(%rbp), %xmm0	# hy, tmp264
	mulss	-32(%rbp), %xmm0	# hy, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	call	sqrtf	#
	movd	%xmm0, %eax	#, tmp265
	movl	%eax, -28(%rbp)	# tmp265, bx
	.loc 1 288 0
	movss	-32(%rbp), %xmm0	# hy, tmp266
	mulss	-28(%rbp), %xmm0	# bx, D.4514
	movss	.LC5(%rip), %xmm1	#, tmp268
	xorps	%xmm1, %xmm0	# tmp268, tmp267
	movss	%xmm0, -24(%rbp)	# tmp267, ez_ef
	.loc 1 291 0
	movss	rMat+24(%rip), %xmm0	# rMat, D.4514
	mulss	-24(%rbp), %xmm0	# ez_ef, D.4514
	movss	-56(%rbp), %xmm1	# ex, tmp270
	addss	%xmm1, %xmm0	# tmp270, tmp269
	movss	%xmm0, -56(%rbp)	# tmp269, ex
	.loc 1 292 0
	movss	rMat+28(%rip), %xmm0	# rMat, D.4514
	mulss	-24(%rbp), %xmm0	# ez_ef, D.4514
	movss	-52(%rbp), %xmm1	# ey, tmp272
	addss	%xmm1, %xmm0	# tmp272, tmp271
	movss	%xmm0, -52(%rbp)	# tmp271, ey
	.loc 1 293 0
	movss	rMat+32(%rip), %xmm0	# rMat, D.4514
	mulss	-24(%rbp), %xmm0	# ez_ef, D.4514
	movss	-48(%rbp), %xmm1	# ez, tmp274
	addss	%xmm1, %xmm0	# tmp274, tmp273
	movss	%xmm0, -48(%rbp)	# tmp273, ez
.L31:
.LBE2:
	.loc 1 297 0
	movss	-88(%rbp), %xmm0	# ax, tmp275
	movaps	%xmm0, %xmm1	# tmp275, D.4514
	mulss	-88(%rbp), %xmm1	# ax, D.4514
	movss	-92(%rbp), %xmm0	# ay, tmp276
	mulss	-92(%rbp), %xmm0	# ay, D.4514
	addss	%xmm0, %xmm1	# D.4514, D.4514
	movss	-96(%rbp), %xmm0	# az, tmp277
	mulss	-96(%rbp), %xmm0	# az, D.4514
	addss	%xmm1, %xmm0	# D.4514, tmp278
	movss	%xmm0, -40(%rbp)	# tmp278, recipNorm
	.loc 1 298 0
	cmpb	$0, -84(%rbp)	#, useAcc
	je	.L33	#,
	.loc 1 298 0 is_stmt 0 discriminator 1
	movss	-40(%rbp), %xmm0	# recipNorm, tmp279
	ucomiss	.LC12(%rip), %xmm0	#, tmp279
	jbe	.L33	#,
	.loc 1 300 0 is_stmt 1
	movl	-40(%rbp), %eax	# recipNorm, tmp280
	movl	%eax, -112(%rbp)	# tmp280, %sfp
	movss	-112(%rbp), %xmm0	# %sfp,
	call	invSqrt	#
	movd	%xmm0, %eax	#, tmp281
	movl	%eax, -40(%rbp)	# tmp281, recipNorm
	.loc 1 301 0
	movss	-88(%rbp), %xmm0	# ax, tmp283
	mulss	-40(%rbp), %xmm0	# recipNorm, tmp282
	movss	%xmm0, -88(%rbp)	# tmp282, ax
	.loc 1 302 0
	movss	-92(%rbp), %xmm0	# ay, tmp285
	mulss	-40(%rbp), %xmm0	# recipNorm, tmp284
	movss	%xmm0, -92(%rbp)	# tmp284, ay
	.loc 1 303 0
	movss	-96(%rbp), %xmm0	# az, tmp287
	mulss	-40(%rbp), %xmm0	# recipNorm, tmp286
	movss	%xmm0, -96(%rbp)	# tmp286, az
	.loc 1 306 0
	movss	rMat+32(%rip), %xmm0	# rMat, D.4514
	mulss	-92(%rbp), %xmm0	# ay, D.4514
	movss	rMat+28(%rip), %xmm1	# rMat, D.4514
	mulss	-96(%rbp), %xmm1	# az, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movss	-56(%rbp), %xmm1	# ex, tmp289
	addss	%xmm1, %xmm0	# tmp289, tmp288
	movss	%xmm0, -56(%rbp)	# tmp288, ex
	.loc 1 307 0
	movss	rMat+24(%rip), %xmm0	# rMat, D.4514
	mulss	-96(%rbp), %xmm0	# az, D.4514
	movss	rMat+32(%rip), %xmm1	# rMat, D.4514
	mulss	-88(%rbp), %xmm1	# ax, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movss	-52(%rbp), %xmm1	# ey, tmp291
	addss	%xmm1, %xmm0	# tmp291, tmp290
	movss	%xmm0, -52(%rbp)	# tmp290, ey
	.loc 1 308 0
	movss	rMat+28(%rip), %xmm0	# rMat, D.4514
	mulss	-88(%rbp), %xmm0	# ax, D.4514
	movss	rMat+24(%rip), %xmm1	# rMat, D.4514
	mulss	-92(%rbp), %xmm1	# ay, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movss	-48(%rbp), %xmm1	# ez, tmp293
	addss	%xmm1, %xmm0	# tmp293, tmp292
	movss	%xmm0, -48(%rbp)	# tmp292, ez
.L33:
	.loc 1 312 0
	movq	imuRuntimeConfig(%rip), %rax	# imuRuntimeConfig, D.4515
	movss	4(%rax), %xmm0	# _113->dcm_ki, D.4514
	pxor	%xmm1, %xmm1	# tmp294
	ucomiss	%xmm1, %xmm0	# tmp294, D.4514
	jbe	.L44	#,
	.loc 1 314 0
	movss	.LC13(%rip), %xmm0	#, tmp295
	ucomiss	-44(%rbp), %xmm0	# spin_rate, tmp295
	jbe	.L39	#,
.LBB3:
	.loc 1 315 0
	movq	imuRuntimeConfig(%rip), %rax	# imuRuntimeConfig, D.4515
	movss	4(%rax), %xmm0	# _115->dcm_ki, tmp296
	movss	%xmm0, -20(%rbp)	# tmp296, dcmKiGain
	.loc 1 316 0
	movss	-20(%rbp), %xmm0	# dcmKiGain, tmp297
	mulss	-56(%rbp), %xmm0	# ex, D.4514
	mulss	-68(%rbp), %xmm0	# dt, D.4514
	movss	integralFBx.3976(%rip), %xmm1	# integralFBx, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	%xmm0, integralFBx.3976(%rip)	# D.4514, integralFBx
	.loc 1 317 0
	movss	-20(%rbp), %xmm0	# dcmKiGain, tmp298
	mulss	-52(%rbp), %xmm0	# ey, D.4514
	mulss	-68(%rbp), %xmm0	# dt, D.4514
	movss	integralFBy.3977(%rip), %xmm1	# integralFBy, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	%xmm0, integralFBy.3977(%rip)	# D.4514, integralFBy
	.loc 1 318 0
	movss	-20(%rbp), %xmm0	# dcmKiGain, tmp299
	mulss	-48(%rbp), %xmm0	# ez, D.4514
	mulss	-68(%rbp), %xmm0	# dt, D.4514
	movss	integralFBz.3978(%rip), %xmm1	# integralFBz, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	%xmm0, integralFBz.3978(%rip)	# D.4514, integralFBz
	jmp	.L39	#
.L44:
.LBE3:
	.loc 1 322 0
	pxor	%xmm0, %xmm0	# tmp300
	movss	%xmm0, integralFBx.3976(%rip)	# tmp300, integralFBx
	.loc 1 323 0
	pxor	%xmm0, %xmm0	# tmp301
	movss	%xmm0, integralFBy.3977(%rip)	# tmp301, integralFBy
	.loc 1 324 0
	pxor	%xmm0, %xmm0	# tmp302
	movss	%xmm0, integralFBz.3978(%rip)	# tmp302, integralFBz
.L39:
	.loc 1 328 0
	movq	imuRuntimeConfig(%rip), %rax	# imuRuntimeConfig, D.4515
	movss	8(%rax), %xmm3	# _136->dcm_kp, D.4514
	movss	%xmm3, -112(%rbp)	# D.4514, %sfp
	call	imuGetPGainScaleFactor	#
	mulss	-112(%rbp), %xmm0	# %sfp, tmp303
	movss	%xmm0, -16(%rbp)	# tmp303, dcmKpGain
	.loc 1 331 0
	movss	-16(%rbp), %xmm0	# dcmKpGain, tmp304
	mulss	-56(%rbp), %xmm0	# ex, D.4514
	movss	integralFBx.3976(%rip), %xmm1	# integralFBx, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	-72(%rbp), %xmm1	# gx, tmp306
	addss	%xmm1, %xmm0	# tmp306, tmp305
	movss	%xmm0, -72(%rbp)	# tmp305, gx
	.loc 1 332 0
	movss	-16(%rbp), %xmm0	# dcmKpGain, tmp307
	mulss	-52(%rbp), %xmm0	# ey, D.4514
	movss	integralFBy.3977(%rip), %xmm1	# integralFBy, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	-76(%rbp), %xmm1	# gy, tmp309
	addss	%xmm1, %xmm0	# tmp309, tmp308
	movss	%xmm0, -76(%rbp)	# tmp308, gy
	.loc 1 333 0
	movss	-16(%rbp), %xmm0	# dcmKpGain, tmp310
	mulss	-48(%rbp), %xmm0	# ez, D.4514
	movss	integralFBz.3978(%rip), %xmm1	# integralFBz, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	-80(%rbp), %xmm1	# gz, tmp312
	addss	%xmm1, %xmm0	# tmp312, tmp311
	movss	%xmm0, -80(%rbp)	# tmp311, gz
	.loc 1 336 0
	movss	-68(%rbp), %xmm1	# dt, tmp313
	movss	.LC4(%rip), %xmm0	#, tmp314
	mulss	%xmm1, %xmm0	# tmp313, D.4514
	movss	-72(%rbp), %xmm1	# gx, tmp316
	mulss	%xmm1, %xmm0	# tmp316, tmp315
	movss	%xmm0, -72(%rbp)	# tmp315, gx
	.loc 1 337 0
	movss	-68(%rbp), %xmm1	# dt, tmp317
	movss	.LC4(%rip), %xmm0	#, tmp318
	mulss	%xmm1, %xmm0	# tmp317, D.4514
	movss	-76(%rbp), %xmm1	# gy, tmp320
	mulss	%xmm1, %xmm0	# tmp320, tmp319
	movss	%xmm0, -76(%rbp)	# tmp319, gy
	.loc 1 338 0
	movss	-68(%rbp), %xmm1	# dt, tmp321
	movss	.LC4(%rip), %xmm0	#, tmp322
	mulss	%xmm1, %xmm0	# tmp321, D.4514
	movss	-80(%rbp), %xmm1	# gz, tmp324
	mulss	%xmm1, %xmm0	# tmp324, tmp323
	movss	%xmm0, -80(%rbp)	# tmp323, gz
	.loc 1 340 0
	movss	q0(%rip), %xmm0	# q0, tmp325
	movss	%xmm0, -12(%rbp)	# tmp325, qa
	.loc 1 341 0
	movss	q1(%rip), %xmm0	# q1, tmp326
	movss	%xmm0, -8(%rbp)	# tmp326, qb
	.loc 1 342 0
	movss	q2(%rip), %xmm0	# q2, tmp327
	movss	%xmm0, -4(%rbp)	# tmp327, qc
	.loc 1 343 0
	movss	-8(%rbp), %xmm1	# qb, tmp328
	movss	.LC5(%rip), %xmm0	#, tmp329
	xorps	%xmm1, %xmm0	# tmp328, D.4514
	mulss	-72(%rbp), %xmm0	# gx, D.4514
	movss	-4(%rbp), %xmm1	# qc, tmp330
	mulss	-76(%rbp), %xmm1	# gy, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movss	q3(%rip), %xmm1	# q3, D.4514
	mulss	-80(%rbp), %xmm1	# gz, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movss	q0(%rip), %xmm1	# q0, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	%xmm0, q0(%rip)	# D.4514, q0
	.loc 1 344 0
	movss	-12(%rbp), %xmm0	# qa, tmp331
	movaps	%xmm0, %xmm1	# tmp331, D.4514
	mulss	-72(%rbp), %xmm1	# gx, D.4514
	movss	-4(%rbp), %xmm0	# qc, tmp332
	mulss	-80(%rbp), %xmm0	# gz, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	q3(%rip), %xmm1	# q3, D.4514
	mulss	-76(%rbp), %xmm1	# gy, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movss	q1(%rip), %xmm1	# q1, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	%xmm0, q1(%rip)	# D.4514, q1
	.loc 1 345 0
	movss	-12(%rbp), %xmm0	# qa, tmp333
	mulss	-76(%rbp), %xmm0	# gy, D.4514
	movss	-8(%rbp), %xmm1	# qb, tmp334
	mulss	-80(%rbp), %xmm1	# gz, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movaps	%xmm0, %xmm1	# D.4514, D.4514
	movss	q3(%rip), %xmm0	# q3, D.4514
	mulss	-72(%rbp), %xmm0	# gx, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	q2(%rip), %xmm1	# q2, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	%xmm0, q2(%rip)	# D.4514, q2
	.loc 1 346 0
	movss	-12(%rbp), %xmm0	# qa, tmp335
	movaps	%xmm0, %xmm1	# tmp335, D.4514
	mulss	-80(%rbp), %xmm1	# gz, D.4514
	movss	-8(%rbp), %xmm0	# qb, tmp336
	mulss	-76(%rbp), %xmm0	# gy, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	-4(%rbp), %xmm1	# qc, tmp337
	mulss	-72(%rbp), %xmm1	# gx, D.4514
	subss	%xmm1, %xmm0	# D.4514, D.4514
	movss	q3(%rip), %xmm1	# q3, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	movss	%xmm0, q3(%rip)	# D.4514, q3
	.loc 1 349 0
	movss	q0(%rip), %xmm1	# q0, D.4514
	movss	q0(%rip), %xmm0	# q0, D.4514
	mulss	%xmm0, %xmm1	# D.4514, D.4514
	movss	q1(%rip), %xmm2	# q1, D.4514
	movss	q1(%rip), %xmm0	# q1, D.4514
	mulss	%xmm2, %xmm0	# D.4514, D.4514
	addss	%xmm0, %xmm1	# D.4514, D.4514
	movss	q2(%rip), %xmm2	# q2, D.4514
	movss	q2(%rip), %xmm0	# q2, D.4514
	mulss	%xmm2, %xmm0	# D.4514, D.4514
	addss	%xmm0, %xmm1	# D.4514, D.4514
	movss	q3(%rip), %xmm2	# q3, D.4514
	movss	q3(%rip), %xmm0	# q3, D.4514
	mulss	%xmm2, %xmm0	# D.4514, D.4514
	addss	%xmm1, %xmm0	# D.4514, D.4514
	call	invSqrt	#
	movd	%xmm0, %eax	#, tmp338
	movl	%eax, -40(%rbp)	# tmp338, recipNorm
	.loc 1 350 0
	movss	q0(%rip), %xmm0	# q0, D.4514
	mulss	-40(%rbp), %xmm0	# recipNorm, D.4514
	movss	%xmm0, q0(%rip)	# D.4514, q0
	.loc 1 351 0
	movss	q1(%rip), %xmm0	# q1, D.4514
	mulss	-40(%rbp), %xmm0	# recipNorm, D.4514
	movss	%xmm0, q1(%rip)	# D.4514, q1
	.loc 1 352 0
	movss	q2(%rip), %xmm0	# q2, D.4514
	mulss	-40(%rbp), %xmm0	# recipNorm, D.4514
	movss	%xmm0, q2(%rip)	# D.4514, q2
	.loc 1 353 0
	movss	q3(%rip), %xmm0	# q3, D.4514
	mulss	-40(%rbp), %xmm0	# recipNorm, D.4514
	movss	%xmm0, q3(%rip)	# D.4514, q3
	.loc 1 356 0
	call	imuComputeRotationMatrix	#
	.loc 1 357 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	imuMahonyAHRSupdate, .-imuMahonyAHRSupdate
	.section	.text.imuUpdateEulerAngles,"ax",@progbits
	.type	imuUpdateEulerAngles, @function
imuUpdateEulerAngles:
.LFB30:
	.loc 1 360 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 362 0
	movss	rMat+32(%rip), %xmm0	# rMat, D.4516
	movl	rMat+28(%rip), %eax	# rMat, D.4516
	movaps	%xmm0, %xmm1	# D.4516,
	movl	%eax, -4(%rbp)	# D.4516, %sfp
	movss	-4(%rbp), %xmm0	# %sfp,
	call	atan2f	#
	movaps	%xmm0, %xmm1	#, D.4516
	movss	.LC2(%rip), %xmm0	#, tmp120
	mulss	%xmm1, %xmm0	# D.4516, D.4516
	call	lrintf	#
	movw	%ax, attitude(%rip)	# D.4518, attitude.values.roll
	.loc 1 363 0
	movss	rMat+24(%rip), %xmm1	# rMat, D.4516
	movss	.LC5(%rip), %xmm0	#, tmp121
	xorps	%xmm1, %xmm0	# D.4516, D.4516
	call	acosf	#
	movaps	%xmm0, %xmm1	#, D.4516
	movss	.LC14(%rip), %xmm0	#, tmp122
	subss	%xmm1, %xmm0	# D.4516, D.4516
	movss	.LC2(%rip), %xmm1	#, tmp123
	mulss	%xmm1, %xmm0	# tmp123, D.4516
	call	lrintf	#
	movw	%ax, attitude+2(%rip)	# D.4518, attitude.values.pitch
	.loc 1 364 0
	movss	rMat(%rip), %xmm0	# rMat, D.4516
	movl	rMat+12(%rip), %eax	# rMat, D.4516
	movaps	%xmm0, %xmm1	# D.4516,
	movl	%eax, -4(%rbp)	# D.4516, %sfp
	movss	-4(%rbp), %xmm0	# %sfp,
	call	atan2f	#
	movaps	%xmm0, %xmm1	#, D.4516
	movss	.LC5(%rip), %xmm0	#, tmp124
	xorps	%xmm1, %xmm0	# D.4516, D.4516
	movss	.LC2(%rip), %xmm1	#, tmp125
	mulss	%xmm1, %xmm0	# tmp125, D.4516
	movss	magneticDeclination(%rip), %xmm1	# magneticDeclination, D.4516
	addss	%xmm1, %xmm0	# D.4516, D.4516
	call	lrintf	#
	movw	%ax, attitude+4(%rip)	# D.4518, attitude.values.yaw
	.loc 1 366 0
	movzwl	attitude+4(%rip), %eax	# attitude.values.yaw, D.4518
	testw	%ax, %ax	# D.4518
	jns	.L46	#,
	.loc 1 367 0
	movzwl	attitude+4(%rip), %eax	# attitude.values.yaw, D.4518
	addw	$3600, %ax	#, D.4519
	movw	%ax, attitude+4(%rip)	# D.4518, attitude.values.yaw
.L46:
	.loc 1 370 0
	movss	rMat+32(%rip), %xmm0	# rMat, D.4516
	movss	smallAngleCosZ(%rip), %xmm1	# smallAngleCosZ, D.4516
	ucomiss	%xmm1, %xmm0	# D.4516, D.4516
	jbe	.L51	#,
	.loc 1 371 0
	movzbl	stateFlags(%rip), %eax	# stateFlags, D.4520
	orl	$8, %eax	#, D.4520
	movb	%al, stateFlags(%rip)	# D.4520, stateFlags
	.loc 1 375 0
	jmp	.L52	#
.L51:
	.loc 1 373 0
	movzbl	stateFlags(%rip), %eax	# stateFlags, D.4520
	andl	$-9, %eax	#, D.4520
	movb	%al, stateFlags(%rip)	# D.4520, stateFlags
.L52:
	.loc 1 375 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	imuUpdateEulerAngles, .-imuUpdateEulerAngles
	.section	.text.imuIsAircraftArmable,"ax",@progbits
	.globl	imuIsAircraftArmable
	.type	imuIsAircraftArmable, @function
imuIsAircraftArmable:
.LFB31:
	.loc 1 378 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, %eax	# arming_angle, tmp92
	movb	%al, -20(%rbp)	# tmp92, arming_angle
	.loc 1 381 0
	movzbl	-20(%rbp), %eax	# arming_angle, D.4521
	movl	%eax, %edi	# D.4521,
	call	degreesToRadians	#
	call	cosf	#
	movd	%xmm0, %eax	#, tmp93
	movl	%eax, -4(%rbp)	# tmp93, armingAngleCosZ
	.loc 1 383 0
	movss	rMat+32(%rip), %xmm0	# rMat, D.4522
	ucomiss	-4(%rbp), %xmm0	# armingAngleCosZ, D.4522
	seta	%al	#, D.4523
	.loc 1 384 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	imuIsAircraftArmable, .-imuIsAircraftArmable
	.section	.text.imuIsAccelerometerHealthy,"ax",@progbits
	.type	imuIsAccelerometerHealthy, @function
imuIsAccelerometerHealthy:
.LFB32:
	.loc 1 387 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 389 0
	movl	$0, -4(%rbp)	#, accMagnitude
	.loc 1 391 0
	movl	$0, -8(%rbp)	#, axis
	jmp	.L56	#
.L57:
	.loc 1 392 0 discriminator 3
	movl	-8(%rbp), %eax	# axis, tmp102
	cltq
	movzwl	accSmooth(%rax,%rax), %eax	# accSmooth, D.4525
	movswl	%ax, %edx	# D.4525, D.4524
	movl	-8(%rbp), %eax	# axis, tmp104
	cltq
	movzwl	accSmooth(%rax,%rax), %eax	# accSmooth, D.4525
	cwtl
	imull	%edx, %eax	# D.4524, D.4524
	addl	%eax, -4(%rbp)	# D.4524, accMagnitude
	.loc 1 391 0 discriminator 3
	addl	$1, -8(%rbp)	#, axis
.L56:
	.loc 1 391 0 is_stmt 0 discriminator 1
	cmpl	$2, -8(%rbp)	#, axis
	jle	.L57	#,
	.loc 1 395 0 is_stmt 1
	movl	-4(%rbp), %eax	# accMagnitude, tmp105
	imull	$100, %eax, %eax	#, tmp105, D.4524
	movzwl	acc+16(%rip), %edx	# acc.acc_1G, D.4526
	movzwl	%dx, %ecx	# D.4526, D.4524
	movzwl	acc+16(%rip), %edx	# acc.acc_1G, D.4526
	movzwl	%dx, %edx	# D.4526, D.4524
	movl	%edx, %esi	# D.4524, D.4524
	imull	%ecx, %esi	# D.4524, D.4524
	cltd
	idivl	%esi	# D.4524
	movl	%eax, -4(%rbp)	# tmp106, accMagnitude
	.loc 1 398 0
	cmpl	$81, -4(%rbp)	#, accMagnitude
	jle	.L58	#,
	.loc 1 398 0 is_stmt 0 discriminator 1
	cmpl	$120, -4(%rbp)	#, accMagnitude
	jg	.L58	#,
	.loc 1 398 0 discriminator 3
	movl	$1, %eax	#, D.4524
	jmp	.L59	#
.L58:
	.loc 1 398 0 discriminator 4
	movl	$0, %eax	#, D.4524
.L59:
	.loc 1 398 0 discriminator 6
	andl	$1, %eax	#, D.4527
	.loc 1 399 0 is_stmt 1 discriminator 6
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	imuIsAccelerometerHealthy, .-imuIsAccelerometerHealthy
	.section	.text.isMagnetometerHealthy,"ax",@progbits
	.type	isMagnetometerHealthy, @function
isMagnetometerHealthy:
.LFB33:
	.loc 1 403 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 404 0
	movl	magADC(%rip), %eax	# magADC, D.4528
	testl	%eax, %eax	# D.4528
	je	.L62	#,
	.loc 1 404 0 is_stmt 0 discriminator 1
	movl	magADC+4(%rip), %eax	# magADC, D.4528
	testl	%eax, %eax	# D.4528
	je	.L62	#,
	.loc 1 404 0 discriminator 3
	movl	magADC+8(%rip), %eax	# magADC, D.4528
	testl	%eax, %eax	# D.4528
	je	.L62	#,
	.loc 1 404 0 discriminator 5
	movl	$1, %eax	#, D.4528
	jmp	.L63	#
.L62:
	.loc 1 404 0 discriminator 6
	movl	$0, %eax	#, D.4528
.L63:
	.loc 1 404 0 discriminator 8
	andl	$1, %eax	#, D.4529
	.loc 1 405 0 is_stmt 1 discriminator 8
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	isMagnetometerHealthy, .-isMagnetometerHealthy
	.section	.text.imuCalculateEstimatedAttitude,"ax",@progbits
	.type	imuCalculateEstimatedAttitude, @function
imuCalculateEstimatedAttitude:
.LFB34:
	.loc 1 409 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 410 0
	nop
	.loc 1 459 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	imuCalculateEstimatedAttitude, .-imuCalculateEstimatedAttitude
	.section	.text.imuUpdateAccelerometer,"ax",@progbits
	.globl	imuUpdateAccelerometer
	.type	imuUpdateAccelerometer, @function
imuUpdateAccelerometer:
.LFB35:
	.loc 1 462 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# accelerometerTrims, accelerometerTrims
	.loc 1 463 0
	movq	-8(%rbp), %rax	# accelerometerTrims, tmp87
	movq	%rax, %rdi	# tmp87,
	call	updateAccelerationReadings	#
	.loc 1 464 0
	movb	$1, isAccelUpdatedAtLeastOnce(%rip)	#, isAccelUpdatedAtLeastOnce
	.loc 1 465 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	imuUpdateAccelerometer, .-imuUpdateAccelerometer
	.section	.text.imuUpdateGyroAndAttitude,"ax",@progbits
	.globl	imuUpdateGyroAndAttitude
	.type	imuUpdateGyroAndAttitude, @function
imuUpdateGyroAndAttitude:
.LFB36:
	.loc 1 468 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 469 0
	call	gyroUpdate	#
	.loc 1 471 0
	movl	$2, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.4530
	je	.L69	#,
	.loc 1 471 0 is_stmt 0 discriminator 1
	movzbl	isAccelUpdatedAtLeastOnce(%rip), %eax	# isAccelUpdatedAtLeastOnce, D.4530
	testb	%al, %al	# D.4530
	je	.L69	#,
	.loc 1 472 0 is_stmt 1
	call	imuCalculateEstimatedAttitude	#
	jmp	.L70	#
.L69:
	.loc 1 474 0
	movl	$0, accADC(%rip)	#, accADC
	.loc 1 475 0
	movl	$0, accADC+4(%rip)	#, accADC
	.loc 1 476 0
	movl	$0, accADC+8(%rip)	#, accADC
.L70:
	.loc 1 478 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	imuUpdateGyroAndAttitude, .-imuUpdateGyroAndAttitude
	.section	.text.getCosTiltAngle,"ax",@progbits
	.globl	getCosTiltAngle
	.type	getCosTiltAngle, @function
getCosTiltAngle:
.LFB37:
	.loc 1 481 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 482 0
	movss	rMat+32(%rip), %xmm0	# rMat, D.4531
	.loc 1 483 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	getCosTiltAngle, .-getCosTiltAngle
	.section	.text.calculateThrottleAngleCorrection,"ax",@progbits
	.globl	calculateThrottleAngleCorrection
	.type	calculateThrottleAngleCorrection, @function
calculateThrottleAngleCorrection:
.LFB38:
	.loc 1 486 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, %eax	# throttle_correction_value, tmp102
	movb	%al, -20(%rbp)	# tmp102, throttle_correction_value
	.loc 1 492 0
	movss	rMat+32(%rip), %xmm1	# rMat, D.4533
	movss	.LC15(%rip), %xmm0	#, tmp103
	ucomiss	%xmm1, %xmm0	# D.4533, tmp103
	jb	.L79	#,
	.loc 1 493 0
	movl	$0, %eax	#, D.4532
	jmp	.L76	#
.L79:
	.loc 1 495 0
	movl	rMat+32(%rip), %eax	# rMat, D.4533
	movl	%eax, -24(%rbp)	# D.4533, %sfp
	movss	-24(%rbp), %xmm0	# %sfp,
	call	acosf	#
	movaps	%xmm0, %xmm1	#, D.4533
	movss	throttleAngleScale(%rip), %xmm0	# throttleAngleScale, D.4533
	mulss	%xmm1, %xmm0	# D.4533, D.4533
	call	lrintf	#
	movl	%eax, -4(%rbp)	# D.4534, angle
	.loc 1 496 0
	cmpl	$900, -4(%rbp)	#, angle
	jle	.L77	#,
	.loc 1 497 0
	movl	$900, -4(%rbp)	#, angle
.L77:
	.loc 1 498 0
	movzbl	-20(%rbp), %eax	# throttle_correction_value, D.4535
	pxor	%xmm2, %xmm2	# D.4533
	cvtsi2ss	%eax, %xmm2	# D.4535, D.4533
	movss	%xmm2, -24(%rbp)	# D.4533, %sfp
	pxor	%xmm0, %xmm0	# D.4533
	cvtsi2ss	-4(%rbp), %xmm0	# angle, D.4533
	movss	.LC16(%rip), %xmm1	#, tmp104
	divss	%xmm1, %xmm0	# tmp104, D.4533
	call	sinf	#
	mulss	-24(%rbp), %xmm0	# %sfp, D.4533
	call	lrintf	#
.L76:
	.loc 1 499 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	calculateThrottleAngleCorrection, .-calculateThrottleAngleCorrection
	.section	.bss.accZoffset.3947,"aw",@nobits
	.align 4
	.type	accZoffset.3947, @object
	.size	accZoffset.3947, 4
accZoffset.3947:
	.zero	4
	.section	.bss.accz_smooth.3948,"aw",@nobits
	.align 4
	.type	accz_smooth.3948, @object
	.size	accz_smooth.3948, 4
accz_smooth.3948:
	.zero	4
	.section	.bss.integralFBx.3976,"aw",@nobits
	.align 4
	.type	integralFBx.3976, @object
	.size	integralFBx.3976, 4
integralFBx.3976:
	.zero	4
	.section	.bss.integralFBy.3977,"aw",@nobits
	.align 4
	.type	integralFBy.3977, @object
	.size	integralFBy.3977, 4
integralFBy.3977:
	.zero	4
	.section	.bss.integralFBz.3978,"aw",@nobits
	.align 4
	.type	integralFBz.3978, @object
	.size	integralFBz.3978, 4
integralFBz.3978:
	.zero	4
	.section	.rodata
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC1:
	.long	1147207680
	.align 4
.LC2:
	.long	1141849420
	.align 4
.LC3:
	.long	1078530011
	.align 4
.LC4:
	.long	1056964608
	.align 16
.LC5:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC6:
	.long	897988541
	.align 4
.LC7:
	.long	1092616192
	.align 4
.LC9:
	.long	1086918619
	.align 4
.LC10:
	.long	3226013659
	.align 4
.LC11:
	.long	1073741824
	.align 4
.LC12:
	.long	1008981770
	.align 4
.LC13:
	.long	1051900098
	.align 4
.LC14:
	.long	1070141403
	.align 4
.LC15:
	.long	1014350479
	.align 4
.LC16:
	.long	1152431855
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/common/maths.h"
	.file 4 "./src/main/common/axis.h"
	.file 5 "./src/main/config/parameter_group.h"
	.file 6 "./src/main/config/profile.h"
	.file 7 "./src/main/drivers/sensor.h"
	.file 8 "./src/main/drivers/accgyro.h"
	.file 9 "./src/main/sensors/sensors.h"
	.file 10 "./src/main/sensors/gyro.h"
	.file 11 "./src/main/sensors/compass.h"
	.file 12 "./src/main/sensors/acceleration.h"
	.file 13 "./src/main/flight/mixer.h"
	.file 14 "./src/main/flight/pid.h"
	.file 15 "./src/main/flight/imu.h"
	.file 16 "./src/main/io/gps.h"
	.file 17 "./src/main/fc/runtime_config.h"
	.file 18 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x149a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF286
	.byte	0xc
	.long	.LASF287
	.long	.LASF288
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x2
	.byte	0x24
	.long	0x34
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x2
	.byte	0x25
	.long	0x46
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x2
	.byte	0x26
	.long	0x58
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF6
	.byte	0x2
	.byte	0x30
	.long	0x71
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0x31
	.long	0x83
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.long	.LASF10
	.byte	0x2
	.byte	0x33
	.long	0x95
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF15
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF16
	.uleb128 0x5
	.long	.LASF30
	.byte	0xc
	.byte	0x3
	.byte	0x2c
	.long	0xea
	.uleb128 0x6
	.string	"X"
	.byte	0x3
	.byte	0x2d
	.long	0xb1
	.byte	0
	.uleb128 0x6
	.string	"Y"
	.byte	0x3
	.byte	0x2e
	.long	0xb1
	.byte	0x4
	.uleb128 0x6
	.string	"Z"
	.byte	0x3
	.byte	0x2f
	.long	0xb1
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3
	.byte	0x30
	.long	0xbf
	.uleb128 0x7
	.byte	0xc
	.byte	0x3
	.byte	0x32
	.long	0x110
	.uleb128 0x8
	.string	"A"
	.byte	0x3
	.byte	0x33
	.long	0x110
	.uleb128 0x8
	.string	"V"
	.byte	0x3
	.byte	0x34
	.long	0xea
	.byte	0
	.uleb128 0x9
	.long	0xb1
	.long	0x120
	.uleb128 0xa
	.long	0xa3
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF18
	.byte	0x3
	.byte	0x35
	.long	0xf5
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x4
	.byte	0x14
	.long	0x144
	.uleb128 0xc
	.string	"X"
	.byte	0
	.uleb128 0xc
	.string	"Y"
	.byte	0x1
	.uleb128 0xc
	.string	"Z"
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x4
	.byte	0x1d
	.long	0x169
	.uleb128 0xd
	.long	.LASF19
	.byte	0
	.uleb128 0xd
	.long	.LASF20
	.byte	0x1
	.uleb128 0xd
	.long	.LASF21
	.byte	0x2
	.uleb128 0xd
	.long	.LASF22
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF23
	.byte	0x5
	.byte	0x15
	.long	0x78
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x5
	.byte	0x1d
	.long	0x1a3
	.uleb128 0xe
	.long	.LASF24
	.value	0xfff
	.uleb128 0xe
	.long	.LASF25
	.value	0xf000
	.uleb128 0xe
	.long	.LASF26
	.value	0xfff
	.uleb128 0xd
	.long	.LASF27
	.byte	0
	.uleb128 0xe
	.long	.LASF28
	.value	0x8000
	.byte	0
	.uleb128 0x2
	.long	.LASF29
	.byte	0x5
	.byte	0x26
	.long	0x1ae
	.uleb128 0xf
	.long	0x1be
	.uleb128 0x10
	.long	0x1be
	.uleb128 0x10
	.long	0x58
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.byte	0x2d
	.long	0x1de
	.uleb128 0x8
	.string	"ptr"
	.byte	0x5
	.byte	0x2e
	.long	0x1be
	.uleb128 0x8
	.string	"fn"
	.byte	0x5
	.byte	0x2f
	.long	0x1de
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.long	0x1a3
	.uleb128 0x5
	.long	.LASF31
	.byte	0x20
	.byte	0x5
	.byte	0x28
	.long	0x22d
	.uleb128 0x6
	.string	"pgn"
	.byte	0x5
	.byte	0x29
	.long	0x169
	.byte	0
	.uleb128 0x13
	.long	.LASF32
	.byte	0x5
	.byte	0x2a
	.long	0x78
	.byte	0x2
	.uleb128 0x13
	.long	.LASF33
	.byte	0x5
	.byte	0x2b
	.long	0x22d
	.byte	0x8
	.uleb128 0x6
	.string	"ptr"
	.byte	0x5
	.byte	0x2c
	.long	0x233
	.byte	0x10
	.uleb128 0x13
	.long	.LASF34
	.byte	0x5
	.byte	0x30
	.long	0x1c0
	.byte	0x18
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.long	0x66
	.uleb128 0x12
	.byte	0x8
	.long	0x22d
	.uleb128 0x2
	.long	.LASF35
	.byte	0x5
	.byte	0x31
	.long	0x1e4
	.uleb128 0x5
	.long	.LASF36
	.byte	0x1
	.byte	0x6
	.byte	0x16
	.long	0x25d
	.uleb128 0x13
	.long	.LASF37
	.byte	0x6
	.byte	0x17
	.long	0x66
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF38
	.byte	0x6
	.byte	0x18
	.long	0x244
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF39
	.uleb128 0x2
	.long	.LASF40
	.byte	0x7
	.byte	0x15
	.long	0x27a
	.uleb128 0x12
	.byte	0x8
	.long	0x280
	.uleb128 0x14
	.long	0x268
	.long	0x28f
	.uleb128 0x10
	.long	0x28f
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.long	0x3b
	.uleb128 0x2
	.long	.LASF41
	.byte	0x7
	.byte	0x18
	.long	0x2a0
	.uleb128 0x12
	.byte	0x8
	.long	0x2a6
	.uleb128 0x15
	.uleb128 0x5
	.long	.LASF42
	.byte	0x18
	.byte	0x8
	.byte	0x26
	.long	0x2e4
	.uleb128 0x13
	.long	.LASF43
	.byte	0x8
	.byte	0x27
	.long	0x295
	.byte	0
	.uleb128 0x13
	.long	.LASF44
	.byte	0x8
	.byte	0x28
	.long	0x26f
	.byte	0x8
	.uleb128 0x13
	.long	.LASF45
	.byte	0x8
	.byte	0x29
	.long	0x78
	.byte	0x10
	.uleb128 0x13
	.long	.LASF46
	.byte	0x8
	.byte	0x2a
	.long	0xaa
	.byte	0x12
	.byte	0
	.uleb128 0x2
	.long	.LASF47
	.byte	0x8
	.byte	0x2b
	.long	0x2a7
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x9
	.byte	0x15
	.long	0x314
	.uleb128 0xd
	.long	.LASF48
	.byte	0
	.uleb128 0xd
	.long	.LASF49
	.byte	0x1
	.uleb128 0xd
	.long	.LASF50
	.byte	0x2
	.uleb128 0xd
	.long	.LASF51
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF52
	.byte	0x6
	.byte	0x9
	.byte	0x20
	.long	0x345
	.uleb128 0x13
	.long	.LASF53
	.byte	0x9
	.byte	0x21
	.long	0x3b
	.byte	0
	.uleb128 0x13
	.long	.LASF54
	.byte	0x9
	.byte	0x22
	.long	0x3b
	.byte	0x2
	.uleb128 0x6
	.string	"yaw"
	.byte	0x9
	.byte	0x23
	.long	0x3b
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF55
	.byte	0x9
	.byte	0x24
	.long	0x314
	.uleb128 0x16
	.long	.LASF99
	.byte	0x6
	.byte	0x9
	.byte	0x26
	.long	0x373
	.uleb128 0x8
	.string	"raw"
	.byte	0x9
	.byte	0x27
	.long	0x373
	.uleb128 0x17
	.long	.LASF56
	.byte	0x9
	.byte	0x28
	.long	0x345
	.byte	0
	.uleb128 0x9
	.long	0x3b
	.long	0x383
	.uleb128 0xa
	.long	0xa3
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF57
	.byte	0x9
	.byte	0x29
	.long	0x350
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x9
	.byte	0x2f
	.long	0x3c5
	.uleb128 0xd
	.long	.LASF58
	.byte	0x1
	.uleb128 0xd
	.long	.LASF59
	.byte	0x2
	.uleb128 0xd
	.long	.LASF60
	.byte	0x4
	.uleb128 0xd
	.long	.LASF61
	.byte	0x8
	.uleb128 0xd
	.long	.LASF62
	.byte	0x10
	.uleb128 0xd
	.long	.LASF63
	.byte	0x20
	.uleb128 0xd
	.long	.LASF64
	.byte	0x40
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x9
	.byte	0x39
	.long	0x408
	.uleb128 0xd
	.long	.LASF65
	.byte	0
	.uleb128 0xd
	.long	.LASF66
	.byte	0x1
	.uleb128 0xd
	.long	.LASF67
	.byte	0x2
	.uleb128 0xd
	.long	.LASF68
	.byte	0x3
	.uleb128 0xd
	.long	.LASF69
	.byte	0x4
	.uleb128 0xd
	.long	.LASF70
	.byte	0x5
	.uleb128 0xd
	.long	.LASF71
	.byte	0x6
	.uleb128 0xd
	.long	.LASF72
	.byte	0x7
	.uleb128 0xd
	.long	.LASF73
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF74
	.byte	0x9
	.byte	0x43
	.long	0x3c5
	.uleb128 0x5
	.long	.LASF75
	.byte	0xc
	.byte	0x9
	.byte	0x45
	.long	0x444
	.uleb128 0x13
	.long	.LASF76
	.byte	0x9
	.byte	0x46
	.long	0x408
	.byte	0
	.uleb128 0x13
	.long	.LASF77
	.byte	0x9
	.byte	0x47
	.long	0x408
	.byte	0x4
	.uleb128 0x13
	.long	.LASF78
	.byte	0x9
	.byte	0x48
	.long	0x408
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF79
	.byte	0x9
	.byte	0x49
	.long	0x413
	.uleb128 0x5
	.long	.LASF80
	.byte	0x3
	.byte	0x9
	.byte	0x4b
	.long	0x480
	.uleb128 0x13
	.long	.LASF81
	.byte	0x9
	.byte	0x4c
	.long	0x66
	.byte	0
	.uleb128 0x13
	.long	.LASF82
	.byte	0x9
	.byte	0x4d
	.long	0x66
	.byte	0x1
	.uleb128 0x13
	.long	.LASF83
	.byte	0x9
	.byte	0x4e
	.long	0x66
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF84
	.byte	0x9
	.byte	0x4f
	.long	0x44f
	.uleb128 0x5
	.long	.LASF85
	.byte	0xc
	.byte	0x9
	.byte	0x51
	.long	0x4b0
	.uleb128 0x13
	.long	.LASF86
	.byte	0x9
	.byte	0x52
	.long	0x383
	.byte	0
	.uleb128 0x13
	.long	.LASF87
	.byte	0x9
	.byte	0x53
	.long	0x383
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF88
	.byte	0x9
	.byte	0x54
	.long	0x48b
	.uleb128 0x5
	.long	.LASF89
	.byte	0x4
	.byte	0xa
	.byte	0x25
	.long	0x4ec
	.uleb128 0x13
	.long	.LASF90
	.byte	0xa
	.byte	0x26
	.long	0x66
	.byte	0
	.uleb128 0x13
	.long	.LASF91
	.byte	0xa
	.byte	0x27
	.long	0x66
	.byte	0x1
	.uleb128 0x13
	.long	.LASF92
	.byte	0xa
	.byte	0x28
	.long	0x78
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF93
	.byte	0xa
	.byte	0x29
	.long	0x4bb
	.uleb128 0x5
	.long	.LASF94
	.byte	0x2
	.byte	0xb
	.byte	0x20
	.long	0x510
	.uleb128 0x13
	.long	.LASF95
	.byte	0xb
	.byte	0x21
	.long	0x3b
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF96
	.byte	0xb
	.byte	0x23
	.long	0x4f7
	.uleb128 0x5
	.long	.LASF97
	.byte	0x4
	.byte	0xc
	.byte	0x2a
	.long	0x540
	.uleb128 0x13
	.long	.LASF53
	.byte	0xc
	.byte	0x2b
	.long	0x3b
	.byte	0
	.uleb128 0x13
	.long	.LASF54
	.byte	0xc
	.byte	0x2c
	.long	0x3b
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF98
	.byte	0xc
	.byte	0x2d
	.long	0x51b
	.uleb128 0x16
	.long	.LASF100
	.byte	0x4
	.byte	0xc
	.byte	0x2f
	.long	0x56e
	.uleb128 0x8
	.string	"raw"
	.byte	0xc
	.byte	0x30
	.long	0x56e
	.uleb128 0x17
	.long	.LASF56
	.byte	0xc
	.byte	0x31
	.long	0x540
	.byte	0
	.uleb128 0x9
	.long	0x3b
	.long	0x57e
	.uleb128 0xa
	.long	0xa3
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF101
	.byte	0xc
	.byte	0x32
	.long	0x54b
	.uleb128 0x5
	.long	.LASF102
	.byte	0x2
	.byte	0xc
	.byte	0x34
	.long	0x5ab
	.uleb128 0x6
	.string	"xy"
	.byte	0xc
	.byte	0x35
	.long	0x66
	.byte	0
	.uleb128 0x6
	.string	"z"
	.byte	0xc
	.byte	0x36
	.long	0x66
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF103
	.byte	0xc
	.byte	0x37
	.long	0x589
	.uleb128 0x5
	.long	.LASF104
	.byte	0x10
	.byte	0xc
	.byte	0x39
	.long	0x5ff
	.uleb128 0x13
	.long	.LASF105
	.byte	0xc
	.byte	0x3a
	.long	0x57e
	.byte	0
	.uleb128 0x13
	.long	.LASF106
	.byte	0xc
	.byte	0x3d
	.long	0x66
	.byte	0x4
	.uleb128 0x13
	.long	.LASF107
	.byte	0xc
	.byte	0x3e
	.long	0xb1
	.byte	0x8
	.uleb128 0x13
	.long	.LASF108
	.byte	0xc
	.byte	0x3f
	.long	0x5ab
	.byte	0xc
	.uleb128 0x13
	.long	.LASF109
	.byte	0xc
	.byte	0x40
	.long	0x66
	.byte	0xe
	.byte	0
	.uleb128 0x2
	.long	.LASF110
	.byte	0xc
	.byte	0x41
	.long	0x5b6
	.uleb128 0x5
	.long	.LASF111
	.byte	0x10
	.byte	0xd
	.byte	0x40
	.long	0x647
	.uleb128 0x13
	.long	.LASF112
	.byte	0xd
	.byte	0x41
	.long	0xb1
	.byte	0
	.uleb128 0x13
	.long	.LASF53
	.byte	0xd
	.byte	0x42
	.long	0xb1
	.byte	0x4
	.uleb128 0x13
	.long	.LASF54
	.byte	0xd
	.byte	0x43
	.long	0xb1
	.byte	0x8
	.uleb128 0x6
	.string	"yaw"
	.byte	0xd
	.byte	0x44
	.long	0xb1
	.byte	0xc
	.byte	0
	.uleb128 0x2
	.long	.LASF113
	.byte	0xd
	.byte	0x45
	.long	0x60a
	.uleb128 0x5
	.long	.LASF114
	.byte	0x6
	.byte	0xd
	.byte	0x50
	.long	0x68f
	.uleb128 0x13
	.long	.LASF115
	.byte	0xd
	.byte	0x51
	.long	0x66
	.byte	0
	.uleb128 0x13
	.long	.LASF116
	.byte	0xd
	.byte	0x52
	.long	0x66
	.byte	0x1
	.uleb128 0x13
	.long	.LASF117
	.byte	0xd
	.byte	0x53
	.long	0x29
	.byte	0x2
	.uleb128 0x13
	.long	.LASF118
	.byte	0xd
	.byte	0x54
	.long	0x78
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF119
	.byte	0xd
	.byte	0x5a
	.long	0x652
	.uleb128 0x5
	.long	.LASF120
	.byte	0x6
	.byte	0xd
	.byte	0x5e
	.long	0x6cb
	.uleb128 0x13
	.long	.LASF121
	.byte	0xd
	.byte	0x5f
	.long	0x78
	.byte	0
	.uleb128 0x13
	.long	.LASF122
	.byte	0xd
	.byte	0x60
	.long	0x78
	.byte	0x2
	.uleb128 0x13
	.long	.LASF123
	.byte	0xd
	.byte	0x61
	.long	0x78
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF124
	.byte	0xd
	.byte	0x62
	.long	0x69a
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0xe
	.byte	0x1c
	.long	0x725
	.uleb128 0xd
	.long	.LASF125
	.byte	0
	.uleb128 0xd
	.long	.LASF126
	.byte	0x1
	.uleb128 0xd
	.long	.LASF127
	.byte	0x2
	.uleb128 0xd
	.long	.LASF128
	.byte	0x3
	.uleb128 0xd
	.long	.LASF129
	.byte	0x4
	.uleb128 0xd
	.long	.LASF130
	.byte	0x5
	.uleb128 0xd
	.long	.LASF131
	.byte	0x6
	.uleb128 0xd
	.long	.LASF132
	.byte	0x7
	.uleb128 0xd
	.long	.LASF133
	.byte	0x8
	.uleb128 0xd
	.long	.LASF134
	.byte	0x9
	.uleb128 0xd
	.long	.LASF135
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.long	.LASF136
	.byte	0x2a
	.byte	0xe
	.byte	0x3d
	.long	0x7a7
	.uleb128 0x6
	.string	"P8"
	.byte	0xe
	.byte	0x3e
	.long	0x7a7
	.byte	0
	.uleb128 0x6
	.string	"I8"
	.byte	0xe
	.byte	0x3f
	.long	0x7a7
	.byte	0xa
	.uleb128 0x6
	.string	"D8"
	.byte	0xe
	.byte	0x40
	.long	0x7a7
	.byte	0x14
	.uleb128 0x13
	.long	.LASF137
	.byte	0xe
	.byte	0x41
	.long	0x66
	.byte	0x1e
	.uleb128 0x13
	.long	.LASF138
	.byte	0xe
	.byte	0x42
	.long	0x78
	.byte	0x20
	.uleb128 0x13
	.long	.LASF139
	.byte	0xe
	.byte	0x43
	.long	0x78
	.byte	0x22
	.uleb128 0x13
	.long	.LASF140
	.byte	0xe
	.byte	0x44
	.long	0x78
	.byte	0x24
	.uleb128 0x13
	.long	.LASF141
	.byte	0xe
	.byte	0x45
	.long	0x66
	.byte	0x26
	.uleb128 0x13
	.long	.LASF142
	.byte	0xe
	.byte	0x46
	.long	0x66
	.byte	0x27
	.uleb128 0x13
	.long	.LASF143
	.byte	0xe
	.byte	0x47
	.long	0x66
	.byte	0x28
	.byte	0
	.uleb128 0x9
	.long	0x66
	.long	0x7b7
	.uleb128 0xa
	.long	0xa3
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.long	.LASF144
	.byte	0xe
	.byte	0x48
	.long	0x725
	.uleb128 0x18
	.byte	0x6
	.byte	0xf
	.byte	0x22
	.long	0x7ef
	.uleb128 0x13
	.long	.LASF53
	.byte	0xf
	.byte	0x24
	.long	0x3b
	.byte	0
	.uleb128 0x13
	.long	.LASF54
	.byte	0xf
	.byte	0x25
	.long	0x3b
	.byte	0x2
	.uleb128 0x6
	.string	"yaw"
	.byte	0xf
	.byte	0x26
	.long	0x3b
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.byte	0x6
	.byte	0xf
	.byte	0x20
	.long	0x80e
	.uleb128 0x8
	.string	"raw"
	.byte	0xf
	.byte	0x21
	.long	0x373
	.uleb128 0x17
	.long	.LASF56
	.byte	0xf
	.byte	0x27
	.long	0x7c2
	.byte	0
	.uleb128 0x2
	.long	.LASF145
	.byte	0xf
	.byte	0x28
	.long	0x7ef
	.uleb128 0x5
	.long	.LASF146
	.byte	0xc
	.byte	0xf
	.byte	0x2c
	.long	0x87a
	.uleb128 0x13
	.long	.LASF147
	.byte	0xf
	.byte	0x2e
	.long	0x78
	.byte	0
	.uleb128 0x13
	.long	.LASF148
	.byte	0xf
	.byte	0x2f
	.long	0x66
	.byte	0x2
	.uleb128 0x13
	.long	.LASF149
	.byte	0xf
	.byte	0x30
	.long	0x66
	.byte	0x3
	.uleb128 0x13
	.long	.LASF150
	.byte	0xf
	.byte	0x31
	.long	0x78
	.byte	0x4
	.uleb128 0x13
	.long	.LASF151
	.byte	0xf
	.byte	0x32
	.long	0x78
	.byte	0x6
	.uleb128 0x13
	.long	.LASF152
	.byte	0xf
	.byte	0x33
	.long	0x66
	.byte	0x8
	.uleb128 0x13
	.long	.LASF153
	.byte	0xf
	.byte	0x34
	.long	0x78
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.long	.LASF154
	.byte	0xf
	.byte	0x35
	.long	0x819
	.uleb128 0x5
	.long	.LASF155
	.byte	0x4
	.byte	0xf
	.byte	0x39
	.long	0x8aa
	.uleb128 0x13
	.long	.LASF156
	.byte	0xf
	.byte	0x3a
	.long	0x78
	.byte	0
	.uleb128 0x13
	.long	.LASF157
	.byte	0xf
	.byte	0x3b
	.long	0x66
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF158
	.byte	0xf
	.byte	0x3c
	.long	0x885
	.uleb128 0x5
	.long	.LASF159
	.byte	0x10
	.byte	0xf
	.byte	0x40
	.long	0x8fe
	.uleb128 0x13
	.long	.LASF106
	.byte	0xf
	.byte	0x41
	.long	0x66
	.byte	0
	.uleb128 0x13
	.long	.LASF109
	.byte	0xf
	.byte	0x42
	.long	0x66
	.byte	0x1
	.uleb128 0x13
	.long	.LASF151
	.byte	0xf
	.byte	0x43
	.long	0xb1
	.byte	0x4
	.uleb128 0x13
	.long	.LASF150
	.byte	0xf
	.byte	0x44
	.long	0xb1
	.byte	0x8
	.uleb128 0x13
	.long	.LASF152
	.byte	0xf
	.byte	0x45
	.long	0x66
	.byte	0xc
	.byte	0
	.uleb128 0x2
	.long	.LASF160
	.byte	0xf
	.byte	0x46
	.long	0x8b5
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x10
	.byte	0x19
	.long	0x922
	.uleb128 0xd
	.long	.LASF161
	.byte	0
	.uleb128 0xd
	.long	.LASF162
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF163
	.byte	0x10
	.byte	0x1c
	.long	0x909
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x10
	.byte	0x20
	.long	0x958
	.uleb128 0xd
	.long	.LASF164
	.byte	0
	.uleb128 0xd
	.long	.LASF165
	.byte	0x1
	.uleb128 0xd
	.long	.LASF166
	.byte	0x2
	.uleb128 0xd
	.long	.LASF167
	.byte	0x3
	.uleb128 0xd
	.long	.LASF168
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF169
	.byte	0x10
	.byte	0x26
	.long	0x92d
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x10
	.byte	0x32
	.long	0x97c
	.uleb128 0xd
	.long	.LASF170
	.byte	0
	.uleb128 0xd
	.long	.LASF171
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF172
	.byte	0x10
	.byte	0x35
	.long	0x963
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x10
	.byte	0x37
	.long	0x9a0
	.uleb128 0xd
	.long	.LASF173
	.byte	0
	.uleb128 0xd
	.long	.LASF174
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF175
	.byte	0x10
	.byte	0x3a
	.long	0x987
	.uleb128 0x5
	.long	.LASF176
	.byte	0x10
	.byte	0x10
	.byte	0x3e
	.long	0x9e8
	.uleb128 0x13
	.long	.LASF177
	.byte	0x10
	.byte	0x3f
	.long	0x922
	.byte	0
	.uleb128 0x13
	.long	.LASF178
	.byte	0x10
	.byte	0x40
	.long	0x958
	.byte	0x4
	.uleb128 0x13
	.long	.LASF179
	.byte	0x10
	.byte	0x41
	.long	0x97c
	.byte	0x8
	.uleb128 0x13
	.long	.LASF180
	.byte	0x10
	.byte	0x42
	.long	0x9a0
	.byte	0xc
	.byte	0
	.uleb128 0x2
	.long	.LASF181
	.byte	0x10
	.byte	0x43
	.long	0x9ab
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x11
	.byte	0x15
	.long	0xa12
	.uleb128 0xd
	.long	.LASF182
	.byte	0x1
	.uleb128 0xd
	.long	.LASF183
	.byte	0x2
	.uleb128 0xd
	.long	.LASF184
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.long	0x95
	.byte	0x11
	.byte	0x3e
	.long	0xa43
	.uleb128 0xd
	.long	.LASF185
	.byte	0x1
	.uleb128 0xd
	.long	.LASF186
	.byte	0x2
	.uleb128 0xd
	.long	.LASF187
	.byte	0x4
	.uleb128 0xd
	.long	.LASF188
	.byte	0x8
	.uleb128 0xd
	.long	.LASF189
	.byte	0x10
	.uleb128 0xd
	.long	.LASF190
	.byte	0x20
	.byte	0
	.uleb128 0x19
	.long	.LASF213
	.byte	0x1
	.byte	0x69
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xadf
	.uleb128 0x1a
	.long	.LASF191
	.byte	0x1
	.byte	0x6b
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1a
	.long	.LASF192
	.byte	0x1
	.byte	0x6c
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF193
	.byte	0x1
	.byte	0x6d
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.long	.LASF194
	.byte	0x1
	.byte	0x6f
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF195
	.byte	0x1
	.byte	0x70
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.long	.LASF196
	.byte	0x1
	.byte	0x71
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF197
	.byte	0x1
	.byte	0x72
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.byte	0x73
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF199
	.byte	0x1
	.byte	0x74
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.long	.LASF204
	.byte	0x1
	.byte	0x83
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xb35
	.uleb128 0x1c
	.long	.LASF200
	.byte	0x1
	.byte	0x84
	.long	0xb35
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.long	.LASF201
	.byte	0x1
	.byte	0x85
	.long	0xb3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.long	.LASF107
	.byte	0x1
	.byte	0x86
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.long	.LASF156
	.byte	0x1
	.byte	0x87
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.long	0x8fe
	.uleb128 0x12
	.byte	0x8
	.long	0x5ab
	.uleb128 0x1d
	.long	.LASF202
	.byte	0x1
	.byte	0x99
	.long	0xb1
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xb71
	.uleb128 0x1c
	.long	.LASF156
	.byte	0x1
	.byte	0x99
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.long	.LASF203
	.byte	0x1
	.byte	0xa1
	.long	0xb1
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xba1
	.uleb128 0x1c
	.long	.LASF107
	.byte	0x1
	.byte	0xa1
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF238
	.byte	0x1
	.byte	0xa6
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.long	.LASF205
	.byte	0x1
	.byte	0xaf
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xc08
	.uleb128 0x20
	.string	"v"
	.byte	0x1
	.byte	0xaf
	.long	0xc08
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"x"
	.byte	0x1
	.byte	0xb1
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x21
	.string	"y"
	.byte	0x1
	.byte	0xb1
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.string	"z"
	.byte	0x1
	.byte	0xb1
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.long	0x120
	.uleb128 0x1b
	.long	.LASF206
	.byte	0x1
	.byte	0xbe
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xc81
	.uleb128 0x1c
	.long	.LASF207
	.byte	0x1
	.byte	0xbe
	.long	0x8a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1a
	.long	.LASF208
	.byte	0x1
	.byte	0xc0
	.long	0x4d
	.uleb128 0x9
	.byte	0x3
	.quad	accZoffset.3947
	.uleb128 0x1a
	.long	.LASF209
	.byte	0x1
	.byte	0xc1
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	accz_smooth.3948
	.uleb128 0x21
	.string	"dT"
	.byte	0x1
	.byte	0xc2
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1a
	.long	.LASF210
	.byte	0x1
	.byte	0xc3
	.long	0x120
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x22
	.long	.LASF230
	.byte	0x1
	.byte	0xe3
	.long	0xb1
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xcaf
	.uleb128 0x20
	.string	"x"
	.byte	0x1
	.byte	0xe3
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x23
	.long	.LASF211
	.byte	0x1
	.byte	0xe8
	.long	0x268
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.long	.LASF212
	.byte	0x1
	.byte	0xed
	.long	0xb1
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.long	.LASF214
	.byte	0x1
	.byte	0xf7
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xef7
	.uleb128 0x20
	.string	"dt"
	.byte	0x1
	.byte	0xf7
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x20
	.string	"gx"
	.byte	0x1
	.byte	0xf7
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x20
	.string	"gy"
	.byte	0x1
	.byte	0xf7
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x20
	.string	"gz"
	.byte	0x1
	.byte	0xf7
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1c
	.long	.LASF215
	.byte	0x1
	.byte	0xf8
	.long	0x268
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x20
	.string	"ax"
	.byte	0x1
	.byte	0xf8
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x20
	.string	"ay"
	.byte	0x1
	.byte	0xf8
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x20
	.string	"az"
	.byte	0x1
	.byte	0xf8
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1c
	.long	.LASF216
	.byte	0x1
	.byte	0xf9
	.long	0x268
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x20
	.string	"mx"
	.byte	0x1
	.byte	0xf9
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x20
	.string	"my"
	.byte	0x1
	.byte	0xf9
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.string	"mz"
	.byte	0x1
	.byte	0xf9
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.long	.LASF217
	.byte	0x1
	.byte	0xfa
	.long	0x268
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x1c
	.long	.LASF218
	.byte	0x1
	.byte	0xfa
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.long	.LASF219
	.byte	0x1
	.byte	0xfc
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	integralFBx.3976
	.uleb128 0x1a
	.long	.LASF220
	.byte	0x1
	.byte	0xfc
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	integralFBy.3977
	.uleb128 0x1a
	.long	.LASF221
	.byte	0x1
	.byte	0xfc
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	integralFBz.3978
	.uleb128 0x1a
	.long	.LASF222
	.byte	0x1
	.byte	0xfd
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x21
	.string	"hx"
	.byte	0x1
	.byte	0xfe
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x21
	.string	"hy"
	.byte	0x1
	.byte	0xfe
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x21
	.string	"bx"
	.byte	0x1
	.byte	0xfe
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x21
	.string	"ex"
	.byte	0x1
	.byte	0xff
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x21
	.string	"ey"
	.byte	0x1
	.byte	0xff
	.long	0xb1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x21
	.string	"ez"
	.byte	0x1
	.byte	0xff
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x25
	.string	"qa"
	.byte	0x1
	.value	0x100
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.string	"qb"
	.byte	0x1
	.value	0x100
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x25
	.string	"qc"
	.byte	0x1
	.value	0x100
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x26
	.long	.LASF223
	.byte	0x1
	.value	0x103
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x26
	.long	.LASF224
	.byte	0x1
	.value	0x148
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x27
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0xed5
	.uleb128 0x26
	.long	.LASF225
	.byte	0x1
	.value	0x120
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x28
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x26
	.long	.LASF226
	.byte	0x1
	.value	0x13b
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF235
	.byte	0x1
	.value	0x167
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2a
	.long	.LASF227
	.byte	0x1
	.value	0x179
	.long	0x268
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xf52
	.uleb128 0x2b
	.long	.LASF228
	.byte	0x1
	.value	0x179
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x26
	.long	.LASF229
	.byte	0x1
	.value	0x17d
	.long	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2c
	.long	.LASF231
	.byte	0x1
	.value	0x182
	.long	0x268
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0xf93
	.uleb128 0x26
	.long	.LASF232
	.byte	0x1
	.value	0x184
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x26
	.long	.LASF233
	.byte	0x1
	.value	0x185
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2d
	.long	.LASF234
	.byte	0x1
	.value	0x192
	.long	0x268
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2e
	.long	.LASF236
	.byte	0x1
	.value	0x198
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2f
	.long	.LASF237
	.byte	0x1
	.value	0x1cd
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0xff9
	.uleb128 0x2b
	.long	.LASF105
	.byte	0x1
	.value	0x1cd
	.long	0xff9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.long	0x57e
	.uleb128 0x30
	.long	.LASF239
	.byte	0x1
	.value	0x1d3
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x31
	.long	.LASF289
	.byte	0x1
	.value	0x1e0
	.long	0xb1
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2a
	.long	.LASF240
	.byte	0x1
	.value	0x1e5
	.long	0x3b
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x1078
	.uleb128 0x2b
	.long	.LASF157
	.byte	0x1
	.value	0x1e5
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x26
	.long	.LASF241
	.byte	0x1
	.value	0x1ef
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1a
	.long	.LASF242
	.byte	0x1
	.byte	0x4c
	.long	0x268
	.uleb128 0x9
	.byte	0x3
	.quad	isAccelUpdatedAtLeastOnce
	.uleb128 0x1a
	.long	.LASF243
	.byte	0x1
	.byte	0x4e
	.long	0xb35
	.uleb128 0x9
	.byte	0x3
	.quad	imuRuntimeConfig
	.uleb128 0x1a
	.long	.LASF108
	.byte	0x1
	.byte	0x4f
	.long	0xb3b
	.uleb128 0x9
	.byte	0x3
	.quad	accDeadband
	.uleb128 0x9
	.long	0x8aa
	.long	0x10c7
	.uleb128 0xa
	.long	0xa3
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF244
	.byte	0x1
	.byte	0x52
	.long	0x10b7
	.uleb128 0x9
	.byte	0x3
	.quad	throttleCorrectionConfig_Storage
	.uleb128 0x21
	.string	"q0"
	.byte	0x1
	.byte	0x62
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	q0
	.uleb128 0x21
	.string	"q1"
	.byte	0x1
	.byte	0x62
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	q1
	.uleb128 0x21
	.string	"q2"
	.byte	0x1
	.byte	0x62
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	q2
	.uleb128 0x21
	.string	"q3"
	.byte	0x1
	.byte	0x62
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	q3
	.uleb128 0x9
	.long	0xb1
	.long	0x1142
	.uleb128 0xa
	.long	0xa3
	.byte	0x2
	.uleb128 0xa
	.long	0xa3
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF245
	.byte	0x1
	.byte	0x63
	.long	0x112c
	.uleb128 0x9
	.byte	0x3
	.quad	rMat
	.uleb128 0x1a
	.long	.LASF246
	.byte	0x1
	.byte	0x67
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	gyroScale
	.uleb128 0x32
	.long	.LASF247
	.byte	0x12
	.byte	0xc8
	.long	0x8a
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x32
	.long	.LASF248
	.byte	0x12
	.byte	0xc9
	.long	0x8a
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x32
	.long	.LASF249
	.byte	0x12
	.byte	0xca
	.long	0x8a
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x32
	.long	.LASF250
	.byte	0x5
	.byte	0x43
	.long	0x11c0
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x12
	.byte	0x8
	.long	0x239
	.uleb128 0x32
	.long	.LASF251
	.byte	0x5
	.byte	0x44
	.long	0x11c0
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x32
	.long	.LASF252
	.byte	0x5
	.byte	0x47
	.long	0x22d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x32
	.long	.LASF253
	.byte	0x5
	.byte	0x48
	.long	0x22d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x32
	.long	.LASF254
	.byte	0x6
	.byte	0x1a
	.long	0x25d
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_System
	.uleb128 0x32
	.long	.LASF255
	.byte	0x9
	.byte	0x56
	.long	0x480
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x32
	.long	.LASF256
	.byte	0x9
	.byte	0x57
	.long	0x444
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x32
	.long	.LASF257
	.byte	0x9
	.byte	0x58
	.long	0x4b0
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0x32
	.long	.LASF258
	.byte	0xa
	.byte	0x2b
	.long	0x4ec
	.uleb128 0x9
	.byte	0x3
	.quad	gyroConfig_System
	.uleb128 0x33
	.long	.LASF259
	.byte	0xb
	.byte	0x25
	.long	0x1279
	.uleb128 0x12
	.byte	0x8
	.long	0x510
	.uleb128 0x9
	.long	0x4d
	.long	0x128f
	.uleb128 0xa
	.long	0xa3
	.byte	0x2
	.byte	0
	.uleb128 0x33
	.long	.LASF260
	.byte	0xb
	.byte	0x2e
	.long	0x127f
	.uleb128 0x33
	.long	.LASF261
	.byte	0xb
	.byte	0x32
	.long	0xb1
	.uleb128 0x34
	.string	"acc"
	.byte	0xc
	.byte	0x26
	.long	0x2e4
	.uleb128 0x33
	.long	.LASF262
	.byte	0xc
	.byte	0x28
	.long	0x127f
	.uleb128 0x33
	.long	.LASF263
	.byte	0xc
	.byte	0x43
	.long	0x12c6
	.uleb128 0x12
	.byte	0x8
	.long	0x5ff
	.uleb128 0x9
	.long	0x647
	.long	0x12dc
	.uleb128 0xa
	.long	0xa3
	.byte	0x3
	.byte	0
	.uleb128 0x33
	.long	.LASF264
	.byte	0xd
	.byte	0x47
	.long	0x12cc
	.uleb128 0x32
	.long	.LASF265
	.byte	0xd
	.byte	0x5c
	.long	0x68f
	.uleb128 0x9
	.byte	0x3
	.quad	mixerConfig_System
	.uleb128 0x32
	.long	.LASF266
	.byte	0xd
	.byte	0x64
	.long	0x6cb
	.uleb128 0x9
	.byte	0x3
	.quad	motor3DConfig_System
	.uleb128 0x33
	.long	.LASF267
	.byte	0xe
	.byte	0x4a
	.long	0x131c
	.uleb128 0x12
	.byte	0x8
	.long	0x7b7
	.uleb128 0x32
	.long	.LASF268
	.byte	0x1
	.byte	0x44
	.long	0x8a
	.uleb128 0x9
	.byte	0x3
	.quad	accTimeSum
	.uleb128 0x32
	.long	.LASF269
	.byte	0x1
	.byte	0x45
	.long	0x58
	.uleb128 0x9
	.byte	0x3
	.quad	accSumCount
	.uleb128 0x32
	.long	.LASF270
	.byte	0x1
	.byte	0x46
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	accVelScale
	.uleb128 0x32
	.long	.LASF271
	.byte	0x1
	.byte	0x41
	.long	0x373
	.uleb128 0x9
	.byte	0x3
	.quad	accSmooth
	.uleb128 0x32
	.long	.LASF272
	.byte	0x1
	.byte	0x42
	.long	0x127f
	.uleb128 0x9
	.byte	0x3
	.quad	accSum
	.uleb128 0x32
	.long	.LASF273
	.byte	0x1
	.byte	0x65
	.long	0x80e
	.uleb128 0x9
	.byte	0x3
	.quad	attitude
	.uleb128 0x32
	.long	.LASF274
	.byte	0x1
	.byte	0x51
	.long	0x87a
	.uleb128 0x9
	.byte	0x3
	.quad	imuConfig_System
	.uleb128 0x32
	.long	.LASF275
	.byte	0x1
	.byte	0x52
	.long	0x13ca
	.uleb128 0x9
	.byte	0x3
	.quad	throttleCorrectionConfig_ProfileCurrent
	.uleb128 0x12
	.byte	0x8
	.long	0x8aa
	.uleb128 0x32
	.long	.LASF276
	.byte	0x10
	.byte	0x45
	.long	0x9e8
	.uleb128 0x9
	.byte	0x3
	.quad	gpsConfig_System
	.uleb128 0x33
	.long	.LASF277
	.byte	0x11
	.byte	0x1b
	.long	0x66
	.uleb128 0x33
	.long	.LASF278
	.byte	0x11
	.byte	0x4b
	.long	0x66
	.uleb128 0x32
	.long	.LASF279
	.byte	0x1
	.byte	0x48
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	throttleAngleScale
	.uleb128 0x32
	.long	.LASF280
	.byte	0x1
	.byte	0x49
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	fc_acc
	.uleb128 0x32
	.long	.LASF281
	.byte	0x1
	.byte	0x4a
	.long	0xb1
	.uleb128 0x9
	.byte	0x3
	.quad	smallAngleCosZ
	.uleb128 0x32
	.long	.LASF282
	.byte	0x1
	.byte	0x54
	.long	0x144f
	.uleb128 0x9
	.byte	0x3
	.quad	pgResetTemplate_imuConfig
	.uleb128 0x35
	.long	0x87a
	.uleb128 0x32
	.long	.LASF283
	.byte	0x1
	.byte	0x51
	.long	0x1469
	.uleb128 0x9
	.byte	0x3
	.quad	imuConfig_Registry
	.uleb128 0x35
	.long	0x239
	.uleb128 0x32
	.long	.LASF284
	.byte	0x1
	.byte	0x5d
	.long	0x1483
	.uleb128 0x9
	.byte	0x3
	.quad	pgResetTemplate_throttleCorrectionConfig
	.uleb128 0x35
	.long	0x8aa
	.uleb128 0x32
	.long	.LASF285
	.byte	0x1
	.byte	0x52
	.long	0x1469
	.uleb128 0x9
	.byte	0x3
	.quad	throttleCorrectionConfig_Registry
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x2116
	.uleb128 0x19
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x15c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
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
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.quad	.LFB32
	.quad	.LFE32
	.quad	.LFB33
	.quad	.LFE33
	.quad	.LFB34
	.quad	.LFE34
	.quad	.LFB35
	.quad	.LFE35
	.quad	.LFB36
	.quad	.LFE36
	.quad	.LFB37
	.quad	.LFE37
	.quad	.LFB38
	.quad	.LFE38
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF271:
	.string	"accSmooth"
.LASF187:
	.string	"CALIBRATE_MAG"
.LASF169:
	.string	"sbasMode_e"
.LASF200:
	.string	"initialImuRuntimeConfig"
.LASF114:
	.string	"mixerConfig_s"
.LASF119:
	.string	"mixerConfig_t"
.LASF186:
	.string	"GPS_FIX"
.LASF28:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF173:
	.string	"GPS_AUTOBAUD_OFF"
.LASF253:
	.string	"__pg_resetdata_end"
.LASF212:
	.string	"imuGetPGainScaleFactor"
.LASF27:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF192:
	.string	"q2q2"
.LASF199:
	.string	"q2q3"
.LASF149:
	.string	"gyroSyncDenominator"
.LASF82:
	.string	"mag_hardware"
.LASF11:
	.string	"unsigned int"
.LASF278:
	.string	"stateFlags"
.LASF109:
	.string	"acc_unarmedcal"
.LASF136:
	.string	"pidProfile_s"
.LASF144:
	.string	"pidProfile_t"
.LASF146:
	.string	"imuConfig_s"
.LASF154:
	.string	"imuConfig_t"
.LASF108:
	.string	"accDeadband"
.LASF54:
	.string	"pitch"
.LASF174:
	.string	"GPS_AUTOBAUD_ON"
.LASF279:
	.string	"throttleAngleScale"
.LASF36:
	.string	"profileSelection_s"
.LASF246:
	.string	"gyroScale"
.LASF25:
	.string	"PGR_PGN_VERSION_MASK"
.LASF99:
	.string	"flightDynamicsTrims_u"
.LASF287:
	.string	"src/main/flight/imu.c"
.LASF26:
	.string	"PGR_SIZE_MASK"
.LASF162:
	.string	"GPS_UBLOX"
.LASF161:
	.string	"GPS_NMEA"
.LASF274:
	.string	"imuConfig_System"
.LASF85:
	.string	"sensorTrims_s"
.LASF88:
	.string	"sensorTrims_t"
.LASF76:
	.string	"gyro_align"
.LASF242:
	.string	"isAccelUpdatedAtLeastOnce"
.LASF247:
	.string	"U_ID_0"
.LASF64:
	.string	"SENSOR_GPSMAG"
.LASF249:
	.string	"U_ID_2"
.LASF171:
	.string	"GPS_AUTOCONFIG_ON"
.LASF104:
	.string	"accelerometerConfig_s"
.LASF110:
	.string	"accelerometerConfig_t"
.LASF264:
	.string	"customMotorMixer_SystemArray"
.LASF10:
	.string	"uint32_t"
.LASF0:
	.string	"int8_t"
.LASF284:
	.string	"pgResetTemplate_throttleCorrectionConfig"
.LASF236:
	.string	"imuCalculateEstimatedAttitude"
.LASF152:
	.string	"small_angle"
.LASF266:
	.string	"motor3DConfig_System"
.LASF259:
	.string	"compassConfig_ProfileCurrent"
.LASF238:
	.string	"imuResetAccelerationSum"
.LASF255:
	.string	"sensorSelectionConfig_System"
.LASF15:
	.string	"float"
.LASF24:
	.string	"PGR_PGN_MASK"
.LASF224:
	.string	"dcmKpGain"
.LASF116:
	.string	"pid_at_min_throttle"
.LASF1:
	.string	"int16_t"
.LASF257:
	.string	"sensorTrims_System"
.LASF51:
	.string	"SENSOR_INDEX_MAG"
.LASF19:
	.string	"FD_ROLL"
.LASF22:
	.string	"FD_INDEX_COUNT"
.LASF106:
	.string	"acc_cut_hz"
.LASF245:
	.string	"rMat"
.LASF231:
	.string	"imuIsAccelerometerHealthy"
.LASF204:
	.string	"imuConfigure"
.LASF151:
	.string	"dcm_ki"
.LASF195:
	.string	"q0q2"
.LASF196:
	.string	"q0q3"
.LASF182:
	.string	"OK_TO_ARM"
.LASF217:
	.string	"useYaw"
.LASF150:
	.string	"dcm_kp"
.LASF123:
	.string	"neutral3d"
.LASF158:
	.string	"throttleCorrectionConfig_t"
.LASF263:
	.string	"accelerometerConfig_ProfileCurrent"
.LASF73:
	.string	"CW270_DEG_FLIP"
.LASF125:
	.string	"PIDROLL"
.LASF159:
	.string	"imuRuntimeConfig_s"
.LASF140:
	.string	"yaw_lpf"
.LASF254:
	.string	"profileSelection_System"
.LASF157:
	.string	"throttle_correction_value"
.LASF233:
	.string	"accMagnitude"
.LASF46:
	.string	"revisionCode"
.LASF23:
	.string	"pgn_t"
.LASF139:
	.string	"dterm_lpf"
.LASF89:
	.string	"gyroConfig_s"
.LASF93:
	.string	"gyroConfig_t"
.LASF61:
	.string	"SENSOR_MAG"
.LASF175:
	.string	"gpsAutoBaud_e"
.LASF20:
	.string	"FD_PITCH"
.LASF39:
	.string	"_Bool"
.LASF60:
	.string	"SENSOR_BARO"
.LASF31:
	.string	"pgRegistry_s"
.LASF35:
	.string	"pgRegistry_t"
.LASF252:
	.string	"__pg_resetdata_start"
.LASF183:
	.string	"PREVENT_ARMING"
.LASF273:
	.string	"attitude"
.LASF50:
	.string	"SENSOR_INDEX_BARO"
.LASF131:
	.string	"PIDNAVR"
.LASF211:
	.string	"imuUseFastGains"
.LASF181:
	.string	"gpsConfig_t"
.LASF127:
	.string	"PIDYAW"
.LASF83:
	.string	"baro_hardware"
.LASF265:
	.string	"mixerConfig_System"
.LASF243:
	.string	"imuRuntimeConfig"
.LASF165:
	.string	"SBAS_EGNOS"
.LASF71:
	.string	"CW90_DEG_FLIP"
.LASF107:
	.string	"accz_lpf_cutoff"
.LASF213:
	.string	"imuComputeRotationMatrix"
.LASF126:
	.string	"PIDPITCH"
.LASF14:
	.string	"char"
.LASF111:
	.string	"motorMixer_s"
.LASF113:
	.string	"motorMixer_t"
.LASF285:
	.string	"throttleCorrectionConfig_Registry"
.LASF272:
	.string	"accSum"
.LASF277:
	.string	"armingFlags"
.LASF132:
	.string	"PIDLEVEL"
.LASF194:
	.string	"q0q1"
.LASF260:
	.string	"magADC"
.LASF37:
	.string	"current_profile_index"
.LASF223:
	.string	"spin_rate"
.LASF134:
	.string	"PIDVEL"
.LASF70:
	.string	"CW0_DEG_FLIP"
.LASF53:
	.string	"roll"
.LASF193:
	.string	"q3q3"
.LASF188:
	.string	"SMALL_ANGLE"
.LASF6:
	.string	"uint8_t"
.LASF239:
	.string	"imuUpdateGyroAndAttitude"
.LASF250:
	.string	"__pg_registry_start"
.LASF262:
	.string	"accADC"
.LASF137:
	.string	"pidController"
.LASF201:
	.string	"initialAccDeadband"
.LASF235:
	.string	"imuUpdateEulerAngles"
.LASF230:
	.string	"invSqrt"
.LASF206:
	.string	"imuCalculateAcceleration"
.LASF179:
	.string	"autoConfig"
.LASF216:
	.string	"useMag"
.LASF289:
	.string	"getCosTiltAngle"
.LASF229:
	.string	"armingAngleCosZ"
.LASF55:
	.string	"flightDynamicsTrims_def_t"
.LASF185:
	.string	"GPS_FIX_HOME"
.LASF81:
	.string	"acc_hardware"
.LASF135:
	.string	"PID_ITEM_COUNT"
.LASF237:
	.string	"imuUpdateAccelerometer"
.LASF78:
	.string	"mag_align"
.LASF142:
	.string	"horizon_tilt_effect"
.LASF80:
	.string	"sensorSelectionConfig_s"
.LASF84:
	.string	"sensorSelectionConfig_t"
.LASF168:
	.string	"SBAS_GAGAN"
.LASF156:
	.string	"throttle_correction_angle"
.LASF41:
	.string	"sensorAccInitFuncPtr"
.LASF32:
	.string	"size"
.LASF147:
	.string	"looptime"
.LASF202:
	.string	"calculateThrottleAngleScale"
.LASF67:
	.string	"CW90_DEG"
.LASF288:
	.string	"/home/aravind/git/cleanflight"
.LASF122:
	.string	"deadband3d_high"
.LASF77:
	.string	"acc_align"
.LASF128:
	.string	"PIDALT"
.LASF178:
	.string	"sbasMode"
.LASF56:
	.string	"values"
.LASF86:
	.string	"accZero"
.LASF227:
	.string	"imuIsAircraftArmable"
.LASF176:
	.string	"gpsConfig_s"
.LASF166:
	.string	"SBAS_WAAS"
.LASF251:
	.string	"__pg_registry_end"
.LASF130:
	.string	"PIDPOSR"
.LASF57:
	.string	"flightDynamicsTrims_t"
.LASF49:
	.string	"SENSOR_INDEX_ACC"
.LASF133:
	.string	"PIDMAG"
.LASF261:
	.string	"magneticDeclination"
.LASF62:
	.string	"SENSOR_SONAR"
.LASF209:
	.string	"accz_smooth"
.LASF280:
	.string	"fc_acc"
.LASF190:
	.string	"ANTI_WINDUP"
.LASF8:
	.string	"uint16_t"
.LASF203:
	.string	"calculateAccZLowPassFilterRCTimeConstant"
.LASF21:
	.string	"FD_YAW"
.LASF95:
	.string	"mag_declination"
.LASF240:
	.string	"calculateThrottleAngleCorrection"
.LASF207:
	.string	"deltaT"
.LASF286:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF241:
	.string	"angle"
.LASF121:
	.string	"deadband3d_low"
.LASF281:
	.string	"smallAngleCosZ"
.LASF191:
	.string	"q1q1"
.LASF197:
	.string	"q1q2"
.LASF198:
	.string	"q1q3"
.LASF189:
	.string	"FIXED_WING"
.LASF226:
	.string	"dcmKiGain"
.LASF143:
	.string	"horizon_tilt_mode"
.LASF225:
	.string	"ez_ef"
.LASF3:
	.string	"short int"
.LASF30:
	.string	"fp_vector"
.LASF141:
	.string	"deltaMethod"
.LASF153:
	.string	"max_angle_inclination"
.LASF87:
	.string	"magZero"
.LASF5:
	.string	"long int"
.LASF163:
	.string	"gpsProvider_e"
.LASF258:
	.string	"gyroConfig_System"
.LASF138:
	.string	"yaw_p_limit"
.LASF256:
	.string	"sensorAlignmentConfig_System"
.LASF59:
	.string	"SENSOR_ACC"
.LASF90:
	.string	"gyroMovementCalibrationThreshold"
.LASF210:
	.string	"accel_ned"
.LASF282:
	.string	"pgResetTemplate_imuConfig"
.LASF160:
	.string	"imuRuntimeConfig_t"
.LASF177:
	.string	"provider"
.LASF69:
	.string	"CW270_DEG"
.LASF270:
	.string	"accVelScale"
.LASF129:
	.string	"PIDPOS"
.LASF172:
	.string	"gpsAutoConfig_e"
.LASF105:
	.string	"accelerometerTrims"
.LASF269:
	.string	"accSumCount"
.LASF34:
	.string	"reset"
.LASF58:
	.string	"SENSOR_GYRO"
.LASF184:
	.string	"ARMED"
.LASF74:
	.string	"sensor_align_e"
.LASF208:
	.string	"accZoffset"
.LASF44:
	.string	"read"
.LASF222:
	.string	"recipNorm"
.LASF91:
	.string	"gyro_lpf"
.LASF48:
	.string	"SENSOR_INDEX_GYRO"
.LASF180:
	.string	"autoBaud"
.LASF234:
	.string	"isMagnetometerHealthy"
.LASF232:
	.string	"axis"
.LASF43:
	.string	"init"
.LASF13:
	.string	"sizetype"
.LASF12:
	.string	"long unsigned int"
.LASF33:
	.string	"address"
.LASF68:
	.string	"CW180_DEG"
.LASF120:
	.string	"motor3DConfig_s"
.LASF124:
	.string	"motor3DConfig_t"
.LASF4:
	.string	"int32_t"
.LASF117:
	.string	"yaw_motor_direction"
.LASF52:
	.string	"int16_flightDynamicsTrims_s"
.LASF72:
	.string	"CW180_DEG_FLIP"
.LASF276:
	.string	"gpsConfig_System"
.LASF205:
	.string	"imuTransformVectorBodyToEarth"
.LASF7:
	.string	"unsigned char"
.LASF45:
	.string	"acc_1G"
.LASF170:
	.string	"GPS_AUTOCONFIG_OFF"
.LASF155:
	.string	"throttleCorrectionConfig_s"
.LASF214:
	.string	"imuMahonyAHRSupdate"
.LASF215:
	.string	"useAcc"
.LASF148:
	.string	"gyroSync"
.LASF248:
	.string	"U_ID_1"
.LASF94:
	.string	"compassConfig_s"
.LASF96:
	.string	"compassConfig_t"
.LASF42:
	.string	"acc_s"
.LASF47:
	.string	"acc_t"
.LASF218:
	.string	"yawError"
.LASF115:
	.string	"mixerMode"
.LASF219:
	.string	"integralFBx"
.LASF220:
	.string	"integralFBy"
.LASF221:
	.string	"integralFBz"
.LASF145:
	.string	"attitudeEulerAngles_t"
.LASF98:
	.string	"rollAndPitchTrims_t_def"
.LASF267:
	.string	"pidProfile_ProfileCurrent"
.LASF2:
	.string	"signed char"
.LASF9:
	.string	"short unsigned int"
.LASF17:
	.string	"t_fp_vector_def"
.LASF164:
	.string	"SBAS_AUTO"
.LASF97:
	.string	"rollAndPitchTrims_s"
.LASF101:
	.string	"rollAndPitchTrims_t"
.LASF100:
	.string	"rollAndPitchTrims_u"
.LASF40:
	.string	"sensorReadFuncPtr"
.LASF16:
	.string	"double"
.LASF38:
	.string	"profileSelection_t"
.LASF63:
	.string	"SENSOR_GPS"
.LASF18:
	.string	"t_fp_vector"
.LASF75:
	.string	"sensorAlignmentConfig_s"
.LASF79:
	.string	"sensorAlignmentConfig_t"
.LASF275:
	.string	"throttleCorrectionConfig_ProfileCurrent"
.LASF167:
	.string	"SBAS_MSAS"
.LASF112:
	.string	"throttle"
.LASF65:
	.string	"ALIGN_DEFAULT"
.LASF92:
	.string	"soft_gyro_lpf_hz"
.LASF66:
	.string	"CW0_DEG"
.LASF283:
	.string	"imuConfig_Registry"
.LASF244:
	.string	"throttleCorrectionConfig_Storage"
.LASF102:
	.string	"accDeadband_s"
.LASF103:
	.string	"accDeadband_t"
.LASF268:
	.string	"accTimeSum"
.LASF228:
	.string	"arming_angle"
.LASF29:
	.string	"pgResetFunc"
.LASF118:
	.string	"yaw_jump_prevention_limit"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
