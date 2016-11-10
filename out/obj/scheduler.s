	.file	"scheduler.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed scheduler.i -mtune=generic -march=x86-64
# -ggdb3 -Wall -Wpedantic -Wextra -Wunsafe-loop-optimizations
# -Wdouble-promotion -Wundef -std=gnu99 -ffunction-sections -fdata-sections
# -fverbose-asm -ffat-lto-objects -fstack-protector-strong
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
	.section	.bss.currentTask,"aw",@nobits
	.align 8
	.type	currentTask, @object
	.size	currentTask, 8
currentTask:
	.zero	8
	.section	.bss.totalWaitingTasks,"aw",@nobits
	.align 4
	.type	totalWaitingTasks, @object
	.size	totalWaitingTasks, 4
totalWaitingTasks:
	.zero	4
	.section	.bss.totalWaitingTasksSamples,"aw",@nobits
	.align 4
	.type	totalWaitingTasksSamples, @object
	.size	totalWaitingTasksSamples, 4
totalWaitingTasksSamples:
	.zero	4
	.section	.data.realtimeGuardInterval,"aw",@progbits
	.align 4
	.type	realtimeGuardInterval, @object
	.size	realtimeGuardInterval, 4
realtimeGuardInterval:
	.long	300
	.globl	currentTime
	.section	.bss.currentTime,"aw",@nobits
	.align 4
	.type	currentTime, @object
	.size	currentTime, 4
currentTime:
	.zero	4
	.globl	averageSystemLoadPercent
	.section	.bss.averageSystemLoadPercent,"aw",@nobits
	.align 2
	.type	averageSystemLoadPercent, @object
	.size	averageSystemLoadPercent, 2
averageSystemLoadPercent:
	.zero	2
	.section	.bss.taskQueuePos,"aw",@nobits
	.align 4
	.type	taskQueuePos, @object
	.size	taskQueuePos, 4
taskQueuePos:
	.zero	4
	.section	.bss.taskQueueSize,"aw",@nobits
	.align 4
	.type	taskQueueSize, @object
	.size	taskQueueSize, 4
taskQueueSize:
	.zero	4
	.section	.text.queueClear,"ax",@progbits
	.type	queueClear, @function
queueClear:
.LFB0:
	.file 1 "src/main/scheduler/scheduler.c"
	.loc 1 55 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 56 0
	movl	taskQueueArraySize(%rip), %eax	# taskQueueArraySize, D.2507
	movl	%eax, %eax	# D.2507, D.2508
	salq	$3, %rax	#, D.2508
	movq	%rax, %rdx	# D.2508,
	movl	$0, %esi	#,
	movl	$taskQueueArray, %edi	#,
	call	memset	#
	.loc 1 57 0
	movl	$0, taskQueuePos(%rip)	#, taskQueuePos
	.loc 1 58 0
	movl	$0, taskQueueSize(%rip)	#, taskQueueSize
	.loc 1 59 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	queueClear, .-queueClear
	.section	.text.queueContains,"ax",@progbits
	.type	queueContains, @function
queueContains:
.LFB1:
	.loc 1 69 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# task, task
.LBB2:
	.loc 1 70 0
	movl	$0, -4(%rbp)	#, ii
	jmp	.L3	#
.L6:
	.loc 1 71 0
	movl	-4(%rbp), %eax	# ii, tmp91
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.2511
	cmpq	-24(%rbp), %rax	# task, D.2511
	jne	.L4	#,
	.loc 1 72 0
	movl	$1, %eax	#, D.2509
	jmp	.L5	#
.L4:
	.loc 1 70 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L3:
	.loc 1 70 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.2510
	cmpl	%eax, -4(%rbp)	# D.2510, ii
	jb	.L6	#,
.LBE2:
	.loc 1 75 0 is_stmt 1
	movl	$0, %eax	#, D.2509
.L5:
	.loc 1 76 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	queueContains, .-queueContains
	.section	.text.queueAdd,"ax",@progbits
	.type	queueAdd, @function
queueAdd:
.LFB2:
	.loc 1 79 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# task, task
	.loc 1 80 0
	movl	taskQueueSize(%rip), %edx	# taskQueueSize, D.2513
	movl	taskCount(%rip), %eax	# taskCount, D.2513
	cmpl	%eax, %edx	# D.2513, D.2513
	jnb	.L8	#,
	.loc 1 80 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax	# task, tmp106
	movq	%rax, %rdi	# tmp106,
	call	queueContains	#
	testb	%al, %al	# D.2512
	je	.L9	#,
.L8:
	.loc 1 81 0 is_stmt 1
	movl	$0, %eax	#, D.2512
	jmp	.L10	#
.L9:
.LBB3:
	.loc 1 83 0
	movl	$0, -4(%rbp)	#, ii
	jmp	.L11	#
.L14:
	.loc 1 84 0
	movl	-4(%rbp), %eax	# ii, tmp107
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.2514
	testq	%rax, %rax	# D.2514
	je	.L12	#,
	.loc 1 84 0 discriminator 1
	movl	-4(%rbp), %eax	# ii, tmp108
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.2514
	movzbl	28(%rax), %edx	# _14->staticPriority, D.2515
	movq	-24(%rbp), %rax	# task, tmp109
	movzbl	28(%rax), %eax	# task_8(D)->staticPriority, D.2515
	cmpb	%al, %dl	# D.2515, D.2515
	jnb	.L13	#,
.L12:
	.loc 1 85 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.2513
	subl	-4(%rbp), %eax	# ii, D.2513
	movl	%eax, %eax	# D.2513, D.2516
	leaq	0(,%rax,8), %rdx	#, D.2516
	movl	-4(%rbp), %eax	# ii, tmp110
	salq	$3, %rax	#, tmp111
	leaq	taskQueueArray(%rax), %rcx	#, D.2517
	movl	-4(%rbp), %eax	# ii, tmp112
	addl	$1, %eax	#, D.2513
	movl	%eax, %eax	# D.2513, tmp113
	salq	$3, %rax	#, tmp114
	addq	$taskQueueArray, %rax	#, D.2517
	movq	%rcx, %rsi	# D.2517,
	movq	%rax, %rdi	# D.2517,
	call	memmove	#
	.loc 1 86 0
	movl	-4(%rbp), %eax	# ii, tmp115
	movq	-24(%rbp), %rdx	# task, tmp116
	movq	%rdx, taskQueueArray(,%rax,8)	# tmp116, taskQueueArray
	.loc 1 87 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.2513
	addl	$1, %eax	#, D.2513
	movl	%eax, taskQueueSize(%rip)	# D.2513, taskQueueSize
	.loc 1 88 0
	movl	$1, %eax	#, D.2512
	jmp	.L10	#
.L13:
	.loc 1 83 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L11:
	.loc 1 83 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.2513
	cmpl	%eax, -4(%rbp)	# D.2513, ii
	jbe	.L14	#,
.LBE3:
	.loc 1 91 0 is_stmt 1
	movl	$0, %eax	#, D.2512
.L10:
	.loc 1 92 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	queueAdd, .-queueAdd
	.section	.text.queueRemove,"ax",@progbits
	.type	queueRemove, @function
queueRemove:
.LFB3:
	.loc 1 95 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# task, task
.LBB4:
	.loc 1 96 0
	movl	$0, -4(%rbp)	#, ii
	jmp	.L16	#
.L19:
	.loc 1 97 0
	movl	-4(%rbp), %eax	# ii, tmp100
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.2520
	cmpq	-24(%rbp), %rax	# task, D.2520
	jne	.L17	#,
	.loc 1 98 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.2519
	subl	-4(%rbp), %eax	# ii, D.2519
	movl	%eax, %eax	# D.2519, D.2521
	leaq	0(,%rax,8), %rdx	#, D.2521
	movl	-4(%rbp), %eax	# ii, tmp101
	addl	$1, %eax	#, D.2519
	movl	%eax, %eax	# D.2519, tmp102
	salq	$3, %rax	#, tmp103
	leaq	taskQueueArray(%rax), %rcx	#, D.2522
	movl	-4(%rbp), %eax	# ii, tmp104
	salq	$3, %rax	#, tmp105
	addq	$taskQueueArray, %rax	#, D.2522
	movq	%rcx, %rsi	# D.2522,
	movq	%rax, %rdi	# D.2522,
	call	memmove	#
	.loc 1 99 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.2519
	subl	$1, %eax	#, D.2519
	movl	%eax, taskQueueSize(%rip)	# D.2519, taskQueueSize
	.loc 1 100 0
	movl	$1, %eax	#, D.2518
	jmp	.L18	#
.L17:
	.loc 1 96 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L16:
	.loc 1 96 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.2519
	cmpl	%eax, -4(%rbp)	# D.2519, ii
	jb	.L19	#,
.LBE4:
	.loc 1 103 0 is_stmt 1
	movl	$0, %eax	#, D.2518
.L18:
	.loc 1 104 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	queueRemove, .-queueRemove
	.section	.text.queueFirst,"ax",@progbits
	.type	queueFirst, @function
queueFirst:
.LFB4:
	.loc 1 110 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 111 0
	movl	$0, taskQueuePos(%rip)	#, taskQueuePos
	.loc 1 112 0
	movq	taskQueueArray(%rip), %rax	# taskQueueArray, D.2523
	.loc 1 113 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	queueFirst, .-queueFirst
	.section	.text.queueNext,"ax",@progbits
	.type	queueNext, @function
