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

CSTThread::CSTThread()
{
	m_pThread = NULL;
}

CSTThread::~CSTThread()
{
}

static UINT ThreadProcedure(LPVOID pParam) 
{
	return ((CSTThread*)pParam)->BodyThread();
}

BOOL CSTThread::BeginThread() 
{
	if (m_pThread)
		return FALSE;

    m_pThread=AfxBeginThread(ThreadProcedure,
							 this,
							 THREAD_PRIORITY_LOWEST,
							 0,
							 CREATE_SUSPENDED);
	if (!m_pThread)
		return FALSE;

    m_pThread->m_bAutoDelete = FALSE;
    // Thread activation
	m_pThread->ResumeThread();

	return TRUE;
}

UINT CSTThread::BodyThread() 
{
	HANDLE	TabHandle[MAX_EVENTS];
	UINT	NbAdditionalEvents=0;
	DWORD	WaitThreadRes=0;
	CEvent	*pTabEvents[MAX_EVENTS];

	NbAdditionalEvents=GetAdditionalEvents(pTabEvents);
	if (NbAdditionalEvents>=MAX_EVENTS) 
	{	
		AfxEndThread(STOP_ON_CFG);
		return STOP_ON_CFG;		
	}

	TabHandle[0]=m_EventStop;
	m_EventStop.ResetEvent();
	for (UINT i=0;i<NbAdditionalEvents;i++) 
	{
		TabHandle[i+1]=*(pTabEvents[i]);
		pTabEvents[i]->ResetEvent();
	}	

	while (TRUE) 
	{
		WaitThreadRes=::WaitForMultipleObjects(NbAdditionalEvents+1,
										       TabHandle,
											   FALSE,
											   GetWaitEventDelay());
		// Did we receive an event?
		if ( (WaitThreadRes>=WAIT_OBJECT_0) &&
			 (WaitThreadRes<WAIT_OBJECT_0+NbAdditionalEvents+1) ) 
		{
			if (WaitThreadRes==WAIT_OBJECT_0) 
			{
				AfxEndThread(STOP_ON_EVENT);
				return STOP_ON_EVENT;
			}
			else
			{
				if (!TreatEvent(WaitThreadRes-WAIT_OBJECT_0-1))
				{
					AfxEndThread(STOP_ON_EVENT);
					return STOP_ON_EVENT;
				}	
			}
		}
		// No, let's do our job
		else 
		{
			if (!RunThread()) 
			{
				// Job finished!
				AfxEndThread(STOP_ON_RUN);
				return STOP_ON_RUN;
			}
		}
	}
	return 0;
}

UINT CSTThread::GetAdditionalEvents(CEvent **pTab) 
{
	return 0;
}

BOOL CSTThread::TreatEvent(DWORD Id)
{
	return TRUE;
}

BOOL CSTThread::StopThread(PDWORD ExitCode) 
{
	if (!m_pThread)
		return FALSE;

	// Send the stop event
    m_EventStop.SetEvent();

    // Wait the effective thread stop
	while (WaitForSingleObject(m_pThread->m_hThread, 0)!=WAIT_OBJECT_0) 
	{
	}

	if (ExitCode)
		GetExitCodeThread(m_pThread->m_hThread, ExitCode);

    // Destroy our CWinThread object
    delete m_pThread;
	m_pThread=NULL;

	return TRUE;
}

DWORD CSTThread::GetWaitEventDelay()
{
	return 0;
}