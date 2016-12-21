	.file	"gyro.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed gyro.i -mtune=generic -march=x86-64 -g
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
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.comm	boardAlignment_System,6,1
	.comm	gyroConfig_System,4,2
	.section	.text.gyroConfig,"ax",@progbits
	.type	gyroConfig, @function
gyroConfig:
.LFB8:
	.file 1 "./src/main/sensors/gyro.h"
	.loc 1 43 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 43 0
	movl	$gyroConfig_System, %eax	#, D.3609
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	gyroConfig, .-gyroConfig
	.globl	gyroAlign
	.section	.bss.gyroAlign,"aw",@nobits
	.align 4
	.type	gyroAlign, @object
	.size	gyroAlign, 4
gyroAlign:
	.zero	4
	.comm	gyroADC,12,8
	.section	.bss.calibratingG,"aw",@nobits
	.align 2
	.type	calibratingG, @object
	.size	calibratingG, 2
calibratingG:
	.zero	2
	.section	.bss.gyroADCRaw,"aw",@nobits
	.align 2
	.type	gyroADCRaw, @object
	.size	gyroADCRaw, 6
gyroADCRaw:
	.zero	6
	.section	.bss.gyroZero,"aw",@nobits
	.align 8
	.type	gyroZero, @object
	.size	gyroZero, 12
gyroZero:
	.zero	12
	.section	.bss.gyroFilterState,"aw",@nobits
	.align 32
	.type	gyroFilterState, @object
	.size	gyroFilterState, 108
gyroFilterState:
	.zero	108
	.section	.bss.gyroFilterStateIsSet,"aw",@nobits
	.type	gyroFilterStateIsSet, @object
	.size	gyroFilterStateIsSet, 1
gyroFilterStateIsSet:
	.zero	1
	.globl	gyroConfig_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	gyroConfig_Registry, @object
	.size	gyroConfig_Registry, 32
gyroConfig_Registry:
# pgn:
	.value	10
# size:
	.value	4
# address:
	.zero	4
	.quad	gyroConfig_System
# ptr:
	.quad	0
# reset:
# ptr:
	.quad	pgResetTemplate_gyroConfig
	.globl	pgResetTemplate_gyroConfig
	.section	.pg_resetdata,"a",@progbits
	.align 2
	.type	pgResetTemplate_gyroConfig, @object
	.size	pgResetTemplate_gyroConfig, 4
pgResetTemplate_gyroConfig:
# gyroMovementCalibrationThreshold:
	.byte	32
# gyro_lpf:
	.byte	0
# soft_gyro_lpf_hz:
	.value	100
	.section	.text.initGyroFilterCoefficients,"ax",@progbits
	.type	initGyroFilterCoefficients, @function
initGyroFilterCoefficients:
.LFB9:
	.file 2 "src/main/sensors/gyro.c"
	.loc 2 69 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r12	#
	pushq	%rbx	#
	subq	$16, %rsp	#,
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	.loc 2 70 0
	call	gyroConfig	#
	movzwl	2(%rax), %eax	# _6->soft_gyro_lpf_hz, D.3611
	testw	%ax, %ax	# D.3611
	je	.L7	#,
.LBB2:
	.loc 2 72 0
	movl	$0, -20(%rbp)	#, axis
	jmp	.L5	#
.L6:
	.loc 2 73 0 discriminator 3
	movl	targetLooptime(%rip), %ebx	# targetLooptime, D.3612
	movl	-20(%rbp), %eax	# axis, tmp95
	movslq	%eax, %rdx	# tmp95, tmp94
	movq	%rdx, %rax	# tmp94, tmp96
	salq	$3, %rax	#, tmp96
	addq	%rdx, %rax	# tmp94, tmp96
	salq	$2, %rax	#, tmp97
	leaq	gyroFilterState(%rax), %r12	#, D.3613
	call	gyroConfig	#
	movzwl	2(%rax), %eax	# _12->soft_gyro_lpf_hz, D.3611
	movzwl	%ax, %eax	# D.3611, tmp98
	pxor	%xmm0, %xmm0	# D.3614
	cvtsi2ss	%eax, %xmm0	# tmp98, D.3614
	movl	%ebx, %esi	# D.3612,
	movq	%r12, %rdi	# D.3613,
	call	BiQuadNewLpf	#
	.loc 2 72 0 discriminator 3
	addl	$1, -20(%rbp)	#, axis
.L5:
	.loc 2 72 0 is_stmt 0 discriminator 1
	cmpl	$2, -20(%rbp)	#, axis
	jle	.L6	#,
.LBE2:
	.loc 2 75 0 is_stmt 1
	movb	$1, gyroFilterStateIsSet(%rip)	#, gyroFilterStateIsSet
.L7:
	.loc 2 77 0
	nop
	addq	$16, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	initGyroFilterCoefficients, .-initGyroFilterCoefficients
	.section	.text.gyroSetCalibrationCycles,"ax",@progbits
	.globl	gyroSetCalibrationCycles
	.type	gyroSetCalibrationCycles, @function
gyroSetCalibrationCycles:
.LFB10:
	.loc 2 80 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# calibrationCyclesRequired, tmp87
	movw	%ax, -4(%rbp)	# tmp87, calibrationCyclesRequired
	.loc 2 81 0
	movzwl	-4(%rbp), %eax	# calibrationCyclesRequired, tmp88
	movw	%ax, calibratingG(%rip)	# tmp88, calibratingG
	.loc 2 82 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	gyroSetCalibrationCycles, .-gyroSetCalibrationCycles
	.section	.text.isGyroCalibrationComplete,"ax",@progbits
	.globl	isGyroCalibrationComplete
	.type	isGyroCalibrationComplete, @function
isGyroCalibrationComplete:
.LFB11:
	.loc 2 85 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 86 0
	movzwl	calibratingG(%rip), %eax	# calibratingG, D.3615
	testw	%ax, %ax	# D.3615
	sete	%al	#, D.3616
	.loc 2 87 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	isGyroCalibrationComplete, .-isGyroCalibrationComplete
	.section	.text.isOnFinalGyroCalibrationCycle,"ax",@progbits
	.type	isOnFinalGyroCalibrationCycle, @function
