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

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "platform.h"

#ifdef USE_DASHBOARD

#include "common/utils.h"

#include "build/version.h"
#include "build/debug.h"

#include "build/build_config.h"

#include "drivers/bus.h"
#include "drivers/display.h"
#include "drivers/display_ug2864hsweg01.h"
#include "drivers/time.h"

#include "cms/cms.h"

#include "common/printf.h"
#include "common/maths.h"
#include "common/axis.h"
#include "common/typeconversion.h"

#include "config/feature.h"
#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "fc/config.h"
#include "fc/controlrate_profile.h"
#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/failsafe.h"
#include "flight/navigation.h"

#include "io/gps.h"
#include "io/dashboard.h"
#include "io/displayport_oled.h"

#include "rx/rx.h"

#include "scheduler/scheduler.h"

#include "sensors/acceleration.h"
#include "sensors/battery.h"
#include "sensors/compass.h"
#include "sensors/gyro.h"
#include "sensors/sensors.h"


PG_REGISTER_WITH_RESET_TEMPLATE(dashboardConfig_t, dashboardConfig, PG_DASHBOARD_CONFIG, 0);

PG_RESET_TEMPLATE(dashboardConfig_t, dashboardConfig,
    .device = I2C_DEV_TO_CFG(DASHBOARD_I2C_INSTANCE),
    .address = DASHBOARD_I2C_ADDRESS,
);

#define MICROSECONDS_IN_A_SECOND (1000 * 1000)

#define DISPLAY_UPDATE_FREQUENCY (MICROSECONDS_IN_A_SECOND / 5)
#define PAGE_CYCLE_FREQUENCY (MICROSECONDS_IN_A_SECOND * 5)

static busDevice_t *bus;

static uint32_t nextDisplayUpdateAt = 0;
static bool dashboardPresent = false;

static displayPort_t *displayPort;

#define PAGE_TITLE_LINE_COUNT 1

static char lineBuffer[SCREEN_CHARACTER_COLUMN_COUNT + 1];

#define HALF_SCREEN_CHARACTER_COLUMN_COUNT (SCREEN_CHARACTER_COLUMN_COUNT / 2)
#define IS_SCREEN_CHARACTER_COLUMN_COUNT_ODD (SCREEN_CHARACTER_COLUMN_COUNT & 1)

typedef void (*pageFnPtr)(void);

#define PAGE_FLAGS_NONE         0
#define PAGE_FLAGS_SKIP_CYCLING (1 << 0)

typedef struct pageEntry_s {
    pageId_e id;
    char *title;
    pageFnPtr drawFn;
    uint8_t flags;
} pageEntry_t;

static const char* tickerCharacters = "|/-\\"; // use 2/4/8 characters so that the divide is optimal.
#define TICKER_CHARACTER_COUNT (sizeof(tickerCharacters) / sizeof(char))

typedef enum {
    PAGE_STATE_FLAG_NONE = 0,
    PAGE_STATE_FLAG_CYCLE_ENABLED = (1 << 0),
    PAGE_STATE_FLAG_FORCE_PAGE_CHANGE = (1 << 1),
} pageFlags_e;

typedef struct pageState_s {
    bool pageChanging;
    const pageEntry_t *page;
    uint8_t pageFlags;
    uint8_t cycleIndex;
    uint32_t nextPageAt;
} pageState_t;

static pageState_t pageState;

static void resetDisplay(void)
{
    dashboardPresent = ug2864hsweg01InitI2C(bus);
}

void LCDprint(uint8_t i)
{
   i2c_OLED_send_char(bus, i);
}

static void padLineBuffer(void)
{
    uint8_t length = strlen(lineBuffer);
    while (length < sizeof(lineBuffer) - 1) {
        lineBuffer[length++] = ' ';
    }
    lineBuffer[length] = 0;
}

#ifdef GPS
static void padHalfLineBuffer(void)
{
    uint8_t halfLineIndex = sizeof(lineBuffer) / 2;
    uint8_t length = strlen(lineBuffer);
    while (length < halfLineIndex - 1) {
        lineBuffer[length++] = ' ';
    }
    lineBuffer[length] = 0;
}
#endif

