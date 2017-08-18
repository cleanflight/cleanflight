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
 * Initial FrSky Telemetry implementation by silpstream @ rcgroups.
 * Addition protocol work by airmamaf @ github.
 */

#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#include "platform.h"

#ifdef TELEMETRY

#include "common/maths.h"
#include "common/axis.h"
#include "common/utils.h"

#include "config/feature.h"
#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/accgyro/accgyro.h"
#include "drivers/sensor.h"
#include "drivers/serial.h"
#include "drivers/time.h"

#include "fc/config.h"
#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

#include "sensors/sensors.h"
#include "sensors/acceleration.h"
#include "sensors/gyro.h"
#include "sensors/barometer.h"
#include "sensors/battery.h"

#include "io/serial.h"
#include "io/gps.h"

#include "flight/mixer.h"
#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/altitude.h"

#include "rx/rx.h"

#include "telemetry/telemetry.h"
#include "telemetry/frsky.h"

#ifdef USE_ESC_SENSOR
#include "sensors/esc_sensor.h"
#endif

static serialPort_t *frskyPort = NULL;
static serialPortConfig_t *portConfig = NULL;

#define FRSKY_BAUDRATE 9600
#define FRSKY_INITIAL_PORT_MODE MODE_TX

static portSharing_e frskyPortSharing;

static frSkyTelemetryWriteFn *frSkyTelemetryWrite = NULL;
static frSkyTelemetryInitFrameFn *frSkyTelemetryInitFrame = NULL;

#define CYCLETIME             125

#define PROTOCOL_HEADER       0x5E
#define PROTOCOL_TAIL         0x5E

// Data Ids  (bp = before decimal point; af = after decimal point)
// Official data IDs
#define ID_GPS_ALTIDUTE_BP    0x01
#define ID_GPS_ALTIDUTE_AP    0x09
#define ID_TEMPRATURE1        0x02
#define ID_RPM                0x03
#define ID_FUEL_LEVEL         0x04
#define ID_TEMPRATURE2        0x05
#define ID_VOLT               0x06
#define ID_ALTITUDE_BP        0x10
#define ID_ALTITUDE_AP        0x21
#define ID_GPS_SPEED_BP       0x11
#define ID_GPS_SPEED_AP       0x19
#define ID_LONGITUDE_BP       0x12
#define ID_LONGITUDE_AP       0x1A
#define ID_E_W                0x22
#define ID_LATITUDE_BP        0x13
#define ID_LATITUDE_AP        0x1B
#define ID_N_S                0x23
#define ID_COURSE_BP          0x14
#define ID_COURSE_AP          0x1C
#define ID_DATE_MONTH         0x15
#define ID_YEAR               0x16
#define ID_HOUR_MINUTE        0x17
#define ID_SECOND             0x18
#define ID_ACC_X              0x24
#define ID_ACC_Y              0x25
#define ID_ACC_Z              0x26
#define ID_VOLTAGE_AMP        0x39
#define ID_VOLTAGE_AMP_BP     0x3A
#define ID_VOLTAGE_AMP_AP     0x3B
#define ID_CURRENT            0x28
// User defined data IDs
#define ID_GYRO_X             0x40
#define ID_GYRO_Y             0x41
#define ID_GYRO_Z             0x42

#define ID_VERT_SPEED         0x30 //opentx vario

#define GPS_BAD_QUALITY       300
#define GPS_MAX_HDOP_VAL      9999
#define DELAY_FOR_BARO_INITIALISATION (5 * 1000) //5s
#define BLADE_NUMBER_DIVIDER  5 // should set 12 blades in Taranis

static uint32_t lastCycleTime = 0;
static uint8_t cycleNum = 0;

static void sendDataHead(uint8_t id)
{
    frSkyTelemetryWrite(PROTOCOL_HEADER);
    frSkyTelemetryWrite(id);
}

static void sendTelemetryTail(void)
{
    frSkyTelemetryWrite(PROTOCOL_TAIL);
}