queueNext:
.LFB5:
	.loc 1 119 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 120 0
	movl	taskQueuePos(%rip), %eax	# taskQueuePos, D.2524
	addl	$1, %eax	#, D.2524
	movl	%eax, taskQueuePos(%rip)	# D.2524, taskQueuePos
	movl	taskQueuePos(%rip), %eax	# taskQueuePos, D.2524
	cltq
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.2525
	.loc 1 121 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	queueNext, .-queueNext
	.section	.text.taskSystem,"ax",@progbits
	.globl	taskSystem
	.type	taskSystem, @function
taskSystem:
.LFB6:
	.loc 1 124 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 126 0
	movl	totalWaitingTasksSamples(%rip), %eax	# totalWaitingTasksSamples, D.2526
	testl	%eax, %eax	# D.2526
	je	.L25	#,
	.loc 1 127 0
	movl	totalWaitingTasks(%rip), %eax	# totalWaitingTasks, D.2526
	imull	$100, %eax, %eax	#, D.2526, D.2526
	movl	totalWaitingTasksSamples(%rip), %ecx	# totalWaitingTasksSamples, D.2526
	movl	$0, %edx	#, tmp100
	divl	%ecx	# D.2526
	movw	%ax, averageSystemLoadPercent(%rip)	# D.2527, averageSystemLoadPercent
	.loc 1 128 0
	movl	$0, totalWaitingTasksSamples(%rip)	#, totalWaitingTasksSamples
	.loc 1 129 0
	movl	$0, totalWaitingTasks(%rip)	#, totalWaitingTasks
.L25:
	.loc 1 133 0
	movl	$0, -12(%rbp)	#, maxNonRealtimeTaskTime
.LBB5:
	.loc 1 134 0
	call	queueFirst	#
	movq	%rax, -8(%rbp)	# tmp101, task
	jmp	.L26	#
.L28:
	.loc 1 135 0
	movq	-8(%rbp), %rax	# task, tmp102
	movzbl	28(%rax), %eax	# task_3->staticPriority, D.2528
	cmpb	$6, %al	#, D.2528
	je	.L27	#,
	.loc 1 136 0
	movq	-8(%rbp), %rax	# task, tmp103
	movl	44(%rax), %edx	# task_3->averageExecutionTime, D.2526
	movl	-12(%rbp), %eax	# maxNonRealtimeTaskTime, tmp105
	cmpl	%eax, %edx	# tmp105, D.2526
	cmovnb	%edx, %eax	# D.2526,, tmp104
	movl	%eax, -12(%rbp)	# tmp104, maxNonRealtimeTaskTime
.L27:
	.loc 1 134 0 discriminator 2
	call	queueNext	#
	movq	%rax, -8(%rbp)	# tmp106, task
.L26:
	.loc 1 134 0 discriminator 1
	cmpq	$0, -8(%rbp)	#, task
	jne	.L28	#,
.LBE5:
	.loc 1 140 0
	movl	-12(%rbp), %eax	# maxNonRealtimeTaskTime, D.2529
	movl	$300, %edx	#,
	movl	$10, %esi	#,
	movl	%eax, %edi	# D.2529,
	call	constrain	#
	addl	$25, %eax	#, D.2529
	movl	%eax, realtimeGuardInterval(%rip)	# D.2526, realtimeGuardInterval
	.loc 1 144 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	taskSystem, .-taskSystem
	.section	.text.getTaskInfo,"ax",@progbits
	.globl	getTaskInfo
	.type	getTaskInfo, @function
getTaskInfo:
.LFB7:
	.loc 1 148 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# taskId, taskId
	movq	%rsi, -16(%rbp)	# taskInfo, taskInfo
	.loc 1 149 0
	movl	-4(%rbp), %eax	# taskId, tmp97
	cltq
	salq	$6, %rax	#, tmp98
	addq	$cfTasks, %rax	#, tmp99
	movq	(%rax), %rdx	# cfTasks[taskId_2(D)].taskName, D.2530
	movq	-16(%rbp), %rax	# taskInfo, tmp100
	movq	%rdx, (%rax)	# D.2530, taskInfo_4(D)->taskName
	.loc 1 150 0
	movl	-4(%rbp), %eax	# taskId, tmp102
	cltq
	salq	$6, %rax	#, tmp103
	addq	$cfTasks, %rax	#, D.2531
	movq	%rax, %rdi	# D.2531,
	call	queueContains	#
	movl	%eax, %edx	#, D.2532
	movq	-16(%rbp), %rax	# taskInfo, tmp104
	movb	%dl, 8(%rax)	# D.2532, taskInfo_4(D)->isEnabled
	.loc 1 151 0
	movl	-4(%rbp), %eax	# taskId, tmp106
	cltq
	salq	$6, %rax	#, tmp107
	addq	$cfTasks+24, %rax	#, tmp108
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].desiredPeriod, D.2533
	movq	-16(%rbp), %rax	# taskInfo, tmp109
	movl	%edx, 12(%rax)	# D.2533, taskInfo_4(D)->desiredPeriod
	.loc 1 152 0
	movl	-4(%rbp), %eax	# taskId, tmp111
	cltq
	salq	$6, %rax	#, tmp112
	addq	$cfTasks+28, %rax	#, tmp113
	movzbl	(%rax), %edx	# cfTasks[taskId_2(D)].staticPriority, D.2534
	movq	-16(%rbp), %rax	# taskInfo, tmp114
	movb	%dl, 16(%rax)	# D.2534, taskInfo_4(D)->staticPriority
	.loc 1 153 0
	movl	-4(%rbp), %eax	# taskId, tmp116
	cltq
	salq	$6, %rax	#, tmp117
	addq	$cfTasks+52, %rax	#, tmp118
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].maxExecutionTime, D.2533
	movq	-16(%rbp), %rax	# taskInfo, tmp119
	movl	%edx, 20(%rax)	# D.2533, taskInfo_4(D)->maxExecutionTime
	.loc 1 154 0
	movl	-4(%rbp), %eax	# taskId, tmp121
	cltq
	salq	$6, %rax	#, tmp122
	addq	$cfTasks+56, %rax	#, tmp123
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].totalExecutionTime, D.2533
	movq	-16(%rbp), %rax	# taskInfo, tmp124
	movl	%edx, 24(%rax)	# D.2533, taskInfo_4(D)->totalExecutionTime
	.loc 1 155 0
	movl	-4(%rbp), %eax	# taskId, tmp126
	cltq
	salq	$6, %rax	#, tmp127
	addq	$cfTasks+44, %rax	#, tmp128
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].averageExecutionTime, D.2533
	movq	-16(%rbp), %rax	# taskInfo, tmp129
	movl	%edx, 28(%rax)	# D.2533, taskInfo_4(D)->averageExecutionTime
	.loc 1 156 0
	movl	-4(%rbp), %eax	# taskId, tmp131
	cltq
	salq	$6, %rax	#, tmp132
	addq	$cfTasks+48, %rax	#, tmp133
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].taskLatestDeltaTime, D.2533
	movq	-16(%rbp), %rax	# taskInfo, tmp134
	movl	%edx, 32(%rax)	# D.2533, taskInfo_4(D)->latestDeltaTime
	.loc 1 157 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	getTaskInfo, .-getTaskInfo
	.section	.text.rescheduleTask,"ax",@progbits
	.globl	rescheduleTask
	.type	rescheduleTask, @function
rescheduleTask:
.LFB8:
	.loc 1 161 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# taskId, taskId
	movl	%esi, -24(%rbp)	# newPeriodMicros, newPeriodMicros
	.loc 1 162 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L31	#,
	.loc 1 162 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.2536
	cmpl	%eax, -20(%rbp)	# D.2537, taskId
	jge	.L35	#,
.L31:
.LBB6:
	.loc 1 163 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L33	#,
	.loc 1 163 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp92
	cltq
	salq	$6, %rax	#, tmp93
	addq	$cfTasks, %rax	#, D.2535
	jmp	.L34	#
.L33:
	.loc 1 163 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.2535
.L34:
	.loc 1 163 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.2535, task
	.loc 1 164 0 is_stmt 1 discriminator 4
	movl	$100, %eax	#, tmp94
	cmpl	$100, -24(%rbp)	#, newPeriodMicros
	cmovnb	-24(%rbp), %eax	# newPeriodMicros,, D.2536
	movl	%eax, %edx	# D.2536, D.2536
	movq	-8(%rbp), %rax	# task, tmp95
	movl	%edx, 24(%rax)	# D.2536, task_9->desiredPeriod
.L35:
.LBE6:
	.loc 1 166 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	rescheduleTask, .-rescheduleTask
	.section	.text.setTaskEnabled,"ax",@progbits
	.globl	setTaskEnabled
	.type	setTaskEnabled, @function
setTaskEnabled:
.LFB9:
	.loc 1 169 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movl	%edi, -20(%rbp)	# taskId, taskId
	movl	%esi, %eax	# enabled, tmp91
	movb	%al, -24(%rbp)	# tmp91, enabled
	.loc 1 170 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L37	#,
	.loc 1 170 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.2539
	cmpl	%eax, -20(%rbp)	# D.2540, taskId
	jge	.L42	#,
.L37:
.LBB7:
	.loc 1 171 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L39	#,
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp93
	cltq
	salq	$6, %rax	#, tmp94
	addq	$cfTasks, %rax	#, D.2538
	jmp	.L40	#
.L39:
	.loc 1 171 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.2538
.L40:
	.loc 1 171 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.2538, task
	.loc 1 172 0 is_stmt 1 discriminator 4
	cmpb	$0, -24(%rbp)	#, enabled
	je	.L41	#,
	.loc 1 172 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# task, tmp95
	movq	16(%rax), %rax	# task_9->taskFunc, D.2541
	testq	%rax, %rax	# D.2541
	je	.L41	#,
	.loc 1 173 0 is_stmt 1
	movq	-8(%rbp), %rax	# task, tmp96
	movq	%rax, %rdi	# tmp96,
	call	queueAdd	#
