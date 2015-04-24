/**
 ******************************************************************************
 * @file    hw_config.c
 * @author  MCD Application Team
 * @version V4.0.0
 * @date    21-January-2013
 * @brief   Hardware Configuration & Setup
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; COPYRIGHT 2013 STMicroelectronics</center></h2>
 *
 * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *
 *        http://www.st.com/software_license_agreement_liberty_v2
 *
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/

#include "stm32_it.h"
#include "platform.h"
#include "usb_lib.h"
#include "usb_prop.h"
#include "usb_desc.h"
#include "hw_config.h"
#include "usb_pwr.h"

#include <stdbool.h>
#include "drivers/system.h"
#include "drivers/nvic.h"

#include "build_config.h"


/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
ErrorStatus HSEStartUpStatus;
EXTI_InitTypeDef EXTI_InitStructure;
__IO uint32_t packetSent;                                     // HJI
extern __IO uint32_t receiveLength;                          // HJI

uint8_t receiveBuffer[64];                                   // HJI
uint32_t sendLength;                                          // HJI
static void IntToUnicode(uint32_t value, uint8_t *pbuf, uint8_t len);
/* Extern variables ----------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/*******************************************************************************
 * Function Name  : Set_System
 * Description    : Configures Main system clocks & power
 * Input          : None.
 * Return         : None.
 *******************************************************************************/
void Set_System(void)
{
#if !defined(STM32L1XX_MD) && !defined(STM32L1XX_HD) && !defined(STM32L1XX_MD_PLUS)
    GPIO_InitTypeDef GPIO_InitStructure;
#endif /* STM32L1XX_MD && STM32L1XX_XD */  

#if defined(USB_USE_EXTERNAL_PULLUP)
    GPIO_InitTypeDef GPIO_InitStructure;
#endif /* USB_USE_EXTERNAL_PULLUP */ 

    /*!< At this stage the microcontroller clock setting is already configured, 
     this is done through SystemInit() function which is called from startup
     file (startup_stm32f10x_xx.s) before to branch to application main.
     To reconfigure the default setting of SystemInit() function, refer to
     system_stm32f10x.c file
     */
#if defined(STM32L1XX_MD) || defined(STM32L1XX_HD)|| defined(STM32L1XX_MD_PLUS) || defined(STM32F37X) || defined(STM32F303xC)
    /* Enable the SYSCFG module clock */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
#endif /* STM32L1XX_XD */ 

    /*Pull down PA12 to create USB Disconnect Pulse*/     // HJI
#if defined(STM32F303xC)                                    // HJI
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);   // HJI

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;          // HJI
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;     // HJI
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;        // HJI
    GPIO_InitStructure.GPIO_OType = GPIO_OType_OD;        // HJI
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;     // HJI
#else
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE); // HJI

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;// HJI
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;// HJI
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_OD;// HJI
#endif

    GPIO_Init(GPIOA, &GPIO_InitStructure);                // HJI

    GPIO_ResetBits(GPIOA, GPIO_Pin_12);                   // HJI

    delay(200);                                           // HJI

    GPIO_SetBits(GPIOA, GPIO_Pin_12);                     // HJI

#if defined(STM32F37X) || defined(STM32F303xC)

    /*Set PA11,12 as IN - USB_DM,DP*/
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_12;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    /*SET PA11,12 for USB: USB_DM,DP*/
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource11, GPIO_AF_14);
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource12, GPIO_AF_14);

#endif /* STM32F37X  && STM32F303xC)*/
#if defined(STM32F10X)
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_12;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_OD;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
#endif

    /* Configure the EXTI line 18 connected internally to the USB IP */
    EXTI_ClearITPendingBit(EXTI_Line18);
    EXTI_InitStructure.EXTI_Line = EXTI_Line18;
    EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
    EXTI_InitStructure.EXTI_LineCmd = ENABLE;
    EXTI_Init(&EXTI_InitStructure);
}

/*******************************************************************************
 * Function Name  : Set_USBClock
 * Description    : Configures USB Clock input (48MHz)
 * Input          : None.
 * Return         : None.
 *******************************************************************************/
void Set_USBClock(void)
{
    /* Select USBCLK source */
    RCC_USBCLKConfig(RCC_USBCLKSource_PLLCLK_1Div5);

    /* Enable the USB clock */
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USB, ENABLE);
}

/*******************************************************************************
 * Function Name  : Enter_LowPowerMode
 * Description    : Power-off system clocks and power while entering suspend mode
 * Input          : None.
 * Return         : None.
 *******************************************************************************/
void Enter_LowPowerMode(void)
{
    /* Set the device state to suspend */
    bDeviceState = SUSPENDED;
}

/*******************************************************************************
 * Function Name  : Leave_LowPowerMode
 * Description    : Restores system clocks and power while exiting suspend mode
 * Input          : None.
 * Return         : None.
 *******************************************************************************/
void Leave_LowPowerMode(void)
{
    DEVICE_INFO *pInfo = &Device_Info;

    /* Set the device state to the correct state */
    if (pInfo->Current_Configuration != 0) {
        /* Device configured */
        bDeviceState = CONFIGURED;
    } else {
        bDeviceState = ATTACHED;
    }
    /*Enable SystemCoreClock*/
    SystemInit();
}

