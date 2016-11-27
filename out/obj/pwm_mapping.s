	.file	"pwm_mapping.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed pwm_mapping.i -mtune=generic
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
	.comm	pwmRxConfig_System,4,4
	.section	.rodata.multiPPM,"a",@progbits
	.align 16
	.type	multiPPM, @object
	.size	multiPPM, 24
multiPPM:
	.value	256
	.value	776
	.value	777
	.value	778
	.value	779
	.value	780
	.value	781
	.value	772
	.value	773
	.value	774
	.value	775
	.value	-1
	.section	.rodata.multiPWM,"a",@progbits
	.align 16
	.type	multiPWM, @object
	.size	multiPWM, 30
multiPWM:
	.value	512
	.value	513
	.value	514
	.value	515
	.value	516
	.value	517
	.value	518
	.value	519
	.value	776
	.value	777
	.value	778
	.value	779
	.value	780
	.value	781
	.value	-1
	.section	.rodata.airPPM,"a",@progbits
	.align 16
	.type	airPPM, @object
	.size	airPPM, 24
airPPM:
	.value	256
	.value	776
	.value	777
	.value	1034
	.value	1035
	.value	1036
	.value	1037
	.value	1028
	.value	1029
	.value	1030
	.value	1031
	.value	-1
	.section	.rodata.airPWM,"a",@progbits
	.align 16
	.type	airPWM, @object
	.size	airPWM, 30
airPWM:
	.value	512
	.value	513
	.value	514
	.value	515
	.value	516
	.value	517
	.value	518
	.value	519
	.value	776
	.value	777
	.value	1034
	.value	1035
	.value	1036
	.value	1037
	.value	-1
	.section	.rodata.hardwareMaps,"a",@progbits
	.align 32
	.type	hardwareMaps, @object
	.size	hardwareMaps, 32
hardwareMaps:
	.quad	multiPWM
	.quad	multiPPM
	.quad	airPWM
	.quad	airPPM
	.section	.bss.pwmIOConfiguration,"aw",@nobits
	.align 32
	.type	pwmIOConfiguration, @object
	.size	pwmIOConfiguration, 184
pwmIOConfiguration:
	.zero	184
	.section	.text.pwmGetOutputConfiguration,"ax",@progbits
	.globl	pwmGetOutputConfiguration
	.type	pwmGetOutputConfiguration, @function
pwmGetOutputConfiguration:
.LFB11:
	.file 1 "src/main/drivers/pwm_mapping.c"
	.loc 1 684 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 685 0
	movl	$pwmIOConfiguration, %eax	#, D.5197
	.loc 1 686 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	pwmGetOutputConfiguration, .-pwmGetOutputConfiguration
	.section	.text.pwmInit,"ax",@progbits
	.globl	pwmInit
	.type	pwmInit, @function
pwmInit:
.LFB12:
	.loc 1 689 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# init, init
	.loc 1 690 0
	movl	$0, -24(%rbp)	#, i
	.loc 1 693 0
	movl	$0, -20(%rbp)	#, channelIndex
	.loc 1 696 0
	movl	$184, %edx	#,
	movl	$0, %esi	#,
	movl	$pwmIOConfiguration, %edi	#,
	call	memset	#
	.loc 1 699 0
	movq	-40(%rbp), %rax	# init, tmp161
	movzbl	9(%rax), %eax	# init_15(D)->airplane, D.5198
	testb	%al, %al	# D.5198
	je	.L4	#,
	.loc 1 700 0
	movl	$2, -24(%rbp)	#, i
.L4:
	.loc 1 701 0
	movq	-40(%rbp), %rax	# init, tmp162
	movzbl	1(%rax), %eax	# init_15(D)->usePPM, D.5198
	testb	%al, %al	# D.5198
	jne	.L5	#,
	.loc 1 701 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# init, tmp163
	movzbl	2(%rax), %eax	# init_15(D)->useSerialRx, D.5198
	testb	%al, %al	# D.5198
	je	.L6	#,
.L5:
	.loc 1 702 0 is_stmt 1
	addl	$1, -24(%rbp)	#, i
.L6:
	.loc 1 704 0
	movl	-24(%rbp), %eax	# i, tmp165
	cltq
	movq	hardwareMaps(,%rax,8), %rax	# hardwareMaps, tmp166
	movq	%rax, -16(%rbp)	# tmp166, setup
	.loc 1 706 0
	movl	$0, -24(%rbp)	#, i
	jmp	.L7	#
