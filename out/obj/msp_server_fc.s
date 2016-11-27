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
	movl	$mixerConfig_System, %eax	#, D.6848
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
	.section	.text.sensors,"ax",@progbits
	.globl	sensors
	.type	sensors, @function
sensors:
.LFB72:
	.file 2 "./src/main/fc/msp_server_fc.h"
	.loc 2 21 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# mask, mask
	.loc 2 21 0
	movl	enabledSensors(%rip), %eax	# enabledSensors, D.6849
	andl	-4(%rbp), %eax	# mask, D.6849
	testl	%eax, %eax	# D.6849
	setne	%al	#, D.6850
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE72:
	.size	sensors, .-sensors
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
	movzbl	8(%rax), %eax	# candidate_4->boxId, D.6882
	cmpb	-20(%rbp), %al	# boxId, D.6882
	jne	.L7	#,
	.loc 3 226 0
	movq	-8(%rbp), %rax	# candidate, D.6881
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
	movl	$0, %eax	#, D.6881
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
	movzbl	9(%rax), %eax	# candidate_4->permanentId, D.6884
	cmpb	-20(%rbp), %al	# permanentId, D.6884
	jne	.L12	#,
	.loc 3 237 0
	movq	-8(%rbp), %rax	# candidate, D.6883
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
	movl	$0, %eax	#, D.6883
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
	sall	%cl, %edx	# tmp103, D.6885
	movl	%edx, %eax	# D.6885, D.6885
	movl	%eax, %edx	# D.6885, D.6886
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.6886
	andl	%edx, %eax	# D.6886, D.6886
	testl	%eax, %eax	# D.6886
	je	.L20	#,
	.loc 3 249 0
	movl	-20(%rbp), %eax	# i, tmp97
	movzbl	%al, %eax	# D.6887, D.6885
	movl	%eax, %edi	# D.6885,
	call	findBoxByBoxId	#
	movq	%rax, -8(%rbp)	# tmp98, box
	.loc 3 250 0
	movq	-8(%rbp), %rax	# box, tmp99
	movq	(%rax), %rdx	# box_15->boxName, D.6888
	movq	-16(%rbp), %rax	# dst, tmp100
	movq	%rdx, %rsi	# D.6888,
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
	sall	%cl, %edx	# tmp103, D.6889
	movl	%edx, %eax	# D.6889, D.6889
	movl	%eax, %edx	# D.6889, D.6890
	movl	activeBoxIds(%rip), %eax	# activeBoxIds, D.6890
	andl	%edx, %eax	# D.6890, D.6890
	testl	%eax, %eax	# D.6890
	je	.L26	#,
	.loc 3 261 0
	movl	-20(%rbp), %eax	# i, tmp98
	movzbl	%al, %eax	# D.6891, D.6889
	movl	%eax, %edi	# D.6889,
	call	findBoxByBoxId	#
	movq	%rax, -8(%rbp)	# tmp99, box
	.loc 3 262 0
	movq	-8(%rbp), %rax	# box, tmp100
	movzbl	9(%rax), %eax	# box_15->permanentId, D.6891
	movzbl	%al, %edx	# D.6891, D.6889
	movq	-16(%rbp), %rax	# dst, tmp101
	movl	%edx, %esi	# D.6889,
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
	testb	%al, %al	# D.6892
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
	testb	%al, %al	# D.6892
	jne	.L29	#,
	.loc 3 286 0 is_stmt 0 discriminator 1
	movl	$8, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.6892
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
	testb	%al, %al	# D.6892
	je	.L31	#,
	.loc 3 294 0
	orl	$128, -8(%rbp)	#, ena
.L31:
	.loc 3 303 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _36->mixerMode, D.6894
	cmpb	$8, %al	#, D.6894
	je	.L32	#,
	.loc 3 304 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _39->mixerMode, D.6894
	cmpb	$14, %al	#, D.6894
	je	.L32	#,
	.loc 3 305 0
	call	mixerConfig	#
	movzbl	(%rax), %eax	# _42->mixerMode, D.6894
	cmpb	$24, %al	#, D.6894
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
	testb	%al, %al	# D.6892
	je	.L34	#,
	.loc 3 318 0
	orl	$65536, -8(%rbp)	#, ena
.L34:
	.loc 3 320 0
	orl	$262144, -8(%rbp)	#, ena
	.loc 3 328 0
	movl	$512, %edi	#,
	call	feature	#
	testb	%al, %al	# D.6892
	je	.L35	#,
	.loc 3 329 0
	orl	$2097152, -8(%rbp)	#, ena
.L35:
	.loc 3 347 0
	movl	$256, %edi	#,
	call	feature	#
	testb	%al, %al	# D.6892
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
	sall	%cl, %edx	# tmp116, D.6895
	movl	%edx, %eax	# D.6895, D.6895
	andl	-8(%rbp), %eax	# ena, D.6896
	testl	%eax, %eax	# D.6896
	je	.L38	#,
	.loc 3 358 0
	movl	-4(%rbp), %eax	# boxId, tmp111
	movzbl	%al, %eax	# D.6894, D.6895
	movl	%eax, %edi	# D.6895,
	call	findBoxByBoxId	#
	testq	%rax, %rax	# D.6897
	jne	.L38	#,
	.loc 3 359 0
	movl	-4(%rbp), %eax	# boxId, tmp112
	movl	$1, %edx	#, tmp113
	movl	%eax, %ecx	# tmp112, tmp118
	sall	%cl, %edx	# tmp118, D.6895
	movl	%edx, %eax	# D.6895, D.6895
	notl	%eax	# D.6895
	andl	%eax, -8(%rbp)	# D.6896, ena
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
	.section	.text.serializeSDCardSummaryReply,"ax",@progbits
	.type	serializeSDCardSummaryReply, @function
serializeSDCardSummaryReply:
.LFB78:
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
.LFE78:
	.size	serializeSDCardSummaryReply, .-serializeSDCardSummaryReply
	.section	.text.serializeDataflashSummaryReply,"ax",@progbits
	.type	serializeDataflashSummaryReply, @function
serializeDataflashSummaryReply:
.LFB79:
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
.LFE79:
	.size	serializeDataflashSummaryReply, .-serializeDataflashSummaryReply
	.section	.rodata
.LC30:
	.string	"Unknown"
	.section	.text.mspServerCommandHandler,"ax",@progbits
	.globl	mspServerCommandHandler
	.type	mspServerCommandHandler, @function
mspServerCommandHandler:
.LFB80:
	.loc 3 497 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# cmd, cmd
	movq	%rsi, -48(%rbp)	# reply, reply
	.loc 3 498 0
	movq	-48(%rbp), %rax	# reply, tmp91
	movq	%rax, -16(%rbp)	# tmp91, dst
	.loc 3 499 0
	movq	-40(%rbp), %rax	# cmd, tmp92
	movq	%rax, -8(%rbp)	# tmp92, src
	.loc 3 501 0
	movq	-8(%rbp), %rax	# src, tmp93
	movq	%rax, %rdi	# tmp93,
	call	sbufBytesRemaining	#
	movl	%eax, -20(%rbp)	# tmp94, len
	.loc 3 503 0
	movq	-40(%rbp), %rax	# cmd, tmp95
	movzwl	16(%rax), %eax	# cmd_4(D)->cmd, D.6898
	cwtl
	cmpl	$1, %eax	#, D.6899
	jne	.L47	#,
	.loc 3 505 0
	movq	-16(%rbp), %rax	# dst, tmp96
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp96,
	call	sbufWriteU8	#
	.loc 3 507 0
	movq	-16(%rbp), %rax	# dst, tmp97
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp97,
	call	sbufWriteU8	#
	.loc 3 508 0
	movq	-16(%rbp), %rax	# dst, tmp98
	movl	$22, %esi	#,
	movq	%rax, %rdi	# tmp98,
	call	sbufWriteU8	#
	.loc 3 509 0
	jmp	.L45	#
.L47:
	.loc 3 511 0
	movl	$.LC30, %edi	#,
	call	puts	#
	.loc 3 512 0
	nop
.L45:
	.loc 3 1533 0
	movl	$1, %eax	#, D.6899
	.loc 3 1534 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE80:
	.size	mspServerCommandHandler, .-mspServerCommandHandler
	.section	.text.mspInit,"ax",@progbits
	.globl	mspInit
	.type	mspInit, @function
mspInit:
.LFB81:
	.loc 3 1537 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 3 1538 0
	call	initActiveBoxIds	#
	.loc 3 1539 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE81:
	.size	mspInit, .-mspInit
	.text
