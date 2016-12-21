	.file	"cleanflight_fc.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed cleanflight_fc.i -mtune=generic
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
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.section	.text.sensorTrims,"ax",@progbits
	.type	sensorTrims, @function
sensorTrims:
.LFB10:
	.file 1 "./src/main/sensors/sensors.h"
	.loc 1 88 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 88 0
	movl	$sensorTrims_System, %eax	#, D.4809
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	sensorTrims, .-sensorTrims
	.section	.text.accelerometerConfig,"ax",@progbits
	.type	accelerometerConfig, @function
accelerometerConfig:
.LFB12:
	.file 2 "./src/main/sensors/acceleration.h"
	.loc 2 67 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 67 0
	movq	accelerometerConfig_ProfileCurrent(%rip), %rax	# accelerometerConfig_ProfileCurrent, D.4810
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	accelerometerConfig, .-accelerometerConfig
	.comm	imuConfig_System,12,8
	.section	.text.imuConfig,"ax",@progbits
	.type	imuConfig, @function
imuConfig:
.LFB13:
	.file 3 "./src/main/flight/imu.h"
	.loc 3 55 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 3 55 0
	movl	$imuConfig_System, %eax	#, D.4811
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	imuConfig, .-imuConfig
	.globl	cycleTime
	.section	.bss.cycleTime,"aw",@nobits
	.align 2
	.type	cycleTime, @object
	.size	cycleTime, 2
cycleTime:
	.zero	2
	.comm	dT,4,4
	.comm	magHold,2,2
	.comm	headFreeModeHold,2,2
	.globl	motorControlEnable
	.section	.bss.motorControlEnable,"aw",@nobits
	.type	motorControlEnable, @object
	.size	motorControlEnable, 1
motorControlEnable:
	.zero	1
	.comm	telemTemperature1,2,2
	.section	.bss.disarmAt,"aw",@nobits
	.align 4
	.type	disarmAt, @object
	.size	disarmAt, 4
disarmAt:
	.zero	4
	.section	.bss.isRXDataNew,"aw",@nobits
	.type	isRXDataNew, @object
	.size	isRXDataNew, 1
isRXDataNew:
	.zero	1
	.globl	gyro_initialized
	.section	.bss.gyro_initialized,"aw",@nobits
	.type	gyro_initialized, @object
	.size	gyro_initialized, 1
gyro_initialized:
	.zero	1
	.section	.bss.filteredCycleTimeState,"aw",@nobits
	.align 8
	.type	filteredCycleTimeState, @object
	.size	filteredCycleTimeState, 12
filteredCycleTimeState:
	.zero	12
	.comm	filteredCycleTime,2,2
	.globl	i
	.section	.bss.i,"aw",@nobits
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	AccInflightCalibrationArmed
	.section	.bss.AccInflightCalibrationArmed,"aw",@nobits
	.type	AccInflightCalibrationArmed, @object
	.size	AccInflightCalibrationArmed, 1
AccInflightCalibrationArmed:
	.zero	1
	.globl	AccInflightCalibrationMeasurementDone
	.section	.bss.AccInflightCalibrationMeasurementDone,"aw",@nobits
	.type	AccInflightCalibrationMeasurementDone, @object
	.size	AccInflightCalibrationMeasurementDone, 1
AccInflightCalibrationMeasurementDone:
	.zero	1
	.globl	AccInflightCalibrationSavetoEEProm
	.section	.bss.AccInflightCalibrationSavetoEEProm,"aw",@nobits
	.type	AccInflightCalibrationSavetoEEProm, @object
	.size	AccInflightCalibrationSavetoEEProm, 1
AccInflightCalibrationSavetoEEProm:
	.zero	1
	.globl	AccInflightCalibrationActive
	.section	.bss.AccInflightCalibrationActive,"aw",@nobits
	.type	AccInflightCalibrationActive, @object
	.size	AccInflightCalibrationActive, 1
AccInflightCalibrationActive:
	.zero	1
	.globl	InflightcalibratingA
	.section	.bss.InflightcalibratingA,"aw",@nobits
	.align 2
	.type	InflightcalibratingA, @object
	.size	InflightcalibratingA, 2
InflightcalibratingA:
	.zero	2
	.section	.text.taskHandleSerial,"ax",@progbits
	.globl	taskHandleSerial
	.type	taskHandleSerial, @function
