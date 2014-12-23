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

#if !defined(AFX_MULTIBINDLG_H__70EEAD1A_4D39_4A22_AA91_25BF7D9FD193__INCLUDED_)
#define AFX_MULTIBINDLG_H__70EEAD1A_4D39_4A22_AA91_25BF7D9FD193__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// MultiBinDlg.h : header file
//

#include "hexedit.h"

/////////////////////////////////////////////////////////////////////////////
// CMultiBinDlg dialog

class CMultiBinDlg : public CDialog
{
// Construction
public:
	CMultiBinDlg(CWnd* pParent = NULL);   // standard constructor
	CStringArray m_Lines;
// Dialog Data
	//{{AFX_DATA(CMultiBinDlg)
	enum { IDD = IDD_DfuFileMgrMultiBin_DIALOG };
	CButton	m_AddBtnCtrl;
	CHexEdit	m_CtrlStartAddr;
	CListBox	m_ListFiles;
	CEdit	    m_CtrlFileName;
	CString	m_StartAddr;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMultiBinDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
    HICON m_hIcon;
	// Generated message map functions
	//{{AFX_MSG(CMultiBinDlg)
	afx_msg void OnButtonfile();
	afx_msg void OnButtonadd();
	afx_msg void OnButtondelete();
	virtual void OnCancel();
	virtual void OnOK();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MULTIBINDLG_H__70EEAD1A_4D39_4A22_AA91_25BF7D9FD193__INCLUDED_)