isOnFinalGyroCalibrationCycle:
.LFB12:
	.loc 2 90 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 91 0
	movzwl	calibratingG(%rip), %eax	# calibratingG, D.3617
	cmpw	$1, %ax	#, D.3617
	sete	%al	#, D.3618
	.loc 2 92 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	isOnFinalGyroCalibrationCycle, .-isOnFinalGyroCalibrationCycle
	.section	.text.isOnFirstGyroCalibrationCycle,"ax",@progbits
	.type	isOnFirstGyroCalibrationCycle, @function
isOnFirstGyroCalibrationCycle:
.LFB13:
	.loc 2 95 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 96 0
	movzwl	calibratingG(%rip), %eax	# calibratingG, D.3619
	cmpw	$1000, %ax	#, D.3619
	sete	%al	#, D.3620
	.loc 2 97 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	isOnFirstGyroCalibrationCycle, .-isOnFirstGyroCalibrationCycle
	.section	.text.performAcclerationCalibration,"ax",@progbits
	.type	performAcclerationCalibration, @function
performAcclerationCalibration:
.LFB14:
	.loc 2 100 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, %eax	# gyroMovementCalibrationThreshold, tmp105
	movb	%al, -20(%rbp)	# tmp105, gyroMovementCalibrationThreshold
.LBB3:
	.loc 2 104 0
	movl	$0, -8(%rbp)	#, axis
	jmp	.L16	#
.L22:
	.loc 2 107 0
	call	isOnFirstGyroCalibrationCycle	#
	testb	%al, %al	# D.3621
	je	.L17	#,
	.loc 2 108 0
	movl	-8(%rbp), %eax	# axis, tmp107
	cltq
	movl	$0, g.3489(,%rax,4)	#, g
	.loc 2 109 0
	movl	-8(%rbp), %eax	# axis, tmp109
	movslq	%eax, %rdx	# tmp109, tmp108
	movq	%rdx, %rax	# tmp108, tmp110
	salq	$2, %rax	#, tmp110
	addq	%rdx, %rax	# tmp108, tmp110
	salq	$2, %rax	#, tmp111
	addq	$var.3490, %rax	#, D.3622
	movq	%rax, %rdi	# D.3622,
	call	devClear	#
.L17:
	.loc 2 113 0
	movl	-8(%rbp), %eax	# axis, tmp113
	cltq
	movl	g.3489(,%rax,4), %edx	# g, D.3623
	movl	-8(%rbp), %eax	# axis, tmp115
	cltq
	movl	gyroADC(,%rax,4), %eax	# gyroADC, D.3623
	addl	%eax, %edx	# D.3623, D.3623
	movl	-8(%rbp), %eax	# axis, tmp117
	cltq
	movl	%edx, g.3489(,%rax,4)	# D.3623, g
	.loc 2 114 0
	movl	-8(%rbp), %eax	# axis, tmp119
	cltq
	movl	gyroADC(,%rax,4), %eax	# gyroADC, D.3623
	pxor	%xmm0, %xmm0	# D.3624
	cvtsi2ss	%eax, %xmm0	# D.3623, D.3624
	movl	-8(%rbp), %eax	# axis, tmp121
	movslq	%eax, %rdx	# tmp121, tmp120
	movq	%rdx, %rax	# tmp120, tmp122
	salq	$2, %rax	#, tmp122
	addq	%rdx, %rax	# tmp120, tmp122
	salq	$2, %rax	#, tmp123
	addq	$var.3490, %rax	#, D.3622
	movq	%rax, %rdi	# D.3622,
	call	devPush	#
	.loc 2 117 0
	movl	-8(%rbp), %eax	# axis, tmp125
	cltq
	movl	$0, gyroADC(,%rax,4)	#, gyroADC
	.loc 2 118 0
	movl	-8(%rbp), %eax	# axis, tmp127
	cltq
	movl	$0, gyroZero(,%rax,4)	#, gyroZero
	.loc 2 120 0
	call	isOnFinalGyroCalibrationCycle	#
	testb	%al, %al	# D.3621
	je	.L18	#,
.LBB4:
	.loc 2 121 0
	movl	-8(%rbp), %eax	# axis, tmp129
	movslq	%eax, %rdx	# tmp129, tmp128
	movq	%rdx, %rax	# tmp128, tmp130
	salq	$2, %rax	#, tmp130
	addq	%rdx, %rax	# tmp128, tmp130
	salq	$2, %rax	#, tmp131
	addq	$var.3490, %rax	#, D.3622
	movq	%rax, %rdi	# D.3622,
	call	devStandardDeviation	#
	movd	%xmm0, %eax	#, tmp132
	movl	%eax, -4(%rbp)	# tmp132, dev
	.loc 2 123 0
	cmpb	$0, -20(%rbp)	#, gyroMovementCalibrationThreshold
	je	.L19	#,
	.loc 2 123 0 is_stmt 0 discriminator 1
	movzbl	-20(%rbp), %eax	# gyroMovementCalibrationThreshold, D.3623
	pxor	%xmm0, %xmm0	# D.3624
	cvtsi2ss	%eax, %xmm0	# D.3623, D.3624
	movss	-4(%rbp), %xmm1	# dev, tmp133
	ucomiss	%xmm0, %xmm1	# D.3624, tmp133
	jbe	.L19	#,
	.loc 2 124 0 is_stmt 1
	movl	$1000, %edi	#,
	call	gyroSetCalibrationCycles	#
	.loc 2 125 0
	jmp	.L15	#