taskHandleSerial:
.LFB15:
	.file 4 "src/main/fc/cleanflight_fc.c"
	.loc 4 152 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 4 162 0
	movl	$0, %eax	#,
	call	mspSerialProcess	#
	.loc 4 163 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	taskHandleSerial, .-taskHandleSerial
	.section	.text.taskUpdateCompass,"ax",@progbits
	.globl	taskUpdateCompass
	.type	taskUpdateCompass, @function
taskUpdateCompass:
.LFB16:
	.loc 4 168 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 4 169 0
	call	sensorTrims	#
	addq	$6, %rax	#, D.4813
	movq	%rax, %rdi	# D.4813,
	call	updateCompass	#
	.loc 4 170 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	taskUpdateCompass, .-taskUpdateCompass
	.section	.text.taskUpdateAccelerometer,"ax",@progbits
	.globl	taskUpdateAccelerometer
	.type	taskUpdateAccelerometer, @function
taskUpdateAccelerometer:
.LFB17:
	.loc 4 174 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 4 175 0
	call	accelerometerConfig	#
	movq	%rax, %rdi	# D.4815,
	call	imuUpdateAccelerometer	#
	.loc 4 176 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	taskUpdateAccelerometer, .-taskUpdateAccelerometer
	.section	.text.taskMainPidLoopChecker,"ax",@progbits
	.globl	taskMainPidLoopChecker
	.type	taskMainPidLoopChecker, @function
taskMainPidLoopChecker:
.LFB18:
	.loc 4 179 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 3, -24
	.loc 4 182 0
	movzbl	gyro_initialized(%rip), %eax	# gyro_initialized, D.4816
	xorl	$1, %eax	#, D.4816
	testb	%al, %al	# D.4816
	je	.L11	#,
	.loc 4 184 0
	call	imuConfig	#
	movb	$1, 2(%rax)	#, _8->gyroSync
	.loc 4 185 0
	movb	$1, gyro_initialized(%rip)	#, gyro_initialized
.L11:
	.loc 4 187 0
	movl	$-1, %edi	#,
	call	getTaskDeltaTime	#
	movl	%eax, -20(%rbp)	# tmp102, currentDeltaTime
	.loc 4 189 0
	call	imuConfig	#
	movzbl	2(%rax), %eax	# _14->gyroSync, D.4818
	testb	%al, %al	# D.4818
	je	.L14	#,
.L13:
	.loc 4 191 0
	call	gyroSyncCheckUpdate	#
	testb	%al, %al	# D.4816
	jne	.L14	#,
	.loc 4 191 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %ebx	# currentDeltaTime, D.4819
	call	micros	#
	movl	currentTime(%rip), %edx	# currentTime, D.4820
	movl	%edx, %edx	# D.4820, D.4819
	subq	%rdx, %rax	# D.4819, D.4819
	leaq	(%rbx,%rax), %rdx	#, D.4819
	movl	targetLooptime(%rip), %eax	# targetLooptime, D.4820
	addl	$100, %eax	#, D.4820
	movl	%eax, %eax	# D.4820, D.4819
	cmpq	%rax, %rdx	# D.4819, D.4819
	jnb	.L14	#,
	.loc 4 194 0 is_stmt 1
	jmp	.L13	#
.L14:
	.loc 4 198 0
	nop
	addq	$24, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	taskMainPidLoopChecker, .-taskMainPidLoopChecker
	.section	.text.taskMainPidLoop,"ax",@progbits
	.globl	taskMainPidLoop
	.type	taskMainPidLoop, @function
taskMainPidLoop:
.LFB19:
	.loc 4 203 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 4 204 0
	movl	$-1, %edi	#,
	call	getTaskDeltaTime	#
	movw	%ax, cycleTime(%rip)	# D.4822, cycleTime
	.loc 4 205 0
	movzwl	cycleTime(%rip), %eax	# cycleTime, D.4822
	movzwl	%ax, %eax	# D.4822, tmp97
	pxor	%xmm0, %xmm0	# D.4823
	cvtsi2ss	%eax, %xmm0	# tmp97, D.4823
	movss	.LC0(%rip), %xmm1	#, tmp98
	mulss	%xmm1, %xmm0	# tmp98, D.4823
	movss	%xmm0, dT(%rip)	# D.4823, dT
	.loc 4 208 0
	movss	dT(%rip), %xmm1	# dT, D.4823
	movzwl	cycleTime(%rip), %eax	# cycleTime, D.4822
	movzwl	%ax, %eax	# D.4822, tmp99
	pxor	%xmm0, %xmm0	# D.4823
	cvtsi2ss	%eax, %xmm0	# tmp99, D.4823
	movl	$1, %esi	#,
	movl	$filteredCycleTimeState, %edi	#,
	call	pt1FilterApply4	#
	cvttss2si	%xmm0, %eax	# D.4823, tmp100
	movw	%ax, filteredCycleTime(%rip)	# D.4822, filteredCycleTime
	.loc 4 210 0
	call	imuUpdateGyroAndAttitude	#
	.loc 4 263 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	taskMainPidLoop, .-taskMainPidLoop
	.section	.rodata
	.align 4
