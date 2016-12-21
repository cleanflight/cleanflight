	.file	"SFE_LSM9DS0.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed SFE_LSM9DS0.i -mtune=generic
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
	.section	.text.imu_setup,"ax",@progbits
	.globl	imu_setup
	.type	imu_setup, @function
imu_setup:
.LFB2:
	.file 1 "src/main/drivers/SFE_LSM9DS0.c"
	.loc 1 36 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# imu, imu
	movl	%esi, %ecx	# gAddr, tmp93
	movl	%edx, %eax	# xmAddr, tmp94
	movb	%cl, -12(%rbp)	# tmp93, gAddr
	movb	%al, -16(%rbp)	# tmp94, xmAddr
	.loc 1 37 0
	movq	-8(%rbp), %rax	# imu, tmp95
	movw	$0, (%rax)	#, imu_2(D)->gx
	.loc 1 38 0
	movq	-8(%rbp), %rax	# imu, tmp96
	movw	$0, 2(%rax)	#, imu_2(D)->gy
	.loc 1 39 0
	movq	-8(%rbp), %rax	# imu, tmp97
	movw	$0, 4(%rax)	#, imu_2(D)->gz
	.loc 1 41 0
	movq	-8(%rbp), %rax	# imu, tmp98
	movw	$0, 6(%rax)	#, imu_2(D)->ax
	.loc 1 42 0
	movq	-8(%rbp), %rax	# imu, tmp99
	movw	$0, 8(%rax)	#, imu_2(D)->ay
	.loc 1 43 0
	movq	-8(%rbp), %rax	# imu, tmp100
	movw	$0, 10(%rax)	#, imu_2(D)->az
	.loc 1 45 0
	movq	-8(%rbp), %rax	# imu, tmp101
	movw	$0, 12(%rax)	#, imu_2(D)->mx
	.loc 1 46 0
	movq	-8(%rbp), %rax	# imu, tmp102
	movw	$0, 14(%rax)	#, imu_2(D)->my
	.loc 1 47 0
	movq	-8(%rbp), %rax	# imu, tmp103
	movw	$0, 16(%rax)	#, imu_2(D)->mz
	.loc 1 49 0
	movq	-8(%rbp), %rax	# imu, tmp104
	movw	$0, 18(%rax)	#, imu_2(D)->temperature
	.loc 1 51 0
	movq	-8(%rbp), %rax	# imu, tmp105
	movl	$0, 40(%rax)	#, imu_2(D)->gScale
	.loc 1 52 0
	movq	-8(%rbp), %rax	# imu, tmp106
	movl	$1, 44(%rax)	#, imu_2(D)->aScale
	.loc 1 53 0
	movq	-8(%rbp), %rax	# imu, tmp107
	movl	$0, 48(%rax)	#, imu_2(D)->mScale
	.loc 1 55 0
	movq	-8(%rbp), %rax	# imu, tmp108
	pxor	%xmm0, %xmm0	# tmp109
	movss	%xmm0, 52(%rax)	# tmp109, imu_2(D)->gRes
	.loc 1 56 0
	movq	-8(%rbp), %rax	# imu, tmp110
	pxor	%xmm0, %xmm0	# tmp111
	movss	%xmm0, 56(%rax)	# tmp111, imu_2(D)->aRes
	.loc 1 57 0
	movq	-8(%rbp), %rax	# imu, tmp112
	pxor	%xmm0, %xmm0	# tmp113
	movss	%xmm0, 60(%rax)	# tmp113, imu_2(D)->mRes
	.loc 1 61 0
	movl	$1, %edi	#,
	call	mraa_i2c_init	#
	movq	%rax, %rdx	#, D.5075
	movq	-8(%rbp), %rax	# imu, tmp114
	movq	%rdx, 24(%rax)	# D.5075, imu_2(D)->gyro
	.loc 1 62 0
	movzbl	-12(%rbp), %edx	# gAddr, D.5076
	movq	-8(%rbp), %rax	# imu, tmp115
	movq	24(%rax), %rax	# imu_2(D)->gyro, D.5075
	movl	%edx, %esi	# D.5076,
	movq	%rax, %rdi	# D.5075,
	call	mraa_i2c_address	#
	.loc 1 63 0
	movl	$1, %edi	#,
	call	mraa_i2c_init	#
	movq	%rax, %rdx	#, D.5075
	movq	-8(%rbp), %rax	# imu, tmp116
	movq	%rdx, 32(%rax)	# D.5075, imu_2(D)->xm
	.loc 1 64 0
	movzbl	-16(%rbp), %edx	# xmAddr, D.5076
	movq	-8(%rbp), %rax	# imu, tmp117
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5075
	movl	%edx, %esi	# D.5076,
	movq	%rax, %rdi	# D.5075,
	call	mraa_i2c_address	#
	.loc 1 65 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	imu_setup, .-imu_setup
	.section	.text.begin,"ax",@progbits
	.globl	begin
	.type	begin, @function
begin:
.LFB3:
	.loc 1 69 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	movl	%esi, -28(%rbp)	# gScl, gScl
	movl	%edx, -32(%rbp)	# aScl, aScl
	movl	%ecx, -36(%rbp)	# mScl, mScl
	movl	%r8d, -40(%rbp)	# gODR, gODR
	movl	%r9d, -44(%rbp)	# aODR, aODR
	.loc 1 72 0
	movq	-24(%rbp), %rax	# imu, tmp105
	movl	-28(%rbp), %edx	# gScl, tmp106
	movl	%edx, 40(%rax)	# tmp106, imu_2(D)->gScale
	.loc 1 73 0
	movq	-24(%rbp), %rax	# imu, tmp107
	movl	-32(%rbp), %edx	# aScl, tmp108
	movl	%edx, 44(%rax)	# tmp108, imu_2(D)->aScale
	.loc 1 74 0
	movq	-24(%rbp), %rax	# imu, tmp109
	movl	-36(%rbp), %edx	# mScl, tmp110
	movl	%edx, 48(%rax)	# tmp110, imu_2(D)->mScale
	.loc 1 78 0
	movq	-24(%rbp), %rax	# imu, tmp111
	movq	%rax, %rdi	# tmp111,
	movl	$0, %eax	#,
	call	calcgRes	#
	.loc 1 79 0
	movq	-24(%rbp), %rax	# imu, tmp112
	movq	%rax, %rdi	# tmp112,
	movl	$0, %eax	#,
	call	calcaRes	#
	.loc 1 80 0
	movq	-24(%rbp), %rax	# imu, tmp113
	movq	%rax, %rdi	# tmp113,
	movl	$0, %eax	#,
	call	calcmRes	#
	.loc 1 84 0
	movq	-24(%rbp), %rax	# imu, tmp114
	movq	24(%rax), %rax	# imu_2(D)->gyro, D.5077
	movl	$15, %esi	#,
	movq	%rax, %rdi	# D.5077,
	call	gReadByte	#
	movb	%al, -2(%rbp)	# tmp115, gTest
	.loc 1 85 0
	movq	-24(%rbp), %rax	# imu, tmp116
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5077
	movl	$15, %esi	#,
	movq	%rax, %rdi	# D.5077,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp117, xmTest
	.loc 1 88 0
	movq	-24(%rbp), %rax	# imu, tmp118
	movq	24(%rax), %rax	# imu_2(D)->gyro, D.5077
	movq	%rax, %rdi	# D.5077,
	call	initGyro	#
	.loc 1 89 0
	movq	-24(%rbp), %rax	# imu, tmp119
	movq	24(%rax), %rax	# imu_2(D)->gyro, D.5077
	movl	-40(%rbp), %edx	# gODR, tmp120
	movl	%edx, %esi	# tmp120,
	movq	%rax, %rdi	# D.5077,
	call	setGyroODR	#
	.loc 1 90 0
	movq	-24(%rbp), %rax	# imu, tmp121
	movl	40(%rax), %edx	# imu_2(D)->gScale, D.5078
	movq	-24(%rbp), %rax	# imu, tmp122
	movl	%edx, %esi	# D.5078,
	movq	%rax, %rdi	# tmp122,
	call	setGyroScale	#
	.loc 1 93 0
	movq	-24(%rbp), %rax	# imu, tmp123
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5077
	movq	%rax, %rdi	# D.5077,
	call	initAccel	#
	.loc 1 94 0
	movq	-24(%rbp), %rax	# imu, tmp124
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5077
	movl	-44(%rbp), %edx	# aODR, tmp125
	movl	%edx, %esi	# tmp125,
	movq	%rax, %rdi	# D.5077,
	call	setAccelODR	#
	.loc 1 95 0
	movq	-24(%rbp), %rax	# imu, tmp126
	movl	44(%rax), %edx	# imu_2(D)->aScale, D.5079
	movq	-24(%rbp), %rax	# imu, tmp127
	movl	%edx, %esi	# D.5079,
	movq	%rax, %rdi	# tmp127,
	call	setAccelScale	#
	.loc 1 98 0
	movq	-24(%rbp), %rax	# imu, tmp128
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5077
	movq	%rax, %rdi	# D.5077,
	call	initMag	#
	.loc 1 99 0
	movq	-24(%rbp), %rax	# imu, tmp129
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5077
	movl	16(%rbp), %esi	# mODR,
	movq	%rax, %rdi	# D.5077,
	call	setMagODR	#
	.loc 1 100 0
	movq	-24(%rbp), %rax	# imu, tmp130
	movl	48(%rax), %edx	# imu_2(D)->mScale, D.5080
	movq	-24(%rbp), %rax	# imu, tmp131
	movl	%edx, %esi	# D.5080,
	movq	%rax, %rdi	# tmp131,
	call	setMagScale	#
	.loc 1 103 0
	movzbl	-1(%rbp), %eax	# xmTest, D.5081
	sall	$8, %eax	#, D.5081
	movl	%eax, %edx	# D.5081, D.5082
	movzbl	-2(%rbp), %eax	# gTest, D.5082
	orl	%edx, %eax	# D.5082, D.5082
	.loc 1 104 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	begin, .-begin
	.section	.text.initGyro,"ax",@progbits
	.globl	initGyro
	.type	initGyro, @function
