	.file	"compass.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed compass.i -mtune=generic -march=x86-64 -g
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
	.comm	boardAlignment_System,6,1
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.section	.text.compassConfig,"ax",@progbits
	.type	compassConfig, @function
compassConfig:
.LFB15:
	.file 1 "./src/main/sensors/compass.h"
	.loc 1 37 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 37 0
	movq	compassConfig_ProfileCurrent(%rip), %rax	# compassConfig_ProfileCurrent, D.3703
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	compassConfig, .-compassConfig
	.section	.bss.compassConfig_Storage,"aw",@nobits
	.align 2
	.type	compassConfig_Storage, @object
	.size	compassConfig_Storage, 6
compassConfig_Storage:
	.zero	6
	.comm	compassConfig_ProfileCurrent,8,8
	.globl	compassConfig_Registry
	.section	.pg_registry,"a",@progbits
	.align 8
	.type	compassConfig_Registry, @object
	.size	compassConfig_Registry, 32
compassConfig_Registry:
# pgn:
	.value	40
# size:
	.value	-32766
# address:
	.zero	4
	.quad	compassConfig_Storage
# ptr:
	.quad	compassConfig_ProfileCurrent
# reset:
# ptr:
	.quad	pgResetTemplate_compassConfig
	.globl	pgResetTemplate_compassConfig
	.section	.pg_resetdata,"a",@progbits
	.align 2
	.type	pgResetTemplate_compassConfig, @object
	.size	pgResetTemplate_compassConfig, 2
pgResetTemplate_compassConfig:
	.zero	2
	.globl	magneticDeclination
	.section	.bss.magneticDeclination,"aw",@nobits
	.align 4
	.type	magneticDeclination, @object
	.size	magneticDeclination, 4
magneticDeclination:
	.zero	4
	.comm	magADCRaw,6,2
	.comm	magADC,12,8
	.globl	magAlign
	.section	.bss.magAlign,"aw",@nobits
	.align 4
	.type	magAlign, @object
	.size	magAlign, 4
magAlign:
	.zero	4
	.section	.data.magInit,"aw",@progbits
	.type	magInit, @object
	.size	magInit, 1
magInit:
	.byte	1
	.section	.rodata
.LC0:
	.string	"LED1_ON"
.LC1:
	.string	"LED1_OFF"
	.section	.text.compassInit,"ax",@progbits
	.globl	compassInit
	.type	compassInit, @function
compassInit:
.LFB16:
	.file 2 "src/main/sensors/compass.c"
	.loc 2 71 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 2 74 0
	movl	$.LC0, %edi	#,
	call	puts	#
	.loc 2 75 0
	movq	mag(%rip), %rax	# mag.init, D.3704
	call	*%rax	# D.3704
	movb	%al, -1(%rbp)	# tmp90, ret
	.loc 2 77 0
	movl	$.LC1, %edi	#,
	call	puts	#
	.loc 2 78 0
	cmpb	$0, -1(%rbp)	#, ret
	je	.L4	#,
	.loc 2 79 0
	movb	$1, magInit(%rip)	#, magInit
.L4:
	.loc 2 81 0
	movzbl	-1(%rbp), %eax	# ret, D.3705
	.loc 2 82 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	compassInit, .-compassInit
	.section	.rodata
.LC2:
	.string	"LED0_TOGGLE"
	.section	.text.updateCompass,"ax",@progbits
	.globl	updateCompass
	.type	updateCompass, @function
updateCompass:
.LFB17:
	.loc 2 85 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# magZero, magZero
	.loc 2 90 0
	movq	mag+8(%rip), %rax	# mag.read, D.3708
	movl	$magADCRaw, %edi	#,
	call	*%rax	# D.3708
	xorl	$1, %eax	#, D.3709
	testb	%al, %al	# D.3709
	jne	.L22	#,
.LBB2:
	.loc 2 93 0
	movl	$0, -16(%rbp)	#, axis
	jmp	.L9	#
.L10:
	.loc 2 94 0 discriminator 3
	movl	-16(%rbp), %eax	# axis, tmp140
	cltq
	movzwl	magADCRaw(%rax,%rax), %eax	# magADCRaw, D.3710
	movswl	%ax, %edx	# D.3710, D.3711
	movl	-16(%rbp), %eax	# axis, tmp142
	cltq
	movl	%edx, magADC(,%rax,4)	# D.3711, magADC
	.loc 2 93 0 discriminator 3
	addl	$1, -16(%rbp)	#, axis
.L9:
	.loc 2 93 0 is_stmt 0 discriminator 1
	cmpl	$2, -16(%rbp)	#, axis
	jle	.L10	#,
.LBE2:
	.loc 2 96 0 is_stmt 1
	movl	magAlign(%rip), %eax	# magAlign, D.3712
	movzbl	%al, %eax	# D.3713, D.3711
	movl	%eax, %edx	# D.3711,
	movl	$magADC, %esi	#,
	movl	$magADC, %edi	#,
	call	alignSensors	#
	.loc 2 98 0
	movzbl	stateFlags(%rip), %eax	# stateFlags, D.3713
	movzbl	%al, %eax	# D.3713, D.3711
	andl	$4, %eax	#, D.3711
	testl	%eax, %eax	# D.3711
	je	.L11	#,
	.loc 2 99 0
	movl	currentTime(%rip), %eax	# currentTime, D.3714
	movl	%eax, tCal.3586(%rip)	# D.3714, tCal
