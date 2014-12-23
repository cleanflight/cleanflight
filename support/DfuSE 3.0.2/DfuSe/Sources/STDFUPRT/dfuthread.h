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

#ifndef _DFU_THREAD_H_
#define _DFU_THREAD_H_

#define NB_TRIALS 3

#define DFU_INI_FILE					"dfu.ini"
#define DFU_INI_MAIN_SECTION			"Options"
#define DFU_INI_DIV8BLOCKS				"Div8Blocks"
#define DFU_INI_MANIFEST_AFTER_UPGRADE	"ManifestOnlyAfterUpgrade"

class CDFUThread : public CSTThread {
public:
	CDFUThread(PDFUThreadContext pContext);
	virtual ~CDFUThread();

	virtual BOOL StopThread(PDWORD ExitCode=NULL); 

	//	// We can add events on which the thread is able to react.
//	virtual	UINT	GetAdditionalEvents(CEvent **);
	// Waiting time on events
	virtual	DWORD	GetWaitEventDelay();

	virtual void	GetCurrentContext(PDFUThreadContext pContext);
	virtual void	SetCurrentContext(PDFUThreadContext pContext);
	DFU_FUNCTIONAL_DESCRIPTOR GetDevDesc() { return m_DfuDesc; }
protected:
	virtual BOOL    SetNextBlockDataParameters(PDFUThreadContext pContext, PBOOL pNeedsToChangeElement);
	virtual BOOL	EnsureIdleMode(PDFUThreadContext pContext);
	virtual BOOL	EraseAndGetStatus(PDFUThreadContext pContext);
	virtual BOOL	SetAddressAndGetStatus(PDFUThreadContext pContext);
	virtual BOOL	DownloadAndGetStatus(PDFUThreadContext pContext);
	virtual BOOL	UploadAndGetStatus(PDFUThreadContext pContext);

	DFU_FUNCTIONAL_DESCRIPTOR m_DfuDesc;
	UINT					  m_DfuInterfaceIdx;
	UINT					  m_NbOfAlternates;


	DWORD				m_PollTime;
	DFUThreadContext	m_Context;
	BOOL				m_Div8;
	BOOL				m_ManifestAfterUpgrade;
    DWORD				m_Retry;
	WORD				m_NumBlockMax;
private:
	CMutex				m_ContextMutex;
	BOOL			ActionAndGetStatus(PDFUThreadContext pContext);
	void			GetDfuParameters(PDFUThreadContext pContext);
//    CEvent				m_EventWaitPoll;
};
#endif
