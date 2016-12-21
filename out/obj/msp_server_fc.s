	.file	"msp_server_fc.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed msp_server_fc.i -mtune=generic
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
	.comm	featureConfig_System,4,4
	.comm	profileSelection_System,1,1
	.comm	rxConfig_System,26,16
	.comm	armingConfig_System,4,1
	.comm	motorAndServoConfig_System,12,8
	.comm	gpsConfig_System,16,16
	.comm	serialConfig_System,28,16
	.comm	specialColors_System,11,8
	.comm	transponderConfig_System,6,1
	.comm	telemetryConfig_System,3,1
	.comm	boardAlignment_System,6,1
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.comm	batteryConfig_System,8,8
	.comm	gyroConfig_System,4,2
	.comm	mixerConfig_System,6,2
	.section	.text.mixerConfig,"ax",@progbits
	.type	mixerConfig, @function
mixerConfig:
.LFB59:
	.file 1 "./src/main/flight/mixer.h"
	.loc 1 92 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 92 0
	movl	$mixerConfig_System, %eax	#, D.7007
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE59:
	.size	mixerConfig, .-mixerConfig
	.comm	motor3DConfig_System,6,2
	.comm	inputSource_e,4,4
	.comm	imuConfig_System,12,8
	.comm	failsafeConfig_System,8,8
	.comm	airplaneConfig_System,1,1
	.comm	blackboxConfig_System,3,1
	.comm	mspServerConfig_System,1,1
	.section	.bss.enabledSensors,"aw",@nobits
	.align 4
	.type	enabledSensors, @object
	.size	enabledSensors, 4
enabledSensors:
	.zero	4
	.section	.text.rcModeIsActive,"ax",@progbits
	.globl	rcModeIsActive
	.type	rcModeIsActive, @function
rcModeIsActive:
.LFB72:
	.file 2 "./src/main/fc/msp_server_fc.h"
	.loc 2 23 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# modeId, modeId
	.loc 2 24 0
	movl	$0, %eax	#, D.7008
	.loc 2 25 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE72:
	.size	rcModeIsActive, .-rcModeIsActive
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
	.section	.text.findBoxByBoxId,"ax",@progbits
	.type	findBoxByBoxId, @function
findBoxByBoxId:
.LFB73:
	.file 3 "src/main/fc/msp_server_fc.c"
	.loc 3 222 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# boxId, tmp90
	movb	%al, -20(%rbp)	# tmp90, boxId
.LBB2:
	.loc 3 223 0
	movl	$0, -12(%rbp)	#, i
	jmp	.L6	#
.L9:
.LBB3:
	.loc 3 224 0
	movl	-12(%rbp), %eax	# i, tmp91
	salq	$4, %rax	#, tmp92
	addq	$boxes, %rax	#, tmp93
	movq	%rax, -8(%rbp)	# tmp93, candidate
	.loc 3 225 0
	movq	-8(%rbp), %rax	# candidate, tmp94
	movzbl	8(%rax), %eax	# candidate_4->boxId, D.7040
	cmpb	-20(%rbp), %al	# boxId, D.7040
	jne	.L7	#,
	.loc 3 226 0
	movq	-8(%rbp), %rax	# candidate, D.7039
	jmp	.L8	#
.L7:
.LBE3:
	.loc 3 223 0 discriminator 2
	addl	$1, -12(%rbp)	#, i
.L6:
	.loc 3 223 0 is_stmt 0 discriminator 1
	cmpl	$27, -12(%rbp)	#, i
	jbe	.L9	#,
.LBE2:
	.loc 3 229 0 is_stmt 1
	movl	$0, %eax	#, D.7039
.L8:
	.loc 3 230 0
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
	.loc 3 233 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, %eax	# permanentId, tmp90
	movb	%al, -20(%rbp)	# tmp90, permanentId
.LBB4:
	.loc 3 234 0
	movl	$0, -12(%rbp)	#, i
	jmp	.L11	#
.L14:
.LBB5:
	.loc 3 235 0
	movl	-12(%rbp), %eax	# i, tmp91
	salq	$4, %rax	#, tmp92
	addq	$boxes, %rax	#, tmp93
	movq	%rax, -8(%rbp)	# tmp93, candidate
	.loc 3 236 0
	movq	-8(%rbp), %rax	# candidate, tmp94
	movzbl	9(%rax), %eax	# candidate_4->permanentId, D.7042
	cmpb	-20(%rbp), %al	# permanentId, D.7042
	jne	.L12	#,
	.loc 3 237 0
	movq	-8(%rbp), %rax	# candidate, D.7041
	jmp	.L13	#
.L12:
.LBE5:
	.loc 3 234 0 discriminator 2
	addl	$1, -12(%rbp)	#, i
.L11:
	.loc 3 234 0 is_stmt 0 discriminator 1
	cmpl	$27, -12(%rbp)	#, i
	jbe	.L14	#,
.LBE4:
	.loc 3 240 0 is_stmt 1
	movl	$0, %eax	#, D.7041
.L13:
	.loc 3 241 0
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
	.loc 3 244 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# reply, reply
	.loc 3 245 0
	movq	-40(%rbp), %rax	# reply, tmp94
	movq	%rax, -16(%rbp)	# tmp94, dst
.LBB6:
	.loc 3 246 0
	movl	$0, -20(%rbp)	#, i
	jmp	.L16	#
.L19:
.LBB7:
	.loc 3 247 0
	movl	-20(%rbp), %eax	# i, tmp95
	movl	$1, %edx	#, tmp96
	movl	%eax, %ecx	# tmp95, tmp103
	sall	%cl, %edx	# tmp103, D.7043
	movl	%edx, %eax	# D.7043, D.7043
	movl	%eax, %edx	# D.7043, D.7044
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.7044
	andl	%edx, %eax	# D.7044, D.7044
	testl	%eax, %eax	# D.7044
	je	.L20	#,
	.loc 3 249 0
	movl	-20(%rbp), %eax	# i, tmp97
	movzbl	%al, %eax	# D.7045, D.7043
	movl	%eax, %edi	# D.7043,
	call	findBoxByBoxId	#
	movq	%rax, -8(%rbp)	# tmp98, box
	.loc 3 250 0
	movq	-8(%rbp), %rax	# box, tmp99
	movq	(%rax), %rdx	# box_15->boxName, D.7046
	movq	-16(%rbp), %rax	# dst, tmp100
	movq	%rdx, %rsi	# D.7046,
	movq	%rax, %rdi	# tmp100,
	call	sbufWriteString	#
	.loc 3 251 0
	movq	-16(%rbp), %rax	# dst, tmp101
	movl	$59, %esi	#,
	movq	%rax, %rdi	# tmp101,
	call	sbufWriteU8	#
	jmp	.L18	#
.L20:
	.loc 3 248 0
	nop
.L18:
.LBE7:
	.loc 3 246 0 discriminator 2
	addl	$1, -20(%rbp)	#, i
.L16:
	.loc 3 246 0 is_stmt 0 discriminator 1
	cmpl	$27, -20(%rbp)	#, i
	jle	.L19	#,
.LBE6:
	.loc 3 253 0 is_stmt 1
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
	.loc 3 256 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# reply, reply
	.loc 3 257 0
	movq	-40(%rbp), %rax	# reply, tmp95
	movq	%rax, -16(%rbp)	# tmp95, dst
.LBB8:
	.loc 3 258 0
	movl	$0, -20(%rbp)	#, i
	jmp	.L22	#
.L25:
.LBB9:
	.loc 3 259 0
	movl	-20(%rbp), %eax	# i, tmp96
	movl	$1, %edx	#, tmp97
	movl	%eax, %ecx	# tmp96, tmp103
	sall	%cl, %edx	# tmp103, D.7047
	movl	%edx, %eax	# D.7047, D.7047
	movl	%eax, %edx	# D.7047, D.7048
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.7048
	andl	%edx, %eax	# D.7048, D.7048
	testl	%eax, %eax	# D.7048
	je	.L26	#,
	.loc 3 261 0
	movl	-20(%rbp), %eax	# i, tmp98
	movzbl	%al, %eax	# D.7049, D.7047
	movl	%eax, %edi	# D.7047,
	call	findBoxByBoxId	#
	movq	%rax, -8(%rbp)	# tmp99, box
	.loc 3 262 0
	movq	-8(%rbp), %rax	# box, tmp100
	movzbl	9(%rax), %eax	# box_15->permanentId, D.7049
	movzbl	%al, %edx	# D.7049, D.7047
	movq	-16(%rbp), %rax	# dst, tmp101
	movl	%edx, %esi	# D.7047,
	movq	%rax, %rdi	# tmp101,
	call	sbufWriteU8	#
	jmp	.L24	#
.L26:
	.loc 3 260 0
	nop
.L24:
.LBE9:
	.loc 3 258 0 discriminator 2
	addl	$1, -20(%rbp)	#, i
.L22:
	.loc 3 258 0 is_stmt 0 discriminator 1
	cmpl	$27, -20(%rbp)	#, i
	jle	.L25	#,
.LBE8:
	.loc 3 264 0 is_stmt 1
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
	.loc 3 267 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 3 268 0
	movl	$0, -8(%rbp)	#, ena
	.loc 3 270 0
	orl	$1, -8(%rbp)	#, ena
	.loc 3 273 0
	movl	$2, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.7050
	je	.L28	#,
	.loc 3 274 0
	orl	$2, -8(%rbp)	#, ena
	.loc 3 275 0
	orl	$4, -8(%rbp)	#, ena
.L28:
	.loc 3 284 0
	orl	$134217728, -8(%rbp)	#, ena
	.loc 3 286 0
	movl	$2, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.7050
	jne	.L29	#,
	.loc 3 286 0 is_stmt 0 discriminator 1
	movl	$8, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.7050
	je	.L30	#,
.L29:
	.loc 3 287 0 is_stmt 1
	orl	$16, -8(%rbp)	#, ena
	.loc 3 288 0
	orl	$32, -8(%rbp)	#, ena
	.loc 3 289 0
	orl	$64, -8(%rbp)	#, ena
.L30:
	.loc 3 293 0
	movl	$32, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7050
	je	.L31	#,
	.loc 3 294 0
	orl	$128, -8(%rbp)	#, ena
.L31:
	.loc 3 303 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _36->mixerMode, D.7052
	cmpb	$8, %al	#, D.7052
	je	.L32	#,
	.loc 3 304 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _39->mixerMode, D.7052
	cmpb	$14, %al	#, D.7052
	je	.L32	#,
	.loc 3 305 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _42->mixerMode, D.7052
	cmpb	$24, %al	#, D.7052
	jne	.L33	#,
.L32:
	.loc 3 306 0
	orl	$2048, -8(%rbp)	#, ena
.L33:
	.loc 3 308 0
	orl	$4096, -8(%rbp)	#, ena
	.loc 3 317 0
	movl	$4, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7050
	je	.L34	#,
	.loc 3 318 0
	orl	$65536, -8(%rbp)	#, ena
.L34:
	.loc 3 320 0
	orl	$262144, -8(%rbp)	#, ena
	.loc 3 328 0
	movl	$512, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7050
	je	.L35	#,
	.loc 3 329 0
	orl	$2097152, -8(%rbp)	#, ena
.L35:
	.loc 3 347 0
	movl	$256, %edi	#,
	call	feature	#
	testb	%al, %al	# D.7050
	je	.L36	#,
	.loc 3 348 0
	orl	$67108864, -8(%rbp)	#, ena
.L36:
	.loc 3 352 0
	orl	$1048576, -8(%rbp)	#, ena
.LBB10:
	.loc 3 356 0
	movl	$0, -4(%rbp)	#, boxId
	jmp	.L37	#
.L39:
	.loc 3 357 0
	movl	-4(%rbp), %eax	# boxId, tmp109
	movl	$1, %edx	#, tmp110
	movl	%eax, %ecx	# tmp109, tmp116
	sall	%cl, %edx	# tmp116, D.7053
	movl	%edx, %eax	# D.7053, D.7053
	andl	-8(%rbp), %eax	# ena, D.7054
	testl	%eax, %eax	# D.7054
	je	.L38	#,
	.loc 3 358 0
	movl	-4(%rbp), %eax	# boxId, tmp111
	movzbl	%al, %eax	# D.7052, D.7053
	movl	%eax, %edi	# D.7053,
	call	findBoxByBoxId	#
	testq	%rax, %rax	# D.7055
	jne	.L38	#,
	.loc 3 359 0
	movl	-4(%rbp), %eax	# boxId, tmp112
	movl	$1, %edx	#, tmp113
	movl	%eax, %ecx	# tmp112, tmp118
	sall	%cl, %edx	# tmp118, D.7053
	movl	%edx, %eax	# D.7053, D.7053
	notl	%eax	# D.7053
	andl	%eax, -8(%rbp)	# D.7054, ena
.L38:
	.loc 3 356 0 discriminator 2
	addl	$1, -4(%rbp)	#, boxId
.L37:
	.loc 3 356 0 is_stmt 0 discriminator 1
	cmpl	$27, -4(%rbp)	#, boxId
	jbe	.L39	#,
.LBE10:
	.loc 3 360 0 is_stmt 1
	movl	-8(%rbp), %eax	# ena, tmp114
	movl	%eax, activeBoxIds(%rip)	# tmp114, activeBoxIds
	.loc 3 361 0
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
	.loc 3 366 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	.loc 3 371 0
	movl	$0, -32(%rbp)	#, boxEnabledMask
	.loc 3 375 0
	movl	$-2049, -8(%rbp)	#, flightModeCopyMask
.LBB11:
	.loc 3 376 0
	movl	$0, -28(%rbp)	#, i
	jmp	.L41	#
.L45:
	.loc 3 377 0
	movl	-28(%rbp), %eax	# i, tmp119
	movzbl	flightMode_boxId_map.6744(%rax), %eax	# flightMode_boxId_map, D.7056
	cmpb	$-1, %al	#, D.7056
	je	.L57	#,
	.loc 3 379 0
	movl	-28(%rbp), %eax	# i, tmp120
	movl	$1, %edx	#, tmp121
	movl	%eax, %ecx	# tmp120, tmp138
	sall	%cl, %edx	# tmp138, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	andl	-8(%rbp), %eax	# flightModeCopyMask, D.7058
	testl	%eax, %eax	# D.7058
	je	.L58	#,
	.loc 3 381 0
	movzwl	flightModeFlags(%rip), %eax	# flightModeFlags, D.7059
	movzwl	%ax, %edx	# D.7059, D.7057
	movl	-28(%rbp), %eax	# i, tmp122
	movl	%eax, %ecx	# tmp122, tmp140
	sarl	%cl, %edx	# tmp140, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	andl	$1, %eax	#, D.7057
	testl	%eax, %eax	# D.7057
	je	.L43	#,
	.loc 3 382 0
	movl	-28(%rbp), %eax	# i, tmp123
	movzbl	flightMode_boxId_map.6744(%rax), %eax	# flightMode_boxId_map, D.7056
	movsbl	%al, %eax	# D.7056, D.7057
	movl	$1, %edx	#, tmp124
	movl	%eax, %ecx	# D.7057, tmp142
	sall	%cl, %edx	# tmp142, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	orl	%eax, -32(%rbp)	# D.7058, boxEnabledMask
	jmp	.L43	#
.L57:
	.loc 3 378 0
	nop
	jmp	.L43	#
.L58:
	.loc 3 380 0
	nop
.L43:
	.loc 3 376 0 discriminator 2
	addl	$1, -28(%rbp)	#, i
.L41:
	.loc 3 376 0 is_stmt 0 discriminator 1
	cmpl	$11, -28(%rbp)	#, i
	jbe	.L45	#,
.LBE11:
	.loc 3 388 0 is_stmt 1
	movl	$169865664, -4(%rbp)	#, rcModeCopyMask
.LBB12:
	.loc 3 391 0
	movl	$0, -24(%rbp)	#, i
	jmp	.L46	#
.L49:
	.loc 3 392 0
	movl	-24(%rbp), %eax	# i, tmp125
	movl	$1, %edx	#, tmp126
	movl	%eax, %ecx	# tmp125, tmp144
	sall	%cl, %edx	# tmp144, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	andl	-4(%rbp), %eax	# rcModeCopyMask, D.7058
	testl	%eax, %eax	# D.7058
	je	.L59	#,
	.loc 3 394 0
	movl	-24(%rbp), %eax	# i, tmp127
	movl	%eax, %edi	# tmp127,
	call	rcModeIsActive	#
	testb	%al, %al	# D.7060
	je	.L48	#,
	.loc 3 395 0
	movl	-24(%rbp), %eax	# i, tmp128
	movl	$1, %edx	#, tmp129
	movl	%eax, %ecx	# tmp128, tmp146
	sall	%cl, %edx	# tmp146, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	orl	%eax, -32(%rbp)	# D.7058, boxEnabledMask
	jmp	.L48	#
.L59:
	.loc 3 393 0
	nop
.L48:
	.loc 3 391 0 discriminator 2
	addl	$1, -24(%rbp)	#, i
.L46:
	.loc 3 391 0 is_stmt 0 discriminator 1
	cmpl	$31, -24(%rbp)	#, i
	jbe	.L49	#,
.LBE12:
	.loc 3 399 0 is_stmt 1
	movzbl	armingFlags(%rip), %eax	# armingFlags, D.7061
	movzbl	%al, %eax	# D.7061, D.7057
	andl	$4, %eax	#, D.7057
	testl	%eax, %eax	# D.7057
	je	.L50	#,
	.loc 3 400 0
	orl	$1, -32(%rbp)	#, boxEnabledMask