.LBB3:
	.loc 2 100 0
	movl	$0, -12(%rbp)	#, axis
	jmp	.L12	#
.L13:
	.loc 2 101 0 discriminator 3
	movq	-24(%rbp), %rax	# magZero, tmp143
	movl	-12(%rbp), %edx	# axis, tmp145
	movslq	%edx, %rdx	# tmp145, tmp144
	movw	$0, (%rax,%rdx,2)	#, magZero_34(D)->raw
	.loc 2 102 0 discriminator 3
	movl	-12(%rbp), %eax	# axis, tmp147
	cltq
	movl	magADC(,%rax,4), %eax	# magADC, D.3711
	movl	%eax, %edx	# D.3711, D.3710
	movl	-12(%rbp), %eax	# axis, tmp149
	cltq
	movw	%dx, magZeroTempMin.3587(%rax,%rax)	# D.3710, magZeroTempMin.raw
	.loc 2 103 0 discriminator 3
	movl	-12(%rbp), %eax	# axis, tmp151
	cltq
	movl	magADC(,%rax,4), %eax	# magADC, D.3711
	movl	%eax, %edx	# D.3711, D.3710
	movl	-12(%rbp), %eax	# axis, tmp153
	cltq
	movw	%dx, magZeroTempMax.3588(%rax,%rax)	# D.3710, magZeroTempMax.raw
	.loc 2 100 0 discriminator 3
	addl	$1, -12(%rbp)	#, axis
.L12:
	.loc 2 100 0 is_stmt 0 discriminator 1
	cmpl	$2, -12(%rbp)	#, axis
	jle	.L13	#,
.LBE3:
	.loc 2 105 0 is_stmt 1
	movzbl	stateFlags(%rip), %eax	# stateFlags, D.3713
	andl	$-5, %eax	#, D.3713
	movb	%al, stateFlags(%rip)	# D.3713, stateFlags
.L11:
	.loc 2 108 0
	movzbl	magInit(%rip), %eax	# magInit, D.3713
	testb	%al, %al	# D.3713
	je	.L14	#,
	.loc 2 109 0
	movl	magADC(%rip), %edx	# magADC, D.3711
	movq	-24(%rbp), %rax	# magZero, tmp154
	movzwl	(%rax), %eax	# magZero_34(D)->raw, D.3710
	cwtl
	subl	%eax, %edx	# D.3711, D.3711
	movl	%edx, %eax	# D.3711, D.3711
	movl	%eax, magADC(%rip)	# D.3711, magADC
	.loc 2 110 0
	movl	magADC+4(%rip), %edx	# magADC, D.3711
	movq	-24(%rbp), %rax	# magZero, tmp155
	movzwl	2(%rax), %eax	# magZero_34(D)->raw, D.3710
	cwtl
	subl	%eax, %edx	# D.3711, D.3711
	movl	%edx, %eax	# D.3711, D.3711
	movl	%eax, magADC+4(%rip)	# D.3711, magADC
	.loc 2 111 0
	movl	magADC+8(%rip), %edx	# magADC, D.3711
	movq	-24(%rbp), %rax	# magZero, tmp156
	movzwl	4(%rax), %eax	# magZero_34(D)->raw, D.3710
	cwtl
	subl	%eax, %edx	# D.3711, D.3711
	movl	%edx, %eax	# D.3711, D.3711
	movl	%eax, magADC+8(%rip)	# D.3711, magADC
.L14:
	.loc 2 114 0
	movl	tCal.3586(%rip), %eax	# tCal, D.3714
	testl	%eax, %eax	# D.3714
	je	.L6	#,
	.loc 2 115 0
	movl	currentTime(%rip), %edx	# currentTime, D.3714
	movl	tCal.3586(%rip), %eax	# tCal, D.3714
	subl	%eax, %edx	# D.3714, D.3714
	movl	%edx, %eax	# D.3714, D.3714
	cmpl	$29999999, %eax	#, D.3714
	ja	.L15	#,
	.loc 2 117 0
	movl	$.LC2, %edi	#,
	call	puts	#
.LBB4:
	.loc 2 118 0
	movl	$0, -8(%rbp)	#, axis
	jmp	.L16	#
.L19:
	.loc 2 119 0
	movl	-8(%rbp), %eax	# axis, tmp158
	cltq
	movl	magADC(,%rax,4), %edx	# magADC, D.3711
	movl	-8(%rbp), %eax	# axis, tmp160
	cltq
	movzwl	magZeroTempMin.3587(%rax,%rax), %eax	# magZeroTempMin.raw, D.3710
	cwtl
	cmpl	%eax, %edx	# D.3711, D.3711
	jge	.L17	#,
	.loc 2 120 0
	movl	-8(%rbp), %eax	# axis, tmp162
	cltq
	movl	magADC(,%rax,4), %eax	# magADC, D.3711
	movl	%eax, %edx	# D.3711, D.3710
	movl	-8(%rbp), %eax	# axis, tmp164
	cltq
	movw	%dx, magZeroTempMin.3587(%rax,%rax)	# D.3710, magZeroTempMin.raw
