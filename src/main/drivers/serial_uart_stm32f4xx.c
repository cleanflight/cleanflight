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
 * Dominic Clifton/Hydra - Various cleanups for Cleanflight
 * Bill Nesbitt - Code from AutoQuad
 * Hamasaki/Timecop - Initial baseflight code
*/

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "platform.h"

#include "system.h"
#include "gpio.h"
#include "nvic.h"

#include "serial.h"
#include "serial_uart.h"

// Using RX DMA disables the use of receive callbacks
//#define USE_USART1_RX_DMA
//#define USE_USART2_RX_DMA
//#define USE_USART3_RX_DMA
//#define USE_USART6_RX_DMA


#ifdef USE_USART1
static uartPort_t uartPort1;
#endif

#ifdef USE_USART2
static uartPort_t uartPort2;
#endif

#ifdef USE_USART3
static uartPort_t uartPort3;
#endif

#ifdef USE_USART6
static uartPort_t uartPort6;
#endif

void uartStartTxDMA(uartPort_t *s);

void usartIrqHandler(uartPort_t *s)
{

    if (!s->rxDMAStream && (USART_GetITStatus(s->USARTx, USART_IT_RXNE) == SET)) {
        if (s->port.callback) {
            s->port.callback(s->USARTx->DR);
        } else {
            s->port.rxBuffer[s->port.rxBufferHead] = s->USARTx->DR;
            s->port.rxBufferHead = (s->port.rxBufferHead + 1) % s->port.rxBufferSize;
        }
    }

    if (!s->txDMAStream && (USART_GetITStatus(s->USARTx, USART_IT_TXE) == SET)) {
        if (s->port.txBufferTail != s->port.txBufferHead) {
            USART_SendData(s->USARTx, s->port.txBuffer[s->port.txBufferTail]);
            s->port.txBufferTail = (s->port.txBufferTail + 1) % s->port.txBufferSize;
        } else {
            USART_ITConfig(s->USARTx, USART_IT_TXE, DISABLE);
        }
    }

    if (USART_GetITStatus(s->USARTx, USART_FLAG_ORE) == SET)
    {
        USART_ClearITPendingBit (s->USARTx, USART_IT_ORE);
    }
}


static void handleUsartTxDma(uartPort_t *s)
{
    DMA_Cmd(s->txDMAStream, DISABLE);

    if (s->port.txBufferHead != s->port.txBufferTail)
        uartStartTxDMA(s);
    else
        s->txDMAEmpty = true;
}


#ifdef USE_USART1
// USART1 - Telemetry (RX/TX by DMA)
uartPort_t *serialUSART1(uint32_t baudRate, portMode_t mode)
{
    uartPort_t *s;
    static volatile uint8_t rx1Buffer[UART1_RX_BUFFER_SIZE];
    static volatile uint8_t tx1Buffer[UART1_TX_BUFFER_SIZE];
    gpio_config_t gpio;
    NVIC_InitTypeDef NVIC_InitStructure;

    s = &uartPort1;
    s->port.vTable = uartVTable;
    
    s->port.baudRate = baudRate;
    
    s->port.rxBuffer = rx1Buffer;
    s->port.txBuffer = tx1Buffer;
    s->port.rxBufferSize = UART1_RX_BUFFER_SIZE;
    s->port.txBufferSize = UART1_TX_BUFFER_SIZE;
    
    s->USARTx = USART1;

    s->txDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;
    s->rxDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;

#ifdef USE_USART1_RX_DMA
    s->rxDMAChannel = DMA_Channel_4;
    s->rxDMAStream = DMA2_Stream5;
#endif
    s->txDMAChannel = DMA_Channel_4;
    //s->txDMAStream = DMA2_Stream7;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE);

    // USART1_TX    PA9
    // USART1_RX    PA10
    gpio.speed = Speed_50MHz;
    gpio.pin = Pin_9;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_TX)
        gpioInit(GPIOA, &gpio);
    gpio.mode = Mode_AF_OD;
    if (mode & MODE_BIDIR)
        gpioInit(GPIOA, &gpio);
    gpio.pin = Pin_10;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_RX)
        gpioInit(GPIOA, &gpio);

    GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_USART1);
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_USART1);

    // DMA TX Interrupt
    NVIC_InitStructure.NVIC_IRQChannel = DMA2_Stream7_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SERIALUART1_TXDMA);;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SERIALUART1_TXDMA);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

#ifndef USE_USART1_RX_DMA
    NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SERIALUART1);
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SERIALUART1);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
#endif

    return s;
}