.LC0:
	.long	897988541
	.text
.Letext0:
	.file 5 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 6 "/usr/include/stdint.h"
	.file 7 "./src/main/common/filter.h"
	.file 8 "./src/main/config/parameter_group.h"
	.file 9 "./src/main/common/color.h"
	.file 10 "./src/main/sensors/compass.h"
	.file 11 "./src/main/target/edison/target.h"
	.file 12 "./src/main/drivers/gyro_sync.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x88f
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF134
	.byte	0xc
	.long	.LASF135
	.long	.LASF136
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF11
	.byte	0x5
	.byte	0xc3
	.long	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF12
	.byte	0x6
	.byte	0x30
	.long	0x3e
	.uleb128 0x5
	.long	.LASF13
	.byte	0x6
	.byte	0x31
	.long	0x45
	.uleb128 0x5
	.long	.LASF14
	.byte	0x6
	.byte	0x33
	.long	0x37
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF15
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF16
	.uleb128 0x6
	.byte	0x4
	.long	0x37
	.byte	0x9
	.byte	0x15
	.long	0xd8
	.uleb128 0x7
	.long	.LASF17
	.byte	0
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.uleb128 0x7
	.long	.LASF19
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.long	.LASF24
	.byte	0xc
	.byte	0x7
	.byte	0x14
	.long	0x107
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.byte	0x15
	.long	0xab
	.byte	0
	.uleb128 0xa
	.string	"RC"
	.byte	0x7
	.byte	0x16
	.long	0xab
	.byte	0x4
	.uleb128 0xa
	.string	"dT"
	.byte	0x7
	.byte	0x17
	.long	0xab
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	.LASF21
	.byte	0x7
	.byte	0x18
	.long	0xd8
	.uleb128 0xb
	.byte	0x8
	.long	0x8a
	.uleb128 0x5
	.long	.LASF22
	.byte	0x8
	.byte	0x15
	.long	0x95
	.uleb128 0x5
	.long	.LASF23
	.byte	0x8
	.byte	0x26
	.long	0x12e
	.uleb128 0xc
	.long	0x13e
	.uleb128 0xd
	.long	0x68
	.uleb128 0xd
	.long	0x30
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.byte	0x8
	.byte	0x2d
	.long	0x15c
	.uleb128 0xf
	.string	"ptr"
	.byte	0x8
	.byte	0x2e
	.long	0x68
	.uleb128 0xf
	.string	"fn"
	.byte	0x8
	.byte	0x2f
	.long	0x15c
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x123
	.uleb128 0x8
	.long	.LASF25
	.byte	0x20
	.byte	0x8
	.byte	0x28
	.long	0x1ab
	.uleb128 0xa
	.string	"pgn"
	.byte	0x8
	.byte	0x29
	.long	0x118
	.byte	0
	.uleb128 0x9
	.long	.LASF26
	.byte	0x8
	.byte	0x2a
	.long	0x95
	.byte	0x2
	.uleb128 0x9
	.long	.LASF27
	.byte	0x8
	.byte	0x2b
	.long	0x112
	.byte	0x8
	.uleb128 0xa
	.string	"ptr"
	.byte	0x8
	.byte	0x2c
	.long	0x1ab
	.byte	0x10
	.uleb128 0x9
	.long	.LASF28
	.byte	0x8
	.byte	0x30
	.long	0x13e
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x112
	.uleb128 0x5
	.long	.LASF29
	.byte	0x8
	.byte	0x31
	.long	0x162
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF30
	.uleb128 0x6
	.byte	0x4
	.long	0x37
	.byte	0x1
	.byte	0x15
	.long	0x1e8
	.uleb128 0x7
	.long	.LASF31
	.byte	0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x1
	.uleb128 0x7
	.long	.LASF33
	.byte	0x2
	.uleb128 0x7
	.long	.LASF34
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.long	.LASF35
	.byte	0x6
	.byte	0x1
	.byte	0x20
	.long	0x219
	.uleb128 0x9
	.long	.LASF36
	.byte	0x1
	.byte	0x21
	.long	0x78
	.byte	0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x1
	.byte	0x22
	.long	0x78
	.byte	0x2
	.uleb128 0xa
	.string	"yaw"
	.byte	0x1
	.byte	0x23
	.long	0x78
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.long	.LASF38
	.byte	0x1
	.byte	0x24
	.long	0x1e8
	.uleb128 0x10
	.long	.LASF70
	.byte	0x6
	.byte	0x1
	.byte	0x26
	.long	0x247
	.uleb128 0xf
	.string	"raw"
	.byte	0x1
	.byte	0x27
	.long	0x247
	.uleb128 0x11
	.long	.LASF39
	.byte	0x1
	.byte	0x28
	.long	0x219
	.byte	0
	.uleb128 0x12
	.long	0x78
	.long	0x257
	.uleb128 0x13
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.long	.LASF40
	.byte	0x1
	.byte	0x29
	.long	0x224
	.uleb128 0x6
	.byte	0x4
	.long	0x37
	.byte	0x1
	.byte	0x39
	.long	0x2a5
	.uleb128 0x7
	.long	.LASF41
	.byte	0
	.uleb128 0x7
	.long	.LASF42
	.byte	0x1
	.uleb128 0x7
	.long	.LASF43
	.byte	0x2
	.uleb128 0x7
	.long	.LASF44
	.byte	0x3
	.uleb128 0x7
	.long	.LASF45
	.byte	0x4
	.uleb128 0x7
	.long	.LASF46
	.byte	0x5
	.uleb128 0x7
	.long	.LASF47
	.byte	0x6
	.uleb128 0x7
	.long	.LASF48
	.byte	0x7
	.uleb128 0x7
	.long	.LASF49
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	.LASF50
	.byte	0x1
	.byte	0x43
	.long	0x262
	.uleb128 0x8
	.long	.LASF51
	.byte	0xc
	.byte	0x1
	.byte	0x45
	.long	0x2e1
	.uleb128 0x9
	.long	.LASF52
	.byte	0x1
	.byte	0x46
	.long	0x2a5
	.byte	0
	.uleb128 0x9
	.long	.LASF53
	.byte	0x1
	.byte	0x47
	.long	0x2a5
	.byte	0x4
	.uleb128 0x9
	.long	.LASF54
	.byte	0x1
	.byte	0x48
	.long	0x2a5
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	.LASF55
	.byte	0x1
	.byte	0x49
	.long	0x2b0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x3
	.byte	0x1
	.byte	0x4b
	.long	0x31d
	.uleb128 0x9
	.long	.LASF57
	.byte	0x1
	.byte	0x4c
	.long	0x8a
	.byte	0
	.uleb128 0x9
	.long	.LASF58
	.byte	0x1
	.byte	0x4d
	.long	0x8a
	.byte	0x1
	.uleb128 0x9
	.long	.LASF59
	.byte	0x1
	.byte	0x4e
	.long	0x8a
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.long	.LASF60
	.byte	0x1
	.byte	0x4f
	.long	0x2ec
	.uleb128 0x8
	.long	.LASF61
	.byte	0xc
	.byte	0x1
	.byte	0x51
	.long	0x34d
	.uleb128 0x9
	.long	.LASF62
	.byte	0x1
	.byte	0x52
	.long	0x257
	.byte	0
	.uleb128 0x9
	.long	.LASF63
	.byte	0x1
	.byte	0x53
	.long	0x257
	.byte	0x6
	.byte	0
	.uleb128 0x5
	.long	.LASF64
	.byte	0x1
	.byte	0x54
	.long	0x328
	.uleb128 0x8
	.long	.LASF65
	.byte	0x2
	.byte	0xa
	.byte	0x20
	.long	0x371
	.uleb128 0x9
	.long	.LASF66
	.byte	0xa
	.byte	0x21
	.long	0x78
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	.LASF67
	.byte	0xa
	.byte	0x23
	.long	0x358
	.uleb128 0x8
	.long	.LASF68
	.byte	0x4
	.byte	0x2
	.byte	0x2a
	.long	0x3a1
	.uleb128 0x9
	.long	.LASF36
	.byte	0x2
	.byte	0x2b
	.long	0x78
	.byte	0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x2
	.byte	0x2c
	.long	0x78
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.long	.LASF69
	.byte	0x2
	.byte	0x2d
	.long	0x37c
	.uleb128 0x10
	.long	.LASF71
	.byte	0x4
	.byte	0x2
	.byte	0x2f
	.long	0x3cf
	.uleb128 0xf
	.string	"raw"
	.byte	0x2
	.byte	0x30
	.long	0x3cf
	.uleb128 0x11
	.long	.LASF39
	.byte	0x2
	.byte	0x31
	.long	0x3a1
	.byte	0
	.uleb128 0x12
	.long	0x78
	.long	0x3df
	.uleb128 0x13
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.long	.LASF72
	.byte	0x2
	.byte	0x32
	.long	0x3ac
	.uleb128 0x8
	.long	.LASF73
	.byte	0x2
	.byte	0x2
	.byte	0x34
	.long	0x40c
	.uleb128 0xa
	.string	"xy"
	.byte	0x2
	.byte	0x35
	.long	0x8a
	.byte	0
	.uleb128 0xa
	.string	"z"
	.byte	0x2
	.byte	0x36
	.long	0x8a
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.long	.LASF74
	.byte	0x2
	.byte	0x37
	.long	0x3ea
	.uleb128 0x8
	.long	.LASF75
	.byte	0x10
	.byte	0x2
	.byte	0x39
	.long	0x460
	.uleb128 0x9
	.long	.LASF76
	.byte	0x2
	.byte	0x3a
	.long	0x3df
	.byte	0
	.uleb128 0x9
	.long	.LASF77
	.byte	0x2
	.byte	0x3d
	.long	0x8a
	.byte	0x4
	.uleb128 0x9
	.long	.LASF78
	.byte	0x2
	.byte	0x3e
	.long	0xab
	.byte	0x8
	.uleb128 0x9
	.long	.LASF79
	.byte	0x2
	.byte	0x3f
	.long	0x40c
	.byte	0xc
	.uleb128 0x9
	.long	.LASF80
	.byte	0x2
	.byte	0x40
	.long	0x8a
	.byte	0xe
	.byte	0
	.uleb128 0x5
	.long	.LASF81
	.byte	0x2
	.byte	0x41
	.long	0x417
	.uleb128 0x8
	.long	.LASF82
	.byte	0xc
	.byte	0x3
	.byte	0x2c
	.long	0x4cc
	.uleb128 0x9
	.long	.LASF83
	.byte	0x3
	.byte	0x2e
	.long	0x95
	.byte	0
	.uleb128 0x9
	.long	.LASF84
	.byte	0x3
	.byte	0x2f
	.long	0x8a
	.byte	0x2
	.uleb128 0x9
	.long	.LASF85
	.byte	0x3
	.byte	0x30
	.long	0x8a
	.byte	0x3
	.uleb128 0x9
	.long	.LASF86
	.byte	0x3
	.byte	0x31
	.long	0x95
	.byte	0x4
	.uleb128 0x9
	.long	.LASF87
	.byte	0x3
	.byte	0x32
	.long	0x95
	.byte	0x6
	.uleb128 0x9
	.long	.LASF88
	.byte	0x3
	.byte	0x33
	.long	0x8a
	.byte	0x8
	.uleb128 0x9
	.long	.LASF89
	.byte	0x3
	.byte	0x34
	.long	0x95
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.long	.LASF90
	.byte	0x3
	.byte	0x35
	.long	0x46b
	.uleb128 0x8
	.long	.LASF91
	.byte	0x4
	.byte	0x3
	.byte	0x39
	.long	0x4fc
	.uleb128 0x9
	.long	.LASF92
	.byte	0x3
	.byte	0x3a
	.long	0x95
	.byte	0
	.uleb128 0x9
	.long	.LASF93
	.byte	0x3
	.byte	0x3b
	.long	0x8a
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.long	.LASF94
	.byte	0x3
	.byte	0x3c
	.long	0x4d7
	.uleb128 0x14
	.long	.LASF95
	.byte	0x1
	.byte	0x58
	.long	0x524
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.byte	0x8
	.long	0x34d
	.uleb128 0x14
	.long	.LASF96
	.byte	0x2
	.byte	0x43
	.long	0x547
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.byte	0x8
	.long	0x460
	.uleb128 0x14
	.long	.LASF97
	.byte	0x3
	.byte	0x37
	.long	0x56a
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.byte	0x8
	.long	0x4cc
	.uleb128 0x15
	.long	.LASF98
	.byte	0x4
	.byte	0x97
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF99
	.byte	0x4
	.byte	0xa7
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF100
	.byte	0x4
	.byte	0xad
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.long	.LASF137
	.byte	0x4
	.byte	0xb2
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e7
	.uleb128 0x17
	.long	.LASF102
	.byte	0x4
	.byte	0xbb
	.long	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x15
	.long	.LASF101
	.byte	0x4
	.byte	0xca
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	.LASF103
	.byte	0x4
	.byte	0x81
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	disarmAt
	.uleb128 0x17
	.long	.LASF104
	.byte	0x4
	.byte	0x87
	.long	0x1bc
	.uleb128 0x9
	.byte	0x3
	.quad	isRXDataNew
	.uleb128 0x17
	.long	.LASF105
	.byte	0x4
	.byte	0x8a
	.long	0x107
	.uleb128 0x9
	.byte	0x3
	.quad	filteredCycleTimeState
	.uleb128 0x18
	.long	.LASF106
	.byte	0xb
	.byte	0xc8
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x18
	.long	.LASF107
	.byte	0xb
	.byte	0xc9
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x18
	.long	.LASF108
	.byte	0xb
	.byte	0xca
	.long	0xa0
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x18
	.long	.LASF109
	.byte	0x8
	.byte	0x43
	.long	0x693
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xb
	.byte	0x8
	.long	0x1b1
	.uleb128 0x18
	.long	.LASF110
	.byte	0x8
	.byte	0x44
	.long	0x693
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x18
	.long	.LASF111
	.byte	0x8
	.byte	0x47
	.long	0x112
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x18
	.long	.LASF112
	.byte	0x8
	.byte	0x48
	.long	0x112
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x19
	.long	.LASF113
	.byte	0xc
	.byte	0x14
	.long	0xa0
	.uleb128 0x18
	.long	.LASF114
	.byte	0x1
	.byte	0x56
	.long	0x31d
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x18
	.long	.LASF115
	.byte	0x1
	.byte	0x57
	.long	0x2e1
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x18
	.long	.LASF116
	.byte	0x1
	.byte	0x58
	.long	0x34d
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0x19
	.long	.LASF117
	.byte	0xa
	.byte	0x25
	.long	0x72d
	.uleb128 0xb
	.byte	0x8
	.long	0x371
	.uleb128 0x19
	.long	.LASF118
	.byte	0x2
	.byte	0x43
	.long	0x547
	.uleb128 0x18
	.long	.LASF119
	.byte	0x3
	.byte	0x37
	.long	0x4cc
	.uleb128 0x9
	.byte	0x3
	.quad	imuConfig_System
	.uleb128 0x19
	.long	.LASF120
	.byte	0x3
	.byte	0x3e
	.long	0x75e
	.uleb128 0xb
	.byte	0x8
	.long	0x4fc
	.uleb128 0x18
	.long	.LASF121
	.byte	0x4
	.byte	0x77
	.long	0x95
	.uleb128 0x9
	.byte	0x3
	.quad	cycleTime
	.uleb128 0x1a
	.string	"dT"
	.byte	0x4
	.byte	0x79
	.long	0xab
	.uleb128 0x9
	.byte	0x3
	.quad	dT
	.uleb128 0x18
	.long	.LASF122
	.byte	0x4
	.byte	0x7b
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	magHold
	.uleb128 0x18
	.long	.LASF123
	.byte	0x4
	.byte	0x7c
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	headFreeModeHold
	.uleb128 0x18
	.long	.LASF124
	.byte	0x4
	.byte	0x7e
	.long	0x8a
	.uleb128 0x9
	.byte	0x3
	.quad	motorControlEnable
	.uleb128 0x18
	.long	.LASF125
	.byte	0x4
	.byte	0x80
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	telemTemperature1
	.uleb128 0x19
	.long	.LASF126
	.byte	0x4
	.byte	0x83
	.long	0xa0
	.uleb128 0x18
	.long	.LASF127
	.byte	0x4
	.byte	0x89
	.long	0x1bc
	.uleb128 0x9
	.byte	0x3
	.quad	gyro_initialized
	.uleb128 0x18
	.long	.LASF128
	.byte	0x4
	.byte	0x8b
	.long	0x95
	.uleb128 0x9
	.byte	0x3
	.quad	filteredCycleTime
	.uleb128 0x1a
	.string	"i"
	.byte	0x4
	.byte	0x8c
	.long	0x30
	.uleb128 0x9
	.byte	0x3
	.quad	i
	.uleb128 0x18
	.long	.LASF129
	.byte	0x4
	.byte	0x8f
	.long	0x1bc
	.uleb128 0x9
	.byte	0x3
	.quad	AccInflightCalibrationArmed
	.uleb128 0x18
	.long	.LASF130
	.byte	0x4
	.byte	0x90
	.long	0x1bc
	.uleb128 0x9
	.byte	0x3
	.quad	AccInflightCalibrationMeasurementDone
	.uleb128 0x18
	.long	.LASF131
	.byte	0x4
	.byte	0x91
	.long	0x1bc
	.uleb128 0x9
	.byte	0x3
	.quad	AccInflightCalibrationSavetoEEProm
	.uleb128 0x18
	.long	.LASF132
	.byte	0x4
	.byte	0x92
	.long	0x1bc
	.uleb128 0x9
	.byte	0x3
	.quad	AccInflightCalibrationActive
	.uleb128 0x18
	.long	.LASF133
	.byte	0x4
	.byte	0x93
	.long	0x95
	.uleb128 0x9
	.byte	0x3
	.quad	InflightcalibratingA
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.long	0x9c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.quad	.LFB13
	.quad	.LFE13-.LFB13
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
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB12
	.quad	.LFE12
	.quad	.LFB13
	.quad	.LFE13
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF112:
	.string	"__pg_resetdata_end"