.Letext0:
	.file 4 "/usr/include/stdint.h"
	.file 5 "./src/main/common/axis.h"
	.file 6 "./src/main/common/color.h"
	.file 7 "./src/main/common/streambuf.h"
	.file 8 "./src/main/config/parameter_group.h"
	.file 9 "./src/main/config/feature.h"
	.file 10 "./src/main/config/profile.h"
	.file 11 "./src/main/rx/rx.h"
	.file 12 "./src/main/msp/msp.h"
	.file 13 "./src/main/fc/rate_profile.h"
	.file 14 "./src/main/fc/rc_controls.h"
	.file 15 "./src/main/fc/rc_adjustments.h"
	.file 16 "./src/main/fc/config.h"
	.file 17 "./src/main/io/motor_and_servo.h"
	.file 18 "./src/main/io/gps.h"
	.file 19 "./src/main/io/gimbal.h"
	.file 20 "./src/main/io/io_serial.h"
	.file 21 "./src/main/io/ledstrip.h"
	.file 22 "./src/main/io/transponder_ir.h"
	.file 23 "./src/main/telemetry/telemetry.h"
	.file 24 "./src/main/sensors/boardalignment.h"
	.file 25 "./src/main/sensors/sensors.h"
	.file 26 "./src/main/sensors/amperage.h"
	.file 27 "./src/main/sensors/voltage.h"
	.file 28 "./src/main/sensors/battery.h"
	.file 29 "./src/main/sensors/acceleration.h"
	.file 30 "./src/main/sensors/compass.h"
	.file 31 "./src/main/sensors/gyro.h"
	.file 32 "./src/main/flight/servos.h"
	.file 33 "./src/main/flight/pid.h"
	.file 34 "./src/main/flight/imu.h"
	.file 35 "./src/main/flight/failsafe.h"
	.file 36 "./src/main/flight/navigation.h"
	.file 37 "./src/main/flight/altitudehold.h"
	.file 38 "./src/main/blackbox/blackbox.h"
	.file 39 "./src/main/msp/msp_server.h"
	.file 40 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1daf
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF524
	.byte	0xc
	.long	.LASF525
	.long	.LASF526
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
	.byte	0x30
	.long	0x30
	.uleb128 0x7
	.long	.LASF12
	.byte	0x4
	.byte	0x31
	.long	0x37
	.uleb128 0x7
	.long	.LASF13
	.byte	0x4
	.byte	0x33
	.long	0x3e
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF16
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF17
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x5
	.byte	0x1d
	.long	0xf4
	.uleb128 0x9
	.long	.LASF18
	.byte	0
	.uleb128 0x9
	.long	.LASF19
	.byte	0x1
	.uleb128 0x9
	.long	.LASF20
	.byte	0x2
	.uleb128 0x9
	.long	.LASF21
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x5
	.byte	0x25
	.long	0x113
	.uleb128 0x9
	.long	.LASF22
	.byte	0
	.uleb128 0x9
	.long	.LASF23
	.byte	0x1
	.uleb128 0x9
	.long	.LASF24
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x6
	.byte	0x15
	.long	0x132
	.uleb128 0x9
	.long	.LASF25
	.byte	0
	.uleb128 0x9
	.long	.LASF26
	.byte	0x1
	.uleb128 0x9
	.long	.LASF27
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	0x92
	.long	0x142
	.uleb128 0xb
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.long	.LASF29
	.byte	0x4
	.byte	0x6
	.byte	0x32
	.long	0x16d
	.uleb128 0xd
	.string	"h"
	.byte	0x6
	.byte	0x33
	.long	0x9d
	.byte	0
	.uleb128 0xd
	.string	"s"
	.byte	0x6
	.byte	0x34
	.long	0x92
	.byte	0x2
	.uleb128 0xd
	.string	"v"
	.byte	0x6
	.byte	0x35
	.long	0x92
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF28
	.byte	0x6
	.byte	0x36
	.long	0x142
	.uleb128 0xc
	.long	.LASF30
	.byte	0x10
	.byte	0x7
	.byte	0x19
	.long	0x19d
	.uleb128 0xd
	.string	"ptr"
	.byte	0x7
	.byte	0x1a
	.long	0x19d
	.byte	0
	.uleb128 0xd
	.string	"end"
	.byte	0x7
	.byte	0x1b
	.long	0x19d
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x92
	.uleb128 0x7
	.long	.LASF31
	.byte	0x7
	.byte	0x1c
	.long	0x178
	.uleb128 0x7
	.long	.LASF32
	.byte	0x8
	.byte	0x15
	.long	0x9d
	.uleb128 0x7
	.long	.LASF33
	.byte	0x8
	.byte	0x26
	.long	0x1c4
	.uleb128 0xe
	.long	0x1d4
	.uleb128 0xf
	.long	0x68
	.uleb128 0xf
	.long	0x53
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.byte	0x8
	.byte	0x2d
	.long	0x1f2
	.uleb128 0x11
	.string	"ptr"
	.byte	0x8
	.byte	0x2e
	.long	0x68
	.uleb128 0x11
	.string	"fn"
	.byte	0x8
	.byte	0x2f
	.long	0x1f2
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x1b9
	.uleb128 0xc
	.long	.LASF34
	.byte	0x20
	.byte	0x8
	.byte	0x28
	.long	0x241
	.uleb128 0xd
	.string	"pgn"
	.byte	0x8
	.byte	0x29
	.long	0x1ae
	.byte	0
	.uleb128 0x12
	.long	.LASF35
	.byte	0x8
	.byte	0x2a
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF36
	.byte	0x8
	.byte	0x2b
	.long	0x19d
	.byte	0x8
	.uleb128 0xd
	.string	"ptr"
	.byte	0x8
	.byte	0x2c
	.long	0x241
	.byte	0x10
	.uleb128 0x12
	.long	.LASF37
	.byte	0x8
	.byte	0x30
	.long	0x1d4
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x19d
	.uleb128 0x7
	.long	.LASF38
	.byte	0x8
	.byte	0x31
	.long	0x1f8
	.uleb128 0xc
	.long	.LASF39
	.byte	0x4
	.byte	0x9
	.byte	0x14
	.long	0x26b
	.uleb128 0x12
	.long	.LASF40
	.byte	0x9
	.byte	0x15
	.long	0xa8
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF41
	.byte	0x9
	.byte	0x16
	.long	0x252
	.uleb128 0xc
	.long	.LASF42
	.byte	0x1
	.byte	0xa
	.byte	0x16
	.long	0x28f
	.uleb128 0x12
	.long	.LASF43
	.byte	0xa
	.byte	0x17
	.long	0x92
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF44
	.byte	0xa
	.byte	0x18
	.long	0x276
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF45
	.uleb128 0xc
	.long	.LASF46
	.byte	0x2
	.byte	0xb
	.byte	0x65
	.long	0x2c6
	.uleb128 0x12
	.long	.LASF47
	.byte	0xb
	.byte	0x66
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF48
	.byte	0xb
	.byte	0x67
	.long	0x92
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF49
	.byte	0xb
	.byte	0x68
	.long	0x2a1
	.uleb128 0xc
	.long	.LASF50
	.byte	0x4
	.byte	0xb
	.byte	0x6a
	.long	0x2f6
	.uleb128 0xd
	.string	"min"
	.byte	0xb
	.byte	0x6b
	.long	0x9d
	.byte	0
	.uleb128 0xd
	.string	"max"
	.byte	0xb
	.byte	0x6c
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF51
	.byte	0xb
	.byte	0x6d
	.long	0x2d1
	.uleb128 0xc
	.long	.LASF52
	.byte	0x1a
	.byte	0xb
	.byte	0x6f
	.long	0x3aa
	.uleb128 0x12
	.long	.LASF53
	.byte	0xb
	.byte	0x70
	.long	0x3aa
	.byte	0
	.uleb128 0x12
	.long	.LASF54
	.byte	0xb
	.byte	0x71
	.long	0x92
	.byte	0x8
	.uleb128 0x12
	.long	.LASF55
	.byte	0xb
	.byte	0x72
	.long	0x92
	.byte	0x9
	.uleb128 0x12
	.long	.LASF56
	.byte	0xb
	.byte	0x73
	.long	0x92
	.byte	0xa
	.uleb128 0x12
	.long	.LASF57
	.byte	0xb
	.byte	0x74
	.long	0x92
	.byte	0xb
	.uleb128 0x12
	.long	.LASF58
	.byte	0xb
	.byte	0x75
	.long	0x92
	.byte	0xc
	.uleb128 0x12
	.long	.LASF59
	.byte	0xb
	.byte	0x76
	.long	0x92
	.byte	0xd
	.uleb128 0x12
	.long	.LASF60
	.byte	0xb
	.byte	0x77
	.long	0x92
	.byte	0xe
	.uleb128 0x12
	.long	.LASF61
	.byte	0xb
	.byte	0x78
	.long	0x9d
	.byte	0x10
	.uleb128 0x12
	.long	.LASF62
	.byte	0xb
	.byte	0x79
	.long	0x9d
	.byte	0x12
	.uleb128 0x12
	.long	.LASF63
	.byte	0xb
	.byte	0x7a
	.long	0x9d
	.byte	0x14
	.uleb128 0x12
	.long	.LASF64
	.byte	0xb
	.byte	0x7c
	.long	0x9d
	.byte	0x16
	.uleb128 0x12
	.long	.LASF65
	.byte	0xb
	.byte	0x7d
	.long	0x9d
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.long	0x92
	.long	0x3ba
	.uleb128 0xb
	.long	0x61
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	.LASF66
	.byte	0xb
	.byte	0x7e
	.long	0x301
	.uleb128 0xc
	.long	.LASF67
	.byte	0x18
	.byte	0xc
	.byte	0x16
	.long	0x3f6
	.uleb128 0xd
	.string	"buf"
	.byte	0xc
	.byte	0x17
	.long	0x1a3
	.byte	0
	.uleb128 0xd
	.string	"cmd"
	.byte	0xc
	.byte	0x18
	.long	0x87
	.byte	0x10
	.uleb128 0x12
	.long	.LASF68
	.byte	0xc
	.byte	0x19
	.long	0x87
	.byte	0x12
	.byte	0
	.uleb128 0x7
	.long	.LASF69
	.byte	0xc
	.byte	0x1a
	.long	0x3c5
	.uleb128 0xc
	.long	.LASF70
	.byte	0xc
	.byte	0xd
	.byte	0x14
	.long	0x46e
	.uleb128 0x12
	.long	.LASF71
	.byte	0xd
	.byte	0x15
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF72
	.byte	0xd
	.byte	0x16
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF73
	.byte	0xd
	.byte	0x17
	.long	0x92
	.byte	0x2
	.uleb128 0x12
	.long	.LASF74
	.byte	0xd
	.byte	0x18
	.long	0x92
	.byte	0x3
	.uleb128 0x12
	.long	.LASF75
	.byte	0xd
	.byte	0x19
	.long	0x132
	.byte	0x4
	.uleb128 0x12
	.long	.LASF76
	.byte	0xd
	.byte	0x1a
	.long	0x92
	.byte	0x7
	.uleb128 0x12
	.long	.LASF77
	.byte	0xd
	.byte	0x1b
	.long	0x92
	.byte	0x8
	.uleb128 0x12
	.long	.LASF78
	.byte	0xd
	.byte	0x1c
	.long	0x9d
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF79
	.byte	0xd
	.byte	0x1d
	.long	0x401
	.uleb128 0xc
	.long	.LASF80
	.byte	0x1
	.byte	0xd
	.byte	0x24
	.long	0x492
	.uleb128 0x12
	.long	.LASF81
	.byte	0xd
	.byte	0x25
	.long	0x92
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF82
	.byte	0xd
	.byte	0x26
	.long	0x479
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0xe
	.byte	0x16
	.long	0x558
	.uleb128 0x9
	.long	.LASF83
	.byte	0
	.uleb128 0x9
	.long	.LASF84
	.byte	0x1
	.uleb128 0x9
	.long	.LASF85
	.byte	0x2
	.uleb128 0x9
	.long	.LASF86
	.byte	0x3
	.uleb128 0x9
	.long	.LASF87
	.byte	0x4
	.uleb128 0x9
	.long	.LASF88
	.byte	0x5
	.uleb128 0x9
	.long	.LASF89
	.byte	0x6
	.uleb128 0x9
	.long	.LASF90
	.byte	0x7
	.uleb128 0x9
	.long	.LASF91
	.byte	0x8
	.uleb128 0x9
	.long	.LASF92
	.byte	0x9
	.uleb128 0x9
	.long	.LASF93
	.byte	0xa
	.uleb128 0x9
	.long	.LASF94
	.byte	0xb
	.uleb128 0x9
	.long	.LASF95
	.byte	0xc
	.uleb128 0x9
	.long	.LASF96
	.byte	0xd
	.uleb128 0x9
	.long	.LASF97
	.byte	0xe
	.uleb128 0x9
	.long	.LASF98
	.byte	0xf
	.uleb128 0x9
	.long	.LASF99
	.byte	0x10
	.uleb128 0x9
	.long	.LASF100
	.byte	0x11
	.uleb128 0x9
	.long	.LASF101
	.byte	0x12
	.uleb128 0x9
	.long	.LASF102
	.byte	0x13
	.uleb128 0x9
	.long	.LASF103
	.byte	0x14
	.uleb128 0x9
	.long	.LASF104
	.byte	0x15
	.uleb128 0x9
	.long	.LASF105
	.byte	0x16
	.uleb128 0x9
	.long	.LASF106
	.byte	0x17
	.uleb128 0x9
	.long	.LASF107
	.byte	0x18
	.uleb128 0x9
	.long	.LASF108
	.byte	0x19
	.uleb128 0x9
	.long	.LASF109
	.byte	0x1a
	.uleb128 0x9
	.long	.LASF110
	.byte	0x1b
	.uleb128 0x9
	.long	.LASF111
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.long	.LASF112
	.byte	0xe
	.byte	0x35
	.long	0x49d
	.uleb128 0xc
	.long	.LASF113
	.byte	0x2
	.byte	0xe
	.byte	0x74
	.long	0x588
	.uleb128 0x12
	.long	.LASF114
	.byte	0xe
	.byte	0x75
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF115
	.byte	0xe
	.byte	0x76
	.long	0x92
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF116
	.byte	0xe
	.byte	0x77
	.long	0x563
	.uleb128 0xc
	.long	.LASF117
	.byte	0x8
	.byte	0xe
	.byte	0x79
	.long	0x5c4
	.uleb128 0x12
	.long	.LASF118
	.byte	0xe
	.byte	0x7a
	.long	0x558
	.byte	0
	.uleb128 0x12
	.long	.LASF119
	.byte	0xe
	.byte	0x7b
	.long	0x92
	.byte	0x4
	.uleb128 0x12
	.long	.LASF120
	.byte	0xe
	.byte	0x7c
	.long	0x588
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.long	.LASF121
	.byte	0xe
	.byte	0x7d
	.long	0x593
	.uleb128 0xc
	.long	.LASF122
	.byte	0xa0
	.byte	0xe
	.byte	0x81
	.long	0x5e8
	.uleb128 0x12
	.long	.LASF123
	.byte	0xe
	.byte	0x82
	.long	0x5e8
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x5c4
	.long	0x5f8
	.uleb128 0xb
	.long	0x61
	.byte	0x13
	.byte	0
	.uleb128 0x7
	.long	.LASF124
	.byte	0xe
	.byte	0x83
	.long	0x5cf
	.uleb128 0xc
	.long	.LASF125
	.byte	0x8
	.byte	0xe
	.byte	0x89
	.long	0x658
	.uleb128 0x12
	.long	.LASF126
	.byte	0xe
	.byte	0x8a
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF127
	.byte	0xe
	.byte	0x8b
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF128
	.byte	0xe
	.byte	0x8c
	.long	0x92
	.byte	0x2
	.uleb128 0x12
	.long	.LASF129
	.byte	0xe
	.byte	0x8d
	.long	0x92
	.byte	0x3
	.uleb128 0x12
	.long	.LASF130
	.byte	0xe
	.byte	0x8e
	.long	0x7c
	.byte	0x4
	.uleb128 0x12
	.long	.LASF131
	.byte	0xe
	.byte	0x8f
	.long	0x9d
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF132
	.byte	0xe
	.byte	0x90
	.long	0x603
	.uleb128 0xc
	.long	.LASF133
	.byte	0x4
	.byte	0xe
	.byte	0x94
	.long	0x6a0
	.uleb128 0x12
	.long	.LASF134
	.byte	0xe
	.byte	0x96
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF135
	.byte	0xe
	.byte	0x97
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF136
	.byte	0xe
	.byte	0x98
	.long	0x92
	.byte	0x2
	.uleb128 0x12
	.long	.LASF137
	.byte	0xe
	.byte	0x99
	.long	0x92
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF138
	.byte	0xe
	.byte	0x9a
	.long	0x663
	.uleb128 0xc
	.long	.LASF139
	.byte	0x6
	.byte	0xf
	.byte	0x62
	.long	0x6f4
	.uleb128 0x12
	.long	.LASF119
	.byte	0xf
	.byte	0x64
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF120
	.byte	0xf
	.byte	0x65
	.long	0x588
	.byte	0x1
	.uleb128 0x12
	.long	.LASF140
	.byte	0xf
	.byte	0x68
	.long	0x92
	.byte	0x3
	.uleb128 0x12
	.long	.LASF141
	.byte	0xf
	.byte	0x69
	.long	0x92
	.byte	0x4
	.uleb128 0x12
	.long	.LASF142
	.byte	0xf
	.byte	0x6c
	.long	0x92
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.long	.LASF143
	.byte	0xf
	.byte	0x6d
	.long	0x6ab
	.uleb128 0xc
	.long	.LASF144
	.byte	0x48
	.byte	0xf
	.byte	0x7a
	.long	0x718
	.uleb128 0x12
	.long	.LASF145
	.byte	0xf
	.byte	0x7b
	.long	0x718
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x6f4
	.long	0x728
	.uleb128 0xb
	.long	0x61
	.byte	0xb
	.byte	0
	.uleb128 0x7
	.long	.LASF146
	.byte	0xf
	.byte	0x7c
	.long	0x6ff
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x10
	.byte	0x17
	.long	0x7de
	.uleb128 0x9
	.long	.LASF147
	.byte	0x1
	.uleb128 0x9
	.long	.LASF148
	.byte	0x2
	.uleb128 0x9
	.long	.LASF149
	.byte	0x4
	.uleb128 0x9
	.long	.LASF150
	.byte	0x8
	.uleb128 0x9
	.long	.LASF151
	.byte	0x10
	.uleb128 0x9
	.long	.LASF152
	.byte	0x20
	.uleb128 0x9
	.long	.LASF153
	.byte	0x40
	.uleb128 0x9
	.long	.LASF154
	.byte	0x80
	.uleb128 0x13
	.long	.LASF155
	.value	0x100
	.uleb128 0x13
	.long	.LASF156
	.value	0x200
	.uleb128 0x13
	.long	.LASF157
	.value	0x400
	.uleb128 0x13
	.long	.LASF158
	.value	0x800
	.uleb128 0x13
	.long	.LASF159
	.value	0x1000
	.uleb128 0x13
	.long	.LASF160
	.value	0x2000
	.uleb128 0x13
	.long	.LASF161
	.value	0x4000
	.uleb128 0x13
	.long	.LASF162
	.value	0x8000
	.uleb128 0x14
	.long	.LASF163
	.long	0x10000
	.uleb128 0x14
	.long	.LASF164
	.long	0x20000
	.uleb128 0x14
	.long	.LASF165
	.long	0x40000
	.uleb128 0x14
	.long	.LASF166
	.long	0x80000
	.uleb128 0x14
	.long	.LASF167
	.long	0x100000
	.uleb128 0x14
	.long	.LASF168
	.long	0x200000
	.byte	0
	.uleb128 0x6
	.long	0x92
	.uleb128 0xc
	.long	.LASF169
	.byte	0xc
	.byte	0x11
	.byte	0x14
	.long	0x838
	.uleb128 0x12
	.long	.LASF170
	.byte	0x11
	.byte	0x17
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF171
	.byte	0x11
	.byte	0x18
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF172
	.byte	0x11
	.byte	0x19
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF173
	.byte	0x11
	.byte	0x1a
	.long	0x9d
	.byte	0x6
	.uleb128 0x12
	.long	.LASF174
	.byte	0x11
	.byte	0x1c
	.long	0x9d
	.byte	0x8
	.uleb128 0x12
	.long	.LASF175
	.byte	0x11
	.byte	0x1d
	.long	0x9d
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF176
	.byte	0x11
	.byte	0x1e
	.long	0x7e3
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x12
	.byte	0x19
	.long	0x85c
	.uleb128 0x9
	.long	.LASF177
	.byte	0
	.uleb128 0x9
	.long	.LASF178
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF179
	.byte	0x12
	.byte	0x1c
	.long	0x843
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x12
	.byte	0x20
	.long	0x892
	.uleb128 0x9
	.long	.LASF180
	.byte	0
	.uleb128 0x9
	.long	.LASF181
	.byte	0x1
	.uleb128 0x9
	.long	.LASF182
	.byte	0x2
	.uleb128 0x9
	.long	.LASF183
	.byte	0x3
	.uleb128 0x9
	.long	.LASF184
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF185
	.byte	0x12
	.byte	0x26
	.long	0x867
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x12
	.byte	0x32
	.long	0x8b6
	.uleb128 0x9
	.long	.LASF186
	.byte	0
	.uleb128 0x9
	.long	.LASF187
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF188
	.byte	0x12
	.byte	0x35
	.long	0x89d
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x12
	.byte	0x37
	.long	0x8da
	.uleb128 0x9
	.long	.LASF189
	.byte	0
	.uleb128 0x9
	.long	.LASF190
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF191
	.byte	0x12
	.byte	0x3a
	.long	0x8c1
	.uleb128 0xc
	.long	.LASF192
	.byte	0x10
	.byte	0x12
	.byte	0x3e
	.long	0x922
	.uleb128 0x12
	.long	.LASF193
	.byte	0x12
	.byte	0x3f
	.long	0x85c
	.byte	0
	.uleb128 0x12
	.long	.LASF194
	.byte	0x12
	.byte	0x40
	.long	0x892
	.byte	0x4
	.uleb128 0x12
	.long	.LASF195
	.byte	0x12
	.byte	0x41
	.long	0x8b6
	.byte	0x8
	.uleb128 0x12
	.long	.LASF196
	.byte	0x12
	.byte	0x42
	.long	0x8da
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.long	.LASF197
	.byte	0x12
	.byte	0x43
	.long	0x8e5
	.uleb128 0xc
	.long	.LASF198
	.byte	0x1
	.byte	0x13
	.byte	0x1b
	.long	0x946
	.uleb128 0x12
	.long	.LASF47
	.byte	0x13
	.byte	0x1c
	.long	0x92
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF199
	.byte	0x13
	.byte	0x1d
	.long	0x92d
	.uleb128 0x8
	.byte	0x4
	.long	0x53
	.byte	0x14
	.byte	0x36
	.long	0x99a
	.uleb128 0x15
	.long	.LASF200
	.sleb128 -1
	.uleb128 0x9
	.long	.LASF201
	.byte	0
	.uleb128 0x9
	.long	.LASF202
	.byte	0x1
	.uleb128 0x9
	.long	.LASF203
	.byte	0x2
	.uleb128 0x9
	.long	.LASF204
	.byte	0x3
	.uleb128 0x9
	.long	.LASF205
	.byte	0x4
	.uleb128 0x9
	.long	.LASF206
	.byte	0x14
	.uleb128 0x9
	.long	.LASF207
	.byte	0x1e
	.uleb128 0x9
	.long	.LASF208
	.byte	0x1f
	.uleb128 0x9
	.long	.LASF209
	.byte	0x1f
	.byte	0
	.uleb128 0x7
	.long	.LASF210
	.byte	0x14
	.byte	0x41
	.long	0x951
	.uleb128 0xc
	.long	.LASF211
	.byte	0xc
	.byte	0x14
	.byte	0x5a
	.long	0x9d6
	.uleb128 0x12
	.long	.LASF212
	.byte	0x14
	.byte	0x5b
	.long	0x99a
	.byte	0
	.uleb128 0x12
	.long	.LASF213
	.byte	0x14
	.byte	0x5c
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF214
	.byte	0x14
	.byte	0x5d
	.long	0x9d6
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	0x92
	.long	0x9e6
	.uleb128 0xb
	.long	0x61
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF215
	.byte	0x14
	.byte	0x5e
	.long	0x9a5
	.uleb128 0xc
	.long	.LASF216
	.byte	0x1c
	.byte	0x14
	.byte	0x60
	.long	0xa16
	.uleb128 0x12
	.long	.LASF217
	.byte	0x14
	.byte	0x61
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF218
	.byte	0x14
	.byte	0x62
	.long	0xa16
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0x9e6
	.long	0xa26
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF219
	.byte	0x14
	.byte	0x63
	.long	0x9f1
	.uleb128 0xc
	.long	.LASF220
	.byte	0x6
	.byte	0x15
	.byte	0x76
	.long	0xa4a
	.uleb128 0x12
	.long	.LASF221
	.byte	0x15
	.byte	0x77
	.long	0xa4a
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x92
	.long	0xa5a
	.uleb128 0xb
	.long	0x61
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.long	.LASF222
	.byte	0x15
	.byte	0x78
	.long	0xa31
	.uleb128 0xc
	.long	.LASF223
	.byte	0xb
	.byte	0x15
	.byte	0x7a
	.long	0xa7e
	.uleb128 0x12
	.long	.LASF221
	.byte	0x15
	.byte	0x7b
	.long	0xa7e
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x92
	.long	0xa8e
	.uleb128 0xb
	.long	0x61
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF224
	.byte	0x15
	.byte	0x7c
	.long	0xa65
	.uleb128 0x7
	.long	.LASF225
	.byte	0x15
	.byte	0x7e
	.long	0xa8
	.uleb128 0xc
	.long	.LASF226
	.byte	0x6
	.byte	0x16
	.byte	0x14
	.long	0xabd
	.uleb128 0x12
	.long	.LASF227
	.byte	0x16
	.byte	0x15
	.long	0xa4a
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF228
	.byte	0x16
	.byte	0x16
	.long	0xaa4
	.uleb128 0xc
	.long	.LASF229
	.byte	0x3
	.byte	0x17
	.byte	0x1e
	.long	0xaf9
	.uleb128 0x12
	.long	.LASF230
	.byte	0x17
	.byte	0x1f
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF231
	.byte	0x17
	.byte	0x20
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF232
	.byte	0x17
	.byte	0x21
	.long	0x92
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF233
	.byte	0x17
	.byte	0x22
	.long	0xac8
	.uleb128 0xc
	.long	.LASF234
	.byte	0x6
	.byte	0x18
	.byte	0x14
	.long	0xb35
	.uleb128 0x12
	.long	.LASF235
	.byte	0x18
	.byte	0x15
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF236
	.byte	0x18
	.byte	0x16
	.long	0x87
	.byte	0x2
	.uleb128 0x12
	.long	.LASF237
	.byte	0x18
	.byte	0x17
	.long	0x87
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF238
	.byte	0x18
	.byte	0x18
	.long	0xb04
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x19
	.byte	0x14
	.long	0xb65
	.uleb128 0x9
	.long	.LASF239
	.byte	0
	.uleb128 0x9
	.long	.LASF240
	.byte	0x1
	.uleb128 0x9
	.long	.LASF241
	.byte	0x2
	.uleb128 0x9
	.long	.LASF242
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	.LASF243
	.byte	0x6
	.byte	0x19
	.byte	0x1f
	.long	0xb96
	.uleb128 0x12
	.long	.LASF244
	.byte	0x19
	.byte	0x20
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF245
	.byte	0x19
	.byte	0x21
	.long	0x87
	.byte	0x2
	.uleb128 0xd
	.string	"yaw"
	.byte	0x19
	.byte	0x22
	.long	0x87
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF246
	.byte	0x19
	.byte	0x23
	.long	0xb65
	.uleb128 0x16
	.long	.LASF298
	.byte	0x6
	.byte	0x19
	.byte	0x25
	.long	0xbc4
	.uleb128 0x11
	.string	"raw"
	.byte	0x19
	.byte	0x26
	.long	0xbc4
	.uleb128 0x17
	.long	.LASF247
	.byte	0x19
	.byte	0x27
	.long	0xb96
	.byte	0
	.uleb128 0xa
	.long	0x87
	.long	0xbd4
	.uleb128 0xb
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF248
	.byte	0x19
	.byte	0x28
	.long	0xba1
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x19
	.byte	0x2e
	.long	0xc16
	.uleb128 0x9
	.long	.LASF249
	.byte	0x1
	.uleb128 0x9
	.long	.LASF250
	.byte	0x2
	.uleb128 0x9
	.long	.LASF251
	.byte	0x4
	.uleb128 0x9
	.long	.LASF252
	.byte	0x8
	.uleb128 0x9
	.long	.LASF253
	.byte	0x10
	.uleb128 0x9
	.long	.LASF254
	.byte	0x20
	.uleb128 0x9
	.long	.LASF255
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x19
	.byte	0x38
	.long	0xc59
	.uleb128 0x9
	.long	.LASF256
	.byte	0
	.uleb128 0x9
	.long	.LASF257
	.byte	0x1
	.uleb128 0x9
	.long	.LASF258
	.byte	0x2
	.uleb128 0x9
	.long	.LASF259
	.byte	0x3
	.uleb128 0x9
	.long	.LASF260
	.byte	0x4
	.uleb128 0x9
	.long	.LASF261
	.byte	0x5
	.uleb128 0x9
	.long	.LASF262
	.byte	0x6
	.uleb128 0x9
	.long	.LASF263
	.byte	0x7
	.uleb128 0x9
	.long	.LASF264
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF265
	.byte	0x19
	.byte	0x42
	.long	0xc16
	.uleb128 0xc
	.long	.LASF266
	.byte	0xc
	.byte	0x19
	.byte	0x44
	.long	0xc95
	.uleb128 0x12
	.long	.LASF267
	.byte	0x19
	.byte	0x45
	.long	0xc59
	.byte	0
	.uleb128 0x12
	.long	.LASF268
	.byte	0x19
	.byte	0x46
	.long	0xc59
	.byte	0x4
	.uleb128 0x12
	.long	.LASF269
	.byte	0x19
	.byte	0x47
	.long	0xc59
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF270
	.byte	0x19
	.byte	0x48
	.long	0xc64
	.uleb128 0xc
	.long	.LASF271
	.byte	0x3
	.byte	0x19
	.byte	0x4a
	.long	0xcd1
	.uleb128 0x12
	.long	.LASF272
	.byte	0x19
	.byte	0x4b
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF273
	.byte	0x19
	.byte	0x4c
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF274
	.byte	0x19
	.byte	0x4d
	.long	0x92
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF275
	.byte	0x19
	.byte	0x4e
	.long	0xca0
	.uleb128 0xc
	.long	.LASF276
	.byte	0xc
	.byte	0x19
	.byte	0x50
	.long	0xd01
	.uleb128 0x12
	.long	.LASF277
	.byte	0x19
	.byte	0x51
	.long	0xbd4
	.byte	0
	.uleb128 0x12
	.long	.LASF278
	.byte	0x19
	.byte	0x52
	.long	0xbd4
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF279
	.byte	0x19
	.byte	0x53
	.long	0xcdc
	.uleb128 0xc
	.long	.LASF280
	.byte	0x4
	.byte	0x1a
	.byte	0x18
	.long	0xd31
	.uleb128 0x12
	.long	.LASF281
	.byte	0x1a
	.byte	0x19
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF282
	.byte	0x1a
	.byte	0x1a
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF283
	.byte	0x1a
	.byte	0x1b
	.long	0xd0c
	.uleb128 0xc
	.long	.LASF284
	.byte	0x3
	.byte	0x1b
	.byte	0x20
	.long	0xd6d
	.uleb128 0x12
	.long	.LASF285
	.byte	0x1b
	.byte	0x21
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF286
	.byte	0x1b
	.byte	0x22
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF287
	.byte	0x1b
	.byte	0x23
	.long	0x92
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF288
	.byte	0x1b
	.byte	0x24
	.long	0xd3c
	.uleb128 0xc
	.long	.LASF289
	.byte	0x8
	.byte	0x1c
	.byte	0x14
	.long	0xdc1
	.uleb128 0x12
	.long	.LASF290
	.byte	0x1c
	.byte	0x15
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF291
	.byte	0x1c
	.byte	0x16
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF292
	.byte	0x1c
	.byte	0x17
	.long	0x92
	.byte	0x2
	.uleb128 0x12
	.long	.LASF293
	.byte	0x1c
	.byte	0x18
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF294
	.byte	0x1c
	.byte	0x19
	.long	0x92
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF295
	.byte	0x1c
	.byte	0x1a
	.long	0xd78
	.uleb128 0xc
	.long	.LASF296
	.byte	0x4
	.byte	0x1d
	.byte	0x29
	.long	0xdf1
	.uleb128 0x12
	.long	.LASF244
	.byte	0x1d
	.byte	0x2a
	.long	0x87
	.byte	0
	.uleb128 0x12
	.long	.LASF245
	.byte	0x1d
	.byte	0x2b
	.long	0x87
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF297
	.byte	0x1d
	.byte	0x2c
	.long	0xdcc
	.uleb128 0x16
	.long	.LASF299
	.byte	0x4
	.byte	0x1d
	.byte	0x2e
	.long	0xe1f
	.uleb128 0x11
	.string	"raw"
	.byte	0x1d
	.byte	0x2f
	.long	0xe1f
	.uleb128 0x17
	.long	.LASF247
	.byte	0x1d
	.byte	0x30
	.long	0xdf1
	.byte	0
	.uleb128 0xa
	.long	0x87
	.long	0xe2f
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF300
	.byte	0x1d
	.byte	0x31
	.long	0xdfc
	.uleb128 0xc
	.long	.LASF301
	.byte	0x2
	.byte	0x1d
	.byte	0x33
	.long	0xe5c
	.uleb128 0xd
	.string	"xy"
	.byte	0x1d
	.byte	0x34
	.long	0x92
	.byte	0
	.uleb128 0xd
	.string	"z"
	.byte	0x1d
	.byte	0x35
	.long	0x92
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	.LASF302
	.byte	0x1d
	.byte	0x36
	.long	0xe3a
	.uleb128 0xc
	.long	.LASF303
	.byte	0x10
	.byte	0x1d
	.byte	0x38
	.long	0xeb0
	.uleb128 0x12
	.long	.LASF304
	.byte	0x1d
	.byte	0x39
	.long	0xe2f
	.byte	0
	.uleb128 0x12
	.long	.LASF305
	.byte	0x1d
	.byte	0x3c
	.long	0x92
	.byte	0x4
	.uleb128 0x12
	.long	.LASF306
	.byte	0x1d
	.byte	0x3d
	.long	0xc1
	.byte	0x8
	.uleb128 0x12
	.long	.LASF307
	.byte	0x1d
	.byte	0x3e
	.long	0xe5c
	.byte	0xc
	.uleb128 0x12
	.long	.LASF308
	.byte	0x1d
	.byte	0x3f
	.long	0x92
	.byte	0xe
	.byte	0
	.uleb128 0x7
	.long	.LASF309
	.byte	0x1d
	.byte	0x40
	.long	0xe67
	.uleb128 0xc
	.long	.LASF310
	.byte	0x2
	.byte	0x1e
	.byte	0x1f
	.long	0xed4
	.uleb128 0x12
	.long	.LASF311
	.byte	0x1e
	.byte	0x20
	.long	0x87
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF312
	.byte	0x1e
	.byte	0x22
	.long	0xebb
	.uleb128 0xc
	.long	.LASF313
	.byte	0x4
	.byte	0x1f
	.byte	0x25
	.long	0xf10
	.uleb128 0x12
	.long	.LASF314
	.byte	0x1f
	.byte	0x26
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF315
	.byte	0x1f
	.byte	0x27
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF316
	.byte	0x1f
	.byte	0x28
	.long	0x9d
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF317
	.byte	0x1f
	.byte	0x29
	.long	0xedf
	.uleb128 0x18
	.long	.LASF347
	.byte	0x4
	.long	0x3e
	.byte	0x1
	.byte	0x22
	.long	0xfc2
	.uleb128 0x9
	.long	.LASF318
	.byte	0x1
	.uleb128 0x9
	.long	.LASF319
	.byte	0x2
	.uleb128 0x9
	.long	.LASF320
	.byte	0x3
	.uleb128 0x9
	.long	.LASF321
	.byte	0x4
	.uleb128 0x9
	.long	.LASF322
	.byte	0x5
	.uleb128 0x9
	.long	.LASF323
	.byte	0x6
	.uleb128 0x9
	.long	.LASF324
	.byte	0x7
	.uleb128 0x9
	.long	.LASF325
	.byte	0x8
	.uleb128 0x9
	.long	.LASF326
	.byte	0x9
	.uleb128 0x9
	.long	.LASF327
	.byte	0xa
	.uleb128 0x9
	.long	.LASF328
	.byte	0xb
	.uleb128 0x9
	.long	.LASF329
	.byte	0xc
	.uleb128 0x9
	.long	.LASF330
	.byte	0xd
	.uleb128 0x9
	.long	.LASF331
	.byte	0xe
	.uleb128 0x9
	.long	.LASF332
	.byte	0xf
	.uleb128 0x9
	.long	.LASF333
	.byte	0x10
	.uleb128 0x9
	.long	.LASF334
	.byte	0x11
	.uleb128 0x9
	.long	.LASF335
	.byte	0x12
	.uleb128 0x9
	.long	.LASF336
	.byte	0x13
	.uleb128 0x9
	.long	.LASF337
	.byte	0x14
	.uleb128 0x9
	.long	.LASF338
	.byte	0x15
	.uleb128 0x9
	.long	.LASF339
	.byte	0x16
	.uleb128 0x9
	.long	.LASF340
	.byte	0x17
	.uleb128 0x9
	.long	.LASF341
	.byte	0x18
	.uleb128 0x9
	.long	.LASF342
	.byte	0x19
	.byte	0
	.uleb128 0xc
	.long	.LASF343
	.byte	0x10
	.byte	0x1
	.byte	0x40
	.long	0xfff
	.uleb128 0x12
	.long	.LASF344
	.byte	0x1
	.byte	0x41
	.long	0xc1
	.byte	0
	.uleb128 0x12
	.long	.LASF244
	.byte	0x1
	.byte	0x42
	.long	0xc1
	.byte	0x4
	.uleb128 0x12
	.long	.LASF245
	.byte	0x1
	.byte	0x43
	.long	0xc1
	.byte	0x8
	.uleb128 0xd
	.string	"yaw"
	.byte	0x1
	.byte	0x44
	.long	0xc1
	.byte	0xc
	.byte	0
	.uleb128 0x7
	.long	.LASF345
	.byte	0x1
	.byte	0x45
	.long	0xfc2
	.uleb128 0xc
	.long	.LASF346
	.byte	0x6
	.byte	0x1
	.byte	0x50
	.long	0x1047
	.uleb128 0x12
	.long	.LASF347
	.byte	0x1
	.byte	0x51
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF348
	.byte	0x1
	.byte	0x52
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF349
	.byte	0x1
	.byte	0x53
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF350
	.byte	0x1
	.byte	0x54
	.long	0x9d
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF351
	.byte	0x1
	.byte	0x5a
	.long	0x100a
	.uleb128 0xc
	.long	.LASF352
	.byte	0x6
	.byte	0x1
	.byte	0x5e
	.long	0x1083
	.uleb128 0x12
	.long	.LASF353
	.byte	0x1
	.byte	0x5f
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF354
	.byte	0x1
	.byte	0x60
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF355
	.byte	0x1
	.byte	0x61
	.long	0x9d
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF356
	.byte	0x1
	.byte	0x62
	.long	0x1052
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x20
	.byte	0x1c
	.long	0x10f5
	.uleb128 0x9
	.long	.LASF357
	.byte	0
	.uleb128 0x9
	.long	.LASF358
	.byte	0x1
	.uleb128 0x9
	.long	.LASF359
	.byte	0x2
	.uleb128 0x9
	.long	.LASF360
	.byte	0x3
	.uleb128 0x9
	.long	.LASF361
	.byte	0x4
	.uleb128 0x9
	.long	.LASF362
	.byte	0x5
	.uleb128 0x9
	.long	.LASF363
	.byte	0x6
	.uleb128 0x9
	.long	.LASF364
	.byte	0x7
	.uleb128 0x9
	.long	.LASF365
	.byte	0x8
	.uleb128 0x9
	.long	.LASF366
	.byte	0x9
	.uleb128 0x9
	.long	.LASF367
	.byte	0xa
	.uleb128 0x9
	.long	.LASF368
	.byte	0xb
	.uleb128 0x9
	.long	.LASF369
	.byte	0xc
	.uleb128 0x9
	.long	.LASF370
	.byte	0xd
	.uleb128 0x9
	.long	.LASF371
	.byte	0xe
	.byte	0
	.uleb128 0xc
	.long	.LASF372
	.byte	0x7
	.byte	0x20
	.byte	0x53
	.long	0x1156
	.uleb128 0x12
	.long	.LASF373
	.byte	0x20
	.byte	0x54
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF374
	.byte	0x20
	.byte	0x55
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF375
	.byte	0x20
	.byte	0x56
	.long	0x7c
	.byte	0x2
	.uleb128 0x12
	.long	.LASF376
	.byte	0x20
	.byte	0x57
	.long	0x92
	.byte	0x3
	.uleb128 0xd
	.string	"min"
	.byte	0x20
	.byte	0x58
	.long	0x7c
	.byte	0x4
	.uleb128 0xd
	.string	"max"
	.byte	0x20
	.byte	0x59
	.long	0x7c
	.byte	0x5
	.uleb128 0xd
	.string	"box"
	.byte	0x20
	.byte	0x5a
	.long	0x92
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF377
	.byte	0x20
	.byte	0x5b
	.long	0x10f5
	.uleb128 0xc
	.long	.LASF378
	.byte	0xe
	.byte	0x20
	.byte	0x69
	.long	0x11ce
	.uleb128 0xd
	.string	"min"
	.byte	0x20
	.byte	0x6a
	.long	0x87
	.byte	0
	.uleb128 0xd
	.string	"max"
	.byte	0x20
	.byte	0x6b
	.long	0x87
	.byte	0x2
	.uleb128 0x12
	.long	.LASF379
	.byte	0x20
	.byte	0x6c
	.long	0x87
	.byte	0x4
	.uleb128 0x12
	.long	.LASF375
	.byte	0x20
	.byte	0x6d
	.long	0x7c
	.byte	0x6
	.uleb128 0x12
	.long	.LASF380
	.byte	0x20
	.byte	0x6e
	.long	0x92
	.byte	0x7
	.uleb128 0x12
	.long	.LASF381
	.byte	0x20
	.byte	0x6f
	.long	0x92
	.byte	0x8
	.uleb128 0x12
	.long	.LASF382
	.byte	0x20
	.byte	0x70
	.long	0x7c
	.byte	0x9
	.uleb128 0x12
	.long	.LASF383
	.byte	0x20
	.byte	0x71
	.long	0xa8
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF384
	.byte	0x20
	.byte	0x72
	.long	0x1161
	.uleb128 0xc
	.long	.LASF385
	.byte	0xe
	.byte	0x20
	.byte	0x74
	.long	0x11f2
	.uleb128 0x12
	.long	.LASF386
	.byte	0x20
	.byte	0x75
	.long	0x11f2
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x11ce
	.long	0x1202
	.uleb128 0xb
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF387
	.byte	0x20
	.byte	0x76
	.long	0x11d9
	.uleb128 0x8
	.byte	0x4
	.long	0x3e
	.byte	0x21
	.byte	0x1c
	.long	0x125c
	.uleb128 0x9
	.long	.LASF388
	.byte	0
	.uleb128 0x9
	.long	.LASF389
	.byte	0x1
	.uleb128 0x9
	.long	.LASF390
	.byte	0x2
	.uleb128 0x9
	.long	.LASF391
	.byte	0x3
	.uleb128 0x9
	.long	.LASF392
	.byte	0x4
	.uleb128 0x9
	.long	.LASF393
	.byte	0x5
	.uleb128 0x9
	.long	.LASF394
	.byte	0x6
	.uleb128 0x9
	.long	.LASF395
	.byte	0x7
	.uleb128 0x9
	.long	.LASF396
	.byte	0x8
	.uleb128 0x9
	.long	.LASF397
	.byte	0x9
	.uleb128 0x9
	.long	.LASF398
	.byte	0xa
	.byte	0
	.uleb128 0xc
	.long	.LASF399
	.byte	0x2a
	.byte	0x21
	.byte	0x3d
	.long	0x12de
	.uleb128 0xd
	.string	"P8"
	.byte	0x21
	.byte	0x3e
	.long	0x12de
	.byte	0
	.uleb128 0xd
	.string	"I8"
	.byte	0x21
	.byte	0x3f
	.long	0x12de
	.byte	0xa
	.uleb128 0xd
	.string	"D8"
	.byte	0x21
	.byte	0x40
	.long	0x12de
	.byte	0x14
	.uleb128 0x12
	.long	.LASF400
	.byte	0x21
	.byte	0x41
	.long	0x92
	.byte	0x1e
	.uleb128 0x12
	.long	.LASF401
	.byte	0x21
	.byte	0x42
	.long	0x9d
	.byte	0x20
	.uleb128 0x12
	.long	.LASF402
	.byte	0x21
	.byte	0x43
	.long	0x9d
	.byte	0x22
	.uleb128 0x12
	.long	.LASF403
	.byte	0x21
	.byte	0x44
	.long	0x9d
	.byte	0x24
	.uleb128 0x12
	.long	.LASF404
	.byte	0x21
	.byte	0x45
	.long	0x92
	.byte	0x26
	.uleb128 0x12
	.long	.LASF405
	.byte	0x21
	.byte	0x46
	.long	0x92
	.byte	0x27
	.uleb128 0x12
	.long	.LASF406
	.byte	0x21
	.byte	0x47
	.long	0x92
	.byte	0x28
	.byte	0
	.uleb128 0xa
	.long	0x92
	.long	0x12ee
	.uleb128 0xb
	.long	0x61
	.byte	0x9
	.byte	0
	.uleb128 0x7
	.long	.LASF407
	.byte	0x21
	.byte	0x48
	.long	0x125c
	.uleb128 0xc
	.long	.LASF408
	.byte	0xc
	.byte	0x22
	.byte	0x2c
	.long	0x135a
	.uleb128 0x12
	.long	.LASF409
	.byte	0x22
	.byte	0x2e
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF410
	.byte	0x22
	.byte	0x2f
	.long	0x92
	.byte	0x2
	.uleb128 0x12
	.long	.LASF411
	.byte	0x22
	.byte	0x30
	.long	0x92
	.byte	0x3
	.uleb128 0x12
	.long	.LASF412
	.byte	0x22
	.byte	0x31
	.long	0x9d
	.byte	0x4
	.uleb128 0x12
	.long	.LASF413
	.byte	0x22
	.byte	0x32
	.long	0x9d
	.byte	0x6
	.uleb128 0x12
	.long	.LASF414
	.byte	0x22
	.byte	0x33
	.long	0x92
	.byte	0x8
	.uleb128 0x12
	.long	.LASF415
	.byte	0x22
	.byte	0x34
	.long	0x9d
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF416
	.byte	0x22
	.byte	0x35
	.long	0x12f9
	.uleb128 0xc
	.long	.LASF417
	.byte	0x4
	.byte	0x22
	.byte	0x39
	.long	0x138a
	.uleb128 0x12
	.long	.LASF418
	.byte	0x22
	.byte	0x3a
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF419
	.byte	0x22
	.byte	0x3b
	.long	0x92
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF420
	.byte	0x22
	.byte	0x3c
	.long	0x1365
	.uleb128 0xc
	.long	.LASF421
	.byte	0x8
	.byte	0x23
	.byte	0x1e
	.long	0x13ea
	.uleb128 0x12
	.long	.LASF422
	.byte	0x23
	.byte	0x1f
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF423
	.byte	0x23
	.byte	0x20
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF424
	.byte	0x23
	.byte	0x21
	.long	0x9d
	.byte	0x2
	.uleb128 0x12
	.long	.LASF425
	.byte	0x23
	.byte	0x22
	.long	0x92
	.byte	0x4
	.uleb128 0x12
	.long	.LASF426
	.byte	0x23
	.byte	0x23
	.long	0x9d
	.byte	0x5
	.uleb128 0x12
	.long	.LASF427
	.byte	0x23
	.byte	0x24
	.long	0x92
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	.LASF428
	.byte	0x23
	.byte	0x25
	.long	0x1395
	.uleb128 0xc
	.long	.LASF429
	.byte	0xc
	.byte	0x24
	.byte	0x1d
	.long	0x1456
	.uleb128 0x12
	.long	.LASF430
	.byte	0x24
	.byte	0x1e
	.long	0x9d
	.byte	0
	.uleb128 0x12
	.long	.LASF431
	.byte	0x24
	.byte	0x1f
	.long	0x92
	.byte	0x2
	.uleb128 0x12
	.long	.LASF432
	.byte	0x24
	.byte	0x20
	.long	0x92
	.byte	0x3
	.uleb128 0x12
	.long	.LASF433
	.byte	0x24
	.byte	0x21
	.long	0x92
	.byte	0x4
	.uleb128 0x12
	.long	.LASF434
	.byte	0x24
	.byte	0x22
	.long	0x9d
	.byte	0x6
	.uleb128 0x12
	.long	.LASF435
	.byte	0x24
	.byte	0x23
	.long	0x9d
	.byte	0x8
	.uleb128 0x12
	.long	.LASF436
	.byte	0x24
	.byte	0x24
	.long	0x9d
	.byte	0xa
	.byte	0
	.uleb128 0x7
	.long	.LASF437
	.byte	0x24
	.byte	0x25
	.long	0x13f5
	.uleb128 0xc
	.long	.LASF438
	.byte	0x1
	.byte	0x25
	.byte	0x1d
	.long	0x147a
	.uleb128 0x12
	.long	.LASF439
	.byte	0x25
	.byte	0x1e
	.long	0x7c
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF440
	.byte	0x25
	.byte	0x1f
	.long	0x1461
	.uleb128 0xc
	.long	.LASF441
	.byte	0x3
	.byte	0x26
	.byte	0x16
	.long	0x14b6
	.uleb128 0x12
	.long	.LASF442
	.byte	0x26
	.byte	0x17
	.long	0x92
	.byte	0
	.uleb128 0x12
	.long	.LASF443
	.byte	0x26
	.byte	0x18
	.long	0x92
	.byte	0x1
	.uleb128 0x12
	.long	.LASF444
	.byte	0x26
	.byte	0x19
	.long	0x92
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	.LASF445
	.byte	0x26
	.byte	0x1a
	.long	0x1485
	.uleb128 0xc
	.long	.LASF446
	.byte	0x1
	.byte	0x27
	.byte	0x12
	.long	0x14da
	.uleb128 0x12
	.long	.LASF447
	.byte	0x27
	.byte	0x13
	.long	0x92
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF448
	.byte	0x27
	.byte	0x14
	.long	0x14c1
	.uleb128 0xc
	.long	.LASF449
	.byte	0x10
	.byte	0x3
	.byte	0x7c
	.long	0x1516
	.uleb128 0x12
	.long	.LASF450
	.byte	0x3
	.byte	0x7d
	.long	0x71
	.byte	0
	.uleb128 0x12
	.long	.LASF451
	.byte	0x3
	.byte	0x7e
	.long	0x7de
	.byte	0x8
	.uleb128 0x12
	.long	.LASF452
	.byte	0x3
	.byte	0x7f
	.long	0x7de
	.byte	0x9
	.byte	0
	.uleb128 0x7
	.long	.LASF453
	.byte	0x3
	.byte	0x80
	.long	0x14e5
	.uleb128 0x19
	.long	.LASF527
	.byte	0x1
	.byte	0x5c
	.long	0x153e
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.byte	0x8
	.long	0x1047
	.uleb128 0x1a
	.long	.LASF464
	.byte	0x2
	.byte	0x15
	.long	0x29a
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0x1574
	.uleb128 0x1b
	.long	.LASF454
	.byte	0x2
	.byte	0x15
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.long	.LASF456
	.byte	0x3
	.byte	0xdd
	.long	0x15e2
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0x15e2
	.uleb128 0x1b
	.long	.LASF451
	.byte	0x3
	.byte	0xdd
	.long	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1e
	.string	"i"
	.byte	0x3
	.byte	0xdf
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x1f
	.long	.LASF455
	.byte	0x3
	.byte	0xe0
	.long	0x15e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x15e8
	.uleb128 0x6
	.long	0x1516
	.uleb128 0x1c
	.long	.LASF457
	.byte	0x3
	.byte	0xe8
	.long	0x15e2
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0x165b
	.uleb128 0x1b
	.long	.LASF452
	.byte	0x3
	.byte	0xe8
	.long	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1e
	.string	"i"
	.byte	0x3
	.byte	0xea
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1f
	.long	.LASF455
	.byte	0x3
	.byte	0xeb
	.long	0x15e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF459
	.byte	0x3
	.byte	0xf3
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0x16d3
	.uleb128 0x1b
	.long	.LASF458
	.byte	0x3
	.byte	0xf3
	.long	0x16d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.string	"dst"
	.byte	0x3
	.byte	0xf5
	.long	0x16d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x1e
	.string	"i"
	.byte	0x3
	.byte	0xf6
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x1e
	.string	"box"
	.byte	0x3
	.byte	0xf9
	.long	0x15e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x3f6
	.uleb128 0x5
	.byte	0x8
	.long	0x1a3
	.uleb128 0x20
	.long	.LASF460
	.byte	0x3
	.byte	0xff
	.quad	.LFB76
	.quad	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.long	0x175a
	.uleb128 0x1b
	.long	.LASF458
	.byte	0x3
	.byte	0xff
	.long	0x16d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x21
	.string	"dst"
	.byte	0x3
	.value	0x101
	.long	0x16d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x21
	.string	"i"
	.byte	0x3
	.value	0x102
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x21
	.string	"box"
	.byte	0x3
	.value	0x105
	.long	0x15e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF461
	.byte	0x3
	.value	0x10a
	.quad	.LFB77
	.quad	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.long	0x17a9
	.uleb128 0x21
	.string	"ena"
	.byte	0x3
	.value	0x10c
	.long	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x23
	.long	.LASF451
	.byte	0x3
	.value	0x164
	.long	0x558
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF462
	.byte	0x3
	.value	0x1a0
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.long	0x17e6
	.uleb128 0x24
	.long	.LASF458
	.byte	0x3
	.value	0x1a0
	.long	0x16d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"dst"
	.byte	0x3
	.value	0x1a2
	.long	0x16d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF463
	.byte	0x3
	.value	0x1d0
	.quad	.LFB79
	.quad	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.long	0x1823
	.uleb128 0x24
	.long	.LASF458
	.byte	0x3
	.value	0x1d0
	.long	0x16d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.string	"dst"
	.byte	0x3
	.value	0x1d2
	.long	0x16d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x25
	.long	.LASF465
	.byte	0x3
	.value	0x1f0
	.long	0x53
	.quad	.LFB80
	.quad	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.long	0x1891
	.uleb128 0x26
	.string	"cmd"
	.byte	0x3
	.value	0x1f0
	.long	0x16d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF458
	.byte	0x3
	.value	0x1f0
	.long	0x16d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x21
	.string	"dst"
	.byte	0x3
	.value	0x1f2
	.long	0x16d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x21
	.string	"src"
	.byte	0x3
	.value	0x1f3
	.long	0x16d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.string	"len"
	.byte	0x3
	.value	0x1f5
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x27
	.long	.LASF528
	.byte	0x3
	.value	0x600
	.quad	.LFB81
	.quad	.LFE81-.LFB81
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.long	.LASF466
	.byte	0x2
	.byte	0x14
	.long	0xa8
	.uleb128 0x9
	.byte	0x3
	.quad	enabledSensors
	.uleb128 0x1f
	.long	.LASF467
	.byte	0x3
	.byte	0x79
	.long	0x18d5
	.uleb128 0x9
	.byte	0x3
	.quad	flightControllerIdentifier
	.uleb128 0x6
	.long	0x71
	.uleb128 0x1f
	.long	.LASF468
	.byte	0x3
	.byte	0x7a
	.long	0x18d5
	.uleb128 0x9
	.byte	0x3
	.quad	boardIdentifier
	.uleb128 0xa
	.long	0x15e8
	.long	0x18ff
	.uleb128 0xb
	.long	0x61
	.byte	0x1b
	.byte	0
	.uleb128 0x1f
	.long	.LASF469
	.byte	0x3
	.byte	0x82
	.long	0x1914
	.uleb128 0x9
	.byte	0x3
	.quad	boxes
	.uleb128 0x6
	.long	0x18ef
	.uleb128 0x1f
	.long	.LASF470
	.byte	0x3
	.byte	0xa3
	.long	0xa8
	.uleb128 0x9
	.byte	0x3
	.quad	activeBoxIds
	.uleb128 0xa
	.long	0x77
	.long	0x193e
	.uleb128 0xb
	.long	0x61
	.byte	0x2f
	.byte	0
	.uleb128 0x1f
	.long	.LASF471
	.byte	0x3
	.byte	0xa8
	.long	0x1953
	.uleb128 0x9
	.byte	0x3
	.quad	pidnames
	.uleb128 0x6
	.long	0x192e
	.uleb128 0x28
	.long	.LASF472
	.byte	0x28
	.byte	0xc8
	.long	0xa8
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x28
	.long	.LASF473
	.byte	0x28
	.byte	0xc9
	.long	0xa8
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x28
	.long	.LASF474
	.byte	0x28
	.byte	0xca
	.long	0xa8
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x28
	.long	.LASF475
	.byte	0x8
	.byte	0x43
	.long	0x19ac
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x5
	.byte	0x8
	.long	0x247
	.uleb128 0x28
	.long	.LASF476
	.byte	0x8
	.byte	0x44
	.long	0x19ac
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x28
	.long	.LASF477
	.byte	0x8
	.byte	0x47
	.long	0x19d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x28
	.long	.LASF478
	.byte	0x8
	.byte	0x48
	.long	0x19d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x28
	.long	.LASF479
	.byte	0x9
	.byte	0x18
	.long	0x26b
	.uleb128 0x9
	.byte	0x3
	.quad	featureConfig_System
	.uleb128 0x28
	.long	.LASF480
	.byte	0xa
	.byte	0x1a
	.long	0x28f
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_System
	.uleb128 0x28
	.long	.LASF481
	.byte	0xb
	.byte	0x80
	.long	0x3ba
	.uleb128 0x9
	.byte	0x3
	.quad	rxConfig_System
	.uleb128 0xa
	.long	0x2c6
	.long	0x1a40
	.uleb128 0xb
	.long	0x61
	.byte	0x11
	.byte	0
	.uleb128 0x29
	.long	.LASF482
	.byte	0xb
	.byte	0x82
	.long	0x1a30
	.uleb128 0xa
	.long	0x2f6
	.long	0x1a5b
	.uleb128 0xb
	.long	0x61
	.byte	0x3
	.byte	0
	.uleb128 0x29
	.long	.LASF483
	.byte	0xb
	.byte	0x83
	.long	0x1a4b
	.uleb128 0xa
	.long	0x46e
	.long	0x1a76
	.uleb128 0xb
	.long	0x61
	.byte	0x2
	.byte	0
	.uleb128 0x29
	.long	.LASF484
	.byte	0xd
	.byte	0x20
	.long	0x1a66
	.uleb128 0x29
	.long	.LASF485
	.byte	0xd
	.byte	0x28
	.long	0x1a8c
	.uleb128 0x5
	.byte	0x8
	.long	0x492
	.uleb128 0x29
	.long	.LASF486
	.byte	0xe
	.byte	0x85
	.long	0x1a9d
	.uleb128 0x5
	.byte	0x8
	.long	0x5f8
	.uleb128 0x29
	.long	.LASF487
	.byte	0xe
	.byte	0x92
	.long	0x1aae
	.uleb128 0x5
	.byte	0x8
	.long	0x658
	.uleb128 0x28
	.long	.LASF488
	.byte	0xe
	.byte	0x9c
	.long	0x6a0
	.uleb128 0x9
	.byte	0x3
	.quad	armingConfig_System
	.uleb128 0x29
	.long	.LASF489
	.byte	0xf
	.byte	0x7e
	.long	0x1ad4
	.uleb128 0x5
	.byte	0x8
	.long	0x728
	.uleb128 0x28
	.long	.LASF490
	.byte	0x11
	.byte	0x20
	.long	0x838
	.uleb128 0x9
	.byte	0x3
	.quad	motorAndServoConfig_System
	.uleb128 0x28
	.long	.LASF491
	.byte	0x12
	.byte	0x45
	.long	0x922
	.uleb128 0x9
	.byte	0x3
	.quad	gpsConfig_System
	.uleb128 0x29
	.long	.LASF492
	.byte	0x13
	.byte	0x1f
	.long	0x1b0f
	.uleb128 0x5
	.byte	0x8
	.long	0x946
	.uleb128 0x28
	.long	.LASF493
	.byte	0x14
	.byte	0x65
	.long	0xa26
	.uleb128 0x9
	.byte	0x3
	.quad	serialConfig_System
	.uleb128 0xa
	.long	0xa99
	.long	0x1b3a
	.uleb128 0xb
	.long	0x61
	.byte	0x1f
	.byte	0
	.uleb128 0x29
	.long	.LASF494
	.byte	0x15
	.byte	0x95
	.long	0x1b2a
	.uleb128 0xa
	.long	0x16d
	.long	0x1b55
	.uleb128 0xb
	.long	0x61
	.byte	0xf
	.byte	0
	.uleb128 0x29
	.long	.LASF495
	.byte	0x15
	.byte	0x96
	.long	0x1b45
	.uleb128 0xa
	.long	0xa5a
	.long	0x1b70
	.uleb128 0xb
	.long	0x61
	.byte	0x5
	.byte	0
	.uleb128 0x29
	.long	.LASF496
	.byte	0x15
	.byte	0x97
	.long	0x1b60
	.uleb128 0x28
	.long	.LASF497
	.byte	0x15
	.byte	0x98
	.long	0xa8e
	.uleb128 0x9
	.byte	0x3
	.quad	specialColors_System
	.uleb128 0x28
	.long	.LASF498
	.byte	0x16
	.byte	0x18
	.long	0xabd
	.uleb128 0x9
	.byte	0x3
	.quad	transponderConfig_System
	.uleb128 0x28
	.long	.LASF499
	.byte	0x17
	.byte	0x24
	.long	0xaf9
	.uleb128 0x9
	.byte	0x3
	.quad	telemetryConfig_System
	.uleb128 0x28
	.long	.LASF500
	.byte	0x18
	.byte	0x1a
	.long	0xb35
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_System
	.uleb128 0x28
	.long	.LASF501
	.byte	0x19
	.byte	0x55
	.long	0xcd1
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x28
	.long	.LASF502
	.byte	0x19
	.byte	0x56
	.long	0xc95
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x28
	.long	.LASF503
	.byte	0x19
	.byte	0x57
	.long	0xd01
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0xa
	.long	0xd31
	.long	0x1c1e
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x29
	.long	.LASF504
	.byte	0x1a
	.byte	0x1d
	.long	0x1c0e
	.uleb128 0xa
	.long	0xd6d
	.long	0x1c39
	.uleb128 0xb
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF505
	.byte	0x1b
	.byte	0x26
	.long	0x1c29
	.uleb128 0x28
	.long	.LASF506
	.byte	0x1c
	.byte	0x1c
	.long	0xdc1
	.uleb128 0x9
	.byte	0x3
	.quad	batteryConfig_System
	.uleb128 0x29
	.long	.LASF507
	.byte	0x1d
	.byte	0x42
	.long	0x1c64
	.uleb128 0x5
	.byte	0x8
	.long	0xeb0
	.uleb128 0x29
	.long	.LASF508
	.byte	0x1e
	.byte	0x24
	.long	0x1c75
	.uleb128 0x5
	.byte	0x8
	.long	0xed4
	.uleb128 0x28
	.long	.LASF509
	.byte	0x1f
	.byte	0x2b
	.long	0xf10
	.uleb128 0x9
	.byte	0x3
	.quad	gyroConfig_System
	.uleb128 0xa
	.long	0xfff
	.long	0x1ca0
	.uleb128 0xb
	.long	0x61
	.byte	0x3
	.byte	0
	.uleb128 0x29
	.long	.LASF510
	.byte	0x1
	.byte	0x47
	.long	0x1c90
	.uleb128 0x28
	.long	.LASF511
	.byte	0x1
	.byte	0x5c
	.long	0x1047
	.uleb128 0x9
	.byte	0x3
	.quad	mixerConfig_System
	.uleb128 0x28
	.long	.LASF512
	.byte	0x1
	.byte	0x64
	.long	0x1083
	.uleb128 0x9
	.byte	0x3
	.quad	motor3DConfig_System
	.uleb128 0x28
	.long	.LASF513
	.byte	0x20
	.byte	0x2d
	.long	0x108e
	.uleb128 0x9
	.byte	0x3
	.quad	inputSource_e
	.uleb128 0xa
	.long	0x1156
	.long	0x1cfa
	.uleb128 0xb
	.long	0x61
	.byte	0x1
	.byte	0
	.uleb128 0x29
	.long	.LASF514
	.byte	0x20
	.byte	0x61
	.long	0x1cea
	.uleb128 0x29
	.long	.LASF515
	.byte	0x20
	.byte	0x78
	.long	0x1d10
	.uleb128 0x5
	.byte	0x8
	.long	0x1202
	.uleb128 0x29
	.long	.LASF516
	.byte	0x21
	.byte	0x4a
	.long	0x1d21
	.uleb128 0x5
	.byte	0x8
	.long	0x12ee
	.uleb128 0x28
	.long	.LASF517
	.byte	0x22
	.byte	0x37
	.long	0x135a
	.uleb128 0x9
	.byte	0x3
	.quad	imuConfig_System
	.uleb128 0x29
	.long	.LASF518
	.byte	0x22
	.byte	0x3e
	.long	0x1d47
	.uleb128 0x5
	.byte	0x8
	.long	0x138a
	.uleb128 0x28
	.long	.LASF519
	.byte	0x23
	.byte	0x49
	.long	0x13ea
	.uleb128 0x9
	.byte	0x3
	.quad	failsafeConfig_System
	.uleb128 0x29
	.long	.LASF520
	.byte	0x24
	.byte	0x27
	.long	0x1d6d
	.uleb128 0x5
	.byte	0x8
	.long	0x1456
	.uleb128 0x28
	.long	.LASF521
	.byte	0x25
	.byte	0x21
	.long	0x147a
	.uleb128 0x9
	.byte	0x3
	.quad	airplaneConfig_System
	.uleb128 0x28
	.long	.LASF522
	.byte	0x26
	.byte	0x1c
	.long	0x14b6
	.uleb128 0x9
	.byte	0x3
	.quad	blackboxConfig_System
	.uleb128 0x28
	.long	.LASF523
	.byte	0x27
	.byte	0x16
	.long	0x14da
	.uleb128 0x9
	.byte	0x3
	.quad	mspServerConfig_System
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x3c
	.uleb128 0x19
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF136:
	.string	"auto_disarm_delay"
