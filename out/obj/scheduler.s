	.file	"scheduler.c"
# GNU C99 (Ubuntu 5.4.1-2ubuntu1~16.04) version 5.4.1 20160904 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160904, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed scheduler.i -mtune=generic -march=x86-64
# -g -std=gnu99 -ffunction-sections -fdata-sections -fverbose-asm
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
	movl	taskQueueArraySize(%rip), %eax	# taskQueueArraySize, D.3010
	movl	%eax, %eax	# D.3010, D.3011
	salq	$3, %rax	#, D.3011
	movq	%rax, %rdx	# D.3011,
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
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3014
	cmpq	-24(%rbp), %rax	# task, D.3014
	jne	.L4	#,
	.loc 1 73 0
	movl	$1, %eax	#, D.3012
	jmp	.L5	#
.L4:
	.loc 1 71 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L3:
	.loc 1 71 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3013
	cmpl	%eax, -4(%rbp)	# D.3013, ii
	jb	.L6	#,
.LBE2:
	.loc 1 76 0 is_stmt 1
	movl	$0, %eax	#, D.3012
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
	movl	taskQueueSize(%rip), %edx	# taskQueueSize, D.3016
	movl	taskCount(%rip), %eax	# taskCount, D.3016
	cmpl	%eax, %edx	# D.3016, D.3016
	jnb	.L8	#,
	.loc 1 81 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax	# task, tmp106
	movq	%rax, %rdi	# tmp106,
	call	queueContains	#
	testb	%al, %al	# D.3015
	je	.L9	#,
.L8:
	.loc 1 82 0 is_stmt 1
	movl	$0, %eax	#, D.3015
	jmp	.L10	#
.L9:
.LBB3:
	.loc 1 84 0
	movl	$0, -4(%rbp)	#, ii
	jmp	.L11	#
.L14:
	.loc 1 85 0
	movl	-4(%rbp), %eax	# ii, tmp107
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3017
	testq	%rax, %rax	# D.3017
	je	.L12	#,
	.loc 1 85 0 discriminator 1
	movl	-4(%rbp), %eax	# ii, tmp108
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3017
	movzbl	28(%rax), %edx	# _14->staticPriority, D.3018
	movq	-24(%rbp), %rax	# task, tmp109
	movzbl	28(%rax), %eax	# task_8(D)->staticPriority, D.3018
	cmpb	%al, %dl	# D.3018, D.3018
	jnb	.L13	#,
.L12:
	.loc 1 86 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3016
	subl	-4(%rbp), %eax	# ii, D.3016
	movl	%eax, %eax	# D.3016, D.3019
	leaq	0(,%rax,8), %rdx	#, D.3019
	movl	-4(%rbp), %eax	# ii, tmp110
	salq	$3, %rax	#, tmp111
	leaq	taskQueueArray(%rax), %rcx	#, D.3020
	movl	-4(%rbp), %eax	# ii, tmp112
	addl	$1, %eax	#, D.3016
	movl	%eax, %eax	# D.3016, tmp113
	salq	$3, %rax	#, tmp114
	addq	$taskQueueArray, %rax	#, D.3020
	movq	%rcx, %rsi	# D.3020,
	movq	%rax, %rdi	# D.3020,
	call	memmove	#
	.loc 1 87 0
	movl	-4(%rbp), %eax	# ii, tmp115
	movq	-24(%rbp), %rdx	# task, tmp116
	movq	%rdx, taskQueueArray(,%rax,8)	# tmp116, taskQueueArray
	.loc 1 88 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3016
	addl	$1, %eax	#, D.3016
	movl	%eax, taskQueueSize(%rip)	# D.3016, taskQueueSize
	.loc 1 89 0
	movl	$1, %eax	#, D.3015
	jmp	.L10	#
.L13:
	.loc 1 84 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L11:
	.loc 1 84 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3016
	cmpl	%eax, -4(%rbp)	# D.3016, ii
	jbe	.L14	#,
.LBE3:
	.loc 1 92 0 is_stmt 1
	movl	$0, %eax	#, D.3015
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
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3023
	cmpq	-24(%rbp), %rax	# task, D.3023
	jne	.L17	#,
	.loc 1 99 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3022
	subl	-4(%rbp), %eax	# ii, D.3022
	movl	%eax, %eax	# D.3022, D.3024
	leaq	0(,%rax,8), %rdx	#, D.3024
	movl	-4(%rbp), %eax	# ii, tmp101
	addl	$1, %eax	#, D.3022
	movl	%eax, %eax	# D.3022, tmp102
	salq	$3, %rax	#, tmp103
	leaq	taskQueueArray(%rax), %rcx	#, D.3025
	movl	-4(%rbp), %eax	# ii, tmp104
	salq	$3, %rax	#, tmp105
	addq	$taskQueueArray, %rax	#, D.3025
	movq	%rcx, %rsi	# D.3025,
	movq	%rax, %rdi	# D.3025,
	call	memmove	#
	.loc 1 100 0
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3022
	subl	$1, %eax	#, D.3022
	movl	%eax, taskQueueSize(%rip)	# D.3022, taskQueueSize
	.loc 1 101 0
	movl	$1, %eax	#, D.3021
	jmp	.L18	#
.L17:
	.loc 1 97 0 discriminator 2
	addl	$1, -4(%rbp)	#, ii
.L16:
	.loc 1 97 0 is_stmt 0 discriminator 1
	movl	taskQueueSize(%rip), %eax	# taskQueueSize, D.3022
	cmpl	%eax, -4(%rbp)	# D.3022, ii
	jb	.L19	#,
