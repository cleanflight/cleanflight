	.file	"timer_setup.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed timer_setup.i -mtune=generic
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
	.section	.text.handler,"ax",@progbits
	.type	handler, @function
handler:
.LFB6:
	.file 1 "src/main/drivers/timer_setup.c"
	.loc 1 4 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movl	%edi, -20(%rbp)	# sig, sig
	movq	%rsi, -32(%rbp)	# si, si
	movq	%rdx, -40(%rbp)	# uc, uc
	.loc 1 6 0
	movq	-32(%rbp), %rax	# si, tmp92
	movq	24(%rax), %rax	# si_2(D)->_sifields._rt.si_sigval.sival_ptr, tmp93
	movq	%rax, -8(%rbp)	# tmp93, timer_info
	.loc 1 8 0
	movq	-8(%rbp), %rax	# timer_info, tmp94
	movq	16(%rax), %rax	# timer_info_3->callback, D.4776
	movq	(%rax), %rax	# _4->fn, D.4777
	movq	-8(%rbp), %rdx	# timer_info, tmp95
	movzwl	24(%rdx), %edx	# timer_info_3->period, D.4778
	movzwl	%dx, %ecx	# D.4778, D.4779
	movq	-8(%rbp), %rdx	# timer_info, tmp96
	movq	16(%rdx), %rdx	# timer_info_3->callback, D.4776
	movl	%ecx, %esi	# D.4779,
	movq	%rdx, %rdi	# D.4776,
	call	*%rax	# D.4777
	.loc 1 9 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	handler, .-handler
	.section	.rodata
.LC0:
	.string	"sigaction"
	.section	.text.setup_sigaction,"ax",@progbits
	.globl	setup_sigaction
	.type	setup_sigaction, @function
setup_sigaction:
.LFB7:
	.loc 1 13 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# sa, sa
	movq	%rsi, -16(%rbp)	# mask, mask
	.loc 1 14 0
	movq	-8(%rbp), %rax	# sa, tmp90
	movl	$4, 136(%rax)	#, sa_2(D)->sa_flags
	.loc 1 15 0
	movq	-8(%rbp), %rax	# sa, tmp91
	movq	$handler, (%rax)	#, sa_2(D)->__sigaction_handler.sa_sigaction
	.loc 1 16 0
	movq	-8(%rbp), %rax	# sa, tmp92
	addq	$8, %rax	#, D.4780
	movq	%rax, %rdi	# D.4780,
	call	sigemptyset	#
	.loc 1 17 0
	call	__libc_current_sigrtmin	#
	movl	%eax, %ecx	#, D.4781
	movq	-8(%rbp), %rax	# sa, tmp93
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp93,
	movl	%ecx, %edi	# D.4781,
	call	sigaction	#
	cmpl	$-1, %eax	#, D.4781
	jne	.L4	#,
	.loc 1 18 0
	movl	$.LC0, %edi	#,
	call	perror	#
	movl	$1, %edi	#,
	call	exit	#
.L4:
	.loc 1 19 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	setup_sigaction, .-setup_sigaction
	.section	.rodata
.LC1:
	.string	"timer_create"
	.section	.text.timercreate,"ax",@progbits
	.globl	timercreate
	.type	timercreate, @function
timercreate:
.LFB8:
	.loc 1 22 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# timerid, timerid
	movq	%rsi, -16(%rbp)	# sev, sev
	movq	%rdx, -24(%rbp)	# handler, handler
	movq	%rcx, -32(%rbp)	# timer_info, timer_info
	.loc 1 24 0
	movq	-16(%rbp), %rax	# sev, tmp89
	movl	$0, 12(%rax)	#, sev_2(D)->sigev_notify
	.loc 1 25 0
	call	__libc_current_sigrtmin	#
	movl	%eax, %edx	#, D.4783
	.loc 1 25 0
	movq	-16(%rbp), %rax	# sev, tmp90
	movl	%edx, 8(%rax)	# D.4783, sev_2(D)->sigev_signo
	.loc 1 26 0
	movq	-16(%rbp), %rax	# sev, tmp91
	movq	-32(%rbp), %rdx	# timer_info, tmp92
	movq	%rdx, (%rax)	# tmp92, sev_2(D)->sigev_value.sival_ptr
	.loc 1 27 0
	movq	-8(%rbp), %rdx	# timerid, tmp93
	movq	-16(%rbp), %rax	# sev, tmp94
	movq	%rax, %rsi	# tmp94,
	movl	$0, %edi	#,
	call	timer_create	#
	cmpl	$-1, %eax	#, D.4783
	jne	.L6	#,
	.loc 1 28 0
	movl	$.LC1, %edi	#,
	call	perror	#
	movl	$1, %edi	#,
	call	exit	#
