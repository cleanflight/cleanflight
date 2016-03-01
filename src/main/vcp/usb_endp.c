/**
 ******************************************************************************
 * @file    usb_endp.c
 * @author  MCD Application Team
 * @version V4.0.0
 * @date    21-January-2013
 * @brief   Endpoint routines
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
#include "usb_lib.h"
#include "usb_desc.h"
#include "usb_mem.h"
#include "hw_config.h"
#include "usb_istr.h"
#include "usb_pwr.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/

/* Interval between sending IN packets in frame number (1 frame = 1ms) */
#define VCOMPORT_IN_FRAME_INTERVAL             5
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
__IO uint32_t receiveLength;             // HJI
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/*******************************************************************************
 * Function Name  : EP1_IN_Callback
 * Description    :
 * Input          : None.
 * Output         : None.
 * Return         : None.
 *******************************************************************************/
void EP1_IN_Callback(void)
{
    transmitting=0;             // allow next send
}

/*******************************************************************************
 * Function Name  : EP3_OUT_Callback
 * Description    :
 * Input          : None.
 * Output         : None.
 * Return         : None.
 *******************************************************************************/
void EP3_OUT_Callback(void)
{
    uint16_t count;                              // number of bytes received
    uint8_t buffer[VIRTUAL_COM_PORT_DATA_SIZE*4];   // work
    uint8_t *bp=buffer;                           // buffer pointer

    count=GetEPRxCount(ENDP3);                           // bytes pending
    receiveLength+=count;
    PMAToUserBufferCopy(buffer, ENDP3_RXADDR, count);    // make safe copy

    // add new bytes to bget (if overrun, discard)
    for (; count>0; count--, bp++) {
      uint8_t *next=bgetwrite+1;                  // -> where *next* byte will go
      if (next==bget+BGETSIZE) next=bget;      // wrap
      if (next==bgetread)
    	  break;               // would overrun
      *bgetwrite=*bp;
      bgetwrite=next;
    }

    SetEPRxValid(ENDP3);                       // ready for next
}	// EP3_OUT_Callback


/* --------------------------------------------------------------- */
/* SOF_Callback -- called by USB library on frame start            */
/*                                                                 */
/* The device is polled by the host every 1ms; this callback is    */
/* then invoked.                                                   */
/* --------------------------------------------------------------- */
#define INIT_TIMEOUT 250
#define WAIT_TIMEOUT 250
void SOF_Callback(void) {
  static uint32_t FrameCount = 0;

  //if (FrameCount++ == VCOMPORT_IN_FRAME_INTERVAL)
  {
	  /* Reset the frame counter */
	  FrameCount = 0;

	  static int init=INIT_TIMEOUT;   // initial delay
	  static int waited=0;            // time waiting since last transmit
	  packet *next;                    // work

	  // check if there are data to send; if there are then if the
	  // terminal is there and if vcomPutc is not updating pointers then
	  // looks promising to start a transmit
	  if (bputread->count==0           // nothing to send                    // no receiver
	   || bputbusy) return;            // locked out

	  // also quit if transmission in progress; transmitting might never
	  // get cleared if the host connection is lost; so check timeout if
	  // waiting; if the timeout has expired then force through another
	  // transmit -- however in practice a full reset is probably needed
	  if (transmitting) {                   // busy
		waited++;
		if (waited<=WAIT_TIMEOUT) return;   // carry on waiting
		// here when timeout occurs -- for sure no terminal application
		}

	  // some terminals connect before finishing screen build, so when
	  // first called delay before sending first transmission
	  if (init>0) {
		init--;
		return;
		}

	  // (the following code could be made into a local function and then
	  // also called from EP1_IN_Callback if there are bytes to send;
	  // this would avoid waiting up to 1ms for the next host poll)

	  // ready to transmit
	  transmitting=1;                  // state
	  waited=0;                        // reset timeout

	  // copy byte(s) to usb packet-memory-area for end point 1
	  UserToPMABufferCopy(bputread->data, ENDP1_TXADDR, bputread->count);
	  SetEPTxCount(ENDP1, bputread->count);  // set count of bytes to send
	  SetEPTxValid(ENDP1);             // enable endpoint for transmission

	  // show the packet as empty (free for reuse)
	  bputread->count=0;               // indicate data sent

	  // if the next packet has data pending, the write pointer, having
	  // writ the packet just sent, has moved on; step to the next packet
	  // so it will be sent in due course

	  next=bputread+1;
	  if (next==&bput[BPUTSIZE])
		  next=bput; // wrap
	  if (next->count!=0)
		  bputread=next;    // step to it
  }
} // SOF_Callback


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
