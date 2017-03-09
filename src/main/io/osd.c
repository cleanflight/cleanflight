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

/*
 Created by Marcin Baliniak
 some functions based on MinimOSD

 OSD-CMS separation by jflyper
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "platform.h"

#ifdef OSD

#include "blackbox/blackbox.h"
#include "blackbox/blackbox_io.h"

#include "build/debug.h"
#include "build/version.h"

#include "common/printf.h"
#include "common/maths.h"
#include "common/typeconversion.h"
#include "common/utils.h"

#include "config/config_profile.h"
#include "config/feature.h"
#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/max7456_symbols.h"
#include "drivers/display.h"
#include "drivers/system.h"
#ifdef USE_RTC6705
#include "drivers/vtx_soft_spi_rtc6705.h"
#endif

#include "cms/cms.h"
#include "cms/cms_types.h"
#include "cms/cms_menu_osd.h"

#include "io/asyncfatfs/asyncfatfs.h"
#include "io/flashfs.h"
#include "io/gps.h"
#include "io/osd.h"
#include "io/vtx.h"

#include "fc/config.h"
#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

#include "flight/imu.h"

#include "rx/rx.h"

#include "sensors/barometer.h"
#include "sensors/battery.h"
#include "sensors/sensors.h"

#ifdef USE_HARDWARE_REVISION_DETECTION
#include "hardware_revision.h"
#endif

#define VIDEO_BUFFER_CHARS_PAL    480

// Character coordinate

#define OSD_POS(x,y)  (x | (y << 5))
#define OSD_X(x)      (x & 0x001F)
#define OSD_Y(x)      ((x >> 5) & 0x001F)

// Blink control

bool blinkState = true;

static uint32_t blinkBits[(OSD_ITEM_COUNT + 31)/32];
#define SET_BLINK(item) (blinkBits[(item) / 32] |= (1 << ((item) % 32)))
#define CLR_BLINK(item) (blinkBits[(item) / 32] &= ~(1 << ((item) % 32)))
#define IS_BLINK(item) (blinkBits[(item) / 32] & (1 << ((item) % 32)))
#define BLINK(item) (IS_BLINK(item) && blinkState)

// Things in both OSD and CMS

#define IS_HI(X)  (rcData[X] > 1750)
#define IS_LO(X)  (rcData[X] < 1250)
#define IS_MID(X) (rcData[X] > 1250 && rcData[X] < 1750)

//extern uint8_t RSSI; // TODO: not used?

static uint16_t flyTime = 0;
static uint8_t statRssi;

typedef struct statistic_s {
    int16_t max_speed;
    int16_t min_voltage; // /10
    int16_t max_current; // /10
    int16_t min_rssi;
    int16_t max_altitude;
} statistic_t;

static statistic_t stats;

uint16_t refreshTimeout = 0;
#define REFRESH_1S    12

static uint8_t armState;

static displayPort_t *osdDisplayPort;


#define AH_MAX_PITCH 200 // Specify maximum AHI pitch value displayed. Default 200 = 20.0 degrees
#define AH_MAX_ROLL 400  // Specify maximum AHI roll value displayed. Default 400 = 40.0 degrees
#define AH_SIDEBAR_WIDTH_POS 7
#define AH_SIDEBAR_HEIGHT_POS 3

PG_REGISTER_WITH_RESET_FN(osdConfig_t, osdConfig, PG_OSD_CONFIG, 0);

/**
 * Gets the correct altitude symbol for the current unit system
 */
static char osdGetAltitudeSymbol()
{
    switch (osdConfig()->units) {
        case OSD_UNIT_IMPERIAL:
            return 0xF;
        default:
            return 0xC;
    }
}

/**
 * Converts altitude based on the current unit system.
 * @param alt Raw altitude (i.e. as taken from BaroAlt)
 */
static int32_t osdGetAltitude(int32_t alt)
{
    switch (osdConfig()->units) {
        case OSD_UNIT_IMPERIAL:
            return (alt * 328) / 100; // Convert to feet / 100
        default:
            return alt;               // Already in metre / 100
    }
}