.LASF374:
	.string	"inputSource"
.LASF26:
	.string	"RGB_GREEN"
.LASF389:
	.string	"PIDPITCH"
.LASF448:
	.string	"mspServerConfig_t"
.LASF168:
	.string	"FEATURE_TRANSPONDER"
.LASF169:
	.string	"motorAndServoConfig_s"
.LASF176:
	.string	"motorAndServoConfig_t"
.LASF217:
	.string	"reboot_character"
.LASF220:
	.string	"modeColorIndexes_s"
.LASF222:
	.string	"modeColorIndexes_t"
.LASF147:
	.string	"FEATURE_RX_PPM"
.LASF174:
	.string	"motor_pwm_rate"
.LASF273:
	.string	"mag_hardware"
.LASF475:
	.string	"__pg_registry_start"
.LASF373:
	.string	"targetChannel"
.LASF45:
	.string	"_Bool"
.LASF56:
	.string	"spektrum_sat_bind"
.LASF427:
	.string	"failsafe_procedure"
.LASF471:
	.string	"pidnames"
.LASF193:
	.string	"provider"
.LASF388:
	.string	"PIDROLL"
.LASF424:
	.string	"failsafe_throttle"
.LASF343:
	.string	"motorMixer_s"
.LASF345:
	.string	"motorMixer_t"
