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
 *
 * FlySky iBus telemetry implementation by CraigJPerry.
 * Unit tests and some additions by Unitware
 *
 * Many thanks to Dave Borthwick's iBus telemetry dongle converter for
 * PIC 12F1572 (also distributed under GPLv3) which was referenced to
 * clarify the protocol.
 */

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "platform.h"

#if defined(TELEMETRY) && defined(TELEMETRY_IBUS)

#include "common/axis.h"

#include "common/utils.h"

#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/accgyro/accgyro.h"
#include "drivers/sensor.h"
#include "drivers/serial.h"

#include "fc/rc_controls.h"

#include "io/serial.h"

#include "sensors/acceleration.h"
#include "sensors/battery.h"
#include "sensors/barometer.h"
#include "sensors/gyro.h"
#include "sensors/sensors.h"

#include "scheduler/scheduler.h"

#include "telemetry/ibus.h"
#include "telemetry/ibus_shared.h"
#include "telemetry/telemetry.h"

static serialPort_t *ibusSerialPort = NULL;
static serialPortConfig_t *ibusSerialPortConfig;

/* The sent bytes will be echoed back since Tx and Rx are wired together, this counter
 * will keep track of how many rx chars that shall be discarded */
static uint8_t outboundBytesToIgnoreOnRxCount = 0;

static bool ibusTelemetryEnabled = false;
static portSharing_e ibusPortSharing;

static uint8_t ibusReceiveBuffer[IBUS_RX_BUF_LEN] = { 0x0 };

static void pushOntoTail(uint8_t buffer[IBUS_MIN_LEN], size_t bufferLength, uint8_t value)
{
    memmove(buffer, buffer + 1, bufferLength - 1);
    ibusReceiveBuffer[bufferLength - 1] = value;
}

