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

#include "stdafx.h"
#include "STThread.h"
#include "../STDFU/STDFU.h"
#include "STDFUPRTINC.h"
#include "../STDFUFILES/STDFUFILESINC.h"
#include "DFUThread.h"
#include "DownloadThread.h"
#include "image.h"

CDownloadThread::CDownloadThread(PDFUThreadContext pContext) : CDFUThread(pContext)
{
}

CDownloadThread::~CDownloadThread()
{
}

BOOL CDownloadThread::RunThread()
{
	DFUThreadContext Context;
	BOOL bRet=TRUE;
	BOOL bReDownload=FALSE;
	BOOL NeedsToChangeElement;
	DWORD dwPercentCalc;
	// Download State Machine

	m_PollTime=0;

	GetCurrentContext(&Context);

	switch (Context.LastDFUStatus.bState)
	{
	case 0xFF:
		m_Retry=NB_TRIALS;
		Context.LastDFUStatus.bState=0xFE;
		Context.CurrentRequest=STDFU_RQ_OPEN;
		SetCurrentContext(&Context);
		// We start our state machine. Let's open the handle
		if (STDFU_Open(Context.szDevLink, &Context.hDevice)!=STDFU_NOERROR)
		{
			Context.ErrorCode=STDFU_OPENDRIVERERROR;
			bRet=FALSE; // Stops here
			SetCurrentContext(&Context);
		}
		else
		{
			Context.CurrentRequest=STDFU_RQ_SELECT_ALTERNATE;
			SetCurrentContext(&Context);
			CImage *pImage=(CImage*)Context.hImage;
			if (STDFU_SelectCurrentConfiguration(&Context.hDevice, 0, 0, pImage->GetAlternate())!=STDFU_NOERROR)
			{
				Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
				SetCurrentContext(&Context);
				bRet=FALSE;
				STDFU_Abort(&Context.hDevice); // Reset State machine
			}
			else
			{
				bRet=EnsureIdleMode(&Context);
				if (bRet)
				{
					CImage *pImage=(CImage*)Context.hImage;

					if (pImage->GetNbElements()==0)
					{
						Context.Percent=100;
						SetCurrentContext(&Context);
						bRet=FALSE;
					}
					else
					{
						Context.CurrentImageElement=0;
						if (Context.Operation==OPERATION_ERASE)
							bRet=EraseAndGetStatus(&Context);
						else
							bRet=SetAddressAndGetStatus(&Context);
					}
				}
			}
		}
		break;
	case STATE_DFU_DOWNLOAD_BUSY:
		// End of PollTimeOut
		Context.CurrentRequest=STDFU_RQ_GET_STATUS;
		SetCurrentContext(&Context);
		// We finished to wait. Let's get the status
		if (STDFU_Getstatus(&Context.hDevice, &Context.LastDFUStatus)!=STDFU_NOERROR) 
		{
			Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
			SetCurrentContext(&Context);
			bRet=FALSE; // Stops here
			STDFU_Abort(&Context.hDevice); // Reset State machine
		}
		else
		{
			SetCurrentContext(&Context);
			if (Context.LastDFUStatus.bStatus!=STATUS_OK)
			{
				Context.CurrentRequest=STDFU_RQ_CLR_STATUS;
				SetCurrentContext(&Context);
				if (Context.LastDFUStatus.bState==STATE_DFU_ERROR)
					STDFU_Clrstatus(&Context.hDevice);
				m_Retry--;
				if (!m_Retry)
				{
					Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
					bRet=FALSE; // Stops here
					SetCurrentContext(&Context);
					STDFU_Abort(&Context.hDevice); // Reset State machine
				}
				else
					bReDownload=TRUE;
			}
			else
			{
				if ( (Context.LastDFUStatus.bStatus!=STATUS_OK) ||
					 ( (Context.LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_IDLE) &&
					   (Context.LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_BUSY) ) )
				{
					if (Context.LastDFUStatus.bStatus!=STATUS_OK)
						Context.ErrorCode=STDFUPRT_DFUERROR;	
					else
						Context.ErrorCode=STDFUPRT_BADFIRMWARESTATEMACHINE;
					bRet=FALSE; // Stops here
					SetCurrentContext(&Context);
					STDFU_Abort(&Context.hDevice); // Reset State machine
				}
				else
				{
					if (Context.LastDFUStatus.bState==STATE_DFU_DOWNLOAD_BUSY)
						m_PollTime=Context.LastDFUStatus.bwPollTimeout[0]+0x100*Context.LastDFUStatus.bwPollTimeout[1]+0x10000*Context.LastDFUStatus.bwPollTimeout[2];

					m_Retry=NB_TRIALS;
				}
			}
		}
		if (!bReDownload)
			break;
	case STATE_DFU_DOWNLOAD_IDLE:
		{
			bRet=FALSE;
			NeedsToChangeElement=FALSE;

			DFUIMAGEELEMENT Element;
			CImage *pImage=(CImage*)Context.hImage;
			DWORD i, NbEl=pImage->GetNbElements();

			if (Context.Operation==OPERATION_ERASE)
				Context.Percent=((Context.CurrentImageElement+1)*99)/NbEl;
			if (Context.CurrentNBlock>=2)
			{
				dwPercentCalc=Context.CurrentNBlock-2;

				for (i=0;i<Context.CurrentImageElement;i++)
				{
					memset(&Element, 0, sizeof(Element));
					pImage->GetImageElement(i, &Element);
					dwPercentCalc+=(Element.dwDataLength/m_Context.wTransferSize);
					if (Element.dwDataLength % m_Context.wTransferSize!=0)
						dwPercentCalc++;
				}

				Context.Percent=(dwPercentCalc*99)/m_NumBlockMax;
			}
			SetCurrentContext(&Context);
			if (!bReDownload)
			{
				while (SetNextBlockDataParameters(&Context, &NeedsToChangeElement))
				{
					if (NeedsToChangeElement)
					{
						Context.CurrentImageElement++;
						if (Context.Operation==OPERATION_ERASE)
							bRet=EraseAndGetStatus(&Context);
						else
							bRet=SetAddressAndGetStatus(&Context);
						if (bRet)
							break;
					}
					else
					{
						bRet=TRUE;
						break;
					}
				}
				if ( (bRet) && (!NeedsToChangeElement) )
					bRet=DownloadAndGetStatus(&Context);
				else
				if ( (!bRet) && (NeedsToChangeElement) )
				{
					// Success !
					EnsureIdleMode(&Context);
					Context.Percent=100;
					SetCurrentContext(&Context);
					bRet=FALSE;
				}
			}
			else
			{
				if (Context.CurrentNBlock>=2)
					bRet=DownloadAndGetStatus(&Context);
				else
				{
					if (Context.Operation==OPERATION_ERASE)
						bRet=EraseAndGetStatus(&Context);
					else
						bRet=SetAddressAndGetStatus(&Context);
				}
			}
		}
		break;
	default:
		Context.ErrorCode=STDFUPRT_BADFIRMWARESTATEMACHINE;
		bRet=FALSE; // Stops here
		SetCurrentContext(&Context);
		STDFU_Abort(&Context.hDevice); // Reset State machine
		break;
	}
	return bRet;
}

