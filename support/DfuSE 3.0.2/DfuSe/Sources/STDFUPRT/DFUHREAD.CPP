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
#include "image.h"

CDFUThread::CDFUThread(PDFUThreadContext pContext) : CSTThread()
{
	GetDfuParameters(pContext); // wTranfserSize

	m_PollTime=0;
	m_Retry=NB_TRIALS;

	m_Context.DfuGUID=pContext->DfuGUID;
	m_Context.AppGUID=pContext->AppGUID;
	m_Context.Operation=pContext->Operation;
	m_Context.hImage=pContext->hImage;
	m_Context.bDontSendFFTransfersForUpgrade=pContext->bDontSendFFTransfersForUpgrade;

	if (pContext->hImage)
	{
		CImage *pImage=(CImage*)pContext->hImage;
		DFUIMAGEELEMENT Element;
		DWORD i, NbEl= pImage->GetNbElements();
		m_NumBlockMax=0;
		for (i=0;i<NbEl;i++)
		{
			memset(&Element, 0, sizeof(Element));
			if (pImage->GetImageElement(i, &Element)) // To get datasize
			{
				m_NumBlockMax+=(Element.dwDataLength/pContext->wTransferSize);
				if (Element.dwDataLength % pContext->wTransferSize!=0)
					m_NumBlockMax++;
			}
		}
	}

	lstrcpy(m_Context.szDevLink, pContext->szDevLink);

	m_Context.dwTag=0;
	m_Context.Percent=0;
	m_Context.wTransferSize=pContext->wTransferSize;
	memset(&m_Context.LastDFUStatus, 0xFF, sizeof(m_Context.LastDFUStatus));
	m_Context.CurrentRequest=-1;
	m_Context.CurrentNBlock=-1;
	m_Context.CurrentLength=-1;
	m_Context.CurrentAddress=0;
	m_Context.CurrentImageElement=-1;

	m_Context.ErrorCode=STDFUPRT_NOERROR;
}

CDFUThread::~CDFUThread()
{
}

/*UINT CDFUThread::GetAdditionalEvents(CEvent **pTabEvent)
{
//	*pTabEvent=&m_EventWaitPoll;
	return 1;
}*/

DWORD CDFUThread::GetWaitEventDelay()
{
	return m_PollTime;
}

void CDFUThread::GetCurrentContext(PDFUThreadContext pContext)
{
	m_ContextMutex.Lock();
	*pContext=m_Context;
	m_ContextMutex.Unlock();
}

void CDFUThread::SetCurrentContext(PDFUThreadContext pContext)
{
	DWORD Tag;

	m_ContextMutex.Lock();
	Tag=m_Context.dwTag+1;
	m_Context=*pContext;
	m_Context.dwTag=Tag;
	m_ContextMutex.Unlock();
}

