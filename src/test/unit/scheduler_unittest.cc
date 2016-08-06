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

#include <stdint.h>

extern "C" {
    #include "platform.h"
    #include "fc/fc_tasks.h"
    #include "scheduler/scheduler.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"
enum {
    systemTime = 10,
    pidLoopCheckerTime = 650,
    updateAccelerometerTime = 192,
    handleSerialTime = 30,
    updateBeeperTime = 1,
    updateBatteryTime = 1,
    updateRxCheckTime = 34,
    updateRxMainTime = 10,
    processGPSTime = 10,
    updateCompassTime = 195,
    updateBaroTime = 201,
    updateSonarTime = 10,
    calculateAltitudeTime = 154,
    updateDisplayTime = 10,
    telemetryTime = 10,
    ledStripTime = 10,
    transponderTime = 10
};

extern "C" {
    cfTask_t * unittest_scheduler_selectedTask;
    uint8_t unittest_scheduler_selectedTaskDynPrio;
    uint16_t unittest_scheduler_waitingTasks;
    uint32_t unittest_scheduler_timeToNextRealtimeTask;
    bool unittest_outsideRealtimeGuardInterval;

// set up micros() to simulate time
    uint32_t simulatedTime = 0;
    uint32_t micros(void) {return simulatedTime;}
// set up tasks to take a simulated representative time to execute
    void taskMainPidLoopChecker(void) {simulatedTime+=pidLoopCheckerTime;}
    void taskUpdateAccelerometer(void) {simulatedTime+=updateAccelerometerTime;}
    void taskHandleSerial(void) {simulatedTime+=handleSerialTime;}
    void taskUpdateBeeper(void) {simulatedTime+=updateBeeperTime;}
    void taskUpdateBattery(void) {simulatedTime+=updateBatteryTime;}
    bool taskUpdateRxCheck(uint32_t currentDeltaTime) {UNUSED(currentDeltaTime);simulatedTime+=updateRxCheckTime;return false;}
    void taskUpdateRxMain(void) {simulatedTime+=updateRxMainTime;}
    void taskProcessGPS(void) {simulatedTime+=processGPSTime;}
    void taskUpdateCompass(void) {simulatedTime+=updateCompassTime;}
    void taskUpdateBaro(void) {simulatedTime+=updateBaroTime;}
    void taskUpdateSonar(void) {simulatedTime+=updateSonarTime;}
    void taskCalculateAltitude(void) {simulatedTime+=calculateAltitudeTime;}
    void taskUpdateDisplay(void) {simulatedTime+=updateDisplayTime;}
    void taskTelemetry(void) {simulatedTime+=telemetryTime;}
    void taskLedStrip(void) {simulatedTime+=ledStripTime;}
    void taskTransponder(void) {simulatedTime+=transponderTime;}

    extern void queueClear(void);
    extern int queueSize();
    extern bool queueContains(cfTask_t *task);
    extern bool queueAdd(cfTask_t *task);
    extern bool queueRemove(cfTask_t *task);
    extern cfTask_t *queueFirst(void);
    extern cfTask_t *queueNext(void);
}

TEST(SchedulerUnittest, TestPriorites)
{
    EXPECT_EQ(14, taskCount);
          // if any of these fail then task priorities have changed and ordering in TestQueue needs to be re-checked
    EXPECT_EQ(TASK_PRIORITY_HIGH, cfTasks[TASK_SYSTEM].staticPriority);
    EXPECT_EQ(TASK_PRIORITY_REALTIME, cfTasks[TASK_GYROPID].staticPriority);
    EXPECT_EQ(TASK_PRIORITY_MEDIUM, cfTasks[TASK_ACCEL].staticPriority);
    EXPECT_EQ(TASK_PRIORITY_LOW, cfTasks[TASK_SERIAL].staticPriority);
    EXPECT_EQ(TASK_PRIORITY_MEDIUM, cfTasks[TASK_BATTERY].staticPriority);
}

TEST(SchedulerUnittest, TestQueueInit)
{
    queueClear();
    EXPECT_EQ(0, queueSize());
    EXPECT_EQ(0, queueFirst());
    EXPECT_EQ(0, queueNext());
    for (unsigned int ii = 0; ii <= taskCount; ++ii) {
        EXPECT_EQ(0, taskQueueArray[ii]);
    }
}

cfTask_t *deadBeefPtr = reinterpret_cast<cfTask_t*>(0xDEADBEEF);

TEST(SchedulerUnittest, TestQueue)
{
    queueClear();
    taskQueueArray[taskCount + 1] = deadBeefPtr;

    queueAdd(&cfTasks[TASK_SYSTEM]); // TASK_PRIORITY_HIGH
    EXPECT_EQ(1, queueSize());
    EXPECT_EQ(&cfTasks[TASK_SYSTEM], queueFirst());
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    queueAdd(&cfTasks[TASK_GYROPID]); // TASK_PRIORITY_REALTIME
    EXPECT_EQ(2, queueSize());
    EXPECT_EQ(&cfTasks[TASK_GYROPID], queueFirst());
    EXPECT_EQ(&cfTasks[TASK_SYSTEM], queueNext());
    EXPECT_EQ(NULL, queueNext());
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    queueAdd(&cfTasks[TASK_SERIAL]); // TASK_PRIORITY_LOW
    EXPECT_EQ(3, queueSize());
    EXPECT_EQ(&cfTasks[TASK_GYROPID], queueFirst());
    EXPECT_EQ(&cfTasks[TASK_SYSTEM], queueNext());
    EXPECT_EQ(&cfTasks[TASK_SERIAL], queueNext());
    EXPECT_EQ(NULL, queueNext());
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    queueAdd(&cfTasks[TASK_BATTERY]); // TASK_PRIORITY_MEDIUM
    EXPECT_EQ(4, queueSize());
    EXPECT_EQ(&cfTasks[TASK_GYROPID], queueFirst());
    EXPECT_EQ(&cfTasks[TASK_SYSTEM], queueNext());
    EXPECT_EQ(&cfTasks[TASK_BATTERY], queueNext());
    EXPECT_EQ(&cfTasks[TASK_SERIAL], queueNext());
    EXPECT_EQ(NULL, queueNext());
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    queueAdd(&cfTasks[TASK_RX]); // TASK_PRIORITY_HIGH
    EXPECT_EQ(5, queueSize());
    EXPECT_EQ(&cfTasks[TASK_GYROPID], queueFirst());
    EXPECT_EQ(&cfTasks[TASK_SYSTEM], queueNext());
    EXPECT_EQ(&cfTasks[TASK_RX], queueNext());
    EXPECT_EQ(&cfTasks[TASK_BATTERY], queueNext());
    EXPECT_EQ(&cfTasks[TASK_SERIAL], queueNext());
    EXPECT_EQ(NULL, queueNext());
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    queueRemove(&cfTasks[TASK_SYSTEM]); // TASK_PRIORITY_HIGH
    EXPECT_EQ(4, queueSize());
    EXPECT_EQ(&cfTasks[TASK_GYROPID], queueFirst());
    EXPECT_EQ(&cfTasks[TASK_RX], queueNext());
    EXPECT_EQ(&cfTasks[TASK_BATTERY], queueNext());
    EXPECT_EQ(&cfTasks[TASK_SERIAL], queueNext());
    EXPECT_EQ(NULL, queueNext());
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);
}

