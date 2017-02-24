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
#include <stdarg.h>
#include <string.h>

#include <platform.h>
#include "build/build_config.h"

#ifdef DISPLAY

#include "build/version.h"
#include "build/debug.h"

#include "drivers/serial.h"
#include "drivers/system.h"
#include "drivers/display_ug2864hsweg01.h"
#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"

#include "common/printf.h"
#include "common/maths.h"
#include "common/axis.h"
#include "common/typeconversion.h"

#include "config/parameter_group.h"
#include "config/feature.h"
#include "config/profile.h"

#include "fc/rate_profile.h"
#include "fc/rc_controls.h"

#include "io/display.h"
#include "io/gps.h"

#include "rx/rx.h"

#include "sensors/amperage.h"
#include "sensors/battery.h"
#include "sensors/sensors.h"
#include "sensors/compass.h"
#include "sensors/acceleration.h"
#include "sensors/gyro.h"
#include "sensors/sonar.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/failsafe.h"
#include "flight/navigation.h"

#include "fc/runtime_config.h"
#include "fc/config.h"
#include "fc/fc_tasks.h"

#include "scheduler/scheduler.h"

static uint32_t nextDisplayUpdateAt = 0;
static bool displayPresent = false;
static char lineBuffer[SCREEN_CHARACTER_COLUMN_COUNT + 1];


#define MICROSECONDS_IN_A_SECOND (1000 * 1000)
#define DISPLAY_UPDATE_FREQUENCY (MICROSECONDS_IN_A_SECOND / 5)
#define PAGE_CYCLE_FREQUENCY (MICROSECONDS_IN_A_SECOND * 5)
#define PAGE_TOGGLE_FREQUENCY (MICROSECONDS_IN_A_SECOND / 2)
#define GPS_DISPLAY_FORCE_UPDATE_FREQUENCY (MICROSECONDS_IN_A_SECOND * 1)

#define PAGE_TITLE_LINE_COUNT 1

#define HALF_SCREEN_CHARACTER_COLUMN_COUNT (SCREEN_CHARACTER_COLUMN_COUNT / 2)
#define IS_SCREEN_CHARACTER_COLUMN_COUNT_ODD (SCREEN_CHARACTER_COLUMN_COUNT & 1)