// USART1 Tx DMA Handler
void DMA2_Stream7_IRQHandler(void)
{
    uartPort_t *s = &uartPort1;
    if(DMA_GetITStatus(s->txDMAStream,DMA_IT_TCIF7))
    {
    	DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_TCIF7);
    	DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_HTIF7);
		if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_FEIF7)==SET)
		{
			DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_FEIF7);
		}
		handleUsartTxDma(s);
    }
	if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_TEIF7)==SET)
	{
		DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_TEIF7);
	}
	if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_DMEIF7)==SET)
	{
		DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_DMEIF7);
	}
}

// USART1 Rx/Tx IRQ Handler
void USART1_IRQHandler(void)
{
    uartPort_t *s = &uartPort1;

    usartIrqHandler(s);
}

#endif

#ifdef USE_USART2
// USART2 - GPS or Spektrum or ?? (RX + TX by IRQ)
uartPort_t *serialUSART2(uint32_t baudRate, portMode_t mode)
{
    uartPort_t *s;
    static volatile uint8_t rx2Buffer[UART2_RX_BUFFER_SIZE];
    static volatile uint8_t tx2Buffer[UART2_TX_BUFFER_SIZE];
    gpio_config_t gpio;
    NVIC_InitTypeDef NVIC_InitStructure;

    s = &uartPort2;
    s->port.vTable = uartVTable;
    
    s->port.baudRate = baudRate;
    
    s->port.rxBufferSize = UART2_RX_BUFFER_SIZE;
    s->port.txBufferSize = UART2_TX_BUFFER_SIZE;
    s->port.rxBuffer = rx2Buffer;
    s->port.txBuffer = tx2Buffer;
    
    s->USARTx = USART2;

    s->txDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;
    s->rxDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);

    // USART2_TX    PA2
    // USART2_RX    PA3
    gpio.speed = Speed_2MHz;
    gpio.pin = Pin_2;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_TX)
        gpioInit(GPIOA, &gpio);
    gpio.mode = Mode_AF_OD;
    if (mode & MODE_BIDIR)
        gpioInit(GPIOA, &gpio);
    gpio.pin = Pin_3;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_RX)
        gpioInit(GPIOA, &gpio);

    // RX/TX Interrupt
    NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SERIALUART2);
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SERIALUART2);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    return s;
}


// USART2 Rx/Tx IRQ Handler
void USART2_IRQHandler(void)
{
    uartPort_t *s = &uartPort2;

    usartIrqHandler(s);
}

#endif

#ifdef USE_USART3
// USART3
uartPort_t *serialUSART3(uint32_t baudRate, portMode_t mode)
{
    uartPort_t *s;
    static volatile uint8_t rx3Buffer[UART3_RX_BUFFER_SIZE];
    static volatile uint8_t tx3Buffer[UART3_TX_BUFFER_SIZE];
    gpio_config_t gpio;
    NVIC_InitTypeDef NVIC_InitStructure;

    s = &uartPort3;
    s->port.vTable = uartVTable;

    s->port.baudRate = baudRate;

    s->port.rxBuffer = rx3Buffer;
    s->port.txBuffer = tx3Buffer;
    s->port.rxBufferSize = UART3_RX_BUFFER_SIZE;
    s->port.txBufferSize = UART3_TX_BUFFER_SIZE;

    s->USARTx = USART3;

    s->txDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;
    s->rxDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;


#ifdef USE_USART3_RX_DMA
    s->rxDMAChannel = DMA_Channel_4;
    s->rxDMAStream = DMA1_Stream1;
#endif
    s->txDMAChannel = DMA_Channel_4;
    s->txDMAStream = DMA1_Stream3;

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1, ENABLE);

#ifdef USART3_APB1_PERIPHERALS
    RCC_APB1PeriphClockCmd(USART3_APB1_PERIPHERALS, ENABLE);
#endif
#ifdef USART3_APB2_PERIPHERALS
    RCC_APB2PeriphClockCmd(USART3_APB2_PERIPHERALS, ENABLE);
#endif
#ifdef USART3_AHB1_PERIPHERALS
    RCC_AHB1PeriphClockCmd(USART3_AHB1_PERIPHERALS, ENABLE);
#endif

    gpio.speed = Speed_2MHz;
    gpio.pin = USART3_TX_PIN;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_TX)
        gpioInit(USART3_GPIO, &gpio);
    gpio.mode = Mode_AF_OD;
    if (mode & MODE_BIDIR)
        gpioInit(USART3_GPIO, &gpio);
    gpio.pin = USART3_RX_PIN;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_RX)
        gpioInit(USART3_GPIO, &gpio);

    GPIO_PinAFConfig(USART3_GPIO, GPIO_PinSource11, GPIO_AF_USART3);
    GPIO_PinAFConfig(USART3_GPIO, GPIO_PinSource10, GPIO_AF_USART3);

    // DMA TX Interrupt
    NVIC_InitStructure.NVIC_IRQChannel = DMA1_Stream3_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SERIALUART3_TXDMA);;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SERIALUART3_TXDMA);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

