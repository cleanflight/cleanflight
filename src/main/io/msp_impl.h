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

#include <stdint.h>

typedef enum {
    IDLE,
    HEADER_START,
    HEADER_M,
    HEADER_ARROW,
    HEADER_SIZE,
    HEADER_CMD,
    COMMAND_RECEIVED
} mspState_e;

#define MSP_PORT_INBUF_SIZE 64

typedef struct mspPort_s {
    uint8_t offset;
    uint8_t dataSize;
    uint8_t checksum;
    uint8_t cmdMSP;
    mspState_e c_state;
    uint8_t indRX;
    uint8_t inBuf[MSP_PORT_INBUF_SIZE];
} mspPort_t;

typedef void (*mspFunctionPtr)(void);

typedef struct mspFunctionPointers_s {
    mspFunctionPtr beginWrite;
    mspFunctionPtr endWrite;
    mspFunctionPtr releaseFor1Wire;
    mspFunctionPtr reallocateAfter1Wire;
} mspFunctionPointers_t;

void mspInit(void);
bool mspProcessOutCommand(void);
bool mspProcessInCommand(uint8_t cmdMSP);
void mspProcessReceivedCommand();
bool mspProcessReceivedData(uint8_t c);