// LCDbar(n,v) : draw a bar graph - n number of chars for width, v value in % to display
static void drawHorizonalPercentageBar(uint8_t width,uint8_t percent)
{
    uint8_t i, j;

    if (percent > 100)
        percent = 100;

    j = (width * percent) / 100;

    for (i = 0; i < j; i++)
        LCDprint(159); // full

    if (j < width)
        LCDprint(154 + (percent * width * 5 / 100 - 5 * j)); // partial fill

    for (i = j + 1; i < width; i++)
        LCDprint(154); // empty
}

#if 0
static void fillScreenWithCharacters()
{
    for (uint8_t row = 0; row < SCREEN_CHARACTER_ROW_COUNT; row++) {
        for (uint8_t column = 0; column < SCREEN_CHARACTER_COLUMN_COUNT; column++) {
            i2c_OLED_set_xy(bus, column, row);
            i2c_OLED_send_char(bus, 'A' + column);
        }
    }
}
#endif


static void updateTicker(void)
{
    static uint8_t tickerIndex = 0;
    i2c_OLED_set_xy(bus, SCREEN_CHARACTER_COLUMN_COUNT - 1, 0);
    i2c_OLED_send_char(bus, tickerCharacters[tickerIndex]);
    tickerIndex++;
    tickerIndex = tickerIndex % TICKER_CHARACTER_COUNT;
}

static void updateRxStatus(void)
{
    i2c_OLED_set_xy(bus, SCREEN_CHARACTER_COLUMN_COUNT - 2, 0);
    char rxStatus = '!';
    if (rxIsReceivingSignal()) {
        rxStatus = 'r';
    } if (rxAreFlightChannelsValid()) {
        rxStatus = 'R';
    }
    i2c_OLED_send_char(bus, rxStatus);
}

static void updateFailsafeStatus(void)
{
    char failsafeIndicator = '?';
    switch (failsafePhase()) {
    case FAILSAFE_IDLE:
        failsafeIndicator = '-';
        break;
    case FAILSAFE_RX_LOSS_DETECTED:
        failsafeIndicator = 'R';
        break;
    case FAILSAFE_LANDING:
        failsafeIndicator = 'l';
        break;
    case FAILSAFE_LANDED:
        failsafeIndicator = 'L';
        break;
    case FAILSAFE_RX_LOSS_MONITORING:
        failsafeIndicator = 'M';
        break;
    case FAILSAFE_RX_LOSS_RECOVERED:
        failsafeIndicator = 'r';
        break;
    }
    i2c_OLED_set_xy(bus, SCREEN_CHARACTER_COLUMN_COUNT - 3, 0);
    i2c_OLED_send_char(bus, failsafeIndicator);
}

static void showTitle()
{
    i2c_OLED_set_line(bus, 0);
    i2c_OLED_send_string(bus, pageState.page->title);
}

static void handlePageChange(void)
{
    i2c_OLED_clear_display_quick(bus);
    showTitle();
}

static void drawRxChannel(uint8_t channelIndex, uint8_t width)
{
    LCDprint(rcChannelLetters[channelIndex]);

    const uint32_t percentage = (constrain(rcData[channelIndex], PWM_RANGE_MIN, PWM_RANGE_MAX) - PWM_RANGE_MIN) * 100 / (PWM_RANGE_MAX - PWM_RANGE_MIN);
    drawHorizonalPercentageBar(width - 1, percentage);
}

#define RX_CHANNELS_PER_PAGE_COUNT 14
static void showRxPage(void)
{
    for (int channelIndex = 0; channelIndex < rxRuntimeConfig.channelCount && channelIndex < RX_CHANNELS_PER_PAGE_COUNT; channelIndex += 2) {
        i2c_OLED_set_line(bus, (channelIndex / 2) + PAGE_TITLE_LINE_COUNT);

        drawRxChannel(channelIndex, HALF_SCREEN_CHARACTER_COLUMN_COUNT);

        if (channelIndex >= rxRuntimeConfig.channelCount) {
            continue;
        }

        if (IS_SCREEN_CHARACTER_COLUMN_COUNT_ODD) {
            LCDprint(' ');
        }

        drawRxChannel(channelIndex + PAGE_TITLE_LINE_COUNT, HALF_SCREEN_CHARACTER_COLUMN_COUNT);
    }
}