.LBE4:
	.loc 1 104 0 is_stmt 1
	movl	$0, %eax	#, D.3021
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
	movq	taskQueueArray(%rip), %rax	# taskQueueArray, D.3026
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
	movl	taskQueuePos(%rip), %eax	# taskQueuePos, D.3027
	addl	$1, %eax	#, D.3027
	movl	%eax, taskQueuePos(%rip)	# D.3027, taskQueuePos
	movl	taskQueuePos(%rip), %eax	# taskQueuePos, D.3027
	cltq
	movq	taskQueueArray(,%rax,8), %rax	# taskQueueArray, D.3028
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
	.loc 1 128 0
	movl	totalWaitingTasksSamples(%rip), %eax	# totalWaitingTasksSamples, D.3029
	testl	%eax, %eax	# D.3029
	je	.L25	#,
	.loc 1 129 0
	movl	totalWaitingTasks(%rip), %eax	# totalWaitingTasks, D.3029
	imull	$100, %eax, %eax	#, D.3029, D.3029
	movl	totalWaitingTasksSamples(%rip), %ecx	# totalWaitingTasksSamples, D.3029
	movl	$0, %edx	#, tmp100
	divl	%ecx	# D.3029
	movw	%ax, averageSystemLoadPercent(%rip)	# D.3030, averageSystemLoadPercent
	.loc 1 130 0
	movl	$0, totalWaitingTasksSamples(%rip)	#, totalWaitingTasksSamples
	.loc 1 131 0
	movl	$0, totalWaitingTasks(%rip)	#, totalWaitingTasks
.L25:
	.loc 1 135 0
	movl	$0, -12(%rbp)	#, maxNonRealtimeTaskTime
.LBB5:
	.loc 1 136 0
	call	queueFirst	#
	movq	%rax, -8(%rbp)	# tmp101, task
	jmp	.L26	#
.L28:
	.loc 1 137 0
	movq	-8(%rbp), %rax	# task, tmp102
	movzbl	28(%rax), %eax	# task_3->staticPriority, D.3031
	cmpb	$6, %al	#, D.3031
	je	.L27	#,
	.loc 1 138 0
	movq	-8(%rbp), %rax	# task, tmp103
	movl	44(%rax), %edx	# task_3->averageExecutionTime, D.3029
	movl	-12(%rbp), %eax	# maxNonRealtimeTaskTime, tmp105
	cmpl	%eax, %edx	# tmp105, D.3029
	cmovnb	%edx, %eax	# D.3029,, tmp104
	movl	%eax, -12(%rbp)	# tmp104, maxNonRealtimeTaskTime
.L27:
	.loc 1 136 0 discriminator 2
	call	queueNext	#
	movq	%rax, -8(%rbp)	# tmp106, task
.L26:
	.loc 1 136 0 discriminator 1
	cmpq	$0, -8(%rbp)	#, task
	jne	.L28	#,
.LBE5:
	.loc 1 142 0
	movl	-12(%rbp), %eax	# maxNonRealtimeTaskTime, D.3032
	movl	$300, %edx	#,
	movl	$10, %esi	#,
	movl	%eax, %edi	# D.3032,
	call	constrain	#
	addl	$25, %eax	#, D.3032
	movl	%eax, realtimeGuardInterval(%rip)	# D.3029, realtimeGuardInterval
	.loc 1 146 0
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
	.loc 1 150 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# taskId, taskId
	movq	%rsi, -16(%rbp)	# taskInfo, taskInfo
	.loc 1 151 0
	movl	-4(%rbp), %eax	# taskId, tmp97
	cltq
	salq	$6, %rax	#, tmp98
	addq	$cfTasks, %rax	#, tmp99
	movq	(%rax), %rdx	# cfTasks[taskId_2(D)].taskName, D.3033
	movq	-16(%rbp), %rax	# taskInfo, tmp100
	movq	%rdx, (%rax)	# D.3033, taskInfo_4(D)->taskName
	.loc 1 152 0
	movl	-4(%rbp), %eax	# taskId, tmp102
	cltq
	salq	$6, %rax	#, tmp103
	addq	$cfTasks, %rax	#, D.3034
	movq	%rax, %rdi	# D.3034,
	call	queueContains	#
	movl	%eax, %edx	#, D.3035
	movq	-16(%rbp), %rax	# taskInfo, tmp104
	movb	%dl, 8(%rax)	# D.3035, taskInfo_4(D)->isEnabled
	.loc 1 153 0
	movl	-4(%rbp), %eax	# taskId, tmp106
	cltq
	salq	$6, %rax	#, tmp107
	addq	$cfTasks+24, %rax	#, tmp108
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].desiredPeriod, D.3036
	movq	-16(%rbp), %rax	# taskInfo, tmp109
	movl	%edx, 12(%rax)	# D.3036, taskInfo_4(D)->desiredPeriod
	.loc 1 154 0
	movl	-4(%rbp), %eax	# taskId, tmp111
	cltq
	salq	$6, %rax	#, tmp112
	addq	$cfTasks+28, %rax	#, tmp113
	movzbl	(%rax), %edx	# cfTasks[taskId_2(D)].staticPriority, D.3037
	movq	-16(%rbp), %rax	# taskInfo, tmp114
	movb	%dl, 16(%rax)	# D.3037, taskInfo_4(D)->staticPriority
	.loc 1 155 0
	movl	-4(%rbp), %eax	# taskId, tmp116
	cltq
	salq	$6, %rax	#, tmp117
	addq	$cfTasks+52, %rax	#, tmp118
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].maxExecutionTime, D.3036
	movq	-16(%rbp), %rax	# taskInfo, tmp119
	movl	%edx, 20(%rax)	# D.3036, taskInfo_4(D)->maxExecutionTime
	.loc 1 156 0
	movl	-4(%rbp), %eax	# taskId, tmp121
	cltq
	salq	$6, %rax	#, tmp122
	addq	$cfTasks+56, %rax	#, tmp123
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].totalExecutionTime, D.3036
	movq	-16(%rbp), %rax	# taskInfo, tmp124
	movl	%edx, 24(%rax)	# D.3036, taskInfo_4(D)->totalExecutionTime
	.loc 1 157 0
	movl	-4(%rbp), %eax	# taskId, tmp126
	cltq
	salq	$6, %rax	#, tmp127
	addq	$cfTasks+44, %rax	#, tmp128
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].averageExecutionTime, D.3036
	movq	-16(%rbp), %rax	# taskInfo, tmp129
	movl	%edx, 28(%rax)	# D.3036, taskInfo_4(D)->averageExecutionTime
	.loc 1 158 0
	movl	-4(%rbp), %eax	# taskId, tmp131
	cltq
	salq	$6, %rax	#, tmp132
	addq	$cfTasks+48, %rax	#, tmp133
	movl	(%rax), %edx	# cfTasks[taskId_2(D)].taskLatestDeltaTime, D.3036
	movq	-16(%rbp), %rax	# taskInfo, tmp134
	movl	%edx, 32(%rax)	# D.3036, taskInfo_4(D)->latestDeltaTime
	.loc 1 159 0
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
	.loc 1 163 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# taskId, taskId
	movl	%esi, -24(%rbp)	# newPeriodMicros, newPeriodMicros
	.loc 1 164 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L31	#,
	.loc 1 164 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.3039
	cmpl	%eax, -20(%rbp)	# D.3040, taskId
	jge	.L35	#,
