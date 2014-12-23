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

#if !defined(AFX_DFUFILEMGRDLGEXTRACT_H__EE4710CB_FCBF_48D3_8468_8E19F397C3DC__INCLUDED_)
#define AFX_DFUFILEMGRDLGEXTRACT_H__EE4710CB_FCBF_48D3_8468_8E19F397C3DC__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DfuFileMgrDlgExtract.h : header file
//

#include "hexedit.h"

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrDlgExtract dialog

class CDfuFileMgrDlgExtract : public CDialog
{
// Construction
public:
	CDfuFileMgrDlgExtract(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDfuFileMgrDlgExtract)
	enum { IDD = IDD_DfuFileMgrExtract_DIALOG };
	CListBox	m_ListFiles;


	CHexEdit m_PidCtrl;
	CHexEdit m_VidCtrl;
	CHexEdit m_BcdCtrl;

	CString	m_Pid;
	CString	m_Vid;
	CString	m_Bcd;
	CString m_DfuFile;

	int		m_ExtractFormat;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDfuFileMgrDlgExtract)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	HANDLE m_hFile;
	CString m_FileBaseName;
	// Generated message map functions
	//{{AFX_MSG(CDfuFileMgrDlgExtract)
	afx_msg void OnButtonopen();
	virtual void OnCancel();
	afx_msg void OnButtonextract();
	afx_msg void OnPaint();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DFUFILEMGRDLGEXTRACT_H__EE4710CB_FCBF_48D3_8468_8E19F397C3DC__INCLUDED_)
