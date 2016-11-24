	.file	"scheduler.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed scheduler.i -mtune=generic -march=x86-64
# -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -fverbose-asm
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
	.loc 1 56 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 57 0
	movl	taskQueueArraySize(%rip), %eax	# taskQueueArraySize, D.3013
	movl	%eax, %eax	# D.3013, D.3014
	salq	$3, %rax	#, D.3014
	movq	%rax, %rdx	# D.3014,
	movl	$0, %esi	#,
	movl	$taskQueueArray, %edi	#,
	call	memset	#
	.loc 1 58 0
	movl	$0, taskQueuePos(%rip)	#, taskQueuePos
	.loc 1 59 0
	movl	$0, taskQueueSize(%rip)	#, taskQueueSize
	.loc 1 60 0
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
	.loc 1 70 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# task, task
.LBB2:
	.loc 1 71 0
	movl	$0, -4(%rbp)	#, ii
	jmp	.L3	#
.L6:
	.loc 1 72 0
	movl	-4(%rbp), %eax	# ii, tmp91
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3017
	cmpq	-24(%rbp), %rax	# task, D.3017
	jne	.L4	#,
	.loc 1 73 0
	movl	$1, %eax	#, D.3015
	jmp	.L5	#
.L4:
	.loc 1 71 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L3:
	.loc 1 71 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3016
	cmpl	%eax, -4(%rbp)	# D.3016, ii
	jb	.L6	#,
.LBE2:
	.loc 1 76 0 is_stmt 1
	movl	$0, %eax	#, D.3015
.L5:
	.loc 1 77 0
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
	.loc 1 80 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# task, task
	.loc 1 81 0
	movl	taskQueueSize(%rip), %edx	# taskQueueSize, D.3019
	movl	taskCount(%rip), %eax	# taskCount, D.3019
	cmpl	%eax, %edx	# D.3019, D.3019
	jnb	.L8	#,
	.loc 1 81 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax	# task, tmp106
	movq	%rax, %rdi	# tmp106,
	call	queueContains	#
	testb	%al, %al	# D.3018
	je	.L9	#,
.L8:
	.loc 1 82 0 is_stmt 1
	movl	$0, %eax	#, D.3018
	jmp	.L10	#
.L9:
.LBB3:
	.loc 1 84 0
	movl	$0, -4(%rbp)	#, ii
	jmp	.L11	#
.L14:
	.loc 1 85 0
	movl	-4(%rbp), %eax	# ii, tmp107
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3020
	testq	%rax, %rax	# D.3020
	je	.L12	#,
	.loc 1 85 0 discriminator 1
	movl	-4(%rbp), %eax	# ii, tmp108
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3020
	movzbl	28(%rax), %edx	# _14->staticPriority, D.3021
	movq	-24(%rbp), %rax	# task, tmp109
	movzbl	28(%rax), %eax	# task_8(D)->staticPriority, D.3021
	cmpb	%al, %dl	# D.3021, D.3021
	jnb	.L13	#,
.L12:
	.loc 1 86 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3019
	subl	-4(%rbp), %eax	# ii, D.3019
	movl	%eax, %eax	# D.3019, D.3022
	leaq	0(,%rax,8), %rdx	#, D.3022
	movl	-4(%rbp), %eax	# ii, tmp110
	salq	$3, %rax	#, tmp111
	leaq	taskQueueArray(%rax), %rcx	#, D.3023
	movl	-4(%rbp), %eax	# ii, tmp112
	addl	$1, %eax	#, D.3019
	movl	%eax, %eax	# D.3019, tmp113
	salq	$3, %rax	#, tmp114
	addq	$taskQueueArray, %rax	#, D.3023
	movq	%rcx, %rsi	# D.3023,
	movq	%rax, %rdi	# D.3023,
	call	memmove	#
	.loc 1 87 0
	movl	-4(%rbp), %eax	# ii, tmp115
	movq	-24(%rbp), %rdx	# task, tmp116
	movq	%rdx, taskQueueArray(,%rax,8)	# tmp116, taskQueueArray
	.loc 1 88 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3019
	addl	$1, %eax	#, D.3019
	movl	%eax, taskQueueSize(%rip)	# D.3019, taskQueueSize
	.loc 1 89 0
	movl	$1, %eax	#, D.3018
	jmp	.L10	#
.L13:
	.loc 1 84 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L11:
	.loc 1 84 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3019
	cmpl	%eax, -4(%rbp)	# D.3019, ii
	jbe	.L14	#,
.LBE3:
	.loc 1 92 0 is_stmt 1
	movl	$0, %eax	#, D.3018
.L10:
	.loc 1 93 0
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
	.loc 1 96 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# task, task
.LBB4:
	.loc 1 97 0
	movl	$0, -4(%rbp)	#, ii
	jmp	.L16	#
.L19:
	.loc 1 98 0
	movl	-4(%rbp), %eax	# ii, tmp100
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3026
	cmpq	-24(%rbp), %rax	# task, D.3026
	jne	.L17	#,
	.loc 1 99 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3025
	subl	-4(%rbp), %eax	# ii, D.3025
	movl	%eax, %eax	# D.3025, D.3027
	leaq	0(,%rax,8), %rdx	#, D.3027
	movl	-4(%rbp), %eax	# ii, tmp101
	addl	$1, %eax	#, D.3025
	movl	%eax, %eax	# D.3025, tmp102
	salq	$3, %rax	#, tmp103
	leaq	taskQueueArray(%rax), %rcx	#, D.3028
	movl	-4(%rbp), %eax	# ii, tmp104
	salq	$3, %rax	#, tmp105
	addq	$taskQueueArray, %rax	#, D.3028
	movq	%rcx, %rsi	# D.3028,
	movq	%rax, %rdi	# D.3028,
	call	memmove	#
	.loc 1 100 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3025
	subl	$1, %eax	#, D.3025
	movl	%eax, taskQueueSize(%rip)	# D.3025, taskQueueSize
	.loc 1 101 0
	movl	$1, %eax	#, D.3024
	jmp	.L18	#
.L17:
	.loc 1 97 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L16:
	.loc 1 97 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3025
	cmpl	%eax, -4(%rbp)	# D.3025, ii
	jb	.L19	#,
.LBE4:
	.loc 1 104 0 is_stmt 1
	movl	$0, %eax	#, D.3024
.L18:
	.loc 1 105 0
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
	.loc 1 111 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 112 0
	movl	$0, taskQueuePos(%rip)	#, taskQueuePos
	.loc 1 113 0
	movq	taskQueueArray(%rip), %rax	# taskQueueArray, D.3029
	.loc 1 114 0
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
	.loc 1 120 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 121 0
	movl	taskQueuePos(%rip), %eax	# taskQueuePos, D.3030
	addl	$1, %eax	#, D.3030
	movl	%eax, taskQueuePos(%rip)	# D.3030, taskQueuePos
	movl	taskQueuePos(%rip), %eax	# taskQueuePos, D.3030
	cltq
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3031
	.loc 1 122 0
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
	.loc 1 125 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	.loc 1 127 0
	movl	totalWaitingTasksSamples(%rip), %eax	# totalWaitingTasksSamples, D.3032
	testl	%eax, %eax	# D.3032
	je	.L25	#,
	.loc 1 128 0
	movl	totalWaitingTasks(%rip), %eax	# totalWaitingTasks, D.3032
	imull	$100, %eax, %eax	#, D.3032, D.3032
	movl	totalWaitingTasksSamples(%rip), %ecx	# totalWaitingTasksSamples, D.3032
	movl	$0, %edx	#, tmp100
	divl	%ecx	# D.3032
	movw	%ax, averageSystemLoadPercent(%rip)	# D.3033, averageSystemLoadPercent
	.loc 1 129 0
	movl	$0, totalWaitingTasksSamples(%rip)	#, totalWaitingTasksSamples
	.loc 1 130 0
	movl	$0, totalWaitingTasks(%rip)	#, totalWaitingTasks
.L25:
	.loc 1 134 0
	movl	$0, -12(%rbp)	#, maxNonRealtimeTaskTime
.LBB5:
	.loc 1 135 0
	call	queueFirst	#
	movq	%rax, -8(%rbp)	# tmp101, task
	jmp	.L26	#
.L28:
	.loc 1 136 0
	movq	-8(%rbp), %rax	# task, tmp102
	movzbl	28(%rax), %eax	# task_3->staticPriority, D.3034
	cmpb	$6, %al	#, D.3034
	je	.L27	#,
	.loc 1 137 0
	movq	-8(%rbp), %rax	# task, tmp103
	movl	44(%rax), %edx	# task_3->averageExecutionTime, D.3032
	movl	-12(%rbp), %eax	# maxNonRealtimeTaskTime, tmp105
	cmpl	%eax, %edx	# tmp105, D.3032
	cmovnb	%edx, %eax	# D.3032,, tmp104
	movl	%eax, -12(%rbp)	# tmp104, maxNonRealtimeTaskTime
.L27:
	.loc 1 135 0 discriminator 2
	call	queueNext	#
	movq	%rax, -8(%rbp)	# tmp106, task
.L26:
	.loc 1 135 0 discriminator 1
	cmpq	$0, -8(%rbp)	#, task
	jne	.L28	#,
