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

#pragma once

//#define SCHEDULER_DEBUG

typedef enum {
    TASK_PRIORITY_IDLE = 0,     // Disables dynamic scheduling, task is executed only if no other task is active this cycle
    TASK_PRIORITY_LOW = 1,
    TASK_PRIORITY_MEDIUM = 3,
    TASK_PRIORITY_HIGH = 5,
    TASK_PRIORITY_REALTIME = 6,
    TASK_PRIORITY_MAX = 255
} cfTaskPriority_e;

#define TASK_SELF -1

typedef struct {
    const char * taskName;
    bool         isEnabled;
    uint32_t     desiredPeriod;
    uint8_t      staticPriority;
    uint32_t     maxExecutionTime;
    uint32_t     totalExecutionTime;
    uint32_t     averageExecutionTime;
    uint32_t     latestDeltaTime;
} cfTaskInfo_t;

typedef struct {
    /* Configuration */
    const char * taskName;
    bool (*checkFunc)(uint32_t currentDeltaTime);
    void (*taskFunc)(void);
    uint32_t desiredPeriod;         // target period of execution
    const uint8_t staticPriority;   // dynamicPriority grows in steps of this size, shouldn't be zero

    /* Scheduling */
    uint16_t dynamicPriority;       // measurement of how old task was last executed, used to avoid task starvation
    uint16_t taskAgeCycles;
    uint32_t lastExecutedAt;        // last time of invocation
    uint32_t lastSignaledAt;        // time of invocation event for event-driven tasks

    /* Statistics */
    uint32_t averageExecutionTime;  // Moving average over 6 samples, used to calculate guard interval
    uint32_t taskLatestDeltaTime;   //
#ifndef SKIP_TASK_STATISTICS
    uint32_t maxExecutionTime;
    uint32_t totalExecutionTime;    // total time consumed by task since boot
#endif
} cfTask_t;

extern uint16_t cpuLoad;
extern uint16_t averageSystemLoadPercent;

extern cfTask_t* taskQueueArray[];
extern const uint32_t taskQueueArraySize;
extern const uint32_t taskCount;
extern cfTask_t cfTasks[];

void getTaskInfo(const int taskId, cfTaskInfo_t *taskInfo);
void rescheduleTask(const int taskId, uint32_t newPeriodMicros);
void setTaskEnabled(const int taskId, bool newEnabledState);
uint32_t getTaskDeltaTime(const int taskId);

void schedulerInit(void);
void scheduler(void);

#define LOAD_PERCENTAGE_ONE 100

#define isSystemOverloaded() (averageSystemLoadPercent >= LOAD_PERCENTAGE_ONE)