.L17:
	.loc 2 121 0
	movl	-8(%rbp), %eax	# axis, tmp166
	cltq
	movl	magADC(,%rax,4), %edx	# magADC, D.3711
	movl	-8(%rbp), %eax	# axis, tmp168
	cltq
	movzwl	magZeroTempMax.3588(%rax,%rax), %eax	# magZeroTempMax.raw, D.3710
	cwtl
	cmpl	%eax, %edx	# D.3711, D.3711
	jle	.L18	#,
	.loc 2 122 0
	movl	-8(%rbp), %eax	# axis, tmp170
	cltq
	movl	magADC(,%rax,4), %eax	# magADC, D.3711
	movl	%eax, %edx	# D.3711, D.3710
	movl	-8(%rbp), %eax	# axis, tmp172
	cltq
	movw	%dx, magZeroTempMax.3588(%rax,%rax)	# D.3710, magZeroTempMax.raw
.L18:
	.loc 2 118 0 discriminator 2
	addl	$1, -8(%rbp)	#, axis
.L16:
	.loc 2 118 0 is_stmt 0 discriminator 1
	cmpl	$2, -8(%rbp)	#, axis
	jle	.L19	#,
	jmp	.L6	#
.L15:
.LBE4:
	.loc 2 125 0 is_stmt 1
	movl	$0, tCal.3586(%rip)	#, tCal
.LBB5:
	.loc 2 126 0
	movl	$0, -4(%rbp)	#, axis
	jmp	.L20	#
.L21:
	.loc 2 127 0 discriminator 3
	movl	-4(%rbp), %eax	# axis, tmp174
	cltq
	movzwl	magZeroTempMin.3587(%rax,%rax), %eax	# magZeroTempMin.raw, D.3710
	movswl	%ax, %edx	# D.3710, D.3711
	movl	-4(%rbp), %eax	# axis, tmp176
	cltq
	movzwl	magZeroTempMax.3588(%rax,%rax), %eax	# magZeroTempMax.raw, D.3710
	cwtl
	addl	%edx, %eax	# D.3711, D.3711
	movl	%eax, %edx	# D.3711, tmp177
	shrl	$31, %edx	#, tmp177
	addl	%edx, %eax	# tmp177, tmp178
	sarl	%eax	# tmp179
	movl	%eax, %ecx	# D.3711, D.3710
	movq	-24(%rbp), %rax	# magZero, tmp180
	movl	-4(%rbp), %edx	# axis, tmp182
	movslq	%edx, %rdx	# tmp182, tmp181
	movw	%cx, (%rax,%rdx,2)	# D.3710, magZero_34(D)->raw
	.loc 2 126 0 discriminator 3
	addl	$1, -4(%rbp)	#, axis
.L20:
	.loc 2 126 0 is_stmt 0 discriminator 1
	cmpl	$2, -4(%rbp)	#, axis
	jle	.L21	#,
	jmp	.L6	#
.L22:
.LBE5:
	.loc 2 91 0 is_stmt 1
	nop
.L6:
	.loc 2 133 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	updateCompass, .-updateCompass
	.section	.text.recalculateMagneticDeclination,"ax",@progbits
	.globl	recalculateMagneticDeclination
	.type	recalculateMagneticDeclination, @function
recalculateMagneticDeclination:
.LFB18:
	.loc 2 137 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 2 140 0
	movl	$8, %edi	#,
	call	sensors	#
	testb	%al, %al	# D.3716
	je	.L24	#,
	.loc 2 142 0
	call	compassConfig	#
	movzwl	(%rax), %eax	# _6->mag_declination, D.3718
	movswl	%ax, %edx	# D.3718, tmp97
	imull	$5243, %edx, %edx	#, tmp97, tmp98
	shrl	$16, %edx	#, tmp99
	sarw	$3, %dx	#, tmp100
	sarw	$15, %ax	#, tmp101
	subl	%eax, %edx	# tmp101, tmp102
	movl	%edx, %eax	# tmp102, tmp102
	movw	%ax, -4(%rbp)	# tmp102, deg
	.loc 2 143 0
	call	compassConfig	#
	movzwl	(%rax), %edx	# _10->mag_declination, D.3718
	movswl	%dx, %eax	# D.3718, tmp103
	imull	$5243, %eax, %eax	#, tmp103, tmp104
	shrl	$16, %eax	#, tmp105
	movl	%eax, %ecx	# tmp105, tmp106
	sarw	$3, %cx	#, tmp106
	movl	%edx, %eax	# D.3718, tmp107
	sarw	$15, %ax	#, tmp107
	subl	%eax, %ecx	# tmp107, tmp108
	movl	%ecx, %eax	# tmp108, tmp108
	movw	%ax, -2(%rbp)	# tmp108, min
	movzwl	-2(%rbp), %ecx	# min, tmp109
	movl	%ecx, %eax	# tmp109, tmp110
	sall	$2, %eax	#, tmp110
	addl	%ecx, %eax	# tmp109, tmp110
	leal	0(,%rax,4), %ecx	#, tmp111
	addl	%ecx, %eax	# tmp111, tmp110
	sall	$2, %eax	#, tmp112
	subl	%eax, %edx	# tmp110, tmp113
	movl	%edx, %eax	# tmp113, tmp113
	movw	%ax, -2(%rbp)	# tmp113, min
	.loc 2 145 0
	movswl	-4(%rbp), %eax	# deg, tmp114
	pxor	%xmm1, %xmm1	# D.3719
	cvtsi2ss	%eax, %xmm1	# tmp114, D.3719
	movswl	-2(%rbp), %eax	# min, tmp115
	pxor	%xmm0, %xmm0	# D.3719
	cvtsi2ss	%eax, %xmm0	# tmp115, D.3719
	movss	.LC3(%rip), %xmm2	#, tmp116
	mulss	%xmm2, %xmm0	# tmp116, D.3719
	addss	%xmm1, %xmm0	# D.3719, D.3719
	movss	.LC4(%rip), %xmm1	#, tmp117
	mulss	%xmm1, %xmm0	# tmp117, D.3719
	movss	%xmm0, magneticDeclination(%rip)	# D.3719, magneticDeclination
	.loc 2 150 0
	jmp	.L26	#