.LASF127:
	.string	"gyro_initialized"
.LASF85:
	.string	"gyroSyncDenominator"
.LASF58:
	.string	"mag_hardware"
.LASF1:
	.string	"unsigned int"
.LASF80:
	.string	"acc_unarmedcal"
.LASF82:
	.string	"imuConfig_s"
.LASF90:
	.string	"imuConfig_t"
.LASF79:
	.string	"accDeadband"
.LASF37:
	.string	"pitch"
.LASF121:
	.string	"cycleTime"
.LASF113:
	.string	"targetLooptime"
.LASF104:
	.string	"isRXDataNew"
.LASF40:
	.string	"flightDynamicsTrims_t"
.LASF70:
	.string	"flightDynamicsTrims_u"
.LASF96:
	.string	"accelerometerConfig"
.LASF102:
	.string	"currentDeltaTime"
.LASF101:
	.string	"taskMainPidLoop"
.LASF17:
	.string	"RGB_RED"
.LASF61:
	.string	"sensorTrims_s"
.LASF64:
	.string	"sensorTrims_t"
.LASF52:
	.string	"gyro_align"
.LASF106:
	.string	"U_ID_0"
.LASF107:
	.string	"U_ID_1"
.LASF108:
	.string	"U_ID_2"
.LASF75:
	.string	"accelerometerConfig_s"