/*******************************************************************************
 * Function Name  : USB_Interrupts_Config
 * Description    : Configures the USB interrupts
 * Input          : None.
 * Return         : None.
 *******************************************************************************/
void USB_Interrupts_Config(void)
{
    NVIC_InitTypeDef NVIC_InitStructure;

    /* 2 bit for pre-emption priority, 2 bits for subpriority */
    NVIC_PriorityGroupConfig(NVIC_PRIORITY_GROUPING);     // is this really neccesary?

    /* Enable the USB interrupt */
    NVIC_InitStructure.NVIC_IRQChannel = USB_LP_CAN1_RX0_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_USB);
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_USB);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    /* Enable the USB Wake-up interrupt */
    NVIC_InitStructure.NVIC_IRQChannel = USBWakeUp_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_USB_WUP);
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_USB_WUP);
    NVIC_Init(&NVIC_InitStructure);
}

/*******************************************************************************
 * Function Name  : USB_Cable_Config
 * Description    : Software Connection/Disconnection of USB Cable
 * Input          : None.
 * Return         : Status
 *******************************************************************************/
void USB_Cable_Config(FunctionalState NewState)
{
    UNUSED(NewState);
}

/*******************************************************************************
 * Function Name  : Get_SerialNum.
 * Description    : Create the serial number string descriptor.
 * Input          : None.
 * Output         : None.
 * Return         : None.
 *******************************************************************************/
void Get_SerialNum(void)
{
    uint32_t Device_Serial0, Device_Serial1, Device_Serial2;

    Device_Serial0 = *(uint32_t*)ID1;
    Device_Serial1 = *(uint32_t*)ID2;
    Device_Serial2 = *(uint32_t*)ID3;

    Device_Serial0 += Device_Serial2;

    if (Device_Serial0 != 0) {
        IntToUnicode(Device_Serial0, &Virtual_Com_Port_StringSerial[2], 8);
        IntToUnicode(Device_Serial1, &Virtual_Com_Port_StringSerial[18], 4);
    }
}

/*******************************************************************************
 * Function Name  : HexToChar.
 * Description    : Convert Hex 32Bits value into char.
 * Input          : None.
 * Output         : None.
 * Return         : None.
 *******************************************************************************/
static void IntToUnicode(uint32_t value, uint8_t *pbuf, uint8_t len)
{
    uint8_t idx = 0;

    for (idx = 0; idx < len; idx++) {
        if (((value >> 28)) < 0xA) {
            pbuf[2 * idx] = (value >> 28) + '0';
        } else {
            pbuf[2 * idx] = (value >> 28) + 'A' - 10;
        }

        value = value << 4;

        pbuf[2 * idx + 1] = 0;
    }
}

/*******************************************************************************
 * Function Name  : Send DATA .
 * Description    : send the data received from the STM32 to the PC through USB  
 * Input          : None.
 * Output         : None.
 * Return         : None.
 *******************************************************************************/
uint32_t CDC_Send_DATA(uint8_t *ptrBuffer, uint8_t sendLength)
{
    /* Last transmission hasn't finished, abort */
    if (packetSent) {
        return 0;
    }

    // We can only put 64 bytes in the buffer
    if (sendLength > 64 / 2) {
        sendLength = 64 / 2;
    }

    // Try to load some bytes if we can
    if (sendLength) {
        UserToPMABufferCopy(ptrBuffer, ENDP1_TXADDR, sendLength);
        SetEPTxCount(ENDP1, sendLength);
        packetSent += sendLength;
        SetEPTxValid(ENDP1);
    }

    return sendLength;
}

/*******************************************************************************
 * Function Name  : Receive DATA .
 * Description    : receive the data from the PC to STM32 and send it through USB
 * Input          : None.
 * Output         : None.
 * Return         : None.
 *******************************************************************************/
uint32_t CDC_Receive_DATA(uint8_t* recvBuf, uint32_t len)
{
    static uint8_t offset = 0;
    uint8_t i;

    if (len > receiveLength) {
        len = receiveLength;
    }

    for (i = 0; i < len; i++) {
        recvBuf[i] = (uint8_t)(receiveBuffer[i + offset]);
    }

    receiveLength -= len;
    offset += len;

    /* re-enable the rx endpoint which we had set to receive 0 bytes */
    if (receiveLength == 0) {
        SetEPRxCount(ENDP3, 64);
        SetEPRxStatus(ENDP3, EP_RX_VALID);
        offset = 0;
    }

    return len;
}

/*******************************************************************************
 * Function Name  : usbIsConfigured.
 * Description    : Determines if USB VCP is configured or not
 * Input          : None.
 * Output         : None.
 * Return         : True if configured.
 *******************************************************************************/
uint8_t usbIsConfigured(void)
{
    return (bDeviceState == CONFIGURED);
}

/*******************************************************************************
 * Function Name  : usbIsConnected.
 * Description    : Determines if USB VCP is connected ot not
 * Input          : None.
 * Output         : None.
 * Return         : True if connected.
 *******************************************************************************/
uint8_t usbIsConnected(void)
{
    return (bDeviceState != UNCONNECTED);
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
