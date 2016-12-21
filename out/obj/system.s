	.file	"system.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed system.i -mtune=generic -march=x86-64 -g
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
	.comm	receiveLength,4,4
	.comm	__pg_registry_start,8,8
	.comm	__pg_registry_end,8,8
	.comm	__pg_resetdata_start,8,8
	.comm	__pg_resetdata_end,8,8
	.comm	sensorSelectionConfig_System,3,1
	.comm	sensorAlignmentConfig_System,12,8
	.comm	sensorTrims_System,12,8
	.section	.bss.usTicks,"aw",@nobits
	.align 4
	.type	usTicks, @object
	.size	usTicks, 4
usTicks:
	.zero	4
	.section	.bss.sysTickUptime,"aw",@nobits
	.align 4
	.type	sysTickUptime, @object
	.size	sysTickUptime, 4
sysTickUptime:
	.zero	4
	.comm	start,16,16
	.comm	current,16,16
	.comm	imu,8,8
	.comm	mag,16,16
	.comm	acc,24,16
	.comm	gyro,40,32
	.section	.text.micros,"ax",@progbits
	.globl	micros
	.type	micros, @function
micros:
.LFB13:
	.file 1 "src/main/drivers/system.c"
	.loc 1 76 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 77 0
	movl	$current, %esi	#,
	movl	$4, %edi	#,
	call	clock_gettime	#
	.loc 1 78 0
	movq	current(%rip), %rdx	# current.tv_sec, D.5772
	movq	start(%rip), %rax	# start.tv_sec, D.5772
	subq	%rax, %rdx	# D.5772, D.5772
	movq	%rdx, %rax	# D.5772, D.5772
	imulq	$1000000000, %rax, %rdx	#, D.5772, D.5772
	movq	current+8(%rip), %rax	# current.tv_nsec, D.5772
	addq	%rax, %rdx	# D.5772, D.5772
	movq	start+8(%rip), %rax	# start.tv_nsec, D.5772
	movq	%rdx, %rcx	# D.5772, D.5772
	subq	%rax, %rcx	# D.5772, D.5772
	movabsq	$2361183241434822607, %rdx	#, tmp101
	movq	%rcx, %rax	# D.5772, tmp105
	imulq	%rdx	# tmp101
	sarq	$7, %rdx	#, tmp102
	movq	%rcx, %rax	# D.5772, tmp103
	sarq	$63, %rax	#, tmp103
	subq	%rax, %rdx	# tmp103, D.5772
	movq	%rdx, %rax	# D.5772, D.5772
	movl	%eax, sysTickUptime(%rip)	# D.5773, sysTickUptime
	.loc 1 79 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.5773
	movl	%eax, usTicks(%rip)	# D.5773, usTicks
	.loc 1 82 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.5774
	.loc 1 83 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	micros, .-micros
	.section	.text.millis,"ax",@progbits
	.globl	millis
	.type	millis, @function
millis:
.LFB14:
	.loc 1 87 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 88 0
	movl	sysTickUptime(%rip), %eax	# sysTickUptime, D.5775
	movl	$274877907, %edx	#, tmp91
	mull	%edx	# tmp91
	movl	%edx, %eax	# tmp90, D.5776
	shrl	$6, %eax	#, D.5776
	.loc 1 89 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	millis, .-millis
	.section	.rodata
	.align 8
.LC0:
	.string	"the sensor initialization result is 0x%x\n"
	.section	.text.init_sensors,"ax",@progbits
	.globl	init_sensors
	.type	init_sensors, @function
init_sensors:
.LFB15:
	.loc 1 93 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 95 0
	movl	$64, %edi	#,
	call	malloc	#
	movq	%rax, imu(%rip)	# D.5777, imu
	.loc 1 97 0
	movl	$mag, %edi	#,
	call	sparkfun_compass_Detect	#
	.loc 1 98 0
	movl	$8, %edi	#,
	call	sensorsSet	#
	.loc 1 100 0
	movl	$acc, %edi	#,
	call	sparkfun_acc_Detect	#
	.loc 1 101 0
	movl	$2, %edi	#,
	call	sensorsSet	#
	.loc 1 104 0
	movl	$gyro, %edi	#,
	call	sparkfun_gyro_detect	#
	.loc 1 105 0
	movl	$1, %edi	#,
	call	sensorsSet	#
	.loc 1 108 0
	movq	imu(%rip), %rax	# imu, D.5778
	movl	$29, %edx	#,
	movl	$107, %esi	#,
	movq	%rax, %rdi	# D.5778,
	call	imu_setup	#
	.loc 1 109 0
	movq	imu(%rip), %rax	# imu, D.5778
	subq	$8, %rsp	#,
	pushq	$1	#
	movl	$3, %r9d	#,
	movl	$5, %r8d	#,
	movl	$1, %ecx	#,
	movl	$1, %edx	#,
	movl	$1, %esi	#,
	movq	%rax, %rdi	# D.5778,
	call	begin	#
	addq	$16, %rsp	#,
	movw	%ax, -2(%rbp)	# tmp92, imuResult
	.loc 1 110 0
	movzwl	-2(%rbp), %eax	# imuResult, D.5779
	movl	%eax, %esi	# D.5779,
	movl	$.LC0, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	.loc 1 111 0
	nop
	.loc 1 112 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	init_sensors, .-init_sensors
	.section	.text.systemInit,"ax",@progbits
	.globl	systemInit
	.type	systemInit, @function
