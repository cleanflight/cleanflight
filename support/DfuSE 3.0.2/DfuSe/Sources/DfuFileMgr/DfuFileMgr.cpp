/******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
* Company            : STMicroelectronics
* Author             : MCD Application Team
* Description        : STMicroelectronics Device Firmware Upgrade File Manager
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

// DfuFileMgr.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "DfuFileMgr.h"
#include "DfuFileMgrDlg.h"
#include "DfuFileMgrDlgExtract.h"
#include "WhatToDoDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrApp

BEGIN_MESSAGE_MAP(CDfuFileMgrApp, CWinApp)
	//{{AFX_MSG_MAP(CDfuFileMgrApp)
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrApp construction

CDfuFileMgrApp::CDfuFileMgrApp()
{
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CDfuFileMgrApp object

CDfuFileMgrApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrApp initialization

BOOL CDfuFileMgrApp::InitInstance()
{
	// Standard initialization

	CDfuFileMgrDlg dlg;
	CDfuFileMgrDlgExtract dlgExtract;
	CWhatToDoDlg dlgWhat;

	if (dlgWhat.DoModal()==IDCANCEL)
	{
		m_pMainWnd = &dlg;
		dlg.DoModal();
	}
	else
	{
		m_pMainWnd = &dlgExtract;
		dlgExtract.DoModal();
	}

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}
