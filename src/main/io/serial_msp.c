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
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "build_config.h"
#include "debug.h"
#include <platform.h>
#include "scheduler.h"

#include "common/axis.h"
#include "common/color.h"
#include "common/maths.h"

#include "drivers/system.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"

#include "drivers/serial.h"
#include "drivers/bus_i2c.h"
#include "drivers/gpio.h"
#include "drivers/timer.h"
#include "drivers/pwm_rx.h"
#include "drivers/sdcard.h"
#include "drivers/buf_writer.h"
#include "rx/rx.h"
#include "rx/msp.h"

#include "io/escservo.h"
#include "io/rc_controls.h"
#include "io/gps.h"
#include "io/gimbal.h"
#include "io/serial.h"
#include "io/ledstrip.h"
#include "io/flashfs.h"
#include "io/transponder_ir.h"
#include "io/asyncfatfs/asyncfatfs.h"

#include "telemetry/telemetry.h"

#include "sensors/boardalignment.h"
#include "sensors/sensors.h"
#include "sensors/battery.h"
#include "sensors/sonar.h"
#include "sensors/acceleration.h"
#include "sensors/barometer.h"
#include "sensors/compass.h"
#include "sensors/gyro.h"

#include "flight/mixer.h"
#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/failsafe.h"
#include "flight/navigation.h"
#include "flight/altitudehold.h"

#include "blackbox/blackbox.h"

#include "mw.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/config_profile.h"
#include "config/config_master.h"

#include "version.h"
#ifdef NAZE
#include "hardware_revision.h"
#endif

#include "serial_msp.h"

#ifdef USE_SERIAL_1WIRE
#include "io/serial_1wire.h"
#endif
static serialPort_t *mspSerialPort;

extern uint16_t cycleTime; // FIXME dependency on mw.c
extern uint16_t rssi; // FIXME dependency on mw.c
extern void resetPidProfile(pidProfile_t *pidProfile);

void useRcControlsConfig(modeActivationCondition_t *modeActivationConditions, escAndServoConfig_t *escAndServoConfigToUse, pidProfile_t *pidProfileToUse);

const char * const flightControllerIdentifier = CLEANFLIGHT_IDENTIFIER; // 4 UPPER CASE alpha numeric characters that identify the flight controller.

typedef struct box_e {
    const uint8_t boxId;         // see boxId_e
    const char *boxName;            // GUI-readable box name
    const uint8_t permanentId;      //
} box_t;

// FIXME remove ;'s
static const box_t boxes[CHECKBOX_ITEM_COUNT + 1] = {
    { BOXARM, "ARM;", 0 },
    { BOXANGLE, "ANGLE;", 1 },
    { BOXHORIZON, "HORIZON;", 2 },
    { BOXBARO, "BARO;", 3 },
    //{ BOXVARIO, "VARIO;", 4 },
    { BOXMAG, "MAG;", 5 },
    { BOXHEADFREE, "HEADFREE;", 6 },
    { BOXHEADADJ, "HEADADJ;", 7 },
    { BOXCAMSTAB, "CAMSTAB;", 8 },
    { BOXCAMTRIG, "CAMTRIG;", 9 },
    { BOXGPSHOME, "GPS HOME;", 10 },
    { BOXGPSHOLD, "GPS HOLD;", 11 },
    { BOXPASSTHRU, "PASSTHRU;", 12 },
    { BOXBEEPERON, "BEEPER;", 13 },
    { BOXLEDMAX, "LEDMAX;", 14 },
    { BOXLEDLOW, "LEDLOW;", 15 },
    { BOXLLIGHTS, "LLIGHTS;", 16 },
    { BOXCALIB, "CALIB;", 17 },
    { BOXGOV, "GOVERNOR;", 18 },
    { BOXOSD, "OSD SW;", 19 },
    { BOXTELEMETRY, "TELEMETRY;", 20 },
    { BOXGTUNE, "GTUNE;", 21 },
    { BOXSONAR, "SONAR;", 22 },
    { BOXSERVO1, "SERVO1;", 23 },
    { BOXSERVO2, "SERVO2;", 24 },
    { BOXSERVO3, "SERVO3;", 25 },
    { BOXBLACKBOX, "BLACKBOX;", 26 },
    { BOXFAILSAFE, "FAILSAFE;", 27 },
    { BOXAIRMODE, "AIR MODE;", 28 },
    { CHECKBOX_ITEM_COUNT, NULL, 0xFF }
};

// this is calculated at startup based on enabled features.
static uint8_t activeBoxIds[CHECKBOX_ITEM_COUNT];
// this is the number of filled indexes in above array
static uint8_t activeBoxIdCount = 0;
// from mixer.c
extern int16_t motor_disarmed[MAX_SUPPORTED_MOTORS];

// cause reboot after MSP processing complete
static bool isRebootScheduled = false;

static const char pidnames[] =
    "ROLL;"
    "PITCH;"
    "YAW;"
    "ALT;"
    "Pos;"
    "PosR;"
    "NavR;"
    "LEVEL;"
    "MAG;"
    "VEL;";

typedef enum {
    MSP_SDCARD_STATE_NOT_PRESENT = 0,
    MSP_SDCARD_STATE_FATAL       = 1,
    MSP_SDCARD_STATE_CARD_INIT   = 2,
    MSP_SDCARD_STATE_FS_INIT     = 3,
    MSP_SDCARD_STATE_READY       = 4
} mspSDCardState_e;


STATIC_UNIT_TESTED mspPort_t mspPorts[MAX_MSP_PORT_COUNT];

STATIC_UNIT_TESTED mspPort_t *currentPort;
STATIC_UNIT_TESTED bufWriter_t *writer;

static void serialize8(uint8_t a)
{
    bufWriterAppend(writer, a);
    currentPort->checksum ^= a;
}

static void serialize16(uint16_t a)
{
    serialize8((uint8_t)(a >> 0));
    serialize8((uint8_t)(a >> 8));
}

static void serialize32(uint32_t a)
{
    serialize16((uint16_t)(a >> 0));
    serialize16((uint16_t)(a >> 16));
}

static uint8_t read8(void)
{
    return currentPort->inBuf[currentPort->indRX++] & 0xff;
}

static uint16_t read16(void)
{
    uint16_t t = read8();
    t += (uint16_t)read8() << 8;
    return t;
}

static uint32_t read32(void)
{
    uint32_t t = read16();
    t += (uint32_t)read16() << 16;
    return t;
}

static void headSerialResponse(uint8_t err, uint8_t responseBodySize)
{
    serialBeginWrite(mspSerialPort);
    
    serialize8('$');
    serialize8('M');
    serialize8(err ? '!' : '>');
    currentPort->checksum = 0;               // start calculating a new checksum
    serialize8(responseBodySize);
    serialize8(currentPort->cmdMSP);
}

static void headSerialReply(uint8_t responseBodySize)
{
    headSerialResponse(0, responseBodySize);
}

static void headSerialError(uint8_t responseBodySize)
{
    headSerialResponse(1, responseBodySize);
}

static void tailSerialReply(void)
{
    serialize8(currentPort->checksum);
    serialEndWrite(mspSerialPort);
}

#ifdef USE_SERVOS
static void s_struct(uint8_t *cb, uint8_t siz)
{
    headSerialReply(siz);
    while (siz--)
        serialize8(*cb++);
}
#endif

static void serializeNames(const char *s)
{
    const char *c;
    for (c = s; *c; c++)
        serialize8(*c);
}

static const box_t *findBoxByActiveBoxId(uint8_t activeBoxId)
{
    uint8_t boxIndex;
    const box_t *candidate;
    for (boxIndex = 0; boxIndex < sizeof(boxes) / sizeof(box_t); boxIndex++) {
        candidate = &boxes[boxIndex];
        if (candidate->boxId == activeBoxId) {
            return candidate;
        }
    }
    return NULL;
}

static const box_t *findBoxByPermenantId(uint8_t permenantId)
{
    uint8_t boxIndex;
    const box_t *candidate;
    for (boxIndex = 0; boxIndex < sizeof(boxes) / sizeof(box_t); boxIndex++) {
        candidate = &boxes[boxIndex];
        if (candidate->permanentId == permenantId) {
            return candidate;
        }
    }
    return NULL;
}

static void serializeBoxNamesReply(void)
{
    int i, activeBoxId, j, flag = 1, count = 0, len;
    const box_t *box;

reset:
    // in first run of the loop, we grab total size of junk to be sent
    // then come back and actually send it
    for (i = 0; i < activeBoxIdCount; i++) {
        activeBoxId = activeBoxIds[i];

        box = findBoxByActiveBoxId(activeBoxId);
        if (!box) {
            continue;
        }

        len = strlen(box->boxName);
        if (flag) {
            count += len;
        } else {
            for (j = 0; j < len; j++)
                serialize8(box->boxName[j]);
        }
    }

    if (flag) {
        headSerialReply(count);
        flag = 0;
        goto reset;
    }
}