initGyro:
.LFB4:
	.loc 1 107 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# gyro, gyro
	.loc 1 116 0
	movq	-8(%rbp), %rax	# gyro, tmp87
	movl	$15, %edx	#,
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp87,
	call	gWriteByte	#
	.loc 1 126 0
	movq	-8(%rbp), %rax	# gyro, tmp88
	movl	$0, %edx	#,
	movl	$33, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	gWriteByte	#
	.loc 1 139 0
	movq	-8(%rbp), %rax	# gyro, tmp89
	movl	$136, %edx	#,
	movl	$34, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	gWriteByte	#
	.loc 1 151 0
	movq	-8(%rbp), %rax	# gyro, tmp90
	movl	$0, %edx	#,
	movl	$35, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	gWriteByte	#
	.loc 1 160 0
	movq	-8(%rbp), %rax	# gyro, tmp91
	movl	$0, %edx	#,
	movl	$36, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	gWriteByte	#
	.loc 1 162 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	initGyro, .-initGyro
	.section	.text.initAccel,"ax",@progbits
	.globl	initAccel
	.type	initAccel, @function
initAccel:
.LFB5:
	.loc 1 165 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# xm, xm
	.loc 1 174 0
	movq	-8(%rbp), %rax	# xm, tmp87
	movl	$0, %edx	#,
	movl	$31, %esi	#,
	movq	%rax, %rdi	# tmp87,
	call	xmWriteByte	#
	.loc 1 187 0
	movq	-8(%rbp), %rax	# xm, tmp88
	movl	$87, %edx	#,
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	xmWriteByte	#
	.loc 1 200 0
	movq	-8(%rbp), %rax	# xm, tmp89
	movl	$0, %edx	#,
	movl	$33, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	xmWriteByte	#
	.loc 1 206 0
	movq	-8(%rbp), %rax	# xm, tmp90
	movl	$4, %edx	#,
	movl	$34, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmWriteByte	#
	.loc 1 207 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	initAccel, .-initAccel
	.section	.text.initMag,"ax",@progbits
	.globl	initMag
	.type	initMag, @function
initMag:
.LFB6:
	.loc 1 210 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# xm, xm
	.loc 1 221 0
	movq	-8(%rbp), %rax	# xm, tmp87
	movl	$148, %edx	#,
	movl	$36, %esi	#,
	movq	%rax, %rdi	# tmp87,
	call	xmWriteByte	#
	.loc 1 227 0
	movq	-8(%rbp), %rax	# xm, tmp88
	movl	$0, %edx	#,
	movl	$37, %esi	#,
	movq	%rax, %rdi	# tmp88,
	call	xmWriteByte	#
	.loc 1 241 0
	movq	-8(%rbp), %rax	# xm, tmp89
	movl	$0, %edx	#,
	movl	$38, %esi	#,
	movq	%rax, %rdi	# tmp89,
	call	xmWriteByte	#
	.loc 1 246 0
	movq	-8(%rbp), %rax	# xm, tmp90
	movl	$4, %edx	#,
	movl	$35, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmWriteByte	#
	.loc 1 259 0
	movq	-8(%rbp), %rax	# xm, tmp91
	movl	$9, %edx	#,
	movl	$18, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	xmWriteByte	#
	.loc 1 260 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	initMag, .-initMag
	.section	.text.readGyro,"ax",@progbits
	.globl	readGyro
	.type	readGyro, @function
readGyro:
.LFB7:
	.loc 1 263 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	.loc 1 263 0
	movq	%fs:40, %rax	#, tmp114
	movq	%rax, -8(%rbp)	# tmp114, D.5088
	xorl	%eax, %eax	# tmp114
	.loc 1 265 0
	movq	-24(%rbp), %rax	# imu, tmp109
	movq	24(%rax), %rax	# imu_2(D)->gyro, D.5084
	leaq	-16(%rbp), %rdx	#, tmp110
	movl	$6, %ecx	#,
	movl	$40, %esi	#,
	movq	%rax, %rdi	# D.5084,
	call	gReadBytes	#
	.loc 1 266 0
	movzbl	-15(%rbp), %eax	# temp, D.5085
	movzbl	%al, %eax	# D.5085, D.5086
	sall	$8, %eax	#, D.5086
	movl	%eax, %edx	# D.5086, D.5087
	movzbl	-16(%rbp), %eax	# temp, D.5085
	movzbl	%al, %eax	# D.5085, D.5087
	orl	%eax, %edx	# D.5087, D.5087
	movq	-24(%rbp), %rax	# imu, tmp111
	movw	%dx, (%rax)	# D.5087, imu_2(D)->gx
	.loc 1 267 0
	movzbl	-13(%rbp), %eax	# temp, D.5085
	movzbl	%al, %eax	# D.5085, D.5086
	sall	$8, %eax	#, D.5086
	movl	%eax, %edx	# D.5086, D.5087
	movzbl	-14(%rbp), %eax	# temp, D.5085
	movzbl	%al, %eax	# D.5085, D.5087
	orl	%eax, %edx	# D.5087, D.5087
	movq	-24(%rbp), %rax	# imu, tmp112
	movw	%dx, 2(%rax)	# D.5087, imu_2(D)->gy
	.loc 1 268 0
	movzbl	-11(%rbp), %eax	# temp, D.5085
	movzbl	%al, %eax	# D.5085, D.5086
	sall	$8, %eax	#, D.5086
	movl	%eax, %edx	# D.5086, D.5087
	movzbl	-12(%rbp), %eax	# temp, D.5085
	movzbl	%al, %eax	# D.5085, D.5087
	orl	%eax, %edx	# D.5087, D.5087
	movq	-24(%rbp), %rax	# imu, tmp113
	movw	%dx, 4(%rax)	# D.5087, imu_2(D)->gz
	.loc 1 269 0
	nop
	movq	-8(%rbp), %rax	# D.5088, tmp115
	xorq	%fs:40, %rax	#, tmp115
	je	.L8	#,
	call	__stack_chk_fail	#
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	readGyro, .-readGyro
	.section	.text.readAccel,"ax",@progbits
	.globl	readAccel
	.type	readAccel, @function
readAccel:
.LFB8:
	.loc 1 272 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	.loc 1 272 0
	movq	%fs:40, %rax	#, tmp114
	movq	%rax, -8(%rbp)	# tmp114, D.5095
	xorl	%eax, %eax	# tmp114
	.loc 1 274 0
	movq	-24(%rbp), %rax	# imu, tmp109
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5091
	leaq	-16(%rbp), %rdx	#, tmp110
	movl	$6, %ecx	#,
	movl	$40, %esi	#,
	movq	%rax, %rdi	# D.5091,
	call	xmReadBytes	#
	.loc 1 275 0
	movzbl	-15(%rbp), %eax	# temp, D.5092
	movzbl	%al, %eax	# D.5092, D.5093
	sall	$8, %eax	#, D.5093
	movl	%eax, %edx	# D.5093, D.5094
	movzbl	-16(%rbp), %eax	# temp, D.5092
	movzbl	%al, %eax	# D.5092, D.5094
	orl	%eax, %edx	# D.5094, D.5094
	movq	-24(%rbp), %rax	# imu, tmp111
	movw	%dx, 6(%rax)	# D.5094, imu_2(D)->ax
	.loc 1 276 0
	movzbl	-13(%rbp), %eax	# temp, D.5092
	movzbl	%al, %eax	# D.5092, D.5093
	sall	$8, %eax	#, D.5093
	movl	%eax, %edx	# D.5093, D.5094
	movzbl	-14(%rbp), %eax	# temp, D.5092
	movzbl	%al, %eax	# D.5092, D.5094
	orl	%eax, %edx	# D.5094, D.5094
	movq	-24(%rbp), %rax	# imu, tmp112
	movw	%dx, 8(%rax)	# D.5094, imu_2(D)->ay
	.loc 1 277 0
	movzbl	-11(%rbp), %eax	# temp, D.5092
	movzbl	%al, %eax	# D.5092, D.5093
	sall	$8, %eax	#, D.5093
	movl	%eax, %edx	# D.5093, D.5094
	movzbl	-12(%rbp), %eax	# temp, D.5092
	movzbl	%al, %eax	# D.5092, D.5094
	orl	%eax, %edx	# D.5094, D.5094
	movq	-24(%rbp), %rax	# imu, tmp113
	movw	%dx, 10(%rax)	# D.5094, imu_2(D)->az
	.loc 1 278 0
	nop
	movq	-8(%rbp), %rax	# D.5095, tmp115
	xorq	%fs:40, %rax	#, tmp115
	je	.L10	#,
	call	__stack_chk_fail	#
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	readAccel, .-readAccel
	.section	.text.readMag,"ax",@progbits
	.globl	readMag
	.type	readMag, @function