.LASF262:
	.string	"CW90_DEG_FLIP"
.LASF322:
	.string	"MIXER_GIMBAL"
.LASF135:
	.string	"disarm_kill_switch"
.LASF481:
	.string	"rxConfig_System"
.LASF264:
	.string	"CW270_DEG_FLIP"
.LASF404:
	.string	"deltaMethod"
.LASF131:
	.string	"deadband3d_throttle"
.LASF179:
	.string	"gpsProvider_e"
.LASF507:
	.string	"accelerometerConfig_ProfileCurrent"
.LASF192:
	.string	"gpsConfig_s"
.LASF197:
	.string	"gpsConfig_t"
.LASF188:
	.string	"gpsAutoConfig_e"
.LASF336:
	.string	"MIXER_PPM_TO_SERVO"
.LASF48:
	.string	"step"
.LASF486:
	.string	"modeActivationProfile_ProfileCurrent"
.LASF157:
	.string	"FEATURE_TELEMETRY"
.LASF27:
	.string	"RGB_BLUE"
.LASF12:
	.string	"uint16_t"
.LASF379:
	.string	"middle"
.LASF304:
	.string	"accelerometerTrims"
.LASF183:
	.string	"SBAS_MSAS"
.LASF414:
	.string	"small_angle"
.LASF226:
	.string	"transponderConfig_s"