.L19:
	.loc 2 127 0
	movl	-8(%rbp), %eax	# axis, tmp135
	cltq
	movl	g.3489(,%rax,4), %eax	# g, D.3623
	leal	500(%rax), %ecx	#, D.3623
	movl	$274877907, %edx	#, tmp137
	movl	%ecx, %eax	# D.3623, tmp142
	imull	%edx	# tmp137
	sarl	$6, %edx	#, tmp138
	movl	%ecx, %eax	# D.3623, tmp139
	sarl	$31, %eax	#, tmp139
	subl	%eax, %edx	# tmp139, D.3623
	movl	-8(%rbp), %eax	# axis, tmp141
	cltq
	movl	%edx, gyroZero(,%rax,4)	# D.3623, gyroZero
.L18:
.LBE4:
	.loc 2 104 0 discriminator 2
	addl	$1, -8(%rbp)	#, axis
.L16:
	.loc 2 104 0 is_stmt 0 discriminator 1
	cmpl	$2, -8(%rbp)	#, axis
	jle	.L22	#,
.LBE3:
	.loc 2 131 0 is_stmt 1
	call	isOnFinalGyroCalibrationCycle	#
	testb	%al, %al	# D.3621
	je	.L23	#,
	.loc 2 132 0
	movl	$1, %edi	#,
	call	beeper	#
.L23:
	.loc 2 134 0
	movzwl	calibratingG(%rip), %eax	# calibratingG, D.3625
	subl	$1, %eax	#, D.3625
	movw	%ax, calibratingG(%rip)	# D.3625, calibratingG
.L15:
	.loc 2 135 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	performAcclerationCalibration, .-performAcclerationCalibration
	.section	.text.applyGyroZero,"ax",@progbits
	.type	applyGyroZero, @function
applyGyroZero:
.LFB15:
	.loc 2 138 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
.LBB5:
	.loc 2 139 0
	movl	$0, -4(%rbp)	#, axis
	jmp	.L26	#
.L27:
	.loc 2 140 0 discriminator 3
	movl	-4(%rbp), %eax	# axis, tmp91
	cltq
	movl	gyroADC(,%rax,4), %edx	# gyroADC, D.3626
	movl	-4(%rbp), %eax	# axis, tmp93
	cltq
	movl	gyroZero(,%rax,4), %eax	# gyroZero, D.3626
	subl	%eax, %edx	# D.3626, D.3626
	movl	-4(%rbp), %eax	# axis, tmp95
	cltq
	movl	%edx, gyroADC(,%rax,4)	# D.3626, gyroADC
	.loc 2 139 0 discriminator 3
	addl	$1, -4(%rbp)	#, axis
.L26:
	.loc 2 139 0 is_stmt 0 discriminator 1
	cmpl	$2, -4(%rbp)	#, axis
	jle	.L27	#,
.LBE5:
	.loc 2 142 0 is_stmt 1
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	applyGyroZero, .-applyGyroZero
	.section	.text.gyroUpdate,"ax",@progbits
	.globl	gyroUpdate
	.type	gyroUpdate, @function
gyroUpdate:
.LFB16:
	.loc 2 145 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 2 147 0
	movq	gyro+8(%rip), %rax	# gyro.read, D.3627
	movl	$gyroADCRaw, %edi	#,
	call	*%rax	# D.3627
	xorl	$1, %eax	#, D.3628
	testb	%al, %al	# D.3628
	jne	.L38	#,
.LBB6:
	.loc 2 152 0
	movl	$0, -8(%rbp)	#, axis
	jmp	.L31	#
.L32:
	.loc 2 153 0 discriminator 3
	movl	-8(%rbp), %eax	# axis, tmp111
	cltq
	movzwl	gyroADCRaw(%rax,%rax), %eax	# gyroADCRaw, D.3629
	movswl	%ax, %edx	# D.3629, D.3630
	movl	-8(%rbp), %eax	# axis, tmp113
	cltq
	movl	%edx, gyroADC(,%rax,4)	# D.3630, gyroADC
	.loc 2 152 0 discriminator 3
	addl	$1, -8(%rbp)	#, axis
.L31:
	.loc 2 152 0 is_stmt 0 discriminator 1
	cmpl	$2, -8(%rbp)	#, axis
	jle	.L32	#,
.LBE6:
	.loc 2 156 0 is_stmt 1
	movl	gyroAlign(%rip), %eax	# gyroAlign, D.3631
	movzbl	%al, %eax	# D.3632, D.3630
	movl	%eax, %edx	# D.3630,
	movl	$gyroADC, %esi	#,
	movl	$gyroADC, %edi	#,
	call	alignSensors	#
	.loc 2 158 0
	call	gyroConfig	#
	movzwl	2(%rax), %eax	# _24->soft_gyro_lpf_hz, D.3634
	testw	%ax, %ax	# D.3634
	je	.L33	#,
	.loc 2 159 0
	movzbl	gyroFilterStateIsSet(%rip), %eax	# gyroFilterStateIsSet, D.3628
	xorl	$1, %eax	#, D.3628
	testb	%al, %al	# D.3628
	je	.L34	#,
	.loc 2 160 0
	call	initGyroFilterCoefficients	#
.L34:
.LBB7:
	.loc 2 162 0
	movl	$0, -4(%rbp)	#, axis
	jmp	.L35	#
.L36:
	.loc 2 163 0 discriminator 3
	movl	-4(%rbp), %eax	# axis, tmp115
	movslq	%eax, %rdx	# tmp115, tmp114
	movq	%rdx, %rax	# tmp114, tmp116
	salq	$3, %rax	#, tmp116
	addq	%rdx, %rax	# tmp114, tmp116
	salq	$2, %rax	#, tmp117
	leaq	gyroFilterState(%rax), %rdx	#, D.3635
	movl	-4(%rbp), %eax	# axis, tmp119
	cltq
	movl	gyroADC(,%rax,4), %eax	# gyroADC, D.3630
	pxor	%xmm0, %xmm0	# D.3636
	cvtsi2ss	%eax, %xmm0	# D.3630, D.3636
	movq	%rdx, %rdi	# D.3635,
	call	applyBiQuadFilter	#
	call	lrintf	#
	movl	%eax, %edx	# D.3637, D.3630
	movl	-4(%rbp), %eax	# axis, tmp121
	cltq
	movl	%edx, gyroADC(,%rax,4)	# D.3630, gyroADC
	.loc 2 162 0 discriminator 3
	addl	$1, -4(%rbp)	#, axis
