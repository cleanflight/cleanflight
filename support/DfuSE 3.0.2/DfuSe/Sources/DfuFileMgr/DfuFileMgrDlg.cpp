/******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
* Company            : STMicroelectronics
* Author             : MCD Application Team
* Description        : STMicroelectronics Device Firmware Upgrade File Manager Dlg
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

// DfuFileMgrDlg.cpp : implementation file
//

#include "stdafx.h"
#include "HexEdit.h"
#include "DfuFileMgr.h"
#include "DfuFileMgrDlg.h"
#include <io.h>
#include "MultiBinDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

INT Binary_Hex ( INT c)
{

	if (c < 60  ) c = c-48; else c = c-55;
	return c;
}

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrDlg dialog

CDfuFileMgrDlg::CDfuFileMgrDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDfuFileMgrDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDfuFileMgrDlg)
	m_AltSet = 0;
	m_Bcd = _T("0000");
	m_Vid = _T("0483");
	m_Pid = _T("0000");
	m_TargetName = _T("ST...");
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDfuFileMgrDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDfuFileMgrDlg)
	DDX_Control(pDX, IDC_EDITVERSION, m_VersionCtrl);
	DDX_Control(pDX, IDC_EDITPID, m_PIDCtrl);
	DDX_Control(pDX, IDC_EDITVID, m_VIDCtrl);
	DDX_Control(pDX, IDC_LISTFILES, m_ListFiles);
	DDX_Text(pDX, IDC_EDITALTSET, m_AltSet);
	DDV_MinMaxByte(pDX, m_AltSet, 0, 9);
	DDX_Text(pDX, IDC_EDITVERSION, m_Bcd);
	DDV_MaxChars(pDX, m_Bcd, 4);
	DDX_Text(pDX, IDC_EDITVID, m_Vid);
	DDV_MaxChars(pDX, m_Vid, 4);
	DDX_Text(pDX, IDC_EDITPID, m_Pid);
	DDV_MaxChars(pDX, m_Pid, 4);
	DDX_Text(pDX, IDC_EDITTRGTNAME, m_TargetName);
	DDV_MaxChars(pDX, m_TargetName, 255);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDfuFileMgrDlg, CDialog)
	//{{AFX_MSG_MAP(CDfuFileMgrDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTONADD, OnButtonadd)
	ON_BN_CLICKED(IDC_BUTTONGENERATE, OnButtongenerate)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BUTTONDELETEIMAGE, OnButtondelete)
	ON_BN_CLICKED(IDC_BUTTONADDBIN, OnButtonaddbin)
	ON_LBN_SELCHANGE(IDC_LISTFILES, OnSelchangeListfiles)
	ON_BN_CLICKED(IDC_BUTTONADDS19HEX, OnButtonadds19hex)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrDlg message handlers

BOOL CDfuFileMgrDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDfuFileMgrDlg::OnPaint() 
{
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
}

HCURSOR CDfuFileMgrDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDfuFileMgrDlg::OnButtonadd() 
{
	CFile File;
	CFileException ex;
	CString Tmp;

	UpdateData(TRUE);
	Tmp.Format("Image for Alternate Setting %02i", m_AltSet);
	if (m_ListFiles.FindString(-1, Tmp)!=LB_ERR)
		AfxMessageBox("This alternate setting was already chosen");
	else
	{
		TCHAR szFilters[]=
		"s19 Files (*.s19)|*.s19|hex Files (*.hex)|*.hex|";

		CFileDialog* dlg;
		
		dlg = new CFileDialog(TRUE, _T("s19"), _T("*.s19"), OFN_FILEMUSTEXIST, szFilters, this);

		if (dlg->DoModal()==IDOK)
		{
			HANDLE Image;
			if (STDFUFILES_ImageFromFile((LPSTR)(LPCSTR)dlg->GetPathName(), &Image, m_AltSet)==STDFUFILES_NOERROR)
			{
				m_Images.Add((DWORD)Image);
				Tmp.Format("Image for Alternate Setting %02i", m_AltSet);
				if (STDFUFILES_SetImageName(Image, (PSTR)(LPCSTR)m_TargetName)==STDFUFILES_NOERROR)
				{
					Tmp+="  (";
					Tmp+=m_TargetName;
					Tmp+=")";
				}
				m_ListFiles.AddString(Tmp);
				m_ListFiles.SetCurSel(0);
			}
			else
				AfxMessageBox("Unable to create image from this file...");
		}
	}
}

void CDfuFileMgrDlg::OnButtondelete() 
{
	if(m_Images.GetSize() == 0)
	{
        AfxMessageBox("Image list is empty. No image to delete"); 
		return;
	}

	int Sel=m_ListFiles.GetCurSel();
	if (Sel!=LB_ERR)
	{
		m_ListFiles.DeleteString(Sel);
		HANDLE Image=(HANDLE)m_Images.GetAt(Sel);
		m_Images.RemoveAt(Sel,1);

		STDFUFILES_DestroyImage(&Image);

		if(m_ListFiles.GetCount() > 0)
		m_ListFiles.SetCurSel(0);
	}
}

void CDfuFileMgrDlg::OnButtongenerate() 
{
	HANDLE hFile;
	TCHAR szFilters[]=
    "Dfu Files (*.dfu)|*.dfu|All Files (*.*)|*.*||";
	WORD Vid, Pid, Bcd;

	CFileDialog* dlg;
	dlg = new CFileDialog(FALSE,  _T("dfu"), _T("*.dfu"),
					OFN_CREATEPROMPT |OFN_PATHMUSTEXIST |OFN_OVERWRITEPROMPT,
					szFilters, this);

	UpdateData(TRUE);

	if (m_Vid.IsEmpty() || m_Pid.IsEmpty() || m_Bcd.IsEmpty() )
	{
		AfxMessageBox("One of following element is empty. Please fill before continuing...\r\nVID, PID or Bcd Version"); 
		return;
	}
	else if(m_Images.GetSize() == 0)
	{
        AfxMessageBox("Image list is empty. Please select an S19, Hex or bin file"); 
		return;
	}
	if (dlg->DoModal()==IDOK)
	{
		char *dummy;
		Vid=(WORD)strtoul(m_Vid, &dummy, 16);
		Pid=(WORD)strtoul(m_Pid, &dummy, 16);
		Bcd=(WORD)strtoul(m_Bcd, &dummy, 16);

		if (STDFUFILES_CreateNewDFUFile((LPSTR)(LPCSTR)dlg->GetFileName(), &hFile, Vid, Pid, Bcd)==STDFUFILES_NOERROR)
		{
			for (int i=0;i<m_Images.GetSize();i++)
			{
				CString Tmp, Tmp1;
				HANDLE Image=(HANDLE)m_Images.GetAt(i);

				m_ListFiles.GetText(i, Tmp1);
				if (STDFUFILES_AppendImageToDFUFile(hFile, Image)==STDFUFILES_NOERROR)
				{
					Tmp.Format("Success for '%s' !",Tmp1);
					AfxMessageBox(Tmp);
				}
				else
				{
					Tmp.Format("Failure for '%s'...", Tmp1);
					AfxMessageBox(Tmp);
				}
			}
			STDFUFILES_CloseDFUFile(hFile);
		}
	}

	UpdateData(FALSE);
}


void CDfuFileMgrDlg::OnClose() 
{
	for (int i=0;i<m_Images.GetSize();i++)
	{
		HANDLE Image=(HANDLE)m_Images.GetAt(i);
		STDFUFILES_DestroyImage(&Image);
	}
	CDialog::OnClose();
}


void CDfuFileMgrDlg::OnButtonaddbin() 
{
	CFile File;
	CFileException ex;
	CString Tmp;

	UpdateData(TRUE);
	Tmp.Format("Image for Target ID %02i", m_AltSet);
	if (m_ListFiles.FindString(-1, Tmp)!=LB_ERR)
		AfxMessageBox("This Target ID was already chosen");
	else
	{
		CMultiBinDlg dlg;

		if (dlg.DoModal()==IDOK)
		{
			HANDLE Image;
			BOOL bSuccess=TRUE;
			if (STDFUFILES_CreateImage(&Image, m_AltSet)==STDFUFILES_NOERROR)
			{
				STDFUFILES_SetImageName(Image, (PSTR)(LPCSTR)m_TargetName);
				for (int i=0;i<dlg.m_Lines.GetSize();i++)
				{
					CString Entry, sFile, sStart;
					char *dummy;
					DFUIMAGEELEMENT Element;
										
					Entry=dlg.m_Lines.GetAt(i);
					sStart=Entry.Mid(2, 8);
					sFile=Entry.Mid(Entry.Find("\t", 0)+1, 1000);

					Element.dwAddress=strtoul((LPCSTR)sStart, &dummy, 16);

					CFile File;
					CFileException ex;
					if (File.Open(sFile, CFile::modeRead, &ex))
					{
						Element.dwDataLength=File.SeekToEnd();
						File.SeekToBegin();

						Element.Data=new BYTE[Element.dwDataLength];
						File.Read(Element.Data, Element.dwDataLength);
						File.Close();
						if (STDFUFILES_SetImageElement(Image, i, TRUE, Element)!=STDFUFILES_NOERROR)
						{
							AfxMessageBox("Unable to insert one element in the image...");
							break;
						}
						delete[] Element.Data;
					}
					else
					{
						CString Err;
						bSuccess=FALSE;
						Err.Format("IoError %08xh", ex.m_lOsError);
						AfxMessageBox(Err);
						break;
					}
				}
				if (bSuccess)
				{
					m_Images.Add((DWORD)Image);
					Tmp.Format("Image for Target ID %02i", m_AltSet);
					if (STDFUFILES_SetImageName(Image, (PSTR)(LPCSTR)m_TargetName)==STDFUFILES_NOERROR)
					{
						Tmp+="  (";
						Tmp+=m_TargetName;
						Tmp+=")";
					}
					m_ListFiles.AddString(Tmp);
				}
			}
			else
				AfxMessageBox("Unable to create image from this file...");
		}
	}
}

void CDfuFileMgrDlg::OnSelchangeListfiles() 
{
	// TODO: Add your control notification handler code here
	/*m_TargetName = ;
	m_AltSet     = ;
	m_Bcd        = ;
	m_Pid        = ;
	m_Vid        = ;*/
}

void CDfuFileMgrDlg::OnButtonadds19hex() 
{
	// TODO: Add your control notification handler code here
	
}