systemInit:
.LFB16:
	.loc 1 118 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 119 0
	call	usartInitAllIOSignals	#
	.loc 1 121 0
	movl	$start, %esi	#,
	movl	$4, %edi	#,
	call	clock_gettime	#
	.loc 1 124 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	systemInit, .-systemInit
	.section	.text.delay,"ax",@progbits
	.globl	delay
	.type	delay, @function
delay:
.LFB17:
	.loc 1 127 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# ms, ms
	.loc 1 128 0
	movl	-4(%rbp), %eax	# ms, tmp88
	imull	$1000, %eax, %eax	#, tmp88, D.5781
	movl	%eax, %edi	# D.5781,
	call	usleep	#
	.loc 1 129 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	delay, .-delay
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/time.h"
	.file 5 "/usr/include/mraa/i2c.h"
	.file 6 "./src/main/drivers/SFE_LSM9DS0.h"
	.file 7 "./src/main/drivers/sensor.h"
	.file 8 "./src/main/drivers/drivers_compass.h"
	.file 9 "./src/main/drivers/accgyro.h"
	.file 10 "./src/main/config/parameter_group.h"
	.file 11 "./src/main/sensors/sensors.h"
	.file 12 "./src/main/target/edison/target.h"
	.file 13 "src/main/drivers/serial_uart.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x977
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF167
	.byte	0xc
	.long	.LASF168
	.long	.LASF169
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x25
	.long	0x5e
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x30
	.long	0x77
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0x31
	.long	0x37
	.uleb128 0x4
	.long	.LASF11
	.byte	0x2
	.byte	0x33
	.long	0x94
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x8b
	.long	0x65
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0xaf
	.long	0x65
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF15
	.uleb128 0x6
	.long	.LASF70
	.byte	0x10
	.byte	0x4
	.byte	0x78
	.long	0xdf
	.uleb128 0x7
	.long	.LASF16
	.byte	0x4
	.byte	0x7a
	.long	0x9b
	.byte	0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x4
	.byte	0x7b
	.long	0xa8
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF18
	.uleb128 0x4
	.long	.LASF19
	.byte	0x5
	.byte	0x35
	.long	0xf1
	.uleb128 0x8
	.byte	0x8
	.long	0xf7
	.uleb128 0x9
	.long	.LASF170
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF20
	.uleb128 0xa
	.uleb128 0x8
	.byte	0x8
	.long	0x103
	.uleb128 0xb
	.long	.LASF24
	.byte	0x4
	.long	0x94
	.byte	0x6
	.byte	0x81
	.long	0x12d
	.uleb128 0xc
	.long	.LASF21
	.byte	0
	.uleb128 0xc
	.long	.LASF22
	.byte	0x1
	.uleb128 0xc
	.long	.LASF23
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x6
	.byte	0x86
	.long	0x10a
	.uleb128 0xb
	.long	.LASF25
	.byte	0x4
	.long	0x94
	.byte	0x6
	.byte	0x89
	.long	0x167
	.uleb128 0xc
	.long	.LASF26
	.byte	0
	.uleb128 0xc
	.long	.LASF27
	.byte	0x1
	.uleb128 0xc
	.long	.LASF28
	.byte	0x2
	.uleb128 0xc
	.long	.LASF29
	.byte	0x3
	.uleb128 0xc
	.long	.LASF30
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.long	.LASF25
	.byte	0x6
	.byte	0x90
	.long	0x138
	.uleb128 0xb
	.long	.LASF31
	.byte	0x4
	.long	0x94
	.byte	0x6
	.byte	0x93
	.long	0x19b
	.uleb128 0xc
	.long	.LASF32
	.byte	0
	.uleb128 0xc
	.long	.LASF33
	.byte	0x1
	.uleb128 0xc
	.long	.LASF34
	.byte	0x2
	.uleb128 0xc
	.long	.LASF35
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF31
	.byte	0x6
	.byte	0x99
	.long	0x172
	.uleb128 0xb
	.long	.LASF36
	.byte	0x4
	.long	0x94
	.byte	0x6
	.byte	0x9c
	.long	0x20b
	.uleb128 0xc
	.long	.LASF37
	.byte	0
	.uleb128 0xc
	.long	.LASF38
	.byte	0x1
	.uleb128 0xc
	.long	.LASF39
	.byte	0x4
	.uleb128 0xc
	.long	.LASF40
	.byte	0x5
	.uleb128 0xc
	.long	.LASF41
	.byte	0x6
	.uleb128 0xc
	.long	.LASF42
	.byte	0x7
	.uleb128 0xc
	.long	.LASF43
	.byte	0x8
	.uleb128 0xc
	.long	.LASF44
	.byte	0x9
	.uleb128 0xc
	.long	.LASF45
	.byte	0xa
	.uleb128 0xc
	.long	.LASF46
	.byte	0xb
	.uleb128 0xc
	.long	.LASF47
	.byte	0xc
	.uleb128 0xc
	.long	.LASF48
	.byte	0xd
	.uleb128 0xc
	.long	.LASF49
	.byte	0xe
	.uleb128 0xc
	.long	.LASF50
	.byte	0xf
	.byte	0
	.uleb128 0xb
	.long	.LASF51
	.byte	0x4
	.long	0x94
	.byte	0x6
	.byte	0xb0
	.long	0x25e
	.uleb128 0xc
	.long	.LASF52
	.byte	0
	.uleb128 0xc
	.long	.LASF53
	.byte	0x1
	.uleb128 0xc
	.long	.LASF54
	.byte	0x2
	.uleb128 0xc
	.long	.LASF55
	.byte	0x3
	.uleb128 0xc
	.long	.LASF56
	.byte	0x4
	.uleb128 0xc
	.long	.LASF57
	.byte	0x5
	.uleb128 0xc
	.long	.LASF58
	.byte	0x6
	.uleb128 0xc
	.long	.LASF59
	.byte	0x7
	.uleb128 0xc
	.long	.LASF60
	.byte	0x8
	.uleb128 0xc
	.long	.LASF61
	.byte	0x9
	.uleb128 0xc
	.long	.LASF62
	.byte	0xa
	.byte	0
	.uleb128 0xb
	.long	.LASF63
	.byte	0x4
	.long	0x94
	.byte	0x6
	.byte	0xca
	.long	0x293
	.uleb128 0xc
	.long	.LASF64
	.byte	0
	.uleb128 0xc
	.long	.LASF65
	.byte	0x1
	.uleb128 0xc
	.long	.LASF66
	.byte	0x2
	.uleb128 0xc
	.long	.LASF67
	.byte	0x3
	.uleb128 0xc
	.long	.LASF68
	.byte	0x4
	.uleb128 0xc
	.long	.LASF69
	.byte	0x5
	.byte	0
	.uleb128 0x6
	.long	.LASF71
	.byte	0x40
	.byte	0x6
	.byte	0xdc
	.long	0x36e
	.uleb128 0xd
	.string	"gx"
	.byte	0x6
	.byte	0xe2
	.long	0x53
	.byte	0
	.uleb128 0xd
	.string	"gy"
	.byte	0x6
	.byte	0xe2
	.long	0x53
	.byte	0x2
	.uleb128 0xd
	.string	"gz"
	.byte	0x6
	.byte	0xe2
	.long	0x53
	.byte	0x4
	.uleb128 0xd
	.string	"ax"
	.byte	0x6
	.byte	0xe3
	.long	0x53
	.byte	0x6
	.uleb128 0xd
	.string	"ay"
	.byte	0x6
	.byte	0xe3
	.long	0x53
	.byte	0x8
	.uleb128 0xd
	.string	"az"
	.byte	0x6
	.byte	0xe3
	.long	0x53
	.byte	0xa
	.uleb128 0xd
	.string	"mx"
	.byte	0x6
	.byte	0xe4
	.long	0x53
	.byte	0xc
	.uleb128 0xd
	.string	"my"
	.byte	0x6
	.byte	0xe4
	.long	0x53
	.byte	0xe
	.uleb128 0xd
	.string	"mz"
	.byte	0x6
	.byte	0xe4
	.long	0x53
	.byte	0x10
	.uleb128 0x7
	.long	.LASF72
	.byte	0x6
	.byte	0xe5
	.long	0x53
	.byte	0x12
	.uleb128 0x7
	.long	.LASF73
	.byte	0x6
	.byte	0xe7
	.long	0xe6
	.byte	0x18
	.uleb128 0xd
	.string	"xm"
	.byte	0x6
	.byte	0xe8
	.long	0xe6
	.byte	0x20
	.uleb128 0x7
	.long	.LASF74
	.byte	0x6
	.byte	0xec
	.long	0x12d
	.byte	0x28
	.uleb128 0x7
	.long	.LASF75
	.byte	0x6
	.byte	0xed
	.long	0x167
	.byte	0x2c
	.uleb128 0x7
	.long	.LASF76
	.byte	0x6
	.byte	0xee
	.long	0x19b
	.byte	0x30
	.uleb128 0x7
	.long	.LASF77
	.byte	0x6
	.byte	0xf3
	.long	0x36e
	.byte	0x34
	.uleb128 0x7
	.long	.LASF78
	.byte	0x6
	.byte	0xf3
	.long	0x36e
	.byte	0x38
	.uleb128 0x7
	.long	.LASF79
	.byte	0x6
	.byte	0xf3
	.long	0x36e
	.byte	0x3c
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF80
	.uleb128 0x4
	.long	.LASF81
	.byte	0x6
	.byte	0xf5
	.long	0x293
	.uleb128 0x4
	.long	.LASF82
	.byte	0x7
	.byte	0x14
	.long	0x38b
	.uleb128 0x8
	.byte	0x8
	.long	0x391
	.uleb128 0xe
	.long	0xfc
	.uleb128 0x4
	.long	.LASF83
	.byte	0x7
	.byte	0x15
	.long	0x3a1
	.uleb128 0x8
	.byte	0x8
	.long	0x3a7
	.uleb128 0xf
	.long	0xfc
	.long	0x3b6
	.uleb128 0x10
	.long	0x3b6
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x53
	.uleb128 0x4
	.long	.LASF84
	.byte	0x7
	.byte	0x18
	.long	0x104
	.uleb128 0x4
	.long	.LASF85
	.byte	0x7
	.byte	0x19
	.long	0x3d2
	.uleb128 0x8
	.byte	0x8
	.long	0x3d8
	.uleb128 0x11
	.long	0x3e3
	.uleb128 0x10
	.long	0x6c
	.byte	0
	.uleb128 0x4
	.long	.LASF86
	.byte	0x7
	.byte	0x1a
	.long	0x38b
	.uleb128 0x6
	.long	.LASF87
	.byte	0x10
	.byte	0x8
	.byte	0x15
	.long	0x413
	.uleb128 0x7
	.long	.LASF88
	.byte	0x8
	.byte	0x16
	.long	0x380
	.byte	0
	.uleb128 0x7
	.long	.LASF89
	.byte	0x8
	.byte	0x17
	.long	0x396
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF90
	.byte	0x8
	.byte	0x18
	.long	0x3ee
	.uleb128 0x6
	.long	.LASF91
	.byte	0x28
	.byte	0x9
	.byte	0x1e
	.long	0x467
	.uleb128 0x7
	.long	.LASF88
	.byte	0x9
	.byte	0x1f
	.long	0x3c7
	.byte	0
	.uleb128 0x7
	.long	.LASF89
	.byte	0x9
	.byte	0x20
	.long	0x396
	.byte	0x8
	.uleb128 0x7
	.long	.LASF72
	.byte	0x9
	.byte	0x21
	.long	0x396
	.byte	0x10
	.uleb128 0x7
	.long	.LASF92
	.byte	0x9
	.byte	0x22
	.long	0x3e3
	.byte	0x18
	.uleb128 0x7
	.long	.LASF93
	.byte	0x9
	.byte	0x23
	.long	0x36e
	.byte	0x20
	.byte	0
	.uleb128 0x4
	.long	.LASF94
	.byte	0x9
	.byte	0x24
	.long	0x41e
	.uleb128 0x6
	.long	.LASF95
	.byte	0x18
	.byte	0x9
	.byte	0x26
	.long	0x4af
	.uleb128 0x7
	.long	.LASF88
	.byte	0x9
	.byte	0x27
	.long	0x3bc
	.byte	0
	.uleb128 0x7
	.long	.LASF89
	.byte	0x9
	.byte	0x28
	.long	0x396
	.byte	0x8
	.uleb128 0x7
	.long	.LASF96
	.byte	0x9
	.byte	0x29
	.long	0x7e
	.byte	0x10
	.uleb128 0x7
	.long	.LASF97
	.byte	0x9
	.byte	0x2a
	.long	0x45
	.byte	0x12
	.byte	0
	.uleb128 0x4
	.long	.LASF98
	.byte	0x9
	.byte	0x2b
	.long	0x472
	.uleb128 0x4
	.long	.LASF99
	.byte	0xa
	.byte	0x15
	.long	0x7e
	.uleb128 0x4
	.long	.LASF100
	.byte	0xa
	.byte	0x26
	.long	0x4d0
	.uleb128 0x11
	.long	0x4e0
	.uleb128 0x10
	.long	0xa6
	.uleb128 0x10
	.long	0x3e
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.byte	0xa
	.byte	0x2d
	.long	0x4fe
	.uleb128 0x13
	.string	"ptr"
	.byte	0xa
	.byte	0x2e
	.long	0xa6
	.uleb128 0x13
	.string	"fn"
	.byte	0xa
	.byte	0x2f
	.long	0x4fe
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x4c5
	.uleb128 0x6
	.long	.LASF101
	.byte	0x20
	.byte	0xa
	.byte	0x28
	.long	0x54d
	.uleb128 0xd
	.string	"pgn"
	.byte	0xa
	.byte	0x29
	.long	0x4ba
	.byte	0
	.uleb128 0x7
	.long	.LASF102
	.byte	0xa
	.byte	0x2a
	.long	0x7e
	.byte	0x2
	.uleb128 0x7
	.long	.LASF103
	.byte	0xa
	.byte	0x2b
	.long	0x54d
	.byte	0x8
	.uleb128 0xd
	.string	"ptr"
	.byte	0xa
	.byte	0x2c
	.long	0x553
	.byte	0x10
	.uleb128 0x7
	.long	.LASF104
	.byte	0xa
	.byte	0x30
	.long	0x4e0
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x6c
	.uleb128 0x8
	.byte	0x8
	.long	0x54d
	.uleb128 0x4
	.long	.LASF105
	.byte	0xa
	.byte	0x31
	.long	0x504
	.uleb128 0x14
	.byte	0x4
	.long	0x94
	.byte	0xb
	.byte	0x15
	.long	0x589
	.uleb128 0xc
	.long	.LASF106
	.byte	0
	.uleb128 0xc
	.long	.LASF107
	.byte	0x1
	.uleb128 0xc
	.long	.LASF108
	.byte	0x2
	.uleb128 0xc
	.long	.LASF109
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.long	.LASF110
	.byte	0x6
	.byte	0xb
	.byte	0x20
	.long	0x5ba
	.uleb128 0x7
	.long	.LASF111
	.byte	0xb
	.byte	0x21
	.long	0x53
	.byte	0
	.uleb128 0x7
	.long	.LASF112
	.byte	0xb
	.byte	0x22
	.long	0x53
	.byte	0x2
	.uleb128 0xd
	.string	"yaw"
	.byte	0xb
	.byte	0x23
	.long	0x53
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.long	.LASF113
	.byte	0xb
	.byte	0x24
	.long	0x589
	.uleb128 0x15
	.long	.LASF171
	.byte	0x6
	.byte	0xb
	.byte	0x26
	.long	0x5e8
	.uleb128 0x13
	.string	"raw"
	.byte	0xb
	.byte	0x27
	.long	0x5e8
	.uleb128 0x16
	.long	.LASF114
	.byte	0xb
	.byte	0x28
	.long	0x5ba
	.byte	0
	.uleb128 0x17
	.long	0x53
	.long	0x5f8
	.uleb128 0x18
	.long	0x30
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.long	.LASF115
	.byte	0xb
	.byte	0x29
	.long	0x5c5
	.uleb128 0x14
	.byte	0x4
	.long	0x94
	.byte	0xb
	.byte	0x2f
	.long	0x63a
	.uleb128 0xc
	.long	.LASF116
	.byte	0x1
	.uleb128 0xc
	.long	.LASF117
	.byte	0x2
	.uleb128 0xc
	.long	.LASF118
	.byte	0x4
	.uleb128 0xc
	.long	.LASF119
	.byte	0x8
	.uleb128 0xc
	.long	.LASF120
	.byte	0x10
	.uleb128 0xc
	.long	.LASF121
	.byte	0x20
	.uleb128 0xc
	.long	.LASF122
	.byte	0x40
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.long	0x94
	.byte	0xb
	.byte	0x39
	.long	0x67d
	.uleb128 0xc
	.long	.LASF123
	.byte	0
	.uleb128 0xc
	.long	.LASF124
	.byte	0x1
	.uleb128 0xc
	.long	.LASF125
	.byte	0x2
	.uleb128 0xc
	.long	.LASF126
	.byte	0x3
	.uleb128 0xc
	.long	.LASF127
	.byte	0x4
	.uleb128 0xc
	.long	.LASF128
	.byte	0x5
	.uleb128 0xc
	.long	.LASF129
	.byte	0x6
	.uleb128 0xc
	.long	.LASF130
	.byte	0x7
	.uleb128 0xc
	.long	.LASF131
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF132
	.byte	0xb
	.byte	0x43
	.long	0x63a
	.uleb128 0x6
	.long	.LASF133
	.byte	0xc
	.byte	0xb
	.byte	0x45
	.long	0x6b9
	.uleb128 0x7
	.long	.LASF134
	.byte	0xb
	.byte	0x46
	.long	0x67d
	.byte	0
	.uleb128 0x7
	.long	.LASF135
	.byte	0xb
	.byte	0x47
	.long	0x67d
	.byte	0x4
	.uleb128 0x7
	.long	.LASF136
	.byte	0xb
	.byte	0x48
	.long	0x67d
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF137
	.byte	0xb
	.byte	0x49
	.long	0x688
	.uleb128 0x6
	.long	.LASF138
	.byte	0x3
	.byte	0xb
	.byte	0x4b
	.long	0x6f5
	.uleb128 0x7
	.long	.LASF139
	.byte	0xb
	.byte	0x4c
	.long	0x6c
	.byte	0
	.uleb128 0x7
	.long	.LASF140
	.byte	0xb
	.byte	0x4d
	.long	0x6c
	.byte	0x1
	.uleb128 0x7
	.long	.LASF141
	.byte	0xb
	.byte	0x4e
	.long	0x6c
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.long	.LASF142
	.byte	0xb
	.byte	0x4f
	.long	0x6c4
	.uleb128 0x6
	.long	.LASF143
	.byte	0xc
	.byte	0xb
	.byte	0x51
	.long	0x725
	.uleb128 0x7
	.long	.LASF144
	.byte	0xb
	.byte	0x52
	.long	0x5f8
	.byte	0
	.uleb128 0x7
	.long	.LASF145
	.byte	0xb
	.byte	0x53
	.long	0x5f8
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.long	.LASF146
	.byte	0xb
	.byte	0x54
	.long	0x700
	.uleb128 0x19
	.long	.LASF147
	.byte	0x1
	.byte	0x4b
	.long	0x89
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.long	.LASF148
	.byte	0x1
	.byte	0x56
	.long	0x89
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.long	.LASF149
	.byte	0x1
	.byte	0x5c
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x796
	.uleb128 0x1c
	.long	.LASF151
	.byte	0x1
	.byte	0x6d
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x1d
	.long	.LASF172
	.byte	0x1
	.byte	0x75
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.long	.LASF150
	.byte	0x1
	.byte	0x7e
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x7da
	.uleb128 0x1e
	.string	"ms"
	.byte	0x1
	.byte	0x7e
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.long	.LASF152
	.byte	0x1
	.byte	0x31
	.long	0x89
	.uleb128 0x9
	.byte	0x3
	.quad	usTicks
	.uleb128 0x1c
	.long	.LASF153
	.byte	0x1
	.byte	0x36
	.long	0x804
	.uleb128 0x9
	.byte	0x3
	.quad	sysTickUptime
	.uleb128 0x1f
	.long	0x89
	.uleb128 0x20
	.long	.LASF154
	.byte	0xc
	.byte	0xc8
	.long	0x89
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x20
	.long	.LASF155
	.byte	0xc
	.byte	0xc9
	.long	0x89
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x20
	.long	.LASF156
	.byte	0xc
	.byte	0xca
	.long	0x89
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x20
	.long	.LASF157
	.byte	0xd
	.byte	0x2e
	.long	0x804
	.uleb128 0x9
	.byte	0x3
	.quad	receiveLength
	.uleb128 0x20
	.long	.LASF158
	.byte	0xa
	.byte	0x43
	.long	0x872
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0x8
	.byte	0x8
	.long	0x559
	.uleb128 0x20
	.long	.LASF159
	.byte	0xa
	.byte	0x44
	.long	0x872
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x20
	.long	.LASF160
	.byte	0xa
	.byte	0x47
	.long	0x54d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x20
	.long	.LASF161
	.byte	0xa
	.byte	0x48
	.long	0x54d
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x20
	.long	.LASF162
	.byte	0xb
	.byte	0x56
	.long	0x6f5
	.uleb128 0x9
	.byte	0x3
	.quad	sensorSelectionConfig_System
	.uleb128 0x20
	.long	.LASF163
	.byte	0xb
	.byte	0x57
	.long	0x6b9
	.uleb128 0x9
	.byte	0x3
	.quad	sensorAlignmentConfig_System
	.uleb128 0x20
	.long	.LASF164
	.byte	0xb
	.byte	0x58
	.long	0x725
	.uleb128 0x9
	.byte	0x3
	.quad	sensorTrims_System
	.uleb128 0x20
	.long	.LASF165
	.byte	0x1
	.byte	0x39
	.long	0xba
	.uleb128 0x9
	.byte	0x3
	.quad	start
	.uleb128 0x20
	.long	.LASF166
	.byte	0x1
	.byte	0x3a
	.long	0xba
	.uleb128 0x9
	.byte	0x3
	.quad	current
	.uleb128 0x21
	.string	"imu"
	.byte	0x1
	.byte	0x42
	.long	0x935
	.uleb128 0x9
	.byte	0x3
	.quad	imu
	.uleb128 0x8
	.byte	0x8
	.long	0x375
	.uleb128 0x21
	.string	"mag"
	.byte	0x1
	.byte	0x44
	.long	0x413
	.uleb128 0x9
	.byte	0x3
	.quad	mag
	.uleb128 0x21
	.string	"acc"
	.byte	0x1
	.byte	0x46
	.long	0x4af
	.uleb128 0x9
	.byte	0x3
	.quad	acc
	.uleb128 0x20
	.long	.LASF73
	.byte	0x1
	.byte	0x48
	.long	0x467
	.uleb128 0x9
	.byte	0x3
	.quad	gyro
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
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x6c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
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
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF63:
	.string	"mag_odr"