.L31:
.LBB6:
	.loc 1 165 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L33	#,
	.loc 1 165 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp92
	cltq
	salq	$6, %rax	#, tmp93
	addq	$cfTasks, %rax	#, D.3038
	jmp	.L34	#
.L33:
	.loc 1 165 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.3038
.L34:
	.loc 1 165 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.3038, task
	.loc 1 166 0 is_stmt 1 discriminator 4
	movl	$100, %eax	#, tmp94
	cmpl	$100, -24(%rbp)	#, newPeriodMicros
	cmovnb	-24(%rbp), %eax	# newPeriodMicros,, D.3039
	movl	%eax, %edx	# D.3039, D.3039
	movq	-8(%rbp), %rax	# task, tmp95
	movl	%edx, 24(%rax)	# D.3039, task_9->desiredPeriod
.L35:
.LBE6:
	.loc 1 168 0
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
	.loc 1 171 0
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
	.loc 1 172 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L37	#,
	.loc 1 172 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.3042
	cmpl	%eax, -20(%rbp)	# D.3043, taskId
	jge	.L42	#,
.L37:
.LBB7:
	.loc 1 173 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L39	#,
	.loc 1 173 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp93
	cltq
	salq	$6, %rax	#, tmp94
	addq	$cfTasks, %rax	#, D.3041
	jmp	.L40	#
.L39:
	.loc 1 173 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.3041
.L40:
	.loc 1 173 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.3041, task
	.loc 1 174 0 is_stmt 1 discriminator 4
	cmpb	$0, -24(%rbp)	#, enabled
	je	.L41	#,
	.loc 1 174 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax	# task, tmp95
	movq	16(%rax), %rax	# task_9->taskFunc, D.3044
	testq	%rax, %rax	# D.3044
	je	.L41	#,
	.loc 1 175 0 is_stmt 1
	movq	-8(%rbp), %rax	# task, tmp96
	movq	%rax, %rdi	# tmp96,
	call	queueAdd	#
.LBE7:
	.loc 1 180 0
	jmp	.L42	#
.L41:
.LBB8:
	.loc 1 177 0
	movq	-8(%rbp), %rax	# task, tmp97
	movq	%rax, %rdi	# tmp97,
	call	queueRemove	#
.L42:
.LBE8:
	.loc 1 180 0
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
	.loc 1 183 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)	# taskId, taskId
	.loc 1 184 0
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L44	#,
	.loc 1 184 0 is_stmt 0 discriminator 1
	movl	taskCount(%rip), %eax	# taskCount, D.3047
	cmpl	%eax, -20(%rbp)	# D.3048, taskId
	jge	.L45	#,
.L44:
.LBB9:
	.loc 1 185 0 is_stmt 1
	cmpl	$-1, -20(%rbp)	#, taskId
	je	.L46	#,
	.loc 1 185 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# taskId, tmp93
	cltq
	salq	$6, %rax	#, tmp94
	addq	$cfTasks, %rax	#, D.3045
	jmp	.L47	#
.L46:
	.loc 1 185 0 discriminator 2
	movq	currentTask(%rip), %rax	# currentTask, D.3045
.L47:
	.loc 1 185 0 discriminator 4
	movq	%rax, -8(%rbp)	# D.3045, task
	.loc 1 186 0 is_stmt 1 discriminator 4
	movq	-8(%rbp), %rax	# task, tmp95
	movl	48(%rax), %eax	# task_10->taskLatestDeltaTime, D.3046
	jmp	.L48	#
.L45:
.LBE9:
	.loc 1 188 0
	movl	$0, %eax	#, D.3046
.L48:
	.loc 1 190 0
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
	.loc 1 193 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	.loc 1 194 0
	call	queueClear	#
	.loc 1 195 0
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
	.loc 1 198 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	.loc 1 201 0
	call	micros	#
	movl	%eax, currentTime(%rip)	# D.3051, currentTime
	.loc 1 202 0
	call	queueFirst	#
	movq	%rax, -8(%rbp)	# tmp160, temp
	.loc 1 204 0
	movl	$-1, -52(%rbp)	#, timeToNextRealtimeTask
.LBB10:
	.loc 1 205 0
	call	queueFirst	#
	movq	%rax, -32(%rbp)	# tmp161, task
	jmp	.L51	#
.L55:
.LBB11:
	.loc 1 206 0
	movq	-32(%rbp), %rax	# task, tmp162
	movl	36(%rax), %edx	# task_3->lastExecutedAt, D.3051
	movq	-32(%rbp), %rax	# task, tmp163
	movl	24(%rax), %eax	# task_3->desiredPeriod, D.3051
	addl	%edx, %eax	# D.3051, tmp164
	movl	%eax, -48(%rbp)	# tmp164, nextExecuteAt
	.loc 1 207 0
	movl	currentTime(%rip), %eax	# currentTime, D.3051
	subl	-48(%rbp), %eax	# nextExecuteAt, D.3051
	testl	%eax, %eax	# D.3049
	js	.L52	#,
	.loc 1 208 0
	movl	$0, -52(%rbp)	#, timeToNextRealtimeTask
	jmp	.L53	#
