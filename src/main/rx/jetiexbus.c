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

#include "platform.h"
#include "build_config.h"
#include "drivers/system.h"
#include "drivers/serial.h"
#include "drivers/serial_uart.h"
#include "io/serial.h"



#ifdef TELEMETRY
#include "common/axis.h"
#include "flight/pid.h"
#include "flight/navigation.h"
#include "io/gps.h"
#include "config/runtime_config.h"
#include "sensors/sensors.h"
#include "sensors/battery.h"
#include "telemetry/telemetry.h"
#endif


#include "rx/rx.h"
#include "rx/jetiexbus.h"
#include "debug.h"

//
// Serial driver for Jeti EX Bus receiver
//
#define JETIEXBUS_BAUDRATE 125000
#define JETIEXBUS_MAX_FRAME_GAP 1

#define JETIEXBUS_CHANNEL_COUNT 16
#define JETIEXBUS_MIN_FRAME_SIZE 8
#define JETIEXBUS_HEADER_LEN 6
#define JETIEXBUS_CRC_LEN 2

#define JETIEXBUS_MAX_FRAME_SIZE (JETIEXBUS_HEADER_LEN + JETIEXBUS_CHANNEL_COUNT*2 + JETIEXBUS_CRC_LEN)

#define JETIEXBUS_START_CHANNEL_FRAME (0x3E)
#define JETIEXBUS_START_REQUEST_FRAME (0x3D)

#define EXBUS_CHANNELDATA (0x3E03)                          //Frame contains channeldata
#define EXBUS_CHANNELDATA_TELEMETRY_REQUEST (0x3E01)        //Frame contains channeldata, but with a request for telemetry data
#define EXBUS_DATA_REQUEST (0x3D01)                         //Request for telemetry data or jetibox menu

enum{
    JEBP_STATE_ZERO = 0,
    JEBP_STATE_IN_PROGRESS,
    JEBP_STATE_RECEIVED,
    JEBP_STATE_PROCESSED
};

enum{
    JEBP_TRANS_ZERO = 0,
    JEBP_TRANS_RX_READY,
    JEBP_TRANS_RX,
    JEBP_TRANS_TX_READY,
    JEBP_TRANS_TX
};

static serialPort_t *jetiExBusPort;

static uint8_t jetiExBusFrameState = JEBP_STATE_ZERO;
static uint8_t jetiExBusRequestState = JEBP_STATE_ZERO;
static uint8_t jetiExBusTransceiveState = JEBP_TRANS_RX;
static uint8_t jetiExBusFramePosition;
static uint8_t jetiExBusFrameLength;

// Use max values for ram areas
static uint8_t jetiExBusSerialFrame[JETIEXBUS_MAX_FRAME_SIZE*2];
static uint8_t *jetiExBusFrame;

static uint16_t jetiExBusChannelData[JETIEXBUS_CHANNEL_COUNT];
static void jetiExBusDataReceive(uint16_t c);
static uint16_t jetiExBusReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan);
static uint8_t sendJetiExBusTelemetry(void);


static uint8_t test[32]={0x3B, 0x01,0x20, 0x08, 0x3A, 0x18, 0x9F, 0x56, 0x00, 0xA4, 0x51, 0x55, 0xEE, 0x11, 0x30, 0x20, 0x21, 0x00, 0x40, 0x34, 0xA3, 0x28, 0x00, 0x41, 0x00, 0x00, 0x51, 0x18, 0x00, 0x09, 0x91, 0xD6};

// Jeti EX Bus Telemetry


bool jetiExBusInit(rxConfig_t *rxConfig, rxRuntimeConfig_t *rxRuntimeConfig, rcReadRawDataPtr *callback)
{
    UNUSED(rxConfig);
    
    if (callback) {
        *callback = jetiExBusReadRawRC;
    }
    
    rxRuntimeConfig->channelCount = JETIEXBUS_CHANNEL_COUNT;
    jetiExBusFramePosition = 0;
    jetiExBusFrameLength = JETIEXBUS_MAX_FRAME_SIZE;

    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_RX_SERIAL);
    
    if (!portConfig) {
        return false;
    }

    //serialPort_t *jetiExBusPort = openSerialPort(portConfig->identifier, FUNCTION_RX_SERIAL, jetiExBusDataReceive, JETIEXBUS_BAUDRATE, MODE_RX, SERIAL_NOT_INVERTED);
    jetiExBusPort = openSerialPort(portConfig->identifier, FUNCTION_RX_SERIAL, jetiExBusDataReceive, JETIEXBUS_BAUDRATE, MODE_RX, SERIAL_NOT_INVERTED);
    
    return jetiExBusPort != NULL;
}