.L19:
.LBB2:
	.loc 1 707 0
	movl	-24(%rbp), %eax	# i, tmp167
	cltq
	leaq	(%rax,%rax), %rdx	#, D.5199
	movq	-16(%rbp), %rax	# setup, tmp168
	addq	%rdx, %rax	# D.5199, D.5200
	movzwl	(%rax), %eax	# *_29, D.5201
	movb	%al, -26(%rbp)	# D.5201, timerIndex
	.loc 1 708 0
	movl	-24(%rbp), %eax	# i, tmp169
	cltq
	leaq	(%rax,%rax), %rdx	#, D.5199
	movq	-16(%rbp), %rax	# setup, tmp170
	addq	%rdx, %rax	# D.5199, D.5200
	movzwl	(%rax), %eax	# *_34, D.5201
	shrw	$8, %ax	#, D.5201
	movb	%al, -25(%rbp)	# D.5201, type
	.loc 1 711 0
	movq	$0, -8(%rbp)	#, timerHardwarePtr
	.loc 1 716 0
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp171
	movq	16(%rax), %rax	# timerHardwarePtr_38->gpio, D.5202
	movw	$2, (%rax)	#, _39->pin
	.loc 1 717 0
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp172
	movq	16(%rax), %rax	# timerHardwarePtr_38->gpio, D.5202
	movl	$2, 16(%rax)	#, _41->mode
	.loc 1 718 0
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp173
	movq	16(%rax), %rax	# timerHardwarePtr_38->gpio, D.5202
	movl	$2, 20(%rax)	#, _43->speed
	.loc 1 821 0
	cmpb	$2, -25(%rbp)	#, type
	jne	.L8	#,
	.loc 1 821 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# init, tmp174
	movzbl	(%rax), %eax	# init_15(D)->useParallelPWM, D.5198
	xorl	$1, %eax	#, D.5198
	testb	%al, %al	# D.5198
	jne	.L21	#,
.L8:
	.loc 1 824 0 is_stmt 1
	cmpb	$1, -25(%rbp)	#, type
	jne	.L10	#,
	.loc 1 824 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# init, tmp175
	movzbl	1(%rax), %eax	# init_15(D)->usePPM, D.5198
	xorl	$1, %eax	#, D.5198
	testb	%al, %al	# D.5198
	jne	.L22	#,
.L10:
	.loc 1 928 0 is_stmt 1
	cmpb	$1, -25(%rbp)	#, type
	jne	.L11	#,
	.loc 1 934 0
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp176
	movq	%rax, %rdi	# tmp176,
	call	ppmInConfig	#
	.loc 1 935 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	movzbl	%al, %eax	# D.5203, D.5204
	cltq
	salq	$4, %rax	#, tmp178
	addq	$pwmIOConfiguration+12, %rax	#, tmp179
	movl	$32, (%rax)	#, pwmIOConfiguration.ioConfigurations[_110].flags
	.loc 1 936 0
	movzbl	pwmIOConfiguration+4(%rip), %eax	# pwmIOConfiguration.ppmInputCount, D.5203
	addl	$1, %eax	#, D.5203
	movb	%al, pwmIOConfiguration+4(%rip)	# D.5203, pwmIOConfiguration.ppmInputCount
	jmp	.L12	#
.L11:
	.loc 1 937 0
	cmpb	$2, -25(%rbp)	#, type
	jne	.L13	#,
	.loc 1 938 0
	movl	-20(%rbp), %eax	# channelIndex, tmp180
	movzbl	%al, %edx	# D.5203, D.5204
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp181
	movl	%edx, %esi	# D.5204,
	movq	%rax, %rdi	# tmp181,
	call	pwmInConfig	#
	.loc 1 939 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	movzbl	%al, %eax	# D.5203, D.5204
	cltq
	salq	$4, %rax	#, tmp183
	addq	$pwmIOConfiguration+12, %rax	#, tmp184
	movl	$64, (%rax)	#, pwmIOConfiguration.ioConfigurations[_101].flags
	.loc 1 940 0
	movzbl	pwmIOConfiguration+3(%rip), %eax	# pwmIOConfiguration.pwmInputCount, D.5203
	addl	$1, %eax	#, D.5203
	movb	%al, pwmIOConfiguration+3(%rip)	# D.5203, pwmIOConfiguration.pwmInputCount
	.loc 1 941 0
	addl	$1, -20(%rbp)	#, channelIndex
	jmp	.L12	#
.L13:
	.loc 1 942 0
	cmpb	$3, -25(%rbp)	#, type
	jne	.L14	#,
	.loc 1 950 0
	movq	-40(%rbp), %rax	# init, tmp185
	movzbl	6(%rax), %eax	# init_15(D)->useOneshot, D.5198
	testb	%al, %al	# D.5198
	je	.L15	#,
	.loc 1 952 0
	movzbl	pwmIOConfiguration+1(%rip), %eax	# pwmIOConfiguration.motorCount, D.5203
	movzbl	%al, %edx	# D.5203, D.5204
	movq	-40(%rbp), %rax	# init, tmp186
	movzwl	24(%rax), %eax	# init_15(D)->pwm_gpio_config.pin, D.5201
	movzwl	%ax, %eax	# D.5201, D.5205
	movl	%edx, %esi	# D.5204,
	movl	%eax, %edi	# D.5205,
	call	pwmOneshotMotorConfig	#
	.loc 1 953 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	movzbl	%al, %eax	# D.5203, D.5204
	cltq
	salq	$4, %rax	#, tmp188
	addq	$pwmIOConfiguration+12, %rax	#, tmp189
	movl	$25, (%rax)	#, pwmIOConfiguration.ioConfigurations[_56].flags
	jmp	.L16	#