.L50:
	.loc 3 404 0
	movl	$0, -20(%rbp)	#, mspBoxEnabledMask
	.loc 3 405 0
	movl	$0, -16(%rbp)	#, mspBoxIdx
.LBB13:
	.loc 3 406 0
	movl	$0, -12(%rbp)	#, boxId
	jmp	.L51	#
.L55:
	.loc 3 407 0
	movl	-12(%rbp), %eax	# boxId, tmp130
	movl	$1, %edx	#, tmp131
	movl	%eax, %ecx	# tmp130, tmp148
	sall	%cl, %edx	# tmp148, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	movl	%eax, %edx	# D.7057, D.7058
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.7058
	andl	%edx, %eax	# D.7058, D.7058
	testl	%eax, %eax	# D.7058
	je	.L60	#,
	.loc 3 409 0
	movl	-12(%rbp), %eax	# boxId, tmp132
	movl	$1, %edx	#, tmp133
	movl	%eax, %ecx	# tmp132, tmp150
	sall	%cl, %edx	# tmp150, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	andl	-32(%rbp), %eax	# boxEnabledMask, D.7058
	testl	%eax, %eax	# D.7058
	je	.L54	#,
	.loc 3 410 0
	movl	-16(%rbp), %eax	# mspBoxIdx, tmp134
	movl	$1, %edx	#, tmp135
	movl	%eax, %ecx	# tmp134, tmp152
	sall	%cl, %edx	# tmp152, D.7057
	movl	%edx, %eax	# D.7057, D.7057
	orl	%eax, -20(%rbp)	# D.7058, mspBoxEnabledMask
.L54:
	.loc 3 411 0
	addl	$1, -16(%rbp)	#, mspBoxIdx
	jmp	.L53	#
.L60:
	.loc 3 408 0
	nop
.L53:
	.loc 3 406 0 discriminator 2
	addl	$1, -12(%rbp)	#, boxId
.L51:
	.loc 3 406 0 is_stmt 0 discriminator 1
	cmpl	$27, -12(%rbp)	#, boxId
	jbe	.L55	#,
.LBE13:
	.loc 3 413 0 is_stmt 1
	movl	-20(%rbp), %eax	# mspBoxEnabledMask, D.7062
	.loc 3 414 0
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
	.loc 3 417 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# reply, reply
	.loc 3 418 0
	movq	-24(%rbp), %rax	# reply, tmp87
	movq	%rax, -8(%rbp)	# tmp87, dst
	.loc 3 456 0
	movq	-8(%rbp), %rax	# dst, tmp88
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	sbufWriteU8	#
	.loc 3 457 0
	movq	-8(%rbp), %rax	# dst, tmp89
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	sbufWriteU8	#
	.loc 3 458 0
	movq	-8(%rbp), %rax	# dst, tmp90
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	sbufWriteU8	#
	.loc 3 459 0
	movq	-8(%rbp), %rax	# dst, tmp91
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	sbufWriteU32	#
	.loc 3 460 0
	movq	-8(%rbp), %rax	# dst, tmp92
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp92,
	call	sbufWriteU32	#
	.loc 3 462 0
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
	.loc 3 465 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# reply, reply
	.loc 3 466 0
	movq	-24(%rbp), %rax	# reply, tmp87
	movq	%rax, -8(%rbp)	# tmp87, dst
	.loc 3 476 0
	movq	-8(%rbp), %rax	# dst, tmp88
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	sbufWriteU8	#
	.loc 3 477 0
	movq	-8(%rbp), %rax	# dst, tmp89
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	sbufWriteU32	#
	.loc 3 478 0
	movq	-8(%rbp), %rax	# dst, tmp90
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	sbufWriteU32	#
	.loc 3 479 0
	movq	-8(%rbp), %rax	# dst, tmp91
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	sbufWriteU32	#
	.loc 3 481 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE80:
	.size	serializeDataflashSummaryReply, .-serializeDataflashSummaryReply
	.section	.rodata
.LC30:
	.string	"command code: %d\n"
.LC31:
	.string	"MSP_STATUS"
.LC32:
	.string	"MSP_DATAFLASH_SUMMARY"
.LC33:
	.string	"Unknown"
	.section	.text.mspServerCommandHandler,"ax",@progbits
	.globl	mspServerCommandHandler
	.type	mspServerCommandHandler, @function
mspServerCommandHandler:
.LFB81:
	.loc 3 497 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$72, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)	# cmd, cmd
	movq	%rsi, -80(%rbp)	# reply, reply
	.loc 3 499 0
	movq	-80(%rbp), %rax	# reply, tmp148
	movq	%rax, -32(%rbp)	# tmp148, dst
	.loc 3 500 0
	movq	-72(%rbp), %rax	# cmd, tmp149
	movq	%rax, -24(%rbp)	# tmp149, src
	.loc 3 502 0
	movq	-24(%rbp), %rax	# src, tmp150
	movq	%rax, %rdi	# tmp150,
	call	sbufBytesRemaining	#
	movl	%eax, -40(%rbp)	# tmp151, len
	.loc 3 504 0
	movq	-72(%rbp), %rax	# cmd, tmp152
	movzwl	16(%rax), %eax	# cmd_11(D)->cmd, D.7064
	cwtl
	movl	%eax, %esi	# D.7065,
	movl	$.LC30, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 3 505 0
	movq	-72(%rbp), %rax	# cmd, tmp153
	movzwl	16(%rax), %eax	# cmd_11(D)->cmd, D.7064
	cwtl
	cmpl	$5, %eax	#, D.7065
	je	.L65	#,
	cmpl	$5, %eax	#, D.7065
	jg	.L66	#,
	cmpl	$2, %eax	#, D.7065
	je	.L67	#,
	cmpl	$2, %eax	#, D.7065
	jg	.L68	#,
	cmpl	$1, %eax	#, D.7065
	je	.L69	#,
	jmp	.L64	#
.L68:
	cmpl	$3, %eax	#, D.7065
	je	.L70	#,
	cmpl	$4, %eax	#, D.7065
	je	.L71	#,
	jmp	.L64	#
.L66:
	cmpl	$100, %eax	#, D.7065
	je	.L72	#,
	cmpl	$100, %eax	#, D.7065
	jg	.L73	#,
	cmpl	$70, %eax	#, D.7065
	je	.L74	#,
	jmp	.L64	#
.L73:
	cmpl	$101, %eax	#, D.7065
	je	.L75	#,
	cmpl	$102, %eax	#, D.7065
	je	.L76	#,
	jmp	.L64	#
.L69:
	.loc 3 508 0
	movq	-32(%rbp), %rax	# dst, tmp154
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp154,
	call	sbufWriteU8	#
	.loc 3 509 0
	movq	-32(%rbp), %rax	# dst, tmp155
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp155,
	call	sbufWriteU8	#
	.loc 3 510 0
	movq	-32(%rbp), %rax	# dst, tmp156
	movl	$22, %esi	#,
	movq	%rax, %rdi	# tmp156,
	call	sbufWriteU8	#
	.loc 3 511 0
	jmp	.L77	#
.L67:
	.loc 3 514 0
	movl	$.LC0, %ecx	#, D.7066
	movq	-32(%rbp), %rax	# dst, tmp157
	movl	$4, %edx	#,
	movq	%rcx, %rsi	# D.7066,
	movq	%rax, %rdi	# tmp157,
	call	sbufWriteData	#
	.loc 3 515 0
	jmp	.L77	#
.L70:
	.loc 3 518 0
	movq	-32(%rbp), %rax	# dst, tmp158
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp158,
	call	sbufWriteU8	#
	.loc 3 519 0
	movq	-32(%rbp), %rax	# dst, tmp159
	movl	$14, %esi	#,
	movq	%rax, %rdi	# tmp159,
	call	sbufWriteU8	#
	.loc 3 520 0
	movq	-32(%rbp), %rax	# dst, tmp160
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp160,
	call	sbufWriteU8	#
	.loc 3 521 0
	jmp	.L77	#
.L71:
	.loc 3 524 0
	movl	$.LC1, %ecx	#, D.7066
	movq	-32(%rbp), %rax	# dst, tmp161
	movl	$4, %edx	#,
	movq	%rcx, %rsi	# D.7066,
	movq	%rax, %rdi	# tmp161,
	call	sbufWriteData	#
	.loc 3 528 0
	movq	-32(%rbp), %rax	# dst, tmp162
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp162,
	call	sbufWriteU16	#
	.loc 3 530 0
	movq	-32(%rbp), %rax	# dst, tmp163
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp163,
	call	sbufWriteU8	#
	.loc 3 531 0
	jmp	.L77	#
.L65:
	.loc 3 534 0
	movq	buildDate(%rip), %rcx	# buildDate, D.7066
	movq	-32(%rbp), %rax	# dst, tmp164
	movl	$11, %edx	#,
	movq	%rcx, %rsi	# D.7066,
	movq	%rax, %rdi	# tmp164,
	call	sbufWriteData	#
	.loc 3 535 0
	movq	buildTime(%rip), %rcx	# buildTime, D.7066
	movq	-32(%rbp), %rax	# dst, tmp165
	movl	$8, %edx	#,
	movq	%rcx, %rsi	# D.7066,
	movq	%rax, %rdi	# tmp165,
	call	sbufWriteData	#
	.loc 3 536 0
	movq	shortGitRevision(%rip), %rcx	# shortGitRevision, D.7066
	movq	-32(%rbp), %rax	# dst, tmp166
	movl	$7, %edx	#,
	movq	%rcx, %rsi	# D.7066,
	movq	%rax, %rdi	# tmp166,
	call	sbufWriteData	#
	.loc 3 537 0
	jmp	.L77	#
.L72:
	.loc 3 541 0
	movq	-32(%rbp), %rax	# dst, tmp167
	movl	$231, %esi	#,
	movq	%rax, %rdi	# tmp167,
	call	sbufWriteU8	#
	.loc 3 542 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _41->mixerMode, D.7068
	movzbl	%al, %edx	# D.7068, D.7065
	movq	-32(%rbp), %rax	# dst, tmp168
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp168,
	call	sbufWriteU8	#
	.loc 3 543 0
	movq	-32(%rbp), %rax	# dst, tmp169
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp169,
	call	sbufWriteU8	#
	.loc 3 544 0
	movq	-32(%rbp), %rax	# dst, tmp170
	movl	$4, %esi	#,
	movq	%rax, %rdi	# tmp170,
	call	sbufWriteU32	#
	.loc 3 545 0
	jmp	.L77	#
.L75:
	.loc 3 548 0
	movl	$.LC31, %edi	#,
	call	puts	#
	.loc 3 549 0
	movzwl	cycleTime(%rip), %eax	# cycleTime, D.7069
	movzwl	%ax, %edx	# D.7069, D.7065
	movq	-32(%rbp), %rax	# dst, tmp171
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp171,
	call	sbufWriteU16	#
	.loc 3 553 0
	movq	-32(%rbp), %rax	# dst, tmp172
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp172,
	call	sbufWriteU16	#
	.loc 3 555 0
	movl	$2, %edi	#,
	call	sensors	#
	movzbl	%al, %ebx	# D.7070, D.7071
	movl	$4, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7070, D.7065
	addl	%eax, %eax	# D.7065
	orl	%eax, %ebx	# D.7071, D.7071
	movl	$8, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7070, D.7065
	sall	$2, %eax	#, D.7065
	orl	%eax, %ebx	# D.7071, D.7071
	movl	$32, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7070, D.7065
	sall	$3, %eax	#, D.7065
	orl	%eax, %ebx	# D.7071, D.7071
	movl	$16, %edi	#,
	call	sensors	#
	movzbl	%al, %eax	# D.7070, D.7065
	sall	$4, %eax	#, D.7065
	orl	%ebx, %eax	# D.7071, D.7071
	movzwl	%ax, %edx	# D.7069, D.7065
	movq	-32(%rbp), %rax	# dst, tmp173
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp173,
	call	sbufWriteU16	#
	.loc 3 556 0
	call	packFlightModeFlags	#
	movl	%eax, %edx	#, D.7063
	movq	-32(%rbp), %rax	# dst, tmp174
	movl	%edx, %esi	# D.7063,
	movq	%rax, %rdi	# tmp174,
	call	sbufWriteU32	#
	.loc 3 557 0
	call	getCurrentProfile	#
	movzbl	%al, %edx	# D.7068, D.7065
	movq	-32(%rbp), %rax	# dst, tmp175
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp175,
	call	sbufWriteU8	#
	.loc 3 558 0
	movzwl	averageSystemLoadPercent(%rip), %eax	# averageSystemLoadPercent, D.7069
	movzwl	%ax, %eax	# D.7069, D.7065
	movl	$100, %edx	#,
	movl	$0, %esi	#,
	movl	%eax, %edi	# D.7065,
	call	constrain	#
	movzwl	%ax, %edx	# D.7069, D.7065
	movq	-32(%rbp), %rax	# dst, tmp176
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp176,
	call	sbufWriteU16	#
	.loc 3 559 0
	jmp	.L77	#
.L76:
.LBB14:
	.loc 3 563 0
	movzwl	acc+16(%rip), %eax	# acc.acc_1G, D.7069
	cmpw	$1024, %ax	#, D.7069
	jbe	.L78	#,
	.loc 3 563 0 is_stmt 0 discriminator 1
	movl	$3, %eax	#, D.7063
	jmp	.L79	#
.L78:
	.loc 3 563 0 discriminator 2
	movl	$0, %eax	#, D.7063
.L79:
	.loc 3 563 0 discriminator 4
	movl	%eax, -36(%rbp)	# D.7063, scale_shift
.LBB15:
	.loc 3 565 0 is_stmt 1 discriminator 4
	movl	$0, -52(%rbp)	#, i
	jmp	.L80	#
.L81:
	.loc 3 566 0 discriminator 3
	movl	-52(%rbp), %eax	# i, tmp177
	movzwl	accSmooth(%rax,%rax), %eax	# accSmooth, D.7064
	movswl	%ax, %edx	# D.7064, D.7065
	movl	-36(%rbp), %eax	# scale_shift, tmp178
	movl	%eax, %ecx	# tmp178, tmp187
	sarl	%cl, %edx	# tmp187, D.7065
	movl	%edx, %eax	# D.7065, D.7065
	movzwl	%ax, %edx	# D.7069, D.7065
	movq	-32(%rbp), %rax	# dst, tmp179
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp179,
	call	sbufWriteU16	#
	.loc 3 565 0 discriminator 3
	addl	$1, -52(%rbp)	#, i
.L80:
	.loc 3 565 0 is_stmt 0 discriminator 1
	cmpl	$2, -52(%rbp)	#, i
	jbe	.L81	#,
.LBE15:
.LBB16:
	.loc 3 567 0 is_stmt 1
	movl	$0, -48(%rbp)	#, i
	jmp	.L82	#
.L83:
	.loc 3 568 0 discriminator 3
	movl	-48(%rbp), %eax	# i, tmp180
	movl	gyroADC(,%rax,4), %eax	# gyroADC, D.7065
	movzwl	%ax, %edx	# D.7069, D.7065
	movq	-32(%rbp), %rax	# dst, tmp181
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp181,
	call	sbufWriteU16	#
	.loc 3 567 0 discriminator 3
	addl	$1, -48(%rbp)	#, i
.L82:
	.loc 3 567 0 is_stmt 0 discriminator 1
	cmpl	$2, -48(%rbp)	#, i
	jbe	.L83	#,
.LBE16:
.LBB17:
	.loc 3 569 0 is_stmt 1
	movl	$0, -44(%rbp)	#, i
	jmp	.L84	#
.L85:
	.loc 3 570 0 discriminator 3
	movl	-44(%rbp), %eax	# i, tmp182
	movl	magADC(,%rax,4), %eax	# magADC, D.7065
	movzwl	%ax, %edx	# D.7069, D.7065
	movq	-32(%rbp), %rax	# dst, tmp183
	movl	%edx, %esi	# D.7065,
	movq	%rax, %rdi	# tmp183,
	call	sbufWriteU16	#
	.loc 3 569 0 discriminator 3
	addl	$1, -44(%rbp)	#, i
.L84:
	.loc 3 569 0 is_stmt 0 discriminator 1
	cmpl	$2, -44(%rbp)	#, i
	jbe	.L85	#,
.LBE17:
	.loc 3 571 0 is_stmt 1
	jmp	.L77	#
.L74:
.LBE14:
	.loc 3 575 0
	movl	$.LC32, %edi	#,
	call	puts	#
	.loc 3 576 0
	movq	-80(%rbp), %rax	# reply, tmp184
	movq	%rax, %rdi	# tmp184,
	call	serializeDataflashSummaryReply	#
	.loc 3 577 0
	jmp	.L77	#
.L64:
	.loc 3 580 0
	movl	$.LC33, %edi	#,
	call	puts	#
	.loc 3 581 0
	nop
.L77:
	.loc 3 1539 0
	movl	$1, %eax	#, D.7065
	.loc 3 1540 0
	addq	$72, %rsp	#,
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
	.loc 3 1543 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 3 1544 0
	call	initActiveBoxIds	#
	.loc 3 1545 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE82:
	.size	mspInit, .-mspInit
	.section	.rodata.flightMode_boxId_map.6744,"a",@progbits
	.align 8
	.type	flightMode_boxId_map.6744, @object
	.size	flightMode_boxId_map.6744, 12