static void serializeFrsky(uint8_t data)
{
    // take care of byte stuffing
    if (data == 0x5e) {
        frSkyTelemetryWrite(0x5d);
        frSkyTelemetryWrite(0x3e);
    } else if (data == 0x5d) {
        frSkyTelemetryWrite(0x5d);
        frSkyTelemetryWrite(0x3d);
    } else{
        frSkyTelemetryWrite(data);
    }
}

static void serialize16(int16_t a)
{
    uint8_t t;
    t = a;
    serializeFrsky(t);
    t = a >> 8 & 0xff;
    serializeFrsky(t);
}

static void sendAccel(void)
{
    int i;

    for (i = 0; i < 3; i++) {
        sendDataHead(ID_ACC_X + i);
        serialize16(((float)acc.accSmooth[i] / acc.dev.acc_1G) * 1000);
    }
}

static void sendBaro(void)
{
    sendDataHead(ID_ALTITUDE_BP);
    serialize16(getEstimatedAltitude() / 100);
    sendDataHead(ID_ALTITUDE_AP);
    serialize16(ABS(getEstimatedAltitude() % 100));
}

#ifdef GPS
static void sendGpsAltitude(void)
{
    uint16_t altitude = gpsSol.llh.alt;
    //Send real GPS altitude only if it's reliable (there's a GPS fix)
    if (!STATE(GPS_FIX)) {
        altitude = 0;
    }
    sendDataHead(ID_GPS_ALTIDUTE_BP);
    serialize16(altitude);
    sendDataHead(ID_GPS_ALTIDUTE_AP);
    serialize16(0);
}
#endif

static void sendThrottleOrBatterySizeAsRpm(void)
{
    sendDataHead(ID_RPM);
#ifdef USE_ESC_SENSOR
    escSensorData_t *escData = getEscSensorData(ESC_SENSOR_COMBINED);
    serialize16(escData->dataAge < ESC_DATA_INVALID ? escData->rpm : 0);
#else
    if (ARMING_FLAG(ARMED)) {
        const throttleStatus_e throttleStatus = calculateThrottleStatus();
        uint16_t throttleForRPM = rcCommand[THROTTLE] / BLADE_NUMBER_DIVIDER;
        if (throttleStatus == THROTTLE_LOW && feature(FEATURE_MOTOR_STOP))
                    throttleForRPM = 0;
        serialize16(throttleForRPM);
    } else {
        serialize16((batteryConfig()->batteryCapacity / BLADE_NUMBER_DIVIDER));
    }
#endif
}

static void sendTemperature1(void)
{
    sendDataHead(ID_TEMPRATURE1);
#if defined(USE_ESC_SENSOR)
    escSensorData_t *escData = getEscSensorData(ESC_SENSOR_COMBINED);
    serialize16(escData->dataAge < ESC_DATA_INVALID ? escData->temperature : 0);
#elif defined(BARO)
    serialize16((baro.baroTemperature + 50)/ 100); //Airmamaf
#else
    serialize16(gyroGetTemperature() / 10);
#endif
}

#ifdef GPS
static void sendSatalliteSignalQualityAsTemperature2(void)
{
    uint16_t satellite = gpsSol.numSat;
    if (gpsSol.hdop > GPS_BAD_QUALITY && ( (cycleNum % 16 ) < 8)) {//Every 1s
        satellite = constrain(gpsSol.hdop, 0, GPS_MAX_HDOP_VAL);
    }
    sendDataHead(ID_TEMPRATURE2);

    if (telemetryConfig()->frsky_unit == FRSKY_UNIT_METRICS) {
        serialize16(satellite);
    } else {
        float tmp = (satellite - 32) / 1.8f;
        //Round the value
        tmp += (tmp < 0) ? -0.5f : 0.5f;
        serialize16(tmp);
    }
}