.L15:
	.loc 1 955 0
	movq	-40(%rbp), %rax	# init, tmp190
	movzwl	10(%rax), %eax	# init_15(D)->motorPwmRate, D.5201
	movzwl	%ax, %eax	# D.5201, D.5204
	movl	%eax, %edi	# D.5204,
	call	isMotorBrushed	#
	testb	%al, %al	# D.5198
	je	.L17	#,
	.loc 1 957 0
	movq	-40(%rbp), %rax	# init, tmp191
	movzwl	12(%rax), %eax	# init_15(D)->idlePulse, D.5201
	movzwl	%ax, %ecx	# D.5201, D.5204
	movq	-40(%rbp), %rax	# init, tmp192
	movzwl	10(%rax), %eax	# init_15(D)->motorPwmRate, D.5201
	movzwl	%ax, %edx	# D.5201, D.5204
	movzbl	pwmIOConfiguration+1(%rip), %eax	# pwmIOConfiguration.motorCount, D.5203
	movzbl	%al, %esi	# D.5203, D.5204
	movq	-40(%rbp), %rax	# init, tmp193
	movzwl	24(%rax), %eax	# init_15(D)->pwm_gpio_config.pin, D.5201
	movzwl	%ax, %eax	# D.5201, D.5205
	movl	%eax, %edi	# D.5205,
	call	pwmBrushedMotorConfig	#
	.loc 1 958 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	movzbl	%al, %eax	# D.5203, D.5204
	cltq
	salq	$4, %rax	#, tmp195
	addq	$pwmIOConfiguration+12, %rax	#, tmp196
	movl	$13, (%rax)	#, pwmIOConfiguration.ioConfigurations[_72].flags
	jmp	.L16	#
.L17:
	.loc 1 962 0
	movq	-40(%rbp), %rax	# init, tmp197
	movzwl	12(%rax), %eax	# init_15(D)->idlePulse, D.5201
	movzwl	%ax, %ecx	# D.5201, D.5204
	movq	-40(%rbp), %rax	# init, tmp198
	movzwl	10(%rax), %eax	# init_15(D)->motorPwmRate, D.5201
	movzwl	%ax, %edx	# D.5201, D.5204
	movzbl	pwmIOConfiguration+1(%rip), %eax	# pwmIOConfiguration.motorCount, D.5203
	movzbl	%al, %esi	# D.5203, D.5204
	movq	-40(%rbp), %rax	# init, tmp199
	movzwl	24(%rax), %eax	# init_15(D)->pwm_gpio_config.pin, D.5201
	movzwl	%ax, %eax	# D.5201, D.5205
	movl	%eax, %edi	# D.5205,
	call	pwmBrushlessMotorConfig	#
	.loc 1 963 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	movzbl	%al, %eax	# D.5203, D.5204
	cltq
	salq	$4, %rax	#, tmp201
	addq	$pwmIOConfiguration+12, %rax	#, tmp202
	movl	$9, (%rax)	#, pwmIOConfiguration.ioConfigurations[_84].flags
.L16:
	.loc 1 966 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	movzbl	%al, %edx	# D.5203, D.5204
	movzbl	pwmIOConfiguration+1(%rip), %eax	# pwmIOConfiguration.motorCount, D.5203
	movslq	%edx, %rdx	# D.5204, tmp203
	salq	$4, %rdx	#, tmp204
	addq	$pwmIOConfiguration+8, %rdx	#, tmp205
	movb	%al, (%rdx)	# D.5203, pwmIOConfiguration.ioConfigurations[_87].index
	.loc 1 967 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	movzbl	%al, %eax	# D.5203, D.5204
	cltq
	salq	$4, %rax	#, tmp207
	leaq	pwmIOConfiguration+16(%rax), %rdx	#, tmp208
	movq	-8(%rbp), %rax	# timerHardwarePtr, tmp209
	movq	%rax, (%rdx)	# tmp209, pwmIOConfiguration.ioConfigurations[_91].timerHardware
	.loc 1 969 0
	movzbl	pwmIOConfiguration+1(%rip), %eax	# pwmIOConfiguration.motorCount, D.5203
	addl	$1, %eax	#, D.5203
	movb	%al, pwmIOConfiguration+1(%rip)	# D.5203, pwmIOConfiguration.motorCount
	jmp	.L12	#
.L14:
	.loc 1 971 0
	cmpb	$4, -25(%rbp)	#, type
	jne	.L23	#,
.L12:
	.loc 1 985 0
	movzbl	pwmIOConfiguration+2(%rip), %eax	# pwmIOConfiguration.ioCount, D.5203
	addl	$1, %eax	#, D.5203
	movb	%al, pwmIOConfiguration+2(%rip)	# D.5203, pwmIOConfiguration.ioCount
	jmp	.L9	#
.L21:
	.loc 1 822 0
	nop
	jmp	.L9	#