static uint8_t armedBitmapRLE [] = { 128, 56,
    '\x00','\x00','\x0f','\x80','\xc0','\xe0','\xf0','\xf0', // 0x0008
    '\x03','\x78','\x30','\x00','\x00','\x6d','\x80','\xc0', // 0x0010
    '\xe0','\xe0','\x02','\xf0','\xe0','\xc0','\xc0','\x04', // 0x0018
    '\xe0','\xf1','\xf9','\xff','\xff','\x02','\xe7','\xe0', // 0x0020
    '\xe0','\x03','\xf0','\xf8','\xfc','\xfe','\xfe','\x02', // 0x0028
    '\xff','\xff','\x05','\x7e','\x3e','\x00','\x00','\x60', // 0x0030
    '\x07','\x07','\x03','\x03','\x83','\xc3','\xc3','\x03', // 0x0038
    '\xe1','\xf9','\xff','\x7f','\x1f','\x03','\x01','\x01', // 0x0040
    '\x03','\x81','\xe0','\xe0','\x02','\x70','\x31','\x31', // 0x0048
    '\x06','\x91','\xe0','\xf0','\x30','\x00','\x00','\x06', // 0x0050
    '\x80','\xe0','\xf0','\x30','\x30','\x07','\x90','\xf0', // 0x0058
    '\xe0','\x70','\x30','\x30','\x03','\xf0','\xf0','\x02', // 0x0060
    '\x70','\x80','\xe0','\xf0','\x30','\x30','\x04','\xf0', // 0x0068
    '\xf0','\x02','\x70','\x80','\xe0','\xf0','\x30','\x30', // 0x0070
    '\x07','\x90','\xf0','\xf0','\x02','\x30','\x00','\x00', // 0x0078
    '\x06','\x80','\xe0','\xf0','\x30','\x80','\xe0','\xe0', // 0x0080
    '\x02','\x70','\x30','\x30','\x06','\x90','\xe0','\xf0', // 0x0088
    '\x30','\x00','\x00','\x03','\xc0','\xf0','\x70','\x10', // 0x0090
    '\x20','\xb0','\xf0','\xf0','\x02','\x70','\x30','\x30', // 0x0098
    '\x03','\x10','\x10','\x02','\x00','\x00','\x07','\xf8', // 0x00a0
    '\xfc','\xff','\xff','\x05','\x7f','\x3f','\x1f','\x00', // 0x00a8
    '\x00','\x04','\x1c','\x1f','\x1f','\x02','\x19','\x18', // 0x00b0
    '\x18','\x04','\x08','\x10','\x1c','\x1e','\x1f','\x1b', // 0x00b8
    '\x18','\x18','\x04','\x08','\x10','\x1c','\x1e','\x1f', // 0x00c0
    '\x1b','\x19','\x19','\x03','\x18','\x18','\x03','\x1c', // 0x00c8
    '\x1e','\x07','\x07','\x02','\x06','\x06','\x02','\x1e', // 0x00d0
    '\x1e','\x02','\x0f','\x17','\x1d','\x1e','\x07','\x03', // 0x00d8
    '\x00','\x00','\x02','\x18','\x1e','\x0f','\x13','\x1d', // 0x00e0
    '\x1e','\x07','\x03','\x01','\x01','\x03','\x00','\x00', // 0x00e8
    '\x02','\x10','\x1c','\x1e','\x1f','\x1b','\x18','\x18', // 0x00f0
    '\x04','\x08','\x10','\x1c','\x1e','\x07','\x03','\x1c', // 0x00f8
    '\x1f','\x1f','\x02','\x19','\x18','\x19','\x19','\x02', // 0x0100
    '\x1f','\x0f','\x13','\x1c','\x1e','\x07','\x03','\x01', // 0x0108
    '\x01','\x02','\x19','\x1f','\x0f','\x03','\x01','\x00', // 0x0110
    '\x18','\x1e','\x0f','\x03','\x00','\x00','\x0f','\x01', // 0x0118
    '\x01','\x05','\xc0','\xe0','\xf0','\xf0','\x02','\xf8', // 0x0120
    '\xf8','\x02','\x7c','\x7c','\x07','\xfc','\xfc','\x04', // 0x0128
    '\xf8','\xf8','\x02','\x00','\x00','\x02','\xc0','\xf0', // 0x0130
    '\xfc','\xfc','\x03','\x7c','\x7c','\x07','\xfc','\xfc', // 0x0138
    '\x06','\x78','\x00','\x00','\x02','\xc0','\xf0','\xfc', // 0x0140
    '\xfc','\x03','\x7c','\x7c','\x07','\xfc','\xfc','\x06', // 0x0148
    '\x7c','\x7c','\x06','\xfc','\xfc','\x04','\xf8','\xf8', // 0x0150
    '\x02','\x30','\x00','\xc0','\xf0','\xfc','\xfc','\x03', // 0x0158
    '\x7c','\x7c','\x0c','\x3c','\x3c','\x02','\x1c','\x0c', // 0x0160
    '\xcc','\xf4','\xfc','\xfc','\x03','\x7c','\x7c','\x08', // 0x0168
    '\xfc','\xfc','\x05','\xf8','\x10','\x00','\x00','\x08', // 0x0170
    '\x80','\xe0','\xf8','\xfc','\xff','\xff','\x04','\xf3', // 0x0178
    '\xf1','\xf0','\xf0','\x06','\xfc','\xfe','\xff','\x7f', // 0x0180
    '\x1f','\x87','\xe1','\xf8','\xfe','\xff','\xff','\x04', // 0x0188
    '\xf3','\xf0','\xf0','\x06','\xf8','\xfc','\xff','\x3f', // 0x0190
    '\x1f','\x0f','\x87','\xe1','\xf8','\xfe','\xff','\x7f', // 0x0198
    '\x3f','\x0f','\x03','\x00','\x00','\x04','\xc0','\xf0', // 0x01a0
    '\xfc','\xfe','\xff','\x7f','\x1f','\x07','\x01','\x00', // 0x01a8
    '\x00','\x03','\x80','\xe0','\xf8','\xfe','\xff','\x7f', // 0x01b0
    '\x3f','\x8f','\xe3','\xf8','\xfe','\xff','\x7f','\x3f', // 0x01b8
    '\x3f','\x03','\x3c','\x1c','\x1c','\x02','\x0c','\x0c', // 0x01c0
    '\x02','\x04','\x00','\x00','\x06','\x80','\xe0','\xf8', // 0x01c8
    '\xfc','\xff','\x7f','\x3f','\x0f','\x03','\x01','\x00', // 0x01d0
    '\x00','\x03','\x80','\xc0','\xf0','\xfc','\xff','\xff', // 0x01d8
    '\x02','\x7f','\x1f','\x07','\x01','\x00','\x00','\x07', // 0x01e0
    '\x10','\x1c','\x1e','\x1f','\x1f','\x03','\x07','\x01', // 0x01e8
    '\x00','\x00','\x06','\x18','\x1e','\x1f','\x1f','\x03', // 0x01f0
    '\x0f','\x03','\x10','\x1c','\x1f','\x1f','\x04','\x07', // 0x01f8
    '\x01','\x00','\x00','\x06','\x18','\x1e','\x1f','\x1f', // 0x0200
    '\x03','\x0f','\x03','\x10','\x1c','\x1f','\x1f','\x04', // 0x0208
    '\x07','\x01','\x00','\x00','\x05','\x18','\x1e','\x1f', // 0x0210
    '\x1f','\x03','\x0f','\x03','\x00','\x00','\x05','\x10', // 0x0218
    '\x1c','\x1e','\x1f','\x1f','\x03','\x07','\x11','\x1c', // 0x0220
    '\x1e','\x1f','\x1f','\x22','\x0f','\x0f','\x03','\x07', // 0x0228
    '\x03','\x00','\x00','\x0a',
};