.LASF81:
	.string	"accelerometerConfig_t"
.LASF123:
	.string	"headFreeModeHold"
.LASF14:
	.string	"uint32_t"
.LASF88:
	.string	"small_angle"
.LASF18:
	.string	"RGB_GREEN"
.LASF117:
	.string	"compassConfig_ProfileCurrent"
.LASF114:
	.string	"sensorSelectionConfig_System"
.LASF15:
	.string	"float"
.LASF11:
	.string	"int16_t"
.LASF116:
	.string	"sensorTrims_System"
.LASF34:
	.string	"SENSOR_INDEX_MAG"
.LASF10:
	.string	"long long unsigned int"
.LASF77:
	.string	"acc_cut_hz"
.LASF87:
	.string	"dcm_ki"
.LASF86:
	.string	"dcm_kp"
.LASF129:
	.string	"AccInflightCalibrationArmed"
.LASF91:
	.string	"throttleCorrectionConfig_s"
.LASF94:
	.string	"throttleCorrectionConfig_t"
.LASF49:
	.string	"CW270_DEG_FLIP"
.LASF93:
	.string	"throttle_correction_value"
.LASF22:
	.string	"pgn_t"
.LASF30:
	.string	"_Bool"
.LASF25:
	.string	"pgRegistry_s"