.L22:
	.loc 1 825 0
	nop
	jmp	.L9	#
.L23:
	.loc 1 982 0
	nop
.L9:
.LBE2:
	.loc 1 706 0 discriminator 2
	addl	$1, -24(%rbp)	#, i
.L7:
	.loc 1 706 0 is_stmt 0 discriminator 1
	cmpl	$10, -24(%rbp)	#, i
	jg	.L18	#,
	.loc 1 706 0 discriminator 3
	movl	-24(%rbp), %eax	# i, tmp210
	cltq
	leaq	(%rax,%rax), %rdx	#, D.5199
	movq	-16(%rbp), %rax	# setup, tmp211
	addq	%rdx, %rax	# D.5199, D.5200
	movzwl	(%rax), %eax	# *_25, D.5201
	cmpw	$-1, %ax	#, D.5201
	jne	.L19	#,
.L18:
	.loc 1 988 0 is_stmt 1
	movl	$pwmIOConfiguration, %eax	#, D.5206
	.loc 1 989 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	pwmInit, .-pwmInit
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "./src/main/config/parameter_group.h"
	.file 4 "/usr/include/mraa/gpio.h"
	.file 5 "src/main/drivers/gpio.h"
	.file 6 "./src/main/drivers/timer_setup.h"
	.file 7 "src/main/drivers/pwm_rx.h"
	.file 8 "src/main/drivers/pwm_mapping.h"
	.file 9 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x770
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF124
	.byte	0xc
	.long	.LASF125
	.long	.LASF126
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x4
	.long	.LASF4
	.byte	0x2
	.byte	0x30
	.long	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x2
	.byte	0x31
	.long	0x62
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x33
	.long	0x74
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
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x15
	.long	0x57
	.uleb128 0x4
	.long	.LASF15
	.byte	0x3
	.byte	0x26
	.long	0xb6
	.uleb128 0x6
	.long	0xc6
	.uleb128 0x7
	.long	0x90
	.uleb128 0x7
	.long	0x37
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.long	0xe4
	.uleb128 0x9
	.string	"ptr"
	.byte	0x3
	.byte	0x2e
	.long	0x90
	.uleb128 0x9
	.string	"fn"
	.byte	0x3
	.byte	0x2f
	.long	0xe4
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0xab
	.uleb128 0xb
	.long	.LASF24
	.byte	0x20
	.byte	0x3
	.byte	0x28
	.long	0x133
	.uleb128 0xc
	.string	"pgn"
	.byte	0x3
	.byte	0x29
	.long	0xa0
	.byte	0
	.uleb128 0xd
	.long	.LASF16
	.byte	0x3
	.byte	0x2a
	.long	0x57
	.byte	0x2
	.uleb128 0xd
	.long	.LASF17
	.byte	0x3
	.byte	0x2b
	.long	0x133
	.byte	0x8
	.uleb128 0xc
	.string	"ptr"
	.byte	0x3
	.byte	0x2c
	.long	0x139
	.byte	0x10
	.uleb128 0xd
	.long	.LASF18
	.byte	0x3
	.byte	0x30
	.long	0xc6
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x45
	.uleb128 0xa
	.byte	0x8
	.long	0x133
	.uleb128 0x4
	.long	.LASF19
	.byte	0x3
	.byte	0x31
	.long	0xea
	.uleb128 0x4
	.long	.LASF20
	.byte	0x4
	.byte	0x37
	.long	0x155
	.uleb128 0xa
	.byte	0x8
	.long	0x15b
	.uleb128 0xe
	.long	.LASF127
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x5
	.byte	0x4e
	.long	0x17e
	.uleb128 0x10
	.string	"In"
	.byte	0
	.uleb128 0x10
	.string	"Out"
	.byte	0x1
	.uleb128 0x10
	.string	"PWM"
	.byte	0x2
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x5
	.byte	0x56
	.long	0x19d
	.uleb128 0x11
	.long	.LASF21
	.byte	0x1
	.uleb128 0x11
	.long	.LASF22
	.byte	0x2
	.uleb128 0x11
	.long	.LASF23
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	.LASF25
	.byte	0x18
	.byte	0x5
	.byte	0x79
	.long	0x1da
	.uleb128 0xc
	.string	"pin"
	.byte	0x5
	.byte	0x7b
	.long	0x57
	.byte	0
	.uleb128 0xd
	.long	.LASF26
	.byte	0x5
	.byte	0x7c
	.long	0x14a
	.byte	0x8
	.uleb128 0xd
	.long	.LASF27
	.byte	0x5
	.byte	0x7d
	.long	0x37
	.byte	0x10
	.uleb128 0xd
	.long	.LASF28
	.byte	0x5
	.byte	0x7e
	.long	0x37
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.long	.LASF29
	.byte	0x5
	.byte	0x7f
	.long	0x19d
	.uleb128 0x12
	.byte	0
	.byte	0x6
	.byte	0x12
	.uleb128 0x4
	.long	.LASF30
	.byte	0x6
	.byte	0x12
	.long	0x1e5
	.uleb128 0x13
	.byte	0x18
	.byte	0x6
	.byte	0x15
	.long	0x221
	.uleb128 0xd
	.long	.LASF31
	.byte	0x6
	.byte	0x16
	.long	0x45
	.byte	0
	.uleb128 0xc
	.string	"tim"
	.byte	0x6
	.byte	0x17
	.long	0x221
	.byte	0x8
	.uleb128 0xd
	.long	.LASF32
	.byte	0x6
	.byte	0x18
	.long	0x227
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x1e9
	.uleb128 0xa
	.byte	0x8
	.long	0x1da
	.uleb128 0x4
	.long	.LASF33
	.byte	0x6
	.byte	0x19
	.long	0x1f4
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x7
	.byte	0x14
	.long	0x251
	.uleb128 0x11
	.long	.LASF34
	.byte	0
	.uleb128 0x11
	.long	.LASF35
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.long	.LASF36
	.byte	0x7
	.byte	0x17
	.long	0x238
	.uleb128 0xb
	.long	.LASF37
	.byte	0x4
	.byte	0x7
	.byte	0x19
	.long	0x275
	.uleb128 0xd
	.long	.LASF38
	.byte	0x7
	.byte	0x1a
	.long	0x251
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF39
	.byte	0x7
	.byte	0x1b
	.long	0x25c
	.uleb128 0xb
	.long	.LASF40
	.byte	0x20
	.byte	0x8
	.byte	0x35
	.long	0x2bd
	.uleb128 0xd
	.long	.LASF41
	.byte	0x8
	.byte	0x36
	.long	0x227
	.byte	0
	.uleb128 0xd
	.long	.LASF42
	.byte	0x8
	.byte	0x37
	.long	0x57
	.byte	0x8
	.uleb128 0xd
	.long	.LASF43
	.byte	0x8
	.byte	0x38
	.long	0x227
	.byte	0x10
	.uleb128 0xd
	.long	.LASF44
	.byte	0x8
	.byte	0x39
	.long	0x57
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF45
	.byte	0x8
	.byte	0x3a
	.long	0x280
	.uleb128 0xb
	.long	.LASF46
	.byte	0x30
	.byte	0x8
	.byte	0x3c
	.long	0x37d
	.uleb128 0xd
	.long	.LASF47
	.byte	0x8
	.byte	0x3d
	.long	0x37d
	.byte	0
	.uleb128 0xd
	.long	.LASF48
	.byte	0x8
	.byte	0x3e
	.long	0x37d
	.byte	0x1
	.uleb128 0xd
	.long	.LASF49
	.byte	0x8
	.byte	0x3f
	.long	0x37d
	.byte	0x2
	.uleb128 0xd
	.long	.LASF50
	.byte	0x8
	.byte	0x40
	.long	0x37d
	.byte	0x3
	.uleb128 0xd
	.long	.LASF51
	.byte	0x8
	.byte	0x41
	.long	0x37d
	.byte	0x4
	.uleb128 0xd
	.long	.LASF52
	.byte	0x8
	.byte	0x4e
	.long	0x37d
	.byte	0x5
	.uleb128 0xd
	.long	.LASF53
	.byte	0x8
	.byte	0x4f
	.long	0x37d
	.byte	0x6
	.uleb128 0xd
	.long	.LASF54
	.byte	0x8
	.byte	0x50
	.long	0x37d
	.byte	0x7
	.uleb128 0xd
	.long	.LASF55
	.byte	0x8
	.byte	0x51
	.long	0x37d
	.byte	0x8
	.uleb128 0xd
	.long	.LASF56
	.byte	0x8
	.byte	0x5b
	.long	0x37d
	.byte	0x9
	.uleb128 0xd
	.long	.LASF57
	.byte	0x8
	.byte	0x5c
	.long	0x57
	.byte	0xa
	.uleb128 0xd
	.long	.LASF58
	.byte	0x8
	.byte	0x5d
	.long	0x57
	.byte	0xc
	.uleb128 0xd
	.long	.LASF59
	.byte	0x8
	.byte	0x5f
	.long	0x384
	.byte	0x10
	.uleb128 0xd
	.long	.LASF60
	.byte	0x8
	.byte	0x61
	.long	0x1da
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF61
	.uleb128 0xa
	.byte	0x8
	.long	0x2bd
	.uleb128 0x4
	.long	.LASF62
	.byte	0x8
	.byte	0x63
	.long	0x2c8
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x8
	.byte	0x66
	.long	0x3d2
	.uleb128 0x11
	.long	.LASF63
	.byte	0
	.uleb128 0x11
	.long	.LASF64
	.byte	0x1
	.uleb128 0x11
	.long	.LASF65
	.byte	0x2
	.uleb128 0x11
	.long	.LASF66
	.byte	0x4
	.uleb128 0x11
	.long	.LASF67
	.byte	0x8
	.uleb128 0x11
	.long	.LASF68
	.byte	0x10
	.uleb128 0x11
	.long	.LASF69
	.byte	0x20
	.uleb128 0x11
	.long	.LASF70
	.byte	0x40
	.byte	0
	.uleb128 0x4
	.long	.LASF71
	.byte	0x8
	.byte	0x6f
	.long	0x395
	.uleb128 0xb
	.long	.LASF72
	.byte	0x10
	.byte	0x8
	.byte	0x72
	.long	0x40e
	.uleb128 0xd
	.long	.LASF73
	.byte	0x8
	.byte	0x73
	.long	0x45
	.byte	0
	.uleb128 0xd
	.long	.LASF74
	.byte	0x8
	.byte	0x74
	.long	0x3d2
	.byte	0x4
	.uleb128 0xd
	.long	.LASF75
	.byte	0x8
	.byte	0x75
	.long	0x40e
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x414
	.uleb128 0x14
	.long	0x22d
	.uleb128 0x4
	.long	.LASF76
	.byte	0x8
	.byte	0x76
	.long	0x3dd
	.uleb128 0xb
	.long	.LASF77
	.byte	0xb8
	.byte	0x8
	.byte	0x78
	.long	0x479
	.uleb128 0xd
	.long	.LASF78
	.byte	0x8
	.byte	0x79
	.long	0x45
	.byte	0
	.uleb128 0xd
	.long	.LASF79
	.byte	0x8
	.byte	0x7a
	.long	0x45
	.byte	0x1
	.uleb128 0xd
	.long	.LASF80
	.byte	0x8
	.byte	0x7b
	.long	0x45
	.byte	0x2
	.uleb128 0xd
	.long	.LASF81
	.byte	0x8
	.byte	0x7c
	.long	0x45
	.byte	0x3
	.uleb128 0xd
	.long	.LASF82
	.byte	0x8
	.byte	0x7d
	.long	0x45
	.byte	0x4
	.uleb128 0xd
	.long	.LASF83
	.byte	0x8
	.byte	0x7e
	.long	0x479
	.byte	0x8
	.byte	0
	.uleb128 0x15
	.long	0x419
	.long	0x489
	.uleb128 0x16
	.long	0x82
	.byte	0xa
	.byte	0
	.uleb128 0x4
	.long	.LASF84
	.byte	0x8
	.byte	0x7f
	.long	0x424
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x8
	.byte	0x82
	.long	0x501
	.uleb128 0x11
	.long	.LASF85
	.byte	0
	.uleb128 0x11
	.long	.LASF86
	.byte	0x1
	.uleb128 0x11
	.long	.LASF87
	.byte	0x2
	.uleb128 0x11
	.long	.LASF88
	.byte	0x3
	.uleb128 0x11
	.long	.LASF89
	.byte	0x4
	.uleb128 0x11
	.long	.LASF90
	.byte	0x5
	.uleb128 0x11
	.long	.LASF91
	.byte	0x6
	.uleb128 0x11
	.long	.LASF92
	.byte	0x7
	.uleb128 0x11
	.long	.LASF93
	.byte	0x8
	.uleb128 0x11
	.long	.LASF94
	.byte	0x9
	.uleb128 0x11
	.long	.LASF95
	.byte	0xa
	.uleb128 0x11
	.long	.LASF96
	.byte	0xb
	.uleb128 0x11
	.long	.LASF97
	.byte	0xc
	.uleb128 0x11
	.long	.LASF98
	.byte	0xd
	.uleb128 0x11
	.long	.LASF99
	.byte	0xe
	.uleb128 0x11
	.long	.LASF100
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x1
	.byte	0x53
	.long	0x526
	.uleb128 0x11
	.long	.LASF101
	.byte	0x1
	.uleb128 0x11
	.long	.LASF102
	.byte	0x2
	.uleb128 0x11
	.long	.LASF103
	.byte	0x3
	.uleb128 0x11
	.long	.LASF104
	.byte	0x4
	.byte	0
	.uleb128 0x17
	.long	.LASF128
	.byte	0x1
	.value	0x2ac
	.long	0x544
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.byte	0x8
	.long	0x489
	.uleb128 0x18
	.long	.LASF129
	.byte	0x1
	.value	0x2b0
	.long	0x544
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e6
	.uleb128 0x19
	.long	.LASF130
	.byte	0x1
	.value	0x2b0
	.long	0x5e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.value	0x2b2
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.long	.LASF105
	.byte	0x1
	.value	0x2b3
	.long	0x5ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.long	.LASF106
	.byte	0x1
	.value	0x2b5
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x1b
	.long	.LASF107
	.byte	0x1
	.value	0x2c3
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -42
	.uleb128 0x1b
	.long	.LASF108
	.byte	0x1
	.value	0x2c4
	.long	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -41
	.uleb128 0x1b
	.long	.LASF109
	.byte	0x1
	.value	0x2c7
	.long	0x40e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x38a
	.uleb128 0xa
	.byte	0x8
	.long	0x5f2
	.uleb128 0x14
	.long	0x57
	.uleb128 0x15
	.long	0x5f2
	.long	0x607
	.uleb128 0x16
	.long	0x82
	.byte	0xb
	.byte	0
	.uleb128 0x1d
	.long	.LASF110
	.byte	0x1
	.byte	0x5b
	.long	0x61c
	.uleb128 0x9
	.byte	0x3
	.quad	multiPPM
	.uleb128 0x14
	.long	0x5f7
	.uleb128 0x15
	.long	0x5f2
	.long	0x631
	.uleb128 0x16
	.long	0x82
	.byte	0xe
	.byte	0
	.uleb128 0x1d
	.long	.LASF111
	.byte	0x1
	.byte	0x6a
	.long	0x646
	.uleb128 0x9
	.byte	0x3
	.quad	multiPWM
	.uleb128 0x14
	.long	0x621
	.uleb128 0x1d
	.long	.LASF112
	.byte	0x1
	.byte	0x7c
	.long	0x660
	.uleb128 0x9
	.byte	0x3
	.quad	airPPM
	.uleb128 0x14
	.long	0x5f7
	.uleb128 0x1d
	.long	.LASF113
	.byte	0x1
	.byte	0x8b
	.long	0x67a
	.uleb128 0x9
	.byte	0x3
	.quad	airPWM
	.uleb128 0x14
	.long	0x621
	.uleb128 0x15
	.long	0x68f
	.long	0x68f
	.uleb128 0x16
	.long	0x82
	.byte	0x3
	.byte	0
	.uleb128 0x14
	.long	0x5ec
	.uleb128 0x1b
	.long	.LASF114
	.byte	0x1
	.value	0x2a3
	.long	0x6aa
	.uleb128 0x9
	.byte	0x3
	.quad	hardwareMaps
	.uleb128 0x14
	.long	0x67f
	.uleb128 0x1b
	.long	.LASF115
	.byte	0x1
	.value	0x2aa
	.long	0x489
	.uleb128 0x9
	.byte	0x3
	.quad	pwmIOConfiguration
	.uleb128 0x1e
	.long	.LASF116
	.byte	0x9
	.byte	0xc8
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x1e
	.long	.LASF117
	.byte	0x9
	.byte	0xc9
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x1e
	.long	.LASF118
	.byte	0x9
	.byte	0xca
	.long	0x69
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
	.uleb128 0x1e
	.long	.LASF119
	.byte	0x3
	.byte	0x43
	.long	0x719
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_start
	.uleb128 0xa
	.byte	0x8
	.long	0x13f
	.uleb128 0x1e
	.long	.LASF120
	.byte	0x3
	.byte	0x44
	.long	0x719
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_registry_end
	.uleb128 0x1e
	.long	.LASF121
	.byte	0x3
	.byte	0x47
	.long	0x133
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_start
	.uleb128 0x1e
	.long	.LASF122
	.byte	0x3
	.byte	0x48
	.long	0x133
	.uleb128 0x9
	.byte	0x3
	.quad	__pg_resetdata_end
	.uleb128 0x1e
	.long	.LASF123
	.byte	0x7
	.byte	0x1d
	.long	0x275
	.uleb128 0x9
	.byte	0x3
	.quad	pwmRxConfig_System
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB11
	.quad	.LFE11
	.quad	.LFB12
	.quad	.LFE12
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"reset"
.LASF115:
	.string	"pwmIOConfiguration"