.LBE5:
	.loc 1 141 0
	movl	-12(%rbp), %eax	# maxNonRealtimeTaskTime, D.3035
	movl	$300, %edx	#,
	movl	$10, %esi	#,
	movl	%eax, %edi	# D.3035,
	call	constrain	#
	addl	$25, %eax	#, D.3035
	movl	%eax, realtimeGuardInterval(%rip)	# D.3032, realtimeGuardInterval
	.loc 1 145 0
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
	.loc 1 149 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# taskId, taskId
	movq	%rsi, -16(%rbp)	# taskInfo, taskInfo
	.loc 1 150 0
	movl	-4(%rbp), %eax	# taskId, tmp97
	cltq
	salq	$6, %rax	#, tmp98
	addq	$cfTasks, %rax	#, tmp99
	movq	(%rax), %rdx	# cfTasks[taskId_2(D)].taskName, D.3036
	movq	-16(%rbp), %rax	# taskInfo, tmp100
	movq	%rdx, (%rax)	# D.3036, taskInfo_4(D)->taskName
	.loc 1 151 0
	movl	-4(%rbp), %eax	# taskId, tmp102
	cltq
	salq	$6, %rax	#, tmp103
	addq	$cfTasks, %rax	#, D.3037
	movq	%rax, %rdi	# D.3037,
	call	queueContains	#
	movl	%eax, %edx	#, D.3038
	movq	-16(%rbp), %rax	# taskInfo, tmp104
	movb	%dl, 8(%rax)	# D.3038, taskInfo_4(D)->isEnabled
	.loc 1 152 0
	movl	-4(%rbp), %eax	# taskId, tmp106
	cltq
	salq	$6, %rax	#, tmp107
	addq	$cfTasks+24, %rax	#, tmp108
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].desiredPeriod, D.3039
	movq	-16(%rbp), %rax	# taskInfo, tmp109
	movl	%edx, 12(%rax)	# D.3039, taskInfo_4(D)->desiredPeriod
	.loc 1 153 0
	movl	-4(%rbp), %eax	# taskId, tmp111
	cltq
	salq	$6, %rax	#, tmp112
	addq	$cfTasks+28, %rax	#, tmp113
	movzbl	(%rax), %edx	# cfTasks[taskId_2(D)].staticPriority, D.3040
	movq	-16(%rbp), %rax	# taskInfo, tmp114
	movb	%dl, 16(%rax)	# D.3040, taskInfo_4(D)->staticPriority
	.loc 1 154 0
	movl	-4(%rbp), %eax	# taskId, tmp116
	cltq
	salq	$6, %rax	#, tmp117
	addq	$cfTasks+52, %rax	#, tmp118
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].maxExecutionTime, D.3039
	movq	-16(%rbp), %rax	# taskInfo, tmp119
	movl	%edx, 20(%rax)	# D.3039, taskInfo_4(D)->maxExecutionTime
	.loc 1 155 0
	movl	-4(%rbp), %eax	# taskId, tmp121
	cltq
	salq	$6, %rax	#, tmp122
	addq	$cfTasks+56, %rax	#, tmp123
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].totalExecutionTime, D.3039
	movq	-16(%rbp), %rax	# taskInfo, tmp124
	movl	%edx, 24(%rax)	# D.3039, taskInfo_4(D)->totalExecutionTime
	.loc 1 156 0
	movl	-4(%rbp), %eax	# taskId, tmp126
	cltq
	salq	$6, %rax	#, tmp127
	addq	$cfTasks+44, %rax	#, tmp128
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].averageExecutionTime, D.3039
	movq	-16(%rbp), %rax	# taskInfo, tmp129
	movl	%edx, 28(%rax)	# D.3039, taskInfo_4(D)->averageExecutionTime
	.loc 1 157 0
	movl	-4(%rbp), %eax	# taskId, tmp131
	cltq
	salq	$6, %rax	#, tmp132
	addq	$cfTasks+48, %rax	#, tmp133
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].taskLatestDeltaTime, D.3039
	movq	-16(%rbp), %rax	# taskInfo, tmp134
	movl	%edx, 32(%rax)	# D.3039, taskInfo_4(D)->latestDeltaTime
	.loc 1 158 0
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
	.loc 1 162 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# taskId, taskId
	movl	%esi, -24(%rbp)	# newPeriodMicros, newPeriodMicros
	.loc 1 163 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L31	#,
	.loc 1 163 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.3042
	cmpl	%eax, -20(%rbp)	# D.3043, taskId
	jge	.L35	#,
.L31:
.LBB6:
	.loc 1 164 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L33	#,
	.loc 1 164 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp92
	cltq
	salq	$6, %rax	#, tmp93
	addq	$cfTasks, %rax	#, D.3041
	jmp	.L34	#
.L33:
	.loc 1 164 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.3041
.L34:
	.loc 1 164 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.3041, task
	.loc 1 165 0 is_stmt 1 discriminator 4
	movl	$100, %eax	#, tmp94
	cmpl	$100, -24(%rbp)	#, newPeriodMicros
	cmovnb	-24(%rbp), %eax	# newPeriodMicros,, D.3042
	movl	%eax, %edx	# D.3042, D.3042
	movq	-8(%rbp), %rax	# task, tmp95
	movl	%edx, 24(%rax)	# D.3042, task_9->desiredPeriod
.L35:
.LBE6:
	.loc 1 167 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	rescheduleTask, .-rescheduleTask
	.section	.rodata
.LC0:
	.string	"1"
.LC1:
	.string	"2"
	.section	.text.setTaskEnabled,"ax",@progbits
	.globl	setTaskEnabled
	.type	setTaskEnabled, @function
setTaskEnabled:
.LFB9:
	.loc 1 170 0
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
	.loc 1 171 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L37	#,
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.3045
	cmpl	%eax, -20(%rbp)	# D.3046, taskId
	jge	.L42	#,
.L37:
.LBB7:
	.loc 1 172 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L39	#,
	.loc 1 172 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp93
	cltq
	salq	$6, %rax	#, tmp94
	addq	$cfTasks, %rax	#, D.3044
	jmp	.L40	#
.L39:
	.loc 1 172 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.3044
.L40:
	.loc 1 172 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.3044, task
	.loc 1 173 0 is_stmt 1 discriminator 4
	cmpb	$0, -24(%rbp)	#, enabled
	je	.L41	#,
	.loc 1 173 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# task, tmp95
	movq	16(%rax), %rax	# task_9->taskFunc, D.3047
	testq	%rax, %rax	# D.3047
	je	.L41	#,
	.loc 1 174 0 is_stmt 1
	movl	$.LC0, %edi	#,
	call	puts	#
	.loc 1 175 0
	movq	-8(%rbp), %rax	# task, tmp96
	movq	%rax, %rdi	# tmp96,
	call	queueAdd	#
.LBE7:
	.loc 1 181 0
	jmp	.L42	#
.L41:
.LBB8:
	.loc 1 177 0
	movl	$.LC1, %edi	#,
	call	puts	#
	.loc 1 178 0
	movq	-8(%rbp), %rax	# task, tmp97
	movq	%rax, %rdi	# tmp97,
	call	queueRemove	#
.L42:
.LBE8:
	.loc 1 181 0
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
	.loc 1 184 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# taskId, taskId
	.loc 1 185 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L44	#,
	.loc 1 185 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.3052
	cmpl	%eax, -20(%rbp)	# D.3053, taskId
	jge	.L45	#,
.L44:
.LBB9:
	.loc 1 186 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L46	#,
	.loc 1 186 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp93
	cltq
	salq	$6, %rax	#, tmp94
	addq	$cfTasks, %rax	#, D.3050
	jmp	.L47	#
.L46:
	.loc 1 186 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.3050
.L47:
	.loc 1 186 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.3050, task
	.loc 1 187 0 is_stmt 1 discriminator 4
	movq	-8(%rbp), %rax	# task, tmp95
	movl	48(%rax), %eax	# task_10->taskLatestDeltaTime, D.3051
	jmp	.L48	#
.L45:
.LBE9:
	.loc 1 189 0
	movl	$0, %eax	#, D.3051
.L48:
	.loc 1 191 0
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
	.loc 1 194 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 195 0
	call	queueClear	#
	.loc 1 196 0
	nop
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	schedulerInit, .-schedulerInit
	.section	.rodata
.LC2:
	.string	"current take:%s\n"
	.section	.text.scheduler,"ax",@progbits
	.globl	scheduler
	.type	scheduler, @function
scheduler:
.LFB12:
	.loc 1 199 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	.loc 1 202 0
	call	micros	#
	movl	%eax, currentTime(%rip)	# D.3056, currentTime
	.loc 1 203 0
	call	queueFirst	#
	movq	%rax, -8(%rbp)	# tmp161, temp
	.loc 1 204 0
	cmpq	$0, -8(%rbp)	#, temp
	je	.L51	#,
	.loc 1 205 0
	movq	-8(%rbp), %rax	# temp, tmp162
	movq	(%rax), %rax	# temp_25->taskName, D.3057
	movq	%rax, %rsi	# D.3057,
	movl	$.LC2, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
.L51:
	.loc 1 208 0
	movl	$-1, -52(%rbp)	#, timeToNextRealtimeTask
.LBB10:
	.loc 1 209 0
	call	queueFirst	#
	movq	%rax, -32(%rbp)	# tmp163, task
	jmp	.L52	#
.L56:
.LBB11:
	.loc 1 210 0
	movq	-32(%rbp), %rax	# task, tmp164
	movl	36(%rax), %edx	# task_3->lastExecutedAt, D.3056
	movq	-32(%rbp), %rax	# task, tmp165
	movl	24(%rax), %eax	# task_3->desiredPeriod, D.3056
	addl	%edx, %eax	# D.3056, tmp166
	movl	%eax, -48(%rbp)	# tmp166, nextExecuteAt
	.loc 1 211 0
	movl	currentTime(%rip), %eax	# currentTime, D.3056
	subl	-48(%rbp), %eax	# nextExecuteAt, D.3056
	testl	%eax, %eax	# D.3054
	js	.L53	#,
	.loc 1 212 0
	movl	$0, -52(%rbp)	#, timeToNextRealtimeTask
	jmp	.L54	#
.L53:
.LBB12:
	.loc 1 214 0
	movl	currentTime(%rip), %eax	# currentTime, D.3056
	movl	-48(%rbp), %edx	# nextExecuteAt, tmp170
	subl	%eax, %edx	# D.3056, tmp169
	movl	%edx, %eax	# tmp169, tmp169
	movl	%eax, -44(%rbp)	# tmp169, newTimeInterval
	.loc 1 215 0
	movl	-52(%rbp), %eax	# timeToNextRealtimeTask, tmp172
	cmpl	%eax, -44(%rbp)	# tmp172, newTimeInterval
	cmovbe	-44(%rbp), %eax	# newTimeInterval,, tmp171
	movl	%eax, -52(%rbp)	# tmp171, timeToNextRealtimeTask
.L54:
.LBE12:
.LBE11:
	.loc 1 209 0 discriminator 2
	call	queueNext	#
	movq	%rax, -32(%rbp)	# tmp173, task
.L52:
	.loc 1 209 0 discriminator 1
	cmpq	$0, -32(%rbp)	#, task
	je	.L55	#,
	.loc 1 209 0 discriminator 3
	movq	-32(%rbp), %rax	# task, tmp174
	movzbl	28(%rax), %eax	# task_3->staticPriority, D.3058
	cmpb	$5, %al	#, D.3058
	ja	.L56	#,
.L55:
.LBE10:
	.loc 1 218 0
	movl	realtimeGuardInterval(%rip), %eax	# realtimeGuardInterval, D.3056
	cmpl	%eax, -52(%rbp)	# D.3056, timeToNextRealtimeTask
	seta	%al	#, tmp175
	movb	%al, -58(%rbp)	# tmp175, outsideRealtimeGuardInterval
	.loc 1 221 0
	movq	$0, -24(%rbp)	#, selectedTask
	.loc 1 222 0
	movw	$0, -56(%rbp)	#, selectedTaskDynamicPriority
	.loc 1 225 0
	movw	$0, -54(%rbp)	#, waitingTasks
.LBB13:
	.loc 1 226 0
	call	queueFirst	#
	movq	%rax, -16(%rbp)	# tmp176, task
	jmp	.L57	#
