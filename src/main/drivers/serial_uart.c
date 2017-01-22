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


#include <includes.h>
#include <mraa.h>
#include "serial_uart.h"
//#include <vcp/hw_config.h>
#include <drivers/system.h>
#include <platform.h>

#include "build/build_config.h"

#include "common/utils.h"
//#include "gpio.h"
//#include "inverter.h"

//#include "dma.h"
#include "serial.h"

//#include "serial_uart_impl.h"


#define edison_port "/dev/ttyMFD2";
#define PC_port "/dev/ttyUSB0";



bool data_available = false;
bool data_read = true;

char temp_buff[100];
int temp_data_len;
int read_pos;


uartPort_t USB;

LINE_CODING linecoding = 
{ 
    115200, /* baud rate*/
    0x00, /* stop bits-1*/
    0x00, /* parity - none*/
    0x08 /* no. of bits 8*/
};

//Serial file name

char portname[20] = edison_port;

int rdlen;                                  //for measring the number of data bytes read


serialPort_t usb_port;

static const struct serialPortVTable usbTable[] = {
    {
        .serialWrite = usbVcpWrite,                                     //used
        .serialTotalRxWaiting = serial_waiting,                         //used
        .serialTotalTxFree = usbTxBytesFree,                            //not used
        .serialRead = usbVcpRead,                                       //used
        .serialSetBaudRate = usbVcpSetBaudRate,                         //used only in gps
        .isSerialTransmitBufferEmpty = usb_txbuffer_empty,              //used
        .setMode = usbVcpSetMode,                                       //used, TBD
        .beginWrite = NULL,                                             //not needed
        .endWrite = NULL,                                               //not needed
        .writeBuf = NULL                                                //not needed
    }
};

void usartInitAllIOSignals(void)        //usartIrqHandler() not setup in the original version of cleanflight in this function
{
#ifdef EDISON
    USB.deviceState = UNCONNECTED;
    USB.port = usb_port;
    USB.port.vTable = usbTable;
    //usbInit();
#endif
}


serialPort_t* usbInit(void)
{
    int fd = usbOpen();
    //sleep(2); //required to make flush work, for some reason
    tcflush(fd,TCIOFLUSH);
    SetUsbAttributes(fd);    
    return &USB.port;
}


int usbOpen(void)
{
    int fd = open(portname, O_RDWR | O_NOCTTY | O_SYNC | O_NONBLOCK);
    if (fd < 0) {
        printf("Error opening %s: %s\n", portname, strerror(errno));
        exit(EXIT_FAILURE);
    }
    USB.fd = fd;
    USB.deviceState = CONFIGURED;
    return fd;
}


