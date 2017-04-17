/******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
* Company            : STMicroelectronics
* Author             : MCD Application Team
* Description        : STMicroelectronics Device Firmware Upgrade Extension Demo
* Version            : V3.0.2
* Date               : 09-May-2011
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*******************************************************************************/

#ifndef _DOWNLOAD_THREAD_H_
#define _DOWNLOAD_THREAD_H_

#define SPECIAL_COMMAND_ERASE_ALL_SECTORS	0xFFFF

#define ERASE_TIME_INTERVAL			1000

typedef struct
{
	DWORD NBlock;
	DWORD Length;
} VALIDBLOCK, *PVALIDBLOCK;

class CDownloadThread : public CDFUThread {
public:
	CDownloadThread(PDFUThreadContext pContext);
	virtual ~CDownloadThread();
private:
	BOOL		RunThread();
};
#endif
