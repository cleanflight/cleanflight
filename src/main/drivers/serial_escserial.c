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

#include "platform.h"

#if defined(USE_ESCSERIAL)

#include "build_config.h"

#include "common/utils.h"
#include "common/atomic.h"
#include "common/printf.h"

#include "nvic.h"
#include "system.h"
#include "gpio.h"
#include "timer.h"

#include "serial.h"
#include "serial_escserial.h"
#include "drivers/light_led.h"
#include "io/serial.h"
#include "flight/mixer.h"

#define RX_TOTAL_BITS 10
#define TX_TOTAL_BITS 10

#define MAX_ESCSERIAL_PORTS 1
static serialPort_t *escPort = NULL;
static serialPort_t *passPort = NULL;

typedef struct escSerial_s {
    serialPort_t     port;

    const timerHardware_t *rxTimerHardware;
    volatile uint8_t rxBuffer[ESCSERIAL_BUFFER_SIZE];
    const timerHardware_t *txTimerHardware;
    volatile uint8_t txBuffer[ESCSERIAL_BUFFER_SIZE];

    uint8_t          isSearchingForStartBit;
    uint8_t          rxBitIndex;
    uint8_t          rxLastLeadingEdgeAtBitIndex;
    uint8_t          rxEdge;

    uint8_t          isTransmittingData;
    uint8_t          isReceivingData;
    int8_t           bitsLeftToTransmit;

    uint16_t         internalTxBuffer;  // includes start and stop bits
    uint16_t         internalRxBuffer;  // includes start and stop bits

    uint16_t         receiveTimeout;
    uint16_t         transmissionErrors;
    uint16_t         receiveErrors;

    uint8_t          escSerialPortIndex;

    timerCCHandlerRec_t timerCb;
    timerCCHandlerRec_t edgeCb;
} escSerial_t;

extern timerHardware_t* serialTimerHardware;
extern escSerial_t escSerialPorts[];

extern const struct serialPortVTable escSerialVTable[];


escSerial_t escSerialPorts[MAX_ESCSERIAL_PORTS];

void onSerialTimer(timerCCHandlerRec_t *cbRec, captureCompare_t capture);
void onSerialRxPinChange(timerCCHandlerRec_t *cbRec, captureCompare_t capture);

void setTxSignal(escSerial_t *escSerial, uint8_t state)
{
    if (state) {
        digitalHi(escSerial->rxTimerHardware->gpio, escSerial->rxTimerHardware->pin);
    } else {
        digitalLo(escSerial->rxTimerHardware->gpio, escSerial->rxTimerHardware->pin);
    }
}

static void escSerialGPIOConfig(GPIO_TypeDef *gpio, uint16_t pin, GPIO_Mode mode)
{
    gpio_config_t cfg;

    cfg.pin = pin;
    cfg.mode = mode;
    cfg.speed = Speed_2MHz;
    gpioInit(gpio, &cfg);
}

void serialInputPortConfig(const timerHardware_t *timerHardwarePtr)
{
    escSerialGPIOConfig(timerHardwarePtr->gpio, timerHardwarePtr->pin, Mode_AF_PP_PU);
    //escSerialGPIOConfig(timerHardwarePtr->gpio, timerHardwarePtr->pin, timerHardwarePtr->gpioInputMode);
}

static void serialTimerTxConfig(const timerHardware_t *timerHardwarePtr, uint8_t reference)
{
    uint32_t timerPeriod=34;
    TIM_DeInit(timerHardwarePtr->tim);
    timerConfigure(timerHardwarePtr, timerPeriod, 1);
    timerChCCHandlerInit(&escSerialPorts[reference].timerCb, onSerialTimer);
    timerChConfigCallbacks(timerHardwarePtr, &escSerialPorts[reference].timerCb, NULL);
}

static void serialICConfig(TIM_TypeDef *tim, uint8_t channel, uint16_t polarity)
{
    TIM_ICInitTypeDef TIM_ICInitStructure;

    TIM_ICStructInit(&TIM_ICInitStructure);
    TIM_ICInitStructure.TIM_Channel = channel;
    TIM_ICInitStructure.TIM_ICPolarity = polarity;
    TIM_ICInitStructure.TIM_ICSelection = TIM_ICSelection_DirectTI;
    TIM_ICInitStructure.TIM_ICPrescaler = TIM_ICPSC_DIV1;
    TIM_ICInitStructure.TIM_ICFilter = 0x0;

    TIM_ICInit(tim, &TIM_ICInitStructure);
}

static void serialTimerRxConfig(const timerHardware_t *timerHardwarePtr, uint8_t reference)
{
    // start bit is usually a FALLING signal
    TIM_DeInit(timerHardwarePtr->tim);
    timerConfigure(timerHardwarePtr, 0xFFFF, 1);
	serialICConfig(timerHardwarePtr->tim, timerHardwarePtr->channel, TIM_ICPolarity_Falling);
    timerChCCHandlerInit(&escSerialPorts[reference].edgeCb, onSerialRxPinChange);
    timerChConfigCallbacks(timerHardwarePtr, &escSerialPorts[reference].edgeCb, NULL);
}