readMag:
.LFB9:
	.loc 1 281 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	.loc 1 281 0
	movq	%fs:40, %rax	#, tmp114
	movq	%rax, -8(%rbp)	# tmp114, D.5100
	xorl	%eax, %eax	# tmp114
	.loc 1 283 0
	movq	-24(%rbp), %rax	# imu, tmp109
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5096
	leaq	-16(%rbp), %rdx	#, tmp110
	movl	$6, %ecx	#,
	movl	$8, %esi	#,
	movq	%rax, %rdi	# D.5096,
	call	xmReadBytes	#
	.loc 1 284 0
	movzbl	-15(%rbp), %eax	# temp, D.5097
	movzbl	%al, %eax	# D.5097, D.5098
	sall	$8, %eax	#, D.5098
	movl	%eax, %edx	# D.5098, D.5099
	movzbl	-16(%rbp), %eax	# temp, D.5097
	movzbl	%al, %eax	# D.5097, D.5099
	orl	%eax, %edx	# D.5099, D.5099
	movq	-24(%rbp), %rax	# imu, tmp111
	movw	%dx, 12(%rax)	# D.5099, imu_2(D)->mx
	.loc 1 285 0
	movzbl	-13(%rbp), %eax	# temp, D.5097
	movzbl	%al, %eax	# D.5097, D.5098
	sall	$8, %eax	#, D.5098
	movl	%eax, %edx	# D.5098, D.5099
	movzbl	-14(%rbp), %eax	# temp, D.5097
	movzbl	%al, %eax	# D.5097, D.5099
	orl	%eax, %edx	# D.5099, D.5099
	movq	-24(%rbp), %rax	# imu, tmp112
	movw	%dx, 14(%rax)	# D.5099, imu_2(D)->my
	.loc 1 286 0
	movzbl	-11(%rbp), %eax	# temp, D.5097
	movzbl	%al, %eax	# D.5097, D.5098
	sall	$8, %eax	#, D.5098
	movl	%eax, %edx	# D.5098, D.5099
	movzbl	-12(%rbp), %eax	# temp, D.5097
	movzbl	%al, %eax	# D.5097, D.5099
	orl	%eax, %edx	# D.5099, D.5099
	movq	-24(%rbp), %rax	# imu, tmp113
	movw	%dx, 16(%rax)	# D.5099, imu_2(D)->mz
	.loc 1 287 0
	nop
	movq	-8(%rbp), %rax	# D.5100, tmp115
	xorq	%fs:40, %rax	#, tmp115
	je	.L12	#,
	call	__stack_chk_fail	#
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	readMag, .-readMag
	.section	.text.readTemp,"ax",@progbits
	.globl	readTemp
	.type	readTemp, @function
readTemp:
.LFB10:
	.loc 1 290 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	.loc 1 290 0
	movq	%fs:40, %rax	#, tmp98
	movq	%rax, -8(%rbp)	# tmp98, D.5105
	xorl	%eax, %eax	# tmp98
	.loc 1 292 0
	movq	-24(%rbp), %rax	# imu, tmp95
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5101
	leaq	-16(%rbp), %rdx	#, tmp96
	movl	$2, %ecx	#,
	movl	$5, %esi	#,
	movq	%rax, %rdi	# D.5101,
	call	xmReadBytes	#
	.loc 1 293 0
	movzbl	-16(%rbp), %eax	# temp, D.5102
	movzbl	%al, %eax	# D.5102, D.5103
	movzbl	-15(%rbp), %edx	# temp, D.5102
	movzbl	%dl, %edx	# D.5102, D.5103
	sall	$8, %edx	#, D.5103
	addl	%edx, %eax	# D.5103, D.5103
	movl	%eax, %edx	# D.5103, D.5104
	movq	-24(%rbp), %rax	# imu, tmp97
	movw	%dx, 18(%rax)	# D.5104, imu_2(D)->temperature
	.loc 1 294 0
	nop
	movq	-8(%rbp), %rax	# D.5105, tmp99
	xorq	%fs:40, %rax	#, tmp99
	je	.L14	#,
	call	__stack_chk_fail	#
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	readTemp, .-readTemp
	.section	.text.calcGyro,"ax",@progbits
	.globl	calcGyro
	.type	calcGyro, @function
calcGyro:
.LFB11:
	.loc 1 297 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# imu, imu
	movl	%esi, %eax	# gyro, tmp91
	movw	%ax, -12(%rbp)	# tmp91, gyro
	.loc 1 299 0
	movq	-8(%rbp), %rax	# imu, tmp92
	movss	52(%rax), %xmm1	# imu_2(D)->gRes, D.5106
	movswl	-12(%rbp), %eax	# gyro, tmp93
	pxor	%xmm0, %xmm0	# D.5106
	cvtsi2ss	%eax, %xmm0	# tmp93, D.5106
	mulss	%xmm1, %xmm0	# D.5106, D.5106
	.loc 1 300 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	calcGyro, .-calcGyro
	.section	.text.calcAccel,"ax",@progbits
	.globl	calcAccel
	.type	calcAccel, @function
calcAccel:
.LFB12:
	.loc 1 303 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# imu, imu
	movl	%esi, %eax	# accel, tmp91
	movw	%ax, -12(%rbp)	# tmp91, accel
	.loc 1 305 0
	movq	-8(%rbp), %rax	# imu, tmp92
	movss	56(%rax), %xmm1	# imu_2(D)->aRes, D.5107
	movswl	-12(%rbp), %eax	# accel, tmp93
	pxor	%xmm0, %xmm0	# D.5107
	cvtsi2ss	%eax, %xmm0	# tmp93, D.5107
	mulss	%xmm1, %xmm0	# D.5107, D.5107
	.loc 1 306 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	calcAccel, .-calcAccel
	.section	.text.calcMag,"ax",@progbits
	.globl	calcMag
	.type	calcMag, @function
calcMag:
.LFB13:
	.loc 1 309 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# imu, imu
	movl	%esi, %eax	# mag, tmp91
	movw	%ax, -12(%rbp)	# tmp91, mag
	.loc 1 311 0
	movq	-8(%rbp), %rax	# imu, tmp92
	movss	60(%rax), %xmm1	# imu_2(D)->mRes, D.5108
	movswl	-12(%rbp), %eax	# mag, tmp93
	pxor	%xmm0, %xmm0	# D.5108
	cvtsi2ss	%eax, %xmm0	# tmp93, D.5108
	mulss	%xmm1, %xmm0	# D.5108, D.5108
	.loc 1 312 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	calcMag, .-calcMag
	.section	.text.setGyroScale,"ax",@progbits
	.globl	setGyroScale
	.type	setGyroScale, @function
setGyroScale:
.LFB14:
	.loc 1 315 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	movl	%esi, -28(%rbp)	# gScl, gScl
	.loc 1 317 0
	movq	-24(%rbp), %rax	# imu, tmp92
	movq	24(%rax), %rax	# imu_2(D)->gyro, D.5109
	movl	$35, %esi	#,
	movq	%rax, %rdi	# D.5109,
	call	gReadByte	#
	movb	%al, -1(%rbp)	# tmp93, temp
	.loc 1 319 0
	andb	$-49, -1(%rbp)	#, temp
	.loc 1 321 0
	movl	-28(%rbp), %eax	# gScl, tmp94
	sall	$4, %eax	#, D.5110
	orb	%al, -1(%rbp)	# D.5110, temp
	.loc 1 323 0
	movzbl	-1(%rbp), %edx	# temp, D.5111
	movq	-24(%rbp), %rax	# imu, tmp95
	movq	24(%rax), %rax	# imu_2(D)->gyro, D.5109
	movl	$35, %esi	#,
	movq	%rax, %rdi	# D.5109,
	call	gWriteByte	#
	.loc 1 327 0
	movq	-24(%rbp), %rax	# imu, tmp96
	movl	-28(%rbp), %edx	# gScl, tmp97
	movl	%edx, 40(%rax)	# tmp97, imu_2(D)->gScale
	.loc 1 329 0
	movq	-24(%rbp), %rax	# imu, tmp98
	movq	%rax, %rdi	# tmp98,
	movl	$0, %eax	#,
	call	calcgRes	#
	.loc 1 330 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	setGyroScale, .-setGyroScale
	.section	.text.setAccelScale,"ax",@progbits
	.globl	setAccelScale
	.type	setAccelScale, @function
setAccelScale:
.LFB15:
	.loc 1 333 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	movl	%esi, -28(%rbp)	# aScl, aScl
	.loc 1 335 0
	movq	-24(%rbp), %rax	# imu, tmp92
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5112
	movl	$33, %esi	#,
	movq	%rax, %rdi	# D.5112,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp93, temp
	.loc 1 337 0
	andb	$-25, -1(%rbp)	#, temp
	.loc 1 339 0
	movl	-28(%rbp), %eax	# aScl, tmp94
	sall	$3, %eax	#, D.5113
	orb	%al, -1(%rbp)	# D.5113, temp
	.loc 1 341 0
	movzbl	-1(%rbp), %edx	# temp, D.5114
	movq	-24(%rbp), %rax	# imu, tmp95
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5112
	movl	$33, %esi	#,
	movq	%rax, %rdi	# D.5112,
	call	xmWriteByte	#
	.loc 1 345 0
	movq	-24(%rbp), %rax	# imu, tmp96
	movl	-28(%rbp), %edx	# aScl, tmp97
	movl	%edx, 44(%rax)	# tmp97, imu_2(D)->aScale
	.loc 1 347 0
	movl	$0, %eax	#,
	call	calcaRes	#
	.loc 1 348 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	setAccelScale, .-setAccelScale
	.section	.text.setMagScale,"ax",@progbits
	.globl	setMagScale
	.type	setMagScale, @function