TEST(SchedulerUnittest, TestQueueAddAndRemove)
{
    queueClear();
    taskQueueArray[taskCount + 1] = deadBeefPtr;

    // fill up the queue
    for (unsigned int taskId = 0; taskId < taskCount; ++taskId) {
        const bool added = queueAdd(&cfTasks[taskId]);
        EXPECT_EQ(true, added);
        EXPECT_EQ(taskId + 1, queueSize());
        EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);
    }
    // double check end of queue
    EXPECT_EQ(taskCount, queueSize());
    EXPECT_NE(static_cast<cfTask_t*>(0), taskQueueArray[taskCount - 1]); // last item was indeed added to queue
    EXPECT_EQ(NULL, taskQueueArray[taskCount]); // null pointer at end of queue is preserved
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]); // there hasn't been an out by one error

    // and empty it again
    for (unsigned int taskId = 0; taskId < taskCount; ++taskId) {
        const bool removed = queueRemove(&cfTasks[taskId]);
        EXPECT_EQ(true, removed);
        EXPECT_EQ(taskCount - taskId - 1, queueSize());
        EXPECT_EQ(NULL, taskQueueArray[taskCount - taskId]);
        EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);
    }
    // double check size and end of queue
    EXPECT_EQ(0, queueSize()); // queue is indeed empty
    EXPECT_EQ(NULL, taskQueueArray[0]); // there is a null pointer at the end of the queueu
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]); // no accidental overwrites past end of queue
}