BOOL CDFUThread::EnsureIdleMode(PDFUThreadContext pContext)
{
	BOOL bRet=TRUE;

	pContext->CurrentRequest=STDFU_RQ_GET_STATUS;
	SetCurrentContext(pContext);
	// Try to get the status
	if ( (STDFU_Getstatus(&pContext->hDevice, &pContext->LastDFUStatus)!=STDFU_NOERROR) || (pContext->LastDFUStatus.bState==STATE_DFU_ERROR) )
	{
		// We failed, maybe the firmware was not in a state in which Get_Status is allowed.
		// We should be now in error stage. Try to clear the error
		pContext->CurrentRequest=STDFU_RQ_CLR_STATUS;
		SetCurrentContext(pContext);
		if (STDFU_Clrstatus(&pContext->hDevice)!=STDFU_NOERROR)
		{
			pContext->ErrorCode=STDFUPRT_UNEXPECTEDERROR;
			bRet=FALSE; // Stops here
			SetCurrentContext(pContext);
			STDFU_Abort(&pContext->hDevice); // Reset State machine
		}
		else
		{
			// Retry to get the status to check we're in dfuIDLE mode
			pContext->CurrentRequest=STDFU_RQ_GET_STATUS;
			SetCurrentContext(pContext);
			if (STDFU_Getstatus(&pContext->hDevice, &pContext->LastDFUStatus)!=STDFU_NOERROR)
			{
				pContext->ErrorCode=STDFUPRT_UNEXPECTEDERROR;
				bRet=FALSE; // Stops here
 				SetCurrentContext(pContext);
				STDFU_Abort(&pContext->hDevice); // Reset State machine
			}
			else
				SetCurrentContext(pContext);
		}
	}
	if (bRet)
	{
		// Check in which state we are
		pContext->CurrentRequest=STDFU_RQ_GET_STATUS;
		SetCurrentContext(pContext);
		if (STDFU_Getstatus(&pContext->hDevice, &pContext->LastDFUStatus)!=STDFU_NOERROR)
		{
			pContext->ErrorCode=STDFUPRT_UNEXPECTEDERROR;
			bRet=FALSE; // Stops here
			SetCurrentContext(pContext);
			STDFU_Abort(&pContext->hDevice); // Reset State machine
		}
		else
		{
			SetCurrentContext(pContext);
			if (pContext->LastDFUStatus.bState!=STATE_DFU_IDLE)
			{
				// Try to abort or clear the status to go to dfuIDLE mode
				pContext->CurrentRequest=STDFU_RQ_ABORT;
				SetCurrentContext(pContext);
				if (STDFU_Abort(&pContext->hDevice)!=STDFU_NOERROR)
				{
					pContext->CurrentRequest=STDFU_RQ_CLR_STATUS;
					SetCurrentContext(pContext);
					STDFU_Clrstatus(&pContext->hDevice);
				}
				pContext->CurrentRequest=STDFU_RQ_GET_STATUS;
				SetCurrentContext(pContext);
				if (STDFU_Getstatus(&pContext->hDevice, &pContext->LastDFUStatus)!=STDFU_NOERROR)
				{
					pContext->ErrorCode=STDFUPRT_UNEXPECTEDERROR;
					bRet=FALSE; // Stops here
					SetCurrentContext(pContext);
					STDFU_Abort(&pContext->hDevice); // Reset State machine
				}
				else
					SetCurrentContext(pContext);
			}

			if (bRet)
			{
				if (pContext->LastDFUStatus.bState==STATE_DFU_ERROR)
				{
					pContext->CurrentRequest=STDFU_RQ_CLR_STATUS;
					SetCurrentContext(pContext);
					STDFU_Clrstatus(&pContext->hDevice);
					pContext->CurrentRequest=STDFU_RQ_GET_STATUS;
					SetCurrentContext(pContext);
					STDFU_Getstatus(&pContext->hDevice, &pContext->LastDFUStatus);	
					SetCurrentContext(pContext);
				}
				if (pContext->LastDFUStatus.bState!=STATE_DFU_IDLE)
				{
					pContext->ErrorCode=STDFUPRT_BADFIRMWARESTATEMACHINE;
					bRet=FALSE; // Stops here
					STDFU_Abort(&pContext->hDevice); // Reset State machine
				}
				SetCurrentContext(pContext);
			}
		}
	}
	return bRet;
}

