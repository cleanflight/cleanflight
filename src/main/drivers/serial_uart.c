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
 * Authors:
 * Dominic Clifton - Serial port abstraction, Separation of common STM32 code for cleanflight, various cleanups.
 * Hamasaki/Timecop - Initial baseflight code
*/
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "platform.h"

#include "build_config.h"

#include "common/utils.h"
#include "gpio.h"
#include "inverter.h"

#include "serial.h"
#include "serial_uart.h"

uartPort_t *serialUSART1(uint32_t baudRate, portMode_t mode);
uartPort_t *serialUSART2(uint32_t baudRate, portMode_t mode);
uartPort_t *serialUSART3(uint32_t baudRate, portMode_t mode);
uartPort_t *serialUSART6(uint32_t baudRate, portMode_t mode);

static void uartReconfigure(uartPort_t *uartPort)
{
    USART_InitTypeDef USART_InitStructure;
    USART_Cmd(uartPort->USARTx, DISABLE);

    USART_InitStructure.USART_BaudRate = uartPort->port.baudRate;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    if (uartPort->port.mode & MODE_SBUS) {
        USART_InitStructure.USART_StopBits = USART_StopBits_2;
        USART_InitStructure.USART_Parity = USART_Parity_Even;
    } else {
        USART_InitStructure.USART_StopBits = USART_StopBits_1;
        USART_InitStructure.USART_Parity = USART_Parity_No;
    }
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = 0;
    if (uartPort->port.mode & MODE_RX)
        USART_InitStructure.USART_Mode |= USART_Mode_Rx;
    if (uartPort->port.mode & MODE_TX)
        USART_InitStructure.USART_Mode |= USART_Mode_Tx;
    if (uartPort->port.mode & MODE_BIDIR)
        USART_InitStructure.USART_Mode |= USART_Mode_Tx | USART_Mode_Rx;

    USART_Init(uartPort->USARTx, &USART_InitStructure);
    USART_Cmd(uartPort->USARTx, ENABLE);
}