.L24:
	.loc 2 147 0
	pxor	%xmm0, %xmm0	# tmp118
	movss	%xmm0, magneticDeclination(%rip)	# tmp118, magneticDeclination
.L26:
	.loc 2 150 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	recalculateMagneticDeclination, .-recalculateMagneticDeclination
	.section	.bss.tCal.3586,"aw",@nobits
	.align 4
	.type	tCal.3586, @object
	.size	tCal.3586, 4
tCal.3586:
	.zero	4
	.section	.bss.magZeroTempMin.3587,"aw",@nobits
	.align 2
	.type	magZeroTempMin.3587, @object
	.size	magZeroTempMin.3587, 6
magZeroTempMin.3587:
	.zero	6
	.section	.bss.magZeroTempMax.3588,"aw",@nobits
	.align 2
	.type	magZeroTempMax.3588, @object
	.size	magZeroTempMax.3588, 6
magZeroTempMax.3588:
	.zero	6
	.section	.rodata
	.align 4
.LC3:
	.long	1015580809
	.align 4
.LC4:
	.long	1092616192
	.text
.Letext0:
	.file 3 "/usr/include/stdint.h"
	.file 4 "./src/main/config/parameter_group.h"
	.file 5 "./src/main/common/axis.h"
	.file 6 "./src/main/config/profile.h"
	.file 7 "./src/main/drivers/sensor.h"
	.file 8 "./src/main/drivers/drivers_compass.h"
	.file 9 "./src/main/sensors/boardalignment.h"
	.file 10 "./src/main/fc/runtime_config.h"
	.file 11 "./src/main/sensors/sensors.h"
	.file 12 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x839
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF123
	.byte	0xc
	.long	.LASF124
	.long	.LASF125
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
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0x5
	.byte	0x14
	.long	0xc1
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
	.long	.LASF14
	.byte	0x4
	.byte	0x15
	.long	0x6d
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0x4
	.byte	0x1d
	.long	0xfb
	.uleb128 0x8
	.long	.LASF15
	.value	0xfff
	.uleb128 0x8
	.long	.LASF16
	.value	0xf000
	.uleb128 0x8
	.long	.LASF17
	.value	0xfff
	.uleb128 0x9
	.long	.LASF18
	.byte	0
	.uleb128 0x8
	.long	.LASF19
	.value	0x8000
	.byte	0
	.uleb128 0x3
	.long	.LASF20
	.byte	0x4
	.byte	0x26
	.long	0x106
	.uleb128 0xa
	.long	0x116
	.uleb128 0xb
	.long	0x9f
	.uleb128 0xb
	.long	0x4d
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.byte	0x4
	.byte	0x2d
	.long	0x134
	.uleb128 0xd
	.string	"ptr"
	.byte	0x4
	.byte	0x2e
	.long	0x9f
	.uleb128 0xd
	.string	"fn"
	.byte	0x4
	.byte	0x2f
	.long	0x134
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0xfb
	.uleb128 0xf
	.long	.LASF25
	.byte	0x20
	.byte	0x4
	.byte	0x28
	.long	0x183
	.uleb128 0x10
	.string	"pgn"
	.byte	0x4
	.byte	0x29
	.long	0xc1
	.byte	0
	.uleb128 0x11
	.long	.LASF21
	.byte	0x4
	.byte	0x2a
	.long	0x6d
	.byte	0x2
	.uleb128 0x11
	.long	.LASF22
	.byte	0x4
	.byte	0x2b
	.long	0x183
	.byte	0x8
	.uleb128 0x10
	.string	"ptr"
	.byte	0x4
	.byte	0x2c
	.long	0x189
	.byte	0x10
	.uleb128 0x11
	.long	.LASF23
	.byte	0x4
	.byte	0x30
	.long	0x116
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x5b
	.uleb128 0xe
	.byte	0x8
	.long	0x183
	.uleb128 0x3
	.long	.LASF24
	.byte	0x4
	.byte	0x31
	.long	0x13a
	.uleb128 0xf
	.long	.LASF26
	.byte	0x1
	.byte	0x6
	.byte	0x16
	.long	0x1b3
	.uleb128 0x11
	.long	.LASF27
	.byte	0x6
	.byte	0x17
	.long	0x5b
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF28
	.byte	0x6
	.byte	0x18
	.long	0x19a
	.uleb128 0x3
	.long	.LASF29
	.byte	0x7
	.byte	0x14
	.long	0x1c9
	.uleb128 0xe
	.byte	0x8
	.long	0x1cf
	.uleb128 0x12
	.long	0x1d4
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF30
	.uleb128 0x3
	.long	.LASF31
	.byte	0x7
	.byte	0x15
	.long	0x1e6
	.uleb128 0xe
	.byte	0x8
	.long	0x1ec
	.uleb128 0x13
	.long	0x1d4
	.long	0x1fb
	.uleb128 0xb
	.long	0x1fb
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x30
	.uleb128 0xf
	.long	.LASF32
	.byte	0x10
	.byte	0x8
	.byte	0x15
	.long	0x226
	.uleb128 0x11
	.long	.LASF33
	.byte	0x8
	.byte	0x16
	.long	0x1be
	.byte	0
	.uleb128 0x11
	.long	.LASF34
	.byte	0x8
	.byte	0x17
	.long	0x1db
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF35
	.byte	0x8
	.byte	0x18
	.long	0x201
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF36
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF37
	.uleb128 0xf
	.long	.LASF38
	.byte	0x6
	.byte	0x9
	.byte	0x14
	.long	0x270
	.uleb128 0x11
	.long	.LASF39
	.byte	0x9
	.byte	0x15
	.long	0x30
	.byte	0
	.uleb128 0x11
	.long	.LASF40
	.byte	0x9
	.byte	0x16
	.long	0x30
	.byte	0x2
	.uleb128 0x11
	.long	.LASF41
	.byte	0x9
	.byte	0x17
	.long	0x30
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF42
	.byte	0x9
	.byte	0x18
	.long	0x23f
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0xa
	.byte	0x3e
	.long	0x2ac
	.uleb128 0x9
	.long	.LASF43
	.byte	0x1
	.uleb128 0x9
	.long	.LASF44
	.byte	0x2
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.uleb128 0x9
	.long	.LASF46
	.byte	0x8
	.uleb128 0x9
	.long	.LASF47
	.byte	0x10
	.uleb128 0x9
	.long	.LASF48
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0xb
	.byte	0x15
	.long	0x2d1
	.uleb128 0x9
	.long	.LASF49
	.byte	0
	.uleb128 0x9
	.long	.LASF50
	.byte	0x1
	.uleb128 0x9
	.long	.LASF51
	.byte	0x2
	.uleb128 0x9
	.long	.LASF52
	.byte	0x3
	.byte	0
	.uleb128 0xf
	.long	.LASF53
	.byte	0x6
	.byte	0xb
	.byte	0x20
	.long	0x302
	.uleb128 0x11
	.long	.LASF54
	.byte	0xb
	.byte	0x21
	.long	0x30
	.byte	0
	.uleb128 0x11
	.long	.LASF55
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
	.long	.LASF56
	.byte	0xb
	.byte	0x24
	.long	0x2d1
	.uleb128 0x14
	.long	.LASF126
	.byte	0x6
	.byte	0xb
	.byte	0x26
	.long	0x330
	.uleb128 0xd
	.string	"raw"
	.byte	0xb
	.byte	0x27
	.long	0x330
	.uleb128 0x15
	.long	.LASF57
	.byte	0xb
	.byte	0x28
	.long	0x302
	.byte	0
	.uleb128 0x16
	.long	0x30
	.long	0x340
	.uleb128 0x17
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF58
	.byte	0xb
	.byte	0x29
	.long	0x30d
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0xb
	.byte	0x2f
	.long	0x382
	.uleb128 0x9
	.long	.LASF59
	.byte	0x1
	.uleb128 0x9
	.long	.LASF60
	.byte	0x2
	.uleb128 0x9
	.long	.LASF61
	.byte	0x4
	.uleb128 0x9
	.long	.LASF62
	.byte	0x8
	.uleb128 0x9
	.long	.LASF63
	.byte	0x10
	.uleb128 0x9
	.long	.LASF64
	.byte	0x20
	.uleb128 0x9
	.long	.LASF65
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x8a
	.byte	0xb
	.byte	0x39
	.long	0x3c5
	.uleb128 0x9
	.long	.LASF66
	.byte	0
	.uleb128 0x9
	.long	.LASF67
	.byte	0x1
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2
	.uleb128 0x9
	.long	.LASF69
	.byte	0x3
	.uleb128 0x9
	.long	.LASF70
	.byte	0x4
	.uleb128 0x9
	.long	.LASF71
	.byte	0x5
	.uleb128 0x9
	.long	.LASF72
	.byte	0x6
	.uleb128 0x9
	.long	.LASF73
	.byte	0x7
	.uleb128 0x9
	.long	.LASF74
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF75
	.byte	0xb
	.byte	0x43
	.long	0x382
	.uleb128 0xf
	.long	.LASF76
	.byte	0xc
	.byte	0xb
	.byte	0x45
	.long	0x401
	.uleb128 0x11
	.long	.LASF77
	.byte	0xb
	.byte	0x46
	.long	0x3c5
	.byte	0
	.uleb128 0x11
	.long	.LASF78
	.byte	0xb
	.byte	0x47
	.long	0x3c5
	.byte	0x4
	.uleb128 0x11
	.long	.LASF79
	.byte	0xb
	.byte	0x48
	.long	0x3c5
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF80
	.byte	0xb
	.byte	0x49
	.long	0x3d0
	.uleb128 0xf
	.long	.LASF81
	.byte	0x3
	.byte	0xb
	.byte	0x4b
	.long	0x43d
	.uleb128 0x11
	.long	.LASF82
	.byte	0xb
	.byte	0x4c
	.long	0x5b
	.byte	0
	.uleb128 0x11
	.long	.LASF83
	.byte	0xb
	.byte	0x4d
	.long	0x5b
	.byte	0x1
	.uleb128 0x11
	.long	.LASF84
	.byte	0xb
	.byte	0x4e
	.long	0x5b
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF85
	.byte	0xb
	.byte	0x4f
	.long	0x40c
	.uleb128 0xf
	.long	.LASF86
	.byte	0xc
	.byte	0xb
	.byte	0x51
	.long	0x46d
	.uleb128 0x11
	.long	.LASF87
	.byte	0xb
	.byte	0x52
	.long	0x340
	.byte	0
	.uleb128 0x11
	.long	.LASF88
	.byte	0xb
	.byte	0x53
	.long	0x340
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF89
	.byte	0xb
	.byte	0x54
	.long	0x448
	.uleb128 0xf
	.long	.LASF90
	.byte	0x2
	.byte	0x1
	.byte	0x20
	.long	0x491
	.uleb128 0x11
	.long	.LASF91
	.byte	0x1
	.byte	0x21
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF92
	.byte	0x1
	.byte	0x23
	.long	0x478
	.uleb128 0x18
	.long	.LASF127
	.byte	0x1
	.byte	0x25
	.long	0x4b9
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.byte	0x8
	.long	0x491
	.uleb128 0x19
	.long	.LASF128
	.byte	0x2
	.byte	0x46
	.long	0x1d4
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x4ef
	.uleb128 0x1a
	.string	"ret"
	.byte	0x2
	.byte	0x4b
	.long	0x4ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1b
	.long	0x1d4
	.uleb128 0x1c
	.long	.LASF97
	.byte	0x2
	.byte	0x54
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x5eb
	.uleb128 0x1d
	.long	.LASF88
	.byte	0x2
	.byte	0x54
	.long	0x5eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.long	.LASF93
	.byte	0x2
	.byte	0x56
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	tCal.3586
	.uleb128 0x1e
	.long	.LASF94
	.byte	0x2
	.byte	0x57
	.long	0x340
	.uleb128 0x9
	.byte	0x3
	.quad	magZeroTempMin.3587
	.uleb128 0x1e
	.long	.LASF95
	.byte	0x2
	.byte	0x58
	.long	0x340
	.uleb128 0x9
	.byte	0x3
	.quad	magZeroTempMax.3588
	.uleb128 0x1f
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x582
	.uleb128 0x1e
	.long	.LASF96
	.byte	0x2
	.byte	0x5d
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1f
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x5a6
	.uleb128 0x1e
	.long	.LASF96
	.byte	0x2
	.byte	0x64
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1f
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x5ca
	.uleb128 0x1e
	.long	.LASF96
	.byte	0x2
	.byte	0x76
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x20
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1e
	.long	.LASF96
	.byte	0x2
	.byte	0x7e
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x340
	.uleb128 0x1c
	.long	.LASF98
	.byte	0x2
	.byte	0x88
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x62b
	.uleb128 0x1a
	.string	"deg"
	.byte	0x2
	.byte	0x8a
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.string	"min"
	.byte	0x2
	.byte	0x8a
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x16
	.long	0x491
	.long	0x63b
	.uleb128 0x17
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x1e
	.long	.LASF99
	.byte	0x2
	.byte	0x31
	.long	0x62b
	.uleb128 0x9
	.byte	0x3
	.quad	compassConfig_Storage
	.uleb128 0x1e
	.long	.LASF100
	.byte	0x2
	.byte	0x43
	.long	0x5b
	.uleb128 0x9
	.byte	0x3
	.quad	magInit
	.uleb128 0x21
	.long	.LASF101
	.byte	0xc
	.byte	0xc8
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x21
	.long	.LASF102
	.byte	0xc
	.byte	0xc9
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x21
	.long	.LASF103
	.byte	0xc
	.byte	0xca
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x21
	.long	.LASF104
	.byte	0x4
	.byte	0x43
	.long	0x6b9
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xe
	.byte	0x8
	.long	0x18f
	.uleb128 0x21
	.long	.LASF105
	.byte	0x4
	.byte	0x44
	.long	0x6b9
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x21
	.long	.LASF106
	.byte	0x4
	.byte	0x47
	.long	0x183
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x21
	.long	.LASF107
	.byte	0x4
	.byte	0x48
	.long	0x183
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x21
	.long	.LASF108
	.byte	0x6
	.byte	0x1a
	.long	0x1b3
	.uleb128 0x9
	.byte	0x3
	.quad	profileSelection_System
	.uleb128 0x21
	.long	.LASF109
	.byte	0x9
	.byte	0x1a
	.long	0x270
	.uleb128 0x9
	.byte	0x3
	.quad	boardAlignment_System
	.uleb128 0x22
	.long	.LASF110
	.byte	0xa
	.byte	0x4b
	.long	0x5b
	.uleb128 0x21
	.long	.LASF111
	.byte	0xb
	.byte	0x56
	.long	0x43d
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x21
	.long	.LASF112
	.byte	0xb
	.byte	0x57
	.long	0x401
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x21
	.long	.LASF113
	.byte	0xb
	.byte	0x58
	.long	0x46d
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0x21
	.long	.LASF114
	.byte	0x2
	.byte	0x31
	.long	0x4b9
	.uleb128 0x9
	.byte	0x3
	.quad	compassConfig_ProfileCurrent
	.uleb128 0x16
	.long	0x42
	.long	0x797
	.uleb128 0x17
	.long	0x98
	.byte	0x2
	.byte	0
	.uleb128 0x21
	.long	.LASF115
	.byte	0x2
	.byte	0x3e
	.long	0x787
	.uleb128 0x9
	.byte	0x3
	.quad	magADC
	.uleb128 0x21
	.long	.LASF116
	.byte	0x2
	.byte	0x3f
	.long	0x3c5
	.uleb128 0x9
	.byte	0x3
	.quad	magAlign
	.uleb128 0x23
	.string	"mag"
	.byte	0x2
	.byte	0x37
	.long	0x226
	.uleb128 0x21
	.long	.LASF117
	.byte	0x2
	.byte	0x39
	.long	0x7e1
	.uleb128 0x9
	.byte	0x3
	.quad	magneticDeclination
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF118
	.uleb128 0x21
	.long	.LASF119
	.byte	0x2
	.byte	0x33
	.long	0x7fd
	.uleb128 0x9
	.byte	0x3
	.quad	pgResetTemplate_compassConfig
	.uleb128 0x1b
	.long	0x491
	.uleb128 0x21
	.long	.LASF120
	.byte	0x2
	.byte	0x31
	.long	0x817
	.uleb128 0x9
	.byte	0x3
	.quad	compassConfig_Registry
	.uleb128 0x1b
	.long	0x18f
	.uleb128 0x22
	.long	.LASF121
	.byte	0x2
	.byte	0x3b
	.long	0x7f
	.uleb128 0x21
	.long	.LASF122
	.byte	0x2
	.byte	0x3d
	.long	0x330
	.uleb128 0x9
	.byte	0x3
	.quad	magADCRaw
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
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x15
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x3c
	.uleb128 0x19
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
	.long	0x5c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB15
	.quad	.LFE15
	.quad	.LFB16
	.quad	.LFE16
	.quad	.LFB17
	.quad	.LFE17
	.quad	.LFB18
	.quad	.LFE18
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF94:
	.string	"magZeroTempMin"