static void osdDrawSingleElement(uint8_t item)
{
    if (!VISIBLE(osdConfig()->item_pos[item]) || BLINK(item))
        return;

    uint8_t elemPosX = OSD_X(osdConfig()->item_pos[item]);
    uint8_t elemPosY = OSD_Y(osdConfig()->item_pos[item]);
    char buff[32];

    switch(item) {
        case OSD_RSSI_VALUE:
        {
            uint16_t osdRssi = rssi * 100 / 1024; // change range
            if (osdRssi >= 100)
                osdRssi = 99;

            buff[0] = SYM_RSSI;
            sprintf(buff + 1, "%d", osdRssi);
            break;
        }

        case OSD_MAIN_BATT_VOLTAGE:
        {
            buff[0] = SYM_BATT_5;
            sprintf(buff + 1, "%d.%1dV", getVbat() / 10, getVbat() % 10);
            break;
        }

        case OSD_CURRENT_DRAW:
        {
            buff[0] = SYM_AMP;
            sprintf(buff + 1, "%d.%02d", abs(amperage) / 100, abs(amperage) % 100);
            break;
        }

        case OSD_MAH_DRAWN:
        {
            buff[0] = SYM_MAH;
            sprintf(buff + 1, "%d", mAhDrawn);
            break;
        }

#ifdef GPS
        case OSD_GPS_SATS:
        {
            buff[0] = 0x1f;
            sprintf(buff + 1, "%d", GPS_numSat);
            break;
        }

        case OSD_GPS_SPEED:
        {
            sprintf(buff, "%d", GPS_speed * 36 / 1000);
            break;
        }
#endif // GPS

        case OSD_ALTITUDE:
        {
            int32_t alt = osdGetAltitude(baro.BaroAlt);
            sprintf(buff, "%c%d.%01d%c", alt < 0 ? '-' : ' ', abs(alt / 100), abs((alt % 100) / 10), osdGetAltitudeSymbol());
            break;
        }

        case OSD_ONTIME:
        {
            uint32_t seconds = micros() / 1000000;
            buff[0] = SYM_ON_M;
            sprintf(buff + 1, "%02d:%02d", seconds / 60, seconds % 60);
            break;
        }

        case OSD_FLYTIME:
        {
            buff[0] = SYM_FLY_M;
            sprintf(buff + 1, "%02d:%02d", flyTime / 60, flyTime % 60);
            break;
        }

        case OSD_FLYMODE:
        {
            char *p = "ACRO";

            if (isAirmodeActive())
                p = "AIR";

            if (FLIGHT_MODE(FAILSAFE_MODE))
                p = "!FS";
            else if (FLIGHT_MODE(ANGLE_MODE))
                p = "STAB";
            else if (FLIGHT_MODE(HORIZON_MODE))
                p = "HOR";

            displayWrite(osdDisplayPort, elemPosX, elemPosY, p);
            return;
        }

        case OSD_CRAFT_NAME:
        {
            if (strlen(systemConfig()->name) == 0)
                strcpy(buff, "CRAFT_NAME");
            else {
                for (uint8_t i = 0; i < MAX_NAME_LENGTH; i++) {
                    buff[i] = toupper((unsigned char)systemConfig()->name[i]);
                    if (systemConfig()->name[i] == 0)
                        break;
                }
            }

            break;
        }

        case OSD_THROTTLE_POS:
        {
            buff[0] = SYM_THR;
            buff[1] = SYM_THR1;
            sprintf(buff + 2, "%d", (constrain(rcData[THROTTLE], PWM_RANGE_MIN, PWM_RANGE_MAX) - PWM_RANGE_MIN) * 100 / (PWM_RANGE_MAX - PWM_RANGE_MIN));
            break;
        }

#ifdef USE_RTC6705
        case OSD_VTX_CHANNEL:
        {
            sprintf(buff, "CH:%d", current_vtx_channel % CHANNELS_PER_BAND + 1);
            break;
        }
#endif // VTX

        case OSD_CROSSHAIRS:
            elemPosX = 14 - 1; // Offset for 1 char to the left
            elemPosY = 6;
            if (displayScreenSize(osdDisplayPort) == VIDEO_BUFFER_CHARS_PAL) {
                ++elemPosY;
            }
            buff[0] = SYM_AH_CENTER_LINE;
            buff[1] = SYM_AH_CENTER;
            buff[2] = SYM_AH_CENTER_LINE_RIGHT;
            buff[3] = 0;
            break;

        case OSD_ARTIFICIAL_HORIZON:
        {
            elemPosX = 14;
            elemPosY = 6 - 4; // Top center of the AH area

            int rollAngle = attitude.values.roll;
            int pitchAngle = attitude.values.pitch;

            if (displayScreenSize(osdDisplayPort) == VIDEO_BUFFER_CHARS_PAL) {
                ++elemPosY;
            }

            if (pitchAngle > AH_MAX_PITCH)
                pitchAngle = AH_MAX_PITCH;
            if (pitchAngle < -AH_MAX_PITCH)
                pitchAngle = -AH_MAX_PITCH;
            if (rollAngle > AH_MAX_ROLL)
                rollAngle = AH_MAX_ROLL;
            if (rollAngle < -AH_MAX_ROLL)
                rollAngle = -AH_MAX_ROLL;

            // Convert pitchAngle to y compensation value
            pitchAngle = (pitchAngle / 8) - 41; // 41 = 4 * 9 + 5

            for (int8_t x = -4; x <= 4; x++) {
                int y = (-rollAngle * x) / 64;
                y -= pitchAngle;
                // y += 41; // == 4 * 9 + 5
                if (y >= 0 && y <= 81) {
                    displayWriteChar(osdDisplayPort, elemPosX + x, elemPosY + (y / 9), (SYM_AH_BAR9_0 + (y % 9)));
                }
            }

            osdDrawSingleElement(OSD_HORIZON_SIDEBARS);

            return;
        }

        case OSD_HORIZON_SIDEBARS:
        {
            elemPosX = 14;
            elemPosY = 6;

            if (displayScreenSize(osdDisplayPort) == VIDEO_BUFFER_CHARS_PAL) {
                ++elemPosY;
            }

            // Draw AH sides
            int8_t hudwidth = AH_SIDEBAR_WIDTH_POS;
            int8_t hudheight = AH_SIDEBAR_HEIGHT_POS;
            for (int8_t y = -hudheight; y <= hudheight; y++) {
                displayWriteChar(osdDisplayPort, elemPosX - hudwidth, elemPosY + y, SYM_AH_DECORATION);
                displayWriteChar(osdDisplayPort, elemPosX + hudwidth, elemPosY + y, SYM_AH_DECORATION);
            }

            // AH level indicators
            displayWriteChar(osdDisplayPort, elemPosX - hudwidth + 1, elemPosY, SYM_AH_LEFT);
            displayWriteChar(osdDisplayPort, elemPosX + hudwidth - 1, elemPosY, SYM_AH_RIGHT);

            return;
        }

        case OSD_ROLL_PIDS:
        {
            const pidProfile_t *pidProfile = currentPidProfile;
            sprintf(buff, "ROL %3d %3d %3d", pidProfile->P8[PIDROLL], pidProfile->I8[PIDROLL], pidProfile->D8[PIDROLL]);
            break;
        }

        case OSD_PITCH_PIDS:
        {
            const pidProfile_t *pidProfile = currentPidProfile;
            sprintf(buff, "PIT %3d %3d %3d", pidProfile->P8[PIDPITCH], pidProfile->I8[PIDPITCH], pidProfile->D8[PIDPITCH]);
            break;
        }

        case OSD_YAW_PIDS:
        {
            const pidProfile_t *pidProfile = currentPidProfile;
            sprintf(buff, "YAW %3d %3d %3d", pidProfile->P8[PIDYAW], pidProfile->I8[PIDYAW], pidProfile->D8[PIDYAW]);
            break;
        }

        case OSD_POWER:
        {
            sprintf(buff, "%dW", amperage * getVbat() / 1000);
            break;
        }

        case OSD_PIDRATE_PROFILE:
        {
            const uint8_t pidProfileIndex = getCurrentPidProfileIndex();
            const uint8_t rateProfileIndex = getCurrentControlRateProfileIndex();
            sprintf(buff, "%d-%d", pidProfileIndex + 1, rateProfileIndex + 1);
            break;
        }

        case OSD_MAIN_BATT_WARNING:
        {
            if (getVbat() > (batteryWarningVoltage - 1))
              return;

            sprintf(buff, "LOW VOLTAGE");
            break;
        }

        default:
            return;
    }

    displayWrite(osdDisplayPort, elemPosX, elemPosY, buff);
}