.LASF33:
	.string	"timerHardware_t"
.LASF15:
	.string	"pgResetFunc"
.LASF67:
	.string	"PWM_PF_OUTPUT_PROTOCOL_PWM"
.LASF79:
	.string	"motorCount"
.LASF108:
	.string	"type"
.LASF29:
	.string	"GPIO_TypeDef"
.LASF130:
	.string	"init"
.LASF30:
	.string	"TIM_TypeDef"
.LASF63:
	.string	"PWM_PF_NONE"
.LASF13:
	.string	"long long unsigned int"
.LASF21:
	.string	"Speed_10MHz"
.LASF125:
	.string	"src/main/drivers/pwm_mapping.c"
.LASF78:
	.string	"servoCount"
.LASF118:
	.string	"U_ID_2"
.LASF22:
	.string	"Speed_2MHz"
.LASF121:
	.string	"__pg_resetdata_start"
.LASF12:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF76:
	.string	"pwmPortConfiguration_t"
.LASF35:
	.string	"INPUT_FILTERING_ENABLED"
.LASF123:
	.string	"pwmRxConfig_System"
.LASF86:
	.string	"PWM2"
.LASF87:
	.string	"PWM3"
.LASF89:
	.string	"PWM5"
.LASF90:
	.string	"PWM6"