static void showWelcomePage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    tfp_sprintf(lineBuffer, "v%s (%s)", FC_VERSION_STRING, shortGitRevision);
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, targetName);
}

static void showArmedPage(void)
{
}

static void showProfilePage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    tfp_sprintf(lineBuffer, "Profile: %d", getCurrentPidProfileIndex());
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    static const char* const axisTitles[3] = {"ROL", "PIT", "YAW"};
    const pidProfile_t *pidProfile = currentPidProfile;
    for (int axis = 0; axis < 3; ++axis) {
        tfp_sprintf(lineBuffer, "%s P:%3d I:%3d D:%3d",
            axisTitles[axis],
            pidProfile->pid[axis].P,
            pidProfile->pid[axis].I,
            pidProfile->pid[axis].D
        );
        padLineBuffer();
        i2c_OLED_set_line(bus, rowIndex++);
        i2c_OLED_send_string(bus, lineBuffer);
    }

    const uint8_t currentRateProfileIndex = getCurrentControlRateProfileIndex();
    tfp_sprintf(lineBuffer, "Rate profile: %d", currentRateProfileIndex);
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    const controlRateConfig_t *controlRateConfig = controlRateProfiles(currentRateProfileIndex);
    tfp_sprintf(lineBuffer, "RCE: %d, RCR: %d",
        controlRateConfig->rcExpo8,
        controlRateConfig->rcRate8
    );
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "RR:%d PR:%d YR:%d",
        controlRateConfig->rates[FD_ROLL],
        controlRateConfig->rates[FD_PITCH],
        controlRateConfig->rates[FD_YAW]
    );
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);
}
#define SATELLITE_COUNT (sizeof(GPS_svinfo_cno) / sizeof(GPS_svinfo_cno[0]))
#define SATELLITE_GRAPH_LEFT_OFFSET ((SCREEN_CHARACTER_COLUMN_COUNT - SATELLITE_COUNT) / 2)

#ifdef GPS
static void showGpsPage()
{
    if (!feature(FEATURE_GPS)) {
        pageState.pageFlags |= PAGE_STATE_FLAG_FORCE_PAGE_CHANGE;
        return;
    }

    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    static uint8_t gpsTicker = 0;
    static uint32_t lastGPSSvInfoReceivedCount = 0;
    if (GPS_svInfoReceivedCount != lastGPSSvInfoReceivedCount) {
        lastGPSSvInfoReceivedCount = GPS_svInfoReceivedCount;
        gpsTicker++;
        gpsTicker = gpsTicker % TICKER_CHARACTER_COUNT;
    }

    i2c_OLED_set_xy(bus, 0, rowIndex);
    i2c_OLED_send_char(bus, tickerCharacters[gpsTicker]);

    i2c_OLED_set_xy(bus, MAX(0, (uint8_t)SATELLITE_GRAPH_LEFT_OFFSET), rowIndex++);

    uint32_t index;
    for (index = 0; index < SATELLITE_COUNT && index < SCREEN_CHARACTER_COLUMN_COUNT; index++) {
        uint8_t bargraphOffset = ((uint16_t) GPS_svinfo_cno[index] * VERTICAL_BARGRAPH_CHARACTER_COUNT) / (GPS_DBHZ_MAX - 1);
        bargraphOffset = MIN(bargraphOffset, VERTICAL_BARGRAPH_CHARACTER_COUNT - 1);
        i2c_OLED_send_char(bus, VERTICAL_BARGRAPH_ZERO_CHARACTER + bargraphOffset);
    }


    char fixChar = STATE(GPS_FIX) ? 'Y' : 'N';
    tfp_sprintf(lineBuffer, "Sats: %d Fix: %c", gpsSol.numSat, fixChar);
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "La/Lo: %d/%d", gpsSol.llh.lat / GPS_DEGREES_DIVIDER, gpsSol.llh.lon / GPS_DEGREES_DIVIDER);
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "Spd: %d", gpsSol.groundSpeed);
    padHalfLineBuffer();
    i2c_OLED_set_line(bus, rowIndex);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "GC: %d", gpsSol.groundCourse);
    padHalfLineBuffer();
    i2c_OLED_set_xy(bus, HALF_SCREEN_CHARACTER_COLUMN_COUNT, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "RX: %d", GPS_packetCount);
    padHalfLineBuffer();
    i2c_OLED_set_line(bus, rowIndex);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "ERRs: %d", gpsData.errors, gpsData.timeouts);
    padHalfLineBuffer();
    i2c_OLED_set_xy(bus, HALF_SCREEN_CHARACTER_COLUMN_COUNT, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "Dt: %d", gpsData.lastMessage - gpsData.lastLastMessage);
    padHalfLineBuffer();
    i2c_OLED_set_line(bus, rowIndex);
    i2c_OLED_send_string(bus, lineBuffer);

    tfp_sprintf(lineBuffer, "TOs: %d", gpsData.timeouts);
    padHalfLineBuffer();
    i2c_OLED_set_xy(bus, HALF_SCREEN_CHARACTER_COLUMN_COUNT, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    strncpy(lineBuffer, gpsPacketLog, GPS_PACKET_LOG_ENTRY_COUNT);
    padHalfLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

#ifdef GPS_PH_DEBUG
    tfp_sprintf(lineBuffer, "Angles: P:%d R:%d", GPS_angle[PITCH], GPS_angle[ROLL]);
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);
#endif