.LASF29:
	.string	"pgRegistry_t"
.LASF111:
	.string	"__pg_resetdata_start"
.LASF118:
	.string	"accelerometerConfig_ProfileCurrent"
.LASF33:
	.string	"SENSOR_INDEX_BARO"
.LASF126:
	.string	"currentTime"
.LASF59:
	.string	"baro_hardware"
.LASF47:
	.string	"CW90_DEG_FLIP"
.LASF78:
	.string	"accz_lpf_cutoff"
.LASF125:
	.string	"telemTemperature1"
.LASF8:
	.string	"char"
.LASF46:
	.string	"CW0_DEG_FLIP"
.LASF36:
	.string	"roll"
.LASF12:
	.string	"uint8_t"
.LASF109:
	.string	"__pg_registry_start"
.LASF119:
	.string	"imuConfig_System"
.LASF99:
	.string	"taskUpdateCompass"
.LASF131:
	.string	"AccInflightCalibrationSavetoEEProm"
.LASF98:
	.string	"taskHandleSerial"
.LASF9:
	.string	"long long int"
.LASF38:
	.string	"flightDynamicsTrims_def_t"
.LASF57:
	.string	"acc_hardware"
.LASF103:
	.string	"disarmAt"
.LASF54:
	.string	"mag_align"