.L6:
	.loc 1 29 0
	movq	-32(%rbp), %rax	# timer_info, tmp95
	movq	-8(%rbp), %rdx	# timerid, tmp96
	movq	%rdx, (%rax)	# tmp96, timer_info_7(D)->timerID
	.loc 1 30 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	timercreate, .-timercreate
	.section	.rodata
.LC4:
	.string	"Invalid mode\n"
.LC5:
	.string	"timer_settime"
	.section	.text.timer_start,"ax",@progbits
	.globl	timer_start
	.type	timer_start, @function
timer_start:
.LFB9:
	.loc 1 33 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# its, its
	movq	%rsi, -16(%rbp)	# timerid, timerid
	movss	%xmm0, -20(%rbp)	# freq, freq
	movl	%edx, -24(%rbp)	# mode, mode
	.loc 1 36 0
	movss	.LC2(%rip), %xmm0	#, tmp95
	ucomiss	-20(%rbp), %xmm0	# freq, tmp95
	jb	.L17	#,
	.loc 1 38 0
	movss	.LC2(%rip), %xmm0	#, tmp96
	divss	-20(%rbp), %xmm0	# freq, D.4785
	cvttss2siq	%xmm0, %rdx	# D.4785, D.4786
	movq	-8(%rbp), %rax	# its, tmp97
	movq	%rdx, 16(%rax)	# D.4786, its_7(D)->it_value.tv_sec
	.loc 1 39 0
	movq	-8(%rbp), %rax	# its, tmp98
	movq	$0, 24(%rax)	#, its_7(D)->it_value.tv_nsec
	jmp	.L10	#
.L17:
	.loc 1 43 0
	movq	-8(%rbp), %rax	# its, tmp99
	movq	$0, 16(%rax)	#, its_7(D)->it_value.tv_sec
	.loc 1 44 0
	movss	.LC3(%rip), %xmm0	#, tmp100
	divss	-20(%rbp), %xmm0	# freq, D.4785
	cvttss2siq	%xmm0, %rdx	# D.4785, D.4786
	movq	-8(%rbp), %rax	# its, tmp101
	movq	%rdx, 24(%rax)	# D.4786, its_7(D)->it_value.tv_nsec
.L10:
	.loc 1 46 0
	movl	-24(%rbp), %eax	# mode, mode
	testl	%eax, %eax	# mode
	je	.L12	#,
	cmpl	$1, %eax	#, mode
	je	.L13	#,
	jmp	.L18	#
.L12:
	.loc 1 48 0
	movq	-8(%rbp), %rax	# its, tmp103
	movq	$0, (%rax)	#, its_7(D)->it_interval.tv_sec
	.loc 1 49 0
	movq	-8(%rbp), %rax	# its, tmp104
	movq	$0, 8(%rax)	#, its_7(D)->it_interval.tv_nsec
	.loc 1 50 0
	jmp	.L14	#
.L13:
	.loc 1 52 0
	movq	-8(%rbp), %rax	# its, tmp105
	movq	16(%rax), %rdx	# its_7(D)->it_value.tv_sec, D.4786
	movq	-8(%rbp), %rax	# its, tmp106
	movq	%rdx, (%rax)	# D.4786, its_7(D)->it_interval.tv_sec
	.loc 1 53 0
	movq	-8(%rbp), %rax	# its, tmp107
	movq	24(%rax), %rdx	# its_7(D)->it_value.tv_nsec, D.4786
	movq	-8(%rbp), %rax	# its, tmp108
	movq	%rdx, 8(%rax)	# D.4786, its_7(D)->it_interval.tv_nsec
	.loc 1 54 0
	jmp	.L14	#
.L18:
	.loc 1 58 0
	movl	$.LC4, %edi	#,
	call	perror	#
	movl	$1, %edi	#,
	call	exit	#
.L14:
	.loc 1 60 0
	movq	-16(%rbp), %rax	# timerid, tmp109
	movq	(%rax), %rax	# *timerid_21(D), D.4787
	movq	-8(%rbp), %rdx	# its, tmp110
	movl	$0, %ecx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# D.4787,
	call	timer_settime	#
	cmpl	$-1, %eax	#, D.4788
	jne	.L19	#,
	.loc 1 61 0
	movl	$.LC5, %edi	#,
	call	perror	#
	movl	$1, %edi	#,
	call	exit	#
