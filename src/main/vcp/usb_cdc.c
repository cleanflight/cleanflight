#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "platform.h"

#include "build_config.h"

#include "common/maths.h"

#include "usb_init.h"
#include "usb_regs.h"
#include "usb_mem.h"

#include "vcp/hw_config.h"

#include "drivers/serial_usb_vcp.h"

#include "usb_cdc.h"

#define ENDP_TX ENDP1
#define ENDP_TX_TXADDR ENDP1_TXADDR
#define ENDP_RX ENDP3
#define ENDP_RX_RXADDR ENDP3_RXADDR

// initialize USB subsystem
void USBCDC_Init(void)
{
    Set_System();
    Set_USBClock();
    USB_Interrupts_Config();
    USB_Init();
}

// check if we are connected to host
bool USBCDC_IsConnected(void)
{
    return usbIsConnected() && usbIsConfigured();
}

// prepare new data to be sent if IN endpoint is empty
void USBCDC_TryTx(void)
{
    if((GetEPTxStatus(ENDP_TX) & EPTX_STAT) == EP_TX_NAK) { //check if endpoint is empty
        uint8_t *txData;
        int txLen = vcpGetTxData(&vcpPort, &txData);
        if(txLen > 0) {
            txLen = MIN(txLen, 64 / 2);
            UserToPMABufferCopy(txData, ENDP_TX_TXADDR, txLen);
            SetEPTxCount(ENDP_TX, txLen);
            SetEPTxValid(ENDP_TX);
            // ack transmitted data to serial driver
            vcpAckTxData(&vcpPort, txLen);
        }
    }
}

// called when new serial data arrive on OUT endpoint
void USBCDC_RxHandler(void)
{
    int rxLen = GetEPRxCount(ENDP_RX);
    int rxOfs = ENDP_RX_RXADDR;

     while(rxLen > 0) {
         uint8_t *rxDataPtr;
         int rxChunk = vcpGetRxDataBuffer(&vcpPort, &rxDataPtr);
         if(rxChunk <= 0) {
             // receive bufer if full or some error
             break;
         }
         rxChunk = MIN(rxChunk, rxLen);
         PMAToUserBufferCopy(rxDataPtr, rxOfs, rxChunk);
         rxLen -= rxChunk; rxOfs += rxChunk;
         vcpAckRxData(&vcpPort, rxChunk);
     }
     SetEPRxCount(ENDP_RX, 64);
     SetEPRxStatus(ENDP_RX, EP_RX_VALID);
}


// EP1 in callback - transmission finished
void EP1_IN_Callback(void)
{
    USBCDC_TryTx();
}

// EP3 out callback - data received
void EP3_OUT_Callback(void)
{
    USBCDC_RxHandler();
}