serialPort_t *uartOpen(USART_TypeDef *USARTx, serialReceiveCallbackPtr callback, uint32_t baudRate, portMode_t mode, serialInversion_e inversion)
{
    UNUSED(inversion);

    uartPort_t *s = NULL;

#ifdef INVERTER
    if (inversion == SERIAL_INVERTED && USARTx == INVERTER_USART) {
        // Enable hardware inverter if available.
        INVERTER_ON;
    }
#endif

    if (USARTx == USART1) {
        s = serialUSART1(baudRate, mode);
#ifdef USE_USART2
    } else if (USARTx == USART2) {
        s = serialUSART2(baudRate, mode);
#endif
#ifdef USE_USART3
    } else if (USARTx == USART3) {
        s = serialUSART3(baudRate, mode);
#endif
#ifdef USE_USART6
    } else if (USARTx == USART6) {
        s = serialUSART6(baudRate, mode);
#endif
    } else {
        return (serialPort_t *)s;
    }
    s->txDMAEmpty = true;

    // common serial initialisation code should move to serialPort::init()
    s->port.rxBufferHead = s->port.rxBufferTail = 0;
    s->port.txBufferHead = s->port.txBufferTail = 0;
    // callback works for IRQ-based RX ONLY
    s->port.callback = callback;
    s->port.mode = mode;
    s->port.baudRate = baudRate;

#if 1 // FIXME use inversion on STM32F3
    s->port.inversion = SERIAL_NOT_INVERTED;
#else
    s->port.inversion = inversion;
#endif

    uartReconfigure(s);

    // Receive DMA or IRQ
    DMA_InitTypeDef DMA_InitStructure;
    if ((mode & MODE_RX) || (mode & MODE_BIDIR)) {
        if (s->rxDMAStream) {
#ifdef STM32F40_41xxx
			DMA_StructInit(&DMA_InitStructure);
			DMA_InitStructure.DMA_PeripheralBaseAddr = s->rxDMAPeripheralBaseAddr;
			DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
			DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
			DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
			DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
			DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
			DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable ;
			DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_1QuarterFull ;
			DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single ;
			DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
#else
			DMA_StructInit(&DMA_InitStructure);
			DMA_InitStructure.DMA_PeripheralBaseAddr = s->rxDMAPeripheralBaseAddr;
			DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
			DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
			DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
			DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
			DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
			DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
#endif

            DMA_InitStructure.DMA_BufferSize = s->port.rxBufferSize;
#ifdef STM32F40_41xxx
            DMA_InitStructure.DMA_Channel = s->rxDMAChannel; //USARTx_RX_DMA_CHANNEL ;
            DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory;
            DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
            DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)s->port.rxBuffer;
#else
            DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
            DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
            DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)s->port.rxBuffer;
#endif
            DMA_DeInit(s->rxDMAStream);
            DMA_Init(s->rxDMAStream, &DMA_InitStructure);
            DMA_Cmd(s->rxDMAStream, ENABLE);
            USART_DMACmd(s->USARTx, USART_DMAReq_Rx, ENABLE);
            s->rxDMAPos = DMA_GetCurrDataCounter(s->rxDMAStream);
        } else {
            USART_ClearITPendingBit(s->USARTx, USART_IT_RXNE);
            USART_ITConfig(s->USARTx, USART_IT_RXNE, ENABLE);
        }
    }

    // Transmit DMA or IRQ
    if ((mode & MODE_TX) || (mode & MODE_BIDIR)) {
        if (s->txDMAStream) {
#ifdef STM32F40_41xxx
			DMA_StructInit(&DMA_InitStructure);
			DMA_InitStructure.DMA_PeripheralBaseAddr = s->txDMAPeripheralBaseAddr;
			DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
			DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
			DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
			DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
			DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
			DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable ;
			DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_1QuarterFull ;
			DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single ;
			DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
#else
			DMA_StructInit(&DMA_InitStructure);
			DMA_InitStructure.DMA_PeripheralBaseAddr = s->rxDMAPeripheralBaseAddr;
			DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
			DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
			DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
			DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
			DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
			DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
#endif

            DMA_InitStructure.DMA_BufferSize = s->port.txBufferSize;
#ifdef STM32F40_41xxx
            DMA_InitStructure.DMA_Channel = s->txDMAChannel;
            DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
            DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
            DMA_DeInit(s->txDMAStream);
            DMA_Init(s->txDMAStream, &DMA_InitStructure);
            DMA_ITConfig(s->txDMAStream, DMA_IT_TC|DMA_IT_FE|DMA_IT_TE|DMA_IT_DME, ENABLE);
            DMA_SetCurrDataCounter(s->txDMAStream, 0);
#else
            DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
            DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
            DMA_DeInit(s->txDMAChannel);
            DMA_Init(s->txDMAChannel, &DMA_InitStructure);
            DMA_ITConfig(s->txDMAChannel, DMA_IT_TC, ENABLE);
            DMA_SetCurrDataCounter(s->txDMAChannel, 0);
            s->txDMAChannel->CNDTR = 0;
#endif
            USART_DMACmd(s->USARTx, USART_DMAReq_Tx, ENABLE);
        } else {
            USART_ITConfig(s->USARTx, USART_IT_TXE, ENABLE);
        }
    }

    USART_Cmd(s->USARTx, ENABLE);

    if (mode & MODE_BIDIR)
        USART_HalfDuplexCmd(s->USARTx, ENABLE);
    else
        USART_HalfDuplexCmd(s->USARTx, DISABLE);

    return (serialPort_t *)s;
}

void uartSetBaudRate(serialPort_t *instance, uint32_t baudRate)
{
    uartPort_t *uartPort = (uartPort_t *)instance;
    uartPort->port.baudRate = baudRate;
    uartReconfigure(uartPort);
}

void uartSetMode(serialPort_t *instance, portMode_t mode)
{
    uartPort_t *uartPort = (uartPort_t *)instance;
    uartPort->port.mode = mode;
    uartReconfigure(uartPort);
}