.LASF45:
	.string	"CALIBRATE_MAG"
.LASF105:
	.string	"__pg_registry_end"
.LASF44:
	.string	"GPS_FIX"
.LASF19:
	.string	"PGR_SIZE_PROFILE_FLAG"
.LASF107:
	.string	"__pg_resetdata_end"
.LASF115:
	.string	"magADC"
.LASF18:
	.string	"PGR_SIZE_SYSTEM_FLAG"
.LASF83:
	.string	"mag_hardware"
.LASF10:
	.string	"unsigned int"
.LASF110:
	.string	"stateFlags"
.LASF99:
	.string	"compassConfig_Storage"
.LASF55:
	.string	"pitch"
.LASF120:
	.string	"compassConfig_Registry"
.LASF16:
	.string	"PGR_PGN_VERSION_MASK"
.LASF126:
	.string	"flightDynamicsTrims_u"
.LASF32:
	.string	"mag_s"
.LASF35:
	.string	"mag_t"
.LASF17:
	.string	"PGR_SIZE_MASK"
.LASF86:
	.string	"sensorTrims_s"
.LASF89:
	.string	"sensorTrims_t"
.LASF77:
	.string	"gyro_align"
.LASF101:
	.string	"U_ID_0"
.LASF65:
	.string	"SENSOR_GPSMAG"