static void sendSpeed(void)
{
    if (!STATE(GPS_FIX)) {
        return;
    }
    //Speed should be sent in knots (GPS speed is in cm/s)
    sendDataHead(ID_GPS_SPEED_BP);
    //convert to knots: 1cm/s = 0.0194384449 knots
    serialize16(gpsSol.groundSpeed * 1944 / 100000);
    sendDataHead(ID_GPS_SPEED_AP);
    serialize16((gpsSol.groundSpeed * 1944 / 100) % 100);
}
#endif

static void sendTime(void)
{
    uint32_t seconds = millis() / 1000;
    uint8_t minutes = (seconds / 60) % 60;

    // if we fly for more than an hour, something's wrong anyway
    sendDataHead(ID_HOUR_MINUTE);
    serialize16(minutes << 8);
    sendDataHead(ID_SECOND);
    serialize16(seconds % 60);
}

// Frsky pdf: dddmm.mmmm
// .mmmm is returned in decimal fraction of minutes.
static void GPStoDDDMM_MMMM(int32_t mwiigps, gpsCoordinateDDDMMmmmm_t *result)
{
    int32_t absgps, deg, min;
    absgps = ABS(mwiigps);
    deg    = absgps / GPS_DEGREES_DIVIDER;
    absgps = (absgps - deg * GPS_DEGREES_DIVIDER) * 60;        // absgps = Minutes left * 10^7
    min    = absgps / GPS_DEGREES_DIVIDER;                     // minutes left

    if (telemetryConfig()->frsky_coordinate_format == FRSKY_FORMAT_DMS) {
        result->dddmm = deg * 100 + min;
    } else {
        result->dddmm = deg * 60 + min;
    }

    result->mmmm  = (absgps - min * GPS_DEGREES_DIVIDER) / 1000;
}

static void sendLatLong(int32_t coord[2])
{
    gpsCoordinateDDDMMmmmm_t coordinate;
    GPStoDDDMM_MMMM(coord[LAT], &coordinate);
    sendDataHead(ID_LATITUDE_BP);
    serialize16(coordinate.dddmm);
    sendDataHead(ID_LATITUDE_AP);
    serialize16(coordinate.mmmm);
    sendDataHead(ID_N_S);
    serialize16(coord[LAT] < 0 ? 'S' : 'N');

    GPStoDDDMM_MMMM(coord[LON], &coordinate);
    sendDataHead(ID_LONGITUDE_BP);
    serialize16(coordinate.dddmm);
    sendDataHead(ID_LONGITUDE_AP);
    serialize16(coordinate.mmmm);
    sendDataHead(ID_E_W);
    serialize16(coord[LON] < 0 ? 'W' : 'E');
}

static void sendFakeLatLongThatAllowsHeadingDisplay(void)
{
    // Heading is only displayed on OpenTX if non-zero lat/long is also sent
    int32_t coord[2] = {
        1 * GPS_DEGREES_DIVIDER,
        1 * GPS_DEGREES_DIVIDER
    };

    sendLatLong(coord);
}

#ifdef GPS
static void sendFakeLatLong(void)
{
    // Heading is only displayed on OpenTX if non-zero lat/long is also sent
    int32_t coord[2] = {0,0};

    coord[LAT] = ((0.01f * telemetryConfig()->gpsNoFixLatitude) * GPS_DEGREES_DIVIDER);
    coord[LON] = ((0.01f * telemetryConfig()->gpsNoFixLongitude) * GPS_DEGREES_DIVIDER);

    sendLatLong(coord);
}

static void sendGPSLatLong(void)
{
    static uint8_t gpsFixOccured = 0;
    int32_t coord[2] = {0,0};

    if (STATE(GPS_FIX) || gpsFixOccured == 1) {
        // If we have ever had a fix, send the last known lat/long
        gpsFixOccured = 1;
        coord[LAT] = gpsSol.llh.lat;
        coord[LON] = gpsSol.llh.lon;
        sendLatLong(coord);
    } else {
        // otherwise send fake lat/long in order to display compass value
        sendFakeLatLong();
    }
}
#endif