flightMode_boxId_map.6744:
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
	.file 4 "/usr/include/stdint.h"
	.file 5 "./src/main/common/axis.h"
	.file 6 "./src/main/common/color.h"
	.file 7 "./src/main/common/streambuf.h"
	.file 8 "./src/main/config/parameter_group.h"
	.file 9 "./src/main/config/feature.h"
	.file 10 "./src/main/config/profile.h"
	.file 11 "./src/main/drivers/sensor.h"
	.file 12 "./src/main/drivers/accgyro.h"
	.file 13 "./src/main/rx/rx.h"
	.file 14 "./src/main/msp/msp.h"
	.file 15 "./src/main/fc/rate_profile.h"
	.file 16 "./src/main/fc/rc_controls.h"
	.file 17 "./src/main/fc/rc_adjustments.h"
	.file 18 "./src/main/fc/runtime_config.h"
	.file 19 "./src/main/fc/config.h"
	.file 20 "./src/main/io/motor_and_servo.h"
	.file 21 "./src/main/io/gps.h"
	.file 22 "./src/main/io/gimbal.h"
	.file 23 "./src/main/io/io_serial.h"
	.file 24 "./src/main/io/ledstrip.h"
	.file 25 "./src/main/io/transponder_ir.h"
	.file 26 "./src/main/telemetry/telemetry.h"
	.file 27 "./src/main/sensors/boardalignment.h"
	.file 28 "./src/main/sensors/sensors.h"
	.file 29 "./src/main/sensors/amperage.h"
	.file 30 "./src/main/sensors/voltage.h"
	.file 31 "./src/main/sensors/battery.h"
	.file 32 "./src/main/sensors/acceleration.h"
	.file 33 "./src/main/sensors/compass.h"
	.file 34 "./src/main/sensors/gyro.h"
	.file 35 "./src/main/flight/servos.h"
	.file 36 "./src/main/flight/pid.h"
	.file 37 "./src/main/flight/imu.h"
	.file 38 "./src/main/flight/failsafe.h"
	.file 39 "./src/main/flight/navigation.h"
	.file 40 "./src/main/flight/altitudehold.h"
	.file 41 "./src/main/blackbox/blackbox.h"
	.file 42 "./src/main/msp/msp_server.h"
	.file 43 "./src/main/target/edison/target.h"
	.file 44 "./src/main/scheduler/scheduler.h"
	.file 45 "./src/main/build/version.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x20d9
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF566
	.byte	0xc
	.long	.LASF567
	.long	.LASF568
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
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
	.uleb128 0x5
	.byte	0x8
	.long	0x77
	.uleb128 0x6
	.long	0x6a
	.uleb128 0x7
	.long	.LASF9
	.byte	0x4
	.byte	0x24
	.long	0x45
	.uleb128 0x7
	.long	.LASF10
	.byte	0x4
	.byte	0x25
	.long	0x4c
	.uleb128 0x7
	.long	.LASF11
	.byte	0x4
	.byte	0x26
	.long	0x53
	.uleb128 0x7
	.long	.LASF12
	.byte	0x4
	.byte	0x30
	.long	0x30
	.uleb128 0x7
	.long	.LASF13
	.byte	0x4
	.byte	0x31
	.long	0x37
	.uleb128 0x7
	.long	.LASF14
	.byte	0x4
	.byte	0x33
	.long	0x3e
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF15
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF16
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF17
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF18
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x5
	.byte	0x1d
	.long	0xff
	.uleb128 0x9
	.long	.LASF19
	.byte	0
	.uleb128 0x9
	.long	.LASF20
	.byte	0x1
	.uleb128 0x9
	.long	.LASF21
	.byte	0x2
	.uleb128 0x9
	.long	.LASF22
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x5
	.byte	0x25
	.long	0x11e
	.uleb128 0x9
	.long	.LASF23
	.byte	0
	.uleb128 0x9
	.long	.LASF24
	.byte	0x1
	.uleb128 0x9
	.long	.LASF25
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x6
	.byte	0x15
	.long	0x13d
	.uleb128 0x9
	.long	.LASF26
	.byte	0
	.uleb128 0x9
	.long	.LASF27
	.byte	0x1
	.uleb128 0x9
	.long	.LASF28
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	0x9d
	.long	0x14d
	.uleb128 0xb
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.long	.LASF30
	.byte	0x4
	.byte	0x6
	.byte	0x32
	.long	0x178
	.uleb128 0xd
	.string	"h"
	.byte	0x6
	.byte	0x33
	.long	0xa8
	.byte	0
	.uleb128 0xd
	.string	"s"
	.byte	0x6
	.byte	0x34
	.long	0x9d
	.byte	0x2
	.uleb128 0xd
	.string	"v"
	.byte	0x6
	.byte	0x35
	.long	0x9d
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF29
	.byte	0x6
	.byte	0x36
	.long	0x14d
	.uleb128 0xc
	.long	.LASF31
	.byte	0x10
	.byte	0x7
	.byte	0x19
	.long	0x1a8
	.uleb128 0xd
	.string	"ptr"
	.byte	0x7
	.byte	0x1a
	.long	0x1a8
	.byte	0
	.uleb128 0xd
	.string	"end"
	.byte	0x7
	.byte	0x1b
	.long	0x1a8
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x9d
	.uleb128 0x7
	.long	.LASF32
	.byte	0x7
	.byte	0x1c
	.long	0x183
	.uleb128 0x7
	.long	.LASF33
	.byte	0x8
	.byte	0x15
	.long	0xa8
	.uleb128 0x7
	.long	.LASF34
	.byte	0x8
	.byte	0x26
	.long	0x1cf
	.uleb128 0xe
	.long	0x1df
	.uleb128 0xf
	.long	0x68
	.uleb128 0xf
	.long	0x53
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.byte	0x8
	.byte	0x2d
	.long	0x1fd
	.uleb128 0x11
	.string	"ptr"
	.byte	0x8
	.byte	0x2e
	.long	0x68
	.uleb128 0x11
	.string	"fn"
	.byte	0x8
	.byte	0x2f
	.long	0x1fd
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x1c4
	.uleb128 0xc
	.long	.LASF35
	.byte	0x20
	.byte	0x8
	.byte	0x28
	.long	0x24c
	.uleb128 0xd
	.string	"pgn"
	.byte	0x8
	.byte	0x29
	.long	0x1b9
	.byte	0
	.uleb128 0x12
	.long	.LASF36
	.byte	0x8
	.byte	0x2a
	.long	0xa8
	.byte	0x2
	.uleb128 0x12
	.long	.LASF37
	.byte	0x8
	.byte	0x2b
	.long	0x1a8
	.byte	0x8
	.uleb128 0xd
	.string	"ptr"
	.byte	0x8
	.byte	0x2c
	.long	0x24c
	.byte	0x10
	.uleb128 0x12
	.long	.LASF38
	.byte	0x8
	.byte	0x30
	.long	0x1df
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x1a8
	.uleb128 0x7
	.long	.LASF39
	.byte	0x8
	.byte	0x31
	.long	0x203
	.uleb128 0xc
	.long	.LASF40
	.byte	0x4
	.byte	0x9
	.byte	0x14
	.long	0x276
	.uleb128 0x12
	.long	.LASF41
	.byte	0x9
	.byte	0x15
	.long	0xb3
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF42
	.byte	0x9
	.byte	0x16
	.long	0x25d
	.uleb128 0xc
	.long	.LASF43
	.byte	0x1
	.byte	0xa
	.byte	0x16
	.long	0x29a
	.uleb128 0x12
	.long	.LASF44
	.byte	0xa
	.byte	0x17
	.long	0x9d
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF45
	.byte	0xa
	.byte	0x18
	.long	0x281
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF46
	.uleb128 0x7
	.long	.LASF47
	.byte	0xb
	.byte	0x15
	.long	0x2b7
	.uleb128 0x5
	.byte	0x8
	.long	0x2bd
	.uleb128 0x13
	.long	0x2a5
	.long	0x2cc
	.uleb128 0xf
	.long	0x2cc
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x87
	.uleb128 0x7
	.long	.LASF48
	.byte	0xb
	.byte	0x18
	.long	0x2dd
	.uleb128 0x5
	.byte	0x8
	.long	0x2e3
	.uleb128 0x14
	.uleb128 0xc
	.long	.LASF49
	.byte	0x18
	.byte	0xc
	.byte	0x26
	.long	0x321
	.uleb128 0x12
	.long	.LASF50
	.byte	0xc
	.byte	0x27
	.long	0x2d2
	.byte	0
	.uleb128 0x12
	.long	.LASF51
	.byte	0xc
	.byte	0x28
	.long	0x2ac
	.byte	0x8
	.uleb128 0x12
	.long	.LASF52
	.byte	0xc
	.byte	0x29
	.long	0xa8
	.byte	0x10
	.uleb128 0x12
	.long	.LASF53
	.byte	0xc
	.byte	0x2a
	.long	0x6a
	.byte	0x12
	.byte	0
	.uleb128 0x7
	.long	.LASF54
	.byte	0xc
	.byte	0x2b
	.long	0x2e4
	.uleb128 0xc
	.long	.LASF55
	.byte	0x2
	.byte	0xd
	.byte	0x65
	.long	0x351
	.uleb128 0x12
	.long	.LASF56
	.byte	0xd
	.byte	0x66
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF57
	.byte	0xd
	.byte	0x67
	.long	0x9d
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF58
	.byte	0xd
	.byte	0x68
	.long	0x32c
	.uleb128 0xc
	.long	.LASF59
	.byte	0x4
	.byte	0xd
	.byte	0x6a
	.long	0x381
	.uleb128 0xd
	.string	"min"
	.byte	0xd
	.byte	0x6b
	.long	0xa8
	.byte	0
	.uleb128 0xd
	.string	"max"
	.byte	0xd
	.byte	0x6c
	.long	0xa8
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF60
	.byte	0xd
	.byte	0x6d
	.long	0x35c
	.uleb128 0xc
	.long	.LASF61
	.byte	0x1a
	.byte	0xd
	.byte	0x6f
	.long	0x435
	.uleb128 0x12
	.long	.LASF62
	.byte	0xd
	.byte	0x70
	.long	0x435
	.byte	0
	.uleb128 0x12
	.long	.LASF63
	.byte	0xd
	.byte	0x71
	.long	0x9d
	.byte	0x8
	.uleb128 0x12
	.long	.LASF64
	.byte	0xd
	.byte	0x72
	.long	0x9d
	.byte	0x9
	.uleb128 0x12
	.long	.LASF65
	.byte	0xd
	.byte	0x73
	.long	0x9d
	.byte	0xa
	.uleb128 0x12
	.long	.LASF66
	.byte	0xd
	.byte	0x74
	.long	0x9d
	.byte	0xb
	.uleb128 0x12
	.long	.LASF67
	.byte	0xd
	.byte	0x75
	.long	0x9d
	.byte	0xc
	.uleb128 0x12
	.long	.LASF68
	.byte	0xd
	.byte	0x76
	.long	0x9d
	.byte	0xd
	.uleb128 0x12
	.long	.LASF69
	.byte	0xd
	.byte	0x77
	.long	0x9d
	.byte	0xe
	.uleb128 0x12
	.long	.LASF70
	.byte	0xd
	.byte	0x78
	.long	0xa8
	.byte	0x10
	.uleb128 0x12
	.long	.LASF71
	.byte	0xd
	.byte	0x79
	.long	0xa8
	.byte	0x12
	.uleb128 0x12
	.long	.LASF72
	.byte	0xd
	.byte	0x7a
	.long	0xa8
	.byte	0x14
	.uleb128 0x12
	.long	.LASF73
	.byte	0xd
	.byte	0x7c
	.long	0xa8
	.byte	0x16
	.uleb128 0x12
	.long	.LASF74
	.byte	0xd
	.byte	0x7d
	.long	0xa8
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.long	0x9d
	.long	0x445
	.uleb128 0xb
	.long	0x61
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	.LASF75
	.byte	0xd
	.byte	0x7e
	.long	0x38c
	.uleb128 0xc
	.long	.LASF76
	.byte	0x18
	.byte	0xe
	.byte	0x16
	.long	0x481
	.uleb128 0xd
	.string	"buf"
	.byte	0xe
	.byte	0x17
	.long	0x1ae
	.byte	0
	.uleb128 0xd
	.string	"cmd"
	.byte	0xe
	.byte	0x18
	.long	0x87
	.byte	0x10
	.uleb128 0x12
	.long	.LASF77
	.byte	0xe
	.byte	0x19
	.long	0x87
	.byte	0x12
	.byte	0
	.uleb128 0x7
	.long	.LASF78
	.byte	0xe
	.byte	0x1a
	.long	0x450
	.uleb128 0xc
	.long	.LASF79
	.byte	0xc
	.byte	0xf
	.byte	0x14
	.long	0x4f9
	.uleb128 0x12
	.long	.LASF80
	.byte	0xf
	.byte	0x15
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF81
	.byte	0xf
	.byte	0x16
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF82
	.byte	0xf
	.byte	0x17
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF83
	.byte	0xf
	.byte	0x18
	.long	0x9d
	.byte	0x3
	.uleb128 0x12
	.long	.LASF84
	.byte	0xf
	.byte	0x19
	.long	0x13d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF85
	.byte	0xf
	.byte	0x1a
	.long	0x9d
	.byte	0x7
	.uleb128 0x12
	.long	.LASF86
	.byte	0xf
	.byte	0x1b
	.long	0x9d
	.byte	0x8
	.uleb128 0x12
	.long	.LASF87
	.byte	0xf
	.byte	0x1c
	.long	0xa8
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF88
	.byte	0xf
	.byte	0x1d
	.long	0x48c
	.uleb128 0xc
	.long	.LASF89
	.byte	0x1
	.byte	0xf
	.byte	0x24
	.long	0x51d
	.uleb128 0x12
	.long	.LASF90
	.byte	0xf
	.byte	0x25
	.long	0x9d
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF91
	.byte	0xf
	.byte	0x26
	.long	0x504
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x10
	.byte	0x16
	.long	0x5e3
	.uleb128 0x9
	.long	.LASF92
	.byte	0
	.uleb128 0x9
	.long	.LASF93
	.byte	0x1
	.uleb128 0x9
	.long	.LASF94
	.byte	0x2
	.uleb128 0x9
	.long	.LASF95
	.byte	0x3
	.uleb128 0x9
	.long	.LASF96
	.byte	0x4
	.uleb128 0x9
	.long	.LASF97
	.byte	0x5
	.uleb128 0x9
	.long	.LASF98
	.byte	0x6
	.uleb128 0x9
	.long	.LASF99
	.byte	0x7
	.uleb128 0x9
	.long	.LASF100
	.byte	0x8
	.uleb128 0x9
	.long	.LASF101
	.byte	0x9
	.uleb128 0x9
	.long	.LASF102
	.byte	0xa
	.uleb128 0x9
	.long	.LASF103
	.byte	0xb
	.uleb128 0x9
	.long	.LASF104
	.byte	0xc
	.uleb128 0x9
	.long	.LASF105
	.byte	0xd
	.uleb128 0x9
	.long	.LASF106
	.byte	0xe
	.uleb128 0x9
	.long	.LASF107
	.byte	0xf
	.uleb128 0x9
	.long	.LASF108
	.byte	0x10
	.uleb128 0x9
	.long	.LASF109
	.byte	0x11
	.uleb128 0x9
	.long	.LASF110
	.byte	0x12
	.uleb128 0x9
	.long	.LASF111
	.byte	0x13
	.uleb128 0x9
	.long	.LASF112
	.byte	0x14
	.uleb128 0x9
	.long	.LASF113
	.byte	0x15
	.uleb128 0x9
	.long	.LASF114
	.byte	0x16
	.uleb128 0x9
	.long	.LASF115
	.byte	0x17
	.uleb128 0x9
	.long	.LASF116
	.byte	0x18
	.uleb128 0x9
	.long	.LASF117
	.byte	0x19
	.uleb128 0x9
	.long	.LASF118
	.byte	0x1a
	.uleb128 0x9
	.long	.LASF119
	.byte	0x1b
	.uleb128 0x9
	.long	.LASF120
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.long	.LASF121
	.byte	0x10
	.byte	0x35
	.long	0x528
	.uleb128 0xc
	.long	.LASF122
	.byte	0x2
	.byte	0x10
	.byte	0x74
	.long	0x613
	.uleb128 0x12
	.long	.LASF123
	.byte	0x10
	.byte	0x75
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF124
	.byte	0x10
	.byte	0x76
	.long	0x9d
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF125
	.byte	0x10
	.byte	0x77
	.long	0x5ee
	.uleb128 0xc
	.long	.LASF126
	.byte	0x8
	.byte	0x10
	.byte	0x79
	.long	0x64f
	.uleb128 0x12
	.long	.LASF127
	.byte	0x10
	.byte	0x7a
	.long	0x5e3
	.byte	0
	.uleb128 0x12
	.long	.LASF128
	.byte	0x10
	.byte	0x7b
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF129
	.byte	0x10
	.byte	0x7c
	.long	0x613
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.long	.LASF130
	.byte	0x10
	.byte	0x7d
	.long	0x61e
	.uleb128 0xc
	.long	.LASF131
	.byte	0xa0
	.byte	0x10
	.byte	0x81
	.long	0x673
	.uleb128 0x12
	.long	.LASF132
	.byte	0x10
	.byte	0x82
	.long	0x673
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x64f
	.long	0x683
	.uleb128 0xb
	.long	0x61
	.byte	0x13
	.byte	0
	.uleb128 0x7
	.long	.LASF133
	.byte	0x10
	.byte	0x83
	.long	0x65a
	.uleb128 0xc
	.long	.LASF134
	.byte	0x8
	.byte	0x10
	.byte	0x89
	.long	0x6e3
	.uleb128 0x12
	.long	.LASF135
	.byte	0x10
	.byte	0x8a
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF136
	.byte	0x10
	.byte	0x8b
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF137
	.byte	0x10
	.byte	0x8c
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF138
	.byte	0x10
	.byte	0x8d
	.long	0x9d
	.byte	0x3
	.uleb128 0x12
	.long	.LASF139
	.byte	0x10
	.byte	0x8e
	.long	0x7c
	.byte	0x4
	.uleb128 0x12
	.long	.LASF140
	.byte	0x10
	.byte	0x8f
	.long	0xa8
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF141
	.byte	0x10
	.byte	0x90
	.long	0x68e
	.uleb128 0xc
	.long	.LASF142
	.byte	0x4
	.byte	0x10
	.byte	0x94
	.long	0x72b
	.uleb128 0x12
	.long	.LASF143
	.byte	0x10
	.byte	0x96
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF144
	.byte	0x10
	.byte	0x97
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF145
	.byte	0x10
	.byte	0x98
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF146
	.byte	0x10
	.byte	0x99
	.long	0x9d
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF147
	.byte	0x10
	.byte	0x9a
	.long	0x6ee
	.uleb128 0xc
	.long	.LASF148
	.byte	0x6
	.byte	0x11
	.byte	0x62
	.long	0x77f
	.uleb128 0x12
	.long	.LASF128
	.byte	0x11
	.byte	0x64
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF129
	.byte	0x11
	.byte	0x65
	.long	0x613
	.byte	0x1
	.uleb128 0x12
	.long	.LASF149
	.byte	0x11
	.byte	0x68
	.long	0x9d
	.byte	0x3
	.uleb128 0x12
	.long	.LASF150
	.byte	0x11
	.byte	0x69
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF151
	.byte	0x11
	.byte	0x6c
	.long	0x9d
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.long	.LASF152
	.byte	0x11
	.byte	0x6d
	.long	0x736
	.uleb128 0xc
	.long	.LASF153
	.byte	0x48
	.byte	0x11
	.byte	0x7a
	.long	0x7a3
	.uleb128 0x12
	.long	.LASF154
	.byte	0x11
	.byte	0x7b
	.long	0x7a3
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x77f
	.long	0x7b3
	.uleb128 0xb
	.long	0x61
	.byte	0xb
	.byte	0
	.uleb128 0x7
	.long	.LASF155
	.byte	0x11
	.byte	0x7c
	.long	0x78a
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x12
	.byte	0x15
	.long	0x7dd
	.uleb128 0x9
	.long	.LASF156
	.byte	0x1
	.uleb128 0x9
	.long	.LASF157
	.byte	0x2
	.uleb128 0x9
	.long	.LASF158
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x12
	.byte	0x21
	.long	0x836
	.uleb128 0x9
	.long	.LASF159
	.byte	0x1
	.uleb128 0x9
	.long	.LASF160
	.byte	0x2
	.uleb128 0x9
	.long	.LASF161
	.byte	0x4
	.uleb128 0x9
	.long	.LASF162
	.byte	0x8
	.uleb128 0x9
	.long	.LASF163
	.byte	0x10
	.uleb128 0x9
	.long	.LASF164
	.byte	0x20
	.uleb128 0x9
	.long	.LASF165
	.byte	0x40
	.uleb128 0x9
	.long	.LASF166
	.byte	0x80
	.uleb128 0x15
	.long	.LASF167
	.value	0x100
	.uleb128 0x15
	.long	.LASF168
	.value	0x200
	.uleb128 0x15
	.long	.LASF169
	.value	0x400
	.uleb128 0x15
	.long	.LASF170
	.value	0x800
	.byte	0
	.uleb128 0x7
	.long	.LASF171
	.byte	0x12
	.byte	0x2e
	.long	0x7dd
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x13
	.byte	0x17
	.long	0x8ec
	.uleb128 0x9
	.long	.LASF172
	.byte	0x1
	.uleb128 0x9
	.long	.LASF173
	.byte	0x2
	.uleb128 0x9
	.long	.LASF174
	.byte	0x4
	.uleb128 0x9
	.long	.LASF175
	.byte	0x8
	.uleb128 0x9
	.long	.LASF176
	.byte	0x10
	.uleb128 0x9
	.long	.LASF177
	.byte	0x20
	.uleb128 0x9
	.long	.LASF178
	.byte	0x40
	.uleb128 0x9
	.long	.LASF179
	.byte	0x80
	.uleb128 0x15
	.long	.LASF180
	.value	0x100
	.uleb128 0x15
	.long	.LASF181
	.value	0x200
	.uleb128 0x15
	.long	.LASF182
	.value	0x400
	.uleb128 0x15
	.long	.LASF183
	.value	0x800
	.uleb128 0x15
	.long	.LASF184
	.value	0x1000
	.uleb128 0x15
	.long	.LASF185
	.value	0x2000
	.uleb128 0x15
	.long	.LASF186
	.value	0x4000
	.uleb128 0x15
	.long	.LASF187
	.value	0x8000
	.uleb128 0x16
	.long	.LASF188
	.long	0x10000
	.uleb128 0x16
	.long	.LASF189
	.long	0x20000
	.uleb128 0x16
	.long	.LASF190
	.long	0x40000
	.uleb128 0x16
	.long	.LASF191
	.long	0x80000
	.uleb128 0x16
	.long	.LASF192
	.long	0x100000
	.uleb128 0x16
	.long	.LASF193
	.long	0x200000
	.byte	0
	.uleb128 0x6
	.long	0x9d
	.uleb128 0xc
	.long	.LASF194
	.byte	0xc
	.byte	0x14
	.byte	0x14
	.long	0x946
	.uleb128 0x12
	.long	.LASF195
	.byte	0x14
	.byte	0x17
	.long	0xa8
	.byte	0
	.uleb128 0x12
	.long	.LASF196
	.byte	0x14
	.byte	0x18
	.long	0xa8
	.byte	0x2
	.uleb128 0x12
	.long	.LASF197
	.byte	0x14
	.byte	0x19
	.long	0xa8
	.byte	0x4
	.uleb128 0x12
	.long	.LASF198
	.byte	0x14
	.byte	0x1a
	.long	0xa8
	.byte	0x6
	.uleb128 0x12
	.long	.LASF199
	.byte	0x14
	.byte	0x1c
	.long	0xa8
	.byte	0x8
	.uleb128 0x12
	.long	.LASF200
	.byte	0x14
	.byte	0x1d
	.long	0xa8
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF201
	.byte	0x14
	.byte	0x1e
	.long	0x8f1
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x15
	.byte	0x19
	.long	0x96a
	.uleb128 0x9
	.long	.LASF202
	.byte	0
	.uleb128 0x9
	.long	.LASF203
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF204
	.byte	0x15
	.byte	0x1c
	.long	0x951
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x15
	.byte	0x20
	.long	0x9a0
	.uleb128 0x9
	.long	.LASF205
	.byte	0
	.uleb128 0x9
	.long	.LASF206
	.byte	0x1
	.uleb128 0x9
	.long	.LASF207
	.byte	0x2
	.uleb128 0x9
	.long	.LASF208
	.byte	0x3
	.uleb128 0x9
	.long	.LASF209
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF210
	.byte	0x15
	.byte	0x26
	.long	0x975
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x15
	.byte	0x32
	.long	0x9c4
	.uleb128 0x9
	.long	.LASF211
	.byte	0
	.uleb128 0x9
	.long	.LASF212
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF213
	.byte	0x15
	.byte	0x35
	.long	0x9ab
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x15
	.byte	0x37
	.long	0x9e8
	.uleb128 0x9
	.long	.LASF214
	.byte	0
	.uleb128 0x9
	.long	.LASF215
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF216
	.byte	0x15
	.byte	0x3a
	.long	0x9cf
	.uleb128 0xc
	.long	.LASF217
	.byte	0x10
	.byte	0x15
	.byte	0x3e
	.long	0xa30
	.uleb128 0x12
	.long	.LASF218
	.byte	0x15
	.byte	0x3f
	.long	0x96a
	.byte	0
	.uleb128 0x12
	.long	.LASF219
	.byte	0x15
	.byte	0x40
	.long	0x9a0
	.byte	0x4
	.uleb128 0x12
	.long	.LASF220
	.byte	0x15
	.byte	0x41
	.long	0x9c4
	.byte	0x8
	.uleb128 0x12
	.long	.LASF221
	.byte	0x15
	.byte	0x42
	.long	0x9e8
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.long	.LASF222
	.byte	0x15
	.byte	0x43
	.long	0x9f3
	.uleb128 0xc
	.long	.LASF223
	.byte	0x1
	.byte	0x16
	.byte	0x1b
	.long	0xa54
	.uleb128 0x12
	.long	.LASF56
	.byte	0x16
	.byte	0x1c
	.long	0x9d
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF224
	.byte	0x16
	.byte	0x1d
	.long	0xa3b
	.uleb128 0x8
	.byte	0x4
	.long	0x53
	.byte	0x17
	.byte	0x36
	.long	0xaa8
	.uleb128 0x17
	.long	.LASF225
	.sleb128 -1
	.uleb128 0x9
	.long	.LASF226
	.byte	0
	.uleb128 0x9
	.long	.LASF227
	.byte	0x1
	.uleb128 0x9
	.long	.LASF228
	.byte	0x2
	.uleb128 0x9
	.long	.LASF229
	.byte	0x3
	.uleb128 0x9
	.long	.LASF230
	.byte	0x4
	.uleb128 0x9
	.long	.LASF231
	.byte	0x14
	.uleb128 0x9
	.long	.LASF232
	.byte	0x1e
	.uleb128 0x9
	.long	.LASF233
	.byte	0x1f
	.uleb128 0x9
	.long	.LASF234
	.byte	0x1f
	.byte	0
	.uleb128 0x7
	.long	.LASF235
	.byte	0x17
	.byte	0x41
	.long	0xa5f
	.uleb128 0xc
	.long	.LASF236
	.byte	0xc
	.byte	0x17
	.byte	0x5a
	.long	0xae4
	.uleb128 0x12
	.long	.LASF237
	.byte	0x17
	.byte	0x5b
	.long	0xaa8
	.byte	0
	.uleb128 0x12
	.long	.LASF238
	.byte	0x17
	.byte	0x5c
	.long	0xa8
	.byte	0x4
	.uleb128 0x12
	.long	.LASF239
	.byte	0x17
	.byte	0x5d
	.long	0xae4
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	0x9d
	.long	0xaf4
	.uleb128 0xb
	.long	0x61
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF240
	.byte	0x17
	.byte	0x5e
	.long	0xab3
	.uleb128 0xc
	.long	.LASF241
	.byte	0x1c
	.byte	0x17
	.byte	0x60
	.long	0xb24
	.uleb128 0x12
	.long	.LASF242
	.byte	0x17
	.byte	0x61
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF243
	.byte	0x17
	.byte	0x62
	.long	0xb24
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0xaf4
	.long	0xb34
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF244
	.byte	0x17
	.byte	0x63
	.long	0xaff
	.uleb128 0xc
	.long	.LASF245
	.byte	0x6
	.byte	0x18
	.byte	0x76
	.long	0xb58
	.uleb128 0x12
	.long	.LASF246
	.byte	0x18
	.byte	0x77
	.long	0xb58
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x9d
	.long	0xb68
	.uleb128 0xb
	.long	0x61
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.long	.LASF247
	.byte	0x18
	.byte	0x78
	.long	0xb3f
	.uleb128 0xc
	.long	.LASF248
	.byte	0xb
	.byte	0x18
	.byte	0x7a
	.long	0xb8c
	.uleb128 0x12
	.long	.LASF246
	.byte	0x18
	.byte	0x7b
	.long	0xb8c
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x9d
	.long	0xb9c
	.uleb128 0xb
	.long	0x61
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF249
	.byte	0x18
	.byte	0x7c
	.long	0xb73
	.uleb128 0x7
	.long	.LASF250
	.byte	0x18
	.byte	0x7e
	.long	0xb3
	.uleb128 0xc
	.long	.LASF251
	.byte	0x6
	.byte	0x19
	.byte	0x14
	.long	0xbcb
	.uleb128 0x12
	.long	.LASF252
	.byte	0x19
	.byte	0x15
	.long	0xb58
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF253
	.byte	0x19
	.byte	0x16
	.long	0xbb2
	.uleb128 0xc
	.long	.LASF254
	.byte	0x3
	.byte	0x1a
	.byte	0x1e
	.long	0xc07
	.uleb128 0x12
	.long	.LASF255
	.byte	0x1a
	.byte	0x1f
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF256
	.byte	0x1a
	.byte	0x20
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF257
	.byte	0x1a
	.byte	0x21
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF258
	.byte	0x1a
	.byte	0x22
	.long	0xbd6
	.uleb128 0xc
	.long	.LASF259
	.byte	0x6
	.byte	0x1b
	.byte	0x14
	.long	0xc43
	.uleb128 0x12
	.long	.LASF260
	.byte	0x1b
	.byte	0x15
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF261
	.byte	0x1b
	.byte	0x16
	.long	0x87
	.byte	0x2
	.uleb128 0x12
	.long	.LASF262
	.byte	0x1b
	.byte	0x17
	.long	0x87
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF263
	.byte	0x1b
	.byte	0x18
	.long	0xc12
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x1c
	.byte	0x15
	.long	0xc73
	.uleb128 0x9
	.long	.LASF264
	.byte	0
	.uleb128 0x9
	.long	.LASF265
	.byte	0x1
	.uleb128 0x9
	.long	.LASF266
	.byte	0x2
	.uleb128 0x9
	.long	.LASF267
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF268
	.byte	0x6
	.byte	0x1c
	.byte	0x20
	.long	0xca4
	.uleb128 0x12
	.long	.LASF269
	.byte	0x1c
	.byte	0x21
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF270
	.byte	0x1c
	.byte	0x22
	.long	0x87
	.byte	0x2
	.uleb128 0xd
	.string	"yaw"
	.byte	0x1c
	.byte	0x23
	.long	0x87
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF271
	.byte	0x1c
	.byte	0x24
	.long	0xc73
	.uleb128 0x18
	.long	.LASF323
	.byte	0x6
	.byte	0x1c
	.byte	0x26
	.long	0xcd2
	.uleb128 0x11
	.string	"raw"
	.byte	0x1c
	.byte	0x27
	.long	0xcd2
	.uleb128 0x19
	.long	.LASF272
	.byte	0x1c
	.byte	0x28
	.long	0xca4
	.byte	0
	.uleb128 0xa
	.long	0x87
	.long	0xce2
	.uleb128 0xb
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF273
	.byte	0x1c
	.byte	0x29
	.long	0xcaf
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x1c
	.byte	0x2f
	.long	0xd24
	.uleb128 0x9
	.long	.LASF274
	.byte	0x1
	.uleb128 0x9
	.long	.LASF275
	.byte	0x2
	.uleb128 0x9
	.long	.LASF276
	.byte	0x4
	.uleb128 0x9
	.long	.LASF277
	.byte	0x8
	.uleb128 0x9
	.long	.LASF278
	.byte	0x10
	.uleb128 0x9
	.long	.LASF279
	.byte	0x20
	.uleb128 0x9
	.long	.LASF280
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x1c
	.byte	0x39
	.long	0xd67
	.uleb128 0x9
	.long	.LASF281
	.byte	0
	.uleb128 0x9
	.long	.LASF282
	.byte	0x1
	.uleb128 0x9
	.long	.LASF283
	.byte	0x2
	.uleb128 0x9
	.long	.LASF284
	.byte	0x3
	.uleb128 0x9
	.long	.LASF285
	.byte	0x4
	.uleb128 0x9
	.long	.LASF286
	.byte	0x5
	.uleb128 0x9
	.long	.LASF287
	.byte	0x6
	.uleb128 0x9
	.long	.LASF288
	.byte	0x7
	.uleb128 0x9
	.long	.LASF289
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF290
	.byte	0x1c
	.byte	0x43
	.long	0xd24
	.uleb128 0xc
	.long	.LASF291
	.byte	0xc
	.byte	0x1c
	.byte	0x45
	.long	0xda3
	.uleb128 0x12
	.long	.LASF292
	.byte	0x1c
	.byte	0x46
	.long	0xd67
	.byte	0
	.uleb128 0x12
	.long	.LASF293
	.byte	0x1c
	.byte	0x47
	.long	0xd67
	.byte	0x4
	.uleb128 0x12
	.long	.LASF294
	.byte	0x1c
	.byte	0x48
	.long	0xd67
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF295
	.byte	0x1c
	.byte	0x49
	.long	0xd72
	.uleb128 0xc
	.long	.LASF296
	.byte	0x3
	.byte	0x1c
	.byte	0x4b
	.long	0xddf
	.uleb128 0x12
	.long	.LASF297
	.byte	0x1c
	.byte	0x4c
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF298
	.byte	0x1c
	.byte	0x4d
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF299
	.byte	0x1c
	.byte	0x4e
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF300
	.byte	0x1c
	.byte	0x4f
	.long	0xdae
	.uleb128 0xc
	.long	.LASF301
	.byte	0xc
	.byte	0x1c
	.byte	0x51
	.long	0xe0f
	.uleb128 0x12
	.long	.LASF302
	.byte	0x1c
	.byte	0x52
	.long	0xce2
	.byte	0
	.uleb128 0x12
	.long	.LASF303
	.byte	0x1c
	.byte	0x53
	.long	0xce2
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF304
	.byte	0x1c
	.byte	0x54
	.long	0xdea
	.uleb128 0xc
	.long	.LASF305
	.byte	0x4
	.byte	0x1d
	.byte	0x18
	.long	0xe3f
	.uleb128 0x12
	.long	.LASF306
	.byte	0x1d
	.byte	0x19
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF307
	.byte	0x1d
	.byte	0x1a
	.long	0xa8
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF308
	.byte	0x1d
	.byte	0x1b
	.long	0xe1a
	.uleb128 0xc
	.long	.LASF309
	.byte	0x3
	.byte	0x1e
	.byte	0x20
	.long	0xe7b
	.uleb128 0x12
	.long	.LASF310
	.byte	0x1e
	.byte	0x21
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF311
	.byte	0x1e
	.byte	0x22
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF312
	.byte	0x1e
	.byte	0x23
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF313
	.byte	0x1e
	.byte	0x24
	.long	0xe4a
	.uleb128 0xc
	.long	.LASF314
	.byte	0x8
	.byte	0x1f
	.byte	0x14
	.long	0xecf
	.uleb128 0x12
	.long	.LASF315
	.byte	0x1f
	.byte	0x15
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF316
	.byte	0x1f
	.byte	0x16
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF317
	.byte	0x1f
	.byte	0x17
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF318
	.byte	0x1f
	.byte	0x18
	.long	0xa8
	.byte	0x4
	.uleb128 0x12
	.long	.LASF319
	.byte	0x1f
	.byte	0x19
	.long	0x9d
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF320
	.byte	0x1f
	.byte	0x1a
	.long	0xe86
	.uleb128 0xc
	.long	.LASF321
	.byte	0x4
	.byte	0x20
	.byte	0x2a
	.long	0xeff
	.uleb128 0x12
	.long	.LASF269
	.byte	0x20
	.byte	0x2b
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF270
	.byte	0x20
	.byte	0x2c
	.long	0x87
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF322
	.byte	0x20
	.byte	0x2d
	.long	0xeda
	.uleb128 0x18
	.long	.LASF324
	.byte	0x4
	.byte	0x20
	.byte	0x2f
	.long	0xf2d
	.uleb128 0x11
	.string	"raw"
	.byte	0x20
	.byte	0x30
	.long	0xf2d
	.uleb128 0x19
	.long	.LASF272
	.byte	0x20
	.byte	0x31
	.long	0xeff
	.byte	0
	.uleb128 0xa
	.long	0x87
	.long	0xf3d
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF325
	.byte	0x20
	.byte	0x32
	.long	0xf0a
	.uleb128 0xc
	.long	.LASF326
	.byte	0x2
	.byte	0x20
	.byte	0x34
	.long	0xf6a
	.uleb128 0xd
	.string	"xy"
	.byte	0x20
	.byte	0x35
	.long	0x9d
	.byte	0
	.uleb128 0xd
	.string	"z"
	.byte	0x20
	.byte	0x36
	.long	0x9d
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF327
	.byte	0x20
	.byte	0x37
	.long	0xf48
	.uleb128 0xc
	.long	.LASF328
	.byte	0x10
	.byte	0x20
	.byte	0x39
	.long	0xfbe
	.uleb128 0x12
	.long	.LASF329
	.byte	0x20
	.byte	0x3a
	.long	0xf3d
	.byte	0
	.uleb128 0x12
	.long	.LASF330
	.byte	0x20
	.byte	0x3d
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF331
	.byte	0x20
	.byte	0x3e
	.long	0xcc
	.byte	0x8
	.uleb128 0x12
	.long	.LASF332
	.byte	0x20
	.byte	0x3f
	.long	0xf6a
	.byte	0xc
	.uleb128 0x12
	.long	.LASF333
	.byte	0x20
	.byte	0x40
	.long	0x9d
	.byte	0xe
	.byte	0
	.uleb128 0x7
	.long	.LASF334
	.byte	0x20
	.byte	0x41
	.long	0xf75
	.uleb128 0xc
	.long	.LASF335
	.byte	0x2
	.byte	0x21
	.byte	0x20
	.long	0xfe2
	.uleb128 0x12
	.long	.LASF336
	.byte	0x21
	.byte	0x21
	.long	0x87
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF337
	.byte	0x21
	.byte	0x23
	.long	0xfc9
	.uleb128 0xc
	.long	.LASF338
	.byte	0x4
	.byte	0x22
	.byte	0x25
	.long	0x101e
	.uleb128 0x12
	.long	.LASF339
	.byte	0x22
	.byte	0x26
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF340
	.byte	0x22
	.byte	0x27
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF341
	.byte	0x22
	.byte	0x28
	.long	0xa8
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF342
	.byte	0x22
	.byte	0x29
	.long	0xfed
	.uleb128 0x1a
	.long	.LASF372
	.byte	0x4
	.long	0x3e
	.byte	0x1
	.byte	0x22
	.long	0x10d0
	.uleb128 0x9
	.long	.LASF343
	.byte	0x1
	.uleb128 0x9
	.long	.LASF344
	.byte	0x2
	.uleb128 0x9
	.long	.LASF345
	.byte	0x3
	.uleb128 0x9
	.long	.LASF346
	.byte	0x4
	.uleb128 0x9
	.long	.LASF347
	.byte	0x5
	.uleb128 0x9
	.long	.LASF348
	.byte	0x6
	.uleb128 0x9
	.long	.LASF349
	.byte	0x7
	.uleb128 0x9
	.long	.LASF350
	.byte	0x8
	.uleb128 0x9
	.long	.LASF351
	.byte	0x9
	.uleb128 0x9
	.long	.LASF352
	.byte	0xa
	.uleb128 0x9
	.long	.LASF353
	.byte	0xb
	.uleb128 0x9
	.long	.LASF354
	.byte	0xc
	.uleb128 0x9
	.long	.LASF355
	.byte	0xd
	.uleb128 0x9
	.long	.LASF356
	.byte	0xe
	.uleb128 0x9
	.long	.LASF357
	.byte	0xf
	.uleb128 0x9
	.long	.LASF358
	.byte	0x10
	.uleb128 0x9
	.long	.LASF359
	.byte	0x11
	.uleb128 0x9
	.long	.LASF360
	.byte	0x12
	.uleb128 0x9
	.long	.LASF361
	.byte	0x13
	.uleb128 0x9
	.long	.LASF362
	.byte	0x14
	.uleb128 0x9
	.long	.LASF363
	.byte	0x15
	.uleb128 0x9
	.long	.LASF364
	.byte	0x16
	.uleb128 0x9
	.long	.LASF365
	.byte	0x17
	.uleb128 0x9
	.long	.LASF366
	.byte	0x18
	.uleb128 0x9
	.long	.LASF367
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.long	.LASF368
	.byte	0x10
	.byte	0x1
	.byte	0x40
	.long	0x110d
	.uleb128 0x12
	.long	.LASF369
	.byte	0x1
	.byte	0x41
	.long	0xcc
	.byte	0
	.uleb128 0x12
	.long	.LASF269
	.byte	0x1
	.byte	0x42
	.long	0xcc
	.byte	0x4
	.uleb128 0x12
	.long	.LASF270
	.byte	0x1
	.byte	0x43
	.long	0xcc
	.byte	0x8
	.uleb128 0xd
	.string	"yaw"
	.byte	0x1
	.byte	0x44
	.long	0xcc
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.long	.LASF370
	.byte	0x1
	.byte	0x45
	.long	0x10d0
	.uleb128 0xc
	.long	.LASF371
	.byte	0x6
	.byte	0x1
	.byte	0x50
	.long	0x1155
	.uleb128 0x12
	.long	.LASF372
	.byte	0x1
	.byte	0x51
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF373
	.byte	0x1
	.byte	0x52
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF374
	.byte	0x1
	.byte	0x53
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF375
	.byte	0x1
	.byte	0x54
	.long	0xa8
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF376
	.byte	0x1
	.byte	0x5a
	.long	0x1118
	.uleb128 0xc
	.long	.LASF377
	.byte	0x6
	.byte	0x1
	.byte	0x5e
	.long	0x1191
	.uleb128 0x12
	.long	.LASF378
	.byte	0x1
	.byte	0x5f
	.long	0xa8
	.byte	0
	.uleb128 0x12
	.long	.LASF379
	.byte	0x1
	.byte	0x60
	.long	0xa8
	.byte	0x2
	.uleb128 0x12
	.long	.LASF380
	.byte	0x1
	.byte	0x61
	.long	0xa8
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF381
	.byte	0x1
	.byte	0x62
	.long	0x1160
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x23
	.byte	0x1c
	.long	0x1203
	.uleb128 0x9
	.long	.LASF382
	.byte	0
	.uleb128 0x9
	.long	.LASF383
	.byte	0x1
	.uleb128 0x9
	.long	.LASF384
	.byte	0x2
	.uleb128 0x9
	.long	.LASF385
	.byte	0x3
	.uleb128 0x9
	.long	.LASF386
	.byte	0x4
	.uleb128 0x9
	.long	.LASF387
	.byte	0x5
	.uleb128 0x9
	.long	.LASF388
	.byte	0x6
	.uleb128 0x9
	.long	.LASF389
	.byte	0x7
	.uleb128 0x9
	.long	.LASF390
	.byte	0x8
	.uleb128 0x9
	.long	.LASF391
	.byte	0x9
	.uleb128 0x9
	.long	.LASF392
	.byte	0xa
	.uleb128 0x9
	.long	.LASF393
	.byte	0xb
	.uleb128 0x9
	.long	.LASF394
	.byte	0xc
	.uleb128 0x9
	.long	.LASF395
	.byte	0xd
	.uleb128 0x9
	.long	.LASF396
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.long	.LASF397
	.byte	0x7
	.byte	0x23
	.byte	0x53
	.long	0x1264
	.uleb128 0x12
	.long	.LASF398
	.byte	0x23
	.byte	0x54
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF399
	.byte	0x23
	.byte	0x55
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF400
	.byte	0x23
	.byte	0x56
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF401
	.byte	0x23
	.byte	0x57
	.long	0x9d
	.byte	0x3
	.uleb128 0xd
	.string	"min"
	.byte	0x23
	.byte	0x58
	.long	0x7c
	.byte	0x4
	.uleb128 0xd
	.string	"max"
	.byte	0x23
	.byte	0x59
	.long	0x7c
	.byte	0x5
	.uleb128 0xd
	.string	"box"
	.byte	0x23
	.byte	0x5a
	.long	0x9d
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF402
	.byte	0x23
	.byte	0x5b
	.long	0x1203
	.uleb128 0xc
	.long	.LASF403
	.byte	0xe
	.byte	0x23
	.byte	0x69
	.long	0x12dc
	.uleb128 0xd
	.string	"min"
	.byte	0x23
	.byte	0x6a
	.long	0x87
	.byte	0
	.uleb128 0xd
	.string	"max"
	.byte	0x23
	.byte	0x6b
	.long	0x87
	.byte	0x2
	.uleb128 0x12
	.long	.LASF404
	.byte	0x23
	.byte	0x6c
	.long	0x87
	.byte	0x4
	.uleb128 0x12
	.long	.LASF400
	.byte	0x23
	.byte	0x6d
	.long	0x7c
	.byte	0x6
	.uleb128 0x12
	.long	.LASF405
	.byte	0x23
	.byte	0x6e
	.long	0x9d
	.byte	0x7
	.uleb128 0x12
	.long	.LASF406
	.byte	0x23
	.byte	0x6f
	.long	0x9d
	.byte	0x8
	.uleb128 0x12
	.long	.LASF407
	.byte	0x23
	.byte	0x70
	.long	0x7c
	.byte	0x9
	.uleb128 0x12
	.long	.LASF408
	.byte	0x23
	.byte	0x71
	.long	0xb3
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF409
	.byte	0x23
	.byte	0x72
	.long	0x126f
	.uleb128 0xc
	.long	.LASF410
	.byte	0xe
	.byte	0x23
	.byte	0x74
	.long	0x1300
	.uleb128 0x12
	.long	.LASF411
	.byte	0x23
	.byte	0x75
	.long	0x1300
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x12dc
	.long	0x1310
	.uleb128 0xb
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF412
	.byte	0x23
	.byte	0x76
	.long	0x12e7
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x24
	.byte	0x1c
	.long	0x136a
	.uleb128 0x9
	.long	.LASF413
	.byte	0
	.uleb128 0x9
	.long	.LASF414
	.byte	0x1
	.uleb128 0x9
	.long	.LASF415
	.byte	0x2
	.uleb128 0x9
	.long	.LASF416
	.byte	0x3
	.uleb128 0x9
	.long	.LASF417
	.byte	0x4
	.uleb128 0x9
	.long	.LASF418
	.byte	0x5
	.uleb128 0x9
	.long	.LASF419
	.byte	0x6
	.uleb128 0x9
	.long	.LASF420
	.byte	0x7
	.uleb128 0x9
	.long	.LASF421
	.byte	0x8
	.uleb128 0x9
	.long	.LASF422
	.byte	0x9
	.uleb128 0x9
	.long	.LASF423
	.byte	0xa
	.byte	0
	.uleb128 0xc
	.long	.LASF424
	.byte	0x2a
	.byte	0x24
	.byte	0x3d
	.long	0x13ec
	.uleb128 0xd
	.string	"P8"
	.byte	0x24
	.byte	0x3e
	.long	0x13ec
	.byte	0
	.uleb128 0xd
	.string	"I8"
	.byte	0x24
	.byte	0x3f
	.long	0x13ec
	.byte	0xa
	.uleb128 0xd
	.string	"D8"
	.byte	0x24
	.byte	0x40
	.long	0x13ec
	.byte	0x14
	.uleb128 0x12
	.long	.LASF425
	.byte	0x24
	.byte	0x41
	.long	0x9d
	.byte	0x1e
	.uleb128 0x12
	.long	.LASF426
	.byte	0x24
	.byte	0x42
	.long	0xa8
	.byte	0x20
	.uleb128 0x12
	.long	.LASF427
	.byte	0x24
	.byte	0x43
	.long	0xa8
	.byte	0x22
	.uleb128 0x12
	.long	.LASF428
	.byte	0x24
	.byte	0x44
	.long	0xa8
	.byte	0x24
	.uleb128 0x12
	.long	.LASF429
	.byte	0x24
	.byte	0x45
	.long	0x9d
	.byte	0x26
	.uleb128 0x12
	.long	.LASF430
	.byte	0x24
	.byte	0x46
	.long	0x9d
	.byte	0x27
	.uleb128 0x12
	.long	.LASF431
	.byte	0x24
	.byte	0x47
	.long	0x9d
	.byte	0x28
	.byte	0
	.uleb128 0xa
	.long	0x9d
	.long	0x13fc
	.uleb128 0xb
	.long	0x61
	.byte	0x9
	.byte	0
	.uleb128 0x7
	.long	.LASF432
	.byte	0x24
	.byte	0x48
	.long	0x136a
	.uleb128 0xc
	.long	.LASF433
	.byte	0xc
	.byte	0x25
	.byte	0x2c
	.long	0x1468
	.uleb128 0x12
	.long	.LASF434
	.byte	0x25
	.byte	0x2e
	.long	0xa8
	.byte	0
	.uleb128 0x12
	.long	.LASF435
	.byte	0x25
	.byte	0x2f
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF436
	.byte	0x25
	.byte	0x30
	.long	0x9d
	.byte	0x3
	.uleb128 0x12
	.long	.LASF437
	.byte	0x25
	.byte	0x31
	.long	0xa8
	.byte	0x4
	.uleb128 0x12
	.long	.LASF438
	.byte	0x25
	.byte	0x32
	.long	0xa8
	.byte	0x6
	.uleb128 0x12
	.long	.LASF439
	.byte	0x25
	.byte	0x33
	.long	0x9d
	.byte	0x8
	.uleb128 0x12
	.long	.LASF440
	.byte	0x25
	.byte	0x34
	.long	0xa8
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF441
	.byte	0x25
	.byte	0x35
	.long	0x1407
	.uleb128 0xc
	.long	.LASF442
	.byte	0x4
	.byte	0x25
	.byte	0x39
	.long	0x1498
	.uleb128 0x12
	.long	.LASF443
	.byte	0x25
	.byte	0x3a
	.long	0xa8
	.byte	0
	.uleb128 0x12
	.long	.LASF444
	.byte	0x25
	.byte	0x3b
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF445
	.byte	0x25
	.byte	0x3c
	.long	0x1473
	.uleb128 0xc
	.long	.LASF446
	.byte	0x8
	.byte	0x26
	.byte	0x1e
	.long	0x14f8
	.uleb128 0x12
	.long	.LASF447
	.byte	0x26
	.byte	0x1f
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF448
	.byte	0x26
	.byte	0x20
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF449
	.byte	0x26
	.byte	0x21
	.long	0xa8
	.byte	0x2
	.uleb128 0x12
	.long	.LASF450
	.byte	0x26
	.byte	0x22
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF451
	.byte	0x26
	.byte	0x23
	.long	0xa8
	.byte	0x5
	.uleb128 0x12
	.long	.LASF452
	.byte	0x26
	.byte	0x24
	.long	0x9d
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	.LASF453
	.byte	0x26
	.byte	0x25
	.long	0x14a3
	.uleb128 0xc
	.long	.LASF454
	.byte	0xc
	.byte	0x27
	.byte	0x1d
	.long	0x1564
	.uleb128 0x12
	.long	.LASF455
	.byte	0x27
	.byte	0x1e
	.long	0xa8
	.byte	0
	.uleb128 0x12
	.long	.LASF456
	.byte	0x27
	.byte	0x1f
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF457
	.byte	0x27
	.byte	0x20
	.long	0x9d
	.byte	0x3
	.uleb128 0x12
	.long	.LASF458
	.byte	0x27
	.byte	0x21
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF459
	.byte	0x27
	.byte	0x22
	.long	0xa8
	.byte	0x6
	.uleb128 0x12
	.long	.LASF460
	.byte	0x27
	.byte	0x23
	.long	0xa8
	.byte	0x8
	.uleb128 0x12
	.long	.LASF461
	.byte	0x27
	.byte	0x24
	.long	0xa8
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF462
	.byte	0x27
	.byte	0x25
	.long	0x1503
	.uleb128 0xc
	.long	.LASF463
	.byte	0x1
	.byte	0x28
	.byte	0x1d
	.long	0x1588
	.uleb128 0x12
	.long	.LASF464
	.byte	0x28
	.byte	0x1e
	.long	0x7c
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF465
	.byte	0x28
	.byte	0x1f
	.long	0x156f
	.uleb128 0xc
	.long	.LASF466
	.byte	0x3
	.byte	0x29
	.byte	0x16
	.long	0x15c4
	.uleb128 0x12
	.long	.LASF467
	.byte	0x29
	.byte	0x17
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF468
	.byte	0x29
	.byte	0x18
	.long	0x9d
	.byte	0x1
	.uleb128 0x12
	.long	.LASF469
	.byte	0x29
	.byte	0x19
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF470
	.byte	0x29
	.byte	0x1a
	.long	0x1593
	.uleb128 0xc
	.long	.LASF471
	.byte	0x1
	.byte	0x2a
	.byte	0x12
	.long	0x15e8
	.uleb128 0x12
	.long	.LASF472
	.byte	0x2a
	.byte	0x13
	.long	0x9d
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF473
	.byte	0x2a
	.byte	0x14
	.long	0x15cf
	.uleb128 0xc
	.long	.LASF474
	.byte	0x10
	.byte	0x3
	.byte	0x7c
	.long	0x1624
	.uleb128 0x12
	.long	.LASF475
	.byte	0x3
	.byte	0x7d
	.long	0x71
	.byte	0
	.uleb128 0x12
	.long	.LASF476
	.byte	0x3
	.byte	0x7e
	.long	0x8ec
	.byte	0x8
	.uleb128 0x12
	.long	.LASF477
	.byte	0x3
	.byte	0x7f
	.long	0x8ec
	.byte	0x9
	.byte	0
	.uleb128 0x7
	.long	.LASF478
	.byte	0x3
	.byte	0x80
	.long	0x15f3
	.uleb128 0x1b
	.long	.LASF569
	.byte	0x1
	.byte	0x5c
	.long	0x164c
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.byte	0x8
	.long	0x1155
	.uleb128 0x1c
	.long	.LASF495
	.byte	0x2
	.byte	0x16
	.long	0x2a5
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0x1682
	.uleb128 0x1d
	.long	.LASF127
	.byte	0x2
	.byte	0x16
	.long	0x5e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF480
	.byte	0x3
	.byte	0xdd
	.long	0x16f0
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0x16f0
	.uleb128 0x1d
	.long	.LASF476
	.byte	0x3
	.byte	0xdd
	.long	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x20
	.string	"i"
	.byte	0x3
	.byte	0xdf
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x21
	.long	.LASF479
	.byte	0x3
	.byte	0xe0
	.long	0x16f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x16f6
	.uleb128 0x6
	.long	0x1624
	.uleb128 0x1e
	.long	.LASF481
	.byte	0x3
	.byte	0xe8
	.long	0x16f0
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0x1769
	.uleb128 0x1d
	.long	.LASF477
	.byte	0x3
	.byte	0xe8
	.long	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x20
	.string	"i"
	.byte	0x3
	.byte	0xea
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x21
	.long	.LASF479
	.byte	0x3
	.byte	0xeb
	.long	0x16f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF483
	.byte	0x3
	.byte	0xf3
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0x17e1
	.uleb128 0x1d
	.long	.LASF482
	.byte	0x3
	.byte	0xf3
	.long	0x17e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.string	"dst"
	.byte	0x3
	.byte	0xf5
	.long	0x17e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1f
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x20
	.string	"i"
	.byte	0x3
	.byte	0xf6
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x20
	.string	"box"
	.byte	0x3
	.byte	0xf9
	.long	0x16f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x481
	.uleb128 0x5
	.byte	0x8
	.long	0x1ae
	.uleb128 0x22
	.long	.LASF484
	.byte	0x3
	.byte	0xff
	.quad	.LFB76
	.quad	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.long	0x1868
	.uleb128 0x1d
	.long	.LASF482
	.byte	0x3
	.byte	0xff
	.long	0x17e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x23
	.string	"dst"
	.byte	0x3
	.value	0x101
	.long	0x17e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1f
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x23
	.string	"i"
	.byte	0x3
	.value	0x102
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x23
	.string	"box"
	.byte	0x3
	.value	0x105
	.long	0x16f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF485
	.byte	0x3
	.value	0x10a
	.quad	.LFB77
	.quad	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.long	0x18b7
	.uleb128 0x23
	.string	"ena"
	.byte	0x3
	.value	0x10c
	.long	0xb3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x25
	.long	.LASF476
	.byte	0x3
	.value	0x164
	.long	0x5e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x26
	.long	.LASF486
	.byte	0x3
	.value	0x16d
	.long	0xb3
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.long	0x19a2
	.uleb128 0x25
	.long	.LASF487
	.byte	0x3
	.value	0x173
	.long	0xb3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x25
	.long	.LASF488
	.byte	0x3
	.value	0x176
	.long	0x19b7
	.uleb128 0x9
	.byte	0x3
	.quad	flightMode_boxId_map.6744
	.uleb128 0x25
	.long	.LASF489
	.byte	0x3
	.value	0x177
	.long	0x836
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x25
	.long	.LASF490
	.byte	0x3
	.value	0x184
	.long	0x19bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x25
	.long	.LASF491
	.byte	0x3
	.value	0x194
	.long	0xb3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x25
	.long	.LASF492
	.byte	0x3
	.value	0x195
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x27
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x195d
	.uleb128 0x23
	.string	"i"
	.byte	0x3
	.value	0x178
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x27
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x1980
	.uleb128 0x23
	.string	"i"
	.byte	0x3
	.value	0x187
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1f
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x25
	.long	.LASF476
	.byte	0x3
	.value	0x196
	.long	0x5e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x19b2
	.long	0x19b2
	.uleb128 0xb
	.long	0x61
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.long	0x7c
	.uleb128 0x6
	.long	0x19a2
	.uleb128 0x6
	.long	0xb3
	.uleb128 0x24
	.long	.LASF493
	.byte	0x3
	.value	0x1a0
	.quad	.LFB79
	.quad	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.long	0x19fe
	.uleb128 0x28
	.long	.LASF482
	.byte	0x3
	.value	0x1a0
	.long	0x17e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"dst"
	.byte	0x3
	.value	0x1a2
	.long	0x17e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x24
	.long	.LASF494
	.byte	0x3
	.value	0x1d0
	.quad	.LFB80
	.quad	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a3b
	.uleb128 0x28
	.long	.LASF482
	.byte	0x3
	.value	0x1d0
	.long	0x17e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"dst"
	.byte	0x3
	.value	0x1d2
	.long	0x17e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x29
	.long	.LASF496
	.byte	0x3
	.value	0x1f0
	.long	0x53
	.quad	.LFB81
	.quad	.LFE81-.LFB81
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b32
	.uleb128 0x2a
	.string	"cmd"
	.byte	0x3
	.value	0x1f0
	.long	0x17e1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x28
	.long	.LASF482
	.byte	0x3
	.value	0x1f0
	.long	0x17e1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x23
	.string	"dst"
	.byte	0x3
	.value	0x1f3
	.long	0x17e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x23
	.string	"src"
	.byte	0x3
	.value	0x1f4
	.long	0x17e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.string	"len"
	.byte	0x3
	.value	0x1f6
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x25
	.long	.LASF497
	.byte	0x3
	.value	0x233
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x27
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.long	0x1aee
	.uleb128 0x23
	.string	"i"
	.byte	0x3
	.value	0x235
	.long	0x3e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x27
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.long	0x1b11
	.uleb128 0x23
	.string	"i"
	.byte	0x3
	.value	0x237
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x1f
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x23
	.string	"i"
	.byte	0x3
	.value	0x239
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LASF570
	.byte	0x3
	.value	0x606
	.quad	.LFB82
	.quad	.LFE82-.LFB82
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x21
	.long	.LASF498
	.byte	0x2
	.byte	0x14
	.long	0xb3
	.uleb128 0x9
	.byte	0x3
	.quad	enabledSensors
	.uleb128 0x21
	.long	.LASF499
	.byte	0x3
	.byte	0x79
	.long	0x1b76
	.uleb128 0x9
	.byte	0x3
	.quad	flightControllerIdentifier
	.uleb128 0x6
	.long	0x71
	.uleb128 0x21
	.long	.LASF500
	.byte	0x3
	.byte	0x7a
	.long	0x1b76
	.uleb128 0x9
	.byte	0x3
	.quad	boardIdentifier
	.uleb128 0xa
	.long	0x16f6
	.long	0x1ba0
	.uleb128 0xb
	.long	0x61
	.byte	0x1b
	.byte	0
	.uleb128 0x21
	.long	.LASF501
	.byte	0x3
	.byte	0x82
	.long	0x1bb5
	.uleb128 0x9
	.byte	0x3
	.quad	boxes
	.uleb128 0x6
	.long	0x1b90
	.uleb128 0x21
	.long	.LASF502
	.byte	0x3
	.byte	0xa3
	.long	0xb3
	.uleb128 0x9
	.byte	0x3
	.quad	activeBoxIds
	.uleb128 0xa
	.long	0x77
	.long	0x1bdf
	.uleb128 0xb
	.long	0x61
	.byte	0x2f
	.byte	0
	.uleb128 0x21
	.long	.LASF503
	.byte	0x3
	.byte	0xa8
	.long	0x1bf4
	.uleb128 0x9
	.byte	0x3
	.quad	pidnames
	.uleb128 0x6
	.long	0x1bcf
	.uleb128 0x2c
	.long	.LASF504
	.byte	0x2b
	.byte	0xc8
	.long	0xb3
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x2c
	.long	.LASF505
	.byte	0x2b
	.byte	0xc9
	.long	0xb3
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x2c
	.long	.LASF506
	.byte	0x2b
	.byte	0xca
	.long	0xb3
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x2c
	.long	.LASF507
	.byte	0x8
	.byte	0x43
	.long	0x1c4d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x5
	.byte	0x8
	.long	0x252
	.uleb128 0x2c
	.long	.LASF508
	.byte	0x8
	.byte	0x44
	.long	0x1c4d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x2c
	.long	.LASF509
	.byte	0x8
	.byte	0x47
	.long	0x1a8
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x2c
	.long	.LASF510
	.byte	0x8
	.byte	0x48
	.long	0x1a8
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x2c
	.long	.LASF511
	.byte	0x9
	.byte	0x18
	.long	0x276
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x2c
	.long	.LASF512
	.byte	0xa
	.byte	0x1a
	.long	0x29a
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_System
	.uleb128 0x2c
	.long	.LASF513
	.byte	0xd
	.byte	0x80
	.long	0x445
	.uleb128 0x9
	.byte	0x3
	.quad	rxConfig_System
	.uleb128 0xa
	.long	0x351
	.long	0x1ce1
	.uleb128 0xb
	.long	0x61
	.byte	0x11
	.byte	0
	.uleb128 0x2d
	.long	.LASF514
	.byte	0xd
	.byte	0x82
	.long	0x1cd1
	.uleb128 0xa
	.long	0x381
	.long	0x1cfc
	.uleb128 0xb
	.long	0x61
	.byte	0x3
	.byte	0
	.uleb128 0x2d
	.long	.LASF515
	.byte	0xd
	.byte	0x83
	.long	0x1cec
	.uleb128 0xa
	.long	0x4f9
	.long	0x1d17
	.uleb128 0xb
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0x2d
	.long	.LASF516
	.byte	0xf
	.byte	0x20
	.long	0x1d07
	.uleb128 0x2d
	.long	.LASF517
	.byte	0xf
	.byte	0x28
	.long	0x1d2d
	.uleb128 0x5
	.byte	0x8
	.long	0x51d
	.uleb128 0x2d
	.long	.LASF518
	.byte	0x10
	.byte	0x85
	.long	0x1d3e
	.uleb128 0x5
	.byte	0x8
	.long	0x683
	.uleb128 0x2d
	.long	.LASF519
	.byte	0x10
	.byte	0x92
	.long	0x1d4f
	.uleb128 0x5
	.byte	0x8
	.long	0x6e3
	.uleb128 0x2c
	.long	.LASF520
	.byte	0x10
	.byte	0x9c
	.long	0x72b
	.uleb128 0x9
	.byte	0x3
	.quad	armingConfig_System
	.uleb128 0x2d
	.long	.LASF521
	.byte	0x11
	.byte	0x7e
	.long	0x1d75
	.uleb128 0x5
	.byte	0x8
	.long	0x7b3
	.uleb128 0x2d
	.long	.LASF522
	.byte	0x12
	.byte	0x1b
	.long	0x9d
	.uleb128 0x2d
	.long	.LASF523
	.byte	0x12
	.byte	0x30
	.long	0xa8
	.uleb128 0x2d
	.long	.LASF524
	.byte	0x2c
	.byte	0x48
	.long	0xa8
	.uleb128 0x2c
	.long	.LASF525
	.byte	0x14
	.byte	0x20
	.long	0x946
	.uleb128 0x9
	.byte	0x3
	.quad	motorAndServoConfig_System
	.uleb128 0x2c
	.long	.LASF526
	.byte	0x15
	.byte	0x45
	.long	0xa30
	.uleb128 0x9
	.byte	0x3
	.quad	gpsConfig_System
	.uleb128 0x2d
	.long	.LASF527
	.byte	0x16
	.byte	0x1f
	.long	0x1dd1
	.uleb128 0x5
	.byte	0x8
	.long	0xa54
	.uleb128 0x2c
	.long	.LASF528
	.byte	0x17
	.byte	0x65
	.long	0xb34
	.uleb128 0x9
	.byte	0x3
	.quad	serialConfig_System
	.uleb128 0xa
	.long	0xba7
	.long	0x1dfc
	.uleb128 0xb
	.long	0x61
	.byte	0x1f
	.byte	0
	.uleb128 0x2d
	.long	.LASF529
	.byte	0x18
	.byte	0x95
	.long	0x1dec
	.uleb128 0xa
	.long	0x178
	.long	0x1e17
	.uleb128 0xb
	.long	0x61
	.byte	0xf
	.byte	0
	.uleb128 0x2d
	.long	.LASF530
	.byte	0x18
	.byte	0x96
	.long	0x1e07
	.uleb128 0xa
	.long	0xb68
	.long	0x1e32
	.uleb128 0xb
	.long	0x61
	.byte	0x5
	.byte	0
	.uleb128 0x2d
	.long	.LASF531
	.byte	0x18
	.byte	0x97
	.long	0x1e22
	.uleb128 0x2c
	.long	.LASF532
	.byte	0x18
	.byte	0x98
	.long	0xb9c
	.uleb128 0x9
	.byte	0x3
	.quad	specialColors_System
	.uleb128 0x2c
	.long	.LASF533
	.byte	0x19
	.byte	0x18
	.long	0xbcb
	.uleb128 0x9
	.byte	0x3
	.quad	transponderConfig_System
	.uleb128 0x2c
	.long	.LASF534
	.byte	0x1a
	.byte	0x24
	.long	0xc07
	.uleb128 0x9
	.byte	0x3
	.quad	telemetryConfig_System
	.uleb128 0x2c
	.long	.LASF535
	.byte	0x1b
	.byte	0x1a
	.long	0xc43
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_System
	.uleb128 0x2c
	.long	.LASF536
	.byte	0x1c
	.byte	0x56
	.long	0xddf
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x2c
	.long	.LASF537
	.byte	0x1c
	.byte	0x57
	.long	0xda3
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x2c
	.long	.LASF538
	.byte	0x1c
	.byte	0x58
	.long	0xe0f
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0xa
	.long	0xe3f
	.long	0x1ee0
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x2d
	.long	.LASF539
	.byte	0x1d
	.byte	0x1d
	.long	0x1ed0
	.uleb128 0xa
	.long	0xe7b
	.long	0x1efb
	.uleb128 0xb
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x2d
	.long	.LASF540
	.byte	0x1e
	.byte	0x26
	.long	0x1eeb
	.uleb128 0x2c
	.long	.LASF541
	.byte	0x1f
	.byte	0x1c
	.long	0xecf
	.uleb128 0x9
	.byte	0x3
	.quad	batteryConfig_System
	.uleb128 0x2e
	.string	"acc"
	.byte	0x20
	.byte	0x26
	.long	0x321
	.uleb128 0x2d
	.long	.LASF542
	.byte	0x20
	.byte	0x43
	.long	0x1f31
	.uleb128 0x5
	.byte	0x8
	.long	0xfbe
	.uleb128 0x2d
	.long	.LASF543
	.byte	0x21
	.byte	0x25
	.long	0x1f42
	.uleb128 0x5
	.byte	0x8
	.long	0xfe2
	.uleb128 0xa
	.long	0x92
	.long	0x1f58
	.uleb128 0xb
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0x2d
	.long	.LASF544
	.byte	0x21
	.byte	0x2e
	.long	0x1f48
	.uleb128 0x2d
	.long	.LASF545
	.byte	0x22
	.byte	0x23
	.long	0x1f48
	.uleb128 0x2c
	.long	.LASF546
	.byte	0x22
	.byte	0x2b
	.long	0x101e
	.uleb128 0x9
	.byte	0x3
	.quad	gyroConfig_System
	.uleb128 0xa
	.long	0x110d
	.long	0x1f93
	.uleb128 0xb
	.long	0x61
	.byte	0x3
	.byte	0
	.uleb128 0x2d
	.long	.LASF547
	.byte	0x1
	.byte	0x47
	.long	0x1f83
	.uleb128 0x2c
	.long	.LASF548
	.byte	0x1
	.byte	0x5c
	.long	0x1155
	.uleb128 0x9
	.byte	0x3
	.quad	mixerConfig_System
	.uleb128 0x2c
	.long	.LASF549
	.byte	0x1
	.byte	0x64
	.long	0x1191
	.uleb128 0x9
	.byte	0x3
	.quad	motor3DConfig_System
	.uleb128 0x2c
	.long	.LASF550
	.byte	0x23
	.byte	0x2d
	.long	0x119c
	.uleb128 0x9
	.byte	0x3
	.quad	inputSource_e
	.uleb128 0xa
	.long	0x1264
	.long	0x1fed
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x2d
	.long	.LASF551
	.byte	0x23
	.byte	0x61
	.long	0x1fdd
	.uleb128 0x2d
	.long	.LASF552
	.byte	0x23
	.byte	0x78
	.long	0x2003
	.uleb128 0x5
	.byte	0x8
	.long	0x1310
	.uleb128 0x2d
	.long	.LASF553
	.byte	0x24
	.byte	0x4a
	.long	0x2014
	.uleb128 0x5
	.byte	0x8
	.long	0x13fc
	.uleb128 0x2d
	.long	.LASF554
	.byte	0x25
	.byte	0x18
	.long	0xcd2
	.uleb128 0x2c
	.long	.LASF555
	.byte	0x25
	.byte	0x37
	.long	0x1468
	.uleb128 0x9
	.byte	0x3
	.quad	imuConfig_System
	.uleb128 0x2d
	.long	.LASF556
	.byte	0x25
	.byte	0x3e
	.long	0x2045
	.uleb128 0x5
	.byte	0x8
	.long	0x1498
	.uleb128 0x2c
	.long	.LASF557
	.byte	0x26
	.byte	0x49
	.long	0x14f8
	.uleb128 0x9
	.byte	0x3
	.quad	failsafeConfig_System
	.uleb128 0x2d
	.long	.LASF558
	.byte	0x27
	.byte	0x27
	.long	0x206b
	.uleb128 0x5
	.byte	0x8
	.long	0x1564
	.uleb128 0x2c
	.long	.LASF559
	.byte	0x28
	.byte	0x21
	.long	0x1588
	.uleb128 0x9
	.byte	0x3
	.quad	airplaneConfig_System
	.uleb128 0x2c
	.long	.LASF560
	.byte	0x29
	.byte	0x1c
	.long	0x15c4
	.uleb128 0x9
	.byte	0x3
	.quad	blackboxConfig_System
	.uleb128 0x2d
	.long	.LASF561
	.byte	0x2d
	.byte	0x1f
	.long	0x1b76
	.uleb128 0x2d
	.long	.LASF562
	.byte	0x2d
	.byte	0x22
	.long	0x1b76
	.uleb128 0x2d
	.long	.LASF563
	.byte	0x2d
	.byte	0x25
	.long	0x1b76
	.uleb128 0x2c
	.long	.LASF564
	.byte	0x2a
	.byte	0x16
	.long	0x15e8
	.uleb128 0x9
	.byte	0x3
	.quad	mspServerConfig_System
	.uleb128 0x2d
	.long	.LASF565
	.byte	0x3
	.byte	0x75
	.long	0xa8
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x26
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.long	0xdc
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB59
	.quad	.LFE59-.LFB59
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
	.quad	.LFB59
	.quad	.LFE59
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF145:
	.string	"auto_disarm_delay"