.LASF103:
	.string	"U_ID_2"
.LASF124:
	.string	"src/main/sensors/compass.c"
.LASF9:
	.string	"uint32_t"
.LASF114:
	.string	"compassConfig_ProfileCurrent"
.LASF111:
	.string	"sensorSelectionConfig_System"
.LASF67:
	.string	"CW0_DEG"
.LASF15:
	.string	"PGR_PGN_MASK"
.LASF2:
	.string	"int16_t"
.LASF113:
	.string	"sensorTrims_System"
.LASF52:
	.string	"SENSOR_INDEX_MAG"
.LASF36:
	.string	"long long unsigned int"
.LASF122:
	.string	"magADCRaw"
.LASF74:
	.string	"CW270_DEG_FLIP"
.LASF128:
	.string	"compassInit"
.LASF39:
	.string	"rollDegrees"
.LASF14:
	.string	"pgn_t"
.LASF38:
	.string	"boardAlignment_s"
.LASF42:
	.string	"boardAlignment_t"
.LASF62:
	.string	"SENSOR_MAG"
.LASF30:
	.string	"_Bool"
.LASF61:
	.string	"SENSOR_BARO"
.LASF25:
	.string	"pgRegistry_s"
.LASF24:
	.string	"pgRegistry_t"
.LASF106:
	.string	"__pg_resetdata_start"