.LASF93:
	.string	"scale"
.LASF127:
	.string	"CW270_DEG"
.LASF57:
	.string	"A_ODR_50"
.LASF130:
	.string	"CW180_DEG_FLIP"
.LASF110:
	.string	"int16_flightDynamicsTrims_s"
.LASF82:
	.string	"sensorInitFuncPtr"
.LASF149:
	.string	"init_sensors"
.LASF108:
	.string	"SENSOR_INDEX_BARO"
.LASF143:
	.string	"sensorTrims_s"
.LASF146:
	.string	"sensorTrims_t"
.LASF32:
	.string	"M_SCALE_2GS"
.LASF88:
	.string	"init"
.LASF65:
	.string	"M_ODR_625"
.LASF161:
	.string	"__pg_resetdata_end"
.LASF129:
	.string	"CW90_DEG_FLIP"
.LASF123:
	.string	"ALIGN_DEFAULT"
.LASF61:
	.string	"A_ODR_800"
.LASF113:
	.string	"flightDynamicsTrims_def_t"
.LASF104:
	.string	"reset"
.LASF156:
	.string	"U_ID_2"
.LASF115:
	.string	"flightDynamicsTrims_t"
.LASF37:
	.string	"G_ODR_95_BW_125"
.LASF160:
	.string	"__pg_resetdata_start"