.LBE7:
	.loc 1 178 0
	jmp	.L42	#
.L41:
.LBB8:
	.loc 1 175 0
	movq	-8(%rbp), %rax	# task, tmp97
	movq	%rax, %rdi	# tmp97,
	call	queueRemove	#
.L42:
.LBE8:
	.loc 1 178 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	setTaskEnabled, .-setTaskEnabled
	.section	.text.getTaskDeltaTime,"ax",@progbits
	.globl	getTaskDeltaTime
	.type	getTaskDeltaTime, @function
getTaskDeltaTime:
.LFB10:
	.loc 1 181 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# taskId, taskId
	.loc 1 182 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L44	#,
	.loc 1 182 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.2544
	cmpl	%eax, -20(%rbp)	# D.2545, taskId
	jge	.L45	#,
.L44:
.LBB9:
	.loc 1 183 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L46	#,
	.loc 1 183 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp93
	cltq
	salq	$6, %rax	#, tmp94
	addq	$cfTasks, %rax	#, D.2542
	jmp	.L47	#
.L46:
	.loc 1 183 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.2542
.L47:
	.loc 1 183 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.2542, task
	.loc 1 184 0 is_stmt 1 discriminator 4
	movq	-8(%rbp), %rax	# task, tmp95
	movl	48(%rax), %eax	# task_10->taskLatestDeltaTime, D.2543
	jmp	.L48	#
.L45:
.LBE9:
	.loc 1 186 0
	movl	$0, %eax	#, D.2543
.L48:
	.loc 1 188 0
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	getTaskDeltaTime, .-getTaskDeltaTime
	.section	.text.schedulerInit,"ax",@progbits
	.globl	schedulerInit
	.type	schedulerInit, @function
schedulerInit:
.LFB11:
	.loc 1 191 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 192 0
	call	queueClear	#
	.loc 1 193 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	schedulerInit, .-schedulerInit
	.section	.text.scheduler,"ax",@progbits
	.globl	scheduler
	.type	scheduler, @function
scheduler:
.LFB12:
	.loc 1 196 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	.loc 1 199 0
	call	micros	#
	movl	%eax, currentTime(%rip)	# D.2548, currentTime
	.loc 1 202 0
	movl	$-1, -44(%rbp)	#, timeToNextRealtimeTask
.LBB10:
	.loc 1 203 0
	call	queueFirst	#
	movq	%rax, -24(%rbp)	# tmp160, task
	jmp	.L51	#
.L55:
.LBB11:
	.loc 1 204 0
	movq	-24(%rbp), %rax	# task, tmp161
	movl	36(%rax), %edx	# task_3->lastExecutedAt, D.2548
	movq	-24(%rbp), %rax	# task, tmp162
	movl	24(%rax), %eax	# task_3->desiredPeriod, D.2548
	addl	%edx, %eax	# D.2548, tmp163
	movl	%eax, -40(%rbp)	# tmp163, nextExecuteAt
	.loc 1 205 0
	movl	currentTime(%rip), %eax	# currentTime, D.2548
	subl	-40(%rbp), %eax	# nextExecuteAt, D.2548
	testl	%eax, %eax	# D.2546
	js	.L52	#,
	.loc 1 206 0
	movl	$0, -44(%rbp)	#, timeToNextRealtimeTask
	jmp	.L53	#
.L52:
.LBB12:
	.loc 1 208 0
	movl	currentTime(%rip), %eax	# currentTime, D.2548
	movl	-40(%rbp), %edx	# nextExecuteAt, tmp167
	subl	%eax, %edx	# D.2548, tmp166
	movl	%edx, %eax	# tmp166, tmp166
	movl	%eax, -36(%rbp)	# tmp166, newTimeInterval
	.loc 1 209 0
	movl	-44(%rbp), %eax	# timeToNextRealtimeTask, tmp169
	cmpl	%eax, -36(%rbp)	# tmp169, newTimeInterval
	cmovbe	-36(%rbp), %eax	# newTimeInterval,, tmp168
	movl	%eax, -44(%rbp)	# tmp168, timeToNextRealtimeTask
.L53:
.LBE12:
.LBE11:
	.loc 1 203 0 discriminator 2
	call	queueNext	#
	movq	%rax, -24(%rbp)	# tmp170, task
.L51:
	.loc 1 203 0 discriminator 1
	cmpq	$0, -24(%rbp)	#, task
	je	.L54	#,
	.loc 1 203 0 discriminator 3
	movq	-24(%rbp), %rax	# task, tmp171
	movzbl	28(%rax), %eax	# task_3->staticPriority, D.2549
	cmpb	$5, %al	#, D.2549
	ja	.L55	#,
.L54:
.LBE10:
	.loc 1 212 0
	movl	realtimeGuardInterval(%rip), %eax	# realtimeGuardInterval, D.2548
	cmpl	%eax, -44(%rbp)	# D.2548, timeToNextRealtimeTask
	seta	%al	#, tmp172
	movb	%al, -50(%rbp)	# tmp172, outsideRealtimeGuardInterval
	.loc 1 215 0
	movq	$0, -16(%rbp)	#, selectedTask
	.loc 1 216 0
	movw	$0, -48(%rbp)	#, selectedTaskDynamicPriority
	.loc 1 219 0
	movw	$0, -46(%rbp)	#, waitingTasks
.LBB13:
	.loc 1 220 0
	call	queueFirst	#
	movq	%rax, -8(%rbp)	# tmp173, task
	jmp	.L56	#
.L66:
	.loc 1 222 0
	movq	-8(%rbp), %rax	# task, tmp174
	movq	8(%rax), %rax	# task_11->checkFunc, D.2550
	testq	%rax, %rax	# D.2550
	je	.L57	#,
	.loc 1 224 0
	movq	-8(%rbp), %rax	# task, tmp175
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, D.2551
	testw	%ax, %ax	# D.2551
	je	.L58	#,
	.loc 1 225 0
	movl	currentTime(%rip), %edx	# currentTime, D.2548
	movq	-8(%rbp), %rax	# task, tmp176
	movl	40(%rax), %eax	# task_11->lastSignaledAt, D.2548
	movl	%edx, %ecx	# D.2548, D.2548
	subl	%eax, %ecx	# D.2548, D.2548
	movq	-8(%rbp), %rax	# task, tmp177
	movl	24(%rax), %esi	# task_11->desiredPeriod, D.2548
	movl	%ecx, %eax	# D.2548, tmp178
	movl	$0, %edx	#, tmp179
	divl	%esi	# D.2548
	leal	1(%rax), %edx	#, D.2551
	movq	-8(%rbp), %rax	# task, tmp180
	movw	%dx, 32(%rax)	# D.2551, task_11->taskAgeCycles
	.loc 1 226 0
	movq	-8(%rbp), %rax	# task, tmp181
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.2549
	movzbl	%al, %edx	# D.2549, D.2551
	movq	-8(%rbp), %rax	# task, tmp182
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.2551
	imull	%edx, %eax	# D.2551, D.2551
	leal	1(%rax), %edx	#, D.2551
	movq	-8(%rbp), %rax	# task, tmp183
	movw	%dx, 30(%rax)	# D.2551, task_11->dynamicPriority
	.loc 1 227 0
	movzwl	-46(%rbp), %eax	# waitingTasks, D.2551
	addl	$1, %eax	#, tmp184
	movw	%ax, -46(%rbp)	# tmp184, waitingTasks
	jmp	.L61	#
.L58:
	.loc 1 228 0
	movq	-8(%rbp), %rax	# task, tmp185
	movq	8(%rax), %rax	# task_11->checkFunc, D.2550
	movl	currentTime(%rip), %ecx	# currentTime, D.2548
	movq	-8(%rbp), %rdx	# task, tmp186
	movl	36(%rdx), %edx	# task_11->lastExecutedAt, D.2548
	subl	%edx, %ecx	# D.2548, D.2548
	movl	%ecx, %edx	# D.2548, D.2548
	movl	%edx, %edi	# D.2548,
	call	*%rax	# D.2550
	testb	%al, %al	# D.2552
	je	.L60	#,
	.loc 1 229 0
	movl	currentTime(%rip), %edx	# currentTime, D.2548
	movq	-8(%rbp), %rax	# task, tmp187
	movl	%edx, 40(%rax)	# D.2548, task_11->lastSignaledAt
	.loc 1 230 0
	movq	-8(%rbp), %rax	# task, tmp188
	movw	$1, 32(%rax)	#, task_11->taskAgeCycles
	.loc 1 231 0
	movq	-8(%rbp), %rax	# task, tmp189
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.2549
	movzbl	%al, %eax	# D.2549, D.2551
	leal	1(%rax), %edx	#, D.2551
	movq	-8(%rbp), %rax	# task, tmp190
	movw	%dx, 30(%rax)	# D.2551, task_11->dynamicPriority
	.loc 1 232 0
	movzwl	-46(%rbp), %eax	# waitingTasks, D.2551
	addl	$1, %eax	#, tmp191
	movw	%ax, -46(%rbp)	# tmp191, waitingTasks
	jmp	.L61	#
.L60:
	.loc 1 234 0
	movq	-8(%rbp), %rax	# task, tmp192
	movw	$0, 32(%rax)	#, task_11->taskAgeCycles
	jmp	.L61	#