.L67:
	.loc 1 228 0
	movq	-16(%rbp), %rax	# task, tmp177
	movq	8(%rax), %rax	# task_11->checkFunc, D.3059
	testq	%rax, %rax	# D.3059
	je	.L58	#,
	.loc 1 230 0
	movq	-16(%rbp), %rax	# task, tmp178
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, D.3060
	testw	%ax, %ax	# D.3060
	je	.L59	#,
	.loc 1 231 0
	movl	currentTime(%rip), %edx	# currentTime, D.3056
	movq	-16(%rbp), %rax	# task, tmp179
	movl	40(%rax), %eax	# task_11->lastSignaledAt, D.3056
	movl	%edx, %ecx	# D.3056, D.3056
	subl	%eax, %ecx	# D.3056, D.3056
	movq	-16(%rbp), %rax	# task, tmp180
	movl	24(%rax), %esi	# task_11->desiredPeriod, D.3056
	movl	%ecx, %eax	# D.3056, tmp181
	movl	$0, %edx	#, tmp182
	divl	%esi	# D.3056
	leal	1(%rax), %edx	#, D.3060
	movq	-16(%rbp), %rax	# task, tmp183
	movw	%dx, 32(%rax)	# D.3060, task_11->taskAgeCycles
	.loc 1 232 0
	movq	-16(%rbp), %rax	# task, tmp184
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3058
	movzbl	%al, %edx	# D.3058, D.3060
	movq	-16(%rbp), %rax	# task, tmp185
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3060
	imull	%edx, %eax	# D.3060, D.3060
	leal	1(%rax), %edx	#, D.3060
	movq	-16(%rbp), %rax	# task, tmp186
	movw	%dx, 30(%rax)	# D.3060, task_11->dynamicPriority
	.loc 1 233 0
	movzwl	-54(%rbp), %eax	# waitingTasks, D.3060
	addl	$1, %eax	#, tmp187
	movw	%ax, -54(%rbp)	# tmp187, waitingTasks
	jmp	.L62	#
.L59:
	.loc 1 234 0
	movq	-16(%rbp), %rax	# task, tmp188
	movq	8(%rax), %rax	# task_11->checkFunc, D.3059
	movl	currentTime(%rip), %ecx	# currentTime, D.3056
	movq	-16(%rbp), %rdx	# task, tmp189
	movl	36(%rdx), %edx	# task_11->lastExecutedAt, D.3056
	subl	%edx, %ecx	# D.3056, D.3056
	movl	%ecx, %edx	# D.3056, D.3056
	movl	%edx, %edi	# D.3056,
	call	*%rax	# D.3059
	testb	%al, %al	# D.3061
	je	.L61	#,
	.loc 1 235 0
	movl	currentTime(%rip), %edx	# currentTime, D.3056
	movq	-16(%rbp), %rax	# task, tmp190
	movl	%edx, 40(%rax)	# D.3056, task_11->lastSignaledAt
	.loc 1 236 0
	movq	-16(%rbp), %rax	# task, tmp191
	movw	$1, 32(%rax)	#, task_11->taskAgeCycles
	.loc 1 237 0
	movq	-16(%rbp), %rax	# task, tmp192
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3058
	movzbl	%al, %eax	# D.3058, D.3060
	leal	1(%rax), %edx	#, D.3060
	movq	-16(%rbp), %rax	# task, tmp193
	movw	%dx, 30(%rax)	# D.3060, task_11->dynamicPriority
	.loc 1 238 0
	movzwl	-54(%rbp), %eax	# waitingTasks, D.3060
	addl	$1, %eax	#, tmp194
	movw	%ax, -54(%rbp)	# tmp194, waitingTasks
	jmp	.L62	#
.L61:
	.loc 1 240 0
	movq	-16(%rbp), %rax	# task, tmp195
	movw	$0, 32(%rax)	#, task_11->taskAgeCycles
	jmp	.L62	#
.L58:
	.loc 1 245 0
	movl	currentTime(%rip), %edx	# currentTime, D.3056
	movq	-16(%rbp), %rax	# task, tmp196
	movl	36(%rax), %eax	# task_11->lastExecutedAt, D.3056
	movl	%edx, %ecx	# D.3056, D.3056
	subl	%eax, %ecx	# D.3056, D.3056
	movq	-16(%rbp), %rax	# task, tmp197
	movl	24(%rax), %edi	# task_11->desiredPeriod, D.3056
	movl	%ecx, %eax	# D.3056, tmp198
	movl	$0, %edx	#, tmp199
	divl	%edi	# D.3056
	movl	%eax, %edx	# D.3056, D.3060
	movq	-16(%rbp), %rax	# task, tmp200
	movw	%dx, 32(%rax)	# D.3060, task_11->taskAgeCycles
	.loc 1 246 0
	movq	-16(%rbp), %rax	# task, tmp201
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3060
	testw	%ax, %ax	# D.3060
	je	.L62	#,
	.loc 1 247 0
	movq	-16(%rbp), %rax	# task, tmp202
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3058
	movzbl	%al, %edx	# D.3058, D.3060
	movq	-16(%rbp), %rax	# task, tmp203
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3060
	imull	%edx, %eax	# D.3060, D.3060
	leal	1(%rax), %edx	#, D.3060
	movq	-16(%rbp), %rax	# task, tmp204
	movw	%dx, 30(%rax)	# D.3060, task_11->dynamicPriority
	.loc 1 248 0
	movzwl	-54(%rbp), %eax	# waitingTasks, D.3060
	addl	$1, %eax	#, tmp205
	movw	%ax, -54(%rbp)	# tmp205, waitingTasks
.L62:
	.loc 1 252 0
	movq	-16(%rbp), %rax	# task, tmp206
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, D.3060
	cmpw	-56(%rbp), %ax	# selectedTaskDynamicPriority, D.3060
	jbe	.L63	#,
.LBB14:
	.loc 1 255 0
	cmpb	$0, -58(%rbp)	#, outsideRealtimeGuardInterval
	jne	.L64	#,
	.loc 1 255 0 is_stmt 0 discriminator 2
	movq	-16(%rbp), %rax	# task, tmp207
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3060
	.loc 1 254 0 is_stmt 1 discriminator 2
	cmpw	$1, %ax	#, D.3060
	ja	.L64	#,
	.loc 1 256 0 discriminator 3
	movq	-16(%rbp), %rax	# task, tmp208
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3058
	.loc 1 255 0 discriminator 3
	cmpb	$6, %al	#, D.3058
	jne	.L65	#,
.L64:
	.loc 1 255 0 is_stmt 0 discriminator 1
	movl	$1, %eax	#, D.3054
	jmp	.L66	#
.L65:
	.loc 1 255 0 discriminator 4
	movl	$0, %eax	#, D.3054
.L66:
	.loc 1 253 0 is_stmt 1
	movb	%al, -57(%rbp)	# D.3054, taskCanBeChosenForScheduling
	andb	$1, -57(%rbp)	#, taskCanBeChosenForScheduling
	.loc 1 257 0
	cmpb	$0, -57(%rbp)	#, taskCanBeChosenForScheduling
	je	.L63	#,
	.loc 1 258 0
	movq	-16(%rbp), %rax	# task, tmp209
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, tmp210
	movw	%ax, -56(%rbp)	# tmp210, selectedTaskDynamicPriority
	.loc 1 259 0
	movq	-16(%rbp), %rax	# task, tmp211
	movq	%rax, -24(%rbp)	# tmp211, selectedTask
.L63:
.LBE14:
	.loc 1 226 0 discriminator 2
	call	queueNext	#
	movq	%rax, -16(%rbp)	# tmp212, task
.L57:
	.loc 1 226 0 discriminator 1
	cmpq	$0, -16(%rbp)	#, task
	jne	.L67	#,
.LBE13:
	.loc 1 264 0
	movl	totalWaitingTasksSamples(%rip), %eax	# totalWaitingTasksSamples, D.3056
	addl	$1, %eax	#, D.3056
	movl	%eax, totalWaitingTasksSamples(%rip)	# D.3056, totalWaitingTasksSamples
	.loc 1 265 0
	movzwl	-54(%rbp), %edx	# waitingTasks, D.3056
	movl	totalWaitingTasks(%rip), %eax	# totalWaitingTasks, D.3056
	addl	%edx, %eax	# D.3056, D.3056
	movl	%eax, totalWaitingTasks(%rip)	# D.3056, totalWaitingTasks
	.loc 1 267 0
	movq	-24(%rbp), %rax	# selectedTask, tmp213
	movq	%rax, currentTask(%rip)	# tmp213, currentTask
	.loc 1 269 0
	cmpq	$0, -24(%rbp)	#, selectedTask
	je	.L69	#,
.LBB15:
	.loc 1 271 0
	movl	currentTime(%rip), %edx	# currentTime, D.3056
	movq	-24(%rbp), %rax	# selectedTask, tmp214
	movl	36(%rax), %eax	# selectedTask_5->lastExecutedAt, D.3056
	subl	%eax, %edx	# D.3056, D.3056
	movq	-24(%rbp), %rax	# selectedTask, tmp215
	movl	%edx, 48(%rax)	# D.3056, selectedTask_5->taskLatestDeltaTime
	.loc 1 272 0
	movl	currentTime(%rip), %edx	# currentTime, D.3056
	movq	-24(%rbp), %rax	# selectedTask, tmp216
	movl	%edx, 36(%rax)	# D.3056, selectedTask_5->lastExecutedAt
	.loc 1 273 0
	movq	-24(%rbp), %rax	# selectedTask, tmp217
	movw	$0, 30(%rax)	#, selectedTask_5->dynamicPriority
	.loc 1 276 0
	call	micros	#
	movl	%eax, -40(%rbp)	# D.3055, currentTimeBeforeTaskCall
	.loc 1 277 0
	movq	-24(%rbp), %rax	# selectedTask, tmp218
	movq	16(%rax), %rax	# selectedTask_5->taskFunc, D.3062
	call	*%rax	# D.3062
	.loc 1 278 0
	call	micros	#
	subl	-40(%rbp), %eax	# currentTimeBeforeTaskCall, tmp220
	movl	%eax, -36(%rbp)	# tmp220, taskExecutionTime
	.loc 1 280 0
	movq	-24(%rbp), %rax	# selectedTask, tmp221
	movl	44(%rax), %edx	# selectedTask_5->averageExecutionTime, D.3056
	movl	%edx, %eax	# D.3056, tmp222
	sall	$5, %eax	#, tmp223
	subl	%edx, %eax	# D.3056, D.3056
	movl	%eax, %edx	# D.3056, D.3056
	movl	-36(%rbp), %eax	# taskExecutionTime, tmp224
	addl	%edx, %eax	# D.3056, D.3056
	shrl	$5, %eax	#, D.3056
	movl	%eax, %edx	# D.3056, D.3056
	movq	-24(%rbp), %rax	# selectedTask, tmp225
	movl	%edx, 44(%rax)	# D.3056, selectedTask_5->averageExecutionTime
	.loc 1 282 0
	movq	-24(%rbp), %rax	# selectedTask, tmp226
	movl	56(%rax), %edx	# selectedTask_5->totalExecutionTime, D.3056
	movl	-36(%rbp), %eax	# taskExecutionTime, tmp227
	addl	%eax, %edx	# tmp227, D.3056
	movq	-24(%rbp), %rax	# selectedTask, tmp228
	movl	%edx, 56(%rax)	# D.3056, selectedTask_5->totalExecutionTime
	.loc 1 283 0
	movq	-24(%rbp), %rax	# selectedTask, tmp229
	movl	52(%rax), %edx	# selectedTask_5->maxExecutionTime, D.3056
	movl	-36(%rbp), %eax	# taskExecutionTime, tmp230
	cmpl	%eax, %edx	# tmp230, D.3056
	cmovb	%eax, %edx	# D.3056,, tmp230, D.3056
	movq	-24(%rbp), %rax	# selectedTask, tmp231
	movl	%edx, 52(%rax)	# D.3056, selectedTask_5->maxExecutionTime
