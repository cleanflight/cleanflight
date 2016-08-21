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
//#define SCHEDULER_DEBUG_PRINT

typedef enum {
    TASK_PRIORITY_IDLE = 0,     // This task will only run if there is nothing else to run. If your cpu is quite busy there is no guarantee this will ever run!
    TASK_PRIORITY_LOW = 1,   
    TASK_PRIORITY_MEDIUM = 3,
    TASK_PRIORITY_HIGH = 5,
    TASK_PRIORITY_REALTIME = 6, // This task will be ran as close to realtime as possible. linze
    TASK_PRIORITY_MAX = 255
} cfTaskPriority_e;

// A special task type that will reference the current task.
#define TASK_SELF -1

typedef struct {
    const char * taskName;
    bool         isEnabled;                 // Indicates if the task is enabled.
    uint32_t     desiredPeriod;             // the desired amount of time between each execution (in microseconds)
    uint8_t      priority;                  // the priority of the task
    uint32_t     maxExecutionTime;          // keeps track of the longest this task has ever ran (in microseconds)
    uint32_t     totalExecutionTime;        // keeps track of the total amount of time this task has ran (in microseconds)
    uint32_t     averageExecutionTime;      // keeps track of the average run time (in microseconds)
    uint32_t     latestDeltaTime;           // keeps track of the last amount of time between executions.
} cfTaskInfo_t;

typedef struct {

    // The function that is called when the task is executed.
    void (*taskFunc)(void);  

    // If this function is defined the task will be considered event driven. This means
    // it will not be scheduled due to a period, instead when this function returns true the task will 
    // be scheduled. Note, once this function returns true it will not be called again until the task is ran.
    // currentDeltaTime (micros) time time since the last execution. 
    bool (*checkFunc)(uint32_t currentDeltaTime); 

    /* Configuration */
    const char * taskName;
    bool isEnabled;                 // Indicates if the task is enabled or not.
    uint32_t desiredPeriod;         // If not an event based task, this is the target time (micros) between executions 
    const uint8_t priority;         // The priority of the task. 

    /* Scheduling */
    bool isWaitingToBeRan;          // Indicates if the task is waiting to be ran or not.
    uint32_t lastIdealExecutionTime;// Time in (micros) when the task should have ideally been ran.
    uint32_t lastExecutedAt;        // last time (micros) when the task was executed

    /* Statistics */
    uint32_t averageExecutionTime;  // Moving average over 31 samples, used to calculate the realtime guard interval
    uint32_t taskLatestDeltaTime;   // keeps track of the last amount of time between executions. 
#ifndef SKIP_TASK_STATISTICS
    uint32_t maxExecutionTime;      // keeps track of the longest this task has ever ran (in microseconds)
    uint32_t totalExecutionTime;    // total time consumed by task since boot
#endif
} cfTask_t;


// An array of all possible tasks. This is defined in the fc folder.
extern cfTask_t cfTasks[];

// The total number of tasks we have in the array.
extern const uint32_t taskCount;

// Sets up the scheduler
void schedulerInit(void);

// Preforms the scheduling logic and executes one task if possible.
void schedulerExecute(void);

// Enables or disables a given task.
void setTaskEnabled(const int taskId, bool newEnabledState);

// Returns info for the given task.
void getTaskInfo(const int taskId, cfTaskInfo_t *taskInfo);

// Updates the task period (micros) between executions. This does nothing if the task is event driven.
void updateTaskExecutionPeriod(const int taskId, uint32_t newPeriodMicros);

// Returns the last amount of time between the execution of the given task.
uint32_t getTaskDeltaTime(const int taskId);

//
// CPU Stats

// The average cpu load sampled from a short time.
extern uint16_t averageSystemLoadPercent;

// Indicates if we had to skip task periods in this time span or not. 
// If we skipped time slots we are trying to catch up.
extern bool isCpuOverloaded;

#define LOAD_PERCENTAGE_ONE 100
#define isSystemOverloaded() (averageSystemLoadPercent >= LOAD_PERCENTAGE_ONE || isCpuOverloaded)