static const char* const pageTitles[] = {
    "CLEANFLIGHT",
    "ARMED",
    "BATTERY",
    "SENSORS",
    "RX",
    "PROFILE",
#ifndef SKIP_TASK_STATISTICS
    "TASKS",
#endif
#ifdef GPS
    "GPS",
#endif
#ifdef ENABLE_DEBUG_OLED_PAGE
    ,"DEBUG"
#endif
};


static const pageId_e cyclePageIds[] = {
    PAGE_PROFILE,
#ifdef GPS
    PAGE_GPS,
#endif
    PAGE_RX,
    PAGE_BATTERY,
    PAGE_SENSORS,
#ifndef SKIP_TASK_STATISTICS
    PAGE_TASKS,
#endif
#ifdef ENABLE_DEBUG_OLED_PAGE
    PAGE_DEBUG,
#endif
};

#define CYCLE_PAGE_ID_COUNT (sizeof(cyclePageIds) / sizeof(cyclePageIds[0]))

static const char* tickerCharacters = "|/-\\"; // use 2/4/8 characters so that the divide is optimal.
#define TICKER_CHARACTER_COUNT (sizeof(tickerCharacters) / sizeof(char))

typedef enum {
    PAGE_STATE_FLAG_NONE = 0,
    PAGE_STATE_FLAG_CYCLE_ENABLED = (1 << 0),
    PAGE_STATE_FLAG_FORCE_PAGE_CHANGE = (1 << 1)
} pageFlags_e;

typedef struct pageState_s {
    bool pageChanging;
    pageId_e pageId;
    pageId_e pageIdBeforeArming;
    uint8_t pageFlags;
    uint8_t cycleIndex;
    uint32_t nextPageAt;
    uint32_t nextToggleAt;
    uint8_t toggleCounter;
} pageState_t;

static pageState_t pageState;