.L19:
	.loc 1 62 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	timer_start, .-timer_start
	.section	.text.timer_info_init,"ax",@progbits
	.globl	timer_info_init
	.type	timer_info_init, @function
timer_info_init:
.LFB10:
	.loc 1 65 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# timer_info, timer_info
	movq	%rsi, -16(%rbp)	# timer_handler, timer_handler
	.loc 1 66 0
	movq	-8(%rbp), %rax	# timer_info, tmp88
	movq	16(%rax), %rax	# timer_info_2(D)->callback, D.4791
	movq	-16(%rbp), %rdx	# timer_handler, tmp89
	movq	%rdx, (%rax)	# tmp89, _3->fn
	.loc 1 68 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	timer_info_init, .-timer_info_init
	.section	.text.start_timer,"ax",@progbits
	.globl	start_timer
	.type	start_timer, @function
start_timer:
.LFB11:
	.loc 1 72 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$432, %rsp	#,
	movq	%rdi, -408(%rbp)	# timerspecific_handler, timerspecific_handler
	movss	%xmm0, -412(%rbp)	# freq, freq
	movl	%esi, %eax	# period, tmp87
	movl	%edx, -420(%rbp)	# mode, mode
	movw	%ax, -416(%rbp)	# tmp87, period
	.loc 1 72 0
	movq	%fs:40, %rax	#, tmp102
	movq	%rax, -8(%rbp)	# tmp102, D.4792
	xorl	%eax, %eax	# tmp102
	.loc 1 80 0
	movl	$32, %edi	#,
	call	malloc	#
	movq	%rax, -392(%rbp)	# tmp88, timer_info
	.loc 1 81 0
	movq	-392(%rbp), %rax	# timer_info, tmp89
	movzwl	-416(%rbp), %edx	# period, tmp90
	movw	%dx, 24(%rax)	# tmp90, timer_info_3->period
	.loc 1 82 0
	movq	-408(%rbp), %rdx	# timerspecific_handler, tmp91
	movq	-392(%rbp), %rax	# timer_info, tmp92
	movq	%rdx, %rsi	# tmp91,
	movq	%rax, %rdi	# tmp92,
	call	timer_info_init	#
	.loc 1 83 0
	leaq	-288(%rbp), %rdx	#, tmp93
	leaq	-160(%rbp), %rax	#, tmp94
	movq	%rdx, %rsi	# tmp93,
	movq	%rax, %rdi	# tmp94,
	call	setup_sigaction	#
	.loc 1 84 0
	movq	-392(%rbp), %rdx	# timer_info, tmp95
	leaq	-352(%rbp), %rsi	#, tmp96
	leaq	-400(%rbp), %rax	#, tmp97
	movq	%rdx, %rcx	# tmp95,
	movl	$handler, %edx	#,
	movq	%rax, %rdi	# tmp97,
	call	timercreate	#
	.loc 1 85 0
	movl	-420(%rbp), %edx	# mode, tmp98
	movl	-412(%rbp), %esi	# freq, tmp99
	leaq	-400(%rbp), %rcx	#, tmp100
	leaq	-384(%rbp), %rax	#, tmp101
	movl	%esi, -424(%rbp)	# tmp99, %sfp
	movss	-424(%rbp), %xmm0	# %sfp,
	movq	%rcx, %rsi	# tmp100,
	movq	%rax, %rdi	# tmp101,
	call	timer_start	#
	.loc 1 87 0
	nop
	movq	-8(%rbp), %rax	# D.4792, tmp103
	xorq	%fs:40, %rax	#, tmp103
	je	.L22	#,
	call	__stack_chk_fail	#
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	start_timer, .-start_timer
	.section	.rodata
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	1315859240
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/time.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/sigset.h"
	.file 5 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/siginfo.h"
	.file 8 "/usr/include/signal.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/sigaction.h"
	.file 10 "/usr/include/stdint.h"
	.file 11 "src/main/drivers/timer_setup.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x868
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF110
	.byte	0xc
	.long	.LASF111
	.long	.LASF112
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
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x7d
	.long	0x37
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x85
	.long	0x30
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0x87
	.long	0x5a
	.uleb128 0x4
	.long	.LASF11
	.byte	0x2
	.byte	0x8b
	.long	0x5a
	.uleb128 0x4
	.long	.LASF12
	.byte	0x2
	.byte	0x96
	.long	0x9f
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x4
	.long	.LASF13
	.byte	0x2
	.byte	0xaf
	.long	0x5a
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF15
	.uleb128 0x4
	.long	.LASF16
	.byte	0x3
	.byte	0x67
	.long	0x94
	.uleb128 0x6
	.byte	0x80
	.byte	0x4
	.byte	0x1b
	.long	0xda
	.uleb128 0x7
	.long	.LASF19
	.byte	0x4
	.byte	0x1d
	.long	0xda
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	0x29
	.long	0xea
	.uleb128 0x9
	.long	0x77
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF17
	.byte	0x4
	.byte	0x1e
	.long	0xc5
	.uleb128 0x4
	.long	.LASF18
	.byte	0x5
	.byte	0x25
	.long	0xea
	.uleb128 0xa
	.long	.LASF65
	.byte	0x10
	.byte	0x3
	.byte	0x78
	.long	0x125
	.uleb128 0x7
	.long	.LASF20
	.byte	0x3
	.byte	0x7a
	.long	0x89
	.byte	0
	.uleb128 0x7
	.long	.LASF21
	.byte	0x3
	.byte	0x7b
	.long	0xa1
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	.LASF24
	.byte	0x38
	.byte	0x6
	.byte	0x3f
	.long	0x148
	.uleb128 0xc
	.long	.LASF22
	.byte	0x6
	.byte	0x41
	.long	0x148
	.uleb128 0xc
	.long	.LASF23
	.byte	0x6
	.byte	0x42
	.long	0x5a
	.byte	0
	.uleb128 0x8
	.long	0xac
	.long	0x158
	.uleb128 0x9
	.long	0x77
	.byte	0x37
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x6
	.byte	0x45
	.long	0x125
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF25
	.uleb128 0xb
	.long	.LASF26
	.byte	0x8
	.byte	0x7
	.byte	0x20
	.long	0x18d
	.uleb128 0xc
	.long	.LASF27
	.byte	0x7
	.byte	0x22
	.long	0x30
	.uleb128 0xc
	.long	.LASF28
	.byte	0x7
	.byte	0x23
	.long	0x9f
	.byte	0
	.uleb128 0x4
	.long	.LASF29
	.byte	0x7
	.byte	0x24
	.long	0x16a
	.uleb128 0x4
	.long	.LASF30
	.byte	0x7
	.byte	0x3a
	.long	0x7e
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.byte	0x4a
	.long	0x1c4
	.uleb128 0x7
	.long	.LASF31
	.byte	0x7
	.byte	0x4c
	.long	0x6c
	.byte	0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x7
	.byte	0x4d
	.long	0x61
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.byte	0x51
	.long	0x1f1
	.uleb128 0x7
	.long	.LASF33
	.byte	0x7
	.byte	0x53
	.long	0x30
	.byte	0
	.uleb128 0x7
	.long	.LASF34
	.byte	0x7
	.byte	0x54
	.long	0x30
	.byte	0x4
	.uleb128 0x7
	.long	.LASF35
	.byte	0x7
	.byte	0x55
	.long	0x18d
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.byte	0x59
	.long	0x21e
	.uleb128 0x7
	.long	.LASF31
	.byte	0x7
	.byte	0x5b
	.long	0x6c
	.byte	0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x7
	.byte	0x5c
	.long	0x61
	.byte	0x4
	.uleb128 0x7
	.long	.LASF35
	.byte	0x7
	.byte	0x5d
	.long	0x18d
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x20
	.byte	0x7
	.byte	0x61
	.long	0x263
	.uleb128 0x7
	.long	.LASF31
	.byte	0x7
	.byte	0x63
	.long	0x6c
	.byte	0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x7
	.byte	0x64
	.long	0x61
	.byte	0x4
	.uleb128 0x7
	.long	.LASF36
	.byte	0x7
	.byte	0x65
	.long	0x30
	.byte	0x8
	.uleb128 0x7
	.long	.LASF37
	.byte	0x7
	.byte	0x66
	.long	0x198
	.byte	0x10
	.uleb128 0x7
	.long	.LASF38
	.byte	0x7
	.byte	0x67
	.long	0x198
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.byte	0x6f
	.long	0x284
	.uleb128 0x7
	.long	.LASF39
	.byte	0x7
	.byte	0x71
	.long	0x9f
	.byte	0
	.uleb128 0x7
	.long	.LASF40
	.byte	0x7
	.byte	0x72
	.long	0x9f
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x20
	.byte	0x7
	.byte	0x6b
	.long	0x2b1
	.uleb128 0x7
	.long	.LASF41
	.byte	0x7
	.byte	0x6d
	.long	0x9f
	.byte	0
	.uleb128 0x7
	.long	.LASF42
	.byte	0x7
	.byte	0x6e
	.long	0x53
	.byte	0x8
	.uleb128 0x7
	.long	.LASF43
	.byte	0x7
	.byte	0x73
	.long	0x263
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.byte	0x77
	.long	0x2d2
	.uleb128 0x7
	.long	.LASF44
	.byte	0x7
	.byte	0x79
	.long	0x5a
	.byte	0
	.uleb128 0x7
	.long	.LASF45
	.byte	0x7
	.byte	0x7a
	.long	0x30
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x10
	.byte	0x7
	.byte	0x7e
	.long	0x2ff
	.uleb128 0x7
	.long	.LASF46
	.byte	0x7
	.byte	0x80
	.long	0x9f
	.byte	0
	.uleb128 0x7
	.long	.LASF47
	.byte	0x7
	.byte	0x81
	.long	0x30
	.byte	0x8
	.uleb128 0x7
	.long	.LASF48
	.byte	0x7
	.byte	0x82
	.long	0x37
	.byte	0xc
	.byte	0
	.uleb128 0xd
	.byte	0x70
	.byte	0x7
	.byte	0x45
	.long	0x360
	.uleb128 0xc
	.long	.LASF49
	.byte	0x7
	.byte	0x47
	.long	0x360
	.uleb128 0xc
	.long	.LASF50
	.byte	0x7
	.byte	0x4e
	.long	0x1a3
	.uleb128 0xc
	.long	.LASF51
	.byte	0x7
	.byte	0x56
	.long	0x1c4
	.uleb128 0xe
	.string	"_rt"
	.byte	0x7
	.byte	0x5e
	.long	0x1f1
	.uleb128 0xc
	.long	.LASF52
	.byte	0x7
	.byte	0x68
	.long	0x21e
	.uleb128 0xc
	.long	.LASF53
	.byte	0x7
	.byte	0x74
	.long	0x284
	.uleb128 0xc
	.long	.LASF54
	.byte	0x7
	.byte	0x7b
	.long	0x2b1
	.uleb128 0xc
	.long	.LASF55
	.byte	0x7
	.byte	0x83
	.long	0x2d2
	.byte	0
	.uleb128 0x8
	.long	0x30
	.long	0x370
	.uleb128 0x9
	.long	0x77
	.byte	0x1b
	.byte	0
	.uleb128 0x6
	.byte	0x80
	.byte	0x7
	.byte	0x3e
	.long	0x3a9
	.uleb128 0x7
	.long	.LASF56
	.byte	0x7
	.byte	0x40
	.long	0x30
	.byte	0
	.uleb128 0x7
	.long	.LASF57
	.byte	0x7
	.byte	0x41
	.long	0x30
	.byte	0x4
	.uleb128 0x7
	.long	.LASF58
	.byte	0x7
	.byte	0x43
	.long	0x30
	.byte	0x8
	.uleb128 0x7
	.long	.LASF59
	.byte	0x7
	.byte	0x84
	.long	0x2ff
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.long	.LASF60
	.byte	0x7
	.byte	0x85
	.long	0x370
	.uleb128 0xf
	.byte	0x10
	.byte	0x7
	.value	0x14e
	.long	0x3d8
	.uleb128 0x10
	.long	.LASF61
	.byte	0x7
	.value	0x150
	.long	0x3e3
	.byte	0
	.uleb128 0x10
	.long	.LASF62
	.byte	0x7
	.value	0x151
	.long	0x3e9
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.long	0x3e3
	.uleb128 0x12
	.long	0x18d
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x3d8
	.uleb128 0x13
	.byte	0x8
	.long	0x158
	.uleb128 0x14
	.byte	0x30
	.byte	0x7
	.value	0x146
	.long	0x41d
	.uleb128 0x15
	.long	.LASF49
	.byte	0x7
	.value	0x148
	.long	0x41d
	.uleb128 0x15
	.long	.LASF63
	.byte	0x7
	.value	0x14c
	.long	0x6c
	.uleb128 0x15
	.long	.LASF64
	.byte	0x7
	.value	0x152
	.long	0x3b4
	.byte	0
	.uleb128 0x8
	.long	0x30
	.long	0x42d
	.uleb128 0x9
	.long	0x77
	.byte	0xb
	.byte	0
	.uleb128 0x16
	.long	.LASF66
	.byte	0x40
	.byte	0x7
	.value	0x140
	.long	0x46f
	.uleb128 0x10
	.long	.LASF67
	.byte	0x7
	.value	0x142
	.long	0x18d
	.byte	0
	.uleb128 0x10
	.long	.LASF68
	.byte	0x7
	.value	0x143
	.long	0x30
	.byte	0x8
	.uleb128 0x10
	.long	.LASF69
	.byte	0x7
	.value	0x144
	.long	0x30
	.byte	0xc
	.uleb128 0x10
	.long	.LASF70
	.byte	0x7
	.value	0x153
	.long	0x3ef
	.byte	0x10
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.long	0x37
	.byte	0x7
	.value	0x15c
	.long	0x495
	.uleb128 0x18
	.long	.LASF71
	.byte	0
	.uleb128 0x18
	.long	.LASF72
	.byte	0x1
	.uleb128 0x18
	.long	.LASF73
	.byte	0x2
	.uleb128 0x18
	.long	.LASF74
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.long	.LASF75
	.byte	0x8
	.byte	0x55
	.long	0x4a0
	.uleb128 0x13
	.byte	0x8
	.long	0x4a6
	.uleb128 0x11
	.long	0x4b1
	.uleb128 0x12
	.long	0x30
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.byte	0x9
	.byte	0x1c
	.long	0x4d0
	.uleb128 0xc
	.long	.LASF76
	.byte	0x9
	.byte	0x1f
	.long	0x495
	.uleb128 0xc
	.long	.LASF77
	.byte	0x9
	.byte	0x21
	.long	0x4eb
	.byte	0
	.uleb128 0x11
	.long	0x4e5
	.uleb128 0x12
	.long	0x30
	.uleb128 0x12
	.long	0x4e5
	.uleb128 0x12
	.long	0x9f
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x3a9
	.uleb128 0x13
	.byte	0x8
	.long	0x4d0
	.uleb128 0xa
	.long	.LASF78
	.byte	0x98
	.byte	0x9
	.byte	0x18
	.long	0x52e
	.uleb128 0x7
	.long	.LASF79
	.byte	0x9
	.byte	0x23
	.long	0x4b1
	.byte	0
	.uleb128 0x7
	.long	.LASF80
	.byte	0x9
	.byte	0x2b
	.long	0xea
	.byte	0x8
	.uleb128 0x7
	.long	.LASF81
	.byte	0x9
	.byte	0x2e
	.long	0x30
	.byte	0x88
	.uleb128 0x7
	.long	.LASF82
	.byte	0x9
	.byte	0x31
	.long	0x52f
	.byte	0x90
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x8
	.long	0x52e
	.uleb128 0xa
	.long	.LASF83
	.byte	0x20
	.byte	0x3
	.byte	0xa1
	.long	0x55a
	.uleb128 0x7
	.long	.LASF84
	.byte	0x3
	.byte	0xa3
	.long	0x100
	.byte	0
	.uleb128 0x7
	.long	.LASF85
	.byte	0x3
	.byte	0xa4
	.long	0x100
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.long	.LASF86
	.byte	0xa
	.byte	0x31
	.long	0x45
	.uleb128 0x4
	.long	.LASF87
	.byte	0xb
	.byte	0x1c
	.long	0x55a
	.uleb128 0x4
	.long	.LASF88
	.byte	0xb
	.byte	0x21
	.long	0x57b
	.uleb128 0x11
	.long	0x58b
	.uleb128 0x12
	.long	0x58b
	.uleb128 0x12
	.long	0x55a
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x591
	.uleb128 0xa
	.long	.LASF89
	.byte	0x8
	.byte	0xb
	.byte	0x24
	.long	0x5a9
	.uleb128 0x1a
	.string	"fn"
	.byte	0xb
	.byte	0x25
	.long	0x5a9
	.byte	0
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x570
	.uleb128 0x4
	.long	.LASF90
	.byte	0xb
	.byte	0x26
	.long	0x591
	.uleb128 0xa
	.long	.LASF91
	.byte	0x20
	.byte	0xb
	.byte	0x32
	.long	0x5f7
	.uleb128 0x7
	.long	.LASF92
	.byte	0xb
	.byte	0x34
	.long	0x5f7
	.byte	0
	.uleb128 0x7
	.long	.LASF93
	.byte	0xb
	.byte	0x35
	.long	0x30
	.byte	0x8
	.uleb128 0x7
	.long	.LASF94
	.byte	0xb
	.byte	0x36
	.long	0x5fd
	.byte	0x10
	.uleb128 0x7
	.long	.LASF95
	.byte	0xb
	.byte	0x37
	.long	0x55a
	.byte	0x18
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0xba
	.uleb128 0x13
	.byte	0x8
	.long	0x5af
	.uleb128 0x4
	.long	.LASF96
	.byte	0xb
	.byte	0x38
	.long	0x5ba
	.uleb128 0x1b
	.long	.LASF101
	.byte	0x1
	.byte	0x3
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x662
	.uleb128 0x1c
	.string	"sig"
	.byte	0x1
	.byte	0x3
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.string	"si"
	.byte	0x1
	.byte	0x3
	.long	0x4e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.string	"uc"
	.byte	0x1
	.byte	0x3
	.long	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF102
	.byte	0x1
	.byte	0x5
	.long	0x662
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x603
	.uleb128 0x1e
	.long	.LASF98
	.byte	0x1
	.byte	0xc
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x6a1
	.uleb128 0x1c
	.string	"sa"
	.byte	0x1
	.byte	0xc
	.long	0x6a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.long	.LASF97
	.byte	0x1
	.byte	0xc
	.long	0x6a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x4f1
	.uleb128 0x13
	.byte	0x8
	.long	0xf5
	.uleb128 0x1e
	.long	.LASF99
	.byte	0x1
	.byte	0x15
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x703
	.uleb128 0x1f
	.long	.LASF100
	.byte	0x1
	.byte	0x15
	.long	0x5f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.string	"sev"
	.byte	0x1
	.byte	0x15
	.long	0x703
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.byte	0x15
	.long	0x4eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF102
	.byte	0x1
	.byte	0x15
	.long	0x662
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x42d
	.uleb128 0x1e
	.long	.LASF103
	.byte	0x1
	.byte	0x20
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x75f
	.uleb128 0x1c
	.string	"its"
	.byte	0x1
	.byte	0x20
	.long	0x75f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.long	.LASF100
	.byte	0x1
	.byte	0x20
	.long	0x5f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1f
	.long	.LASF104
	.byte	0x1
	.byte	0x20
	.long	0x765
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.long	.LASF105
	.byte	0x1
	.byte	0x20
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x535
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF106
	.uleb128 0x20
	.long	.LASF107
	.byte	0x1
	.byte	0x40
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x7a6
	.uleb128 0x1f
	.long	.LASF102
	.byte	0x1
	.byte	0x40
	.long	0x662
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.long	.LASF108
	.byte	0x1
	.byte	0x40
	.long	0x7b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x11
	.long	0x7b6
	.uleb128 0x12
	.long	0x5fd
	.uleb128 0x12
	.long	0x565
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x7a6
	.uleb128 0x21
	.long	.LASF113
	.byte	0x1
	.byte	0x46
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.long	.LASF109
	.byte	0x1
	.byte	0x46
	.long	0x7b6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -424
	.uleb128 0x1f
	.long	.LASF104
	.byte	0x1
	.byte	0x46
	.long	0x765
	.uleb128 0x3
	.byte	0x91
	.sleb128 -428
	.uleb128 0x1f
	.long	.LASF95
	.byte	0x1
	.byte	0x46
	.long	0x55a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0x1f
	.long	.LASF105
	.byte	0x1
	.byte	0x46
	.long	0x30
	.uleb128 0x3
	.byte	0x91
	.sleb128 -436
	.uleb128 0x1d
	.long	.LASF100
	.byte	0x1
	.byte	0x49
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x22
	.string	"sev"
	.byte	0x1
	.byte	0x4a
	.long	0x42d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x22
	.string	"its"
	.byte	0x1
	.byte	0x4b
	.long	0x535
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x1d
	.long	.LASF97
	.byte	0x1
	.byte	0x4c
	.long	0xf5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x22
	.string	"sa"
	.byte	0x1
	.byte	0x4d
	.long	0x4f1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1d
	.long	.LASF102
	.byte	0x1
	.byte	0x4f
	.long	0x662
	.uleb128 0x3
	.byte	0x91
	.sleb128 -408
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1f
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x7c
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
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
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
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF61:
	.string	"_function"