TEST(SchedulerUnittest, TestQueueArray)
{
    // test there are no "out by one" errors or buffer overruns when items are added and removed
    queueClear();
    taskQueueArray[taskCount + 1] = deadBeefPtr; // note, must set deadBeefPtr after queueClear

    for (unsigned int taskId = 0; taskId < taskCount - 1; ++taskId) {
        setTaskEnabled(static_cast<cfTaskId_e>(taskId), true);
        EXPECT_EQ(taskId + 1, queueSize());
        EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);
    }
    EXPECT_EQ(taskCount - 1, queueSize());
    EXPECT_NE(static_cast<cfTask_t*>(0), taskQueueArray[taskCount - 2]);
    const cfTask_t *lastTaskPrev = taskQueueArray[taskCount - 2];
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 1]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount]);
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    setTaskEnabled(TASK_SYSTEM, false);
    EXPECT_EQ(taskCount - 2, queueSize());
    EXPECT_EQ(lastTaskPrev, taskQueueArray[taskCount - 3]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 2]); // NULL at end of queue
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 1]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount]);
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    taskQueueArray[taskCount - 2] = 0;
    setTaskEnabled(TASK_SYSTEM, true);
    EXPECT_EQ(taskCount - 1, queueSize());
    EXPECT_EQ(lastTaskPrev, taskQueueArray[taskCount - 2]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 1]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount]);
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    cfTaskInfo_t taskInfo;
    getTaskInfo(static_cast<cfTaskId_e>(taskCount - 1), &taskInfo);
    EXPECT_EQ(false, taskInfo.isEnabled);
    setTaskEnabled(static_cast<cfTaskId_e>(taskCount - 1), true);
    EXPECT_EQ(taskCount, queueSize());
    EXPECT_EQ(lastTaskPrev, taskQueueArray[taskCount - 1]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount]); // check no buffer overrun
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    setTaskEnabled(TASK_SYSTEM, false);
    EXPECT_EQ(taskCount - 1, queueSize());
    //EXPECT_EQ(lastTaskPrev, taskQueueArray[taskCount - 3]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 1]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount]);
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    setTaskEnabled(TASK_ACCEL, false);
    EXPECT_EQ(taskCount - 2, queueSize());
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 2]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 1]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount]);
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);

    setTaskEnabled(TASK_BATTERY, false);
    EXPECT_EQ(taskCount - 3, queueSize());
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 3]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 2]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount - 1]);
    EXPECT_EQ(NULL, taskQueueArray[taskCount]);
    EXPECT_EQ(deadBeefPtr, taskQueueArray[taskCount + 1]);
}

TEST(SchedulerUnittest, TestSchedulerInit)
{
    schedulerInit();
    EXPECT_EQ(0, queueSize());
}

TEST(SchedulerUnittest, TestScheduleEmptyQueue)
{
    queueClear();
    simulatedTime = 4000;
    // run the with an empty queue
    scheduler();
    EXPECT_EQ(NULL, unittest_scheduler_selectedTask);
}

TEST(SchedulerUnittest, TestSingleTask)
{
    schedulerInit();
    // disable all tasks except TASK_GYROPID
    for (unsigned int taskId=0; taskId < taskCount; ++taskId) {
        setTaskEnabled(static_cast<cfTaskId_e>(taskId), false);
    }
    setTaskEnabled(TASK_GYROPID, true);
    cfTasks[TASK_GYROPID].lastExecutedAt = 1000;
    simulatedTime = 4000;
    // run the scheduler and check the task has executed
    scheduler();
    EXPECT_NE(static_cast<cfTask_t*>(0), unittest_scheduler_selectedTask);
    EXPECT_EQ(&cfTasks[TASK_GYROPID], unittest_scheduler_selectedTask);
    EXPECT_EQ(3000, cfTasks[TASK_GYROPID].taskLatestDeltaTime);
    EXPECT_EQ(4000, cfTasks[TASK_GYROPID].lastExecutedAt);
    EXPECT_EQ(pidLoopCheckerTime, cfTasks[TASK_GYROPID].totalExecutionTime);
    // task has run, so its dynamic priority should have been set to zero
    EXPECT_EQ(0, cfTasks[TASK_GYROPID].dynamicPriority);
}