.L69:
.LBE15:
	.loc 1 293 0
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
	.long	0x761
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF776
	.byte	0xc
	.long	.LASF777
	.long	.LASF778
	.long	.Ldebug_ranges0+0x30
	.quad	0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF699
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF700
	.uleb128 0x3
	.long	.LASF702
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
	.long	.LASF701
	.uleb128 0x3
	.long	.LASF703
	.byte	0x2
	.byte	0x30
	.long	0x5f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF704
	.uleb128 0x3
	.long	.LASF705
	.byte	0x2
	.byte	0x31
	.long	0x71
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF706
	.uleb128 0x3
	.long	.LASF707
	.byte	0x2
	.byte	0x33
	.long	0x83
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF708
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF709
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF710
	.uleb128 0x5
	.long	0x46
	.uleb128 0x6
	.byte	0x8
	.long	0xaa
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF711
	.uleb128 0x5
	.long	0xa3
	.uleb128 0x7
	.byte	0x4
	.long	0x83
	.byte	0x3
	.byte	0x1a
	.long	0xe0
	.uleb128 0x8
	.long	.LASF712
	.byte	0
	.uleb128 0x8
	.long	.LASF713
	.byte	0x1
	.uleb128 0x8
	.long	.LASF714
	.byte	0x3
	.uleb128 0x8
	.long	.LASF715
	.byte	0x5
	.uleb128 0x8
	.long	.LASF716
	.byte	0x6
	.uleb128 0x8
	.long	.LASF717
	.byte	0xff
	.byte	0
	.uleb128 0x9
	.byte	0x28
	.byte	0x3
	.byte	0x25
	.long	0x149
	.uleb128 0xa
	.long	.LASF718
	.byte	0x3
	.byte	0x26
	.long	0x9d
	.byte	0
	.uleb128 0xa
	.long	.LASF719
	.byte	0x3
	.byte	0x27
	.long	0x149
	.byte	0x8
	.uleb128 0xa
	.long	.LASF720
	.byte	0x3
	.byte	0x28
	.long	0x78
	.byte	0xc
	.uleb128 0xa
	.long	.LASF721
	.byte	0x3
	.byte	0x29
	.long	0x54
	.byte	0x10
	.uleb128 0xa
	.long	.LASF722
	.byte	0x3
	.byte	0x2a
	.long	0x78
	.byte	0x14
	.uleb128 0xa
	.long	.LASF723
	.byte	0x3
	.byte	0x2b
	.long	0x78
	.byte	0x18
	.uleb128 0xa
	.long	.LASF724
	.byte	0x3
	.byte	0x2c
	.long	0x78
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF725
	.byte	0x3
	.byte	0x2d
	.long	0x78
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF726
	.uleb128 0x3
	.long	.LASF727
	.byte	0x3
	.byte	0x2e
	.long	0xe0
	.uleb128 0x9
	.byte	0x40
	.byte	0x3
	.byte	0x30
	.long	0x200
	.uleb128 0xa
	.long	.LASF718
	.byte	0x3
	.byte	0x32
	.long	0x9d
	.byte	0
	.uleb128 0xa
	.long	.LASF728
	.byte	0x3
	.byte	0x33
	.long	0x20f
	.byte	0x8
	.uleb128 0xa
	.long	.LASF729
	.byte	0x3
	.byte	0x34
	.long	0x216
	.byte	0x10
	.uleb128 0xa
	.long	.LASF720
	.byte	0x3
	.byte	0x35
	.long	0x78
	.byte	0x18
	.uleb128 0xa
	.long	.LASF721
	.byte	0x3
	.byte	0x36
	.long	0x21c
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF730
	.byte	0x3
	.byte	0x39
	.long	0x66
	.byte	0x1e
	.uleb128 0xa
	.long	.LASF731
	.byte	0x3
	.byte	0x3a
	.long	0x66
	.byte	0x20
	.uleb128 0xa
	.long	.LASF732
	.byte	0x3
	.byte	0x3b
	.long	0x78
	.byte	0x24
	.uleb128 0xa
	.long	.LASF733
	.byte	0x3
	.byte	0x3c
	.long	0x78
	.byte	0x28
	.uleb128 0xa
	.long	.LASF724
	.byte	0x3
	.byte	0x3f
	.long	0x78
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF734
	.byte	0x3
	.byte	0x40
	.long	0x78
	.byte	0x30
	.uleb128 0xa
	.long	.LASF722
	.byte	0x3
	.byte	0x42
	.long	0x78
	.byte	0x34
	.uleb128 0xa
	.long	.LASF723
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
	.long	.LASF735
	.byte	0x3
	.byte	0x45
	.long	0x15b
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF736
	.uleb128 0xe
	.long	.LASF779
	.byte	0x1
	.byte	0x37
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.long	.LASF737
	.byte	0x1
	.byte	0x45
	.long	0x149
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x29b
	.uleb128 0x10
	.long	.LASF739
	.byte	0x1
	.byte	0x45
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
	.byte	0x47
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
	.long	.LASF738
	.byte	0x1
	.byte	0x4f
	.long	0x149
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x2f0
	.uleb128 0x10
	.long	.LASF739
	.byte	0x1
	.byte	0x4f
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
	.byte	0x54
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	.LASF740
	.byte	0x1
	.byte	0x5f
	.long	0x149
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x33f
	.uleb128 0x10
	.long	.LASF739
	.byte	0x1
	.byte	0x5f
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
	.byte	0x61
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF741
	.byte	0x1
	.byte	0x6e
	.long	0x29b
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF742
	.byte	0x1
	.byte	0x77
	.long	0x29b
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF744
	.byte	0x1
	.byte	0x7c
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c5
	.uleb128 0x16
	.long	.LASF743
	.byte	0x1
	.byte	0x86
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x16
	.long	.LASF739
	.byte	0x1
	.byte	0x87
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
	.long	.LASF745
	.byte	0x1
	.byte	0x94
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x40a
	.uleb128 0x10
	.long	.LASF746
	.byte	0x1
	.byte	0x94
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.long	.LASF747
	.byte	0x1
	.byte	0x94
	.long	0x40a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x150
	.uleb128 0x17
	.long	.LASF748
	.byte	0x1
	.byte	0xa1
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x46a
	.uleb128 0x10
	.long	.LASF746
	.byte	0x1
	.byte	0xa1
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF749
	.byte	0x1
	.byte	0xa1
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x16
	.long	.LASF739
	.byte	0x1
	.byte	0xa4
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LASF750
	.byte	0x1
	.byte	0xa9
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x4b8
	.uleb128 0x10
	.long	.LASF746
	.byte	0x1
	.byte	0xa9
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF751
	.byte	0x1
	.byte	0xa9
	.long	0x149
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.long	.Ldebug_ranges0+0
	.uleb128 0x16
	.long	.LASF739
	.byte	0x1
	.byte	0xac
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF780
	.byte	0x1
	.byte	0xb7
	.long	0x78
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x508
	.uleb128 0x10
	.long	.LASF746
	.byte	0x1
	.byte	0xb7
	.long	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x16
	.long	.LASF739
	.byte	0x1
	.byte	0xba
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF781
	.byte	0x1
	.byte	0xc1
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF752
	.byte	0x1
	.byte	0xc6
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x670
	.uleb128 0x16
	.long	.LASF753
	.byte	0x1
	.byte	0xcb
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.long	.LASF754
	.byte	0x1
	.byte	0xd0
	.long	0x78
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x16
	.long	.LASF755
	.byte	0x1
	.byte	0xda
	.long	0x670
	.uleb128 0x3
	.byte	0x91
	.sleb128 -74
	.uleb128 0x16
	.long	.LASF756
	.byte	0x1
	.byte	0xdd
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.long	.LASF757
	.byte	0x1
	.byte	0xde
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.long	.LASF758
	.byte	0x1
	.byte	0xe1
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -70
	.uleb128 0x1b
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x5fa
	.uleb128 0x16
	.long	.LASF739
	.byte	0x1
	.byte	0xd1
	.long	0x3c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x16
	.long	.LASF759
	.byte	0x1
	.byte	0xd2
	.long	0x675
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x11
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x16
	.long	.LASF760
	.byte	0x1
	.byte	0xd6
	.long	0x675
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.long	0x63f
	.uleb128 0x16
	.long	.LASF739
	.byte	0x1
	.byte	0xe2
	.long	0x29b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x16
	.long	.LASF761
	.byte	0x1
	.byte	0xfd
	.long	0x670
	.uleb128 0x3
	.byte	0x91
	.sleb128 -73
	.byte	0
	.byte	0
	.uleb128 0x11
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x1c
	.long	.LASF762
	.byte	0x1
	.value	0x114
	.long	0x675
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.long	.LASF763
	.byte	0x1
	.value	0x116
	.long	0x675
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x149
	.uleb128 0x5
	.long	0x78
	.uleb128 0x16
	.long	.LASF764
	.byte	0x1
	.byte	0x26
	.long	0x29b
	.uleb128 0x9
	.byte	0x3
	.quad	currentTask
	.uleb128 0x16
	.long	.LASF765
	.byte	0x1
	.byte	0x2c
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	totalWaitingTasks
	.uleb128 0x16
	.long	.LASF766
	.byte	0x1
	.byte	0x2d
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	totalWaitingTasksSamples
	.uleb128 0x16
	.long	.LASF767
	.byte	0x1
	.byte	0x2e
	.long	0x78
	.uleb128 0x9
	.byte	0x3
	.quad	realtimeGuardInterval
	.uleb128 0x16
	.long	.LASF768
	.byte	0x1
	.byte	0x34
	.long	0x46
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueuePos
	.uleb128 0x16
	.long	.LASF769
	.byte	0x1
	.byte	0x35
	.long	0x83
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueueSize
	.uleb128 0x1d
	.long	.LASF770
	.byte	0x1
	.byte	0x31
	.long	0x66
	.uleb128 0x9
	.byte	0x3
	.quad	averageSystemLoadPercent
	.uleb128 0x1e
	.long	0x29b
	.long	0x718
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.long	.LASF771
	.byte	0x3
	.byte	0x4a
	.long	0x70d
	.uleb128 0x20
	.long	.LASF772
	.byte	0x3
	.byte	0x4b
	.long	0x675
	.uleb128 0x20
	.long	.LASF773
	.byte	0x3
	.byte	0x4c
	.long	0x675
	.uleb128 0x1e
	.long	0x221
	.long	0x744
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.long	.LASF774
	.byte	0x3
	.byte	0x4d
	.long	0x739
	.uleb128 0x1d
	.long	.LASF775
	.byte	0x1
	.byte	0x30
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
	.file 16 "/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x3
	.uleb128 0x21
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.file 17 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x11
	.byte	0x5
	.uleb128 0x18
	.long	.LASF485
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 18 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.long	.LASF539
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro16
	.file 19 "/usr/include/libio.h"
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF547
	.file 20 "/usr/include/_G_config.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x3
	.uleb128 0xf
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x5
	.uleb128 0x10
	.long	.LASF549
	.file 21 "/usr/include/wchar.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 22 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro21
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro23
	.file 23 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0xa4
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.file 24 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.byte	0x3
	.uleb128 0x355
	.uleb128 0x18
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 25 "./src/main/build/debug.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.file 26 "./src/main/build/build_config.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.file 27 "./src/main/common/maths.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.file 28 "./src/main/drivers/system.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x1c
	.byte	0x4
	.file 29 "./src/main/fc/fc_tasks.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x1d
	.byte	0x4
	.byte	0x5
	.uleb128 0x28
	.long	.LASF696
	.byte	0x5
	.uleb128 0x29
	.long	.LASF697
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF698
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
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.26.4719156f1aea2bb9662fd6c582dc9a4c,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF484
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF460
	.byte	0x5
	.uleb128 0x20
	.long	.LASF461
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.238.04cc7214bceba497b20d15c10fd97511,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
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
	.section	.debug_macro,"G",@progbits,wm4.types.h.89.468e2451361e3b92f048f6cad51690ff,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.long	.LASF486
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF487
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF488
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF489
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF490
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF491
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF492
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF493
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF494
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF495
	.byte	0x5
	.uleb128 0x70
	.long	.LASF496
	.byte	0x5
	.uleb128 0x71
	.long	.LASF497
	.byte	0x5
	.uleb128 0x72
	.long	.LASF498
	.byte	0x5
	.uleb128 0x73
	.long	.LASF499
	.byte	0x5
	.uleb128 0x75
	.long	.LASF500
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.40eb69a6270178f15d1bf3d7b6635a8b,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF501
	.byte	0x5
	.uleb128 0x22
	.long	.LASF502
	.byte	0x5
	.uleb128 0x23
	.long	.LASF503
	.byte	0x5
	.uleb128 0x26
	.long	.LASF504
	.byte	0x5
	.uleb128 0x27
	.long	.LASF505
	.byte	0x5
	.uleb128 0x28
	.long	.LASF506
	.byte	0x5
	.uleb128 0x29
	.long	.LASF507
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF508
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF509
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF510
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF511
	.byte	0x5
	.uleb128 0x33
	.long	.LASF512
	.byte	0x5
	.uleb128 0x34
	.long	.LASF513
	.byte	0x5
	.uleb128 0x35
	.long	.LASF514
	.byte	0x5
	.uleb128 0x36
	.long	.LASF515
	.byte	0x5
	.uleb128 0x37
	.long	.LASF516
	.byte	0x5
	.uleb128 0x38
	.long	.LASF517
	.byte	0x5
	.uleb128 0x39
	.long	.LASF518
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF519
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF520
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF521
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF522
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF523
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF524
	.byte	0x5
	.uleb128 0x40
	.long	.LASF525
	.byte	0x5
	.uleb128 0x41
	.long	.LASF526
	.byte	0x5
	.uleb128 0x42
	.long	.LASF527
	.byte	0x5
	.uleb128 0x43
	.long	.LASF528
	.byte	0x5
	.uleb128 0x44
	.long	.LASF529
	.byte	0x5
	.uleb128 0x45
	.long	.LASF530
	.byte	0x5
	.uleb128 0x46
	.long	.LASF531
	.byte	0x5
	.uleb128 0x47
	.long	.LASF532
	.byte	0x5
	.uleb128 0x48
	.long	.LASF533
	.byte	0x5
	.uleb128 0x49
	.long	.LASF534
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF535
	.byte	0x5
	.uleb128 0x50
	.long	.LASF536
	.byte	0x5
	.uleb128 0x53
	.long	.LASF537
	.byte	0x5
	.uleb128 0x57
	.long	.LASF538
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.36.2dd12c1fd035242ad5cfd0152a01be5a,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.long	.LASF540
	.byte	0x5
	.uleb128 0x25
	.long	.LASF541
	.byte	0x5
	.uleb128 0x38
	.long	.LASF542
	.byte	0x6
	.uleb128 0x3a
	.long	.LASF543
	.byte	0x5
	.uleb128 0x42
	.long	.LASF544
	.byte	0x6
	.uleb128 0x44
	.long	.LASF545
	.byte	0x5
	.uleb128 0x48
	.long	.LASF546
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.5.b0f37d9e474454cf6e459063458db32f,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.long	.LASF548
	.byte	0x5
	.uleb128 0xa
	.long	.LASF460
	.byte	0x5
	.uleb128 0xe
	.long	.LASF461
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.80.eea3eba2d2a17aace9470a8e0d8218dc,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF550
	.byte	0x6
	.uleb128 0x60
	.long	.LASF551
	.byte	0x6
	.uleb128 0x386
	.long	.LASF551
	.byte	0x6
	.uleb128 0x387
	.long	.LASF552
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4._G_config.h.46.5187c97b14fd664662cb32e6b94fc49e,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF553
	.byte	0x5
	.uleb128 0x30
	.long	.LASF554
	.byte	0x5
	.uleb128 0x31
	.long	.LASF555
	.byte	0x5
	.uleb128 0x33
	.long	.LASF556
	.byte	0x5
	.uleb128 0x36
	.long	.LASF557
	.byte	0x5
	.uleb128 0x38
	.long	.LASF558
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.33.a775b9ecae273f33bc59931e9891e4ca,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.long	.LASF559
	.byte	0x5
	.uleb128 0x22
	.long	.LASF560
	.byte	0x5
	.uleb128 0x23
	.long	.LASF561
	.byte	0x5
	.uleb128 0x24
	.long	.LASF562
	.byte	0x5
	.uleb128 0x25
	.long	.LASF563
	.byte	0x5
	.uleb128 0x26
	.long	.LASF564
	.byte	0x5
	.uleb128 0x27
	.long	.LASF565
	.byte	0x5
	.uleb128 0x28
	.long	.LASF566
	.byte	0x5
	.uleb128 0x29
	.long	.LASF567
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF568
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF569
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF570
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF571
	.byte	0x5
	.uleb128 0x30
	.long	.LASF572
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF573
	.byte	0x5
	.uleb128 0x27
	.long	.LASF574
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libio.h.51.dab170798ec1df48c625aea7c30e1b63,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x33
	.long	.LASF575
	.byte	0x5
	.uleb128 0x34
	.long	.LASF576
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF577
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF578
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF579
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF580
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF581
	.byte	0x5
	.uleb128 0x50
	.long	.LASF582
	.byte	0x5
	.uleb128 0x51
	.long	.LASF583
	.byte	0x5
	.uleb128 0x52
	.long	.LASF584
	.byte	0x5
	.uleb128 0x53
	.long	.LASF585
	.byte	0x5
	.uleb128 0x54
	.long	.LASF586
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF587
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF588
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF589
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF590
	.byte	0x5
	.uleb128 0x60
	.long	.LASF591
	.byte	0x5
	.uleb128 0x61
	.long	.LASF592
	.byte	0x5
	.uleb128 0x62
	.long	.LASF593
	.byte	0x5
	.uleb128 0x63
	.long	.LASF594
	.byte	0x5
	.uleb128 0x64
	.long	.LASF595
	.byte	0x5
	.uleb128 0x65
	.long	.LASF596
	.byte	0x5
	.uleb128 0x66
	.long	.LASF597
	.byte	0x5
	.uleb128 0x67
	.long	.LASF598
	.byte	0x5
	.uleb128 0x68
	.long	.LASF599
	.byte	0x5
	.uleb128 0x69
	.long	.LASF600
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF601
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF602
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF603
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF604
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF605
	.byte	0x5
	.uleb128 0x70
	.long	.LASF606
	.byte	0x5
	.uleb128 0x71
	.long	.LASF607
	.byte	0x5
	.uleb128 0x75
	.long	.LASF608
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF609
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF610
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF611
	.byte	0x5
	.uleb128 0x80
	.long	.LASF612
	.byte	0x5
	.uleb128 0x81
	.long	.LASF613
	.byte	0x5
	.uleb128 0x82
	.long	.LASF614
	.byte	0x5
	.uleb128 0x83
	.long	.LASF615
	.byte	0x5
	.uleb128 0x84
	.long	.LASF616
	.byte	0x5
	.uleb128 0x85
	.long	.LASF617
	.byte	0x5
	.uleb128 0x86
	.long	.LASF618
	.byte	0x5
	.uleb128 0x87
	.long	.LASF619
	.byte	0x5
	.uleb128 0x88
	.long	.LASF620
	.byte	0x5
	.uleb128 0x89
	.long	.LASF621
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF622
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF623
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF624
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF625
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF626
	.byte	0x5
	.uleb128 0x110
	.long	.LASF627
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF628
	.byte	0x5
	.uleb128 0x140
	.long	.LASF629
	.byte	0x5
	.uleb128 0x141
	.long	.LASF630
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF631
	.byte	0x5
	.uleb128 0x190
	.long	.LASF632
	.byte	0x5
	.uleb128 0x193
	.long	.LASF633
	.byte	0x5
	.uleb128 0x197
	.long	.LASF634
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF635
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF636
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF637
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF638
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF639
	.byte	0x5
	.uleb128 0x1c5
	.long	.LASF640
	.byte	0x5
	.uleb128 0x1c6
	.long	.LASF641
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF642
	.byte	0x5
	.uleb128 0x1c8
	.long	.LASF643
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.80.2c0b67e94eb93fd8dd1cc22c150ce71c,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF644
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF645
	.byte	0x5
	.uleb128 0x67
	.long	.LASF646
	.byte	0x5
	.uleb128 0x78
	.long	.LASF647
	.byte	0x5
	.uleb128 0x79
	.long	.LASF648
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF649
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF650
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF651
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF652
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF653
	.byte	0x5
	.uleb128 0x97
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.23.557290a6cddeba0587f574f29e3a5fb9,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF655
	.byte	0x5
	.uleb128 0x18
	.long	.LASF656
	.byte	0x5
	.uleb128 0x19
	.long	.LASF657
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF658
	.byte	0x6
	.uleb128 0x24
	.long	.LASF659
	.byte	0x5
	.uleb128 0x25
	.long	.LASF660
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.172.df21df34a7396d7da2e08f9b617d582f,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xac
	.long	.LASF661
	.byte	0x5
	.uleb128 0xad
	.long	.LASF662
	.byte	0x5
	.uleb128 0xae
	.long	.LASF663
	.byte	0x5
	.uleb128 0x21f
	.long	.LASF664
	.byte	0x5
	.uleb128 0x249
	.long	.LASF665
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.scheduler.h.22.67b0f3cbb70e9dc5f74939aa0db55023,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.long	.LASF666
	.byte	0x5
	.uleb128 0x17
	.long	.LASF667
	.byte	0x5
	.uleb128 0x18
	.long	.LASF668
	.byte	0x5
	.uleb128 0x23
	.long	.LASF669
	.byte	0x5
	.uleb128 0x57
	.long	.LASF670
	.byte	0x5
	.uleb128 0x59
	.long	.LASF671
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.debug.h.18.6574db8528ee4536a81057c3a08cdb4d,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.long	.LASF672
	.byte	0x5
	.uleb128 0x15
	.long	.LASF673
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF674
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF675
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.build_config.h.20.1bf8432fc8be9a81fe8cce0e3f98279c,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF676
	.byte	0x5
	.uleb128 0x15
	.long	.LASF677
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF678
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF679
	.byte	0x5
	.uleb128 0x20
	.long	.LASF680
	.byte	0x5
	.uleb128 0x21
	.long	.LASF681
	.byte	0x5
	.uleb128 0x27
	.long	.LASF682
	.byte	0x5
	.uleb128 0x28
	.long	.LASF683
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.maths.h.21.5b067f47e9a221ec30aa8aaee7f7dece,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF684
	.byte	0x5
	.uleb128 0x19
	.long	.LASF685
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF686
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF687
	.byte	0x5
	.uleb128 0x21
	.long	.LASF688
	.byte	0x5
	.uleb128 0x22
	.long	.LASF689
	.byte	0x5
	.uleb128 0x23
	.long	.LASF690
	.byte	0x5
	.uleb128 0x62
	.long	.LASF691
	.byte	0x5
	.uleb128 0x63
	.long	.LASF692
	.byte	0x5
	.uleb128 0x64
	.long	.LASF693
	.byte	0x5
	.uleb128 0x65
	.long	.LASF694
	.byte	0x5
	.uleb128 0x66
	.long	.LASF695
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF403:
	.string	"INT32_MAX (2147483647)"