.LASF21:
	.string	"tv_nsec"
.LASF10:
	.string	"__clock_t"
.LASF55:
	.string	"_sigsys"
.LASF87:
	.string	"captureCompare_t"
.LASF88:
	.string	"timerCCHandlerCallback"
.LASF35:
	.string	"si_sigval"
.LASF66:
	.string	"sigevent"
.LASF9:
	.string	"sizetype"
.LASF84:
	.string	"it_interval"
.LASF96:
	.string	"timer_info_t"
.LASF108:
	.string	"timer_handler"
.LASF77:
	.string	"sa_sigaction"
.LASF25:
	.string	"long long unsigned int"
.LASF8:
	.string	"__pid_t"
.LASF67:
	.string	"sigev_value"
.LASF15:
	.string	"long long int"
.LASF13:
	.string	"__syscall_slong_t"
.LASF105:
	.string	"mode"
.LASF36:
	.string	"si_status"
.LASF40:
	.string	"_upper"
.LASF101:
	.string	"handler"
.LASF107:
	.string	"timer_info_init"
.LASF50:
	.string	"_kill"
.LASF34:
	.string	"si_overrun"
.LASF99:
	.string	"timercreate"
.LASF78:
	.string	"sigaction"
.LASF41:
	.string	"si_addr"