setMagScale:
.LFB16:
	.loc 1 351 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# imu, imu
	movl	%esi, -28(%rbp)	# mScl, mScl
	.loc 1 353 0
	movq	-24(%rbp), %rax	# imu, tmp92
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5115
	movl	$37, %esi	#,
	movq	%rax, %rdi	# D.5115,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp93, temp
	.loc 1 355 0
	andb	$-97, -1(%rbp)	#, temp
	.loc 1 357 0
	movl	-28(%rbp), %eax	# mScl, tmp94
	sall	$5, %eax	#, D.5116
	orb	%al, -1(%rbp)	# D.5116, temp
	.loc 1 359 0
	movzbl	-1(%rbp), %edx	# temp, D.5117
	movq	-24(%rbp), %rax	# imu, tmp95
	movq	32(%rax), %rax	# imu_2(D)->xm, D.5115
	movl	$37, %esi	#,
	movq	%rax, %rdi	# D.5115,
	call	xmWriteByte	#
	.loc 1 363 0
	movq	-24(%rbp), %rax	# imu, tmp96
	movl	-28(%rbp), %edx	# mScl, tmp97
	movl	%edx, 48(%rax)	# tmp97, imu_2(D)->mScale
	.loc 1 365 0
	movl	$0, %eax	#,
	call	calcmRes	#
	.loc 1 366 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	setMagScale, .-setMagScale
	.section	.text.setGyroODR,"ax",@progbits
	.globl	setGyroODR
	.type	setGyroODR, @function
setGyroODR:
.LFB17:
	.loc 1 369 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# gyro, gyro
	movl	%esi, -28(%rbp)	# gRate, gRate
	.loc 1 371 0
	movq	-24(%rbp), %rax	# gyro, tmp90
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	gReadByte	#
	movb	%al, -1(%rbp)	# tmp91, temp
	.loc 1 373 0
	andb	$15, -1(%rbp)	#, temp
	.loc 1 375 0
	movl	-28(%rbp), %eax	# gRate, tmp92
	sall	$4, %eax	#, D.5118
	orb	%al, -1(%rbp)	# D.5118, temp
	.loc 1 377 0
	movzbl	-1(%rbp), %edx	# temp, D.5119
	movq	-24(%rbp), %rax	# gyro, tmp93
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp93,
	call	gWriteByte	#
	.loc 1 378 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	setGyroODR, .-setGyroODR
	.section	.text.setAccelODR,"ax",@progbits
	.globl	setAccelODR
	.type	setAccelODR, @function
setAccelODR:
.LFB18:
	.loc 1 381 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	movl	%esi, -28(%rbp)	# aRate, aRate
	.loc 1 383 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, temp
	.loc 1 385 0
	andb	$15, -1(%rbp)	#, temp
	.loc 1 387 0
	movl	-28(%rbp), %eax	# aRate, tmp92
	sall	$4, %eax	#, D.5120
	orb	%al, -1(%rbp)	# D.5120, temp
	.loc 1 389 0
	movzbl	-1(%rbp), %edx	# temp, D.5121
	movq	-24(%rbp), %rax	# xm, tmp93
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp93,
	call	xmWriteByte	#
	.loc 1 390 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	setAccelODR, .-setAccelODR
	.section	.text.setAccelABW,"ax",@progbits
	.globl	setAccelABW
	.type	setAccelABW, @function
setAccelABW:
.LFB19:
	.loc 1 393 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	movl	%esi, -28(%rbp)	# abwRate, abwRate
	.loc 1 395 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$33, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, temp
	.loc 1 397 0
	andb	$63, -1(%rbp)	#, temp
	.loc 1 399 0
	movl	-28(%rbp), %eax	# abwRate, tmp92
	sall	$6, %eax	#, D.5122
	orb	%al, -1(%rbp)	# D.5122, temp
	.loc 1 401 0
	movzbl	-1(%rbp), %edx	# temp, D.5123
	movq	-24(%rbp), %rax	# xm, tmp93
	movl	$33, %esi	#,
	movq	%rax, %rdi	# tmp93,
	call	xmWriteByte	#
	.loc 1 402 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	setAccelABW, .-setAccelABW
	.section	.text.setMagODR,"ax",@progbits
	.globl	setMagODR
	.type	setMagODR, @function
setMagODR:
.LFB20:
	.loc 1 405 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	movl	%esi, -28(%rbp)	# mRate, mRate
	.loc 1 407 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$36, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, temp
	.loc 1 409 0
	andb	$-29, -1(%rbp)	#, temp
	.loc 1 411 0
	movl	-28(%rbp), %eax	# mRate, tmp92
	sall	$2, %eax	#, D.5124
	orb	%al, -1(%rbp)	# D.5124, temp
	.loc 1 413 0
	movzbl	-1(%rbp), %edx	# temp, D.5125
	movq	-24(%rbp), %rax	# xm, tmp93
	movl	$36, %esi	#,
	movq	%rax, %rdi	# tmp93,
	call	xmWriteByte	#
	.loc 1 414 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	setMagODR, .-setMagODR
	.section	.text.calcgRes,"ax",@progbits
	.globl	calcgRes
	.type	calcgRes, @function
calcgRes:
.LFB21:
	.loc 1 417 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# imu, imu
	.loc 1 421 0
	movq	-8(%rbp), %rax	# imu, tmp88
	movl	40(%rax), %eax	# imu_3(D)->gScale, D.5126
	cmpl	$1, %eax	#, D.5126
	je	.L30	#,
	cmpl	$1, %eax	#, D.5126
	jb	.L31	#,
	cmpl	$2, %eax	#, D.5126
	je	.L32	#,
	.loc 1 433 0
	jmp	.L33	#
.L31:
	.loc 1 424 0
	movq	-8(%rbp), %rax	# imu, tmp89
	movss	.LC1(%rip), %xmm0	#, tmp90
	movss	%xmm0, 52(%rax)	# tmp90, imu_3(D)->gRes
	.loc 1 425 0
	jmp	.L29	#
.L30:
	.loc 1 427 0
	movq	-8(%rbp), %rax	# imu, tmp91
	movss	.LC2(%rip), %xmm0	#, tmp92
	movss	%xmm0, 52(%rax)	# tmp92, imu_3(D)->gRes
	.loc 1 428 0
	jmp	.L29	#
.L32:
	.loc 1 430 0
	movq	-8(%rbp), %rax	# imu, tmp93
	movss	.LC3(%rip), %xmm0	#, tmp94
	movss	%xmm0, 52(%rax)	# tmp94, imu_3(D)->gRes
	.loc 1 431 0
	nop
.L29:
.L33:
	.loc 1 433 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	calcgRes, .-calcgRes
	.section	.text.calcaRes,"ax",@progbits
	.globl	calcaRes
	.type	calcaRes, @function
calcaRes:
.LFB22:
	.loc 1 436 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# imu, imu
	.loc 1 440 0
	movq	-8(%rbp), %rax	# imu, tmp95
	movl	44(%rax), %eax	# imu_3(D)->aScale, D.5128
	cmpl	$4, %eax	#, D.5128
	je	.L35	#,
	.loc 1 441 0 discriminator 1
	movq	-8(%rbp), %rax	# imu, tmp96
	movl	44(%rax), %eax	# imu_3(D)->aScale, D.5128
	movl	%eax, %eax	# D.5128, tmp97
	testq	%rax, %rax	# tmp97
	js	.L36	#,
	pxor	%xmm0, %xmm0	# D.5127
	cvtsi2ssq	%rax, %xmm0	# tmp97, D.5127
	jmp	.L37	#
.L36:
	movq	%rax, %rdx	# tmp97, tmp99
	shrq	%rdx	# tmp99
	andl	$1, %eax	#, tmp100
	orq	%rax, %rdx	# tmp100, tmp99
	pxor	%xmm0, %xmm0	# tmp98
	cvtsi2ssq	%rdx, %xmm0	# tmp99, tmp98
	addss	%xmm0, %xmm0	# tmp98, D.5127
.L37:
	cvtss2sd	%xmm0, %xmm0	# D.5127, D.5129
	movsd	.LC4(%rip), %xmm1	#, tmp101
	addsd	%xmm1, %xmm0	# tmp101, D.5129
	addsd	%xmm0, %xmm0	# D.5129, D.5129
	movsd	.LC5(%rip), %xmm1	#, tmp102
	divsd	%xmm1, %xmm0	# tmp102, D.5129
	.loc 1 440 0 discriminator 1
	cvtsd2ss	%xmm0, %xmm0	# D.5129, D.5127
	jmp	.L38	#
.L35:
	.loc 1 440 0 is_stmt 0 discriminator 2
	movss	.LC6(%rip), %xmm0	#, D.5127