void osdDrawElements(void)
{
    displayClearScreen(osdDisplayPort);

    /* Hide OSD when OSDSW mode is active */
    if (IS_RC_MODE_ACTIVE(BOXOSD))
      return;

#if 0
    if (currentElement)
        osdDrawElementPositioningHelp();
#else
    if (false)
        ;
#endif
#ifdef CMS
    else if (sensors(SENSOR_ACC) || displayIsGrabbed(osdDisplayPort))
#else
    else if (sensors(SENSOR_ACC))
#endif
    {
        osdDrawSingleElement(OSD_ARTIFICIAL_HORIZON);
        osdDrawSingleElement(OSD_CROSSHAIRS);
    }

    osdDrawSingleElement(OSD_MAIN_BATT_VOLTAGE);
    osdDrawSingleElement(OSD_RSSI_VALUE);
    osdDrawSingleElement(OSD_FLYTIME);
    osdDrawSingleElement(OSD_ONTIME);
    osdDrawSingleElement(OSD_FLYMODE);
    osdDrawSingleElement(OSD_THROTTLE_POS);
    osdDrawSingleElement(OSD_VTX_CHANNEL);
    osdDrawSingleElement(OSD_CURRENT_DRAW);
    osdDrawSingleElement(OSD_MAH_DRAWN);
    osdDrawSingleElement(OSD_CRAFT_NAME);
    osdDrawSingleElement(OSD_ALTITUDE);
    osdDrawSingleElement(OSD_ROLL_PIDS);
    osdDrawSingleElement(OSD_PITCH_PIDS);
    osdDrawSingleElement(OSD_YAW_PIDS);
    osdDrawSingleElement(OSD_POWER);
    osdDrawSingleElement(OSD_PIDRATE_PROFILE);
    osdDrawSingleElement(OSD_MAIN_BATT_WARNING);

#ifdef GPS
#ifdef CMS
    if (sensors(SENSOR_GPS) || displayIsGrabbed(osdDisplayPort))
#else
    if (sensors(SENSOR_GPS))
#endif
    {
        osdDrawSingleElement(OSD_GPS_SATS);
        osdDrawSingleElement(OSD_GPS_SPEED);
    }
#endif // GPS
}