.L57:
	.loc 1 239 0
	movl	currentTime(%rip), %edx	# currentTime, D.2548
	movq	-8(%rbp), %rax	# task, tmp193
	movl	36(%rax), %eax	# task_11->lastExecutedAt, D.2548
	movl	%edx, %ecx	# D.2548, D.2548
	subl	%eax, %ecx	# D.2548, D.2548
	movq	-8(%rbp), %rax	# task, tmp194
	movl	24(%rax), %edi	# task_11->desiredPeriod, D.2548
	movl	%ecx, %eax	# D.2548, tmp195
	movl	$0, %edx	#, tmp196
	divl	%edi	# D.2548
	movl	%eax, %edx	# D.2548, D.2551
	movq	-8(%rbp), %rax	# task, tmp197
	movw	%dx, 32(%rax)	# D.2551, task_11->taskAgeCycles
	.loc 1 240 0
	movq	-8(%rbp), %rax	# task, tmp198
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.2551
	testw	%ax, %ax	# D.2551
	je	.L61	#,
	.loc 1 241 0
	movq	-8(%rbp), %rax	# task, tmp199
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.2549
	movzbl	%al, %edx	# D.2549, D.2551
	movq	-8(%rbp), %rax	# task, tmp200
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.2551
	imull	%edx, %eax	# D.2551, D.2551
	leal	1(%rax), %edx	#, D.2551
	movq	-8(%rbp), %rax	# task, tmp201
	movw	%dx, 30(%rax)	# D.2551, task_11->dynamicPriority
	.loc 1 242 0
	movzwl	-46(%rbp), %eax	# waitingTasks, D.2551
	addl	$1, %eax	#, tmp202
	movw	%ax, -46(%rbp)	# tmp202, waitingTasks
.L61:
	.loc 1 246 0
	movq	-8(%rbp), %rax	# task, tmp203
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, D.2551
	cmpw	-48(%rbp), %ax	# selectedTaskDynamicPriority, D.2551
	jbe	.L62	#,
.LBB14:
	.loc 1 249 0
	cmpb	$0, -50(%rbp)	#, outsideRealtimeGuardInterval
	jne	.L63	#,
	.loc 1 249 0 is_stmt 0 discriminator 2
	movq	-8(%rbp), %rax	# task, tmp204
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.2551
	.loc 1 248 0 is_stmt 1 discriminator 2
	cmpw	$1, %ax	#, D.2551
	ja	.L63	#,
	.loc 1 250 0 discriminator 3
	movq	-8(%rbp), %rax	# task, tmp205
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.2549
	.loc 1 249 0 discriminator 3
	cmpb	$6, %al	#, D.2549
	jne	.L64	#,
.L63:
	.loc 1 249 0 is_stmt 0 discriminator 1
	movl	$1, %eax	#, D.2546
	jmp	.L65	#
.L64:
	.loc 1 249 0 discriminator 4
	movl	$0, %eax	#, D.2546
.L65:
	.loc 1 247 0 is_stmt 1
	movb	%al, -49(%rbp)	# D.2546, taskCanBeChosenForScheduling
	andb	$1, -49(%rbp)	#, taskCanBeChosenForScheduling
	.loc 1 251 0
	cmpb	$0, -49(%rbp)	#, taskCanBeChosenForScheduling
	je	.L62	#,
	.loc 1 252 0
	movq	-8(%rbp), %rax	# task, tmp206
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, tmp207
	movw	%ax, -48(%rbp)	# tmp207, selectedTaskDynamicPriority
	.loc 1 253 0
	movq	-8(%rbp), %rax	# task, tmp208
	movq	%rax, -16(%rbp)	# tmp208, selectedTask
.L62:
.LBE14:
	.loc 1 220 0 discriminator 2
	call	queueNext	#
	movq	%rax, -8(%rbp)	# tmp209, task
.L56:
	.loc 1 220 0 discriminator 1
	cmpq	$0, -8(%rbp)	#, task
	jne	.L66	#,
.LBE13:
	.loc 1 258 0
	movl	totalWaitingTasksSamples(%rip), %eax	# totalWaitingTasksSamples, D.2548
	addl	$1, %eax	#, D.2548
	movl	%eax, totalWaitingTasksSamples(%rip)	# D.2548, totalWaitingTasksSamples
	.loc 1 259 0
	movzwl	-46(%rbp), %edx	# waitingTasks, D.2548
	movl	totalWaitingTasks(%rip), %eax	# totalWaitingTasks, D.2548
	addl	%edx, %eax	# D.2548, D.2548
	movl	%eax, totalWaitingTasks(%rip)	# D.2548, totalWaitingTasks
	.loc 1 261 0
	movq	-16(%rbp), %rax	# selectedTask, tmp210
	movq	%rax, currentTask(%rip)	# tmp210, currentTask
	.loc 1 263 0
	cmpq	$0, -16(%rbp)	#, selectedTask
	je	.L68	#,
.LBB15:
	.loc 1 265 0
	movl	currentTime(%rip), %edx	# currentTime, D.2548
	movq	-16(%rbp), %rax	# selectedTask, tmp211
	movl	36(%rax), %eax	# selectedTask_5->lastExecutedAt, D.2548
	subl	%eax, %edx	# D.2548, D.2548
	movq	-16(%rbp), %rax	# selectedTask, tmp212
	movl	%edx, 48(%rax)	# D.2548, selectedTask_5->taskLatestDeltaTime
	.loc 1 266 0
	movl	currentTime(%rip), %edx	# currentTime, D.2548
	movq	-16(%rbp), %rax	# selectedTask, tmp213
	movl	%edx, 36(%rax)	# D.2548, selectedTask_5->lastExecutedAt
	.loc 1 267 0
	movq	-16(%rbp), %rax	# selectedTask, tmp214
	movw	$0, 30(%rax)	#, selectedTask_5->dynamicPriority
	.loc 1 270 0
	call	micros	#
	movl	%eax, -32(%rbp)	# D.2547, currentTimeBeforeTaskCall
	.loc 1 271 0
	movq	-16(%rbp), %rax	# selectedTask, tmp215
	movq	16(%rax), %rax	# selectedTask_5->taskFunc, D.2553
	call	*%rax	# D.2553
	.loc 1 272 0
	call	micros	#
	subl	-32(%rbp), %eax	# currentTimeBeforeTaskCall, tmp217
	movl	%eax, -28(%rbp)	# tmp217, taskExecutionTime
	.loc 1 274 0
	movq	-16(%rbp), %rax	# selectedTask, tmp218
	movl	44(%rax), %edx	# selectedTask_5->averageExecutionTime, D.2548
	movl	%edx, %eax	# D.2548, tmp219
	sall	$5, %eax	#, tmp220
	subl	%edx, %eax	# D.2548, D.2548
	movl	%eax, %edx	# D.2548, D.2548
	movl	-28(%rbp), %eax	# taskExecutionTime, tmp221
	addl	%edx, %eax	# D.2548, D.2548
	shrl	$5, %eax	#, D.2548
	movl	%eax, %edx	# D.2548, D.2548
	movq	-16(%rbp), %rax	# selectedTask, tmp222
	movl	%edx, 44(%rax)	# D.2548, selectedTask_5->averageExecutionTime
	.loc 1 276 0
	movq	-16(%rbp), %rax	# selectedTask, tmp223
	movl	56(%rax), %edx	# selectedTask_5->totalExecutionTime, D.2548
	movl	-28(%rbp), %eax	# taskExecutionTime, tmp224
	addl	%eax, %edx	# tmp224, D.2548
	movq	-16(%rbp), %rax	# selectedTask, tmp225
	movl	%edx, 56(%rax)	# D.2548, selectedTask_5->totalExecutionTime
	.loc 1 277 0
	movq	-16(%rbp), %rax	# selectedTask, tmp226
	movl	52(%rax), %edx	# selectedTask_5->maxExecutionTime, D.2548
	movl	-28(%rbp), %eax	# taskExecutionTime, tmp227
	cmpl	%eax, %edx	# tmp227, D.2548
	cmovb	%eax, %edx	# D.2548,, tmp227, D.2548
	movq	-16(%rbp), %rax	# selectedTask, tmp228
	movl	%edx, 52(%rax)	# D.2548, selectedTask_5->maxExecutionTime