.L38:
	.loc 1 440 0 discriminator 4
	movq	-8(%rbp), %rax	# imu, tmp103
	movss	%xmm0, 56(%rax)	# D.5127, imu_3(D)->aRes
	.loc 1 442 0 is_stmt 1 discriminator 4
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	calcaRes, .-calcaRes
	.section	.text.calcmRes,"ax",@progbits
	.globl	calcmRes
	.type	calcmRes, @function
calcmRes:
.LFB23:
	.loc 1 445 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# imu, imu
	.loc 1 449 0
	movq	-8(%rbp), %rax	# imu, tmp94
	movl	48(%rax), %eax	# imu_3(D)->mScale, D.5131
	testl	%eax, %eax	# D.5131
	je	.L40	#,
	.loc 1 450 0 discriminator 1
	movq	-8(%rbp), %rax	# imu, tmp95
	movl	48(%rax), %eax	# imu_3(D)->mScale, D.5131
	sall	$2, %eax	#, D.5132
	movl	%eax, %eax	# D.5132, tmp96
	testq	%rax, %rax	# tmp96
	js	.L41	#,
	pxor	%xmm0, %xmm0	# D.5130
	cvtsi2ssq	%rax, %xmm0	# tmp96, D.5130
	jmp	.L42	#
.L41:
	movq	%rax, %rdx	# tmp96, tmp98
	shrq	%rdx	# tmp98
	andl	$1, %eax	#, tmp99
	orq	%rax, %rdx	# tmp99, tmp98
	pxor	%xmm0, %xmm0	# tmp97
	cvtsi2ssq	%rdx, %xmm0	# tmp98, tmp97
	addss	%xmm0, %xmm0	# tmp97, D.5130
.L42:
	cvtss2sd	%xmm0, %xmm0	# D.5130, D.5133
	movsd	.LC5(%rip), %xmm1	#, tmp100
	divsd	%xmm1, %xmm0	# tmp100, D.5133
	.loc 1 449 0 discriminator 1
	cvtsd2ss	%xmm0, %xmm0	# D.5133, D.5130
	jmp	.L43	#
.L40:
	.loc 1 449 0 is_stmt 0 discriminator 2
	movss	.LC7(%rip), %xmm0	#, D.5130
.L43:
	.loc 1 449 0 discriminator 4
	movq	-8(%rbp), %rax	# imu, tmp101
	movss	%xmm0, 60(%rax)	# D.5130, imu_3(D)->mRes
	.loc 1 451 0 is_stmt 1 discriminator 4
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	calcmRes, .-calcmRes
	.section	.text.newXData,"ax",@progbits
	.globl	newXData
	.type	newXData, @function
newXData:
.LFB24:
	.loc 1 454 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	.loc 1 455 0
	movb	$8, -2(%rbp)	#, dReadyMask
	.loc 1 456 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$39, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, statusRegVal
	.loc 1 457 0
	movzbl	-2(%rbp), %eax	# dReadyMask, tmp92
	andb	-1(%rbp), %al	# statusRegVal, D.5135
	testb	%al, %al	# D.5135
	je	.L45	#,
	.loc 1 459 0
	movl	$1, %eax	#, D.5134
	jmp	.L46	#
.L45:
	.loc 1 461 0
	movl	$0, %eax	#, D.5134
.L46:
	.loc 1 462 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	newXData, .-newXData
	.section	.text.newMData,"ax",@progbits
	.globl	newMData
	.type	newMData, @function
newMData:
.LFB25:
	.loc 1 465 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	.loc 1 466 0
	movb	$8, -2(%rbp)	#, dReadyMask
	.loc 1 467 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$7, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, statusRegVal
	.loc 1 468 0
	movzbl	-2(%rbp), %eax	# dReadyMask, tmp92
	andb	-1(%rbp), %al	# statusRegVal, D.5137
	testb	%al, %al	# D.5137
	je	.L48	#,
	.loc 1 470 0
	movl	$1, %eax	#, D.5136
	jmp	.L49	#
.L48:
	.loc 1 472 0
	movl	$0, %eax	#, D.5136
.L49:
	.loc 1 473 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	newMData, .-newMData
	.section	.text.newGData,"ax",@progbits
	.globl	newGData
	.type	newGData, @function
newGData:
.LFB26:
	.loc 1 476 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# gyro, gyro
	.loc 1 477 0
	movb	$8, -2(%rbp)	#, dReadyMask
	.loc 1 478 0
	movq	-24(%rbp), %rax	# gyro, tmp90
	movl	$39, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	gReadByte	#
	movb	%al, -1(%rbp)	# tmp91, statusRegVal
	.loc 1 479 0
	movzbl	-2(%rbp), %eax	# dReadyMask, tmp92
	andb	-1(%rbp), %al	# statusRegVal, D.5139
	testb	%al, %al	# D.5139
	je	.L51	#,
	.loc 1 481 0
	movl	$1, %eax	#, D.5138
	jmp	.L52	#
.L51:
	.loc 1 483 0
	movl	$0, %eax	#, D.5138
.L52:
	.loc 1 484 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	newGData, .-newGData
	.section	.text.xDataOverflow,"ax",@progbits
	.globl	xDataOverflow
	.type	xDataOverflow, @function
xDataOverflow:
.LFB27:
	.loc 1 487 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	.loc 1 488 0
	movb	$-128, -2(%rbp)	#, dOverflowMask
	.loc 1 489 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$39, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, statusRegVal
	.loc 1 490 0
	movzbl	-2(%rbp), %eax	# dOverflowMask, tmp92
	andb	-1(%rbp), %al	# statusRegVal, D.5141
	testb	%al, %al	# D.5141
	je	.L54	#,
	.loc 1 492 0
	movl	$1, %eax	#, D.5140
	jmp	.L55	#
.L54:
	.loc 1 494 0
	movl	$0, %eax	#, D.5140
.L55:
	.loc 1 495 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	xDataOverflow, .-xDataOverflow
	.section	.text.gDataOverflow,"ax",@progbits
	.globl	gDataOverflow
	.type	gDataOverflow, @function
gDataOverflow:
.LFB28:
	.loc 1 498 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	.loc 1 499 0
	movb	$-128, -2(%rbp)	#, dOverflowMask
	.loc 1 500 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$39, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, statusRegVal
	.loc 1 501 0
	movzbl	-2(%rbp), %eax	# dOverflowMask, tmp92
	andb	-1(%rbp), %al	# statusRegVal, D.5143
	testb	%al, %al	# D.5143
	je	.L57	#,
	.loc 1 503 0
	movl	$1, %eax	#, D.5142
	jmp	.L58	#
.L57:
	.loc 1 505 0
	movl	$0, %eax	#, D.5142
.L58:
	.loc 1 506 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	gDataOverflow, .-gDataOverflow
	.section	.text.mDataOverflow,"ax",@progbits
	.globl	mDataOverflow
	.type	mDataOverflow, @function
mDataOverflow:
.LFB29:
	.loc 1 509 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# xm, xm
	.loc 1 510 0
	movb	$-128, -2(%rbp)	#, dOverflowMask
	.loc 1 511 0
	movq	-24(%rbp), %rax	# xm, tmp90
	movl	$7, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	xmReadByte	#
	movb	%al, -1(%rbp)	# tmp91, statusRegVal
	.loc 1 512 0
	movzbl	-2(%rbp), %eax	# dOverflowMask, tmp92
	andb	-1(%rbp), %al	# statusRegVal, D.5145
	testb	%al, %al	# D.5145
	je	.L60	#,
	.loc 1 514 0
	movl	$1, %eax	#, D.5144
	jmp	.L61	#
.L60:
	.loc 1 516 0
	movl	$0, %eax	#, D.5144
.L61:
	.loc 1 517 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	mDataOverflow, .-mDataOverflow
	.section	.text.gWriteByte,"ax",@progbits
	.globl	gWriteByte
	.type	gWriteByte, @function
gWriteByte:
.LFB30:
	.loc 1 520 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# gyro, gyro
	movl	%esi, %ecx	# subAddress, tmp89
	movl	%edx, %eax	# data, tmp90
	movb	%cl, -12(%rbp)	# tmp89, subAddress
	movb	%al, -16(%rbp)	# tmp90, data
	.loc 1 521 0
	movzbl	-12(%rbp), %edx	# subAddress, D.5146
	movzbl	-16(%rbp), %ecx	# data, D.5146
	movq	-8(%rbp), %rax	# gyro, tmp91
	movl	%ecx, %esi	# D.5146,
	movq	%rax, %rdi	# tmp91,
	call	mraa_i2c_write_byte_data	#
	.loc 1 522 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	gWriteByte, .-gWriteByte
	.section	.text.xmWriteByte,"ax",@progbits
	.globl	xmWriteByte
	.type	xmWriteByte, @function
xmWriteByte:
.LFB31:
	.loc 1 525 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# xm, xm
	movl	%esi, %ecx	# subAddress, tmp89
	movl	%edx, %eax	# data, tmp90
	movb	%cl, -12(%rbp)	# tmp89, subAddress
	movb	%al, -16(%rbp)	# tmp90, data
	.loc 1 526 0
	movzbl	-12(%rbp), %edx	# subAddress, D.5147
	movzbl	-16(%rbp), %ecx	# data, D.5147
	movq	-8(%rbp), %rax	# xm, tmp91
	movl	%ecx, %esi	# D.5147,
	movq	%rax, %rdi	# tmp91,
	call	mraa_i2c_write_byte_data	#
	.loc 1 527 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	xmWriteByte, .-xmWriteByte
	.section	.text.gReadByte,"ax",@progbits
	.globl	gReadByte
	.type	gReadByte, @function