BOOL CDFUThread::ActionAndGetStatus(PDFUThreadContext pContext)
{
	BOOL bRet=TRUE;
	DWORD dfuRet=STDFU_NOERROR;
	PBYTE pCurrAddress;
	DWORD InitialRequest=pContext->CurrentRequest;
	DFUIMAGEELEMENT ImageElem;
	BYTE Retry;
	DWORD Address;
	Retry=NB_TRIALS;

	while (Retry) 
	{
		if (InitialRequest==STDFU_RQ_DOWNLOAD)
		{
			CImage *pImage=(CImage*)pContext->hImage;
			PBYTE pRequest=NULL;

			memset(&ImageElem, 0, sizeof(ImageElem));
			if (pImage->GetImageElement(pContext->CurrentImageElement, &ImageElem)) 
			{
				ImageElem.Data=new BYTE[ImageElem.dwDataLength];
				if (!pImage->GetImageElement(pContext->CurrentImageElement, &ImageElem)) 
				{
					delete[] ImageElem.Data;
					pContext->ErrorCode=STDFUPRT_BADPARAMETER;
					SetCurrentContext(pContext);
					bRet=FALSE;
					break;
				}
			}
			else
			{
				pContext->ErrorCode=STDFUPRT_BADPARAMETER;
				SetCurrentContext(pContext);
				bRet=FALSE;
				break;
			}

			if (LOWORD(pContext->CurrentNBlock)>=2)
			{
				pCurrAddress=ImageElem.Data+(LOWORD(pContext->CurrentNBlock)-2)*pContext->wTransferSize;
				pContext->CurrentAddress=pCurrAddress-ImageElem.Data+ImageElem.dwAddress;
			}
			else
			{
				// Specific Request
				if (LOWORD(pContext->CurrentNBlock)==1)
				{
					pContext->ErrorCode=STDFUPRT_BADPARAMETER;
					SetCurrentContext(pContext);
					bRet=FALSE;
					break;
				}

				//==============================================
				pContext->CurrentRequest=STDFU_RQ_GET_STATE;
				SetCurrentContext(pContext);
				if (STDFU_Getstate(&pContext->hDevice, &pContext->LastDFUStatus.bState)==STDFU_NOERROR)
				{
					SetCurrentContext(pContext);
					while (pContext->LastDFUStatus.bState==STATE_DFU_ERROR)
					{
						pContext->CurrentRequest=STDFU_RQ_CLR_STATUS;
						SetCurrentContext(pContext);
						STDFU_Clrstatus(&pContext->hDevice);
						STDFU_Getstate(&pContext->hDevice, &pContext->LastDFUStatus.bState);
					}
					SetCurrentContext(pContext);
				}
				//===============================================

				Address=ImageElem.dwAddress;
				pContext->CurrentAddress=Address;
				pRequest=new BYTE[5];
				pRequest[0]=HIWORD(pContext->CurrentNBlock); // See EraseAndGetStatus and SetAddressAndGetStatus
				memcpy(pRequest+1, &Address, 4);
				pCurrAddress=pRequest;
			}
			pContext->CurrentNBlock=LOWORD(pContext->CurrentNBlock);
			pContext->CurrentRequest=STDFU_RQ_DOWNLOAD;
			SetCurrentContext(pContext);
			dfuRet=STDFU_Dnload(&pContext->hDevice, pCurrAddress, pContext->CurrentLength, pContext->CurrentNBlock);
			delete[] ImageElem.Data;
			if (pRequest)
				delete[] pRequest;
		}
		else
		if (InitialRequest==STDFU_RQ_UPLOAD)
		{
			if (LOWORD(pContext->CurrentNBlock)<2)
			{
				pContext->ErrorCode=STDFUPRT_BADPARAMETER;
				SetCurrentContext(pContext);
				bRet=FALSE;
				break;
			}

			CImage *pImage=(CImage*)pContext->hImage;

			memset(&ImageElem, 0, sizeof(ImageElem));
			if (pImage->GetImageElement(pContext->CurrentImageElement, &ImageElem)) 
			{
				ImageElem.Data=new BYTE[ImageElem.dwDataLength];
				if (!pImage->GetImageElement(pContext->CurrentImageElement, &ImageElem)) 
				{
					delete[] ImageElem.Data;
					pContext->ErrorCode=STDFUPRT_BADPARAMETER;
					SetCurrentContext(pContext);
					bRet=FALSE;
					break;
				}
			}
			else
			{
				pContext->ErrorCode=STDFUPRT_BADPARAMETER;
				SetCurrentContext(pContext);
				bRet=FALSE;
				break;
			}

			pCurrAddress=ImageElem.Data+(LOWORD(pContext->CurrentNBlock)-2)*pContext->wTransferSize;
			pContext->CurrentAddress=pCurrAddress-ImageElem.Data+ImageElem.dwAddress;
			pContext->CurrentRequest=STDFU_RQ_UPLOAD;
			SetCurrentContext(pContext);
			
			dfuRet=STDFU_Upload(&pContext->hDevice, pCurrAddress, pContext->CurrentLength, LOWORD(pContext->CurrentNBlock));
			if (dfuRet==STDFU_NOERROR)
			{
				if (!pImage->SetImageElement(pContext->CurrentImageElement, FALSE, ImageElem))
				{
					delete[] ImageElem.Data;
					pContext->ErrorCode=STDFUPRT_BADPARAMETER;
					SetCurrentContext(pContext);
					bRet=FALSE;
					break;
				}
			}
			delete[] ImageElem.Data;
		}

		if (dfuRet!=STDFU_NOERROR)
		{
			pContext->CurrentRequest=STDFU_RQ_GET_STATE;
			SetCurrentContext(pContext);
			if (STDFU_Getstate(&pContext->hDevice, &pContext->LastDFUStatus.bState)==STDFU_NOERROR)
			{
				SetCurrentContext(pContext);
				if (pContext->LastDFUStatus.bState==STATE_DFU_ERROR)
				{
					pContext->CurrentRequest=STDFU_RQ_CLR_STATUS;
					SetCurrentContext(pContext);
					STDFU_Clrstatus(&pContext->hDevice);
				}
			}
			else
			{
				pContext->ErrorCode=STDFUPRT_UNEXPECTEDERROR;
				bRet=FALSE; // Stops here
				SetCurrentContext(pContext);
				STDFU_Abort(&pContext->hDevice); // Reset State machine if we can
				break;
			}
			Retry--;
			if (Retry<=0)
				break;
		}
		else
		{
			pContext->CurrentRequest=STDFU_RQ_GET_STATUS;
			SetCurrentContext(pContext);
			if (STDFU_Getstatus(&pContext->hDevice, &pContext->LastDFUStatus)==STDFU_NOERROR)
			{
				SetCurrentContext(pContext);
				if (pContext->LastDFUStatus.bState == STATE_DFU_ERROR)
				{
					pContext->CurrentRequest=STDFU_RQ_CLR_STATUS;
					SetCurrentContext(pContext);
					STDFU_Clrstatus(&pContext->hDevice);
					Retry--;
					if (Retry<=0)
						break;
				}
				else
				{
					if ( 
						 (pContext->LastDFUStatus.bStatus!=STATUS_OK) ||
						 ( (InitialRequest==STDFU_RQ_DOWNLOAD) && (pContext->LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_IDLE) && (pContext->LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_BUSY) && (pContext->LastDFUStatus.bState!=STATE_DFU_MANIFEST)) ||
						 ( (InitialRequest==STDFU_RQ_UPLOAD)   && (pContext->LastDFUStatus.bState!=STATE_DFU_UPLOAD_IDLE)   && (pContext->LastDFUStatus.bState!=STATE_DFU_UPLOAD_BUSY) ) 
					   )
					{
						if (pContext->LastDFUStatus.bStatus!=STATUS_OK)
							pContext->ErrorCode=STDFUPRT_DFUERROR;	
						else
							pContext->ErrorCode=STDFUPRT_BADFIRMWARESTATEMACHINE;
						bRet=FALSE; // Stops here
						SetCurrentContext(pContext);
						break;
					}
					else
						break;
				}
			}
			else
			{
				pContext->CurrentRequest=STDFU_RQ_GET_STATE;
				SetCurrentContext(pContext);
				if (STDFU_Getstate(&pContext->hDevice, &pContext->LastDFUStatus.bState)==STDFU_NOERROR)
				{
					SetCurrentContext(pContext);
					if (pContext->LastDFUStatus.bState==STATE_DFU_ERROR)
					{
						pContext->CurrentRequest=STDFU_RQ_CLR_STATUS;
						SetCurrentContext(pContext);
						STDFU_Clrstatus(&pContext->hDevice);
					}
				}
				else
				{
					pContext->ErrorCode=STDFUPRT_UNEXPECTEDERROR;
					bRet=FALSE; // Stops here
					SetCurrentContext(pContext);
					STDFU_Abort(&pContext->hDevice); // Reset State machine if we can
					break;
				}
				Retry--;
				if (Retry<=0)
					break;
			}
		}
	}

	if (!Retry)
	{
		pContext->ErrorCode=STDFUPRT_UNEXPECTEDERROR;	
		bRet=FALSE;
		SetCurrentContext(pContext);
		STDFU_Abort(&pContext->hDevice); // Reset State machine
	}
	

	if (bRet)
	{
		if ( (pContext->LastDFUStatus.bState==STATE_DFU_DOWNLOAD_BUSY) || 
			 (pContext->LastDFUStatus.bState==STATE_DFU_UPLOAD_BUSY) )
		{
			SetCurrentContext(pContext);
			m_PollTime=pContext->LastDFUStatus.bwPollTimeout[0]+0x100*pContext->LastDFUStatus.bwPollTimeout[1]+0x10000*pContext->LastDFUStatus.bwPollTimeout[2];
		}
		else
			m_PollTime=0;
	}
	return bRet;
}