.LASF56:
	.string	"sensorSelectionConfig_s"
.LASF60:
	.string	"sensorSelectionConfig_t"
.LASF95:
	.string	"sensorTrims"
.LASF130:
	.string	"AccInflightCalibrationMeasurementDone"
.LASF92:
	.string	"throttle_correction_angle"
.LASF26:
	.string	"size"
.LASF83:
	.string	"looptime"
.LASF43:
	.string	"CW90_DEG"
.LASF136:
	.string	"/home/aravind/git/cleanflight"
.LASF53:
	.string	"acc_align"
.LASF39:
	.string	"values"
.LASF62:
	.string	"accZero"
.LASF110:
	.string	"__pg_registry_end"
.LASF19:
	.string	"RGB_BLUE"
.LASF32:
	.string	"SENSOR_INDEX_ACC"
.LASF100:
	.string	"taskUpdateAccelerometer"
.LASF89:
	.string	"max_angle_inclination"
.LASF13:
	.string	"uint16_t"
.LASF66:
	.string	"mag_declination"
.LASF134:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF5:
	.string	"short int"
.LASF63:
	.string	"magZero"
.LASF6:
	.string	"long int"
.LASF115:
	.string	"sensorAlignmentConfig_System"
.LASF135:
	.string	"src/main/fc/cleanflight_fc.c"