gReadByte:
.LFB32:
	.loc 1 530 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# gyro, gyro
	movl	%esi, %eax	# subAddress, tmp91
	movb	%al, -12(%rbp)	# tmp91, subAddress
	.loc 1 531 0
	movzbl	-12(%rbp), %edx	# subAddress, D.5148
	movq	-8(%rbp), %rax	# gyro, tmp92
	movl	%edx, %esi	# D.5148,
	movq	%rax, %rdi	# tmp92,
	call	mraa_i2c_read_byte_data	#
	.loc 1 532 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	gReadByte, .-gReadByte
	.section	.text.gReadBytes,"ax",@progbits
	.globl	gReadBytes
	.type	gReadBytes, @function
gReadBytes:
.LFB33:
	.loc 1 535 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# gyro, gyro
	movq	%rdx, -24(%rbp)	# dest, dest
	movl	%ecx, %eax	# count, tmp91
	movb	%sil, -12(%rbp)	# tmp90, subAddress
	movb	%al, -16(%rbp)	# tmp91, count
	.loc 1 536 0
	movzbl	-16(%rbp), %ecx	# count, D.5150
	movzbl	-12(%rbp), %eax	# subAddress, tmp92
	orl	$-128, %eax	#, D.5151
	movzbl	%al, %esi	# D.5151, D.5150
	movq	-24(%rbp), %rdx	# dest, tmp93
	movq	-8(%rbp), %rax	# gyro, tmp94
	movq	%rax, %rdi	# tmp94,
	call	mraa_i2c_read_bytes_data	#
	.loc 1 537 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	gReadBytes, .-gReadBytes
	.section	.text.xmReadByte,"ax",@progbits
	.globl	xmReadByte
	.type	xmReadByte, @function
xmReadByte:
.LFB34:
	.loc 1 540 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# xm, xm
	movl	%esi, %eax	# subAddress, tmp91
	movb	%al, -12(%rbp)	# tmp91, subAddress
	.loc 1 541 0
	movzbl	-12(%rbp), %edx	# subAddress, D.5152
	movq	-8(%rbp), %rax	# xm, tmp92
	movl	%edx, %esi	# D.5152,
	movq	%rax, %rdi	# tmp92,
	call	mraa_i2c_read_byte_data	#
	.loc 1 542 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	xmReadByte, .-xmReadByte
	.section	.text.xmReadBytes,"ax",@progbits
	.globl	xmReadBytes
	.type	xmReadBytes, @function
xmReadBytes:
.LFB35:
	.loc 1 545 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# xm, xm
	movq	%rdx, -24(%rbp)	# dest, dest
	movl	%ecx, %eax	# count, tmp91
	movb	%sil, -12(%rbp)	# tmp90, subAddress
	movb	%al, -16(%rbp)	# tmp91, count
	.loc 1 546 0
	movzbl	-16(%rbp), %ecx	# count, D.5154
	movzbl	-12(%rbp), %eax	# subAddress, tmp92
	orl	$-128, %eax	#, D.5155
	movzbl	%al, %esi	# D.5155, D.5154
	movq	-24(%rbp), %rdx	# dest, tmp93
	movq	-8(%rbp), %rax	# xm, tmp94
	movq	%rax, %rdi	# tmp94,
	call	mraa_i2c_read_bytes_data	#
	.loc 1 547 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	xmReadBytes, .-xmReadBytes
	.section	.rodata
	.align 4
.LC1:
	.long	1005912064
	.align 4
.LC2:
	.long	1014628352
	.align 4
.LC3:
	.long	1031405568
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	0
	.long	1088421888
	.align 4
.LC6:
	.long	973078528
	.align 4
