/******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
* Company            : STMicroelectronics
* Author             : MCD Application Team
* Description        : STMicroelectronics Device Firmware Upgrade  Extension Demo
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

#if !defined(AFX_WHATTODODLG_H__35109545_83DF_48DC_99BF_309CEB3555BA__INCLUDED_)
#define AFX_WHATTODODLG_H__35109545_83DF_48DC_99BF_309CEB3555BA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// WhatToDoDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CWhatToDoDlg dialog

class CWhatToDoDlg : public CDialog
{
// Construction
public:
	CWhatToDoDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CWhatToDoDlg)
	enum { IDD = IDD_DfuFileMgrWhatToDo_DIALOG };
	int		m_Choice;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWhatToDoDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
    HICON m_hIcon;
	// Generated message map functions
	//{{AFX_MSG(CWhatToDoDlg)
	virtual void OnOK();
	afx_msg void OnPaint();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WHATTODODLG_H__35109545_83DF_48DC_99BF_309CEB3555BA__INCLUDED_)
