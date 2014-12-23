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

// DfuFileMgrDlg.h : header file
//

#if !defined(AFX_DfuFileMgrDLG_H__E5AD213B_6DC4_4073_A0F7_0EEC25640AEC__INCLUDED_)
#define AFX_DfuFileMgrDLG_H__E5AD213B_6DC4_4073_A0F7_0EEC25640AEC__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrDlg dialog

class CDfuFileMgrDlg : public CDialog
{
private:
	BOOL GetImageFromS19(CFile *pFile, PBYTE pBuffer, DWORD Size, DWORD S19Size);

// Construction
public:
	CDfuFileMgrDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDfuFileMgrDlg)
	enum { IDD = IDD_DfuFileMgrGenerate_DIALOG };
	CHexEdit	m_VersionCtrl;
	CHexEdit	m_PIDCtrl;
	CHexEdit	m_VIDCtrl;
	CListBox	m_ListFiles;
	BYTE	m_AltSet;
	CString	m_Bcd;
	CString	m_Vid;
	CString	m_Pid;
	CString	m_TargetName;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDfuFileMgrDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	CDWordArray m_Images;
	// Generated message map functions
	//{{AFX_MSG(CDfuFileMgrDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonadd();
	afx_msg void OnButtongenerate();
	afx_msg void OnClose();
	afx_msg void OnButtondelete();
	afx_msg void OnButtonaddbin();
	afx_msg void OnSelchangeListfiles();
	afx_msg void OnButtonadds19hex();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DfuFileMgrDLG_H__E5AD213B_6DC4_4073_A0F7_0EEC25640AEC__INCLUDED_)
