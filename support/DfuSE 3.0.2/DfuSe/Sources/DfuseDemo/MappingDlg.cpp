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

// MappingDlg.cpp : implementation file
//

#include "stdafx.h"
#include "dfusedemo.h"
#include "MappingDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMappingDlg dialog


CMappingDlg::CMappingDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMappingDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMappingDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CMappingDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMappingDlg)
	DDX_Control(pDX, IDC_LISTMAPPING, m_Mapping);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CMappingDlg, CDialog)
	//{{AFX_MSG_MAP(CMappingDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMappingDlg message handlers

BOOL CMappingDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	CString Tmp;
	int i=0;
	
	m_Mapping.InsertColumn(0, "Sector Num",LVCFMT_CENTER,80);
	m_Mapping.InsertColumn(1, "Start Address", LVCFMT_LEFT,90);
	m_Mapping.InsertColumn(2, "End Address", LVCFMT_LEFT,90);
	m_Mapping.InsertColumn(3, "Size", LVCFMT_LEFT,60);
	m_Mapping.InsertColumn(4, "Readable", LVCFMT_LEFT,65);
	m_Mapping.InsertColumn(5, "Writeable", LVCFMT_LEFT,65);
	m_Mapping.InsertColumn(6, "Erasable", LVCFMT_LEFT,65);

	ListView_SetExtendedListViewStyle(m_Mapping.m_hWnd, LVS_EX_FULLROWSELECT);

	Tmp=m_MapDesc;
	Tmp+="\n";

	while (TRUE)
	{
		CString ToAnalyze, Sector, Start, End, Size, Type, Readable, Writable, Erasable;
		int Pos, NPos=Tmp.Find("\n", 0);

		if (NPos==-1)
			break;
		ToAnalyze=Tmp.Left(NPos);
		ToAnalyze+="\t";
		
		Pos=ToAnalyze.Find("\t", 0);
		if (Pos==-1)
			break;
		Sector=ToAnalyze.Left(Pos);
		ToAnalyze=ToAnalyze.Mid(Pos+1);

		Pos=ToAnalyze.Find("\t", 0);
		if (Pos==-1)
			break;
		Start=ToAnalyze.Left(Pos);
		ToAnalyze=ToAnalyze.Mid(Pos+1);

		Pos=ToAnalyze.Find("\t", 0);
		if (Pos==-1)
			break;
		End=ToAnalyze.Left(Pos);
		ToAnalyze=ToAnalyze.Mid(Pos+1);
		
		Pos=ToAnalyze.Find("\t", 0);
		if (Pos==-1)
			break;
		Size=ToAnalyze.Left(Pos);
		ToAnalyze=ToAnalyze.Mid(Pos+1);
		
		Pos=ToAnalyze.Find("\t", 0);
		if (Pos==-1)
			break;
		Type=ToAnalyze.Left(Pos);
		if (Type.Find("R", 0)!=-1)
			Readable="     X";
		else
			Readable="";
		if (Type.Find("W", 0)!=-1)
			Writable="     X";
		else
			Writable="";
		if (Type.Find("E", 0)!=-1)
			Erasable="     X";
		else
			Erasable="";

		ToAnalyze=ToAnalyze.Mid(Pos+1);
		
		m_Mapping.InsertItem(i, Sector);
		m_Mapping.SetItemText(i, 1, Start); 
		m_Mapping.SetItemText(i, 2, End); 
		m_Mapping.SetItemText(i, 3, Size); 
		m_Mapping.SetItemText(i, 4, Readable); 
		m_Mapping.SetItemText(i, 5, Writable); 
		m_Mapping.SetItemText(i, 6, Erasable); 

		i++;
		Tmp=Tmp.Mid(NPos+1);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CMappingDlg::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}