#ifndef USE_USART3_RX_DMA
    // RX/TX Interrupt
    NVIC_InitStructure.NVIC_IRQChannel = USART3_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SERIALUART3);
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SERIALUART3);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
#endif

    return s;
}
// USART3 Tx DMA Handler
void DMA1_Stream3_IRQHandler(void)
{
    uartPort_t *s = &uartPort3;
    if(DMA_GetITStatus(s->txDMAStream,DMA_IT_TCIF3))
    {
    	DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_TCIF3);
    	DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_HTIF3);
		if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_FEIF3)==SET)
		{
			DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_FEIF3);
		}
		handleUsartTxDma(s);
    }
	if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_TEIF3)==SET)
	{
		DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_TEIF3);
	}
	if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_DMEIF3)==SET)
	{
		DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_DMEIF3);
	}
}

void USART3_IRQHandler(void)
{
    uartPort_t *s = &uartPort3;

    usartIrqHandler(s);
}
#endif

#ifdef USE_USART6
// USART6
uartPort_t *serialUSART6(uint32_t baudRate, portMode_t mode)
{
    uartPort_t *s;
    static volatile uint8_t rx6Buffer[UART6_RX_BUFFER_SIZE];
    static volatile uint8_t tx6Buffer[UART6_TX_BUFFER_SIZE];
    gpio_config_t gpio;
    NVIC_InitTypeDef NVIC_InitStructure;

    s = &uartPort6;
    s->port.vTable = uartVTable;

    s->port.baudRate = baudRate;

    s->port.rxBuffer = rx6Buffer;
    s->port.txBuffer = tx6Buffer;
    s->port.rxBufferSize = UART6_RX_BUFFER_SIZE;
    s->port.txBufferSize = UART6_TX_BUFFER_SIZE;

    s->USARTx = USART6;

    s->txDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;
    s->rxDMAPeripheralBaseAddr = (uint32_t)&s->USARTx->DR;


#ifdef USE_USART6_RX_DMA
    s->rxDMAChannel = DMA_Channel_5;
    s->rxDMAStream = DMA2_Stream1;
#endif
    s->txDMAChannel = DMA_Channel_5;
    s->txDMAStream = DMA2_Stream6;

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE);

#ifdef USART6_APB1_PERIPHERALS
    RCC_APB1PeriphClockCmd(USART6_APB1_PERIPHERALS, ENABLE);
#endif
#ifdef USART6_APB2_PERIPHERALS
    RCC_APB2PeriphClockCmd(USART6_APB2_PERIPHERALS, ENABLE);
#endif
#ifdef USART6_AHB1_PERIPHERALS
    RCC_AHB1PeriphClockCmd(USART6_AHB1_PERIPHERALS, ENABLE);
#endif

    gpio.speed = Speed_2MHz;
    gpio.pin = USART6_TX_PIN;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_TX)
        gpioInit(USART6_GPIO, &gpio);
    gpio.mode = Mode_AF_OD;
    if (mode & MODE_BIDIR)
        gpioInit(USART6_GPIO, &gpio);
    gpio.pin = USART6_RX_PIN;
    gpio.mode = Mode_AF_PP;
    if (mode & MODE_RX)
        gpioInit(USART6_GPIO, &gpio);

    GPIO_PinAFConfig(USART6_GPIO, GPIO_PinSource6, GPIO_AF_USART6);
    GPIO_PinAFConfig(USART6_GPIO, GPIO_PinSource7, GPIO_AF_USART6);

    // DMA TX Interrupt
    NVIC_InitStructure.NVIC_IRQChannel = DMA2_Stream6_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SERIALUART6_TXDMA);;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SERIALUART6_TXDMA);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

#ifndef USE_USART6_RX_DMA
    // RX/TX Interrupt
    NVIC_InitStructure.NVIC_IRQChannel = USART6_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SERIALUART6);
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SERIALUART6);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
#endif

    return s;
}
// USART6 Tx DMA Handler
void DMA2_Stream6_IRQHandler(void)
{
    uartPort_t *s = &uartPort6;
    if(DMA_GetITStatus(s->txDMAStream,DMA_IT_TCIF6))
    {
    	DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_TCIF6);
    	DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_HTIF6);
		if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_FEIF6)==SET)
		{
			DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_FEIF6);
		}
		handleUsartTxDma(s);
    }
	if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_TEIF6)==SET)
	{
		DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_TEIF6);
	}
	if(DMA_GetFlagStatus(s->txDMAStream,DMA_IT_DMEIF6)==SET)
	{
		DMA_ClearITPendingBit(s->txDMAStream,DMA_IT_DMEIF6);
	}
}

void USART6_IRQHandler(void)
{
    uartPort_t *s = &uartPort6;

    usartIrqHandler(s);
}
#endif