.LASF647:
	.string	"_IOFBF 0"
.LASF236:
	.string	"__linux__ 1"
.LASF500:
	.string	"__STD_TYPE typedef"
.LASF585:
	.string	"_IOS_NOREPLACE 64"
.LASF407:
	.string	"UINT32_MAX (4294967295U)"
.LASF583:
	.string	"_IOS_TRUNC 16"
.LASF558:
	.string	"_G_BUFSIZ 8192"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF203:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF95:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF758:
	.string	"waitingTasks"
.LASF741:
	.string	"queueFirst"
.LASF710:
	.string	"sizetype"
.LASF661:
	.string	"stdin stdin"
.LASF655:
	.string	"L_tmpnam 20"
.LASF188:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF17:
	.string	"__LP64__ 1"
.LASF642:
	.string	"_IO_cleanup_region_start(_fct,_fp) "
.LASF388:
	.string	"__stub_sigreturn "
.LASF422:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF651:
	.string	"SEEK_SET 0"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF370:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF339:
	.string	"__flexarr []"
.LASF162:
	.string	"__DECIMAL_DIG__ 21"
.LASF761:
	.string	"taskCanBeChosenForScheduling"
.LASF449:
	.string	"INT16_C(c) c"
.LASF702:
	.string	"int32_t"