.L35:
	.loc 2 162 0 is_stmt 0 discriminator 1
	cmpl	$2, -4(%rbp)	#, axis
	jle	.L36	#,
.L33:
.LBE7:
	.loc 2 167 0 is_stmt 1
	call	isGyroCalibrationComplete	#
	xorl	$1, %eax	#, D.3628
	testb	%al, %al	# D.3628
	je	.L37	#,
	.loc 2 168 0
	call	gyroConfig	#
	movzbl	(%rax), %eax	# _44->gyroMovementCalibrationThreshold, D.3632
	movzbl	%al, %eax	# D.3632, D.3630
	movl	%eax, %edi	# D.3630,
	call	performAcclerationCalibration	#
.L37:
	.loc 2 171 0
	call	applyGyroZero	#
	jmp	.L28	#
.L38:
	.loc 2 148 0
	nop
.L28:
	.loc 2 172 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	gyroUpdate, .-gyroUpdate
	.section	.bss.g.3489,"aw",@nobits
	.align 8
	.type	g.3489, @object
	.size	g.3489, 12
g.3489:
	.zero	12
	.section	.bss.var.3490,"aw",@nobits
	.align 32
	.type	var.3490, @object
	.size	var.3490, 60
var.3490:
	.zero	60
	.text
.Letext0:
	.file 3 "/usr/include/stdint.h"
	.file 4 "./src/main/common/maths.h"
	.file 5 "./src/main/common/filter.h"
	.file 6 "./src/main/config/parameter_group.h"
	.file 7 "./src/main/drivers/sensor.h"
	.file 8 "./src/main/drivers/accgyro.h"
	.file 9 "./src/main/sensors/sensors.h"
	.file 10 "./src/main/io/beeper.h"
	.file 11 "./src/main/sensors/boardalignment.h"
	.file 12 "./src/main/target/edison/target.h"
	.file 13 "./src/main/drivers/gyro_sync.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9b5
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF141
	.byte	0xc
	.long	.LASF142
	.long	.LASF143
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x25
	.long	0x3b
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
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
	.byte	0x3
	.byte	0x30
	.long	0x66
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF7
	.byte	0x3
	.byte	0x31
	.long	0x78
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.long	.LASF9
	.byte	0x3
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF15
	.uleb128 0x5
	.long	.LASF21
	.byte	0x14
	.byte	0x4
	.byte	0x25
	.long	0xfd
	.uleb128 0x6
	.long	.LASF16
	.byte	0x4
	.byte	0x27
	.long	0xa6
	.byte	0
	.uleb128 0x6
	.long	.LASF17
	.byte	0x4
	.byte	0x27
	.long	0xa6
	.byte	0x4
	.uleb128 0x6
	.long	.LASF18
	.byte	0x4
	.byte	0x27
	.long	0xa6
	.byte	0x8
	.uleb128 0x6
	.long	.LASF19
	.byte	0x4
	.byte	0x27
	.long	0xa6
	.byte	0xc
	.uleb128 0x7
	.string	"m_n"
	.byte	0x4
	.byte	0x28
	.long	0x4d
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF20
	.byte	0x4
	.byte	0x29
	.long	0xb4
	.uleb128 0x5
	.long	.LASF22
	.byte	0x24
	.byte	0x5
	.byte	0x1b
	.long	0x178
	.uleb128 0x7
	.string	"b0"
	.byte	0x5
	.byte	0x1c
	.long	0xa6
	.byte	0
	.uleb128 0x7
	.string	"b1"
	.byte	0x5
	.byte	0x1c
	.long	0xa6
	.byte	0x4
	.uleb128 0x7
	.string	"b2"
	.byte	0x5
	.byte	0x1c
	.long	0xa6
	.byte	0x8
	.uleb128 0x7
	.string	"a1"
	.byte	0x5
	.byte	0x1c
	.long	0xa6
	.byte	0xc
	.uleb128 0x7
	.string	"a2"
	.byte	0x5
	.byte	0x1c
	.long	0xa6
	.byte	0x10
	.uleb128 0x7
	.string	"x1"
	.byte	0x5
	.byte	0x1d
	.long	0xa6
	.byte	0x14
	.uleb128 0x7
	.string	"x2"
	.byte	0x5
	.byte	0x1d
	.long	0xa6
	.byte	0x18
	.uleb128 0x7
	.string	"y1"
	.byte	0x5
	.byte	0x1d
	.long	0xa6
	.byte	0x1c
	.uleb128 0x7
	.string	"y2"
	.byte	0x5
	.byte	0x1d
	.long	0xa6
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	.LASF23
	.byte	0x5
	.byte	0x1e
	.long	0x108
	.uleb128 0x3
	.long	.LASF24
	.byte	0x6
	.byte	0x15
	.long	0x6d
	.uleb128 0x8
	.byte	0x4
	.long	0x8a
	.byte	0x6
	.byte	0x1d
	.long	0x1bd
	.uleb128 0x9
	.long	.LASF25
	.value	0xfff
	.uleb128 0x9
	.long	.LASF26
	.value	0xf000
	.uleb128 0x9
	.long	.LASF27
	.value	0xfff
	.uleb128 0xa
	.long	.LASF28
	.byte	0
	.uleb128 0x9
	.long	.LASF29
	.value	0x8000
	.byte	0
	.uleb128 0x3
	.long	.LASF30
	.byte	0x6
	.byte	0x26
	.long	0x1c8
	.uleb128 0xb
	.long	0x1d8
	.uleb128 0xc
	.long	0x1d8
	.uleb128 0xc
	.long	0x4d
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.uleb128 0xe
	.byte	0x8
	.byte	0x6
	.byte	0x2d
	.long	0x1f8
	.uleb128 0xf
	.string	"ptr"
	.byte	0x6
	.byte	0x2e
	.long	0x1d8
	.uleb128 0xf
	.string	"fn"
	.byte	0x6
	.byte	0x2f
	.long	0x1f8
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x1bd
	.uleb128 0x5
	.long	.LASF31
	.byte	0x20
	.byte	0x6
	.byte	0x28
	.long	0x247
	.uleb128 0x7
	.string	"pgn"
	.byte	0x6
	.byte	0x29
	.long	0x183
	.byte	0
	.uleb128 0x6
	.long	.LASF32
	.byte	0x6
	.byte	0x2a
	.long	0x6d
	.byte	0x2
	.uleb128 0x6
	.long	.LASF33
	.byte	0x6
	.byte	0x2b
	.long	0x247
	.byte	0x8
	.uleb128 0x7
	.string	"ptr"
	.byte	0x6
	.byte	0x2c
	.long	0x24d
	.byte	0x10
	.uleb128 0x6
	.long	.LASF34
	.byte	0x6
	.byte	0x30
	.long	0x1da
	.byte	0x18
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x5b
	.uleb128 0x10
	.byte	0x8
	.long	0x247
	.uleb128 0x3
	.long	.LASF35
	.byte	0x6
	.byte	0x31
	.long	0x1fe
	.uleb128 0x10
	.byte	0x8
	.long	0x264
	.uleb128 0x11
	.long	0x269
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF36
	.uleb128 0x3
	.long	.LASF37
	.byte	0x7
	.byte	0x15
	.long	0x27b
	.uleb128 0x10
	.byte	0x8
	.long	0x281
	.uleb128 0x12
	.long	0x269
	.long	0x290
	.uleb128 0xc
	.long	0x290
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.long	0x30
	.uleb128 0x3
	.long	.LASF38
	.byte	0x7
	.byte	0x19
	.long	0x2a1
	.uleb128 0x10
	.byte	0x8
	.long	0x2a7
	.uleb128 0xb
	.long	0x2b2
	.uleb128 0xc
	.long	0x5b
	.byte	0
	.uleb128 0x3
	.long	.LASF39
	.byte	0x7
	.byte	0x1a
	.long	0x25e
	.uleb128 0x5
	.long	.LASF40
	.byte	0x28
	.byte	0x8
	.byte	0x1e
	.long	0x306
	.uleb128 0x6
	.long	.LASF41
	.byte	0x8
	.byte	0x1f
	.long	0x296
	.byte	0
	.uleb128 0x6
	.long	.LASF42
	.byte	0x8
	.byte	0x20
	.long	0x270
	.byte	0x8
	.uleb128 0x6
	.long	.LASF43
	.byte	0x8
	.byte	0x21
	.long	0x270
	.byte	0x10
	.uleb128 0x6
	.long	.LASF44
	.byte	0x8
	.byte	0x22
	.long	0x2b2
	.byte	0x18
	.uleb128 0x6
	.long	.LASF45
	.byte	0x8
	.byte	0x23
	.long	0xa6
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	.LASF46
	.byte	0x8
	.byte	0x24
	.long	0x2bd
	.uleb128 0x8
	.byte	0x4
	.long	0x8a
	.byte	0x9
	.byte	0x15
	.long	0x336
	.uleb128 0xa
	.long	.LASF47
	.byte	0
	.uleb128 0xa
	.long	.LASF48
	.byte	0x1
	.uleb128 0xa
	.long	.LASF49
	.byte	0x2
	.uleb128 0xa
	.long	.LASF50
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF51
	.byte	0x6
	.byte	0x9
	.byte	0x20
	.long	0x367
	.uleb128 0x6
	.long	.LASF52
	.byte	0x9
	.byte	0x21
	.long	0x30
	.byte	0
	.uleb128 0x6
	.long	.LASF53
	.byte	0x9
	.byte	0x22
	.long	0x30
	.byte	0x2
	.uleb128 0x7
	.string	"yaw"
	.byte	0x9
	.byte	0x23
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF54
	.byte	0x9
	.byte	0x24
	.long	0x336
	.uleb128 0x13
	.long	.LASF144
	.byte	0x6
	.byte	0x9
	.byte	0x26
	.long	0x395
	.uleb128 0xf
	.string	"raw"
	.byte	0x9
	.byte	0x27
	.long	0x395
	.uleb128 0x14
	.long	.LASF55
	.byte	0x9
	.byte	0x28
	.long	0x367
	.byte	0
	.uleb128 0x15
	.long	0x30
	.long	0x3a5
	.uleb128 0x16
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF56
	.byte	0x9
	.byte	0x29
	.long	0x372
	.uleb128 0x8
	.byte	0x4
	.long	0x8a
	.byte	0x9
	.byte	0x39
	.long	0x3f3
	.uleb128 0xa
	.long	.LASF57
	.byte	0
	.uleb128 0xa
	.long	.LASF58
	.byte	0x1
	.uleb128 0xa
	.long	.LASF59
	.byte	0x2
	.uleb128 0xa
	.long	.LASF60
	.byte	0x3
	.uleb128 0xa
	.long	.LASF61
	.byte	0x4
	.uleb128 0xa
	.long	.LASF62
	.byte	0x5
	.uleb128 0xa
	.long	.LASF63
	.byte	0x6
	.uleb128 0xa
	.long	.LASF64
	.byte	0x7
	.uleb128 0xa
	.long	.LASF65
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF66
	.byte	0x9
	.byte	0x43
	.long	0x3b0
	.uleb128 0x5
	.long	.LASF67
	.byte	0xc
	.byte	0x9
	.byte	0x45
	.long	0x42f
	.uleb128 0x6
	.long	.LASF68
	.byte	0x9
	.byte	0x46
	.long	0x3f3
	.byte	0
	.uleb128 0x6
	.long	.LASF69
	.byte	0x9
	.byte	0x47
	.long	0x3f3
	.byte	0x4
	.uleb128 0x6
	.long	.LASF70
	.byte	0x9
	.byte	0x48
	.long	0x3f3
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF71
	.byte	0x9
	.byte	0x49
	.long	0x3fe
	.uleb128 0x5
	.long	.LASF72
	.byte	0x3
	.byte	0x9
	.byte	0x4b
	.long	0x46b
	.uleb128 0x6
	.long	.LASF73
	.byte	0x9
	.byte	0x4c
	.long	0x5b
	.byte	0
	.uleb128 0x6
	.long	.LASF74
	.byte	0x9
	.byte	0x4d
	.long	0x5b
	.byte	0x1
	.uleb128 0x6
	.long	.LASF75
	.byte	0x9
	.byte	0x4e
	.long	0x5b
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF76
	.byte	0x9
	.byte	0x4f
	.long	0x43a
	.uleb128 0x5
	.long	.LASF77
	.byte	0xc
	.byte	0x9
	.byte	0x51
	.long	0x49b
	.uleb128 0x6
	.long	.LASF78
	.byte	0x9
	.byte	0x52
	.long	0x3a5
	.byte	0
	.uleb128 0x6
	.long	.LASF79
	.byte	0x9
	.byte	0x53
	.long	0x3a5
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF80
	.byte	0x9
	.byte	0x54
	.long	0x476
	.uleb128 0x8
	.byte	0x4
	.long	0x8a
	.byte	0xa
	.byte	0x14
	.long	0x519
	.uleb128 0xa
	.long	.LASF81
	.byte	0
	.uleb128 0xa
	.long	.LASF82
	.byte	0x1
	.uleb128 0xa
	.long	.LASF83
	.byte	0x2
	.uleb128 0xa
	.long	.LASF84
	.byte	0x3
	.uleb128 0xa
	.long	.LASF85
	.byte	0x4
	.uleb128 0xa
	.long	.LASF86
	.byte	0x5
	.uleb128 0xa
	.long	.LASF87
	.byte	0x6
	.uleb128 0xa
	.long	.LASF88
	.byte	0x7
	.uleb128 0xa
	.long	.LASF89
	.byte	0x8
	.uleb128 0xa
	.long	.LASF90
	.byte	0x9
	.uleb128 0xa
	.long	.LASF91
	.byte	0xa
	.uleb128 0xa
	.long	.LASF92
	.byte	0xb
	.uleb128 0xa
	.long	.LASF93
	.byte	0xc
	.uleb128 0xa
	.long	.LASF94
	.byte	0xd
	.uleb128 0xa
	.long	.LASF95
	.byte	0xe
	.uleb128 0xa
	.long	.LASF96
	.byte	0xf
	.uleb128 0xa
	.long	.LASF97
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.long	.LASF98
	.byte	0x6
	.byte	0xb
	.byte	0x14
	.long	0x54a
	.uleb128 0x6
	.long	.LASF99
	.byte	0xb
	.byte	0x15
	.long	0x30
	.byte	0
	.uleb128 0x6
	.long	.LASF100
	.byte	0xb
	.byte	0x16
	.long	0x30
	.byte	0x2
	.uleb128 0x6
	.long	.LASF101
	.byte	0xb
	.byte	0x17
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF102
	.byte	0xb
	.byte	0x18
	.long	0x519
	.uleb128 0x5
	.long	.LASF103
	.byte	0x4
	.byte	0x1
	.byte	0x25
	.long	0x586
	.uleb128 0x6
	.long	.LASF104
	.byte	0x1
	.byte	0x26
	.long	0x5b
	.byte	0
	.uleb128 0x6
	.long	.LASF105
	.byte	0x1
	.byte	0x27
	.long	0x5b
	.byte	0x1
	.uleb128 0x6
	.long	.LASF106
	.byte	0x1
	.byte	0x28
	.long	0x6d
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF107
	.byte	0x1
	.byte	0x29
	.long	0x555
	.uleb128 0x17
	.long	.LASF108
	.byte	0x1
	.byte	0x2b
	.long	0x5ae
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.byte	0x8
	.long	0x586
	.uleb128 0x18
	.long	.LASF111
	.byte	0x2
	.byte	0x44
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x5f2
	.uleb128 0x19
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1a
	.long	.LASF114
	.byte	0x2
	.byte	0x48
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF116
	.byte	0x2
	.byte	0x4f
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x61e
	.uleb128 0x1c
	.long	.LASF113
	.byte	0x2
	.byte	0x4f
	.long	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.long	.LASF145
	.byte	0x2
	.byte	0x54
	.long	0x269
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	.LASF109
	.byte	0x2
	.byte	0x59
	.long	0x269
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	.LASF110
	.byte	0x2
	.byte	0x5e
	.long	0x269
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF112
	.byte	0x2
	.byte	0x63
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x709
	.uleb128 0x1c
	.long	.LASF104
	.byte	0x2
	.byte	0x63
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.string	"g"
	.byte	0x2
	.byte	0x65
	.long	0x709
	.uleb128 0x9
	.byte	0x3
	.quad	g.3489
	.uleb128 0x1e
	.string	"var"
	.byte	0x2
	.byte	0x66
	.long	0x719
	.uleb128 0x9
	.byte	0x3
	.quad	var.3490
	.uleb128 0x19
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x1a
	.long	.LASF114
	.byte	0x2
	.byte	0x68
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1e
	.string	"dev"
	.byte	0x2
	.byte	0x79
	.long	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x42
	.long	0x719
	.uleb128 0x16
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x15
	.long	0xfd
	.long	0x729
	.uleb128 0x16
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x1f
	.long	.LASF115
	.byte	0x2
	.byte	0x89
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x767
	.uleb128 0x19
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1a
	.long	.LASF114
	.byte	0x2
	.byte	0x8b
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF117
	.byte	0x2
	.byte	0x90
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x7c9
	.uleb128 0x21
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x7a8
	.uleb128 0x1a
	.long	.LASF114
	.byte	0x2
	.byte	0x98
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x1a
	.long	.LASF114
	.byte	0x2
	.byte	0xa2
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF118
	.byte	0x2
	.byte	0x34
	.long	0x6d
	.uleb128 0x9
	.byte	0x3
	.quad	calibratingG
	.uleb128 0x1a
	.long	.LASF119
	.byte	0x2
	.byte	0x35
	.long	0x395
	.uleb128 0x9
	.byte	0x3
	.quad	gyroADCRaw
	.uleb128 0x1a
	.long	.LASF120
	.byte	0x2
	.byte	0x36
	.long	0x709
	.uleb128 0x9
	.byte	0x3
	.quad	gyroZero
	.uleb128 0x15
	.long	0x178
	.long	0x818
	.uleb128 0x16
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF121
	.byte	0x2
	.byte	0x38
	.long	0x808
	.uleb128 0x9
	.byte	0x3
	.quad	gyroFilterState
	.uleb128 0x1a
	.long	.LASF122
	.byte	0x2
	.byte	0x39
	.long	0x269
	.uleb128 0x9
	.byte	0x3
	.quad	gyroFilterStateIsSet
	.uleb128 0x22
	.long	.LASF123
	.byte	0xc
	.byte	0xc8
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x22
	.long	.LASF124
	.byte	0xc
	.byte	0xc9
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x22
	.long	.LASF125
	.byte	0xc
	.byte	0xca
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x22
	.long	.LASF126
	.byte	0x6
	.byte	0x43
	.long	0x896
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x10
	.byte	0x8
	.long	0x253
	.uleb128 0x22
	.long	.LASF127
	.byte	0x6
	.byte	0x44
	.long	0x896
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x22
	.long	.LASF128
	.byte	0x6
	.byte	0x47
	.long	0x247
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x22
	.long	.LASF129
	.byte	0x6
	.byte	0x48
	.long	0x247
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x23
	.long	.LASF130
	.byte	0xd
	.byte	0x14
	.long	0x7f
	.uleb128 0x22
	.long	.LASF131
	.byte	0x9
	.byte	0x56
	.long	0x46b
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x22
	.long	.LASF132
	.byte	0x9
	.byte	0x57
	.long	0x42f
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x22
	.long	.LASF133
	.byte	0x9
	.byte	0x58
	.long	0x49b
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0x22
	.long	.LASF134
	.byte	0xb
	.byte	0x1a
	.long	0x54a
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_System
	.uleb128 0x23
	.long	.LASF135
	.byte	0x2
	.byte	0x2e
	.long	0x306
	.uleb128 0x22
	.long	.LASF136
	.byte	0x2
	.byte	0x2f
	.long	0x3f3
	.uleb128 0x9
	.byte	0x3
	.quad	gyroAlign
	.uleb128 0x22
	.long	.LASF137
	.byte	0x2
	.byte	0x31
	.long	0x709
	.uleb128 0x9
	.byte	0x3
	.quad	gyroADC
	.uleb128 0x22
	.long	.LASF138
	.byte	0x2
	.byte	0x3b
	.long	0x586
	.uleb128 0x9
	.byte	0x3
	.quad	gyroConfig_System
	.uleb128 0x22
	.long	.LASF139
	.byte	0x2
	.byte	0x3d
	.long	0x999
	.uleb128 0x9
	.byte	0x3
	.quad	pgResetTemplate_gyroConfig
	.uleb128 0x24
	.long	0x586
	.uleb128 0x22
	.long	.LASF140
	.byte	0x2
	.byte	0x3b
	.long	0x9b3
	.uleb128 0x9
	.byte	0x3
	.quad	gyroConfig_Registry
	.uleb128 0x24
	.long	0x253
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x14
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x2117
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
	.uleb128 0x21
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
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0xac
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF45:
	.string	"scale"