/*
 * Send vertical speed for opentx. ID_VERT_SPEED
 * Unit is cm/s
 */
static void sendVario(void)
{
    sendDataHead(ID_VERT_SPEED);
    serialize16(getEstimatedVario());
}

/*
 * Send voltage via ID_VOLT
 *
 * NOTE: This sends voltage divided by batteryCellCount. To get the real
 * battery voltage, you need to multiply the value by batteryCellCount.
 */
static void sendVoltage(void)
{
    static uint16_t currentCell = 0;
    uint32_t cellVoltage;
    uint16_t payload;

    uint8_t cellCount = getBatteryCellCount();
    /*
     * Format for Voltage Data for single cells is like this:
     *
     *  llll llll cccc hhhh
     *  l: Low voltage bits
     *  h: High voltage bits
     *  c: Cell number (starting at 0)
     *
     * The actual value sent for cell voltage has resolution of 0.002 volts
     * Since vbat has resolution of 0.1 volts it has to be multiplied by 50
     */
    cellVoltage = ((uint32_t)getBatteryVoltage() * 100 + cellCount) / (cellCount * 2);

    // Cell number is at bit 9-12
    payload = (currentCell << 4);

    // Lower voltage bits are at bit 0-8
    payload |= ((cellVoltage & 0x0ff) << 8);

    // Higher voltage bits are at bits 13-15
    payload |= ((cellVoltage & 0xf00) >> 8);

    sendDataHead(ID_VOLT);
    serialize16(payload);

    currentCell++;
    currentCell %= cellCount;
}

/*
 * Send voltage with ID_VOLTAGE_AMP
 */
static void sendVoltageAmp(void)
{
    uint16_t batteryVoltage = getBatteryVoltage();
    if (telemetryConfig()->frsky_vfas_precision == FRSKY_VFAS_PRECISION_HIGH) {
        /*
         * Use new ID 0x39 to send voltage directly in 0.1 volts resolution
         */
        sendDataHead(ID_VOLTAGE_AMP);
        serialize16(batteryVoltage);
    } else {
        uint16_t voltage = (batteryVoltage * 110) / 21;
        uint16_t vfasVoltage;
        if (telemetryConfig()->report_cell_voltage) {
            vfasVoltage = voltage / getBatteryCellCount();
        } else {
            vfasVoltage = voltage;
        }
        sendDataHead(ID_VOLTAGE_AMP_BP);
        serialize16(vfasVoltage / 100);
        sendDataHead(ID_VOLTAGE_AMP_AP);
        serialize16(((vfasVoltage % 100) + 5) / 10);
    }
}

static void sendAmperage(void)
{
    sendDataHead(ID_CURRENT);
    serialize16((uint16_t)(getAmperage() / 10));
}

static void sendFuelLevel(void)
{
    sendDataHead(ID_FUEL_LEVEL);

    if (batteryConfig()->batteryCapacity > 0) {
        serialize16((uint16_t)calculateBatteryPercentageRemaining());
    } else {
        serialize16((uint16_t)constrain(getMAhDrawn(), 0, 0xFFFF));
    }
}

static void sendHeading(void)
{
    sendDataHead(ID_COURSE_BP);
    serialize16(DECIDEGREES_TO_DEGREES(attitude.values.yaw));
    sendDataHead(ID_COURSE_AP);
    serialize16(0);
}

void frSkyTelemetryWriteSerial(uint8_t ch)
{
    serialWrite(frskyPort, ch);
}


void initFrSkyTelemetry(void)
{
    portConfig = findSerialPortConfig(FUNCTION_TELEMETRY_FRSKY);
    frskyPortSharing = determinePortSharing(portConfig, FUNCTION_TELEMETRY_FRSKY);
}

void initFrSkyExternalTelemetry(frSkyTelemetryInitFrameFn *frSkyTelemetryInitFrameExternal, frSkyTelemetryWriteFn *frSkyTelemetryWriteExternal)
{
    frSkyTelemetryInitFrame = frSkyTelemetryInitFrameExternal;
    frSkyTelemetryWrite = frSkyTelemetryWriteExternal;
}

