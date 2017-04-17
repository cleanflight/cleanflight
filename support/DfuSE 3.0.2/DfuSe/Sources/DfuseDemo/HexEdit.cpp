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

// HexEdit.cpp : implementation file
//

#include "stdafx.h"
#include "HexEdit.h"
#include <afxtls_.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CHexEdit

CHexEdit::CHexEdit()
{
}

CHexEdit::~CHexEdit()
{
}


BEGIN_MESSAGE_MAP(CHexEdit, CEdit)
	//{{AFX_MSG_MAP(CHexEdit)
	ON_WM_CHAR()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CHexEdit message handlers

void CHexEdit::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	CString Tmp;
	int StartSel;
	int StopSel;

	GetWindowText(Tmp);

	if (nChar==VK_BACK)
		CEdit::OnChar(nChar, nRepCnt, nFlags);
	else
	{
		if ( (nChar>='a') && (nChar<='f') )
			nChar-=0x20;
		if ( ( (nChar>='a') && (nChar<='f') ) ||
			 ( (nChar>='0') && (nChar<='9') ) ||
			 ( (nChar>='A') && (nChar<='F') ) )
		{
			GetSel(StartSel, StopSel);

			if ( (StartSel!=StopSel) || (Tmp.GetLength()<4) )
			{
				_AFX_THREAD_STATE* pThreadState = _afxThreadState.GetData();
				DefWindowProc(pThreadState->m_lastSentMsg.message,
									 nChar, pThreadState->m_lastSentMsg.lParam);
			}
		}
	}
}