.LASF88:
	.string	"BEEPER_BAT_CRIT_LOW"
.LASF34:
	.string	"reset"
.LASF64:
	.string	"CW180_DEG_FLIP"
.LASF51:
	.string	"int16_flightDynamicsTrims_s"
.LASF30:
	.string	"pgResetFunc"
.LASF49:
	.string	"SENSOR_INDEX_BARO"
.LASF77:
	.string	"sensorTrims_s"
.LASF80:
	.string	"sensorTrims_t"
.LASF117:
	.string	"gyroUpdate"
.LASF25:
	.string	"PGR_PGN_MASK"
.LASF41:
	.string	"init"
.LASF129:
	.string	"__pg_resetdata_end"
.LASF63:
	.string	"CW90_DEG_FLIP"
.LASF57:
	.string	"ALIGN_DEFAULT"
.LASF66:
	.string	"sensor_align_e"
.LASF55:
	.string	"values"
.LASF54:
	.string	"flightDynamicsTrims_def_t"
.LASF125:
	.string	"U_ID_2"
.LASF83:
	.string	"BEEPER_RX_LOST_LANDING"
.LASF2:
	.string	"int16_t"
.LASF44:
	.string	"isDataReady"
.LASF0:
	.string	"signed char"
.LASF47:
	.string	"SENSOR_INDEX_GYRO"