.LASF91:
	.string	"PWM7"
.LASF92:
	.string	"PWM8"
.LASF93:
	.string	"PWM9"
.LASF2:
	.string	"long int"
.LASF81:
	.string	"pwmInputCount"
.LASF129:
	.string	"pwmInit"
.LASF80:
	.string	"ioCount"
.LASF5:
	.string	"uint16_t"
.LASF60:
	.string	"pwm_gpio_config"
.LASF128:
	.string	"pwmGetOutputConfiguration"
.LASF40:
	.string	"sonarGPIOConfig_s"
.LASF45:
	.string	"sonarGPIOConfig_t"
.LASF36:
	.string	"inputFilteringMode_e"
.LASF109:
	.string	"timerHardwarePtr"
.LASF55:
	.string	"useLEDStrip"
.LASF50:
	.string	"useRSSIADC"
.LASF64:
	.string	"PWM_PF_MOTOR"
.LASF8:
	.string	"unsigned int"
.LASF56:
	.string	"airplane"
.LASF107:
	.string	"timerIndex"
.LASF44:
	.string	"echoPin"
.LASF52:
	.string	"useVbat"
.LASF124:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF70:
	.string	"PWM_PF_PWM"
.LASF14:
	.string	"pgn_t"
.LASF9:
	.string	"long unsigned int"