#if 0
    tfp_sprintf(lineBuffer, "%d %d %d %d", debug[0], debug[1], debug[2], debug[3]);
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);
#endif
}
#endif

static void showBatteryPage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    if (batteryConfig()->voltageMeterSource != VOLTAGE_METER_NONE) {
        tfp_sprintf(lineBuffer, "Volts: %d.%1d Cells: %d", getBatteryVoltage() / 10, getBatteryVoltage() % 10, getBatteryCellCount());
        padLineBuffer();
        i2c_OLED_set_line(bus, rowIndex++);
        i2c_OLED_send_string(bus, lineBuffer);

        uint8_t batteryPercentage = calculateBatteryPercentageRemaining();
        i2c_OLED_set_line(bus, rowIndex++);
        drawHorizonalPercentageBar(SCREEN_CHARACTER_COLUMN_COUNT, batteryPercentage);
    }

    if (batteryConfig()->currentMeterSource != CURRENT_METER_NONE) {

        int32_t amperage = getAmperage();
        tfp_sprintf(lineBuffer, "Amps: %d.%2d mAh: %d", amperage / 100, amperage % 100, getMAhDrawn());
        padLineBuffer();
        i2c_OLED_set_line(bus, rowIndex++);
        i2c_OLED_send_string(bus, lineBuffer);

        uint8_t capacityPercentage = calculateBatteryPercentageRemaining();
        i2c_OLED_set_line(bus, rowIndex++);
        drawHorizonalPercentageBar(SCREEN_CHARACTER_COLUMN_COUNT, capacityPercentage);
    }
}

static void showSensorsPage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;
    static const char *format = "%s %5d %5d %5d";

    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, "        X     Y     Z");

    if (sensors(SENSOR_ACC)) {
        tfp_sprintf(lineBuffer, format, "ACC", acc.accSmooth[X], acc.accSmooth[Y], acc.accSmooth[Z]);
        padLineBuffer();
        i2c_OLED_set_line(bus, rowIndex++);
        i2c_OLED_send_string(bus, lineBuffer);
    }

    if (sensors(SENSOR_GYRO)) {
        tfp_sprintf(lineBuffer, format, "GYR", lrintf(gyro.gyroADCf[X]), lrintf(gyro.gyroADCf[Y]), lrintf(gyro.gyroADCf[Z]));
        padLineBuffer();
        i2c_OLED_set_line(bus, rowIndex++);
        i2c_OLED_send_string(bus, lineBuffer);
    }

#ifdef MAG
    if (sensors(SENSOR_MAG)) {
        tfp_sprintf(lineBuffer, format, "MAG", mag.magADC[X], mag.magADC[Y], mag.magADC[Z]);
        padLineBuffer();
        i2c_OLED_set_line(bus, rowIndex++);
        i2c_OLED_send_string(bus, lineBuffer);
    }