static void serializeSDCardSummaryReply(void)
{
    headSerialReply(3 + 4 + 4);

#ifdef USE_SDCARD
    uint8_t flags = 1 /* SD card supported */ ;
    uint8_t state;

    serialize8(flags);

    // Merge the card and filesystem states together
    if (!sdcard_isInserted()) {
        state = MSP_SDCARD_STATE_NOT_PRESENT;
    } else if (!sdcard_isFunctional()) {
        state = MSP_SDCARD_STATE_FATAL;
    } else {
        switch (afatfs_getFilesystemState()) {
            case AFATFS_FILESYSTEM_STATE_READY:
                state = MSP_SDCARD_STATE_READY;
            break;
            case AFATFS_FILESYSTEM_STATE_INITIALIZATION:
                if (sdcard_isInitialized()) {
                    state = MSP_SDCARD_STATE_FS_INIT;
                } else {
                    state = MSP_SDCARD_STATE_CARD_INIT;
                }
            break;
            case AFATFS_FILESYSTEM_STATE_FATAL:
            case AFATFS_FILESYSTEM_STATE_UNKNOWN:
                state = MSP_SDCARD_STATE_FATAL;
            break;
        }
    }

    serialize8(state);
    serialize8(afatfs_getLastError());
    // Write free space and total space in kilobytes
    serialize32(afatfs_getContiguousFreeSpace() / 1024);
    serialize32(sdcard_getMetadata()->numBlocks / 2); // Block size is half a kilobyte
#else
    serialize8(0);
    serialize8(0);
    serialize8(0);
    serialize32(0);
    serialize32(0);
#endif
}

static void serializeDataflashSummaryReply(void)
{
    headSerialReply(1 + 3 * 4);
#ifdef USE_FLASHFS
    const flashGeometry_t *geometry = flashfsGetGeometry();
    uint8_t flags = (flashfsIsReady() ? 1 : 0) | 2 /* FlashFS is supported */;

    serialize8(flags);
    serialize32(geometry->sectors);
    serialize32(geometry->totalSize);
    serialize32(flashfsGetOffset()); // Effectively the current number of bytes stored on the volume
#else
    serialize8(0); // FlashFS is neither ready nor supported
    serialize32(0);
    serialize32(0);
    serialize32(0);
#endif
}

#ifdef USE_FLASHFS
static void serializeDataflashReadReply(uint32_t address, uint8_t size)
{
    uint8_t buffer[128];
    int bytesRead;

    if (size > sizeof(buffer)) {
        size = sizeof(buffer);
    }

    headSerialReply(4 + size);

    serialize32(address);

    // bytesRead will be lower than that requested if we reach end of volume
    bytesRead = flashfsReadAbs(address, buffer, size);

    for (int i = 0; i < bytesRead; i++) {
        serialize8(buffer[i]);
    }
}
#endif

static void resetMspPort(mspPort_t *mspPortToReset, serialPort_t *serialPort)
{
    memset(mspPortToReset, 0, sizeof(mspPort_t));

    mspPortToReset->port = serialPort;
}

void mspAllocateSerialPorts(serialConfig_t *serialConfig)
{
    UNUSED(serialConfig);

    serialPort_t *serialPort;

    uint8_t portIndex = 0;

    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_MSP);

    while (portConfig && portIndex < MAX_MSP_PORT_COUNT) {
        mspPort_t *mspPort = &mspPorts[portIndex];
        if (mspPort->port) {
            portIndex++;
            continue;
        }

        serialPort = openSerialPort(portConfig->identifier, FUNCTION_MSP, NULL, baudRates[portConfig->msp_baudrateIndex], MODE_RXTX, SERIAL_NOT_INVERTED);
        if (serialPort) {
            resetMspPort(mspPort, serialPort);
            portIndex++;
        }

        portConfig = findNextSerialPortConfig(FUNCTION_MSP);
    }
}

void mspReleasePortIfAllocated(serialPort_t *serialPort)
{
    uint8_t portIndex;
    for (portIndex = 0; portIndex < MAX_MSP_PORT_COUNT; portIndex++) {
        mspPort_t *candidateMspPort = &mspPorts[portIndex];
        if (candidateMspPort->port == serialPort) {
            closeSerialPort(serialPort);
            memset(candidateMspPort, 0, sizeof(mspPort_t));
        }
    }
}

void mspInit(serialConfig_t *serialConfig)
{
    // calculate used boxes based on features and fill availableBoxes[] array
    memset(activeBoxIds, 0xFF, sizeof(activeBoxIds));

    activeBoxIdCount = 0;
    activeBoxIds[activeBoxIdCount++] = BOXARM;

    if (sensors(SENSOR_ACC)) {
        activeBoxIds[activeBoxIdCount++] = BOXANGLE;
        activeBoxIds[activeBoxIdCount++] = BOXHORIZON;
    }

#ifdef BARO
    if (sensors(SENSOR_BARO)) {
        activeBoxIds[activeBoxIdCount++] = BOXBARO;
    }
#endif

    activeBoxIds[activeBoxIdCount++] = BOXAIRMODE;

    if (sensors(SENSOR_ACC) || sensors(SENSOR_MAG)) {
        activeBoxIds[activeBoxIdCount++] = BOXMAG;
        activeBoxIds[activeBoxIdCount++] = BOXHEADFREE;
        activeBoxIds[activeBoxIdCount++] = BOXHEADADJ;
    }

    if (feature(FEATURE_SERVO_TILT))
        activeBoxIds[activeBoxIdCount++] = BOXCAMSTAB;

#ifdef GPS
    if (feature(FEATURE_GPS)) {
        activeBoxIds[activeBoxIdCount++] = BOXGPSHOME;
        activeBoxIds[activeBoxIdCount++] = BOXGPSHOLD;
    }
#endif

    if (masterConfig.mixerMode == MIXER_FLYING_WING || masterConfig.mixerMode == MIXER_AIRPLANE || masterConfig.mixerMode == MIXER_CUSTOM_AIRPLANE)
        activeBoxIds[activeBoxIdCount++] = BOXPASSTHRU;

    activeBoxIds[activeBoxIdCount++] = BOXBEEPERON;

#ifdef LED_STRIP
    if (feature(FEATURE_LED_STRIP)) {
        activeBoxIds[activeBoxIdCount++] = BOXLEDLOW;
    }
#endif

    if (feature(FEATURE_INFLIGHT_ACC_CAL))
        activeBoxIds[activeBoxIdCount++] = BOXCALIB;

    activeBoxIds[activeBoxIdCount++] = BOXOSD;

#ifdef TELEMETRY
    if (feature(FEATURE_TELEMETRY) && masterConfig.telemetryConfig.telemetry_switch)
        activeBoxIds[activeBoxIdCount++] = BOXTELEMETRY;
#endif

    if (feature(FEATURE_SONAR)){
        activeBoxIds[activeBoxIdCount++] = BOXSONAR;
    }

#ifdef USE_SERVOS
    if (masterConfig.mixerMode == MIXER_CUSTOM_AIRPLANE) {
        activeBoxIds[activeBoxIdCount++] = BOXSERVO1;
        activeBoxIds[activeBoxIdCount++] = BOXSERVO2;
        activeBoxIds[activeBoxIdCount++] = BOXSERVO3;
    }
#endif

#ifdef BLACKBOX
    if (feature(FEATURE_BLACKBOX)){
        activeBoxIds[activeBoxIdCount++] = BOXBLACKBOX;
    }
#endif

    if (feature(FEATURE_FAILSAFE)){
        activeBoxIds[activeBoxIdCount++] = BOXFAILSAFE;
    }

#ifdef GTUNE
    activeBoxIds[activeBoxIdCount++] = BOXGTUNE;
#endif

    memset(mspPorts, 0x00, sizeof(mspPorts));
    mspAllocateSerialPorts(serialConfig);
}

#define IS_ENABLED(mask) (mask == 0 ? 0 : 1)