BOOL CDFUThread::EraseAndGetStatus(PDFUThreadContext pContext)
{
	BOOL bRet=TRUE;

	pContext->CurrentNBlock=0x410000;
	pContext->CurrentLength=5; // Fake: ActionAndGetStatus will detect it and adapt
	pContext->CurrentRequest=STDFU_RQ_DOWNLOAD;
	bRet=ActionAndGetStatus(pContext);
	return bRet;
}

BOOL CDFUThread::SetAddressAndGetStatus(PDFUThreadContext pContext)
{
	BOOL bRet=TRUE;

	pContext->CurrentNBlock=0x210000;
	pContext->CurrentLength=5; // Fake: ActionAndGetStatus will detect it and adapt
	pContext->CurrentRequest=STDFU_RQ_DOWNLOAD;
	bRet=ActionAndGetStatus(pContext);
    return bRet;
}

BOOL CDFUThread::DownloadAndGetStatus(PDFUThreadContext pContext)
{
	BOOL bRet=TRUE;

	pContext->CurrentRequest=STDFU_RQ_DOWNLOAD;
	bRet=ActionAndGetStatus(pContext);
	return bRet;
}

BOOL CDFUThread::UploadAndGetStatus(PDFUThreadContext pContext)
{
	BOOL bRet=TRUE;

	pContext->CurrentRequest=STDFU_RQ_UPLOAD;
	bRet=ActionAndGetStatus(pContext);
	return bRet;
}