.LC7:
	.long	947912704
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/mraa/i2c.h"
	.file 4 "src/main/drivers/SFE_LSM9DS0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xd14
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF136
	.byte	0xc
	.long	.LASF137
	.long	.LASF138
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x25
	.long	0x3b
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.long	.LASF4
	.byte	0x2
	.byte	0x30
	.long	0x5b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x31
	.long	0x6d
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
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
	.byte	0x7
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF13
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0x35
	.long	0xa9
	.uleb128 0x5
	.byte	0x8
	.long	0xaf
	.uleb128 0x6
	.long	.LASF139
	.uleb128 0x7
	.long	.LASF18
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0x81
	.long	0xd7
	.uleb128 0x8
	.long	.LASF15
	.byte	0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x1
	.uleb128 0x8
	.long	.LASF17
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF18
	.byte	0x4
	.byte	0x86
	.long	0xb4
	.uleb128 0x7
	.long	.LASF19
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0x89
	.long	0x111
	.uleb128 0x8
	.long	.LASF20
	.byte	0
	.uleb128 0x8
	.long	.LASF21
	.byte	0x1
	.uleb128 0x8
	.long	.LASF22
	.byte	0x2
	.uleb128 0x8
	.long	.LASF23
	.byte	0x3
	.uleb128 0x8
	.long	.LASF24
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF19
	.byte	0x4
	.byte	0x90
	.long	0xe2
	.uleb128 0x7
	.long	.LASF25
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0x93
	.long	0x145
	.uleb128 0x8
	.long	.LASF26
	.byte	0
	.uleb128 0x8
	.long	.LASF27
	.byte	0x1
	.uleb128 0x8
	.long	.LASF28
	.byte	0x2
	.uleb128 0x8
	.long	.LASF29
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF25
	.byte	0x4
	.byte	0x99
	.long	0x11c
	.uleb128 0x7
	.long	.LASF30
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0x9c
	.long	0x1b5
	.uleb128 0x8
	.long	.LASF31
	.byte	0
	.uleb128 0x8
	.long	.LASF32
	.byte	0x1
	.uleb128 0x8
	.long	.LASF33
	.byte	0x4
	.uleb128 0x8
	.long	.LASF34
	.byte	0x5
	.uleb128 0x8
	.long	.LASF35
	.byte	0x6
	.uleb128 0x8
	.long	.LASF36
	.byte	0x7
	.uleb128 0x8
	.long	.LASF37
	.byte	0x8
	.uleb128 0x8
	.long	.LASF38
	.byte	0x9
	.uleb128 0x8
	.long	.LASF39
	.byte	0xa
	.uleb128 0x8
	.long	.LASF40
	.byte	0xb
	.uleb128 0x8
	.long	.LASF41
	.byte	0xc
	.uleb128 0x8
	.long	.LASF42
	.byte	0xd
	.uleb128 0x8
	.long	.LASF43
	.byte	0xe
	.uleb128 0x8
	.long	.LASF44
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF30
	.byte	0x4
	.byte	0xad
	.long	0x150
	.uleb128 0x7
	.long	.LASF45
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0xb0
	.long	0x213
	.uleb128 0x8
	.long	.LASF46
	.byte	0
	.uleb128 0x8
	.long	.LASF47
	.byte	0x1
	.uleb128 0x8
	.long	.LASF48
	.byte	0x2
	.uleb128 0x8
	.long	.LASF49
	.byte	0x3
	.uleb128 0x8
	.long	.LASF50
	.byte	0x4
	.uleb128 0x8
	.long	.LASF51
	.byte	0x5
	.uleb128 0x8
	.long	.LASF52
	.byte	0x6
	.uleb128 0x8
	.long	.LASF53
	.byte	0x7
	.uleb128 0x8
	.long	.LASF54
	.byte	0x8
	.uleb128 0x8
	.long	.LASF55
	.byte	0x9
	.uleb128 0x8
	.long	.LASF56
	.byte	0xa
	.byte	0
	.uleb128 0x3
	.long	.LASF45
	.byte	0x4
	.byte	0xbd
	.long	0x1c0
	.uleb128 0x7
	.long	.LASF57
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0xc0
	.long	0x247
	.uleb128 0x8
	.long	.LASF58
	.byte	0
	.uleb128 0x8
	.long	.LASF59
	.byte	0x1
	.uleb128 0x8
	.long	.LASF60
	.byte	0x2
	.uleb128 0x8
	.long	.LASF61
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF57
	.byte	0x4
	.byte	0xc6
	.long	0x21e
	.uleb128 0x7
	.long	.LASF62
	.byte	0x4
	.long	0x74
	.byte	0x4
	.byte	0xca
	.long	0x287
	.uleb128 0x8
	.long	.LASF63
	.byte	0
	.uleb128 0x8
	.long	.LASF64
	.byte	0x1
	.uleb128 0x8
	.long	.LASF65
	.byte	0x2
	.uleb128 0x8
	.long	.LASF66
	.byte	0x3
	.uleb128 0x8
	.long	.LASF67
	.byte	0x4
	.uleb128 0x8
	.long	.LASF68
	.byte	0x5
	.byte	0
	.uleb128 0x3
	.long	.LASF62
	.byte	0x4
	.byte	0xd2
	.long	0x252
	.uleb128 0x9
	.long	.LASF140
	.byte	0x40
	.byte	0x4
	.byte	0xdc
	.long	0x36d
	.uleb128 0xa
	.string	"gx"
	.byte	0x4
	.byte	0xe2
	.long	0x30
	.byte	0
	.uleb128 0xa
	.string	"gy"
	.byte	0x4
	.byte	0xe2
	.long	0x30
	.byte	0x2
	.uleb128 0xa
	.string	"gz"
	.byte	0x4
	.byte	0xe2
	.long	0x30
	.byte	0x4
	.uleb128 0xa
	.string	"ax"
	.byte	0x4
	.byte	0xe3
	.long	0x30
	.byte	0x6
	.uleb128 0xa
	.string	"ay"
	.byte	0x4
	.byte	0xe3
	.long	0x30
	.byte	0x8
	.uleb128 0xa
	.string	"az"
	.byte	0x4
	.byte	0xe3
	.long	0x30
	.byte	0xa
	.uleb128 0xa
	.string	"mx"
	.byte	0x4
	.byte	0xe4
	.long	0x30
	.byte	0xc
	.uleb128 0xa
	.string	"my"
	.byte	0x4
	.byte	0xe4
	.long	0x30
	.byte	0xe
	.uleb128 0xa
	.string	"mz"
	.byte	0x4
	.byte	0xe4
	.long	0x30
	.byte	0x10
	.uleb128 0xb
	.long	.LASF69
	.byte	0x4
	.byte	0xe5
	.long	0x30
	.byte	0x12
	.uleb128 0xb
	.long	.LASF70
	.byte	0x4
	.byte	0xe7
	.long	0x9e
	.byte	0x18
	.uleb128 0xa
	.string	"xm"
	.byte	0x4
	.byte	0xe8
	.long	0x9e
	.byte	0x20
	.uleb128 0xb
	.long	.LASF71
	.byte	0x4
	.byte	0xec
	.long	0xd7
	.byte	0x28
	.uleb128 0xb
	.long	.LASF72
	.byte	0x4
	.byte	0xed
	.long	0x111
	.byte	0x2c
	.uleb128 0xb
	.long	.LASF73
	.byte	0x4
	.byte	0xee
	.long	0x145
	.byte	0x30
	.uleb128 0xb
	.long	.LASF74
	.byte	0x4
	.byte	0xf3
	.long	0x36d
	.byte	0x34
	.uleb128 0xb
	.long	.LASF75
	.byte	0x4
	.byte	0xf3
	.long	0x36d
	.byte	0x38
	.uleb128 0xb
	.long	.LASF76
	.byte	0x4
	.byte	0xf3
	.long	0x36d
	.byte	0x3c
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF77
	.uleb128 0x3
	.long	.LASF78
	.byte	0x4
	.byte	0xf5
	.long	0x292
	.uleb128 0xc
	.long	.LASF89
	.byte	0x1
	.byte	0x23
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c7
	.uleb128 0xd
	.string	"imu"
	.byte	0x1
	.byte	0x23
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.long	.LASF79
	.byte	0x1
	.byte	0x23
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.long	.LASF80
	.byte	0x1
	.byte	0x23
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x374
	.uleb128 0xf
	.long	.LASF98
	.byte	0x1
	.byte	0x43
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x46d
	.uleb128 0xd
	.string	"imu"
	.byte	0x1
	.byte	0x43
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.long	.LASF81
	.byte	0x1
	.byte	0x43
	.long	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xe
	.long	.LASF82
	.byte	0x1
	.byte	0x43
	.long	0x111
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.long	.LASF83
	.byte	0x1
	.byte	0x44
	.long	0x145
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.long	.LASF84
	.byte	0x1
	.byte	0x44
	.long	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.long	.LASF85
	.byte	0x1
	.byte	0x44
	.long	0x213
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xe
	.long	.LASF86
	.byte	0x1
	.byte	0x44
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.long	.LASF87
	.byte	0x1
	.byte	0x54
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x10
	.long	.LASF88
	.byte	0x1
	.byte	0x55
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0xc
	.long	.LASF90
	.byte	0x1
	.byte	0x6a
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x499
	.uleb128 0xe
	.long	.LASF70
	.byte	0x1
	.byte	0x6a
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xc
	.long	.LASF91
	.byte	0x1
	.byte	0xa4
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c4
	.uleb128 0xd
	.string	"xm"
	.byte	0x1
	.byte	0xa4
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xc
	.long	.LASF92
	.byte	0x1
	.byte	0xd1
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x4ef
	.uleb128 0xd
	.string	"xm"
	.byte	0x1
	.byte	0xd1
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.long	.LASF93
	.byte	0x1
	.value	0x106
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x52c
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x106
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x108
	.long	0x52c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x14
	.long	0x50
	.long	0x53c
	.uleb128 0x15
	.long	0x82
	.byte	0x5
	.byte	0
	.uleb128 0x11
	.long	.LASF95
	.byte	0x1
	.value	0x10f
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x579
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x10f
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x111
	.long	0x52c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.long	.LASF96
	.byte	0x1
	.value	0x118
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x5b6
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x118
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x11a
	.long	0x52c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.long	.LASF97
	.byte	0x1
	.value	0x121
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x5f3
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x121
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x123
	.long	0x5f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x14
	.long	0x50
	.long	0x603
	.uleb128 0x15
	.long	0x82
	.byte	0x1
	.byte	0
	.uleb128 0x16
	.long	.LASF99
	.byte	0x1
	.value	0x128
	.long	0x36d
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x644
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x128
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF70
	.byte	0x1
	.value	0x128
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x16
	.long	.LASF100
	.byte	0x1
	.value	0x12e
	.long	0x36d
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x685
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x12e
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF101
	.byte	0x1
	.value	0x12e
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x16
	.long	.LASF102
	.byte	0x1
	.value	0x134
	.long	0x36d
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x6c6
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x134
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"mag"
	.byte	0x1
	.value	0x134
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x11
	.long	.LASF103
	.byte	0x1
	.value	0x13a
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x712
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x13a
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF81
	.byte	0x1
	.value	0x13a
	.long	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x13d
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.long	.LASF104
	.byte	0x1
	.value	0x14c
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x75e
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x14c
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF82
	.byte	0x1
	.value	0x14c
	.long	0x111
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x14f
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.long	.LASF105
	.byte	0x1
	.value	0x15e
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x7aa
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x15e
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF83
	.byte	0x1
	.value	0x15e
	.long	0x145
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x161
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.long	.LASF106
	.byte	0x1
	.value	0x170
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x7f6
	.uleb128 0x17
	.long	.LASF70
	.byte	0x1
	.value	0x170
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF107
	.byte	0x1
	.value	0x170
	.long	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x173
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.long	.LASF108
	.byte	0x1
	.value	0x17c
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x841
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x17c
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF109
	.byte	0x1
	.value	0x17c
	.long	0x213
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x17f
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.long	.LASF110
	.byte	0x1
	.value	0x188
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x88c
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x188
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF111
	.byte	0x1
	.value	0x188
	.long	0x247
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x18b
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.long	.LASF112
	.byte	0x1
	.value	0x194
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d7
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x194
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF113
	.byte	0x1
	.value	0x194
	.long	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.value	0x197
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x18
	.long	.LASF114
	.byte	0x1
	.value	0x1a0
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x905
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x1a0
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF115
	.byte	0x1
	.value	0x1b3
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x933
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x1b3
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	.LASF116
	.byte	0x1
	.value	0x1bc
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x961
	.uleb128 0x12
	.string	"imu"
	.byte	0x1
	.value	0x1bc
	.long	0x3c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.long	.LASF117
	.byte	0x1
	.value	0x1c5
	.long	0x9b0
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x9b0
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x1c5
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF118
	.byte	0x1
	.value	0x1c7
	.long	0x9b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x13
	.long	.LASF119
	.byte	0x1
	.value	0x1c8
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF120
	.uleb128 0x1a
	.long	0x50
	.uleb128 0x19
	.long	.LASF121
	.byte	0x1
	.value	0x1d0
	.long	0x9b0
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xa0b
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x1d0
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF118
	.byte	0x1
	.value	0x1d2
	.long	0x9b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x13
	.long	.LASF119
	.byte	0x1
	.value	0x1d3
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x19
	.long	.LASF122
	.byte	0x1
	.value	0x1db
	.long	0x9b0
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xa5b
	.uleb128 0x17
	.long	.LASF70
	.byte	0x1
	.value	0x1db
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF118
	.byte	0x1
	.value	0x1dd
	.long	0x9b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x13
	.long	.LASF119
	.byte	0x1
	.value	0x1de
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x19
	.long	.LASF123
	.byte	0x1
	.value	0x1e6
	.long	0x9b0
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xaaa
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x1e6
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF124
	.byte	0x1
	.value	0x1e8
	.long	0x9b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x13
	.long	.LASF119
	.byte	0x1
	.value	0x1e9
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x19
	.long	.LASF125
	.byte	0x1
	.value	0x1f1
	.long	0x9b0
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xaf9
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x1f1
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF124
	.byte	0x1
	.value	0x1f3
	.long	0x9b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x13
	.long	.LASF119
	.byte	0x1
	.value	0x1f4
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x19
	.long	.LASF126
	.byte	0x1
	.value	0x1fc
	.long	0x9b0
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xb48
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x1fc
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.long	.LASF124
	.byte	0x1
	.value	0x1fe
	.long	0x9b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x13
	.long	.LASF119
	.byte	0x1
	.value	0x1ff
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x11
	.long	.LASF127
	.byte	0x1
	.value	0x207
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xb94
	.uleb128 0x17
	.long	.LASF70
	.byte	0x1
	.value	0x207
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF128
	.byte	0x1
	.value	0x207
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.long	.LASF129
	.byte	0x1
	.value	0x207
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.long	.LASF130
	.byte	0x1
	.value	0x20c
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xbdf
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x20c
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF128
	.byte	0x1
	.value	0x20c
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.long	.LASF129
	.byte	0x1
	.value	0x20c
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x19
	.long	.LASF131
	.byte	0x1
	.value	0x211
	.long	0x50
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0xc20
	.uleb128 0x17
	.long	.LASF70
	.byte	0x1
	.value	0x211
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF128
	.byte	0x1
	.value	0x211
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x11
	.long	.LASF132
	.byte	0x1
	.value	0x216
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0xc7b
	.uleb128 0x17
	.long	.LASF70
	.byte	0x1
	.value	0x216
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF128
	.byte	0x1
	.value	0x216
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.long	.LASF133
	.byte	0x1
	.value	0x216
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF134
	.byte	0x1
	.value	0x216
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x50
	.uleb128 0x19
	.long	.LASF135
	.byte	0x1
	.value	0x21b
	.long	0x50
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0xcc1
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x21b
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF128
	.byte	0x1
	.value	0x21b
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1b
	.long	.LASF141
	.byte	0x1
	.value	0x220
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.string	"xm"
	.byte	0x1
	.value	0x220
	.long	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LASF128
	.byte	0x1
	.value	0x220
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.long	.LASF133
	.byte	0x1
	.value	0x220
	.long	0xc7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LASF134
	.byte	0x1
	.value	0x220
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
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
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0x10
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x23c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.quad	.LFB5
	.quad	.LFE5-.LFB5
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
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB2
	.quad	.LFE2
	.quad	.LFB3
	.quad	.LFE3
	.quad	.LFB4
	.quad	.LFE4
	.quad	.LFB5
	.quad	.LFE5
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
	.quad	.LFB32
	.quad	.LFE32
	.quad	.LFB33
	.quad	.LFE33
	.quad	.LFB34
	.quad	.LFE34
	.quad	.LFB35
	.quad	.LFE35
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF134:
	.string	"count"