.LASF127:
	.string	"compassConfig"
.LASF51:
	.string	"SENSOR_INDEX_BARO"
.LASF97:
	.string	"updateCompass"
.LASF121:
	.string	"currentTime"
.LASF84:
	.string	"baro_hardware"
.LASF72:
	.string	"CW90_DEG_FLIP"
.LASF13:
	.string	"char"
.LASF93:
	.string	"tCal"
.LASF27:
	.string	"current_profile_index"
.LASF71:
	.string	"CW0_DEG_FLIP"
.LASF54:
	.string	"roll"
.LASF46:
	.string	"SMALL_ANGLE"
.LASF5:
	.string	"uint8_t"
.LASF104:
	.string	"__pg_registry_start"
.LASF95:
	.string	"magZeroTempMax"
.LASF37:
	.string	"long long int"
.LASF56:
	.string	"flightDynamicsTrims_def_t"
.LASF43:
	.string	"GPS_FIX_HOME"
.LASF82:
	.string	"acc_hardware"
.LASF79:
	.string	"mag_align"
.LASF81:
	.string	"sensorSelectionConfig_s"
.LASF85:
	.string	"sensorSelectionConfig_t"
.LASF21:
	.string	"size"
.LASF68:
	.string	"CW90_DEG"
.LASF125:
	.string	"/home/aravind/git/cleanflight"