.LASF228:
	.string	"transponderConfig_t"
.LASF367:
	.string	"INPUT_RC_AUX3"
.LASF478:
	.string	"__pg_resetdata_end"
.LASF127:
	.string	"yaw_deadband"
.LASF360:
	.string	"INPUT_STABILIZED_THROTTLE"
.LASF454:
	.string	"mask"
.LASF218:
	.string	"portConfigs"
.LASF369:
	.string	"INPUT_GIMBAL_PITCH"
.LASF70:
	.string	"controlRateConfig_s"
.LASF79:
	.string	"controlRateConfig_t"
.LASF104:
	.string	"BOXSONAR"
.LASF528:
	.string	"mspInit"
.LASF397:
	.string	"PIDVEL"
.LASF495:
	.string	"colors_SystemArray"
.LASF46:
	.string	"rxFailsafeChannelConfiguration_s"
.LASF120:
	.string	"range"
.LASF332:
	.string	"MIXER_HELI_120_CCPM"
.LASF463:
	.string	"serializeDataflashSummaryReply"
.LASF213:
	.string	"functionMask"
.LASF113:
	.string	"channelRange_s"
.LASF116:
	.string	"channelRange_t"
.LASF525:
	.string	"src/main/fc/msp_server_fc.c"
.LASF483:
	.string	"channelRanges_SystemArray"