.LASF399:
	.string	"inputSource"
.LASF27:
	.string	"RGB_GREEN"
.LASF414:
	.string	"PIDPITCH"
.LASF473:
	.string	"mspServerConfig_t"
.LASF193:
	.string	"FEATURE_TRANSPONDER"
.LASF194:
	.string	"motorAndServoConfig_s"
.LASF201:
	.string	"motorAndServoConfig_t"
.LASF242:
	.string	"reboot_character"
.LASF166:
	.string	"UNUSED_MODE"
.LASF245:
	.string	"modeColorIndexes_s"
.LASF247:
	.string	"modeColorIndexes_t"
.LASF172:
	.string	"FEATURE_RX_PPM"
.LASF199:
	.string	"motor_pwm_rate"
.LASF298:
	.string	"mag_hardware"
.LASF507:
	.string	"__pg_registry_start"
.LASF398:
	.string	"targetChannel"
.LASF46:
	.string	"_Bool"
.LASF65:
	.string	"spektrum_sat_bind"
.LASF452:
	.string	"failsafe_procedure"
.LASF503:
	.string	"pidnames"
.LASF218:
	.string	"provider"
.LASF413:
	.string	"PIDROLL"
.LASF449:
	.string	"failsafe_throttle"
.LASF563:
	.string	"buildTime"
