/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#define SRC_MAIN_SCHEDULER_C_

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "platform.h"

#include "scheduler/scheduler.h"
#include "build/debug.h"
#include "build/build_config.h"

#include "common/maths.h"

#include "drivers/system.h"
#include "config/config_unittest.h"

// The current task that is executing. Used to determine what the
// SELF_TASK is.
static cfTask_t *currentTask = NULL;

// Holds the current time - this is messy but its used by other files.
uint32_t currentTime = 0;

// Vars to keep track of the work load.
static uint32_t currentSchedulerExecutionPasses;
static uint32_t currentSchedulerExecutionPassesWithWork;
uint16_t averageSystemLoadPercent = 0;
bool isCpuOverloaded = false;
bool localIsCpuOverloaded = false;

// The system task execution function. This does some calculation work.
void taskSystem(void)
{
    // Calc the current cpu work load.
    if (currentSchedulerExecutionPasses > 0) {
        debug[1] = currentSchedulerExecutionPassesWithWork;
        debug[2] = currentSchedulerExecutionPasses;
        averageSystemLoadPercent = 100 * currentSchedulerExecutionPassesWithWork / currentSchedulerExecutionPasses;
        currentSchedulerExecutionPasses = 0;
        currentSchedulerExecutionPassesWithWork = 0;
    }

    // Update the cpu overload value
    isCpuOverloaded = localIsCpuOverloaded;

#ifdef SCHEDULER_DEBUG_PRINT
    printf("System Task Ran - avg system load (%d)\n",averageSystemLoadPercent);
    if(isCpuOverloaded)
    {
        printf(" - SYSTEM IS OVERLAODED, WE SKIPPED TASK PERIODS.\n");
    }
#endif
}

#ifndef SKIP_TASK_STATISTICS
void getTaskInfo(const int taskId, cfTaskInfo_t * taskInfo)
{
    taskInfo->taskName = cfTasks[taskId].taskName;
    taskInfo->isEnabled = cfTasks[taskId].isEnabled;
    taskInfo->desiredPeriod = cfTasks[taskId].desiredPeriod;
    taskInfo->priority = cfTasks[taskId].priority;
    taskInfo->maxExecutionTime = cfTasks[taskId].maxExecutionTime;
    taskInfo->totalExecutionTime = cfTasks[taskId].totalExecutionTime;
    taskInfo->averageExecutionTime = cfTasks[taskId].averageExecutionTime;
    taskInfo->latestDeltaTime = cfTasks[taskId].taskLatestDeltaTime;
}
#endif

void updateTaskExecutionPeriod(const int taskId, uint32_t newPeriodMicros)
{
    if ((taskId == TASK_SELF && currentTask != NULL) || (taskId < (int)taskCount && taskId >= 0)) {
        cfTask_t *task = taskId == TASK_SELF ? currentTask : &cfTasks[taskId];
        task->desiredPeriod = MAX(100, newPeriodMicros);  // Limit delay to 100us (10 kHz) to prevent scheduler clogging
    }
}

void setTaskEnabled(const int taskId, bool enabled)
{
    if ((taskId == TASK_SELF && currentTask != NULL) || (taskId < (int)taskCount && taskId >= 0)) {
        cfTask_t *task = taskId == TASK_SELF ? currentTask : &cfTasks[taskId];
        task->isEnabled = (enabled && task->taskFunc);
    }
}

uint32_t getTaskDeltaTime(const int taskId)
{
    if ((taskId == TASK_SELF && currentTask != NULL) || (taskId < (int)taskCount && taskId >= 0)) {
        cfTask_t *task = taskId == TASK_SELF ? currentTask : &cfTasks[taskId];
        return task->taskLatestDeltaTime;
    } else {
        return 0;
    }
}

void schedulerInit(void)
{
    // Disable all tasks and set defaults
    for(uint16_t ii = 0; ii < taskCount; ii++)
    {
        cfTasks[ii].isEnabled = false;
        cfTasks[ii].isWaitingToBeRan = false;
        cfTasks[ii].lastIdealExecutionTime = 0;
        cfTasks[ii].averageExecutionTime = 0;
        cfTasks[ii].lastExecutedAt = 0;
    }
}