#endif

    tfp_sprintf(lineBuffer, format, "I&H", attitude.values.roll, attitude.values.pitch, DECIDEGREES_TO_DEGREES(attitude.values.yaw));
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    /*
    uint8_t length;

    ftoa(EstG.A[X], lineBuffer);
    length = strlen(lineBuffer);
    while (length < HALF_SCREEN_CHARACTER_COLUMN_COUNT) {
        lineBuffer[length++] = ' ';
        lineBuffer[length+1] = 0;
    }
    ftoa(EstG.A[Y], lineBuffer + length);
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);

    ftoa(EstG.A[Z], lineBuffer);
    length = strlen(lineBuffer);
    while (length < HALF_SCREEN_CHARACTER_COLUMN_COUNT) {
        lineBuffer[length++] = ' ';
        lineBuffer[length+1] = 0;
    }
    ftoa(smallAngle, lineBuffer + length);
    padLineBuffer();
    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, lineBuffer);
    */

}

#ifndef SKIP_TASK_STATISTICS
static void showTasksPage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;
    static const char *format = "%2d%6d%5d%4d%4d";

    i2c_OLED_set_line(bus, rowIndex++);
    i2c_OLED_send_string(bus, "Task max  avg mx% av%");
    cfTaskInfo_t taskInfo;
    for (cfTaskId_e taskId = 0; taskId < TASK_COUNT; ++taskId) {
        getTaskInfo(taskId, &taskInfo);
        if (taskInfo.isEnabled && taskId != TASK_SERIAL) {// don't waste a line of the display showing serial taskInfo
            const int taskFrequency = (int)(1000000.0f / ((float)taskInfo.latestDeltaTime));
            const int maxLoad = (taskInfo.maxExecutionTime * taskFrequency + 5000) / 10000;
            const int averageLoad = (taskInfo.averageExecutionTime * taskFrequency + 5000) / 10000;
            tfp_sprintf(lineBuffer, format, taskId, taskInfo.maxExecutionTime, taskInfo.averageExecutionTime, maxLoad, averageLoad);
            padLineBuffer();
            i2c_OLED_set_line(bus, rowIndex++);
            i2c_OLED_send_string(bus, lineBuffer);
            if (rowIndex > SCREEN_CHARACTER_ROW_COUNT) {
                break;
            }
        }
    }
}
#endif

#ifdef ENABLE_DEBUG_DASHBOARD_PAGE

static void showDebugPage(void)
{
    for (int rowIndex = 0; rowIndex < 4; rowIndex++) {
        tfp_sprintf(lineBuffer, "%d = %5d", rowIndex, debug[rowIndex]);
        padLineBuffer();
        i2c_OLED_set_line(bus, rowIndex + PAGE_TITLE_LINE_COUNT);
        i2c_OLED_send_string(bus, lineBuffer);
    }
}
#endif

static const pageEntry_t pages[PAGE_COUNT] = {
    { PAGE_WELCOME, FC_FIRMWARE_NAME,  showWelcomePage,    PAGE_FLAGS_SKIP_CYCLING },
    { PAGE_ARMED,   "ARMED",           showArmedPage,      PAGE_FLAGS_SKIP_CYCLING },
    { PAGE_PROFILE, "PROFILE",         showProfilePage,    PAGE_FLAGS_NONE },
#ifdef GPS
    { PAGE_GPS,     "GPS",             showGpsPage,        PAGE_FLAGS_NONE },
#endif
    { PAGE_RX,      "RX",              showRxPage,         PAGE_FLAGS_NONE },
    { PAGE_BATTERY, "BATTERY",         showBatteryPage,    PAGE_FLAGS_NONE },
    { PAGE_SENSORS, "SENSORS",         showSensorsPage,    PAGE_FLAGS_NONE },
#ifndef SKIP_TASK_STATISTICS
    { PAGE_TASKS,   "TASKS",           showTasksPage,      PAGE_FLAGS_NONE },
#endif
#ifdef ENABLE_DEBUG_DASHBOARD_PAGE
    { PAGE_DEBUG,   "DEBUG",           showDebugPage,      PAGE_FLAGS_NONE },
#endif
};


void dashboardSetPage(pageId_e pageId)
{
    for (int i = 0; i < PAGE_COUNT; i++) {
        const pageEntry_t *candidatePage = &pages[i];
        if (candidatePage->id == pageId) {
            pageState.page = candidatePage;
        }
    }
    pageState.pageFlags |= PAGE_STATE_FLAG_FORCE_PAGE_CHANGE;
}