.LASF368:
	.string	"motorMixer_s"
.LASF370:
	.string	"motorMixer_t"
.LASF287:
	.string	"CW90_DEG_FLIP"
.LASF347:
	.string	"MIXER_GIMBAL"
.LASF144:
	.string	"disarm_kill_switch"
.LASF513:
	.string	"rxConfig_System"
.LASF289:
	.string	"CW270_DEG_FLIP"
.LASF429:
	.string	"deltaMethod"
.LASF140:
	.string	"deadband3d_throttle"
.LASF204:
	.string	"gpsProvider_e"
.LASF542:
	.string	"accelerometerConfig_ProfileCurrent"
.LASF217:
	.string	"gpsConfig_s"
.LASF222:
	.string	"gpsConfig_t"
.LASF51:
	.string	"read"
.LASF213:
	.string	"gpsAutoConfig_e"
.LASF361:
	.string	"MIXER_PPM_TO_SERVO"
.LASF57:
	.string	"step"
.LASF518:
	.string	"modeActivationProfile_ProfileCurrent"
.LASF182:
	.string	"FEATURE_TELEMETRY"
.LASF28:
	.string	"RGB_BLUE"
.LASF13:
	.string	"uint16_t"
.LASF404:
	.string	"middle"
.LASF329:
	.string	"accelerometerTrims"