static void serialOutputPortConfig(const timerHardware_t *timerHardwarePtr)
{
    escSerialGPIOConfig(timerHardwarePtr->gpio, timerHardwarePtr->pin, Mode_Out_PP);
}

static void resetBuffers(escSerial_t *escSerial)
{
    escSerial->port.rxBufferSize = ESCSERIAL_BUFFER_SIZE;
    escSerial->port.rxBuffer = escSerial->rxBuffer;
    escSerial->port.rxBufferTail = 0;
    escSerial->port.rxBufferHead = 0;

    escSerial->port.txBuffer = escSerial->txBuffer;
    escSerial->port.txBufferSize = ESCSERIAL_BUFFER_SIZE;
    escSerial->port.txBufferTail = 0;
    escSerial->port.txBufferHead = 0;
}

serialPort_t *openEscSerial(escSerialPortIndex_e portIndex, serialReceiveCallbackPtr callback, uint16_t output)
{
    escSerial_t *escSerial = &(escSerialPorts[portIndex]);

    escSerial->rxTimerHardware = &(timerHardware[output]);
    escSerial->txTimerHardware = &(timerHardware[ESCSERIAL_TIMER_TX_HARDWARE]);


    escSerial->port.vTable = escSerialVTable;
    escSerial->port.mode = MODE_RXTX;
    escSerial->port.callback = callback;

    resetBuffers(escSerial);

    escSerial->isTransmittingData = false;

    escSerial->isSearchingForStartBit = true;
    escSerial->rxBitIndex = 0;

    escSerial->transmissionErrors = 0;
    escSerial->receiveErrors = 0;
    escSerial->receiveTimeout = 0;

    escSerial->escSerialPortIndex = portIndex;

    serialInputPortConfig(escSerial->rxTimerHardware);

    setTxSignal(escSerial, ENABLE);
    delay(50);

    serialTimerTxConfig(escSerial->txTimerHardware, portIndex);
    serialTimerRxConfig(escSerial->rxTimerHardware, portIndex);

    return &escSerial->port;
}

/*********************************************/

void processTxState(escSerial_t *escSerial)
{
    uint8_t mask;
    static uint8_t bitq=0, transmitStart=0;
    if (escSerial->isReceivingData) {
    	return;
    }

    if(transmitStart==0)
    {
    	setTxSignal(escSerial, 1);
    }
    if (!escSerial->isTransmittingData) {
        char byteToSend;
reload:
        if (isEscSerialTransmitBufferEmpty((serialPort_t *)escSerial)) {
        	// canreceive
        	transmitStart=0;
            return;
        }

        if(transmitStart<3)
        {
        	if(transmitStart==0)
        		byteToSend = 0xff;
        	if(transmitStart==1)
        		byteToSend = 0xff;
        	if(transmitStart==2)
        		byteToSend = 0x7f;
        	transmitStart++;
        }
        else{
			// data to send
			byteToSend = escSerial->port.txBuffer[escSerial->port.txBufferTail++];
			if (escSerial->port.txBufferTail >= escSerial->port.txBufferSize) {
				escSerial->port.txBufferTail = 0;
			}
        }


        // build internal buffer, data bits (MSB to LSB)
        escSerial->internalTxBuffer = byteToSend;
        escSerial->bitsLeftToTransmit = 8;
        escSerial->isTransmittingData = true;

        //set output
        serialOutputPortConfig(escSerial->rxTimerHardware);
        return;
    }

    if (escSerial->bitsLeftToTransmit) {
        mask = escSerial->internalTxBuffer & 1;
        if(mask)
        {
        	if(bitq==0 || bitq==1)
        	{
                setTxSignal(escSerial, 1);
        	}
        	if(bitq==2 || bitq==3)
        	{
                setTxSignal(escSerial, 0);
        	}
        }
        else
        {
        	if(bitq==0 || bitq==2)
        	{
                setTxSignal(escSerial, 1);
        	}
        	if(bitq==1 ||bitq==3)
        	{
                setTxSignal(escSerial, 0);
        	}
        }
        bitq++;
        if(bitq>3)
        {
			escSerial->internalTxBuffer >>= 1;
			escSerial->bitsLeftToTransmit--;
			bitq=0;
			if(escSerial->bitsLeftToTransmit==0)
			{
				goto reload;
			}
        }
        return;
    }

    if (isEscSerialTransmitBufferEmpty((serialPort_t *)escSerial)) {
    	escSerial->isTransmittingData = false;
    	serialInputPortConfig(escSerial->rxTimerHardware);
    }
}



void extractAndStoreRxByte(escSerial_t *escSerial)
{
    if ((escSerial->port.mode & MODE_RX) == 0) {
        return;
    }

    uint8_t rxByte = (escSerial->internalRxBuffer) & 0xFF;

    if (escSerial->port.callback) {
        escSerial->port.callback(rxByte);
    } else {
        escSerial->port.rxBuffer[escSerial->port.rxBufferHead] = rxByte;
        escSerial->port.rxBufferHead = (escSerial->port.rxBufferHead + 1) % escSerial->port.rxBufferSize;
    }
}