.LASF60:
	.string	"rcSmoothing"
.LASF511:
	.string	"mixerConfig_System"
.LASF187:
	.string	"GPS_AUTOCONFIG_ON"
.LASF247:
	.string	"values"
.LASF87:
	.string	"BOXMAG"
.LASF324:
	.string	"MIXER_HEX6"
.LASF479:
	.string	"featureConfig_System"
.LASF74:
	.string	"thrExpo8"
.LASF182:
	.string	"SBAS_WAAS"
.LASF155:
	.string	"FEATURE_FAILSAFE"
.LASF190:
	.string	"GPS_AUTOBAUD_ON"
.LASF191:
	.string	"gpsAutoBaud_e"
.LASF52:
	.string	"rxConfig_s"
.LASF66:
	.string	"rxConfig_t"
.LASF344:
	.string	"throttle"
.LASF67:
	.string	"mspPacket_s"
.LASF69:
	.string	"mspPacket_t"
.LASF85:
	.string	"BOXHORIZON"
.LASF124:
	.string	"modeActivationProfile_t"
.LASF115:
	.string	"endStep"
.LASF405:
	.string	"horizon_tilt_effect"
.LASF261:
	.string	"CW0_DEG_FLIP"
.LASF57:
	.string	"rssi_channel"
.LASF21:
	.string	"FD_INDEX_COUNT"
