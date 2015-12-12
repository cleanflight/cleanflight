/*#
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

#include "platform.h"

#include "drivers/system.h"
#include "drivers/serial.h"
#include "drivers/serial_uart.h"

#include "io/serial.h"

#include "rx/rx.h"
#include "rx/jetiexbus.h"

//
// Serial driver for Jeti EX Bus receiver
//
#define JETIEXBUS_BAUDRATE 125000
#define JETIEXBUS_MAX_FRAME_TIME 8000

#define JETIEXBUS_CHANNEL_COUNT 16
#define JETIEXBUS_MAX_FRAME_SIZE 40
#define JETIEXBUS_MIN_FRAME_SIZE 8
#define JETIEXBUS_HEADER_LEN 6

#define JETIEXBUS_START_STICK_FRAME (0x3E)
#define JETIEXBUS_START_REQUEST_FRAME (0x3D)

static bool jetiExBusFrameReceived = false;
static bool jetiExBusDataIncoming = false;
static bool jetiExBusHeaderReady = false;
static uint8_t jetiExBusFramePosition;
static uint8_t jetiExBusFrameLength;
static uint8_t jetiExBusChannelCount;
static uint8_t jetiExBusProvider;


// Use max values for ram areas
static volatile uint8_t jetiExBusFrame[JETIEXBUS_MAX_FRAME_SIZE];
static uint16_t jetiExBusChannelData[JETIEXBUS_CHANNEL_COUNT];

static void jetiExBusDataReceive(uint16_t c);
static uint16_t jetiExBusReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan);

bool jetiExBusInit(rxConfig_t *rxConfig, rxRuntimeConfig_t *rxRuntimeConfig, rcReadRawDataPtr *callback)
{
    uint32_t baudRate;

    switch (rxConfig->serialrx_provider) {
        case SERIALRX_JETIEXBUS:
		
            rxRuntimeConfig->channelCount = JETIEXBUS_CHANNEL_COUNT;
            jetiExBusFrameReceived = false;
            jetiExBusDataIncoming = false;
            jetiExBusFramePosition = 0;
            baudRate = JETIEXBUS_BAUDRATE;
            jetiExBusFrameLength = JETIEXBUS_MAX_FRAME_SIZE;
            jetiExBusChannelCount = JETIEXBUS_CHANNEL_COUNT;
            jetiExBusProvider = SERIALRX_JETIEXBUS;
            break;
       
        default:
            return false;
            break;
    }

    if (callback) {
        *callback = jetiExBusReadRawRC;
    }

    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_RX_SERIAL);
    if (!portConfig) {
        return false;
    }

    serialPort_t *jetiExBusPort = openSerialPort(portConfig->identifier, FUNCTION_RX_SERIAL, jetiExBusDataReceive, baudRate, MODE_RX, SERIAL_NOT_INVERTED);

    return jetiExBusPort != NULL;
}


void jetiExBusFrameReset(void)
{
	jetiExBusDataIncoming = false;
    jetiExBusHeaderReady = false;
	jetiExBusFramePosition = 0;
	jetiExBusFrameLength = JETIEXBUS_MAX_FRAME_SIZE;
}



static uint16_t updateCRC16( uint16_t crc, uint8_t data ) 
{
	uint16_t ret_val;   
	data ^= (uint8_t)(crc) & (uint8_t)(0xFF);   
	data ^= data << 4;   
	ret_val = ((((uint16_t)data << 8) | ((crc & 0xFF00) >> 8))             
			  ^ (uint8_t)(data >> 4)
			  ^ ((uint16_t)data << 3));   
	return ret_val; 
} 

// Jeti Ex Bus CRC calculations
uint16_t calcCRC16(volatile uint8_t *pt, uint8_t msgLen)
{
    uint16_t crc16_data=0;
   	uint8_t mlen=0;
	
    while(mlen<=msgLen) {
        crc16_data = updateCRC16(crc16_data, pt[mlen]);
        mlen++;
    }
	return(crc16_data);
}

// Splits the received frame 
void jetiExBusDecodeFrame()
{
    uint16_t value;
    uint8_t frameAddr;

	// Decode header
	switch (((uint16_t)jetiExBusFrame[0] << 8)+((uint16_t)jetiExBusFrame[1])){
		case (0x3E01):
		case (0x3E03):
			// Exctract the channeldata
			for (uint8_t i = 0; i < jetiExBusChannelCount; i++){
				frameAddr = JETIEXBUS_HEADER_LEN + i * 2;
				value = ((uint16_t)jetiExBusFrame[frameAddr+1]) << 8;
				value = value + ((uint16_t)jetiExBusFrame[frameAddr]);
				// Convert to internal format
				jetiExBusChannelData[i] = value>>3;
				}
			jetiExBusFrameReceived = true;
			break;
		case (0x3D01):
			// Request for Telemetry or JETIBOX menu
			break;

	}
}



// Receive ISR callback
static void jetiExBusDataReceive(uint16_t c)
{
    uint32_t now;
    static uint32_t jetiExBusTimeLast, jetiExBusTimeInterval;
	uint16_t crc = 0;
	
    // Check if we shall reset frame position due to time
    now = micros();
    jetiExBusTimeInterval = now - jetiExBusTimeLast;
    jetiExBusTimeLast = now;
	
    if (jetiExBusTimeInterval > JETIEXBUS_MAX_FRAME_TIME) {
       jetiExBusFrameReset();
    }
    
    // Check if we shall start a frame?
    if (jetiExBusFramePosition == 0) {
		if((c == JETIEXBUS_START_STICK_FRAME) || (c == JETIEXBUS_START_REQUEST_FRAME)){
		    jetiExBusDataIncoming = true;
		}
    }

    // Only do this if we are receiving to a frame
    if (jetiExBusDataIncoming == true) {
		// Store in frame copy
        jetiExBusFrame[jetiExBusFramePosition] = (uint8_t)c;
        jetiExBusFramePosition++;
    }
	
	// Check the header for the messagelength
	if((jetiExBusFramePosition==JETIEXBUS_HEADER_LEN) && (jetiExBusHeaderReady==false)) {
			jetiExBusHeaderReady = true;
		
			if((jetiExBusFrame[2]<=JETIEXBUS_MAX_FRAME_SIZE) && (jetiExBusFrame[2]>=JETIEXBUS_MIN_FRAME_SIZE)){
				jetiExBusFrameLength = jetiExBusFrame[2];
			}else{
				jetiExBusFrameReset();
			}
		}
    	
    // Done?
    if (jetiExBusFrameLength == jetiExBusFramePosition) {
		crc = ((uint16_t)jetiExBusFrame[jetiExBusFramePosition - 1] << 8) + (jetiExBusFrame[jetiExBusFramePosition - 2]);
		if(crc == calcCRC16(jetiExBusFrame, jetiExBusFrameLength - 3)){
			jetiExBusDecodeFrame();
		}
        jetiExBusFrameReset();
    }
}



// Indicate time to read a frame from the data...
uint8_t jetiExBusFrameStatus(void)
{
    if (!jetiExBusFrameReceived) {
        return SERIAL_RX_FRAME_PENDING;
    }

    jetiExBusFrameReceived = false;

    return SERIAL_RX_FRAME_COMPLETE;
}

static uint16_t jetiExBusReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan)
{
    // Deliver the data wanted
    if (chan >= rxRuntimeConfig->channelCount) {
        return 0;
    }

    return (jetiExBusChannelData[chan]);
}
