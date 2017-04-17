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

// DfuFileMgrDlgExtract.cpp : implementation file
//

#include "stdafx.h"
#include "dfufilemgr.h"
#include "DfuFileMgrDlgExtract.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrDlgExtract dialog


CDfuFileMgrDlgExtract::CDfuFileMgrDlgExtract(CWnd* pParent /*=NULL*/)
	: CDialog(CDfuFileMgrDlgExtract::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDfuFileMgrDlgExtract)
	m_Pid = _T("0000");
	m_Vid = _T("0000");
	m_Bcd = _T("0000");
	m_DfuFile = _T("");
	m_ExtractFormat = 0;
	//}}AFX_DATA_INIT
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	m_hFile=0;
}


void CDfuFileMgrDlgExtract::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDfuFileMgrDlgExtract)

	DDX_Control(pDX, IDC_EDITPID, m_PidCtrl);
	DDX_Control(pDX, IDC_EDITVID, m_VidCtrl);
	DDX_Control(pDX, IDC_EDITVERSION, m_BcdCtrl);
	DDX_Control(pDX, IDC_LISTFILES, m_ListFiles);

	DDX_Text(pDX, IDC_EDITPID, m_Pid);
	DDV_MaxChars(pDX, m_Pid, 4);

	DDX_Text(pDX, IDC_EDITVID, m_Vid);
	DDV_MaxChars(pDX, m_Vid, 4);

	DDX_Text(pDX, IDC_EDITVERSION, m_Bcd);
	DDV_MaxChars(pDX, m_Bcd, 4);

	DDX_Text(pDX, IDC_DFU_FILE, m_DfuFile);
	DDX_Radio(pDX, IDC_RADIOS19, m_ExtractFormat);
	
	
	
	
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDfuFileMgrDlgExtract, CDialog)
	//{{AFX_MSG_MAP(CDfuFileMgrDlgExtract)
	ON_BN_CLICKED(IDC_BUTTONOPEN, OnButtonopen)
	ON_BN_CLICKED(IDC_BUTTONEXTRACT, OnButtonextract)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDfuFileMgrDlgExtract message handlers

void CDfuFileMgrDlgExtract::OnButtonopen() 
{
	TCHAR szFilters[]=
    "Dfu Files (*.dfu)|*.dfu|All Files (*.*)|*.*||";

	CFileDialog* dlg;
	dlg = new CFileDialog(TRUE, _T("dfu"), _T("*.dfu"), OFN_FILEMUSTEXIST, szFilters, this);

	UpdateData(TRUE);
	m_ListFiles.ResetContent();
	if (dlg->DoModal()==IDOK)
	{
		BYTE Alts;
		WORD Vid;
		WORD Pid;
		WORD Bcd;

		if (m_hFile!=0)
			STDFUFILES_CloseDFUFile(m_hFile);

		if (STDFUFILES_OpenExistingDFUFile((LPSTR)(LPCSTR)dlg->GetFileName(), &m_hFile, &Vid, &Pid, &Bcd, &Alts)==STDFUFILES_NOERROR)
		{
			BYTE Alt;
			CString Tmp, Tmp1;

			m_Pid.Format("%04X", Pid);
			m_Vid.Format("%04X", Vid);
			m_Bcd.Format("%04X", Bcd);
			m_FileBaseName=dlg->GetPathName().Left(dlg->GetPathName().GetLength()-4);
		    m_DfuFile = dlg->GetPathName(); 

			UpdateData(FALSE);
			for (BYTE i=0;i<Alts;i++)
			{
				HANDLE Image;
				CString Tmp;
				if (STDFUFILES_ReadImageFromDFUFile(m_hFile, i, &Image)==STDFUFILES_NOERROR)
				{
					char Name[512];

					STDFUFILES_GetImageAlternate(Image, &Alt);
					STDFUFILES_GetImageName(Image, Name);
					STDFUFILES_DestroyImage(&Image);

					Tmp.Format("Image for Target ID %02i", Alt);
					if (Name[0]!='\0')
					{
						Tmp+="  (";
						Tmp+=Name;
						Tmp+=")";
					}
					m_ListFiles.AddString(Tmp);
				}
				else
				{
					AfxMessageBox("Unable to read images in file...");
					break;
				}
				if(m_ListFiles.GetCount()>0)
				   m_ListFiles.SetCurSel(0);
			}
		}
		else
			AfxMessageBox("Error... Maybe bad or old file format");
	}
}

void CDfuFileMgrDlgExtract::OnCancel() 
{
	if (m_hFile!=0)
		STDFUFILES_CloseDFUFile(m_hFile);
	
	CDialog::OnCancel();
}

void CDfuFileMgrDlgExtract::OnButtonextract() 
{
	if (m_hFile==0)
		return;

	int Sel=m_ListFiles.GetCurSel();

	if (Sel==-1)
		return;

	UpdateData(TRUE);

	HANDLE Image;

	if (STDFUFILES_ReadImageFromDFUFile(m_hFile, Sel, &Image)==STDFUFILES_NOERROR)
	{
		BYTE Alt;

		STDFUFILES_GetImageAlternate(Image, &Alt);

		CString FileName;
		FileName.Format("%s_%02i", m_FileBaseName, Alt);
		CString sFile;

		if (m_ExtractFormat==2) 
		{
			DWORD NbEl;

			if (STDFUFILES_GetImageNbElement(Image, &NbEl)==STDFUFILES_NOERROR)
			{
				CString Status;
				BOOL bSuccess=TRUE;

				for (DWORD i=0;i<NbEl;i++)
				{
					DFUIMAGEELEMENT Element={0};

					if (STDFUFILES_GetImageElement(Image, i, &Element)==STDFUFILES_NOERROR)
					{
						Element.Data=new BYTE[Element.dwDataLength];

						if (STDFUFILES_GetImageElement(Image, i, &Element)==STDFUFILES_NOERROR)
						{
							CFile File;
							CFileException ex;

							sFile.Format("%s_%08X.bin", FileName, Element.dwAddress);
							if (File.Open(sFile, CFile::modeCreate | CFile::modeWrite, &ex))
							{
								File.Write(Element.Data, Element.dwDataLength);
								File.Close();
								Status=Status+sFile;
								Status+=" was created !\n";
							}
							else
							{
								CString Err;
								bSuccess=FALSE;
								Err.Format("IoError %08xh", ex.m_lOsError);
								AfxMessageBox(Err);
								delete[]Element.Data;
								break;
							}
						}
						else
						{
							AfxMessageBox("Unable to access element in image...");
							bSuccess=FALSE;
							delete[]Element.Data;
							break;
						}
						delete[]Element.Data;
					}
					else
					{
						AfxMessageBox("Unable to access element in image...");
						bSuccess=FALSE;
						break;
					}
				}
				if (bSuccess)
					AfxMessageBox(Status);
			}
			else
				AfxMessageBox("Unable to access element in image...");
		}
		else
		{
			if (m_ExtractFormat==0) 
				FileName+=".s19";
			else
			if (m_ExtractFormat==1)
				FileName+=".hex";
			if (STDFUFILES_ImageToFile((LPSTR)(LPCSTR)FileName, Image)==STDFUFILES_NOERROR)
			{
				FileName+=" was created !";
				AfxMessageBox(FileName);
			}
			else
				AfxMessageBox("Error while creating file...");
		}
		STDFUFILES_DestroyImage(&Image);
	}
	else
		AfxMessageBox("Unable to read file...");
}

void CDfuFileMgrDlgExtract::OnPaint() 
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

BOOL CDfuFileMgrDlgExtract::OnInitDialog() 
{
	CDialog::OnInitDialog();

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