.L68:
.LBE15:
	.loc 1 287 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	scheduler, .-scheduler
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "src/main/scheduler/scheduler.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x750
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF593
	.byte	0xc
	.long	.LASF594
	.long	.LASF595
	.long	.Ldebug_ranges0+0x30
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF517
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF518
	.uleb128 0x3
	.long	.LASF520
	.byte	0x2
	.byte	0x26
	.long	0x46
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF519
	.uleb128 0x3
	.long	.LASF521
	.byte	0x2
	.byte	0x30
	.long	0x5f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF522
	.uleb128 0x3
	.long	.LASF523
	.byte	0x2
	.byte	0x31
	.long	0x71
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF524
	.uleb128 0x3
	.long	.LASF525
	.byte	0x2
	.byte	0x33
	.long	0x83
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF526
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF527
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF528
	.uleb128 0x5
	.long	0x46
	.uleb128 0x6
	.byte	0x8
	.long	0xaa
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF529
	.uleb128 0x5
	.long	0xa3
	.uleb128 0x7
	.byte	0x4
	.long	0x83
	.byte	0x3
	.byte	0x1a
	.long	0xe0
	.uleb128 0x8
	.long	.LASF530
	.byte	0
	.uleb128 0x8
	.long	.LASF531
	.byte	0x1
	.uleb128 0x8
	.long	.LASF532
	.byte	0x3
	.uleb128 0x8
	.long	.LASF533
	.byte	0x5
	.uleb128 0x8
	.long	.LASF534
	.byte	0x6
	.uleb128 0x8
	.long	.LASF535
	.byte	0xff
	.byte	0
	.uleb128 0x9
	.byte	0x28
	.byte	0x3
	.byte	0x25
	.long	0x149
	.uleb128 0xa
	.long	.LASF536
	.byte	0x3
	.byte	0x26
	.long	0x9d
	.byte	0
	.uleb128 0xa
	.long	.LASF537
	.byte	0x3
	.byte	0x27
	.long	0x149
	.byte	0x8
	.uleb128 0xa
	.long	.LASF538
	.byte	0x3
	.byte	0x28
	.long	0x78
	.byte	0xc
	.uleb128 0xa
	.long	.LASF539
	.byte	0x3
	.byte	0x29
	.long	0x54
	.byte	0x10
	.uleb128 0xa
	.long	.LASF540
	.byte	0x3
	.byte	0x2a
	.long	0x78
	.byte	0x14
	.uleb128 0xa
	.long	.LASF541
	.byte	0x3
	.byte	0x2b
	.long	0x78
	.byte	0x18
	.uleb128 0xa
	.long	.LASF542
	.byte	0x3
	.byte	0x2c
	.long	0x78
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF543
	.byte	0x3
	.byte	0x2d
	.long	0x78
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF544
	.uleb128 0x3
	.long	.LASF545
	.byte	0x3
	.byte	0x2e
	.long	0xe0
	.uleb128 0x9
	.byte	0x40
	.byte	0x3
	.byte	0x30
	.long	0x200
	.uleb128 0xa
	.long	.LASF536
	.byte	0x3
	.byte	0x32
	.long	0x9d
	.byte	0
	.uleb128 0xa
	.long	.LASF546
	.byte	0x3
	.byte	0x33
	.long	0x20f
	.byte	0x8
	.uleb128 0xa
	.long	.LASF547
	.byte	0x3
	.byte	0x34
	.long	0x216
	.byte	0x10
	.uleb128 0xa
	.long	.LASF538
	.byte	0x3
	.byte	0x35
	.long	0x78
	.byte	0x18
	.uleb128 0xa
	.long	.LASF539
	.byte	0x3
	.byte	0x36
	.long	0x21c
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF548
	.byte	0x3
	.byte	0x39
	.long	0x66
	.byte	0x1e
	.uleb128 0xa
	.long	.LASF549
	.byte	0x3
	.byte	0x3a
	.long	0x66
	.byte	0x20
	.uleb128 0xa
	.long	.LASF550
	.byte	0x3
	.byte	0x3b
	.long	0x78
	.byte	0x24
	.uleb128 0xa
	.long	.LASF551
	.byte	0x3
	.byte	0x3c
	.long	0x78
	.byte	0x28
	.uleb128 0xa
	.long	.LASF542
	.byte	0x3
	.byte	0x3f
	.long	0x78
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF552
	.byte	0x3
	.byte	0x40
	.long	0x78
	.byte	0x30
	.uleb128 0xa
	.long	.LASF540
	.byte	0x3
	.byte	0x42
	.long	0x78
	.byte	0x34
	.uleb128 0xa
	.long	.LASF541
	.byte	0x3
	.byte	0x43
	.long	0x78
	.byte	0x38
	.byte	0
	.uleb128 0xb
	.long	0x149
	.long	0x20f
	.uleb128 0xc
	.long	0x78
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x200
	.uleb128 0xd
	.uleb128 0x6
	.byte	0x8
	.long	0x215
	.uleb128 0x5
	.long	0x54
	.uleb128 0x3
	.long	.LASF553
	.byte	0x3
	.byte	0x45
	.long	0x15b
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF554
	.uleb128 0xe
	.long	.LASF596
	.byte	0x1
	.byte	0x36
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.long	.LASF555
	.byte	0x1
	.byte	0x44
	.long	0x149
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x29b
	.uleb128 0x10
	.long	.LASF557
	.byte	0x1
	.byte	0x44
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x12
	.string	"ii"
	.byte	0x1
	.byte	0x46
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x221
	.uleb128 0x13
	.long	.LASF556
	.byte	0x1
	.byte	0x4e
	.long	0x149
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x2f0
	.uleb128 0x10
	.long	.LASF557
	.byte	0x1
	.byte	0x4e
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x12
	.string	"ii"
	.byte	0x1
	.byte	0x53
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	.LASF558
	.byte	0x1
	.byte	0x5e
	.long	0x149
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x33f
	.uleb128 0x10
	.long	.LASF557
	.byte	0x1
	.byte	0x5e
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x12
	.string	"ii"
	.byte	0x1
	.byte	0x60
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF559
	.byte	0x1
	.byte	0x6d
	.long	0x29b
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF560
	.byte	0x1
	.byte	0x76
	.long	0x29b
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF562
	.byte	0x1
	.byte	0x7b
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c5
	.uleb128 0x16
	.long	.LASF561
	.byte	0x1
	.byte	0x85
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x16
	.long	.LASF557
	.byte	0x1
	.byte	0x86
	.long	0x3c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3cb
	.uleb128 0x5
	.long	0x221
	.uleb128 0x15
	.long	.LASF563
	.byte	0x1
	.byte	0x93
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x40a
	.uleb128 0x10
	.long	.LASF564
	.byte	0x1
	.byte	0x93
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.long	.LASF565
	.byte	0x1
	.byte	0x93
	.long	0x40a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x150
	.uleb128 0x17
	.long	.LASF566
	.byte	0x1
	.byte	0xa0
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x46a
	.uleb128 0x10
	.long	.LASF564
	.byte	0x1
	.byte	0xa0
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF567
	.byte	0x1
	.byte	0xa0
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x16
	.long	.LASF557
	.byte	0x1
	.byte	0xa3
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LASF568
	.byte	0x1
	.byte	0xa8
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x4b8
	.uleb128 0x10
	.long	.LASF564
	.byte	0x1
	.byte	0xa8
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF569
	.byte	0x1
	.byte	0xa8
	.long	0x149
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.long	.Ldebug_ranges0+0
	.uleb128 0x16
	.long	.LASF557
	.byte	0x1
	.byte	0xab
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF597
	.byte	0x1
	.byte	0xb4
	.long	0x78
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x508
	.uleb128 0x10
	.long	.LASF564
	.byte	0x1
	.byte	0xb4
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x16
	.long	.LASF557
	.byte	0x1
	.byte	0xb7
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF598
	.byte	0x1
	.byte	0xbe
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF570
	.byte	0x1
	.byte	0xc3
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x65f
	.uleb128 0x16
	.long	.LASF571
	.byte	0x1
	.byte	0xca
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x16
	.long	.LASF572
	.byte	0x1
	.byte	0xd4
	.long	0x65f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -66
	.uleb128 0x16
	.long	.LASF573
	.byte	0x1
	.byte	0xd7
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.long	.LASF574
	.byte	0x1
	.byte	0xd8
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x16
	.long	.LASF575
	.byte	0x1
	.byte	0xdb
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -62
	.uleb128 0x1b
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x5e9
	.uleb128 0x16
	.long	.LASF557
	.byte	0x1
	.byte	0xcb
	.long	0x3c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x16
	.long	.LASF576
	.byte	0x1
	.byte	0xcc
	.long	0x664
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x16
	.long	.LASF577
	.byte	0x1
	.byte	0xd0
	.long	0x664
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.long	0x62e
	.uleb128 0x16
	.long	.LASF557
	.byte	0x1
	.byte	0xdc
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x16
	.long	.LASF578
	.byte	0x1
	.byte	0xf7
	.long	0x65f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -65
	.byte	0
	.byte	0
	.uleb128 0x11
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x1c
	.long	.LASF579
	.byte	0x1
	.value	0x10e
	.long	0x664
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.long	.LASF580
	.byte	0x1
	.value	0x110
	.long	0x664
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x149
	.uleb128 0x5
	.long	0x78
	.uleb128 0x16
	.long	.LASF581
	.byte	0x1
	.byte	0x25
	.long	0x29b
	.uleb128 0x9
	.byte	0x3
	.quad	currentTask
	.uleb128 0x16
	.long	.LASF582
	.byte	0x1
	.byte	0x2b
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	totalWaitingTasks
	.uleb128 0x16
	.long	.LASF583
	.byte	0x1
	.byte	0x2c
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	totalWaitingTasksSamples
	.uleb128 0x16
	.long	.LASF584
	.byte	0x1
	.byte	0x2d
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	realtimeGuardInterval
	.uleb128 0x16
	.long	.LASF585
	.byte	0x1
	.byte	0x33
	.long	0x46
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueuePos
	.uleb128 0x16
	.long	.LASF586
	.byte	0x1
	.byte	0x34
	.long	0x83
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueueSize
	.uleb128 0x1d
	.long	.LASF587
	.byte	0x1
	.byte	0x30
	.long	0x66
	.uleb128 0x9
	.byte	0x3
	.quad	averageSystemLoadPercent
	.uleb128 0x1e
	.long	0x29b
	.long	0x707
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.long	.LASF588
	.byte	0x3
	.byte	0x4a
	.long	0x6fc
	.uleb128 0x20
	.long	.LASF589
	.byte	0x3
	.byte	0x4b
	.long	0x664
	.uleb128 0x20
	.long	.LASF590
	.byte	0x3
	.byte	0x4c
	.long	0x664
	.uleb128 0x1e
	.long	0x221
	.long	0x733
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.long	.LASF591
	.byte	0x3
	.byte	0x4d
	.long	0x728
	.uleb128 0x1d
	.long	.LASF592
	.byte	0x1
	.byte	0x2f
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	currentTime
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x21
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0xec
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.quad	.LFB1
	.quad	.LFE1-.LFB1
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
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB7
	.quad	.LBE7
	.quad	.LBB8
	.quad	.LBE8
	.quad	0
	.quad	0
	.quad	.LFB0
	.quad	.LFE0
	.quad	.LFB1
	.quad	.LFE1
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
	.quad	0
	.quad	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
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
	.file 4 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.byte	0x5
	.uleb128 0x14
	.long	.LASF254
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x6
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF260
	.file 7 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro3
	.file 8 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro4
	.file 9 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.file 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0xa
	.file 11 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 12 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF458
	.byte	0x4
	.file 13 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro10
	.file 14 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.file 15 "/usr/include/xlocale.h"
	.byte	0x3
	.uleb128 0x9f
	.uleb128 0xf
	.byte	0x5
	.uleb128 0x15
	.long	.LASF483
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 16 "./src/main/build/debug.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.file 17 "./src/main/build/build_config.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.file 18 "./src/main/common/maths.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 19 "./src/main/drivers/system.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x13
	.byte	0x4
	.byte	0x5
	.uleb128 0x27
	.long	.LASF514
	.byte	0x5
	.uleb128 0x28
	.long	.LASF515
	.byte	0x5
	.uleb128 0x29
	.long	.LASF516
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
	.long	.LASF255
	.byte	0x5
	.uleb128 0x21
	.long	.LASF256
	.byte	0x5
	.uleb128 0x22
	.long	.LASF257
	.byte	0x5
	.uleb128 0x23
	.long	.LASF258
	.byte	0x5
	.uleb128 0x34
	.long	.LASF259
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.8a17512e4762abcff59e629b80463c10,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF261
	.byte	0x6
	.uleb128 0x61
	.long	.LASF262
	.byte	0x6
	.uleb128 0x62
	.long	.LASF263
	.byte	0x6
	.uleb128 0x63
	.long	.LASF264
	.byte	0x6
	.uleb128 0x64
	.long	.LASF265
	.byte	0x6
	.uleb128 0x65
	.long	.LASF266
	.byte	0x6
	.uleb128 0x66
	.long	.LASF267
	.byte	0x6
	.uleb128 0x67
	.long	.LASF268
	.byte	0x6
	.uleb128 0x68
	.long	.LASF269
	.byte	0x6
	.uleb128 0x69
	.long	.LASF270
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF271
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF272
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF273
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF274
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF275
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF276
	.byte	0x6
	.uleb128 0x70
	.long	.LASF277
	.byte	0x6
	.uleb128 0x71
	.long	.LASF278
	.byte	0x6
	.uleb128 0x72
	.long	.LASF279
	.byte	0x6
	.uleb128 0x73
	.long	.LASF280
	.byte	0x6
	.uleb128 0x74
	.long	.LASF281
	.byte	0x6
	.uleb128 0x75
	.long	.LASF282
	.byte	0x6
	.uleb128 0x76
	.long	.LASF283
	.byte	0x6
	.uleb128 0x77
	.long	.LASF284
	.byte	0x6
	.uleb128 0x78
	.long	.LASF285
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF286
	.byte	0x5
	.uleb128 0x88
	.long	.LASF287
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF288
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF289
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF290
	.byte	0x5
	.uleb128 0xce
	.long	.LASF291
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF292
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF293
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF294
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF295
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF296
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF297
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF298
	.byte	0x5
	.uleb128 0x101
	.long	.LASF299
	.byte	0x5
	.uleb128 0x105
	.long	.LASF300
	.byte	0x5
	.uleb128 0x109
	.long	.LASF301
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF264
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF291
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF263
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF290
	.byte	0x5
	.uleb128 0x111
	.long	.LASF302
	.byte	0x6
	.uleb128 0x112
	.long	.LASF303
	.byte	0x5
	.uleb128 0x113
	.long	.LASF304
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF305
	.byte	0x5
	.uleb128 0x141
	.long	.LASF306
	.byte	0x5
	.uleb128 0x154
	.long	.LASF307
	.byte	0x6
	.uleb128 0x161
	.long	.LASF308
	.byte	0x5
	.uleb128 0x162
	.long	.LASF309
	.byte	0x5
	.uleb128 0x166
	.long	.LASF310
	.byte	0x5
	.uleb128 0x167
	.long	.LASF311
	.byte	0x5
	.uleb128 0x169
	.long	.LASF312
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF313
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF314
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF315
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF316
	.byte	0x5
	.uleb128 0x37
	.long	.LASF317
	.byte	0x5
	.uleb128 0x38
	.long	.LASF318
	.byte	0x5
	.uleb128 0x39
	.long	.LASF319
	.byte	0x5
	.uleb128 0x52
	.long	.LASF320
	.byte	0x5
	.uleb128 0x53
	.long	.LASF321
	.byte	0x5
	.uleb128 0x58
	.long	.LASF322
	.byte	0x5
	.uleb128 0x59
	.long	.LASF323
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF324
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF325
	.byte	0x5
	.uleb128 0x65
	.long	.LASF326
	.byte	0x5
	.uleb128 0x66
	.long	.LASF327
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF328
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF329
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF330
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF331
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF332
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF333
	.byte	0x5
	.uleb128 0x84
	.long	.LASF334
	.byte	0x5
	.uleb128 0x85
	.long	.LASF335
	.byte	0x5
	.uleb128 0x88
	.long	.LASF336
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF337
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF338
	.byte	0x5
	.uleb128 0x96
	.long	.LASF339
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF340
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF341
	.byte	0x5
	.uleb128 0xba
	.long	.LASF342
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF343
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF344
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF345
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF346
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF347
	.byte	0x5
	.uleb128 0xec
	.long	.LASF348
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF349
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF350
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF351
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF352
	.byte	0x5
	.uleb128 0x114
	.long	.LASF353
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF354
	.byte	0x5
	.uleb128 0x125
	.long	.LASF355
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF356
	.byte	0x5
	.uleb128 0x133
	.long	.LASF357
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF358
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF359
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF360
	.byte	0x5
	.uleb128 0x157
	.long	.LASF361
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF362
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF363
	.byte	0x5
	.uleb128 0x172
	.long	.LASF364
	.byte	0x5
	.uleb128 0x181
	.long	.LASF365
	.byte	0x5
	.uleb128 0x182
	.long	.LASF366
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.256e8fdbd37801980286acdbc40d0280,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF367
	.byte	0x5
	.uleb128 0xa
	.long	.LASF368
	.byte	0x5
	.uleb128 0xc
	.long	.LASF369
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF370
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF371
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF372
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF373
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF374
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF375
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF376
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.918ceb5fa58268542bf143e4c1efbcf3,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF377
	.byte	0x5
	.uleb128 0xb
	.long	.LASF378
	.byte	0x5
	.uleb128 0xc
	.long	.LASF379
	.byte	0x5
	.uleb128 0xd
	.long	.LASF380
	.byte	0x5
	.uleb128 0xe
	.long	.LASF381
	.byte	0x5
	.uleb128 0xf
	.long	.LASF382
	.byte	0x5
	.uleb128 0x10
	.long	.LASF383
	.byte	0x5
	.uleb128 0x11
	.long	.LASF384
	.byte	0x5
	.uleb128 0x12
	.long	.LASF385
	.byte	0x5
	.uleb128 0x13
	.long	.LASF386
	.byte	0x5
	.uleb128 0x14
	.long	.LASF387
	.byte	0x5
	.uleb128 0x15
	.long	.LASF388
	.byte	0x5
	.uleb128 0x16
	.long	.LASF389
	.byte	0x5
	.uleb128 0x17
	.long	.LASF390
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF391
	.byte	0x5
	.uleb128 0x22
	.long	.LASF392
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF393
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.e53b4d001f0b958bab74645e9a3f6a60,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF394
	.byte	0x5
	.uleb128 0x34
	.long	.LASF395
	.byte	0x5
	.uleb128 0x78
	.long	.LASF396
	.byte	0x5
	.uleb128 0x91
	.long	.LASF104
	.byte	0x5
	.uleb128 0x92
	.long	.LASF112
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF397
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF398
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF399
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF400
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF401
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF402
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF403
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF404
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF405
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF406
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF407
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF408
	.byte	0x5
	.uleb128 0xad
	.long	.LASF409
	.byte	0x5
	.uleb128 0xae
	.long	.LASF410
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF411
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF412
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF413
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF414
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF415
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF416
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF417
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF418
	.byte	0x5
	.uleb128 0xba
	.long	.LASF419
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF420
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF421
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF422
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF423
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF424
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF425
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF426
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF427
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF428
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF429
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF430
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF431
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF432
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF433
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF434
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF435
	.byte	0x5
	.uleb128 0xec
	.long	.LASF436
	.byte	0x5
	.uleb128 0xee
	.long	.LASF437
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF438
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF439
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF440
	.byte	0x5
	.uleb128 0x100
	.long	.LASF441
	.byte	0x5
	.uleb128 0x101
	.long	.LASF442
	.byte	0x5
	.uleb128 0x105
	.long	.LASF443
	.byte	0x5
	.uleb128 0x111
	.long	.LASF444
	.byte	0x5
	.uleb128 0x112
	.long	.LASF445
	.byte	0x5
	.uleb128 0x116
	.long	.LASF446
	.byte	0x5
	.uleb128 0x117
	.long	.LASF447
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF448
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF449
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF450
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF451
	.byte	0x5
	.uleb128 0x124
	.long	.LASF452
	.byte	0x5
	.uleb128 0x125
	.long	.LASF453
	.byte	0x5
	.uleb128 0x126
	.long	.LASF454
	.byte	0x5
	.uleb128 0x128
	.long	.LASF455
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF456
	.byte	0x5
	.uleb128 0x130
	.long	.LASF457
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.8394011d5995a16f15d67d04e84a1d69,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF459
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF460
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF461
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.187.2ff233552538c6ff9b8575ca8ea52cb3,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF462
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF463
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF464
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF465
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF466
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF467
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF468
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF469
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF470
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF471
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF472
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF473
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF474
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF475
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF476
	.byte	0x5
	.uleb128 0xca
	.long	.LASF477
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF478
	.byte	0x6
	.uleb128 0xee
	.long	.LASF479
	.byte	0x6
	.uleb128 0x191
	.long	.LASF480
	.byte	0x5
	.uleb128 0x196
	.long	.LASF481
	.byte	0x6
	.uleb128 0x19c
	.long	.LASF482
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.scheduler.h.22.67b0f3cbb70e9dc5f74939aa0db55023,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.long	.LASF484
	.byte	0x5
	.uleb128 0x17
	.long	.LASF485
	.byte	0x5
	.uleb128 0x18
	.long	.LASF486
	.byte	0x5
	.uleb128 0x23
	.long	.LASF487
	.byte	0x5
	.uleb128 0x57
	.long	.LASF488
	.byte	0x5
	.uleb128 0x59
	.long	.LASF489
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.debug.h.18.6574db8528ee4536a81057c3a08cdb4d,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.long	.LASF490
	.byte	0x5
	.uleb128 0x15
	.long	.LASF491
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF492
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF493
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.build_config.h.20.1bf8432fc8be9a81fe8cce0e3f98279c,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF494
	.byte	0x5
	.uleb128 0x15
	.long	.LASF495
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF496
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF497
	.byte	0x5
	.uleb128 0x20
	.long	.LASF498
	.byte	0x5
	.uleb128 0x21
	.long	.LASF499
	.byte	0x5
	.uleb128 0x27
	.long	.LASF500
	.byte	0x5
	.uleb128 0x28
	.long	.LASF501
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.maths.h.21.5b067f47e9a221ec30aa8aaee7f7dece,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF502
	.byte	0x5
	.uleb128 0x19
	.long	.LASF503
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF504
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF505
	.byte	0x5
	.uleb128 0x21
	.long	.LASF506
	.byte	0x5
	.uleb128 0x22
	.long	.LASF507
	.byte	0x5
	.uleb128 0x23
	.long	.LASF508
	.byte	0x5
	.uleb128 0x62
	.long	.LASF509
	.byte	0x5
	.uleb128 0x63
	.long	.LASF510
	.byte	0x5
	.uleb128 0x64
	.long	.LASF511
	.byte	0x5
	.uleb128 0x65
	.long	.LASF512
	.byte	0x5
	.uleb128 0x66
	.long	.LASF513
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF469:
	.string	"_SIZE_T_ "