.LASF20:
	.string	"mraa_gpio_context"
.LASF53:
	.string	"useOneshot"
.LASF110:
	.string	"multiPPM"
.LASF75:
	.string	"timerHardware"
.LASF16:
	.string	"size"
.LASF6:
	.string	"short unsigned int"
.LASF62:
	.string	"drv_pwm_config_t"
.LASF103:
	.string	"MAP_TO_MOTOR_OUTPUT"
.LASF83:
	.string	"ioConfigurations"
.LASF120:
	.string	"__pg_registry_end"
.LASF54:
	.string	"useSoftSerial"
.LASF10:
	.string	"sizetype"
.LASF43:
	.string	"echoGPIO"
.LASF82:
	.string	"ppmInputCount"
.LASF17:
	.string	"address"
.LASF51:
	.string	"useCurrentMeterADC"
.LASF105:
	.string	"setup"
.LASF113:
	.string	"airPWM"
.LASF122:
	.string	"__pg_resetdata_end"
.LASF119:
	.string	"__pg_registry_start"
.LASF102:
	.string	"MAP_TO_PWM_INPUT"
.LASF116:
	.string	"U_ID_0"
.LASF117:
	.string	"U_ID_1"
.LASF126:
	.string	"/home/aravind/git/cleanflight"
.LASF127:
	.string	"_gpio"