.LASF725:
	.string	"latestDeltaTime"
.LASF308:
	.string	"__GNU_LIBRARY__"
.LASF118:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF147:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF769:
	.string	"taskQueueSize"
.LASF576:
	.string	"_IO_va_list __gnuc_va_list"
.LASF563:
	.string	"_IO_off_t __off_t"
.LASF615:
	.string	"_IO_HEX 0100"
.LASF173:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF116:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF179:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF641:
	.string	"_IO_ftrylockfile(_fp) "
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF439:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF773:
	.string	"taskCount"
.LASF273:
	.string	"__USE_XOPEN2K"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF34:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF106:
	.string	"__UINT8_C(c) c"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF237:
	.string	"linux 1"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF245:
	.string	"EDISON 1"
.LASF163:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF350:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF539:
	.string	"__STD_TYPE"
.LASF136:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF428:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF320:
	.string	"__P(args) args"
.LASF463:
	.string	"__SIZE_T__ "
.LASF572:
	.string	"__need___va_list "
.LASF92:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF513:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF582:
	.string	"_IOS_APPEND 8"
.LASF640:
	.string	"_IO_funlockfile(_fp) "
.LASF156:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF483:
	.string	"_XLOCALE_H 1"
.LASF636:
	.string	"_IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF432:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF763:
	.string	"taskExecutionTime"
.LASF453:
	.string	"UINT16_C(c) c"
.LASF490:
	.string	"__SLONGWORD_TYPE long int"
.LASF478:
	.string	"__size_t "
.LASF397:
	.string	"INT8_MIN (-128)"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF497:
	.string	"__ULONG32_TYPE unsigned int"
.LASF780:
	.string	"getTaskDeltaTime"
.LASF312:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF340:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF467:
	.string	"_T_SIZE "
.LASF715:
	.string	"TASK_PRIORITY_HIGH"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF406:
	.string	"UINT16_MAX (65535)"
.LASF187:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF427:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF423:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF279:
	.string	"__USE_FILE_OFFSET64"
.LASF225:
	.string	"__k8 1"
.LASF266:
	.string	"__USE_POSIX"
.LASF175:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF480:
	.string	"NULL"
.LASF603:
	.string	"_IO_IS_FILEBUF 0x2000"
.LASF685:
	.string	"FAST_TRIGONOMETRY "
.LASF444:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF380:
	.string	"__stub_fchflags "
.LASF209:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF38:
	.string	"__INTMAX_TYPE__ long int"
.LASF778:
	.string	"/home/aravind/git/cleanflight"
.LASF522:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF137:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF287:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF733:
	.string	"lastSignaledAt"
.LASF117:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF275:
	.string	"__USE_XOPEN2K8"
.LASF465:
	.string	"_SYS_SIZE_T_H "
.LASF243:
	.string	"DEBUG 1"
.LASF418:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF223:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF310:
	.string	"__GLIBC__ 2"
.LASF701:
	.string	"long int"
.LASF302:
	.string	"__USE_XOPEN2K8 1"
.LASF530:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF590:
	.string	"_IO_USER_BUF 1"
.LASF736:
	.string	"float"
.LASF185:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF688:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF613:
	.string	"_IO_DEC 020"
.LASF462:
	.string	"__size_t__ "
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF238:
	.string	"__unix 1"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF764:
	.string	"currentTask"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF199:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF394:
	.string	"__int8_t_defined "
.LASF744:
	.string	"taskSystem"
.LASF527:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF660:
	.string	"FOPEN_MAX 16"
.LASF628:
	.string	"_IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF434:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF521:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF520:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF474:
	.string	"_SIZE_T_DECLARED "
.LASF322:
	.string	"__CONCAT(x,y) x ## y"
.LASF756:
	.string	"selectedTask"
.LASF687:
	.string	"RAD (M_PIf / 180.0f)"
.LASF120:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF132:
	.string	"__FLT_MAX_EXP__ 128"
.LASF250:
	.string	"__STDC_IEC_559__ 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF652:
	.string	"SEEK_CUR 1"
.LASF441:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF771:
	.string	"taskQueueArray"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF635:
	.string	"_IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF249:
	.string	"_STDC_PREDEF_H 1"
.LASF150:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF447:
	.string	"WINT_MAX (4294967295u)"
.LASF181:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF341:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF524:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF507:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF131:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF134:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF699:
	.string	"signed char"
.LASF595:
	.string	"_IO_ERR_SEEN 0x20"
.LASF703:
	.string	"uint8_t"
.LASF731:
	.string	"taskAgeCycles"
.LASF487:
	.string	"__U16_TYPE unsigned short int"
.LASF324:
	.string	"__ptr_t void *"
.LASF193:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF656:
	.string	"TMP_MAX 238328"
.LASF141:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF535:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF502:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF386:
	.string	"__stub_revoke "
.LASF717:
	.string	"TASK_PRIORITY_MAX"
.LASF107:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF518:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF575:
	.string	"_IO_va_list"
.LASF624:
	.string	"_IO_DONT_CLOSE 0100000"
.LASF755:
	.string	"outsideRealtimeGuardInterval"
.LASF723:
	.string	"totalExecutionTime"
.LASF473:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF475:
	.string	"___int_size_t_h "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF290:
	.string	"__USE_ISOC99 1"
.LASF133:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF321:
	.string	"__PMT(args) args"
.LASF242:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF186:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF419:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF598:
	.string	"_IO_IN_BACKUP 0x100"
.LASF689:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF724:
	.string	"averageExecutionTime"
.LASF552:
	.string	"__need_wint_t"
.LASF737:
	.string	"queueContains"
.LASF146:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF714:
	.string	"TASK_PRIORITY_MEDIUM"
.LASF110:
	.string	"__UINT32_C(c) c ## U"
.LASF645:
	.string	"__off_t_defined "
.LASF84:
	.string	"__INTMAX_C(c) c ## L"
.LASF160:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF398:
	.string	"INT16_MIN (-32767-1)"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF726:
	.string	"_Bool"
.LASF104:
	.string	"__INT64_C(c) c ## L"
.LASF364:
	.string	"__restrict_arr __restrict"
.LASF377:
	.string	"__stub___compat_bdflush "
.LASF471:
	.string	"_SIZE_T_DEFINED_ "
.LASF697:
	.string	"REALTIME_GUARD_INTERVAL_MAX 300"
.LASF86:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF528:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF282:
	.string	"__USE_GNU"
.LASF673:
	.string	"DEBUG_SECTION_TIMES "
.LASF414:
	.string	"INT_LEAST16_MAX (32767)"
.LASF348:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF252:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF549:
	.string	"__need_mbstate_t "
.LASF71:
	.string	"__GXX_ABI_VERSION 1009"
.LASF721:
	.string	"staticPriority"
.LASF512:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF285:
	.string	"__KERNEL_STRICT_NAMES"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF361:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF292:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF594:
	.string	"_IO_EOF_SEEN 0x10"
.LASF220:
	.string	"__x86_64__ 1"
.LASF458:
	.string	"_GCC_WRAP_STDINT_H "
.LASF151:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF311:
	.string	"__GLIBC_MINOR__ 23"
.LASF643:
	.string	"_IO_cleanup_region_end(_Doit) "
.LASF781:
	.string	"schedulerInit"
.LASF384:
	.string	"__stub_lchmod "
.LASF609:
	.string	"_IO_SKIPWS 01"
.LASF359:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF153:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF650:
	.string	"BUFSIZ _IO_BUFSIZ"
.LASF299:
	.string	"__USE_POSIX199309 1"
.LASF607:
	.string	"_IO_FLAGS2_NOTCANCEL 2"
.LASF425:
	.string	"INT_FAST8_MAX (127)"
.LASF413:
	.string	"INT_LEAST8_MAX (127)"
.LASF666:
	.string	"TASK_PERIOD_HZ(hz) (1000000 / (hz))"
.LASF99:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF454:
	.string	"UINT32_C(c) c ## U"
.LASF433:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF268:
	.string	"__USE_POSIX199309"
.LASF404:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF695:
	.string	"tan_approx(x) tanf(x)"
