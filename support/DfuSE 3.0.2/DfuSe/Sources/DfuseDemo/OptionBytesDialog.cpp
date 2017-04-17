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

// OptionBytesDialog.cpp : implementation file
//

#include "stdafx.h"
#include "dfusedemo.h"
#include "OptionBytesDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// COptionBytesDialog dialog

static GUID	GUID_DFU = { 0x3fe809ab,0xfb91,0x4cb5,{ 0xa6,0x43,0x69,0x67,0x0d,0x52,0x36,0x6e } };
static GUID GUID_APP = { 0xcb979912, 0x5029, 0x420a, { 0xae, 0xb1, 0x34, 0xfc, 0xa, 0x7d, 0x57, 0x26 } };


COptionBytesDialog::COptionBytesDialog(CWnd* pParent /*=NULL*/)
	: CDialog(COptionBytesDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(COptionBytesDialog)
	m_RDP_Value = _T("00");
	m_WRP0_Value = _T("00");
	m_WRP1_Value = _T("00");
	m_WRP2_Value = _T("00");
	m_WRP3_Value = _T("00");
	m_User_Value = _T("00");
	m_Data0_Value = _T("00");
	m_Data1_Value = _T("00");
	m_nRST_STDBY_Value = FALSE;
	m_nRST_STOP_Value = FALSE;
	m_ReadOutProtectionEnabledValue = FALSE;
	m_WDG_SW_Value = FALSE;
	//}}AFX_DATA_INIT
}


void COptionBytesDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(COptionBytesDialog)
	DDX_Text(pDX, IDC_RDP_EDIT, m_RDP_Value);
	DDV_MaxChars(pDX, m_RDP_Value, 2);
	DDX_Text(pDX, IDC_WRP0_EDIT, m_WRP0_Value);
	DDV_MaxChars(pDX, m_WRP0_Value, 2);
	DDX_Text(pDX, IDC_WRP1_EDIT, m_WRP1_Value);
	DDV_MaxChars(pDX, m_WRP1_Value, 2);
	DDX_Text(pDX, IDC_WRP2_EDIT, m_WRP2_Value);
	DDV_MaxChars(pDX, m_WRP2_Value, 2);
	DDX_Text(pDX, IDC_WRP3_EDIT, m_WRP3_Value);
	DDV_MaxChars(pDX, m_WRP3_Value, 2);
	DDX_Text(pDX, IDC_USER_EDIT, m_User_Value);
	DDV_MaxChars(pDX, m_User_Value, 2);
	DDX_Text(pDX, IDC_DATA0_EDIT, m_Data0_Value);
	DDV_MaxChars(pDX, m_Data0_Value, 2);
	DDX_Text(pDX, IDC_DATA1_EDIT, m_Data1_Value);
	DDV_MaxChars(pDX, m_Data1_Value, 2);
	DDX_Check(pDX, IDC_NRST_STDBY_CHECK, m_nRST_STDBY_Value);
	DDX_Check(pDX, IDC_NRST_STOP_CHECK2, m_nRST_STOP_Value);
	DDX_Check(pDX, IDC_READ_OUT_PROTECTION_ENABLED_CHECK, m_ReadOutProtectionEnabledValue);
	DDX_Check(pDX, IDC_WDG_SW, m_WDG_SW_Value);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(COptionBytesDialog, CDialog)
	//{{AFX_MSG_MAP(COptionBytesDialog)
	ON_WM_SHOWWINDOW()
	ON_BN_CLICKED(IDC_READ_OUT_PROTECTION_ENABLED_CHECK, OnReadOutProtectionEnabledCheck)
	ON_EN_CHANGE(IDC_USER_EDIT, OnChangeUserEdit)
	ON_BN_CLICKED(IDC_WDG_SW, OnWdgSw)
	ON_BN_CLICKED(IDC_NRST_STOP_CHECK2, OnNrstStopCheck2)
	ON_BN_CLICKED(IDC_NRST_STDBY_CHECK, OnNrstStdbyCheck)
	ON_BN_CLICKED(ID_APPLY, OnApply)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// COptionBytesDialog message handlers

	/*typedef struct  
	{
		UCHAR bStatus;
		UCHAR bwPollTimeout[3];
		UCHAR bState;
		UCHAR iString;
	}	DFUSTATUS,  *PDFUSTATUS;*/