.LASF76:
	.string	"sa_handler"
.LASF73:
	.string	"SIGEV_THREAD"
.LASF71:
	.string	"SIGEV_SIGNAL"
.LASF89:
	.string	"timerCCHandlerRec_s"
.LASF90:
	.string	"timerCCHandlerRec_t"
.LASF83:
	.string	"itimerspec"
.LASF103:
	.string	"timer_start"
.LASF5:
	.string	"short int"
.LASF109:
	.string	"timerspecific_handler"
.LASF106:
	.string	"float"
.LASF104:
	.string	"freq"
.LASF53:
	.string	"_sigfault"
.LASF30:
	.string	"__sigchld_clock_t"
.LASF110:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF51:
	.string	"_timer"
.LASF6:
	.string	"long int"
.LASF95:
	.string	"period"
.LASF47:
	.string	"_syscall"
.LASF58:
	.string	"si_code"
.LASF44:
	.string	"si_band"
.LASF31:
	.string	"si_pid"
.LASF56:
	.string	"si_signo"
.LASF32:
	.string	"si_uid"
.LASF37:
	.string	"si_utime"
.LASF59:
	.string	"_sifields"
.LASF2:
	.string	"unsigned char"
.LASF111:
	.string	"src/main/drivers/timer_setup.c"