static uint32_t packFlightModeFlags(void)
{
    uint32_t i, junk, tmp;

    // Serialize the flags in the order we delivered them, ignoring BOXNAMES and BOXINDEXES
    // Requires new Multiwii protocol version to fix
    // It would be preferable to setting the enabled bits based on BOXINDEX.
    junk = 0;
    tmp = IS_ENABLED(FLIGHT_MODE(ANGLE_MODE)) << BOXANGLE |
        IS_ENABLED(FLIGHT_MODE(HORIZON_MODE)) << BOXHORIZON |
        IS_ENABLED(FLIGHT_MODE(BARO_MODE)) << BOXBARO |
        IS_ENABLED(FLIGHT_MODE(MAG_MODE)) << BOXMAG |
        IS_ENABLED(FLIGHT_MODE(HEADFREE_MODE)) << BOXHEADFREE |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXHEADADJ)) << BOXHEADADJ |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXCAMSTAB)) << BOXCAMSTAB |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXCAMTRIG)) << BOXCAMTRIG |
        IS_ENABLED(FLIGHT_MODE(GPS_HOME_MODE)) << BOXGPSHOME |
        IS_ENABLED(FLIGHT_MODE(GPS_HOLD_MODE)) << BOXGPSHOLD |
        IS_ENABLED(FLIGHT_MODE(PASSTHRU_MODE)) << BOXPASSTHRU |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXBEEPERON)) << BOXBEEPERON |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXLEDMAX)) << BOXLEDMAX |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXLEDLOW)) << BOXLEDLOW |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXLLIGHTS)) << BOXLLIGHTS |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXCALIB)) << BOXCALIB |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXGOV)) << BOXGOV |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXOSD)) << BOXOSD |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXTELEMETRY)) << BOXTELEMETRY |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXGTUNE)) << BOXGTUNE |
        IS_ENABLED(FLIGHT_MODE(SONAR_MODE)) << BOXSONAR |
        IS_ENABLED(ARMING_FLAG(ARMED)) << BOXARM |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXBLACKBOX)) << BOXBLACKBOX |
        IS_ENABLED(FLIGHT_MODE(FAILSAFE_MODE)) << BOXFAILSAFE |
        IS_ENABLED(IS_RC_MODE_ACTIVE(BOXAIRMODE)) << BOXAIRMODE;

    for (i = 0; i < activeBoxIdCount; i++) {
        int flag = (tmp & (1 << activeBoxIds[i]));
        if (flag)
            junk |= 1 << i;
    }
    
    return junk;
}