void* COptionBytesDialog::GetSIFData(LPBYTE User, LPBYTE RDP, LPBYTE Data0, LPBYTE Data1, LPBYTE WRP0, LPBYTE WRP1, LPBYTE WRP2, LPBYTE WRP3)
{
   m_pBuffer = (LPBYTE) malloc(64);
   memset(m_pBuffer, 0x00, 64);
   
   if (STDFU_SelectCurrentConfiguration(&m_phDevice, 0, 0,1)==STDFU_NOERROR)
   {
       DFUSTATUS DFUStatus;

	   STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   while(DFUStatus.bState != STATE_DFU_IDLE)
	   {
			STDFU_Clrstatus(&m_phDevice);
			STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   }
		   
	   m_pBuffer[0] = 0x21;
	   m_pBuffer[1] = 0x00;
	   m_pBuffer[2] = 0xF8;
	   m_pBuffer[3] = 0xFF;
	   m_pBuffer[4] = 0x1F;

	   STDFU_Dnload(&m_phDevice, m_pBuffer, 0x05, 0);
	   
	   STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   while(DFUStatus.bState != STATE_DFU_IDLE)
	   {
			STDFU_Clrstatus(&m_phDevice);
			STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   }

	   if(STDFU_Upload(&m_phDevice, m_pBuffer, 0x10, 2) == STDFU_NOERROR)
	   {
		   *RDP   = m_pBuffer[0] ;
		   *User  = m_pBuffer[2];
		   *Data0 = m_pBuffer[4];
		   *Data1 = m_pBuffer[6];
		   *WRP0  = m_pBuffer[8];
		   *WRP1  = m_pBuffer[10];
		   *WRP2  = m_pBuffer[12];
		   *WRP3  = m_pBuffer[14];
		   return 0;
	   }
	   return 0;
   }
   return 0;
}

void* COptionBytesDialog::SetSIFData(BYTE User, BYTE RDP, BYTE Data0, BYTE Data1, BYTE WRP0, BYTE WRP1, BYTE WRP2, BYTE WRP3)
{
   m_pBuffer = (LPBYTE) malloc(0x10);
   memset(m_pBuffer, 0xFF, 0x10);
   
   if (STDFU_SelectCurrentConfiguration(&m_phDevice, 0, 0,1)==STDFU_NOERROR)
   {
       DFUSTATUS DFUStatus;

	   STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   while(DFUStatus.bState != STATE_DFU_IDLE)
	   {
			STDFU_Clrstatus(&m_phDevice);
			STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   }
		   
	   m_pBuffer[0] = 0x21;
	   m_pBuffer[1] = 0x00;
	   m_pBuffer[2] = 0xF8;
	   m_pBuffer[3] = 0xFF;
	   m_pBuffer[4] = 0x1F;

	   STDFU_Dnload(&m_phDevice, m_pBuffer, 0x05, 0);
	   
	   STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   while(DFUStatus.bState != STATE_DFU_DOWNLOAD_IDLE)
	   {
			//STDFU_Clrstatus(&m_phDevice);
			STDFU_Getstatus(&m_phDevice, &DFUStatus);
	   }

	   memset(m_pBuffer, 0xFF, 0x10);

	   m_pBuffer[0]  = RDP;
	   m_pBuffer[1]  = ~RDP;
	   m_pBuffer[2]  = User;
	   m_pBuffer[3]  = ~User;
	   m_pBuffer[4]  = Data0;
       m_pBuffer[5]  = ~Data0;
	   m_pBuffer[6]  = Data1;
	   m_pBuffer[7]  = ~Data1;
	   m_pBuffer[8]  = WRP0;
	   m_pBuffer[9]  = ~WRP0;
	   m_pBuffer[10] = WRP1;
	   m_pBuffer[11] = ~WRP1;
	   m_pBuffer[12] = WRP2;
	   m_pBuffer[13] = ~WRP2;
	   m_pBuffer[14] = WRP3;
	   m_pBuffer[15] = ~WRP3;

	   /*#define STATE_IDLE							0x00
#define STATE_DETACH						0x01
#define STATE_DFU_IDLE						0x02
#define STATE_DFU_DOWNLOAD_SYNC				0x03
#define STATE_DFU_DOWNLOAD_BUSY				0x04
#define STATE_DFU_DOWNLOAD_IDLE				0x05
#define STATE_DFU_MANIFEST_SYNC				0x06
#define STATE_DFU_MANIFEST					0x07
#define STATE_DFU_MANIFEST_WAIT_RESET		0x08
#define STATE_DFU_UPLOAD_IDLE				0x09
#define STATE_DFU_ERROR						0x0A

#define STATE_DFU_UPLOAD_SYNC				0x91
#define STATE_DFU_UPLOAD_BUSY				0x92*/

	   if(STDFU_Dnload(&m_phDevice, m_pBuffer, 0x10, 2) == STDFU_NOERROR)
	   {
		   STDFU_Getstatus(&m_phDevice, &DFUStatus);
		   /*while(DFUStatus.bState != STATE_DFU_DOWNLOAD_IDLE)
		   {
				//STDFU_Clrstatus(&m_phDevice);
				STDFU_Getstatus(&m_phDevice, &DFUStatus);
		   }*/

		   return 0;
	   }
	   return 0;
   }
   return 0;
}