static bool resetDisplay(void)
{
    displayPresent = ug2864hsweg01InitI2C();
    return displayPresent;
}

static void LCDprint(uint8_t i)
{
   i2c_OLED_send_char(i);
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
void fillScreenWithCharacters()
{
    for (uint8_t row = 0; row < SCREEN_CHARACTER_ROW_COUNT; row++) {
        for (uint8_t column = 0; column < SCREEN_CHARACTER_COLUMN_COUNT; column++) {
            i2c_OLED_set_xy(column, row);
            i2c_OLED_send_char('A' + column);
        }
    }
}
#endif


static void updateTicker(void)
{
    static uint8_t tickerIndex = 0;
    i2c_OLED_set_xy(SCREEN_CHARACTER_COLUMN_COUNT - 1, 0);
    i2c_OLED_send_char(tickerCharacters[tickerIndex]);
    tickerIndex++;
    tickerIndex = tickerIndex % TICKER_CHARACTER_COUNT;
}

static void updateRxStatus(void)
{
    i2c_OLED_set_xy(SCREEN_CHARACTER_COLUMN_COUNT - 2, 0);
    char rxStatus = '!';
    if (rxIsReceivingSignal()) {
        rxStatus = 'r';
    } if (rxAreFlightChannelsValid()) {
        rxStatus = 'R';
    }
    i2c_OLED_send_char(rxStatus);
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
    i2c_OLED_set_xy(SCREEN_CHARACTER_COLUMN_COUNT - 3, 0);
    i2c_OLED_send_char(failsafeIndicator);
}

static void showTitle()
{
    if (pageState.pageId != PAGE_ARMED){
        i2c_OLED_set_line(0);
        i2c_OLED_send_string(pageTitles[pageState.pageId]);
    }
}

static void handlePageChange(void)
{
    i2c_OLED_clear_display_quick();
    showTitle();
}

static void drawRxChannel(uint8_t channelIndex, uint8_t width)
{
    uint32_t percentage;

    LCDprint(rcChannelLetters[channelIndex]);

    percentage = (constrain(rcData[channelIndex], PWM_RANGE_MIN, PWM_RANGE_MAX) - PWM_RANGE_MIN) * 100 / (PWM_RANGE_MAX - PWM_RANGE_MIN);
    drawHorizonalPercentageBar(width - 1, percentage);
}

#define RX_CHANNELS_PER_PAGE_COUNT 14
static void showRxPage(void)
{

    for (uint8_t channelIndex = 0; channelIndex < rxRuntimeConfig.channelCount && channelIndex < RX_CHANNELS_PER_PAGE_COUNT; channelIndex += 2) {
        i2c_OLED_set_line((channelIndex / 2) + PAGE_TITLE_LINE_COUNT);

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

void showWelcomePage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    tfp_sprintf(lineBuffer, "v%s (%s)", FC_VERSION_STRING, shortGitRevision);
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(targetName);
}

// RLE compressed bitmaps must be 128 width with vertical data orientation, and size included in file.
void bitmapDecompress(uint8_t *bitmap)
{
    uint8_t data = 0, count = 0;
    uint16_t i;
    uint8_t width = *bitmap;
    bitmap++;
    uint8_t height = *bitmap;
    bitmap++;
    uint16_t bitmapSize = (width * height) / 8;
    for (i = 0; i < bitmapSize; i++) {
        if(count == 0) {
            data = *bitmap;
            bitmap++;
            if(data == *bitmap) {
                bitmap++;
                count = *bitmap;
                bitmap++;
            }
            else {
                count = 1;
            }
        }
        count--;
        i2c_OLED_send_byte(data);
    }
}

void showArmedPage(void)
{
    i2c_OLED_set_line(0);
    bitmapDecompress(armedBitmapRLE);
}

void showProfilePage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    tfp_sprintf(lineBuffer, "Profile: %d", getCurrentProfile());
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    static const char* const axisTitles[3] = {"ROL", "PIT", "YAW"};
    for (int axis = 0; axis < 3; ++axis) {
        tfp_sprintf(lineBuffer, "%s P:%3d I:%3d D:%3d",
            axisTitles[axis],
            pidProfile()->P8[axis],
            pidProfile()->I8[axis],
            pidProfile()->D8[axis]
        );
        padLineBuffer();
        i2c_OLED_set_line(rowIndex++);
        i2c_OLED_send_string(lineBuffer);
    }

    const uint8_t currentRateProfileIndex = getCurrentControlRateProfile();
    tfp_sprintf(lineBuffer, "Rate profile: %d", currentRateProfileIndex);
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    const controlRateConfig_t *controlRateConfig = getControlRateConfig(currentRateProfileIndex);
    tfp_sprintf(lineBuffer, "RCE: %d, RCR: %d",
        controlRateConfig->rcExpo8,
        controlRateConfig->rcRate8
    );
    padLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    tfp_sprintf(lineBuffer, "RR:%d PR:%d YR:%d",
        controlRateConfig->rates[ROLL],
        controlRateConfig->rates[PITCH],
        controlRateConfig->rates[YAW]
    );
    padLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);
}
#define SATELLITE_COUNT (sizeof(GPS_svinfo_cno) / sizeof(GPS_svinfo_cno[0]))
#define SATELLITE_GRAPH_LEFT_OFFSET ((SCREEN_CHARACTER_COLUMN_COUNT - SATELLITE_COUNT) / 2)

