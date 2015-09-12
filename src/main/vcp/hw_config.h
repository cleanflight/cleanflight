/**
 ******************************************************************************
 * @file    hw_config.h
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HW_CONFIG_H
#define __HW_CONFIG_H

/* Includes ------------------------------------------------------------------*/
//#include "platform_config.h"
#include "usb_type.h"
#ifdef STM32F303
#include "stm32f30x.h"
#endif

#ifdef STM32F10X
#include "stm32f10x.h"
#endif

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported define -----------------------------------------------------------*/
#define MASS_MEMORY_START     0x04002000
#define BULK_MAX_PACKET_SIZE  0x00000040

/* Exported functions ------------------------------------------------------- */
void Set_System(void);
void Set_USBClock(void);
void Enter_LowPowerMode(void);
void Leave_LowPowerMode(void);
void USB_Interrupts_Config(void);
void USB_Cable_Config(FunctionalState NewState);
void Get_SerialNum(void);
uint32_t CDC_Send_DATA(uint8_t *ptrBuffer, uint8_t sendLength);  // HJI
uint32_t CDC_Receive_DATA(uint8_t* recvBuf, uint32_t len);       // HJI
uint8_t usbIsConfigured(void);  // HJI
uint8_t usbIsConnected(void);   // HJI
/* External variables --------------------------------------------------------*/

extern __IO uint32_t receiveLength;  // HJI
extern __IO uint32_t packetSent;     // HJI

#define  BPUTSIZE      5      // number of buffers in ring
#define  PACKETSIZE   64      // packet size to buffer (max. 64)
#define  BGETSIZE 256           // (one remains unused)
typedef struct {
  uint32_t count;                 // bytes pending (already filled)
  uint8_t data[PACKETSIZE];      // holds bytes
} packet;

// state
extern uint8_t started;        // 1 if active
extern uint8_t transmitting;   // 1 if wait for byte to be sent
extern uint8_t bputbusy;       // 1 while vcomPutc fiddles
extern uint8_t terminal;       // 1 if host terminal is active

extern packet bput[BPUTSIZE]; // ring of buffers
extern packet *bputread;      // next packet to send
extern packet *bputwrite;     // packet being filled

// vcomGetC circular buffer
extern uint8_t bget[BGETSIZE];   // input buffer
extern uint8_t *bgetread;        // next-to-read pointer
extern uint8_t *bgetwrite;       // next-to-write pointer


#endif  /*__HW_CONFIG_H*/
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