void pgResetFn_osdConfig(osdConfig_t *osdProfile)
{
    osdProfile->item_pos[OSD_RSSI_VALUE] = OSD_POS(22, 0);
    osdProfile->item_pos[OSD_MAIN_BATT_VOLTAGE] = OSD_POS(12, 0) | VISIBLE_FLAG;
    osdProfile->item_pos[OSD_ARTIFICIAL_HORIZON] = OSD_POS(8, 6) | VISIBLE_FLAG;
    osdProfile->item_pos[OSD_HORIZON_SIDEBARS] = OSD_POS(8, 6) | VISIBLE_FLAG;
    osdProfile->item_pos[OSD_ONTIME] = OSD_POS(22, 11) | VISIBLE_FLAG;
    osdProfile->item_pos[OSD_FLYTIME] = OSD_POS(22, 12) | VISIBLE_FLAG;
    osdProfile->item_pos[OSD_FLYMODE] = OSD_POS(12, 11) | VISIBLE_FLAG;
    osdProfile->item_pos[OSD_CRAFT_NAME] = OSD_POS(12, 12);
    osdProfile->item_pos[OSD_THROTTLE_POS] = OSD_POS(1, 4);
    osdProfile->item_pos[OSD_VTX_CHANNEL] = OSD_POS(8, 6);
    osdProfile->item_pos[OSD_CURRENT_DRAW] = OSD_POS(1, 3);
    osdProfile->item_pos[OSD_MAH_DRAWN] = OSD_POS(15, 3);
    osdProfile->item_pos[OSD_GPS_SPEED] = OSD_POS(2, 2);
    osdProfile->item_pos[OSD_GPS_SATS] = OSD_POS(2, 12);
    osdProfile->item_pos[OSD_ALTITUDE] = OSD_POS(1, 5);
    osdProfile->item_pos[OSD_ROLL_PIDS] = OSD_POS(2, 10);
    osdProfile->item_pos[OSD_PITCH_PIDS] = OSD_POS(2, 11);
    osdProfile->item_pos[OSD_YAW_PIDS] = OSD_POS(2, 12);
    osdProfile->item_pos[OSD_POWER] = OSD_POS(15, 1);
    osdProfile->item_pos[OSD_PIDRATE_PROFILE] = OSD_POS(2, 13);
    osdProfile->item_pos[OSD_MAIN_BATT_WARNING] = OSD_POS(8, 6);

    osdProfile->rssi_alarm = 20;
    osdProfile->cap_alarm = 2200;
    osdProfile->time_alarm = 10; // in minutes
    osdProfile->alt_alarm = 100; // meters or feet depend on configuration
}