void deinitFrSkyExternalTelemetry(void)
{
    frSkyTelemetryInitFrame = NULL;
    frSkyTelemetryWrite = NULL;
}

void freeFrSkyTelemetryPort(void)
{
    if (frskyPort) {
        closeSerialPort(frskyPort);
        frskyPort = NULL;
        frSkyTelemetryWrite = NULL;
    }
}

static void configureFrSkyTelemetryPort(void)
{
    if (portConfig) {
        frskyPort = openSerialPort(portConfig->identifier, FUNCTION_TELEMETRY_FRSKY, NULL, FRSKY_BAUDRATE, FRSKY_INITIAL_PORT_MODE, telemetryConfig()->telemetry_inverted ? SERIAL_NOT_INVERTED : SERIAL_INVERTED);
        if (!frskyPort) {
            return;
        }

        frSkyTelemetryWrite = frSkyTelemetryWriteSerial;
    }
}

bool hasEnoughTimeLapsedSinceLastTelemetryTransmission(uint32_t currentMillis)
{
    return currentMillis - lastCycleTime >= CYCLETIME;
}

bool checkFrSkySerialTelemetryEnabled(void)
{
    return frSkyTelemetryWrite == &frSkyTelemetryWriteSerial;
}

void checkFrSkyTelemetryState(void)
{
    if (portConfig) {
        if (telemetryCheckRxPortShared(portConfig)) {
            if (!checkFrSkySerialTelemetryEnabled() && telemetrySharedPort != NULL) {
                frskyPort = telemetrySharedPort;
                frSkyTelemetryWrite = &frSkyTelemetryWriteSerial;
            }
        } else {
            bool newTelemetryEnabledValue = telemetryDetermineEnabledState(frskyPortSharing);

            if (newTelemetryEnabledValue == checkFrSkySerialTelemetryEnabled()) {
                return;
            }

            if (newTelemetryEnabledValue) {
                configureFrSkyTelemetryPort();
            } else {
                freeFrSkyTelemetryPort();
            }
        }
    }
}

void handleFrSkyTelemetry(void)
{
    if (frSkyTelemetryWrite == NULL) {
        return;
    }

    uint32_t now = millis();

    if (!hasEnoughTimeLapsedSinceLastTelemetryTransmission(now)) {
        return;
    }

    lastCycleTime = now;

    cycleNum++;

    if (frSkyTelemetryInitFrame) {
        frSkyTelemetryInitFrame();
    }

    // Sent every 125ms
    sendAccel();
    sendVario();
    sendTelemetryTail();

    if ((cycleNum % 4) == 0) {      // Sent every 500ms
        if (lastCycleTime > DELAY_FOR_BARO_INITIALISATION) { //Allow 5s to boot correctly
            sendBaro();
        }
        sendHeading();
        sendTelemetryTail();
    }

    if ((cycleNum % 8) == 0) {      // Sent every 1s
        sendTemperature1();
        sendThrottleOrBatterySizeAsRpm();

        if (batteryConfig()->voltageMeterSource != VOLTAGE_METER_NONE && getBatteryCellCount() > 0) {
            sendVoltage();
            sendVoltageAmp();
            sendAmperage();
            sendFuelLevel();
        }

#ifdef GPS
        if (sensors(SENSOR_GPS)) {
            sendSpeed();
            sendGpsAltitude();
            sendSatalliteSignalQualityAsTemperature2();
            sendGPSLatLong();
        }
        else {
            sendFakeLatLongThatAllowsHeadingDisplay();
        }
#else
        sendFakeLatLongThatAllowsHeadingDisplay();
#endif

        sendTelemetryTail();
    }

    if (cycleNum == 40) {     //Frame 3: Sent every 5s
        cycleNum = 0;
        sendTime();
        sendTelemetryTail();
    }
}

#endif
