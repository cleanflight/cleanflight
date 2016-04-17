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

#include "build_config.h"
#include "debug.h"
#include <platform.h>

#include "config/config.h"
#include "config/parameter_group.h"
#include "config/runtime_config.h"

#include "drivers/buf_writer.h"
#include "drivers/serial.h"
#include "drivers/system.h"

#include "flight/mixer.h"

#include "io/msp_protocol.h"
#include "io/msp_impl.h"
#include "io/serial.h"

#include "io/serial_msp.h"

extern bool isRebootScheduled;

extern mspFunctionPointers_t mspFunctionPointers;
extern mspPort_t *currentMspPort;
extern bufWriter_t *mspWriter;

static serialPort_t *mspSerialPort;

typedef struct mspSerialPort_s {
    serialPort_t *serialPort; // null when port unused.
    mspPort_t mspPort;
} mspSerialPort_t;

static mspSerialPort_t mspPorts[MAX_MSP_PORT_COUNT];
static mspSerialPort_t *currentPort;

static void mspSerialBeginWrite(void)
{
    serialBeginWrite(mspSerialPort);
}

static void mspSerialEndWrite(void)
{
    serialEndWrite(mspSerialPort);
}

static void mspSerialReleaseFor1Wire(void)
{
    // wait for all data to send
    waitForSerialPortToFinishTransmitting(currentPort->serialPort);
    mspReleaseSerialPortIfAllocated(mspSerialPort); // CloseSerialPort also marks currentPort as UNUSED_PORT
}

static void mspSerialReallocateAfter1Wire(void)
{
    mspAllocateSerialPorts();
}

static void resetMspPort(mspSerialPort_t *mspPortToReset, serialPort_t *serialPort)
{
    memset(mspPortToReset, 0, sizeof(mspSerialPort_t));
    mspPortToReset->serialPort = serialPort;
}

void mspAllocateSerialPorts(void)
{
    uint8_t portIndex = 0;
    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_MSP);
    while (portConfig && portIndex < MAX_MSP_PORT_COUNT) {
        mspSerialPort_t *mspPort = &mspPorts[portIndex];
        if (mspPort->serialPort) {
            portIndex++;
            continue;
        }
        serialPort_t *serialPort = openSerialPort(portConfig->identifier, FUNCTION_MSP, NULL, baudRates[portConfig->msp_baudrateIndex], MODE_RXTX, SERIAL_NOT_INVERTED);
        if (serialPort) {
            resetMspPort(mspPort, serialPort);
            portIndex++;
        }
        portConfig = findNextSerialPortConfig(FUNCTION_MSP);
    }
}

void mspReleaseSerialPortIfAllocated(serialPort_t *serialPort)
{
    for (uint8_t portIndex = 0; portIndex < MAX_MSP_PORT_COUNT; portIndex++) {
        mspSerialPort_t *candidateMspPort = &mspPorts[portIndex];
        if (candidateMspPort->serialPort == serialPort) {
            closeSerialPort(serialPort);
            memset(candidateMspPort, 0, sizeof(mspPort_t));
        }
    }
}

static void setCurrentPort(mspSerialPort_t *port)
{
    currentPort = port;
    currentMspPort = &port->mspPort;
    mspSerialPort = currentPort->serialPort;
}

void mspSerialProcess(void)
{
    for (uint8_t portIndex = 0; portIndex < MAX_MSP_PORT_COUNT; portIndex++) {
        mspSerialPort_t *candidatePort = &mspPorts[portIndex];
        if (!candidatePort->serialPort) {
            continue;
        }
        setCurrentPort(candidatePort);

        // Big enough to fit a MSP_STATUS in one write.
        uint8_t buf[sizeof(bufWriter_t) + 20];
        mspWriter = bufWriterInit(buf, sizeof(buf), (bufWrite_t)serialWriteBufShim, currentPort->serialPort);

        mspFunctionPointers.beginWrite = mspSerialBeginWrite;
        mspFunctionPointers.endWrite = mspSerialEndWrite;
        mspFunctionPointers.releaseFor1Wire = mspSerialReleaseFor1Wire;
        mspFunctionPointers.reallocateAfter1Wire = mspSerialReallocateAfter1Wire;

        while (serialRxBytesWaiting(mspSerialPort)) {
            const uint8_t c = serialRead(mspSerialPort);
            bool consumed = mspProcessReceivedData(c);
            if (!consumed && !ARMING_FLAG(ARMED)) {
                evaluateOtherData(mspSerialPort, c);
            }
            if (currentPort->mspPort.c_state == COMMAND_RECEIVED) {
                mspProcessReceivedCommand();
                break; // process one command at a time so as not to block.
            }
        }

        bufWriterFlush(mspWriter);

        if (isRebootScheduled) {
            waitForSerialPortToFinishTransmitting(candidatePort->serialPort);
            stopMotors();
            handleOneshotFeatureChangeOnRestart();
            systemReset();
        }
    }
}

void mspSerialInit(void)
{
    mspInit();
    memset(mspPorts, 0, sizeof(mspPorts));
    mspAllocateSerialPorts();
}