void osdInit(displayPort_t *osdDisplayPortToUse)
{
    BUILD_BUG_ON(OSD_POS_MAX != OSD_POS(31,31));

    osdDisplayPort = osdDisplayPortToUse;
#ifdef CMS
    cmsDisplayPortRegister(osdDisplayPort);
#endif

    armState = ARMING_FLAG(ARMED);

    memset(blinkBits, 0, sizeof(blinkBits));

    displayClearScreen(osdDisplayPort);

    // display logo and help
    char x = 160;
    for (int i = 1; i < 5; i++) {
        for (int j = 3; j < 27; j++) {
            if (x != 255)
                displayWriteChar(osdDisplayPort, j, i, x++);
        }
    }

    char string_buffer[30];
    sprintf(string_buffer, "BF VERSION: %s", FC_VERSION_STRING);
    displayWrite(osdDisplayPort, 5, 6, string_buffer);
#ifdef CMS
    displayWrite(osdDisplayPort, 7, 7,  CMS_STARTUP_HELP_TEXT1);
    displayWrite(osdDisplayPort, 11, 8, CMS_STARTUP_HELP_TEXT2);
    displayWrite(osdDisplayPort, 11, 9, CMS_STARTUP_HELP_TEXT3);
#endif

    displayResync(osdDisplayPort);

    refreshTimeout = 4 * REFRESH_1S;
}

void osdUpdateAlarms(void)
{
    // This is overdone?
    // uint16_t *itemPos = osdConfig()->item_pos;

    int32_t alt = osdGetAltitude(baro.BaroAlt) / 100;
    statRssi = rssi * 100 / 1024;

    if (statRssi < osdConfig()->rssi_alarm)
        SET_BLINK(OSD_RSSI_VALUE);
    else
        CLR_BLINK(OSD_RSSI_VALUE);

    if (getVbat() <= (batteryWarningVoltage - 1)) {
        SET_BLINK(OSD_MAIN_BATT_VOLTAGE);
        SET_BLINK(OSD_MAIN_BATT_WARNING);
    } else {
        CLR_BLINK(OSD_MAIN_BATT_VOLTAGE);
        CLR_BLINK(OSD_MAIN_BATT_WARNING);
    }

    if (STATE(GPS_FIX) == 0)
        SET_BLINK(OSD_GPS_SATS);
    else
        CLR_BLINK(OSD_GPS_SATS);

    if (flyTime / 60 >= osdConfig()->time_alarm && ARMING_FLAG(ARMED))
        SET_BLINK(OSD_FLYTIME);
    else
        CLR_BLINK(OSD_FLYTIME);

    if (mAhDrawn >= osdConfig()->cap_alarm)
        SET_BLINK(OSD_MAH_DRAWN);
    else
        CLR_BLINK(OSD_MAH_DRAWN);

    if (alt >= osdConfig()->alt_alarm)
        SET_BLINK(OSD_ALTITUDE);
    else
        CLR_BLINK(OSD_ALTITUDE);
}