.LASF7:
	.string	"int16_t"
.LASF133:
	.string	"sensorAlignmentConfig_s"
.LASF4:
	.string	"signed char"
.LASF106:
	.string	"SENSOR_INDEX_GYRO"
.LASF102:
	.string	"size"
.LASF18:
	.string	"long long unsigned int"
.LASF79:
	.string	"mRes"
.LASF140:
	.string	"mag_hardware"
.LASF100:
	.string	"pgResetFunc"
.LASF47:
	.string	"G_ODR_760_BW_30"
.LASF19:
	.string	"mraa_i2c_context"
.LASF48:
	.string	"G_ODR_760_BW_35"
.LASF157:
	.string	"receiveLength"
.LASF6:
	.string	"long int"
.LASF55:
	.string	"A_ODR_125"
.LASF52:
	.string	"A_POWER_DOWN"
.LASF53:
	.string	"A_ODR_3125"
.LASF23:
	.string	"G_SCALE_2000DPS"
.LASF28:
	.string	"A_SCALE_6G"
.LASF125:
	.string	"CW90_DEG"
.LASF15:
	.string	"long long int"
.LASF10:
	.string	"uint16_t"
.LASF45:
	.string	"G_ODR_380_BW_50"
.LASF72:
	.string	"temperature"
.LASF171:
	.string	"flightDynamicsTrims_u"