.LASF29:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF121:
	.string	"gyroFilterState"
.LASF81:
	.string	"BEEPER_SILENCE"
.LASF4:
	.string	"long int"
.LASF139:
	.string	"pgResetTemplate_gyroConfig"
.LASF111:
	.string	"initGyroFilterCoefficients"
.LASF59:
	.string	"CW90_DEG"
.LASF28:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF134:
	.string	"boardAlignment_System"
.LASF7:
	.string	"uint16_t"
.LASF15:
	.string	"double"
.LASF119:
	.string	"gyroADCRaw"
.LASF43:
	.string	"temperature"
.LASF144:
	.string	"flightDynamicsTrims_u"
.LASF85:
	.string	"BEEPER_DISARMING"
.LASF78:
	.string	"accZero"
.LASF101:
	.string	"yawDegrees"
.LASF98:
	.string	"boardAlignment_s"
.LASF102:
	.string	"boardAlignment_t"
.LASF84:
	.string	"BEEPER_RX_LOST"
.LASF73:
	.string	"acc_hardware"
.LASF131:
	.string	"sensorSelectionConfig_System"
.LASF10:
	.string	"unsigned int"
.LASF69:
	.string	"acc_align"
.LASF141:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF24:
	.string	"pgn_t"
.LASF11:
	.string	"long unsigned int"