void schedulerExecute(void)
{
    // Cache currentTime
    currentTime = micros();

    // Realtime Guard; We want to ensure whatever task we schedule now wont overrun a realtime task time.
    // Find when the next realtime task will run.
    uint32_t timeToNextRealtimeTask = UINT32_MAX;
    for (uint16_t ii = 0; ii < taskCount; ii++) {
        cfTask_t *task = &cfTasks[ii];
        if(task->isEnabled && task->priority >= TASK_PRIORITY_REALTIME) {
            const uint32_t nextExecuteAt = task->lastIdealExecutionTime + task->desiredPeriod;
            if ((int32_t)(currentTime - nextExecuteAt) >= 0) {
                timeToNextRealtimeTask = 0;
            } else {
                const uint32_t newTimeInterval = nextExecuteAt - currentTime;
                timeToNextRealtimeTask = MIN(timeToNextRealtimeTask, newTimeInterval);
            }
        }
    }

#ifdef SCHEDULER_DEBUG_PRINT
    printf("Time Until Next Realtime (%u)\n", timeToNextRealtimeTask);
#endif

    // The task to be invoked
    cfTask_t *selectedTask = NULL;
    int32_t selectedTaskStarvationPriority = 0;          
    bool realtimeGuardWorkDeferred = false;

    // Loop through all of the tasks. Check if any of them need to execute now and update 
    // the dynamicPriority.
    for (uint16_t ii = 0; ii < taskCount; ii++) {
        cfTask_t *task = &cfTasks[ii];

        // If the task isn't enabled skip all of this. 
        if(!task->isEnabled) {
            continue;
        }     

        // Check if we aren't waiting to be ran but we should be.
        if(!task->isWaitingToBeRan) {
            // Check if this is an event driven task.
            if (task->checkFunc != NULL) {
                // Ask if we should run this task.
                if(task->checkFunc(currentTime - task->lastExecutedAt))
                {
                    // We should run this task, set the ideal execution time to now.
                    task->lastIdealExecutionTime = currentTime;
                    task->isWaitingToBeRan = true;
                }
            }
            else
            {
                // This isn't event driven, see if it should be ran based on time. 
                // Note it is important to use the time it should have been scheduled not when it was,
                // this will give use more accurate interval times.
                // TODO: handle currentTime rolling over.
                if((task->lastIdealExecutionTime + task->desiredPeriod) <= currentTime)
                {
                    task->lastIdealExecutionTime += task->desiredPeriod;
                    task->isWaitingToBeRan = true;                    
                }
            }
        }   

        // Now check if the task is waiting to be ran. 
        if(task->isWaitingToBeRan) {

            // Figure out how many cycles this task has been waiting.
            const uint32_t taskAge = 1 + ((currentTime - task->lastIdealExecutionTime) / task->desiredPeriod);

            // Figure out the starvationPriority. This will get higher the longer the task waits. If the value is 0
            // the task shouldn't be scheduled (this happens by the realtime guard) 
            // Note: For idle task the pri is 0 so they always fall to 1. They will always be overtaken by
            // any other task if there is something to run.
            int32_t starvationPriority = 1 + task->priority * taskAge;

            // Realtime Guard Check
            // We now need to guard for realtime tasks. Lets see if this task can run before the next realtime task.
            if(task->priority < TASK_PRIORITY_REALTIME && 
               task->averageExecutionTime >= timeToNextRealtimeTask)
            {
                // We shouldn't select this task because it will take too long and the realtime task won't be ran on time.
                // However we don't want to 100 starve the task, so we will heavily weight the task, but if it still wins the
                // starvationPriority game it will be ran anyways. The weight will be higher for lower priority tasks.
                // Note: A value of 0 will not allow the task to be scheduled.
                const uint16_t delayWeightAmplifier = (7 - task->priority);
                starvationPriority = MAX(0, starvationPriority - (delayWeightAmplifier * 28));
                
                if(task->priority == TASK_PRIORITY_IDLE)
                {
                    // If this is an idle task don't ever schedule it if it can't run in time.
                    starvationPriority = 0;
                }
                else
                {
                    // If we deferred work we should indicate we did so the cpu load will be
                    // correctly reported. We don't want to set this for idle work.
                    realtimeGuardWorkDeferred = true;
                }

#ifdef SCHEDULER_DEBUG_PRINT
                printf("Realtime Guard task delay (%s), (%d)\n", task->taskName, starvationPriority);     
#endif           
            }

#ifdef SCHEDULER_DEBUG_PRINT
            printf("Waiting Task (%s), age:(%d) starvation :(%d)\n", task->taskName, taskAge, starvationPriority);
#endif

            // Now, figure out if we should select this task. If the value is 0 never schedule the task.
            if (starvationPriority != 0 &&
                starvationPriority > selectedTaskStarvationPriority) {

                selectedTaskStarvationPriority = starvationPriority;
                selectedTask = task;

#ifdef SCHEDULER_DEBUG_PRINT
                printf(" - Selected Task (%s), (%d)\n", task->taskName, starvationPriority);  
#endif
            }
        }   
    }

    // Set the current task, note this can be null.
    currentTask = selectedTask;
    
    // Update our load value. If we don't have a task but have deferred work count this as a busy cycle.
    currentSchedulerExecutionPasses++;
    if(selectedTask != NULL || realtimeGuardWorkDeferred)
    {
        currentSchedulerExecutionPassesWithWork++;
    }

    if (selectedTask != NULL) {
        // Found a task that should be run
        selectedTask->taskLatestDeltaTime = currentTime - selectedTask->lastExecutedAt;
        selectedTask->lastExecutedAt = currentTime;    

#ifdef SCHEDULER_DEBUG_PRINT
        printf("Running Task (%s)\n",selectedTask->taskName); 
#endif   

        // Execute task
        const uint32_t currentTimeBeforeTaskCall = micros();
        selectedTask->taskFunc();
        const uint32_t taskExecutionTime = micros() - currentTimeBeforeTaskCall;

        // If the task is time based and not event based make sure the next execute time is after the current time.
        // If it isn't than we are behind on tasks. To try to catch back up we will make sure this task doesn't execute
        // until at least sometime in the future. This might help us recover.
        if(selectedTask->checkFunc == NULL)
        {    
            while((selectedTask->lastIdealExecutionTime + selectedTask->desiredPeriod) <= currentTime + taskExecutionTime)
            {
                selectedTask->lastIdealExecutionTime += selectedTask->desiredPeriod;
                localIsCpuOverloaded = true;
            }
        }

        // Clear our current task 
        currentTask = NULL;
        selectedTask->isWaitingToBeRan = false;

        selectedTask->averageExecutionTime = ((uint32_t)selectedTask->averageExecutionTime * 31 + taskExecutionTime) / 32;
#ifndef SKIP_TASK_STATISTICS
        selectedTask->totalExecutionTime += taskExecutionTime;   // time consumed by scheduler + task
        selectedTask->maxExecutionTime = MAX(selectedTask->maxExecutionTime, taskExecutionTime);
#endif
#if defined SCHEDULER_DEBUG
        debug[3] = (micros() - currentTime) - taskExecutionTime;
    } else {
        debug[3] = (micros() - currentTime);
#endif
    }
    GET_SCHEDULER_LOCALS();
}
