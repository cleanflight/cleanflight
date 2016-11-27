	.file	"gpio_edison.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed gpio_edison.i -mtune=generic
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
	.section	.text.gpioInit,"ax",@progbits
	.globl	gpioInit
	.type	gpioInit, @function
gpioInit:
.LFB6:
	.file 1 "src/main/drivers/gpio_edison.c"
	.loc 1 27 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# gpio, gpio
	.loc 1 28 0
	movq	-8(%rbp), %rax	# gpio, tmp94
	movzwl	(%rax), %eax	# gpio_3(D)->pin, D.4582
	movzwl	%ax, %eax	# D.4582, D.4583
	movl	%eax, %edi	# D.4583,
	call	mraa_gpio_init	#
	movq	%rax, %rdx	#, D.4584
	movq	-8(%rbp), %rax	# gpio, tmp95
	movq	%rdx, 8(%rax)	# D.4584, gpio_3(D)->context
	.loc 1 29 0
	movq	-8(%rbp), %rax	# gpio, tmp96
	movl	16(%rax), %eax	# gpio_3(D)->mode, D.4583
	cmpl	$1, %eax	#, D.4583
	jne	.L2	#,
	.loc 1 30 0
	movq	-8(%rbp), %rax	# gpio, tmp97
	movq	8(%rax), %rax	# gpio_3(D)->context, D.4584
	movl	$0, %esi	#,
	movq	%rax, %rdi	# D.4584,
	call	mraa_gpio_dir	#
	.loc 1 33 0
	jmp	.L4	#
.L2:
	.loc 1 31 0
	movq	-8(%rbp), %rax	# gpio, tmp98
	movl	16(%rax), %eax	# gpio_3(D)->mode, D.4583
	testl	%eax, %eax	# D.4583
	jne	.L4	#,
	.loc 1 32 0
	movq	-8(%rbp), %rax	# gpio, tmp99
	movq	8(%rax), %rax	# gpio_3(D)->context, D.4584
	movl	$1, %esi	#,
	movq	%rax, %rdi	# D.4584,
	call	mraa_gpio_dir	#
.L4:
	.loc 1 33 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	gpioInit, .-gpioInit
	.section	.text.gpioPinRemapConfig,"ax",@progbits
	.globl	gpioPinRemapConfig
	.type	gpioPinRemapConfig, @function
gpioPinRemapConfig:
.LFB7:
	.loc 1 36 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)	# remap, remap
	movl	%esi, %eax	# enable, tmp87
	movb	%al, -8(%rbp)	# tmp87, enable
	.loc 1 38 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	gpioPinRemapConfig, .-gpioPinRemapConfig
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/include/mraa/gpio.h"
	.file 4 "src/main/drivers/gpio.h"
	.file 5 "./src/main/target/edison/target.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1e3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF31
	.byte	0xc
	.long	.LASF32
	.long	.LASF33
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF5
	.byte	0x2
	.byte	0x31
	.long	0x57
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF6
	.byte	0x2
	.byte	0x33
	.long	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x3
	.byte	0x37
	.long	0x9e
	.uleb128 0x5
	.byte	0x8
	.long	0xa4
	.uleb128 0x6
	.long	.LASF34
	.uleb128 0x7
	.byte	0x4
	.long	0x69
	.byte	0x3
	.byte	0x46
	.long	0xce
	.uleb128 0x8
	.long	.LASF14
	.byte	0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x1
	.uleb128 0x8
	.long	.LASF16
	.byte	0x2
	.uleb128 0x8
	.long	.LASF17
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x69
	.byte	0x4
	.byte	0x4e
	.long	0xec
	.uleb128 0x9
	.string	"In"
	.byte	0
	.uleb128 0x9
	.string	"Out"
	.byte	0x1
	.uleb128 0x9
	.string	"PWM"
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	.LASF35
	.byte	0x18
	.byte	0x4
	.byte	0x79
	.long	0x129
	.uleb128 0xb
	.string	"pin"
	.byte	0x4
	.byte	0x7b
	.long	0x4c
	.byte	0
	.uleb128 0xc
	.long	.LASF18
	.byte	0x4
	.byte	0x7c
	.long	0x93
	.byte	0x8
	.uleb128 0xc
	.long	.LASF19
	.byte	0x4
	.byte	0x7d
	.long	0x37
	.byte	0x10
	.uleb128 0xc
	.long	.LASF20
	.byte	0x4
	.byte	0x7e
	.long	0x37
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.long	.LASF21
	.byte	0x4
	.byte	0x7f
	.long	0xec
	.uleb128 0xd
	.long	.LASF22
	.byte	0x1
	.byte	0x1a
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x160
	.uleb128 0xe
	.long	.LASF24
	.byte	0x1
	.byte	0x1a
	.long	0x160
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x129
	.uleb128 0xf
	.long	.LASF23
	.byte	0x1
	.byte	0x23
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a0
	.uleb128 0xe
	.long	.LASF25
	.byte	0x1
	.byte	0x23
	.long	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.long	.LASF26
	.byte	0x1
	.byte	0x23
	.long	0x1a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF27
	.uleb128 0x10
	.long	.LASF28
	.byte	0x5
	.byte	0xc8
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_0
	.uleb128 0x10
	.long	.LASF29
	.byte	0x5
	.byte	0xc9
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_1
	.uleb128 0x10
	.long	.LASF30
	.byte	0x5
	.byte	0xca
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	U_ID_2
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB6
	.quad	.LFE6
	.quad	.LFB7
	.quad	.LFE7
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF34:
	.string	"_gpio"
.LASF20:
	.string	"speed"
.LASF22:
	.string	"gpioInit"
.LASF26:
	.string	"enable"
.LASF23:
	.string	"gpioPinRemapConfig"
.LASF28:
	.string	"U_ID_0"
.LASF11:
	.string	"long long unsigned int"
.LASF32:
	.string	"src/main/drivers/gpio_edison.c"
.LASF3:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF31:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF24:
	.string	"gpio"
.LASF33:
	.string	"/home/aravind/git/cleanflight"
.LASF17:
	.string	"MRAA_GPIO_OUT_LOW"
.LASF7:
	.string	"unsigned int"
.LASF21:
	.string	"GPIO_TypeDef"
.LASF10:
	.string	"char"
.LASF19:
	.string	"mode"
.LASF18:
	.string	"context"
.LASF9:
	.string	"sizetype"
.LASF12:
	.string	"long long int"
.LASF29:
	.string	"U_ID_1"
.LASF30:
	.string	"U_ID_2"
.LASF15:
	.string	"MRAA_GPIO_IN"
.LASF1:
	.string	"short int"
.LASF16:
	.string	"MRAA_GPIO_OUT_HIGH"
.LASF5:
	.string	"uint16_t"
.LASF25:
	.string	"remap"
.LASF6:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF13:
	.string	"mraa_gpio_context"
.LASF14:
	.string	"MRAA_GPIO_OUT"
.LASF27:
	.string	"_Bool"
.LASF35:
	.string	"GPIO_TypeDef_s"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