.LASF124:
	.string	"motorControlEnable"
.LASF24:
	.string	"pt1Filter_s"
.LASF21:
	.string	"pt1Filter_t"
.LASF45:
	.string	"CW270_DEG"
.LASF76:
	.string	"accelerometerTrims"
.LASF28:
	.string	"reset"
.LASF97:
	.string	"imuConfig"
.LASF132:
	.string	"AccInflightCalibrationActive"
.LASF50:
	.string	"sensor_align_e"
.LASF31:
	.string	"SENSOR_INDEX_GYRO"
.LASF133:
	.string	"InflightcalibratingA"
.LASF105:
	.string	"filteredCycleTimeState"
.LASF7:
	.string	"sizetype"
.LASF0:
	.string	"long unsigned int"
.LASF27:
	.string	"address"
.LASF44:
	.string	"CW180_DEG"
.LASF35:
	.string	"int16_flightDynamicsTrims_s"
.LASF48:
	.string	"CW180_DEG_FLIP"
.LASF2:
	.string	"unsigned char"
.LASF137:
	.string	"taskMainPidLoopChecker"
.LASF84:
	.string	"gyroSync"
.LASF122:
	.string	"magHold"
.LASF20:
	.string	"state"
.LASF65:
	.string	"compassConfig_s"
.LASF67:
	.string	"compassConfig_t"
.LASF128:
	.string	"filteredCycleTime"
.LASF69:
	.string	"rollAndPitchTrims_t_def"
.LASF4:
	.string	"signed char"
.LASF3:
	.string	"short unsigned int"
.LASF68:
	.string	"rollAndPitchTrims_s"
.LASF72:
	.string	"rollAndPitchTrims_t"
.LASF71:
	.string	"rollAndPitchTrims_u"
.LASF16:
	.string	"double"
.LASF51:
	.string	"sensorAlignmentConfig_s"
.LASF55:
	.string	"sensorAlignmentConfig_t"
.LASF120:
	.string	"throttleCorrectionConfig_ProfileCurrent"
.LASF41:
	.string	"ALIGN_DEFAULT"
.LASF42:
	.string	"CW0_DEG"
.LASF73:
	.string	"accDeadband_s"
.LASF74:
	.string	"accDeadband_t"
.LASF23:
	.string	"pgResetFunc"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