static bool processOutCommand(uint8_t cmdMSP)
{
    uint32_t i;

#ifdef GPS
    uint8_t wp_no;
    int32_t lat = 0, lon = 0;
#endif

    switch (cmdMSP) {
    case MSP_API_VERSION:
        headSerialReply(
            1 + // protocol version length
            API_VERSION_LENGTH
        );
        serialize8(MSP_PROTOCOL_VERSION);

        serialize8(API_VERSION_MAJOR);
        serialize8(API_VERSION_MINOR);
        break;

    case MSP_FC_VARIANT:
        headSerialReply(FLIGHT_CONTROLLER_IDENTIFIER_LENGTH);

        for (i = 0; i < FLIGHT_CONTROLLER_IDENTIFIER_LENGTH; i++) {
            serialize8(flightControllerIdentifier[i]);
        }
        break;

    case MSP_FC_VERSION:
        headSerialReply(FLIGHT_CONTROLLER_VERSION_LENGTH);

        serialize8(FC_VERSION_MAJOR);
        serialize8(FC_VERSION_MINOR);
        serialize8(FC_VERSION_PATCH_LEVEL);
        break;

    case MSP_BOARD_INFO:
        headSerialReply(
            BOARD_IDENTIFIER_LENGTH +
            BOARD_HARDWARE_REVISION_LENGTH
        );
        for (i = 0; i < BOARD_IDENTIFIER_LENGTH; i++) {
            serialize8(boardIdentifier[i]);
        }
#ifdef NAZE
        serialize16(hardwareRevision);
#else
        serialize16(0); // No other build targets currently have hardware revision detection.
#endif
        break;

    case MSP_BUILD_INFO:
        headSerialReply(
                BUILD_DATE_LENGTH +
                BUILD_TIME_LENGTH +
                GIT_SHORT_REVISION_LENGTH
        );

        for (i = 0; i < BUILD_DATE_LENGTH; i++) {
            serialize8(buildDate[i]);
        }
        for (i = 0; i < BUILD_TIME_LENGTH; i++) {
            serialize8(buildTime[i]);
        }

        for (i = 0; i < GIT_SHORT_REVISION_LENGTH; i++) {
            serialize8(shortGitRevision[i]);
        }
        break;

    // DEPRECATED - Use MSP_API_VERSION
    case MSP_IDENT:
        headSerialReply(7);
        serialize8(MW_VERSION);
        serialize8(masterConfig.mixerMode);
        serialize8(MSP_PROTOCOL_VERSION);
        serialize32(CAP_DYNBALANCE); // "capability"
        break;

    case MSP_STATUS_EX:
        headSerialReply(13);
        serialize16(cycleTime);
#ifdef USE_I2C
        serialize16(i2cGetErrorCounter());
#else
        serialize16(0);
#endif
        serialize16(sensors(SENSOR_ACC) | sensors(SENSOR_BARO) << 1 | sensors(SENSOR_MAG) << 2 | sensors(SENSOR_GPS) << 3 | sensors(SENSOR_SONAR) << 4);
        serialize32(packFlightModeFlags());
        serialize8(masterConfig.current_profile_index);
        serialize16(averageSystemLoadPercent);
        break;

    case MSP_STATUS:
        headSerialReply(11);
        serialize16(cycleTime);
#ifdef USE_I2C
        serialize16(i2cGetErrorCounter());
#else
        serialize16(0);
#endif
        serialize16(sensors(SENSOR_ACC) | sensors(SENSOR_BARO) << 1 | sensors(SENSOR_MAG) << 2 | sensors(SENSOR_GPS) << 3 | sensors(SENSOR_SONAR) << 4);
        serialize32(packFlightModeFlags());
        serialize8(masterConfig.current_profile_index);
        break;
    case MSP_RAW_IMU:
        headSerialReply(18);

        // Hack scale due to choice of units for sensor data in multiwii
        uint8_t scale = (acc_1G > 1024) ? 8 : 1;

        for (i = 0; i < 3; i++)
            serialize16(accSmooth[i] / scale);
        for (i = 0; i < 3; i++)
            serialize16(gyroADC[i]);
        for (i = 0; i < 3; i++)
            serialize16(magADC[i]);
        break;
#ifdef USE_SERVOS
    case MSP_SERVO:
        s_struct((uint8_t *)&servo, MAX_SUPPORTED_SERVOS * 2);
        break;
    case MSP_SERVO_CONFIGURATIONS:
        headSerialReply(MAX_SUPPORTED_SERVOS * sizeof(servoParam_t));
        for (i = 0; i < MAX_SUPPORTED_SERVOS; i++) {
            serialize16(currentProfile->servoConf[i].min);
            serialize16(currentProfile->servoConf[i].max);
            serialize16(currentProfile->servoConf[i].middle);
            serialize8(currentProfile->servoConf[i].rate);
            serialize8(currentProfile->servoConf[i].angleAtMin);
            serialize8(currentProfile->servoConf[i].angleAtMax);
            serialize8(currentProfile->servoConf[i].forwardFromChannel);
            serialize32(currentProfile->servoConf[i].reversedSources);
        }
        break;
    case MSP_SERVO_MIX_RULES:
        headSerialReply(MAX_SERVO_RULES * sizeof(servoMixer_t));
        for (i = 0; i < MAX_SERVO_RULES; i++) {
            serialize8(masterConfig.customServoMixer[i].targetChannel);
            serialize8(masterConfig.customServoMixer[i].inputSource);
            serialize8(masterConfig.customServoMixer[i].rate);
            serialize8(masterConfig.customServoMixer[i].speed);
            serialize8(masterConfig.customServoMixer[i].min);
            serialize8(masterConfig.customServoMixer[i].max);
            serialize8(masterConfig.customServoMixer[i].box);
        }
        break;
#endif
    case MSP_MOTOR:
        headSerialReply(16);
        for (i = 0; i < 8; i++) {
            serialize16(i < MAX_SUPPORTED_MOTORS ? motor[i] : 0);
        }
        break;
    case MSP_RC:
        headSerialReply(2 * rxRuntimeConfig.channelCount);
        for (i = 0; i < rxRuntimeConfig.channelCount; i++)
            serialize16(rcData[i]);
        break;
    case MSP_ATTITUDE:
        headSerialReply(6);
        serialize16(attitude.values.roll);
        serialize16(attitude.values.pitch);
        serialize16(DECIDEGREES_TO_DEGREES(attitude.values.yaw));
        break;
    case MSP_ALTITUDE:
        headSerialReply(6);
#if defined(BARO) || defined(SONAR)
        serialize32(altitudeHoldGetEstimatedAltitude());
#else
        serialize32(0);
#endif
        serialize16(vario);
        break;
    case MSP_SONAR_ALTITUDE:
        headSerialReply(4);
#if defined(SONAR)
        serialize32(sonarGetLatestAltitude());
#else
        serialize32(0);
#endif
        break;
    case MSP_ANALOG:
        headSerialReply(7);
        serialize8((uint8_t)constrain(vbat, 0, 255));
        serialize16((uint16_t)constrain(mAhDrawn, 0, 0xFFFF)); // milliamp hours drawn from battery
        serialize16(rssi);
        if(masterConfig.batteryConfig.multiwiiCurrentMeterOutput) {
            serialize16((uint16_t)constrain(amperage * 10, 0, 0xFFFF)); // send amperage in 0.001 A steps. Negative range is truncated to zero
        } else
            serialize16((int16_t)constrain(amperage, -0x8000, 0x7FFF)); // send amperage in 0.01 A steps, range is -320A to 320A
        break;
    case MSP_ARMING_CONFIG:
        headSerialReply(2);
        serialize8(masterConfig.auto_disarm_delay); 
        serialize8(masterConfig.disarm_kill_switch);
        break;
    case MSP_LOOP_TIME:
        headSerialReply(2);
        serialize16(masterConfig.looptime);
        break;
    case MSP_RC_TUNING:
        headSerialReply(11);
        serialize8(currentControlRateProfile->rcRate8);
        serialize8(currentControlRateProfile->rcExpo8);
        for (i = 0 ; i < 3; i++) {
            serialize8(currentControlRateProfile->rates[i]); // R,P,Y see flight_dynamics_index_t
        }
        serialize8(currentControlRateProfile->dynThrPID);
        serialize8(currentControlRateProfile->thrMid8);
        serialize8(currentControlRateProfile->thrExpo8);
        serialize16(currentControlRateProfile->tpa_breakpoint);
        serialize8(currentControlRateProfile->rcYawExpo8);
        break;
    case MSP_PID:
        headSerialReply(3 * PID_ITEM_COUNT);
        if (IS_PID_CONTROLLER_FP_BASED(currentProfile->pidProfile.pidController)) { // convert float stuff into uint8_t to keep backwards compatability with all 8-bit shit with new pid
            for (i = 0; i < 3; i++) {
                serialize8(constrain(lrintf(currentProfile->pidProfile.P_f[i] * 10.0f), 0, 255));
                serialize8(constrain(lrintf(currentProfile->pidProfile.I_f[i] * 100.0f), 0, 255));
                serialize8(constrain(lrintf(currentProfile->pidProfile.D_f[i] * 1000.0f), 0, 255));
            }
            for (i = 3; i < PID_ITEM_COUNT; i++) {
                if (i == PIDLEVEL) {
                    serialize8(constrain(lrintf(currentProfile->pidProfile.A_level * 10.0f), 0, 255));
                    serialize8(constrain(lrintf(currentProfile->pidProfile.H_level * 10.0f), 0, 255));
                    serialize8(constrain(lrintf(currentProfile->pidProfile.H_sensitivity), 0, 255));
                } else {
                    serialize8(currentProfile->pidProfile.P8[i]);
                    serialize8(currentProfile->pidProfile.I8[i]);
                    serialize8(currentProfile->pidProfile.D8[i]);
                }
            }
        } else {
            for (i = 0; i < PID_ITEM_COUNT; i++) {
                serialize8(currentProfile->pidProfile.P8[i]);
                serialize8(currentProfile->pidProfile.I8[i]);
                serialize8(currentProfile->pidProfile.D8[i]);
            }
        }
        break;
    case MSP_PIDNAMES:
        headSerialReply(sizeof(pidnames) - 1);
        serializeNames(pidnames);
        break;
    case MSP_PID_CONTROLLER:
        headSerialReply(1);
        serialize8(currentProfile->pidProfile.pidController);
        break;
    case MSP_MODE_RANGES:
        headSerialReply(4 * MAX_MODE_ACTIVATION_CONDITION_COUNT);
        for (i = 0; i < MAX_MODE_ACTIVATION_CONDITION_COUNT; i++) {
            modeActivationCondition_t *mac = &currentProfile->modeActivationConditions[i];
            const box_t *box = &boxes[mac->modeId];
            serialize8(box->permanentId);
            serialize8(mac->auxChannelIndex);
            serialize8(mac->range.startStep);
            serialize8(mac->range.endStep);
        }
        break;
    case MSP_ADJUSTMENT_RANGES:
        headSerialReply(MAX_ADJUSTMENT_RANGE_COUNT * (
                1 + // adjustment index/slot
                1 + // aux channel index
                1 + // start step
                1 + // end step
                1 + // adjustment function
                1   // aux switch channel index
        ));
        for (i = 0; i < MAX_ADJUSTMENT_RANGE_COUNT; i++) {
            adjustmentRange_t *adjRange = &currentProfile->adjustmentRanges[i];
            serialize8(adjRange->adjustmentIndex);
            serialize8(adjRange->auxChannelIndex);
            serialize8(adjRange->range.startStep);
            serialize8(adjRange->range.endStep);
            serialize8(adjRange->adjustmentFunction);
            serialize8(adjRange->auxSwitchChannelIndex);
        }
        break;
    case MSP_BOXNAMES:
        serializeBoxNamesReply();
        break;
    case MSP_BOXIDS:
        headSerialReply(activeBoxIdCount);
        for (i = 0; i < activeBoxIdCount; i++) {
            const box_t *box = findBoxByActiveBoxId(activeBoxIds[i]);
            if (!box) {
                continue;
            }
            serialize8(box->permanentId);
        }
        break;
    case MSP_MISC:
        headSerialReply(2 * 5 + 3 + 3 + 2 + 4);
        serialize16(masterConfig.rxConfig.midrc);

        serialize16(masterConfig.escAndServoConfig.minthrottle);
        serialize16(masterConfig.escAndServoConfig.maxthrottle);
        serialize16(masterConfig.escAndServoConfig.mincommand);

        serialize16(masterConfig.failsafeConfig.failsafe_throttle);

#ifdef GPS
        serialize8(masterConfig.gpsConfig.provider); // gps_type
        serialize8(0); // TODO gps_baudrate (an index, cleanflight uses a uint32_t
        serialize8(masterConfig.gpsConfig.sbasMode); // gps_ubx_sbas
#else
        serialize8(0); // gps_type
        serialize8(0); // TODO gps_baudrate (an index, cleanflight uses a uint32_t
        serialize8(0); // gps_ubx_sbas
#endif
        serialize8(masterConfig.batteryConfig.multiwiiCurrentMeterOutput);
        serialize8(masterConfig.rxConfig.rssi_channel);
        serialize8(0);

        serialize16(currentProfile->mag_declination / 10);

        serialize8(masterConfig.batteryConfig.vbatscale);
        serialize8(masterConfig.batteryConfig.vbatmincellvoltage);
        serialize8(masterConfig.batteryConfig.vbatmaxcellvoltage);
        serialize8(masterConfig.batteryConfig.vbatwarningcellvoltage);
        break;

    case MSP_MOTOR_PINS:
        // FIXME This is hardcoded and should not be.
        headSerialReply(8);
        for (i = 0; i < 8; i++)
            serialize8(i + 1);
        break;
#ifdef GPS
    case MSP_RAW_GPS:
        headSerialReply(16);
        serialize8(STATE(GPS_FIX));
        serialize8(GPS_numSat);
        serialize32(GPS_coord[LAT]);
        serialize32(GPS_coord[LON]);
        serialize16(GPS_altitude);
        serialize16(GPS_speed);
        serialize16(GPS_ground_course);
        break;
    case MSP_COMP_GPS:
        headSerialReply(5);
        serialize16(GPS_distanceToHome);
        serialize16(GPS_directionToHome);
        serialize8(GPS_update & 1);
        break;
    case MSP_WP:
        wp_no = read8();    // get the wp number
        headSerialReply(18);
        if (wp_no == 0) {
            lat = GPS_home[LAT];
            lon = GPS_home[LON];
        } else if (wp_no == 16) {
            lat = GPS_hold[LAT];
            lon = GPS_hold[LON];
        }
        serialize8(wp_no);
        serialize32(lat);
        serialize32(lon);
        serialize32(AltHold);           // altitude (cm) will come here -- temporary implementation to test feature with apps
        serialize16(0);                 // heading  will come here (deg)
        serialize16(0);                 // time to stay (ms) will come here
        serialize8(0);                  // nav flag will come here
        break;
    case MSP_GPSSVINFO:
        headSerialReply(1 + (GPS_numCh * 4));
        serialize8(GPS_numCh);
           for (i = 0; i < GPS_numCh; i++){
               serialize8(GPS_svinfo_chn[i]);
               serialize8(GPS_svinfo_svid[i]);
               serialize8(GPS_svinfo_quality[i]);
               serialize8(GPS_svinfo_cno[i]);
           }
        break;
#endif
    case MSP_DEBUG:
        headSerialReply(DEBUG16_VALUE_COUNT * sizeof(debug[0]));

        // output some useful QA statistics
        // debug[x] = ((hse_value / 1000000) * 1000) + (SystemCoreClock / 1000000);         // XX0YY [crystal clock : core clock]

        for (i = 0; i < DEBUG16_VALUE_COUNT; i++)
            serialize16(debug[i]);      // 4 variables are here for general monitoring purpose
        break;

    // Additional commands that are not compatible with MultiWii
    case MSP_ACC_TRIM:
        headSerialReply(4);
        serialize16(currentProfile->accelerometerTrims.values.pitch);
        serialize16(currentProfile->accelerometerTrims.values.roll);
        break;

    case MSP_UID:
        headSerialReply(12);
        serialize32(U_ID_0);
        serialize32(U_ID_1);
        serialize32(U_ID_2);
        break;

    case MSP_FEATURE:
        headSerialReply(4);
        serialize32(featureMask());
        break;

    case MSP_BOARD_ALIGNMENT:
        headSerialReply(6);
        serialize16(masterConfig.boardAlignment.rollDegrees);
        serialize16(masterConfig.boardAlignment.pitchDegrees);
        serialize16(masterConfig.boardAlignment.yawDegrees);
        break;

    case MSP_VOLTAGE_METER_CONFIG:
        headSerialReply(4);
        serialize8(masterConfig.batteryConfig.vbatscale);
        serialize8(masterConfig.batteryConfig.vbatmincellvoltage);
        serialize8(masterConfig.batteryConfig.vbatmaxcellvoltage);
        serialize8(masterConfig.batteryConfig.vbatwarningcellvoltage);
        break;

    case MSP_CURRENT_METER_CONFIG:
        headSerialReply(7);
        serialize16(masterConfig.batteryConfig.currentMeterScale);
        serialize16(masterConfig.batteryConfig.currentMeterOffset);
        serialize8(masterConfig.batteryConfig.currentMeterType);
        serialize16(masterConfig.batteryConfig.batteryCapacity);
        break;

    case MSP_MIXER:
        headSerialReply(1);
        serialize8(masterConfig.mixerMode);
        break;

    case MSP_RX_CONFIG:
        headSerialReply(12);
        serialize8(masterConfig.rxConfig.serialrx_provider);
        serialize16(masterConfig.rxConfig.maxcheck);
        serialize16(masterConfig.rxConfig.midrc);
        serialize16(masterConfig.rxConfig.mincheck);
        serialize8(masterConfig.rxConfig.spektrum_sat_bind);
        serialize16(masterConfig.rxConfig.rx_min_usec);
        serialize16(masterConfig.rxConfig.rx_max_usec);
        break;

    case MSP_FAILSAFE_CONFIG:
        headSerialReply(8);
        serialize8(masterConfig.failsafeConfig.failsafe_delay);
        serialize8(masterConfig.failsafeConfig.failsafe_off_delay);
        serialize16(masterConfig.failsafeConfig.failsafe_throttle);
        serialize8(masterConfig.failsafeConfig.failsafe_kill_switch);
        serialize16(masterConfig.failsafeConfig.failsafe_throttle_low_delay);
        serialize8(masterConfig.failsafeConfig.failsafe_procedure);
        break;

    case MSP_RXFAIL_CONFIG:
        headSerialReply(3 * (rxRuntimeConfig.channelCount));
        for (i = 0; i < rxRuntimeConfig.channelCount; i++) {
            serialize8(masterConfig.rxConfig.failsafe_channel_configurations[i].mode);
            serialize16(RXFAIL_STEP_TO_CHANNEL_VALUE(masterConfig.rxConfig.failsafe_channel_configurations[i].step));
        }
        break;

    case MSP_RSSI_CONFIG:
        headSerialReply(1);
        serialize8(masterConfig.rxConfig.rssi_channel);
        break;

    case MSP_RX_MAP:
        headSerialReply(MAX_MAPPABLE_RX_INPUTS);
        for (i = 0; i < MAX_MAPPABLE_RX_INPUTS; i++)
            serialize8(masterConfig.rxConfig.rcmap[i]);
        break;

    case MSP_BF_CONFIG:
        headSerialReply(1 + 4 + 1 + 2 + 2 + 2 + 2 + 2);
        serialize8(masterConfig.mixerMode);

        serialize32(featureMask());

        serialize8(masterConfig.rxConfig.serialrx_provider);

        serialize16(masterConfig.boardAlignment.rollDegrees);
        serialize16(masterConfig.boardAlignment.pitchDegrees);
        serialize16(masterConfig.boardAlignment.yawDegrees);

        serialize16(masterConfig.batteryConfig.currentMeterScale);
        serialize16(masterConfig.batteryConfig.currentMeterOffset);
        break;

    case MSP_CF_SERIAL_CONFIG:
        headSerialReply(
            ((sizeof(uint8_t) + sizeof(uint16_t) + (sizeof(uint8_t) * 4)) * serialGetAvailablePortCount())
        );
        for (i = 0; i < SERIAL_PORT_COUNT; i++) {
            if (!serialIsPortAvailable(masterConfig.serialConfig.portConfigs[i].identifier)) {
                continue;
            };
            serialize8(masterConfig.serialConfig.portConfigs[i].identifier);
            serialize16(masterConfig.serialConfig.portConfigs[i].functionMask);
            serialize8(masterConfig.serialConfig.portConfigs[i].msp_baudrateIndex);
            serialize8(masterConfig.serialConfig.portConfigs[i].gps_baudrateIndex);
            serialize8(masterConfig.serialConfig.portConfigs[i].telemetry_baudrateIndex);
            serialize8(masterConfig.serialConfig.portConfigs[i].blackbox_baudrateIndex);
        }
        break;

#ifdef LED_STRIP
    case MSP_LED_COLORS:
        headSerialReply(CONFIGURABLE_COLOR_COUNT * 4);
        for (i = 0; i < CONFIGURABLE_COLOR_COUNT; i++) {
            hsvColor_t *color = &masterConfig.colors[i];
            serialize16(color->h);
            serialize8(color->s);
            serialize8(color->v);
        }
        break;

    case MSP_LED_STRIP_CONFIG:
        headSerialReply(MAX_LED_STRIP_LENGTH * 7);
        for (i = 0; i < MAX_LED_STRIP_LENGTH; i++) {
            ledConfig_t *ledConfig = &masterConfig.ledConfigs[i];
            serialize16((ledConfig->flags & LED_DIRECTION_MASK) >> LED_DIRECTION_BIT_OFFSET);
            serialize16((ledConfig->flags & LED_FUNCTION_MASK) >> LED_FUNCTION_BIT_OFFSET);
            serialize8(GET_LED_X(ledConfig));
            serialize8(GET_LED_Y(ledConfig));
            serialize8(ledConfig->color);
        }
        break;
#endif

    case MSP_DATAFLASH_SUMMARY:
        serializeDataflashSummaryReply();
        break;

#ifdef USE_FLASHFS
    case MSP_DATAFLASH_READ:
        {
            uint32_t readAddress = read32();

            serializeDataflashReadReply(readAddress, 128);
        }
        break;
#endif

    case MSP_BLACKBOX_CONFIG:
        headSerialReply(4);

#ifdef BLACKBOX
        serialize8(1); //Blackbox supported
        serialize8(masterConfig.blackbox_device);
        serialize8(masterConfig.blackbox_rate_num);
        serialize8(masterConfig.blackbox_rate_denom);
#else
        serialize8(0); // Blackbox not supported
        serialize8(0);
        serialize8(0);
        serialize8(0);
#endif
        break;

    case MSP_SDCARD_SUMMARY:
        serializeSDCardSummaryReply();
        break;

    case MSP_TRANSPONDER_CONFIG:
#ifdef TRANSPONDER
        headSerialReply(1 + sizeof(masterConfig.transponderData));

        serialize8(1); //Transponder supported

        for (i = 0; i < sizeof(masterConfig.transponderData); i++) {
            serialize8(masterConfig.transponderData[i]);
        }
#else
        headSerialReply(1);
        serialize8(0); // Transponder not supported
#endif
        break;

    case MSP_BF_BUILD_INFO:
        headSerialReply(11 + 4 + 4);
        for (i = 0; i < 11; i++)
        serialize8(buildDate[i]); // MMM DD YYYY as ascii, MMM = Jan/Feb... etc
        serialize32(0); // future exp
        serialize32(0); // future exp
        break;

    case MSP_3D:
        headSerialReply(2 * 4);
        serialize16(masterConfig.flight3DConfig.deadband3d_low);
        serialize16(masterConfig.flight3DConfig.deadband3d_high);
        serialize16(masterConfig.flight3DConfig.neutral3d);
        serialize16(masterConfig.flight3DConfig.deadband3d_throttle);
        break;

    case MSP_RC_DEADBAND:
        headSerialReply(3);
        serialize8(currentProfile->rcControlsConfig.deadband);
        serialize8(currentProfile->rcControlsConfig.yaw_deadband);
        serialize8(currentProfile->rcControlsConfig.alt_hold_deadband);
        break;
    case MSP_SENSOR_ALIGNMENT:
        headSerialReply(3);
        serialize8(masterConfig.sensorAlignmentConfig.gyro_align);
        serialize8(masterConfig.sensorAlignmentConfig.acc_align);
        serialize8(masterConfig.sensorAlignmentConfig.mag_align);
        break;

    default:
        return false;
    }
    return true;
}