.LASF40:
	.string	"G_ODR_190_BW_25"
.LASF71:
	.string	"LSM9DS0"
.LASF144:
	.string	"accZero"
.LASF46:
	.string	"G_ODR_380_BW_100"
.LASF22:
	.string	"G_SCALE_500DPS"
.LASF21:
	.string	"G_SCALE_245DPS"
.LASF148:
	.string	"millis"
.LASF54:
	.string	"A_ODR_625"
.LASF67:
	.string	"M_ODR_25"
.LASF139:
	.string	"acc_hardware"
.LASF162:
	.string	"sensorSelectionConfig_System"
.LASF12:
	.string	"unsigned int"
.LASF117:
	.string	"SENSOR_ACC"
.LASF81:
	.string	"LSM9DS0_t"
.LASF36:
	.string	"gyro_odr"
.LASF135:
	.string	"acc_align"
.LASF167:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF95:
	.string	"acc_s"
.LASF98:
	.string	"acc_t"
.LASF99:
	.string	"pgn_t"
.LASF0:
	.string	"long unsigned int"
.LASF84:
	.string	"sensorAccInitFuncPtr"
.LASF119:
	.string	"SENSOR_MAG"
.LASF60:
	.string	"A_ODR_400"
.LASF87:
	.string	"mag_s"