.LASF208:
	.string	"SBAS_MSAS"
.LASF439:
	.string	"small_angle"
.LASF251:
	.string	"transponderConfig_s"
.LASF253:
	.string	"transponderConfig_t"
.LASF392:
	.string	"INPUT_RC_AUX3"
.LASF510:
	.string	"__pg_resetdata_end"
.LASF136:
	.string	"yaw_deadband"
.LASF385:
	.string	"INPUT_STABILIZED_THROTTLE"
.LASF243:
	.string	"portConfigs"
.LASF394:
	.string	"INPUT_GIMBAL_PITCH"
.LASF79:
	.string	"controlRateConfig_s"
.LASF88:
	.string	"controlRateConfig_t"
.LASF113:
	.string	"BOXSONAR"
.LASF570:
	.string	"mspInit"
.LASF422:
	.string	"PIDVEL"
.LASF530:
	.string	"colors_SystemArray"
.LASF55:
	.string	"rxFailsafeChannelConfiguration_s"
.LASF129:
	.string	"range"
.LASF357:
	.string	"MIXER_HELI_120_CCPM"
.LASF494:
	.string	"serializeDataflashSummaryReply"
.LASF11:
	.string	"int32_t"
.LASF238:
	.string	"functionMask"
.LASF122:
	.string	"channelRange_s"