.L52:
.LBB12:
	.loc 1 210 0
	movl	currentTime(%rip), %eax	# currentTime, D.3051
	movl	-48(%rbp), %edx	# nextExecuteAt, tmp168
	subl	%eax, %edx	# D.3051, tmp167
	movl	%edx, %eax	# tmp167, tmp167
	movl	%eax, -44(%rbp)	# tmp167, newTimeInterval
	.loc 1 211 0
	movl	-52(%rbp), %eax	# timeToNextRealtimeTask, tmp170
	cmpl	%eax, -44(%rbp)	# tmp170, newTimeInterval
	cmovbe	-44(%rbp), %eax	# newTimeInterval,, tmp169
	movl	%eax, -52(%rbp)	# tmp169, timeToNextRealtimeTask
.L53:
.LBE12:
.LBE11:
	.loc 1 205 0 discriminator 2
	call	queueNext	#
	movq	%rax, -32(%rbp)	# tmp171, task
.L51:
	.loc 1 205 0 discriminator 1
	cmpq	$0, -32(%rbp)	#, task
	je	.L54	#,
	.loc 1 205 0 discriminator 3
	movq	-32(%rbp), %rax	# task, tmp172
	movzbl	28(%rax), %eax	# task_3->staticPriority, D.3052
	cmpb	$5, %al	#, D.3052
	ja	.L55	#,
.L54:
.LBE10:
	.loc 1 214 0
	movl	realtimeGuardInterval(%rip), %eax	# realtimeGuardInterval, D.3051
	cmpl	%eax, -52(%rbp)	# D.3051, timeToNextRealtimeTask
	seta	%al	#, tmp173
	movb	%al, -58(%rbp)	# tmp173, outsideRealtimeGuardInterval
	.loc 1 216 0
	movq	$0, -24(%rbp)	#, selectedTask
	.loc 1 217 0
	movw	$0, -56(%rbp)	#, selectedTaskDynamicPriority
	.loc 1 220 0
	movw	$0, -54(%rbp)	#, waitingTasks
.LBB13:
	.loc 1 221 0
	call	queueFirst	#
	movq	%rax, -16(%rbp)	# tmp174, task
	jmp	.L56	#
.L66:
	.loc 1 223 0
	movq	-16(%rbp), %rax	# task, tmp175
	movq	8(%rax), %rax	# task_11->checkFunc, D.3053
	testq	%rax, %rax	# D.3053
	je	.L57	#,
	.loc 1 225 0
	movq	-16(%rbp), %rax	# task, tmp176
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, D.3054
	testw	%ax, %ax	# D.3054
	je	.L58	#,
	.loc 1 226 0
	movl	currentTime(%rip), %edx	# currentTime, D.3051
	movq	-16(%rbp), %rax	# task, tmp177
	movl	40(%rax), %eax	# task_11->lastSignaledAt, D.3051
	movl	%edx, %ecx	# D.3051, D.3051
	subl	%eax, %ecx	# D.3051, D.3051
	movq	-16(%rbp), %rax	# task, tmp178
	movl	24(%rax), %esi	# task_11->desiredPeriod, D.3051
	movl	%ecx, %eax	# D.3051, tmp179
	movl	$0, %edx	#, tmp180
	divl	%esi	# D.3051
	leal	1(%rax), %edx	#, D.3054
	movq	-16(%rbp), %rax	# task, tmp181
	movw	%dx, 32(%rax)	# D.3054, task_11->taskAgeCycles
	.loc 1 227 0
	movq	-16(%rbp), %rax	# task, tmp182
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3052
	movzbl	%al, %edx	# D.3052, D.3054
	movq	-16(%rbp), %rax	# task, tmp183
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3054
	imull	%edx, %eax	# D.3054, D.3054
	leal	1(%rax), %edx	#, D.3054
	movq	-16(%rbp), %rax	# task, tmp184
	movw	%dx, 30(%rax)	# D.3054, task_11->dynamicPriority
	.loc 1 228 0
	movzwl	-54(%rbp), %eax	# waitingTasks, D.3054
	addl	$1, %eax	#, tmp185
	movw	%ax, -54(%rbp)	# tmp185, waitingTasks
	jmp	.L61	#
.L58:
	.loc 1 229 0
	movq	-16(%rbp), %rax	# task, tmp186
	movq	8(%rax), %rax	# task_11->checkFunc, D.3053
	movl	currentTime(%rip), %ecx	# currentTime, D.3051
	movq	-16(%rbp), %rdx	# task, tmp187
	movl	36(%rdx), %edx	# task_11->lastExecutedAt, D.3051
	subl	%edx, %ecx	# D.3051, D.3051
	movl	%ecx, %edx	# D.3051, D.3051
	movl	%edx, %edi	# D.3051,
	call	*%rax	# D.3053
	testb	%al, %al	# D.3055
	je	.L60	#,
	.loc 1 230 0
	movl	currentTime(%rip), %edx	# currentTime, D.3051
	movq	-16(%rbp), %rax	# task, tmp188
	movl	%edx, 40(%rax)	# D.3051, task_11->lastSignaledAt
	.loc 1 231 0
	movq	-16(%rbp), %rax	# task, tmp189
	movw	$1, 32(%rax)	#, task_11->taskAgeCycles
	.loc 1 232 0
	movq	-16(%rbp), %rax	# task, tmp190
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3052
	movzbl	%al, %eax	# D.3052, D.3054
	leal	1(%rax), %edx	#, D.3054
	movq	-16(%rbp), %rax	# task, tmp191
	movw	%dx, 30(%rax)	# D.3054, task_11->dynamicPriority
	.loc 1 233 0
	movzwl	-54(%rbp), %eax	# waitingTasks, D.3054
	addl	$1, %eax	#, tmp192
	movw	%ax, -54(%rbp)	# tmp192, waitingTasks
	jmp	.L61	#