.LASF265:
	.string	"__USE_ISOCXX11"
.LASF574:
	.string	"selectedTaskDynamicPriority"
.LASF489:
	.string	"isSystemOverloaded() (averageSystemLoadPercent >= LOAD_PERCENTAGE_ONE)"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF494:
	.string	"UNUSED(x) (void)(x)"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF260:
	.string	"_STDINT_H 1"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF475:
	.string	"___int_size_t_h "
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF516:
	.string	"REALTIME_GUARD_INTERVAL_MARGIN 25"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF339:
	.string	"__flexarr []"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF361:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF358:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF435:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF345:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF427:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF550:
	.string	"lastExecutedAt"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF593:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF297:
	.string	"__USE_POSIX 1"
.LASF313:
	.string	"_SYS_CDEFS_H 1"
.LASF365:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF484:
	.string	"TASK_PERIOD_HZ(hz) (1000000 / (hz))"
.LASF287:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF464:
	.string	"_SIZE_T "
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF461:
	.string	"__need_NULL "
.LASF371:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF526:
	.string	"unsigned int"
.LASF312:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF408:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF493:
	.string	"TIME_SECTION_END(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[1][index] = micros(); debug[index] = sectionTimes[1][index] - sectionTimes[0][index]; }"
.LASF293:
	.string	"_POSIX_SOURCE"