.LASF90:
	.string	"mag_t"
.LASF2:
	.string	"short unsigned int"
.LASF30:
	.string	"A_SCALE_16G"
.LASF62:
	.string	"A_ODR_1600"
.LASF124:
	.string	"CW0_DEG"
.LASF49:
	.string	"G_ODR_760_BW_50"
.LASF39:
	.string	"G_ODR_190_BW_125"
.LASF109:
	.string	"SENSOR_INDEX_MAG"
.LASF74:
	.string	"gScale"
.LASF159:
	.string	"__pg_registry_end"
.LASF29:
	.string	"A_SCALE_8G"
.LASF73:
	.string	"gyro"
.LASF78:
	.string	"aRes"
.LASF91:
	.string	"gyro_s"
.LASF94:
	.string	"gyro_t"
.LASF153:
	.string	"sysTickUptime"
.LASF17:
	.string	"tv_nsec"
.LASF1:
	.string	"sizetype"
.LASF122:
	.string	"SENSOR_GPSMAG"
.LASF24:
	.string	"gyro_scale"
.LASF103:
	.string	"address"
.LASF16:
	.string	"tv_sec"
.LASF14:
	.string	"__syscall_slong_t"
.LASF120:
	.string	"SENSOR_SONAR"
.LASF31:
	.string	"mag_scale"