.LASF86:
	.string	"BEEPER_ARMING"
.LASF138:
	.string	"gyroConfig_System"
.LASF32:
	.string	"size"
.LASF8:
	.string	"short unsigned int"
.LASF35:
	.string	"pgRegistry_t"
.LASF90:
	.string	"BEEPER_GPS_STATUS"
.LASF114:
	.string	"axis"
.LASF58:
	.string	"CW0_DEG"
.LASF105:
	.string	"gyro_lpf"
.LASF50:
	.string	"SENSOR_INDEX_MAG"
.LASF75:
	.string	"baro_hardware"
.LASF128:
	.string	"__pg_resetdata_start"
.LASF127:
	.string	"__pg_registry_end"
.LASF135:
	.string	"gyro"
.LASF40:
	.string	"gyro_s"
.LASF46:
	.string	"gyro_t"
.LASF12:
	.string	"sizetype"
.LASF145:
	.string	"isGyroCalibrationComplete"
.LASF112:
	.string	"performAcclerationCalibration"
.LASF33:
	.string	"address"
.LASF95:
	.string	"BEEPER_READY_BEEP"
.LASF120:
	.string	"gyroZero"
.LASF140:
	.string	"gyroConfig_Registry"
.LASF53:
	.string	"pitch"
.LASF122:
	.string	"gyroFilterStateIsSet"