void dashboardUpdate(timeUs_t currentTimeUs)
{
    static uint8_t previousArmedState = 0;

#ifdef CMS
    if (displayIsGrabbed(displayPort)) {
        return;
    }
#endif

    const bool updateNow = (int32_t)(currentTimeUs - nextDisplayUpdateAt) >= 0L;
    if (!updateNow) {
        return;
    }

    nextDisplayUpdateAt = currentTimeUs + DISPLAY_UPDATE_FREQUENCY;

    bool armedState = ARMING_FLAG(ARMED) ? true : false;
    bool armedStateChanged = armedState != previousArmedState;
    previousArmedState = armedState;

    if (armedState) {
        if (!armedStateChanged) {
            return;
        }
        dashboardSetPage(PAGE_ARMED);
        pageState.pageChanging = true;
    } else {
        if (armedStateChanged) {
            pageState.pageFlags |= PAGE_STATE_FLAG_FORCE_PAGE_CHANGE;
        }

        pageState.pageChanging = (pageState.pageFlags & PAGE_STATE_FLAG_FORCE_PAGE_CHANGE) ||
                (((int32_t)(currentTimeUs - pageState.nextPageAt) >= 0L && (pageState.pageFlags & PAGE_STATE_FLAG_CYCLE_ENABLED)));
        if (pageState.pageChanging && (pageState.pageFlags & PAGE_STATE_FLAG_CYCLE_ENABLED)) {

            do {
                pageState.cycleIndex++;
                pageState.cycleIndex = pageState.cycleIndex % PAGE_COUNT;
                pageState.page = &pages[pageState.cycleIndex];
            } while (pageState.page->flags & PAGE_FLAGS_SKIP_CYCLING);
        }
    }

    if (pageState.pageChanging) {
        pageState.pageFlags &= ~PAGE_STATE_FLAG_FORCE_PAGE_CHANGE;
        pageState.nextPageAt = currentTimeUs + PAGE_CYCLE_FREQUENCY;

        // Some OLED displays do not respond on the first initialisation so refresh the display
        // when the page changes in the hopes the hardware responds.  This also allows the
        // user to power off/on the display or connect it while powered.
        resetDisplay();

        if (!dashboardPresent) {
            return;
        }
        handlePageChange();
    }

    if (!dashboardPresent) {
        return;
    }

    pageState.page->drawFn();

    if (!armedState) {
        updateFailsafeStatus();
        updateRxStatus();
        updateTicker();
    }

}

void dashboardInit(void)
{
    static busDevice_t dashBoardBus;
    dashBoardBus.busdev_u.i2c.device = I2C_CFG_TO_DEV(dashboardConfig()->device);
    dashBoardBus.busdev_u.i2c.address = dashboardConfig()->address;
    bus = &dashBoardBus;

    delay(200);
    resetDisplay();
    delay(200);

    displayPort = displayPortOledInit(bus);
#if defined(CMS)
    if (dashboardPresent) {
        cmsDisplayPortRegister(displayPort);
    }
#endif

    memset(&pageState, 0, sizeof(pageState));
    dashboardSetPage(PAGE_WELCOME);

    uint32_t now = micros();
    dashboardUpdate(now);

    dashboardSetNextPageChangeAt(now + PAGE_CYCLE_FREQUENCY);
}

void dashboardShowFixedPage(pageId_e pageId)
{
    dashboardSetPage(pageId);
    dashboardDisablePageCycling();
}

void dashboardSetNextPageChangeAt(timeUs_t futureMicros)
{
    pageState.nextPageAt = futureMicros;
}

void dashboardEnablePageCycling(void)
{
    pageState.pageFlags |= PAGE_STATE_FLAG_CYCLE_ENABLED;
}

void dashboardResetPageCycling(void)
{
    pageState.cycleIndex = PAGE_COUNT - 1; // start at first page

}

void dashboardDisablePageCycling(void)
{
    pageState.pageFlags &= ~PAGE_STATE_FLAG_CYCLE_ENABLED;
}
#endif // USE_DASHBOARD