void onSerialTimer(timerCCHandlerRec_t *cbRec, captureCompare_t capture)
{
    UNUSED(capture);
    escSerial_t *escSerial = container_of(cbRec, escSerial_t, timerCb);

    if(escSerial->isReceivingData)
    {
    	escSerial->receiveTimeout++;
    	if(escSerial->receiveTimeout>8)
    	{
    		escSerial->isReceivingData=0;
        	escSerial->receiveTimeout=0;
            serialICConfig(escSerial->rxTimerHardware->tim, escSerial->rxTimerHardware->channel, TIM_ICPolarity_Falling);
    	}
    }


    processTxState(escSerial);
}

void onSerialRxPinChange(timerCCHandlerRec_t *cbRec, captureCompare_t capture)
{
    UNUSED(capture);
    static uint8_t zerofirst=0;
    static uint8_t bits=0;
    static uint16_t bytes=0;

    escSerial_t *escSerial = container_of(cbRec, escSerial_t, edgeCb);

    //clear timer
    TIM_SetCounter(escSerial->rxTimerHardware->tim,0);

    if(capture > 40 && capture < 90)
    {
    	zerofirst++;
    	if(zerofirst>1)
    	{
        	zerofirst=0;
			escSerial->internalRxBuffer = escSerial->internalRxBuffer>>1;
        	bits++;
    	}
    }
    else if(capture>90 && capture < 200)
    {
    	zerofirst=0;
		escSerial->internalRxBuffer = escSerial->internalRxBuffer>>1;
		escSerial->internalRxBuffer |= 0x80;
		bits++;
    }
    else
    {
    	if(!escSerial->isReceivingData)
    	{
			//start
			//lets reset

			escSerial->isReceivingData = 1;
			zerofirst=0;
			bytes=0;
			bits=1;
			escSerial->internalRxBuffer = 0x80;

			serialICConfig(escSerial->rxTimerHardware->tim, escSerial->rxTimerHardware->channel, TIM_ICPolarity_Rising);
    	}
    }
    escSerial->receiveTimeout = 0;

    if(bits==8)
    {
    	bits=0;
    	bytes++;
    	if(bytes>3)
    	{
    		extractAndStoreRxByte(escSerial);
    	}
    	escSerial->internalRxBuffer=0;
    }

}

uint8_t escSerialTotalBytesWaiting(serialPort_t *instance)
{
    if ((instance->mode & MODE_RX) == 0) {
        return 0;
    }

    escSerial_t *s = (escSerial_t *)instance;

    return (s->port.rxBufferHead - s->port.rxBufferTail) & (s->port.rxBufferSize - 1);
}

uint8_t escSerialReadByte(serialPort_t *instance)
{
    uint8_t ch;

    if ((instance->mode & MODE_RX) == 0) {
        return 0;
    }

    if (escSerialTotalBytesWaiting(instance) == 0) {
        return 0;
    }

    ch = instance->rxBuffer[instance->rxBufferTail];
    instance->rxBufferTail = (instance->rxBufferTail + 1) % instance->rxBufferSize;
    return ch;
}

void escSerialWriteByte(serialPort_t *s, uint8_t ch)
{
    if ((s->mode & MODE_TX) == 0) {
        return;
    }

    s->txBuffer[s->txBufferHead] = ch;
    s->txBufferHead = (s->txBufferHead + 1) % s->txBufferSize;
}

void escSerialSetBaudRate(serialPort_t *s, uint32_t baudRate)
{
    UNUSED(s);
    UNUSED(baudRate);
}

void escSerialSetMode(serialPort_t *instance, portMode_t mode)
{
    instance->mode = mode;
}

bool isEscSerialTransmitBufferEmpty(serialPort_t *instance)
{
	// start listening
    return instance->txBufferHead == instance->txBufferTail;
}

const struct serialPortVTable escSerialVTable[] = {
    {
        escSerialWriteByte,
        escSerialTotalBytesWaiting,
        escSerialReadByte,
        escSerialSetBaudRate,
        isEscSerialTransmitBufferEmpty,
        escSerialSetMode,
    }
};

void escEnablePassthrough(serialPort_t *escPassthroughPort, uint16_t output)
{
    LED0_OFF;
    LED1_OFF;
    StopPwmAllMotors();
    passPort = escPassthroughPort;
    escPort = openEscSerial(ESCSERIAL1, NULL, output);

    while(1) {
        if (serialTotalBytesWaiting(escPort)) {
            LED0_ON;
            while(serialTotalBytesWaiting(escPort))
            	serialWrite(escPassthroughPort, serialRead(escPort));
            LED0_OFF;
        }
        if (serialTotalBytesWaiting(escPassthroughPort)) {
            LED1_ON;
            while(serialTotalBytesWaiting(escPassthroughPort))
            	serialWrite(escPort, serialRead(escPassthroughPort));
            LED1_OFF;
        }
    }
}


#endif