#ifdef GPS
static void showGpsPage(uint32_t now)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    static uint8_t gpsTicker = 0;
    static uint32_t lastGPSSvInfoReceivedCount = 0;
    static uint32_t lastGPSPacketCount = 0;
    static uint32_t gpsPageForceUpdateAt = 0;

    bool forceUpdateNow = (int32_t)(now - gpsPageForceUpdateAt) >= 0L;


    if (GPS_packetCount == lastGPSPacketCount && !forceUpdateNow) {
        return;
    }
    lastGPSPacketCount = GPS_packetCount;
    gpsPageForceUpdateAt = now + GPS_DISPLAY_FORCE_UPDATE_FREQUENCY;

    if (GPS_svInfoReceivedCount != lastGPSSvInfoReceivedCount) {
        lastGPSSvInfoReceivedCount = GPS_svInfoReceivedCount;
        gpsTicker++;
        gpsTicker = gpsTicker % TICKER_CHARACTER_COUNT;
    }


    i2c_OLED_set_xy(0, rowIndex);
    i2c_OLED_send_char(tickerCharacters[gpsTicker]);

    i2c_OLED_set_xy(MAX(0, SATELLITE_GRAPH_LEFT_OFFSET), rowIndex++);

    uint32_t index;
    for (index = 0; index < SATELLITE_COUNT && index < SCREEN_CHARACTER_COLUMN_COUNT; index++) {
        uint8_t bargraphOffset = ((uint16_t) GPS_svinfo_cno[index] * VERTICAL_BARGRAPH_CHARACTER_COUNT) / (GPS_DBHZ_MAX - 1);
        bargraphOffset = MIN(bargraphOffset, VERTICAL_BARGRAPH_CHARACTER_COUNT - 1);
        i2c_OLED_send_char(VERTICAL_BARGRAPH_ZERO_CHARACTER + bargraphOffset);
    }


    char fixChar = STATE(GPS_FIX) ? 'Y' : 'N';
    tfp_sprintf(lineBuffer, "Sats: %d Fix: %c", GPS_numSat, fixChar);
    padLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    tfp_sprintf(lineBuffer, "La/Lo: %d/%d", GPS_coord[LAT] / GPS_DEGREES_DIVIDER, GPS_coord[LON] / GPS_DEGREES_DIVIDER);
    padLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    tfp_sprintf(lineBuffer, "Spd: %d", GPS_speed);
    padHalfLineBuffer();
    i2c_OLED_set_line(rowIndex);
    i2c_OLED_send_string(lineBuffer);

    tfp_sprintf(lineBuffer, "GC: %d", GPS_ground_course);
    padHalfLineBuffer();
    i2c_OLED_set_xy(HALF_SCREEN_CHARACTER_COLUMN_COUNT, rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    tfp_sprintf(lineBuffer, "RX: %d", GPS_packetCount);
    padHalfLineBuffer();
    i2c_OLED_set_line(rowIndex);
    i2c_OLED_send_string(lineBuffer);

    tfp_sprintf(lineBuffer, "ERRs: %d", gpsData.errors);
    padHalfLineBuffer();
    i2c_OLED_set_xy(HALF_SCREEN_CHARACTER_COLUMN_COUNT, rowIndex++);
    i2c_OLED_send_string(lineBuffer);

    tfp_sprintf(lineBuffer, "Dt: %d", gpsData.lastMessage - gpsData.lastLastMessage);
    padHalfLineBuffer();
    i2c_OLED_set_line(rowIndex);
    i2c_OLED_send_string(lineBuffer);

    if (pageState.toggleCounter & 1) {
        tfp_sprintf(lineBuffer, "TOs: %d", gpsData.timeouts);
    } else {
        tfp_sprintf(lineBuffer, "GBC: %d", GPS_garbageByteCount);
    }

    padHalfLineBuffer();
    i2c_OLED_set_xy(HALF_SCREEN_CHARACTER_COLUMN_COUNT, rowIndex++);
    i2c_OLED_send_string(lineBuffer);


    strncpy(lineBuffer, gpsPacketLog, GPS_PACKET_LOG_ENTRY_COUNT);
    padHalfLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

#ifdef GPS_PH_DEBUG
    tfp_sprintf(lineBuffer, "Angles: P:%d R:%d", GPS_angle[PITCH], GPS_angle[ROLL]);
    padLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);