.L60:
	.loc 1 235 0
	movq	-16(%rbp), %rax	# task, tmp193
	movw	$0, 32(%rax)	#, task_11->taskAgeCycles
	jmp	.L61	#
.L57:
	.loc 1 240 0
	movl	currentTime(%rip), %edx	# currentTime, D.3051
	movq	-16(%rbp), %rax	# task, tmp194
	movl	36(%rax), %eax	# task_11->lastExecutedAt, D.3051
	movl	%edx, %ecx	# D.3051, D.3051
	subl	%eax, %ecx	# D.3051, D.3051
	movq	-16(%rbp), %rax	# task, tmp195
	movl	24(%rax), %edi	# task_11->desiredPeriod, D.3051
	movl	%ecx, %eax	# D.3051, tmp196
	movl	$0, %edx	#, tmp197
	divl	%edi	# D.3051
	movl	%eax, %edx	# D.3051, D.3054
	movq	-16(%rbp), %rax	# task, tmp198
	movw	%dx, 32(%rax)	# D.3054, task_11->taskAgeCycles
	.loc 1 241 0
	movq	-16(%rbp), %rax	# task, tmp199
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3054
	testw	%ax, %ax	# D.3054
	je	.L61	#,
	.loc 1 242 0
	movq	-16(%rbp), %rax	# task, tmp200
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3052
	movzbl	%al, %edx	# D.3052, D.3054
	movq	-16(%rbp), %rax	# task, tmp201
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3054
	imull	%edx, %eax	# D.3054, D.3054
	leal	1(%rax), %edx	#, D.3054
	movq	-16(%rbp), %rax	# task, tmp202
	movw	%dx, 30(%rax)	# D.3054, task_11->dynamicPriority
	.loc 1 243 0
	movzwl	-54(%rbp), %eax	# waitingTasks, D.3054
	addl	$1, %eax	#, tmp203
	movw	%ax, -54(%rbp)	# tmp203, waitingTasks
.L61:
	.loc 1 247 0
	movq	-16(%rbp), %rax	# task, tmp204
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, D.3054
	cmpw	-56(%rbp), %ax	# selectedTaskDynamicPriority, D.3054
	jbe	.L62	#,
.LBB14:
	.loc 1 250 0
	cmpb	$0, -58(%rbp)	#, outsideRealtimeGuardInterval
	jne	.L63	#,
	.loc 1 250 0 is_stmt 0 discriminator 2
	movq	-16(%rbp), %rax	# task, tmp205
	movzwl	32(%rax), %eax	# task_11->taskAgeCycles, D.3054
	.loc 1 249 0 is_stmt 1 discriminator 2
	cmpw	$1, %ax	#, D.3054
	ja	.L63	#,
	.loc 1 251 0 discriminator 3
	movq	-16(%rbp), %rax	# task, tmp206
	movzbl	28(%rax), %eax	# task_11->staticPriority, D.3052
	.loc 1 250 0 discriminator 3
	cmpb	$6, %al	#, D.3052
	jne	.L64	#,
.L63:
	.loc 1 250 0 is_stmt 0 discriminator 1
	movl	$1, %eax	#, D.3049
	jmp	.L65	#
.L64:
	.loc 1 250 0 discriminator 4
	movl	$0, %eax	#, D.3049
.L65:
	.loc 1 248 0 is_stmt 1
	movb	%al, -57(%rbp)	# D.3049, taskCanBeChosenForScheduling
	andb	$1, -57(%rbp)	#, taskCanBeChosenForScheduling
	.loc 1 252 0
	cmpb	$0, -57(%rbp)	#, taskCanBeChosenForScheduling
	je	.L62	#,
	.loc 1 253 0
	movq	-16(%rbp), %rax	# task, tmp207
	movzwl	30(%rax), %eax	# task_11->dynamicPriority, tmp208
	movw	%ax, -56(%rbp)	# tmp208, selectedTaskDynamicPriority
	.loc 1 254 0
	movq	-16(%rbp), %rax	# task, tmp209
	movq	%rax, -24(%rbp)	# tmp209, selectedTask
.L62:
.LBE14:
	.loc 1 221 0 discriminator 2
	call	queueNext	#
	movq	%rax, -16(%rbp)	# tmp210, task
.L56:
	.loc 1 221 0 discriminator 1
	cmpq	$0, -16(%rbp)	#, task
	jne	.L66	#,
.LBE13:
	.loc 1 258 0
	movl	totalWaitingTasksSamples(%rip), %eax	# totalWaitingTasksSamples, D.3051
	addl	$1, %eax	#, D.3051
	movl	%eax, totalWaitingTasksSamples(%rip)	# D.3051, totalWaitingTasksSamples
	.loc 1 259 0
	movzwl	-54(%rbp), %edx	# waitingTasks, D.3051
	movl	totalWaitingTasks(%rip), %eax	# totalWaitingTasks, D.3051
	addl	%edx, %eax	# D.3051, D.3051
	movl	%eax, totalWaitingTasks(%rip)	# D.3051, totalWaitingTasks
	.loc 1 261 0
	movq	-24(%rbp), %rax	# selectedTask, tmp211
	movq	%rax, currentTask(%rip)	# tmp211, currentTask
	.loc 1 263 0
	cmpq	$0, -24(%rbp)	#, selectedTask
	je	.L68	#,