TEST(SchedulerUnittest, TestTwoTasks)
{
    // disable all tasks except TASK_GYROPID  and TASK_SERIAL
    for (unsigned int taskId=0; taskId < taskCount; ++taskId) {
        setTaskEnabled(static_cast<cfTaskId_e>(taskId), false);
    }
    setTaskEnabled(TASK_SERIAL, true);
    setTaskEnabled(TASK_GYROPID, true);

    // set it up so that TASK_SERIAL ran just before TASK_GYROPID
    static const uint32_t startTime = 4000;
    simulatedTime = startTime;
    cfTasks[TASK_GYROPID].lastExecutedAt = simulatedTime;
    cfTasks[TASK_SERIAL].lastExecutedAt = cfTasks[TASK_GYROPID].lastExecutedAt - updateAccelerometerTime;
    EXPECT_EQ(0, cfTasks[TASK_SERIAL].taskAgeCycles);
    // run the scheduler
    scheduler();
    // no tasks should have run, since neither task's desired time has elapsed
    EXPECT_EQ(static_cast<cfTask_t*>(0), unittest_scheduler_selectedTask);

    // NOTE:
    // TASK_GYROPID desiredPeriod is  1000 microseconds
    // TASK_SERIAL   desiredPeriod is 10000 microseconds
    // 500 microseconds later
    simulatedTime += 500;
    // no tasks should run, since neither task's desired time has elapsed
    scheduler();
    EXPECT_EQ(static_cast<cfTask_t*>(0), unittest_scheduler_selectedTask);
    EXPECT_EQ(0, unittest_scheduler_waitingTasks);

    // 500 microseconds later, TASK_GYROPID desiredPeriod has elapsed
    simulatedTime += 500;
    // TASK_GYROPID should now run
    scheduler();
    EXPECT_EQ(&cfTasks[TASK_GYROPID], unittest_scheduler_selectedTask);
    EXPECT_EQ(1, unittest_scheduler_waitingTasks);
    EXPECT_EQ(5000 + pidLoopCheckerTime, simulatedTime);

    simulatedTime += 1000 - pidLoopCheckerTime;
    scheduler();
    // TASK_GYROPID should run again
    EXPECT_EQ(&cfTasks[TASK_GYROPID], unittest_scheduler_selectedTask);

    scheduler();
    EXPECT_EQ(static_cast<cfTask_t*>(0), unittest_scheduler_selectedTask);
    EXPECT_EQ(0, unittest_scheduler_waitingTasks);

    simulatedTime = startTime + 10500; // TASK_GYROPID and TASK_SERIAL desiredPeriods have elapsed
    // of the two TASK_GYROPID should run first
    scheduler();
    EXPECT_EQ(&cfTasks[TASK_GYROPID], unittest_scheduler_selectedTask);
    // and finally TASK_SERIAL should now run
    scheduler();
    EXPECT_EQ(&cfTasks[TASK_SERIAL], unittest_scheduler_selectedTask);
}

TEST(SchedulerUnittest, TestRealTimeGuardInNoTaskRun)
{
    // disable all tasks except TASK_GYROPID and TASK_SYSTEM
    for (unsigned int taskId=0; taskId < taskCount; ++taskId) {
        setTaskEnabled(static_cast<cfTaskId_e>(taskId), false);
    }
    setTaskEnabled(TASK_GYROPID, true);
    cfTasks[TASK_GYROPID].lastExecutedAt = 200000;
    simulatedTime = 200700;

    setTaskEnabled(TASK_SYSTEM, true);
    cfTasks[TASK_SYSTEM].lastExecutedAt = 100000;

    scheduler();

    EXPECT_EQ(false, unittest_outsideRealtimeGuardInterval);
    EXPECT_EQ(300, unittest_scheduler_timeToNextRealtimeTask);

    // Nothing should be scheduled in guard period
    EXPECT_EQ(NULL, unittest_scheduler_selectedTask);
    EXPECT_EQ(100000, cfTasks[TASK_SYSTEM].lastExecutedAt);

    EXPECT_EQ(200000, cfTasks[TASK_GYROPID].lastExecutedAt);
}

TEST(SchedulerUnittest, TestRealTimeGuardOutTaskRun)
{
    // disable all tasks except TASK_GYROPID and TASK_SYSTEM
    for (unsigned int taskId=0; taskId < taskCount; ++taskId) {
        setTaskEnabled(static_cast<cfTaskId_e>(taskId), false);
    }
    setTaskEnabled(TASK_GYROPID, true);
    cfTasks[TASK_GYROPID].lastExecutedAt = 200000;
    simulatedTime = 200699;

    setTaskEnabled(TASK_SYSTEM, true);
    cfTasks[TASK_SYSTEM].lastExecutedAt = 100000;

    scheduler();

    EXPECT_EQ(true, unittest_outsideRealtimeGuardInterval);
    EXPECT_EQ(301, unittest_scheduler_timeToNextRealtimeTask);

    // System should be scheduled as not in guard period
    EXPECT_EQ(&cfTasks[TASK_SYSTEM], unittest_scheduler_selectedTask);
    EXPECT_EQ(200699, cfTasks[TASK_SYSTEM].lastExecutedAt);

    EXPECT_EQ(200000, cfTasks[TASK_GYROPID].lastExecutedAt);
}

// STUBS
extern "C" {
}

