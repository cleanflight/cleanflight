	.file	"msp_server_fc.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed msp_server_fc.i -mtune=generic
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
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	featureConfig_System,4,4
	.comm	profileSelection_System,1,1
	.comm	rxConfig_System,26,16
	.section	.text.rxConfig,"ax",@progbits
	.type	rxConfig, @function
rxConfig:
.LFB10:
	.file 1 "./src/main/rx/rx.h"
	.loc 1 128 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 128 0
	movl	$rxConfig_System, %eax	#, D.7502
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	rxConfig, .-rxConfig
	.section	.text.failsafeChannelConfigs,"ax",@progbits
	.type	failsafeChannelConfigs, @function
failsafeChannelConfigs:
.LFB11:
	.loc 1 130 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# _index, _index
	.loc 1 130 0
	movl	-4(%rbp), %eax	# _index, tmp90
	cltq
	addq	%rax, %rax	# tmp91
	addq	$failsafeChannelConfigs_SystemArray, %rax	#, D.7503
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	failsafeChannelConfigs, .-failsafeChannelConfigs
	.section	.text.modeActivationProfile,"ax",@progbits
	.type	modeActivationProfile, @function
modeActivationProfile:
.LFB18:
	.file 2 "./src/main/fc/rc_controls.h"
	.loc 2 133 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 133 0
	movq	modeActivationProfile_ProfileCurrent(%rip), %rax	# modeActivationProfile_ProfileCurrent, D.7504
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	modeActivationProfile, .-modeActivationProfile
	.section	.text.rcControlsConfig,"ax",@progbits
	.type	rcControlsConfig, @function
rcControlsConfig:
.LFB19:
	.loc 2 146 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 146 0
	movq	rcControlsConfig_ProfileCurrent(%rip), %rax	# rcControlsConfig_ProfileCurrent, D.7505
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	rcControlsConfig, .-rcControlsConfig
	.comm	armingConfig_System,4,1
	.section	.text.armingConfig,"ax",@progbits
	.type	armingConfig, @function
armingConfig:
.LFB20:
	.loc 2 156 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 2 156 0
	movl	$armingConfig_System, %eax	#, D.7506
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	armingConfig, .-armingConfig
	.section	.text.adjustmentProfile,"ax",@progbits
	.type	adjustmentProfile, @function
adjustmentProfile:
.LFB21:
	.file 3 "./src/main/fc/rc_adjustments.h"
	.loc 3 126 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 3 126 0
	movq	adjustmentProfile_ProfileCurrent(%rip), %rax	# adjustmentProfile_ProfileCurrent, D.7507
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	adjustmentProfile, .-adjustmentProfile
	.comm	motorAndServoConfig_System,12,8
	.section	.text.motorAndServoConfig,"ax",@progbits
	.type	motorAndServoConfig, @function
motorAndServoConfig:
.LFB22:
	.file 4 "./src/main/io/motor_and_servo.h"
	.loc 4 32 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 4 32 0
	movl	$motorAndServoConfig_System, %eax	#, D.7508
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	motorAndServoConfig, .-motorAndServoConfig
	.comm	gpsConfig_System,16,16
	.comm	serialConfig_System,28,16
	.section	.text.serialConfig,"ax",@progbits
	.type	serialConfig, @function
serialConfig:
.LFB25:
	.file 5 "./src/main/io/io_serial.h"
	.loc 5 101 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 5 101 0
	movl	$serialConfig_System, %eax	#, D.7509
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	serialConfig, .-serialConfig
	.comm	specialColors_System,11,8
	.comm	transponderConfig_System,6,1
	.comm	telemetryConfig_System,3,1
	.comm	boardAlignment_System,6,1
	.section	.text.boardAlignment,"ax",@progbits
	.type	boardAlignment, @function
boardAlignment:
.LFB45:
	.file 6 "./src/main/sensors/boardalignment.h"
	.loc 6 26 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 6 26 0
	movl	$boardAlignment_System, %eax	#, D.7510
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	boardAlignment, .-boardAlignment
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.section	.text.sensorAlignmentConfig,"ax",@progbits
	.type	sensorAlignmentConfig, @function
sensorAlignmentConfig:
.LFB47:
	.file 7 "./src/main/sensors/sensors.h"
	.loc 7 86 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 7 86 0
	movl	$sensorAlignmentConfig_System, %eax	#, D.7511
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	sensorAlignmentConfig, .-sensorAlignmentConfig
	.comm	sensorTrims_System,12,8
	.section	.text.amperageMeterConfig,"ax",@progbits
	.type	amperageMeterConfig, @function
amperageMeterConfig:
.LFB49:
	.file 8 "./src/main/sensors/amperage.h"
	.loc 8 29 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# _index, _index
	.loc 8 29 0
	movl	-4(%rbp), %eax	# _index, tmp90
	cltq
	salq	$2, %rax	#, tmp91
	addq	$amperageMeterConfig_SystemArray, %rax	#, D.7512
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE49:
	.size	amperageMeterConfig, .-amperageMeterConfig
	.section	.text.voltageMeterConfig,"ax",@progbits
	.type	voltageMeterConfig, @function
voltageMeterConfig:
.LFB51:
	.file 9 "./src/main/sensors/voltage.h"
	.loc 9 38 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# _index, _index
	.loc 9 38 0
	movl	-4(%rbp), %eax	# _index, tmp90
	movslq	%eax, %rdx	# tmp90, tmp89
	movq	%rdx, %rax	# tmp89, tmp91
	addq	%rax, %rax	# tmp91
	addq	%rdx, %rax	# tmp89, tmp91
	addq	$voltageMeterConfig_SystemArray, %rax	#, D.7513
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE51:
	.size	voltageMeterConfig, .-voltageMeterConfig
	.comm	batteryConfig_System,8,8
	.section	.text.batteryConfig,"ax",@progbits
	.type	batteryConfig, @function
batteryConfig:
.LFB53:
	.file 10 "./src/main/sensors/battery.h"
	.loc 10 28 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 10 28 0
	movl	$batteryConfig_System, %eax	#, D.7514
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE53:
	.size	batteryConfig, .-batteryConfig
	.section	.text.accelerometerConfig,"ax",@progbits
	.type	accelerometerConfig, @function
accelerometerConfig:
.LFB54:
	.file 11 "./src/main/sensors/acceleration.h"
	.loc 11 66 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 11 66 0
	movq	accelerometerConfig_ProfileCurrent(%rip), %rax	# accelerometerConfig_ProfileCurrent, D.7515
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE54:
	.size	accelerometerConfig, .-accelerometerConfig
	.section	.text.compassConfig,"ax",@progbits
	.type	compassConfig, @function
compassConfig:
.LFB55:
	.file 12 "./src/main/sensors/compass.h"
	.loc 12 36 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 12 36 0
	movq	compassConfig_ProfileCurrent(%rip), %rax	# compassConfig_ProfileCurrent, D.7516
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE55:
	.size	compassConfig, .-compassConfig
	.comm	gyroConfig_System,4,2
	.comm	mixerConfig_System,6,2
	.section	.text.mixerConfig,"ax",@progbits
	.type	mixerConfig, @function
mixerConfig:
.LFB59:
	.file 13 "./src/main/flight/mixer.h"
	.loc 13 92 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 13 92 0
	movl	$mixerConfig_System, %eax	#, D.7517
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE59:
	.size	mixerConfig, .-mixerConfig
	.comm	motor3DConfig_System,6,2
	.section	.text.motor3DConfig,"ax",@progbits
	.type	motor3DConfig, @function
motor3DConfig:
.LFB60:
	.loc 13 100 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 13 100 0
	movl	$motor3DConfig_System, %eax	#, D.7518
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE60:
	.size	motor3DConfig, .-motor3DConfig
	.comm	inputSource_e,4,4
	.section	.text.pidProfile,"ax",@progbits
	.type	pidProfile, @function
pidProfile:
.LFB64:
	.file 14 "./src/main/flight/pid.h"
	.loc 14 74 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 14 74 0
	movq	pidProfile_ProfileCurrent(%rip), %rax	# pidProfile_ProfileCurrent, D.7519
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE64:
	.size	pidProfile, .-pidProfile
	.comm	imuConfig_System,12,8
	.section	.text.imuConfig,"ax",@progbits
	.type	imuConfig, @function
imuConfig:
.LFB65:
	.file 15 "./src/main/flight/imu.h"
	.loc 15 55 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 15 55 0
	movl	$imuConfig_System, %eax	#, D.7520
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE65:
	.size	imuConfig, .-imuConfig
	.comm	failsafeConfig_System,8,8
	.section	.text.failsafeConfig,"ax",@progbits
	.type	failsafeConfig, @function
failsafeConfig:
.LFB67:
	.file 16 "./src/main/flight/failsafe.h"
	.loc 16 73 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 16 73 0
	movl	$failsafeConfig_System, %eax	#, D.7521
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE67:
	.size	failsafeConfig, .-failsafeConfig
	.comm	airplaneConfig_System,1,1
	.comm	blackboxConfig_System,3,1
	.comm	mspServerConfig_System,1,1
	.section	.text.mspServerConfig,"ax",@progbits
	.type	mspServerConfig, @function
mspServerConfig:
.LFB71:
	.file 17 "./src/main/msp/msp_server.h"
	.loc 17 22 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 17 22 0
	movl	$mspServerConfig_System, %eax	#, D.7522
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE71:
	.size	mspServerConfig, .-mspServerConfig
	.section	.rodata
.LC0:
	.string	"CLFL"
	.section	.rodata.flightControllerIdentifier,"a",@progbits
	.align 8
	.type	flightControllerIdentifier, @object
	.size	flightControllerIdentifier, 8
flightControllerIdentifier:
	.quad	.LC0
	.section	.rodata
.LC1:
	.string	"EDISON"
	.section	.rodata.boardIdentifier,"a",@progbits
	.align 8
	.type	boardIdentifier, @object
	.size	boardIdentifier, 8
boardIdentifier:
	.quad	.LC1
	.section	.rodata
.LC2:
	.string	"ARM"
.LC3:
	.string	"ANGLE"
.LC4:
	.string	"HORIZON"
.LC5:
	.string	"BARO"
.LC6:
	.string	"MAG"
.LC7:
	.string	"HEADFREE"
.LC8:
	.string	"HEADADJ"
.LC9:
	.string	"CAMSTAB"
.LC10:
	.string	"CAMTRIG"
.LC11:
	.string	"GPS HOME"
.LC12:
	.string	"GPS HOLD"
.LC13:
	.string	"PASSTHRU"
.LC14:
	.string	"BEEPER"
.LC15:
	.string	"LEDMAX"
.LC16:
	.string	"LEDLOW"
.LC17:
	.string	"LLIGHTS"
.LC18:
	.string	"CALIB"
.LC19:
	.string	"GOVERNOR"
.LC20:
	.string	"OSD SW"
.LC21:
	.string	"TELEMETRY"
.LC22:
	.string	"GTUNE"
.LC23:
	.string	"SONAR"
.LC24:
	.string	"SERVO1"
.LC25:
	.string	"SERVO2"
.LC26:
	.string	"SERVO3"
.LC27:
	.string	"BLACKBOX"
.LC28:
	.string	"FAILSAFE"
.LC29:
	.string	"AIR MODE"
	.section	.rodata.boxes,"a",@progbits
	.align 32
	.type	boxes, @object
	.size	boxes, 448
boxes:
# boxName:
	.quad	.LC2
# boxId:
	.byte	0
# permanentId:
	.byte	0
	.zero	6
# boxName:
	.quad	.LC3
# boxId:
	.byte	1
# permanentId:
	.byte	1
	.zero	6
# boxName:
	.quad	.LC4
# boxId:
	.byte	2
# permanentId:
	.byte	2
	.zero	6
# boxName:
	.quad	.LC5
# boxId:
	.byte	3
# permanentId:
	.byte	3
	.zero	6
# boxName:
	.quad	.LC6
# boxId:
	.byte	4
# permanentId:
	.byte	5
	.zero	6
# boxName:
	.quad	.LC7
# boxId:
	.byte	5
# permanentId:
	.byte	6
	.zero	6
# boxName:
	.quad	.LC8
# boxId:
	.byte	6
# permanentId:
	.byte	7
	.zero	6
# boxName:
	.quad	.LC9
# boxId:
	.byte	7
# permanentId:
	.byte	8
	.zero	6
# boxName:
	.quad	.LC10
# boxId:
	.byte	8
# permanentId:
	.byte	9
	.zero	6
# boxName:
	.quad	.LC11
# boxId:
	.byte	9
# permanentId:
	.byte	10
	.zero	6
# boxName:
	.quad	.LC12
# boxId:
	.byte	10
# permanentId:
	.byte	11
	.zero	6
# boxName:
	.quad	.LC13
# boxId:
	.byte	11
# permanentId:
	.byte	12
	.zero	6
# boxName:
	.quad	.LC14
# boxId:
	.byte	12
# permanentId:
	.byte	13
	.zero	6
# boxName:
	.quad	.LC15
# boxId:
	.byte	13
# permanentId:
	.byte	14
	.zero	6
# boxName:
	.quad	.LC16
# boxId:
	.byte	14
# permanentId:
	.byte	15
	.zero	6
# boxName:
	.quad	.LC17
# boxId:
	.byte	15
# permanentId:
	.byte	16
	.zero	6
# boxName:
	.quad	.LC18
# boxId:
	.byte	16
# permanentId:
	.byte	17
	.zero	6
# boxName:
	.quad	.LC19
# boxId:
	.byte	17
# permanentId:
	.byte	18
	.zero	6
# boxName:
	.quad	.LC20
# boxId:
	.byte	18
# permanentId:
	.byte	19
	.zero	6
# boxName:
	.quad	.LC21
# boxId:
	.byte	19
# permanentId:
	.byte	20
	.zero	6
# boxName:
	.quad	.LC22
# boxId:
	.byte	20
# permanentId:
	.byte	21
	.zero	6
# boxName:
	.quad	.LC23
# boxId:
	.byte	21
# permanentId:
	.byte	22
	.zero	6
# boxName:
	.quad	.LC24
# boxId:
	.byte	22
# permanentId:
	.byte	23
	.zero	6
# boxName:
	.quad	.LC25
# boxId:
	.byte	23
# permanentId:
	.byte	24
	.zero	6
# boxName:
	.quad	.LC26
# boxId:
	.byte	24
# permanentId:
	.byte	25
	.zero	6
# boxName:
	.quad	.LC27
# boxId:
	.byte	25
# permanentId:
	.byte	26
	.zero	6
# boxName:
	.quad	.LC28
# boxId:
	.byte	26
# permanentId:
	.byte	27
	.zero	6
# boxName:
	.quad	.LC29
# boxId:
	.byte	27
# permanentId:
	.byte	28
	.zero	6
	.section	.bss.activeBoxIds,"aw",@nobits
	.align 4
	.type	activeBoxIds, @object
	.size	activeBoxIds, 4
activeBoxIds:
	.zero	4
	.section	.rodata.pidnames,"a",@progbits
	.align 32
	.type	pidnames, @object
	.size	pidnames, 48
pidnames:
	.string	"ROLL;PITCH;YAW;ALT;Pos;PosR;NavR;LEVEL;MAG;VEL;"
	.section	.text.mspRebootFn,"ax",@progbits
	.globl	mspRebootFn
	.type	mspRebootFn, @function
mspRebootFn:
.LFB72:
	.file 18 "src/main/fc/msp_server_fc.c"
	.loc 18 208 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# msp, msp
	.loc 18 209 0
	movq	-8(%rbp), %rax	# msp, tmp88
	movq	(%rax), %rax	# msp_2(D)->port, D.7553
	movq	%rax, %rdi	# D.7553,
	call	waitForSerialPortToFinishTransmitting	#
	.loc 18 210 0
	call	stopMotors	#
	.loc 18 211 0
	call	handleOneshotFeatureChangeOnRestart	#
	.loc 18 212 0
	call	systemReset	#
.L44:
	.loc 18 215 0 discriminator 1
	jmp	.L44	#
	.cfi_endproc
.LFE72:
	.size	mspRebootFn, .-mspRebootFn
	.section	.text.findBoxByBoxId,"ax",@progbits
	.type	findBoxByBoxId, @function
findBoxByBoxId:
.LFB73:
	.loc 18 219 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# boxId, tmp90
	movb	%al, -20(%rbp)	# tmp90, boxId
.LBB2:
	.loc 18 220 0
	movl	$0, -12(%rbp)	#, i
	jmp	.L46	#
.L49:
.LBB3:
	.loc 18 221 0
	movl	-12(%rbp), %eax	# i, tmp91
	salq	$4, %rax	#, tmp92
	addq	$boxes, %rax	#, tmp93
	movq	%rax, -8(%rbp)	# tmp93, candidate
	.loc 18 222 0
	movq	-8(%rbp), %rax	# candidate, tmp94
	movzbl	8(%rax), %eax	# candidate_4->boxId, D.7555
	cmpb	-20(%rbp), %al	# boxId, D.7555
	jne	.L47	#,
	.loc 18 223 0
	movq	-8(%rbp), %rax	# candidate, D.7554
	jmp	.L48	#
.L47:
.LBE3:
	.loc 18 220 0 discriminator 2
	addl	$1, -12(%rbp)	#, i
.L46:
	.loc 18 220 0 is_stmt 0 discriminator 1
	cmpl	$27, -12(%rbp)	#, i
	jbe	.L49	#,
.LBE2:
	.loc 18 226 0 is_stmt 1
	movl	$0, %eax	#, D.7554
.L48:
	.loc 18 227 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE73:
	.size	findBoxByBoxId, .-findBoxByBoxId
	.section	.text.findBoxByPermenantId,"ax",@progbits
	.type	findBoxByPermenantId, @function
findBoxByPermenantId:
.LFB74:
	.loc 18 230 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# permanentId, tmp90
	movb	%al, -20(%rbp)	# tmp90, permanentId
.LBB4:
	.loc 18 231 0
	movl	$0, -12(%rbp)	#, i
	jmp	.L51	#
.L54:
.LBB5:
	.loc 18 232 0
	movl	-12(%rbp), %eax	# i, tmp91
	salq	$4, %rax	#, tmp92
	addq	$boxes, %rax	#, tmp93
	movq	%rax, -8(%rbp)	# tmp93, candidate
	.loc 18 233 0
	movq	-8(%rbp), %rax	# candidate, tmp94
	movzbl	9(%rax), %eax	# candidate_4->permanentId, D.7557
	cmpb	-20(%rbp), %al	# permanentId, D.7557
	jne	.L52	#,
	.loc 18 234 0
	movq	-8(%rbp), %rax	# candidate, D.7556
	jmp	.L53	#
.L52:
.LBE5:
	.loc 18 231 0 discriminator 2
	addl	$1, -12(%rbp)	#, i
.L51:
	.loc 18 231 0 is_stmt 0 discriminator 1
	cmpl	$27, -12(%rbp)	#, i
	jbe	.L54	#,
.LBE4:
	.loc 18 237 0 is_stmt 1
	movl	$0, %eax	#, D.7556
.L53:
	.loc 18 238 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE74:
	.size	findBoxByPermenantId, .-findBoxByPermenantId
	.section	.text.serializeBoxNamesReply,"ax",@progbits
	.type	serializeBoxNamesReply, @function
serializeBoxNamesReply:
.LFB75:
	.loc 18 241 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# reply, reply
	.loc 18 242 0
	movq	-40(%rbp), %rax	# reply, tmp94
	movq	%rax, -16(%rbp)	# tmp94, dst
.LBB6:
	.loc 18 243 0
	movl	$0, -20(%rbp)	#, i
	jmp	.L56	#
.L59:
.LBB7:
	.loc 18 244 0
	movl	-20(%rbp), %eax	# i, tmp95
	movl	$1, %edx	#, tmp96
	movl	%eax, %ecx	# tmp95, tmp103
	sall	%cl, %edx	# tmp103, D.7558
	movl	%edx, %eax	# D.7558, D.7558
	movl	%eax, %edx	# D.7558, D.7559
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.7559
	andl	%edx, %eax	# D.7559, D.7559
	testl	%eax, %eax	# D.7559
	je	.L60	#,
	.loc 18 246 0
	movl	-20(%rbp), %eax	# i, tmp97
	movzbl	%al, %eax	# D.7560, D.7558
	movl	%eax, %edi	# D.7558,
	call	findBoxByBoxId	#
	movq	%rax, -8(%rbp)	# tmp98, box
	.loc 18 247 0
	movq	-8(%rbp), %rax	# box, tmp99
	movq	(%rax), %rdx	# box_15->boxName, D.7561
	movq	-16(%rbp), %rax	# dst, tmp100
	movq	%rdx, %rsi	# D.7561,
	movq	%rax, %rdi	# tmp100,
	call	sbufWriteString	#
	.loc 18 248 0
	movq	-16(%rbp), %rax	# dst, tmp101
	movl	$59, %esi	#,
	movq	%rax, %rdi	# tmp101,
	call	sbufWriteU8	#
	jmp	.L58	#
.L60:
	.loc 18 245 0
	nop
.L58:
.LBE7:
	.loc 18 243 0 discriminator 2
	addl	$1, -20(%rbp)	#, i
.L56:
	.loc 18 243 0 is_stmt 0 discriminator 1
	cmpl	$27, -20(%rbp)	#, i
	jle	.L59	#,
.LBE6:
	.loc 18 250 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE75:
	.size	serializeBoxNamesReply, .-serializeBoxNamesReply
	.section	.text.serializeBoxIdsReply,"ax",@progbits
	.type	serializeBoxIdsReply, @function
serializeBoxIdsReply:
.LFB76:
	.loc 18 253 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# reply, reply
	.loc 18 254 0
	movq	-40(%rbp), %rax	# reply, tmp95
	movq	%rax, -16(%rbp)	# tmp95, dst
.LBB8:
	.loc 18 255 0
	movl	$0, -20(%rbp)	#, i
	jmp	.L62	#
.L65:
.LBB9:
	.loc 18 256 0
	movl	-20(%rbp), %eax	# i, tmp96
	movl	$1, %edx	#, tmp97
	movl	%eax, %ecx	# tmp96, tmp103
	sall	%cl, %edx	# tmp103, D.7562
	movl	%edx, %eax	# D.7562, D.7562
	movl	%eax, %edx	# D.7562, D.7563
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.7563
	andl	%edx, %eax	# D.7563, D.7563
	testl	%eax, %eax	# D.7563
	je	.L66	#,
	.loc 18 258 0
	movl	-20(%rbp), %eax	# i, tmp98
	movzbl	%al, %eax	# D.7564, D.7562
	movl	%eax, %edi	# D.7562,
	call	findBoxByBoxId	#
	movq	%rax, -8(%rbp)	# tmp99, box
	.loc 18 259 0
	movq	-8(%rbp), %rax	# box, tmp100
	movzbl	9(%rax), %eax	# box_15->permanentId, D.7564
	movzbl	%al, %edx	# D.7564, D.7562
	movq	-16(%rbp), %rax	# dst, tmp101
	movl	%edx, %esi	# D.7562,
	movq	%rax, %rdi	# tmp101,
	call	sbufWriteU8	#
	jmp	.L64	#
.L66:
	.loc 18 257 0
	nop
.L64:
.LBE9:
	.loc 18 255 0 discriminator 2
	addl	$1, -20(%rbp)	#, i
.L62:
	.loc 18 255 0 is_stmt 0 discriminator 1
	cmpl	$27, -20(%rbp)	#, i
	jle	.L65	#,
.LBE8:
	.loc 18 261 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE76:
	.size	serializeBoxIdsReply, .-serializeBoxIdsReply
	.section	.text.initActiveBoxIds,"ax",@progbits
	.type	initActiveBoxIds, @function
initActiveBoxIds:
.LFB77:
	.loc 18 264 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 18 265 0
	movl	$0, -8(%rbp)	#, ena
	.loc 18 267 0
	orl	$1, -8(%rbp)	#, ena
	.loc 18 269 0
	movl	$2, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.7565
	je	.L68	#,
	.loc 18 270 0
	orl	$2, -8(%rbp)	#, ena
	.loc 18 271 0
	orl	$4, -8(%rbp)	#, ena
.L68:
	.loc 18 280 0
	orl	$134217728, -8(%rbp)	#, ena
	.loc 18 282 0
	movl	$2, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.7565
	jne	.L69	#,
	.loc 18 282 0 is_stmt 0 discriminator 1
	movl	$8, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.7565
	je	.L70	#,
.L69:
	.loc 18 283 0 is_stmt 1
	orl	$16, -8(%rbp)	#, ena
	.loc 18 284 0
	orl	$32, -8(%rbp)	#, ena
	.loc 18 285 0
	orl	$64, -8(%rbp)	#, ena
.L70:
	.loc 18 288 0
	movl	$32, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7565
	je	.L71	#,
	.loc 18 289 0
	orl	$128, -8(%rbp)	#, ena
.L71:
	.loc 18 298 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _36->mixerMode, D.7567
	cmpb	$8, %al	#, D.7567
	je	.L72	#,
	.loc 18 299 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _39->mixerMode, D.7567
	cmpb	$14, %al	#, D.7567
	je	.L72	#,
	.loc 18 300 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _42->mixerMode, D.7567
	cmpb	$24, %al	#, D.7567
	jne	.L73	#,
.L72:
	.loc 18 301 0
	orl	$2048, -8(%rbp)	#, ena
.L73:
	.loc 18 303 0
	orl	$4096, -8(%rbp)	#, ena
	.loc 18 311 0
	movl	$4, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7565
	je	.L74	#,
	.loc 18 312 0
	orl	$65536, -8(%rbp)	#, ena
.L74:
	.loc 18 314 0
	orl	$262144, -8(%rbp)	#, ena
	.loc 18 321 0
	movl	$512, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7565
	je	.L75	#,
	.loc 18 322 0
	orl	$2097152, -8(%rbp)	#, ena
.L75:
	.loc 18 339 0
	movl	$256, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7565
	je	.L76	#,
	.loc 18 340 0
	orl	$67108864, -8(%rbp)	#, ena
.L76:
	.loc 18 344 0
	orl	$1048576, -8(%rbp)	#, ena
.LBB10:
	.loc 18 348 0
	movl	$0, -4(%rbp)	#, boxId
	jmp	.L77	#
.L79:
	.loc 18 349 0
	movl	-4(%rbp), %eax	# boxId, tmp109
	movl	$1, %edx	#, tmp110
	movl	%eax, %ecx	# tmp109, tmp116
	sall	%cl, %edx	# tmp116, D.7568
	movl	%edx, %eax	# D.7568, D.7568
	andl	-8(%rbp), %eax	# ena, D.7569
	testl	%eax, %eax	# D.7569
	je	.L78	#,
	.loc 18 350 0
	movl	-4(%rbp), %eax	# boxId, tmp111
	movzbl	%al, %eax	# D.7567, D.7568
	movl	%eax, %edi	# D.7568,
	call	findBoxByBoxId	#
	testq	%rax, %rax	# D.7570
	jne	.L78	#,
	.loc 18 351 0
	movl	-4(%rbp), %eax	# boxId, tmp112
	movl	$1, %edx	#, tmp113
	movl	%eax, %ecx	# tmp112, tmp118
	sall	%cl, %edx	# tmp118, D.7568
	movl	%edx, %eax	# D.7568, D.7568
	notl	%eax	# D.7568
	andl	%eax, -8(%rbp)	# D.7569, ena
.L78:
	.loc 18 348 0 discriminator 2
	addl	$1, -4(%rbp)	#, boxId
.L77:
	.loc 18 348 0 is_stmt 0 discriminator 1
	cmpl	$27, -4(%rbp)	#, boxId
	jbe	.L79	#,
.LBE10:
	.loc 18 352 0 is_stmt 1
	movl	-8(%rbp), %eax	# ena, tmp114
	movl	%eax, activeBoxIds(%rip)	# tmp114, activeBoxIds
	.loc 18 353 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE77:
	.size	initActiveBoxIds, .-initActiveBoxIds
	.section	.text.packFlightModeFlags,"ax",@progbits
	.type	packFlightModeFlags, @function
packFlightModeFlags:
.LFB78:
	.loc 18 358 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	.loc 18 363 0
	movl	$0, -32(%rbp)	#, boxEnabledMask
	.loc 18 367 0
	movl	$-2049, -8(%rbp)	#, flightModeCopyMask
.LBB11:
	.loc 18 368 0
	movl	$0, -28(%rbp)	#, i
	jmp	.L81	#
.L85:
	.loc 18 369 0
	movl	-28(%rbp), %eax	# i, tmp119
	movzbl	flightMode_boxId_map.6339(%rax), %eax	# flightMode_boxId_map, D.7571
	cmpb	$-1, %al	#, D.7571
	je	.L97	#,
	.loc 18 371 0
	movl	-28(%rbp), %eax	# i, tmp120
	movl	$1, %edx	#, tmp121
	movl	%eax, %ecx	# tmp120, tmp138
	sall	%cl, %edx	# tmp138, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	andl	-8(%rbp), %eax	# flightModeCopyMask, D.7573
	testl	%eax, %eax	# D.7573
	je	.L98	#,
	.loc 18 373 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.7574
	movzwl	%ax, %edx	# D.7574, D.7572
	movl	-28(%rbp), %eax	# i, tmp122
	movl	%eax, %ecx	# tmp122, tmp140
	sarl	%cl, %edx	# tmp140, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	andl	$1, %eax	#, D.7572
	testl	%eax, %eax	# D.7572
	je	.L83	#,
	.loc 18 374 0
	movl	-28(%rbp), %eax	# i, tmp123
	movzbl	flightMode_boxId_map.6339(%rax), %eax	# flightMode_boxId_map, D.7571
	movsbl	%al, %eax	# D.7571, D.7572
	movl	$1, %edx	#, tmp124
	movl	%eax, %ecx	# D.7572, tmp142
	sall	%cl, %edx	# tmp142, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	orl	%eax, -32(%rbp)	# D.7573, boxEnabledMask
	jmp	.L83	#
.L97:
	.loc 18 370 0
	nop
	jmp	.L83	#
.L98:
	.loc 18 372 0
	nop
.L83:
	.loc 18 368 0 discriminator 2
	addl	$1, -28(%rbp)	#, i
.L81:
	.loc 18 368 0 is_stmt 0 discriminator 1
	cmpl	$11, -28(%rbp)	#, i
	jbe	.L85	#,
.LBE11:
	.loc 18 380 0 is_stmt 1
	movl	$169865664, -4(%rbp)	#, rcModeCopyMask
.LBB12:
	.loc 18 383 0
	movl	$0, -24(%rbp)	#, i
	jmp	.L86	#
.L89:
	.loc 18 384 0
	movl	-24(%rbp), %eax	# i, tmp125
	movl	$1, %edx	#, tmp126
	movl	%eax, %ecx	# tmp125, tmp144
	sall	%cl, %edx	# tmp144, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	andl	-4(%rbp), %eax	# rcModeCopyMask, D.7573
	testl	%eax, %eax	# D.7573
	je	.L99	#,
	.loc 18 386 0
	movl	-24(%rbp), %eax	# i, tmp127
	movl	%eax, %edi	# tmp127,
	call	rcModeIsActive	#
	testb	%al, %al	# D.7575
	je	.L88	#,
	.loc 18 387 0
	movl	-24(%rbp), %eax	# i, tmp128
	movl	$1, %edx	#, tmp129
	movl	%eax, %ecx	# tmp128, tmp146
	sall	%cl, %edx	# tmp146, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	orl	%eax, -32(%rbp)	# D.7573, boxEnabledMask
	jmp	.L88	#
.L99:
	.loc 18 385 0
	nop
.L88:
	.loc 18 383 0 discriminator 2
	addl	$1, -24(%rbp)	#, i
.L86:
	.loc 18 383 0 is_stmt 0 discriminator 1
	cmpl	$31, -24(%rbp)	#, i
	jbe	.L89	#,
.LBE12:
	.loc 18 391 0 is_stmt 1
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.7576
	movzbl	%al, %eax	# D.7576, D.7572
	andl	$4, %eax	#, D.7572
	testl	%eax, %eax	# D.7572
	je	.L90	#,
	.loc 18 392 0
	orl	$1, -32(%rbp)	#, boxEnabledMask
.L90:
	.loc 18 396 0
	movl	$0, -20(%rbp)	#, mspBoxEnabledMask
	.loc 18 397 0
	movl	$0, -16(%rbp)	#, mspBoxIdx
.LBB13:
	.loc 18 398 0
	movl	$0, -12(%rbp)	#, boxId
	jmp	.L91	#
.L95:
	.loc 18 399 0
	movl	-12(%rbp), %eax	# boxId, tmp130
	movl	$1, %edx	#, tmp131
	movl	%eax, %ecx	# tmp130, tmp148
	sall	%cl, %edx	# tmp148, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	movl	%eax, %edx	# D.7572, D.7573
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.7573
	andl	%edx, %eax	# D.7573, D.7573
	testl	%eax, %eax	# D.7573
	je	.L100	#,
	.loc 18 401 0
	movl	-12(%rbp), %eax	# boxId, tmp132
	movl	$1, %edx	#, tmp133
	movl	%eax, %ecx	# tmp132, tmp150
	sall	%cl, %edx	# tmp150, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	andl	-32(%rbp), %eax	# boxEnabledMask, D.7573
	testl	%eax, %eax	# D.7573
	je	.L94	#,
	.loc 18 402 0
	movl	-16(%rbp), %eax	# mspBoxIdx, tmp134
	movl	$1, %edx	#, tmp135
	movl	%eax, %ecx	# tmp134, tmp152
	sall	%cl, %edx	# tmp152, D.7572
	movl	%edx, %eax	# D.7572, D.7572
	orl	%eax, -20(%rbp)	# D.7573, mspBoxEnabledMask
.L94:
	.loc 18 403 0
	addl	$1, -16(%rbp)	#, mspBoxIdx
	jmp	.L93	#
.L100:
	.loc 18 400 0
	nop
.L93:
	.loc 18 398 0 discriminator 2
	addl	$1, -12(%rbp)	#, boxId
.L91:
	.loc 18 398 0 is_stmt 0 discriminator 1
	cmpl	$27, -12(%rbp)	#, boxId
	jbe	.L95	#,
.LBE13:
	.loc 18 405 0 is_stmt 1
	movl	-20(%rbp), %eax	# mspBoxEnabledMask, D.7577
	.loc 18 406 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE78:
	.size	packFlightModeFlags, .-packFlightModeFlags
	.section	.text.serializeSDCardSummaryReply,"ax",@progbits
	.type	serializeSDCardSummaryReply, @function
serializeSDCardSummaryReply:
.LFB79:
	.loc 18 409 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# reply, reply
	.loc 18 410 0
	movq	-24(%rbp), %rax	# reply, tmp87
	movq	%rax, -8(%rbp)	# tmp87, dst
	.loc 18 448 0
	movq	-8(%rbp), %rax	# dst, tmp88
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	sbufWriteU8	#
	.loc 18 449 0
	movq	-8(%rbp), %rax	# dst, tmp89
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	sbufWriteU8	#
	.loc 18 450 0
	movq	-8(%rbp), %rax	# dst, tmp90
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	sbufWriteU8	#
	.loc 18 451 0
	movq	-8(%rbp), %rax	# dst, tmp91
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	sbufWriteU32	#
	.loc 18 452 0
	movq	-8(%rbp), %rax	# dst, tmp92
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp92,
	call	sbufWriteU32	#
	.loc 18 454 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE79:
	.size	serializeSDCardSummaryReply, .-serializeSDCardSummaryReply
	.section	.text.serializeDataflashSummaryReply,"ax",@progbits
	.type	serializeDataflashSummaryReply, @function
serializeDataflashSummaryReply:
.LFB80:
	.loc 18 457 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# reply, reply
	.loc 18 458 0
	movq	-24(%rbp), %rax	# reply, tmp87
	movq	%rax, -8(%rbp)	# tmp87, dst
	.loc 18 468 0
	movq	-8(%rbp), %rax	# dst, tmp88
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	sbufWriteU8	#
	.loc 18 469 0
	movq	-8(%rbp), %rax	# dst, tmp89
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	sbufWriteU32	#
	.loc 18 470 0
	movq	-8(%rbp), %rax	# dst, tmp90
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	sbufWriteU32	#
	.loc 18 471 0
	movq	-8(%rbp), %rax	# dst, tmp91
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	sbufWriteU32	#
	.loc 18 473 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE80:
	.size	serializeDataflashSummaryReply, .-serializeDataflashSummaryReply
	.section	.text.mspServerCommandHandler,"ax",@progbits
	.globl	mspServerCommandHandler
	.type	mspServerCommandHandler, @function
mspServerCommandHandler:
.LFB81:
	.loc 18 489 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$344, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -344(%rbp)	# cmd, cmd
	movq	%rsi, -352(%rbp)	# reply, reply
	.loc 18 489 0
	movq	%fs:40, %rax	#, tmp1163
	movq	%rax, -24(%rbp)	# tmp1163, D.7617
	xorl	%eax, %eax	# tmp1163
	.loc 18 490 0
	movq	-352(%rbp), %rax	# reply, tmp731
	movq	%rax, -160(%rbp)	# tmp731, dst
	.loc 18 491 0
	movq	-344(%rbp), %rax	# cmd, tmp732
	movq	%rax, -152(%rbp)	# tmp732, src
	.loc 18 493 0
	movq	-152(%rbp), %rax	# src, tmp733
	movq	%rax, %rdi	# tmp733,
	call	sbufBytesRemaining	#
	movl	%eax, -216(%rbp)	# tmp734, len
	.loc 18 495 0
	movq	-344(%rbp), %rax	# cmd, tmp735
	movzwl	16(%rax), %eax	# cmd_68(D)->cmd, D.7580
	cwtl
	cmpl	$254, %eax	#, D.7579
	ja	.L104	#,
	movl	%eax, %eax	# D.7579, tmp736
	movq	.L106(,%rax,8), %rax	#, tmp737
	jmp	*%rax	# tmp737
	.section	.rodata.mspServerCommandHandler,"a",@progbits
	.align 8
	.align 4
.L106:
	.quad	.L104
	.quad	.L105
	.quad	.L107
	.quad	.L108
	.quad	.L109
	.quad	.L110
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L111
	.quad	.L112
	.quad	.L113
	.quad	.L114
	.quad	.L115
	.quad	.L116
	.quad	.L117
	.quad	.L118
	.quad	.L119
	.quad	.L120
	.quad	.L121
	.quad	.L104
	.quad	.L122
	.quad	.L123
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L124
	.quad	.L125
	.quad	.L126
	.quad	.L127
	.quad	.L128
	.quad	.L129
	.quad	.L130
	.quad	.L131
	.quad	.L132
	.quad	.L133
	.quad	.L134
	.quad	.L135
	.quad	.L136
	.quad	.L104
	.quad	.L137
	.quad	.L138
	.quad	.L139
	.quad	.L140
	.quad	.L141
	.quad	.L142
	.quad	.L143
	.quad	.L104
	.quad	.L104
	.quad	.L144
	.quad	.L145
	.quad	.L146
	.quad	.L147
	.quad	.L148
	.quad	.L149
	.quad	.L150
	.quad	.L151
	.quad	.L104
	.quad	.L152
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L153
	.quad	.L154
	.quad	.L155
	.quad	.L104
	.quad	.L156
	.quad	.L157
	.quad	.L104
	.quad	.L104
	.quad	.L158
	.quad	.L159
	.quad	.L160
	.quad	.L161
	.quad	.L162
	.quad	.L104
	.quad	.L163
	.quad	.L164
	.quad	.L165
	.quad	.L166
	.quad	.L104
	.quad	.L167
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L168
	.quad	.L169
	.quad	.L170
	.quad	.L104
	.quad	.L171
	.quad	.L172
	.quad	.L173
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L174
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L175
	.quad	.L104
	.quad	.L176
	.quad	.L104
	.quad	.L177
	.quad	.L178
	.quad	.L179
	.quad	.L180
	.quad	.L181
	.quad	.L104
	.quad	.L182
	.quad	.L183
	.quad	.L280
	.quad	.L104
	.quad	.L185
	.quad	.L104
	.quad	.L104
	.quad	.L186
	.quad	.L187
	.quad	.L188
	.quad	.L189
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L190
	.quad	.L191
	.quad	.L104
	.quad	.L280
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L193
	.quad	.L104
	.quad	.L104
	.quad	.L104
	.quad	.L194
	.section	.text.mspServerCommandHandler
.L105:
.LBB14:
	.loc 18 497 0
	movq	-160(%rbp), %rax	# dst, tmp738
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp738,
	call	sbufWriteU8	#
	.loc 18 499 0
	movq	-160(%rbp), %rax	# dst, tmp739
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp739,
	call	sbufWriteU8	#
	.loc 18 500 0
	movq	-160(%rbp), %rax	# dst, tmp740
	movl	$22, %esi	#,
	movq	%rax, %rdi	# tmp740,
	call	sbufWriteU8	#
	.loc 18 501 0
	jmp	.L195	#
.L107:
	.loc 18 504 0
	movl	$.LC0, %ecx	#, D.7593
	movq	-160(%rbp), %rax	# dst, tmp741
	movl	$4, %edx	#,
	movq	%rcx, %rsi	# D.7593,
	movq	%rax, %rdi	# tmp741,
	call	sbufWriteData	#
	.loc 18 505 0
	jmp	.L195	#
.L108:
	.loc 18 508 0
	movq	-160(%rbp), %rax	# dst, tmp742
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp742,
	call	sbufWriteU8	#
	.loc 18 509 0
	movq	-160(%rbp), %rax	# dst, tmp743
	movl	$14, %esi	#,
	movq	%rax, %rdi	# tmp743,
	call	sbufWriteU8	#
	.loc 18 510 0
	movq	-160(%rbp), %rax	# dst, tmp744
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp744,
	call	sbufWriteU8	#
	.loc 18 511 0
	jmp	.L195	#
.L109:
	.loc 18 514 0
	movl	$.LC1, %ecx	#, D.7593
	movq	-160(%rbp), %rax	# dst, tmp745
	movl	$4, %edx	#,
	movq	%rcx, %rsi	# D.7593,
	movq	%rax, %rdi	# tmp745,
	call	sbufWriteData	#
	.loc 18 518 0
	movq	-160(%rbp), %rax	# dst, tmp746
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp746,
	call	sbufWriteU16	#
	.loc 18 520 0
	movq	-160(%rbp), %rax	# dst, tmp747
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp747,
	call	sbufWriteU8	#
	.loc 18 521 0
	jmp	.L195	#
.L110:
	.loc 18 524 0
	movq	buildDate(%rip), %rcx	# buildDate, D.7593
	movq	-160(%rbp), %rax	# dst, tmp748
	movl	$11, %edx	#,
	movq	%rcx, %rsi	# D.7593,
	movq	%rax, %rdi	# tmp748,
	call	sbufWriteData	#
	.loc 18 525 0
	movq	buildTime(%rip), %rcx	# buildTime, D.7593
	movq	-160(%rbp), %rax	# dst, tmp749
	movl	$8, %edx	#,
	movq	%rcx, %rsi	# D.7593,
	movq	%rax, %rdi	# tmp749,
	call	sbufWriteData	#
	.loc 18 526 0
	movq	shortGitRevision(%rip), %rcx	# shortGitRevision, D.7593
	movq	-160(%rbp), %rax	# dst, tmp750
	movl	$7, %edx	#,
	movq	%rcx, %rsi	# D.7593,
	movq	%rax, %rdi	# tmp750,
	call	sbufWriteData	#
	.loc 18 527 0
	jmp	.L195	#
.L153:
	.loc 18 531 0
	movq	-160(%rbp), %rax	# dst, tmp751
	movl	$231, %esi	#,
	movq	%rax, %rdi	# tmp751,
	call	sbufWriteU8	#
	.loc 18 532 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _293->mixerMode, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp752
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp752,
	call	sbufWriteU8	#
	.loc 18 533 0
	movq	-160(%rbp), %rax	# dst, tmp753
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp753,
	call	sbufWriteU8	#
	.loc 18 534 0
	movq	-160(%rbp), %rax	# dst, tmp754
	movl	$4, %esi	#,
	movq	%rax, %rdi	# tmp754,
	call	sbufWriteU32	#
	.loc 18 535 0
	jmp	.L195	#
.L154:
	.loc 18 538 0
	movzwl	cycleTime(%rip), %eax	# cycleTime, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp755
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp755,
	call	sbufWriteU16	#
	.loc 18 540 0
	movl	$0, %eax	#,
	call	i2cGetErrorCounter	#
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp756
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp756,
	call	sbufWriteU16	#
	.loc 18 544 0
	movl	$2, %edi	#,
	call	sensors	#
	movzbl	%al, %ebx	# D.7595, D.7596
	movl	$4, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7595, D.7579
	addl	%eax, %eax	# D.7579
	orl	%eax, %ebx	# D.7596, D.7596
	movl	$8, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7595, D.7579
	sall	$2, %eax	#, D.7579
	orl	%eax, %ebx	# D.7596, D.7596
	movl	$32, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7595, D.7579
	sall	$3, %eax	#, D.7579
	orl	%eax, %ebx	# D.7596, D.7596
	movl	$16, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7595, D.7579
	sall	$4, %eax	#, D.7579
	orl	%ebx, %eax	# D.7596, D.7596
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp757
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp757,
	call	sbufWriteU16	#
	.loc 18 545 0
	call	packFlightModeFlags	#
	movl	%eax, %edx	#, D.7578
	movq	-160(%rbp), %rax	# dst, tmp758
	movl	%edx, %esi	# D.7578,
	movq	%rax, %rdi	# tmp758,
	call	sbufWriteU32	#
	.loc 18 546 0
	call	getCurrentProfile	#
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp759
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp759,
	call	sbufWriteU8	#
	.loc 18 547 0
	movzwl	averageSystemLoadPercent(%rip), %eax	# averageSystemLoadPercent, D.7582
	movzwl	%ax, %eax	# D.7582, D.7579
	movl	$100, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp760
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp760,
	call	sbufWriteU16	#
	.loc 18 548 0
	jmp	.L195	#
.L155:
.LBB15:
	.loc 18 552 0
	movzwl	acc+16(%rip), %eax	# acc.acc_1G, D.7582
	cmpw	$1024, %ax	#, D.7582
	jbe	.L196	#,
	.loc 18 552 0 is_stmt 0 discriminator 1
	movl	$3, %eax	#, D.7578
	jmp	.L197	#
.L196:
	.loc 18 552 0 discriminator 2
	movl	$0, %eax	#, D.7578
.L197:
	.loc 18 552 0 discriminator 4
	movl	%eax, -172(%rbp)	# D.7578, scale_shift
.LBB16:
	.loc 18 554 0 is_stmt 1 discriminator 4
	movl	$0, -316(%rbp)	#, i
	jmp	.L198	#
.L199:
	.loc 18 555 0 discriminator 3
	movl	-316(%rbp), %eax	# i, tmp761
	movzwl	accSmooth(%rax,%rax), %eax	# accSmooth, D.7580
	movswl	%ax, %edx	# D.7580, D.7579
	movl	-172(%rbp), %eax	# scale_shift, tmp762
	movl	%eax, %ecx	# tmp762, tmp1167
	sarl	%cl, %edx	# tmp1167, D.7579
	movl	%edx, %eax	# D.7579, D.7579
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp763
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp763,
	call	sbufWriteU16	#
	.loc 18 554 0 discriminator 3
	addl	$1, -316(%rbp)	#, i
.L198:
	.loc 18 554 0 is_stmt 0 discriminator 1
	cmpl	$2, -316(%rbp)	#, i
	jbe	.L199	#,
.LBE16:
.LBB17:
	.loc 18 556 0 is_stmt 1
	movl	$0, -312(%rbp)	#, i
	jmp	.L200	#
.L201:
	.loc 18 557 0 discriminator 3
	movl	-312(%rbp), %eax	# i, tmp764
	movl	gyroADC(,%rax,4), %eax	# gyroADC, D.7579
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp765
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp765,
	call	sbufWriteU16	#
	.loc 18 556 0 discriminator 3
	addl	$1, -312(%rbp)	#, i
.L200:
	.loc 18 556 0 is_stmt 0 discriminator 1
	cmpl	$2, -312(%rbp)	#, i
	jbe	.L201	#,
.LBE17:
.LBB18:
	.loc 18 558 0 is_stmt 1
	movl	$0, -308(%rbp)	#, i
	jmp	.L202	#
.L203:
	.loc 18 559 0 discriminator 3
	movl	-308(%rbp), %eax	# i, tmp766
	movl	magADC(,%rax,4), %eax	# magADC, D.7579
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp767
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp767,
	call	sbufWriteU16	#
	.loc 18 558 0 discriminator 3
	addl	$1, -308(%rbp)	#, i
.L202:
	.loc 18 558 0 is_stmt 0 discriminator 1
	cmpl	$2, -308(%rbp)	#, i
	jbe	.L203	#,
.LBE18:
	.loc 18 560 0 is_stmt 1
	jmp	.L195	#
.L156:
.LBE15:
.LBB19:
	.loc 18 595 0
	movl	$0, -304(%rbp)	#, i
	jmp	.L204	#
.L207:
	.loc 18 596 0
	cmpl	$3, -304(%rbp)	#, i
	ja	.L205	#,
	.loc 18 596 0 is_stmt 0 discriminator 1
	movl	-304(%rbp), %eax	# i, tmp768
	movzwl	motor(%rax,%rax), %eax	# motor, D.7580
	movzwl	%ax, %eax	# D.7582, D.7579
	jmp	.L206	#
.L205:
	.loc 18 596 0 discriminator 2
	movl	$0, %eax	#, D.7579
.L206:
	.loc 18 596 0 discriminator 4
	movq	-160(%rbp), %rdx	# dst, tmp769
	movl	%eax, %esi	# D.7579,
	movq	%rdx, %rdi	# tmp769,
	call	sbufWriteU16	#
	.loc 18 595 0 is_stmt 1 discriminator 4
	addl	$1, -304(%rbp)	#, i
.L204:
	.loc 18 595 0 is_stmt 0 discriminator 2
	cmpl	$7, -304(%rbp)	#, i
	jbe	.L207	#,
.LBE19:
	.loc 18 598 0 is_stmt 1
	jmp	.L195	#
.L157:
.LBB20:
	.loc 18 601 0
	movl	$0, -300(%rbp)	#, i
	jmp	.L208	#
.L209:
	.loc 18 602 0 discriminator 3
	movl	-300(%rbp), %eax	# i, tmp771
	cltq
	movzwl	rcData(%rax,%rax), %eax	# rcData, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp772
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp772,
	call	sbufWriteU16	#
	.loc 18 601 0 discriminator 3
	addl	$1, -300(%rbp)	#, i
.L208:
	.loc 18 601 0 is_stmt 0 discriminator 1
	movzbl	rxRuntimeConfig(%rip), %eax	# rxRuntimeConfig.channelCount, D.7583
	movzbl	%al, %eax	# D.7583, D.7579
	cmpl	-300(%rbp), %eax	# i, D.7579
	jg	.L209	#,
.LBE20:
	.loc 18 603 0 is_stmt 1
	jmp	.L195	#
.L158:
	.loc 18 606 0
	movzwl	attitude(%rip), %eax	# attitude.values.roll, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp773
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp773,
	call	sbufWriteU16	#
	.loc 18 607 0
	movzwl	attitude+2(%rip), %eax	# attitude.values.pitch, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp774
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp774,
	call	sbufWriteU16	#
	.loc 18 608 0
	movzwl	attitude+4(%rip), %eax	# attitude.values.yaw, D.7580
	movswl	%ax, %edx	# D.7580, tmp775
	imull	$26215, %edx, %edx	#, tmp775, tmp776
	shrl	$16, %edx	#, tmp777
	sarw	$2, %dx	#, tmp778
	sarw	$15, %ax	#, tmp779
	subl	%eax, %edx	# tmp779, D.7580
	movl	%edx, %eax	# D.7580, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp780
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp780,
	call	sbufWriteU16	#
	.loc 18 609 0
	jmp	.L195	#
.L159:
	.loc 18 616 0
	movq	-160(%rbp), %rax	# dst, tmp781
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp781,
	call	sbufWriteU32	#
	.loc 18 617 0
	movq	-160(%rbp), %rax	# dst, tmp782
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp782,
	call	sbufWriteU16	#
	.loc 18 619 0
	jmp	.L195	#
.L132:
	.loc 18 625 0
	movq	-160(%rbp), %rax	# dst, tmp783
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp783,
	call	sbufWriteU32	#
	.loc 18 627 0
	jmp	.L195	#
.L160:
.LBB21:
	.loc 18 630 0
	call	batteryConfig	#
	movzbl	6(%rax), %eax	# _407->amperageMeterSource, D.7583
	movzbl	%al, %eax	# D.7583, D.7598
	movl	%eax, %edi	# D.7598,
	call	getAmperageMeter	#
	movq	%rax, -112(%rbp)	# tmp784, amperageMeter
	.loc 18 632 0
	movzwl	vbat(%rip), %eax	# vbat, D.7582
	movzwl	%ax, %eax	# D.7582, D.7579
	movl	$255, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp785
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp785,
	call	sbufWriteU8	#
	.loc 18 633 0
	movq	-112(%rbp), %rax	# amperageMeter, tmp786
	movl	4(%rax), %eax	# amperageMeter_411->mAhDrawn, D.7579
	movl	$65535, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp787
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp787,
	call	sbufWriteU16	#
	.loc 18 634 0
	movzwl	rssi(%rip), %eax	# rssi, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp788
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp788,
	call	sbufWriteU16	#
	.loc 18 636 0
	call	mspServerConfig	#
	movzbl	(%rax), %eax	# _429->multiwiiCurrentMeterOutput, D.7583
	testb	%al, %al	# D.7583
	je	.L210	#,
	.loc 18 637 0
	movq	-112(%rbp), %rax	# amperageMeter, tmp789
	movl	(%rax), %edx	# amperageMeter_411->amperage, D.7579
	movl	%edx, %eax	# D.7579, tmp790
	sall	$2, %eax	#, tmp790
	addl	%edx, %eax	# D.7579, tmp790
	addl	%eax, %eax	# tmp791
	movl	$65535, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp792
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp792,
	call	sbufWriteU16	#
	.loc 18 641 0
	jmp	.L195	#
.L210:
	.loc 18 639 0
	movq	-112(%rbp), %rax	# amperageMeter, tmp793
	movl	(%rax), %eax	# amperageMeter_411->amperage, D.7579
	movl	$32767, %edx	#,
	movl	$-32768, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp794
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp794,
	call	sbufWriteU16	#
	.loc 18 641 0
	jmp	.L195	#
.L135:
.LBE21:
	.loc 18 645 0
	call	armingConfig	#
	movzbl	2(%rax), %eax	# _445->auto_disarm_delay, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp795
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp795,
	call	sbufWriteU8	#
	.loc 18 646 0
	call	armingConfig	#
	movzbl	1(%rax), %eax	# _450->disarm_kill_switch, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp796
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp796,
	call	sbufWriteU8	#
	.loc 18 647 0
	jmp	.L195	#
.L144:
	.loc 18 650 0
	call	imuConfig	#
	movzwl	(%rax), %eax	# _455->looptime, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp797
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp797,
	call	sbufWriteU16	#
	.loc 18 651 0
	jmp	.L195	#
.L161:
	.loc 18 654 0
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movzbl	(%rax), %eax	# _459->rcRate8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp798
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp798,
	call	sbufWriteU8	#
	.loc 18 655 0
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movzbl	1(%rax), %eax	# _463->rcExpo8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp799
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp799,
	call	sbufWriteU8	#
.LBB22:
	.loc 18 656 0
	movl	$0, -296(%rbp)	#, i
	jmp	.L212	#
.L213:
	.loc 18 657 0 discriminator 3
	movq	currentControlRateProfile(%rip), %rdx	# currentControlRateProfile, D.7588
	movl	-296(%rbp), %eax	# i, tmp800
	movzbl	4(%rdx,%rax), %eax	# _468->rates, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp801
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp801,
	call	sbufWriteU8	#
	.loc 18 656 0 discriminator 3
	addl	$1, -296(%rbp)	#, i
.L212:
	.loc 18 656 0 is_stmt 0 discriminator 1
	cmpl	$2, -296(%rbp)	#, i
	jbe	.L213	#,
.LBE22:
	.loc 18 659 0 is_stmt 1
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movzbl	7(%rax), %eax	# _473->dynThrPID, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp802
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp802,
	call	sbufWriteU8	#
	.loc 18 660 0
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movzbl	2(%rax), %eax	# _477->thrMid8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp803
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp803,
	call	sbufWriteU8	#
	.loc 18 661 0
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movzbl	3(%rax), %eax	# _481->thrExpo8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp804
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp804,
	call	sbufWriteU8	#
	.loc 18 662 0
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movzwl	10(%rax), %eax	# _485->tpa_breakpoint, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp805
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp805,
	call	sbufWriteU16	#
	.loc 18 663 0
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movzbl	8(%rax), %eax	# _489->rcYawExpo8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp806
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp806,
	call	sbufWriteU8	#
	.loc 18 664 0
	jmp	.L195	#
.L162:
.LBB23:
	.loc 18 667 0
	movl	$0, -292(%rbp)	#, i
	jmp	.L214	#
.L215:
	.loc 18 668 0 discriminator 3
	call	pidProfile	#
	movq	%rax, %rdx	#, D.7602
	movl	-292(%rbp), %eax	# i, tmp808
	cltq
	movzbl	(%rdx,%rax), %eax	# _495->P8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp809
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp809,
	call	sbufWriteU8	#
	.loc 18 669 0 discriminator 3
	call	pidProfile	#
	movq	%rax, %rdx	#, D.7602
	movl	-292(%rbp), %eax	# i, tmp811
	cltq
	movzbl	10(%rdx,%rax), %eax	# _500->I8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp812
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp812,
	call	sbufWriteU8	#
	.loc 18 670 0 discriminator 3
	call	pidProfile	#
	movq	%rax, %rdx	#, D.7602
	movl	-292(%rbp), %eax	# i, tmp814
	cltq
	movzbl	20(%rdx,%rax), %eax	# _505->D8, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp815
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp815,
	call	sbufWriteU8	#
	.loc 18 667 0 discriminator 3
	addl	$1, -292(%rbp)	#, i
.L214:
	.loc 18 667 0 is_stmt 0 discriminator 1
	cmpl	$9, -292(%rbp)	#, i
	jle	.L215	#,
.LBE23:
	.loc 18 672 0 is_stmt 1
	jmp	.L195	#
.L166:
	.loc 18 675 0
	movq	-160(%rbp), %rax	# dst, tmp816
	movl	$pidnames, %esi	#,
	movq	%rax, %rdi	# tmp816,
	call	sbufWriteString	#
	.loc 18 676 0
	jmp	.L195	#
.L133:
	.loc 18 679 0
	call	pidProfile	#
	movzbl	30(%rax), %eax	# _512->pidController, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp817
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp817,
	call	sbufWriteU8	#
	.loc 18 680 0
	jmp	.L195	#
.L113:
.LBB24:
	.loc 18 683 0
	movl	$0, -288(%rbp)	#, i
	jmp	.L216	#
.L217:
.LBB25:
	.loc 18 684 0 discriminator 3
	call	modeActivationProfile	#
	movq	%rax, %rdx	#, D.7584
	movl	-288(%rbp), %eax	# i, tmp819
	cltq
	salq	$3, %rax	#, tmp820
	addq	%rdx, %rax	# D.7584, tmp821
	movq	%rax, -104(%rbp)	# tmp821, mac
	.loc 18 685 0 discriminator 3
	movq	-104(%rbp), %rax	# mac, tmp822
	movl	(%rax), %eax	# mac_519->modeId, D.7585
	movzbl	%al, %eax	# D.7583, D.7579
	movl	%eax, %edi	# D.7579,
	call	findBoxByBoxId	#
	movq	%rax, -96(%rbp)	# tmp823, box
	.loc 18 686 0 discriminator 3
	movq	-96(%rbp), %rax	# box, tmp824
	movzbl	9(%rax), %eax	# box_524->permanentId, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp825
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp825,
	call	sbufWriteU8	#
	.loc 18 687 0 discriminator 3
	movq	-104(%rbp), %rax	# mac, tmp826
	movzbl	4(%rax), %eax	# mac_519->auxChannelIndex, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp827
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp827,
	call	sbufWriteU8	#
	.loc 18 688 0 discriminator 3
	movq	-104(%rbp), %rax	# mac, tmp828
	movzbl	5(%rax), %eax	# mac_519->range.startStep, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp829
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp829,
	call	sbufWriteU8	#
	.loc 18 689 0 discriminator 3
	movq	-104(%rbp), %rax	# mac, tmp830
	movzbl	6(%rax), %eax	# mac_519->range.endStep, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp831
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp831,
	call	sbufWriteU8	#
.LBE25:
	.loc 18 683 0 discriminator 3
	addl	$1, -288(%rbp)	#, i
.L216:
	.loc 18 683 0 is_stmt 0 discriminator 1
	cmpl	$19, -288(%rbp)	#, i
	jle	.L217	#,
.LBE24:
	.loc 18 691 0 is_stmt 1
	jmp	.L195	#
.L126:
.LBB26:
	.loc 18 694 0
	movl	$0, -284(%rbp)	#, i
	jmp	.L218	#
.L219:
.LBB27:
	.loc 18 695 0 discriminator 3
	call	adjustmentProfile	#
	movq	%rax, %rcx	#, D.7587
	movl	-284(%rbp), %eax	# i, tmp833
	movslq	%eax, %rdx	# tmp833, tmp832
	movq	%rdx, %rax	# tmp832, tmp834
	addq	%rax, %rax	# tmp834
	addq	%rdx, %rax	# tmp832, tmp834
	addq	%rax, %rax	# tmp835
	addq	%rcx, %rax	# D.7587, tmp836
	movq	%rax, -88(%rbp)	# tmp836, adjRange
	.loc 18 696 0 discriminator 3
	movq	-88(%rbp), %rax	# adjRange, tmp837
	movzbl	5(%rax), %eax	# adjRange_541->adjustmentIndex, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp838
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp838,
	call	sbufWriteU8	#
	.loc 18 697 0 discriminator 3
	movq	-88(%rbp), %rax	# adjRange, tmp839
	movzbl	(%rax), %eax	# adjRange_541->auxChannelIndex, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp840
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp840,
	call	sbufWriteU8	#
	.loc 18 698 0 discriminator 3
	movq	-88(%rbp), %rax	# adjRange, tmp841
	movzbl	1(%rax), %eax	# adjRange_541->range.startStep, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp842
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp842,
	call	sbufWriteU8	#
	.loc 18 699 0 discriminator 3
	movq	-88(%rbp), %rax	# adjRange, tmp843
	movzbl	2(%rax), %eax	# adjRange_541->range.endStep, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp844
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp844,
	call	sbufWriteU8	#
	.loc 18 700 0 discriminator 3
	movq	-88(%rbp), %rax	# adjRange, tmp845
	movzbl	3(%rax), %eax	# adjRange_541->adjustmentFunction, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp846
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp846,
	call	sbufWriteU8	#
	.loc 18 701 0 discriminator 3
	movq	-88(%rbp), %rax	# adjRange, tmp847
	movzbl	4(%rax), %eax	# adjRange_541->auxSwitchChannelIndex, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp848
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp848,
	call	sbufWriteU8	#
.LBE27:
	.loc 18 694 0 discriminator 3
	addl	$1, -284(%rbp)	#, i
.L218:
	.loc 18 694 0 is_stmt 0 discriminator 1
	cmpl	$11, -284(%rbp)	#, i
	jle	.L219	#,
.LBE26:
	.loc 18 703 0 is_stmt 1
	jmp	.L195	#
.L165:
	.loc 18 706 0
	movq	-352(%rbp), %rax	# reply, tmp849
	movq	%rax, %rdi	# tmp849,
	call	serializeBoxNamesReply	#
	.loc 18 707 0
	jmp	.L195	#
.L167:
	.loc 18 710 0
	movq	-352(%rbp), %rax	# reply, tmp850
	movq	%rax, %rdi	# tmp850,
	call	serializeBoxIdsReply	#
	.loc 18 711 0
	jmp	.L195	#
.L163:
	.loc 18 714 0
	call	rxConfig	#
	movzwl	16(%rax), %eax	# _564->midrc, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp851
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp851,
	call	sbufWriteU16	#
	.loc 18 716 0
	call	motorAndServoConfig	#
	movzwl	(%rax), %eax	# _569->minthrottle, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp852
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp852,
	call	sbufWriteU16	#
	.loc 18 717 0
	call	motorAndServoConfig	#
	movzwl	2(%rax), %eax	# _574->maxthrottle, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp853
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp853,
	call	sbufWriteU16	#
	.loc 18 718 0
	call	motorAndServoConfig	#
	movzwl	4(%rax), %eax	# _579->mincommand, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp854
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp854,
	call	sbufWriteU16	#
	.loc 18 720 0
	call	failsafeConfig	#
	movzwl	2(%rax), %eax	# _584->failsafe_throttle, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp855
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp855,
	call	sbufWriteU16	#
	.loc 18 727 0
	movq	-160(%rbp), %rax	# dst, tmp856
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp856,
	call	sbufWriteU8	#
	.loc 18 728 0
	movq	-160(%rbp), %rax	# dst, tmp857
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp857,
	call	sbufWriteU8	#
	.loc 18 729 0
	movq	-160(%rbp), %rax	# dst, tmp858
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp858,
	call	sbufWriteU8	#
	.loc 18 731 0
	call	mspServerConfig	#
	movzbl	(%rax), %eax	# _592->multiwiiCurrentMeterOutput, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp859
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp859,
	call	sbufWriteU8	#
	.loc 18 732 0
	call	rxConfig	#
	movzbl	11(%rax), %eax	# _597->rssi_channel, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp860
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp860,
	call	sbufWriteU8	#
	.loc 18 733 0
	movq	-160(%rbp), %rax	# dst, tmp861
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp861,
	call	sbufWriteU8	#
	.loc 18 735 0
	call	compassConfig	#
	movzwl	(%rax), %eax	# _603->mag_declination, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp862
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp862,
	call	sbufWriteU16	#
	.loc 18 736 0
	jmp	.L195	#
.L164:
.LBB28:
	.loc 18 740 0
	movl	$0, -280(%rbp)	#, i
	jmp	.L220	#
.L221:
	.loc 18 741 0 discriminator 3
	movl	-280(%rbp), %eax	# i, tmp863
	addl	$1, %eax	#, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp864
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp864,
	call	sbufWriteU8	#
	.loc 18 740 0 discriminator 3
	addl	$1, -280(%rbp)	#, i
.L220:
	.loc 18 740 0 is_stmt 0 discriminator 1
	cmpl	$7, -280(%rbp)	#, i
	jle	.L221	#,
.LBE28:
	.loc 18 742 0 is_stmt 1
	jmp	.L195	#
.L194:
.LBB29:
	.loc 18 796 0
	movl	$0, -276(%rbp)	#, i
	jmp	.L222	#
.L223:
	.loc 18 797 0 discriminator 3
	movl	-276(%rbp), %eax	# i, tmp866
	cltq
	movzwl	debug(%rax,%rax), %eax	# debug, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp867
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp867,
	call	sbufWriteU16	#
	.loc 18 796 0 discriminator 3
	addl	$1, -276(%rbp)	#, i
.L222:
	.loc 18 796 0 is_stmt 0 discriminator 1
	cmpl	$3, -276(%rbp)	#, i
	jle	.L223	#,
.LBE29:
	.loc 18 798 0 is_stmt 1
	jmp	.L195	#
.L191:
	.loc 18 802 0
	call	accelerometerConfig	#
	movzwl	2(%rax), %eax	# _621->accelerometerTrims.values.pitch, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp868
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp868,
	call	sbufWriteU16	#
	.loc 18 803 0
	call	accelerometerConfig	#
	movzwl	(%rax), %eax	# _627->accelerometerTrims.values.roll, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp869
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp869,
	call	sbufWriteU16	#
	.loc 18 804 0
	jmp	.L195	#
.L174:
	.loc 18 807 0
	movl	U_ID_0(%rip), %edx	# U_ID_0, D.7578
	movq	-160(%rbp), %rax	# dst, tmp870
	movl	%edx, %esi	# D.7578,
	movq	%rax, %rdi	# tmp870,
	call	sbufWriteU32	#
	.loc 18 808 0
	movl	U_ID_1(%rip), %edx	# U_ID_1, D.7578
	movq	-160(%rbp), %rax	# dst, tmp871
	movl	%edx, %esi	# D.7578,
	movq	%rax, %rdi	# tmp871,
	call	sbufWriteU32	#
	.loc 18 809 0
	movl	U_ID_2(%rip), %edx	# U_ID_2, D.7578
	movq	-160(%rbp), %rax	# dst, tmp872
	movl	%edx, %esi	# D.7578,
	movq	%rax, %rdi	# tmp872,
	call	sbufWriteU32	#
	.loc 18 810 0
	jmp	.L195	#
.L115:
	.loc 18 813 0
	call	featureMask	#
	movl	%eax, %edx	#, D.7578
	movq	-160(%rbp), %rax	# dst, tmp873
	movl	%edx, %esi	# D.7578,
	movq	%rax, %rdi	# tmp873,
	call	sbufWriteU32	#
	.loc 18 814 0
	jmp	.L195	#
.L117:
	.loc 18 817 0
	call	boardAlignment	#
	movzwl	(%rax), %eax	# _642->rollDegrees, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp874
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp874,
	call	sbufWriteU16	#
	.loc 18 818 0
	call	boardAlignment	#
	movzwl	2(%rax), %eax	# _648->pitchDegrees, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp875
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp875,
	call	sbufWriteU16	#
	.loc 18 819 0
	call	boardAlignment	#
	movzwl	4(%rax), %eax	# _654->yawDegrees, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp876
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp876,
	call	sbufWriteU16	#
	.loc 18 820 0
	jmp	.L195	#
.L130:
.LBB30:
	.loc 18 823 0
	movl	$0, -272(%rbp)	#, i
	jmp	.L224	#
.L225:
	.loc 18 824 0 discriminator 3
	movl	-272(%rbp), %eax	# i, tmp877
	movl	%eax, %edi	# tmp877,
	call	voltageMeterConfig	#
	movzbl	(%rax), %eax	# _661->vbatscale, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp878
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp878,
	call	sbufWriteU8	#
	.loc 18 825 0 discriminator 3
	movl	-272(%rbp), %eax	# i, tmp879
	movl	%eax, %edi	# tmp879,
	call	voltageMeterConfig	#
	movzbl	1(%rax), %eax	# _666->vbatresdivval, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp880
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp880,
	call	sbufWriteU8	#
	.loc 18 826 0 discriminator 3
	movl	-272(%rbp), %eax	# i, tmp881
	movl	%eax, %edi	# tmp881,
	call	voltageMeterConfig	#
	movzbl	2(%rax), %eax	# _671->vbatresdivmultiplier, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp882
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp882,
	call	sbufWriteU8	#
	.loc 18 823 0 discriminator 3
	addl	$1, -272(%rbp)	#, i
.L224:
	.loc 18 823 0 is_stmt 0 discriminator 1
	cmpl	$0, -272(%rbp)	#, i
	jle	.L225	#,
.LBE30:
	.loc 18 828 0 is_stmt 1
	jmp	.L195	#
.L119:
.LBB31:
	.loc 18 831 0
	movl	$0, -268(%rbp)	#, i
	jmp	.L226	#
.L227:
	.loc 18 832 0 discriminator 3
	movl	-268(%rbp), %eax	# i, tmp883
	movl	%eax, %edi	# tmp883,
	call	amperageMeterConfig	#
	movzwl	(%rax), %eax	# _678->scale, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp884
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp884,
	call	sbufWriteU16	#
	.loc 18 833 0 discriminator 3
	movl	-268(%rbp), %eax	# i, tmp885
	movl	%eax, %edi	# tmp885,
	call	amperageMeterConfig	#
	movzwl	2(%rax), %eax	# _684->offset, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp886
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp886,
	call	sbufWriteU16	#
	.loc 18 831 0 discriminator 3
	addl	$1, -268(%rbp)	#, i
.L226:
	.loc 18 831 0 is_stmt 0 discriminator 1
	cmpl	$1, -268(%rbp)	#, i
	jle	.L227	#,
.LBE31:
	.loc 18 835 0 is_stmt 1
	jmp	.L195	#
.L111:
	.loc 18 838 0
	call	batteryConfig	#
	movzbl	1(%rax), %eax	# _690->vbatmincellvoltage, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp887
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp887,
	call	sbufWriteU8	#
	.loc 18 839 0
	call	batteryConfig	#
	movzbl	(%rax), %eax	# _695->vbatmaxcellvoltage, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp888
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp888,
	call	sbufWriteU8	#
	.loc 18 840 0
	call	batteryConfig	#
	movzbl	2(%rax), %eax	# _700->vbatwarningcellvoltage, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp889
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp889,
	call	sbufWriteU8	#
	.loc 18 841 0
	call	batteryConfig	#
	movzwl	4(%rax), %eax	# _705->batteryCapacity, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp890
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp890,
	call	sbufWriteU16	#
	.loc 18 842 0
	call	batteryConfig	#
	movzbl	6(%rax), %eax	# _710->amperageMeterSource, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp891
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp891,
	call	sbufWriteU8	#
	.loc 18 843 0
	jmp	.L195	#
.L121:
	.loc 18 846 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _715->mixerMode, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp892
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp892,
	call	sbufWriteU8	#
	.loc 18 847 0
	jmp	.L195	#
.L122:
	.loc 18 850 0
	call	rxConfig	#
	movzbl	8(%rax), %eax	# _720->serialrx_provider, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp893
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp893,
	call	sbufWriteU8	#
	.loc 18 851 0
	call	rxConfig	#
	movzwl	20(%rax), %eax	# _725->maxcheck, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp894
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp894,
	call	sbufWriteU16	#
	.loc 18 852 0
	call	rxConfig	#
	movzwl	16(%rax), %eax	# _730->midrc, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp895
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp895,
	call	sbufWriteU16	#
	.loc 18 853 0
	call	rxConfig	#
	movzwl	18(%rax), %eax	# _735->mincheck, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp896
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp896,
	call	sbufWriteU16	#
	.loc 18 854 0
	call	rxConfig	#
	movzbl	10(%rax), %eax	# _740->spektrum_sat_bind, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp897
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp897,
	call	sbufWriteU8	#
	.loc 18 855 0
	call	rxConfig	#
	movzwl	22(%rax), %eax	# _745->rx_min_usec, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp898
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp898,
	call	sbufWriteU16	#
	.loc 18 856 0
	call	rxConfig	#
	movzwl	24(%rax), %eax	# _750->rx_max_usec, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp899
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp899,
	call	sbufWriteU16	#
	.loc 18 857 0
	jmp	.L195	#
.L146:
	.loc 18 860 0
	call	failsafeConfig	#
	movzbl	(%rax), %eax	# _755->failsafe_delay, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp900
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp900,
	call	sbufWriteU8	#
	.loc 18 861 0
	call	failsafeConfig	#
	movzbl	1(%rax), %eax	# _760->failsafe_off_delay, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp901
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp901,
	call	sbufWriteU8	#
	.loc 18 862 0
	call	failsafeConfig	#
	movzwl	2(%rax), %eax	# _765->failsafe_throttle, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp902
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp902,
	call	sbufWriteU16	#
	.loc 18 863 0
	call	failsafeConfig	#
	movzbl	4(%rax), %eax	# _770->failsafe_kill_switch, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp903
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp903,
	call	sbufWriteU8	#
	.loc 18 864 0
	call	failsafeConfig	#
	movzwl	5(%rax), %eax	# _775->failsafe_throttle_low_delay, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp904
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp904,
	call	sbufWriteU16	#
	.loc 18 865 0
	call	failsafeConfig	#
	movzbl	7(%rax), %eax	# _780->failsafe_procedure, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp905
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp905,
	call	sbufWriteU8	#
	.loc 18 866 0
	jmp	.L195	#
.L148:
.LBB32:
	.loc 18 869 0
	movl	$0, -264(%rbp)	#, i
	jmp	.L228	#
.L229:
	.loc 18 870 0 discriminator 3
	movl	-264(%rbp), %eax	# i, tmp906
	movl	%eax, %edi	# tmp906,
	call	failsafeChannelConfigs	#
	movzbl	(%rax), %eax	# _788->mode, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp907
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp907,
	call	sbufWriteU8	#
	.loc 18 871 0 discriminator 3
	movl	-264(%rbp), %eax	# i, tmp908
	movl	%eax, %edi	# tmp908,
	call	failsafeChannelConfigs	#
	movzbl	1(%rax), %eax	# _793->step, D.7583
	movzbl	%al, %edx	# D.7583, D.7582
	movl	%edx, %eax	# D.7582, tmp909
	sall	$2, %eax	#, tmp909
	addl	%edx, %eax	# D.7582, tmp909
	leal	0(,%rax,4), %edx	#, tmp910
	addl	%edx, %eax	# tmp910, D.7582
	addw	$750, %ax	#, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp911
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp911,
	call	sbufWriteU16	#
	.loc 18 869 0 discriminator 3
	addl	$1, -264(%rbp)	#, i
.L228:
	.loc 18 869 0 is_stmt 0 discriminator 1
	movzbl	rxRuntimeConfig(%rip), %eax	# rxRuntimeConfig.channelCount, D.7583
	movzbl	%al, %eax	# D.7583, D.7579
	cmpl	-264(%rbp), %eax	# i, D.7579
	jg	.L229	#,
.LBE32:
	.loc 18 873 0 is_stmt 1
	jmp	.L195	#
.L124:
	.loc 18 876 0
	call	rxConfig	#
	movzbl	11(%rax), %eax	# _802->rssi_channel, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp912
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp912,
	call	sbufWriteU8	#
	.loc 18 877 0
	jmp	.L195	#
.L137:
.LBB33:
	.loc 18 880 0
	movl	$0, -260(%rbp)	#, i
	jmp	.L230	#
.L231:
	.loc 18 881 0 discriminator 3
	call	rxConfig	#
	movq	%rax, %rdx	#, D.7603
	movl	-260(%rbp), %eax	# i, tmp914
	cltq
	movzbl	(%rdx,%rax), %eax	# _808->rcmap, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp915
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp915,
	call	sbufWriteU8	#
	.loc 18 880 0 discriminator 3
	addl	$1, -260(%rbp)	#, i
.L230:
	.loc 18 880 0 is_stmt 0 discriminator 1
	cmpl	$7, -260(%rbp)	#, i
	jle	.L231	#,
.LBE33:
	.loc 18 882 0 is_stmt 1
	jmp	.L195	#
.L139:
	.loc 18 885 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _814->mixerMode, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp916
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp916,
	call	sbufWriteU8	#
	.loc 18 887 0
	call	featureMask	#
	movl	%eax, %edx	#, D.7578
	movq	-160(%rbp), %rax	# dst, tmp917
	movl	%edx, %esi	# D.7578,
	movq	%rax, %rdi	# tmp917,
	call	sbufWriteU32	#
	.loc 18 889 0
	call	rxConfig	#
	movzbl	8(%rax), %eax	# _822->serialrx_provider, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp918
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp918,
	call	sbufWriteU8	#
	.loc 18 891 0
	call	boardAlignment	#
	movzwl	(%rax), %eax	# _827->rollDegrees, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp919
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp919,
	call	sbufWriteU16	#
	.loc 18 892 0
	call	boardAlignment	#
	movzwl	2(%rax), %eax	# _833->pitchDegrees, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp920
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp920,
	call	sbufWriteU16	#
	.loc 18 893 0
	call	boardAlignment	#
	movzwl	4(%rax), %eax	# _839->yawDegrees, D.7580
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp921
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp921,
	call	sbufWriteU16	#
	.loc 18 894 0
	jmp	.L195	#
.L128:
.LBB34:
	.loc 18 897 0
	movl	$0, -256(%rbp)	#, i
	jmp	.L232	#
.L237:
	.loc 18 898 0
	call	serialConfig	#
	movq	%rax, %rcx	#, D.7609
	movl	-256(%rbp), %eax	# i, tmp923
	movslq	%eax, %rdx	# tmp923, tmp922
	movq	%rdx, %rax	# tmp922, tmp924
	addq	%rax, %rax	# tmp924
	addq	%rdx, %rax	# tmp922, tmp924
	salq	$2, %rax	#, tmp925
	addq	%rcx, %rax	# D.7609, tmp926
	addq	$4, %rax	#, tmp927
	movl	(%rax), %eax	# _846->portConfigs[i_16].identifier, D.7592
	movl	%eax, %edi	# D.7592,
	call	serialIsPortAvailable	#
	xorl	$1, %eax	#, D.7595
	testb	%al, %al	# D.7595
	jne	.L281	#,
	.loc 18 901 0
	call	serialConfig	#
	movq	%rax, %rcx	#, D.7609
	movl	-256(%rbp), %eax	# i, tmp929
	movslq	%eax, %rdx	# tmp929, tmp928
	movq	%rdx, %rax	# tmp928, tmp930
	addq	%rax, %rax	# tmp930
	addq	%rdx, %rax	# tmp928, tmp930
	salq	$2, %rax	#, tmp931
	addq	%rcx, %rax	# D.7609, tmp932
	addq	$4, %rax	#, tmp933
	movl	(%rax), %eax	# _852->portConfigs[i_16].identifier, D.7592
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp934
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp934,
	call	sbufWriteU8	#
	.loc 18 902 0
	call	serialConfig	#
	movq	%rax, %rcx	#, D.7609
	movl	-256(%rbp), %eax	# i, tmp936
	movslq	%eax, %rdx	# tmp936, tmp935
	movq	%rdx, %rax	# tmp935, tmp937
	addq	%rax, %rax	# tmp937
	addq	%rdx, %rax	# tmp935, tmp937
	salq	$2, %rax	#, tmp938
	addq	%rcx, %rax	# D.7609, tmp939
	addq	$8, %rax	#, tmp940
	movzwl	(%rax), %eax	# _858->portConfigs[i_16].functionMask, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp941
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp941,
	call	sbufWriteU16	#
.LBB35:
	.loc 18 903 0
	movl	$0, -252(%rbp)	#, baudRateIndex
	jmp	.L235	#
.L236:
	.loc 18 904 0 discriminator 3
	call	serialConfig	#
	movq	%rax, %rsi	#, D.7609
	movl	-252(%rbp), %eax	# baudRateIndex, tmp943
	movslq	%eax, %rcx	# tmp943, tmp942
	movl	-256(%rbp), %eax	# i, tmp945
	movslq	%eax, %rdx	# tmp945, tmp944
	movq	%rdx, %rax	# tmp944, tmp946
	addq	%rax, %rax	# tmp946
	addq	%rdx, %rax	# tmp944, tmp946
	salq	$2, %rax	#, tmp947
	addq	%rsi, %rax	# D.7609, tmp948
	addq	%rcx, %rax	# tmp942, tmp949
	addq	$10, %rax	#, tmp950
	movzbl	(%rax), %eax	# _864->portConfigs[i_16].baudRates, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp951
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp951,
	call	sbufWriteU8	#
	.loc 18 903 0 discriminator 3
	addl	$1, -252(%rbp)	#, baudRateIndex
.L235:
	.loc 18 903 0 is_stmt 0 discriminator 1
	cmpl	$3, -252(%rbp)	#, baudRateIndex
	jle	.L236	#,
	jmp	.L234	#
.L281:
.LBE35:
	.loc 18 899 0 is_stmt 1
	nop
.L234:
	.loc 18 897 0 discriminator 2
	addl	$1, -256(%rbp)	#, i
.L232:
	.loc 18 897 0 is_stmt 0 discriminator 1
	cmpl	$1, -256(%rbp)	#, i
	jle	.L237	#,
.LBE34:
	.loc 18 907 0 is_stmt 1
	jmp	.L195	#
.L143:
	.loc 18 943 0
	movq	-352(%rbp), %rax	# reply, tmp952
	movq	%rax, %rdi	# tmp952,
	call	serializeDataflashSummaryReply	#
	.loc 18 944 0
	jmp	.L195	#
.L151:
	.loc 18 963 0
	movq	-160(%rbp), %rax	# dst, tmp953
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp953,
	call	sbufWriteU8	#
	.loc 18 964 0
	movq	-160(%rbp), %rax	# dst, tmp954
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp954,
	call	sbufWriteU8	#
	.loc 18 965 0
	movq	-160(%rbp), %rax	# dst, tmp955
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp955,
	call	sbufWriteU8	#
	.loc 18 966 0
	movq	-160(%rbp), %rax	# dst, tmp956
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp956,
	call	sbufWriteU8	#
	.loc 18 968 0
	jmp	.L195	#
.L150:
	.loc 18 971 0
	movq	-352(%rbp), %rax	# reply, tmp957
	movq	%rax, %rdi	# tmp957,
	call	serializeSDCardSummaryReply	#
	.loc 18 972 0
	jmp	.L195	#
.L173:
.LBB36:
	.loc 18 975 0
	call	batteryConfig	#
	movzbl	6(%rax), %eax	# _877->amperageMeterSource, D.7583
	movzbl	%al, %eax	# D.7583, D.7598
	movl	%eax, %edi	# D.7598,
	call	getAmperageMeter	#
	movq	%rax, -80(%rbp)	# tmp958, amperageMeter
	.loc 18 977 0
	call	getBatteryState	#
	cmpb	$3, %al	#, D.7583
	setne	%al	#, D.7595
	movzbl	%al, %edx	# D.7595, D.7579
	movq	-160(%rbp), %rax	# dst, tmp959
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp959,
	call	sbufWriteU8	#
	.loc 18 978 0
	movzwl	vbat(%rip), %eax	# vbat, D.7582
	movzwl	%ax, %eax	# D.7582, D.7579
	movl	$255, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp960
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp960,
	call	sbufWriteU8	#
	.loc 18 979 0
	movq	-80(%rbp), %rax	# amperageMeter, tmp961
	movl	4(%rax), %eax	# amperageMeter_881->mAhDrawn, D.7579
	movl	$65535, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp962
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp962,
	call	sbufWriteU16	#
	.loc 18 980 0
	jmp	.L195	#
.L172:
.LBE36:
.LBB37:
	.loc 18 984 0
	movl	$0, -248(%rbp)	#, i
	jmp	.L238	#
.L239:
.LBB38:
	.loc 18 985 0 discriminator 3
	movl	-248(%rbp), %eax	# i, D.7598
	movl	%eax, %edi	# D.7598,
	call	getAmperageMeter	#
	movq	%rax, -72(%rbp)	# tmp963, meter
	.loc 18 987 0 discriminator 3
	movq	-72(%rbp), %rax	# meter, tmp964
	movl	(%rax), %edx	# meter_904->amperage, D.7579
	movl	%edx, %eax	# D.7579, tmp965
	sall	$2, %eax	#, tmp965
	addl	%edx, %eax	# D.7579, tmp965
	addl	%eax, %eax	# tmp966
	movl	$65535, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp967
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp967,
	call	sbufWriteU16	#
	.loc 18 988 0 discriminator 3
	movq	-72(%rbp), %rax	# meter, tmp968
	movl	4(%rax), %eax	# meter_904->mAhDrawn, D.7579
	movl	%eax, %edx	# D.7579, D.7578
	movq	-160(%rbp), %rax	# dst, tmp969
	movl	%edx, %esi	# D.7578,
	movq	%rax, %rdi	# tmp969,
	call	sbufWriteU32	#
.LBE38:
	.loc 18 984 0 discriminator 3
	addl	$1, -248(%rbp)	#, i
.L238:
	.loc 18 984 0 is_stmt 0 discriminator 1
	cmpl	$1, -248(%rbp)	#, i
	jle	.L239	#,
.LBE37:
	.loc 18 990 0 is_stmt 1
	jmp	.L195	#
.L171:
.LBB39:
	.loc 18 993 0
	movl	$0, -244(%rbp)	#, i
	jmp	.L240	#
.L241:
.LBB40:
	.loc 18 994 0 discriminator 3
	movl	-244(%rbp), %eax	# i, tmp970
	movzbl	%al, %eax	# D.7583, D.7579
	movl	%eax, %edi	# D.7579,
	call	getVoltageMeter	#
	movzwl	(%rax), %eax	# _920->vbat, tmp971
	movw	%ax, -320(%rbp)	# tmp971, voltage
	.loc 18 995 0 discriminator 3
	movzwl	-320(%rbp), %eax	# voltage, D.7579
	movl	$255, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp972
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp972,
	call	sbufWriteU8	#
.LBE40:
	.loc 18 993 0 discriminator 3
	addl	$1, -244(%rbp)	#, i
.L240:
	.loc 18 993 0 is_stmt 0 discriminator 1
	cmpl	$0, -244(%rbp)	#, i
	jle	.L241	#,
.LBE39:
	.loc 18 997 0 is_stmt 1
	jmp	.L195	#
.L152:
	.loc 18 1004 0
	movq	-160(%rbp), %rax	# dst, tmp973
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp973,
	call	sbufWriteU8	#
	.loc 18 1006 0
	jmp	.L195	#
.L142:
	.loc 18 1009 0
	movq	buildDate(%rip), %rcx	# buildDate, D.7593
	movq	-160(%rbp), %rax	# dst, tmp974
	movl	$11, %edx	#,
	movq	%rcx, %rsi	# D.7593,
	movq	%rax, %rdi	# tmp974,
	call	sbufWriteData	#
	.loc 18 1010 0
	movq	-160(%rbp), %rax	# dst, tmp975
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp975,
	call	sbufWriteU32	#
	.loc 18 1011 0
	movq	-160(%rbp), %rax	# dst, tmp976
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp976,
	call	sbufWriteU32	#
	.loc 18 1012 0
	jmp	.L195	#
.L168:
	.loc 18 1015 0
	call	motor3DConfig	#
	movzwl	(%rax), %eax	# _935->deadband3d_low, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp977
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp977,
	call	sbufWriteU16	#
	.loc 18 1016 0
	call	motor3DConfig	#
	movzwl	2(%rax), %eax	# _940->deadband3d_high, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp978
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp978,
	call	sbufWriteU16	#
	.loc 18 1017 0
	call	motor3DConfig	#
	movzwl	4(%rax), %eax	# _945->neutral3d, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp979
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp979,
	call	sbufWriteU16	#
	.loc 18 1018 0
	jmp	.L195	#
.L169:
	.loc 18 1021 0
	call	rcControlsConfig	#
	movzbl	(%rax), %eax	# _950->deadband, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp980
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp980,
	call	sbufWriteU8	#
	.loc 18 1022 0
	call	rcControlsConfig	#
	movzbl	1(%rax), %eax	# _955->yaw_deadband, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp981
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp981,
	call	sbufWriteU8	#
	.loc 18 1023 0
	call	rcControlsConfig	#
	movzbl	2(%rax), %eax	# _960->alt_hold_deadband, D.7583
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp982
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp982,
	call	sbufWriteU8	#
	.loc 18 1024 0
	call	rcControlsConfig	#
	movzwl	6(%rax), %eax	# _965->deadband3d_throttle, D.7582
	movzwl	%ax, %edx	# D.7582, D.7579
	movq	-160(%rbp), %rax	# dst, tmp983
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp983,
	call	sbufWriteU16	#
	.loc 18 1025 0
	jmp	.L195	#
.L170:
	.loc 18 1028 0
	call	sensorAlignmentConfig	#
	movl	(%rax), %eax	# _970->gyro_align, D.7615
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp984
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp984,
	call	sbufWriteU8	#
	.loc 18 1029 0
	call	sensorAlignmentConfig	#
	movl	4(%rax), %eax	# _976->acc_align, D.7615
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp985
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp985,
	call	sbufWriteU8	#
	.loc 18 1030 0
	call	sensorAlignmentConfig	#
	movl	8(%rax), %eax	# _982->mag_align, D.7615
	movzbl	%al, %edx	# D.7583, D.7579
	movq	-160(%rbp), %rax	# dst, tmp986
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp986,
	call	sbufWriteU8	#
	.loc 18 1031 0
	jmp	.L195	#
.L182:
	.loc 18 1042 0
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.7583
	movzbl	%al, %eax	# D.7583, D.7579
	andl	$4, %eax	#, D.7579
	testl	%eax, %eax	# D.7579
	jne	.L282	#,
.LBB41:
	.loc 18 1043 0
	movq	-152(%rbp), %rax	# src, tmp987
	movq	%rax, %rdi	# tmp987,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp988
	movl	%eax, -168(%rbp)	# tmp988, profile
	.loc 18 1044 0
	movl	-168(%rbp), %eax	# profile, tmp989
	movzbl	%al, %eax	# D.7583, D.7579
	movl	%eax, %edi	# D.7579,
	call	changeProfile	#
.LBE41:
	.loc 18 1046 0
	jmp	.L282	#
.L183:
	.loc 18 1049 0
	movq	-152(%rbp), %rax	# src, tmp990
	movq	%rax, %rdi	# tmp990,
	call	sbufReadU16	#
	movw	%ax, magHold(%rip)	# D.7580, magHold
	.loc 18 1050 0
	jmp	.L195	#
.L175:
.LBB42:
	.loc 18 1053 0
	movl	-216(%rbp), %eax	# len, tmp991
	cltq
	shrq	%rax	# D.7581
	movb	%al, -322(%rbp)	# D.7581, channelCount
	.loc 18 1054 0
	cmpb	$18, -322(%rbp)	#, channelCount
	jbe	.L243	#,
	.loc 18 1055 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L243:
.LBB43:
	.loc 18 1058 0
	movl	$0, -240(%rbp)	#, i
	jmp	.L245	#
.L246:
	.loc 18 1059 0 discriminator 3
	movq	-152(%rbp), %rax	# src, tmp992
	movq	%rax, %rdi	# tmp992,
	call	sbufReadU16	#
	movl	%eax, %edx	#, D.7582
	movl	-240(%rbp), %eax	# i, tmp993
	movw	%dx, -64(%rbp,%rax,2)	# D.7582, frame
	.loc 18 1058 0 discriminator 3
	addl	$1, -240(%rbp)	#, i
.L245:
	.loc 18 1058 0 is_stmt 0 discriminator 1
	movzbl	-322(%rbp), %eax	# channelCount, D.7578
	cmpl	-240(%rbp), %eax	# i, D.7578
	ja	.L246	#,
.LBE43:
	.loc 18 1062 0 is_stmt 1
	movzbl	-322(%rbp), %edx	# channelCount, D.7579
	leaq	-64(%rbp), %rax	#, tmp994
	movl	%edx, %esi	# D.7579,
	movq	%rax, %rdi	# tmp994,
	call	rxMspFrameReceive	#
	jmp	.L195	#
.L190:
.LBE42:
	.loc 18 1067 0
	call	accelerometerConfig	#
	movq	%rax, %rbx	#, D.7607
	movq	-152(%rbp), %rax	# src, tmp995
	movq	%rax, %rdi	# tmp995,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7580, _1001->accelerometerTrims.values.pitch
	.loc 18 1068 0
	call	accelerometerConfig	#
	movq	%rax, %rbx	#, D.7607
	movq	-152(%rbp), %rax	# src, tmp996
	movq	%rax, %rdi	# tmp996,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7580, _1007->accelerometerTrims.values.roll
	.loc 18 1069 0
	jmp	.L195	#
.L136:
	.loc 18 1072 0
	call	armingConfig	#
	movq	%rax, %rbx	#, D.7600
	movq	-152(%rbp), %rax	# src, tmp997
	movq	%rax, %rdi	# tmp997,
	call	sbufReadU8	#
	movb	%al, 2(%rbx)	# D.7583, _1013->auto_disarm_delay
	.loc 18 1073 0
	call	armingConfig	#
	movq	%rax, %rbx	#, D.7600
	movq	-152(%rbp), %rax	# src, tmp998
	movq	%rax, %rdi	# tmp998,
	call	sbufReadU8	#
	movb	%al, 1(%rbx)	# D.7583, _1018->disarm_kill_switch
	.loc 18 1074 0
	jmp	.L195	#
.L145:
	.loc 18 1077 0
	call	imuConfig	#
	movq	%rax, %rbx	#, D.7601
	movq	-152(%rbp), %rax	# src, tmp999
	movq	%rax, %rdi	# tmp999,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7582, _1023->looptime
	.loc 18 1078 0
	jmp	.L195	#
.L134:
	.loc 18 1081 0
	call	pidProfile	#
	movq	%rax, %rbx	#, D.7602
	movq	-152(%rbp), %rax	# src, tmp1000
	movq	%rax, %rdi	# tmp1000,
	call	sbufReadU8	#
	movb	%al, 30(%rbx)	# D.7583, _1028->pidController
	.loc 18 1082 0
	call	pidProfile	#
	movzbl	30(%rax), %eax	# _1033->pidController, D.7583
	movzbl	%al, %eax	# D.7583, D.7616
	movl	%eax, %edi	# D.7616,
	call	pidSetController	#
	.loc 18 1083 0
	jmp	.L195	#
.L176:
.LBB44:
	.loc 18 1086 0
	movl	$0, -236(%rbp)	#, i
	jmp	.L247	#
.L248:
	.loc 18 1087 0 discriminator 3
	call	pidProfile	#
	movq	%rax, %rbx	#, D.7602
	movq	-152(%rbp), %rax	# src, tmp1001
	movq	%rax, %rdi	# tmp1001,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movl	-236(%rbp), %eax	# i, tmp1003
	cltq
	movb	%dl, (%rbx,%rax)	# D.7583, _1039->P8
	.loc 18 1088 0 discriminator 3
	call	pidProfile	#
	movq	%rax, %rbx	#, D.7602
	movq	-152(%rbp), %rax	# src, tmp1004
	movq	%rax, %rdi	# tmp1004,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movl	-236(%rbp), %eax	# i, tmp1006
	cltq
	movb	%dl, 10(%rbx,%rax)	# D.7583, _1044->I8
	.loc 18 1089 0 discriminator 3
	call	pidProfile	#
	movq	%rax, %rbx	#, D.7602
	movq	-152(%rbp), %rax	# src, tmp1007
	movq	%rax, %rdi	# tmp1007,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movl	-236(%rbp), %eax	# i, tmp1009
	cltq
	movb	%dl, 20(%rbx,%rax)	# D.7583, _1049->D8
	.loc 18 1086 0 discriminator 3
	addl	$1, -236(%rbp)	#, i
.L247:
	.loc 18 1086 0 is_stmt 0 discriminator 1
	cmpl	$9, -236(%rbp)	#, i
	jle	.L248	#,
.LBE44:
	.loc 18 1091 0 is_stmt 1
	jmp	.L195	#
.L114:
.LBB45:
	.loc 18 1094 0
	movq	-152(%rbp), %rax	# src, tmp1010
	movq	%rax, %rdi	# tmp1010,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1011
	movl	%eax, -212(%rbp)	# tmp1011, i
	.loc 18 1095 0
	cmpl	$19, -212(%rbp)	#, i
	jle	.L249	#,
	.loc 18 1096 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L249:
	.loc 18 1097 0
	call	modeActivationProfile	#
	movq	%rax, %rdx	#, D.7584
	movl	-212(%rbp), %eax	# i, tmp1013
	cltq
	salq	$3, %rax	#, tmp1014
	addq	%rdx, %rax	# D.7584, tmp1015
	movq	%rax, -144(%rbp)	# tmp1015, mac
	.loc 18 1098 0
	movq	-152(%rbp), %rax	# src, tmp1016
	movq	%rax, %rdi	# tmp1016,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1017
	movl	%eax, -208(%rbp)	# tmp1017, permId
	.loc 18 1099 0
	movl	-208(%rbp), %eax	# permId, tmp1018
	movzbl	%al, %eax	# D.7583, D.7579
	movl	%eax, %edi	# D.7579,
	call	findBoxByPermenantId	#
	movq	%rax, -136(%rbp)	# tmp1019, box
	.loc 18 1100 0
	cmpq	$0, -136(%rbp)	#, box
	jne	.L250	#,
	.loc 18 1101 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L250:
	.loc 18 1102 0
	movq	-136(%rbp), %rax	# box, tmp1020
	movzbl	8(%rax), %eax	# box_102->boxId, D.7583
	movzbl	%al, %edx	# D.7583, D.7585
	movq	-144(%rbp), %rax	# mac, tmp1021
	movl	%edx, (%rax)	# D.7585, mac_95->modeId
	.loc 18 1103 0
	movq	-152(%rbp), %rax	# src, tmp1022
	movq	%rax, %rdi	# tmp1022,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-144(%rbp), %rax	# mac, tmp1023
	movb	%dl, 4(%rax)	# D.7583, mac_95->auxChannelIndex
	.loc 18 1104 0
	movq	-152(%rbp), %rax	# src, tmp1024
	movq	%rax, %rdi	# tmp1024,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-144(%rbp), %rax	# mac, tmp1025
	movb	%dl, 5(%rax)	# D.7583, mac_95->range.startStep
	.loc 18 1105 0
	movq	-152(%rbp), %rax	# src, tmp1026
	movq	%rax, %rdi	# tmp1026,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-144(%rbp), %rax	# mac, tmp1027
	movb	%dl, 6(%rax)	# D.7583, mac_95->range.endStep
	.loc 18 1107 0
	call	modeActivationProfile	#
	movq	%rax, %rdi	# D.7586,
	call	useRcControlsConfig	#
	.loc 18 1108 0
	jmp	.L195	#
.L127:
.LBE45:
.LBB46:
	.loc 18 1112 0
	movq	-152(%rbp), %rax	# src, tmp1028
	movq	%rax, %rdi	# tmp1028,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1029
	movl	%eax, -204(%rbp)	# tmp1029, aRange
	.loc 18 1113 0
	cmpl	$11, -204(%rbp)	#, aRange
	jle	.L251	#,
	.loc 18 1114 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L251:
	.loc 18 1115 0
	call	adjustmentProfile	#
	movq	%rax, %rcx	#, D.7587
	movl	-204(%rbp), %eax	# aRange, tmp1031
	movslq	%eax, %rdx	# tmp1031, tmp1030
	movq	%rdx, %rax	# tmp1030, tmp1032
	addq	%rax, %rax	# tmp1032
	addq	%rdx, %rax	# tmp1030, tmp1032
	addq	%rax, %rax	# tmp1033
	addq	%rcx, %rax	# D.7587, tmp1034
	movq	%rax, -128(%rbp)	# tmp1034, adjRange
	.loc 18 1116 0
	movq	-152(%rbp), %rax	# src, tmp1035
	movq	%rax, %rdi	# tmp1035,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1036
	movl	%eax, -200(%rbp)	# tmp1036, aIndex
	.loc 18 1117 0
	cmpl	$4, -200(%rbp)	#, aIndex
	jle	.L252	#,
	.loc 18 1118 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L252:
	.loc 18 1119 0
	movl	-200(%rbp), %eax	# aIndex, tmp1037
	movl	%eax, %edx	# tmp1037, D.7583
	movq	-128(%rbp), %rax	# adjRange, tmp1038
	movb	%dl, 5(%rax)	# D.7583, adjRange_126->adjustmentIndex
	.loc 18 1120 0
	movq	-152(%rbp), %rax	# src, tmp1039
	movq	%rax, %rdi	# tmp1039,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-128(%rbp), %rax	# adjRange, tmp1040
	movb	%dl, (%rax)	# D.7583, adjRange_126->auxChannelIndex
	.loc 18 1121 0
	movq	-152(%rbp), %rax	# src, tmp1041
	movq	%rax, %rdi	# tmp1041,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-128(%rbp), %rax	# adjRange, tmp1042
	movb	%dl, 1(%rax)	# D.7583, adjRange_126->range.startStep
	.loc 18 1122 0
	movq	-152(%rbp), %rax	# src, tmp1043
	movq	%rax, %rdi	# tmp1043,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-128(%rbp), %rax	# adjRange, tmp1044
	movb	%dl, 2(%rax)	# D.7583, adjRange_126->range.endStep
	.loc 18 1123 0
	movq	-152(%rbp), %rax	# src, tmp1045
	movq	%rax, %rdi	# tmp1045,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-128(%rbp), %rax	# adjRange, tmp1046
	movb	%dl, 3(%rax)	# D.7583, adjRange_126->adjustmentFunction
	.loc 18 1124 0
	movq	-152(%rbp), %rax	# src, tmp1047
	movq	%rax, %rdi	# tmp1047,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movq	-128(%rbp), %rax	# adjRange, tmp1048
	movb	%dl, 4(%rax)	# D.7583, adjRange_126->auxSwitchChannelIndex
	.loc 18 1125 0
	jmp	.L195	#
.L177:
.LBE46:
	.loc 18 1129 0
	cmpl	$9, -216(%rbp)	#, len
	jg	.L253	#,
	.loc 18 1130 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L253:
	.loc 18 1131 0
	movq	currentControlRateProfile(%rip), %rbx	# currentControlRateProfile, D.7588
	movq	-152(%rbp), %rax	# src, tmp1049
	movq	%rax, %rdi	# tmp1049,
	call	sbufReadU8	#
	movb	%al, (%rbx)	# D.7583, _149->rcRate8
	.loc 18 1132 0
	movq	currentControlRateProfile(%rip), %rbx	# currentControlRateProfile, D.7588
	movq	-152(%rbp), %rax	# src, tmp1050
	movq	%rax, %rdi	# tmp1050,
	call	sbufReadU8	#
	movb	%al, 1(%rbx)	# D.7583, _153->rcExpo8
.LBB47:
	.loc 18 1133 0
	movl	$0, -232(%rbp)	#, i
	jmp	.L254	#
.L257:
.LBB48:
	.loc 18 1134 0
	movq	-152(%rbp), %rax	# src, tmp1051
	movq	%rax, %rdi	# tmp1051,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1052
	movl	%eax, -196(%rbp)	# tmp1052, rate
	.loc 18 1135 0
	movq	currentControlRateProfile(%rip), %rcx	# currentControlRateProfile, D.7588
	cmpl	$2, -232(%rbp)	#, i
	jne	.L255	#,
	.loc 18 1135 0 is_stmt 0 discriminator 1
	movl	$255, %eax	#, D.7578
	jmp	.L256	#
.L255:
	.loc 18 1135 0 discriminator 2
	movl	$100, %eax	#, D.7578
.L256:
	.loc 18 1135 0 discriminator 4
	movl	-196(%rbp), %edx	# rate, tmp1053
	cmpl	%edx, %eax	# tmp1053, D.7578
	cmova	%edx, %eax	# D.7578,, tmp1053, D.7578
	movl	%eax, %edx	# D.7578, D.7583
	movl	-232(%rbp), %eax	# i, tmp1055
	cltq
	movb	%dl, 4(%rcx,%rax)	# D.7583, _161->rates
.LBE48:
	.loc 18 1133 0 is_stmt 1 discriminator 4
	addl	$1, -232(%rbp)	#, i
.L254:
	.loc 18 1133 0 is_stmt 0 discriminator 2
	cmpl	$2, -232(%rbp)	#, i
	jle	.L257	#,
.LBE47:
	.loc 18 1137 0 is_stmt 1
	movq	-152(%rbp), %rax	# src, tmp1056
	movq	%rax, %rdi	# tmp1056,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1057
	movl	%eax, -192(%rbp)	# tmp1057, rate
	.loc 18 1138 0
	movq	currentControlRateProfile(%rip), %rax	# currentControlRateProfile, D.7588
	movl	$100, %edx	#, tmp1058
	cmpl	$100, -192(%rbp)	#, rate
	cmovbe	-192(%rbp), %edx	# rate,, D.7578
	movb	%dl, 7(%rax)	# D.7583, _171->dynThrPID
	.loc 18 1139 0
	movq	currentControlRateProfile(%rip), %rbx	# currentControlRateProfile, D.7588
	movq	-152(%rbp), %rax	# src, tmp1059
	movq	%rax, %rdi	# tmp1059,
	call	sbufReadU8	#
	movb	%al, 2(%rbx)	# D.7583, _175->thrMid8
	.loc 18 1140 0
	movq	currentControlRateProfile(%rip), %rbx	# currentControlRateProfile, D.7588
	movq	-152(%rbp), %rax	# src, tmp1060
	movq	%rax, %rdi	# tmp1060,
	call	sbufReadU8	#
	movb	%al, 3(%rbx)	# D.7583, _179->thrExpo8
	.loc 18 1141 0
	movq	currentControlRateProfile(%rip), %rbx	# currentControlRateProfile, D.7588
	movq	-152(%rbp), %rax	# src, tmp1061
	movq	%rax, %rdi	# tmp1061,
	call	sbufReadU16	#
	movw	%ax, 10(%rbx)	# D.7582, _183->tpa_breakpoint
	.loc 18 1142 0
	cmpl	$10, -216(%rbp)	#, len
	jle	.L283	#,
	.loc 18 1144 0
	movq	currentControlRateProfile(%rip), %rbx	# currentControlRateProfile, D.7588
	movq	-152(%rbp), %rax	# src, tmp1062
	movq	%rax, %rdi	# tmp1062,
	call	sbufReadU8	#
	movb	%al, 8(%rbx)	# D.7583, _187->rcYawExpo8
	.loc 18 1145 0
	jmp	.L195	#
.L180:
.LBB49:
	.loc 18 1148 0
	movq	-152(%rbp), %rax	# src, tmp1063
	movq	%rax, %rdi	# tmp1063,
	call	sbufReadU16	#
	movzwl	%ax, %eax	# D.7582, tmp1064
	movl	%eax, -164(%rbp)	# tmp1064, midrc
	.loc 18 1149 0
	cmpl	$1400, -164(%rbp)	#, midrc
	jbe	.L259	#,
	.loc 18 1149 0 is_stmt 0 discriminator 1
	cmpl	$1599, -164(%rbp)	#, midrc
	ja	.L259	#,
	.loc 18 1150 0 is_stmt 1
	call	rxConfig	#
	movq	%rax, %rdx	#, D.7603
	movl	-164(%rbp), %eax	# midrc, tmp1065
	movw	%ax, 16(%rdx)	# D.7582, _1058->midrc
.L259:
	.loc 18 1152 0
	call	motorAndServoConfig	#
	movq	%rax, %rbx	#, D.7604
	movq	-152(%rbp), %rax	# src, tmp1066
	movq	%rax, %rdi	# tmp1066,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7582, _1062->minthrottle
	.loc 18 1153 0
	call	motorAndServoConfig	#
	movq	%rax, %rbx	#, D.7604
	movq	-152(%rbp), %rax	# src, tmp1067
	movq	%rax, %rdi	# tmp1067,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7582, _1067->maxthrottle
	.loc 18 1154 0
	call	motorAndServoConfig	#
	movq	%rax, %rbx	#, D.7604
	movq	-152(%rbp), %rax	# src, tmp1068
	movq	%rax, %rdi	# tmp1068,
	call	sbufReadU16	#
	movw	%ax, 4(%rbx)	# D.7582, _1072->mincommand
	.loc 18 1156 0
	call	failsafeConfig	#
	movq	%rax, %rbx	#, D.7605
	movq	-152(%rbp), %rax	# src, tmp1069
	movq	%rax, %rdi	# tmp1069,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7582, _1077->failsafe_throttle
	.loc 18 1163 0
	movq	-152(%rbp), %rax	# src, tmp1070
	movq	%rax, %rdi	# tmp1070,
	call	sbufReadU8	#
	.loc 18 1164 0
	movq	-152(%rbp), %rax	# src, tmp1071
	movq	%rax, %rdi	# tmp1071,
	call	sbufReadU8	#
	.loc 18 1165 0
	movq	-152(%rbp), %rax	# src, tmp1072
	movq	%rax, %rdi	# tmp1072,
	call	sbufReadU8	#
	.loc 18 1167 0
	call	mspServerConfig	#
	movq	%rax, %rbx	#, D.7599
	movq	-152(%rbp), %rax	# src, tmp1073
	movq	%rax, %rdi	# tmp1073,
	call	sbufReadU8	#
	movb	%al, (%rbx)	# D.7583, _1085->multiwiiCurrentMeterOutput
	.loc 18 1168 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1074
	movq	%rax, %rdi	# tmp1074,
	call	sbufReadU8	#
	movb	%al, 11(%rbx)	# D.7583, _1090->rssi_channel
	.loc 18 1169 0
	movq	-152(%rbp), %rax	# src, tmp1075
	movq	%rax, %rdi	# tmp1075,
	call	sbufReadU8	#
	.loc 18 1171 0
	call	compassConfig	#
	movq	%rax, %rbx	#, D.7606
	movq	-152(%rbp), %rax	# src, tmp1076
	movq	%rax, %rdi	# tmp1076,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7580, _1096->mag_declination
	.loc 18 1172 0
	jmp	.L195	#
.L185:
.LBE49:
.LBB50:
	.loc 18 1176 0
	movl	$0, -228(%rbp)	#, i
	jmp	.L260	#
.L262:
.LBB51:
	.loc 18 1177 0
	movq	-152(%rbp), %rax	# src, tmp1077
	movq	%rax, %rdi	# tmp1077,
	call	sbufReadU16	#
	movw	%ax, -318(%rbp)	# D.7582, disarmed
	.loc 18 1178 0
	cmpl	$3, -228(%rbp)	#, i
	jg	.L261	#,
	.loc 18 1179 0
	movl	-228(%rbp), %eax	# i, tmp1079
	cltq
	movzwl	-318(%rbp), %edx	# disarmed, tmp1080
	movw	%dx, motor_disarmed(%rax,%rax)	# tmp1080, motor_disarmed
.L261:
.LBE51:
	.loc 18 1176 0 discriminator 2
	addl	$1, -228(%rbp)	#, i
.L260:
	.loc 18 1176 0 is_stmt 0 discriminator 1
	cmpl	$7, -228(%rbp)	#, i
	jle	.L262	#,
.LBE50:
	.loc 18 1182 0 is_stmt 1
	jmp	.L195	#
.L186:
	.loc 18 1223 0
	call	motor3DConfig	#
	movq	%rax, %rbx	#, D.7612
	movq	-152(%rbp), %rax	# src, tmp1081
	movq	%rax, %rdi	# tmp1081,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7582, _1108->deadband3d_low
	.loc 18 1224 0
	call	motor3DConfig	#
	movq	%rax, %rbx	#, D.7612
	movq	-152(%rbp), %rax	# src, tmp1082
	movq	%rax, %rdi	# tmp1082,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7582, _1113->deadband3d_high
	.loc 18 1225 0
	call	motor3DConfig	#
	movq	%rax, %rbx	#, D.7612
	movq	-152(%rbp), %rax	# src, tmp1083
	movq	%rax, %rdi	# tmp1083,
	call	sbufReadU16	#
	movw	%ax, 4(%rbx)	# D.7582, _1118->neutral3d
	.loc 18 1226 0
	jmp	.L195	#
.L187:
	.loc 18 1229 0
	call	rcControlsConfig	#
	movq	%rax, %rbx	#, D.7613
	movq	-152(%rbp), %rax	# src, tmp1084
	movq	%rax, %rdi	# tmp1084,
	call	sbufReadU8	#
	movb	%al, (%rbx)	# D.7583, _1123->deadband
	.loc 18 1230 0
	call	rcControlsConfig	#
	movq	%rax, %rbx	#, D.7613
	movq	-152(%rbp), %rax	# src, tmp1085
	movq	%rax, %rdi	# tmp1085,
	call	sbufReadU8	#
	movb	%al, 1(%rbx)	# D.7583, _1128->yaw_deadband
	.loc 18 1231 0
	call	rcControlsConfig	#
	movq	%rax, %rbx	#, D.7613
	movq	-152(%rbp), %rax	# src, tmp1086
	movq	%rax, %rdi	# tmp1086,
	call	sbufReadU8	#
	movb	%al, 2(%rbx)	# D.7583, _1133->alt_hold_deadband
	.loc 18 1232 0
	call	rcControlsConfig	#
	movq	%rax, %rbx	#, D.7613
	movq	-152(%rbp), %rax	# src, tmp1087
	movq	%rax, %rdi	# tmp1087,
	call	sbufReadU16	#
	movw	%ax, 6(%rbx)	# D.7582, _1138->deadband3d_throttle
	.loc 18 1233 0
	jmp	.L195	#
.L188:
.LBB52:
	.loc 18 1236 0
	movl	$pidProfile_Registry, %edi	#,
	call	pgResetCurrent	#
.LBE52:
	.loc 18 1237 0
	jmp	.L195	#
.L189:
	.loc 18 1240 0
	call	sensorAlignmentConfig	#
	movq	%rax, %rbx	#, D.7614
	movq	-152(%rbp), %rax	# src, tmp1088
	movq	%rax, %rdi	# tmp1088,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, D.7615
	movl	%eax, (%rbx)	# D.7615, _1144->gyro_align
	.loc 18 1241 0
	call	sensorAlignmentConfig	#
	movq	%rax, %rbx	#, D.7614
	movq	-152(%rbp), %rax	# src, tmp1089
	movq	%rax, %rdi	# tmp1089,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, D.7615
	movl	%eax, 4(%rbx)	# D.7615, _1150->acc_align
	.loc 18 1242 0
	call	sensorAlignmentConfig	#
	movq	%rax, %rbx	#, D.7614
	movq	-152(%rbp), %rax	# src, tmp1090
	movq	%rax, %rdi	# tmp1090,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, D.7615
	movl	%eax, 8(%rbx)	# D.7615, _1156->mag_align
	.loc 18 1243 0
	jmp	.L195	#
.L181:
	.loc 18 1246 0
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.7583
	movzbl	%al, %eax	# D.7583, D.7579
	andl	$4, %eax	#, D.7579
	testl	%eax, %eax	# D.7579
	jne	.L284	#,
	.loc 18 1247 0
	call	resetEEPROM	#
	.loc 18 1248 0
	call	readEEPROM	#
	.loc 18 1250 0
	jmp	.L284	#
.L178:
	.loc 18 1253 0
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.7583
	movzbl	%al, %eax	# D.7583, D.7579
	andl	$4, %eax	#, D.7579
	testl	%eax, %eax	# D.7579
	jne	.L285	#,
	.loc 18 1254 0
	movl	$400, %edi	#,
	call	accSetCalibrationCycles	#
	.loc 18 1255 0
	jmp	.L285	#
.L179:
	.loc 18 1258 0
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.7583
	movzbl	%al, %eax	# D.7583, D.7579
	andl	$4, %eax	#, D.7579
	testl	%eax, %eax	# D.7579
	jne	.L286	#,
	.loc 18 1259 0
	movzbl	stateFlags(%rip), %eax	# stateFlags, D.7583
	orl	$4, %eax	#, D.7583
	movb	%al, stateFlags(%rip)	# D.7583, stateFlags
	.loc 18 1260 0
	jmp	.L286	#
.L193:
	.loc 18 1263 0
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.7583
	movzbl	%al, %eax	# D.7583, D.7579
	andl	$4, %eax	#, D.7579
	testl	%eax, %eax	# D.7579
	je	.L266	#,
	.loc 18 1264 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L266:
	.loc 18 1265 0
	movl	$0, %eax	#,
	call	writeEEPROM	#
	.loc 18 1266 0
	call	readEEPROM	#
	.loc 18 1267 0
	jmp	.L195	#
.L116:
	.loc 18 1338 0
	call	featureClearAll	#
	.loc 18 1339 0
	movq	-152(%rbp), %rax	# src, tmp1091
	movq	%rax, %rdi	# tmp1091,
	call	sbufReadU32	#
	movl	%eax, %edi	# D.7578,
	call	featureSet	#
	.loc 18 1340 0
	jmp	.L195	#
.L118:
	.loc 18 1343 0
	call	boardAlignment	#
	movq	%rax, %rbx	#, D.7608
	movq	-152(%rbp), %rax	# src, tmp1092
	movq	%rax, %rdi	# tmp1092,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7580, _1181->rollDegrees
	.loc 18 1344 0
	call	boardAlignment	#
	movq	%rax, %rbx	#, D.7608
	movq	-152(%rbp), %rax	# src, tmp1093
	movq	%rax, %rdi	# tmp1093,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7580, _1187->pitchDegrees
	.loc 18 1345 0
	call	boardAlignment	#
	movq	%rax, %rbx	#, D.7608
	movq	-152(%rbp), %rax	# src, tmp1094
	movq	%rax, %rdi	# tmp1094,
	call	sbufReadU16	#
	movw	%ax, 4(%rbx)	# D.7580, _1193->yawDegrees
	.loc 18 1346 0
	jmp	.L195	#
.L131:
.LBB53:
	.loc 18 1349 0
	movq	-152(%rbp), %rax	# src, tmp1095
	movq	%rax, %rdi	# tmp1095,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1096
	movl	%eax, -188(%rbp)	# tmp1096, index
	.loc 18 1351 0
	cmpl	$0, -188(%rbp)	#, index
	jle	.L267	#,
	.loc 18 1352 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L267:
	.loc 18 1355 0
	movl	-188(%rbp), %eax	# index, tmp1097
	movl	%eax, %edi	# tmp1097,
	call	voltageMeterConfig	#
	movq	%rax, %rbx	#, D.7589
	movq	-152(%rbp), %rax	# src, tmp1098
	movq	%rax, %rdi	# tmp1098,
	call	sbufReadU8	#
	movb	%al, (%rbx)	# D.7583, _202->vbatscale
	.loc 18 1356 0
	movl	-188(%rbp), %eax	# index, tmp1099
	movl	%eax, %edi	# tmp1099,
	call	voltageMeterConfig	#
	movq	%rax, %rbx	#, D.7589
	movq	-152(%rbp), %rax	# src, tmp1100
	movq	%rax, %rdi	# tmp1100,
	call	sbufReadU8	#
	movb	%al, 1(%rbx)	# D.7583, _207->vbatresdivval
	.loc 18 1357 0
	movl	-188(%rbp), %eax	# index, tmp1101
	movl	%eax, %edi	# tmp1101,
	call	voltageMeterConfig	#
	movq	%rax, %rbx	#, D.7589
	movq	-152(%rbp), %rax	# src, tmp1102
	movq	%rax, %rdi	# tmp1102,
	call	sbufReadU8	#
	movb	%al, 2(%rbx)	# D.7583, _212->vbatresdivmultiplier
	.loc 18 1358 0
	jmp	.L195	#
.L120:
.LBE53:
.LBB54:
	.loc 18 1362 0
	movq	-152(%rbp), %rax	# src, tmp1103
	movq	%rax, %rdi	# tmp1103,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1104
	movl	%eax, -184(%rbp)	# tmp1104, index
	.loc 18 1364 0
	cmpl	$1, -184(%rbp)	#, index
	jle	.L268	#,
	.loc 18 1365 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L268:
	.loc 18 1368 0
	movl	-184(%rbp), %eax	# index, tmp1105
	movl	%eax, %edi	# tmp1105,
	call	amperageMeterConfig	#
	movq	%rax, %rbx	#, D.7590
	movq	-152(%rbp), %rax	# src, tmp1106
	movq	%rax, %rdi	# tmp1106,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7580, _221->scale
	.loc 18 1369 0
	movl	-184(%rbp), %eax	# index, tmp1107
	movl	%eax, %edi	# tmp1107,
	call	amperageMeterConfig	#
	movq	%rax, %rbx	#, D.7590
	movq	-152(%rbp), %rax	# src, tmp1108
	movq	%rax, %rdi	# tmp1108,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7582, _227->offset
	.loc 18 1370 0
	jmp	.L195	#
.L112:
.LBE54:
	.loc 18 1374 0
	call	batteryConfig	#
	movq	%rax, %rbx	#, D.7597
	movq	-152(%rbp), %rax	# src, tmp1109
	movq	%rax, %rdi	# tmp1109,
	call	sbufReadU8	#
	movb	%al, 1(%rbx)	# D.7583, _1199->vbatmincellvoltage
	.loc 18 1375 0
	call	batteryConfig	#
	movq	%rax, %rbx	#, D.7597
	movq	-152(%rbp), %rax	# src, tmp1110
	movq	%rax, %rdi	# tmp1110,
	call	sbufReadU8	#
	movb	%al, (%rbx)	# D.7583, _1204->vbatmaxcellvoltage
	.loc 18 1376 0
	call	batteryConfig	#
	movq	%rax, %rbx	#, D.7597
	movq	-152(%rbp), %rax	# src, tmp1111
	movq	%rax, %rdi	# tmp1111,
	call	sbufReadU8	#
	movb	%al, 2(%rbx)	# D.7583, _1209->vbatwarningcellvoltage
	.loc 18 1377 0
	call	batteryConfig	#
	movq	%rax, %rbx	#, D.7597
	movq	-152(%rbp), %rax	# src, tmp1112
	movq	%rax, %rdi	# tmp1112,
	call	sbufReadU16	#
	movw	%ax, 4(%rbx)	# D.7582, _1214->batteryCapacity
	.loc 18 1378 0
	call	batteryConfig	#
	movq	%rax, %rbx	#, D.7597
	movq	-152(%rbp), %rax	# src, tmp1113
	movq	%rax, %rdi	# tmp1113,
	call	sbufReadU8	#
	movb	%al, 6(%rbx)	# D.7583, _1219->amperageMeterSource
	.loc 18 1379 0
	jmp	.L195	#
.L123:
	.loc 18 1389 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1114
	movq	%rax, %rdi	# tmp1114,
	call	sbufReadU8	#
	movb	%al, 8(%rbx)	# D.7583, _1224->serialrx_provider
	.loc 18 1390 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1115
	movq	%rax, %rdi	# tmp1115,
	call	sbufReadU16	#
	movw	%ax, 20(%rbx)	# D.7582, _1229->maxcheck
	.loc 18 1391 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1116
	movq	%rax, %rdi	# tmp1116,
	call	sbufReadU16	#
	movw	%ax, 16(%rbx)	# D.7582, _1234->midrc
	.loc 18 1392 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1117
	movq	%rax, %rdi	# tmp1117,
	call	sbufReadU16	#
	movw	%ax, 18(%rbx)	# D.7582, _1239->mincheck
	.loc 18 1393 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1118
	movq	%rax, %rdi	# tmp1118,
	call	sbufReadU8	#
	movb	%al, 10(%rbx)	# D.7583, _1244->spektrum_sat_bind
	.loc 18 1394 0
	movq	-152(%rbp), %rax	# src, tmp1119
	movq	%rax, %rdi	# tmp1119,
	call	sbufBytesRemaining	#
	cmpl	$1, %eax	#, D.7579
	jle	.L287	#,
	.loc 18 1396 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1120
	movq	%rax, %rdi	# tmp1120,
	call	sbufReadU16	#
	movw	%ax, 22(%rbx)	# D.7582, _1251->rx_min_usec
	.loc 18 1397 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1121
	movq	%rax, %rdi	# tmp1121,
	call	sbufReadU16	#
	movw	%ax, 24(%rbx)	# D.7582, _1256->rx_max_usec
	.loc 18 1398 0
	jmp	.L195	#
.L147:
	.loc 18 1401 0
	call	failsafeConfig	#
	movq	%rax, %rbx	#, D.7605
	movq	-152(%rbp), %rax	# src, tmp1122
	movq	%rax, %rdi	# tmp1122,
	call	sbufReadU8	#
	movb	%al, (%rbx)	# D.7583, _1261->failsafe_delay
	.loc 18 1402 0
	call	failsafeConfig	#
	movq	%rax, %rbx	#, D.7605
	movq	-152(%rbp), %rax	# src, tmp1123
	movq	%rax, %rdi	# tmp1123,
	call	sbufReadU8	#
	movb	%al, 1(%rbx)	# D.7583, _1266->failsafe_off_delay
	.loc 18 1403 0
	call	failsafeConfig	#
	movq	%rax, %rbx	#, D.7605
	movq	-152(%rbp), %rax	# src, tmp1124
	movq	%rax, %rdi	# tmp1124,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7582, _1271->failsafe_throttle
	.loc 18 1404 0
	call	failsafeConfig	#
	movq	%rax, %rbx	#, D.7605
	movq	-152(%rbp), %rax	# src, tmp1125
	movq	%rax, %rdi	# tmp1125,
	call	sbufReadU8	#
	movb	%al, 4(%rbx)	# D.7583, _1276->failsafe_kill_switch
	.loc 18 1405 0
	call	failsafeConfig	#
	movq	%rax, %rbx	#, D.7605
	movq	-152(%rbp), %rax	# src, tmp1126
	movq	%rax, %rdi	# tmp1126,
	call	sbufReadU16	#
	movw	%ax, 5(%rbx)	# D.7582, _1281->failsafe_throttle_low_delay
	.loc 18 1406 0
	call	failsafeConfig	#
	movq	%rax, %rbx	#, D.7605
	movq	-152(%rbp), %rax	# src, tmp1127
	movq	%rax, %rdi	# tmp1127,
	call	sbufReadU8	#
	movb	%al, 7(%rbx)	# D.7583, _1286->failsafe_procedure
	.loc 18 1407 0
	jmp	.L195	#
.L149:
.LBB55:
	.loc 18 1410 0
	movq	-152(%rbp), %rax	# src, tmp1128
	movq	%rax, %rdi	# tmp1128,
	call	sbufReadU8	#
	movzbl	%al, %eax	# D.7583, tmp1129
	movl	%eax, -180(%rbp)	# tmp1129, channel
	.loc 18 1411 0
	cmpl	$17, -180(%rbp)	#, channel
	jle	.L270	#,
	.loc 18 1412 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L270:
	.loc 18 1413 0
	movl	-180(%rbp), %eax	# channel, tmp1130
	movl	%eax, %edi	# tmp1130,
	call	failsafeChannelConfigs	#
	movq	%rax, %rbx	#, D.7591
	movq	-152(%rbp), %rax	# src, tmp1131
	movq	%rax, %rdi	# tmp1131,
	call	sbufReadU8	#
	movb	%al, (%rbx)	# D.7583, _236->mode
	.loc 18 1414 0
	movl	-180(%rbp), %eax	# channel, tmp1132
	movl	%eax, %edi	# tmp1132,
	call	failsafeChannelConfigs	#
	movq	%rax, %rbx	#, D.7591
	movq	-152(%rbp), %rax	# src, tmp1133
	movq	%rax, %rdi	# tmp1133,
	call	sbufReadU16	#
	movzwl	%ax, %eax	# D.7582, D.7579
	movl	$2250, %edx	#,
	movl	$750, %esi	#,
	movl	%eax, %edi	# D.7579,
	call	constrain	#
	leal	-750(%rax), %ecx	#, D.7579
	movl	$1374389535, %edx	#, tmp1135
	movl	%ecx, %eax	# D.7579, tmp1164
	imull	%edx	# tmp1135
	sarl	$3, %edx	#, tmp1136
	movl	%ecx, %eax	# D.7579, tmp1137
	sarl	$31, %eax	#, tmp1137
	subl	%eax, %edx	# tmp1137, D.7579
	movl	%edx, %eax	# D.7579, D.7579
	movb	%al, 1(%rbx)	# D.7583, _241->step
	.loc 18 1415 0
	jmp	.L195	#
.L125:
.LBE55:
	.loc 18 1419 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1138
	movq	%rax, %rdi	# tmp1138,
	call	sbufReadU8	#
	movb	%al, 11(%rbx)	# D.7583, _1291->rssi_channel
	.loc 18 1420 0
	jmp	.L195	#
.L138:
.LBB56:
	.loc 18 1423 0
	movl	$0, -224(%rbp)	#, i
	jmp	.L271	#
.L272:
	.loc 18 1424 0 discriminator 3
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1139
	movq	%rax, %rdi	# tmp1139,
	call	sbufReadU8	#
	movl	%eax, %edx	#, D.7583
	movl	-224(%rbp), %eax	# i, tmp1141
	cltq
	movb	%dl, (%rbx,%rax)	# D.7583, _1297->rcmap
	.loc 18 1423 0 discriminator 3
	addl	$1, -224(%rbp)	#, i
.L271:
	.loc 18 1423 0 is_stmt 0 discriminator 1
	cmpl	$7, -224(%rbp)	#, i
	jle	.L272	#,
.LBE56:
	.loc 18 1426 0 is_stmt 1
	jmp	.L195	#
.L140:
	.loc 18 1430 0
	movq	-152(%rbp), %rax	# src, tmp1142
	movq	%rax, %rdi	# tmp1142,
	call	sbufReadU8	#
	.loc 18 1435 0
	call	featureClearAll	#
	.loc 18 1436 0
	movq	-152(%rbp), %rax	# src, tmp1143
	movq	%rax, %rdi	# tmp1143,
	call	sbufReadU32	#
	movl	%eax, %edi	# D.7578,
	call	featureSet	#
	.loc 18 1438 0
	call	rxConfig	#
	movq	%rax, %rbx	#, D.7603
	movq	-152(%rbp), %rax	# src, tmp1144
	movq	%rax, %rdi	# tmp1144,
	call	sbufReadU8	#
	movb	%al, 8(%rbx)	# D.7583, _1308->serialrx_provider
	.loc 18 1440 0
	call	boardAlignment	#
	movq	%rax, %rbx	#, D.7608
	movq	-152(%rbp), %rax	# src, tmp1145
	movq	%rax, %rdi	# tmp1145,
	call	sbufReadU16	#
	movw	%ax, (%rbx)	# D.7580, _1313->rollDegrees
	.loc 18 1441 0
	call	boardAlignment	#
	movq	%rax, %rbx	#, D.7608
	movq	-152(%rbp), %rax	# src, tmp1146
	movq	%rax, %rdi	# tmp1146,
	call	sbufReadU16	#
	movw	%ax, 2(%rbx)	# D.7580, _1319->pitchDegrees
	.loc 18 1442 0
	call	boardAlignment	#
	movq	%rax, %rbx	#, D.7608
	movq	-152(%rbp), %rax	# src, tmp1147
	movq	%rax, %rdi	# tmp1147,
	call	sbufReadU16	#
	movw	%ax, 4(%rbx)	# D.7580, _1325->yawDegrees
	.loc 18 1444 0
	jmp	.L195	#
.L129:
.LBB57:
	.loc 18 1447 0
	movl	$7, -176(%rbp)	#, portConfigSize
	.loc 18 1449 0
	movl	-216(%rbp), %eax	# len, tmp1148
	cltd
	idivl	-176(%rbp)	# portConfigSize
	movl	%edx, %eax	# tmp1149, D.7579
	testl	%eax, %eax	# D.7579
	je	.L274	#,
	.loc 18 1450 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L278:
.LBB58:
	.loc 18 1453 0
	movq	-152(%rbp), %rax	# src, tmp1151
	movq	%rax, %rdi	# tmp1151,
	call	sbufReadU8	#
	movb	%al, -321(%rbp)	# tmp1152, identifier
	.loc 18 1455 0
	movzbl	-321(%rbp), %eax	# identifier, D.7592
	movl	%eax, %edi	# D.7592,
	call	serialFindPortConfiguration	#
	movq	%rax, -120(%rbp)	# tmp1153, portConfig
	.loc 18 1456 0
	cmpq	$0, -120(%rbp)	#, portConfig
	jne	.L275	#,
	.loc 18 1457 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L275:
	.loc 18 1459 0
	movzbl	-321(%rbp), %edx	# identifier, D.7592
	movq	-120(%rbp), %rax	# portConfig, tmp1154
	movl	%edx, (%rax)	# D.7592, portConfig_260->identifier
	.loc 18 1460 0
	movq	-152(%rbp), %rax	# src, tmp1155
	movq	%rax, %rdi	# tmp1155,
	call	sbufReadU16	#
	movl	%eax, %edx	#, D.7582
	movq	-120(%rbp), %rax	# portConfig, tmp1156
	movw	%dx, 4(%rax)	# D.7582, portConfig_260->functionMask
.LBB59:
	.loc 18 1461 0
	movl	$0, -220(%rbp)	#, baudRateIndex
	jmp	.L276	#
.L277:
	.loc 18 1462 0 discriminator 3
	movq	-152(%rbp), %rax	# src, tmp1157
	movq	%rax, %rdi	# tmp1157,
	call	sbufReadU8	#
	movl	%eax, %ecx	#, D.7583
	movq	-120(%rbp), %rdx	# portConfig, tmp1158
	movl	-220(%rbp), %eax	# baudRateIndex, tmp1160
	cltq
	movb	%cl, 6(%rdx,%rax)	# D.7583, portConfig_260->baudRates
	.loc 18 1461 0 discriminator 3
	addl	$1, -220(%rbp)	#, baudRateIndex
.L276:
	.loc 18 1461 0 is_stmt 0 discriminator 1
	cmpl	$3, -220(%rbp)	#, baudRateIndex
	jle	.L277	#,
.L274:
.LBE59:
.LBE58:
	.loc 18 1452 0 is_stmt 1
	movq	-152(%rbp), %rax	# src, tmp1161
	movq	%rax, %rdi	# tmp1161,
	call	sbufBytesRemaining	#
	cmpl	-176(%rbp), %eax	# portConfigSize, D.7579
	jge	.L278	#,
	.loc 18 1465 0
	jmp	.L195	#
.L141:
.LBE57:
	.loc 18 1514 0
	movq	$mspRebootFn, mspPostProcessFn(%rip)	#, mspPostProcessFn
	.loc 18 1515 0
	jmp	.L195	#
.L104:
	.loc 18 1519 0
	movl	$-1, %eax	#, D.7579
	jmp	.L244	#
.L280:
	.loc 18 1201 0
	nop
	jmp	.L195	#
.L282:
	.loc 18 1046 0
	nop
	jmp	.L195	#
.L283:
	.loc 18 1143 0
	nop
	jmp	.L195	#
.L284:
	.loc 18 1250 0
	nop
	jmp	.L195	#
.L285:
	.loc 18 1255 0
	nop
	jmp	.L195	#
.L286:
	.loc 18 1260 0
	nop
	jmp	.L195	#
.L287:
	.loc 18 1395 0
	nop
.L195:
.LBE14:
	.loc 18 1521 0
	movl	$1, %eax	#, D.7579
.L244:
	.loc 18 1522 0
	movq	-24(%rbp), %rcx	# D.7617, tmp1165
	xorq	%fs:40, %rcx	#, tmp1165
	je	.L279	#,
	call	__stack_chk_fail	#
.L279:
	addq	$344, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE81:
	.size	mspServerCommandHandler, .-mspServerCommandHandler
	.section	.text.mspInit,"ax",@progbits
	.globl	mspInit
	.type	mspInit, @function
mspInit:
.LFB82:
	.loc 18 1525 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 18 1526 0
	call	initActiveBoxIds	#
	.loc 18 1527 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE82:
	.size	mspInit, .-mspInit
	.section	.rodata.flightMode_boxId_map.6339,"a",@progbits
	.align 8
	.type	flightMode_boxId_map.6339, @object
	.size	flightMode_boxId_map.6339, 12
flightMode_boxId_map.6339:
	.byte	1
	.byte	2
	.byte	4
	.byte	3
	.byte	9
	.byte	10
	.byte	5
	.byte	-1
	.byte	11
	.byte	21
	.byte	26
	.byte	20
	.text
.Letext0:
	.file 19 "/usr/include/stdint.h"
	.file 20 "./src/main/common/axis.h"
	.file 21 "./src/main/common/color.h"
	.file 22 "./src/main/common/streambuf.h"
	.file 23 "./src/main/config/parameter_group.h"
	.file 24 "./src/main/config/feature.h"
	.file 25 "./src/main/config/profile.h"
	.file 26 "./src/main/drivers/sensor.h"
	.file 27 "./src/main/drivers/accgyro.h"
	.file 28 "./src/main/drivers/serial.h"
	.file 29 "./src/main/msp/msp.h"
	.file 30 "./src/main/msp/msp_serial.h"
	.file 31 "./src/main/fc/rate_profile.h"
	.file 32 "./src/main/fc/runtime_config.h"
	.file 33 "./src/main/fc/config.h"
	.file 34 "./src/main/io/gps.h"
	.file 35 "./src/main/io/gimbal.h"
	.file 36 "./src/main/io/ledstrip.h"
	.file 37 "./src/main/io/transponder_ir.h"
	.file 38 "./src/main/telemetry/telemetry.h"
	.file 39 "./src/main/sensors/gyro.h"
	.file 40 "./src/main/flight/servos.h"
	.file 41 "./src/main/flight/navigation.h"
	.file 42 "./src/main/flight/altitudehold.h"
	.file 43 "./src/main/blackbox/blackbox.h"
	.file 44 "./src/main/build/debug.h"
	.file 45 "./src/main/target/edison/target.h"
	.file 46 "./src/main/scheduler/scheduler.h"
	.file 47 "./src/main/fc/cleanflight_fc.h"
	.file 48 "./src/main/build/version.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x301a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF2160
	.byte	0xc
	.long	.LASF2161
	.long	.LASF2162
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.long	.LASF1457
	.byte	0x13
	.byte	0x24
	.long	0x38
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1459
	.uleb128 0x2
	.long	.LASF1458
	.byte	0x13
	.byte	0x25
	.long	0x4a
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF1460
	.uleb128 0x2
	.long	.LASF1461
	.byte	0x13
	.byte	0x26
	.long	0x5c
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF1462
	.uleb128 0x2
	.long	.LASF1463
	.byte	0x13
	.byte	0x30
	.long	0x75
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1464
	.uleb128 0x2
	.long	.LASF1465
	.byte	0x13
	.byte	0x31
	.long	0x87
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF1466
	.uleb128 0x2
	.long	.LASF1467
	.byte	0x13
	.byte	0x33
	.long	0x99
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1468
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1469
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1470
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1471
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF1472
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1473
	.uleb128 0x6
	.byte	0x8
	.long	0xcb
	.uleb128 0x7
	.long	0xb0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF1474
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF1475
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x14
	.byte	0x1d
	.long	0x103
	.uleb128 0x9
	.long	.LASF1476
	.byte	0
	.uleb128 0x9
	.long	.LASF1477
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1478
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1479
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x14
	.byte	0x25
	.long	0x122
	.uleb128 0x9
	.long	.LASF1480
	.byte	0
	.uleb128 0x9
	.long	.LASF1481
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1482
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x15
	.byte	0x15
	.long	0x141
	.uleb128 0x9
	.long	.LASF1483
	.byte	0
	.uleb128 0x9
	.long	.LASF1484
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1485
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0x151
	.uleb128 0xb
	.long	0xa7
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.long	.LASF1487
	.byte	0x4
	.byte	0x15
	.byte	0x32
	.long	0x17c
	.uleb128 0xd
	.string	"h"
	.byte	0x15
	.byte	0x33
	.long	0x7c
	.byte	0
	.uleb128 0xd
	.string	"s"
	.byte	0x15
	.byte	0x34
	.long	0x6a
	.byte	0x2
	.uleb128 0xd
	.string	"v"
	.byte	0x15
	.byte	0x35
	.long	0x6a
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF1486
	.byte	0x15
	.byte	0x36
	.long	0x151
	.uleb128 0xc
	.long	.LASF1488
	.byte	0x10
	.byte	0x16
	.byte	0x19
	.long	0x1ac
	.uleb128 0xd
	.string	"ptr"
	.byte	0x16
	.byte	0x1a
	.long	0x1ac
	.byte	0
	.uleb128 0xd
	.string	"end"
	.byte	0x16
	.byte	0x1b
	.long	0x1ac
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x6a
	.uleb128 0x2
	.long	.LASF1489
	.byte	0x16
	.byte	0x1c
	.long	0x187
	.uleb128 0x2
	.long	.LASF1490
	.byte	0x17
	.byte	0x15
	.long	0x7c
	.uleb128 0x2
	.long	.LASF1491
	.byte	0x17
	.byte	0x26
	.long	0x1d3
	.uleb128 0xe
	.long	0x1e3
	.uleb128 0xf
	.long	0xae
	.uleb128 0xf
	.long	0x5c
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.byte	0x17
	.byte	0x2d
	.long	0x201
	.uleb128 0x11
	.string	"ptr"
	.byte	0x17
	.byte	0x2e
	.long	0xae
	.uleb128 0x11
	.string	"fn"
	.byte	0x17
	.byte	0x2f
	.long	0x201
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1c8
	.uleb128 0xc
	.long	.LASF1492
	.byte	0x20
	.byte	0x17
	.byte	0x28
	.long	0x250
	.uleb128 0xd
	.string	"pgn"
	.byte	0x17
	.byte	0x29
	.long	0x1bd
	.byte	0
	.uleb128 0x12
	.long	.LASF1493
	.byte	0x17
	.byte	0x2a
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1494
	.byte	0x17
	.byte	0x2b
	.long	0x1ac
	.byte	0x8
	.uleb128 0xd
	.string	"ptr"
	.byte	0x17
	.byte	0x2c
	.long	0x250
	.byte	0x10
	.uleb128 0x12
	.long	.LASF1495
	.byte	0x17
	.byte	0x30
	.long	0x1e3
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1ac
	.uleb128 0x2
	.long	.LASF1496
	.byte	0x17
	.byte	0x31
	.long	0x207
	.uleb128 0xc
	.long	.LASF1497
	.byte	0x4
	.byte	0x18
	.byte	0x14
	.long	0x27a
	.uleb128 0x12
	.long	.LASF1498
	.byte	0x18
	.byte	0x15
	.long	0x8e
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1499
	.byte	0x18
	.byte	0x16
	.long	0x261
	.uleb128 0xc
	.long	.LASF1500
	.byte	0x1
	.byte	0x19
	.byte	0x16
	.long	0x29e
	.uleb128 0x12
	.long	.LASF1501
	.byte	0x19
	.byte	0x17
	.long	0x6a
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1502
	.byte	0x19
	.byte	0x18
	.long	0x285
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF1503
	.uleb128 0x2
	.long	.LASF1504
	.byte	0x1a
	.byte	0x15
	.long	0x2bb
	.uleb128 0x6
	.byte	0x8
	.long	0x2c1
	.uleb128 0x13
	.long	0x2a9
	.long	0x2d0
	.uleb128 0xf
	.long	0x2d0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3f
	.uleb128 0x2
	.long	.LASF1505
	.byte	0x1a
	.byte	0x18
	.long	0x2e1
	.uleb128 0x6
	.byte	0x8
	.long	0x2e7
	.uleb128 0xe
	.long	0x2f2
	.uleb128 0xf
	.long	0x2f2
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2f8
	.uleb128 0xc
	.long	.LASF1506
	.byte	0x18
	.byte	0x1b
	.byte	0x1c
	.long	0x335
	.uleb128 0x12
	.long	.LASF1507
	.byte	0x1b
	.byte	0x1d
	.long	0x2d6
	.byte	0
	.uleb128 0x12
	.long	.LASF1508
	.byte	0x1b
	.byte	0x1e
	.long	0x2b0
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1509
	.byte	0x1b
	.byte	0x1f
	.long	0x7c
	.byte	0x10
	.uleb128 0x12
	.long	.LASF1510
	.byte	0x1b
	.byte	0x20
	.long	0xb0
	.byte	0x12
	.byte	0
	.uleb128 0x2
	.long	.LASF1511
	.byte	0x1b
	.byte	0x21
	.long	0x2f8
	.uleb128 0x14
	.long	.LASF1515
	.byte	0x4
	.long	0x99
	.byte	0x1c
	.byte	0x14
	.long	0x363
	.uleb128 0x9
	.long	.LASF1512
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1513
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1514
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF1515
	.byte	0x1c
	.byte	0x18
	.long	0x340
	.uleb128 0x14
	.long	.LASF1516
	.byte	0x4
	.long	0x99
	.byte	0x1c
	.byte	0x1a
	.long	0x3af
	.uleb128 0x9
	.long	.LASF1517
	.byte	0
	.uleb128 0x9
	.long	.LASF1518
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1519
	.byte	0
	.uleb128 0x9
	.long	.LASF1520
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1521
	.byte	0
	.uleb128 0x9
	.long	.LASF1522
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1523
	.byte	0
	.uleb128 0x9
	.long	.LASF1524
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF1516
	.byte	0x1c
	.byte	0x23
	.long	0x36e
	.uleb128 0x2
	.long	.LASF1525
	.byte	0x1c
	.byte	0x25
	.long	0x3c5
	.uleb128 0x6
	.byte	0x8
	.long	0x3cb
	.uleb128 0xe
	.long	0x3d6
	.uleb128 0xf
	.long	0x7c
	.byte	0
	.uleb128 0xc
	.long	.LASF1526
	.byte	0x48
	.byte	0x1c
	.byte	0x27
	.long	0x48b
	.uleb128 0x12
	.long	.LASF1527
	.byte	0x1c
	.byte	0x29
	.long	0x510
	.byte	0
	.uleb128 0x12
	.long	.LASF1528
	.byte	0x1c
	.byte	0x2b
	.long	0x6a
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1529
	.byte	0x1c
	.byte	0x2c
	.long	0x363
	.byte	0xc
	.uleb128 0x12
	.long	.LASF1530
	.byte	0x1c
	.byte	0x2d
	.long	0x3af
	.byte	0x10
	.uleb128 0x12
	.long	.LASF1531
	.byte	0x1c
	.byte	0x2f
	.long	0x8e
	.byte	0x14
	.uleb128 0x12
	.long	.LASF1532
	.byte	0x1c
	.byte	0x31
	.long	0x8e
	.byte	0x18
	.uleb128 0x12
	.long	.LASF1533
	.byte	0x1c
	.byte	0x32
	.long	0x8e
	.byte	0x1c
	.uleb128 0x12
	.long	.LASF1534
	.byte	0x1c
	.byte	0x33
	.long	0x51b
	.byte	0x20
	.uleb128 0x12
	.long	.LASF1535
	.byte	0x1c
	.byte	0x34
	.long	0x51b
	.byte	0x28
	.uleb128 0x12
	.long	.LASF1536
	.byte	0x1c
	.byte	0x35
	.long	0x8e
	.byte	0x30
	.uleb128 0x12
	.long	.LASF1537
	.byte	0x1c
	.byte	0x36
	.long	0x8e
	.byte	0x34
	.uleb128 0x12
	.long	.LASF1538
	.byte	0x1c
	.byte	0x37
	.long	0x8e
	.byte	0x38
	.uleb128 0x12
	.long	.LASF1539
	.byte	0x1c
	.byte	0x38
	.long	0x8e
	.byte	0x3c
	.uleb128 0x12
	.long	.LASF1540
	.byte	0x1c
	.byte	0x3b
	.long	0x3ba
	.byte	0x40
	.byte	0
	.uleb128 0xc
	.long	.LASF1541
	.byte	0x50
	.byte	0x1c
	.byte	0x3e
	.long	0x510
	.uleb128 0x12
	.long	.LASF1542
	.byte	0x1c
	.byte	0x3f
	.long	0x547
	.byte	0
	.uleb128 0x12
	.long	.LASF1543
	.byte	0x1c
	.byte	0x41
	.long	0x55c
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1544
	.byte	0x1c
	.byte	0x42
	.long	0x55c
	.byte	0x10
	.uleb128 0x12
	.long	.LASF1545
	.byte	0x1c
	.byte	0x44
	.long	0x55c
	.byte	0x18
	.uleb128 0x12
	.long	.LASF1546
	.byte	0x1c
	.byte	0x47
	.long	0x572
	.byte	0x20
	.uleb128 0x12
	.long	.LASF1547
	.byte	0x1c
	.byte	0x49
	.long	0x587
	.byte	0x28
	.uleb128 0x12
	.long	.LASF1548
	.byte	0x1c
	.byte	0x4b
	.long	0x59d
	.byte	0x30
	.uleb128 0x12
	.long	.LASF1549
	.byte	0x1c
	.byte	0x4d
	.long	0x5b8
	.byte	0x38
	.uleb128 0x12
	.long	.LASF1550
	.byte	0x1c
	.byte	0x4f
	.long	0x5c9
	.byte	0x40
	.uleb128 0x12
	.long	.LASF1551
	.byte	0x1c
	.byte	0x50
	.long	0x5c9
	.byte	0x48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x516
	.uleb128 0x7
	.long	0x48b
	.uleb128 0x6
	.byte	0x8
	.long	0x521
	.uleb128 0x15
	.long	0x6a
	.uleb128 0x2
	.long	.LASF1552
	.byte	0x1c
	.byte	0x3c
	.long	0x3d6
	.uleb128 0xe
	.long	0x541
	.uleb128 0xf
	.long	0x541
	.uleb128 0xf
	.long	0x6a
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x526
	.uleb128 0x6
	.byte	0x8
	.long	0x531
	.uleb128 0x13
	.long	0x6a
	.long	0x55c
	.uleb128 0xf
	.long	0x541
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x54d
	.uleb128 0xe
	.long	0x572
	.uleb128 0xf
	.long	0x541
	.uleb128 0xf
	.long	0x8e
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x562
	.uleb128 0x13
	.long	0x2a9
	.long	0x587
	.uleb128 0xf
	.long	0x541
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x578
	.uleb128 0xe
	.long	0x59d
	.uleb128 0xf
	.long	0x541
	.uleb128 0xf
	.long	0x363
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x58d
	.uleb128 0xe
	.long	0x5b8
	.uleb128 0xf
	.long	0x541
	.uleb128 0xf
	.long	0xae
	.uleb128 0xf
	.long	0x5c
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5a3
	.uleb128 0xe
	.long	0x5c9
	.uleb128 0xf
	.long	0x541
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5be
	.uleb128 0xc
	.long	.LASF1553
	.byte	0x2
	.byte	0x1
	.byte	0x65
	.long	0x5f4
	.uleb128 0x12
	.long	.LASF1529
	.byte	0x1
	.byte	0x66
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1554
	.byte	0x1
	.byte	0x67
	.long	0x6a
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1555
	.byte	0x1
	.byte	0x68
	.long	0x5cf
	.uleb128 0xc
	.long	.LASF1556
	.byte	0x4
	.byte	0x1
	.byte	0x6a
	.long	0x624
	.uleb128 0xd
	.string	"min"
	.byte	0x1
	.byte	0x6b
	.long	0x7c
	.byte	0
	.uleb128 0xd
	.string	"max"
	.byte	0x1
	.byte	0x6c
	.long	0x7c
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1557
	.byte	0x1
	.byte	0x6d
	.long	0x5ff
	.uleb128 0xc
	.long	.LASF1558
	.byte	0x1a
	.byte	0x1
	.byte	0x6f
	.long	0x6d8
	.uleb128 0x12
	.long	.LASF1559
	.byte	0x1
	.byte	0x70
	.long	0x6d8
	.byte	0
	.uleb128 0x12
	.long	.LASF1560
	.byte	0x1
	.byte	0x71
	.long	0x6a
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1561
	.byte	0x1
	.byte	0x72
	.long	0x6a
	.byte	0x9
	.uleb128 0x12
	.long	.LASF1562
	.byte	0x1
	.byte	0x73
	.long	0x6a
	.byte	0xa
	.uleb128 0x12
	.long	.LASF1563
	.byte	0x1
	.byte	0x74
	.long	0x6a
	.byte	0xb
	.uleb128 0x12
	.long	.LASF1564
	.byte	0x1
	.byte	0x75
	.long	0x6a
	.byte	0xc
	.uleb128 0x12
	.long	.LASF1565
	.byte	0x1
	.byte	0x76
	.long	0x6a
	.byte	0xd
	.uleb128 0x12
	.long	.LASF1566
	.byte	0x1
	.byte	0x77
	.long	0x6a
	.byte	0xe
	.uleb128 0x12
	.long	.LASF1567
	.byte	0x1
	.byte	0x78
	.long	0x7c
	.byte	0x10
	.uleb128 0x12
	.long	.LASF1568
	.byte	0x1
	.byte	0x79
	.long	0x7c
	.byte	0x12
	.uleb128 0x12
	.long	.LASF1569
	.byte	0x1
	.byte	0x7a
	.long	0x7c
	.byte	0x14
	.uleb128 0x12
	.long	.LASF1570
	.byte	0x1
	.byte	0x7c
	.long	0x7c
	.byte	0x16
	.uleb128 0x12
	.long	.LASF1571
	.byte	0x1
	.byte	0x7d
	.long	0x7c
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0x6e8
	.uleb128 0xb
	.long	0xa7
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF1572
	.byte	0x1
	.byte	0x7e
	.long	0x62f
	.uleb128 0xc
	.long	.LASF1573
	.byte	0x1
	.byte	0x1
	.byte	0x85
	.long	0x70c
	.uleb128 0x12
	.long	.LASF1574
	.byte	0x1
	.byte	0x86
	.long	0x6a
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1575
	.byte	0x1
	.byte	0x87
	.long	0x6f3
	.uleb128 0xc
	.long	.LASF1576
	.byte	0x18
	.byte	0x1d
	.byte	0x14
	.long	0x748
	.uleb128 0xd
	.string	"buf"
	.byte	0x1d
	.byte	0x15
	.long	0x1b2
	.byte	0
	.uleb128 0xd
	.string	"cmd"
	.byte	0x1d
	.byte	0x16
	.long	0x3f
	.byte	0x10
	.uleb128 0x12
	.long	.LASF1577
	.byte	0x1d
	.byte	0x17
	.long	0x3f
	.byte	0x12
	.byte	0
	.uleb128 0x2
	.long	.LASF1578
	.byte	0x1d
	.byte	0x18
	.long	0x717
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x1e
	.byte	0x3c
	.long	0x78a
	.uleb128 0x9
	.long	.LASF1579
	.byte	0
	.uleb128 0x9
	.long	.LASF1580
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1581
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1582
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1583
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1584
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1585
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF1586
	.byte	0x1e
	.byte	0x44
	.long	0x753
	.uleb128 0x2
	.long	.LASF1587
	.byte	0x1e
	.byte	0x46
	.long	0x7a0
	.uleb128 0x6
	.byte	0x8
	.long	0x7a6
	.uleb128 0x16
	.long	0x2a9
	.long	0x7b1
	.uleb128 0x17
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x1e
	.byte	0x4b
	.long	0x7ca
	.uleb128 0x9
	.long	.LASF1588
	.byte	0
	.uleb128 0x9
	.long	.LASF1589
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1590
	.byte	0x1e
	.byte	0x4e
	.long	0x7b1
	.uleb128 0xc
	.long	.LASF1591
	.byte	0x60
	.byte	0x1e
	.byte	0x50
	.long	0x842
	.uleb128 0x12
	.long	.LASF1592
	.byte	0x1e
	.byte	0x51
	.long	0x541
	.byte	0
	.uleb128 0x12
	.long	.LASF1529
	.byte	0x1e
	.byte	0x52
	.long	0x7ca
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1593
	.byte	0x1e
	.byte	0x54
	.long	0x795
	.byte	0x10
	.uleb128 0x12
	.long	.LASF1594
	.byte	0x1e
	.byte	0x56
	.long	0x78a
	.byte	0x18
	.uleb128 0x12
	.long	.LASF1595
	.byte	0x1e
	.byte	0x57
	.long	0x6a
	.byte	0x1c
	.uleb128 0x12
	.long	.LASF1596
	.byte	0x1e
	.byte	0x58
	.long	0x6a
	.byte	0x1d
	.uleb128 0x12
	.long	.LASF1597
	.byte	0x1e
	.byte	0x59
	.long	0x6a
	.byte	0x1e
	.uleb128 0x12
	.long	.LASF1598
	.byte	0x1e
	.byte	0x5a
	.long	0x842
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0x852
	.uleb128 0xb
	.long	0xa7
	.byte	0x3f
	.byte	0
	.uleb128 0x2
	.long	.LASF1599
	.byte	0x1e
	.byte	0x5b
	.long	0x7d5
	.uleb128 0x2
	.long	.LASF1600
	.byte	0x1e
	.byte	0x5f
	.long	0x868
	.uleb128 0x6
	.byte	0x8
	.long	0x86e
	.uleb128 0xe
	.long	0x879
	.uleb128 0xf
	.long	0x879
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x852
	.uleb128 0xc
	.long	.LASF1601
	.byte	0xc
	.byte	0x1f
	.byte	0x14
	.long	0x8ec
	.uleb128 0x12
	.long	.LASF1602
	.byte	0x1f
	.byte	0x15
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1603
	.byte	0x1f
	.byte	0x16
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1604
	.byte	0x1f
	.byte	0x17
	.long	0x6a
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1605
	.byte	0x1f
	.byte	0x18
	.long	0x6a
	.byte	0x3
	.uleb128 0x12
	.long	.LASF1606
	.byte	0x1f
	.byte	0x19
	.long	0x141
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1607
	.byte	0x1f
	.byte	0x1a
	.long	0x6a
	.byte	0x7
	.uleb128 0x12
	.long	.LASF1608
	.byte	0x1f
	.byte	0x1b
	.long	0x6a
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1609
	.byte	0x1f
	.byte	0x1c
	.long	0x7c
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.long	.LASF1610
	.byte	0x1f
	.byte	0x1d
	.long	0x87f
	.uleb128 0xc
	.long	.LASF1611
	.byte	0x1
	.byte	0x1f
	.byte	0x24
	.long	0x910
	.uleb128 0x12
	.long	.LASF1612
	.byte	0x1f
	.byte	0x25
	.long	0x6a
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1613
	.byte	0x1f
	.byte	0x26
	.long	0x8f7
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x2
	.byte	0x16
	.long	0x9d6
	.uleb128 0x9
	.long	.LASF1614
	.byte	0
	.uleb128 0x9
	.long	.LASF1615
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1616
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1617
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1618
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1619
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1620
	.byte	0x6
	.uleb128 0x9
	.long	.LASF1621
	.byte	0x7
	.uleb128 0x9
	.long	.LASF1622
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1623
	.byte	0x9
	.uleb128 0x9
	.long	.LASF1624
	.byte	0xa
	.uleb128 0x9
	.long	.LASF1625
	.byte	0xb
	.uleb128 0x9
	.long	.LASF1626
	.byte	0xc
	.uleb128 0x9
	.long	.LASF1627
	.byte	0xd
	.uleb128 0x9
	.long	.LASF1628
	.byte	0xe
	.uleb128 0x9
	.long	.LASF1629
	.byte	0xf
	.uleb128 0x9
	.long	.LASF1630
	.byte	0x10
	.uleb128 0x9
	.long	.LASF1631
	.byte	0x11
	.uleb128 0x9
	.long	.LASF1632
	.byte	0x12
	.uleb128 0x9
	.long	.LASF1633
	.byte	0x13
	.uleb128 0x9
	.long	.LASF1634
	.byte	0x14
	.uleb128 0x9
	.long	.LASF1635
	.byte	0x15
	.uleb128 0x9
	.long	.LASF1636
	.byte	0x16
	.uleb128 0x9
	.long	.LASF1637
	.byte	0x17
	.uleb128 0x9
	.long	.LASF1638
	.byte	0x18
	.uleb128 0x9
	.long	.LASF1639
	.byte	0x19
	.uleb128 0x9
	.long	.LASF1640
	.byte	0x1a
	.uleb128 0x9
	.long	.LASF1641
	.byte	0x1b
	.uleb128 0x9
	.long	.LASF1642
	.byte	0x1c
	.byte	0
	.uleb128 0x2
	.long	.LASF1643
	.byte	0x2
	.byte	0x35
	.long	0x91b
	.uleb128 0x14
	.long	.LASF1644
	.byte	0x4
	.long	0x99
	.byte	0x2
	.byte	0x37
	.long	0xa3a
	.uleb128 0x9
	.long	.LASF1645
	.byte	0
	.uleb128 0x9
	.long	.LASF1646
	.byte	0x1
	.uleb128 0x18
	.string	"YAW"
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1647
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1648
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1649
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1650
	.byte	0x6
	.uleb128 0x9
	.long	.LASF1651
	.byte	0x7
	.uleb128 0x9
	.long	.LASF1652
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1653
	.byte	0x9
	.uleb128 0x9
	.long	.LASF1654
	.byte	0xa
	.uleb128 0x9
	.long	.LASF1655
	.byte	0xb
	.byte	0
	.uleb128 0xc
	.long	.LASF1656
	.byte	0x2
	.byte	0x2
	.byte	0x74
	.long	0xa5f
	.uleb128 0x12
	.long	.LASF1657
	.byte	0x2
	.byte	0x75
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1658
	.byte	0x2
	.byte	0x76
	.long	0x6a
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1659
	.byte	0x2
	.byte	0x77
	.long	0xa3a
	.uleb128 0xc
	.long	.LASF1660
	.byte	0x8
	.byte	0x2
	.byte	0x79
	.long	0xa9b
	.uleb128 0x12
	.long	.LASF1661
	.byte	0x2
	.byte	0x7a
	.long	0x9d6
	.byte	0
	.uleb128 0x12
	.long	.LASF1662
	.byte	0x2
	.byte	0x7b
	.long	0x6a
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1663
	.byte	0x2
	.byte	0x7c
	.long	0xa5f
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.long	.LASF1664
	.byte	0x2
	.byte	0x7d
	.long	0xa6a
	.uleb128 0xc
	.long	.LASF1665
	.byte	0xa0
	.byte	0x2
	.byte	0x81
	.long	0xabf
	.uleb128 0x12
	.long	.LASF1666
	.byte	0x2
	.byte	0x82
	.long	0xabf
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0xa9b
	.long	0xacf
	.uleb128 0xb
	.long	0xa7
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.long	.LASF1667
	.byte	0x2
	.byte	0x83
	.long	0xaa6
	.uleb128 0xc
	.long	.LASF1668
	.byte	0x8
	.byte	0x2
	.byte	0x89
	.long	0xb2f
	.uleb128 0x12
	.long	.LASF1669
	.byte	0x2
	.byte	0x8a
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1670
	.byte	0x2
	.byte	0x8b
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1671
	.byte	0x2
	.byte	0x8c
	.long	0x6a
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1672
	.byte	0x2
	.byte	0x8d
	.long	0x6a
	.byte	0x3
	.uleb128 0x12
	.long	.LASF1673
	.byte	0x2
	.byte	0x8e
	.long	0x2d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1674
	.byte	0x2
	.byte	0x8f
	.long	0x7c
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF1675
	.byte	0x2
	.byte	0x90
	.long	0xada
	.uleb128 0xc
	.long	.LASF1676
	.byte	0x4
	.byte	0x2
	.byte	0x94
	.long	0xb77
	.uleb128 0x12
	.long	.LASF1677
	.byte	0x2
	.byte	0x96
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1678
	.byte	0x2
	.byte	0x97
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1679
	.byte	0x2
	.byte	0x98
	.long	0x6a
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1680
	.byte	0x2
	.byte	0x99
	.long	0x6a
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF1681
	.byte	0x2
	.byte	0x9a
	.long	0xb3a
	.uleb128 0xc
	.long	.LASF1682
	.byte	0x6
	.byte	0x3
	.byte	0x62
	.long	0xbcb
	.uleb128 0x12
	.long	.LASF1662
	.byte	0x3
	.byte	0x64
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1663
	.byte	0x3
	.byte	0x65
	.long	0xa5f
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1683
	.byte	0x3
	.byte	0x68
	.long	0x6a
	.byte	0x3
	.uleb128 0x12
	.long	.LASF1684
	.byte	0x3
	.byte	0x69
	.long	0x6a
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1685
	.byte	0x3
	.byte	0x6c
	.long	0x6a
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.long	.LASF1686
	.byte	0x3
	.byte	0x6d
	.long	0xb82
	.uleb128 0x6
	.byte	0x8
	.long	0xbcb
	.uleb128 0xc
	.long	.LASF1687
	.byte	0x48
	.byte	0x3
	.byte	0x7a
	.long	0xbf5
	.uleb128 0x12
	.long	.LASF1688
	.byte	0x3
	.byte	0x7b
	.long	0xbf5
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0xbcb
	.long	0xc05
	.uleb128 0xb
	.long	0xa7
	.byte	0xb
	.byte	0
	.uleb128 0x2
	.long	.LASF1689
	.byte	0x3
	.byte	0x7c
	.long	0xbdc
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x20
	.byte	0x15
	.long	0xc2f
	.uleb128 0x9
	.long	.LASF1690
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1691
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1692
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x20
	.byte	0x21
	.long	0xc88
	.uleb128 0x9
	.long	.LASF1693
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1694
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1695
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1696
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1697
	.byte	0x10
	.uleb128 0x9
	.long	.LASF1698
	.byte	0x20
	.uleb128 0x9
	.long	.LASF1699
	.byte	0x40
	.uleb128 0x9
	.long	.LASF1700
	.byte	0x80
	.uleb128 0x19
	.long	.LASF1701
	.value	0x100
	.uleb128 0x19
	.long	.LASF1702
	.value	0x200
	.uleb128 0x19
	.long	.LASF1703
	.value	0x400
	.uleb128 0x19
	.long	.LASF1704
	.value	0x800
	.byte	0
	.uleb128 0x2
	.long	.LASF1705
	.byte	0x20
	.byte	0x2e
	.long	0xc2f
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x20
	.byte	0x3e
	.long	0xcc4
	.uleb128 0x9
	.long	.LASF1706
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1707
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1708
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1709
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1710
	.byte	0x10
	.uleb128 0x9
	.long	.LASF1711
	.byte	0x20
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x21
	.byte	0x17
	.long	0xd6f
	.uleb128 0x9
	.long	.LASF1712
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1713
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1714
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1715
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1716
	.byte	0x10
	.uleb128 0x9
	.long	.LASF1717
	.byte	0x20
	.uleb128 0x9
	.long	.LASF1718
	.byte	0x40
	.uleb128 0x9
	.long	.LASF1719
	.byte	0x80
	.uleb128 0x19
	.long	.LASF1720
	.value	0x100
	.uleb128 0x19
	.long	.LASF1721
	.value	0x200
	.uleb128 0x19
	.long	.LASF1722
	.value	0x400
	.uleb128 0x19
	.long	.LASF1723
	.value	0x800
	.uleb128 0x19
	.long	.LASF1724
	.value	0x1000
	.uleb128 0x19
	.long	.LASF1725
	.value	0x2000
	.uleb128 0x19
	.long	.LASF1726
	.value	0x4000
	.uleb128 0x19
	.long	.LASF1727
	.value	0x8000
	.uleb128 0x1a
	.long	.LASF1728
	.long	0x10000
	.uleb128 0x1a
	.long	.LASF1729
	.long	0x20000
	.uleb128 0x1a
	.long	.LASF1730
	.long	0x40000
	.uleb128 0x1a
	.long	.LASF1731
	.long	0x80000
	.uleb128 0x1a
	.long	.LASF1732
	.long	0x100000
	.uleb128 0x1a
	.long	.LASF1733
	.long	0x200000
	.byte	0
	.uleb128 0x7
	.long	0x6a
	.uleb128 0xc
	.long	.LASF1734
	.byte	0xc
	.byte	0x4
	.byte	0x14
	.long	0xdc9
	.uleb128 0x12
	.long	.LASF1735
	.byte	0x4
	.byte	0x17
	.long	0x7c
	.byte	0
	.uleb128 0x12
	.long	.LASF1736
	.byte	0x4
	.byte	0x18
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1737
	.byte	0x4
	.byte	0x19
	.long	0x7c
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1738
	.byte	0x4
	.byte	0x1a
	.long	0x7c
	.byte	0x6
	.uleb128 0x12
	.long	.LASF1739
	.byte	0x4
	.byte	0x1c
	.long	0x7c
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1740
	.byte	0x4
	.byte	0x1d
	.long	0x7c
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.long	.LASF1741
	.byte	0x4
	.byte	0x1e
	.long	0xd74
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x22
	.byte	0x19
	.long	0xded
	.uleb128 0x9
	.long	.LASF1742
	.byte	0
	.uleb128 0x9
	.long	.LASF1743
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1744
	.byte	0x22
	.byte	0x1c
	.long	0xdd4
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x22
	.byte	0x20
	.long	0xe23
	.uleb128 0x9
	.long	.LASF1745
	.byte	0
	.uleb128 0x9
	.long	.LASF1746
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1747
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1748
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1749
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF1750
	.byte	0x22
	.byte	0x26
	.long	0xdf8
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x22
	.byte	0x32
	.long	0xe47
	.uleb128 0x9
	.long	.LASF1751
	.byte	0
	.uleb128 0x9
	.long	.LASF1752
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1753
	.byte	0x22
	.byte	0x35
	.long	0xe2e
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x22
	.byte	0x37
	.long	0xe6b
	.uleb128 0x9
	.long	.LASF1754
	.byte	0
	.uleb128 0x9
	.long	.LASF1755
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1756
	.byte	0x22
	.byte	0x3a
	.long	0xe52
	.uleb128 0xc
	.long	.LASF1757
	.byte	0x10
	.byte	0x22
	.byte	0x3e
	.long	0xeb3
	.uleb128 0x12
	.long	.LASF1758
	.byte	0x22
	.byte	0x3f
	.long	0xded
	.byte	0
	.uleb128 0x12
	.long	.LASF1759
	.byte	0x22
	.byte	0x40
	.long	0xe23
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1760
	.byte	0x22
	.byte	0x41
	.long	0xe47
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1761
	.byte	0x22
	.byte	0x42
	.long	0xe6b
	.byte	0xc
	.byte	0
	.uleb128 0x2
	.long	.LASF1762
	.byte	0x22
	.byte	0x43
	.long	0xe76
	.uleb128 0xc
	.long	.LASF1763
	.byte	0x1
	.byte	0x23
	.byte	0x1b
	.long	0xed7
	.uleb128 0x12
	.long	.LASF1529
	.byte	0x23
	.byte	0x1c
	.long	0x6a
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1764
	.byte	0x23
	.byte	0x1d
	.long	0xebe
	.uleb128 0x8
	.byte	0x4
	.long	0x5c
	.byte	0x5
	.byte	0x36
	.long	0xf2b
	.uleb128 0x1b
	.long	.LASF1765
	.sleb128 -1
	.uleb128 0x9
	.long	.LASF1766
	.byte	0
	.uleb128 0x9
	.long	.LASF1767
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1768
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1769
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1770
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1771
	.byte	0x14
	.uleb128 0x9
	.long	.LASF1772
	.byte	0x1e
	.uleb128 0x9
	.long	.LASF1773
	.byte	0x1f
	.uleb128 0x9
	.long	.LASF1774
	.byte	0x1f
	.byte	0
	.uleb128 0x2
	.long	.LASF1775
	.byte	0x5
	.byte	0x41
	.long	0xee2
	.uleb128 0xc
	.long	.LASF1776
	.byte	0xc
	.byte	0x5
	.byte	0x5a
	.long	0xf67
	.uleb128 0x12
	.long	.LASF1528
	.byte	0x5
	.byte	0x5b
	.long	0xf2b
	.byte	0
	.uleb128 0x12
	.long	.LASF1777
	.byte	0x5
	.byte	0x5c
	.long	0x7c
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1778
	.byte	0x5
	.byte	0x5d
	.long	0xf67
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0xf77
	.uleb128 0xb
	.long	0xa7
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF1779
	.byte	0x5
	.byte	0x5e
	.long	0xf36
	.uleb128 0xc
	.long	.LASF1780
	.byte	0x1c
	.byte	0x5
	.byte	0x60
	.long	0xfa7
	.uleb128 0x12
	.long	.LASF1781
	.byte	0x5
	.byte	0x61
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1782
	.byte	0x5
	.byte	0x62
	.long	0xfa7
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0xf77
	.long	0xfb7
	.uleb128 0xb
	.long	0xa7
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1783
	.byte	0x5
	.byte	0x63
	.long	0xf82
	.uleb128 0xc
	.long	.LASF1784
	.byte	0x6
	.byte	0x24
	.byte	0x76
	.long	0xfdb
	.uleb128 0x12
	.long	.LASF1785
	.byte	0x24
	.byte	0x77
	.long	0xfdb
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0xfeb
	.uleb128 0xb
	.long	0xa7
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.long	.LASF1786
	.byte	0x24
	.byte	0x78
	.long	0xfc2
	.uleb128 0xc
	.long	.LASF1787
	.byte	0xb
	.byte	0x24
	.byte	0x7a
	.long	0x100f
	.uleb128 0x12
	.long	.LASF1785
	.byte	0x24
	.byte	0x7b
	.long	0x100f
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0x101f
	.uleb128 0xb
	.long	0xa7
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.long	.LASF1788
	.byte	0x24
	.byte	0x7c
	.long	0xff6
	.uleb128 0x2
	.long	.LASF1789
	.byte	0x24
	.byte	0x7e
	.long	0x8e
	.uleb128 0xc
	.long	.LASF1790
	.byte	0x6
	.byte	0x25
	.byte	0x14
	.long	0x104e
	.uleb128 0x12
	.long	.LASF1791
	.byte	0x25
	.byte	0x15
	.long	0xfdb
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1792
	.byte	0x25
	.byte	0x16
	.long	0x1035
	.uleb128 0xc
	.long	.LASF1793
	.byte	0x3
	.byte	0x26
	.byte	0x1e
	.long	0x108a
	.uleb128 0x12
	.long	.LASF1794
	.byte	0x26
	.byte	0x1f
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1795
	.byte	0x26
	.byte	0x20
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1796
	.byte	0x26
	.byte	0x21
	.long	0x6a
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1797
	.byte	0x26
	.byte	0x22
	.long	0x1059
	.uleb128 0xc
	.long	.LASF1798
	.byte	0x6
	.byte	0x6
	.byte	0x14
	.long	0x10c6
	.uleb128 0x12
	.long	.LASF1799
	.byte	0x6
	.byte	0x15
	.long	0x3f
	.byte	0
	.uleb128 0x12
	.long	.LASF1800
	.byte	0x6
	.byte	0x16
	.long	0x3f
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1801
	.byte	0x6
	.byte	0x17
	.long	0x3f
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF1802
	.byte	0x6
	.byte	0x18
	.long	0x1095
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x7
	.byte	0x14
	.long	0x10f6
	.uleb128 0x9
	.long	.LASF1803
	.byte	0
	.uleb128 0x9
	.long	.LASF1804
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1805
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1806
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF1807
	.byte	0x6
	.byte	0x7
	.byte	0x1f
	.long	0x1127
	.uleb128 0x12
	.long	.LASF1808
	.byte	0x7
	.byte	0x20
	.long	0x3f
	.byte	0
	.uleb128 0x12
	.long	.LASF1809
	.byte	0x7
	.byte	0x21
	.long	0x3f
	.byte	0x2
	.uleb128 0xd
	.string	"yaw"
	.byte	0x7
	.byte	0x22
	.long	0x3f
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF1810
	.byte	0x7
	.byte	0x23
	.long	0x10f6
	.uleb128 0x1c
	.long	.LASF1869
	.byte	0x6
	.byte	0x7
	.byte	0x25
	.long	0x1155
	.uleb128 0x11
	.string	"raw"
	.byte	0x7
	.byte	0x26
	.long	0x1155
	.uleb128 0x1d
	.long	.LASF1811
	.byte	0x7
	.byte	0x27
	.long	0x1127
	.byte	0
	.uleb128 0xa
	.long	0x3f
	.long	0x1165
	.uleb128 0xb
	.long	0xa7
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1812
	.byte	0x7
	.byte	0x28
	.long	0x1132
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x7
	.byte	0x2e
	.long	0x11a7
	.uleb128 0x9
	.long	.LASF1813
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1814
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1815
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1816
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1817
	.byte	0x10
	.uleb128 0x9
	.long	.LASF1818
	.byte	0x20
	.uleb128 0x9
	.long	.LASF1819
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x7
	.byte	0x38
	.long	0x11ea
	.uleb128 0x9
	.long	.LASF1820
	.byte	0
	.uleb128 0x9
	.long	.LASF1821
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1822
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1823
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1824
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1825
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1826
	.byte	0x6
	.uleb128 0x9
	.long	.LASF1827
	.byte	0x7
	.uleb128 0x9
	.long	.LASF1828
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF1829
	.byte	0x7
	.byte	0x42
	.long	0x11a7
	.uleb128 0xc
	.long	.LASF1830
	.byte	0xc
	.byte	0x7
	.byte	0x44
	.long	0x1226
	.uleb128 0x12
	.long	.LASF1831
	.byte	0x7
	.byte	0x45
	.long	0x11ea
	.byte	0
	.uleb128 0x12
	.long	.LASF1832
	.byte	0x7
	.byte	0x46
	.long	0x11ea
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1833
	.byte	0x7
	.byte	0x47
	.long	0x11ea
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF1834
	.byte	0x7
	.byte	0x48
	.long	0x11f5
	.uleb128 0xc
	.long	.LASF1835
	.byte	0x3
	.byte	0x7
	.byte	0x4a
	.long	0x1262
	.uleb128 0x12
	.long	.LASF1836
	.byte	0x7
	.byte	0x4b
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1837
	.byte	0x7
	.byte	0x4c
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1838
	.byte	0x7
	.byte	0x4d
	.long	0x6a
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1839
	.byte	0x7
	.byte	0x4e
	.long	0x1231
	.uleb128 0xc
	.long	.LASF1840
	.byte	0xc
	.byte	0x7
	.byte	0x50
	.long	0x1292
	.uleb128 0x12
	.long	.LASF1841
	.byte	0x7
	.byte	0x51
	.long	0x1165
	.byte	0
	.uleb128 0x12
	.long	.LASF1842
	.byte	0x7
	.byte	0x52
	.long	0x1165
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF1843
	.byte	0x7
	.byte	0x53
	.long	0x126d
	.uleb128 0xc
	.long	.LASF1844
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.long	0x12c2
	.uleb128 0x12
	.long	.LASF1845
	.byte	0x8
	.byte	0x19
	.long	0x3f
	.byte	0
	.uleb128 0x12
	.long	.LASF1595
	.byte	0x8
	.byte	0x1a
	.long	0x7c
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1846
	.byte	0x8
	.byte	0x1b
	.long	0x129d
	.uleb128 0xc
	.long	.LASF1847
	.byte	0x8
	.byte	0x8
	.byte	0x1f
	.long	0x12f2
	.uleb128 0x12
	.long	.LASF1848
	.byte	0x8
	.byte	0x20
	.long	0x51
	.byte	0
	.uleb128 0x12
	.long	.LASF1849
	.byte	0x8
	.byte	0x21
	.long	0x51
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF1850
	.byte	0x8
	.byte	0x22
	.long	0x12cd
	.uleb128 0xc
	.long	.LASF1851
	.byte	0x3
	.byte	0x9
	.byte	0x20
	.long	0x132e
	.uleb128 0x12
	.long	.LASF1852
	.byte	0x9
	.byte	0x21
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1853
	.byte	0x9
	.byte	0x22
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1854
	.byte	0x9
	.byte	0x23
	.long	0x6a
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1855
	.byte	0x9
	.byte	0x24
	.long	0x12fd
	.uleb128 0xc
	.long	.LASF1856
	.byte	0x8
	.byte	0xa
	.byte	0x14
	.long	0x1382
	.uleb128 0x12
	.long	.LASF1857
	.byte	0xa
	.byte	0x15
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1858
	.byte	0xa
	.byte	0x16
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1859
	.byte	0xa
	.byte	0x17
	.long	0x6a
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1860
	.byte	0xa
	.byte	0x18
	.long	0x7c
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1861
	.byte	0xa
	.byte	0x19
	.long	0x6a
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF1862
	.byte	0xa
	.byte	0x1a
	.long	0x1339
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0xa
	.byte	0x1e
	.long	0x13b2
	.uleb128 0x9
	.long	.LASF1863
	.byte	0
	.uleb128 0x9
	.long	.LASF1864
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1865
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1866
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF1867
	.byte	0x4
	.byte	0xb
	.byte	0x29
	.long	0x13d7
	.uleb128 0x12
	.long	.LASF1808
	.byte	0xb
	.byte	0x2a
	.long	0x3f
	.byte	0
	.uleb128 0x12
	.long	.LASF1809
	.byte	0xb
	.byte	0x2b
	.long	0x3f
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1868
	.byte	0xb
	.byte	0x2c
	.long	0x13b2
	.uleb128 0x1c
	.long	.LASF1870
	.byte	0x4
	.byte	0xb
	.byte	0x2e
	.long	0x1405
	.uleb128 0x11
	.string	"raw"
	.byte	0xb
	.byte	0x2f
	.long	0x1405
	.uleb128 0x1d
	.long	.LASF1811
	.byte	0xb
	.byte	0x30
	.long	0x13d7
	.byte	0
	.uleb128 0xa
	.long	0x3f
	.long	0x1415
	.uleb128 0xb
	.long	0xa7
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1871
	.byte	0xb
	.byte	0x31
	.long	0x13e2
	.uleb128 0xc
	.long	.LASF1872
	.byte	0x2
	.byte	0xb
	.byte	0x33
	.long	0x1442
	.uleb128 0xd
	.string	"xy"
	.byte	0xb
	.byte	0x34
	.long	0x6a
	.byte	0
	.uleb128 0xd
	.string	"z"
	.byte	0xb
	.byte	0x35
	.long	0x6a
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1873
	.byte	0xb
	.byte	0x36
	.long	0x1420
	.uleb128 0xc
	.long	.LASF1874
	.byte	0x10
	.byte	0xb
	.byte	0x38
	.long	0x1496
	.uleb128 0x12
	.long	.LASF1875
	.byte	0xb
	.byte	0x39
	.long	0x1415
	.byte	0
	.uleb128 0x12
	.long	.LASF1876
	.byte	0xb
	.byte	0x3c
	.long	0x6a
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1877
	.byte	0xb
	.byte	0x3d
	.long	0xd0
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1878
	.byte	0xb
	.byte	0x3e
	.long	0x1442
	.byte	0xc
	.uleb128 0x12
	.long	.LASF1879
	.byte	0xb
	.byte	0x3f
	.long	0x6a
	.byte	0xe
	.byte	0
	.uleb128 0x2
	.long	.LASF1880
	.byte	0xb
	.byte	0x40
	.long	0x144d
	.uleb128 0xc
	.long	.LASF1881
	.byte	0x2
	.byte	0xc
	.byte	0x1f
	.long	0x14ba
	.uleb128 0x12
	.long	.LASF1882
	.byte	0xc
	.byte	0x20
	.long	0x3f
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1883
	.byte	0xc
	.byte	0x22
	.long	0x14a1
	.uleb128 0xc
	.long	.LASF1884
	.byte	0x4
	.byte	0x27
	.byte	0x25
	.long	0x14f6
	.uleb128 0x12
	.long	.LASF1885
	.byte	0x27
	.byte	0x26
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1886
	.byte	0x27
	.byte	0x27
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1887
	.byte	0x27
	.byte	0x28
	.long	0x7c
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1888
	.byte	0x27
	.byte	0x29
	.long	0x14c5
	.uleb128 0x14
	.long	.LASF1889
	.byte	0x4
	.long	0x99
	.byte	0xd
	.byte	0x22
	.long	0x15a8
	.uleb128 0x9
	.long	.LASF1890
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1891
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1892
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1893
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1894
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1895
	.byte	0x6
	.uleb128 0x9
	.long	.LASF1896
	.byte	0x7
	.uleb128 0x9
	.long	.LASF1897
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1898
	.byte	0x9
	.uleb128 0x9
	.long	.LASF1899
	.byte	0xa
	.uleb128 0x9
	.long	.LASF1900
	.byte	0xb
	.uleb128 0x9
	.long	.LASF1901
	.byte	0xc
	.uleb128 0x9
	.long	.LASF1902
	.byte	0xd
	.uleb128 0x9
	.long	.LASF1903
	.byte	0xe
	.uleb128 0x9
	.long	.LASF1904
	.byte	0xf
	.uleb128 0x9
	.long	.LASF1905
	.byte	0x10
	.uleb128 0x9
	.long	.LASF1906
	.byte	0x11
	.uleb128 0x9
	.long	.LASF1907
	.byte	0x12
	.uleb128 0x9
	.long	.LASF1908
	.byte	0x13
	.uleb128 0x9
	.long	.LASF1909
	.byte	0x14
	.uleb128 0x9
	.long	.LASF1910
	.byte	0x15
	.uleb128 0x9
	.long	.LASF1911
	.byte	0x16
	.uleb128 0x9
	.long	.LASF1912
	.byte	0x17
	.uleb128 0x9
	.long	.LASF1913
	.byte	0x18
	.uleb128 0x9
	.long	.LASF1914
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.long	.LASF1915
	.byte	0x10
	.byte	0xd
	.byte	0x40
	.long	0x15e5
	.uleb128 0x12
	.long	.LASF1916
	.byte	0xd
	.byte	0x41
	.long	0xd0
	.byte	0
	.uleb128 0x12
	.long	.LASF1808
	.byte	0xd
	.byte	0x42
	.long	0xd0
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1809
	.byte	0xd
	.byte	0x43
	.long	0xd0
	.byte	0x8
	.uleb128 0xd
	.string	"yaw"
	.byte	0xd
	.byte	0x44
	.long	0xd0
	.byte	0xc
	.byte	0
	.uleb128 0x2
	.long	.LASF1917
	.byte	0xd
	.byte	0x45
	.long	0x15a8
	.uleb128 0xc
	.long	.LASF1918
	.byte	0x6
	.byte	0xd
	.byte	0x50
	.long	0x162d
	.uleb128 0x12
	.long	.LASF1889
	.byte	0xd
	.byte	0x51
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1919
	.byte	0xd
	.byte	0x52
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1920
	.byte	0xd
	.byte	0x53
	.long	0x2d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1921
	.byte	0xd
	.byte	0x54
	.long	0x7c
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF1922
	.byte	0xd
	.byte	0x5a
	.long	0x15f0
	.uleb128 0xc
	.long	.LASF1923
	.byte	0x6
	.byte	0xd
	.byte	0x5e
	.long	0x1669
	.uleb128 0x12
	.long	.LASF1924
	.byte	0xd
	.byte	0x5f
	.long	0x7c
	.byte	0
	.uleb128 0x12
	.long	.LASF1925
	.byte	0xd
	.byte	0x60
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1926
	.byte	0xd
	.byte	0x61
	.long	0x7c
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF1927
	.byte	0xd
	.byte	0x62
	.long	0x1638
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0x28
	.byte	0x1c
	.long	0x16db
	.uleb128 0x9
	.long	.LASF1928
	.byte	0
	.uleb128 0x9
	.long	.LASF1929
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1930
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1931
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1932
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1933
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1934
	.byte	0x6
	.uleb128 0x9
	.long	.LASF1935
	.byte	0x7
	.uleb128 0x9
	.long	.LASF1936
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1937
	.byte	0x9
	.uleb128 0x9
	.long	.LASF1938
	.byte	0xa
	.uleb128 0x9
	.long	.LASF1939
	.byte	0xb
	.uleb128 0x9
	.long	.LASF1940
	.byte	0xc
	.uleb128 0x9
	.long	.LASF1941
	.byte	0xd
	.uleb128 0x9
	.long	.LASF1942
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.long	.LASF1943
	.byte	0x7
	.byte	0x28
	.byte	0x53
	.long	0x173c
	.uleb128 0x12
	.long	.LASF1944
	.byte	0x28
	.byte	0x54
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1945
	.byte	0x28
	.byte	0x55
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1946
	.byte	0x28
	.byte	0x56
	.long	0x2d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1947
	.byte	0x28
	.byte	0x57
	.long	0x6a
	.byte	0x3
	.uleb128 0xd
	.string	"min"
	.byte	0x28
	.byte	0x58
	.long	0x2d
	.byte	0x4
	.uleb128 0xd
	.string	"max"
	.byte	0x28
	.byte	0x59
	.long	0x2d
	.byte	0x5
	.uleb128 0xd
	.string	"box"
	.byte	0x28
	.byte	0x5a
	.long	0x6a
	.byte	0x6
	.byte	0
	.uleb128 0x2
	.long	.LASF1948
	.byte	0x28
	.byte	0x5b
	.long	0x16db
	.uleb128 0xc
	.long	.LASF1949
	.byte	0xe
	.byte	0x28
	.byte	0x69
	.long	0x17b4
	.uleb128 0xd
	.string	"min"
	.byte	0x28
	.byte	0x6a
	.long	0x3f
	.byte	0
	.uleb128 0xd
	.string	"max"
	.byte	0x28
	.byte	0x6b
	.long	0x3f
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1950
	.byte	0x28
	.byte	0x6c
	.long	0x3f
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1946
	.byte	0x28
	.byte	0x6d
	.long	0x2d
	.byte	0x6
	.uleb128 0x12
	.long	.LASF1951
	.byte	0x28
	.byte	0x6e
	.long	0x6a
	.byte	0x7
	.uleb128 0x12
	.long	.LASF1952
	.byte	0x28
	.byte	0x6f
	.long	0x6a
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1953
	.byte	0x28
	.byte	0x70
	.long	0x2d
	.byte	0x9
	.uleb128 0x12
	.long	.LASF1954
	.byte	0x28
	.byte	0x71
	.long	0x8e
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.long	.LASF1955
	.byte	0x28
	.byte	0x72
	.long	0x1747
	.uleb128 0xc
	.long	.LASF1956
	.byte	0xe
	.byte	0x28
	.byte	0x74
	.long	0x17d8
	.uleb128 0x12
	.long	.LASF1957
	.byte	0x28
	.byte	0x75
	.long	0x17d8
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x17b4
	.long	0x17e8
	.uleb128 0xb
	.long	0xa7
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF1958
	.byte	0x28
	.byte	0x76
	.long	0x17bf
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.byte	0xe
	.byte	0x1c
	.long	0x1842
	.uleb128 0x9
	.long	.LASF1959
	.byte	0
	.uleb128 0x9
	.long	.LASF1960
	.byte	0x1
	.uleb128 0x9
	.long	.LASF1961
	.byte	0x2
	.uleb128 0x9
	.long	.LASF1962
	.byte	0x3
	.uleb128 0x9
	.long	.LASF1963
	.byte	0x4
	.uleb128 0x9
	.long	.LASF1964
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1965
	.byte	0x6
	.uleb128 0x9
	.long	.LASF1966
	.byte	0x7
	.uleb128 0x9
	.long	.LASF1967
	.byte	0x8
	.uleb128 0x9
	.long	.LASF1968
	.byte	0x9
	.uleb128 0x9
	.long	.LASF1969
	.byte	0xa
	.byte	0
	.uleb128 0xc
	.long	.LASF1970
	.byte	0x2a
	.byte	0xe
	.byte	0x3d
	.long	0x18c4
	.uleb128 0xd
	.string	"P8"
	.byte	0xe
	.byte	0x3e
	.long	0x18c4
	.byte	0
	.uleb128 0xd
	.string	"I8"
	.byte	0xe
	.byte	0x3f
	.long	0x18c4
	.byte	0xa
	.uleb128 0xd
	.string	"D8"
	.byte	0xe
	.byte	0x40
	.long	0x18c4
	.byte	0x14
	.uleb128 0x12
	.long	.LASF1971
	.byte	0xe
	.byte	0x41
	.long	0x6a
	.byte	0x1e
	.uleb128 0x12
	.long	.LASF1972
	.byte	0xe
	.byte	0x42
	.long	0x7c
	.byte	0x20
	.uleb128 0x12
	.long	.LASF1973
	.byte	0xe
	.byte	0x43
	.long	0x7c
	.byte	0x22
	.uleb128 0x12
	.long	.LASF1974
	.byte	0xe
	.byte	0x44
	.long	0x7c
	.byte	0x24
	.uleb128 0x12
	.long	.LASF1975
	.byte	0xe
	.byte	0x45
	.long	0x6a
	.byte	0x26
	.uleb128 0x12
	.long	.LASF1976
	.byte	0xe
	.byte	0x46
	.long	0x6a
	.byte	0x27
	.uleb128 0x12
	.long	.LASF1977
	.byte	0xe
	.byte	0x47
	.long	0x6a
	.byte	0x28
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0x18d4
	.uleb128 0xb
	.long	0xa7
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.long	.LASF1978
	.byte	0xe
	.byte	0x48
	.long	0x1842
	.uleb128 0x1e
	.byte	0x6
	.byte	0xf
	.byte	0x22
	.long	0x190c
	.uleb128 0x12
	.long	.LASF1808
	.byte	0xf
	.byte	0x24
	.long	0x3f
	.byte	0
	.uleb128 0x12
	.long	.LASF1809
	.byte	0xf
	.byte	0x25
	.long	0x3f
	.byte	0x2
	.uleb128 0xd
	.string	"yaw"
	.byte	0xf
	.byte	0x26
	.long	0x3f
	.byte	0x4
	.byte	0
	.uleb128 0x10
	.byte	0x6
	.byte	0xf
	.byte	0x20
	.long	0x192b
	.uleb128 0x11
	.string	"raw"
	.byte	0xf
	.byte	0x21
	.long	0x1155
	.uleb128 0x1d
	.long	.LASF1811
	.byte	0xf
	.byte	0x27
	.long	0x18df
	.byte	0
	.uleb128 0x2
	.long	.LASF1979
	.byte	0xf
	.byte	0x28
	.long	0x190c
	.uleb128 0xc
	.long	.LASF1980
	.byte	0xc
	.byte	0xf
	.byte	0x2c
	.long	0x1997
	.uleb128 0x12
	.long	.LASF1981
	.byte	0xf
	.byte	0x2e
	.long	0x7c
	.byte	0
	.uleb128 0x12
	.long	.LASF1982
	.byte	0xf
	.byte	0x2f
	.long	0x6a
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1983
	.byte	0xf
	.byte	0x30
	.long	0x6a
	.byte	0x3
	.uleb128 0x12
	.long	.LASF1984
	.byte	0xf
	.byte	0x31
	.long	0x7c
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1985
	.byte	0xf
	.byte	0x32
	.long	0x7c
	.byte	0x6
	.uleb128 0x12
	.long	.LASF1986
	.byte	0xf
	.byte	0x33
	.long	0x6a
	.byte	0x8
	.uleb128 0x12
	.long	.LASF1987
	.byte	0xf
	.byte	0x34
	.long	0x7c
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.long	.LASF1988
	.byte	0xf
	.byte	0x35
	.long	0x1936
	.uleb128 0xc
	.long	.LASF1989
	.byte	0x4
	.byte	0xf
	.byte	0x39
	.long	0x19c7
	.uleb128 0x12
	.long	.LASF1990
	.byte	0xf
	.byte	0x3a
	.long	0x7c
	.byte	0
	.uleb128 0x12
	.long	.LASF1991
	.byte	0xf
	.byte	0x3b
	.long	0x6a
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF1992
	.byte	0xf
	.byte	0x3c
	.long	0x19a2
	.uleb128 0xc
	.long	.LASF1993
	.byte	0x8
	.byte	0x10
	.byte	0x1e
	.long	0x1a27
	.uleb128 0x12
	.long	.LASF1994
	.byte	0x10
	.byte	0x1f
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF1995
	.byte	0x10
	.byte	0x20
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF1996
	.byte	0x10
	.byte	0x21
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF1997
	.byte	0x10
	.byte	0x22
	.long	0x6a
	.byte	0x4
	.uleb128 0x12
	.long	.LASF1998
	.byte	0x10
	.byte	0x23
	.long	0x7c
	.byte	0x5
	.uleb128 0x12
	.long	.LASF1999
	.byte	0x10
	.byte	0x24
	.long	0x6a
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF2000
	.byte	0x10
	.byte	0x25
	.long	0x19d2
	.uleb128 0xc
	.long	.LASF2001
	.byte	0xc
	.byte	0x29
	.byte	0x1d
	.long	0x1a93
	.uleb128 0x12
	.long	.LASF2002
	.byte	0x29
	.byte	0x1e
	.long	0x7c
	.byte	0
	.uleb128 0x12
	.long	.LASF2003
	.byte	0x29
	.byte	0x1f
	.long	0x6a
	.byte	0x2
	.uleb128 0x12
	.long	.LASF2004
	.byte	0x29
	.byte	0x20
	.long	0x6a
	.byte	0x3
	.uleb128 0x12
	.long	.LASF2005
	.byte	0x29
	.byte	0x21
	.long	0x6a
	.byte	0x4
	.uleb128 0x12
	.long	.LASF2006
	.byte	0x29
	.byte	0x22
	.long	0x7c
	.byte	0x6
	.uleb128 0x12
	.long	.LASF2007
	.byte	0x29
	.byte	0x23
	.long	0x7c
	.byte	0x8
	.uleb128 0x12
	.long	.LASF2008
	.byte	0x29
	.byte	0x24
	.long	0x7c
	.byte	0xa
	.byte	0
	.uleb128 0x2
	.long	.LASF2009
	.byte	0x29
	.byte	0x25
	.long	0x1a32
	.uleb128 0xc
	.long	.LASF2010
	.byte	0x1
	.byte	0x2a
	.byte	0x1d
	.long	0x1ab7
	.uleb128 0x12
	.long	.LASF2011
	.byte	0x2a
	.byte	0x1e
	.long	0x2d
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF2012
	.byte	0x2a
	.byte	0x1f
	.long	0x1a9e
	.uleb128 0xc
	.long	.LASF2013
	.byte	0x3
	.byte	0x2b
	.byte	0x16
	.long	0x1af3
	.uleb128 0x12
	.long	.LASF2014
	.byte	0x2b
	.byte	0x17
	.long	0x6a
	.byte	0
	.uleb128 0x12
	.long	.LASF2015
	.byte	0x2b
	.byte	0x18
	.long	0x6a
	.byte	0x1
	.uleb128 0x12
	.long	.LASF2016
	.byte	0x2b
	.byte	0x19
	.long	0x6a
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF2017
	.byte	0x2b
	.byte	0x1a
	.long	0x1ac2
	.uleb128 0xc
	.long	.LASF2018
	.byte	0x1
	.byte	0x11
	.byte	0x12
	.long	0x1b17
	.uleb128 0x12
	.long	.LASF2019
	.byte	0x11
	.byte	0x13
	.long	0x6a
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF2020
	.byte	0x11
	.byte	0x14
	.long	0x1afe
	.uleb128 0xc
	.long	.LASF2021
	.byte	0x10
	.byte	0x12
	.byte	0x7a
	.long	0x1b53
	.uleb128 0x12
	.long	.LASF2022
	.byte	0x12
	.byte	0x7b
	.long	0xc5
	.byte	0
	.uleb128 0x12
	.long	.LASF2023
	.byte	0x12
	.byte	0x7c
	.long	0xd6f
	.byte	0x8
	.uleb128 0x12
	.long	.LASF2024
	.byte	0x12
	.byte	0x7d
	.long	0xd6f
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.long	.LASF2025
	.byte	0x12
	.byte	0x7e
	.long	0x1b22
	.uleb128 0x1f
	.long	.LASF2026
	.byte	0x1
	.byte	0x80
	.long	0x1b7b
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x6e8
	.uleb128 0x20
	.long	.LASF2035
	.byte	0x1
	.byte	0x82
	.long	0x1bb1
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x1bb1
	.uleb128 0x21
	.long	.LASF2037
	.byte	0x1
	.byte	0x82
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5f4
	.uleb128 0x1f
	.long	.LASF2027
	.byte	0x2
	.byte	0x85
	.long	0x1bd4
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0xacf
	.uleb128 0x1f
	.long	.LASF2028
	.byte	0x2
	.byte	0x92
	.long	0x1bf7
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0xb2f
	.uleb128 0x1f
	.long	.LASF2029
	.byte	0x2
	.byte	0x9c
	.long	0x1c1a
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0xb77
	.uleb128 0x1f
	.long	.LASF2030
	.byte	0x3
	.byte	0x7e
	.long	0x1c3d
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0xc05
	.uleb128 0x1f
	.long	.LASF2031
	.byte	0x4
	.byte	0x20
	.long	0x1c60
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0xdc9
	.uleb128 0x1f
	.long	.LASF2032
	.byte	0x5
	.byte	0x65
	.long	0x1c83
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0xfb7
	.uleb128 0x1f
	.long	.LASF2033
	.byte	0x6
	.byte	0x1a
	.long	0x1ca6
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x10c6
	.uleb128 0x1f
	.long	.LASF2034
	.byte	0x7
	.byte	0x56
	.long	0x1cc9
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x1226
	.uleb128 0x20
	.long	.LASF2036
	.byte	0x8
	.byte	0x1d
	.long	0x1cff
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cff
	.uleb128 0x21
	.long	.LASF2037
	.byte	0x8
	.byte	0x1d
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x12c2
	.uleb128 0x20
	.long	.LASF2038
	.byte	0x9
	.byte	0x26
	.long	0x1d35
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d35
	.uleb128 0x21
	.long	.LASF2037
	.byte	0x9
	.byte	0x26
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x132e
	.uleb128 0x1f
	.long	.LASF2039
	.byte	0xa
	.byte	0x1c
	.long	0x1d58
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x1382
	.uleb128 0x1f
	.long	.LASF2040
	.byte	0xb
	.byte	0x42
	.long	0x1d7b
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x1496
	.uleb128 0x1f
	.long	.LASF2041
	.byte	0xc
	.byte	0x24
	.long	0x1d9e
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x14ba
	.uleb128 0x1f
	.long	.LASF2042
	.byte	0xd
	.byte	0x5c
	.long	0x1dc1
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x162d
	.uleb128 0x1f
	.long	.LASF2043
	.byte	0xd
	.byte	0x64
	.long	0x1de4
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x1669
	.uleb128 0x1f
	.long	.LASF2044
	.byte	0xe
	.byte	0x4a
	.long	0x1e07
	.quad	.LFB64
	.quad	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x18d4
	.uleb128 0x1f
	.long	.LASF2045
	.byte	0xf
	.byte	0x37
	.long	0x1e2a
	.quad	.LFB65
	.quad	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x1997
	.uleb128 0x1f
	.long	.LASF2046
	.byte	0x10
	.byte	0x49
	.long	0x1e4d
	.quad	.LFB67
	.quad	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x1a27
	.uleb128 0x1f
	.long	.LASF2047
	.byte	0x11
	.byte	0x16
	.long	0x1e70
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x1b17
	.uleb128 0x22
	.long	.LASF2163
	.byte	0x12
	.byte	0xcf
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ea2
	.uleb128 0x23
	.string	"msp"
	.byte	0x12
	.byte	0xcf
	.long	0x879
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x20
	.long	.LASF2048
	.byte	0x12
	.byte	0xda
	.long	0x1f10
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f10
	.uleb128 0x21
	.long	.LASF2023
	.byte	0x12
	.byte	0xda
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x24
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x25
	.string	"i"
	.byte	0x12
	.byte	0xdc
	.long	0x99
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x24
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x26
	.long	.LASF2049
	.byte	0x12
	.byte	0xdd
	.long	0x1f10
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1f16
	.uleb128 0x7
	.long	0x1b53
	.uleb128 0x20
	.long	.LASF2050
	.byte	0x12
	.byte	0xe5
	.long	0x1f10
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f89
	.uleb128 0x21
	.long	.LASF2024
	.byte	0x12
	.byte	0xe5
	.long	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x24
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x25
	.string	"i"
	.byte	0x12
	.byte	0xe7
	.long	0x99
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x24
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x26
	.long	.LASF2049
	.byte	0x12
	.byte	0xe8
	.long	0x1f10
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF2052
	.byte	0x12
	.byte	0xf0
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0x2001
	.uleb128 0x21
	.long	.LASF2051
	.byte	0x12
	.byte	0xf0
	.long	0x2001
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"dst"
	.byte	0x12
	.byte	0xf2
	.long	0x2007
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x24
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x25
	.string	"i"
	.byte	0x12
	.byte	0xf3
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x24
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x25
	.string	"box"
	.byte	0x12
	.byte	0xf6
	.long	0x1f10
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x748
	.uleb128 0x6
	.byte	0x8
	.long	0x1b2
	.uleb128 0x27
	.long	.LASF2053
	.byte	0x12
	.byte	0xfc
	.quad	.LFB76
	.quad	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.long	0x2086
	.uleb128 0x21
	.long	.LASF2051
	.byte	0x12
	.byte	0xfc
	.long	0x2001
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"dst"
	.byte	0x12
	.byte	0xfe
	.long	0x2007
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x24
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x25
	.string	"i"
	.byte	0x12
	.byte	0xff
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x24
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x28
	.string	"box"
	.byte	0x12
	.value	0x102
	.long	0x1f10
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF2054
	.byte	0x12
	.value	0x107
	.quad	.LFB77
	.quad	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.long	0x20d5
	.uleb128 0x28
	.string	"ena"
	.byte	0x12
	.value	0x109
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x24
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x2a
	.long	.LASF2023
	.byte	0x12
	.value	0x15c
	.long	0x9d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LASF2055
	.byte	0x12
	.value	0x165
	.long	0x8e
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.long	0x21c0
	.uleb128 0x2a
	.long	.LASF2056
	.byte	0x12
	.value	0x16b
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2a
	.long	.LASF2057
	.byte	0x12
	.value	0x16e
	.long	0x21d5
	.uleb128 0x9
	.byte	0x3
	.quad	flightMode_boxId_map.6339
	.uleb128 0x2a
	.long	.LASF2058
	.byte	0x12
	.value	0x16f
	.long	0xc88
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2a
	.long	.LASF2059
	.byte	0x12
	.value	0x17c
	.long	0x21da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2a
	.long	.LASF2060
	.byte	0x12
	.value	0x18c
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2a
	.long	.LASF2061
	.byte	0x12
	.value	0x18d
	.long	0x99
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2c
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x217b
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x170
	.long	0x99
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x2c
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x219e
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x17f
	.long	0x99
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x24
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x2a
	.long	.LASF2023
	.byte	0x12
	.value	0x18e
	.long	0x9d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x21d0
	.long	0x21d0
	.uleb128 0xb
	.long	0xa7
	.byte	0xb
	.byte	0
	.uleb128 0x7
	.long	0x2d
	.uleb128 0x7
	.long	0x21c0
	.uleb128 0x7
	.long	0x8e
	.uleb128 0x29
	.long	.LASF2062
	.byte	0x12
	.value	0x198
	.quad	.LFB79
	.quad	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.long	0x221c
	.uleb128 0x2d
	.long	.LASF2051
	.byte	0x12
	.value	0x198
	.long	0x2001
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x28
	.string	"dst"
	.byte	0x12
	.value	0x19a
	.long	0x2007
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x29
	.long	.LASF2063
	.byte	0x12
	.value	0x1c8
	.quad	.LFB80
	.quad	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.long	0x2259
	.uleb128 0x2d
	.long	.LASF2051
	.byte	0x12
	.value	0x1c8
	.long	0x2001
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x28
	.string	"dst"
	.byte	0x12
	.value	0x1ca
	.long	0x2007
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2e
	.long	.LASF2164
	.byte	0x12
	.value	0x1e8
	.long	0x5c
	.quad	.LFB81
	.quad	.LFE81-.LFB81
	.uleb128 0x1
	.byte	0x9c
	.long	0x29ca
	.uleb128 0x2f
	.string	"cmd"
	.byte	0x12
	.value	0x1e8
	.long	0x2001
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0x2d
	.long	.LASF2051
	.byte	0x12
	.value	0x1e8
	.long	0x2001
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x28
	.string	"dst"
	.byte	0x12
	.value	0x1ea
	.long	0x2007
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x28
	.string	"src"
	.byte	0x12
	.value	0x1eb
	.long	0x2007
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x28
	.string	"len"
	.byte	0x12
	.value	0x1ed
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x24
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x30
	.long	.LASF2165
	.byte	0x12
	.value	0x21c
	.long	0x5c
	.long	0x22ee
	.uleb128 0x17
	.byte	0
	.uleb128 0x2a
	.long	.LASF1946
	.byte	0x12
	.value	0x471
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x2c
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.long	0x238c
	.uleb128 0x2a
	.long	.LASF2064
	.byte	0x12
	.value	0x228
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -188
	.uleb128 0x2c
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x2347
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x22a
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -332
	.byte	0
	.uleb128 0x2c
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.long	0x236b
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x22c
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.byte	0
	.uleb128 0x24
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x22e
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -324
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0x23b0
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x253
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.byte	0
	.uleb128 0x2c
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0x23d4
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x259
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -316
	.byte	0
	.uleb128 0x2c
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.long	0x23fa
	.uleb128 0x2a
	.long	.LASF2065
	.byte	0x12
	.value	0x276
	.long	0x29ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0x2c
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.long	0x241e
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x290
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.byte	0
	.uleb128 0x2c
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0x2442
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x29b
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -308
	.byte	0
	.uleb128 0x2c
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.long	0x2498
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x2ab
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x24
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.uleb128 0x28
	.string	"mac"
	.byte	0x12
	.value	0x2ac
	.long	0x29d0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x28
	.string	"box"
	.byte	0x12
	.value	0x2ad
	.long	0x1f10
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.long	0x24de
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x2b6
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -300
	.uleb128 0x24
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.uleb128 0x2a
	.long	.LASF2066
	.byte	0x12
	.value	0x2b7
	.long	0xbd6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0x2502
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x2e4
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.byte	0
	.uleb128 0x2c
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.long	0x2526
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x31c
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -292
	.byte	0
	.uleb128 0x2c
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.long	0x254a
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x337
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.byte	0
	.uleb128 0x2c
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.long	0x256e
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x33f
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -284
	.byte	0
	.uleb128 0x2c
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.long	0x2592
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x365
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.byte	0
	.uleb128 0x2c
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x25b6
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x370
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -276
	.byte	0
	.uleb128 0x2c
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x25fc
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x381
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x24
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.uleb128 0x2a
	.long	.LASF2067
	.byte	0x12
	.value	0x387
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -268
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.long	0x2622
	.uleb128 0x2a
	.long	.LASF2065
	.byte	0x12
	.value	0x3cf
	.long	0x29ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x2c
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0x2668
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x3d8
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x24
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.uleb128 0x2a
	.long	.LASF2068
	.byte	0x12
	.value	0x3d9
	.long	0x29ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.long	0x26ae
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x3e1
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x24
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.uleb128 0x2a
	.long	.LASF2069
	.byte	0x12
	.value	0x3e2
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.long	0x26d4
	.uleb128 0x2a
	.long	.LASF2070
	.byte	0x12
	.value	0x413
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.byte	0
	.uleb128 0x2c
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.long	0x272a
	.uleb128 0x2a
	.long	.LASF1574
	.byte	0x12
	.value	0x41d
	.long	0x6a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -338
	.uleb128 0x2a
	.long	.LASF2071
	.byte	0x12
	.value	0x420
	.long	0x29d6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x24
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x422
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.long	0x274e
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x43e
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -252
	.byte	0
	.uleb128 0x2c
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.long	0x27a2
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x446
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -228
	.uleb128 0x28
	.string	"mac"
	.byte	0x12
	.value	0x449
	.long	0x29d0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2a
	.long	.LASF2072
	.byte	0x12
	.value	0x44a
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x28
	.string	"box"
	.byte	0x12
	.value	0x44b
	.long	0x1f10
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.byte	0
	.uleb128 0x2c
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.long	0x27e8
	.uleb128 0x2a
	.long	.LASF2073
	.byte	0x12
	.value	0x458
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -220
	.uleb128 0x2a
	.long	.LASF2066
	.byte	0x12
	.value	0x45b
	.long	0xbd6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x2a
	.long	.LASF2074
	.byte	0x12
	.value	0x45c
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.byte	0
	.uleb128 0x2c
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.long	0x282e
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x46d
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x24
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.uleb128 0x2a
	.long	.LASF1946
	.byte	0x12
	.value	0x46e
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -212
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.long	0x2854
	.uleb128 0x2a
	.long	.LASF1567
	.byte	0x12
	.value	0x47c
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.byte	0
	.uleb128 0x2c
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.long	0x289a
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x498
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x24
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.uleb128 0x2a
	.long	.LASF2075
	.byte	0x12
	.value	0x499
	.long	0x29e6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -334
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.long	0x28bc
	.uleb128 0x31
	.long	.LASF2085
	.byte	0x12
	.value	0x4d4
	.long	0x29eb
	.byte	0
	.uleb128 0x2c
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.long	0x28e2
	.uleb128 0x2a
	.long	.LASF2076
	.byte	0x12
	.value	0x545
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.byte	0
	.uleb128 0x2c
	.quad	.LBB54
	.quad	.LBE54-.LBB54
	.long	0x2908
	.uleb128 0x2a
	.long	.LASF2076
	.byte	0x12
	.value	0x552
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.byte	0
	.uleb128 0x2c
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.long	0x292e
	.uleb128 0x2a
	.long	.LASF2077
	.byte	0x12
	.value	0x582
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -196
	.byte	0
	.uleb128 0x2c
	.quad	.LBB56
	.quad	.LBE56-.LBB56
	.long	0x2952
	.uleb128 0x28
	.string	"i"
	.byte	0x12
	.value	0x58f
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0
	.uleb128 0x24
	.quad	.LBB57
	.quad	.LBE57-.LBB57
	.uleb128 0x2a
	.long	.LASF2078
	.byte	0x12
	.value	0x5a7
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x24
	.quad	.LBB58
	.quad	.LBE58-.LBB58
	.uleb128 0x2a
	.long	.LASF1528
	.byte	0x12
	.value	0x5ad
	.long	0x6a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -337
	.uleb128 0x2a
	.long	.LASF2079
	.byte	0x12
	.value	0x5af
	.long	0x29f0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x24
	.quad	.LBB59
	.quad	.LBE59-.LBB59
	.uleb128 0x2a
	.long	.LASF2067
	.byte	0x12
	.value	0x5b5
	.long	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -236
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x12f2
	.uleb128 0x6
	.byte	0x8
	.long	0xa9b
	.uleb128 0xa
	.long	0x7c
	.long	0x29e6
	.uleb128 0xb
	.long	0xa7
	.byte	0x11
	.byte	0
	.uleb128 0x7
	.long	0x3f
	.uleb128 0x7
	.long	0x256
	.uleb128 0x6
	.byte	0x8
	.long	0xf77
	.uleb128 0x32
	.long	.LASF2166
	.byte	0x12
	.value	0x5f4
	.quad	.LFB82
	.quad	.LFE82-.LFB82
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x26
	.long	.LASF2080
	.byte	0x12
	.byte	0x77
	.long	0x2a25
	.uleb128 0x9
	.byte	0x3
	.quad	flightControllerIdentifier
	.uleb128 0x7
	.long	0xc5
	.uleb128 0x26
	.long	.LASF2081
	.byte	0x12
	.byte	0x78
	.long	0x2a25
	.uleb128 0x9
	.byte	0x3
	.quad	boardIdentifier
	.uleb128 0xa
	.long	0x1f16
	.long	0x2a4f
	.uleb128 0xb
	.long	0xa7
	.byte	0x1b
	.byte	0
	.uleb128 0x26
	.long	.LASF2082
	.byte	0x12
	.byte	0x80
	.long	0x2a64
	.uleb128 0x9
	.byte	0x3
	.quad	boxes
	.uleb128 0x7
	.long	0x2a3f
	.uleb128 0x26
	.long	.LASF2083
	.byte	0x12
	.byte	0xa1
	.long	0x8e
	.uleb128 0x9
	.byte	0x3
	.quad	activeBoxIds
	.uleb128 0xa
	.long	0xcb
	.long	0x2a8e
	.uleb128 0xb
	.long	0xa7
	.byte	0x2f
	.byte	0
	.uleb128 0x26
	.long	.LASF2084
	.byte	0x12
	.byte	0xa6
	.long	0x2aa3
	.uleb128 0x9
	.byte	0x3
	.quad	pidnames
	.uleb128 0x7
	.long	0x2a7e
	.uleb128 0xa
	.long	0x3f
	.long	0x2ab8
	.uleb128 0xb
	.long	0xa7
	.byte	0x3
	.byte	0
	.uleb128 0x33
	.long	.LASF2086
	.byte	0x2c
	.byte	0x13
	.long	0x2aa8
	.uleb128 0x34
	.long	.LASF2087
	.byte	0x2d
	.byte	0xc8
	.long	0x8e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x34
	.long	.LASF2088
	.byte	0x2d
	.byte	0xc9
	.long	0x8e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x34
	.long	.LASF2089
	.byte	0x2d
	.byte	0xca
	.long	0x8e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x34
	.long	.LASF2090
	.byte	0x17
	.byte	0x43
	.long	0x2b17
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x6
	.byte	0x8
	.long	0x256
	.uleb128 0x34
	.long	.LASF2091
	.byte	0x17
	.byte	0x44
	.long	0x2b17
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x34
	.long	.LASF2092
	.byte	0x17
	.byte	0x47
	.long	0x1ac
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x34
	.long	.LASF2093
	.byte	0x17
	.byte	0x48
	.long	0x1ac
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x34
	.long	.LASF2094
	.byte	0x18
	.byte	0x18
	.long	0x27a
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x34
	.long	.LASF2095
	.byte	0x19
	.byte	0x1a
	.long	0x29e
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_System
	.uleb128 0xa
	.long	0x3f
	.long	0x2b96
	.uleb128 0xb
	.long	0xa7
	.byte	0x11
	.byte	0
	.uleb128 0x33
	.long	.LASF2096
	.byte	0x1
	.byte	0x4d
	.long	0x2b86
	.uleb128 0x34
	.long	.LASF2097
	.byte	0x1
	.byte	0x80
	.long	0x6e8
	.uleb128 0x9
	.byte	0x3
	.quad	rxConfig_System
	.uleb128 0xa
	.long	0x5f4
	.long	0x2bc6
	.uleb128 0xb
	.long	0xa7
	.byte	0x11
	.byte	0
	.uleb128 0x33
	.long	.LASF2098
	.byte	0x1
	.byte	0x82
	.long	0x2bb6
	.uleb128 0xa
	.long	0x624
	.long	0x2be1
	.uleb128 0xb
	.long	0xa7
	.byte	0x3
	.byte	0
	.uleb128 0x33
	.long	.LASF2099
	.byte	0x1
	.byte	0x83
	.long	0x2bd1
	.uleb128 0x33
	.long	.LASF2100
	.byte	0x1
	.byte	0x89
	.long	0x70c
	.uleb128 0x33
	.long	.LASF2101
	.byte	0x12
	.byte	0x74
	.long	0x7c
	.uleb128 0x33
	.long	.LASF2102
	.byte	0x1e
	.byte	0x61
	.long	0x85d
	.uleb128 0xa
	.long	0x8ec
	.long	0x2c1d
	.uleb128 0xb
	.long	0xa7
	.byte	0x2
	.byte	0
	.uleb128 0x33
	.long	.LASF2103
	.byte	0x1f
	.byte	0x20
	.long	0x2c0d
	.uleb128 0x33
	.long	.LASF2104
	.byte	0x1f
	.byte	0x22
	.long	0x2c33
	.uleb128 0x6
	.byte	0x8
	.long	0x8ec
	.uleb128 0x33
	.long	.LASF2105
	.byte	0x1f
	.byte	0x28
	.long	0x2c44
	.uleb128 0x6
	.byte	0x8
	.long	0x910
	.uleb128 0x33
	.long	.LASF2106
	.byte	0x2
	.byte	0x85
	.long	0x1bd4
	.uleb128 0x33
	.long	.LASF2107
	.byte	0x2
	.byte	0x92
	.long	0x1bf7
	.uleb128 0x34
	.long	.LASF2108
	.byte	0x2
	.byte	0x9c
	.long	0xb77
	.uleb128 0x9
	.byte	0x3
	.quad	armingConfig_System
	.uleb128 0x33
	.long	.LASF2109
	.byte	0x3
	.byte	0x7e
	.long	0x1c3d
	.uleb128 0x33
	.long	.LASF2110
	.byte	0x20
	.byte	0x1b
	.long	0x6a
	.uleb128 0x33
	.long	.LASF2111
	.byte	0x20
	.byte	0x30
	.long	0x7c
	.uleb128 0x33
	.long	.LASF2112
	.byte	0x20
	.byte	0x4b
	.long	0x6a
	.uleb128 0x33
	.long	.LASF2113
	.byte	0x2e
	.byte	0x48
	.long	0x7c
	.uleb128 0x34
	.long	.LASF2114
	.byte	0x4
	.byte	0x20
	.long	0xdc9
	.uleb128 0x9
	.byte	0x3
	.quad	motorAndServoConfig_System
	.uleb128 0x34
	.long	.LASF2115
	.byte	0x22
	.byte	0x45
	.long	0xeb3
	.uleb128 0x9
	.byte	0x3
	.quad	gpsConfig_System
	.uleb128 0x33
	.long	.LASF2116
	.byte	0x23
	.byte	0x1f
	.long	0x2ce1
	.uleb128 0x6
	.byte	0x8
	.long	0xed7
	.uleb128 0x34
	.long	.LASF2117
	.byte	0x5
	.byte	0x65
	.long	0xfb7
	.uleb128 0x9
	.byte	0x3
	.quad	serialConfig_System
	.uleb128 0xa
	.long	0x102a
	.long	0x2d0c
	.uleb128 0xb
	.long	0xa7
	.byte	0x1f
	.byte	0
	.uleb128 0x33
	.long	.LASF2118
	.byte	0x24
	.byte	0x95
	.long	0x2cfc
	.uleb128 0xa
	.long	0x17c
	.long	0x2d27
	.uleb128 0xb
	.long	0xa7
	.byte	0xf
	.byte	0
	.uleb128 0x33
	.long	.LASF2119
	.byte	0x24
	.byte	0x96
	.long	0x2d17
	.uleb128 0xa
	.long	0xfeb
	.long	0x2d42
	.uleb128 0xb
	.long	0xa7
	.byte	0x5
	.byte	0
	.uleb128 0x33
	.long	.LASF2120
	.byte	0x24
	.byte	0x97
	.long	0x2d32
	.uleb128 0x34
	.long	.LASF2121
	.byte	0x24
	.byte	0x98
	.long	0x101f
	.uleb128 0x9
	.byte	0x3
	.quad	specialColors_System
	.uleb128 0x34
	.long	.LASF2122
	.byte	0x25
	.byte	0x18
	.long	0x104e
	.uleb128 0x9
	.byte	0x3
	.quad	transponderConfig_System
	.uleb128 0x34
	.long	.LASF2123
	.byte	0x26
	.byte	0x24
	.long	0x108a
	.uleb128 0x9
	.byte	0x3
	.quad	telemetryConfig_System
	.uleb128 0x34
	.long	.LASF2124
	.byte	0x6
	.byte	0x1a
	.long	0x10c6
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_System
	.uleb128 0x34
	.long	.LASF2125
	.byte	0x7
	.byte	0x55
	.long	0x1262
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x34
	.long	.LASF2126
	.byte	0x7
	.byte	0x56
	.long	0x1226
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x34
	.long	.LASF2127
	.byte	0x7
	.byte	0x57
	.long	0x1292
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0xa
	.long	0x12c2
	.long	0x2df0
	.uleb128 0xb
	.long	0xa7
	.byte	0x1
	.byte	0
	.uleb128 0x33
	.long	.LASF2128
	.byte	0x8
	.byte	0x1d
	.long	0x2de0
	.uleb128 0xa
	.long	0x132e
	.long	0x2e0b
	.uleb128 0xb
	.long	0xa7
	.byte	0
	.byte	0
	.uleb128 0x33
	.long	.LASF2129
	.byte	0x9
	.byte	0x26
	.long	0x2dfb
	.uleb128 0x34
	.long	.LASF2130
	.byte	0xa
	.byte	0x1c
	.long	0x1382
	.uleb128 0x9
	.byte	0x3
	.quad	batteryConfig_System
	.uleb128 0x33
	.long	.LASF2131
	.byte	0xa
	.byte	0x25
	.long	0x7c
	.uleb128 0x35
	.string	"acc"
	.byte	0xb
	.byte	0x25
	.long	0x335
	.uleb128 0x33
	.long	.LASF2132
	.byte	0xb
	.byte	0x42
	.long	0x1d7b
	.uleb128 0x33
	.long	.LASF2133
	.byte	0xc
	.byte	0x24
	.long	0x1d9e
	.uleb128 0xa
	.long	0x51
	.long	0x2e67
	.uleb128 0xb
	.long	0xa7
	.byte	0x2
	.byte	0
	.uleb128 0x33
	.long	.LASF2134
	.byte	0xc
	.byte	0x2d
	.long	0x2e57
	.uleb128 0x33
	.long	.LASF2135
	.byte	0x27
	.byte	0x23
	.long	0x2e57
	.uleb128 0x34
	.long	.LASF2136
	.byte	0x27
	.byte	0x2b
	.long	0x14f6
	.uleb128 0x9
	.byte	0x3
	.quad	gyroConfig_System
	.uleb128 0xa
	.long	0x15e5
	.long	0x2ea2
	.uleb128 0xb
	.long	0xa7
	.byte	0x3
	.byte	0
	.uleb128 0x33
	.long	.LASF2137
	.byte	0xd
	.byte	0x47
	.long	0x2e92
	.uleb128 0x34
	.long	.LASF2138
	.byte	0xd
	.byte	0x5c
	.long	0x162d
	.uleb128 0x9
	.byte	0x3
	.quad	mixerConfig_System
	.uleb128 0x34
	.long	.LASF2139
	.byte	0xd
	.byte	0x64
	.long	0x1669
	.uleb128 0x9
	.byte	0x3
	.quad	motor3DConfig_System
	.uleb128 0x33
	.long	.LASF2140
	.byte	0xd
	.byte	0x68
	.long	0x2aa8
	.uleb128 0x33
	.long	.LASF2141
	.byte	0x12
	.byte	0xa4
	.long	0x2aa8
	.uleb128 0x34
	.long	.LASF2142
	.byte	0x28
	.byte	0x2d
	.long	0x1674
	.uleb128 0x9
	.byte	0x3
	.quad	inputSource_e
	.uleb128 0xa
	.long	0x173c
	.long	0x2f12
	.uleb128 0xb
	.long	0xa7
	.byte	0x1
	.byte	0
	.uleb128 0x33
	.long	.LASF2143
	.byte	0x28
	.byte	0x61
	.long	0x2f02
	.uleb128 0x33
	.long	.LASF2144
	.byte	0x28
	.byte	0x78
	.long	0x2f28
	.uleb128 0x6
	.byte	0x8
	.long	0x17e8
	.uleb128 0x33
	.long	.LASF2145
	.byte	0xe
	.byte	0x4a
	.long	0x1e07
	.uleb128 0x33
	.long	.LASF2146
	.byte	0xf
	.byte	0x18
	.long	0x1155
	.uleb128 0x33
	.long	.LASF2147
	.byte	0xf
	.byte	0x2a
	.long	0x192b
	.uleb128 0x34
	.long	.LASF2148
	.byte	0xf
	.byte	0x37
	.long	0x1997
	.uleb128 0x9
	.byte	0x3
	.quad	imuConfig_System
	.uleb128 0x33
	.long	.LASF2149
	.byte	0xf
	.byte	0x3e
	.long	0x2f6f
	.uleb128 0x6
	.byte	0x8
	.long	0x19c7
	.uleb128 0x34
	.long	.LASF2150
	.byte	0x10
	.byte	0x49
	.long	0x1a27
	.uleb128 0x9
	.byte	0x3
	.quad	failsafeConfig_System
	.uleb128 0x33
	.long	.LASF2151
	.byte	0x29
	.byte	0x27
	.long	0x2f95
	.uleb128 0x6
	.byte	0x8
	.long	0x1a93
	.uleb128 0x34
	.long	.LASF2152
	.byte	0x2a
	.byte	0x21
	.long	0x1ab7
	.uleb128 0x9
	.byte	0x3
	.quad	airplaneConfig_System
	.uleb128 0x34
	.long	.LASF2153
	.byte	0x2b
	.byte	0x1c
	.long	0x1af3
	.uleb128 0x9
	.byte	0x3
	.quad	blackboxConfig_System
	.uleb128 0x33
	.long	.LASF2154
	.byte	0x2f
	.byte	0x14
	.long	0x3f
	.uleb128 0x33
	.long	.LASF2155
	.byte	0x30
	.byte	0x1f
	.long	0x2a25
	.uleb128 0x33
	.long	.LASF2156
	.byte	0x30
	.byte	0x22
	.long	0x2a25
	.uleb128 0x33
	.long	.LASF2157
	.byte	0x30
	.byte	0x25
	.long	0x2a25
	.uleb128 0x34
	.long	.LASF2158
	.byte	0x11
	.byte	0x16
	.long	0x1b17
	.uleb128 0x9
	.byte	0x3
	.quad	mspServerConfig_System
	.uleb128 0x33
	.long	.LASF2159
	.byte	0x12
	.byte	0x73
	.long	0x7c
	.uleb128 0x31
	.long	.LASF2085
	.byte	0x12
	.value	0x4d4
	.long	0x29eb
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x15
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x21
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.uleb128 0x35
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x21c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB11
	.quad	.LFE11-.LFB11
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
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.quad	.LFB64
	.quad	.LFE64-.LFB64
	.quad	.LFB65
	.quad	.LFE65-.LFB65
	.quad	.LFB67
	.quad	.LFE67-.LFB67
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.quad	.LFB76
	.quad	.LFE76-.LFB76
	.quad	.LFB77
	.quad	.LFE77-.LFB77
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.quad	.LFB79
	.quad	.LFE79-.LFB79
	.quad	.LFB80
	.quad	.LFE80-.LFB80
	.quad	.LFB81
	.quad	.LFE81-.LFB81
	.quad	.LFB82
	.quad	.LFE82-.LFB82
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB10
	.quad	.LFE10
	.quad	.LFB11
	.quad	.LFE11
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
	.quad	.LFB25
	.quad	.LFE25
	.quad	.LFB45
	.quad	.LFE45
	.quad	.LFB47
	.quad	.LFE47
	.quad	.LFB49
	.quad	.LFE49
	.quad	.LFB51
	.quad	.LFE51
	.quad	.LFB53
	.quad	.LFE53
	.quad	.LFB54
	.quad	.LFE54
	.quad	.LFB55
	.quad	.LFE55
	.quad	.LFB59
	.quad	.LFE59
	.quad	.LFB60
	.quad	.LFE60
	.quad	.LFB64
	.quad	.LFE64
	.quad	.LFB65
	.quad	.LFE65
	.quad	.LFB67
	.quad	.LFE67
	.quad	.LFB71
	.quad	.LFE71
	.quad	.LFB72
	.quad	.LFE72
	.quad	.LFB73
	.quad	.LFE73
	.quad	.LFB74
	.quad	.LFE74
	.quad	.LFB75
	.quad	.LFE75
	.quad	.LFB76
	.quad	.LFE76
	.quad	.LFB77
	.quad	.LFE77
	.quad	.LFB78
	.quad	.LFE78
	.quad	.LFB79
	.quad	.LFE79
	.quad	.LFB80
	.quad	.LFE80
	.quad	.LFB81
	.quad	.LFE81
	.quad	.LFB82
	.quad	.LFE82
	.quad	0
	.quad	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x12
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
	.file 49 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x31
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 50 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x32
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 51 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x33
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x17
	.long	.LASF259
	.file 52 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x34
	.byte	0x7
	.long	.Ldebug_macro3
	.file 53 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x35
	.byte	0x7
	.long	.Ldebug_macro4
	.file 54 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.file 55 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0x37
	.file 56 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x38
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 57 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x39
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF457
	.byte	0x4
	.file 58 "/usr/include/stdlib.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x3a
	.byte	0x7
	.long	.Ldebug_macro10
	.file 59 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x5
	.uleb128 0x25
	.long	.LASF499
	.file 60 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x3c
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 61 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x3d
	.byte	0x7
	.long	.Ldebug_macro13
	.file 62 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x3e
	.byte	0x7
	.long	.Ldebug_macro14
	.file 63 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x3f
	.byte	0x5
	.uleb128 0x7
	.long	.LASF529
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro15
	.file 64 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x40
	.byte	0x5
	.uleb128 0x18
	.long	.LASF536
	.file 65 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x18
	.long	.LASF537
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.file 66 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x42
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF591
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF592
	.file 67 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x43
	.byte	0x5
	.uleb128 0x19
	.long	.LASF593
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro21
	.file 68 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x13a
	.uleb128 0x44
	.byte	0x7
	.long	.Ldebug_macro22
	.file 69 "/usr/include/time.h"
	.byte	0x3
	.uleb128 0x84
	.uleb128 0x45
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x5
	.uleb128 0x91
	.long	.LASF458
	.byte	0x3
	.uleb128 0x92
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.file 70 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xdb
	.uleb128 0x46
	.byte	0x5
	.uleb128 0x16
	.long	.LASF658
	.file 71 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x47
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 72 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x48
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x45
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF669
	.file 73 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x49
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.file 74 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
	.byte	0x3
	.uleb128 0xde
	.uleb128 0x4a
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.file 75 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0x10e
	.uleb128 0x4b
	.byte	0x5
	.uleb128 0x13
	.long	.LASF692
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro34
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF707
	.file 76 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x1ec
	.uleb128 0x4c
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x5
	.uleb128 0x2e4
	.long	.LASF711
	.file 77 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ba
	.uleb128 0x4d
	.byte	0x4
	.byte	0x6
	.uleb128 0x3c5
	.long	.LASF712
	.byte	0x4
	.file 78 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x4e
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.file 79 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0x4f
	.byte	0x5
	.uleb128 0x15
	.long	.LASF714
	.byte	0x4
	.byte	0x4
	.file 80 "/usr/include/math.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x50
	.byte	0x5
	.uleb128 0x18
	.long	.LASF715
	.file 81 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x51
	.file 82 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x52
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.byte	0x4
	.file 83 "/usr/include/x86_64-linux-gnu/bits/huge_val.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x53
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF735
	.byte	0x4
	.file 84 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x54
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF736
	.byte	0x4
	.file 85 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x55
	.byte	0x5
	.uleb128 0x19
	.long	.LASF737
	.byte	0x4
	.file 86 "/usr/include/x86_64-linux-gnu/bits/inf.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x56
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF738
	.byte	0x4
	.file 87 "/usr/include/x86_64-linux-gnu/bits/nan.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x57
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF739
	.byte	0x4
	.file 88 "/usr/include/x86_64-linux-gnu/bits/mathdef.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x58
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro41
	.file 89 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
	.byte	0x3
	.uleb128 0x53
	.uleb128 0x59
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x3
	.uleb128 0x68
	.uleb128 0x59
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x3
	.uleb128 0x97
	.uleb128 0x59
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.file 90 "./src/main/build/build_config.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x5a
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x2c
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x4
	.file 91 "./src/main/platform.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x5b
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x2d
	.byte	0x7
	.long	.Ldebug_macro47
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF929
	.byte	0x4
	.file 92 "./src/main/common/utils.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x5c
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro48
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro49
	.byte	0x4
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro50
	.byte	0x4
	.file 93 "./src/main/common/maths.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x5d
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x4
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x16
	.byte	0x4
	.file 94 "./src/main/common/filter.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x5e
	.byte	0x4
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x4
	.file 95 "./src/main/config/parameter_group_ids.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x5f
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x4
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x18
	.byte	0x4
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1058
	.byte	0x4
	.file 96 "./src/main/drivers/system.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x60
	.byte	0x4
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x1a
	.byte	0x4
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x1b
	.byte	0x4
	.file 97 "./src/main/drivers/compass.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x61
	.byte	0x4
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x1c
	.byte	0x4
	.file 98 "./src/main/drivers/bus_i2c.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x62
	.byte	0x7
	.long	.Ldebug_macro54
	.byte	0x4
	.file 99 "./src/main/drivers/sdcard.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x63
	.byte	0x4
	.file 100 "./src/main/drivers/buf_writer.h"
	.byte	0x3
	.uleb128 0x32
	.uleb128 0x64
	.byte	0x4
	.byte	0x3
	.uleb128 0x34
	.uleb128 0x1
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x4
	.file 101 "./src/main/rx/msp.h"
	.byte	0x3
	.uleb128 0x35
	.uleb128 0x65
	.byte	0x4
	.byte	0x3
	.uleb128 0x37
	.uleb128 0x1d
	.byte	0x4
	.file 102 "./src/main/msp/msp_protocol.h"
	.byte	0x3
	.uleb128 0x38
	.uleb128 0x66
	.byte	0x7
	.long	.Ldebug_macro56
	.byte	0x4
	.byte	0x3
	.uleb128 0x39
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro57
	.byte	0x4
	.byte	0x3
	.uleb128 0x3b
	.uleb128 0x1f
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1264
	.byte	0x4
	.byte	0x3
	.uleb128 0x3c
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.byte	0x3
	.uleb128 0x3d
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro59
	.byte	0x4
	.file 103 "./src/main/fc/fc_tasks.h"
	.byte	0x3
	.uleb128 0x3e
	.uleb128 0x67
	.byte	0x4
	.byte	0x3
	.uleb128 0x3f
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro60
	.byte	0x4
	.byte	0x3
	.uleb128 0x40
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1310
	.byte	0x4
	.byte	0x3
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x4
	.byte	0x3
	.uleb128 0x44
	.uleb128 0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x45
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro62
	.byte	0x4
	.byte	0x3
	.uleb128 0x46
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1327
	.byte	0x4
	.byte	0x3
	.uleb128 0x47
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1328
	.byte	0x4
	.byte	0x3
	.uleb128 0x48
	.uleb128 0x24
	.byte	0x7
	.long	.Ldebug_macro63
	.byte	0x4
	.file 104 "./src/main/io/flashfs.h"
	.byte	0x3
	.uleb128 0x49
	.uleb128 0x68
	.file 105 "./src/main/drivers/flash.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x69
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro64
	.byte	0x4
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x25
	.byte	0x4
	.file 106 "./src/main/io/asyncfatfs/asyncfatfs.h"
	.byte	0x3
	.uleb128 0x4b
	.uleb128 0x6a
	.file 107 "./src/main/io/asyncfatfs/fat_standard.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x6b
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x4
	.byte	0x4
	.file 108 "./src/main/io/serial_4way.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x6c
	.byte	0x4
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x26
	.byte	0x4
	.byte	0x3
	.uleb128 0x50
	.uleb128 0x6
	.byte	0x4
	.byte	0x3
	.uleb128 0x51
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro66
	.byte	0x4
	.byte	0x3
	.uleb128 0x52
	.uleb128 0x8
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1398
	.byte	0x4
	.byte	0x3
	.uleb128 0x53
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro67
	.byte	0x4
	.byte	0x3
	.uleb128 0x54
	.uleb128 0xa
	.byte	0x4
	.file 109 "./src/main/sensors/sonar.h"
	.byte	0x3
	.uleb128 0x55
	.uleb128 0x6d
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1406
	.byte	0x4
	.byte	0x3
	.uleb128 0x56
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1407
	.byte	0x4
	.file 110 "./src/main/sensors/barometer.h"
	.byte	0x3
	.uleb128 0x57
	.uleb128 0x6e
	.byte	0x7
	.long	.Ldebug_macro68
	.byte	0x4
	.byte	0x3
	.uleb128 0x58
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1410
	.byte	0x4
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x27
	.byte	0x4
	.byte	0x3
	.uleb128 0x5b
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro69
	.byte	0x4
	.byte	0x3
	.uleb128 0x5c
	.uleb128 0x28
	.byte	0x7
	.long	.Ldebug_macro70
	.byte	0x4
	.byte	0x3
	.uleb128 0x5d
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro71
	.byte	0x4
	.byte	0x3
	.uleb128 0x5e
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro72
	.byte	0x4
	.byte	0x3
	.uleb128 0x5f
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro73
	.byte	0x4
	.byte	0x3
	.uleb128 0x60
	.uleb128 0x29
	.byte	0x4
	.byte	0x3
	.uleb128 0x61
	.uleb128 0x2a
	.byte	0x4
	.byte	0x3
	.uleb128 0x63
	.uleb128 0x2b
	.file 111 "./src/main/blackbox/blackbox_fielddefs.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x6f
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1446
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x65
	.uleb128 0x2f
	.byte	0x4
	.byte	0x3
	.uleb128 0x67
	.uleb128 0x30
	.byte	0x7
	.long	.Ldebug_macro74
	.byte	0x4
	.byte	0x3
	.uleb128 0x6c
	.uleb128 0x11
	.byte	0x4
	.file 112 "./src/main/fc/msp_server_fc.h"
	.byte	0x3
	.uleb128 0x6d
	.uleb128 0x70
	.byte	0x4
	.byte	0x5
	.uleb128 0x163
	.long	.LASF1455
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF1456
	.byte	0x2
	.uleb128 0x185
	.string	"BM"
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
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.07dce69c3b78884144b7f7bd19483461,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF254
	.byte	0x5
	.uleb128 0x21
	.long	.LASF255
	.byte	0x5
	.uleb128 0x22
	.long	.LASF256
	.byte	0x5
	.uleb128 0x23
	.long	.LASF257
	.byte	0x5
	.uleb128 0x34
	.long	.LASF258
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8a17512e4762abcff59e629b80463c10,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF260
	.byte	0x6
	.uleb128 0x61
	.long	.LASF261
	.byte	0x6
	.uleb128 0x62
	.long	.LASF262
	.byte	0x6
	.uleb128 0x63
	.long	.LASF263
	.byte	0x6
	.uleb128 0x64
	.long	.LASF264
	.byte	0x6
	.uleb128 0x65
	.long	.LASF265
	.byte	0x6
	.uleb128 0x66
	.long	.LASF266
	.byte	0x6
	.uleb128 0x67
	.long	.LASF267
	.byte	0x6
	.uleb128 0x68
	.long	.LASF268
	.byte	0x6
	.uleb128 0x69
	.long	.LASF269
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF270
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF271
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF272
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF273
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF274
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF275
	.byte	0x6
	.uleb128 0x70
	.long	.LASF276
	.byte	0x6
	.uleb128 0x71
	.long	.LASF277
	.byte	0x6
	.uleb128 0x72
	.long	.LASF278
	.byte	0x6
	.uleb128 0x73
	.long	.LASF279
	.byte	0x6
	.uleb128 0x74
	.long	.LASF280
	.byte	0x6
	.uleb128 0x75
	.long	.LASF281
	.byte	0x6
	.uleb128 0x76
	.long	.LASF282
	.byte	0x6
	.uleb128 0x77
	.long	.LASF283
	.byte	0x6
	.uleb128 0x78
	.long	.LASF284
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF285
	.byte	0x5
	.uleb128 0x88
	.long	.LASF286
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF287
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF288
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF289
	.byte	0x5
	.uleb128 0xce
	.long	.LASF290
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF291
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF292
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF293
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF294
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF295
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF296
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF297
	.byte	0x5
	.uleb128 0x101
	.long	.LASF298
	.byte	0x5
	.uleb128 0x105
	.long	.LASF299
	.byte	0x5
	.uleb128 0x109
	.long	.LASF300
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF263
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF290
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF262
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF289
	.byte	0x5
	.uleb128 0x111
	.long	.LASF301
	.byte	0x6
	.uleb128 0x112
	.long	.LASF302
	.byte	0x5
	.uleb128 0x113
	.long	.LASF303
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF304
	.byte	0x5
	.uleb128 0x141
	.long	.LASF305
	.byte	0x5
	.uleb128 0x154
	.long	.LASF306
	.byte	0x6
	.uleb128 0x161
	.long	.LASF307
	.byte	0x5
	.uleb128 0x162
	.long	.LASF308
	.byte	0x5
	.uleb128 0x166
	.long	.LASF309
	.byte	0x5
	.uleb128 0x167
	.long	.LASF310
	.byte	0x5
	.uleb128 0x169
	.long	.LASF311
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF312
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF313
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF314
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF315
	.byte	0x5
	.uleb128 0x37
	.long	.LASF316
	.byte	0x5
	.uleb128 0x38
	.long	.LASF317
	.byte	0x5
	.uleb128 0x39
	.long	.LASF318
	.byte	0x5
	.uleb128 0x52
	.long	.LASF319
	.byte	0x5
	.uleb128 0x53
	.long	.LASF320
	.byte	0x5
	.uleb128 0x58
	.long	.LASF321
	.byte	0x5
	.uleb128 0x59
	.long	.LASF322
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF323
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF324
	.byte	0x5
	.uleb128 0x65
	.long	.LASF325
	.byte	0x5
	.uleb128 0x66
	.long	.LASF326
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF327
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF328
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF329
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF330
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF331
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF332
	.byte	0x5
	.uleb128 0x84
	.long	.LASF333
	.byte	0x5
	.uleb128 0x85
	.long	.LASF334
	.byte	0x5
	.uleb128 0x88
	.long	.LASF335
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF336
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF337
	.byte	0x5
	.uleb128 0x96
	.long	.LASF338
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF339
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF340
	.byte	0x5
	.uleb128 0xba
	.long	.LASF341
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF342
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF343
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF344
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF345
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF346
	.byte	0x5
	.uleb128 0xec
	.long	.LASF347
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF348
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF349
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF350
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF351
	.byte	0x5
	.uleb128 0x114
	.long	.LASF352
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF353
	.byte	0x5
	.uleb128 0x125
	.long	.LASF354
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF355
	.byte	0x5
	.uleb128 0x133
	.long	.LASF356
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF357
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF358
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF359
	.byte	0x5
	.uleb128 0x157
	.long	.LASF360
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF361
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF362
	.byte	0x5
	.uleb128 0x172
	.long	.LASF363
	.byte	0x5
	.uleb128 0x181
	.long	.LASF364
	.byte	0x5
	.uleb128 0x182
	.long	.LASF365
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF366
	.byte	0x5
	.uleb128 0xa
	.long	.LASF367
	.byte	0x5
	.uleb128 0xc
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF369
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF370
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF371
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF372
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF373
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF374
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF375
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF376
	.byte	0x5
	.uleb128 0xb
	.long	.LASF377
	.byte	0x5
	.uleb128 0xc
	.long	.LASF378
	.byte	0x5
	.uleb128 0xd
	.long	.LASF379
	.byte	0x5
	.uleb128 0xe
	.long	.LASF380
	.byte	0x5
	.uleb128 0xf
	.long	.LASF381
	.byte	0x5
	.uleb128 0x10
	.long	.LASF382
	.byte	0x5
	.uleb128 0x11
	.long	.LASF383
	.byte	0x5
	.uleb128 0x12
	.long	.LASF384
	.byte	0x5
	.uleb128 0x13
	.long	.LASF385
	.byte	0x5
	.uleb128 0x14
	.long	.LASF386
	.byte	0x5
	.uleb128 0x15
	.long	.LASF387
	.byte	0x5
	.uleb128 0x16
	.long	.LASF388
	.byte	0x5
	.uleb128 0x17
	.long	.LASF389
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF390
	.byte	0x5
	.uleb128 0x22
	.long	.LASF391
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF392
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF393
	.byte	0x5
	.uleb128 0x34
	.long	.LASF394
	.byte	0x5
	.uleb128 0x78
	.long	.LASF395
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF396
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF397
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF398
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF399
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF400
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF401
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF402
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF403
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF404
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF405
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF406
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF407
	.byte	0x5
	.uleb128 0xad
	.long	.LASF408
	.byte	0x5
	.uleb128 0xae
	.long	.LASF409
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF410
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF411
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF412
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF413
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF414
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF415
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF416
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF417
	.byte	0x5
	.uleb128 0xba
	.long	.LASF418
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF419
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF420
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF421
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF422
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF423
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF424
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF425
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF426
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF427
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF428
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF429
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF430
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF431
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF432
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF433
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF434
	.byte	0x5
	.uleb128 0xec
	.long	.LASF435
	.byte	0x5
	.uleb128 0xee
	.long	.LASF436
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF437
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF438
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF439
	.byte	0x5
	.uleb128 0x100
	.long	.LASF440
	.byte	0x5
	.uleb128 0x101
	.long	.LASF441
	.byte	0x5
	.uleb128 0x105
	.long	.LASF442
	.byte	0x5
	.uleb128 0x111
	.long	.LASF443
	.byte	0x5
	.uleb128 0x112
	.long	.LASF444
	.byte	0x5
	.uleb128 0x116
	.long	.LASF445
	.byte	0x5
	.uleb128 0x117
	.long	.LASF446
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF447
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF448
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF449
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF450
	.byte	0x5
	.uleb128 0x124
	.long	.LASF451
	.byte	0x5
	.uleb128 0x125
	.long	.LASF452
	.byte	0x5
	.uleb128 0x126
	.long	.LASF453
	.byte	0x5
	.uleb128 0x128
	.long	.LASF454
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF455
	.byte	0x5
	.uleb128 0x130
	.long	.LASF456
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.27.59e2586c75bdbcb991b248ad7257b993,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF458
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF459
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.e1c83cba2098ce92b68f6311de19e6b1,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF461
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF462
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF463
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF464
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF465
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF466
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF467
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF468
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF469
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF470
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF471
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF472
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF473
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF474
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF475
	.byte	0x5
	.uleb128 0xca
	.long	.LASF476
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF477
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF479
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF480
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF481
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF482
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF483
	.byte	0x5
	.uleb128 0x110
	.long	.LASF484
	.byte	0x5
	.uleb128 0x111
	.long	.LASF485
	.byte	0x5
	.uleb128 0x112
	.long	.LASF486
	.byte	0x5
	.uleb128 0x113
	.long	.LASF487
	.byte	0x5
	.uleb128 0x114
	.long	.LASF488
	.byte	0x5
	.uleb128 0x115
	.long	.LASF489
	.byte	0x5
	.uleb128 0x116
	.long	.LASF490
	.byte	0x5
	.uleb128 0x117
	.long	.LASF491
	.byte	0x5
	.uleb128 0x118
	.long	.LASF492
	.byte	0x5
	.uleb128 0x119
	.long	.LASF493
	.byte	0x6
	.uleb128 0x126
	.long	.LASF494
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF495
	.byte	0x6
	.uleb128 0x191
	.long	.LASF496
	.byte	0x5
	.uleb128 0x196
	.long	.LASF497
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.e401b8bcfee800b540b27abd7cc78de9,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF500
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF501
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF502
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF503
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF504
	.byte	0x5
	.uleb128 0x20
	.long	.LASF505
	.byte	0x5
	.uleb128 0x22
	.long	.LASF506
	.byte	0x5
	.uleb128 0x24
	.long	.LASF507
	.byte	0x5
	.uleb128 0x25
	.long	.LASF508
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF509
	.byte	0x6
	.uleb128 0x2e
	.long	.LASF510
	.byte	0x6
	.uleb128 0x2f
	.long	.LASF511
	.byte	0x6
	.uleb128 0x30
	.long	.LASF512
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF513
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF514
	.byte	0x5
	.uleb128 0x22
	.long	.LASF515
	.byte	0x5
	.uleb128 0x25
	.long	.LASF516
	.byte	0x5
	.uleb128 0x28
	.long	.LASF517
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF518
	.byte	0x5
	.uleb128 0x31
	.long	.LASF519
	.byte	0x5
	.uleb128 0x35
	.long	.LASF520
	.byte	0x5
	.uleb128 0x38
	.long	.LASF521
	.byte	0x5
	.uleb128 0x39
	.long	.LASF522
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF523
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF524
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.19.ff00c9c0f5e9f9a9719c5de76ace57b4,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF525
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF526
	.byte	0x5
	.uleb128 0x20
	.long	.LASF527
	.byte	0x5
	.uleb128 0x21
	.long	.LASF528
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.41.24cced64aef71195a51d4daa8e4f4a95,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x29
	.long	.LASF530
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF531
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF532
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF533
	.byte	0x5
	.uleb128 0x30
	.long	.LASF534
	.byte	0x5
	.uleb128 0x34
	.long	.LASF535
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF538
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF539
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF540
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF541
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF542
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF543
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF544
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF545
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF546
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF547
	.byte	0x5
	.uleb128 0x70
	.long	.LASF548
	.byte	0x5
	.uleb128 0x71
	.long	.LASF549
	.byte	0x5
	.uleb128 0x72
	.long	.LASF550
	.byte	0x5
	.uleb128 0x73
	.long	.LASF551
	.byte	0x5
	.uleb128 0x75
	.long	.LASF552
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF553
	.byte	0x5
	.uleb128 0x22
	.long	.LASF554
	.byte	0x5
	.uleb128 0x23
	.long	.LASF555
	.byte	0x5
	.uleb128 0x26
	.long	.LASF556
	.byte	0x5
	.uleb128 0x27
	.long	.LASF557
	.byte	0x5
	.uleb128 0x28
	.long	.LASF558
	.byte	0x5
	.uleb128 0x29
	.long	.LASF559
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF560
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF561
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF562
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF563
	.byte	0x5
	.uleb128 0x33
	.long	.LASF564
	.byte	0x5
	.uleb128 0x34
	.long	.LASF565
	.byte	0x5
	.uleb128 0x35
	.long	.LASF566
	.byte	0x5
	.uleb128 0x36
	.long	.LASF567
	.byte	0x5
	.uleb128 0x37
	.long	.LASF568
	.byte	0x5
	.uleb128 0x38
	.long	.LASF569
	.byte	0x5
	.uleb128 0x39
	.long	.LASF570
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF571
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF572
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF573
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF574
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF575
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF576
	.byte	0x5
	.uleb128 0x40
	.long	.LASF577
	.byte	0x5
	.uleb128 0x41
	.long	.LASF578
	.byte	0x5
	.uleb128 0x42
	.long	.LASF579
	.byte	0x5
	.uleb128 0x43
	.long	.LASF580
	.byte	0x5
	.uleb128 0x44
	.long	.LASF581
	.byte	0x5
	.uleb128 0x45
	.long	.LASF582
	.byte	0x5
	.uleb128 0x46
	.long	.LASF583
	.byte	0x5
	.uleb128 0x47
	.long	.LASF584
	.byte	0x5
	.uleb128 0x48
	.long	.LASF585
	.byte	0x5
	.uleb128 0x49
	.long	.LASF586
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF587
	.byte	0x5
	.uleb128 0x50
	.long	.LASF588
	.byte	0x5
	.uleb128 0x53
	.long	.LASF589
	.byte	0x5
	.uleb128 0x57
	.long	.LASF590
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.38.11ee5fdc0f6cc53a16c505b9233cecef,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x26
	.long	.LASF594
	.byte	0x5
	.uleb128 0x61
	.long	.LASF595
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.63.97272d7c64d5db8020003b32e9289502,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF596
	.byte	0x5
	.uleb128 0x40
	.long	.LASF597
	.byte	0x5
	.uleb128 0x41
	.long	.LASF598
	.byte	0x5
	.uleb128 0x42
	.long	.LASF599
	.byte	0x5
	.uleb128 0x44
	.long	.LASF600
	.byte	0x5
	.uleb128 0x45
	.long	.LASF601
	.byte	0x5
	.uleb128 0x46
	.long	.LASF602
	.byte	0x5
	.uleb128 0x47
	.long	.LASF603
	.byte	0x5
	.uleb128 0x49
	.long	.LASF604
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF605
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF606
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF607
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.99.408b6270fa6eb71377201a241ef15f79,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x63
	.long	.LASF608
	.byte	0x5
	.uleb128 0x64
	.long	.LASF609
	.byte	0x5
	.uleb128 0x65
	.long	.LASF610
	.byte	0x5
	.uleb128 0x66
	.long	.LASF611
	.byte	0x5
	.uleb128 0x67
	.long	.LASF612
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.50.84aeca2ac6f37d40e1e9b3cef757ba2d,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF613
	.byte	0x5
	.uleb128 0x48
	.long	.LASF614
	.byte	0x5
	.uleb128 0x54
	.long	.LASF615
	.byte	0x5
	.uleb128 0x55
	.long	.LASF616
	.byte	0x5
	.uleb128 0x56
	.long	.LASF617
	.byte	0x5
	.uleb128 0x57
	.long	.LASF618
	.byte	0x5
	.uleb128 0x58
	.long	.LASF619
	.byte	0x5
	.uleb128 0x59
	.long	.LASF620
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF621
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF622
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF623
	.byte	0x5
	.uleb128 0x80
	.long	.LASF624
	.byte	0x5
	.uleb128 0x85
	.long	.LASF625
	.byte	0x5
	.uleb128 0x86
	.long	.LASF626
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF627
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.305f7c1ed78a85c751613a0e1f6565b3,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF628
	.byte	0x5
	.uleb128 0x28
	.long	.LASF629
	.byte	0x5
	.uleb128 0x34
	.long	.LASF630
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF631
	.byte	0x5
	.uleb128 0x42
	.long	.LASF632
	.byte	0x5
	.uleb128 0x47
	.long	.LASF633
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF634
	.byte	0x5
	.uleb128 0x51
	.long	.LASF635
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF636
	.byte	0x5
	.uleb128 0x63
	.long	.LASF637
	.byte	0x5
	.uleb128 0x69
	.long	.LASF638
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF639
	.byte	0x5
	.uleb128 0x75
	.long	.LASF640
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF641
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF642
	.byte	0x5
	.uleb128 0x81
	.long	.LASF643
	.byte	0x5
	.uleb128 0x82
	.long	.LASF644
	.byte	0x5
	.uleb128 0x83
	.long	.LASF645
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.53.beb46e650cd406cb917b6b96b45e640a,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF646
	.byte	0x6
	.uleb128 0x42
	.long	.LASF647
	.byte	0x5
	.uleb128 0x45
	.long	.LASF648
	.byte	0x6
	.uleb128 0x52
	.long	.LASF649
	.byte	0x5
	.uleb128 0x56
	.long	.LASF650
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF651
	.byte	0x5
	.uleb128 0x62
	.long	.LASF652
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF653
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.847b6907dabda77be90a9ab7ad789e2e,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.187.fd8c81c4bff8969f5d23c3a34aa715af,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF655
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF656
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF657
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.28.eb2f3debdbcffd1442ebddaebc4fb6ff,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF659
	.byte	0x5
	.uleb128 0x21
	.long	.LASF660
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF661
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF662
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF663
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF664
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF665
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF666
	.byte	0x5
	.uleb128 0x29
	.long	.LASF643
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF667
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.long	.LASF647
	.byte	0x6
	.uleb128 0x52
	.long	.LASF649
	.byte	0x6
	.uleb128 0x5e
	.long	.LASF651
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF653
	.byte	0x5
	.uleb128 0x72
	.long	.LASF668
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time.h.25.ae5284cdff565e87a9198d819340325d,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF670
	.byte	0x6
	.uleb128 0x65
	.long	.LASF671
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.49.e9d2041e5035cc68ebd1a20f7dbc8514,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.long	.LASF672
	.byte	0x6
	.uleb128 0x39
	.long	.LASF673
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF674
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF675
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF676
	.byte	0x5
	.uleb128 0x49
	.long	.LASF677
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF678
	.byte	0x5
	.uleb128 0x55
	.long	.LASF679
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF680
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF681
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF682
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF683
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sysmacros.h.20.8a0c33ff175cd9b434a86c0aaa36f0a2,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF684
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF685
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF686
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF687
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.229.67b3f66bd74b06b451caec392a72a945,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF688
	.byte	0x5
	.uleb128 0xec
	.long	.LASF689
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF690
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF691
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypes.h.25.6892b1493314fcf446bbc76e7362acba,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF693
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF694
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF695
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF696
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF697
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF698
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF699
	.byte	0x5
	.uleb128 0x20
	.long	.LASF700
	.byte	0x5
	.uleb128 0x21
	.long	.LASF701
	.byte	0x5
	.uleb128 0x46
	.long	.LASF702
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF703
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF704
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF705
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF706
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF708
	.byte	0x5
	.uleb128 0x17
	.long	.LASF458
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF709
	.byte	0x5
	.uleb128 0x23
	.long	.LASF710
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
	.long	.LASF458
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF460
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.04cc7214bceba497b20d15c10fd97511,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x191
	.long	.LASF496
	.byte	0x5
	.uleb128 0x196
	.long	.LASF497
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libmsimddeclstubs.h.34.75644856b74ba3d815155fe5fe7ecc56,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF716
	.byte	0x5
	.uleb128 0x24
	.long	.LASF717
	.byte	0x5
	.uleb128 0x25
	.long	.LASF718
	.byte	0x5
	.uleb128 0x26
	.long	.LASF719
	.byte	0x5
	.uleb128 0x28
	.long	.LASF720
	.byte	0x5
	.uleb128 0x29
	.long	.LASF721
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF722
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF723
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF724
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF725
	.byte	0x5
	.uleb128 0x30
	.long	.LASF726
	.byte	0x5
	.uleb128 0x31
	.long	.LASF727
	.byte	0x5
	.uleb128 0x32
	.long	.LASF728
	.byte	0x5
	.uleb128 0x34
	.long	.LASF729
	.byte	0x5
	.uleb128 0x35
	.long	.LASF730
	.byte	0x5
	.uleb128 0x36
	.long	.LASF731
	.byte	0x5
	.uleb128 0x38
	.long	.LASF732
	.byte	0x5
	.uleb128 0x39
	.long	.LASF733
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF734
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.mathdef.h.23.67c0aa4a204f1f427459dfc651aba565,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF740
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF741
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF742
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.55.cf380f99c57d42476a5252f30065036a,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x37
	.long	.LASF743
	.byte	0x5
	.uleb128 0x39
	.long	.LASF744
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF745
	.byte	0x5
	.uleb128 0x41
	.long	.LASF746
	.byte	0x5
	.uleb128 0x43
	.long	.LASF747
	.byte	0x5
	.uleb128 0x46
	.long	.LASF748
	.byte	0x5
	.uleb128 0x48
	.long	.LASF749
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF750
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF751
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF752
	.byte	0x5
	.uleb128 0x50
	.long	.LASF753
	.byte	0x5
	.uleb128 0x51
	.long	.LASF754
	.byte	0x5
	.uleb128 0x52
	.long	.LASF755
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.84.742292806c6be54f49dc607928a827f7,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x54
	.long	.LASF756
	.byte	0x6
	.uleb128 0x55
	.long	.LASF757
	.byte	0x6
	.uleb128 0x56
	.long	.LASF758
	.byte	0x6
	.uleb128 0x57
	.long	.LASF759
	.byte	0x6
	.uleb128 0x58
	.long	.LASF760
	.byte	0x5
	.uleb128 0x61
	.long	.LASF761
	.byte	0x5
	.uleb128 0x63
	.long	.LASF762
	.byte	0x5
	.uleb128 0x64
	.long	.LASF763
	.byte	0x5
	.uleb128 0x65
	.long	.LASF764
	.byte	0x5
	.uleb128 0x66
	.long	.LASF765
	.byte	0x5
	.uleb128 0x67
	.long	.LASF766
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.105.59ff0f83ebf6a04e70e145cef2d1185e,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x69
	.long	.LASF756
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF757
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF758
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF759
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF760
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF767
	.byte	0x5
	.uleb128 0x91
	.long	.LASF768
	.byte	0x5
	.uleb128 0x92
	.long	.LASF769
	.byte	0x5
	.uleb128 0x93
	.long	.LASF764
	.byte	0x5
	.uleb128 0x94
	.long	.LASF765
	.byte	0x5
	.uleb128 0x95
	.long	.LASF766
	.byte	0x5
	.uleb128 0x96
	.long	.LASF770
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.152.52b052d532b5a6b0eb86a9fe4d5b0433,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x98
	.long	.LASF756
	.byte	0x6
	.uleb128 0x99
	.long	.LASF757
	.byte	0x6
	.uleb128 0x9a
	.long	.LASF758
	.byte	0x6
	.uleb128 0x9b
	.long	.LASF759
	.byte	0x6
	.uleb128 0x9c
	.long	.LASF760
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF771
	.byte	0x6
	.uleb128 0xa2
	.long	.LASF772
	.byte	0x6
	.uleb128 0xa3
	.long	.LASF773
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF774
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF775
	.byte	0x5
	.uleb128 0xda
	.long	.LASF776
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF777
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF778
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF779
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF780
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF781
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF782
	.byte	0x5
	.uleb128 0x124
	.long	.LASF783
	.byte	0x5
	.uleb128 0x132
	.long	.LASF784
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF785
	.byte	0x5
	.uleb128 0x140
	.long	.LASF786
	.byte	0x5
	.uleb128 0x146
	.long	.LASF787
	.byte	0x5
	.uleb128 0x184
	.long	.LASF788
	.byte	0x5
	.uleb128 0x187
	.long	.LASF789
	.byte	0x5
	.uleb128 0x188
	.long	.LASF790
	.byte	0x5
	.uleb128 0x189
	.long	.LASF791
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF792
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF793
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF794
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF795
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF796
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF797
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF798
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF799
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF800
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF801
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF802
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF803
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF804
	.byte	0x5
	.uleb128 0x1a6
	.long	.LASF805
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF806
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF807
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF808
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF809
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF810
	.byte	0x5
	.uleb128 0x1d0
	.long	.LASF811
	.byte	0x5
	.uleb128 0x1d1
	.long	.LASF812
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF813
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF814
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.build_config.h.20.1bf8432fc8be9a81fe8cce0e3f98279c,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF815
	.byte	0x5
	.uleb128 0x15
	.long	.LASF816
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF817
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF818
	.byte	0x5
	.uleb128 0x20
	.long	.LASF819
	.byte	0x5
	.uleb128 0x21
	.long	.LASF820
	.byte	0x5
	.uleb128 0x27
	.long	.LASF821
	.byte	0x5
	.uleb128 0x28
	.long	.LASF822
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.debug.h.18.6574db8528ee4536a81057c3a08cdb4d,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.long	.LASF823
	.byte	0x5
	.uleb128 0x15
	.long	.LASF824
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF825
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF826
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.target.h.27.fb30bee6923ab05d4360685030e3605d,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF827
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF828
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF829
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF830
	.byte	0x5
	.uleb128 0x21
	.long	.LASF831
	.byte	0x5
	.uleb128 0x22
	.long	.LASF832
	.byte	0x5
	.uleb128 0x23
	.long	.LASF833
	.byte	0x5
	.uleb128 0x24
	.long	.LASF834
	.byte	0x5
	.uleb128 0x25
	.long	.LASF835
	.byte	0x5
	.uleb128 0x26
	.long	.LASF836
	.byte	0x5
	.uleb128 0x29
	.long	.LASF837
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF838
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF839
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF840
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF841
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF842
	.byte	0x5
	.uleb128 0x34
	.long	.LASF843
	.byte	0x5
	.uleb128 0x37
	.long	.LASF844
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF845
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF846
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF847
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF848
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF849
	.byte	0x5
	.uleb128 0x40
	.long	.LASF850
	.byte	0x5
	.uleb128 0x42
	.long	.LASF851
	.byte	0x5
	.uleb128 0x43
	.long	.LASF852
	.byte	0x5
	.uleb128 0x44
	.long	.LASF853
	.byte	0x5
	.uleb128 0x45
	.long	.LASF854
	.byte	0x5
	.uleb128 0x47
	.long	.LASF855
	.byte	0x5
	.uleb128 0x48
	.long	.LASF856
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF857
	.byte	0x5
	.uleb128 0x50
	.long	.LASF858
	.byte	0x5
	.uleb128 0x52
	.long	.LASF859
	.byte	0x5
	.uleb128 0x55
	.long	.LASF860
	.byte	0x5
	.uleb128 0x56
	.long	.LASF861
	.byte	0x5
	.uleb128 0x58
	.long	.LASF862
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF863
	.byte	0x5
	.uleb128 0x60
	.long	.LASF864
	.byte	0x5
	.uleb128 0x62
	.long	.LASF865
	.byte	0x5
	.uleb128 0x63
	.long	.LASF866
	.byte	0x5
	.uleb128 0x64
	.long	.LASF867
	.byte	0x5
	.uleb128 0x65
	.long	.LASF868
	.byte	0x5
	.uleb128 0x66
	.long	.LASF869
	.byte	0x5
	.uleb128 0x67
	.long	.LASF870
	.byte	0x5
	.uleb128 0x68
	.long	.LASF871
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF872
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF873
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF874
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF875
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF876
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF877
	.byte	0x5
	.uleb128 0x71
	.long	.LASF878
	.byte	0x5
	.uleb128 0x72
	.long	.LASF879
	.byte	0x5
	.uleb128 0x73
	.long	.LASF880
	.byte	0x5
	.uleb128 0x74
	.long	.LASF881
	.byte	0x5
	.uleb128 0x75
	.long	.LASF882
	.byte	0x5
	.uleb128 0x76
	.long	.LASF883
	.byte	0x5
	.uleb128 0x79
	.long	.LASF884
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF885
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF886
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF887
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF888
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF889
	.byte	0x5
	.uleb128 0x80
	.long	.LASF890
	.byte	0x5
	.uleb128 0x81
	.long	.LASF891
	.byte	0x5
	.uleb128 0x82
	.long	.LASF892
	.byte	0x5
	.uleb128 0x83
	.long	.LASF893
	.byte	0x5
	.uleb128 0x84
	.long	.LASF894
	.byte	0x5
	.uleb128 0x85
	.long	.LASF895
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF896
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF897
	.byte	0x5
	.uleb128 0x90
	.long	.LASF898
	.byte	0x5
	.uleb128 0x91
	.long	.LASF899
	.byte	0x5
	.uleb128 0x92
	.long	.LASF900
	.byte	0x5
	.uleb128 0x93
	.long	.LASF901
	.byte	0x5
	.uleb128 0x95
	.long	.LASF902
	.byte	0x5
	.uleb128 0x97
	.long	.LASF903
	.byte	0x5
	.uleb128 0x98
	.long	.LASF904
	.byte	0x5
	.uleb128 0x99
	.long	.LASF905
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF906
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF907
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF908
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF909
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF910
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF911
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF912
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF913
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF914
	.byte	0x5
	.uleb128 0xad
	.long	.LASF915
	.byte	0x5
	.uleb128 0xae
	.long	.LASF916
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF917
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF918
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF919
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF920
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF921
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF922
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF923
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF924
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF925
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF926
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF927
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF928
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.39.d5a83c17f38162a5dd6f834eaf38f8ef,comdat
.Ldebug_macro48:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF930
	.byte	0x5
	.uleb128 0x28
	.long	.LASF931
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF932
	.byte	0x5
	.uleb128 0x89
	.long	.LASF933
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF934
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF935
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF936
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF937
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF938
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF939
	.byte	0x5
	.uleb128 0x90
	.long	.LASF940
	.byte	0x5
	.uleb128 0x91
	.long	.LASF941
	.byte	0x6
	.uleb128 0xa1
	.long	.LASF942
	.byte	0x6
	.uleb128 0xee
	.long	.LASF478
	.byte	0x6
	.uleb128 0x15b
	.long	.LASF495
	.byte	0x6
	.uleb128 0x191
	.long	.LASF496
	.byte	0x5
	.uleb128 0x196
	.long	.LASF497
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF498
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF943
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.utils.h.23.2b82339877b7c3aa30b5f7b1f680a654,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF944
	.byte	0x5
	.uleb128 0x18
	.long	.LASF945
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF946
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF947
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF948
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF949
	.byte	0x5
	.uleb128 0x20
	.long	.LASF950
	.byte	0x5
	.uleb128 0x21
	.long	.LASF951
	.byte	0x5
	.uleb128 0x23
	.long	.LASF815
	.byte	0x5
	.uleb128 0x24
	.long	.LASF816
	.byte	0x5
	.uleb128 0x26
	.long	.LASF952
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF953
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF954
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF815
	.byte	0x5
	.uleb128 0x34
	.long	.LASF955
	.byte	0x5
	.uleb128 0x35
	.long	.LASF956
	.byte	0x5
	.uleb128 0x36
	.long	.LASF957
	.byte	0x5
	.uleb128 0x37
	.long	.LASF958
	.byte	0x5
	.uleb128 0x44
	.long	.LASF959
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.color.h.27.55a8433fcd85a5589ad8b4c926d8a891,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF960
	.byte	0x5
	.uleb128 0x26
	.long	.LASF961
	.byte	0x5
	.uleb128 0x27
	.long	.LASF962
	.byte	0x5
	.uleb128 0x28
	.long	.LASF963
	.byte	0x5
	.uleb128 0x30
	.long	.LASF964
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.maths.h.21.5b067f47e9a221ec30aa8aaee7f7dece,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF965
	.byte	0x5
	.uleb128 0x19
	.long	.LASF966
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF967
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF968
	.byte	0x5
	.uleb128 0x21
	.long	.LASF969
	.byte	0x5
	.uleb128 0x22
	.long	.LASF970
	.byte	0x5
	.uleb128 0x23
	.long	.LASF971
	.byte	0x5
	.uleb128 0x62
	.long	.LASF972
	.byte	0x5
	.uleb128 0x63
	.long	.LASF973
	.byte	0x5
	.uleb128 0x64
	.long	.LASF974
	.byte	0x5
	.uleb128 0x65
	.long	.LASF975
	.byte	0x5
	.uleb128 0x66
	.long	.LASF976
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.parameter_group.h.56.2c35fb08513b9e011c03a8315cc978c7,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF977
	.byte	0x5
	.uleb128 0x45
	.long	.LASF978
	.byte	0x5
	.uleb128 0x49
	.long	.LASF979
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF980
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF981
	.byte	0x5
	.uleb128 0x52
	.long	.LASF982
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF983
	.byte	0x5
	.uleb128 0x65
	.long	.LASF984
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF985
	.byte	0x5
	.uleb128 0x76
	.long	.LASF986
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF987
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF988
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF989
	.byte	0x5
	.uleb128 0x93
	.long	.LASF990
	.byte	0x5
	.uleb128 0x99
	.long	.LASF991
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF992
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF993
	.byte	0x5
	.uleb128 0xba
	.long	.LASF994
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF995
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF996
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF997
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF998
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF999
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.parameter_group_ids.h.19.97eecbb0e939074d5396400ea27f9f00,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1054
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1055
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1056
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1057
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.bus_i2c.h.20.811afd21f5c414d17a32d0a4900984d7,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1061
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.rx.h.20.f57dd00b74cf29b6cb797fc674001a72,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1062
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1063
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1089
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.msp_protocol.h.59.ae2238f3ca6d10491266275037a506a8,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF1153
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1154
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1155
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1156
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1157
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1158
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1159
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1160
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1161
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1162
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF1163
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1164
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1165
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1166
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1167
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1168
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1169
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1170
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1171
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1172
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF1173
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1174
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1175
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1176
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1177
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF1178
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1179
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1180
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1181
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1182
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1183
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1184
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1185
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF1186
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1187
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF1188
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1189
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF1190
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1191
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF1192
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1193
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF1194
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF1195
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1196
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1197
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1198
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF1199
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1200
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF1201
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1202
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1203
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1204
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF1205
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1206
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF1207
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF1208
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1209
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF1210
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1211
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF1212
	.byte	0x5
	.uleb128 0xff
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x100
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x102
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x104
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x106
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x107
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x109
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x111
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x113
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x114
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x118
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x121
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x126
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x128
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x130
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x132
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1260
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.msp_serial.h.58.31f3b212383b3aad07965596922115dd,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1263
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.rc_controls.h.80.5cfdd1773b16b0c5f0721842b2f3f841,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1287
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.rc_adjustments.h.20.22d3d3a58d695a89c0dad4efb81700ac,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1288
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1289
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1290
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1299
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.runtime_config.h.29.eb4e5e026ea098de2d85c64bdb169ddb,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1302
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1305
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1309
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.scheduler.h.22.67b0f3cbb70e9dc5f74939aa0db55023,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1316
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.gps.h.20.c8e8a7bc887144bfd400da1636c018ca,comdat
.Ldebug_macro62:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1319
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1320
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1321
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1322
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1323
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1324
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1325
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1326
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ledstrip.h.20.9eb3e9127e23ea21304575a95e86916e,comdat
.Ldebug_macro63:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1329
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1330
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1331
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1332
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1333
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1368
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1369
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.flashfs.h.24.874ef25b511654a8375b5076597044fa,comdat
.Ldebug_macro64:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1372
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fat_standard.h.23.98e613171bbc330acb6e09557ea95570,comdat
.Ldebug_macro65:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1373
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1374
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1375
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1376
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1377
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1378
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1379
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1380
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1381
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1382
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1383
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1384
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1386
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1387
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1388
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1393
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.sensors.h.27.02bc4f75c7eedfc5af99d250b608b4d3,comdat
.Ldebug_macro66:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1395
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1397
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.voltage.h.20.f17e6605ffe4037566187f8a28a8df1b,comdat
.Ldebug_macro67:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1405
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.barometer.h.28.65ed231a71c5ab6928dadf9b545716f4,comdat
.Ldebug_macro68:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1409
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.mixer.h.21.072cf69d94936a34a51d6f5ba51e2a24,comdat
.Ldebug_macro69:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1411
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1412
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1413
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1414
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.servos.h.21.5cccfe0f6090961404e271bfd6cc57ea,comdat
.Ldebug_macro70:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1416
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1426
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pid.h.20.3206939a9e62d47c03128c0d0c661b07,comdat
.Ldebug_macro71:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1427
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1428
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1429
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1430
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1433
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.imu.h.27.26365f28b0e02aeb71b724228375d92d,comdat
.Ldebug_macro72:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1435
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1436
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1437
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.failsafe.h.20.506d35dc40440c27ef840b52245b41a9,comdat
.Ldebug_macro73:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1438
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1439
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1440
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1441
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1442
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1443
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1445
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.version.h.18.5f7b44d93f38578eb0df52ebf9a8808a,comdat
.Ldebug_macro74:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.long	.LASF1447
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1448
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1449
	.byte	0x5
	.uleb128 0x16
	.long	.LASF948
	.byte	0x5
	.uleb128 0x17
	.long	.LASF949
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1450
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1451
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1452
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1453
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1454
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF687:
	.string	"makedev(maj,min) gnu_dev_makedev (maj, min)"
.LASF1679:
	.string	"auto_disarm_delay"
.LASF622:
	.string	"__ldiv_t_defined 1"
.LASF963:
	.string	"HSV_VALUE_MAX 255"
.LASF727:
	.string	"__DECL_SIMD_logf "
.LASF1218:
	.string	"MSP_3D 124"
.LASF1076:
	.string	"DEFAULT_SERVO_MAX_ANGLE 45"
.LASF748:
	.string	"__MATHCALLX(function,suffix,args,attrib) __MATHDECLX (_Mdouble_,function,suffix, args, attrib)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF886:
	.string	"I2C2_SCL_GPIO GPIOA"
.LASF975:
	.string	"acos_approx(x) acosf(x)"
.LASF283:
	.string	"__USE_FORTIFY_LEVEL"
.LASF709:
	.string	"alloca"
.LASF1086:
	.string	"RSSI_SCALE_MAX 255"
.LASF697:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF843:
	.string	"USABLE_TIMER_CHANNEL_COUNT 11"
.LASF1945:
	.string	"inputSource"
.LASF1162:
	.string	"MSP_LOOP_TIME 73"
.LASF1340:
	.string	"LED_DIRECTION_OFFSET 22"
.LASF1484:
	.string	"RGB_GREEN"
.LASF1647:
	.string	"THROTTLE"
.LASF1999:
	.string	"failsafe_procedure"
.LASF1960:
	.string	"PIDPITCH"
.LASF488:
	.string	"_WCHAR_T_DEFINED "
.LASF984:
	.string	"PG_DECLARE(_type,_name) _type _name ## _System; static inline _type* _name(void) { return &_name ## _System; } struct _dummy"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF2020:
	.string	"mspServerConfig_t"
.LASF1182:
	.string	"MSP_SET_FILTER_CONFIG 93"
.LASF535:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF916:
	.string	"USE_CLI "
.LASF1733:
	.string	"FEATURE_TRANSPONDER"
.LASF967:
	.string	"M_PIf 3.14159265358979323846f"
.LASF1057:
	.string	"PG_RESERVED_FOR_TESTING_3 65535"
.LASF1734:
	.string	"motorAndServoConfig_s"
.LASF1741:
	.string	"motorAndServoConfig_t"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF342:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF1781:
	.string	"reboot_character"
.LASF847:
	.string	"USE_GYRO_MPU6500 "
.LASF1700:
	.string	"UNUSED_MODE"
.LASF1375:
	.string	"MBR_PARTITION_TYPE_FAT32_LBA 0x0C"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF544:
	.string	"__SQUAD_TYPE long int"
.LASF1310:
	.string	"ONESHOT_FEATURE_CHANGED_DELAY_ON_BOOT_MS 1500"
.LASF1784:
	.string	"modeColorIndexes_s"
.LASF1548:
	.string	"setMode"
.LASF1712:
	.string	"FEATURE_RX_PPM"
.LASF304:
	.string	"__USE_MISC 1"
.LASF1739:
	.string	"motor_pwm_rate"
.LASF1393:
	.string	"FAT_MAKE_TIME(hour,minute,second) ((second / 2) | (minute << 5) | (hour << 11))"
.LASF1449:
	.string	"FC_VERSION_PATCH_LEVEL 0"
.LASF667:
	.string	"__need_timespec "
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF327:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF637:
	.string	"__pid_t_defined "
.LASF1837:
	.string	"mag_hardware"
.LASF977:
	.string	"PG_PACKED __attribute__((packed))"
.LASF2090:
	.string	"__pg_registry_start"
.LASF360:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF1590:
	.string	"mspPortMode_e"
.LASF505:
	.string	"WNOWAIT 0x01000000"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF1711:
	.string	"ANTI_WINDUP"
.LASF390:
	.string	"_BITS_WCHAR_H 1"
.LASF1944:
	.string	"targetChannel"
.LASF1527:
	.string	"vTable"
.LASF0:
	.string	"__STDC__ 1"
.LASF1096:
	.string	"BETAFLIGHT_IDENTIFIER \"BTFL\""
.LASF1503:
	.string	"_Bool"
.LASF1562:
	.string	"spektrum_sat_bind"
.LASF716:
	.string	"_BITS_LIBM_SIMD_DECL_STUBS_H 1"
.LASF1876:
	.string	"acc_cut_hz"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF1056:
	.string	"PG_RESERVED_FOR_TESTING_2 65534"
.LASF743:
	.string	"__SIMD_DECL(function) __CONCAT (__DECL_SIMD_, function)"
.LASF1053:
	.string	"PG_OSD_VIDEO_CONFIG 32769"
.LASF679:
	.string	"NFDBITS __NFDBITS"
.LASF732:
	.string	"__DECL_SIMD_pow "
.LASF315:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF2084:
	.string	"pidnames"
.LASF1758:
	.string	"provider"
.LASF944:
	.string	"ARRAYLEN(x) (sizeof(x) / sizeof((x)[0]))"
.LASF458:
	.string	"__need_size_t "
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF354:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF629:
	.string	"__u_char_defined "
.LASF1959:
	.string	"PIDROLL"
.LASF1238:
	.string	"MSP_SET_SERVO_CONFIGURATION 212"
.LASF1996:
	.string	"failsafe_throttle"
.LASF1272:
	.string	"YAW_CE (3 << (2 * YAW))"
.LASF2165:
	.string	"i2cGetErrorCounter"
.LASF1915:
	.string	"motorMixer_s"
.LASF1917:
	.string	"motorMixer_t"
.LASF1517:
	.string	"SERIAL_NOT_INVERTED"
.LASF1826:
	.string	"CW90_DEG_FLIP"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF1894:
	.string	"MIXER_GIMBAL"
.LASF1678:
	.string	"disarm_kill_switch"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF2097:
	.string	"rxConfig_System"
.LASF1179:
	.string	"MSP_PID_ADVANCED_CONFIG 90"
.LASF779:
	.string	"fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)"
.LASF1828:
	.string	"CW270_DEG_FLIP"
.LASF762:
	.string	"_Mdouble_ _Mfloat_"
.LASF1975:
	.string	"deltaMethod"
.LASF480:
	.string	"__WCHAR_T__ "
.LASF499:
	.string	"_STDLIB_H 1"
.LASF1164:
	.string	"MSP_FAILSAFE_CONFIG 75"
.LASF1248:
	.string	"MSP_RESERVE_1 251"
.LASF1674:
	.string	"deadband3d_throttle"
.LASF493:
	.string	"_WCHAR_T_DECLARED "
.LASF1744:
	.string	"gpsProvider_e"
.LASF2132:
	.string	"accelerometerConfig_ProfileCurrent"
.LASF685:
	.string	"major(dev) gnu_dev_major (dev)"
.LASF1258:
	.string	"MSP_SERVO_MIX_RULES 241"
.LASF1345:
	.string	"LED_COLOR_BITCNT 4"
.LASF1038:
	.string	"PG_THROTTLE_CORRECTION_CONFIG 39"
.LASF1757:
	.string	"gpsConfig_s"
.LASF1762:
	.string	"gpsConfig_t"
.LASF1508:
	.string	"read"
.LASF1753:
	.string	"gpsAutoConfig_e"
.LASF1908:
	.string	"MIXER_PPM_TO_SERVO"
.LASF919:
	.string	"ALIENFLIGHT "
.LASF782:
	.string	"isnormal(x) __builtin_isnormal (x)"
.LASF1001:
	.string	"PG_BOARD_ALIGNMENT 2"
.LASF1154:
	.string	"MSP_SET_RX_MAP 65"
.LASF1554:
	.string	"step"
.LASF1002:
	.string	"PG_GIMBAL_CONFIG 3"
.LASF340:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF894:
	.string	"I2C2_SDA_PIN_SOURCE GPIO_PinSource10"
.LASF2106:
	.string	"modeActivationProfile_ProfileCurrent"
.LASF1177:
	.string	"MSP_VTX_CONFIG 88"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF1722:
	.string	"FEATURE_TELEMETRY"
.LASF2002:
	.string	"gps_wp_radius"
.LASF1485:
	.string	"RGB_BLUE"
.LASF1465:
	.string	"uint16_t"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF237:
	.string	"linux 1"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF590:
	.string	"__FD_SETSIZE 1024"
.LASF552:
	.string	"__STD_TYPE typedef"
.LASF1950:
	.string	"middle"
.LASF1875:
	.string	"accelerometerTrims"
.LASF686:
	.string	"minor(dev) gnu_dev_minor (dev)"
.LASF1335:
	.string	"LED_SPECIAL_COLOR_COUNT 11"
.LASF317:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF1748:
	.string	"SBAS_MSAS"
.LASF1986:
	.string	"small_angle"
.LASF1790:
	.string	"transponderConfig_s"
.LASF1792:
	.string	"transponderConfig_t"
.LASF989:
	.string	"PG_REGISTER_WITH_RESET_FN(_type,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name })"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF781:
	.string	"isfinite(x) __builtin_isfinite (x)"
.LASF715:
	.string	"_MATH_H 1"
.LASF1938:
	.string	"INPUT_RC_AUX3"
.LASF2093:
	.string	"__pg_resetdata_end"
.LASF907:
	.string	"ADC0_GPIO_PIN GPIO_Pin_4"
.LASF827:
	.string	"__IO volatile"
.LASF1237:
	.string	"MSP_SET_HEAD 211"
.LASF635:
	.string	"__uid_t_defined "
.LASF706:
	.string	"__PTHREAD_RWLOCK_INT_FLAGS_SHARED 1"
.LASF424:
	.string	"INT_FAST8_MAX (127)"
.LASF541:
	.string	"__U32_TYPE unsigned int"
.LASF1233:
	.string	"MSP_SET_MISC 207"
.LASF722:
	.string	"__DECL_SIMD_sinl "
.LASF1034:
	.string	"PG_ACCELEROMETER_CONFIG 35"
.LASF1263:
	.string	"MSP_PORT_OUTBUF_SIZE 256"
.LASF1197:
	.string	"MSP_RAW_IMU 102"
.LASF804:
	.string	"M_1_PI 0.31830988618379067154"
.LASF1670:
	.string	"yaw_deadband"
.LASF1244:
	.string	"MSP_SET_SENSOR_ALIGNMENT 220"
.LASF1931:
	.string	"INPUT_STABILIZED_THROTTLE"
.LASF855:
	.string	"ACC_MPU6050_ALIGN CW270_DEG"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF1782:
	.string	"portConfigs"
.LASF659:
	.string	"__FD_ZERO_STOS \"stosq\""
.LASF359:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF2027:
	.string	"modeActivationProfile"
.LASF1339:
	.string	"LED_COLOR_OFFSET 18"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF634:
	.string	"__nlink_t_defined "
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1940:
	.string	"INPUT_GIMBAL_PITCH"
.LASF1708:
	.string	"CALIBRATE_MAG"
.LASF1232:
	.string	"MSP_MAG_CALIBRATION 206"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF479:
	.string	"__wchar_t__ "
.LASF1601:
	.string	"controlRateConfig_s"
.LASF1610:
	.string	"controlRateConfig_t"
.LASF274:
	.string	"__USE_XOPEN2K8"
.LASF270:
	.string	"__USE_XOPEN_EXTENDED"
.LASF1026:
	.string	"PG_LED_STRIP_CONFIG 27"
.LASF451:
	.string	"UINT8_C(c) c"
.LASF593:
	.string	"__bswap_16(x) (__extension__ ({ unsigned short int __v, __x = (unsigned short int) (x); if (__builtin_constant_p (__x)) __v = __bswap_constant_16 (__x); else __asm__ (\"rorw $8, %w0\" : \"=r\" (__v) : \"0\" (__x) : \"cc\"); __v; }))"
.LASF1435:
	.string	"DECIDEGREES_TO_DEGREES(angle) (angle / 10)"
.LASF1635:
	.string	"BOXSONAR"
.LASF371:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF2166:
	.string	"mspInit"
.LASF1968:
	.string	"PIDVEL"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF1062:
	.string	"STICK_CHANNEL_COUNT 4"
.LASF2119:
	.string	"colors_SystemArray"
.LASF2036:
	.string	"amperageMeterConfig"
.LASF878:
	.string	"UART3_TX_PIN GPIO_Pin_10"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF1029:
	.string	"PG_GPS_CONFIG 30"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF728:
	.string	"__DECL_SIMD_logl "
.LASF1553:
	.string	"rxFailsafeChannelConfiguration_s"
.LASF780:
	.string	"signbit(x) (sizeof (x) == sizeof (float) ? __builtin_signbitf (x) : sizeof (x) == sizeof (double) ? __builtin_signbit (x) : __builtin_signbitl (x))"
.LASF589:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF957:
	.string	"LOG2_32BIT(v) (16*((v)>65535L) + LOG2_16BIT((v)*1L >>16*((v)>65535L)))"
.LASF724:
	.string	"__DECL_SIMD_sincosf "
.LASF649:
	.string	"__need_time_t"
.LASF584:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF280:
	.string	"__USE_ATFILE"
.LASF934:
	.string	"_T_PTRDIFF_ "
.LASF1380:
	.string	"FAT_SMALLEST_LEGAL_CLUSTER_NUMBER 2"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF472:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF952:
	.string	"BIT(x) (1 << (x))"
.LASF1081:
	.string	"NON_AUX_CHANNEL_COUNT 4"
.LASF1117:
	.string	"MSP_FC_VERSION 3"
.LASF1663:
	.string	"range"
.LASF1396:
	.string	"CALIBRATING_ACC_CYCLES 400"
.LASF1536:
	.string	"rxBufferHead"
.LASF1904:
	.string	"MIXER_HELI_120_CCPM"
.LASF655:
	.string	"__intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF2063:
	.string	"serializeDataflashSummaryReply"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF806:
	.string	"M_2_SQRTPI 1.12837916709551257390"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF658:
	.string	"_SYS_SELECT_H 1"
.LASF1461:
	.string	"int32_t"
.LASF997:
	.string	"PG_REGISTER_PROFILE_WITH_RESET_FN(_type,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name})"
.LASF1777:
	.string	"functionMask"
.LASF1357:
	.string	"LED_POS_MASK LED_MOV_POS(((1 << LED_POS_BITCNT) - 1))"
.LASF990:
	.string	"PG_REGISTER_WITH_RESET_TEMPLATE(_type,_name,_pgn,_version) extern const _type pgResetTemplate_ ## _name; PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.ptr = (void*)&pgResetTemplate_ ## _name})"
.LASF674:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1065:
	.string	"PWM_RANGE_MAX 2000"
.LASF1226:
	.string	"MSP_SET_RAW_RC 200"
.LASF1656:
	.string	"channelRange_s"
.LASF1659:
	.string	"channelRange_t"
.LASF1550:
	.string	"beginWrite"
.LASF1228:
	.string	"MSP_SET_PID 202"
.LASF2161:
	.string	"src/main/fc/msp_server_fc.c"
.LASF478:
	.string	"__need_size_t"
.LASF2060:
	.string	"mspBoxEnabledMask"
.LASF490:
	.string	"___int_wchar_t_h "
.LASF910:
	.string	"ADC_BATTERY ADC_CHANNEL0"
.LASF731:
	.string	"__DECL_SIMD_expl "
.LASF791:
	.string	"OVERFLOW 3"
.LASF261:
	.string	"__USE_ISOC11"
.LASF832:
	.string	"LED0_PIN Pin_4"
.LASF1141:
	.string	"MSP_SET_RSSI_CONFIG 51"
.LASF2099:
	.string	"channelRanges_SystemArray"
.LASF1193:
	.string	"MSP_OSD_LAYOUT_CONFIG 184"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF431:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF1302:
	.string	"ARMING_FLAG(mask) (armingFlags & (mask))"
.LASF1598:
	.string	"inBuf"
.LASF623:
	.string	"__lldiv_t_defined 1"
.LASF1566:
	.string	"rcSmoothing"
.LASF1019:
	.string	"PG_MIXER_CONFIG 20"
.LASF1114:
	.string	"CAP_EXTAUX ((uint32_t)1 << 5)"
.LASF427:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1431:
	.string	"YAW_P_LIMIT_MIN 100"
.LASF1157:
	.string	"MSP_REBOOT 68"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF859:
	.string	"MAG_AK8963_ALIGN CW0_DEG_FLIP"
.LASF442:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF2138:
	.string	"mixerConfig_System"
.LASF1752:
	.string	"GPS_AUTOCONFIG_ON"
.LASF1512:
	.string	"MODE_RX"
.LASF879:
	.string	"UART3_RX_PIN GPIO_Pin_11"
.LASF1090:
	.string	"MSP_PROTOCOL_VERSION 0"
.LASF798:
	.string	"M_LOG10E 0.43429448190325182765"
.LASF964:
	.string	"HSV_COLOR_COMPONENT_COUNT (HSV_VALUE + 1)"
.LASF824:
	.string	"DEBUG_SECTION_TIMES "
.LASF1811:
	.string	"values"
.LASF398:
	.string	"INT32_MIN (-2147483647-1)"
.LASF1336:
	.string	"LED_POS_OFFSET 0"
.LASF1320:
	.string	"GPS_PROVIDER_MAX GPS_UBLOX"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF1618:
	.string	"BOXMAG"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF1329:
	.string	"LED_MAX_STRIP_LENGTH 32"
.LASF759:
	.string	"__MATH_PRECNAME"
.LASF993:
	.string	"PG_REGISTER_ARR_WITH_RESET_FN(_type,_size,_name,_pgn,_version) extern void pgResetFn_ ## _name(_type *); PG_REGISTER_ARR_I(_type, _size, _name, _pgn, _version, .reset = {.fn = (pgResetFunc*)&pgResetFn_ ## _name})"
.LASF519:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF391:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF1094:
	.string	"MULTIWII_IDENTIFIER \"MWII\";"
.LASF1050:
	.string	"PG_DRIVER_PWM_RX_CONFIG 100"
.LASF609:
	.string	"w_coredump __wait_terminated.__w_coredump"
.LASF700:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF754:
	.string	"_Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_STD"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF714:
	.string	"_XLOCALE_H 1"
.LASF891:
	.string	"I2C2_SDA_GPIO GPIOA"
.LASF420:
	.string	"INT_FAST8_MIN (-128)"
.LASF612:
	.string	"w_stopval __wait_stopped.__w_stopval"
.LASF1896:
	.string	"MIXER_HEX6"
.LASF746:
	.string	"__MATHCALL(function,suffix,args) __MATHDECL (_Mdouble_,function,suffix, args)"
.LASF516:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF344:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF1211:
	.string	"MSP_BOXNAMES 116"
.LASF2135:
	.string	"gyroADC"
.LASF465:
	.string	"_T_SIZE_ "
.LASF765:
	.string	"_Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99"
.LASF2094:
	.string	"featureConfig_System"
.LASF1605:
	.string	"thrExpo8"
.LASF604:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF1747:
	.string	"SBAS_WAAS"
.LASF1506:
	.string	"acc_s"
.LASF1511:
	.string	"acc_t"
.LASF949:
	.string	"STR(x) STR_HELPER(x)"
.LASF1720:
	.string	"FEATURE_FAILSAFE"
.LASF789:
	.string	"DOMAIN 1"
.LASF1755:
	.string	"GPS_AUTOBAUD_ON"
.LASF1311:
	.string	"TASK_PERIOD_HZ(hz) (1000000 / (hz))"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF1091:
	.string	"API_VERSION_MAJOR 1"
.LASF377:
	.string	"__stub_chflags "
.LASF771:
	.string	"__MATHDECL_1"
.LASF1756:
	.string	"gpsAutoBaud_e"
.LASF1274:
	.string	"THR_LO (1 << (2 * THROTTLE))"
.LASF1558:
	.string	"rxConfig_s"
.LASF1572:
	.string	"rxConfig_t"
.LASF2076:
	.string	"index"
.LASF876:
	.string	"UART2_TX_PINSOURCE GPIO_PinSource2"
.LASF257:
	.string	"false 0"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF501:
	.string	"WUNTRACED 2"
.LASF1916:
	.string	"throttle"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF475:
	.string	"_GCC_SIZE_T "
.LASF386:
	.string	"__stub_setlogin "
.LASF1576:
	.string	"mspPacket_s"
.LASF1513:
	.string	"MODE_TX"
.LASF1183:
	.string	"MSP_ADVANCED_TUNING 94"
.LASF1297:
	.string	"ADJUSTMENT_INDEX_OFFSET 1"
.LASF555:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF927:
	.string	"TARGET_IO_PORTF (BIT(0)|BIT(1)|BIT(4))"
.LASF1408:
	.string	"BARO_SAMPLE_COUNT_MAX 48"
.LASF1616:
	.string	"BOXHORIZON"
.LASF1667:
	.string	"modeActivationProfile_t"
.LASF1658:
	.string	"endStep"
.LASF389:
	.string	"__stub_stty "
.LASF1356:
	.string	"LED_BIT_MASK(len) ((1 << (len)) - 1)"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF1976:
	.string	"horizon_tilt_effect"
.LASF1825:
	.string	"CW0_DEG_FLIP"
.LASF1296:
	.string	"ADJUSTMENT_FUNCTION_COUNT 39"
.LASF2092:
	.string	"__pg_resetdata_start"
.LASF1301:
	.string	"ENABLE_ARMING_FLAG(mask) (armingFlags |= (mask))"
.LASF1563:
	.string	"rssi_channel"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF449:
	.string	"INT32_C(c) c"
.LASF1299:
	.string	"MAX_SIMULTANEOUS_ADJUSTMENT_COUNT 4"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF324:
	.string	"__long_double_t long double"
.LASF1398:
	.string	"MAX_AMPERAGE_METERS 2"
.LASF1479:
	.string	"FD_INDEX_COUNT"
.LASF2113:
	.string	"averageSystemLoadPercent"
.LASF331:
	.string	"__END_NAMESPACE_C99 "
.LASF1155:
	.string	"MSP_BF_CONFIG 66"
.LASF1995:
	.string	"failsafe_off_delay"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF751:
	.string	"_Mdouble_ double"
.LASF517:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF1677:
	.string	"retarded_arm"
.LASF1725:
	.string	"FEATURE_RX_PARALLEL_PWM"
.LASF1815:
	.string	"SENSOR_BARO"
.LASF1962:
	.string	"PIDALT"
.LASF2074:
	.string	"aIndex"
.LASF1306:
	.string	"FLIGHT_MODE_BOXID_MAP_INITIALIZER { BOXANGLE, BOXHORIZON, BOXMAG, BOXBARO, BOXGPSHOME, BOXGPSHOLD, BOXHEADFREE, -1, BOXPASSTHRU, BOXSONAR, BOXFAILSAFE, BOXGTUNE}"
.LASF1227:
	.string	"MSP_SET_RAW_GPS 201"
.LASF1629:
	.string	"BOXLLIGHTS"
.LASF2147:
	.string	"attitude"
.LASF677:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF1740:
	.string	"servo_pwm_rate"
.LASF1972:
	.string	"yaw_p_limit"
.LASF1225:
	.string	"MSP_PILOT 131"
.LASF1721:
	.string	"FEATURE_SONAR"
.LASF2144:
	.string	"servoProfile_ProfileCurrent"
.LASF1079:
	.string	"MAX_SUPPORTED_RC_PARALLEL_PWM_CHANNEL_COUNT 8"
.LASF854:
	.string	"USE_ACC_SPI_MPU6500 "
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF1031:
	.string	"PG_FRSKY_TELEMETRY_CONFIG 32"
.LASF397:
	.string	"INT16_MIN (-32767-1)"
.LASF2031:
	.string	"motorAndServoConfig"
.LASF1125:
	.string	"MSP_SET_MODE_RANGE 35"
.LASF1914:
	.string	"MIXER_CUSTOM_TRI"
.LASF1713:
	.string	"FEATURE_VBAT"
.LASF1743:
	.string	"GPS_UBLOX"
.LASF1895:
	.string	"MIXER_Y6"
.LASF1926:
	.string	"neutral3d"
.LASF954:
	.string	"BX_(x) ((x) - (((x)>>1)&0x77777777) - (((x)>>2)&0x33333333) - (((x)>>3)&0x11111111))"
.LASF851:
	.string	"ACC "
.LASF1166:
	.string	"MSP_RXFAIL_CONFIG 77"
.LASF1964:
	.string	"PIDPOSR"
.LASF1142:
	.string	"MSP_ADJUSTMENT_RANGES 52"
.LASF1168:
	.string	"MSP_SDCARD_SUMMARY 79"
.LASF1705:
	.string	"flightModeFlags_e"
.LASF383:
	.string	"__stub_lchmod "
.LASF1109:
	.string	"CAP_NAVI_VERSION_BIT_2 ((uint32_t)1 << 29)"
.LASF1132:
	.string	"MSP_MIXER 42"
.LASF630:
	.string	"__ino_t_defined "
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF534:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF1241:
	.string	"MSP_SET_3D 217"
.LASF2032:
	.string	"serialConfig"
.LASF385:
	.string	"__stub_revoke "
.LASF2120:
	.string	"modeColors_SystemArray"
.LASF1952:
	.string	"angleAtMax"
.LASF1774:
	.string	"SERIAL_PORT_IDENTIFIER_MAX"
.LASF1075:
	.string	"DEFAULT_SERVO_MIN_ANGLE 45"
.LASF2164:
	.string	"mspServerCommandHandler"
.LASF1163:
	.string	"MSP_SET_LOOP_TIME 74"
.LASF1561:
	.string	"sbus_inversion"
.LASF979:
	.string	"PG_RESETDATA_ATTRIBUTES __attribute__ ((section(\".pg_resetdata\"), used, aligned(2)))"
.LASF863:
	.string	"USE_VCP "
.LASF1230:
	.string	"MSP_SET_RC_TUNING 204"
.LASF2102:
	.string	"mspPostProcessFn"
.LASF1911:
	.string	"MIXER_ATAIL4"
.LASF1903:
	.string	"MIXER_AIRPLANE"
.LASF627:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF1821:
	.string	"CW0_DEG"
.LASF1808:
	.string	"roll"
.LASF940:
	.string	"_GCC_PTRDIFF_T "
.LASF1567:
	.string	"midrc"
.LASF1123:
	.string	"MSP_SET_BATTERY_CONFIG 33"
.LASF429:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF1397:
	.string	"CALIBRATING_BARO_CYCLES 200"
.LASF1810:
	.string	"flightDynamicsTrims_def_t"
.LASF446:
	.string	"WINT_MAX (4294967295u)"
.LASF338:
	.string	"__flexarr []"
.LASF1389:
	.string	"FAT_FILE_ATTRIBUTE_ARCHIVE 0x20"
.LASF888:
	.string	"I2C2_SCL_PIN GPIO_Pin_9"
.LASF1399:
	.string	"VBAT_SCALE_DEFAULT 110"
.LASF1174:
	.string	"MSP_SET_OSD_CONFIG 85"
.LASF1532:
	.string	"rxBufferSize"
.LASF1683:
	.string	"adjustmentFunction"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF1124:
	.string	"MSP_MODE_RANGES 34"
.LASF645:
	.string	"__need_clockid_t "
.LASF912:
	.string	"DEFAULT FEATURES FEATURE_MOTOR_STOP"
.LASF296:
	.string	"__USE_POSIX 1"
.LASF265:
	.string	"__USE_POSIX"
.LASF491:
	.string	"__INT_WCHAR_T_H "
.LASF378:
	.string	"__stub_fattach "
.LASF632:
	.string	"__gid_t_defined "
.LASF1824:
	.string	"CW270_DEG"
.LASF1886:
	.string	"gyro_lpf"
.LASF1731:
	.string	"FEATURE_BLACKBOX"
.LASF1144:
	.string	"MSP_CF_SERIAL_CONFIG 54"
.LASF1358:
	.string	"LED_FUNCTION_MASK LED_MOV_FUNCTION(((1 << LED_FUNCTION_BITCNT) - 1))"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF2054:
	.string	"initActiveBoxIds"
.LASF875:
	.string	"UART2_GPIO_AF GPIO_AF_7"
.LASF800:
	.string	"M_LN10 2.30258509299404568402"
.LASF1099:
	.string	"RACEFLIGHT_IDENTIFIER \"RCFL\""
.LASF289:
	.string	"__USE_ISOC99 1"
.LASF292:
	.string	"_POSIX_SOURCE"
.LASF477:
	.string	"__size_t "
.LASF1538:
	.string	"txBufferHead"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF1260:
	.string	"MSP_SET_4WAY_IF 245"
.LASF828:
	.string	"HW_GPIO GPIOB"
.LASF1414:
	.string	"CHANNEL_FORWARDING_DISABLED (uint8_t)0xFF"
.LASF1529:
	.string	"mode"
.LASF254:
	.string	"_STDBOOL_H "
.LASF1113:
	.string	"CAP_NAVCAP ((uint32_t)1 << 4)"
.LASF1235:
	.string	"MSP_SET_WP 209"
.LASF1754:
	.string	"GPS_AUTOBAUD_OFF"
.LASF1137:
	.string	"MSP_SET_LED_COLORS 47"
.LASF1391:
	.string	"FAT_DELETED_FILE_MARKER 0xE5"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF2037:
	.string	"_index"
.LASF1805:
	.string	"SENSOR_INDEX_BARO"
.LASF1761:
	.string	"autoBaud"
.LASF1804:
	.string	"SENSOR_INDEX_ACC"
.LASF1818:
	.string	"SENSOR_GPS"
.LASF877:
	.string	"UART2_RX_PINSOURCE GPIO_PinSource3"
.LASF929:
	.string	"XYZ_AXIS_COUNT 3"
.LASF1341:
	.string	"LED_PARAMS_OFFSET 28"
.LASF381:
	.string	"__stub_getmsg "
.LASF1104:
	.string	"BOARD_HARDWARE_REVISION_LENGTH 2"
.LASF1316:
	.string	"isSystemOverloaded() (averageSystemLoadPercent >= LOAD_PERCENTAGE_ONE)"
.LASF1203:
	.string	"MSP_ATTITUDE 108"
.LASF1360:
	.string	"LED_COLOR_MASK LED_MOV_COLOR(((1 << LED_COLOR_BITCNT) - 1))"
.LASF807:
	.string	"M_SQRT2 1.41421356237309504880"
.LASF365:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF2137:
	.string	"customMotorMixer_SystemArray"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF1325:
	.string	"GPS_DBHZ_MIN 0"
.LASF411:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF217:
	.string	"__amd64 1"
.LASF469:
	.string	"_BSD_SIZE_T_ "
.LASF1694:
	.string	"HORIZON_MODE"
.LASF1246:
	.string	"MSP_SET_PILOT 222"
.LASF1464:
	.string	"unsigned char"
.LASF618:
	.string	"WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))"
.LASF421:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF1716:
	.string	"FEATURE_MOTOR_STOP"
.LASF1215:
	.string	"MSP_SERVO_CONFIGURATIONS 120"
.LASF1715:
	.string	"FEATURE_RX_SERIAL"
.LASF1126:
	.string	"MSP_FEATURE 36"
.LASF981:
	.string	"PG_FOREACH(_name) for (const pgRegistry_t *(_name) = __pg_registry_start; (_name) < __pg_registry_end; _name++)"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF2048:
	.string	"findBoxByBoxId"
.LASF1682:
	.string	"adjustmentRange_s"
.LASF1686:
	.string	"adjustmentRange_t"
.LASF633:
	.string	"__mode_t_defined "
.LASF467:
	.string	"__SIZE_T "
.LASF1209:
	.string	"MSP_MISC 114"
.LASF1608:
	.string	"rcYawExpo8"
.LASF790:
	.string	"SING 2"
.LASF1032:
	.string	"PG_HOTT_TELEMETRY_CONFIG 33"
.LASF1007:
	.string	"PG_SENSOR_ALIGNMENT_CONFIG 8"
.LASF225:
	.string	"__k8 1"
.LASF1015:
	.string	"PG_ARMING_CONFIG 16"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF1271:
	.string	"YAW_LO (1 << (2 * YAW))"
.LASF1474:
	.string	"float"
.LASF1234:
	.string	"MSP_RESET_CONF 208"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF885:
	.string	"I2C_DEVICE I2CDEV_6"
.LASF263:
	.string	"__USE_ISOC95"
.LASF2029:
	.string	"armingConfig"
.LASF1857:
	.string	"vbatmaxcellvoltage"
.LASF262:
	.string	"__USE_ISOC99"
.LASF1614:
	.string	"BOXARM"
.LASF2022:
	.string	"boxName"
.LASF448:
	.string	"INT16_C(c) c"
.LASF2072:
	.string	"permId"
.LASF1549:
	.string	"writeBuf"
.LASF772:
	.string	"__MATHDECL"
.LASF845:
	.string	"GYRO "
.LASF1568:
	.string	"mincheck"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1407:
	.string	"ACC_MAX ACC_FAKE"
.LASF1971:
	.string	"pidController"
.LASF941:
	.string	"_PTRDIFF_T_DECLARED "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF1313:
	.string	"TASK_PERIOD_US(us) (us)"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF905:
	.string	"ADC_AHB_PERIPHERAL RCC_AHBPeriph_DMA2"
.LASF699:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF883:
	.string	"UART3_RX_PINSOURCE GPIO_PinSource11"
.LASF2057:
	.string	"flightMode_boxId_map"
.LASF902:
	.string	"USE_ADC "
.LASF933:
	.string	"_PTRDIFF_T "
.LASF1630:
	.string	"BOXCALIB"
.LASF1492:
	.string	"pgRegistry_s"
.LASF1496:
	.string	"pgRegistry_t"
.LASF1860:
	.string	"batteryCapacity"
.LASF532:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF272:
	.string	"__USE_XOPEN2K"
.LASF1323:
	.string	"GPS_MESSAGE_STATE_ENTRY_COUNT (GPS_MESSAGE_STATE_MAX + 1)"
.LASF1718:
	.string	"FEATURE_SOFTSERIAL"
.LASF817:
	.string	"STATIC_UNIT_TESTED static"
.LASF2156:
	.string	"buildDate"
.LASF1551:
	.string	"endWrite"
.LASF1366:
	.string	"LED_Y_BIT_OFFSET 0"
.LASF318:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF1949:
	.string	"servoParam_s"
.LASF1955:
	.string	"servoParam_t"
.LASF1433:
	.string	"IS_PID_CONTROLLER_FP_BASED(pidController) (pidController == PID_CONTROLLER_LUX_FLOAT)"
.LASF1820:
	.string	"ALIGN_DEFAULT"
.LASF1288:
	.string	"PID_MIN 0"
.LASF1446:
	.string	"FLIGHT_LOG_EVENT_INFLIGHT_ADJUSTMENT_FUNCTION_FLOAT_VALUE_FLAG 128"
.LASF1047:
	.string	"PG_MSP_SERVER_CONFIG 48"
.LASF1626:
	.string	"BOXBEEPERON"
.LASF287:
	.string	"_DEFAULT_SOURCE"
.LASF901:
	.string	"MPU6500_SPI_INSTANCE SPI3"
.LASF1596:
	.string	"dataSize"
.LASF238:
	.string	"__unix 1"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF416:
	.string	"UINT_LEAST8_MAX (255)"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1432:
	.string	"YAW_P_LIMIT_MAX 500"
.LASF969:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF355:
	.string	"__wur "
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF1844:
	.string	"amperageMeterConfig_s"
.LASF1846:
	.string	"amperageMeterConfig_t"
.LASF1648:
	.string	"AUX1"
.LASF1649:
	.string	"AUX2"
.LASF1650:
	.string	"AUX3"
.LASF1651:
	.string	"AUX4"
.LASF1652:
	.string	"AUX5"
.LASF1653:
	.string	"AUX6"
.LASF1654:
	.string	"AUX7"
.LASF1655:
	.string	"AUX8"
.LASF1251:
	.string	"MSP_DEBUG 254"
.LASF1017:
	.string	"PG_SYSTEM_CONFIG 18"
.LASF1392:
	.string	"FAT_MAKE_DATE(year,month,day) (day | (month << 5) | ((year - 1980) << 9))"
.LASF1569:
	.string	"maxcheck"
.LASF2025:
	.string	"box_t"
.LASF1507:
	.string	"init"
.LASF668:
	.string	"__timespec_defined 1"
.LASF288:
	.string	"_DEFAULT_SOURCE 1"
.LASF487:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1214:
	.string	"MSP_BOXIDS 119"
.LASF563:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF510:
	.string	"P_ALL"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF1078:
	.string	"MAX_SUPPORTED_RC_PPM_CHANNEL_COUNT 12"
.LASF1729:
	.string	"FEATURE_DISPLAY"
.LASF1172:
	.string	"MSP_SET_TRANSPONDER_CONFIG 83"
.LASF1912:
	.string	"MIXER_CUSTOM"
.LASF1787:
	.string	"specialColorIndexes_s"
.LASF1749:
	.string	"SBAS_GAGAN"
.LASF985:
	.ascii	"PG"
	.string	"_DECLARE_ARR(_type,_size,_name) extern _type _name ## _SystemArray[_size]; static inline _type* _name(int _index) { return &_name ## _SystemArray[_index]; } static inline _type (* _name ## _arr(void))[_size] { return &_name ## _SystemArray; } struct _dummy"
.LASF1009:
	.string	"PG_GYRO_CONFIG 10"
.LASF1600:
	.string	"mspPostProcessFuncPtr"
.LASF316:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF893:
	.string	"I2C2_SDA_PIN GPIO_Pin_10"
.LASF395:
	.string	"__intptr_t_defined "
.LASF403:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF414:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF1127:
	.string	"MSP_SET_FEATURE 37"
.LASF369:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF1742:
	.string	"GPS_NMEA"
.LASF522:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF1045:
	.string	"PG_SPECIAL_COLOR_CONFIG 46"
.LASF545:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF1074:
	.string	"DEFAULT_SERVO_MAX 2000"
.LASF692:
	.string	"_BITS_PTHREADTYPES_H 1"
.LASF382:
	.string	"__stub_gtty "
.LASF245:
	.string	"EDISON 1"
.LASF1199:
	.string	"MSP_MOTOR 104"
.LASF725:
	.string	"__DECL_SIMD_sincosl "
.LASF275:
	.string	"__USE_XOPEN2K8XSI"
.LASF1579:
	.string	"IDLE"
.LASF663:
	.string	"__FD_ISSET(d,set) ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF652:
	.string	"__timer_t_defined 1"
.LASF1913:
	.string	"MIXER_CUSTOM_AIRPLANE"
.LASF1221:
	.string	"MSP_LED_STRIP_MODECOLOR 127"
.LASF2158:
	.string	"mspServerConfig_System"
.LASF1643:
	.string	"boxId_e"
.LASF1636:
	.string	"BOXSERVO1"
.LASF1637:
	.string	"BOXSERVO2"
.LASF1638:
	.string	"BOXSERVO3"
.LASF1451:
	.string	"MW_VERSION 231"
.LASF826:
	.string	"TIME_SECTION_END(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[1][index] = micros(); debug[index] = sectionTimes[1][index] - sectionTimes[0][index]; }"
.LASF1703:
	.string	"FAILSAFE_MODE"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF753:
	.string	"__MATH_DECLARING_DOUBLE 1"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF926:
	.string	"TARGET_IO_PORTD (BIT(2))"
.LASF1546:
	.string	"serialSetBaudRate"
.LASF631:
	.string	"__dev_t_defined "
.LASF968:
	.string	"RAD (M_PIf / 180.0f)"
.LASF1454:
	.string	"BUILD_TIME_LENGTH 8"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF758:
	.string	"_Mdouble_END_NAMESPACE"
.LASF1545:
	.string	"serialRead"
.LASF525:
	.string	"_ENDIAN_H 1"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF2079:
	.string	"portConfig"
.LASF1759:
	.string	"sbasMode"
.LASF704:
	.string	"__PTHREAD_SPINS 0, 0"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF453:
	.string	"UINT32_C(c) c ## U"
.LASF2086:
	.string	"debug"
.LASF860:
	.string	"LED0 "
.LASF1305:
	.string	"FLIGHT_MODE(mask) (flightModeFlags & (mask))"
.LASF407:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF1793:
	.string	"telemetryConfig_s"
.LASF1797:
	.string	"telemetryConfig_t"
.LASF1200:
	.string	"MSP_RC 105"
.LASF1312:
	.string	"TASK_PERIOD_MS(ms) ((ms) * 1000)"
.LASF1206:
	.string	"MSP_RC_TUNING 111"
.LASF1266:
	.string	"ROL_CE (3 << (2 * ROLL))"
.LASF527:
	.string	"__BIG_ENDIAN 4321"
.LASF1961:
	.string	"PIDYAW"
.LASF1534:
	.string	"rxBuffer"
.LASF1352:
	.string	"LED_MOV_OVERLAY(overlay) ((overlay) << LED_OVERLAY_OFFSET)"
.LASF380:
	.string	"__stub_fdetach "
.LASF450:
	.string	"INT64_C(c) c ## L"
.LASF1533:
	.string	"txBufferSize"
.LASF1521:
	.string	"SERIAL_PARITY_NO"
.LASF785:
	.string	"MATH_ERRNO 1"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF1695:
	.string	"MAG_MODE"
.LASF284:
	.string	"__KERNEL_STRICT_NAMES"
.LASF711:
	.string	"__COMPAR_FN_T "
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF551:
	.string	"__U64_TYPE unsigned long int"
.LASF1505:
	.string	"sensorAccInitFuncPtr"
.LASF1185:
	.string	"MSP_SENSOR_CONFIG 96"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF426:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF1452:
	.string	"GIT_SHORT_REVISION_LENGTH 7"
.LASF1367:
	.string	"LED_XY_MASK 0x0F"
.LASF2062:
	.string	"serializeSDCardSummaryReply"
.LASF1083:
	.string	"MAX_SUPPORTED_RX_PARALLEL_PWM_OR_PPM_CHANNEL_COUNT MAX_SUPPORTED_RC_PPM_CHANNEL_COUNT"
.LASF575:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF1327:
	.string	"GIMBAL_MODE_MAX (GIMBAL_MODE_MIXTILT)"
.LASF513:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF895:
	.string	"I2C2_SDA_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF1493:
	.string	"size"
.LASF277:
	.string	"__USE_LARGEFILE64"
.LASF688:
	.string	"__blksize_t_defined "
.LASF657:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF356:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF17:
	.string	"__LP64__ 1"
.LASF1696:
	.string	"BARO_MODE"
.LASF539:
	.string	"__U16_TYPE unsigned short int"
.LASF1571:
	.string	"rx_max_usec"
.LASF600:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF1134:
	.string	"MSP_RX_CONFIG 44"
.LASF1148:
	.string	"MSP_SONAR_ALTITUDE 58"
.LASF1347:
	.string	"LED_PARAMS_BITCNT 4"
.LASF1591:
	.string	"mspPort_s"
.LASF1599:
	.string	"mspPort_t"
.LASF615:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))"
.LASF611:
	.string	"w_stopsig __wait_stopped.__w_stopsig"
.LASF850:
	.string	"GYRO_MPU6500_ALIGN CW270_DEG"
.LASF346:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF1330:
	.string	"LED_CONFIGURABLE_COLOR_COUNT 16"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF718:
	.string	"__DECL_SIMD_cosf "
.LASF1073:
	.string	"DEFAULT_SERVO_MIDDLE 1500"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF1121:
	.string	"MSP_SET_NAME 11"
.LASF285:
	.string	"__KERNEL_STRICT_NAMES "
.LASF1910:
	.string	"MIXER_SINGLECOPTER"
.LASF258:
	.string	"__bool_true_false_are_defined 1"
.LASF1702:
	.string	"SONAR_MODE"
.LASF1102:
	.string	"FLIGHT_CONTROLLER_VERSION_MASK 0xFFF"
.LASF980:
	.string	"PG_REGISTRY_SIZE (__pg_registry_end - __pg_registry_start)"
.LASF474:
	.string	"___int_size_t_h "
.LASF2051:
	.string	"reply"
.LASF470:
	.string	"_SIZE_T_DEFINED_ "
.LASF861:
	.string	"LED1 "
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF1072:
	.string	"DEFAULT_SERVO_MIN 1000"
.LASF533:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF2141:
	.string	"motor_disarmed"
.LASF1353:
	.string	"LED_MOV_COLOR(colorId) ((colorId) << LED_COLOR_OFFSET)"
.LASF898:
	.string	"MPU6500_CS_GPIO_CLK_PERIPHERAL RCC_AHBPeriph_GPIOA"
.LASF1491:
	.string	"pgResetFunc"
.LASF1528:
	.string	"identifier"
.LASF858:
	.string	"USE_MAG_AK8963 "
.LASF1463:
	.string	"uint8_t"
.LASF991:
	.ascii	"PG_REGISTER_ARR_I(_type,_size,_name,_pgn,_version,_reset) _t"
	.ascii	"ype _name ## _SystemArray[_size]; extern"
	.string	" const pgRegistry_t _name ##_Registry; const pgRegistry_t _name ## _Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = (sizeof(_type) * _size) | PGR_SIZE_SYSTEM_FLAG, .address = (uint8_t*)&_name ## _SystemArray, .ptr = 0, _reset, }"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF379:
	.string	"__stub_fchflags "
.LASF1350:
	.string	"LED_MOV_POS(pos) ((pos) << LED_POS_OFFSET)"
.LASF1101:
	.string	"FLIGHT_CONTROLLER_VERSION_LENGTH 3"
.LASF543:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF1406:
	.string	"SONAR_OUT_OF_RANGE (-1)"
.LASF760:
	.string	"__MATH_DECLARING_DOUBLE"
.LASF1039:
	.string	"PG_COMPASS_CONFIGURATION 40"
.LASF574:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF1806:
	.string	"SENSOR_INDEX_MAG"
.LASF1385:
	.string	"FAT_FILE_ATTRIBUTE_HIDDEN 0x02"
.LASF788:
	.string	"X_TLOSS 1.41484755040568800000e+16"
.LASF1692:
	.string	"ARMED"
.LASF218:
	.string	"__amd64__ 1"
.LASF1919:
	.string	"pid_at_min_throttle"
.LASF1249:
	.string	"MSP_RESERVE_2 252"
.LASF2034:
	.string	"sensorAlignmentConfig"
.LASF1120:
	.string	"MSP_NAME 10"
.LASF1108:
	.string	"CAP_NAVI_VERSION_BIT_3 ((uint32_t)1 << 30)"
.LASF1646:
	.string	"PITCH"
.LASF1900:
	.string	"MIXER_OCTOX8"
.LASF1005:
	.string	"PG_MOTOR_AND_SERVO_CONFIG 6"
.LASF1586:
	.string	"mspState_e"
.LASF367:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF1122:
	.string	"MSP_BATTERY_CONFIG 32"
.LASF983:
	.string	"PG_RESET_CURRENT(_name) do { extern const pgRegistry_t _name ##_Registry; pgResetCurrent(&_name ## _Registry); } while(0)"
.LASF492:
	.string	"_GCC_WCHAR_T "
.LASF810:
	.string	"isgreaterequal(x,y) __builtin_isgreaterequal(x, y)"
.LASF556:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF1048:
	.string	"PG_VOLTAGE_METER_CONFIG 49"
.LASF1252:
	.string	"MSP_RESERVE_3 255"
.LASF282:
	.string	"__USE_REENTRANT"
.LASF524:
	.string	"__WCOREFLAG 0x80"
.LASF443:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF394:
	.string	"__uint32_t_defined "
.LASF406:
	.string	"UINT32_MAX (4294967295U)"
.LASF918:
	.string	"BIND_PIN Pin_3"
.LASF373:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF1455:
	.string	"IS_ENABLED(mask) (mask == 0 ? 0 : 1)"
.LASF240:
	.string	"unix 1"
.LASF775:
	.string	"FP_INFINITE 1"
.LASF960:
	.string	"RGB_COLOR_COMPONENT_COUNT (RGB_BLUE + 1)"
.LASF1714:
	.string	"FEATURE_INFLIGHT_ACC_CAL"
.LASF720:
	.string	"__DECL_SIMD_sin "
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF2082:
	.string	"boxes"
.LASF494:
	.string	"_BSD_WCHAR_T_"
.LASF1332:
	.string	"LED_DIRECTION_COUNT 6"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF1071:
	.string	"MAX_RXFAIL_RANGE_STEP ((PWM_PULSE_MAX - PWM_PULSE_MIN) / 25)"
.LASF468:
	.string	"_SIZE_T_ "
.LASF512:
	.string	"P_PGID"
.LASF581:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF1273:
	.string	"YAW_HI (2 << (2 * YAW))"
.LASF1842:
	.string	"magZero"
.LASF680:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF1416:
	.string	"SERVO_PLANE_INDEX_MIN SERVO_ELEVATOR"
.LASF1766:
	.string	"SERIAL_PORT_UART1"
.LASF1767:
	.string	"SERIAL_PORT_UART2"
.LASF1768:
	.string	"SERIAL_PORT_UART3"
.LASF1769:
	.string	"SERIAL_PORT_UART4"
.LASF1770:
	.string	"SERIAL_PORT_UART5"
.LASF1941:
	.string	"INPUT_GIMBAL_ROLL"
.LASF2021:
	.string	"box_e"
.LASF942:
	.string	"__need_ptrdiff_t"
.LASF1255:
	.string	"MSP_GPSSTATISTICS 166"
.LASF1477:
	.string	"FD_PITCH"
.LASF1196:
	.string	"MSP_STATUS 101"
.LASF830:
	.string	"HW_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF816:
	.string	"BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF1035:
	.string	"PG_RATE_PROFILE_SELECTION 36"
.LASF1688:
	.string	"adjustmentRanges"
.LASF1935:
	.string	"INPUT_RC_THROTTLE"
.LASF2162:
	.string	"/home/aravind/git/cleanflight"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF441:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF906:
	.string	"ADC0_GPIO GPIOA"
.LASF567:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF2088:
	.string	"U_ID_1"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF506:
	.string	"__WNOTHREAD 0x20000000"
.LASF2130:
	.string	"batteryConfig_System"
.LASF1891:
	.string	"MIXER_QUADP"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF613:
	.string	"__WAIT_INT(status) (__extension__ (((union { __typeof(status) __in; int __i; }) { .__in = (status) }).__i))"
.LASF456:
	.string	"UINTMAX_C(c) c ## UL"
.LASF271:
	.string	"__USE_UNIX98"
.LASF1892:
	.string	"MIXER_QUADX"
.LASF1118:
	.string	"MSP_BOARD_INFO 4"
.LASF707:
	.string	"__malloc_and_calloc_defined "
.LASF1063:
	.string	"PWM_RANGE_ZERO 0"
.LASF1140:
	.string	"MSP_RSSI_CONFIG 50"
.LASF1220:
	.string	"MSP_SENSOR_ALIGNMENT 126"
.LASF763:
	.string	"__MATH_PRECNAME(name,r) name ##f ##r"
.LASF321:
	.string	"__CONCAT(x,y) x ## y"
.LASF1564:
	.string	"rssi_scale"
.LASF1025:
	.string	"PG_MOTOR_3D_CONFIG 26"
.LASF1587:
	.string	"mspCommandSenderFuncPtr"
.LASF561:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF998:
	.string	"PG_REGISTER_PROFILE_WITH_RESET_TEMPLATE(_type,_name,_pgn,_version) extern const _type pgResetTemplate_ ## _name; PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.ptr = (void*)&pgResetTemplate_ ## _name})"
.LASF2007:
	.string	"nav_speed_max"
.LASF988:
	.string	"PG_REGISTER(_type,_name,_pgn,_version) PG_REGISTER_I(_type, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF899:
	.string	"MPU6500_CS_GPIO GPIOA"
.LASF1604:
	.string	"thrMid8"
.LASF1186:
	.string	"MSP_SET_SENSOR_CONFIG 97"
.LASF1953:
	.string	"forwardFromChannel"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF549:
	.string	"__ULONG32_TYPE unsigned int"
.LASF1518:
	.string	"SERIAL_INVERTED"
.LASF1593:
	.string	"commandSenderFn"
.LASF2078:
	.string	"portConfigSize"
.LASF2129:
	.string	"voltageMeterConfig_SystemArray"
.LASF2100:
	.string	"rxRuntimeConfig"
.LASF1176:
	.string	"MSP_OSD_CHAR_WRITE 87"
.LASF473:
	.string	"_SIZE_T_DECLARED "
.LASF1043:
	.string	"PG_CHANNEL_RANGE_CONFIG 44"
.LASF572:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF1210:
	.string	"MSP_MOTOR_PINS 115"
.LASF2012:
	.string	"airplaneConfig_t"
.LASF1444:
	.string	"PERIOD_RXDATA_FAILURE 200"
.LASF408:
	.string	"INT_LEAST8_MIN (-128)"
.LASF870:
	.string	"UART1_TX_PINSOURCE GPIO_PinSource6"
.LASF642:
	.string	"__need_clock_t "
.LASF2005:
	.string	"nav_controls_heading"
.LASF1890:
	.string	"MIXER_TRI"
.LASF904:
	.string	"ADC_DMA_CHANNEL DMA2_Channel1"
.LASF454:
	.string	"UINT64_C(c) c ## UL"
.LASF1205:
	.string	"MSP_ANALOG 110"
.LASF1250:
	.string	"MSP_DEBUGMSG 253"
.LASF690:
	.string	"__fsblkcnt_t_defined "
.LASF1201:
	.string	"MSP_RAW_GPS 106"
.LASF2133:
	.string	"compassConfig_ProfileCurrent"
.LASF409:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF736:
	.string	"HUGE_VALF (__builtin_huge_valf())"
.LASF1231:
	.string	"MSP_ACC_CALIBRATION 205"
.LASF531:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF1817:
	.string	"SENSOR_SONAR"
.LASF1135:
	.string	"MSP_SET_RX_CONFIG 45"
.LASF521:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF1145:
	.string	"MSP_SET_CF_SERIAL_CONFIG 55"
.LASF1423:
	.string	"SERVO_FLAPPERONS_MAX SERVO_FLAPPERON_2"
.LASF1732:
	.string	"FEATURE_CHANNEL_FORWARDING"
.LASF691:
	.string	"__fsfilcnt_t_defined "
.LASF814:
	.string	"isunordered(u,v) __builtin_isunordered(u, v)"
.LASF500:
	.string	"WNOHANG 1"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF2050:
	.string	"findBoxByPermenantId"
.LASF1750:
	.string	"sbasMode_e"
.LASF1933:
	.string	"INPUT_RC_PITCH"
.LASF696:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF1789:
	.string	"ledConfig_t"
.LASF1067:
	.string	"PWM_PULSE_MIN 750"
.LASF2046:
	.string	"failsafeConfig"
.LASF835:
	.string	"LED1_PIN Pin_5"
.LASF307:
	.string	"__GNU_LIBRARY__"
.LASF1152:
	.string	"MSP_SET_ARMING_CONFIG 62"
.LASF1373:
	.string	"MBR_PARTITION_TYPE_FAT16 0x06"
.LASF1814:
	.string	"SENSOR_ACC"
.LASF305:
	.string	"__USE_ATFILE 1"
.LASF774:
	.string	"FP_NAN 0"
.LASF1128:
	.string	"MSP_BOARD_ALIGNMENT 38"
.LASF1494:
	.string	"address"
.LASF987:
	.ascii	"PG_REGISTER_I(_type,_name,_pgn,_version,_reset) _type _name "
	.ascii	"## "
	.string	"_System; extern const pgRegistry_t _name ## _Registry; const pgRegistry_t _name ##_Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = sizeof(_type) | PGR_SIZE_SYSTEM_FLAG, .address = (uint8_t*)&_name ## _System, .ptr = 0, _reset, }"
.LASF1830:
	.string	"sensorAlignmentConfig_s"
.LASF1834:
	.string	"sensorAlignmentConfig_t"
.LASF1400:
	.string	"VBAT_RESDIVVAL_DEFAULT 10"
.LASF928:
	.string	"TARGET_BOARD_IDENTIFIER \"EDISON\""
.LASF1269:
	.string	"PIT_CE (3 << (2 * PITCH))"
.LASF2157:
	.string	"buildTime"
.LASF1456:
	.string	"BM(x) (1 << (x))"
.LASF719:
	.string	"__DECL_SIMD_cosl "
.LASF1807:
	.string	"int16_flightDynamicsTrims_s"
.LASF418:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF650:
	.string	"__clockid_t_defined 1"
.LASF1974:
	.string	"yaw_lpf"
.LASF1159:
	.string	"MSP_DATAFLASH_SUMMARY 70"
.LASF822:
	.string	"REQUIRE_PRINTF_LONG_SUPPORT "
.LASF230:
	.string	"__SSE2__ 1"
.LASF793:
	.string	"TLOSS 5"
.LASF401:
	.string	"INT16_MAX (32767)"
.LASF1929:
	.string	"INPUT_STABILIZED_PITCH"
.LASF1439:
	.string	"MILLIS_PER_TENTH_SECOND 100"
.LASF1706:
	.string	"GPS_FIX_HOME"
.LASF1130:
	.string	"MSP_AMPERAGE_METER_CONFIG 40"
.LASF577:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF601:
	.string	"htole32(x) (x)"
.LASF702:
	.string	"__have_pthread_attr_t 1"
.LASF1809:
	.string	"pitch"
.LASF503:
	.string	"WEXITED 4"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF1349:
	.string	"LED_FLAG_DIRECTION_MASK ((1 << LED_DIRECTION_BITCNT) - 1)"
.LASF2077:
	.string	"channel"
.LASF568:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF640:
	.string	"__daddr_t_defined "
.LASF1619:
	.string	"BOXHEADFREE"
.LASF844:
	.string	"USE_MPU_DATA_READY_SIGNAL "
.LASF923:
	.string	"TARGET_IO_PORTA 0xffff"
.LASF313:
	.string	"__PMT"
.LASF388:
	.string	"__stub_sstk "
.LASF329:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF1794:
	.string	"telemetry_switch"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF1107:
	.string	"CAP_NAVI_VERSION_BIT_4_MSB ((uint32_t)1 << 31)"
.LASF1018:
	.string	"PG_FEATURE_CONFIG 19"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF1970:
	.string	"pidProfile_s"
.LASF1978:
	.string	"pidProfile_t"
.LASF2047:
	.string	"mspServerConfig"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF393:
	.string	"__int8_t_defined "
.LASF1049:
	.string	"PG_AMPERAGE_METER_CONFIG 50"
.LASF799:
	.string	"M_LN2 0.69314718055994530942"
.LASF1028:
	.string	"PG_AIRPLANE_ALT_HOLD_CONFIG 29"
.LASF1833:
	.string	"mag_align"
.LASF1500:
	.string	"profileSelection_s"
.LASF1502:
	.string	"profileSelection_t"
.LASF2053:
	.string	"serializeBoxIdsReply"
.LASF2110:
	.string	"armingFlags"
.LASF1746:
	.string	"SBAS_EGNOS"
.LASF2066:
	.string	"adjRange"
.LASF455:
	.string	"INTMAX_C(c) c ## L"
.LASF1309:
	.string	"STATE(mask) (stateFlags & (mask))"
.LASF1169:
	.string	"MSP_BLACKBOX_CONFIG 80"
.LASF1661:
	.string	"modeId"
.LASF241:
	.string	"__ELF__ 1"
.LASF777:
	.string	"FP_SUBNORMAL 3"
.LASF1684:
	.string	"auxSwitchChannelIndex"
.LASF351:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF1006:
	.string	"PG_SENSOR_SELECTION_CONFIG 7"
.LASF2024:
	.string	"permanentId"
.LASF598:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF741:
	.string	"FP_ILOGB0 (-2147483647 - 1)"
.LASF1615:
	.string	"BOXANGLE"
.LASF636:
	.string	"__off_t_defined "
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF361:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF1394:
	.string	"MAX_SENSORS_TO_DETECT (SENSOR_INDEX_MAG + 1)"
.LASF1799:
	.string	"rollDegrees"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF897:
	.string	"USE_SPI_DEVICE_3 "
.LASF1993:
	.string	"failsafeConfig_s"
.LASF2000:
	.string	"failsafeConfig_t"
.LASF1851:
	.string	"voltageMeterConfig_s"
.LASF1855:
	.string	"voltageMeterConfig_t"
.LASF481:
	.string	"_WCHAR_T "
.LASF542:
	.string	"__SLONGWORD_TYPE long int"
.LASF747:
	.string	"__MATHDECL(type,function,suffix,args) __MATHDECL_1(type, function,suffix, args); __MATHDECL_1(type, __CONCAT(__,function),suffix, args)"
.LASF820:
	.string	"UNIT_TESTED "
.LASF1760:
	.string	"autoConfig"
.LASF1866:
	.string	"BATTERY_NOT_PRESENT"
.LASF1264:
	.string	"MAX_CONTROL_RATE_PROFILE_COUNT 3"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF435:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF2146:
	.string	"accSmooth"
.LASF684:
	.string	"_SYS_SYSMACROS_H 1"
.LASF422:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF402:
	.string	"INT32_MAX (2147483647)"
.LASF1447:
	.string	"FC_VERSION_MAJOR 1"
.LASF1105:
	.string	"CAP_PLATFORM_32BIT ((uint32_t)1 << 31)"
.LASF485:
	.string	"_WCHAR_T_ "
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF1374:
	.string	"MBR_PARTITION_TYPE_FAT32 0x0B"
.LASF695:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF999:
	.string	"PG_RESET_TEMPLATE(_type,_name,...) const _type pgResetTemplate_ ## _name PG_RESETDATA_ATTRIBUTES = { __VA_ARGS__ }"
.LASF319:
	.string	"__P(args) args"
.LASF853:
	.string	"USE_ACC_MPU6500 "
.LASF1278:
	.string	"CHANNEL_RANGE_MIN 900"
.LASF1000:
	.string	"PG_FAILSAFE_CONFIG 1"
.LASF1276:
	.string	"THR_HI (2 << (2 * THROTTLE))"
.LASF1861:
	.string	"amperageMeterSource"
.LASF434:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF412:
	.string	"INT_LEAST8_MAX (127)"
.LASF1482:
	.string	"ANGLE_INDEX_COUNT"
.LASF1872:
	.string	"accDeadband_s"
.LASF1812:
	.string	"flightDynamicsTrims_t"
.LASF1869:
	.string	"flightDynamicsTrims_u"
.LASF1058:
	.string	"MAX_PROFILE_COUNT 3"
.LASF973:
	.string	"cos_approx(x) cosf(x)"
.LASF1405:
	.string	"MAX_VOLTAGE_METERS 1"
.LASF739:
	.string	"NAN (__builtin_nanf (\"\"))"
.LASF1319:
	.string	"GPS_DEGREES_DIVIDER 10000000L"
.LASF219:
	.string	"__x86_64 1"
.LASF1577:
	.string	"result"
.LASF701:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF986:
	.string	"PG_DECLARE_PROFILE(_type,_name) extern _type *_name ## _ProfileCurrent; static inline _type* _name(void) { return _name ## _ProfileCurrent; } struct _dummy"
.LASF1848:
	.string	"amperage"
.LASF1795:
	.string	"telemetry_inversion"
.LASF621:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))"
.LASF1131:
	.string	"MSP_SET_AMPERAGE_METER_CONFIG 41"
.LASF1403:
	.string	"VBAT_SCALE_MAX 255"
.LASF1457:
	.string	"int8_t"
.LASF605:
	.string	"htole64(x) (x)"
.LASF1326:
	.string	"GPS_DBHZ_MAX 55"
.LASF672:
	.string	"__suseconds_t_defined "
.LASF1111:
	.string	"CAP_DYNBALANCE ((uint32_t)1 << 2)"
.LASF578:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF400:
	.string	"INT8_MAX (127)"
.LASF1344:
	.string	"LED_OVERLAY_BITCNT 6"
.LASF681:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF2107:
	.string	"rcControlsConfig_ProfileCurrent"
.LASF608:
	.string	"w_termsig __wait_terminated.__w_termsig"
.LASF2104:
	.string	"currentControlRateProfile"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF1735:
	.string	"minthrottle"
.LASF2040:
	.string	"accelerometerConfig"
.LASF1707:
	.string	"GPS_FIX"
.LASF2140:
	.string	"motor"
.LASF579:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF498:
	.string	"__need_NULL"
.LASF943:
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
.LASF1597:
	.string	"cmdMSP"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF330:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF1687:
	.string	"adjustmentProfile_s"
.LASF1689:
	.string	"adjustmentProfile_t"
.LASF368:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF268:
	.string	"__USE_POSIX199506"
.LASF276:
	.string	"__USE_LARGEFILE"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF1954:
	.string	"reversedSources"
.LASF2122:
	.string	"transponderConfig_System"
.LASF1588:
	.string	"MSP_MODE_SERVER"
.LASF333:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF1514:
	.string	"MODE_RXTX"
.LASF978:
	.string	"PG_REGISTER_ATTRIBUTES __attribute__ ((section(\".pg_registry\"), used, aligned(4)))"
.LASF1698:
	.string	"GPS_HOLD_MODE"
.LASF1442:
	.string	"PERIOD_OF_3_SECONDS 3 * MILLIS_PER_SECOND"
.LASF972:
	.string	"sin_approx(x) sinf(x)"
.LASF298:
	.string	"__USE_POSIX199309 1"
.LASF444:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF922:
	.string	"BINDPLUG_PIN Pin_12"
.LASF1864:
	.string	"BATTERY_WARNING"
.LASF1036:
	.string	"PG_ADJUSTMENT_PROFILE 37"
.LASF1024:
	.string	"PG_RC_CONTROLS_CONFIG 25"
.LASF2127:
	.string	"sensorTrims_System"
.LASF1495:
	.string	"reset"
.LASF1906:
	.string	"MIXER_VTAIL4"
.LASF1170:
	.string	"MSP_SET_BLACKBOX_CONFIG 81"
.LASF1401:
	.string	"VBAT_RESDIVMULTIPLIER_DEFAULT 1"
.LASF384:
	.string	"__stub_putmsg "
.LASF1990:
	.string	"throttle_correction_angle"
.LASF428:
	.string	"UINT_FAST8_MAX (255)"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF2067:
	.string	"baudRateIndex"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF326:
	.string	"__END_DECLS "
.LASF1470:
	.string	"sizetype"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF1699:
	.string	"HEADFREE_MODE"
.LASF961:
	.string	"HSV_HUE_MAX 359"
.LASF1831:
	.string	"gyro_align"
.LASF1061:
	.string	"I2C_DEFAULT_TIMEOUT I2C_SHORT_TIMEOUT"
.LASF1346:
	.string	"LED_DIRECTION_BITCNT 6"
.LASF1930:
	.string	"INPUT_STABILIZED_YAW"
.LASF713:
	.string	"_STRING_H 1"
.LASF1936:
	.string	"INPUT_RC_AUX1"
.LASF1937:
	.string	"INPUT_RC_AUX2"
.LASF1736:
	.string	"maxthrottle"
.LASF1939:
	.string	"INPUT_RC_AUX4"
.LASF564:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF786:
	.string	"MATH_ERREXCEPT 2"
.LASF2006:
	.string	"nav_speed_min"
.LASF496:
	.string	"NULL"
.LASF1458:
	.string	"int16_t"
.LASF1100:
	.string	"FLIGHT_CONTROLLER_IDENTIFIER_LENGTH 4"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF1466:
	.string	"short unsigned int"
.LASF848:
	.string	"USE_GYRO_SPI_MPU6500 "
.LASF909:
	.string	"ADC_CHANNEL_COUNT 1"
.LASF1459:
	.string	"signed char"
.LASF1450:
	.string	"FC_VERSION_STRING STR(FC_VERSION_MAJOR) \".\" STR(FC_VERSION_MINOR) \".\" STR(FC_VERSION_PATCH_LEVEL)"
.LASF1151:
	.string	"MSP_ARMING_CONFIG 61"
.LASF1413:
	.string	"YAW_JUMP_PREVENTION_LIMIT_HIGH 500"
.LASF662:
	.string	"__FD_CLR(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))"
.LASF1257:
	.string	"MSP_SET_ACC_TRIM 239"
.LASF1660:
	.string	"modeActivationCondition_s"
.LASF1664:
	.string	"modeActivationCondition_t"
.LASF461:
	.string	"__size_t__ "
.LASF300:
	.string	"__USE_XOPEN2K 1"
.LASF1165:
	.string	"MSP_SET_FAILSAFE_CONFIG 76"
.LASF518:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF1918:
	.string	"mixerConfig_s"
.LASF1922:
	.string	"mixerConfig_t"
.LASF489:
	.string	"_WCHAR_T_H "
.LASF729:
	.string	"__DECL_SIMD_exp "
.LASF1016:
	.string	"PG_TRANSPONDER_CONFIG 17"
.LASF348:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF2041:
	.string	"compassConfig"
.LASF1841:
	.string	"accZero"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF648:
	.string	"__time_t_defined 1"
.LASF602:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF2059:
	.string	"rcModeCopyMask"
.LASF1727:
	.string	"FEATURE_RSSI_ADC"
.LASF965:
	.string	"sq(x) ((x)*(x))"
.LASF726:
	.string	"__DECL_SIMD_log "
.LASF2121:
	.string	"specialColors_System"
.LASF436:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF376:
	.string	"__stub___compat_bdflush "
.LASF536:
	.string	"_BITS_BYTESWAP_H 1"
.LASF769:
	.string	"__MATH_PRECNAME(name,r) name ##l ##r"
.LASF841:
	.string	"LED1_PIN_2 Pin_9"
.LASF1448:
	.string	"FC_VERSION_MINOR 14"
.LASF956:
	.string	"LOG2_16BIT(v) (8*((v)>255) + LOG2_8BIT((v) >>8*((v)>255)))"
.LASF1147:
	.string	"MSP_SET_VOLTAGE_METER_CONFIG 57"
.LASF260:
	.string	"_FEATURES_H 1"
.LASF1068:
	.string	"PWM_PULSE_MAX 2250"
.LASF1798:
	.string	"boardAlignment_s"
.LASF1802:
	.string	"boardAlignment_t"
.LASF362:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF992:
	.string	"PG_REGISTER_ARR(_type,_size,_name,_pgn,_version) PG_REGISTER_ARR_I(_type, _size, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF350:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF1404:
	.string	"VBATT_LPF_FREQ 1.0f"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF1293:
	.string	"RC_RATE_MAX 250"
.LASF811:
	.string	"isless(x,y) __builtin_isless(x, y)"
.LASF836:
	.string	"LED1_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF1621:
	.string	"BOXCAMSTAB"
.LASF1223:
	.string	"MSP_CURRENT_METERS 129"
.LASF852:
	.string	"USE_ACC_MPU6050 "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF1055:
	.string	"PG_RESERVED_FOR_TESTING_1 65533"
.LASF1270:
	.string	"PIT_HI (2 << (2 * PITCH))"
.LASF1476:
	.string	"FD_ROLL"
.LASF683:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF2033:
	.string	"boardAlignment"
.LASF1510:
	.string	"revisionCode"
.LASF1268:
	.string	"PIT_LO (1 << (2 * PITCH))"
.LASF565:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1772:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF1773:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF698:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF1893:
	.string	"MIXER_BICOPTER"
.LASF1422:
	.string	"SERVO_FLAPPERONS_MIN SERVO_FLAPPERON_1"
.LASF867:
	.string	"UART1_RX_PIN 2"
.LASF1641:
	.string	"BOXAIRMODE"
.LASF1874:
	.string	"accelerometerConfig_s"
.LASF1880:
	.string	"accelerometerConfig_t"
.LASF1560:
	.string	"serialrx_provider"
.LASF903:
	.string	"ADC_INSTANCE ADC2"
.LASF770:
	.string	"__MATH_DECLARE_LDOUBLE 1"
.LASF757:
	.string	"_Mdouble_BEGIN_NAMESPACE"
.LASF1354:
	.string	"LED_MOV_DIRECTION(direction) ((direction) << LED_DIRECTION_OFFSET)"
.LASF1665:
	.string	"modeActivationProfile_s"
.LASF2154:
	.string	"magHold"
.LASF1428:
	.string	"PID_MAX_D 512"
.LASF1878:
	.string	"accDeadband"
.LASF557:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF1424:
	.string	"MAX_SERVO_RULES (2 * MAX_SUPPORTED_SERVOS)"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF932:
	.string	"_ANSI_STDDEF_H "
.LASF2117:
	.string	"serialConfig_System"
.LASF2045:
	.string	"imuConfig"
.LASF766:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_C99"
.LASF603:
	.string	"le32toh(x) (x)"
.LASF787:
	.string	"math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)"
.LASF1573:
	.string	"rxRuntimeConfig_s"
.LASF1575:
	.string	"rxRuntimeConfig_t"
.LASF794:
	.string	"PLOSS 6"
.LASF616:
	.string	"WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))"
.LASF1013:
	.string	"PG_PID_PROFILE 14"
.LASF1737:
	.string	"mincommand"
.LASF712:
	.string	"__need_malloc_and_calloc"
.LASF1033:
	.string	"PG_NAVIGATION_CONFIG 34"
.LASF1171:
	.string	"MSP_TRANSPONDER_CONFIG 82"
.LASF2128:
	.string	"amperageMeterConfig_SystemArray"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF887:
	.string	"I2C2_SCL_GPIO_AF GPIO_AF_4"
.LASF1540:
	.string	"callback"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF802:
	.string	"M_PI_2 1.57079632679489661923"
.LASF1175:
	.string	"MSP_OSD_CHAR_READ 86"
.LASF1110:
	.string	"CAP_NAVI_VERSION_BIT_1_LSB ((uint32_t)1 << 28)"
.LASF1307:
	.string	"DISABLE_STATE(mask) (stateFlags &= ~(mask))"
.LASF745:
	.string	"__MATHDECL_VEC(type,function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHDECL(type, function,suffix, args)"
.LASF375:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF1973:
	.string	"dterm_lpf"
.LASF423:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF1378:
	.string	"FAT_VOLUME_ID_SIGNATURE_2 0xAA"
.LASF337:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF1690:
	.string	"OK_TO_ARM"
.LASF2001:
	.string	"gpsProfile_s"
.LASF2009:
	.string	"gpsProfile_t"
.LASF1898:
	.string	"MIXER_Y4"
.LASF1852:
	.string	"vbatscale"
.LASF1337:
	.string	"LED_FUNCTION_OFFSET 8"
.LASF846:
	.string	"USE_GYRO_MPU6050 "
.LASF1030:
	.string	"PG_TELEMETRY_CONFIG 31"
.LASF1640:
	.string	"BOXFAILSAFE"
.LASF1547:
	.string	"isSerialTransmitBufferEmpty"
.LASF776:
	.string	"FP_ZERO 2"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF1146:
	.string	"MSP_VOLTAGE_METER_CONFIG 56"
.LASF1436:
	.string	"DECIDEGREES_TO_RADIANS(angle) ((angle / 10.0f) * 0.0174532925f)"
.LASF558:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF2065:
	.string	"amperageMeter"
.LASF1524:
	.string	"SERIAL_BIDIR"
.LASF2109:
	.string	"adjustmentProfile_ProfileCurrent"
.LASF236:
	.string	"__linux__ 1"
.LASF1581:
	.string	"HEADER_ARROW"
.LASF1287:
	.string	"IS_RANGE_USABLE(range) ((range)->startStep < (range)->endStep)"
.LASF1315:
	.string	"LOAD_PERCENTAGE_ONE 100"
.LASF1194:
	.string	"MSP_SET_OSD_LAYOUT_CONFIG 185"
.LASF1771:
	.string	"SERIAL_PORT_USB_VCP"
.LASF323:
	.string	"__ptr_t void *"
.LASF1208:
	.string	"MSP_BOX 113"
.LASF1267:
	.string	"ROL_HI (2 << (2 * ROLL))"
.LASF1160:
	.string	"MSP_DATAFLASH_READ 71"
.LASF2058:
	.string	"flightModeCopyMask"
.LASF994:
	.string	"_PG_PROFILE_CURRENT_DECL(_type,_name) _type *_name ## _ProfileCurrent;"
.LASF1840:
	.string	"sensorTrims_s"
.LASF1843:
	.string	"sensorTrims_t"
.LASF548:
	.string	"__SLONG32_TYPE int"
.LASF619:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))"
.LASF1010:
	.string	"PG_BATTERY_CONFIG 11"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF1951:
	.string	"angleAtMin"
.LASF226:
	.string	"__k8__ 1"
.LASF2112:
	.string	"stateFlags"
.LASF220:
	.string	"__x86_64__ 1"
.LASF1543:
	.string	"serialTotalRxWaiting"
.LASF1027:
	.string	"PG_COLOR_CONFIG 28"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF264:
	.string	"__USE_ISOCXX11"
.LASF1478:
	.string	"FD_YAW"
.LASF1462:
	.string	"long int"
.LASF1275:
	.string	"THR_CE (3 << (2 * THROTTLE))"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF1020:
	.string	"PG_SERVO_MIXER 21"
.LASF1411:
	.string	"MAX_SUPPORTED_MOTORS 4"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF866:
	.string	"UART1_TX_PIN 1"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF1897:
	.string	"MIXER_FLYING_WING"
.LASF1923:
	.string	"motor3DConfig_s"
.LASF1927:
	.string	"motor3DConfig_t"
.LASF1905:
	.string	"MIXER_HELI_90_DEG"
.LASF396:
	.string	"INT8_MIN (-128)"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF404:
	.string	"UINT8_MAX (255)"
.LASF341:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF1901:
	.string	"MIXER_OCTOFLATP"
.LASF2115:
	.string	"gpsConfig_System"
.LASF2064:
	.string	"scale_shift"
.LASF669:
	.string	"__need_timeval "
.LASF1902:
	.string	"MIXER_OCTOFLATX"
.LASF1253:
	.string	"MSP_UID 160"
.LASF1498:
	.string	"enabledFeatures"
.LASF833:
	.string	"LED0_PERIPHERAL RCC_AHBPeriph_GPIOB"
.LASF1443:
	.string	"PERIOD_OF_30_SECONDS 30 * MILLIS_PER_SECOND"
.LASF1632:
	.string	"BOXOSD"
.LASF1304:
	.string	"ENABLE_FLIGHT_MODE(mask) enableFlightMode(mask)"
.LASF320:
	.string	"__PMT(args) args"
.LASF1832:
	.string	"acc_align"
.LASF1785:
	.string	"color"
.LASF1085:
	.string	"RSSI_SCALE_MIN 1"
.LASF937:
	.string	"_PTRDIFF_T_ "
.LASF2083:
	.string	"activeBoxIds"
.LASF1584:
	.string	"HEADER_DATA"
.LASF1261:
	.string	"MAX_MSP_PORT_COUNT 2"
.LASF413:
	.string	"INT_LEAST16_MAX (32767)"
.LASF1863:
	.string	"BATTERY_OK"
.LASF1819:
	.string	"SENSOR_GPSMAG"
.LASF834:
	.string	"LED1_GPIO GPIOB"
.LASF644:
	.string	"__need_timer_t "
.LASF626:
	.string	"EXIT_SUCCESS 0"
.LASF1290:
	.string	"PID_F_MIN 0"
.LASF1384:
	.string	"FAT_FILE_ATTRIBUTE_READ_ONLY 0x01"
.LASF1070:
	.string	"CHANNEL_VALUE_TO_RXFAIL_STEP(channelValue) ((constrain(channelValue, PWM_PULSE_MIN, PWM_PULSE_MAX) - PWM_PULSE_MIN) / 25)"
.LASF1994:
	.string	"failsafe_delay"
.LASF1445:
	.string	"PERIOD_RXDATA_RECOVERY 200"
.LASF1441:
	.string	"PERIOD_OF_1_SECONDS 1 * MILLIS_PER_SECOND"
.LASF2151:
	.string	"gpsProfile_ProfileCurrent"
.LASF580:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF1634:
	.string	"BOXGTUNE"
.LASF996:
	.string	"PG_REGISTER_PROFILE(_type,_name,_pgn,_version) PG_REGISTER_PROFILE_I(_type, _name, _pgn, _version, .reset = {.ptr = 0})"
.LASF1856:
	.string	"batteryConfig_s"
.LASF1862:
	.string	"batteryConfig_t"
.LASF286:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF312:
	.string	"_SYS_CDEFS_H 1"
.LASF1361:
	.string	"LED_DIRECTION_MASK LED_MOV_DIRECTION(LED_FLAG_DIRECTION_MASK)"
.LASF599:
	.string	"le16toh(x) (x)"
.LASF2091:
	.string	"__pg_registry_end"
.LASF950:
	.string	"EXPAND_I(x) x"
.LASF1796:
	.string	"telemetry_send_cells"
.LASF1097:
	.string	"CLEANFLIGHT_IDENTIFIER \"CLFL\""
.LASF1836:
	.string	"acc_hardware"
.LASF1212:
	.string	"MSP_PIDNAMES 117"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF752:
	.string	"__MATH_PRECNAME(name,r) __CONCAT(name,r)"
.LASF1467:
	.string	"uint32_t"
.LASF1343:
	.string	"LED_FUNCTION_BITCNT 4"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF2145:
	.string	"pidProfile_ProfileCurrent"
.LASF585:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF628:
	.string	"_SYS_TYPES_H 1"
.LASF1286:
	.string	"CONTROL_RATE_CONFIG_TPA_MAX 100"
.LASF1853:
	.string	"vbatresdivval"
.LASF2150:
	.string	"failsafeConfig_System"
.LASF1438:
	.string	"FAILSAFE_POWER_ON_DELAY_US (1000 * 1000 * 5)"
.LASF646:
	.string	"__clock_t_defined 1"
.LASF1537:
	.string	"rxBufferTail"
.LASF1328:
	.string	"FUNCTION_BAUD_RATE_COUNT 4"
.LASF1691:
	.string	"PREVENT_ARMING"
.LASF805:
	.string	"M_2_PI 0.63661977236758134308"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF1092:
	.string	"API_VERSION_MINOR 22"
.LASF1188:
	.string	"MSP_SET_SPECIAL_PARAMETERS 99"
.LASF2081:
	.string	"boardIdentifier"
.LASF1046:
	.string	"PG_PILOT_CONFIG 47"
.LASF1434:
	.string	"DEGREES_TO_DECIDEGREES(angle) (angle * 10)"
.LASF569:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF2016:
	.string	"device"
.LASF2108:
	.string	"armingConfig_System"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF2105:
	.string	"rateProfileSelection_ProfileCurrent"
.LASF1059:
	.string	"I2C_SHORT_TIMEOUT ((uint32_t)0x1000)"
.LASF1138:
	.string	"MSP_LED_STRIP_CONFIG 48"
.LASF1368:
	.string	"CALCULATE_LED_XY(x,y) ((((x) & LED_XY_MASK) << LED_X_BIT_OFFSET) | (((y) & LED_XY_MASK) << LED_Y_BIT_OFFSET))"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF778:
	.string	"FP_NORMAL 4"
.LASF1624:
	.string	"BOXGPSHOLD"
.LASF2014:
	.string	"rate_num"
.LASF1254:
	.string	"MSP_GPSSVINFO 164"
.LASF675:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF1982:
	.string	"gyroSync"
.LASF1523:
	.string	"SERIAL_UNIDIR"
.LASF1676:
	.string	"armingConfig_s"
.LASF1681:
	.string	"armingConfig_t"
.LASF297:
	.string	"__USE_POSIX2 1"
.LASF936:
	.string	"__PTRDIFF_T "
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF1184:
	.string	"MSP_SET_ADVANCED_TUNING 95"
.LASF1216:
	.string	"MSP_NAV_STATUS 121"
.LASF1285:
	.string	"CONTROL_RATE_CONFIG_YAW_RATE_MAX 255"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF742:
	.string	"FP_ILOGBNAN (-2147483647 - 1)"
.LASF1639:
	.string	"BOXBLACKBOX"
.LASF343:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF537:
	.string	"_BITS_TYPES_H 1"
.LASF1469:
	.string	"long unsigned int"
.LASF417:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF767:
	.string	"_Mlong_double_ long double"
.LASF801:
	.string	"M_PI 3.14159265358979323846"
.LASF1620:
	.string	"BOXHEADADJ"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF339:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF665:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF1421:
	.string	"SERVO_SINGLECOPTER_INDEX_MAX SERVO_SINGLECOPTER_4"
.LASF976:
	.string	"tan_approx(x) tanf(x)"
.LASF482:
	.string	"_T_WCHAR_ "
.LASF2015:
	.string	"rate_denom"
.LASF1858:
	.string	"vbatmincellvoltage"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF592:
	.string	"__bswap_constant_16(x) ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF410:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF294:
	.string	"_POSIX_C_SOURCE"
.LASF1884:
	.string	"gyroConfig_s"
.LASF1888:
	.string	"gyroConfig_t"
.LASF1342:
	.string	"LED_POS_BITCNT 8"
.LASF624:
	.string	"RAND_MAX 2147483647"
.LASF1623:
	.string	"BOXGPSHOME"
.LASF540:
	.string	"__S32_TYPE int"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF1044:
	.string	"PG_MODE_COLOR_CONFIG 45"
.LASF1509:
	.string	"acc_1G"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF1181:
	.string	"MSP_FILTER_CONFIG 92"
.LASF756:
	.string	"_Mdouble_"
.LASF2116:
	.string	"gimbalConfig_ProfileCurrent"
.LASF1317:
	.string	"LAT 0"
.LASF1730:
	.string	"FEATURE_ONESHOT125"
.LASF1471:
	.string	"char"
.LASF1578:
	.string	"mspPacket_t"
.LASF1963:
	.string	"PIDPOS"
.LASF1943:
	.string	"servoMixer_s"
.LASF1948:
	.string	"servoMixer_t"
.LASF1603:
	.string	"rcExpo8"
.LASF504:
	.string	"WCONTINUED 8"
.LASF560:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF387:
	.string	"__stub_sigreturn "
.LASF1087:
	.string	"RSSI_SCALE_DEFAULT 30"
.LASF328:
	.string	"__END_NAMESPACE_STD "
.LASF673:
	.string	"__NFDBITS"
.LASF651:
	.string	"__clockid_time_t"
.LASF2010:
	.string	"airplaneConfig_s"
.LASF1778:
	.string	"baudRates"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF656:
	.string	"__u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute__ ((__mode__ (MODE)))"
.LASF1487:
	.string	"hsvColor_s"
.LASF1486:
	.string	"hsvColor_t"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF538:
	.string	"__S16_TYPE short int"
.LASF1410:
	.string	"MAG_MAX MAG_AK8963"
.LASF1300:
	.string	"DISABLE_ARMING_FLAG(mask) (armingFlags &= ~(mask))"
.LASF463:
	.string	"_SIZE_T "
.LASF1627:
	.string	"BOXLEDMAX"
.LASF1887:
	.string	"soft_gyro_lpf_hz"
.LASF900:
	.string	"MPU6500_CS_PIN GPIO_Pin_15"
.LASF1606:
	.string	"rates"
.LASF295:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF332:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF1115:
	.string	"MSP_API_VERSION 1"
.LASF647:
	.string	"__need_clock_t"
.LASF595:
	.ascii	"__bswap_constant_64(x) (__extension__ ((((x) & 0xff000000000"
	.ascii	"00000ull) >> 56) | (((x) & 0x00ff0000000"
	.string	"00000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))"
.LASF1765:
	.string	"SERIAL_PORT_NONE"
.LASF392:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF1095:
	.string	"BASEFLIGHT_IDENTIFIER \"BAFL\";"
.LASF1247:
	.string	"MSP_EEPROM_WRITE 250"
.LASF946:
	.string	"CONCAT_HELPER(x,y) x ## y"
.LASF1195:
	.string	"MSP_IDENT 100"
.LASF256:
	.string	"true 1"
.LASF1565:
	.string	"rssi_ppm_invert"
.LASF357:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1334:
	.string	"LED_OVERLAY_COUNT 6"
.LASF1161:
	.string	"MSP_DATAFLASH_ERASE 72"
.LASF1282:
	.string	"MIN_MODE_RANGE_STEP 0"
.LASF2131:
	.string	"vbat"
.LASF1751:
	.string	"GPS_AUTOCONFIG_OFF"
.LASF792:
	.string	"UNDERFLOW 4"
.LASF1617:
	.string	"BOXBARO"
.LASF471:
	.string	"_SIZE_T_DEFINED "
.LASF1084:
	.string	"MAX_MAPPABLE_RX_INPUTS 8"
.LASF1816:
	.string	"SENSOR_MAG"
.LASF1612:
	.string	"defaultRateProfileIndex"
.LASF803:
	.string	"M_PI_4 0.78539816339744830962"
.LASF591:
	.string	"__STD_TYPE"
.LASF582:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF447:
	.string	"INT8_C(c) c"
.LASF419:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF1415:
	.string	"MAX_SUPPORTED_SERVOS 1"
.LASF2101:
	.string	"rssi"
.LASF345:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF750:
	.string	"__MATHDECL_1(type,function,suffix,args) extern type __MATH_PRECNAME(function,suffix) args __THROW"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF1645:
	.string	"ROLL"
.LASF1364:
	.string	"LED_FLAG_DIRECTION(id) (1 << (id))"
.LASF460:
	.string	"__need_NULL "
.LASF947:
	.string	"CONCAT(x,y) CONCAT_HELPER(x, y)"
.LASF1522:
	.string	"SERIAL_PARITY_EVEN"
.LASF825:
	.string	"TIME_SECTION_BEGIN(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[0][index] = micros(); }"
.LASF1504:
	.string	"sensorReadFuncPtr"
.LASF2114:
	.string	"motorAndServoConfig_System"
.LASF1847:
	.string	"amperageMeter_s"
.LASF1850:
	.string	"amperageMeter_t"
.LASF2123:
	.string	"telemetryConfig_System"
.LASF1198:
	.string	"MSP_SERVO 103"
.LASF497:
	.string	"NULL ((void *)0)"
.LASF1827:
	.string	"CW180_DEG_FLIP"
.LASF2042:
	.string	"mixerConfig"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF974:
	.string	"atan2_approx(y,x) atan2f(y,x)"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF2011:
	.string	"fixedwing_althold_dir"
.LASF606:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF1697:
	.string	"GPS_HOME_MODE"
.LASF1717:
	.string	"FEATURE_SERVO_TILT"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF1370:
	.string	"FLASHFS_WRITE_BUFFER_SIZE 128"
.LASF1583:
	.string	"HEADER_CMD"
.LASF399:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF818:
	.string	"STATIC_INLINE_UNIT_TESTED static inline"
.LASF1745:
	.string	"SBAS_AUTO"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF1998:
	.string	"failsafe_throttle_low_delay"
.LASF1187:
	.string	"MSP_SPECIAL_PARAMETERS 98"
.LASF2073:
	.string	"aRange"
.LASF1580:
	.string	"HEADER_M"
.LASF660:
	.string	"__FD_ZERO(fdsp) do { int __d0, __d1; __asm__ __volatile__ (\"cld; rep; \" __FD_ZERO_STOS : \"=c\" (__d0), \"=D\" (__d1) : \"a\" (0), \"0\" (sizeof (fd_set) / sizeof (__fd_mask)), \"1\" (&__FDS_BITS (fdsp)[0]) : \"memory\"); } while (0)"
.LASF372:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF1555:
	.string	"rxFailsafeChannelConfig_t"
.LASF1259:
	.string	"MSP_SET_SERVO_MIX_RULE 242"
.LASF1308:
	.string	"ENABLE_STATE(mask) (stateFlags |= (mask))"
.LASF1928:
	.string	"INPUT_STABILIZED_ROLL"
.LASF1693:
	.string	"ANGLE_MODE"
.LASF358:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF1838:
	.string	"baro_hardware"
.LASF784:
	.string	"isinf(x) __builtin_isinf_sign (x)"
.LASF495:
	.string	"__need_wchar_t"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF433:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF1369:
	.string	"DEFINE_LED(x,y,col,dir,func,ol,params) (LED_MOV_POS(CALCULATE_LED_XY(x, y)) | LED_MOV_COLOR(col) | LED_MOV_DIRECTION(dir) | LED_MOV_FUNCTION(func) | LED_MOV_OVERLAY(ol) | LED_MOV_PARAMS(params))"
.LASF2096:
	.string	"rcData"
.LASF935:
	.string	"_T_PTRDIFF "
.LASF764:
	.string	"__MATH_DECLARING_DOUBLE 0"
.LASF550:
	.string	"__S64_TYPE long int"
.LASF1395:
	.string	"CALIBRATING_GYRO_CYCLES 1000"
.LASF1934:
	.string	"INPUT_RC_YAW"
.LASF1582:
	.string	"HEADER_SIZE"
.LASF951:
	.string	"EXPAND(x) EXPAND_I(x)"
.LASF1873:
	.string	"accDeadband_t"
.LASF2019:
	.string	"multiwiiCurrentMeterOutput"
.LASF869:
	.string	"UART1_GPIO_AF GPIO_AF_7"
.LASF1351:
	.string	"LED_MOV_FUNCTION(func) ((func) << LED_FUNCTION_OFFSET)"
.LASF1942:
	.string	"INPUT_SOURCE_COUNT"
.LASF1158:
	.string	"MSP_BF_BUILD_INFO 69"
.LASF235:
	.string	"__linux 1"
.LASF2103:
	.string	"controlRateProfiles_SystemArray"
.LASF1189:
	.string	"MSP_OSD_VIDEO_CONFIG 180"
.LASF311:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF2068:
	.string	"meter"
.LASF812:
	.string	"islessequal(x,y) __builtin_islessequal(x, y)"
.LASF1989:
	.string	"throttleCorrectionConfig_s"
.LASF1992:
	.string	"throttleCorrectionConfig_t"
.LASF588:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF2163:
	.string	"mspRebootFn"
.LASF2039:
	.string	"batteryConfig"
.LASF856:
	.string	"ACC_MPU6500_ALIGN CW270_DEG"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF1680:
	.string	"max_arm_angle"
.LASF1060:
	.string	"I2C_LONG_TIMEOUT ((uint32_t)(10 * I2C_SHORT_TIMEOUT))"
.LASF594:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >> 8) | (((x) & 0x0000ff00) << 8) | (((x) & 0x000000ff) << 24))"
.LASF1382:
	.string	"FAT12_MAX_CLUSTERS 4084"
.LASF1763:
	.string	"gimbalConfig_s"
.LASF1764:
	.string	"gimbalConfig_t"
.LASF464:
	.string	"_SYS_SIZE_T_H "
.LASF1822:
	.string	"CW90_DEG"
.LASF1776:
	.string	"serialPortConfig_s"
.LASF1779:
	.string	"serialPortConfig_t"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF1829:
	.string	"sensor_align_e"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF868:
	.string	"UART1_GPIO GPIOB"
.LASF2043:
	.string	"motor3DConfig"
.LASF1229:
	.string	"MSP_SET_BOX 203"
.LASF1868:
	.string	"rollAndPitchTrims_t_def"
.LASF1519:
	.string	"SERIAL_STOPBITS_1"
.LASF1520:
	.string	"SERIAL_STOPBITS_2"
.LASF2126:
	.string	"sensorAlignmentConfig_System"
.LASF1427:
	.string	"PID_MAX_I 256"
.LASF1419:
	.string	"SERVO_DUALCOPTER_INDEX_MAX SERVO_DUALCOPTER_RIGHT"
.LASF507:
	.string	"__WALL 0x40000000"
.LASF1977:
	.string	"horizon_tilt_mode"
.LASF1920:
	.string	"yaw_motor_direction"
.LASF334:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF1359:
	.string	"LED_OVERLAY_MASK LED_MOV_OVERLAY(LED_FLAG_OVERLAY_MASK)"
.LASF2008:
	.string	"ap_mode"
.LASF529:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF1539:
	.string	"txBufferTail"
.LASF1909:
	.string	"MIXER_DUALCOPTER"
.LASF335:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF1633:
	.string	"BOXTELEMETRY"
.LASF1289:
	.string	"PID_MAX 200"
.LASF755:
	.string	"_Mdouble_END_NAMESPACE __END_NAMESPACE_STD"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF1217:
	.string	"MSP_NAV_CONFIG 122"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF547:
	.string	"__UWORD_TYPE unsigned long int"
.LASF1279:
	.string	"CHANNEL_RANGE_MAX 2100"
.LASF1051:
	.string	"PG_DRIVER_FLASHCHIP_CONFIG 101"
.LASF694:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF839:
	.string	"LED0_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF278:
	.string	"__USE_FILE_OFFSET64"
.LASF1800:
	.string	"pitchDegrees"
.LASF1156:
	.string	"MSP_SET_BF_CONFIG 67"
.LASF1967:
	.string	"PIDMAG"
.LASF1284:
	.string	"CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX 100"
.LASF809:
	.string	"isgreater(x,y) __builtin_isgreater(x, y)"
.LASF1497:
	.string	"featureConfig_s"
.LASF1499:
	.string	"featureConfig_t"
.LASF1239:
	.string	"MSP_SET_MOTOR 214"
.LASF1430:
	.string	"GYRO_I_MAX 256"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF1475:
	.string	"double"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF2159:
	.string	"cycleTime"
.LASF917:
	.string	"BIND_PORT GPIOA"
.LASF353:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF1213:
	.string	"MSP_WP 118"
.LASF914:
	.string	"GTUNE "
.LASF570:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF528:
	.string	"__PDP_ENDIAN 3412"
.LASF1292:
	.string	"RC_RATE_MIN 0"
.LASF2153:
	.string	"blackboxConfig_System"
.LASF1418:
	.string	"SERVO_DUALCOPTER_INDEX_MIN SERVO_DUALCOPTER_LEFT"
.LASF1440:
	.string	"MILLIS_PER_SECOND 1000"
.LASF2030:
	.string	"adjustmentProfile"
.LASF666:
	.string	"__sigset_t_defined "
.LASF2148:
	.string	"imuConfig_System"
.LASF1657:
	.string	"startStep"
.LASF1003:
	.string	"PG_MOTOR_MIXER 4"
.LASF1501:
	.string	"current_profile_index"
.LASF1726:
	.string	"FEATURE_RX_MSP"
.LASF638:
	.string	"__id_t_defined "
.LASF1236:
	.string	"MSP_SELECT_SETTING 210"
.LASF291:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF2035:
	.string	"failsafeChannelConfigs"
.LASF486:
	.string	"_BSD_WCHAR_T_ "
.LASF1644:
	.string	"rc_alias"
.LASF1256:
	.string	"MSP_ACC_TRIM 240"
.LASF1719:
	.string	"FEATURE_GPS"
.LASF1709:
	.string	"SMALL_ANGLE"
.LASF930:
	.string	"_STDDEF_H "
.LASF415:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1947:
	.string	"speed"
.LASF970:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF654:
	.string	"__need_timespec"
.LASF349:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF1668:
	.string	"rcControlsConfig_s"
.LASF1675:
	.string	"rcControlsConfig_t"
.LASF797:
	.string	"M_LOG2E 1.4426950408889634074"
.LASF1845:
	.string	"scale"
.LASF1642:
	.string	"CHECKBOX_ITEM_COUNT"
.LASF2026:
	.string	"rxConfig"
.LASF783:
	.string	"isnan(x) __builtin_isnan (x)"
.LASF1089:
	.string	"RX_FAILSAFE_TYPE_COUNT 2"
.LASF1631:
	.string	"BOXGOV"
.LASF1671:
	.string	"alt_hold_deadband"
.LASF1594:
	.string	"c_state"
.LASF281:
	.string	"__USE_GNU"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF2139:
	.string	"motor3DConfig_System"
.LASF266:
	.string	"__USE_POSIX2"
.LASF1791:
	.string	"data"
.LASF671:
	.string	"__need_timeval"
.LASF1728:
	.string	"FEATURE_LED_STRIP"
.LASF966:
	.string	"FAST_TRIGONOMETRY "
.LASF1021:
	.string	"PG_IMU_CONFIG 22"
.LASF1957:
	.string	"servoConf"
.LASF865:
	.string	"USE_UART1_TX_DMA "
.LASF1859:
	.string	"vbatwarningcellvoltage"
.LASF874:
	.string	"UART2_GPIO GPIOA"
.LASF1556:
	.string	"rxChannelRangeConfiguration_s"
.LASF1557:
	.string	"rxChannelRangeConfiguration_t"
.LASF1607:
	.string	"dynThrPID"
.LASF1149:
	.string	"MSP_PID_CONTROLLER 59"
.LASF837:
	.string	"LED0_GPIO_2 GPIOB"
.LASF1881:
	.string	"compassConfig_s"
.LASF1883:
	.string	"compassConfig_t"
.LASF1531:
	.string	"baudRate"
.LASF1023:
	.string	"PG_RX_CONFIG 24"
.LASF995:
	.ascii	"PG_REGISTER_PROFILE_I(_type,_name,_pgn,_version,_reset) STAT"
	.ascii	"IC_UNIT_TESTED _type _name ## _Storage[MAX_PROFILE_COUNT]; _"
	.ascii	"PG_PROFILE_CURRENT_DECL(_type, _name) extern const pgRegistr"
	.ascii	"y_t _nam"
	.string	"e ## _Registry; const pgRegistry_t _name ## _Registry PG_REGISTER_ATTRIBUTES = { .pgn = _pgn | (_version << 12), .size = sizeof(_type) | PGR_SIZE_PROFILE_FLAG, .address = (uint8_t*)&_name ## _Storage, .ptr = (uint8_t **)&_name ## _ProfileCurrent, _reset, }"
.LASF279:
	.string	"__USE_MISC"
.LASF1240:
	.string	"MSP_SET_NAV_CONFIG 215"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF1775:
	.string	"serialPortIdentifier_e"
.LASF1516:
	.string	"portOptions_t"
.LASF459:
	.string	"__need_wchar_t "
.LASF273:
	.string	"__USE_XOPEN2KXSI"
.LASF1710:
	.string	"FIXED_WING"
.LASF1190:
	.string	"MSP_SET_OSD_VIDEO_CONFIG 181"
.LASF1849:
	.string	"mAhDrawn"
.LASF430:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF689:
	.string	"__blkcnt_t_defined "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF733:
	.string	"__DECL_SIMD_powf "
.LASF1835:
	.string	"sensorSelectionConfig_s"
.LASF1535:
	.string	"txBuffer"
.LASF483:
	.string	"_T_WCHAR "
.LASF1245:
	.string	"MSP_SET_LED_STRIP_MODECOLOR 221"
.LASF1882:
	.string	"mag_declination"
.LASF476:
	.string	"_SIZET_ "
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF842:
	.string	"LED1_PERIPHERAL_2 RCC_AHBPeriph_GPIOB"
.LASF735:
	.string	"HUGE_VAL (__builtin_huge_val())"
.LASF405:
	.string	"UINT16_MAX (65535)"
.LASF1082:
	.string	"MAX_AUX_CHANNEL_COUNT (MAX_SUPPORTED_RC_CHANNEL_COUNT - NON_AUX_CHANNEL_COUNT)"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF795:
	.string	"HUGE 3.40282347e+38F"
.LASF228:
	.string	"__MMX__ 1"
.LASF520:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF587:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF931:
	.string	"_STDDEF_H_ "
.LASF303:
	.string	"_ATFILE_SOURCE 1"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF882:
	.string	"UART3_TX_PINSOURCE GPIO_PinSource10"
.LASF838:
	.string	"LED0_PIN_2 Pin_8"
.LASF553:
	.string	"_BITS_TYPESIZES_H 1"
.LASF1242:
	.string	"MSP_SET_RC_DEADBAND 218"
.LASF425:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF773:
	.string	"__MATHCALL"
.LASF2049:
	.string	"candidate"
.LASF945:
	.string	"ARRAYEND(x) (&(x)[ARRAYLEN(x)])"
.LASF1281:
	.string	"CHANNEL_VALUE_TO_STEP(channelValue) ((constrain((channelValue), CHANNEL_RANGE_MIN, CHANNEL_RANGE_MAX) - CHANNEL_RANGE_MIN) / 25)"
.LASF452:
	.string	"UINT16_C(c) c"
.LASF693:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF708:
	.string	"_ALLOCA_H 1"
.LASF508:
	.string	"__WCLONE 0x80000000"
.LASF438:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF813:
	.string	"islessgreater(x,y) __builtin_islessgreater(x, y)"
.LASF1780:
	.string	"serialConfig_s"
.LASF1783:
	.string	"serialConfig_t"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF1628:
	.string	"BOXLEDLOW"
.LASF1022:
	.string	"PG_PROFILE_SELECTION 23"
.LASF1991:
	.string	"throttle_correction_value"
.LASF2069:
	.string	"voltage"
.LASF440:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF2111:
	.string	"flightModeFlags"
.LASF661:
	.string	"__FD_SET(d,set) ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))"
.LASF1202:
	.string	"MSP_COMP_GPS 107"
.LASF1388:
	.string	"FAT_FILE_ATTRIBUTE_DIRECTORY 0x10"
.LASF890:
	.string	"I2C2_SCL_CLK_SOURCE RCC_AHBPeriph_GPIOA"
.LASF664:
	.string	"_SIGSET_H_types 1"
.LASF1295:
	.string	"EXPO_MAX 100"
.LASF938:
	.string	"_BSD_PTRDIFF_T_ "
.LASF484:
	.string	"__WCHAR_T "
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF559:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF1574:
	.string	"channelCount"
.LASF515:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF1609:
	.string	"tpa_breakpoint"
.LASF1889:
	.string	"mixerMode"
.LASF1541:
	.string	"serialPortVTable"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF293:
	.string	"_POSIX_SOURCE 1"
.LASF1865:
	.string	"BATTERY_CRITICAL"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF374:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF676:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF1178:
	.string	"MSP_SET_VTX_CONFIG 89"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF1925:
	.string	"deadband3d_high"
.LASF1515:
	.string	"portMode_t"
.LASF239:
	.string	"__unix__ 1"
.LASF953:
	.string	"BITCOUNT(x) (((BX_(x)+(BX_(x)>>4)) & 0x0F0F0F0F) % 255)"
.LASF921:
	.string	"BINDPLUG_PORT GPIOB"
.LASF1473:
	.string	"long long unsigned int"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF1595:
	.string	"offset"
.LASF1885:
	.string	"gyroMovementCalibrationThreshold"
.LASF1987:
	.string	"max_angle_inclination"
.LASF620:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))"
.LASF1980:
	.string	"imuConfig_s"
.LASF1988:
	.string	"imuConfig_t"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF1788:
	.string	"specialColorIndexes_t"
.LASF1490:
	.string	"pgn_t"
.LASF1585:
	.string	"MESSAGE_RECEIVED"
.LASF2124:
	.string	"boardAlignment_System"
.LASF1488:
	.string	"sbuf_s"
.LASF1489:
	.string	"sbuf_t"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF1064:
	.string	"PWM_RANGE_MIN 1000"
.LASF1985:
	.string	"dcm_ki"
.LASF873:
	.string	"UART2_RX_PIN GPIO_Pin_3"
.LASF723:
	.string	"__DECL_SIMD_sincos "
.LASF1984:
	.string	"dcm_kp"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF1318:
	.string	"LON 1"
.LASF857:
	.string	"MAG "
.LASF325:
	.string	"__BEGIN_DECLS "
.LASF889:
	.string	"I2C2_SCL_PIN_SOURCE GPIO_PinSource9"
.LASF363:
	.string	"__restrict_arr __restrict"
.LASF958:
	.string	"LOG2_64BIT(v) (32*((v)/2L>>31 > 0) + LOG2_32BIT((v)*1L >>16*((v)/2L>>31 > 0) >>16*((v)/2L>>31 > 0)))"
.LASF259:
	.string	"_STDINT_H 1"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF1867:
	.string	"rollAndPitchTrims_s"
.LASF1871:
	.string	"rollAndPitchTrims_t"
.LASF1870:
	.string	"rollAndPitchTrims_u"
.LASF831:
	.string	"LED0_GPIO GPIOB"
.LASF1525:
	.string	"serialReceiveCallbackPtr"
.LASF2028:
	.string	"rcControlsConfig"
.LASF1381:
	.string	"FAT_MAXIMUM_FILESIZE 0xFFFFFFFF"
.LASF1262:
	.string	"MSP_PORT_INBUF_SIZE 64"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF466:
	.string	"_T_SIZE "
.LASF299:
	.string	"__USE_POSIX199506 1"
.LASF1077:
	.string	"SERIALRX_PROVIDER_COUNT (SERIALRX_PROVIDER_MAX + 1)"
.LASF872:
	.string	"UART2_TX_PIN GPIO_Pin_2"
.LASF643:
	.string	"__need_time_t "
.LASF1907:
	.string	"MIXER_HEX6H"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF2118:
	.string	"ledConfigs_SystemArray"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF364:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF1004:
	.string	"PG_BLACKBOX_CONFIG 5"
.LASF514:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF881:
	.string	"UART3_GPIO GPIOB"
.LASF1899:
	.string	"MIXER_HEX6X"
.LASF1429:
	.string	"PID_MAX_TOTAL_PID 1000"
.LASF920:
	.string	"HARDWARE_BIND_PLUG "
.LASF1437:
	.string	"DEGREES_TO_RADIANS(angle) ((angle) * 0.0174532925f)"
.LASF1480:
	.string	"AI_ROLL"
.LASF301:
	.string	"__USE_XOPEN2K8 1"
.LASF1662:
	.string	"auxChannelIndex"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF1409:
	.string	"BARO_MAX BARO_BMP280"
.LASF730:
	.string	"__DECL_SIMD_expf "
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF1219:
	.string	"MSP_RC_DEADBAND 125"
.LASF823:
	.string	"DEBUG16_VALUE_COUNT 4"
.LASF314:
	.string	"__LEAF , __leaf__"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF1008:
	.string	"PG_SENSOR_TRIMS 9"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF678:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF366:
	.string	"__WORDSIZE 64"
.LASF586:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF1088:
	.string	"RX_FAILSAFE_MODE_COUNT 3"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF884:
	.string	"USE_I2C "
.LASF639:
	.string	"__ssize_t_defined "
.LASF1997:
	.string	"failsafe_kill_switch"
.LASF302:
	.string	"_ATFILE_SOURCE"
.LASF1483:
	.string	"RGB_RED"
.LASF2056:
	.string	"boxEnabledMask"
.LASF1355:
	.string	"LED_MOV_PARAMS(param) ((param) << LED_PARAMS_OFFSET)"
.LASF2087:
	.string	"U_ID_0"
.LASF1570:
	.string	"rx_min_usec"
.LASF2089:
	.string	"U_ID_2"
.LASF1704:
	.string	"GTUNE_MODE"
.LASF231:
	.string	"__FXSR__ 1"
.LASF682:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF267:
	.string	"__USE_POSIX199309"
.LASF511:
	.string	"P_PID"
.LASF1526:
	.string	"serialPort_s"
.LASF1552:
	.string	"serialPort_t"
.LASF915:
	.string	"USE_QUAD_MIXER_ONLY "
.LASF2061:
	.string	"mspBoxIdx"
.LASF1417:
	.string	"SERVO_PLANE_INDEX_MAX SERVO_FLAPS"
.LASF1372:
	.string	"FLASHFS_WRITE_BUFFER_AUTO_FLUSH_LEN 64"
.LASF1602:
	.string	"rcRate8"
.LASF1544:
	.string	"serialTotalTxFree"
.LASF1879:
	.string	"acc_unarmedcal"
.LASF1277:
	.string	"MAX_MODE_ACTIVATION_CONDITION_COUNT 20"
.LASF1685:
	.string	"adjustmentIndex"
.LASF819:
	.string	"INLINE_UNIT_TESTED inline"
.LASF924:
	.string	"TARGET_IO_PORTB 0xffff"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF829:
	.string	"HW_PIN Pin_2"
.LASF710:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF1376:
	.string	"MBR_PARTITION_TYPE_FAT16_LBA 0x0E"
.LASF2003:
	.string	"gps_lpf"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF892:
	.string	"I2C2_SDA_GPIO_AF GPIO_AF_4"
.LASF437:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF911:
	.string	"DEFAULT_RX_FEATURE FEATURE_RX_SERIAL"
.LASF255:
	.string	"bool _Bool"
.LASF939:
	.string	"___int_ptrdiff_t_h "
.LASF1611:
	.string	"rateProfileSelection_s"
.LASF1613:
	.string	"rateProfileSelection_t"
.LASF959:
	.string	"container_of(ptr,type,member) ( __extension__ ({ const typeof( ((type *)0)->member ) *__mptr = (ptr); (type *)( (char *)__mptr - offsetof(type,member) );}))"
.LASF2149:
	.string	"throttleCorrectionConfig_ProfileCurrent"
.LASF1191:
	.string	"MSP_OSD_VIDEO_STATUS 182"
.LASF1139:
	.string	"MSP_SET_LED_STRIP_CONFIG 49"
.LASF583:
	.string	"__TIMER_T_TYPE void *"
.LASF1921:
	.string	"yaw_jump_prevention_limit"
.LASF815:
	.string	"UNUSED(x) (void)(x)"
.LASF1383:
	.string	"FAT16_MAX_CLUSTERS 65524"
.LASF1054:
	.string	"PG_OSD_ELEMENT_CONFIG 32770"
.LASF721:
	.string	"__DECL_SIMD_sinf "
.LASF738:
	.string	"INFINITY (__builtin_inff())"
.LASF1093:
	.string	"API_VERSION_LENGTH 2"
.LASF908:
	.string	"ADC0_CHANNEL ADC_Channel_1"
.LASF717:
	.string	"__DECL_SIMD_cos "
.LASF896:
	.string	"USE_SPI "
.LASF1331:
	.string	"LED_MODE_COUNT 6"
.LASF2055:
	.string	"packFlightModeFlags"
.LASF526:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1402:
	.string	"VBAT_SCALE_MIN 0"
.LASF596:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF1243:
	.string	"MSP_SET_RESET_CURR_PID 219"
.LASF1037:
	.string	"PG_BAROMETER_CONFIG 38"
.LASF734:
	.string	"__DECL_SIMD_powl "
.LASF308:
	.string	"__GNU_LIBRARY__ 6"
.LASF641:
	.string	"__key_t_defined "
.LASF1472:
	.string	"long long int"
.LASF740:
	.string	"_MATH_H_MATHDEF 1"
.LASF309:
	.string	"__GLIBC__ 2"
.LASF445:
	.string	"WINT_MIN (0u)"
.LASF1592:
	.string	"port"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF2160:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF1106:
	.string	"CAP_BASEFLIGHT_CONFIG ((uint32_t)1 << 30)"
.LASF1724:
	.string	"FEATURE_3D"
.LASF1481:
	.string	"AI_PITCH"
.LASF625:
	.string	"EXIT_FAILURE 1"
.LASF1294:
	.string	"EXPO_MIN 0"
.LASF1981:
	.string	"looptime"
.LASF925:
	.string	"TARGET_IO_PORTC 0xffff"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF880:
	.string	"UART3_GPIO_AF GPIO_AF_7"
.LASF1041:
	.string	"PG_SERVO_PROFILE 42"
.LASF2125:
	.string	"sensorSelectionConfig_System"
.LASF821:
	.string	"REQUIRE_CC_ARM_PRINTF_SUPPORT "
.LASF1180:
	.string	"MSP_SET_PID_ADVANCED_CONFIG 91"
.LASF971:
	.string	"ABS(x) ((x) > 0 ? (x) : -(x))"
.LASF1666:
	.string	"modeActivationConditions"
.LASF1324:
	.string	"GPS_PACKET_LOG_ENTRY_COUNT 21"
.LASF1559:
	.string	"rcmap"
.LASF1813:
	.string	"SENSOR_GYRO"
.LASF1839:
	.string	"sensorSelectionConfig_t"
.LASF509:
	.string	"__ENUM_IDTYPE_T 1"
.LASF617:
	.string	"WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF502:
	.string	"WSTOPPED 2"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF703:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF1322:
	.string	"GPS_BAUDRATE_MAX GPS_BAUDRATE_9600"
.LASF1453:
	.string	"BUILD_DATE_LENGTH 11"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF1589:
	.string	"MSP_MODE_CLIENT"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF2023:
	.string	"boxId"
.LASF1387:
	.string	"FAT_FILE_ATTRIBUTE_VOLUME_ID 0x08"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF1965:
	.string	"PIDNAVR"
.LASF761:
	.string	"_Mfloat_ float"
.LASF2038:
	.string	"voltageMeterConfig"
.LASF2044:
	.string	"pidProfile"
.LASF571:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF229:
	.string	"__SSE__ 1"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF1291:
	.string	"PID_F_MAX 100"
.LASF1265:
	.string	"ROL_LO (1 << (2 * ROLL))"
.LASF1672:
	.string	"alt_hold_fast_change"
.LASF2152:
	.string	"airplaneConfig_System"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF1371:
	.string	"FLASHFS_WRITE_BUFFER_USABLE (FLASHFS_WRITE_BUFFER_SIZE - 1)"
.LASF808:
	.string	"M_SQRT1_2 0.70710678118654752440"
.LASF737:
	.string	"HUGE_VALL (__builtin_huge_vall())"
.LASF864:
	.string	"SERIAL_PORT_COUNT 2"
.LASF610:
	.string	"w_retcode __wait_terminated.__w_retcode"
.LASF1983:
	.string	"gyroSyncDenominator"
.LASF948:
	.string	"STR_HELPER(x) #x"
.LASF2143:
	.string	"customServoMixer_SystemArray"
.LASF705:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF1321:
	.string	"SBAS_MODE_MAX SBAS_GAGAN"
.LASF352:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF1129:
	.string	"MSP_SET_BOARD_ALIGNMENT 39"
.LASF1979:
	.string	"attitudeEulerAngles_t"
.LASF1303:
	.string	"DISABLE_FLIGHT_MODE(mask) disableFlightMode(mask)"
.LASF432:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF871:
	.string	"UART1_RX_PINSOURCE GPIO_PinSource7"
.LASF1103:
	.string	"BOARD_IDENTIFIER_LENGTH 4"
.LASF1204:
	.string	"MSP_ALTITUDE 109"
.LASF439:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF849:
	.string	"GYRO_MPU6050_ALIGN CW270_DEG"
.LASF1969:
	.string	"PID_ITEM_COUNT"
.LASF576:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1801:
	.string	"yawDegrees"
.LASF607:
	.string	"le64toh(x) (x)"
.LASF1112:
	.string	"CAP_FLAPS ((uint32_t)1 << 3)"
.LASF1854:
	.string	"vbatresdivmultiplier"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF1133:
	.string	"MSP_SET_MIXER 43"
.LASF840:
	.string	"LED1_GPIO_2 GPIOB"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF1723:
	.string	"FEATURE_AMPERAGE_METER"
.LASF1098:
	.string	"INAV_IDENTIFIER \"INAV\""
.LASF1386:
	.string	"FAT_FILE_ATTRIBUTE_SYSTEM 0x04"
.LASF1379:
	.string	"FAT_DIRECTORY_ENTRY_SIZE 32"
.LASF573:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF2018:
	.string	"mspServerConfig_s"
.LASF1877:
	.string	"accz_lpf_cutoff"
.LASF1119:
	.string	"MSP_BUILD_INFO 5"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF1012:
	.string	"PG_SERIAL_CONFIG 13"
.LASF1314:
	.string	"TASK_SELF -1"
.LASF1542:
	.string	"serialWrite"
.LASF1069:
	.string	"RXFAIL_STEP_TO_CHANNEL_VALUE(step) (PWM_PULSE_MIN + 25 * step)"
.LASF1040:
	.string	"PG_MODE_ACTIVATION_PROFILE 41"
.LASF1150:
	.string	"MSP_SET_PID_CONTROLLER 60"
.LASF566:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF546:
	.string	"__SWORD_TYPE long int"
.LASF982:
	.string	"PG_FOREACH_PROFILE(_name) PG_FOREACH(_name) if(pgIsSystem(_name)) continue; else"
.LASF913:
	.string	"SERIAL_RX "
.LASF1153:
	.string	"MSP_RX_MAP 64"
.LASF653:
	.string	"__need_timer_t"
.LASF1673:
	.string	"yaw_control_direction"
.LASF1052:
	.string	"PG_OSD_FONT_CONFIG 32768"
.LASF1066:
	.string	"PWM_RANGE_MIDDLE (PWM_RANGE_MIN + ((PWM_RANGE_MAX - PWM_RANGE_MIN) / 2))"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF862:
	.string	"USB_IO "
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF462:
	.string	"__SIZE_T__ "
.LASF1390:
	.string	"FAT_FILENAME_LENGTH 11"
.LASF2134:
	.string	"magADC"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF562:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF2098:
	.string	"failsafeChannelConfigs_SystemArray"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF1420:
	.string	"SERVO_SINGLECOPTER_INDEX_MIN SERVO_SINGLECOPTER_1"
.LASF1042:
	.string	"PG_FAILSAFE_CHANNEL_CONFIG 43"
.LASF1136:
	.string	"MSP_LED_COLORS 46"
.LASF336:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF322:
	.string	"__STRING(x) #x"
.LASF1362:
	.string	"LED_PARAMS_MASK LED_MOV_PARAMS(((1 << LED_PARAMS_BITCNT) - 1))"
.LASF1932:
	.string	"INPUT_RC_ROLL"
.LASF1924:
	.string	"deadband3d_low"
.LASF1280:
	.string	"MODE_STEP_TO_CHANNEL_VALUE(step) (CHANNEL_RANGE_MIN + 25 * (step))"
.LASF269:
	.string	"__USE_XOPEN"
.LASF955:
	.string	"LOG2_8BIT(v) (8 - 90/(((v)/4+14)|1) - 2/((v)/2+1))"
.LASF962:
	.string	"HSV_SATURATION_MAX 255"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF306:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF1116:
	.string	"MSP_FC_VARIANT 2"
.LASF1348:
	.string	"LED_FLAG_OVERLAY_MASK ((1 << LED_OVERLAY_BITCNT) - 1)"
.LASF310:
	.string	"__GLIBC_MINOR__ 23"
.LASF1167:
	.string	"MSP_SET_RXFAIL_CONFIG 78"
.LASF1363:
	.string	"LED_FLAG_OVERLAY(id) (1 << (id))"
.LASF1468:
	.string	"unsigned int"
.LASF1803:
	.string	"SENSOR_INDEX_GYRO"
.LASF1412:
	.string	"YAW_JUMP_PREVENTION_LIMIT_LOW 80"
.LASF1333:
	.string	"LED_BASEFUNCTION_COUNT 7"
.LASF768:
	.string	"_Mdouble_ _Mlong_double_"
.LASF2013:
	.string	"blackboxConfig_s"
.LASF2017:
	.string	"blackboxConfig_t"
.LASF1224:
	.string	"MSP_BATTERY_STATES 130"
.LASF1425:
	.string	"MAX_SERVO_SPEED UINT8_MAX"
.LASF2136:
	.string	"gyroConfig_System"
.LASF347:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF1365:
	.string	"LED_X_BIT_OFFSET 4"
.LASF1283:
	.string	"MAX_MODE_RANGE_STEP ((CHANNEL_RANGE_MAX - CHANNEL_RANGE_MIN) / 25)"
.LASF457:
	.string	"_GCC_WRAP_STDINT_H "
.LASF597:
	.string	"htole16(x) (x)"
.LASF530:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF523:
	.string	"__W_CONTINUED 0xffff"
.LASF2085:
	.string	"pidProfile_Registry"
.LASF1625:
	.string	"BOXPASSTHRU"
.LASF670:
	.string	"_STRUCT_TIMEVAL 1"
.LASF554:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF2052:
	.string	"serializeBoxNamesReply"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF744:
	.string	"__MATHCALL_VEC(function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHCALL (function, suffix, args)"
.LASF1460:
	.string	"short int"
.LASF2080:
	.string	"flightControllerIdentifier"
.LASF2155:
	.string	"shortGitRevision"
.LASF1377:
	.string	"FAT_VOLUME_ID_SIGNATURE_1 0x55"
.LASF1669:
	.string	"deadband"
.LASF2142:
	.string	"inputSource_e"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF1946:
	.string	"rate"
.LASF1622:
	.string	"BOXCAMTRIG"
.LASF16:
	.string	"_LP64 1"
.LASF2070:
	.string	"profile"
.LASF2095:
	.string	"profileSelection_System"
.LASF1011:
	.string	"PG_CONTROL_RATE_PROFILES 12"
.LASF2071:
	.string	"frame"
.LASF1738:
	.string	"servoCenterPulse"
.LASF1701:
	.string	"PASSTHRU_MODE"
.LASF2075:
	.string	"disarmed"
.LASF1080:
	.string	"MAX_SUPPORTED_RC_CHANNEL_COUNT (18)"
.LASF2004:
	.string	"nav_slew_rate"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF1192:
	.string	"MSP_OSD_ELEMENT_SUMMARY 183"
.LASF5:
	.string	"__GNUC__ 5"
.LASF1298:
	.string	"MAX_ADJUSTMENT_RANGE_COUNT 12"
.LASF243:
	.string	"DEBUG 1"
.LASF1966:
	.string	"PIDLEVEL"
.LASF1338:
	.string	"LED_OVERLAY_OFFSET 12"
.LASF614:
	.string	"__WAIT_STATUS_DEFN int *"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF1823:
	.string	"CW180_DEG"
.LASF1143:
	.string	"MSP_SET_ADJUSTMENT_RANGE 53"
.LASF370:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF1530:
	.string	"options"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF1426:
	.string	"MAX_SERVO_BOXES 3"
.LASF1207:
	.string	"MSP_PID 112"
.LASF290:
	.string	"__USE_ISOC95 1"
.LASF796:
	.string	"M_E 2.7182818284590452354"
.LASF1956:
	.string	"servoProfile_s"
.LASF1958:
	.string	"servoProfile_t"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF1786:
	.string	"modeColorIndexes_t"
.LASF1222:
	.string	"MSP_VOLTAGE_METERS 128"
.LASF1014:
	.string	"PG_GTUNE_CONFIG 15"
.LASF749:
	.string	"__MATHDECLX(type,function,suffix,args,attrib) __MATHDECL_1(type, function,suffix, args) __attribute__ (attrib); __MATHDECL_1(type, __CONCAT(__,function),suffix, args) __attribute__ (attrib)"
.LASF1173:
	.string	"MSP_OSD_CONFIG 84"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