.LBB15:
	.loc 1 265 0
	movl	currentTime(%rip), %edx	# currentTime, D.3051
	movq	-24(%rbp), %rax	# selectedTask, tmp212
	movl	36(%rax), %eax	# selectedTask_5->lastExecutedAt, D.3051
	subl	%eax, %edx	# D.3051, D.3051
	movq	-24(%rbp), %rax	# selectedTask, tmp213
	movl	%edx, 48(%rax)	# D.3051, selectedTask_5->taskLatestDeltaTime
	.loc 1 266 0
	movl	currentTime(%rip), %edx	# currentTime, D.3051
	movq	-24(%rbp), %rax	# selectedTask, tmp214
	movl	%edx, 36(%rax)	# D.3051, selectedTask_5->lastExecutedAt
	.loc 1 267 0
	movq	-24(%rbp), %rax	# selectedTask, tmp215
	movw	$0, 30(%rax)	#, selectedTask_5->dynamicPriority
	.loc 1 270 0
	call	micros	#
	movl	%eax, -40(%rbp)	# D.3050, currentTimeBeforeTaskCall
	.loc 1 271 0
	movq	-24(%rbp), %rax	# selectedTask, tmp216
	movq	16(%rax), %rax	# selectedTask_5->taskFunc, D.3056
	call	*%rax	# D.3056
	.loc 1 272 0
	call	micros	#
	subl	-40(%rbp), %eax	# currentTimeBeforeTaskCall, tmp218
	movl	%eax, -36(%rbp)	# tmp218, taskExecutionTime
	.loc 1 274 0
	movq	-24(%rbp), %rax	# selectedTask, tmp219
	movl	44(%rax), %edx	# selectedTask_5->averageExecutionTime, D.3051
	movl	%edx, %eax	# D.3051, tmp220
	sall	$5, %eax	#, tmp221
	subl	%edx, %eax	# D.3051, D.3051
	movl	%eax, %edx	# D.3051, D.3051
	movl	-36(%rbp), %eax	# taskExecutionTime, tmp222
	addl	%edx, %eax	# D.3051, D.3051
	shrl	$5, %eax	#, D.3051
	movl	%eax, %edx	# D.3051, D.3051
	movq	-24(%rbp), %rax	# selectedTask, tmp223
	movl	%edx, 44(%rax)	# D.3051, selectedTask_5->averageExecutionTime
	.loc 1 276 0
	movq	-24(%rbp), %rax	# selectedTask, tmp224
	movl	56(%rax), %edx	# selectedTask_5->totalExecutionTime, D.3051
	movl	-36(%rbp), %eax	# taskExecutionTime, tmp225
	addl	%eax, %edx	# tmp225, D.3051
	movq	-24(%rbp), %rax	# selectedTask, tmp226
	movl	%edx, 56(%rax)	# D.3051, selectedTask_5->totalExecutionTime
	.loc 1 277 0
	movq	-24(%rbp), %rax	# selectedTask, tmp227
	movl	52(%rax), %edx	# selectedTask_5->maxExecutionTime, D.3051
	movl	-36(%rbp), %eax	# taskExecutionTime, tmp228
	cmpl	%eax, %edx	# tmp228, D.3051
	cmovb	%eax, %edx	# D.3051,, tmp228, D.3051
	movq	-24(%rbp), %rax	# selectedTask, tmp229
	movl	%edx, 52(%rax)	# D.3051, selectedTask_5->maxExecutionTime
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
	.long	0x75d
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF77
	.byte	0xc
	.long	.LASF78
	.long	.LASF79
	.long	.Ldebug_ranges0+0x30
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
	.long	.LASF3
	.byte	0x2
	.byte	0x26
	.long	0x42
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
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0x33
	.long	0x7f
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.long	0x42
	.uleb128 0x6
	.byte	0x8
	.long	0xa6
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x5
	.long	0x9f
	.uleb128 0x7
	.byte	0x4
	.long	0x7f
	.byte	0x3
	.byte	0x1a
	.long	0xdc
	.uleb128 0x8
	.long	.LASF13
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x1
	.uleb128 0x8
	.long	.LASF15
	.byte	0x3
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.uleb128 0x8
	.long	.LASF18
	.byte	0xff
	.byte	0
	.uleb128 0x9
	.byte	0x28
	.byte	0x3
	.byte	0x25
	.long	0x145
	.uleb128 0xa
	.long	.LASF19
	.byte	0x3
	.byte	0x26
	.long	0x99
	.byte	0
	.uleb128 0xa
	.long	.LASF20
	.byte	0x3
	.byte	0x27
	.long	0x145
	.byte	0x8
	.uleb128 0xa
	.long	.LASF21
	.byte	0x3
	.byte	0x28
	.long	0x74
	.byte	0xc
	.uleb128 0xa
	.long	.LASF22
	.byte	0x3
	.byte	0x29
	.long	0x50
	.byte	0x10
	.uleb128 0xa
	.long	.LASF23
	.byte	0x3
	.byte	0x2a
	.long	0x74
	.byte	0x14
	.uleb128 0xa
	.long	.LASF24
	.byte	0x3
	.byte	0x2b
	.long	0x74
	.byte	0x18
	.uleb128 0xa
	.long	.LASF25
	.byte	0x3
	.byte	0x2c
	.long	0x74
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF26
	.byte	0x3
	.byte	0x2d
	.long	0x74
	.byte	0x20
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF27
	.uleb128 0x3
	.long	.LASF28
	.byte	0x3
	.byte	0x2e
	.long	0xdc
	.uleb128 0x9
	.byte	0x40
	.byte	0x3
	.byte	0x30
	.long	0x1fc
	.uleb128 0xa
	.long	.LASF19
	.byte	0x3
	.byte	0x32
	.long	0x99
	.byte	0
	.uleb128 0xa
	.long	.LASF29
	.byte	0x3
	.byte	0x33
	.long	0x20b
	.byte	0x8
	.uleb128 0xa
	.long	.LASF30
	.byte	0x3
	.byte	0x34
	.long	0x212
	.byte	0x10
	.uleb128 0xa
	.long	.LASF21
	.byte	0x3
	.byte	0x35
	.long	0x74
	.byte	0x18
	.uleb128 0xa
	.long	.LASF22
	.byte	0x3
	.byte	0x36
	.long	0x218
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF31
	.byte	0x3
	.byte	0x39
	.long	0x62
	.byte	0x1e
	.uleb128 0xa
	.long	.LASF32
	.byte	0x3
	.byte	0x3a
	.long	0x62
	.byte	0x20
	.uleb128 0xa
	.long	.LASF33
	.byte	0x3
	.byte	0x3b
	.long	0x74
	.byte	0x24
	.uleb128 0xa
	.long	.LASF34
	.byte	0x3
	.byte	0x3c
	.long	0x74
	.byte	0x28
	.uleb128 0xa
	.long	.LASF25
	.byte	0x3
	.byte	0x3f
	.long	0x74
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF35
	.byte	0x3
	.byte	0x40
	.long	0x74
	.byte	0x30
	.uleb128 0xa
	.long	.LASF23
	.byte	0x3
	.byte	0x42
	.long	0x74
	.byte	0x34
	.uleb128 0xa
	.long	.LASF24
	.byte	0x3
	.byte	0x43
	.long	0x74
	.byte	0x38
	.byte	0
	.uleb128 0xb
	.long	0x145
	.long	0x20b
	.uleb128 0xc
	.long	0x74
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1fc
	.uleb128 0xd
	.uleb128 0x6
	.byte	0x8
	.long	0x211
	.uleb128 0x5
	.long	0x50
	.uleb128 0x3
	.long	.LASF36
	.byte	0x3
	.byte	0x45
	.long	0x157
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF37
	.uleb128 0xe
	.long	.LASF80
	.byte	0x1
	.byte	0x37
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.long	.LASF38
	.byte	0x1
	.byte	0x45
	.long	0x145
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x297
	.uleb128 0x10
	.long	.LASF40
	.byte	0x1
	.byte	0x45
	.long	0x297
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
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x21d
	.uleb128 0x13
	.long	.LASF39
	.byte	0x1
	.byte	0x4f
	.long	0x145
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x2ec
	.uleb128 0x10
	.long	.LASF40
	.byte	0x1
	.byte	0x4f
	.long	0x297
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
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	.LASF41
	.byte	0x1
	.byte	0x5f
	.long	0x145
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x33b
	.uleb128 0x10
	.long	.LASF40
	.byte	0x1
	.byte	0x5f
	.long	0x297
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
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF42
	.byte	0x1
	.byte	0x6e
	.long	0x297
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	.LASF43
	.byte	0x1
	.byte	0x77
	.long	0x297
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF45
	.byte	0x1
	.byte	0x7c
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c1
	.uleb128 0x16
	.long	.LASF44
	.byte	0x1
	.byte	0x87
	.long	0x74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x16
	.long	.LASF40
	.byte	0x1
	.byte	0x88
	.long	0x3c1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3c7
	.uleb128 0x5
	.long	0x21d
	.uleb128 0x15
	.long	.LASF46
	.byte	0x1
	.byte	0x95
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x406
	.uleb128 0x10
	.long	.LASF47
	.byte	0x1
	.byte	0x95
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.long	.LASF48
	.byte	0x1
	.byte	0x95
	.long	0x406
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x14c
	.uleb128 0x17
	.long	.LASF49
	.byte	0x1
	.byte	0xa2
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x466
	.uleb128 0x10
	.long	.LASF47
	.byte	0x1
	.byte	0xa2
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF50
	.byte	0x1
	.byte	0xa2
	.long	0x74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x16
	.long	.LASF40
	.byte	0x1
	.byte	0xa5
	.long	0x297
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0xaa
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x4b4
	.uleb128 0x10
	.long	.LASF47
	.byte	0x1
	.byte	0xaa
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.long	.LASF52
	.byte	0x1
	.byte	0xaa
	.long	0x145
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.long	.Ldebug_ranges0+0
	.uleb128 0x16
	.long	.LASF40
	.byte	0x1
	.byte	0xad
	.long	0x297
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF81
	.byte	0x1
	.byte	0xb6
	.long	0x74
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x504
	.uleb128 0x10
	.long	.LASF47
	.byte	0x1
	.byte	0xb6
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x16
	.long	.LASF40
	.byte	0x1
	.byte	0xb9
	.long	0x297
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF82
	.byte	0x1
	.byte	0xc0
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.long	.LASF53
	.byte	0x1
	.byte	0xc5
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x66c
	.uleb128 0x16
	.long	.LASF54
	.byte	0x1
	.byte	0xca
	.long	0x297
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.long	.LASF55
	.byte	0x1
	.byte	0xcc
	.long	0x74
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x16
	.long	.LASF56
	.byte	0x1
	.byte	0xd6
	.long	0x66c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -74
	.uleb128 0x16
	.long	.LASF57
	.byte	0x1
	.byte	0xd8
	.long	0x297
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.long	.LASF58
	.byte	0x1
	.byte	0xd9
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.long	.LASF59
	.byte	0x1
	.byte	0xdc
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -70
	.uleb128 0x1b
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x5f6
	.uleb128 0x16
	.long	.LASF40
	.byte	0x1
	.byte	0xcd
	.long	0x3c1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x16
	.long	.LASF60
	.byte	0x1
	.byte	0xce
	.long	0x671
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x11
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x16
	.long	.LASF61
	.byte	0x1
	.byte	0xd2
	.long	0x671
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.long	0x63b
	.uleb128 0x16
	.long	.LASF40
	.byte	0x1
	.byte	0xdd
	.long	0x297
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x16
	.long	.LASF62
	.byte	0x1
	.byte	0xf8
	.long	0x66c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -73
	.byte	0
	.byte	0
	.uleb128 0x11
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x1c
	.long	.LASF63
	.byte	0x1
	.value	0x10e
	.long	0x671
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1c
	.long	.LASF64
	.byte	0x1
	.value	0x110
	.long	0x671
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0x145
	.uleb128 0x5
	.long	0x74
	.uleb128 0x16
	.long	.LASF65
	.byte	0x1
	.byte	0x26
	.long	0x297
	.uleb128 0x9
	.byte	0x3
	.quad	currentTask
	.uleb128 0x16
	.long	.LASF66
	.byte	0x1
	.byte	0x2c
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	totalWaitingTasks
	.uleb128 0x16
	.long	.LASF67
	.byte	0x1
	.byte	0x2d
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	totalWaitingTasksSamples
	.uleb128 0x16
	.long	.LASF68
	.byte	0x1
	.byte	0x2e
	.long	0x74
	.uleb128 0x9
	.byte	0x3
	.quad	realtimeGuardInterval
	.uleb128 0x16
	.long	.LASF69
	.byte	0x1
	.byte	0x34
	.long	0x42
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueuePos
	.uleb128 0x16
	.long	.LASF70
	.byte	0x1
	.byte	0x35
	.long	0x7f
	.uleb128 0x9
	.byte	0x3
	.quad	taskQueueSize
	.uleb128 0x1d
	.long	.LASF71
	.byte	0x1
	.byte	0x31
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	averageSystemLoadPercent
	.uleb128 0x1e
	.long	0x297
	.long	0x714
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.long	.LASF72
	.byte	0x3
	.byte	0x4a
	.long	0x709
	.uleb128 0x20
	.long	.LASF73
	.byte	0x3
	.byte	0x4b
	.long	0x671
	.uleb128 0x20
	.long	.LASF74
	.byte	0x3
	.byte	0x4c
	.long	0x671
	.uleb128 0x1e
	.long	0x21d
	.long	0x740
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.long	.LASF75
	.byte	0x3
	.byte	0x4d
	.long	0x735
	.uleb128 0x1d
	.long	.LASF76
	.byte	0x1
	.byte	0x30
	.long	0x74
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF44:
	.string	"maxNonRealtimeTaskTime"