.LASF47:
	.string	"useParallelPWM"
.LASF23:
	.string	"Speed_50MHz"
.LASF71:
	.string	"pwmPortFlags_e"
.LASF61:
	.string	"_Bool"
.LASF72:
	.string	"pwmPortConfiguration_s"
.LASF3:
	.string	"unsigned char"
.LASF112:
	.string	"airPPM"
.LASF114:
	.string	"hardwareMaps"
.LASF42:
	.string	"triggerPin"
.LASF57:
	.string	"motorPwmRate"
.LASF1:
	.string	"short int"
.LASF85:
	.string	"PWM1"
.LASF88:
	.string	"PWM4"
.LASF49:
	.string	"useSerialRx"
.LASF101:
	.string	"MAP_TO_PPM_INPUT"
.LASF31:
	.string	"channel"
.LASF106:
	.string	"channelIndex"
.LASF7:
	.string	"uint32_t"
.LASF34:
	.string	"INPUT_FILTERING_DISABLED"
.LASF38:
	.string	"inputFilteringMode"
.LASF24:
	.string	"pgRegistry_s"
.LASF19:
	.string	"pgRegistry_t"
.LASF65:
	.string	"PWM_PF_SERVO"
.LASF11:
	.string	"char"
.LASF27:
	.string	"mode"
.LASF94:
	.string	"PWM10"
.LASF95:
	.string	"PWM11"
.LASF96:
	.string	"PWM12"
.LASF97:
	.string	"PWM13"
.LASF98:
	.string	"PWM14"
.LASF99:
	.string	"PWM15"
.LASF100:
	.string	"PWM16"
.LASF73:
	.string	"index"
.LASF104:
	.string	"MAP_TO_SERVO_OUTPUT"
.LASF59:
	.string	"sonarGPIOConfig"
.LASF26:
	.string	"context"
.LASF111:
	.string	"multiPWM"
.LASF58:
	.string	"idlePulse"
.LASF25:
	.string	"GPIO_TypeDef_s"
.LASF69:
	.string	"PWM_PF_PPM"
.LASF68:
	.string	"PWM_PF_OUTPUT_PROTOCOL_ONESHOT"
.LASF77:
	.string	"pwmIOConfiguration_s"
.LASF84:
	.string	"pwmIOConfiguration_t"
.LASF37:
	.string	"pwmRxConfig_s"
.LASF39:
	.string	"pwmRxConfig_t"
.LASF4:
	.string	"uint8_t"
.LASF74:
	.string	"flags"
.LASF48:
	.string	"usePPM"
.LASF32:
	.string	"gpio"
.LASF66:
	.string	"PWM_PF_MOTOR_MODE_BRUSHED"
.LASF28:
	.string	"speed"
.LASF41:
	.string	"triggerGPIO"
.LASF46:
	.string	"drv_pwm_config_s"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