static bool processInCommand(void)
{
    uint32_t i;
    uint16_t tmp;
    uint8_t rate;
#ifdef GPS
    uint8_t wp_no;
    int32_t lat = 0, lon = 0, alt = 0;
#endif

    switch (currentPort->cmdMSP) {
    case MSP_SELECT_SETTING:
        if (!ARMING_FLAG(ARMED)) {
            masterConfig.current_profile_index = read8();
            if (masterConfig.current_profile_index > 2) {
                masterConfig.current_profile_index = 0;
            }
            writeEEPROM();
            readEEPROM();
        }
        break;
    case MSP_SET_HEAD:
        magHold = read16();
        break;
    case MSP_SET_RAW_RC:
        {
            uint8_t channelCount = currentPort->dataSize / sizeof(uint16_t);
            if (channelCount > MAX_SUPPORTED_RC_CHANNEL_COUNT) {
                headSerialError(0);
            } else {
                uint16_t frame[MAX_SUPPORTED_RC_CHANNEL_COUNT];

                for (i = 0; i < channelCount; i++) {
                    frame[i] = read16();
                }

                rxMspFrameReceive(frame, channelCount);
            }
        }
        break;
    case MSP_SET_ACC_TRIM:
        currentProfile->accelerometerTrims.values.pitch = read16();
        currentProfile->accelerometerTrims.values.roll  = read16();
        break;
    case MSP_SET_ARMING_CONFIG:
        masterConfig.auto_disarm_delay = read8();
        masterConfig.disarm_kill_switch = read8();
        break;
    case MSP_SET_LOOP_TIME:
        masterConfig.looptime = read16();
        break;
    case MSP_SET_PID_CONTROLLER:
        currentProfile->pidProfile.pidController = read8();
        pidSetController(currentProfile->pidProfile.pidController);
        break;
    case MSP_SET_PID:
        if (IS_PID_CONTROLLER_FP_BASED(currentProfile->pidProfile.pidController)) {
            for (i = 0; i < 3; i++) {
                currentProfile->pidProfile.P_f[i] = (float)read8() / 10.0f;
                currentProfile->pidProfile.I_f[i] = (float)read8() / 100.0f;
                currentProfile->pidProfile.D_f[i] = (float)read8() / 1000.0f;
            }
            for (i = 3; i < PID_ITEM_COUNT; i++) {
                if (i == PIDLEVEL) {
                    currentProfile->pidProfile.A_level = (float)read8() / 10.0f;
                    currentProfile->pidProfile.H_level = (float)read8() / 10.0f;
                    currentProfile->pidProfile.H_sensitivity = read8();
                } else {
                    currentProfile->pidProfile.P8[i] = read8();
                    currentProfile->pidProfile.I8[i] = read8();
                    currentProfile->pidProfile.D8[i] = read8();
                }
            }
        } else {
            for (i = 0; i < PID_ITEM_COUNT; i++) {
                currentProfile->pidProfile.P8[i] = read8();
                currentProfile->pidProfile.I8[i] = read8();
                currentProfile->pidProfile.D8[i] = read8();
            }
        }
        break;
    case MSP_SET_MODE_RANGE:
        i = read8();
        if (i < MAX_MODE_ACTIVATION_CONDITION_COUNT) {
            modeActivationCondition_t *mac = &currentProfile->modeActivationConditions[i];
            i = read8();
            const box_t *box = findBoxByPermenantId(i);
            if (box) {
                mac->modeId = box->boxId;
                mac->auxChannelIndex = read8();
                mac->range.startStep = read8();
                mac->range.endStep = read8();

                useRcControlsConfig(currentProfile->modeActivationConditions, &masterConfig.escAndServoConfig, &currentProfile->pidProfile);
            } else {
                headSerialError(0);
            }
        } else {
            headSerialError(0);
        }
        break;
    case MSP_SET_ADJUSTMENT_RANGE:
        i = read8();
        if (i < MAX_ADJUSTMENT_RANGE_COUNT) {
            adjustmentRange_t *adjRange = &currentProfile->adjustmentRanges[i];
            i = read8();
            if (i < MAX_SIMULTANEOUS_ADJUSTMENT_COUNT) {
                adjRange->adjustmentIndex = i;
                adjRange->auxChannelIndex = read8();
                adjRange->range.startStep = read8();
                adjRange->range.endStep = read8();
                adjRange->adjustmentFunction = read8();
                adjRange->auxSwitchChannelIndex = read8();
            } else {
                headSerialError(0);
            }
        } else {
            headSerialError(0);
        }
        break;

    case MSP_SET_RC_TUNING:
        if (currentPort->dataSize >= 10) {
            currentControlRateProfile->rcRate8 = read8();
            currentControlRateProfile->rcExpo8 = read8();
            for (i = 0; i < 3; i++) {
                rate = read8();
                currentControlRateProfile->rates[i] = MIN(rate, i == YAW ? CONTROL_RATE_CONFIG_YAW_RATE_MAX : CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX);
            }
            rate = read8();
            currentControlRateProfile->dynThrPID = MIN(rate, CONTROL_RATE_CONFIG_TPA_MAX);
            currentControlRateProfile->thrMid8 = read8();
            currentControlRateProfile->thrExpo8 = read8();
            currentControlRateProfile->tpa_breakpoint = read16();
            if (currentPort->dataSize >= 11) {
                currentControlRateProfile->rcYawExpo8 = read8();
            }
        } else {
            headSerialError(0);
        }
        break;
    case MSP_SET_MISC:
        tmp = read16();
        if (tmp < 1600 && tmp > 1400)
            masterConfig.rxConfig.midrc = tmp;

        masterConfig.escAndServoConfig.minthrottle = read16();
        masterConfig.escAndServoConfig.maxthrottle = read16();
        masterConfig.escAndServoConfig.mincommand = read16();

        masterConfig.failsafeConfig.failsafe_throttle = read16();

#ifdef GPS
        masterConfig.gpsConfig.provider = read8(); // gps_type
        read8(); // gps_baudrate
        masterConfig.gpsConfig.sbasMode = read8(); // gps_ubx_sbas
#else
        read8(); // gps_type
        read8(); // gps_baudrate
        read8(); // gps_ubx_sbas
#endif
        masterConfig.batteryConfig.multiwiiCurrentMeterOutput = read8();
        masterConfig.rxConfig.rssi_channel = read8();
        read8();

        currentProfile->mag_declination = read16() * 10;

        masterConfig.batteryConfig.vbatscale = read8();           // actual vbatscale as intended
        masterConfig.batteryConfig.vbatmincellvoltage = read8();  // vbatlevel_warn1 in MWC2.3 GUI
        masterConfig.batteryConfig.vbatmaxcellvoltage = read8();  // vbatlevel_warn2 in MWC2.3 GUI
        masterConfig.batteryConfig.vbatwarningcellvoltage = read8();  // vbatlevel when buzzer starts to alert
        break;
    case MSP_SET_MOTOR:
        for (i = 0; i < 8; i++) {
            const int16_t disarmed = read16();
            if (i < MAX_SUPPORTED_MOTORS) {
                motor_disarmed[i] = disarmed;
            }
        }
        break;
    case MSP_SET_SERVO_CONFIGURATION:
#ifdef USE_SERVOS
        if (currentPort->dataSize != 1 + sizeof(servoParam_t)) {
            headSerialError(0);
            break;
        }
        i = read8();
        if (i >= MAX_SUPPORTED_SERVOS) {
            headSerialError(0);
        } else {
            currentProfile->servoConf[i].min = read16();
            currentProfile->servoConf[i].max = read16();
            currentProfile->servoConf[i].middle = read16();
            currentProfile->servoConf[i].rate = read8();
            currentProfile->servoConf[i].angleAtMin = read8();
            currentProfile->servoConf[i].angleAtMax = read8();
            currentProfile->servoConf[i].forwardFromChannel = read8();
            currentProfile->servoConf[i].reversedSources = read32();
        }
#endif
        break;
        
    case MSP_SET_SERVO_MIX_RULE:
#ifdef USE_SERVOS
        i = read8();
        if (i >= MAX_SERVO_RULES) {
            headSerialError(0);
        } else {
            masterConfig.customServoMixer[i].targetChannel = read8();
            masterConfig.customServoMixer[i].inputSource = read8();
            masterConfig.customServoMixer[i].rate = read8();
            masterConfig.customServoMixer[i].speed = read8();
            masterConfig.customServoMixer[i].min = read8();
            masterConfig.customServoMixer[i].max = read8();
            masterConfig.customServoMixer[i].box = read8();
            loadCustomServoMixer();
        }
#endif
        break;

    case MSP_SET_3D:
        masterConfig.flight3DConfig.deadband3d_low = read16();
        masterConfig.flight3DConfig.deadband3d_high = read16();
        masterConfig.flight3DConfig.neutral3d = read16();
        masterConfig.flight3DConfig.deadband3d_throttle = read16();
        break;

    case MSP_SET_RC_DEADBAND:
        currentProfile->rcControlsConfig.deadband = read8();
        currentProfile->rcControlsConfig.yaw_deadband = read8();
        currentProfile->rcControlsConfig.alt_hold_deadband = read8();
        break;

    case MSP_SET_RESET_CURR_PID:
        resetPidProfile(&currentProfile->pidProfile);
        break;    

    case MSP_SET_SENSOR_ALIGNMENT:
        masterConfig.sensorAlignmentConfig.gyro_align = read8();
        masterConfig.sensorAlignmentConfig.acc_align = read8();
        masterConfig.sensorAlignmentConfig.mag_align = read8();
        break;
        
    case MSP_RESET_CONF:
        if (!ARMING_FLAG(ARMED)) {
            resetEEPROM();
            readEEPROM();
        }
        break;
    case MSP_ACC_CALIBRATION:
        if (!ARMING_FLAG(ARMED))
            accSetCalibrationCycles(CALIBRATING_ACC_CYCLES);
        break;
    case MSP_MAG_CALIBRATION:
        if (!ARMING_FLAG(ARMED))
            ENABLE_STATE(CALIBRATE_MAG);
        break;
    case MSP_EEPROM_WRITE:
        if (ARMING_FLAG(ARMED)) {
            headSerialError(0);
            return true;
        }
        writeEEPROM();
        readEEPROM();
        break;

#ifdef BLACKBOX
    case MSP_SET_BLACKBOX_CONFIG:
        // Don't allow config to be updated while Blackbox is logging
        if (blackboxMayEditConfig()) {
            masterConfig.blackbox_device = read8();
            masterConfig.blackbox_rate_num = read8();
            masterConfig.blackbox_rate_denom = read8();
        }
        break;
#endif

#ifdef TRANSPONDER
    case MSP_SET_TRANSPONDER_CONFIG:
        if (currentPort->dataSize != sizeof(masterConfig.transponderData)) {
            headSerialError(0);
            break;
        }

        for (i = 0; i < sizeof(masterConfig.transponderData); i++) {
            masterConfig.transponderData[i] = read8();
        }

        transponderUpdateData(masterConfig.transponderData);
        break;
#endif

#ifdef USE_FLASHFS
    case MSP_DATAFLASH_ERASE:
        flashfsEraseCompletely();
        break;
#endif

#ifdef GPS
    case MSP_SET_RAW_GPS:
        if (read8()) {
            ENABLE_STATE(GPS_FIX);
        } else {
            DISABLE_STATE(GPS_FIX);
        }
        GPS_numSat = read8();
        GPS_coord[LAT] = read32();
        GPS_coord[LON] = read32();
        GPS_altitude = read16();
        GPS_speed = read16();
        GPS_update |= 2;        // New data signalisation to GPS functions // FIXME Magic Numbers
        break;
    case MSP_SET_WP:
        wp_no = read8();    //get the wp number
        lat = read32();
        lon = read32();
        alt = read32();     // to set altitude (cm)
        read16();           // future: to set heading (deg)
        read16();           // future: to set time to stay (ms)
        read8();            // future: to set nav flag
        if (wp_no == 0) {
            GPS_home[LAT] = lat;
            GPS_home[LON] = lon;
            DISABLE_FLIGHT_MODE(GPS_HOME_MODE);        // with this flag, GPS_set_next_wp will be called in the next loop -- OK with SERIAL GPS / OK with I2C GPS
            ENABLE_STATE(GPS_FIX_HOME);
            if (alt != 0)
                AltHold = alt;          // temporary implementation to test feature with apps
        } else if (wp_no == 16) {       // OK with SERIAL GPS  --  NOK for I2C GPS / needs more code dev in order to inject GPS coord inside I2C GPS
            GPS_hold[LAT] = lat;
            GPS_hold[LON] = lon;
            if (alt != 0)
                AltHold = alt;          // temporary implementation to test feature with apps
            nav_mode = NAV_MODE_WP;
            GPS_set_next_wp(&GPS_hold[LAT], &GPS_hold[LON]);
        }
        break;
#endif
    case MSP_SET_FEATURE:
        featureClearAll();
        featureSet(read32()); // features bitmap
        break;

    case MSP_SET_BOARD_ALIGNMENT:
        masterConfig.boardAlignment.rollDegrees = read16();
        masterConfig.boardAlignment.pitchDegrees = read16();
        masterConfig.boardAlignment.yawDegrees = read16();
        break;

    case MSP_SET_VOLTAGE_METER_CONFIG:
        masterConfig.batteryConfig.vbatscale = read8();           // actual vbatscale as intended
        masterConfig.batteryConfig.vbatmincellvoltage = read8();  // vbatlevel_warn1 in MWC2.3 GUI
        masterConfig.batteryConfig.vbatmaxcellvoltage = read8();  // vbatlevel_warn2 in MWC2.3 GUI
        masterConfig.batteryConfig.vbatwarningcellvoltage = read8();  // vbatlevel when buzzer starts to alert
        break;

    case MSP_SET_CURRENT_METER_CONFIG:
        masterConfig.batteryConfig.currentMeterScale = read16();
        masterConfig.batteryConfig.currentMeterOffset = read16();
        masterConfig.batteryConfig.currentMeterType = read8();
        masterConfig.batteryConfig.batteryCapacity = read16();
        break;

#ifndef USE_QUAD_MIXER_ONLY
    case MSP_SET_MIXER:
        masterConfig.mixerMode = read8();
        break;
#endif

    case MSP_SET_RX_CONFIG:
        masterConfig.rxConfig.serialrx_provider = read8();
        masterConfig.rxConfig.maxcheck = read16();
        masterConfig.rxConfig.midrc = read16();
        masterConfig.rxConfig.mincheck = read16();
        masterConfig.rxConfig.spektrum_sat_bind = read8();
        if (currentPort->dataSize > 8) {
            masterConfig.rxConfig.rx_min_usec = read16();
            masterConfig.rxConfig.rx_max_usec = read16();
        }
        break;

    case MSP_SET_FAILSAFE_CONFIG:
        masterConfig.failsafeConfig.failsafe_delay = read8();
        masterConfig.failsafeConfig.failsafe_off_delay = read8();
        masterConfig.failsafeConfig.failsafe_throttle = read16();
        masterConfig.failsafeConfig.failsafe_kill_switch = read8();
        masterConfig.failsafeConfig.failsafe_throttle_low_delay = read16();
        masterConfig.failsafeConfig.failsafe_procedure = read8();
        break;

    case MSP_SET_RXFAIL_CONFIG:
        i = read8();
        if (i < MAX_SUPPORTED_RC_CHANNEL_COUNT) {
            masterConfig.rxConfig.failsafe_channel_configurations[i].mode = read8();
            masterConfig.rxConfig.failsafe_channel_configurations[i].step = CHANNEL_VALUE_TO_RXFAIL_STEP(read16());
        } else {
            headSerialError(0);
        }
        break;

    case MSP_SET_RSSI_CONFIG:
        masterConfig.rxConfig.rssi_channel = read8();
        break;

    case MSP_SET_RX_MAP:
        for (i = 0; i < MAX_MAPPABLE_RX_INPUTS; i++) {
            masterConfig.rxConfig.rcmap[i] = read8();
        }
        break;

    case MSP_SET_BF_CONFIG:

#ifdef USE_QUAD_MIXER_ONLY
        read8(); // mixerMode ignored
#else
        masterConfig.mixerMode = read8(); // mixerMode
#endif

        featureClearAll();
        featureSet(read32()); // features bitmap

        masterConfig.rxConfig.serialrx_provider = read8(); // serialrx_type

        masterConfig.boardAlignment.rollDegrees = read16(); // board_align_roll
        masterConfig.boardAlignment.pitchDegrees = read16(); // board_align_pitch
        masterConfig.boardAlignment.yawDegrees = read16(); // board_align_yaw

        masterConfig.batteryConfig.currentMeterScale = read16();
        masterConfig.batteryConfig.currentMeterOffset = read16();
        break;

    case MSP_SET_CF_SERIAL_CONFIG:
        {
            uint8_t portConfigSize = sizeof(uint8_t) + sizeof(uint16_t) + (sizeof(uint8_t) * 4);

            if (currentPort->dataSize % portConfigSize != 0) {
                headSerialError(0);
                break;
            }

            uint8_t remainingPortsInPacket = currentPort->dataSize / portConfigSize;

            while (remainingPortsInPacket--) {
                uint8_t identifier = read8();

                serialPortConfig_t *portConfig = serialFindPortConfiguration(identifier);
                if (!portConfig) {
                    headSerialError(0);
                    break;
                }

                portConfig->identifier = identifier;
                portConfig->functionMask = read16();
                portConfig->msp_baudrateIndex = read8();
                portConfig->gps_baudrateIndex = read8();
                portConfig->telemetry_baudrateIndex = read8();
                portConfig->blackbox_baudrateIndex = read8();
            }
        }
        break;

#ifdef LED_STRIP
    case MSP_SET_LED_COLORS:
        for (i = 0; i < CONFIGURABLE_COLOR_COUNT; i++) {
            hsvColor_t *color = &masterConfig.colors[i];
            color->h = read16();
            color->s = read8();
            color->v = read8();
        }
        break;

    case MSP_SET_LED_STRIP_CONFIG:
        {
            i = read8();
            if (i >= MAX_LED_STRIP_LENGTH || currentPort->dataSize != (1 + 7)) {
                headSerialError(0);
                break;
            }
            ledConfig_t *ledConfig = &masterConfig.ledConfigs[i];
            uint16_t mask;
            // currently we're storing directions and functions in a uint16 (flags)
            // the msp uses 2 x uint16_t to cater for future expansion
            mask = read16();
            ledConfig->flags = (mask << LED_DIRECTION_BIT_OFFSET) & LED_DIRECTION_MASK;

            mask = read16();
            ledConfig->flags |= (mask << LED_FUNCTION_BIT_OFFSET) & LED_FUNCTION_MASK;

            mask = read8();
            ledConfig->xy = CALCULATE_LED_X(mask);

            mask = read8();
            ledConfig->xy |= CALCULATE_LED_Y(mask);

            ledConfig->color = read8();

            reevalulateLedConfig();
        }
        break;
#endif
    case MSP_REBOOT:
        isRebootScheduled = true;
        break;

#ifdef USE_SERIAL_1WIRE
    case MSP_SET_1WIRE:
        // get channel number
        i = read8();
        // we do not give any data back, assume channel number is transmitted OK
        if (i == 0xFF) {
            // 0xFF -> preinitialize the Passthrough
            // switch all motor lines HI
            usb1WireInitialize();
            // reply the count of ESC found
            headSerialReply(1);
            serialize8(escCount);

            // and come back right afterwards
            // rem: App: Wait at least appx. 500 ms for BLHeli to jump into
            // bootloader mode before try to connect any ESC

            return true;
        }
        else {
            // Check for channel number 0..ESC_COUNT-1
            if (i < escCount) {
                // because we do not come back after calling usb1WirePassthrough
                // proceed with a success reply first
                headSerialReply(0);
                tailSerialReply();
                // flush the transmit buffer
                bufWriterFlush(writer);
                // wait for all data to send
                waitForSerialPortToFinishTransmitting(currentPort->port);
                // Start to activate here
                // motor 1 => index 0
                
                // search currentPort portIndex
                /* next lines seems to be unnecessary, because the currentPort always point to the same mspPorts[portIndex]
                uint8_t portIndex;	
				for (portIndex = 0; portIndex < MAX_MSP_PORT_COUNT; portIndex++) {
					if (currentPort == &mspPorts[portIndex]) {
						break;
					}
				}
				*/
                mspReleasePortIfAllocated(mspSerialPort); // CloseSerialPort also marks currentPort as UNUSED_PORT
                usb1WirePassthrough(i);
                // Wait a bit more to let App read the 0 byte and switch baudrate
                // 2ms will most likely do the job, but give some grace time
                delay(10);
                // rebuild/refill currentPort structure, does openSerialPort if marked UNUSED_PORT - used ports are skiped
                mspAllocateSerialPorts(&masterConfig.serialConfig);
                /* restore currentPort and mspSerialPort
                setCurrentPort(&mspPorts[portIndex]); // not needed same index will be restored
                */ 
                // former used MSP uart is active again
                // restore MSP_SET_1WIRE as current command for correct headSerialReply(0)
                currentPort->cmdMSP = MSP_SET_1WIRE;
            } else {
                // ESC channel higher than max. allowed
                // rem: BLHeliSuite will not support more than 8
                headSerialError(0);
            }
            // proceed as usual with MSP commands
            // and wait to switch to next channel
            // rem: App needs to call MSP_BOOT to deinitialize Passthrough
        }
        break;
#endif
    default:
        // we do not know how to handle the (valid) message, indicate error MSP $M!
        return false;
    }
    headSerialReply(0);
    return true;
}