.LASF56:
	.string	"outsideRealtimeGuardInterval"
.LASF35:
	.string	"taskLatestDeltaTime"
.LASF82:
	.string	"schedulerInit"
.LASF53:
	.string	"scheduler"
.LASF49:
	.string	"rescheduleTask"
.LASF34:
	.string	"lastSignaledAt"
.LASF54:
	.string	"temp"
.LASF13:
	.string	"TASK_PRIORITY_IDLE"
.LASF73:
	.string	"taskQueueArraySize"
.LASF72:
	.string	"taskQueueArray"
.LASF0:
	.string	"signed char"
.LASF58:
	.string	"selectedTaskDynamicPriority"
.LASF65:
	.string	"currentTask"
.LASF39:
	.string	"queueAdd"
.LASF26:
	.string	"latestDeltaTime"
.LASF60:
	.string	"nextExecuteAt"
.LASF31:
	.string	"dynamicPriority"
.LASF2:
	.string	"long int"
.LASF61:
	.string	"newTimeInterval"
.LASF19:
	.string	"taskName"
.LASF6:
	.string	"uint16_t"
.LASF70:
	.string	"taskQueueSize"
.LASF81:
	.string	"getTaskDeltaTime"
.LASF33:
	.string	"lastExecutedAt"
.LASF51:
	.string	"setTaskEnabled"
