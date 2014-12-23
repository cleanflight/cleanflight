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

#ifndef _ST_THREAD_H_
#define _ST_THREAD_H_

// End of thread status
#define STOP_ON_CFG		0
#define STOP_ON_EVENT	1
#define	STOP_ON_RUN		2

#define MAX_EVENTS 10

class CSTThread : public CObject {
public:
	CSTThread();
	virtual ~CSTThread();

	virtual	BOOL	BeginThread();
	
	virtual	UINT	BodyThread();

    virtual	BOOL	StopThread(PDWORD ExitCode=NULL);
	// Thread body to be defined by descendants. If this function returns
	// FALSE, it means the the thread will be stoppped
	virtual	BOOL	RunThread() = 0;

	// We can add events on which the thread is able to react.
	virtual	UINT	GetAdditionalEvents(CEvent **);
	// We can treat these added events. If this function returns
	// FALSE, it means the event is considered as a stop event
	virtual	BOOL	TreatEvent(DWORD Id);
	// Waiting time on events
	virtual	DWORD	GetWaitEventDelay();
private:
	CWinThread	*m_pThread;
    CEvent       m_EventStop;       // Event, signaled on thread stop
};
#endif