void SetUsbAttributes(int fd)       //UART characteristics hardcoded here!!!
{
    struct termios tty;

    if (tcgetattr(fd, &tty) < 0) {
        printf("Error from tcgetattr: %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }

    cfsetospeed(&tty, (speed_t)(linecoding.bitrate));
    cfsetispeed(&tty, (speed_t)(linecoding.bitrate));


    //These values are hardcoded for now
    //Todo is to change this based on the value defined in the struct LINE_CODING
    tty.c_cflag |= (CLOCAL | CREAD);    //ignore modem controls
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag |= CS8;         //8-bit characters
    tty.c_cflag &= ~PARENB;     //no parity bit
    tty.c_cflag &= ~CSTOPB;     //only need 1 stop bit
    tty.c_cflag &= ~CRTSCTS;    //no hardware flowcontrol

    if (tcsetattr(fd, TCSANOW, &tty) != 0) {
        printf("Error from tcsetattr: %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }
    return;
 
}


uint32_t usbWrite(uint8_t* str, int len)
{
    //Don't write if USB is not connected
    if(usbIsConnected() == false)
    {
        printf("USB not connected\t%d\n",USB.deviceState);
        return -1;
    }
    int wlen;
    wlen = write(USB.fd, str, len);
    return wlen;
}


int32_t usbRead(uint8_t* buf, int len)
{
    if(!data_available)
    {
        //TBD
    }
    else
    {
        read_pos++;
        if(read_pos <= temp_data_len)
        {
            *buf = temp_buff[read_pos-1];
            return 1;
        }

        else
        {
            data_read = true;
            data_available = false;
            return -1;
        }
    }
}

uint8_t usbIsConnected(void)
{
    if(USB.deviceState != UNCONNECTED)
        return true;
    else
        return false;
}

uint8_t usbIsConfigured(void)
{
    return (USB.deviceState == CONFIGURED);
}

void EP3_OUT_Callback(void)
{
    receiveLength = rdlen;                                                            // HJI  
    //PMAToUserBufferCopy((unsigned char*)receiveBuffer, ENDP3_RXADDR, receiveLength);  // HJI
}

uint32_t Virtual_Com_Port_GetBaudRate(void)
{
    return linecoding.bitrate;
}

bool usb_txbuffer_empty(serialPort_t *instance)
{
    return true;
}

void usb_txbuffer_flush(serialPort_t *instance)
{
    return;
}

uint8_t serial_waiting(serialPort_t *instance)
{
    
    if(!data_read)
    {
        return 1;
    }    

    UNUSED(instance);
    fd_set readset;                             //for the select function
    FD_ZERO(&readset);
    FD_SET(USB.fd, &readset);
    uint32_t result;
        
    struct timeval tv = {SELECT_TIMEOUT, SELECT_TIMEOUT_US};   // sleep for ten minutes!

    result = select(USB.fd + 1, &readset, NULL, NULL, &tv);

    if(result > 0)
    {
        temp_data_len = read(USB.fd, temp_buff, sizeof(temp_buff));
        data_available = true;
        data_read = false;
        read_pos = 0;
    }

    //printf("result:%d\n",result);
    
    return result;
}



//Wrapper functions

static void usbVcpWrite(serialPort_t *instance, uint8_t c)
{
    usbWrite(&c,1);
}


uint8_t usbTxBytesFree(serialPort_t *instance)
{
    // Because we block upon transmit and don't buffer bytes, our "buffer" capacity is effectively unlimited.
    UNUSED(instance);
    return 255;
}

static uint8_t usbVcpRead(serialPort_t *instance)
{
    UNUSED(instance);

    uint8_t buf;

    int len = usbRead(&buf, 1);

    return buf;
}

static void usbVcpSetBaudRate(serialPort_t *instance, uint32_t baudRate)
{
    UNUSED(instance);
    UNUSED(baudRate);
    return;
    //does nothing for now
}

static void usbVcpSetMode(serialPort_t *instance, portMode_t mode)
{
    UNUSED(instance);
    UNUSED(mode);

    // TODO implement
}

serialPort_t* usbVcpOpen(void)
{
    serialPort_t *s = usbInit();

    return (serialPort_t *)s;
}


/*
static void usartConfigurePinInversion(uartPort_t *uartPort)
{
#if !defined(INVERTER) && !defined(STM32F303xC)
    UNUSED(uartPort);
#else
    bool inverted = uartPort->port.options & SERIAL_INVERTED;

#ifdef INVERTER
    if (inverted && uartPort->USARTx == INVERTER_USART) {
        // Enable hardware inverter if available.
        INVERTER_ON;
    }
#endif

#ifdef STM32F303xC
    uint32_t inversionPins = 0;

    if (uartPort->port.mode & MODE_TX) {
        inversionPins |= USART_InvPin_Tx;
    }
    if (uartPort->port.mode & MODE_RX) {
        inversionPins |= USART_InvPin_Rx;
    }

    USART_InvPinCmd(uartPort->USARTx, inversionPins, inverted ? ENABLE : DISABLE);
#endif
#endif
}

static void uartReconfigure(uartPort_t *uartPort)
{
    USART_InitTypeDef USART_InitStructure;
    USART_Cmd(uartPort->USARTx, DISABLE);

    USART_InitStructure.USART_BaudRate = uartPort->port.baudRate;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;

    USART_InitStructure.USART_StopBits = (uartPort->port.options & SERIAL_STOPBITS_2) ? USART_StopBits_2 : USART_StopBits_1;
    USART_InitStructure.USART_Parity   = (uartPort->port.options & SERIAL_PARITY_EVEN) ? USART_Parity_Even : USART_Parity_No;

    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = 0;
    if (uartPort->port.mode & MODE_RX)
        USART_InitStructure.USART_Mode |= USART_Mode_Rx;
    if (uartPort->port.mode & MODE_TX)
        USART_InitStructure.USART_Mode |= USART_Mode_Tx;

    USART_Init(uartPort->USARTx, &USART_InitStructure);

    usartConfigurePinInversion(uartPort);

    if(uartPort->port.options & SERIAL_BIDIR)
        USART_HalfDuplexCmd(uartPort->USARTx, ENABLE);
    else
        USART_HalfDuplexCmd(uartPort->USARTx, DISABLE);

    USART_Cmd(uartPort->USARTx, ENABLE);
}

serialPort_t *uartOpen(USART_TypeDef *USARTx, serialReceiveCallbackPtr callback, uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    uartPort_t *s = NULL;

    if (USARTx == USART1) {
        s = serialUART1(baudRate, mode, options);
#ifdef USE_UART2
    } else if (USARTx == USART2) {
        s = serialUART2(baudRate, mode, options);
#endif
#ifdef USE_UART3
    } else if (USARTx == USART3) {
        s = serialUART3(baudRate, mode, options);
#endif
#ifdef USE_UART4
    } else if (USARTx == UART4) {
        s = serialUART4(baudRate, mode, options);
#endif
#ifdef USE_UART5
    } else if (USARTx == UART5) {
        s = serialUART5(baudRate, mode, options);
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
    s->port.options = options;

    uartReconfigure(s);

    // Receive DMA or IRQ
    DMA_InitTypeDef DMA_InitStructure;
    if (mode & MODE_RX) {
        if (s->rxDMAChannel) {
            DMA_StructInit(&DMA_InitStructure);
            DMA_InitStructure.DMA_PeripheralBaseAddr = s->rxDMAPeripheralBaseAddr;
            DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
            DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
            DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
            DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
            DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
            DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;

            DMA_InitStructure.DMA_BufferSize = s->port.rxBufferSize;
            DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
            DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
            DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)s->port.rxBuffer;
            DMA_DeInit(s->rxDMAChannel);
            DMA_Init(s->rxDMAChannel, &DMA_InitStructure);
            DMA_Cmd(s->rxDMAChannel, ENABLE);
            USART_DMACmd(s->USARTx, USART_DMAReq_Rx, ENABLE);
            s->rxDMAPos = DMA_GetCurrDataCounter(s->rxDMAChannel);
        } else {
            USART_ClearITPendingBit(s->USARTx, USART_IT_RXNE);
            USART_ITConfig(s->USARTx, USART_IT_RXNE, ENABLE);
        }
    }

    // Transmit DMA or IRQ
    if (mode & MODE_TX) {
        if (s->txDMAChannel) {
            DMA_StructInit(&DMA_InitStructure);
            DMA_InitStructure.DMA_PeripheralBaseAddr = s->txDMAPeripheralBaseAddr;
            DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
            DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
            DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
            DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
            DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
            DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;

            DMA_InitStructure.DMA_BufferSize = s->port.txBufferSize;
            DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
            DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
            DMA_DeInit(s->txDMAChannel);
            DMA_Init(s->txDMAChannel, &DMA_InitStructure);
            DMA_ITConfig(s->txDMAChannel, DMA_IT_TC, ENABLE);
            DMA_SetCurrDataCounter(s->txDMAChannel, 0);
            s->txDMAChannel->CNDTR = 0;
            USART_DMACmd(s->USARTx, USART_DMAReq_Tx, ENABLE);
        } else {
            USART_ITConfig(s->USARTx, USART_IT_TXE, ENABLE);
        }
    }

    USART_Cmd(s->USARTx, ENABLE);

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
}

uint8_t uartTotalRxBytesWaiting(serialPort_t *instance)
{
    uartPort_t *s = (uartPort_t*)instance;
    if (s->rxDMAChannel) {
        uint32_t rxDMAHead = s->rxDMAChannel->CNDTR;
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

uint8_t uartTotalTxBytesFree(serialPort_t *instance)
{
    uartPort_t *s = (uartPort_t*)instance;

    uint32_t bytesUsed;

    if (s->port.txBufferHead >= s->port.txBufferTail) {
        bytesUsed = s->port.txBufferHead - s->port.txBufferTail;
    } else {
        bytesUsed = s->port.txBufferSize + s->port.txBufferHead - s->port.txBufferTail;
    }

    if (s->txDMAChannel) {
        
         // When we queue up a DMA request, we advance the Tx buffer tail before the transfer finishes, so we must add
         // the remaining size of that in-progress transfer here instead:
         
        bytesUsed += s->txDMAChannel->CNDTR;

        
        //  If the Tx buffer is being written to very quickly, we might have advanced the head into the buffer
        //  space occupied by the current DMA transfer. In that case the "bytesUsed" total will actually end up larger
        //  than the total Tx buffer size, because we'll end up transmitting the same buffer region twice. (So we'll be
        //  transmitting a garbage mixture of old and new bytes).
         
        //  Be kind to callers and pretend like our buffer can only ever be 100% full.
         
        if (bytesUsed >= s->port.txBufferSize - 1) {
            return 0;
        }
    }

    return (s->port.txBufferSize - 1) - bytesUsed;
}

bool isUartTransmitBufferEmpty(serialPort_t *instance)
{
    uartPort_t *s = (uartPort_t *)instance;
    if (s->txDMAChannel)
        return s->txDMAEmpty;
    else
        return s->port.txBufferTail == s->port.txBufferHead;
}

uint8_t uartRead(serialPort_t *instance)                    //If dma not defined, then the uart buffer is read directly
{                                                           //So the edison not having dma is not a problem
    uint8_t ch;
    uartPort_t *s = (uartPort_t *)instance;

    if (s->rxDMAChannel) {
        ch = s->port.rxBuffer[s->port.rxBufferSize - s->rxDMAPos];
        if (--s->rxDMAPos == 0)
            s->rxDMAPos = s->port.rxBufferSize;
    } else {                                                                    //DMA not defined for UART
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

    if (s->txDMAChannel) {
        if (!(s->txDMAChannel->CCR & 1))
            uartStartTxDMA(s);
    } else {
        USART_ITConfig(s->USARTx, USART_IT_TXE, ENABLE);
    }
}

const struct serialPortVTable uartVTable[] = {
    {
        uartWrite,
        uartTotalRxBytesWaiting,
        uartTotalTxBytesFree,
        uartRead,
        uartSetBaudRate,
        isUartTransmitBufferEmpty,
        uartSetMode,
        .writeBuf = NULL,
        .beginWrite = NULL,
        .endWrite = NULL,
    }
};
*/