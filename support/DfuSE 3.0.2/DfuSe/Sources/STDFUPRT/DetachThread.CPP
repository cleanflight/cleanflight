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
#include "DFUThread.h"
#include "DetachThread.h"

typedef DWORD (__stdcall *pCMP_WaitNoPendingInstallEvents)(DWORD);

pCMP_WaitNoPendingInstallEvents CMP_WaitNoPendingInstallEvents;

LRESULT CALLBACK WndProc(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam)
{
	static CDetachThread *pThread;
	
	if (Msg==WM_CREATE)
	{
		LPCREATESTRUCT cs=(LPCREATESTRUCT)lParam;
		pThread=(CDetachThread *)cs->lpCreateParams;
		return DefWindowProc(hWnd, Msg, wParam, lParam);
	}
	else
	if (Msg==WM_DEVICECHANGE)
	{
		if (wParam==DBT_DEVICEARRIVAL)
		{
			_DEV_BROADCAST_HEADER *pHeader=(_DEV_BROADCAST_HEADER *)lParam;
			if (pHeader->dbcd_devicetype==DBT_DEVTYP_DEVICEINTERFACE)
			{
				PDEV_BROADCAST_DEVICEINTERFACE pData=(PDEV_BROADCAST_DEVICEINTERFACE)pHeader;
				DFUThreadContext Context;

				pThread->GetCurrentContext(&Context);
				if (Context.CurrentRequest==STDFU_RQ_AWAITINGPNPPLUGEVENT)
				{
					Context.CurrentRequest=STDFU_RQ_IDENTIFYINGDEVICE;
					lstrcpy(Context.szDevLink, pData->dbcc_name);
					pThread->SetCurrentContext(&Context);
				}
			}
		}
		else
		if (wParam==DBT_DEVICEREMOVECOMPLETE)
		{
			_DEV_BROADCAST_HEADER *pHeader=(_DEV_BROADCAST_HEADER *)lParam;
			if (pHeader->dbcd_devicetype==DBT_DEVTYP_DEVICEINTERFACE)
			{
				PDEV_BROADCAST_DEVICEINTERFACE pData=(PDEV_BROADCAST_DEVICEINTERFACE)pHeader;
				DFUThreadContext Context;

				pThread->GetCurrentContext(&Context);
				if ( (strcmpi(Context.szDevLink, pData->dbcc_name)==0) &&
				     (Context.CurrentRequest==STDFU_RQ_AWAITINGPNPUNPLUGEVENT) )
				{
					if (Context.Operation==OPERATION_RETURN)
					{
						Context.CurrentRequest=STDFU_RQ_IDENTIFYINGDEVICE;
						lstrcpy(Context.szDevLink, "Tolerant");
						pThread->SetCurrentContext(&Context);
					}
					else
					{
						Context.CurrentRequest=STDFU_RQ_AWAITINGPNPPLUGEVENT;
						pThread->m_TimesToWait=0;
						lstrcpy(Context.szDevLink, "Resetting");
						pThread->SetCurrentContext(&Context);
					}
				}
			}
		}
		return 0L;
	}
	return DefWindowProc(hWnd, Msg, wParam, lParam);
}

CDetachThread::CDetachThread(PDFUThreadContext pContext) : CDFUThread(pContext)
{
	WNDCLASSEX Class = {0};
	char ClassName[]="DETACHWIND";
	DEV_BROADCAST_DEVICEINTERFACE dbi={0};

	m_TimesToWait=0;
	m_hMod=LoadLibrary("setupapi.dll");

	CMP_WaitNoPendingInstallEvents=(pCMP_WaitNoPendingInstallEvents)GetProcAddress(m_hMod, "CMP_WaitNoPendingInstallEvents");

	Class.cbSize=sizeof(WNDCLASSEX);
	Class.style=0;
	Class.lpfnWndProc=WndProc;
	Class.cbClsExtra=0;
	Class.cbWndExtra=0;
	Class.hInstance=GetModuleHandle(NULL);
	Class.hIcon=NULL;
	Class.hIconSm=NULL;
	Class.hCursor=NULL;
	Class.hbrBackground=NULL;
	Class.lpszMenuName=NULL;
	Class.lpszClassName=ClassName;
	RegisterClassEx(&Class);
	m_hWnd=CreateWindowEx(WS_EX_TOOLWINDOW, Class.lpszClassName, NULL, WS_POPUP, 0, 0, 0, 0, 0, 0, Class.hInstance, this);

	dbi.dbcc_size=sizeof(dbi);
	dbi.dbcc_devicetype=DBT_DEVTYP_DEVICEINTERFACE;
	dbi.dbcc_classguid=pContext->DfuGUID;
	m_Notif=(DWORD)RegisterDeviceNotification(m_hWnd, &dbi, DEVICE_NOTIFY_WINDOW_HANDLE);
	dbi.dbcc_classguid=pContext->AppGUID;
	m_Notif=(DWORD)RegisterDeviceNotification(m_hWnd, &dbi, DEVICE_NOTIFY_WINDOW_HANDLE);
}