#endif

#if 0
    tfp_sprintf(lineBuffer, "%d %d %d %d", debug[0], debug[1], debug[2], debug[3]);
    padLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);
#endif
}
#endif

static void showBatteryPage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;

    if (feature(FEATURE_VBAT)) {
        tfp_sprintf(lineBuffer, "Volts: %d.%1d Cells: %d", vbat / 10, vbat % 10, batteryCellCount);
        padLineBuffer();
        i2c_OLED_set_line(rowIndex++);
        i2c_OLED_send_string(lineBuffer);

        uint8_t voltagePercentage = batteryVoltagePercentage();
        i2c_OLED_set_line(rowIndex++);
        drawHorizonalPercentageBar(SCREEN_CHARACTER_COLUMN_COUNT, voltagePercentage);
    }

    if (feature(FEATURE_AMPERAGE_METER)) {
        amperageMeter_t *state = getAmperageMeter(batteryConfig()->amperageMeterSource);

        tfp_sprintf(lineBuffer, "Amps: %d.%2d mAh: %d", state->amperage / 100, state->amperage % 100, state->mAhDrawn);
        padLineBuffer();
        i2c_OLED_set_line(rowIndex++);
        i2c_OLED_send_string(lineBuffer);

        uint8_t capacityPercentage = batteryCapacityRemainingPercentage();
        i2c_OLED_set_line(rowIndex++);
        drawHorizonalPercentageBar(SCREEN_CHARACTER_COLUMN_COUNT, capacityPercentage);
    }
}

static void showSensorsPage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;
    static const char *format = "%s %5d %5d %5d";

    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string("        X     Y     Z");

    if (sensors(SENSOR_ACC)) {
        tfp_sprintf(lineBuffer, format, "ACC", accSmooth[X], accSmooth[Y], accSmooth[Z]);
        padLineBuffer();
        i2c_OLED_set_line(rowIndex++);
        i2c_OLED_send_string(lineBuffer);
    }

    if (sensors(SENSOR_GYRO)) {
        tfp_sprintf(lineBuffer, format, "GYR", gyroADC[X], gyroADC[Y], gyroADC[Z]);
        padLineBuffer();
        i2c_OLED_set_line(rowIndex++);
        i2c_OLED_send_string(lineBuffer);
    }