STATIC_UNIT_TESTED void mspProcessReceivedCommand() {
    if (!(processOutCommand(currentPort->cmdMSP) || processInCommand())) {
        headSerialError(0);
    }
    tailSerialReply();
    currentPort->c_state = IDLE;
}

static bool mspProcessReceivedData(uint8_t c)
{
    if (currentPort->c_state == IDLE) {
        if (c == '$') {
            currentPort->c_state = HEADER_START;
        } else {
            return false;
        }
    } else if (currentPort->c_state == HEADER_START) {
        currentPort->c_state = (c == 'M') ? HEADER_M : IDLE;
    } else if (currentPort->c_state == HEADER_M) {
        currentPort->c_state = (c == '<') ? HEADER_ARROW : IDLE;
    } else if (currentPort->c_state == HEADER_ARROW) {
        if (c > MSP_PORT_INBUF_SIZE) {
            currentPort->c_state = IDLE;

        } else {
            currentPort->dataSize = c;
            currentPort->offset = 0;
            currentPort->checksum = 0;
            currentPort->indRX = 0;
            currentPort->checksum ^= c;
            currentPort->c_state = HEADER_SIZE;
        }
    } else if (currentPort->c_state == HEADER_SIZE) {
        currentPort->cmdMSP = c;
        currentPort->checksum ^= c;
        currentPort->c_state = HEADER_CMD;
    } else if (currentPort->c_state == HEADER_CMD && currentPort->offset < currentPort->dataSize) {
        currentPort->checksum ^= c;
        currentPort->inBuf[currentPort->offset++] = c;
    } else if (currentPort->c_state == HEADER_CMD && currentPort->offset >= currentPort->dataSize) {
        if (currentPort->checksum == c) {
            currentPort->c_state = COMMAND_RECEIVED;
        } else {
            currentPort->c_state = IDLE;
        }
    }
    return true;
}