.LASF125:
	.string	"channelRange_t"
.LASF567:
	.string	"src/main/fc/msp_server_fc.c"
.LASF515:
	.string	"channelRanges_SystemArray"
.LASF69:
	.string	"rcSmoothing"
.LASF548:
	.string	"mixerConfig_System"
.LASF212:
	.string	"GPS_AUTOCONFIG_ON"
.LASF272:
	.string	"values"
.LASF96:
	.string	"BOXMAG"
.LASF349:
	.string	"MIXER_HEX6"
.LASF545:
	.string	"gyroADC"
.LASF511:
	.string	"featureConfig_System"
.LASF83:
	.string	"thrExpo8"
.LASF207:
	.string	"SBAS_WAAS"
.LASF49:
	.string	"acc_s"
.LASF54:
	.string	"acc_t"
.LASF180:
	.string	"FEATURE_FAILSAFE"
.LASF215:
	.string	"GPS_AUTOBAUD_ON"
.LASF216:
	.string	"gpsAutoBaud_e"
.LASF61:
	.string	"rxConfig_s"
.LASF75:
	.string	"rxConfig_t"
.LASF369:
	.string	"throttle"
.LASF76:
	.string	"mspPacket_s"
.LASF78:
	.string	"mspPacket_t"
.LASF94:
	.string	"BOXHORIZON"
.LASF133:
	.string	"modeActivationProfile_t"
.LASF124:
	.string	"endStep"
.LASF430:
	.string	"horizon_tilt_effect"
.LASF286:
	.string	"CW0_DEG_FLIP"
.LASF66:
	.string	"rssi_channel"
.LASF22:
	.string	"FD_INDEX_COUNT"
.LASF524:
	.string	"averageSystemLoadPercent"
.LASF448:
	.string	"failsafe_off_delay"
.LASF143:
	.string	"retarded_arm"
.LASF185:
	.string	"FEATURE_RX_PARALLEL_PWM"
.LASF276:
	.string	"SENSOR_BARO"
.LASF416:
	.string	"PIDALT"
.LASF107:
	.string	"BOXLLIGHTS"
.LASF200:
	.string	"servo_pwm_rate"
.LASF426:
	.string	"yaw_p_limit"
.LASF181:
	.string	"FEATURE_SONAR"
.LASF552:
	.string	"servoProfile_ProfileCurrent"
.LASF367:
	.string	"MIXER_CUSTOM_TRI"
.LASF173:
	.string	"FEATURE_VBAT"
.LASF203:
	.string	"GPS_UBLOX"
.LASF348:
	.string	"MIXER_Y6"
.LASF380:
	.string	"neutral3d"
.LASF418:
	.string	"PIDPOSR"
.LASF171:
	.string	"flightModeFlags_e"
.LASF531:
	.string	"modeColors_SystemArray"
.LASF406:
	.string	"angleAtMax"
.LASF234:
	.string	"SERIAL_PORT_IDENTIFIER_MAX"
.LASF496:
	.string	"mspServerCommandHandler"
.LASF64:
	.string	"sbus_inversion"
.LASF364:
	.string	"MIXER_ATAIL4"
.LASF356:
	.string	"MIXER_AIRPLANE"
.LASF282:
	.string	"CW0_DEG"
.LASF269:
	.string	"roll"
.LASF70:
	.string	"midrc"
.LASF271:
	.string	"flightDynamicsTrims_def_t"
.LASF491:
	.string	"mspBoxEnabledMask"
.LASF149:
	.string	"adjustmentFunction"
.LASF285:
	.string	"CW270_DEG"
.LASF340:
	.string	"gyro_lpf"
.LASF191:
	.string	"FEATURE_BLACKBOX"
.LASF485:
	.string	"initActiveBoxIds"
.LASF56:
	.string	"mode"
.LASF214:
	.string	"GPS_AUTOBAUD_OFF"
.LASF266:
	.string	"SENSOR_INDEX_BARO"
.LASF221:
	.string	"autoBaud"
.LASF265:
	.string	"SENSOR_INDEX_ACC"
.LASF279:
	.string	"SENSOR_GPS"
.LASF160:
	.string	"HORIZON_MODE"
.LASF1:
	.string	"unsigned char"
.LASF176:
	.string	"FEATURE_MOTOR_STOP"
.LASF175:
	.string	"FEATURE_RX_SERIAL"
.LASF480:
	.string	"findBoxByBoxId"
.LASF148:
	.string	"adjustmentRange_s"
.LASF152:
	.string	"adjustmentRange_t"
.LASF86:
	.string	"rcYawExpo8"
.LASF17:
	.string	"float"
.LASF315:
	.string	"vbatmaxcellvoltage"
.LASF92:
	.string	"BOXARM"
.LASF169:
	.string	"FAILSAFE_MODE"
.LASF71:
	.string	"mincheck"
.LASF425:
	.string	"pidController"
.LASF488:
	.string	"flightMode_boxId_map"
.LASF108:
	.string	"BOXCALIB"
.LASF35:
	.string	"pgRegistry_s"
.LASF39:
	.string	"pgRegistry_t"
.LASF318:
	.string	"batteryCapacity"
.LASF178:
	.string	"FEATURE_SOFTSERIAL"
.LASF562:
	.string	"buildDate"
.LASF403:
	.string	"servoParam_s"
.LASF409:
	.string	"servoParam_t"
.LASF281:
	.string	"ALIGN_DEFAULT"
.LASF104:
	.string	"BOXBEEPERON"
.LASF305:
	.string	"amperageMeterConfig_s"
.LASF308:
	.string	"amperageMeterConfig_t"
.LASF474:
	.string	"box_e"
.LASF72:
	.string	"maxcheck"
.LASF478:
	.string	"box_t"
.LASF50:
	.string	"init"
.LASF189:
	.string	"FEATURE_DISPLAY"
.LASF365:
	.string	"MIXER_CUSTOM"
.LASF248:
	.string	"specialColorIndexes_s"
.LASF209:
	.string	"SBAS_GAGAN"
.LASF202:
	.string	"GPS_NMEA"
.LASF366:
	.string	"MIXER_CUSTOM_AIRPLANE"
.LASF564:
	.string	"mspServerConfig_System"
.LASF121:
	.string	"boxId_e"
.LASF114:
	.string	"BOXSERVO1"
.LASF115:
	.string	"BOXSERVO2"
.LASF116:
	.string	"BOXSERVO3"
.LASF87:
	.string	"tpa_breakpoint"
.LASF219:
	.string	"sbasMode"
.LASF254:
	.string	"telemetryConfig_s"
.LASF258:
	.string	"telemetryConfig_t"
.LASF415:
	.string	"PIDYAW"
.LASF330:
	.string	"acc_cut_hz"
.LASF161:
	.string	"MAG_MODE"
.LASF48:
	.string	"sensorAccInitFuncPtr"
.LASF493:
	.string	"serializeSDCardSummaryReply"
.LASF36:
	.string	"size"
.LASF162:
	.string	"BARO_MODE"
.LASF74:
	.string	"rx_max_usec"
.LASF363:
	.string	"MIXER_SINGLECOPTER"
.LASF168:
	.string	"SONAR_MODE"
.LASF482:
	.string	"reply"
.LASF34:
	.string	"pgResetFunc"
.LASF237:
	.string	"identifier"
.LASF12:
	.string	"uint8_t"
.LASF267:
	.string	"SENSOR_INDEX_MAG"
.LASF158:
	.string	"ARMED"
.LASF373:
	.string	"pid_at_min_throttle"
.LASF353:
	.string	"MIXER_OCTOX8"
.LASF174:
	.string	"FEATURE_INFLIGHT_ACC_CAL"
.LASF501:
	.string	"boxes"
.LASF498:
	.string	"enabledSensors"
.LASF303:
	.string	"magZero"
.LASF226:
	.string	"SERIAL_PORT_UART1"
.LASF227:
	.string	"SERIAL_PORT_UART2"
.LASF228:
	.string	"SERIAL_PORT_UART3"
.LASF229:
	.string	"SERIAL_PORT_UART4"
.LASF230:
	.string	"SERIAL_PORT_UART5"
.LASF395:
	.string	"INPUT_GIMBAL_ROLL"
.LASF20:
	.string	"FD_PITCH"
.LASF154:
	.string	"adjustmentRanges"
.LASF389:
	.string	"INPUT_RC_THROTTLE"
.LASF568:
	.string	"/home/aravind/git/cleanflight"
.LASF505:
	.string	"U_ID_1"
.LASF541:
	.string	"batteryConfig_System"
.LASF344:
	.string	"MIXER_QUADP"
.LASF345:
	.string	"MIXER_QUADX"
.LASF67:
	.string	"rssi_scale"
.LASF460:
	.string	"nav_speed_max"
.LASF82:
	.string	"thrMid8"
.LASF407:
	.string	"forwardFromChannel"
.LASF540:
	.string	"voltageMeterConfig_SystemArray"
.LASF465:
	.string	"airplaneConfig_t"
.LASF458:
	.string	"nav_controls_heading"
.LASF343:
	.string	"MIXER_TRI"
.LASF543:
	.string	"compassConfig_ProfileCurrent"
.LASF278:
	.string	"SENSOR_SONAR"
.LASF192:
	.string	"FEATURE_CHANNEL_FORWARDING"
.LASF481:
	.string	"findBoxByPermenantId"
.LASF210:
	.string	"sbasMode_e"
.LASF387:
	.string	"INPUT_RC_PITCH"
.LASF250:
	.string	"ledConfig_t"
.LASF547:
	.string	"customMotorMixer_SystemArray"
.LASF275:
	.string	"SENSOR_ACC"
.LASF37:
	.string	"address"
.LASF291:
	.string	"sensorAlignmentConfig_s"
.LASF295:
	.string	"sensorAlignmentConfig_t"
.LASF268:
	.string	"int16_flightDynamicsTrims_s"
.LASF428:
	.string	"yaw_lpf"
.LASF383:
	.string	"INPUT_STABILIZED_PITCH"