// Jeti Ex Bus crc calculations for single byte
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

// Jeti Ex Bus crc calculations for a frame
uint16_t calcCRC16(uint8_t *pt, uint8_t msgLen)
{
    uint16_t crc16_data=0;
    uint8_t mlen=0;
    while(mlen<msgLen) {
        crc16_data = updateCRC16(crc16_data, pt[mlen]);
        mlen++;
    }
return(crc16_data);
}

// Splits the received frame 
void jetiExBusDecodeFrame(uint8_t *pFrame)
{
    uint16_t value;
    uint8_t frameAddr;
  
  // Decode header
    switch (((uint16_t)jetiExBusFrame[0] << 8)+((uint16_t)jetiExBusFrame[1])){
        case EXBUS_CHANNELDATA:
        case EXBUS_CHANNELDATA_TELEMETRY_REQUEST:
            for (uint8_t i = 0; i < JETIEXBUS_CHANNEL_COUNT; i++){
                frameAddr = JETIEXBUS_HEADER_LEN + i * 2;
                value = ((uint16_t)pFrame[frameAddr+1]) << 8;
                value += (uint16_t)pFrame[frameAddr];
                // Convert to internal format
                jetiExBusChannelData[i] = value>>3;
            }
            break;
     
        case EXBUS_DATA_REQUEST:
            //jetiExBusTelemetryRequest = true;
            break;
    }
}

void jetiExBusFrameReset(void)
{
    jetiExBusFramePosition = 0;
    jetiExBusFrameLength = JETIEXBUS_MAX_FRAME_SIZE;
}


/*
  supported:
  0x3E 0x01 LEN Packet_ID 0x31 SUB_LEN Data_array CRC16      // Channeldata with telemetrie request (second byte 0x01)
  0x3E 0x03 LEN Packet_ID 0x31 SUB_LEN Data_array CRC16      // Channeldata forbids answering (second byte 0x03)
  0x3D 0x01 0x08 0x06 0x3A 0x00 0x98 0x81                    // Telemetrierequest EX telemetry (fifth byte 0x3A)
  
  other messages not supported:
  0x3D 0x01 0x09 0x88 0x3B 0x01 0xF0 0xA3 0x24               // Jetibox request (fifth byte 0x3B)
  ...
  
*/
// Receive ISR callback
static void jetiExBusDataReceive(uint16_t c)
{
    uint32_t now;

    static uint32_t jetiExBusTimeLast = 0;
    static uint32_t jetiExBusTimeInterval;
    static uint16_t crc = 0;
    
    // Check if we shall reset frame position due to time
    now = millis();
  
    jetiExBusTimeInterval = now - jetiExBusTimeLast;
    jetiExBusTimeLast = now;
        
    if (jetiExBusTimeInterval > JETIEXBUS_MAX_FRAME_GAP) {
        jetiExBusFrameReset();
        jetiExBusFrameState = JEBP_STATE_ZERO;
        jetiExBusRequestState = JEBP_STATE_ZERO;
        }
    
    // Check if we shall start a frame? 
    if (jetiExBusFramePosition == 0) {
        switch(c){
            case JETIEXBUS_START_CHANNEL_FRAME:
                jetiExBusFrameState = JEBP_STATE_IN_PROGRESS;
                jetiExBusFrame = &jetiExBusSerialFrame[0];
                break;
            
            case JETIEXBUS_START_REQUEST_FRAME:
                jetiExBusRequestState = JEBP_STATE_IN_PROGRESS;
                jetiExBusFrame = &jetiExBusSerialFrame[JETIEXBUS_MAX_FRAME_SIZE];
                break;

            default:
                return;
        }
        crc = 0;
    }
 
    // Store in frame copy
    jetiExBusFrame[jetiExBusFramePosition] = (uint8_t)c;
    crc = updateCRC16(crc, (uint8_t)c);
    jetiExBusFramePosition++;
    
    
    // Check the header for the messagelength
    if(jetiExBusFramePosition==JETIEXBUS_HEADER_LEN) {
        
            if((jetiExBusFrame[2]<=JETIEXBUS_MAX_FRAME_SIZE) && (jetiExBusFrame[2]>=JETIEXBUS_MIN_FRAME_SIZE)){
                jetiExBusFrameLength = jetiExBusFrame[2];
                 
            }else{
                jetiExBusFrameReset();                  // not a valid frame
                jetiExBusFrameState = JEBP_STATE_ZERO;
                jetiExBusRequestState = JEBP_STATE_ZERO;
                return;
            }
        }
        
    // Done?
    if ((jetiExBusFrameLength == jetiExBusFramePosition)){
        if (crc == 0){
            if(jetiExBusFrameState == JEBP_STATE_IN_PROGRESS){
                jetiExBusFrameState = JEBP_STATE_RECEIVED;
            }
            if(jetiExBusRequestState == JEBP_STATE_IN_PROGRESS){
                jetiExBusRequestState =  JEBP_STATE_RECEIVED;
                }
        }
     jetiExBusFrameReset();
    }
}