.LASF78:
	.string	"acc_align"
.LASF57:
	.string	"values"
.LASF87:
	.string	"accZero"
.LASF98:
	.string	"recalculateMagneticDeclination"
.LASF58:
	.string	"flightDynamicsTrims_t"
.LASF50:
	.string	"SENSOR_INDEX_ACC"
.LASF63:
	.string	"SENSOR_SONAR"
.LASF48:
	.string	"ANTI_WINDUP"
.LASF7:
	.string	"uint16_t"
.LASF91:
	.string	"mag_declination"
.LASF116:
	.string	"magAlign"
.LASF123:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF29:
	.string	"sensorInitFuncPtr"
.LASF47:
	.string	"FIXED_WING"
.LASF1:
	.string	"short int"
.LASF88:
	.string	"magZero"
.LASF4:
	.string	"long int"
.LASF41:
	.string	"yawDegrees"
.LASF112:
	.string	"sensorAlignmentConfig_System"
.LASF60:
	.string	"SENSOR_ACC"
.LASF70:
	.string	"CW270_DEG"
.LASF40:
	.string	"pitchDegrees"
.LASF23:
	.string	"reset"
.LASF59:
	.string	"SENSOR_GYRO"
.LASF75:
	.string	"sensor_align_e"
.LASF34:
	.string	"read"
.LASF49:
	.string	"SENSOR_INDEX_GYRO"
.LASF96:
	.string	"axis"
.LASF33:
	.string	"init"
.LASF12:
	.string	"sizetype"
.LASF11:
	.string	"long unsigned int"
.LASF22:
	.string	"address"
.LASF69:
	.string	"CW180_DEG"
.LASF108:
	.string	"profileSelection_System"
.LASF118:
	.string	"float"
.LASF3:
	.string	"int32_t"
.LASF53:
	.string	"int16_flightDynamicsTrims_s"
.LASF73:
	.string	"CW180_DEG_FLIP"
.LASF6:
	.string	"unsigned char"
.LASF100:
	.string	"magInit"
.LASF102:
	.string	"U_ID_1"
.LASF90:
	.string	"compassConfig_s"
.LASF92:
	.string	"compassConfig_t"
.LASF0:
	.string	"signed char"
.LASF8:
	.string	"short unsigned int"
.LASF31:
	.string	"sensorReadFuncPtr"
.LASF26:
	.string	"profileSelection_s"
.LASF28:
	.string	"profileSelection_t"
.LASF64:
	.string	"SENSOR_GPS"
.LASF76:
	.string	"sensorAlignmentConfig_s"
.LASF80:
	.string	"sensorAlignmentConfig_t"
.LASF66:
	.string	"ALIGN_DEFAULT"
.LASF109:
	.string	"boardAlignment_System"
.LASF117:
	.string	"magneticDeclination"
.LASF20:
	.string	"pgResetFunc"
.LASF119:
	.string	"pgResetTemplate_compassConfig"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