void uartStartTxDMA(uartPort_t *s)
{
#ifdef STM32F40_41xxx
    DMA_Cmd(s->txDMAStream, DISABLE);
	DMA_MemoryTargetConfig(s->txDMAStream,(uint32_t)&s->port.txBuffer[s->port.txBufferTail],DMA_Memory_0);
    //s->txDMAStream->M0AR = (uint32_t)&s->port.txBuffer[s->port.txBufferTail];
    if (s->port.txBufferHead > s->port.txBufferTail) {
        s->txDMAStream->NDTR = s->port.txBufferHead - s->port.txBufferTail;
        s->port.txBufferTail = s->port.txBufferHead;
    } else {
        s->txDMAStream->NDTR = s->port.txBufferSize - s->port.txBufferTail;
        s->port.txBufferTail = 0;
    }
    s->txDMAEmpty = false;
    DMA_Cmd(s->txDMAStream, ENABLE);
#else
    s->txDMAChannel->CMAR = (uint32_t)&s->port.txBuffer[s->port.txBufferTail];
    if (s->port.txBufferHead > s->port.txBufferTail) {
        s->txDMAChannel->CNDTR = s->port.txBufferHead - s->port.txBufferTail;
        s->port.txBufferTail = s->port.txBufferHead;
    } else {
        s->txDMAChannel->CNDTR = s->port.txBufferSize - s->port.txBufferTail;
        s->port.txBufferTail = 0;
    }
    s->txDMAEmpty = false;
    DMA_Cmd(s->txDMAChannel, ENABLE);
#endif
}

uint8_t uartTotalBytesWaiting(serialPort_t *instance)
{
    uartPort_t *s = (uartPort_t*)instance;
#ifdef STM32F40_41xxx
    if (s->rxDMAStream) {
        uint32_t rxDMAHead = s->rxDMAStream->NDTR;
#else
    if (s->rxDMAChannel) {
        uint32_t rxDMAHead = s->rxDMAChannel->CNDTR;
#endif
        if (rxDMAHead >= s->rxDMAPos) {
            return rxDMAHead - s->rxDMAPos;
        } else {
            return s->port.rxBufferSize + rxDMAHead - s->rxDMAPos;
        }
    }

    if (s->port.rxBufferHead >= s->port.rxBufferTail) {
        return s->port.rxBufferHead - s->port.rxBufferTail;
    } else {
        return s->port.rxBufferSize + s->port.rxBufferHead - s->port.rxBufferTail;
    }
}

bool isUartTransmitBufferEmpty(serialPort_t *instance)
{
    uartPort_t *s = (uartPort_t *)instance;
#ifdef STM32F40_41xxx
    if (s->txDMAStream)
#else
    if (s->txDMAChannel)
#endif
        return s->txDMAEmpty;
    else
        return s->port.txBufferTail == s->port.txBufferHead;
}

uint8_t uartRead(serialPort_t *instance)
{
    uint8_t ch;
    uartPort_t *s = (uartPort_t *)instance;

#ifdef STM32F40_41xxx
    if (s->rxDMAStream) {
#else
    if (s->rxDMAChannel) {
#endif
    	ch = s->port.rxBuffer[s->port.rxBufferSize - s->rxDMAPos];
        if (--s->rxDMAPos == 0)
            s->rxDMAPos = s->port.rxBufferSize;
    } else {
        ch = s->port.rxBuffer[s->port.rxBufferTail];
        if (s->port.rxBufferTail + 1 >= s->port.rxBufferSize) {
            s->port.rxBufferTail = 0;
        } else {
            s->port.rxBufferTail++;
        }
    }

    return ch;
}

void uartWrite(serialPort_t *instance, uint8_t ch)
{
    uartPort_t *s = (uartPort_t *)instance;
    s->port.txBuffer[s->port.txBufferHead] = ch;
    if (s->port.txBufferHead + 1 >= s->port.txBufferSize) {
        s->port.txBufferHead = 0;
    } else {
        s->port.txBufferHead++;
    }

#ifdef STM32F40_41xxx
    if (s->txDMAStream) {
        if (!(s->txDMAStream->CR & 1))
#else
    if (s->txDMAChannel) {
        if (!(s->txDMAChannel->CCR & 1))
#endif
            uartStartTxDMA(s);
    } else {
        USART_ITConfig(s->USARTx, USART_IT_TXE, ENABLE);
    }
}

const struct serialPortVTable uartVTable[] = {
    {
        uartWrite,
        uartTotalBytesWaiting,
        uartRead,
        uartSetBaudRate,
        isUartTransmitBufferEmpty,
        uartSetMode,
    }
};
