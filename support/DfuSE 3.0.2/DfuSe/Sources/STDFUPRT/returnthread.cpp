#include "stdafx.h"
#include "STThread.h"
#include "../STDFU/STDFU.h"
#include "../STDFUFILES/STDFUFILESINC.h"
#include "STDFUPRTINC.h"
#include "DFUThread.h"
#include "ReturnThread.h"

CReturnThread::CReturnThread(PDFUThreadContext pContext) : CDFUThread(pContext)
{
	if (m_ManifestAfterUpgrade)
		m_Context.LastDFUStatus.bState=STATE_DFU_DOWNLOAD_IDLE;
}

CReturnThread::~CReturnThread()
{
}

BOOL CReturnThread::RunThread()
{
	DFUThreadContext Context;
	BOOL bRet=TRUE;

	// Return State Machine

/*	GetCurrentContext(&Context);

	switch (Context.LastDFUStatus.bState)
	{
	case 0xFF:
		Context.CurrentRequest=STDFU_RQ_SELECT_ALTERNATE;
		SetCurrentContext(&Context);
		if (STDFU_SelectCurrentConfiguration(Context.phDevice, 0, 0, Context.nAlternate)!=STDFU_NOERROR)
		{
			Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
			SetCurrentContext(&Context);
			bRet=FALSE;
			STDFU_Abort(Context.phDevice); // Reset State machine
		}
		else
		{
			bRet=EnsureIdleMode(&Context);
			if (bRet)
			{
				Context.CurrentStateMachineTransition=1;
				Context.CurrentNBlock=SPECIAL_COMMAND_GO_TO_DNLOAD_IDLE;
				Context.CurrentLength=1;
				Context.CurrentRequest=STDFU_RQ_DOWNLOAD;
				SetCurrentContext(&Context);
				if (STDFU_Dnload(Context.phDevice, (PBYTE)&bRet, Context.CurrentLength, Context.CurrentNBlock)!=STDFU_NOERROR)
				{
					Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
					SetCurrentContext(&Context);
					bRet=FALSE; // Stops here
					STDFU_Abort(Context.phDevice); // Reset State machine
				}
				if (bRet)
				{
					Context.CurrentRequest=STDFU_RQ_GET_STATUS;
					Context.CurrentStateMachineTransition=2;
					SetCurrentContext(&Context);

					if (STDFU_Getstatus(Context.phDevice, &Context.LastDFUStatus)!=STDFU_NOERROR) 
					{
						Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
						SetCurrentContext(&Context);
						bRet=FALSE; // Stops here
						STDFU_Abort(Context.phDevice); // Reset State machine
					}
					else
					{
						SetCurrentContext(&Context);
						if (Context.LastDFUStatus.bStatus!=STATUS_OK)
						{
							Context.ErrorCode=STDFUPRT_DFUERROR;
							SetCurrentContext(&Context);
							bRet=FALSE; // Stops here
							STDFU_Abort(Context.phDevice); // Reset State machine
						}
						else
						{
							if ( (Context.LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_BUSY) &&
								 (Context.LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_IDLE) )
							{
								Context.ErrorCode=STDFUPRT_DFUERROR;
								SetCurrentContext(&Context);
								bRet=FALSE; // Stops here
								STDFU_Abort(Context.phDevice); // Reset State machine
							}
							else
							{
								if (Context.LastDFUStatus.bState==STATE_DFU_DOWNLOAD_BUSY)
								{
									m_PollTime=Context.LastDFUStatus.bwPollTimeout[0]+0x100*Context.LastDFUStatus.bwPollTimeout[1]+0x10000*Context.LastDFUStatus.bwPollTimeout[2];
									Context.CurrentStateMachineTransition=3;
								}
								else
									m_PollTime=0;
							}
						}
					}
				}
			}
		}
		break;
	case STATE_DFU_DOWNLOAD_BUSY:
		// End of Time wait
		// Check the status
		Context.CurrentRequest=STDFU_RQ_GET_STATUS;
		Context.CurrentStateMachineTransition=2;
		SetCurrentContext(&Context);

		if (STDFU_Getstatus(Context.phDevice, &Context.LastDFUStatus)!=STDFU_NOERROR) 
		{
			Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
			SetCurrentContext(&Context);
			bRet=FALSE; // Stops here
			STDFU_Abort(Context.phDevice); // Reset State machine
		}
		else
		{
			SetCurrentContext(&Context);
			if (Context.LastDFUStatus.bStatus!=STATUS_OK)
			{
				Context.ErrorCode=STDFUPRT_DFUERROR;
				SetCurrentContext(&Context);
				bRet=FALSE; // Stops here
				STDFU_Abort(Context.phDevice); // Reset State machine
			}
			else
			{
				if ( (Context.LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_BUSY) &&
					 (Context.LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_IDLE) )
				{
					Context.ErrorCode=STDFUPRT_DFUERROR;
					SetCurrentContext(&Context);
					bRet=FALSE; // Stops here
					STDFU_Abort(Context.phDevice); // Reset State machine
				}
				else
				{
					if (Context.LastDFUStatus.bState!=STATE_DFU_DOWNLOAD_BUSY)
					{
						m_PollTime=Context.LastDFUStatus.bwPollTimeout[0]+0x100*Context.LastDFUStatus.bwPollTimeout[1]+0x10000*Context.LastDFUStatus.bwPollTimeout[2];
						Context.CurrentStateMachineTransition=3;
						SetCurrentContext(&Context);
					}
					else
						m_PollTime=0;
				}
			}
		}
		break;
	case STATE_DFU_DOWNLOAD_IDLE:
		Context.CurrentStateMachineTransition=5;
		if (m_Div8)
			Context.CurrentNBlock=(Context.EndAddress-8)/8;
		Context.CurrentLength=0;
		Context.CurrentRequest=STDFU_RQ_DOWNLOAD;
		SetCurrentContext(&Context);
		if (STDFU_Dnload(Context.phDevice, Context.pBuffer, Context.CurrentLength, Context.CurrentNBlock)!=STDFU_NOERROR)
		{
			Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
			SetCurrentContext(&Context);
			bRet=FALSE; // Stops here
			STDFU_Abort(Context.phDevice); // Reset State machine
		}
	case STATE_DFU_MANIFEST_BUSY:
		if (bRet)
		{
			Context.CurrentRequest=STDFU_RQ_GET_STATUS;
			Context.CurrentStateMachineTransition=6;
			SetCurrentContext(&Context);

			if (STDFU_Getstatus(Context.phDevice, &Context.LastDFUStatus)!=STDFU_NOERROR) 
			{
				Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
				SetCurrentContext(&Context);
				bRet=FALSE; // Stops here
				STDFU_Abort(Context.phDevice); // Reset State machine
			}
			else
			{
				SetCurrentContext(&Context);
				if (*Context.phDevice)
				{
					// We are not under manifest_wait_reset phase
					if (Context.LastDFUStatus.bState==STATE_DFU_ERROR) 
					{
						// Error stage !! It failed !
						Context.ErrorCode=STDFUPRT_DFUERROR;
						SetCurrentContext(&Context);
						bRet=FALSE; // Stops here
						STDFU_Clrstatus(Context.phDevice); // Clears the error
						STDFU_Abort(Context.phDevice); // Reset State machine
					}
					else
					if (Context.LastDFUStatus.bState==STATE_DFU_MANIFEST_BUSY) 
					{
						m_PollTime=Context.LastDFUStatus.bwPollTimeout[0]+0x100*Context.LastDFUStatus.bwPollTimeout[1]+0x10000*Context.LastDFUStatus.bwPollTimeout[2];
						Context.CurrentStateMachineTransition=7;
						SetCurrentContext(&Context);
					}
					else
					{
						Context.ErrorCode=STDFUPRT_BADFIRMWARESTATEMACHINE;
						SetCurrentContext(&Context);
						bRet=FALSE; // Stops here
						STDFU_Abort(Context.phDevice); // Reset State machine
					}
				}
				else
				{
					Context.Percent=100;
					SetCurrentContext(&Context);
					bRet=FALSE;
				}
			}
		}
		break;
	default:
		Context.ErrorCode=STDFUPRT_BADFIRMWARESTATEMACHINE;
		bRet=FALSE; // Stops here
		SetCurrentContext(&Context);
		STDFU_Abort(Context.phDevice); // Reset State machine
		break;
	}*/
	return bRet;
}