// Indicate time to read a frame from the data...
uint8_t jetiExBusFrameStatus(void)
{
    if (jetiExBusFrameState != JEBP_STATE_PROCESSED) {
        return SERIAL_RX_FRAME_PENDING;
    }
    jetiExBusFrameState = JEBP_STATE_ZERO;

    return SERIAL_RX_FRAME_COMPLETE;
}


static uint16_t jetiExBusReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan)
{
    if (chan >= rxRuntimeConfig->channelCount) {
        return 0;
    }

    return (jetiExBusChannelData[chan]);
}


/*
 * ------------------------------------------------
 * Jeti Ex Bus Telemetry
 * ------------------------------------------------
 */
void initJetiExBusTelemetry(telemetryConfig_t *initialTelemetryConfig)
{
    UNUSED(initialTelemetryConfig); //---------------- TEMP
    return;
}
void checkJetiExBusTelemetryState(void)
{
    return;
}

void handleJetiExBusTelemetry(void)
{   
    // decode telemetry frame
    if(jetiExBusRequestState == JEBP_STATE_RECEIVED){
        jetiExBusDecodeFrame(&jetiExBusSerialFrame[JETIEXBUS_MAX_FRAME_SIZE]);
        jetiExBusRequestState = JEBP_STATE_PROCESSED;
        
        // switch to TX mode, because we should not receive our own transmission
        if(uartTotalRxBytesWaiting(jetiExBusPort) == 0){
            jetiExBusTransceiveState = JEBP_TRANS_TX;
            sendJetiExBusTelemetry();
        }
        
        
    }
    // decode channel frame
    if(jetiExBusFrameState == JEBP_STATE_RECEIVED){
        jetiExBusDecodeFrame(&jetiExBusSerialFrame[0]);
        //if(jetiExBusSerialFrame[1]=1) jetiExBusRequestState = JEBP_STATE_RECEIVED;
        jetiExBusFrameState = JEBP_STATE_PROCESSED;
        
    }
    
    // check the state if transmit is ready
    if(jetiExBusTransceiveState == JEBP_TRANS_TX_READY) {
        if(isUartTransmitBufferEmpty(jetiExBusPort)){
            // serialSetMode(jetiExBusPort, MODE_RX);
            jetiExBusTransceiveState = JEBP_TRANS_RX;
        }
    }
    return;
}

uint8_t sendJetiExBusTelemetry(void)
{
    //if(jetiExBusTransceiveState == JEBP_TRANS_TX)
    // serialSetMode(jetiExBusPort, MODE_TX);
  
    for (uint8_t i = 0; i < 32; i++){
        serialWrite(jetiExBusPort, test[i]);
    }
    jetiExBusTransceiveState = JEBP_TRANS_TX_READY;        
    return 0;
}