.LASF91:
	.string	"timer_info_s"
.LASF75:
	.string	"__sighandler_t"
.LASF4:
	.string	"signed char"
.LASF45:
	.string	"si_fd"
.LASF48:
	.string	"_arch"
.LASF102:
	.string	"timer_info"
.LASF43:
	.string	"si_addr_bnd"
.LASF54:
	.string	"_sigpoll"
.LASF113:
	.string	"start_timer"
.LASF57:
	.string	"si_errno"
.LASF22:
	.string	"__size"
.LASF3:
	.string	"short unsigned int"
.LASF98:
	.string	"setup_sigaction"
.LASF49:
	.string	"_pad"
.LASF62:
	.string	"_attribute"
.LASF14:
	.string	"char"
.LASF86:
	.string	"uint16_t"
.LASF28:
	.string	"sival_ptr"
.LASF19:
	.string	"__val"
.LASF16:
	.string	"timer_t"
.LASF46:
	.string	"_call_addr"
.LASF112:
	.string	"/home/aravind/git/cleanflight"
.LASF7:
	.string	"__uid_t"
.LASF64:
	.string	"_sigev_thread"
.LASF92:
	.string	"timerID"
.LASF85:
	.string	"it_value"
.LASF80:
	.string	"sa_mask"
.LASF26:
	.string	"sigval"