void osdResetAlarms(void)
{
    CLR_BLINK(OSD_RSSI_VALUE);
    CLR_BLINK(OSD_MAIN_BATT_VOLTAGE);
    CLR_BLINK(OSD_MAIN_BATT_WARNING);
    CLR_BLINK(OSD_GPS_SATS);
    CLR_BLINK(OSD_FLYTIME);
    CLR_BLINK(OSD_MAH_DRAWN);
    CLR_BLINK(OSD_ALTITUDE);
}

static void osdResetStats(void)
{
    stats.max_current = 0;
    stats.max_speed = 0;
    stats.min_voltage = 500;
    stats.max_current = 0;
    stats.min_rssi = 99;
    stats.max_altitude = 0;
}

static void osdUpdateStats(void)
{
    int16_t value = 0;
#ifdef GPS
    value = GPS_speed * 36 / 1000;
#endif
    if (stats.max_speed < value)
        stats.max_speed = value;

    if (stats.min_voltage > getVbat())
        stats.min_voltage = getVbat();

    value = amperage / 100;
    if (stats.max_current < value)
        stats.max_current = value;

    if (stats.min_rssi > statRssi)
        stats.min_rssi = statRssi;

    if (stats.max_altitude < baro.BaroAlt)
        stats.max_altitude = baro.BaroAlt;
}

static void osdGetBlackboxStatusString(char * buff, uint8_t len)
{
    bool storageDeviceIsWorking = false;
    uint32_t storageUsed = 0;
    uint32_t storageTotal = 0;

    switch (blackboxConfig()->device)
    {
#ifdef USE_SDCARD
    case BLACKBOX_DEVICE_SDCARD:
        storageDeviceIsWorking = sdcard_isInserted() && sdcard_isFunctional() && (afatfs_getFilesystemState() == AFATFS_FILESYSTEM_STATE_READY);
        if (storageDeviceIsWorking) {
            storageTotal = sdcard_getMetadata()->numBlocks / 2000;
            storageUsed = storageTotal - (afatfs_getContiguousFreeSpace() / 1024000);
        }
        break;
#endif

#ifdef USE_FLASHFS
    case BLACKBOX_DEVICE_FLASH:
        storageDeviceIsWorking = flashfsIsReady();
        if (storageDeviceIsWorking) {
            const flashGeometry_t *geometry = flashfsGetGeometry();
            storageTotal = geometry->totalSize / 1024;
            storageUsed = flashfsGetOffset() / 1024;
        }
        break;
#endif

    default:
        storageDeviceIsWorking = true;
    }

    if (storageDeviceIsWorking) {
        uint16_t storageUsedPercent = (storageUsed * 100) / storageTotal;
        snprintf(buff, len, "%d%%", storageUsedPercent);
    } else {
        snprintf(buff, len, "FAULT");
    }
}