.LASF423:
	.string	"failsafe_off_delay"
.LASF134:
	.string	"retarded_arm"
.LASF160:
	.string	"FEATURE_RX_PARALLEL_PWM"
.LASF251:
	.string	"SENSOR_BARO"
.LASF391:
	.string	"PIDALT"
.LASF98:
	.string	"BOXLLIGHTS"
.LASF175:
	.string	"servo_pwm_rate"
.LASF401:
	.string	"yaw_p_limit"
.LASF156:
	.string	"FEATURE_SONAR"
.LASF515:
	.string	"servoProfile_ProfileCurrent"
.LASF342:
	.string	"MIXER_CUSTOM_TRI"
.LASF148:
	.string	"FEATURE_VBAT"
.LASF178:
	.string	"GPS_UBLOX"
.LASF323:
	.string	"MIXER_Y6"
.LASF355:
	.string	"neutral3d"
.LASF393:
	.string	"PIDPOSR"
.LASF496:
	.string	"modeColors_SystemArray"
.LASF381:
	.string	"angleAtMax"
.LASF209:
	.string	"SERIAL_PORT_IDENTIFIER_MAX"
.LASF465:
	.string	"mspServerCommandHandler"
.LASF55:
	.string	"sbus_inversion"
.LASF339:
	.string	"MIXER_ATAIL4"
.LASF331:
	.string	"MIXER_AIRPLANE"
.LASF257:
	.string	"CW0_DEG"
.LASF244:
	.string	"roll"
.LASF61:
	.string	"midrc"
.LASF246:
	.string	"flightDynamicsTrims_def_t"
.LASF140:
	.string	"adjustmentFunction"
.LASF260:
	.string	"CW270_DEG"
.LASF315:
	.string	"gyro_lpf"
.LASF166:
	.string	"FEATURE_BLACKBOX"
.LASF461:
	.string	"initActiveBoxIds"
.LASF47:
	.string	"mode"
.LASF189:
	.string	"GPS_AUTOBAUD_OFF"
.LASF241:
	.string	"SENSOR_INDEX_BARO"
.LASF196:
	.string	"autoBaud"
.LASF240:
	.string	"SENSOR_INDEX_ACC"
.LASF254:
	.string	"SENSOR_GPS"
.LASF1:
	.string	"unsigned char"
.LASF151:
	.string	"FEATURE_MOTOR_STOP"
.LASF150:
	.string	"FEATURE_RX_SERIAL"
.LASF456:
	.string	"findBoxByBoxId"
.LASF139:
	.string	"adjustmentRange_s"
.LASF143:
	.string	"adjustmentRange_t"
.LASF77:
	.string	"rcYawExpo8"
.LASF16:
	.string	"float"
.LASF290:
	.string	"vbatmaxcellvoltage"
.LASF83:
	.string	"BOXARM"
.LASF62:
	.string	"mincheck"
.LASF400:
	.string	"pidController"
.LASF99:
	.string	"BOXCALIB"
.LASF34:
	.string	"pgRegistry_s"
.LASF38:
	.string	"pgRegistry_t"
.LASF293:
	.string	"batteryCapacity"
.LASF153:
	.string	"FEATURE_SOFTSERIAL"
.LASF378:
	.string	"servoParam_s"
.LASF384:
	.string	"servoParam_t"
.LASF256:
	.string	"ALIGN_DEFAULT"
.LASF95:
	.string	"BOXBEEPERON"
.LASF280:
	.string	"amperageMeterConfig_s"
.LASF283:
	.string	"amperageMeterConfig_t"
.LASF449:
	.string	"box_e"
.LASF63:
	.string	"maxcheck"
.LASF453:
	.string	"box_t"
.LASF164:
	.string	"FEATURE_DISPLAY"
.LASF340:
	.string	"MIXER_CUSTOM"
.LASF223:
	.string	"specialColorIndexes_s"
.LASF184:
	.string	"SBAS_GAGAN"
.LASF177:
	.string	"GPS_NMEA"
.LASF341:
	.string	"MIXER_CUSTOM_AIRPLANE"
.LASF523:
	.string	"mspServerConfig_System"
.LASF112:
	.string	"boxId_e"
.LASF105:
	.string	"BOXSERVO1"
.LASF106:
	.string	"BOXSERVO2"
.LASF107:
	.string	"BOXSERVO3"
.LASF78:
	.string	"tpa_breakpoint"
.LASF194:
	.string	"sbasMode"
.LASF229:
	.string	"telemetryConfig_s"
.LASF233:
	.string	"telemetryConfig_t"
.LASF390:
	.string	"PIDYAW"
.LASF305:
	.string	"acc_cut_hz"
.LASF173:
	.string	"servoCenterPulse"
.LASF462:
	.string	"serializeSDCardSummaryReply"
.LASF35:
	.string	"size"
.LASF65:
	.string	"rx_max_usec"
.LASF338:
	.string	"MIXER_SINGLECOPTER"
.LASF458:
	.string	"reply"
.LASF33:
	.string	"pgResetFunc"
.LASF212:
	.string	"identifier"
.LASF11:
	.string	"uint8_t"
.LASF242:
	.string	"SENSOR_INDEX_MAG"
.LASF348:
	.string	"pid_at_min_throttle"
.LASF328:
	.string	"MIXER_OCTOX8"
.LASF149:
	.string	"FEATURE_INFLIGHT_ACC_CAL"
.LASF469:
	.string	"boxes"
.LASF466:
	.string	"enabledSensors"
.LASF278:
	.string	"magZero"
.LASF201:
	.string	"SERIAL_PORT_UART1"
.LASF202:
	.string	"SERIAL_PORT_UART2"
.LASF203:
	.string	"SERIAL_PORT_UART3"
.LASF204:
	.string	"SERIAL_PORT_UART4"
.LASF205:
	.string	"SERIAL_PORT_UART5"
.LASF370:
	.string	"INPUT_GIMBAL_ROLL"
.LASF19:
	.string	"FD_PITCH"
.LASF145:
	.string	"adjustmentRanges"
.LASF364:
	.string	"INPUT_RC_THROTTLE"
.LASF526:
	.string	"/home/aravind/git/cleanflight"
.LASF473:
	.string	"U_ID_1"
.LASF506:
	.string	"batteryConfig_System"
.LASF319:
	.string	"MIXER_QUADP"
.LASF320:
	.string	"MIXER_QUADX"
.LASF58:
	.string	"rssi_scale"
.LASF435:
	.string	"nav_speed_max"
.LASF73:
	.string	"thrMid8"
.LASF382:
	.string	"forwardFromChannel"
.LASF505:
	.string	"voltageMeterConfig_SystemArray"
.LASF440:
	.string	"airplaneConfig_t"
.LASF433:
	.string	"nav_controls_heading"
.LASF318:
	.string	"MIXER_TRI"
.LASF508:
	.string	"compassConfig_ProfileCurrent"
.LASF253:
	.string	"SENSOR_SONAR"
.LASF167:
	.string	"FEATURE_CHANNEL_FORWARDING"
.LASF457:
	.string	"findBoxByPermenantId"
.LASF185:
	.string	"sbasMode_e"
.LASF362:
	.string	"INPUT_RC_PITCH"
.LASF225:
	.string	"ledConfig_t"
.LASF510:
	.string	"customMotorMixer_SystemArray"
.LASF250:
	.string	"SENSOR_ACC"
.LASF36:
	.string	"address"
.LASF266:
	.string	"sensorAlignmentConfig_s"
.LASF270:
	.string	"sensorAlignmentConfig_t"
.LASF243:
	.string	"int16_flightDynamicsTrims_s"
.LASF403:
	.string	"yaw_lpf"
.LASF358:
	.string	"INPUT_STABILIZED_PITCH"
.LASF245:
	.string	"pitch"
.LASF230:
	.string	"telemetry_switch"
.LASF399:
	.string	"pidProfile_s"
.LASF407:
	.string	"pidProfile_t"
.LASF269:
	.string	"mag_align"
.LASF42:
	.string	"profileSelection_s"
.LASF44:
	.string	"profileSelection_t"
.LASF460:
	.string	"serializeBoxIdsReply"
.LASF181:
	.string	"SBAS_EGNOS"
.LASF118:
	.string	"modeId"
.LASF141:
	.string	"auxSwitchChannelIndex"
.LASF452:
	.string	"permanentId"
.LASF84:
	.string	"BOXANGLE"
.LASF235:
	.string	"rollDegrees"
.LASF421:
	.string	"failsafeConfig_s"
.LASF428:
	.string	"failsafeConfig_t"
.LASF284:
	.string	"voltageMeterConfig_s"
.LASF288:
	.string	"voltageMeterConfig_t"
.LASF195:
	.string	"autoConfig"
.LASF294:
	.string	"amperageMeterSource"
.LASF24:
	.string	"ANGLE_INDEX_COUNT"
.LASF301:
	.string	"accDeadband_s"
.LASF248:
	.string	"flightDynamicsTrims_t"
.LASF298:
	.string	"flightDynamicsTrims_u"
.LASF68:
	.string	"result"
.LASF231:
	.string	"telemetry_inversion"
.LASF9:
	.string	"int8_t"
.LASF487:
	.string	"rcControlsConfig_ProfileCurrent"
.LASF170:
	.string	"minthrottle"
.LASF144:
	.string	"adjustmentProfile_s"
.LASF146:
	.string	"adjustmentProfile_t"
.LASF383:
	.string	"reversedSources"
.LASF498:
	.string	"transponderConfig_System"
.LASF470:
	.string	"activeBoxIds"
.LASF503:
	.string	"sensorTrims_System"
.LASF37:
	.string	"reset"
.LASF334:
	.string	"MIXER_VTAIL4"
.LASF418:
	.string	"throttle_correction_angle"
.LASF7:
	.string	"sizetype"
.LASF267:
	.string	"gyro_align"
.LASF359:
	.string	"INPUT_STABILIZED_YAW"
.LASF365:
	.string	"INPUT_RC_AUX1"
.LASF366:
	.string	"INPUT_RC_AUX2"
.LASF171:
	.string	"maxthrottle"
.LASF368:
	.string	"INPUT_RC_AUX4"
.LASF434:
	.string	"nav_speed_min"
.LASF10:
	.string	"int16_t"
.LASF2:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF117:
	.string	"modeActivationCondition_s"
.LASF121:
	.string	"modeActivationCondition_t"
.LASF346:
	.string	"mixerConfig_s"
.LASF351:
	.string	"mixerConfig_t"
.LASF277:
	.string	"accZero"
.LASF162:
	.string	"FEATURE_RSSI_ADC"
.LASF497:
	.string	"specialColors_System"
.LASF234:
	.string	"boardAlignment_s"
.LASF238:
	.string	"boardAlignment_t"
.LASF90:
	.string	"BOXCAMSTAB"
.LASF18:
	.string	"FD_ROLL"
.LASF252:
	.string	"SENSOR_MAG"