CDetachThread::~CDetachThread()
{
	UnregisterDeviceNotification((void*)m_Notif);
	DestroyWindow(m_hWnd);
	UnregisterClass("DETACHWIND", GetModuleHandle(NULL));
	FreeLibrary(m_hMod);
}

BOOL CDetachThread::RunThread()
{
	DFUThreadContext Context;
	BOOL bRet=TRUE;
	int i;

	m_PollTime=0;
	// Detach State Machine. 
	GetCurrentContext(&Context);

	if (Context.LastDFUStatus.bState==0xFF)
	{
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
			// Check if device supports this command
  			if (!(m_DfuDesc.bmAttributes & ATTR_WILL_DETACH))
			{
				Context.ErrorCode=STDFUPRT_UNSUPPORTEDFEATURE;
				SetCurrentContext(&Context);
				bRet=FALSE; // Stops here
			}
			else
			{
				if (Context.Operation==OPERATION_DETACH)
				{
					// We are ready to issue our detach command. .
					Context.Percent=10;
					Context.CurrentRequest=STDFU_RQ_DETACH;
					SetCurrentContext(&Context);
					if (STDFU_Detach(&Context.hDevice, m_DfuInterfaceIdx)!=STDFU_NOERROR)
					{
						Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
						SetCurrentContext(&Context);
						bRet=FALSE; // Stops here
					}
					else
					{
						// At this stage, the handle is closed and we need to wait for the device removal
						Context.CurrentRequest=STDFU_RQ_AWAITINGPNPUNPLUGEVENT;
						SetCurrentContext(&Context);
					}
					if (bRet)
					{
						for (i=0;i<30;i++)
						{
							GetCurrentContext(&Context);
							Context.Percent=10+i/2;
							SetCurrentContext(&Context);
							CMP_WaitNoPendingInstallEvents(INFINITE);
							Sleep(100);
						}
					}
				}
				else
				{
  					if (m_DfuDesc.bmAttributes & ATTR_MANIFESTATION_TOLERANT)
					{
						Context.ErrorCode=STDFUPRT_UNSUPPORTEDFEATURE;
						SetCurrentContext(&Context);
						bRet=FALSE; // Stops here
					}
					else
					{
						bRet=EnsureIdleMode(&Context);
						if (bRet)
						{
							// Return to application Operation
							// We are ready to issue the zero length DnLoad Command
							Context.Percent=15;
							Context.CurrentRequest=STDFU_RQ_DOWNLOAD;
							Context.CurrentNBlock=0;
							Context.CurrentLength=0;
							Context.CurrentImageElement=0;
							bRet=DownloadAndGetStatus(&Context);
							bRet=TRUE;
							Context.ErrorCode=STDFUPRT_NOERROR;
							STDFU_Close(&Context.hDevice);
							Context.hDevice=0;
							if (!bRet)
							{
								// Not supported.
								// Let's try by going to DnLoad state machine
								Context.ErrorCode=STDFUPRT_NOERROR;
								Context.Percent=16;
								bRet=SetAddressAndGetStatus(&Context);
								if (!bRet)
								{
									Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
									SetCurrentContext(&Context);
									bRet=FALSE; // Stops here
								}
							}
							else
							{
								// Accepted by the device ! Let's check the handle was closed (entered in Manifest)
								if (Context.hDevice!=0)
								{
									Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
									SetCurrentContext(&Context);
									bRet=FALSE; // Stops here
									if (Context.hDevice!=0)
										STDFU_Abort(&Context.hDevice); // Reset State machine
								}
								else
								{
									// At this stage, the handle is closed and we need to wait for the device removal
									Context.CurrentRequest=STDFU_RQ_AWAITINGPNPUNPLUGEVENT;
									m_PollTime=50;
									m_TimesToWait=0;
									SetCurrentContext(&Context);
								}							
							}
						}
					}
				}
			}
		}
	}
	else
	if (Context.LastDFUStatus.bState==STATE_DFU_DOWNLOAD_BUSY)
	{
		// End of PollTimeOut
		Context.Percent=16;
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
			Context.Percent=17;
			Context.CurrentRequest=STDFU_RQ_DOWNLOAD;
			Context.CurrentNBlock=0;
			Context.CurrentLength=0;
			bRet=DownloadAndGetStatus(&Context);
			if ( (!bRet) || (Context.hDevice!=0) )
			{
				Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
				SetCurrentContext(&Context);
				bRet=FALSE; // Stops here
				if (Context.hDevice!=0)
					STDFU_Abort(&Context.hDevice); // Reset State machine
			}
			else
			{
				// At this stage, the handle is closed and we need to wait for the device removal
				Context.CurrentRequest=STDFU_RQ_AWAITINGPNPUNPLUGEVENT;
				m_PollTime=50;
				m_TimesToWait=0;
				SetCurrentContext(&Context);
			}
		}
	}
	else
	if ( (Context.CurrentRequest==STDFU_RQ_AWAITINGPNPUNPLUGEVENT) ||
	     (Context.CurrentRequest==STDFU_RQ_AWAITINGPNPPLUGEVENT) )
	{
		CMP_WaitNoPendingInstallEvents(INFINITE);
		m_TimesToWait++;
		if (Context.CurrentRequest==STDFU_RQ_AWAITINGPNPUNPLUGEVENT)
			m_Context.Percent=25+m_TimesToWait/8;
		else
			m_Context.Percent=50+m_TimesToWait/8;
		//SetCurrentContext(&Context);
		if (m_TimesToWait>=200)
		{
			// Time Out...
			Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
			SetCurrentContext(&Context);
			bRet=FALSE; // Stops here
		}
		else
			m_PollTime=50;
	}
	else
	if (Context.CurrentRequest!=STDFU_RQ_IDENTIFYINGDEVICE)
	{
		// Time Out...
		Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
		SetCurrentContext(&Context);
		bRet=FALSE; // Stops here
	}
	else
	{
		// Succeeded !
		if (Context.Operation==OPERATION_DETACH)
		{
			// Let's reopen the device, in order to put it in IDLE mode
			Context.Percent=75;
			Context.CurrentRequest=STDFU_RQ_OPEN;
			SetCurrentContext(&Context);
			if (STDFU_Open(Context.szDevLink, &Context.hDevice)!=STDFU_NOERROR)
			{
				Context.ErrorCode=STDFU_OPENDRIVERERROR;
				bRet=FALSE; // Stops here
				SetCurrentContext(&Context);
			}
			else
			{
				Context.Percent=85;
				bRet=EnsureIdleMode(&Context);
				if (bRet)
				{
					Context.Percent=100;
					SetCurrentContext(&Context);
					bRet=FALSE;
				}
				else
				{
					Context.ErrorCode=STDFUPRT_UNEXPECTEDERROR;
					SetCurrentContext(&Context);
					bRet=FALSE; // Stops here
				}
			}
		}
		else
		{
			// Return to application Operation
			// Success !
			Context.Percent=100;
			SetCurrentContext(&Context);
			bRet=FALSE;
		}
	}
	return bRet;
}

BOOL CDetachThread::StopThread(PDWORD ExitCode) 
{
	DFUThreadContext Context;
	DWORD ExCode;
	BOOL Ret=CSTThread::StopThread(&ExCode);
	
	if (ExitCode)
		*ExitCode=ExCode;

	GetCurrentContext(&Context);
	if (Context.hDevice!=0) 
	{
		STDFU_Close(&Context.hDevice);
		SetCurrentContext(&Context);
	}

	return Ret;
}