BOOL CDFUThread::SetNextBlockDataParameters(PDFUThreadContext pContext, PBOOL pNeedsToChangeElement)
{
	DWORD InitialRequest=pContext->CurrentRequest;
	DFUIMAGEELEMENT ImageElem;
	CImage *pImage=(CImage*)pContext->hImage;
	DWORD i;

	*pNeedsToChangeElement=FALSE;
	BOOL bLeave=FALSE, bRet=TRUE, bAllFFs;
		
	while (!bLeave)
	{
		if (pContext->CurrentImageElement>=pImage->GetNbElements())
			return FALSE;
		memset(&ImageElem, 0, sizeof(ImageElem));
		if (!pImage->GetImageElement(pContext->CurrentImageElement, &ImageElem)) 
			return FALSE;
		if (pContext->Operation==OPERATION_ERASE)
			ImageElem.dwDataLength=0;
		if (pContext->Operation==OPERATION_UPGRADE)
		{
			ImageElem.Data=new BYTE[ImageElem.dwDataLength];
			if (!pImage->GetImageElement(pContext->CurrentImageElement, &ImageElem)) 
			{
				delete[] ImageElem.Data;
				return FALSE;
			}
		}
		
		if (pContext->CurrentNBlock<2)
		{
			pContext->CurrentLength=0;
			pContext->CurrentNBlock=2;
		}

		if ( (pContext->CurrentLength+((pContext->CurrentNBlock-2)*pContext->wTransferSize))==ImageElem.dwDataLength)
		{
			*pNeedsToChangeElement=TRUE;
			if (pContext->CurrentImageElement+1>=pImage->GetNbElements())
				bRet=FALSE;
			else
				bRet=TRUE;
			bLeave=TRUE;
		}
		if (bLeave)
		{
			if (ImageElem.Data)
				delete[] ImageElem.Data;
			break;
		}

		if (pContext->CurrentLength!=0)
			pContext->CurrentNBlock=pContext->CurrentNBlock+1;

		pContext->CurrentLength=pContext->wTransferSize;

		if (((pContext->CurrentNBlock-2)*pContext->wTransferSize)+pContext->CurrentLength>=ImageElem.dwDataLength)
			pContext->CurrentLength=ImageElem.dwDataLength-(((pContext->CurrentNBlock-3)*pContext->wTransferSize)+pContext->CurrentLength);

		bAllFFs=FALSE;
		if ( pContext->bDontSendFFTransfersForUpgrade && (pContext->Operation==OPERATION_UPGRADE) )
		{
			bAllFFs=TRUE;
			PBYTE pCurrAddress=ImageElem.Data+(pContext->CurrentNBlock-2)*pContext->wTransferSize;
			for (i=0;i<pContext->CurrentLength;i++)
			{
				if (pCurrAddress[i]!=0xFF)
				{
					bAllFFs=FALSE;
					break;
				}
			}
		}
		if (ImageElem.Data)
			delete[] ImageElem.Data;
		if (!bAllFFs)
		{
			bLeave=TRUE;
			bRet=TRUE;
		}
		
	}	
	return bRet;
}

BOOL CDFUThread::StopThread(PDWORD ExitCode) 
{
	DFUThreadContext Context;
	DWORD ExCode;
	BOOL Ret=CSTThread::StopThread(&ExCode);
	
	if (ExitCode)
		*ExitCode=ExCode;

	GetCurrentContext(&Context);
	if (Context.hDevice!=0) 
	{
		if (ExCode==STOP_ON_EVENT)
			STDFU_Abort(&m_Context.hDevice);
		STDFU_Close(&Context.hDevice);
		SetCurrentContext(&Context);
	}
	return Ret;
}

void CDFUThread::GetDfuParameters(PDFUThreadContext pContext)
{
	HANDLE hDle;

	if (STDFU_Open(pContext->szDevLink, &hDle)==STDFU_NOERROR)
	{
		if (STDFU_GetDFUDescriptor(&hDle, &m_DfuInterfaceIdx, &m_NbOfAlternates, &m_DfuDesc)==STDFU_NOERROR)
			pContext->wTransferSize=m_DfuDesc.wTransfertSize;
		STDFU_Close(&hDle);
	}
}
