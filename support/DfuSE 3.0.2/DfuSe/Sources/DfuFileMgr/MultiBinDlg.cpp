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

// MultiBinDlg.cpp : implementation file
//

#include "stdafx.h"
#include "dfufilemgr.h"
#include "MultiBinDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMultiBinDlg dialog


CMultiBinDlg::CMultiBinDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMultiBinDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMultiBinDlg)
	m_StartAddr = _T("00000000");
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}


void CMultiBinDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMultiBinDlg)
	DDX_Control(pDX, IDC_BUTTONADD, m_AddBtnCtrl);
	DDX_Control(pDX, IDC_EDITSTARTADDR, m_CtrlStartAddr);
	DDX_Control(pDX, IDC_LISTBIN, m_ListFiles);
	DDX_Control(pDX, IDC_EDITFILE, m_CtrlFileName);
	DDX_Text(pDX, IDC_EDITSTARTADDR, m_StartAddr);
	DDV_MaxChars(pDX, m_StartAddr, 8);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CMultiBinDlg, CDialog)
	//{{AFX_MSG_MAP(CMultiBinDlg)
	ON_BN_CLICKED(IDC_BUTTONFILE, OnButtonfile)
	ON_BN_CLICKED(IDC_BUTTONADD, OnButtonadd)
	ON_BN_CLICKED(IDC_BUTTONDELETE, OnButtondelete)
	ON_WM_CREATE()
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMultiBinDlg message handlers

void CMultiBinDlg::OnButtonfile() 
{
	TCHAR szFilters[]= "Binary Files (*.bin)|*.bin|All Files (*.*)|*.*|";


	CFileDialog* dlg;
	dlg = new CFileDialog(FALSE, 
		                  _T("bin"), _T("*.bin"), 
		                  OFN_PATHMUSTEXIST, 
						  szFilters, 
						  this);

	if (dlg->DoModal() == IDOK)
		m_CtrlFileName.SetWindowText(dlg->GetPathName());

	delete dlg;
}

void CMultiBinDlg::OnButtonadd() 
{
	DWORD Start;
	CString sFile, sStart, Tmp;
	
	m_CtrlFileName.GetWindowText(sFile);
	char *dummy;
	m_CtrlStartAddr.GetWindowText(sStart);
	Start=strtoul((LPCSTR)sStart, &dummy, 16);

	CFile File;
	CFileException ex;
	if (sFile.Compare("") != 0)
	{
		if (File.Open(sFile, CFile::modeRead, &ex))
		{
			DWORD Size=File.SeekToEnd();
			File.Close();
			Tmp.Format("0x%08X-0x%08X\t%s", Start, Start+Size-1, sFile);
			m_ListFiles.SendMessage(LB_SETHORIZONTALEXTENT, max((m_ListFiles.SendMessage(LB_SETHORIZONTALEXTENT, 0, 0)), (m_ListFiles.GetDC()->GetTextExtent(Tmp).cx)), 0);
			m_ListFiles.AddString(Tmp);
			m_Lines.Add(Tmp);
		}
		else
		{
			CString Err;

			Err.Format("Error %08xh: Cannot open file \"%s\"", ex.m_lOsError, sFile);
			AfxMessageBox(Err);
		}
	}
	else
	{
		CString Err;

		Err.Format("Please select one binary file", ex.m_lOsError);
		AfxMessageBox(Err);
	}
}

void CMultiBinDlg::OnButtondelete() 
{
	if (m_ListFiles.GetCurSel()!=LB_ERR)
	{
		m_Lines.RemoveAt(m_ListFiles.GetCurSel());
		m_ListFiles.DeleteString(m_ListFiles.GetCurSel());
	}
}

void CMultiBinDlg::OnCancel() 
{
	CDialog::OnCancel();
}

void CMultiBinDlg::OnOK() 
{
	CDialog::OnOK();
}

int CMultiBinDlg::OnCreate(LPCREATESTRUCT lpCreateStruct) 
{
	if (CDialog::OnCreate(lpCreateStruct) == -1)
		return -1;
	
	// TODO: Add your specialized creation code here
	 
	
	return 0;
}

BOOL CMultiBinDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CMultiBinDlg::OnPaint() 
{
	// TODO: Add your message handler code here
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
	// Do not call CDialog::OnPaint() for painting messages
}