void initIbusTelemetry(void)
{
    ibusSerialPortConfig = findSerialPortConfig(FUNCTION_TELEMETRY_IBUS);
    uint8_t type = telemetryConfig()->ibusTelemetryType;
    uint8_t speed = type & 0x80;
    type = type & 0x7F;
    if (type == 3) {
        changeTypeIbusTelemetry(3, IBUS_MEAS_TYPE_S85, IBUS_MEAS_VALUE_STATUS);
        changeTypeIbusTelemetry(4, IBUS_MEAS_TYPE_ACC_Z, IBUS_MEAS_VALUE_ACC_Z);
        changeTypeIbusTelemetry(5, IBUS_MEAS_TYPE_CURRENT, IBUS_MEAS_VALUE_CURRENT);
        changeTypeIbusTelemetry(6, IBUS_MEAS_TYPE_ALT, IBUS_MEAS_VALUE_ALT);
        changeTypeIbusTelemetry(7, IBUS_MEAS_TYPE_HEADING, IBUS_MEAS_VALUE_HEADING);
        changeTypeIbusTelemetry(8, IBUS_MEAS_TYPE_DIST, IBUS_MEAS_VALUE_DIST);
        changeTypeIbusTelemetry(9, IBUS_MEAS_TYPE_COG, IBUS_MEAS_VALUE_COG);
        changeTypeIbusTelemetry(11,IBUS_MEAS_TYPE_GPS_LON, IBUS_MEAS_VALUE_GPS_LON2);
        changeTypeIbusTelemetry(12,IBUS_MEAS_TYPE_GPS_LAT, IBUS_MEAS_VALUE_GPS_LAT2);
        changeTypeIbusTelemetry(13,IBUS_MEAS_TYPE_ACC_X, IBUS_MEAS_VALUE_GPS_LON1);
        changeTypeIbusTelemetry(14,IBUS_MEAS_TYPE_ACC_Y, IBUS_MEAS_VALUE_GPS_LAT1);
    }
    if (type == 4) {
        changeTypeIbusTelemetry(3, IBUS_MEAS_TYPE_S85, IBUS_MEAS_VALUE_STATUS);
#ifdef PITOT
        if (sensors(SENSOR_PITOT)) changeTypeIbusTelemetry(11,IBUS_MEAS_TYPE_VSPEED, IBUS_MEAS_VALUE_VSPEED);
        else 
#endif
            changeTypeIbusTelemetry(11,IBUS_MEAS_TYPE_PRES, IBUS_MEAS_VALUE_PRES);
    }
    if (type == 5) {
        changeTypeIbusTelemetry(2, IBUS_MEAS_TYPE_ARMED, IBUS_MEAS_VALUE_ARMED);
        changeTypeIbusTelemetry(3, IBUS_MEAS_TYPE_MODE, IBUS_MEAS_VALUE_MODE);
        changeTypeIbusTelemetry(11,IBUS_MEAS_TYPE_CLIMB, IBUS_MEAS_VALUE_CLIMB);
    }
    if (type == 4 || type == 5) {
        changeTypeIbusTelemetry(4, IBUS_MEAS_TYPE_ACC_Z, IBUS_MEAS_VALUE_ACC_Z);
        changeTypeIbusTelemetry(5, IBUS_MEAS_TYPE_CURRENT, IBUS_MEAS_VALUE_CURRENT);
        changeTypeIbusTelemetry(6, IBUS_MEAS_TYPE_S8A, IBUS_MEAS_VALUE_ALT4);
        changeTypeIbusTelemetry(7, IBUS_MEAS_TYPE_HEADING, IBUS_MEAS_VALUE_HEADING);
        changeTypeIbusTelemetry(8, IBUS_MEAS_TYPE_DIST, IBUS_MEAS_VALUE_DIST);
        changeTypeIbusTelemetry(9, IBUS_MEAS_TYPE_COG, IBUS_MEAS_VALUE_COG);
        changeTypeIbusTelemetry(12,IBUS_MEAS_TYPE_GPS_STATUS, IBUS_MEAS_VALUE_GPS_STATUS);
        changeTypeIbusTelemetry(13,IBUS_MEAS_TYPE_S88, IBUS_MEAS_VALUE_GPS_LON);
        changeTypeIbusTelemetry(14,IBUS_MEAS_TYPE_S89, IBUS_MEAS_VALUE_GPS_LAT);
    }
    if (type == 2 || type == 3 || type == 4 || type == 5) 
        changeTypeIbusTelemetry(10, IBUS_MEAS_TYPE_GALT, IBUS_MEAS_VALUE_GALT);
    if (type == 1 || type == 2 || type == 3 || type == 4 || type == 5) 
        changeTypeIbusTelemetry(15, IBUS_MEAS_TYPE_SPE, IBUS_MEAS_VALUE_SPE);
    if ((type == 3 || type == 4 || type == 5) && speed)
        changeTypeIbusTelemetry(15,IBUS_MEAS_TYPE_SPEED, IBUS_MEAS_VALUE_SPEED);
    if (type == 6) {
#ifdef PITOT
        if (sensors(SENSOR_PITOT)) changeTypeIbusTelemetry(9,IBUS_MEAS_TYPE1_VERTICAL_SPEED, IBUS_MEAS_VALUE_VSPEED);
        else 
#endif
            changeTypeIbusTelemetry(9, IBUS_MEAS_TYPE1_PRES, IBUS_MEAS_VALUE_PRES);
        changeTypeIbusTelemetry(15, IBUS_MEAS_TYPE1_S85, IBUS_MEAS_VALUE_STATUS);
    }
    if (type == 7) {
        changeTypeIbusTelemetry(2, IBUS_MEAS_TYPE1_GPS_STATUS, IBUS_MEAS_VALUE_GPS_STATUS);
        changeTypeIbusTelemetry(9, IBUS_MEAS_TYPE1_ARMED, IBUS_MEAS_VALUE_ARMED);
        changeTypeIbusTelemetry(15,IBUS_MEAS_TYPE1_FLIGHT_MODE, IBUS_MEAS_VALUE_MODE);
    }
    if (type == 6 || type == 7) {
        if (batteryConfig()->currentMeterSource == CURRENT_METER_VIRTUAL) 
            changeTypeIbusTelemetry(3, IBUS_MEAS_TYPE1_FUEL, IBUS_MEAS_VALUE_FUEL);
        else changeTypeIbusTelemetry(3, IBUS_MEAS_TYPE1_BAT_CURR, IBUS_MEAS_VALUE_CURRENT);
        changeTypeIbusTelemetry(4, IBUS_MEAS_TYPE1_CMP_HEAD, IBUS_MEAS_VALUE_HEADING);
        changeTypeIbusTelemetry(6, IBUS_MEAS_TYPE1_CLIMB_RATE, IBUS_MEAS_VALUE_CLIMB);
        changeTypeIbusTelemetry(5, IBUS_MEAS_TYPE1_COG, IBUS_MEAS_VALUE_COG);
        changeTypeIbusTelemetry(7, IBUS_MEAS_TYPE1_YAW, IBUS_MEAS_VALUE_ACC_Z);
        changeTypeIbusTelemetry(8, IBUS_MEAS_TYPE1_GPS_DIST, IBUS_MEAS_VALUE_DIST);
        if (speed) changeTypeIbusTelemetry(10,IBUS_MEAS_TYPE1_GROUND_SPEED, IBUS_MEAS_VALUE_SPEED);
        else changeTypeIbusTelemetry(10, IBUS_MEAS_TYPE1_SPE, IBUS_MEAS_VALUE_SPE);
        changeTypeIbusTelemetry(11,IBUS_MEAS_TYPE1_GPS_LAT, IBUS_MEAS_VALUE_GPS_LAT);
        changeTypeIbusTelemetry(12,IBUS_MEAS_TYPE1_GPS_LON, IBUS_MEAS_VALUE_GPS_LON);
        changeTypeIbusTelemetry(13,IBUS_MEAS_TYPE1_GPS_ALT, IBUS_MEAS_VALUE_GALT4);
        changeTypeIbusTelemetry(14,IBUS_MEAS_TYPE1_ALT, IBUS_MEAS_VALUE_ALT4);
    }
    ibusPortSharing = determinePortSharing(ibusSerialPortConfig, FUNCTION_TELEMETRY_IBUS);
    ibusTelemetryEnabled = false;
}