.LASF15:
	.string	"TASK_PRIORITY_MEDIUM"
.LASF9:
	.string	"unsigned int"
.LASF77:
	.string	"GNU C99 5.4.1 20160904 -mtune=generic -march=x86-64 -g -std=gnu99 -ffunction-sections -fdata-sections -ffat-lto-objects -fstack-protector-strong"
.LASF10:
	.string	"long unsigned int"
.LASF68:
	.string	"realtimeGuardInterval"
.LASF7:
	.string	"short unsigned int"
.LASF32:
	.string	"taskAgeCycles"
.LASF29:
	.string	"checkFunc"
.LASF59:
	.string	"waitingTasks"
.LASF23:
	.string	"maxExecutionTime"
.LASF71:
	.string	"averageSystemLoadPercent"
.LASF11:
	.string	"sizetype"
.LASF48:
	.string	"taskInfo"
.LASF22:
	.string	"staticPriority"
.LASF25:
	.string	"averageExecutionTime"
.LASF78:
	.string	"src/main/scheduler/scheduler.c"
.LASF66:
	.string	"totalWaitingTasks"
.LASF74:
	.string	"taskCount"
.LASF24:
	.string	"totalExecutionTime"
.LASF67:
	.string	"totalWaitingTasksSamples"
.LASF55:
	.string	"timeToNextRealtimeTask"
.LASF79:
	.string	"/home/aravind/git/cleanflight"
.LASF18:
	.string	"TASK_PRIORITY_MAX"
.LASF21:
	.string	"desiredPeriod"
.LASF46:
	.string	"getTaskInfo"
.LASF30:
	.string	"taskFunc"
.LASF14:
	.string	"TASK_PRIORITY_LOW"
.LASF41:
	.string	"queueRemove"
.LASF64:
	.string	"taskExecutionTime"
.LASF27:
	.string	"_Bool"
.LASF3:
	.string	"int32_t"
.LASF5:
	.string	"unsigned char"
.LASF1:
	.string	"short int"
.LASF16:
	.string	"TASK_PRIORITY_HIGH"
.LASF50:
	.string	"newPeriodMicros"
.LASF80:
	.string	"queueClear"
.LASF69:
	.string	"taskQueuePos"
.LASF8:
	.string	"uint32_t"
.LASF52:
	.string	"enabled"
.LASF12:
	.string	"char"
.LASF63:
	.string	"currentTimeBeforeTaskCall"
.LASF40:
	.string	"task"
.LASF36:
	.string	"cfTask_t"
.LASF20:
	.string	"isEnabled"
.LASF76:
	.string	"currentTime"
.LASF43:
	.string	"queueNext"
.LASF47:
	.string	"taskId"
.LASF28:
	.string	"cfTaskInfo_t"
.LASF75:
	.string	"cfTasks"
.LASF4:
	.string	"uint8_t"
.LASF38:
	.string	"queueContains"
.LASF37:
	.string	"float"
.LASF45:
	.string	"taskSystem"
.LASF62:
	.string	"taskCanBeChosenForScheduling"
.LASF42:
	.string	"queueFirst"
.LASF17:
	.string	"TASK_PRIORITY_REALTIME"
.LASF57:
	.string	"selectedTask"
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
