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

// DfuSeDemoDlg.h : header file
//

#if !defined(AFX_DFUSEDEMODLG_H__7B5D1A5B_CC39_4227_8B3F_DA3BC7AF05B9__INCLUDED_)
#define AFX_DFUSEDEMODLG_H__7B5D1A5B_CC39_4227_8B3F_DA3BC7AF05B9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "hexedit.h"
#include "TextProgressCtrl.h"

/////////////////////////////////////////////////////////////////////////////
// CDfuSeDemoDlg dialog

class CDfuSeDemoDlg : public CDialog
{
// Construction
public:
	CDfuSeDemoDlg(CWnd* pParent = NULL);	// standard constructor
// Dialog Data
	//{{AFX_DATA(CDfuSeDemoDlg)
	enum { IDD = IDD_DfuSeDemo_DIALOG };
	CButton	m_Erase;
	CButton	m_BtnVerify;
	CListCtrl	m_CtrlDevTargets;
	CButton	m_BtnAbort;
	CEdit	m_CtrlDevAppVid;
	CEdit	m_CtrlDevAppPid;
	CEdit	m_CtrlDevAppBcd;
	CEdit	m_CtrlFileVid;
	CEdit	m_CtrlFileBcd;
	CButton	m_BtnCancel;
	CButton	m_BtnUpChoose;
	CButton	m_BtnDownChoose;
	CButton	m_BtnUpload;
	CButton	m_BtnUpgrade;
	CTextProgressCtrl	m_Progress;
	CEdit	m_CtrlFilePid;
	CListBox	m_CtrlFileTargets;
	CStatic	m_DownFile;
	CStatic	m_UpFile;
	CEdit	m_CtrlDevBcd;
	CButton	m_BtnEnterApp;
	CButton	m_BtnEnterDFU;
	CListBox	m_CtrlDFUDevices;
	CEdit	m_CtrlDevVid;
	CEdit	m_CtrlDevPid;
	CComboBox	m_CtrlDevices;
	BOOL	m_OptCanDetach;
	BOOL	m_OptCanDnload;
	BOOL	m_OptCanManifestTolerant;
	BOOL	m_OptCanUpload;
	BOOL	m_OptCanAccel;
	BOOL	m_TransferOptimized;
	CString	m_TimeDuration;
	BOOL	m_Verify;
	CString	m_DataSize;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDfuSeDemoDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	BOOL OnDeviceChange(UINT nEventType,DWORD dwData);

	// Generated message map functions
	//{{AFX_MSG(CDfuSeDemoDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonrefresh();
	virtual void OnCancel();
	afx_msg void OnSelchangeCombodevices();
	afx_msg void OnButtonenterdfu();
	afx_msg void OnButtonupchoose();
	afx_msg void OnButtondownchoose();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnButtonupload();
	afx_msg void OnButtonupgrade();
	afx_msg void OnButtonenterapp();
	afx_msg void OnButtonabort();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	afx_msg void OnDestroy();
	afx_msg void OnButtonverify();
	afx_msg void OnDblclkListtargets(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnItemchangedListtargets(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnErase();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CMapStringToPtr	m_DetachedDevs;

	CString			m_DetachedDev;
	CString			m_CurrDFUName;
	CBrush*			m_pBkBrush;
	CBrush*			m_pBkBrushReadOnly;
	UCHAR			m_Tab_Index[127];	// Use for the selection of the Device 
	DWORD			m_OperationCode;
	CString			m_UpFileName;
	CString			m_DownFileName;
	USB_DEVICE_DESCRIPTOR m_DeviceDesc;
	PMAPPING		m_pMapping;
	DWORD			m_NbAlternates;
	HANDLE			m_BufferedImage;
	CByteArray		m_OldSelectedTargets;
	int				m_CurrentTarget;
	DFU_FUNCTIONAL_DESCRIPTOR	m_CurrDevDFUDesc;

	CEnumerator		m_Enum;
	PHID_DEVICE		m_HidDevices;  // Enable to catch the HID Device structures
	ULONG			m_HidDevice_Counter;
	
	HANDLE			m_hDle;
	WORD			m_TransferSize;
	int             HidDev_Counter ;

	void Refresh();
	void HandleError(PDFUThreadContext pContext);
	void HandleTxtSuccess(LPCSTR);
	void HandleTxtError(LPCSTR);

	void FindMyHIDDevice();
	void ReleaseHIDMemory();

	void LaunchVerify();
	void LaunchUpload();
	void LaunchUpgrade();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DFUSEDEMODLG_H__7B5D1A5B_CC39_4227_8B3F_DA3BC7AF05B9__INCLUDED_)