void handleIbusTelemetry(void)
{
    if (!ibusTelemetryEnabled) {
        return;
    }

    while (serialRxBytesWaiting(ibusSerialPort) > 0) {
        uint8_t c = serialRead(ibusSerialPort);

        if (outboundBytesToIgnoreOnRxCount) {
            outboundBytesToIgnoreOnRxCount--;
            continue;
        }

        pushOntoTail(ibusReceiveBuffer, IBUS_RX_BUF_LEN, c);

        if (isChecksumOkIa6b(ibusReceiveBuffer, IBUS_RX_BUF_LEN)) {
            outboundBytesToIgnoreOnRxCount += respondToIbusRequest(ibusReceiveBuffer);
        }
    }
}

bool checkIbusTelemetryState(void)
{
    bool newTelemetryEnabledValue = telemetryDetermineEnabledState(ibusPortSharing);

    if (newTelemetryEnabledValue == ibusTelemetryEnabled) {
        return false;
    }

    if (newTelemetryEnabledValue) {
        rescheduleTask(TASK_TELEMETRY, IBUS_TASK_PERIOD_US);
        configureIbusTelemetryPort();
    } else {
        freeIbusTelemetryPort();
    }

    return true;
}

void configureIbusTelemetryPort(void)
{
    if (!ibusSerialPortConfig) {
        return;
    }

    if (isSerialPortShared(ibusSerialPortConfig, FUNCTION_RX_SERIAL, FUNCTION_TELEMETRY_IBUS)) {
        // serialRx will open port and handle telemetry
        return;
    }

    ibusSerialPort = openSerialPort(ibusSerialPortConfig->identifier, FUNCTION_TELEMETRY_IBUS, NULL, IBUS_BAUDRATE, MODE_RXTX, SERIAL_BIDIR | (telemetryConfig()->telemetry_inverted ? SERIAL_INVERTED : SERIAL_NOT_INVERTED));

    if (!ibusSerialPort) {
        return;
    }

    initSharedIbusTelemetry(ibusSerialPort);
    ibusTelemetryEnabled = true;
    outboundBytesToIgnoreOnRxCount = 0;
}

void freeIbusTelemetryPort(void)
{
    closeSerialPort(ibusSerialPort);
    ibusSerialPort = NULL;
    ibusTelemetryEnabled = false;
}

#endif