.LASF273:
	.string	"__USE_XOPEN2K"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF394:
	.string	"__int8_t_defined "
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF5:
	.string	"__GNUC__ 5"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF388:
	.string	"__stub_sigreturn "
.LASF468:
	.string	"__SIZE_T "
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF308:
	.string	"__GNU_LIBRARY__"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF378:
	.string	"__stub_chflags "
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF531:
	.string	"TASK_PRIORITY_LOW"
.LASF380:
	.string	"__stub_fchflags "
.LASF413:
	.string	"INT_LEAST8_MAX (127)"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF369:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF350:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF474:
	.string	"_SIZE_T_DECLARED "
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF328:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF291:
	.string	"__USE_ISOC95 1"
.LASF330:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF276:
	.string	"__USE_XOPEN2K8XSI"
.LASF515:
	.string	"REALTIME_GUARD_INTERVAL_MAX 300"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF237:
	.string	"linux 1"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF418:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF402:
	.string	"INT16_MAX (32767)"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF594:
	.string	"src/main/scheduler/scheduler.c"
.LASF473:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF569:
	.string	"enabled"
.LASF440:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF272:
	.string	"__USE_UNIX98"
.LASF307:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF303:
	.string	"_ATFILE_SOURCE"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF319:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF547:
	.string	"taskFunc"
.LASF449:
	.string	"INT16_C(c) c"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF467:
	.string	"_T_SIZE "
.LASF415:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF407:
	.string	"UINT32_MAX (4294967295U)"
.LASF548:
	.string	"dynamicPriority"
.LASF573:
	.string	"selectedTask"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF317:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF466:
	.string	"_T_SIZE_ "
.LASF525:
	.string	"uint32_t"
.LASF458:
	.string	"_GCC_WRAP_STDINT_H "
.LASF509:
	.string	"sin_approx(x) sinf(x)"
.LASF431:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF416:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF359:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF419:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF506:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF387:
	.string	"__stub_setlogin "
.LASF239:
	.string	"__unix__ 1"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF495:
	.string	"BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))"
.LASF532:
	.string	"TASK_PRIORITY_MEDIUM"
.LASF470:
	.string	"_BSD_SIZE_T_ "
.LASF542:
	.string	"averageExecutionTime"
.LASF554:
	.string	"float"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF596:
	.string	"queueClear"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF582:
	.string	"totalWaitingTasks"
.LASF445:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF318:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF396:
	.string	"__intptr_t_defined "
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF349:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF492:
	.string	"TIME_SECTION_BEGIN(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[0][index] = micros(); }"
.LASF286:
	.string	"__KERNEL_STRICT_NAMES "
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF269:
	.string	"__USE_POSIX199506"
.LASF450:
	.string	"INT32_C(c) c"
.LASF342:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF321:
	.string	"__PMT(args) args"
.LASF454:
	.string	"UINT32_C(c) c ## U"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF476:
	.string	"_GCC_SIZE_T "
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF383:
	.string	"__stub_gtty "
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF584:
	.string	"realtimeGuardInterval"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF228:
	.string	"__MMX__ 1"
.LASF579:
	.string	"currentTimeBeforeTaskCall"
.LASF347:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF390:
	.string	"__stub_stty "
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF428:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF546:
	.string	"checkFunc"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF301:
	.string	"__USE_XOPEN2K 1"
.LASF398:
	.string	"INT16_MIN (-32767-1)"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF403:
	.string	"INT32_MAX (2147483647)"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF285:
	.string	"__KERNEL_STRICT_NAMES"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF376:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF264:
	.string	"__USE_ISOC95"
.LASF496:
	.string	"STATIC_UNIT_TESTED static"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF263:
	.string	"__USE_ISOC99"
.LASF299:
	.string	"__USE_POSIX199309 1"
.LASF255:
	.string	"_STDBOOL_H "
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF385:
	.string	"__stub_putmsg "
.LASF544:
	.string	"_Bool"
.LASF257:
	.string	"true 1"
.LASF326:
	.string	"__BEGIN_DECLS "
.LASF480:
	.string	"NULL"
.LASF447:
	.string	"WINT_MAX (4294967295u)"
.LASF437:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF401:
	.string	"INT8_MAX (127)"
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF289:
	.string	"_DEFAULT_SOURCE 1"
.LASF598:
	.string	"schedulerInit"
.LASF543:
	.string	"latestDeltaTime"
.LASF425:
	.string	"INT_FAST8_MAX (127)"
.LASF367:
	.string	"__WORDSIZE 64"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF538:
	.string	"desiredPeriod"
.LASF456:
	.string	"INTMAX_C(c) c ## L"
.LASF227:
	.string	"__code_model_small__ 1"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF245:
	.string	"EDISON 1"
.LASF410:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF486:
	.string	"TASK_PERIOD_US(us) (us)"
.LASF481:
	.string	"NULL ((void *)0)"
.LASF354:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF379:
	.string	"__stub_fattach "
.LASF442:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF500:
	.string	"REQUIRE_CC_ARM_PRINTF_SUPPORT "
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF570:
	.string	"scheduler"
.LASF534:
	.string	"TASK_PRIORITY_REALTIME"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF325:
	.string	"__long_double_t long double"
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF477:
	.string	"_SIZET_ "
.LASF341:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF453:
	.string	"UINT16_C(c) c"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF324:
	.string	"__ptr_t void *"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF529:
	.string	"char"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF513:
	.string	"tan_approx(x) tanf(x)"
.LASF446:
	.string	"WINT_MIN (0u)"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF521:
	.string	"uint8_t"
.LASF220:
	.string	"__x86_64__ 1"
.LASF436:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF586:
	.string	"taskQueueSize"
.LASF530:
	.string	"TASK_PRIORITY_IDLE"
.LASF340:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF300:
	.string	"__USE_POSIX199506 1"
.LASF235:
	.string	"__linux 1"
.LASF444:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF502:
	.string	"sq(x) ((x)*(x))"
.LASF566:
	.string	"rescheduleTask"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF362:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF372:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF392:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF357:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF356:
	.string	"__wur "
