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

#if !defined(AFX_OPTIONBYTESDIALOG_H__AAED8902_2401_40DA_9E0F_F15486707357__INCLUDED_)
#define AFX_OPTIONBYTESDIALOG_H__AAED8902_2401_40DA_9E0F_F15486707357__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// OptionBytesDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// COptionBytesDialog dialog

class COptionBytesDialog : public CDialog
{
// Construction
public:

	HANDLE  m_phDevice;
    BYTE    * m_pBuffer;
    ULONG   m_nBytes;
    USHORT  m_nBlock;

	void* GetSIFData(LPBYTE User, LPBYTE RDP, LPBYTE Data0, LPBYTE Data1,LPBYTE WRP0, LPBYTE WRP1, LPBYTE WRP2, LPBYTE WRP3);
	void* SetSIFData(BYTE User, BYTE RDP, BYTE Data0, BYTE Data1,BYTE WRP0, BYTE WRP1, BYTE WRP2, BYTE WRP3);

	COptionBytesDialog(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(COptionBytesDialog)
	enum { IDD = IDD_OPTION_BYTE_DIALOG };
	CString	m_RDP_Value;
	CString	m_WRP0_Value;
	CString	m_WRP1_Value;
	CString	m_WRP2_Value;
	CString	m_WRP3_Value;
	CString	m_User_Value;
	CString	m_Data0_Value;
	CString	m_Data1_Value;
	BOOL	m_nRST_STDBY_Value;
	BOOL	m_nRST_STOP_Value;
	BOOL	m_ReadOutProtectionEnabledValue;
	BOOL	m_WDG_SW_Value;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(COptionBytesDialog)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(COptionBytesDialog)
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	afx_msg void OnReadOutProtectionEnabledCheck();
	afx_msg void OnChangeUserEdit();
	afx_msg void OnWdgSw();
	afx_msg void OnNrstStopCheck2();
	afx_msg void OnNrstStdbyCheck();
	afx_msg void OnApply();
	virtual void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OPTIONBYTESDIALOG_H__AAED8902_2401_40DA_9E0F_F15486707357__INCLUDED_)