STATIC_UNIT_TESTED void setCurrentPort(mspPort_t *port)
{
    currentPort = port;
    mspSerialPort = currentPort->port;
}

void mspProcess(void)
{
    uint8_t portIndex;
    mspPort_t *candidatePort;

    for (portIndex = 0; portIndex < MAX_MSP_PORT_COUNT; portIndex++) {
        candidatePort = &mspPorts[portIndex];
        if (!candidatePort->port) {
            continue;
        }

        setCurrentPort(candidatePort);
        // Big enough to fit a MSP_STATUS in one write.
        uint8_t buf[sizeof(bufWriter_t) + 20];
        writer = bufWriterInit(buf, sizeof(buf),
                               (bufWrite_t)serialWriteBufShim, currentPort->port);

        while (serialRxBytesWaiting(mspSerialPort)) {

            uint8_t c = serialRead(mspSerialPort);
            bool consumed = mspProcessReceivedData(c);

            if (!consumed && !ARMING_FLAG(ARMED)) {
                evaluateOtherData(mspSerialPort, c);
            }

            if (currentPort->c_state == COMMAND_RECEIVED) {
                mspProcessReceivedCommand();
                break; // process one command at a time so as not to block.
            }
        }

        bufWriterFlush(writer);

        if (isRebootScheduled) {
            waitForSerialPortToFinishTransmitting(candidatePort->port);
            stopMotors();
            handleOneshotFeatureChangeOnRestart();
            systemReset();
        }
    }
}