static void osdShowStats(void)
{
    uint8_t top = 2;
    char buff[10];

    displayClearScreen(osdDisplayPort);
    displayWrite(osdDisplayPort, 2, top++, "  --- STATS ---");

    if (STATE(GPS_FIX)) {
        displayWrite(osdDisplayPort, 2, top, "MAX SPEED        :");
        itoa(stats.max_speed, buff, 10);
        displayWrite(osdDisplayPort, 22, top++, buff);
    }

    displayWrite(osdDisplayPort, 2, top, "MIN BATTERY      :");
    sprintf(buff, "%d.%1dV", stats.min_voltage / 10, stats.min_voltage % 10);
    displayWrite(osdDisplayPort, 22, top++, buff);

    displayWrite(osdDisplayPort, 2, top, "MIN RSSI         :");
    itoa(stats.min_rssi, buff, 10);
    strcat(buff, "%");
    displayWrite(osdDisplayPort, 22, top++, buff);

    if (feature(FEATURE_CURRENT_METER)) {
        displayWrite(osdDisplayPort, 2, top, "MAX CURRENT      :");
        itoa(stats.max_current, buff, 10);
        strcat(buff, "A");
        displayWrite(osdDisplayPort, 22, top++, buff);

        displayWrite(osdDisplayPort, 2, top, "USED MAH         :");
        itoa(mAhDrawn, buff, 10);
        strcat(buff, "\x07");
        displayWrite(osdDisplayPort, 22, top++, buff);
    }

    displayWrite(osdDisplayPort, 2, top, "MAX ALTITUDE     :");
    int32_t alt = osdGetAltitude(stats.max_altitude);
    sprintf(buff, "%c%d.%01d%c", alt < 0 ? '-' : ' ', abs(alt / 100), abs((alt % 100) / 10), osdGetAltitudeSymbol());
    displayWrite(osdDisplayPort, 22, top++, buff);

    if (feature(FEATURE_BLACKBOX) && blackboxConfig()->device != BLACKBOX_DEVICE_SERIAL) {
        displayWrite(osdDisplayPort, 2, top, "BLACKBOX         :");
        osdGetBlackboxStatusString(buff, 10);
        displayWrite(osdDisplayPort, 22, top++, buff);
    }

    refreshTimeout = 60 * REFRESH_1S;
}

// called when motors armed
static void osdArmMotors(void)
{
    displayClearScreen(osdDisplayPort);
    displayWrite(osdDisplayPort, 12, 7, "ARMED");
    refreshTimeout = REFRESH_1S / 2;
    osdResetStats();
}

static void osdRefresh(timeUs_t currentTimeUs)
{
    static uint8_t lastSec = 0;
    uint8_t sec;

    // detect arm/disarm
    if (armState != ARMING_FLAG(ARMED)) {
        if (ARMING_FLAG(ARMED))
            osdArmMotors(); // reset statistic etc
        else
            osdShowStats(); // show statistic

        armState = ARMING_FLAG(ARMED);
    }

    osdUpdateStats();

    sec = currentTimeUs / 1000000;

    if (ARMING_FLAG(ARMED) && sec != lastSec) {
        flyTime++;
        lastSec = sec;
    }

    if (refreshTimeout) {
        if (IS_HI(THROTTLE) || IS_HI(PITCH)) // hide statistics
            refreshTimeout = 1;
        refreshTimeout--;
        if (!refreshTimeout)
            displayClearScreen(osdDisplayPort);
        return;
    }

    blinkState = (currentTimeUs / 200000) % 2;

#ifdef CMS
    if (!displayIsGrabbed(osdDisplayPort)) {
        osdUpdateAlarms();
        osdDrawElements();
        displayHeartbeat(osdDisplayPort); // heartbeat to stop Minim OSD going back into native mode
#ifdef OSD_CALLS_CMS
    } else {
        cmsUpdate(currentTimeUs);
#endif
    }
#endif
}

/*
 * Called periodically by the scheduler
 */
void osdUpdate(timeUs_t currentTimeUs)
{
    static uint32_t counter = 0;
#ifdef MAX7456_DMA_CHANNEL_TX
    // don't touch buffers if DMA transaction is in progress
    if (displayIsTransferInProgress(osdDisplayPort)) {
        return;
    }
#endif // MAX7456_DMA_CHANNEL_TX

    // redraw values in buffer
#ifdef USE_MAX7456
#define DRAW_FREQ_DENOM 5
#else
#define DRAW_FREQ_DENOM 10 // MWOSD @ 115200 baud
#endif
    if (counter++ % DRAW_FREQ_DENOM == 0) {
        osdRefresh(currentTimeUs);
    } else { // rest of time redraw screen 10 chars per idle so it doesn't lock the main idle
        displayDrawScreen(osdDisplayPort);
    }

#ifdef CMS
    // do not allow ARM if we are in menu
    if (displayIsGrabbed(osdDisplayPort)) {
        DISABLE_ARMING_FLAG(OK_TO_ARM);
    }
#endif
}
#endif // OSD