.LASF399:
	.string	"INT32_MIN (-2147483647-1)"
.LASF511:
	.string	"atan2_approx(y,x) atan2f(y,x)"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF331:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF499:
	.string	"UNIT_TESTED "
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF268:
	.string	"__USE_POSIX199309"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF360:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF491:
	.string	"DEBUG_SECTION_TIMES "
.LASF553:
	.string	"cfTask_t"
.LASF448:
	.string	"INT8_C(c) c"
.LASF306:
	.string	"__USE_ATFILE 1"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF17:
	.string	"__LP64__ 1"
.LASF510:
	.string	"cos_approx(x) cosf(x)"
.LASF539:
	.string	"staticPriority"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF406:
	.string	"UINT16_MAX (65535)"
.LASF348:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF373:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF577:
	.string	"newTimeInterval"
.LASF16:
	.string	"_LP64 1"
.LASF261:
	.string	"_FEATURES_H 1"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF298:
	.string	"__USE_POSIX2 1"
.LASF501:
	.string	"REQUIRE_PRINTF_LONG_SUPPORT "
.LASF219:
	.string	"__x86_64 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF333:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF557:
	.string	"task"
.LASF243:
	.string	"DEBUG 1"
.LASF533:
	.string	"TASK_PRIORITY_HIGH"
.LASF304:
	.string	"_ATFILE_SOURCE 1"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF314:
	.string	"__PMT"
.LASF507:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF241:
	.string	"__ELF__ 1"
.LASF322:
	.string	"__CONCAT(x,y) x ## y"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF560:
	.string	"queueNext"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF572:
	.string	"outsideRealtimeGuardInterval"
.LASF575:
	.string	"waitingTasks"
.LASF549:
	.string	"taskAgeCycles"
.LASF455:
	.string	"UINT64_C(c) c ## UL"
.LASF309:
	.string	"__GNU_LIBRARY__ 6"
.LASF0:
	.string	"__STDC__ 1"
.LASF503:
	.string	"FAST_TRIGONOMETRY "
.LASF230:
	.string	"__SSE2__ 1"
.LASF292:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF417:
	.string	"UINT_LEAST8_MAX (255)"
.LASF463:
	.string	"__SIZE_T__ "
.LASF561:
	.string	"maxNonRealtimeTaskTime"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF412:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF296:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF433:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF393:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF595:
	.string	"/home/aravind/git/cleanflight"
.LASF432:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF505:
	.string	"RAD (M_PIf / 180.0f)"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF282:
	.string	"__USE_GNU"
.LASF335:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF535:
	.string	"TASK_PRIORITY_MAX"
.LASF352:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF483:
	.string	"_XLOCALE_H 1"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF254:
	.string	"SRC_MAIN_SCHEDULER_C_ "
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF512:
	.string	"acos_approx(x) acosf(x)"
.LASF256:
	.string	"bool _Bool"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF351:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF581:
	.string	"currentTask"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF592:
	.string	"currentTime"
.LASF279:
	.string	"__USE_FILE_OFFSET64"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF485:
	.string	"TASK_PERIOD_MS(ms) ((ms) * 1000)"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF329:
	.string	"__END_NAMESPACE_STD "
.LASF366:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF405:
	.string	"UINT8_MAX (255)"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF311:
	.string	"__GLIBC_MINOR__ 23"
.LASF384:
	.string	"__stub_lchmod "
.LASF460:
	.string	"__need_size_t "
.LASF334:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF281:
	.string	"__USE_ATFILE"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF523:
	.string	"uint16_t"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF564:
	.string	"taskId"
.LASF479:
	.string	"__need_size_t"
.LASF315:
	.string	"__LEAF , __leaf__"
.LASF545:
	.string	"cfTaskInfo_t"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF551:
	.string	"lastSignaledAt"
.LASF568:
	.string	"setTaskEnabled"
.LASF284:
	.string	"__USE_FORTIFY_LEVEL"
.LASF451:
	.string	"INT64_C(c) c ## L"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF424:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF563:
	.string	"getTaskInfo"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF336:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF457:
	.string	"UINTMAX_C(c) c ## UL"
.LASF323:
	.string	"__STRING(x) #x"
.LASF567:
	.string	"newPeriodMicros"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF397:
	.string	"INT8_MIN (-128)"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF585:
	.string	"taskQueuePos"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF441:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF587:
	.string	"averageSystemLoadPercent"
.LASF518:
	.string	"short int"
.LASF429:
	.string	"UINT_FAST8_MAX (255)"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF382:
	.string	"__stub_getmsg "
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF259:
	.string	"__bool_true_false_are_defined 1"
.LASF519:
	.string	"long int"
.LASF391:
	.string	"_BITS_WCHAR_H 1"
.LASF395:
	.string	"__uint32_t_defined "
.LASF267:
	.string	"__USE_POSIX2"
.LASF218:
	.string	"__amd64__ 1"
.LASF426:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF482:
	.string	"__need_NULL"
.LASF420:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF541:
	.string	"totalExecutionTime"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF290:
	.string	"__USE_ISOC99 1"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF465:
	.string	"_SYS_SIZE_T_H "
.LASF386:
	.string	"__stub_revoke "
.LASF370:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF283:
	.string	"__USE_REENTRANT"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF389:
	.string	"__stub_sstk "
.LASF275:
	.string	"__USE_XOPEN2K8"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF270:
	.string	"__USE_XOPEN"
.LASF597:
	.string	"getTaskDeltaTime"
.LASF443:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF295:
	.string	"_POSIX_C_SOURCE"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF478:
	.string	"__size_t "
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF537:
	.string	"isEnabled"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF559:
	.string	"queueFirst"
.LASF280:
	.string	"__USE_MISC"
.LASF302:
	.string	"__USE_XOPEN2K8 1"
.LASF332:
	.string	"__END_NAMESPACE_C99 "
.LASF434:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF536:
	.string	"taskName"
.LASF288:
	.string	"_DEFAULT_SOURCE"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF459:
	.string	"_STRING_H 1"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF337:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF472:
	.string	"_SIZE_T_DEFINED "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF377:
	.string	"__stub___compat_bdflush "
.LASF381:
	.string	"__stub_fdetach "
.LASF497:
	.string	"STATIC_INLINE_UNIT_TESTED static inline"
.LASF528:
	.string	"sizetype"
.LASF310:
	.string	"__GLIBC__ 2"
.LASF262:
	.string	"__USE_ISOC11"
.LASF527:
	.string	"long unsigned int"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF556:
	.string	"queueAdd"
.LASF238:
	.string	"__unix 1"
.LASF508:
	.string	"ABS(x) ((x) > 0 ? (x) : -(x))"
.LASF498:
	.string	"INLINE_UNIT_TESTED inline"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF520:
	.string	"int32_t"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF571:
	.string	"timeToNextRealtimeTask"
.LASF375:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF344:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF422:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF487:
	.string	"TASK_SELF -1"
.LASF320:
	.string	"__P(args) args"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF589:
	.string	"taskQueueArraySize"
.LASF274:
	.string	"__USE_XOPEN2KXSI"
.LASF346:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF588:
	.string	"taskQueueArray"
.LASF225:
	.string	"__k8 1"
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF364:
	.string	"__restrict_arr __restrict"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF353:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF522:
	.string	"unsigned char"
.LASF562:
	.string	"taskSystem"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF439:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF430:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF231:
	.string	"__FXSR__ 1"
.LASF316:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF294:
	.string	"_POSIX_SOURCE 1"
.LASF590:
	.string	"taskCount"
.LASF409:
	.string	"INT_LEAST8_MIN (-128)"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF514:
	.string	"REALTIME_GUARD_INTERVAL_MIN 10"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF226:
	.string	"__k8__ 1"
.LASF248:
	.string	"__REVISION__ \"c69f0d5\""
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF271:
	.string	"__USE_XOPEN_EXTENDED"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF421:
	.string	"INT_FAST8_MIN (-128)"
.LASF278:
	.string	"__USE_LARGEFILE64"
.LASF488:
	.string	"LOAD_PERCENTAGE_ONE 100"
.LASF580:
	.string	"taskExecutionTime"
.LASF565:
	.string	"taskInfo"
.LASF490:
	.string	"DEBUG16_VALUE_COUNT 4"
.LASF552:
	.string	"taskLatestDeltaTime"
.LASF355:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF591:
	.string	"cfTasks"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF327:
	.string	"__END_DECLS "
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF583:
	.string	"totalWaitingTasksSamples"
.LASF555:
	.string	"queueContains"
.LASF414:
	.string	"INT_LEAST16_MAX (32767)"
.LASF277:
	.string	"__USE_LARGEFILE"
.LASF517:
	.string	"signed char"
.LASF540:
	.string	"maxExecutionTime"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF305:
	.string	"__USE_MISC 1"
.LASF524:
	.string	"short unsigned int"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF229:
	.string	"__SSE__ 1"
.LASF504:
	.string	"M_PIf 3.14159265358979323846f"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF578:
	.string	"taskCanBeChosenForScheduling"
.LASF363:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF452:
	.string	"UINT8_C(c) c"
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF338:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF343:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF217:
	.string	"__amd64 1"
.LASF236:
	.string	"__linux__ 1"
.LASF368:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF423:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF558:
	.string	"queueRemove"
.LASF400:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF258:
	.string	"false 0"
.LASF404:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF240:
	.string	"unix 1"
.LASF576:
	.string	"nextExecuteAt"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF266:
	.string	"__USE_POSIX"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF411:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF471:
	.string	"_SIZE_T_DEFINED_ "
.LASF462:
	.string	"__size_t__ "
.LASF438:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF374:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