.LASF125:
	.string	"gDataOverflow"
.LASF51:
	.string	"A_ODR_50"
.LASF82:
	.string	"aScl"
.LASF123:
	.string	"xDataOverflow"
.LASF80:
	.string	"xmAddr"
.LASF121:
	.string	"newMData"
.LASF87:
	.string	"gTest"
.LASF108:
	.string	"setAccelODR"
.LASF26:
	.string	"M_SCALE_2GS"
.LASF75:
	.string	"aRes"
.LASF107:
	.string	"gRate"
.LASF12:
	.string	"long long unsigned int"
.LASF55:
	.string	"A_ODR_800"
.LASF101:
	.string	"accel"
.LASF72:
	.string	"aScale"
.LASF31:
	.string	"G_ODR_95_BW_125"
.LASF3:
	.string	"int16_t"
.LASF27:
	.string	"M_SCALE_4GS"
.LASF0:
	.string	"signed char"
.LASF95:
	.string	"readAccel"
.LASF58:
	.string	"A_ABW_773"
.LASF76:
	.string	"mRes"
.LASF41:
	.string	"G_ODR_760_BW_30"
.LASF14:
	.string	"mraa_i2c_context"
.LASF42:
	.string	"G_ODR_760_BW_35"
.LASF2:
	.string	"long int"
.LASF49:
	.string	"A_ODR_125"
.LASF46:
	.string	"A_POWER_DOWN"
.LASF47:
	.string	"A_ODR_3125"
.LASF114:
	.string	"calcgRes"
.LASF17:
	.string	"G_SCALE_2000DPS"
.LASF22:
	.string	"A_SCALE_6G"
.LASF13:
	.string	"long long int"
.LASF6:
	.string	"uint16_t"
.LASF39:
	.string	"G_ODR_380_BW_50"
.LASF141:
	.string	"xmReadBytes"
.LASF69:
	.string	"temperature"
.LASF34:
	.string	"G_ODR_190_BW_25"
.LASF140:
	.string	"LSM9DS0"
.LASF122:
	.string	"newGData"
.LASF40:
	.string	"G_ODR_380_BW_100"
.LASF16:
	.string	"G_SCALE_500DPS"
.LASF135:
	.string	"xmReadByte"
.LASF15:
	.string	"G_SCALE_245DPS"
.LASF48:
	.string	"A_ODR_625"
.LASF86:
	.string	"mODR"
.LASF66:
	.string	"M_ODR_25"
.LASF94:
	.string	"temp"
.LASF109:
	.string	"aRate"
.LASF103:
	.string	"setGyroScale"
.LASF8:
	.string	"unsigned int"
.LASF79:
	.string	"gAddr"
.LASF78:
	.string	"LSM9DS0_t"
.LASF98:
	.string	"begin"
.LASF30:
	.string	"gyro_odr"
.LASF136:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF9:
	.string	"long unsigned int"
.LASF112:
	.string	"setMagODR"
.LASF81:
	.string	"gScl"
.LASF99:
	.string	"calcGyro"
.LASF54:
	.string	"A_ODR_400"
.LASF129:
	.string	"data"
.LASF7:
	.string	"short unsigned int"
.LASF24:
	.string	"A_SCALE_16G"
.LASF97:
	.string	"readTemp"
.LASF56:
	.string	"A_ODR_1600"
.LASF43:
	.string	"G_ODR_760_BW_50"
.LASF33:
	.string	"G_ODR_190_BW_125"
.LASF118:
	.string	"dReadyMask"
.LASF126:
	.string	"mDataOverflow"
.LASF71:
	.string	"gScale"
.LASF23:
	.string	"A_SCALE_8G"
.LASF70:
	.string	"gyro"
.LASF105:
	.string	"setMagScale"
.LASF119:
	.string	"statusRegVal"
.LASF10:
	.string	"sizetype"
.LASF59:
	.string	"A_ABW_194"
.LASF18:
	.string	"gyro_scale"
.LASF110:
	.string	"setAccelABW"
.LASF62:
	.string	"mag_odr"
.LASF25:
	.string	"mag_scale"
.LASF116:
	.string	"calcmRes"
.LASF45:
	.string	"accel_odr"
.LASF133:
	.string	"dest"
.LASF111:
	.string	"abwRate"
.LASF88:
	.string	"xmTest"
.LASF138:
	.string	"/home/aravind/git/cleanflight"
.LASF77:
	.string	"float"
.LASF96:
	.string	"readMag"
.LASF85:
	.string	"aODR"
.LASF64:
	.string	"M_ODR_625"
.LASF89:
	.string	"imu_setup"
.LASF50:
	.string	"A_ODR_25"
.LASF35:
	.string	"G_ODR_190_BW_50"
.LASF120:
	.string	"_Bool"
.LASF130:
	.string	"xmWriteByte"
.LASF5:
	.string	"unsigned char"
.LASF131:
	.string	"gReadByte"
.LASF1:
	.string	"short int"
.LASF106:
	.string	"setGyroODR"
.LASF20:
	.string	"A_SCALE_2G"
.LASF67:
	.string	"M_ODR_50"
.LASF124:
	.string	"dOverflowMask"
.LASF83:
	.string	"mScl"
.LASF68:
	.string	"M_ODR_100"
.LASF104:
	.string	"setAccelScale"
.LASF29:
	.string	"M_SCALE_12GS"
.LASF53:
	.string	"A_ODR_200"
.LASF60:
	.string	"A_ABW_362"
.LASF44:
	.string	"G_ODR_760_BW_100"
.LASF11:
	.string	"char"
.LASF132:
	.string	"gReadBytes"
.LASF21:
	.string	"A_SCALE_4G"
.LASF73:
	.string	"mScale"
.LASF139:
	.string	"_i2c"
.LASF102:
	.string	"calcMag"
.LASF137:
	.string	"src/main/drivers/SFE_LSM9DS0.c"
.LASF74:
	.string	"gRes"
.LASF57:
	.string	"accel_abw"
.LASF37:
	.string	"G_ODR_380_BW_20"
.LASF38:
	.string	"G_ODR_380_BW_25"
.LASF113:
	.string	"mRate"
.LASF32:
	.string	"G_ODR_95_BW_25"
.LASF115:
	.string	"calcaRes"
.LASF127:
	.string	"gWriteByte"
.LASF90:
	.string	"initGyro"
.LASF93:
	.string	"readGyro"
.LASF36:
	.string	"G_ODR_190_BW_70"
.LASF4:
	.string	"uint8_t"
.LASF52:
	.string	"A_ODR_100"
.LASF100:
	.string	"calcAccel"
.LASF19:
	.string	"accel_scale"
.LASF92:
	.string	"initMag"
.LASF63:
	.string	"M_ODR_3125"
.LASF117:
	.string	"newXData"
.LASF84:
	.string	"gODR"
.LASF91:
	.string	"initAccel"
.LASF128:
	.string	"subAddress"
.LASF28:
	.string	"M_SCALE_8GS"
.LASF65:
	.string	"M_ODR_125"
.LASF61:
	.string	"A_ABW_50"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