.LASF112:
	.string	"pitch"
.LASF51:
	.string	"accel_odr"
.LASF75:
	.string	"aScale"
.LASF114:
	.string	"values"
.LASF85:
	.string	"sensorGyroInitFuncPtr"
.LASF158:
	.string	"__pg_registry_start"
.LASF166:
	.string	"current"
.LASF111:
	.string	"roll"
.LASF154:
	.string	"U_ID_0"
.LASF155:
	.string	"U_ID_1"
.LASF169:
	.string	"/home/aravind/git/cleanflight"
.LASF80:
	.string	"float"
.LASF138:
	.string	"sensorSelectionConfig_s"
.LASF126:
	.string	"CW180_DEG"
.LASF56:
	.string	"A_ODR_25"
.LASF41:
	.string	"G_ODR_190_BW_50"
.LASF20:
	.string	"_Bool"
.LASF9:
	.string	"unsigned char"
.LASF150:
	.string	"delay"
.LASF5:
	.string	"short int"
.LASF128:
	.string	"CW0_DEG_FLIP"
.LASF26:
	.string	"A_SCALE_2G"
.LASF118:
	.string	"SENSOR_BARO"
.LASF70:
	.string	"timespec"
.LASF152:
	.string	"usTicks"
.LASF33:
	.string	"M_SCALE_4GS"