.LASF42:
	.string	"si_addr_lsb"
.LASF23:
	.string	"__align"
.LASF33:
	.string	"si_tid"
.LASF0:
	.string	"long unsigned int"
.LASF38:
	.string	"si_stime"
.LASF11:
	.string	"__time_t"
.LASF82:
	.string	"sa_restorer"
.LASF79:
	.string	"__sigaction_handler"
.LASF29:
	.string	"sigval_t"
.LASF81:
	.string	"sa_flags"
.LASF97:
	.string	"mask"
.LASF27:
	.string	"sival_int"
.LASF18:
	.string	"sigset_t"
.LASF65:
	.string	"timespec"
.LASF20:
	.string	"tv_sec"
.LASF100:
	.string	"timerid"
.LASF63:
	.string	"_tid"
.LASF68:
	.string	"sigev_signo"
.LASF93:
	.string	"timer_enabled"
.LASF12:
	.string	"__timer_t"
.LASF72:
	.string	"SIGEV_NONE"
.LASF1:
	.string	"unsigned int"
.LASF24:
	.string	"pthread_attr_t"
.LASF74:
	.string	"SIGEV_THREAD_ID"
.LASF39:
	.string	"_lower"
.LASF69:
	.string	"sigev_notify"
.LASF52:
	.string	"_sigchld"
.LASF60:
	.string	"siginfo_t"
.LASF94:
	.string	"callback"
.LASF70:
	.string	"_sigev_un"
.LASF17:
	.string	"__sigset_t"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