#ifdef MAG
    if (sensors(SENSOR_MAG)) {
        tfp_sprintf(lineBuffer, format, "MAG", magADC[X], magADC[Y], magADC[Z]);
        padLineBuffer();
        i2c_OLED_set_line(rowIndex++);
        i2c_OLED_send_string(lineBuffer);
    }
#endif

    tfp_sprintf(lineBuffer, format, "I&H", attitude.values.roll, attitude.values.pitch, DECIDEGREES_TO_DEGREES(attitude.values.yaw));
    padLineBuffer();
    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string(lineBuffer);

#ifdef SONAR
    if (sensors(SENSOR_SONAR)) {
        static const char *sonarFormat = "%s             %5d";
        tfp_sprintf(lineBuffer, sonarFormat, "SNR", sonarGetLatestAltitude());
        padLineBuffer();
        i2c_OLED_set_line(rowIndex++);
        i2c_OLED_send_string(lineBuffer);
    }
#endif
}

#ifndef SKIP_TASK_STATISTICS
static void showTasksPage(void)
{
    uint8_t rowIndex = PAGE_TITLE_LINE_COUNT;
    static const char *format = "%2d%6d%5d%4d%4d";

    i2c_OLED_set_line(rowIndex++);
    i2c_OLED_send_string("Task max  avg mx% av%");
    cfTaskInfo_t taskInfo;
    for (cfTaskId_e taskId = 0; taskId < TASK_COUNT; ++taskId) {
        getTaskInfo(taskId, &taskInfo);
        if (taskInfo.isEnabled && taskId != TASK_SERIAL) {// don't waste a line of the display showing serial taskInfo
            const int taskFrequency = (int)(1000000.0f / ((float)taskInfo.latestDeltaTime));
            const int maxLoad = (taskInfo.maxExecutionTime * taskFrequency + 5000) / 10000;
            const int averageLoad = (taskInfo.averageExecutionTime * taskFrequency + 5000) / 10000;
            tfp_sprintf(lineBuffer, format, taskId, taskInfo.maxExecutionTime, taskInfo.averageExecutionTime, maxLoad, averageLoad);
            padLineBuffer();
            i2c_OLED_set_line(rowIndex++);
            i2c_OLED_send_string(lineBuffer);
            if (rowIndex > SCREEN_CHARACTER_ROW_COUNT) {
                break;
            }
        }
    }
}
#endif

#ifdef ENABLE_DEBUG_OLED_PAGE

static void showDebugPage(void)
{
    uint8_t rowIndex;

    for (rowIndex = 0; rowIndex < 4; rowIndex++) {
        tfp_sprintf(lineBuffer, "%d = %5d", rowIndex, debug[rowIndex]);
        padLineBuffer();
        i2c_OLED_set_line(rowIndex + PAGE_TITLE_LINE_COUNT);
        i2c_OLED_send_string(lineBuffer);
    }
}
#endif