.LASF109:
	.string	"isOnFinalGyroCalibrationCycle"
.LASF27:
	.string	"PGR_SIZE_MASK"
.LASF38:
	.string	"sensorGyroInitFuncPtr"
.LASF126:
	.string	"__pg_registry_start"
.LASF21:
	.string	"stdev_s"
.LASF20:
	.string	"stdev_t"
.LASF52:
	.string	"roll"
.LASF123:
	.string	"U_ID_0"
.LASF124:
	.string	"U_ID_1"
.LASF143:
	.string	"/home/aravind/git/cleanflight"
.LASF14:
	.string	"float"
.LASF72:
	.string	"sensorSelectionConfig_s"
.LASF74:
	.string	"mag_hardware"
.LASF60:
	.string	"CW180_DEG"
.LASF36:
	.string	"_Bool"
.LASF3:
	.string	"int32_t"
.LASF6:
	.string	"unsigned char"
.LASF103:
	.string	"gyroConfig_s"
.LASF107:
	.string	"gyroConfig_t"
.LASF87:
	.string	"BEEPER_ARMING_GPS_FIX"
.LASF1:
	.string	"short int"
.LASF104:
	.string	"gyroMovementCalibrationThreshold"
.LASF62:
	.string	"CW0_DEG_FLIP"
.LASF56:
	.string	"flightDynamicsTrims_t"
.LASF137:
	.string	"gyroADC"
.LASF89:
	.string	"BEEPER_BAT_LOW"
.LASF79:
	.string	"magZero"
.LASF68:
	.string	"gyro_align"
.LASF9:
	.string	"uint32_t"
.LASF61:
	.string	"CW270_DEG"
.LASF31:
	.string	"pgRegistry_s"
.LASF130:
	.string	"targetLooptime"
.LASF42:
	.string	"read"
.LASF13:
	.string	"char"
.LASF142:
	.string	"src/main/sensors/gyro.c"
.LASF91:
	.string	"BEEPER_RX_SET"
.LASF94:
	.string	"BEEPER_ACC_CALIBRATION_FAIL"
.LASF22:
	.string	"biquad_s"
.LASF23:
	.string	"biquad_t"
.LASF96:
	.string	"BEEPER_MULTI_BEEPS"
.LASF116:
	.string	"gyroSetCalibrationCycles"
.LASF106:
	.string	"soft_gyro_lpf_hz"
.LASF133:
	.string	"sensorTrims_System"
.LASF118:
	.string	"calibratingG"
.LASF97:
	.string	"BEEPER_ARMED"
.LASF99:
	.string	"rollDegrees"
.LASF17:
	.string	"m_newM"
.LASF39:
	.string	"sensorIsDataReadyFuncPtr"
.LASF26:
	.string	"PGR_PGN_VERSION_MASK"
.LASF19:
	.string	"m_newS"
.LASF92:
	.string	"BEEPER_DISARM_REPEAT"
.LASF67:
	.string	"sensorAlignmentConfig_s"
.LASF71:
	.string	"sensorAlignmentConfig_t"
.LASF82:
	.string	"BEEPER_GYRO_CALIBRATED"
.LASF136:
	.string	"gyroAlign"
.LASF48:
	.string	"SENSOR_INDEX_ACC"
.LASF113:
	.string	"calibrationCyclesRequired"
.LASF115:
	.string	"applyGyroZero"
.LASF5:
	.string	"uint8_t"
.LASF70:
	.string	"mag_align"
.LASF132:
	.string	"sensorAlignmentConfig_System"
.LASF110:
	.string	"isOnFirstGyroCalibrationCycle"
.LASF93:
	.string	"BEEPER_ACC_CALIBRATION"
.LASF16:
	.string	"m_oldM"
.LASF65:
	.string	"CW270_DEG_FLIP"
.LASF100:
	.string	"pitchDegrees"
.LASF18:
	.string	"m_oldS"
.LASF76:
	.string	"sensorSelectionConfig_t"
.LASF108:
	.string	"gyroConfig"
.LASF37:
	.string	"sensorReadFuncPtr"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