.LASF762:
	.string	"currentTimeBeforeTaskCall"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF542:
	.string	"__FILE_defined 1"
.LASF443:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF382:
	.string	"__stub_getmsg "
.LASF716:
	.string	"TASK_PRIORITY_REALTIME"
.LASF436:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF272:
	.string	"__USE_UNIX98"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF248:
	.string	"__REVISION__ \"0f5cb44\""
.LASF286:
	.string	"__KERNEL_STRICT_NAMES "
.LASF719:
	.string	"isEnabled"
.LASF548:
	.string	"_G_config_h 1"
.LASF506:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF605:
	.string	"_IO_USER_LOCK 0x8000"
.LASF204:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF491:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF208:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF219:
	.string	"__x86_64 1"
.LASF644:
	.string	"_VA_LIST_DEFINED "
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF85:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF460:
	.string	"__need_size_t "
.LASF657:
	.string	"FILENAME_MAX 4096"
.LASF421:
	.string	"INT_FAST8_MIN (-128)"
.LASF614:
	.string	"_IO_OCT 040"
.LASF387:
	.string	"__stub_setlogin "
.LASF174:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF537:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF556:
	.string	"_G_IO_IO_FILE_VERSION 0x20001"
.LASF574:
	.string	"__GNUC_VA_LIST "
.LASF256:
	.string	"bool _Bool"
.LASF739:
	.string	"task"
.LASF88:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF105:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF516:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF564:
	.string	"_IO_off64_t __off64_t"
.LASF211:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF430:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF546:
	.string	"_STDIO_USES_IOSTREAM "
.LASF368:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF541:
	.string	"__need___FILE "
.LASF569:
	.string	"_IO_BUFSIZ _G_BUFSIZ"
.LASF550:
	.string	"____mbstate_t_defined 1"
.LASF495:
	.string	"__UWORD_TYPE unsigned long int"
.LASF126:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF431:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF36:
	.string	"__WCHAR_TYPE__ int"
.LASF424:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF183:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF481:
	.string	"NULL ((void *)0)"
.LASF362:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF234:
	.string	"__gnu_linux__ 1"
.LASF300:
	.string	"__USE_POSIX199506 1"
.LASF540:
	.string	"__need_FILE "
.LASF411:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF303:
	.string	"_ATFILE_SOURCE"
.LASF496:
	.string	"__SLONG32_TYPE int"
.LASF566:
	.string	"_IO_uid_t __uid_t"
.LASF97:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF610:
	.string	"_IO_LEFT 02"
.LASF517:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF593:
	.string	"_IO_NO_WRITES 8"
.LASF369:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF633:
	.string	"_IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) && __underflow (_fp) == EOF ? EOF : *(unsigned char *) (_fp)->_IO_read_ptr)"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF191:
	.string	"__REGISTER_PREFIX__ "
.LASF751:
	.string	"enabled"
.LASF553:
	.string	"_G_va_list __gnuc_va_list"
.LASF611:
	.string	"_IO_RIGHT 04"
.LASF742:
	.string	"queueNext"
.LASF140:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF251:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF581:
	.string	"_IOS_ATEND 4"
.LASF89:
	.string	"__INT8_MAX__ 0x7f"
.LASF437:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF519:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF210:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF485:
	.string	"_BITS_TYPES_H 1"
.LASF405:
	.string	"UINT8_MAX (255)"
.LASF442:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF316:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF124:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF35:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF293:
	.string	"_POSIX_SOURCE"
.LASF291:
	.string	"__USE_ISOC95 1"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF172:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF466:
	.string	"_T_SIZE_ "
.LASF565:
	.string	"_IO_pid_t __pid_t"
.LASF676:
	.string	"UNUSED(x) (void)(x)"
.LASF330:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF672:
	.string	"DEBUG16_VALUE_COUNT 4"
.LASF226:
	.string	"__k8__ 1"
.LASF16:
	.string	"_LP64 1"
.LASF760:
	.string	"newTimeInterval"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF317:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF461:
	.string	"__need_NULL "
.LASF261:
	.string	"_FEATURES_H 1"
.LASF289:
	.string	"_DEFAULT_SOURCE 1"
.LASF446:
	.string	"WINT_MIN (0u)"
.LASF315:
	.string	"__LEAF , __leaf__"
.LASF393:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF189:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF349:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF201:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF501:
	.string	"_BITS_TYPESIZES_H 1"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF128:
	.string	"__FLT_MANT_DIG__ 24"
.LASF768:
	.string	"taskQueuePos"
.LASF619:
	.string	"_IO_SHOWPOS 02000"
.LASF626:
	.string	"_IO_file_flags _flags"
.LASF623:
	.string	"_IO_STDIO 040000"
.LASF83:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF381:
	.string	"__stub_fdetach "
.LASF571:
	.string	"_IO_wint_t wint_t"
.LASF664:
	.string	"getc(_fp) _IO_getc (_fp)"
.LASF281:
	.string	"__USE_ATFILE"
.LASF229:
	.string	"__SSE__ 1"
.LASF295:
	.string	"_POSIX_C_SOURCE"
.LASF561:
	.string	"_IO_size_t size_t"
.LASF198:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF536:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF101:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF573:
	.string	"__need___va_list"
.LASF372:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF267:
	.string	"__USE_POSIX2"
.LASF139:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF206:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF479:
	.string	"__need_size_t"
.LASF469:
	.string	"_SIZE_T_ "
.LASF599:
	.string	"_IO_LINE_BUF 0x200"
.LASF735:
	.string	"cfTask_t"
.LASF732:
	.string	"lastExecutedAt"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF169:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF482:
	.string	"__need_NULL"
.LASF218:
	.string	"__amd64__ 1"
.LASF260:
	.string	"_STDINT_H 1"
.LASF740:
	.string	"queueRemove"
.LASF692:
	.string	"cos_approx(x) cosf(x)"
.LASF114:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF207:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF608:
	.string	"_IO_FLAGS2_USER_WBUF 8"
.LASF682:
	.string	"REQUIRE_CC_ARM_PRINTF_SUPPORT "
.LASF354:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF115:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF39:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF489:
	.string	"__U32_TYPE unsigned int"
.LASF730:
	.string	"dynamicPriority"
.LASF352:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF214:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF113:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF314:
	.string	"__PMT"
.LASF127:
	.string	"__FLT_RADIX__ 2"
.LASF602:
	.string	"_IO_IS_APPENDING 0x1000"
.LASF212:
	.string	"__SSP_STRONG__ 3"
.LASF149:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF119:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF523:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF547:
	.string	"_IO_STDIO_H "
.LASF492:
	.string	"__SQUAD_TYPE long int"
.LASF658:
	.string	"L_ctermid 9"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF102:
	.string	"__INT32_C(c) c"
.LASF584:
	.string	"_IOS_NOCREATE 32"
.LASF713:
	.string	"TASK_PRIORITY_LOW"
.LASF274:
	.string	"__USE_XOPEN2KXSI"
.LASF68:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF284:
	.string	"__USE_FORTIFY_LEVEL"
.LASF578:
	.string	"EOF (-1)"
.LASF192:
	.string	"__USER_LABEL_PREFIX__ "
.LASF696:
	.string	"REALTIME_GUARD_INTERVAL_MIN 10"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF720:
	.string	"desiredPeriod"
.LASF750:
	.string	"setTaskEnabled"
.LASF401:
	.string	"INT8_MAX (127)"
.LASF774:
	.string	"cfTasks"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF168:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF708:
	.string	"unsigned int"
.LASF61:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF681:
	.string	"UNIT_TESTED "
.LASF385:
	.string	"__stub_putmsg "
.LASF130:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF526:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF727:
	.string	"cfTaskInfo_t"
.LASF280:
	.string	"__USE_MISC"
.LASF277:
	.string	"__USE_LARGEFILE"
.LASF129:
	.string	"__FLT_DIG__ 6"
.LASF255:
	.string	"_STDBOOL_H "
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF759:
	.string	"nextExecuteAt"
.LASF301:
	.string	"__USE_XOPEN2K 1"
.LASF125:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF665:
	.string	"putc(_ch,_fp) _IO_putc (_ch, _fp)"
.LASF529:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF634:
	.string	"_IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end, 0) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF262:
	.string	"__USE_ISOC11"
.LASF346:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF178:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF765:
	.string	"totalWaitingTasks"
.LASF123:
	.string	"__GCC_IEC_559 2"
.LASF631:
	.string	"_IO_BE(expr,res) __builtin_expect ((expr), res)"
.LASF366:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF383:
	.string	"__stub_gtty "
.LASF0:
	.string	"__STDC__ 1"
.LASF416:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF216:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF409:
	.string	"INT_LEAST8_MIN (-128)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF503:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF356:
	.string	"__wur "
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF618:
	.string	"_IO_UPPERCASE 01000"
.LASF184:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF767:
	.string	"realtimeGuardInterval"
.LASF777:
	.string	"src/main/scheduler/scheduler.c"
.LASF257:
	.string	"true 1"
.LASF728:
	.string	"checkFunc"
.LASF663:
	.string	"stderr stderr"
.LASF309:
	.string	"__GNU_LIBRARY__ 6"
.LASF505:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF684:
	.string	"sq(x) ((x)*(x))"
.LASF514:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF318:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF371:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF91:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF323:
	.string	"__STRING(x) #x"
.LASF704:
	.string	"unsigned char"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF170:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF734:
	.string	"taskLatestDeltaTime"
.LASF691:
	.string	"sin_approx(x) sinf(x)"
.LASF328:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF675:
	.string	"TIME_SECTION_END(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[1][index] = micros(); debug[index] = sectionTimes[1][index] - sectionTimes[0][index]; }"
.LASF374:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF711:
	.string	"char"
.LASF319:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF376:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF464:
	.string	"_SIZE_T "
.LASF592:
	.string	"_IO_NO_READS 4"
.LASF395:
	.string	"__uint32_t_defined "
.LASF544:
	.string	"____FILE_defined 1"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF343:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF591:
	.string	"_IO_UNBUFFERED 2"
.LASF567:
	.string	"_IO_iconv_t _G_iconv_t"
.LASF408:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF568:
	.string	"_IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE"
.LASF8:
	.string	"__VERSION__ \"5.4.1 20160904\""
.LASF161:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF98:
	.string	"__INT8_C(c) c"
.LASF706:
	.string	"short unsigned int"
.LASF577:
	.string	"_IO_UNIFIED_JUMPTABLES 1"
.LASF144:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF468:
	.string	"__SIZE_T "
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF177:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF202:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF533:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF264:
	.string	"__USE_ISOC95"
.LASF612:
	.string	"_IO_INTERNAL 010"
.LASF276:
	.string	"__USE_XOPEN2K8XSI"
.LASF138:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF263:
	.string	"__USE_ISOC99"
.LASF333:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF749:
	.string	"newPeriodMicros"
.LASF271:
	.string	"__USE_XOPEN_EXTENDED"
.LASF258:
	.string	"false 0"
.LASF690:
	.string	"ABS(x) ((x) > 0 ? (x) : -(x))"