.LASF69:
	.string	"M_ODR_100"
.LASF145:
	.string	"magZero"
.LASF96:
	.string	"acc_1G"
.LASF134:
	.string	"gyro_align"
.LASF11:
	.string	"uint32_t"
.LASF59:
	.string	"A_ODR_200"
.LASF50:
	.string	"G_ODR_760_BW_100"
.LASF101:
	.string	"pgRegistry_s"
.LASF105:
	.string	"pgRegistry_t"
.LASF92:
	.string	"isDataReady"
.LASF141:
	.string	"baro_hardware"
.LASF3:
	.string	"char"
.LASF132:
	.string	"sensor_align_e"
.LASF164:
	.string	"sensorTrims_System"
.LASF136:
	.string	"mag_align"
.LASF76:
	.string	"mScale"
.LASF116:
	.string	"SENSOR_GYRO"
.LASF170:
	.string	"_i2c"
.LASF44:
	.string	"G_ODR_380_BW_25"
.LASF86:
	.string	"sensorIsDataReadyFuncPtr"
.LASF68:
	.string	"M_ODR_50"
.LASF77:
	.string	"gRes"
.LASF151:
	.string	"imuResult"
.LASF97:
	.string	"revisionCode"
.LASF137:
	.string	"sensorAlignmentConfig_t"
.LASF43:
	.string	"G_ODR_380_BW_20"
.LASF172:
	.string	"systemInit"
.LASF13:
	.string	"__time_t"
.LASF121:
	.string	"SENSOR_GPS"
.LASF38:
	.string	"G_ODR_95_BW_25"
.LASF107:
	.string	"SENSOR_INDEX_ACC"
.LASF168:
	.string	"src/main/drivers/system.c"
.LASF42:
	.string	"G_ODR_190_BW_70"
.LASF8:
	.string	"uint8_t"
.LASF163:
	.string	"sensorAlignmentConfig_System"
.LASF58:
	.string	"A_ODR_100"
.LASF89:
	.string	"read"
.LASF25:
	.string	"accel_scale"
.LASF131:
	.string	"CW270_DEG_FLIP"
.LASF64:
	.string	"M_ODR_3125"
.LASF142:
	.string	"sensorSelectionConfig_t"
.LASF27:
	.string	"A_SCALE_4G"
.LASF165:
	.string	"start"
.LASF147:
	.string	"micros"
.LASF83:
	.string	"sensorReadFuncPtr"
.LASF34:
	.string	"M_SCALE_8GS"
.LASF66:
	.string	"M_ODR_125"
.LASF35:
	.string	"M_SCALE_12GS"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