void COptionBytesDialog::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);
	
	BYTE User = 0x00;
	BYTE RDP = 0x00;
	BYTE Data0 = 0x00;
	BYTE Data1 = 0x00;
	BYTE WRP0 = 0x00;
	BYTE WRP1 = 0x00;
	BYTE WRP2 = 0x00;
	BYTE WRP3 = 0x00;

	GetSIFData(&User, &RDP, &Data0, &Data1, &WRP0, &WRP1, &WRP2, &WRP3);

	UpdateData(TRUE);

	m_User_Value.Format("%02X",User);
	m_RDP_Value.Format("%02X",RDP);
	m_Data0_Value.Format("%02X",Data0);
	m_Data1_Value.Format("%02X",Data1);
	m_WRP0_Value.Format("%02X",WRP0);
	m_WRP1_Value.Format("%02X",WRP1);
	m_WRP2_Value.Format("%02X",WRP2);
	m_WRP3_Value.Format("%02X",WRP3);
 

	if(RDP == 0xA5) m_ReadOutProtectionEnabledValue = FALSE;
    else m_ReadOutProtectionEnabledValue = TRUE;


    m_nRST_STDBY_Value = (User & 0x04) >> 2;
	m_nRST_STOP_Value  = (User & 0x02) >> 1;
	m_WDG_SW_Value     = (User & 0x01);
	


	UpdateData(FALSE);
	// TODO: Add your message handler code here
	
}

void COptionBytesDialog::OnReadOutProtectionEnabledCheck() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
    
	BYTE RDP = 0x00;

	if(m_ReadOutProtectionEnabledValue)  RDP = 0xFF;
	else RDP = 0xA5;

	m_RDP_Value.Format("%02x", RDP);

	UpdateData(FALSE);
}

void COptionBytesDialog::OnChangeUserEdit() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	
	// TODO: Add your control notification handler code here
}

void COptionBytesDialog::OnWdgSw() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
    
	BYTE USER = _tcstoul(m_User_Value, 0, 16) ;

	if(m_WDG_SW_Value)  USER = USER | 0x01;
	else USER = USER & 0xFE;

	m_User_Value.Format("%02x", USER);

	UpdateData(FALSE);
}

void COptionBytesDialog::OnNrstStopCheck2() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
    
	BYTE USER = _tcstoul(m_User_Value, 0, 16) ;

	if(m_nRST_STOP_Value)  USER = USER | 0x02;
	else USER = USER & 0xFD;

	m_User_Value.Format("%02x", USER);

	UpdateData(FALSE);
}

void COptionBytesDialog::OnNrstStdbyCheck() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);

	BYTE USER = _tcstoul(m_User_Value, 0, 16) ;
    
	if(m_nRST_STDBY_Value)  USER = USER | 0x04;
	else USER = USER & 0xFB;

	m_User_Value.Format("%02x", USER);

	UpdateData(FALSE);
}

void COptionBytesDialog::OnApply() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	BYTE User  = _tcstoul(m_User_Value, 0, 16) ;
	BYTE RDP   = _tcstoul(m_RDP_Value, 0, 16) ;
	BYTE Data0 = _tcstoul(m_Data0_Value, 0, 16) ;
	BYTE Data1 = _tcstoul(m_Data1_Value, 0, 16) ;
	BYTE WRP0  = _tcstoul(m_WRP0_Value, 0, 16) ;
	BYTE WRP1  = _tcstoul(m_WRP1_Value, 0, 16) ;
	BYTE WRP2  = _tcstoul(m_WRP2_Value, 0, 16) ;
	BYTE WRP3  = _tcstoul(m_WRP3_Value, 0, 16) ;
	UpdateData(FALSE);

	SetSIFData(User, RDP, Data0, Data1, WRP0, WRP1, WRP2, WRP3);

	STDFU_Close(&m_phDevice);
	
	CDialog::OnOK();
}

void COptionBytesDialog::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}
