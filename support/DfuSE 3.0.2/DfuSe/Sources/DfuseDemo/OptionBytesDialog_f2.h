/******************** (C) COPYRIGHT 2010 STMicroelectronics ********************
* Company            : STMicroelectronics
* Author             : MCD Application Team
* Description        : STMicroelectronics Device Firmware Upgrade Extension Demo
* Version            : V3.0.1
* Date               : 06/18/2010
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*******************************************************************************/

#if !defined(AFX_OPTIONBYTESDIALOGF2_H__AAED8902_2401_40DA_9E0F_F15486707357__INCLUDED_)
#define AFX_OPTIONBYTESDIALOGF2_H__AAED8902_2401_40DA_9E0F_F15486707357__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// OptionBytesDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// COptionBytesDialog_F2 dialog

class COptionBytesDialog_F2 : public CDialog
{
// Construction
public:

	HANDLE  m_phDevice;
    BYTE    * m_pBuffer;
    ULONG   m_nBytes;
    USHORT  m_nBlock;

	void* GetOptions(LPBYTE User, LPBYTE RDP, LPBYTE WRP0, LPBYTE WRP1);
	void* SetOptions(BYTE User, BYTE RDP, BYTE WRP0, BYTE WRP1);

	COptionBytesDialog_F2(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(COptionBytesDialog_F2)
	enum { IDD = IDD_OPTION_BYTE_F2_DIALOG };
	CString	m_RDP_Value;
	CString	m_WRP_Value;
	CString	m_User_Value;

	BOOL	m_nRST_STDBY_Value;
	BOOL	m_nRST_STOP_Value;
	BOOL	m_WDG_SW_Value;
	BOOL	m_BOR_LEV1_Value;
	BOOL    m_BOR_LEV0_Value;

	BOOL	m_ReadOutProtectionEnabledValue;
	BOOL	m_ReadOutProtectionEnabledValue2;
	BOOL	m_ReadOutProtectionEnabledValue3;

	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(COptionBytesDialog_F2)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(COptionBytesDialog_F2)
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	afx_msg void OnReadOutProtectionEnabledCheck();
	afx_msg void OnReadOutProtectionEnabledCheck2();
	afx_msg void OnReadOutProtectionEnabledCheck3();
	afx_msg void OnChangeUserEdit();
	afx_msg void OnWdgSw();
	afx_msg void OnNrstStopCheck2();
	afx_msg void OnNrstStdbyCheck();
    afx_msg void OnBor0Check();
	afx_msg void OnBor1Check();
	afx_msg void OnApply();
	virtual void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OPTIONBYTESDIALOG_H__AAED8902_2401_40DA_9E0F_F15486707357__INCLUDED_)
