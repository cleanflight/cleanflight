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

typedef enum {
    SERIAL_NOT_INVERTED = 0,
    SERIAL_INVERTED
} serialInversion_e;

typedef enum portMode_t {
    MODE_RX           = 1 << 0,
    MODE_TX           = 1 << 1,
    MODE_RXTX         = MODE_RX | MODE_TX,
    MODE_SBUS         = 1 << 2,
    MODE_SINGLEWIRE   = 1 << 3,
// migration - supported only in softserial
    MODE_HALFDUPLEX   = 1 << 4,
    MODE_INVERTED     = 1 << 5,
// driver specific modes below
// softserial specific
    MODE_S_DUALTIMER  = 1 << 6, // try to claim adjacent timer channel in softserial mode
// uart specific
    MODE_U_DMARX      = 1 << 7, // use USART RX DMA if available
    MODE_U_DMATX      = 1 << 8, // use USART TX DMA if available

// hints how to setup port if more configuration options are possible (DMA, dualtimer, .. ). Device-specific driver sets neccesary flags
    MODE_DEFAULT_FAST  = 1 << 9, // setup port for high-performance if possible
} portMode_t;



// port state is used to indicate (and change) state of open port
// some port functions can be triggered by bit in this field
// MIGRATION
typedef enum {
    // port direction
    STATE_RX             = 1 << 0,
    STATE_TX             = 1 << 1,
    STATE_RXTX           = STATE_RX | STATE_TX,
    // function flags
    STATE_RX_WHENTXDONE  = 1 << 2,  // TODO - implemented only for softserial
    STATE_TX_DELAY       = 1 << 3,  // TODO - not implemented
} portState_t;

typedef void serialReceiveCallback(uint16_t data);   // used by serial drivers to return frames to app

typedef struct serialPort {
    const struct serialPortVTable *vTable;

    uint8_t identifier;
    portMode_t mode;
    serialInversion_e inversion;
    portState_t state;
    uint32_t baudRate;

    uint32_t rxBufferSize;
    uint32_t txBufferSize;
    volatile uint8_t *rxBuffer;
    volatile uint8_t *txBuffer;
    uint32_t rxBufferHead;
    uint32_t rxBufferTail;
    uint32_t txBufferHead;
    uint32_t txBufferTail;

    serialReceiveCallback *rxCallback;
} serialPort_t;

// this structure holds all serial port configuration (GetConfig/Release/Configure must return port to functional state)
typedef struct  {
    portMode_t mode;
    uint32_t baudRate;
    serialReceiveCallback *rxCallback;
} serialPortConfig_t;

// use this to initialize structure used to store port config. serialConfigure can be safely called with it
#define SERIAL_CONFIG_INIT_EMPTY { .mode = 0 }

struct serialPortVTable {
    void (*serialWrite)(serialPort_t *instance, uint8_t ch);

    uint8_t (*serialTotalBytesWaiting)(serialPort_t *instance);

    uint8_t (*serialRead)(serialPort_t *instance);

    // Specified baud rate may not be allowed by an implementation, use serialGetBaudRate to determine actual baud rate in use.
    void (*serialSetBaudRate)(serialPort_t *instance, uint32_t baudRate);

    bool (*isSerialTransmitBufferEmpty)(serialPort_t *instance);

    void (*setMode)(serialPort_t *instance, portMode_t mode);
};

void serialWrite(serialPort_t *instance, uint8_t ch);
uint8_t serialTotalBytesWaiting(serialPort_t *instance);
uint8_t serialRead(serialPort_t *instance);
void serialSetBaudRate(serialPort_t *instance, uint32_t baudRate);
void serialSetMode(serialPort_t *instance, portMode_t mode);
bool isSerialTransmitBufferEmpty(serialPort_t *instance);
void serialPrint(serialPort_t *instance, const char *str);
uint32_t serialGetBaudRate(serialPort_t *instance);