void updateDisplay(void)
{
    uint32_t now = micros();
    static uint8_t previousArmedState = 0;

    bool updateNow = (int32_t)(now - nextDisplayUpdateAt) >= 0L;
    if (!updateNow) {
        return;
    }

    nextDisplayUpdateAt = now + DISPLAY_UPDATE_FREQUENCY;

    bool armedState = ARMING_FLAG(ARMED) ? true : false;
    bool armedStateChanged = armedState != previousArmedState;
    previousArmedState = armedState;

    if (armedState) {
        if (!armedStateChanged) {
            return;
        }
        pageState.pageIdBeforeArming = pageState.pageId;
        pageState.pageId = PAGE_ARMED;
        pageState.pageChanging = true;
    } else {
        if (armedStateChanged) {
            pageState.pageFlags |= PAGE_STATE_FLAG_FORCE_PAGE_CHANGE;
            pageState.pageId = pageState.pageIdBeforeArming;
        }

        pageState.pageChanging = (pageState.pageFlags & PAGE_STATE_FLAG_FORCE_PAGE_CHANGE) ||
                (((int32_t)(now - pageState.nextPageAt) >= 0L && (pageState.pageFlags & PAGE_STATE_FLAG_CYCLE_ENABLED)));
        if (pageState.pageChanging && (pageState.pageFlags & PAGE_STATE_FLAG_CYCLE_ENABLED)) {
            pageState.cycleIndex++;
            if (cyclePageIds[pageState.cycleIndex] == PAGE_BATTERY && !(feature(FEATURE_VBAT) || feature(FEATURE_AMPERAGE_METER))) {
                pageState.cycleIndex++;
            }
#ifdef GPS
            if (cyclePageIds[pageState.cycleIndex] == PAGE_GPS && !feature(FEATURE_GPS)) {
                pageState.cycleIndex++;
            }
#endif
            pageState.cycleIndex = pageState.cycleIndex % CYCLE_PAGE_ID_COUNT;
            pageState.pageId = cyclePageIds[pageState.cycleIndex];
        }
    }

    if (pageState.pageChanging) {
        pageState.pageFlags &= ~PAGE_STATE_FLAG_FORCE_PAGE_CHANGE;
        pageState.nextPageAt = now + PAGE_CYCLE_FREQUENCY;
        pageState.nextToggleAt = now + PAGE_TOGGLE_FREQUENCY;
        pageState.toggleCounter = 0;

        // Some OLED displays do not respond on the first initialisation so refresh the display
        // when the page changes in the hopes the hardware responds.  This also allows the
        // user to power off/on the display or connect it while powered.
        resetDisplay();

        if (!displayPresent) {
            return;
        }
        handlePageChange();
    }

    if (!displayPresent) {
        return;
    }

    if ((int32_t)(now - pageState.nextToggleAt) >= 0L) {
        pageState.toggleCounter++;
        pageState.nextToggleAt += PAGE_TOGGLE_FREQUENCY;
    }

    switch(pageState.pageId) {
        case PAGE_WELCOME:
            showWelcomePage();
            break;
        case PAGE_ARMED:
            showArmedPage();
            break;
        case PAGE_BATTERY:
            showBatteryPage();
            break;
        case PAGE_SENSORS:
            showSensorsPage();
            break;
        case PAGE_RX:
            showRxPage();
            break;
        case PAGE_PROFILE:
            showProfilePage();
            break;
#ifndef SKIP_TASK_STATISTICS
        case PAGE_TASKS:
            showTasksPage();
            break;
#endif
#ifdef GPS
        case PAGE_GPS:
            showGpsPage(now);
            break;
#endif
#ifdef ENABLE_DEBUG_OLED_PAGE
        case PAGE_DEBUG:
            showDebugPage();
            break;
#endif
    }
    if (!armedState) {
        updateFailsafeStatus();
        updateRxStatus();
        updateTicker();
    }

}

void displaySetPage(pageId_e pageId)
{
    pageState.pageId = pageId;
    pageState.pageFlags |= PAGE_STATE_FLAG_FORCE_PAGE_CHANGE;
}

void displayInit(void)
{
    delay(200);
    resetDisplay();
    delay(200);

    memset(&pageState, 0, sizeof(pageState));
    displaySetPage(PAGE_WELCOME);

    updateDisplay();

    displaySetNextPageChangeAt(micros() + (1000 * 1000 * 5));
}

void displayShowFixedPage(pageId_e pageId)
{
    displaySetPage(pageId);
    displayDisablePageCycling();
}

void displaySetNextPageChangeAt(uint32_t futureMicros)
{
    pageState.nextPageAt = futureMicros;
}

void displayEnablePageCycling(void)
{
    pageState.pageFlags |= PAGE_STATE_FLAG_CYCLE_ENABLED;
}

void displayResetPageCycling(void)
{
    pageState.cycleIndex = CYCLE_PAGE_ID_COUNT - 1; // start at first page

}

void displayDisablePageCycling(void)
{
    pageState.pageFlags &= ~PAGE_STATE_FLAG_CYCLE_ENABLED;
}

#endif