.LASF270:
	.string	"pitch"
.LASF255:
	.string	"telemetry_switch"
.LASF424:
	.string	"pidProfile_s"
.LASF432:
	.string	"pidProfile_t"
.LASF294:
	.string	"mag_align"
.LASF43:
	.string	"profileSelection_s"
.LASF45:
	.string	"profileSelection_t"
.LASF484:
	.string	"serializeBoxIdsReply"
.LASF522:
	.string	"armingFlags"
.LASF206:
	.string	"SBAS_EGNOS"
.LASF127:
	.string	"modeId"
.LASF150:
	.string	"auxSwitchChannelIndex"
.LASF477:
	.string	"permanentId"
.LASF93:
	.string	"BOXANGLE"
.LASF260:
	.string	"rollDegrees"
.LASF446:
	.string	"failsafeConfig_s"
.LASF453:
	.string	"failsafeConfig_t"
.LASF309:
	.string	"voltageMeterConfig_s"
.LASF313:
	.string	"voltageMeterConfig_t"
.LASF220:
	.string	"autoConfig"
.LASF554:
	.string	"accSmooth"
.LASF319:
	.string	"amperageMeterSource"
.LASF25:
	.string	"ANGLE_INDEX_COUNT"
.LASF326:
	.string	"accDeadband_s"
.LASF273:
	.string	"flightDynamicsTrims_t"
.LASF323:
	.string	"flightDynamicsTrims_u"
.LASF77:
	.string	"result"
.LASF256:
	.string	"telemetry_inversion"
.LASF9:
	.string	"int8_t"
.LASF519:
	.string	"rcControlsConfig_ProfileCurrent"
.LASF195:
	.string	"minthrottle"
.LASF153:
	.string	"adjustmentProfile_s"
.LASF155:
	.string	"adjustmentProfile_t"
.LASF408:
	.string	"reversedSources"
.LASF533:
	.string	"transponderConfig_System"
.LASF502:
	.string	"activeBoxIds"
.LASF164:
	.string	"GPS_HOLD_MODE"
.LASF538:
	.string	"sensorTrims_System"
.LASF38:
	.string	"reset"
.LASF359:
	.string	"MIXER_VTAIL4"
.LASF443:
	.string	"throttle_correction_angle"
.LASF7:
	.string	"sizetype"
.LASF165:
	.string	"HEADFREE_MODE"
.LASF292:
	.string	"gyro_align"
.LASF384:
	.string	"INPUT_STABILIZED_YAW"
.LASF390:
	.string	"INPUT_RC_AUX1"
.LASF391:
	.string	"INPUT_RC_AUX2"
.LASF196:
	.string	"maxthrottle"
.LASF393:
	.string	"INPUT_RC_AUX4"
.LASF459:
	.string	"nav_speed_min"
.LASF10:
	.string	"int16_t"
.LASF2:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF126:
	.string	"modeActivationCondition_s"
.LASF130:
	.string	"modeActivationCondition_t"
.LASF371:
	.string	"mixerConfig_s"
.LASF376:
	.string	"mixerConfig_t"
.LASF302:
	.string	"accZero"
.LASF490:
	.string	"rcModeCopyMask"
.LASF187:
	.string	"FEATURE_RSSI_ADC"
.LASF532:
	.string	"specialColors_System"
.LASF259:
	.string	"boardAlignment_s"
.LASF263:
	.string	"boardAlignment_t"
.LASF99:
	.string	"BOXCAMSTAB"
.LASF19:
	.string	"FD_ROLL"
.LASF53:
	.string	"revisionCode"
.LASF232:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF233:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF346:
	.string	"MIXER_BICOPTER"
.LASF119:
	.string	"BOXAIRMODE"
.LASF328:
	.string	"accelerometerConfig_s"
.LASF334:
	.string	"accelerometerConfig_t"
.LASF63:
	.string	"serialrx_provider"
.LASF131:
	.string	"modeActivationProfile_s"
.LASF566:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF332:
	.string	"accDeadband"
.LASF528:
	.string	"serialConfig_System"
.LASF197:
	.string	"mincommand"
.LASF539:
	.string	"amperageMeterConfig_SystemArray"
.LASF97:
	.string	"BOXHEADFREE"
.LASF427:
	.string	"dterm_lpf"
.LASF156:
	.string	"OK_TO_ARM"
.LASF454:
	.string	"gpsProfile_s"
.LASF462:
	.string	"gpsProfile_t"
.LASF351:
	.string	"MIXER_Y4"
.LASF310:
	.string	"vbatscale"
.LASF118:
	.string	"BOXFAILSAFE"
.LASF556:
	.string	"throttleCorrectionConfig_ProfileCurrent"
.LASF521:
	.string	"adjustmentProfile_ProfileCurrent"
.LASF231:
	.string	"SERIAL_PORT_USB_VCP"
.LASF489:
	.string	"flightModeCopyMask"
.LASF301:
	.string	"sensorTrims_s"
.LASF304:
	.string	"sensorTrims_t"
.LASF405:
	.string	"angleAtMin"
.LASF21:
	.string	"FD_YAW"
.LASF6:
	.string	"long int"
.LASF350:
	.string	"MIXER_FLYING_WING"
.LASF377:
	.string	"motor3DConfig_s"
.LASF381:
	.string	"motor3DConfig_t"
.LASF358:
	.string	"MIXER_HELI_90_DEG"
.LASF354:
	.string	"MIXER_OCTOFLATP"
.LASF526:
	.string	"gpsConfig_System"
.LASF497:
	.string	"scale_shift"
.LASF355:
	.string	"MIXER_OCTOFLATX"
.LASF41:
	.string	"enabledFeatures"
.LASF110:
	.string	"BOXOSD"
.LASF293:
	.string	"acc_align"
.LASF246:
	.string	"color"
.LASF280:
	.string	"SENSOR_GPSMAG"
.LASF447:
	.string	"failsafe_delay"
.LASF558:
	.string	"gpsProfile_ProfileCurrent"
.LASF112:
	.string	"BOXGTUNE"
.LASF314:
	.string	"batteryConfig_s"
.LASF320:
	.string	"batteryConfig_t"
.LASF508:
	.string	"__pg_registry_end"
.LASF257:
	.string	"telemetry_send_cells"
.LASF297:
	.string	"acc_hardware"
.LASF14:
	.string	"uint32_t"
.LASF553:
	.string	"pidProfile_ProfileCurrent"
.LASF311:
	.string	"vbatresdivval"
.LASF557:
	.string	"failsafeConfig_System"
.LASF157:
	.string	"PREVENT_ARMING"
.LASF500:
	.string	"boardIdentifier"
.LASF469:
	.string	"device"
.LASF520:
	.string	"armingConfig_System"
.LASF517:
	.string	"rateProfileSelection_ProfileCurrent"
.LASF102:
	.string	"BOXGPSHOLD"
.LASF435:
	.string	"gyroSync"
.LASF475:
	.string	"boxName"
.LASF142:
	.string	"armingConfig_s"
.LASF147:
	.string	"armingConfig_t"
.LASF117:
	.string	"BOXBLACKBOX"
.LASF0:
	.string	"long unsigned int"
.LASF98:
	.string	"BOXHEADADJ"
.LASF468:
	.string	"rate_denom"
.LASF338:
	.string	"gyroConfig_s"
.LASF342:
	.string	"gyroConfig_t"
.LASF101:
	.string	"BOXGPSHOME"
.LASF52:
	.string	"acc_1G"
.LASF527:
	.string	"gimbalConfig_ProfileCurrent"
.LASF190:
	.string	"FEATURE_ONESHOT125"
.LASF8:
	.string	"char"
.LASF417:
	.string	"PIDPOS"
.LASF397:
	.string	"servoMixer_s"
.LASF402:
	.string	"servoMixer_t"
.LASF81:
	.string	"rcExpo8"
.LASF463:
	.string	"airplaneConfig_s"
.LASF239:
	.string	"baudRates"
.LASF30:
	.string	"hsvColor_s"
.LASF29:
	.string	"hsvColor_t"
.LASF105:
	.string	"BOXLEDMAX"
.LASF341:
	.string	"soft_gyro_lpf_hz"
.LASF84:
	.string	"rates"
.LASF225:
	.string	"SERIAL_PORT_NONE"
.LASF68:
	.string	"rssi_ppm_invert"
.LASF211:
	.string	"GPS_AUTOCONFIG_OFF"
.LASF95:
	.string	"BOXBARO"
.LASF277:
	.string	"SENSOR_MAG"
.LASF90:
	.string	"defaultRateProfileIndex"
.LASF47:
	.string	"sensorReadFuncPtr"
.LASF525:
	.string	"motorAndServoConfig_System"
.LASF534:
	.string	"telemetryConfig_System"
.LASF288:
	.string	"CW180_DEG_FLIP"
.LASF569:
	.string	"mixerConfig"
.LASF464:
	.string	"fixedwing_althold_dir"
.LASF163:
	.string	"GPS_HOME_MODE"
.LASF177:
	.string	"FEATURE_SERVO_TILT"
.LASF205:
	.string	"SBAS_AUTO"
.LASF451:
	.string	"failsafe_throttle_low_delay"
.LASF58:
	.string	"rxFailsafeChannelConfig_t"
.LASF382:
	.string	"INPUT_STABILIZED_ROLL"
.LASF159:
	.string	"ANGLE_MODE"
.LASF299:
	.string	"baro_hardware"
.LASF388:
	.string	"INPUT_RC_YAW"
.LASF327:
	.string	"accDeadband_t"
.LASF472:
	.string	"multiwiiCurrentMeterOutput"
.LASF396:
	.string	"INPUT_SOURCE_COUNT"
.LASF516:
	.string	"controlRateProfiles_SystemArray"
.LASF442:
	.string	"throttleCorrectionConfig_s"
.LASF445:
	.string	"throttleCorrectionConfig_t"
.LASF146:
	.string	"max_arm_angle"
.LASF223:
	.string	"gimbalConfig_s"
.LASF224:
	.string	"gimbalConfig_t"
.LASF283:
	.string	"CW90_DEG"
.LASF236:
	.string	"serialPortConfig_s"
.LASF240:
	.string	"serialPortConfig_t"
.LASF290:
	.string	"sensor_align_e"
.LASF509:
	.string	"__pg_resetdata_start"
.LASF322:
	.string	"rollAndPitchTrims_t_def"
.LASF537:
	.string	"sensorAlignmentConfig_System"
.LASF431:
	.string	"horizon_tilt_mode"
.LASF374:
	.string	"yaw_motor_direction"
.LASF461:
	.string	"ap_mode"
.LASF362:
	.string	"MIXER_DUALCOPTER"
.LASF111:
	.string	"BOXTELEMETRY"
.LASF261:
	.string	"pitchDegrees"
.LASF421:
	.string	"PIDMAG"
.LASF40:
	.string	"featureConfig_s"
.LASF42:
	.string	"featureConfig_t"
.LASF18:
	.string	"double"
.LASF565:
	.string	"cycleTime"
.LASF560:
	.string	"blackboxConfig_System"
.LASF555:
	.string	"imuConfig_System"
.LASF123:
	.string	"startStep"
.LASF44:
	.string	"current_profile_index"
.LASF186:
	.string	"FEATURE_RX_MSP"
.LASF179:
	.string	"FEATURE_GPS"
.LASF401:
	.string	"speed"
.LASF134:
	.string	"rcControlsConfig_s"
.LASF141:
	.string	"rcControlsConfig_t"
.LASF306:
	.string	"scale"
.LASF120:
	.string	"CHECKBOX_ITEM_COUNT"
.LASF109:
	.string	"BOXGOV"
.LASF137:
	.string	"alt_hold_deadband"
.LASF535:
	.string	"boardAlignment_System"
.LASF549:
	.string	"motor3DConfig_System"
.LASF252:
	.string	"data"
.LASF188:
	.string	"FEATURE_LED_STRIP"
.LASF411:
	.string	"servoConf"
.LASF317:
	.string	"vbatwarningcellvoltage"
.LASF59:
	.string	"rxChannelRangeConfiguration_s"
.LASF60:
	.string	"rxChannelRangeConfiguration_t"
.LASF85:
	.string	"dynThrPID"
.LASF335:
	.string	"compassConfig_s"
.LASF337:
	.string	"compassConfig_t"
.LASF235:
	.string	"serialPortIdentifier_e"
.LASF296:
	.string	"sensorSelectionConfig_s"
.LASF336:
	.string	"mag_declination"
.LASF479:
	.string	"candidate"
.LASF241:
	.string	"serialConfig_s"
.LASF244:
	.string	"serialConfig_t"
.LASF106:
	.string	"BOXLEDLOW"
.LASF444:
	.string	"throttle_correction_value"
.LASF523:
	.string	"flightModeFlags"
.LASF455:
	.string	"gps_wp_radius"
.LASF372:
	.string	"mixerMode"
.LASF495:
	.string	"rcModeIsActive"
.LASF379:
	.string	"deadband3d_high"
.LASF16:
	.string	"long long unsigned int"
.LASF307:
	.string	"offset"
.LASF339:
	.string	"gyroMovementCalibrationThreshold"
.LASF440:
	.string	"max_angle_inclination"
.LASF433:
	.string	"imuConfig_s"
.LASF441:
	.string	"imuConfig_t"
.LASF249:
	.string	"specialColorIndexes_t"
.LASF33:
	.string	"pgn_t"
.LASF31:
	.string	"sbuf_s"
.LASF32:
	.string	"sbuf_t"
.LASF438:
	.string	"dcm_ki"
.LASF437:
	.string	"dcm_kp"
.LASF321:
	.string	"rollAndPitchTrims_s"
.LASF325:
	.string	"rollAndPitchTrims_t"
.LASF324:
	.string	"rollAndPitchTrims_u"
.LASF360:
	.string	"MIXER_HEX6H"
.LASF529:
	.string	"ledConfigs_SystemArray"
.LASF352:
	.string	"MIXER_HEX6X"
.LASF23:
	.string	"AI_ROLL"
.LASF128:
	.string	"auxChannelIndex"
.LASF450:
	.string	"failsafe_kill_switch"
.LASF26:
	.string	"RGB_RED"
.LASF487:
	.string	"boxEnabledMask"
.LASF504:
	.string	"U_ID_0"
.LASF73:
	.string	"rx_min_usec"
.LASF506:
	.string	"U_ID_2"
.LASF170:
	.string	"GTUNE_MODE"
.LASF492:
	.string	"mspBoxIdx"
.LASF80:
	.string	"rcRate8"
.LASF333:
	.string	"acc_unarmedcal"
.LASF151:
	.string	"adjustmentIndex"
.LASF456:
	.string	"gps_lpf"
.LASF89:
	.string	"rateProfileSelection_s"
.LASF91:
	.string	"rateProfileSelection_t"
.LASF375:
	.string	"yaw_jump_prevention_limit"
.LASF486:
	.string	"packFlightModeFlags"
.LASF15:
	.string	"long long int"
.LASF467:
	.string	"rate_num"
.LASF184:
	.string	"FEATURE_3D"
.LASF24:
	.string	"AI_PITCH"
.LASF434:
	.string	"looptime"
.LASF536:
	.string	"sensorSelectionConfig_System"
.LASF132:
	.string	"modeActivationConditions"
.LASF62:
	.string	"rcmap"
.LASF274:
	.string	"SENSOR_GYRO"
.LASF300:
	.string	"sensorSelectionConfig_t"
.LASF476:
	.string	"boxId"
.LASF419:
	.string	"PIDNAVR"
.LASF138:
	.string	"alt_hold_fast_change"
.LASF559:
	.string	"airplaneConfig_System"
.LASF436:
	.string	"gyroSyncDenominator"
.LASF551:
	.string	"customServoMixer_SystemArray"
.LASF423:
	.string	"PID_ITEM_COUNT"
.LASF262:
	.string	"yawDegrees"
.LASF312:
	.string	"vbatresdivmultiplier"
.LASF183:
	.string	"FEATURE_AMPERAGE_METER"
.LASF471:
	.string	"mspServerConfig_s"
.LASF331:
	.string	"accz_lpf_cutoff"
.LASF139:
	.string	"yaw_control_direction"
.LASF544:
	.string	"magADC"
.LASF514:
	.string	"failsafeChannelConfigs_SystemArray"
.LASF386:
	.string	"INPUT_RC_ROLL"
.LASF378:
	.string	"deadband3d_low"
.LASF3:
	.string	"unsigned int"
.LASF264:
	.string	"SENSOR_INDEX_GYRO"
.LASF466:
	.string	"blackboxConfig_s"
.LASF470:
	.string	"blackboxConfig_t"
.LASF546:
	.string	"gyroConfig_System"
.LASF103:
	.string	"BOXPASSTHRU"
.LASF483:
	.string	"serializeBoxNamesReply"
.LASF5:
	.string	"short int"
.LASF499:
	.string	"flightControllerIdentifier"
.LASF561:
	.string	"shortGitRevision"
.LASF135:
	.string	"deadband"
.LASF550:
	.string	"inputSource_e"
.LASF400:
	.string	"rate"
.LASF100:
	.string	"BOXCAMTRIG"
.LASF512:
	.string	"profileSelection_System"
.LASF198:
	.string	"servoCenterPulse"
.LASF167:
	.string	"PASSTHRU_MODE"
.LASF457:
	.string	"nav_slew_rate"
.LASF420:
	.string	"PIDLEVEL"
.LASF284:
	.string	"CW180_DEG"
.LASF410:
	.string	"servoProfile_s"
.LASF412:
	.string	"servoProfile_t"
.LASF316:
	.string	"vbatmincellvoltage"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