.LASF207:
	.string	"SERIAL_PORT_SOFTSERIAL1"
.LASF208:
	.string	"SERIAL_PORT_SOFTSERIAL2"
.LASF321:
	.string	"MIXER_BICOPTER"
.LASF110:
	.string	"BOXAIRMODE"
.LASF303:
	.string	"accelerometerConfig_s"
.LASF309:
	.string	"accelerometerConfig_t"
.LASF54:
	.string	"serialrx_provider"
.LASF122:
	.string	"modeActivationProfile_s"
.LASF524:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF307:
	.string	"accDeadband"
.LASF493:
	.string	"serialConfig_System"
.LASF172:
	.string	"mincommand"
.LASF504:
	.string	"amperageMeterConfig_SystemArray"
.LASF88:
	.string	"BOXHEADFREE"
.LASF402:
	.string	"dterm_lpf"
.LASF429:
	.string	"gpsProfile_s"
.LASF437:
	.string	"gpsProfile_t"
.LASF326:
	.string	"MIXER_Y4"
.LASF285:
	.string	"vbatscale"
.LASF109:
	.string	"BOXFAILSAFE"
.LASF518:
	.string	"throttleCorrectionConfig_ProfileCurrent"
.LASF489:
	.string	"adjustmentProfile_ProfileCurrent"
.LASF206:
	.string	"SERIAL_PORT_USB_VCP"
.LASF276:
	.string	"sensorTrims_s"
.LASF279:
	.string	"sensorTrims_t"
.LASF380:
	.string	"angleAtMin"
.LASF20:
	.string	"FD_YAW"
.LASF6:
	.string	"long int"
.LASF325:
	.string	"MIXER_FLYING_WING"
.LASF352:
	.string	"motor3DConfig_s"
.LASF356:
	.string	"motor3DConfig_t"
.LASF333:
	.string	"MIXER_HELI_90_DEG"
.LASF329:
	.string	"MIXER_OCTOFLATP"
.LASF491:
	.string	"gpsConfig_System"
.LASF330:
	.string	"MIXER_OCTOFLATX"
.LASF40:
	.string	"enabledFeatures"
.LASF101:
	.string	"BOXOSD"
.LASF268:
	.string	"acc_align"
.LASF221:
	.string	"color"
.LASF255:
	.string	"SENSOR_GPSMAG"
.LASF422:
	.string	"failsafe_delay"
.LASF520:
	.string	"gpsProfile_ProfileCurrent"
.LASF103:
	.string	"BOXGTUNE"
.LASF289:
	.string	"batteryConfig_s"
.LASF295:
	.string	"batteryConfig_t"
.LASF476:
	.string	"__pg_registry_end"
.LASF232:
	.string	"telemetry_send_cells"
.LASF272:
	.string	"acc_hardware"
.LASF13:
	.string	"uint32_t"
.LASF516:
	.string	"pidProfile_ProfileCurrent"
.LASF286:
	.string	"vbatresdivval"
.LASF519:
	.string	"failsafeConfig_System"
.LASF468:
	.string	"boardIdentifier"
.LASF444:
	.string	"device"
.LASF488:
	.string	"armingConfig_System"
.LASF485:
	.string	"rateProfileSelection_ProfileCurrent"
.LASF93:
	.string	"BOXGPSHOLD"
.LASF410:
	.string	"gyroSync"
.LASF450:
	.string	"boxName"
.LASF133:
	.string	"armingConfig_s"
.LASF138:
	.string	"armingConfig_t"
.LASF108:
	.string	"BOXBLACKBOX"
.LASF0:
	.string	"long unsigned int"
.LASF89:
	.string	"BOXHEADADJ"
.LASF443:
	.string	"rate_denom"
.LASF313:
	.string	"gyroConfig_s"
.LASF317:
	.string	"gyroConfig_t"
.LASF92:
	.string	"BOXGPSHOME"
.LASF492:
	.string	"gimbalConfig_ProfileCurrent"
.LASF165:
	.string	"FEATURE_ONESHOT125"
.LASF8:
	.string	"char"
.LASF392:
	.string	"PIDPOS"
.LASF372:
	.string	"servoMixer_s"
.LASF377:
	.string	"servoMixer_t"
.LASF72:
	.string	"rcExpo8"
.LASF438:
	.string	"airplaneConfig_s"
.LASF214:
	.string	"baudRates"
.LASF29:
	.string	"hsvColor_s"
.LASF28:
	.string	"hsvColor_t"
.LASF96:
	.string	"BOXLEDMAX"
.LASF316:
	.string	"soft_gyro_lpf_hz"
.LASF75:
	.string	"rates"
.LASF200:
	.string	"SERIAL_PORT_NONE"
.LASF59:
	.string	"rssi_ppm_invert"
.LASF464:
	.string	"sensors"
.LASF186:
	.string	"GPS_AUTOCONFIG_OFF"
.LASF86:
	.string	"BOXBARO"
.LASF81:
	.string	"defaultRateProfileIndex"
.LASF490:
	.string	"motorAndServoConfig_System"
.LASF499:
	.string	"telemetryConfig_System"
.LASF263:
	.string	"CW180_DEG_FLIP"
.LASF527:
	.string	"mixerConfig"
.LASF439:
	.string	"fixedwing_althold_dir"
.LASF152:
	.string	"FEATURE_SERVO_TILT"
.LASF180:
	.string	"SBAS_AUTO"
.LASF426:
	.string	"failsafe_throttle_low_delay"
.LASF49:
	.string	"rxFailsafeChannelConfig_t"
.LASF357:
	.string	"INPUT_STABILIZED_ROLL"
.LASF274:
	.string	"baro_hardware"
.LASF363:
	.string	"INPUT_RC_YAW"
.LASF302:
	.string	"accDeadband_t"
.LASF447:
	.string	"multiwiiCurrentMeterOutput"
.LASF371:
	.string	"INPUT_SOURCE_COUNT"
.LASF484:
	.string	"controlRateProfiles_SystemArray"
.LASF417:
	.string	"throttleCorrectionConfig_s"
.LASF420:
	.string	"throttleCorrectionConfig_t"
.LASF137:
	.string	"max_arm_angle"
.LASF198:
	.string	"gimbalConfig_s"
.LASF199:
	.string	"gimbalConfig_t"
.LASF258:
	.string	"CW90_DEG"
.LASF211:
	.string	"serialPortConfig_s"
.LASF215:
	.string	"serialPortConfig_t"
.LASF265:
	.string	"sensor_align_e"
.LASF477:
	.string	"__pg_resetdata_start"
.LASF297:
	.string	"rollAndPitchTrims_t_def"
.LASF502:
	.string	"sensorAlignmentConfig_System"
.LASF406:
	.string	"horizon_tilt_mode"
.LASF349:
	.string	"yaw_motor_direction"
.LASF436:
	.string	"ap_mode"
.LASF337:
	.string	"MIXER_DUALCOPTER"
.LASF102:
	.string	"BOXTELEMETRY"
.LASF236:
	.string	"pitchDegrees"
.LASF396:
	.string	"PIDMAG"
.LASF39:
	.string	"featureConfig_s"
.LASF41:
	.string	"featureConfig_t"
.LASF17:
	.string	"double"
.LASF522:
	.string	"blackboxConfig_System"
.LASF517:
	.string	"imuConfig_System"
.LASF114:
	.string	"startStep"
.LASF43:
	.string	"current_profile_index"
.LASF161:
	.string	"FEATURE_RX_MSP"
.LASF154:
	.string	"FEATURE_GPS"
.LASF376:
	.string	"speed"
.LASF125:
	.string	"rcControlsConfig_s"
.LASF132:
	.string	"rcControlsConfig_t"
.LASF281:
	.string	"scale"
.LASF111:
	.string	"CHECKBOX_ITEM_COUNT"
.LASF100:
	.string	"BOXGOV"
.LASF128:
	.string	"alt_hold_deadband"
.LASF500:
	.string	"boardAlignment_System"
.LASF512:
	.string	"motor3DConfig_System"
.LASF227:
	.string	"data"
.LASF163:
	.string	"FEATURE_LED_STRIP"
.LASF386:
	.string	"servoConf"
.LASF292:
	.string	"vbatwarningcellvoltage"
.LASF50:
	.string	"rxChannelRangeConfiguration_s"
.LASF51:
	.string	"rxChannelRangeConfiguration_t"
.LASF76:
	.string	"dynThrPID"
.LASF310:
	.string	"compassConfig_s"
.LASF312:
	.string	"compassConfig_t"
.LASF210:
	.string	"serialPortIdentifier_e"
.LASF271:
	.string	"sensorSelectionConfig_s"
.LASF311:
	.string	"mag_declination"
.LASF455:
	.string	"candidate"
.LASF216:
	.string	"serialConfig_s"
.LASF219:
	.string	"serialConfig_t"
.LASF97:
	.string	"BOXLEDLOW"
.LASF419:
	.string	"throttle_correction_value"
.LASF430:
	.string	"gps_wp_radius"
.LASF347:
	.string	"mixerMode"
.LASF354:
	.string	"deadband3d_high"
.LASF15:
	.string	"long long unsigned int"
.LASF282:
	.string	"offset"
.LASF314:
	.string	"gyroMovementCalibrationThreshold"
.LASF415:
	.string	"max_angle_inclination"
.LASF408:
	.string	"imuConfig_s"
.LASF416:
	.string	"imuConfig_t"
.LASF224:
	.string	"specialColorIndexes_t"
.LASF32:
	.string	"pgn_t"
.LASF30:
	.string	"sbuf_s"
.LASF31:
	.string	"sbuf_t"
.LASF413:
	.string	"dcm_ki"
.LASF412:
	.string	"dcm_kp"
.LASF296:
	.string	"rollAndPitchTrims_s"
.LASF300:
	.string	"rollAndPitchTrims_t"
.LASF299:
	.string	"rollAndPitchTrims_u"
.LASF335:
	.string	"MIXER_HEX6H"
.LASF494:
	.string	"ledConfigs_SystemArray"
.LASF327:
	.string	"MIXER_HEX6X"
.LASF22:
	.string	"AI_ROLL"
.LASF119:
	.string	"auxChannelIndex"
.LASF425:
	.string	"failsafe_kill_switch"
.LASF25:
	.string	"RGB_RED"
.LASF472:
	.string	"U_ID_0"
.LASF64:
	.string	"rx_min_usec"
.LASF474:
	.string	"U_ID_2"
.LASF71:
	.string	"rcRate8"
.LASF308:
	.string	"acc_unarmedcal"
.LASF142:
	.string	"adjustmentIndex"
.LASF431:
	.string	"gps_lpf"
.LASF80:
	.string	"rateProfileSelection_s"
.LASF82:
	.string	"rateProfileSelection_t"
.LASF350:
	.string	"yaw_jump_prevention_limit"
.LASF14:
	.string	"long long int"
.LASF442:
	.string	"rate_num"
.LASF159:
	.string	"FEATURE_3D"
.LASF23:
	.string	"AI_PITCH"
.LASF409:
	.string	"looptime"
.LASF501:
	.string	"sensorSelectionConfig_System"
.LASF123:
	.string	"modeActivationConditions"
.LASF53:
	.string	"rcmap"
.LASF249:
	.string	"SENSOR_GYRO"
.LASF275:
	.string	"sensorSelectionConfig_t"
.LASF451:
	.string	"boxId"
.LASF394:
	.string	"PIDNAVR"
.LASF129:
	.string	"alt_hold_fast_change"
.LASF521:
	.string	"airplaneConfig_System"
.LASF411:
	.string	"gyroSyncDenominator"
.LASF514:
	.string	"customServoMixer_SystemArray"
.LASF398:
	.string	"PID_ITEM_COUNT"
.LASF237:
	.string	"yawDegrees"
.LASF287:
	.string	"vbatresdivmultiplier"
.LASF158:
	.string	"FEATURE_AMPERAGE_METER"
.LASF446:
	.string	"mspServerConfig_s"
.LASF306:
	.string	"accz_lpf_cutoff"
.LASF130:
	.string	"yaw_control_direction"
.LASF482:
	.string	"failsafeChannelConfigs_SystemArray"
.LASF361:
	.string	"INPUT_RC_ROLL"
.LASF353:
	.string	"deadband3d_low"
.LASF3:
	.string	"unsigned int"
.LASF239:
	.string	"SENSOR_INDEX_GYRO"
.LASF441:
	.string	"blackboxConfig_s"
.LASF445:
	.string	"blackboxConfig_t"
.LASF509:
	.string	"gyroConfig_System"
.LASF94:
	.string	"BOXPASSTHRU"
.LASF459:
	.string	"serializeBoxNamesReply"
.LASF5:
	.string	"short int"
.LASF467:
	.string	"flightControllerIdentifier"
.LASF126:
	.string	"deadband"
.LASF513:
	.string	"inputSource_e"
.LASF375:
	.string	"rate"
.LASF91:
	.string	"BOXCAMTRIG"
.LASF480:
	.string	"profileSelection_System"
.LASF432:
	.string	"nav_slew_rate"
.LASF395:
	.string	"PIDLEVEL"
.LASF259:
	.string	"CW180_DEG"
.LASF385:
	.string	"servoProfile_s"
.LASF387:
	.string	"servoProfile_t"
.LASF291:
	.string	"vbatmincellvoltage"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