.LASF167:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF357:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF197:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF326:
	.string	"__BEGIN_DECLS "
.LASF671:
	.string	"isSystemOverloaded() (averageSystemLoadPercent >= LOAD_PERCENTAGE_ONE)"
.LASF616:
	.string	"_IO_SHOWBASE 0200"
.LASF420:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF484:
	.string	"_STDIO_H 1"
.LASF772:
	.string	"taskQueueArraySize"
.LASF396:
	.string	"__intptr_t_defined "
.LASF538:
	.string	"__FD_SETSIZE 1024"
.LASF46:
	.string	"__INT64_TYPE__ long int"
.LASF511:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF674:
	.string	"TIME_SECTION_BEGIN(index) { extern uint32_t sectionTimes[2][4]; sectionTimes[0][index] = micros(); }"
.LASF532:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF93:
	.string	"__UINT8_MAX__ 0xff"
.LASF562:
	.string	"_IO_ssize_t __ssize_t"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF265:
	.string	"__USE_ISOCXX11"
.LASF472:
	.string	"_SIZE_T_DEFINED "
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF646:
	.string	"__ssize_t_defined "
.LASF705:
	.string	"uint16_t"
.LASF190:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF67:
	.string	"__INTPTR_TYPE__ long int"
.LASF417:
	.string	"UINT_LEAST8_MAX (255)"
.LASF709:
	.string	"long unsigned int"
.LASF296:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF551:
	.string	"__need_mbstate_t"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF638:
	.string	"_IO_peekc(_fp) _IO_peekc_unlocked (_fp)"
.LASF269:
	.string	"__USE_POSIX199506"
.LASF450:
	.string	"INT32_C(c) c"
.LASF121:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF455:
	.string	"UINT64_C(c) c ## UL"
.LASF712:
	.string	"TASK_PRIORITY_IDLE"
.LASF231:
	.string	"__FXSR__ 1"
.LASF560:
	.string	"_IO_fpos64_t _G_fpos64_t"
.LASF596:
	.string	"_IO_DELETE_DONT_CLOSE 0x40"
.LASF367:
	.string	"__WORDSIZE 64"
.LASF738:
	.string	"queueAdd"
.LASF213:
	.string	"__SIZEOF_INT128__ 16"
.LASF390:
	.string	"__stub_stty "
.LASF227:
	.string	"__code_model_small__ 1"
.LASF429:
	.string	"UINT_FAST8_MAX (255)"
.LASF176:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF337:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF103:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF498:
	.string	"__S64_TYPE long int"
.LASF470:
	.string	"_BSD_SIZE_T_ "
.LASF335:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF669:
	.string	"TASK_SELF -1"
.LASF270:
	.string	"__USE_XOPEN"
.LASF457:
	.string	"UINTMAX_C(c) c ## UL"
.LASF606:
	.string	"_IO_FLAGS2_MMAP 1"
.LASF625:
	.string	"_IO_BOOLALPHA 0200000"
.LASF559:
	.string	"_IO_fpos_t _G_fpos_t"
.LASF331:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF488:
	.string	"__S32_TYPE int"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF698:
	.string	"REALTIME_GUARD_INTERVAL_MARGIN 25"
.LASF621:
	.string	"_IO_FIXED 010000"
.LASF112:
	.string	"__UINT64_C(c) c ## UL"
.LASF445:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF459:
	.string	"_STRING_H 1"
.LASF391:
	.string	"_BITS_WCHAR_H 1"
.LASF754:
	.string	"timeToNextRealtimeTask"
.LASF241:
	.string	"__ELF__ 1"
.LASF670:
	.string	"LOAD_PERCENTAGE_ONE 100"
.LASF306:
	.string	"__USE_ATFILE 1"
.LASF601:
	.string	"_IO_CURRENTLY_PUTTING 0x800"
.LASF649:
	.string	"_IONBF 2"
.LASF389:
	.string	"__stub_sstk "
.LASF604:
	.string	"_IO_BAD_SEEN 0x4000"
.LASF588:
	.string	"_OLD_STDIO_MAGIC 0xFABC0000"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF164:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF152:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF159:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF205:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF747:
	.string	"taskInfo"
.LASF378:
	.string	"__stub_chflags "
.LASF779:
	.string	"queueClear"
.LASF477:
	.string	"_SIZET_ "
.LASF776:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -ggdb3 -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF531:
	.string	"__TIMER_T_TYPE void *"
.LASF155:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF230:
	.string	"__SSE2__ 1"
.LASF525:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF375:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF360:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF254:
	.string	"SRC_MAIN_SCHEDULER_C_ "
.LASF597:
	.string	"_IO_LINKED 0x80"
.LASF143:
	.string	"__DBL_DIG__ 15"
.LASF693:
	.string	"atan2_approx(y,x) atan2f(y,x)"
.LASF353:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF555:
	.string	"_G_HAVE_MREMAP 1"
.LASF327:
	.string	"__END_DECLS "
.LASF752:
	.string	"scheduler"
.LASF96:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF659:
	.string	"FOPEN_MAX"
.LASF746:
	.string	"taskId"
.LASF224:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF400:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF332:
	.string	"__END_NAMESPACE_C99 "
.LASF221:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF232:
	.string	"__SSE_MATH__ 1"
.LASF700:
	.string	"short int"
.LASF313:
	.string	"_SYS_CDEFS_H 1"
.LASF108:
	.string	"__UINT16_C(c) c"
.LASF363:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF194:
	.string	"__NO_INLINE__ 1"
.LASF745:
	.string	"getTaskInfo"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF344:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF154:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF87:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF60:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF493:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF246:
	.string	"__FORKNAME__ \"cleanflight\""
.LASF180:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF148:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF342:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF683:
	.string	"REQUIRE_PRINTF_LONG_SUPPORT "
.LASF579:
	.string	"_IOS_INPUT 1"
.LASF510:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF379:
	.string	"__stub_fattach "
.LASF586:
	.string	"_IOS_BIN 128"
.LASF775:
	.string	"currentTime"
.LASF90:
	.string	"__INT16_MAX__ 0x7fff"
.LASF345:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF494:
	.string	"__SWORD_TYPE long int"
.LASF639:
	.string	"_IO_flockfile(_fp) "
.LASF662:
	.string	"stdout stdout"
.LASF244:
	.string	"USE_STDPERIPH_DRIVER 1"
.LASF351:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF412:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF648:
	.string	"_IOLBF 1"
.LASF297:
	.string	"__USE_POSIX 1"
.LASF438:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF435:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF499:
	.string	"__U64_TYPE unsigned long int"
.LASF677:
	.string	"BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))"
.LASF680:
	.string	"INLINE_UNIT_TESTED inline"
.LASF557:
	.string	"_G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)"
.LASF766:
	.string	"totalWaitingTasksSamples"
.LASF486:
	.string	"__S16_TYPE short int"
.LASF622:
	.string	"_IO_UNITBUF 020000"
.LASF215:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF355:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF620:
	.string	"_IO_SCIENTIFIC 04000"
.LASF358:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF589:
	.string	"_IO_MAGIC_MASK 0xFFFF0000"
.LASF171:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF50:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF632:
	.string	"_IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF629:
	.string	"_IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))"
.LASF373:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF515:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF228:
	.string	"__MMX__ 1"
.LASF630:
	.string	"_IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))"
.LASF668:
	.string	"TASK_PERIOD_US(us) (us)"
.LASF748:
	.string	"rescheduleTask"
.LASF233:
	.string	"__SSE2_MATH__ 1"
.LASF554:
	.string	"_G_HAVE_MMAP 1"
.LASF288:
	.string	"_DEFAULT_SOURCE"
.LASF617:
	.string	"_IO_SHOWPOINT 0400"
.LASF476:
	.string	"_GCC_SIZE_T "
.LASF347:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF415:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF534:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF707:
	.string	"uint32_t"
.LASF545:
	.string	"__need___FILE"
.LASF504:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF410:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF122:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF448:
	.string	"INT8_C(c) c"
.LASF718:
	.string	"taskName"
.LASF334:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF217:
	.string	"__amd64 1"
.LASF294:
	.string	"_POSIX_SOURCE 1"
.LASF298:
	.string	"__USE_POSIX2 1"
.LASF239:
	.string	"__unix__ 1"
.LASF587:
	.string	"_IO_MAGIC 0xFBAD0000"
.LASF336:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF402:
	.string	"INT16_MAX (32767)"
.LASF157:
	.string	"__LDBL_DIG__ 18"
.LASF508:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF543:
	.string	"__need_FILE"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF509:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF600:
	.string	"_IO_TIED_PUT_GET 0x400"
.LASF182:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF654:
	.string	"P_tmpdir \"/tmp\""
.LASF653:
	.string	"SEEK_END 2"
.LASF686:
	.string	"M_PIf 3.14159265358979323846f"
.LASF325:
	.string	"__long_double_t long double"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF165:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF240:
	.string	"unix 1"
.LASF729:
	.string	"taskFunc"
.LASF452:
	.string	"UINT8_C(c) c"
.LASF426:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF637:
	.string	"_IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr - (_fp)->_IO_write_base)"
.LASF307:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF158:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF305:
	.string	"__USE_MISC 1"
.LASF259:
	.string	"__bool_true_false_are_defined 1"
.LASF757:
	.string	"selectedTaskDynamicPriority"
.LASF392:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF329:
	.string	"__END_NAMESPACE_STD "
.LASF222:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF109:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF283:
	.string	"__USE_REENTRANT"
.LASF338:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF679:
	.string	"STATIC_INLINE_UNIT_TESTED static inline"
.LASF135:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF667:
	.string	"TASK_PERIOD_MS(ms) ((ms) * 1000)"
.LASF399:
	.string	"INT32_MIN (-2147483647-1)"
.LASF304:
	.string	"_ATFILE_SOURCE 1"
.LASF722:
	.string	"maxExecutionTime"
.LASF753:
	.string	"temp"
.LASF278:
	.string	"__USE_LARGEFILE64"
.LASF100:
	.string	"__INT16_C(c) c"
.LASF253:
	.string	"__STDC_NO_THREADS__ 1"
.LASF166:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF451:
	.string	"INT64_C(c) c ## L"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF678:
	.string	"STATIC_UNIT_TESTED static"
.LASF235:
	.string	"__linux 1"
.LASF145:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF247:
	.string	"__TARGET__ \"EDISON\""
.LASF440:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF580:
	.string	"_IOS_OUTPUT 2"
.LASF770:
	.string	"averageSystemLoadPercent"
.LASF142:
	.string	"__DBL_MANT_DIG__ 53"
.LASF694:
	.string	"acos_approx(x) acosf(x)"
.LASF456:
	.string	"INTMAX_C(c) c ## L"
.LASF365:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF111:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF94:
	.string	"__UINT16_MAX__ 0xffff"
.LASF743:
	.string	"maxNonRealtimeTaskTime"
.LASF627:
	.string	"__HAVE_COLUMN "
.LASF570:
	.string	"_IO_va_list _G_va_list"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
