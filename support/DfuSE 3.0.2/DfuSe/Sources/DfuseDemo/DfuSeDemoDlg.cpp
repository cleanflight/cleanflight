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

// DfuSeDemoDlg.cpp : implementation file
//

#include "stdafx.h"
#include <dbt.h>
#include "DfuSeDemo.h"
#include "DfuSeDemoDlg.h"
#include "MappingDlg.h"
#include "OptionBytesDialog.h"
#include "OptionBytesDialog_f2.h"

#define STVendorID		  0x0483 //used
#define VENDOR_USAGE_PAGE 0xFF00 //used
#define USAGE_DETACH	  0x0055 //used


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define COLOR_RETURN_FG		(RGB(0x00,0x00,0xFF))
#define COLOR_RETURN_BG		(RGB_BK)
#define COLOR_UPLOAD_FG		(RGB(0x00,0x80,0x80))
#define COLOR_UPLOAD_BG		(RGB_BK)
#define COLOR_UPGRADE_FG	(RGB(0x00,0x80,0x00))
#define COLOR_UPGRADE_BG	(RGB_BK)
#define COLOR_ERROR_FG		(RGB(0xFF,0x00,0x00))
#define COLOR_ERROR_BG		(RGB_BK)

static GUID	GUID_DFU = { 0x3fe809ab, 0xfb91, 0x4cb5, { 0xa6, 0x43, 0x69, 0x67, 0x0d, 0x52,0x36,0x6e } };
static GUID GUID_APP = { 0xcb979912, 0x5029, 0x420a, { 0xae, 0xb1, 0x34, 0xfc, 0x0a, 0x7d,0x57,0x26 } };

/////////////////////////////////////////////////////////////////////////////
// CDfuSeDemoDlg dialog


CTime startTime ;
CTime endTime ;
CTimeSpan elapsedTime;

BOOL ReadProtected = FALSE;
BOOL SupportROP    = FALSE;
int STM32Serie = 0;         // 1 for STM32F1
                            // 2 for STM32F2

CDfuSeDemoDlg::CDfuSeDemoDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDfuSeDemoDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDfuSeDemoDlg)
	m_OptCanDetach = FALSE;
	m_OptCanDnload = FALSE;
	m_OptCanManifestTolerant = FALSE;
	m_OptCanUpload = FALSE;
	m_OptCanAccel = FALSE;
	m_TransferOptimized = FALSE;
	m_TimeDuration = _T("00:00:00");
	m_Verify = FALSE;
	m_DataSize = _T("0 KB(0 Bytes) of 0 KB(0 Bytes)");
	//}}AFX_DATA_INIT

	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

	m_OperationCode=NULL;
	m_pBkBrush = new CBrush(RGB_BK);
	m_pBkBrushReadOnly = new CBrush(GetSysColor(15));
	m_pMapping=NULL;
	m_NbAlternates=0;
	m_BufferedImage=0;
	m_CurrentTarget=-1;

	m_HidDevices=NULL;
	m_HidDevice_Counter=0;
	m_hDle=NULL;
	m_OperationCode=NULL;
}

void CDfuSeDemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDfuSeDemoDlg)
	DDX_Control(pDX, IDC_BUTTONVERIFY, m_BtnVerify);
	DDX_Control(pDX, IDC_LISTTARGETS, m_CtrlDevTargets);
	DDX_Control(pDX, IDC_BUTTONABORT, m_BtnAbort);
	DDX_Control(pDX, IDC_EDITDEVVID2, m_CtrlDevAppVid);
	DDX_Control(pDX, IDC_EDITDEVPID2, m_CtrlDevAppPid);
	DDX_Control(pDX, IDC_EDITDEVBCD2, m_CtrlDevAppBcd);
	DDX_Control(pDX, IDC_EDITFILEVID, m_CtrlFileVid);
	DDX_Control(pDX, IDC_EDITFILEBCD, m_CtrlFileBcd);
	DDX_Control(pDX, IDCANCEL, m_BtnCancel);
	DDX_Control(pDX, IDC_BUTTONUPCHOOSE, m_BtnUpChoose);
	DDX_Control(pDX, IDC_BUTTONDOWNCHOOSE, m_BtnDownChoose);
	DDX_Control(pDX, IDC_BUTTONUPLOAD, m_BtnUpload);
	DDX_Control(pDX, IDC_BUTTONUPGRADE, m_BtnUpgrade);
	DDX_Control(pDX, IDC_PROGRESS, m_Progress);
	DDX_Control(pDX, IDC_EDITFILEPID, m_CtrlFilePid);
	DDX_Control(pDX, IDC_LISTFILETARGETS, m_CtrlFileTargets);
	DDX_Control(pDX, IDC_STATICDOWNFILE, m_DownFile);
	DDX_Control(pDX, IDC_STATICUPFILE, m_UpFile);
	DDX_Control(pDX, IDC_EDITDEVBCD, m_CtrlDevBcd);
	DDX_Control(pDX, IDC_BUTTONENTERAPP, m_BtnEnterApp);
	DDX_Control(pDX, IDC_BUTTONENTERDFU, m_BtnEnterDFU);
	DDX_Control(pDX, IDC_LISTDFUDEVS, m_CtrlDFUDevices);
	DDX_Control(pDX, IDC_EDITDEVVID, m_CtrlDevVid);
	DDX_Control(pDX, IDC_EDITDEVPID, m_CtrlDevPid);
	DDX_Control(pDX, IDC_COMBODEVICES, m_CtrlDevices);
	DDX_Check(pDX, IDC_CHECKCANDETACH, m_OptCanDetach);
	DDX_Check(pDX, IDC_CHECKDNLOAD, m_OptCanDnload);
	DDX_Check(pDX, IDC_CHECKMANIFTOL, m_OptCanManifestTolerant);
	DDX_Check(pDX, IDC_CHECKUPLOAD, m_OptCanUpload);
	DDX_Check(pDX, IDC_CHECKUPLOADACC, m_OptCanAccel);
	DDX_Check(pDX, IDC_CHECKUPGRADEOPTIMIZE, m_TransferOptimized);
	DDX_Text(pDX, IDC_TIME_DURATION, m_TimeDuration);
	DDX_Check(pDX, IDC_VERIFY, m_Verify);
	DDX_Text(pDX, IDC_DATA_SIZE, m_DataSize);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDfuSeDemoDlg, CDialog)
	//{{AFX_MSG_MAP(CDfuSeDemoDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_CBN_SELCHANGE(IDC_COMBODEVICES, OnSelchangeCombodevices)
	ON_BN_CLICKED(IDC_BUTTONENTERDFU, OnButtonenterdfu)
	ON_BN_CLICKED(IDC_BUTTONUPCHOOSE, OnButtonupchoose)
	ON_BN_CLICKED(IDC_BUTTONDOWNCHOOSE, OnButtondownchoose)
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BUTTONUPLOAD, OnButtonupload)
	ON_BN_CLICKED(IDC_BUTTONUPGRADE, OnButtonupgrade)
	ON_BN_CLICKED(IDC_BUTTONENTERAPP, OnButtonenterapp)
	ON_BN_CLICKED(IDC_BUTTONABORT, OnButtonabort)
	ON_WM_CTLCOLOR()
	ON_WM_DESTROY()
	ON_BN_CLICKED(IDC_BUTTONVERIFY, OnButtonverify)
	ON_NOTIFY(NM_DBLCLK, IDC_LISTTARGETS, OnDblclkListtargets)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LISTTARGETS, OnItemchangedListtargets)
	//}}AFX_MSG_MAP
	ON_WM_DEVICECHANGE()
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDfuSeDemoDlg message handlers

BOOL CDfuSeDemoDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	SetIcon(m_hIcon, TRUE);			// Set big icon
	//SetIcon(m_hIcon, FALSE);		// Set small icon

	m_CtrlDevTargets.InsertColumn(0, "Target Id",LVCFMT_CENTER,60);
	m_CtrlDevTargets.InsertColumn(1, "Name", LVCFMT_LEFT,160);
	m_CtrlDevTargets.InsertColumn(2, "Available Sectors (Double Click for more)", LVCFMT_LEFT,210);
	m_CtrlDevTargets.InsertColumn(3, "", LVCFMT_LEFT,0);
	
	ListView_SetExtendedListViewStyle(m_CtrlDevTargets.m_hWnd, LVS_EX_FULLROWSELECT);

	DEV_BROADCAST_DEVICEINTERFACE filter={0};

	filter.dbcc_size=sizeof(filter);
	filter.dbcc_devicetype=DBT_DEVTYP_DEVICEINTERFACE;
	filter.dbcc_classguid=GUID_DFU;
	RegisterDeviceNotification(m_hWnd, (PVOID)&filter, DEVICE_NOTIFY_WINDOW_HANDLE);
	filter.dbcc_classguid=GUID_APP;
	RegisterDeviceNotification(m_hWnd, (PVOID)&filter, DEVICE_NOTIFY_WINDOW_HANDLE);
	GUID Guid;
	HidD_GetHidGuid(&Guid);
	filter.dbcc_classguid=Guid;
	RegisterDeviceNotification(m_hWnd, (PVOID)&filter, DEVICE_NOTIFY_WINDOW_HANDLE);

	m_Progress.SetShowText(FALSE);
	m_Progress.SetRange(0, 100);
	m_Progress.SetPos(0);
	SetTimer(1, 300, NULL); // launch the timer that will check operations ongoing

	Refresh();	

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CDfuSeDemoDlg::OnPaint() 
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

HCURSOR CDfuSeDemoDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDfuSeDemoDlg::FindMyHIDDevice()
{
	PHID_DEVICE		pHid;
	int i, Index = 0;

	pHid = m_HidDevices;
	for(i=0;i<int(m_HidDevice_Counter);i++,pHid++)
	{
		PHIDP_VALUE_CAPS	pValue;
		PHID_DEVICE pWalk;

		pWalk = pHid;	// Initialize pWalk

		
		/* Each device should be tested to check that the device was actually opened */
		
		if (INVALID_HANDLE_VALUE == pWalk->HidDevice) { 

			continue;                                   

		}                                              

		pValue = pWalk->FeatureValueCaps;
		// 1st search for the feature report
		int  cnt = 0;
		bool HidDetachFound = false;
		while ((cnt < pWalk->Caps.NumberFeatureValueCaps) /*&& (pValue->UsagePage == ST_PAGE)*/)
		{
			if (pValue->UsagePage == VENDOR_USAGE_PAGE) 
			{
				HidDetachFound = true;
				break;
			}
			cnt ++;
			pValue++;
		}

		if (HidDetachFound)
		{
			if (pValue->NotRange.Usage == USAGE_DETACH)
			{
				m_Tab_Index[Index] = i;
				Index++;
			}
			else m_Enum.CloseHidDevice(pHid);
		}
		/*else m_Enum.CloseHidDevice(pHid);

		//if((pHid->Attributes.VendorID == STVendorID) && (pHid->Caps.UsagePage == ST_PAGE))
		{
			m_Tab_Index[Index] = i;
			Index++;
		}
		else m_Enum.CloseHidDevice(pHid);*/
	}
	m_HidDevice_Counter = Index;
}

void CDfuSeDemoDlg::ReleaseHIDMemory()
{
	PHID_DEVICE		pHid;
	int				i;
	
	if (m_HidDevices)
	{
		for(i=0;i<int(m_HidDevice_Counter);i++)
		{
			pHid = m_HidDevices + m_Tab_Index[i];
			m_Enum.CloseHidDevice(pHid);
		}

		free(m_HidDevices);
	}
}

void CDfuSeDemoDlg::Refresh()
{
	int		i,j;
 
	char	Product[253];
	CString	Prod, String;

	int Sel=m_CtrlDevices.GetCurSel();
	CString LinkCurSel;

	if (Sel!=-1)
		m_CtrlDFUDevices.GetText(Sel, LinkCurSel);

	HDEVINFO info;

	// Resetting all data
	m_BtnEnterDFU.EnableWindow(FALSE);
	m_BtnEnterApp.EnableWindow(FALSE);
	m_CtrlDevices.ResetContent();
	m_CtrlDFUDevices.ResetContent();
	
	m_OldSelectedTargets.SetSize(max(m_CtrlDevTargets.GetItemCount(), m_OldSelectedTargets.GetSize()));
	for (i=0;i<m_CtrlDevTargets.GetItemCount();i++)
	{
		UINT State=m_CtrlDevTargets.GetItemState(i, TVIS_SELECTED);

		if ( (State & TVIS_SELECTED)==TVIS_SELECTED )
			m_OldSelectedTargets.SetAt(i, 1);
		else
			m_OldSelectedTargets.SetAt(i, 0);
	}
	m_CtrlDevTargets.DeleteAllItems();

	m_CtrlDevVid.SetWindowText("");
	m_CtrlDevPid.SetWindowText("");
	m_CtrlDevBcd.SetWindowText("");
	m_CtrlDevAppVid.SetWindowText("");
	m_CtrlDevAppPid.SetWindowText("");
	m_CtrlDevAppBcd.SetWindowText("");

	// Begin with HID devices
	ReleaseHIDMemory();
	m_Enum.FindHidDevice(&m_HidDevices,&m_HidDevice_Counter);
	FindMyHIDDevice();
	for(i=0;i<int(m_HidDevice_Counter);i++)
	{
		PHID_DEVICE pWalk;

		pWalk = m_HidDevices + m_Tab_Index[i];			
		if(HidD_GetProductString(pWalk->HidDevice, Product, sizeof(Product)))
		{
			for(j=0;j<160;j+=2)
				Prod += Product[j];
		}
		else 
			Prod="(Unknown HID Device)";

		String.Format("%s",Prod);
		m_CtrlDFUDevices.AddString(String);
		m_CtrlDevices.AddString(String);
		Prod = "";
	}

    // Continue with DFU devices. DFU devices will be listed after HID ones
	for (i=0;i<2;i++)
	{
		GUID Guid;

		if (i==0)
			Guid=GUID_DFU;
		else if (i==1)
			Guid=GUID_APP;
		//else
		//    HidD_GetHidGuid(&Guid);	

		info=SetupDiGetClassDevs(&Guid, NULL, NULL, DIGCF_PRESENT | DIGCF_INTERFACEDEVICE);
		if (info!=INVALID_HANDLE_VALUE)  
		{
			DWORD devIndex;
			SP_INTERFACE_DEVICE_DATA ifData;
			ifData.cbSize=sizeof(ifData);

			for (devIndex=0;SetupDiEnumDeviceInterfaces(info, NULL, &Guid, devIndex, &ifData);++devIndex)
			{
				DWORD needed;

				SetupDiGetDeviceInterfaceDetail(info, &ifData, NULL, 0, &needed, NULL);

				PSP_INTERFACE_DEVICE_DETAIL_DATA detail=(PSP_INTERFACE_DEVICE_DETAIL_DATA)new BYTE[needed];
				detail->cbSize=sizeof(SP_INTERFACE_DEVICE_DETAIL_DATA);
				SP_DEVINFO_DATA did={sizeof(SP_DEVINFO_DATA)};
			
				if (SetupDiGetDeviceInterfaceDetail(info, &ifData, detail, needed, NULL, &did))
				{
					// Add the link to the list of all DFU devices
					CString Tmp;

					Tmp=detail->DevicePath;
					Tmp.MakeUpper();
					m_CtrlDFUDevices.AddString(Tmp);
				}
				else
					m_CtrlDFUDevices.AddString("");

				if (SetupDiGetDeviceRegistryProperty(info, &did, SPDRP_DEVICEDESC, NULL, (PBYTE)Product, 253, NULL))
					Prod= Product;
				else
					Prod="(Unnamed DFU device)";
				// Add the name of the device
				m_CtrlDevices.AddString(Prod);
				delete[] (PBYTE)detail;
			}
			SetupDiDestroyDeviceInfoList(info);
		}
	}
	// Select the one we had before.
	Sel=0;
	if (LinkCurSel!="")
	{
		Sel=m_CtrlDFUDevices.FindString(0, LinkCurSel);
		if (Sel==-1)
			Sel=0;
	}

	m_CtrlDevices.SetCurSel(Sel);
	OnSelchangeCombodevices();
}

void CDfuSeDemoDlg::OnCancel() 
{
	BOOL bStop=TRUE;
	DFUThreadContext Context;

	if (m_OperationCode)
	{
		bStop=FALSE;
		if (AfxMessageBox("Operation on-going. Leave anyway ?", MB_OKCANCEL|MB_ICONQUESTION)==IDOK)
			bStop=TRUE;
	}

	if (bStop)
	{
		if (m_OperationCode)
			STDFUPRT_StopOperation(m_OperationCode, &Context);

		STDFUFILES_DestroyImage(&Context.hImage);
		if (m_BufferedImage)
			STDFUFILES_DestroyImage(&m_BufferedImage);

		KillTimer(1);
		if (m_pMapping!=NULL)
			STDFUPRT_DestroyMapping(&m_pMapping);
		POSITION Pos=m_DetachedDevs.GetStartPosition();
		while (Pos)
		{
			CString Key;
			void *Value;

			m_DetachedDevs.GetNextAssoc(Pos, Key, Value);
			delete (PUSB_DEVICE_DESCRIPTOR)Value;
		}
		m_DetachedDevs.RemoveAll();
		m_pMapping=NULL;
		m_NbAlternates=0;
		CDialog::OnCancel();
	}
}

CString STStringFromCLSID(REFCLSID rclsid)
{
	TCHAR szCLSID[256];
	wsprintf(szCLSID, _T("{%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X}"),
		rclsid.Data1, rclsid.Data2, rclsid.Data3,
		rclsid.Data4[0], rclsid.Data4[1], rclsid.Data4[2], rclsid.Data4[3],
		rclsid.Data4[4], rclsid.Data4[5], rclsid.Data4[6], rclsid.Data4[7]);
	return szCLSID;
}

void CDfuSeDemoDlg::OnSelchangeCombodevices() 
{
	SupportROP = FALSE;
	int Sel=m_CtrlDevices.GetCurSel();
	CString	Tmp;
	BOOL bSuccess=FALSE;
	HANDLE hDle;

	m_BtnEnterDFU.EnableWindow(FALSE);
	m_BtnEnterApp.EnableWindow(FALSE);
	m_BtnUpload.EnableWindow(FALSE);
	m_BtnUpgrade.EnableWindow(FALSE);
	m_BtnVerify.EnableWindow(FALSE);
	m_CtrlDevAppVid.SetWindowText("");
	m_CtrlDevAppPid.SetWindowText("");
	m_CtrlDevAppBcd.SetWindowText("");
	m_CtrlDevVid.SetWindowText("");
	m_CtrlDevPid.SetWindowText("");
	m_CtrlDevBcd.SetWindowText("");
	m_OptCanDnload=FALSE;
	m_OptCanUpload=FALSE;
	m_OptCanManifestTolerant=FALSE;
	m_OptCanDetach=FALSE;
	m_OptCanAccel=FALSE;
	if (m_pMapping!=NULL)
		STDFUPRT_DestroyMapping(&m_pMapping);
	m_pMapping=NULL;
	m_NbAlternates=0;
	m_OldSelectedTargets.SetSize(max(m_CtrlDevTargets.GetItemCount(), m_OldSelectedTargets.GetSize()));
	for (int i=0;i<m_CtrlDevTargets.GetItemCount();i++)
	{
		UINT State=m_CtrlDevTargets.GetItemState(i, TVIS_SELECTED);

		if ( (State & TVIS_SELECTED)==TVIS_SELECTED )
			m_OldSelectedTargets.SetAt(i, 1);
		else
			m_OldSelectedTargets.SetAt(i, 0);
	}
	m_CtrlDevTargets.DeleteAllItems();

	UpdateData(FALSE);
	if (Sel!=LB_ERR)
	{
		if (Sel>=(int)m_HidDevice_Counter)
		{
			m_CtrlDFUDevices.GetText(Sel, m_CurrDFUName);
			//to be removed
			//m_BtnEnterDFU.EnableWindow(TRUE);
		
			if (STDFU_Open((LPSTR)(LPCSTR)m_CurrDFUName,&hDle)==STDFU_NOERROR)
			{
				if (STDFU_GetDeviceDescriptor(&hDle, &m_DeviceDesc)==STDFU_NOERROR)
				{
					UINT Dummy1, Dummy2;
					// Get its attributes
					memset(&m_CurrDevDFUDesc, 0, sizeof(m_CurrDevDFUDesc));
					if (STDFU_GetDFUDescriptor(&hDle, &Dummy1, &Dummy2, &m_CurrDevDFUDesc)==STDFUPRT_NOERROR)
					{
						m_OptCanDnload=FALSE;
						m_OptCanUpload=FALSE;
						m_OptCanManifestTolerant=FALSE;
						m_OptCanDetach=FALSE;
						m_OptCanAccel=FALSE;
						if (m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE)
							m_OptCanDnload=TRUE;
						if (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE)
							m_OptCanUpload=TRUE;
						if (m_CurrDevDFUDesc.bmAttributes & ATTR_WILL_DETACH)
							m_OptCanDetach=TRUE;
						if (m_CurrDevDFUDesc.bmAttributes & ATTR_MANIFESTATION_TOLERANT)
							m_OptCanManifestTolerant=TRUE;
						if (m_CurrDevDFUDesc.bmAttributes & ATTR_ST_CAN_ACCELERATE)
							m_OptCanAccel=TRUE;
		
						UpdateData(FALSE);

						if ( (m_CurrDevDFUDesc.bcdDFUVersion<0x011A) || (m_CurrDevDFUDesc.bcdDFUVersion>=0x0120) )
							HandleTxtError("Bad DFU protocol version. Should be 1.1A");
						else
						{
							// Tries to know if we are in DFU or in Application mode: based on the GUID
							CString DevGUID=m_CurrDFUName.Right(38);
							CString DfuGUID=STStringFromCLSID(GUID_DFU);

							if (DevGUID.CompareNoCase(DfuGUID)!=0)
							{
								// Device in Application Mode
								Tmp.Format("%04X", m_DeviceDesc.idVendor);
								m_CtrlDevAppVid.SetWindowText(Tmp);
								Tmp.Format("%04X", m_DeviceDesc.idProduct);
								m_CtrlDevAppPid.SetWindowText(Tmp);
								Tmp.Format("%04X", m_DeviceDesc.bcdDevice);
								m_CtrlDevAppBcd.SetWindowText(Tmp);
								m_BtnEnterDFU.EnableWindow(TRUE);
								m_BtnEnterApp.EnableWindow(FALSE);
								bSuccess=TRUE;
							}
							else
							{
								// Device in DFU Mode
								Tmp.Format("%04X", m_DeviceDesc.idVendor);
								m_CtrlDevVid.SetWindowText(Tmp);
								Tmp.Format("%04X", m_DeviceDesc.idProduct);
								m_CtrlDevPid.SetWindowText(Tmp);
								Tmp.Format("%04X", m_DeviceDesc.bcdDevice);
								m_CtrlDevBcd.SetWindowText(Tmp);

								PUSB_DEVICE_DESCRIPTOR Desc=NULL;

								Desc=(PUSB_DEVICE_DESCRIPTOR)(m_DetachedDevs[m_CurrDFUName]);
								if ( (Desc) && (Desc->bLength) )
								{
									Tmp.Format("%04X", Desc->idVendor);
									m_CtrlDevAppVid.SetWindowText(Tmp);
									Tmp.Format("%04X", Desc->idProduct);
									m_CtrlDevAppPid.SetWindowText(Tmp);
									Tmp.Format("%04X", Desc->bcdDevice);
									m_CtrlDevAppBcd.SetWindowText(Tmp);
								}
								// Tries to get the mapping
								if (STDFUPRT_CreateMappingFromDevice((LPSTR)(LPCSTR)m_CurrDFUName, &m_pMapping, &m_NbAlternates)==STDFUPRT_NOERROR)
								{
								
									m_BtnEnterDFU.EnableWindow(FALSE);
									m_BtnEnterApp.EnableWindow(TRUE);
									m_UpFile.GetWindowText(Tmp);
									m_BtnUpload.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
									m_DownFile.GetWindowText(Tmp);
									m_BtnUpgrade.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE));
									m_BtnVerify.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
									bSuccess=TRUE;
								}
								else
									HandleTxtError("Unable to find or decode device mapping... Bad Firmware");
							}
						}
					}
					else
						HandleTxtError("Unable to get DFU descriptor... Bad Firmware");
				}
				else
					HandleTxtError("Unable to get descriptors... Bad Firmware");


				if (bSuccess)
				{
					CString ToDisp;

					m_Progress.SetBkColour(RGB_BK);	
					m_Progress.SetTextBkColour(COLOR_UPLOAD_FG);
					m_Progress.SetForeColour(RGB_BK);
					m_Progress.SetTextForeColour(COLOR_UPLOAD_FG);
					HandleTxtSuccess(" ");
					for (DWORD i=0;i<m_NbAlternates;i++)
					{

						ToDisp.Format("%02i", m_pMapping[i].nAlternate);

						int nItem=m_CtrlDevTargets.InsertItem(i, ToDisp);

						m_CtrlDevTargets.SetItemText(nItem, 1, m_pMapping[i].Name);
						ToDisp.Format("%i sectors...", m_pMapping[i].NbSectors);
						m_CtrlDevTargets.SetItemText(nItem, 2, ToDisp);
						ToDisp.Empty();
						for (DWORD j=0;j<m_pMapping[i].NbSectors;j++)
						{
							CString Tmp;
							CString Size;

							if (m_pMapping[i].pSectors[j].dwSectorSize<1024) 
								Size.Format("%i b", m_pMapping[i].pSectors[j].dwSectorSize);
							else
							if (m_pMapping[i].pSectors[j].dwSectorSize<1024*1024) 
								Size.Format("%i Kb", m_pMapping[i].pSectors[j].dwSectorSize/1024);
							else
								Size.Format("%i Mb", (m_pMapping[i].pSectors[j].dwSectorSize/1024)/1024);

							Tmp.Format("Sector %03i\t0x%08X\t0x%08X\t%s\t", j, m_pMapping[i].pSectors[j].dwStartAddress, m_pMapping[i].pSectors[j].dwStartAddress+m_pMapping[i].pSectors[j].dwSectorSize-1, Size);
							if (m_pMapping[i].pSectors[j].bSectorType & BIT_READABLE)
								Tmp+="R";
							if (m_pMapping[i].pSectors[j].bSectorType & BIT_WRITEABLE)
								Tmp+="W";
							if (m_pMapping[i].pSectors[j].bSectorType & BIT_ERASABLE)
								Tmp+="E";
							if (j!=m_pMapping[i].NbSectors-1)
								Tmp+="\n";
							ToDisp=ToDisp+Tmp;
						}
						m_CtrlDevTargets.SetItemText(nItem, 3, ToDisp);
					}

#ifdef _VS6_USED
	                // i redefinition not allowed
#else
	                unsigned int i;
#endif
					for (i=0;i<m_CtrlDevTargets.GetItemCount();i++)
					{
						if (i<m_OldSelectedTargets.GetSize())
						{
							if (m_OldSelectedTargets.GetAt(i))
								m_CtrlDevTargets.SetItemState(i, TVIS_SELECTED, TVIS_SELECTED);
						}
					}
					if (m_CtrlDevTargets.GetSelectedCount()==0)
						m_CtrlDevTargets.SetItemState(0, TVIS_SELECTED, TVIS_SELECTED);
				}

//=========================================================================================================================
			

			    for(int idx=0; idx <2; idx++)
				{
					CString MapName = m_CtrlDevTargets.GetItemText(idx, 1);
					if (MapName.Compare("Option Bytes  ") == 0)
					{
						SupportROP = TRUE;

						if ( m_pMapping[1].pSectors[0].dwStartAddress == 0x1FFFF800)
						{
							STM32Serie =1;
						} 

						if ( m_pMapping[1].pSectors[0].dwStartAddress == 0x1FFFC000)
						{
							STM32Serie =2;
						} 
					}

				}


			   





                BYTE User  = 0x00;
			    BYTE RDP   = 0x00;
				BYTE Data0 = 0x00;
				BYTE Data1 = 0x00;
				BYTE WRP0  = 0x00;
				BYTE WRP1  = 0x00;
				BYTE WRP2  = 0x00;
				BYTE WRP3  = 0x00;
				DWORD WPR  = 0x00;



				if(SupportROP)
				{
					   //--- Check for read protection status ---------------------------------------------
					   if (STDFU_SelectCurrentConfiguration(&hDle, 0, 0,1)==STDFU_NOERROR)
					   {
						   DFUSTATUS DFUStatus;

						   STDFU_Getstatus(&hDle, &DFUStatus);
						   while(DFUStatus.bState != STATE_DFU_IDLE)
						   {
								STDFU_Clrstatus(&hDle);
								STDFU_Getstatus(&hDle, &DFUStatus);
						   }
							
						   LPBYTE m_pBuffer = (LPBYTE)malloc(0x10);
						   memset(m_pBuffer, 0xFF, 0x10);

						   m_pBuffer[0] = 0x21;
						   m_pBuffer[1] = 0x00;
						   m_pBuffer[2] = 0x00;
						   m_pBuffer[3] = 0x00;
						   m_pBuffer[4] = 0x08;

						   STDFU_Dnload(&hDle, m_pBuffer, 0x05, 0);
						   
						   STDFU_Getstatus(&hDle, &DFUStatus);
						   while(DFUStatus.bState != STATE_DFU_IDLE)
						   {
								STDFU_Clrstatus(&hDle);
								STDFU_Getstatus(&hDle, &DFUStatus);
						   }

						   if(STDFU_Upload(&hDle, m_pBuffer, 0x10, 2) == STDFU_NOERROR)
						   {

						   }

						   STDFU_Getstatus(&hDle, &DFUStatus);
						   if(DFUStatus.bState == STATE_DFU_ERROR)
						   {
								ReadProtected = TRUE;
						   }
						   while(DFUStatus.bState != STATE_DFU_IDLE)
						   {
								STDFU_Clrstatus(&hDle);
								STDFU_Getstatus(&hDle, &DFUStatus);
						   }

					   }

					   HandleTxtError("Device is Protected...");
					   
					   //--- Get Options Bytes DATA ------------------------------------------------------------------
					   
					   if((! ReadProtected) && (STM32Serie == 1))
					   {
						   LPBYTE m_pBuffer = (LPBYTE) malloc(64);
						   memset(m_pBuffer, 0x00, 64);
   
						   if (STDFU_SelectCurrentConfiguration(&hDle, 0, 0,1)==STDFU_NOERROR)
						   {
							   DFUSTATUS DFUStatus;

							   STDFU_Getstatus(&hDle, &DFUStatus);
							   while(DFUStatus.bState != STATE_DFU_IDLE)
							   {
									STDFU_Clrstatus(&hDle);
									STDFU_Getstatus(&hDle, &DFUStatus);
							   }
								   
							   m_pBuffer[0] = 0x21;
							   m_pBuffer[1] = 0x00;
							   m_pBuffer[2] = 0xF8;
							   m_pBuffer[3] = 0xFF;
							   m_pBuffer[4] = 0x1F;

							   STDFU_Dnload(&hDle, m_pBuffer, 0x05, 0);
							   
							   STDFU_Getstatus(&hDle, &DFUStatus);
							   while(DFUStatus.bState != STATE_DFU_IDLE)
							   {
									STDFU_Clrstatus(&hDle);
									STDFU_Getstatus(&hDle, &DFUStatus);
							   }

							   if(STDFU_Upload(&hDle, m_pBuffer, 0x10, 2) == STDFU_NOERROR)
							   {
								   RDP   = m_pBuffer[0] ;
								   User  = m_pBuffer[2];
								   Data0 = m_pBuffer[4];
								   Data1 = m_pBuffer[6];
								   WRP0  = m_pBuffer[8];
								   WRP1  = m_pBuffer[10];
								   WRP2  = m_pBuffer[12];
								   WRP3  = m_pBuffer[14];
								   WPR = WRP0 + (WRP1 << 8) + (WRP2 << 16) + (WRP3 << 24);
							   }
						   }
					   }
						//-----------------------------------------------------------------------------------
				     if((! ReadProtected) && (STM32Serie == 2))
					   {
						   LPBYTE m_pBuffer = (LPBYTE) malloc(64);
						   memset(m_pBuffer, 0x00, 64);
   
						   if (STDFU_SelectCurrentConfiguration(&hDle, 0, 0,1)==STDFU_NOERROR)
						   {
							   DFUSTATUS DFUStatus;

							   STDFU_Getstatus(&hDle, &DFUStatus);
							   while(DFUStatus.bState != STATE_DFU_IDLE)
							   {
									STDFU_Clrstatus(&hDle);
									STDFU_Getstatus(&hDle, &DFUStatus);
							   }
								   
							   m_pBuffer[0] = 0x21;
							   m_pBuffer[1] = 0x00;
							   m_pBuffer[2] = 0xC0;
							   m_pBuffer[3] = 0xFF;
							   m_pBuffer[4] = 0x1F;

							   STDFU_Dnload(&hDle, m_pBuffer, 0x05, 0);
							   
							   STDFU_Getstatus(&hDle, &DFUStatus);
							   while(DFUStatus.bState != STATE_DFU_IDLE)
							   {
									STDFU_Clrstatus(&hDle);
									STDFU_Getstatus(&hDle, &DFUStatus);
							   }

							   if(STDFU_Upload(&hDle, m_pBuffer, 0x10, 2) == STDFU_NOERROR)
							   {
								   RDP   = m_pBuffer[1] ;
								   User  = m_pBuffer[0];

								   WRP0  = m_pBuffer[8];
								   WRP1  = m_pBuffer[9];

								   WPR = WRP0 + (WRP1 << 8);
							   }
						   }
					   }
						//-----------------------------------------------------------------------------------

				
				}
//=========================================================================================================================

				if (bSuccess)
				{
					CString ToDisp;

					m_Progress.SetBkColour(RGB_BK);	
					m_Progress.SetTextBkColour(COLOR_UPLOAD_FG);
					m_Progress.SetForeColour(RGB_BK);
					m_Progress.SetTextForeColour(COLOR_UPLOAD_FG);
					HandleTxtSuccess(" ");
					for (DWORD i=0;i<m_NbAlternates;i++)
					{

						ToDisp.Format("%02i", m_pMapping[i].nAlternate);

						int nItem= i; //m_CtrlDevTargets.InsertItem(i, ToDisp);

						m_CtrlDevTargets.SetItemText(nItem, 1, m_pMapping[i].Name);
						ToDisp.Format("%i sectors...", m_pMapping[i].NbSectors);
						m_CtrlDevTargets.SetItemText(nItem, 2, ToDisp);
						ToDisp.Empty();
//=========================================================================================================================
						if((SupportROP) && ( STM32Serie == 1))
						{
							for (DWORD j=0;j<m_pMapping[i].NbSectors;j++)
							{
								if (RDP == 0xA5)
									m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType | BIT_READABLE;
								else
									m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType & 0xFE;

							
								if (i == 0)  /* Write protection apply only on Internal Flash , alternate 0 */
								{
									BYTE WBIT = 0;
									if (j < 32*4) WBIT = (WPR >> (j/4)) & 0x01;
									else WBIT = WPR >> 31;

									if (WBIT == 1)
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType | BIT_ERASABLE;
									else
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType & 0xFD;

									if (WBIT == 1)
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType | BIT_WRITEABLE;
									else
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType & 0xFB;
								}
								
							}
						}

						if((SupportROP) && ( STM32Serie == 2))
						{
							for (DWORD j=0;j<m_pMapping[i].NbSectors;j++)
							{
								if (RDP == 0xAA)
									m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType | BIT_READABLE;
								else
									m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType & 0xFE;

								if (i == 0)  /* Write protection apply only on Internal Flash , alternate 0 */
								{
									BYTE WBIT = 0;
									WBIT =  (WPR >> j)  & 0x01;
								

									if (WBIT == 1)
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType | BIT_ERASABLE;
									else
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType & 0xFD;

									if (WBIT == 1)
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType | BIT_WRITEABLE;
									else
										m_pMapping[i].pSectors[j].bSectorType = m_pMapping[i].pSectors[j].bSectorType & 0xFB;
								}
								
							}
						}
//=========================================================================================================================

					
						for (int j=0;j<m_pMapping[i].NbSectors;j++)
						{
							CString Tmp;
							CString Size;

							if (m_pMapping[i].pSectors[j].dwSectorSize<1024) 
								Size.Format("%i b", m_pMapping[i].pSectors[j].dwSectorSize);
							else
							if (m_pMapping[i].pSectors[j].dwSectorSize<1024*1024) 
								Size.Format("%i Kb", m_pMapping[i].pSectors[j].dwSectorSize/1024);
							else
								Size.Format("%i Mb", (m_pMapping[i].pSectors[j].dwSectorSize/1024)/1024);

							Tmp.Format("Sector %03i\t0x%08X\t0x%08X\t%s\t", j, m_pMapping[i].pSectors[j].dwStartAddress, m_pMapping[i].pSectors[j].dwStartAddress+m_pMapping[i].pSectors[j].dwSectorSize-1, Size);
							if (m_pMapping[i].pSectors[j].bSectorType & BIT_READABLE)
								Tmp+="R";

							if (m_pMapping[i].pSectors[j].bSectorType & BIT_WRITEABLE)
								Tmp+="W";
							
							if (m_pMapping[i].pSectors[j].bSectorType & BIT_ERASABLE)
								Tmp+="E";
							if (j!=m_pMapping[i].NbSectors-1)
								Tmp+="\n";
							ToDisp=ToDisp+Tmp;
						}
						m_CtrlDevTargets.SetItemText(nItem, 3, ToDisp);
					}

//=========================================================================================================================

#ifdef _VS6_USED
	                // i redefinition not allowed
#else
	                int i;
#endif

					for (i=0;i<m_CtrlDevTargets.GetItemCount();i++)
					{
						if (i<m_OldSelectedTargets.GetSize())
						{
							if (m_OldSelectedTargets.GetAt(i))
								m_CtrlDevTargets.SetItemState(i, TVIS_SELECTED, TVIS_SELECTED);
						}
					}
					if (m_CtrlDevTargets.GetSelectedCount()==0)
						m_CtrlDevTargets.SetItemState(0, TVIS_SELECTED, TVIS_SELECTED);
				}

				STDFU_Close(&hDle);
			}
		}
		else
		{
			PHID_DEVICE pWalk;

			// Device in HID Mode
			m_BtnEnterDFU.EnableWindow(TRUE);
			m_BtnEnterApp.EnableWindow(FALSE);

			pWalk = m_HidDevices + m_Tab_Index[Sel];	// Initialize pWalk
			Tmp.Format("%04X",(pWalk->Attributes.VendorID));
			m_CtrlDevAppVid.SetWindowText(Tmp);
			Tmp.Format("%04X",(pWalk->Attributes.ProductID));
			m_CtrlDevAppPid.SetWindowText(Tmp);
			Tmp.Format("%04X",(pWalk->Attributes.VersionNumber));
			m_CtrlDevAppBcd.SetWindowText(Tmp);
		}
	}
}

void CDfuSeDemoDlg::OnButtonenterdfu() 
{
	DFUThreadContext Context;
	CString Tempo;
	DWORD dwRet;
	int Sel=m_CtrlDevices.GetCurSel();
	//HANDLE hImage;
    
	if (Sel!=LB_ERR)
	{
		if (Sel<(int)m_HidDevice_Counter)
		{
			// HID device -> sending HID detach
			//--------------------------------------------------------------------------------------
			PHIDP_VALUE_CAPS	pValue;
			PHID_DEVICE pWalk;

			// We need to send the HID Detach command
			pWalk = m_HidDevices + m_Tab_Index[Sel];	// Initialize pWalk
			pValue = pWalk->FeatureValueCaps;
			// 1st search for the feature report

			int  cnt = 0;
			bool HidDetachFound = false;
			while ((cnt < pWalk->Caps.NumberFeatureValueCaps) /*&& (pValue->UsagePage == ST_PAGE)*/)
			{
				if (pValue->UsagePage == VENDOR_USAGE_PAGE) 
				{
					HidDetachFound = true;
					break;
				}
				cnt ++;
				pValue++;
			}

			//while ((pValue->UsagePage != VENDOR_USAGE_PAGE) /*&& (pValue->UsagePage == ST_PAGE)*/)
			//	pValue++;
			if (HidDetachFound)
			{
				//if (pValue->NotRange.Usage == USAGE_DETACH)
				//{
					BYTE Feature[65];

					Feature[0]=pValue->ReportID;
					Feature[1]=USAGE_DETACH;

					startTime = CTime::GetCurrentTime();
					if (!HidD_SetFeature(pWalk->HidDevice, Feature,65))
						HandleTxtError("Unable to enter DFU mode: Set Feature HID Detach failed !");
					else
					{
						Sleep(1000);
						HandleTxtSuccess("Successfully entered DFU Mode !");
						AfxMessageBox("Detach command successful ! Device list refresh will be done...\n\nPlease re-select your device in DFU mode");
						Refresh();
					}
				//}
			}
			else
				HandleTxtError("Bad Firmware: Unable to find HID DETACH Feature report in descriptors...");
			//--------------------------------------------------------------------------------------
		}
		else
		{
			// DFU device -> sending DFU detach
			//--------------------------------------------------------------------------------------
			USB_DEVICE_DESCRIPTOR *pDesc;
			// Prepare the asynchronous operation
			m_CtrlDFUDevices.GetText(Sel, m_CurrDFUName);

			lstrcpy(Context.szDevLink, m_CurrDFUName);
			m_DetachedDev=m_CurrDFUName;
			pDesc=new USB_DEVICE_DESCRIPTOR;
			*pDesc=m_DeviceDesc;
			pDesc->bLength=0; // To recognize this device is about to be detached but not yet
			m_DetachedDevs.SetAt(m_CurrDFUName, pDesc); 
			Context.DfuGUID=GUID_DFU;
			Context.AppGUID=GUID_APP;
			Context.Operation=OPERATION_DETACH;
			Context.hImage=NULL;
		
			startTime = CTime::GetCurrentTime();
			dwRet=STDFUPRT_LaunchOperation(&Context, &m_OperationCode);
			if (dwRet!=STDFUPRT_NOERROR)
			{
				m_DetachedDev="";
				delete m_DetachedDevs[m_CurrDFUName];
				m_DetachedDevs.RemoveKey(m_CurrDFUName);
				Context.ErrorCode=dwRet;
				HandleError(&Context);
			}
			else
			{
				m_Progress.SetPos(0);
				m_Progress.SetWindowText("");
				m_Progress.SetShowText(TRUE);
				m_Progress.SetBkColour(COLOR_RETURN_BG);	
				m_Progress.SetTextBkColour(COLOR_RETURN_BG);
				m_Progress.SetForeColour(COLOR_RETURN_FG);
				m_Progress.SetTextForeColour(COLOR_RETURN_FG);
				m_CtrlDevices.EnableWindow(FALSE);
				m_BtnEnterApp.EnableWindow(FALSE);
				m_BtnEnterDFU.EnableWindow(FALSE);
				m_BtnUpChoose.EnableWindow(FALSE);
				m_BtnDownChoose.EnableWindow(FALSE);
				m_CtrlDevTargets.EnableWindow(FALSE);
				m_BtnUpload.EnableWindow(FALSE);
				m_BtnUpgrade.EnableWindow(FALSE);
				m_BtnVerify.EnableWindow(FALSE);
			}
		}
	}
}

void CDfuSeDemoDlg::OnButtonenterapp() 
{
	DFUThreadContext Context;
	CString Tempo;
	DWORD dwRet;
	int Sel=m_CtrlDevices.GetCurSel(), TargetSel=m_CtrlDevTargets.GetNextItem(-1, LVIS_SELECTED);
	HANDLE hImage;

	if ( (Sel!=LB_ERR) && (TargetSel!=-1) )
	{
		CString Name;

		// Prepare the asynchronous operation
		m_CtrlDFUDevices.GetText(Sel, m_CurrDFUName);

		lstrcpy(Context.szDevLink, m_CurrDFUName);
		m_DetachedDev=m_CurrDFUName;
		Context.DfuGUID=GUID_DFU;
		Context.AppGUID=GUID_APP;
		Context.Operation=OPERATION_RETURN;
		Name=m_CtrlDevTargets.GetItemText(TargetSel, 1);
		STDFUFILES_CreateImageFromMapping(&hImage, m_pMapping+TargetSel);
		STDFUFILES_SetImageName(hImage, (LPSTR)(LPCSTR)Name);
		STDFUFILES_FilterImageForOperation(hImage, m_pMapping+TargetSel, OPERATION_RETURN, FALSE);
		Context.hImage=hImage;
	
		startTime = CTime::GetCurrentTime();

		dwRet=STDFUPRT_LaunchOperation(&Context, &m_OperationCode);
		if (dwRet!=STDFUPRT_NOERROR)
		{
			m_DetachedDev=m_CurrDFUName;
			Context.ErrorCode=dwRet;
			HandleError(&Context);
		}
		else
		{
			m_Progress.SetPos(0);
			m_Progress.SetWindowText("");
			m_Progress.SetShowText(TRUE);
			m_Progress.SetBkColour(COLOR_RETURN_BG);	
			m_Progress.SetTextBkColour(COLOR_RETURN_BG);
			m_Progress.SetForeColour(COLOR_RETURN_FG);
			m_Progress.SetTextForeColour(COLOR_RETURN_FG);
			m_CtrlDevices.EnableWindow(FALSE);
			m_BtnEnterApp.EnableWindow(FALSE);
			m_BtnEnterDFU.EnableWindow(FALSE);
			m_BtnUpChoose.EnableWindow(FALSE);
			m_BtnDownChoose.EnableWindow(FALSE);
			m_CtrlDevTargets.EnableWindow(FALSE);
			m_BtnUpload.EnableWindow(FALSE);
			m_BtnUpgrade.EnableWindow(FALSE);
			m_BtnVerify.EnableWindow(FALSE);
		}
	}
}

void CDfuSeDemoDlg::OnButtonupchoose() 
{
	TCHAR szFilters[]=
    "Dfu Files (*.dfu)|*.dfu|All Files (*.*)|*.*||";
	char Path[MAX_PATH];
	char Tmp[MAX_PATH];
	char *pTmp;

	GetModuleFileName(NULL, Path, MAX_PATH);
	strrev(Path);
	pTmp=strchr(Path, '\\');
	strrev(pTmp);
	lstrcpy(Tmp, pTmp);
	lstrcpy(Path, Tmp);
	lstrcat(Path, "*.dfu");
	

	CFileDialog dlg(FALSE, 
		            _T("dfu"),_T("*.dfu"),
					OFN_CREATEPROMPT | OFN_PATHMUSTEXIST | OFN_OVERWRITEPROMPT,
					szFilters, this);
	if (dlg.DoModal()==IDOK)
	{
		m_UpFileName=dlg.GetPathName();
		m_UpFile.SetWindowText(dlg.GetFileName());
		if (!m_BtnEnterDFU.IsWindowEnabled())
			m_BtnUpload.EnableWindow(m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE);
	}
}

void CDfuSeDemoDlg::OnButtondownchoose() 
{
	TCHAR szFilters[]=
    "Dfu Files (*.dfu)|*.dfu|All Files (*.*)|*.*||";
	char Path[MAX_PATH];
	char Tmp[MAX_PATH];
	char *pTmp;

	GetModuleFileName(NULL, Path, MAX_PATH);
	strrev(Path);
	pTmp=strchr(Path, '\\');
	strrev(pTmp);
	lstrcpy(Tmp, pTmp);
	lstrcpy(Path, Tmp);
	lstrcat(Path, "*.dfu");

	CFileDialog dlg(TRUE, 
		            _T("dfu"), _T("*.dfu"),
					OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST,
					szFilters, this);
	if (dlg.DoModal()==IDOK)
	{
		WORD Vid, Pid, Bcd;
		BYTE NbTargets;
		HANDLE hFile;

		m_DownFileName=dlg.GetPathName();
		// Get data from chosen .dfu file
		if (STDFUFILES_OpenExistingDFUFile((LPSTR)(LPCSTR)m_DownFileName, &hFile, &Vid, &Pid, &Bcd, &NbTargets)==STDFUFILES_NOERROR)
		{
			BYTE i;
			CString Tempo;
			BOOL bError=FALSE;

			m_CtrlFileTargets.ResetContent();

			Tempo.Format("%04X", Vid);
			m_CtrlFileVid.SetWindowText(Tempo);
			Tempo.Format("%04X", Pid);
			m_CtrlFilePid.SetWindowText(Tempo);
			Tempo.Format("%04X", Bcd);
			m_CtrlFileBcd.SetWindowText(Tempo);

			for (i=0;i<NbTargets;i++)
			{
				HANDLE Image;
				BYTE Alt;

				if (STDFUFILES_ReadImageFromDFUFile(hFile, i, &Image)==STDFUFILES_NOERROR)
				{
					if (STDFUFILES_GetImageAlternate(Image, &Alt)==STDFUFILES_NOERROR)
					{
						char Name[512]={0};

						STDFUFILES_GetImageName(Image, Name);
						Tempo.Format("%02i\t%s", Alt, Name);

						m_CtrlFileTargets.AddString(Tempo);
					}
					else
					{
						HandleTxtError("Unable to get data from image...");
						bError=TRUE;
						break;
					}

					STDFUFILES_DestroyImage(&Image);
				}
				else
				{
					HandleTxtError("Bad file format...");
					bError=TRUE;
					break;
				}
			}
			STDFUFILES_CloseDFUFile(hFile);
			m_DownFile.SetWindowText(dlg.GetFileName());

			if (!bError)
			{
				if (!m_BtnEnterDFU.IsWindowEnabled())
				{
					m_BtnUpgrade.EnableWindow(m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE);
					m_BtnVerify.EnableWindow(m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE);
				}
				m_Progress.SetBkColour(COLOR_UPLOAD_FG);	
				m_Progress.SetTextBkColour(RGB_BK);
				m_Progress.SetForeColour(COLOR_UPLOAD_FG);
				m_Progress.SetTextForeColour(RGB_BK);

				HandleTxtSuccess("File correctly loaded.");
			}
		}
		else
			HandleTxtError("This file doesn't have a correct format...");
	}
}

void CDfuSeDemoDlg::OnButtonupload() 
{
	if(ReadProtected)
	{
		    if (AfxMessageBox("Your device is read protected.\nWould you remove the read protection?", MB_YESNO |MB_ICONQUESTION)==IDYES)
			{
				HANDLE hdl;
                if (STDFU_Open((LPSTR)(LPCSTR)m_CurrDFUName,&hdl)==STDFU_NOERROR)
				{
				   if (STDFU_SelectCurrentConfiguration(&hdl, 0, 0,1)==STDFU_NOERROR)
				   {
					   DFUSTATUS DFUStatus;

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   while(DFUStatus.bState != STATE_DFU_IDLE)
					   {
							STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }
						 
					   LPBYTE m_pBuffer = (LPBYTE)malloc(0x10);
					   memset(m_pBuffer, 0xFF, 0x10);
					   m_pBuffer[0] = 0x92;    /* Remove Protection*/				

					   STDFU_Dnload(&hdl, m_pBuffer, 0x01, 0); 

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   /*while(DFUStatus.bState != STATE_DFU_IDLE)
					   {
							STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }*/
				   }
				   STDFU_Close(&hdl);
				   ReadProtected = FALSE;
				}

			}
			else 
				return;
	}
	

	CString Tempo;

	m_CurrentTarget=m_CtrlDevTargets.GetNextItem(-1, LVIS_SELECTED);
	if (m_CurrentTarget==-1)
	{
		HandleTxtError("Please select one or several targets before !");
		return;
	}

	m_CtrlDevAppVid.GetWindowText(Tempo);
	if (Tempo.IsEmpty())
	{
		if (AfxMessageBox("Your device was plugged in DFU mode. \nSo the DFU mode Vid, Pid and Bcd will be put in the .dfu file.\n\nContinue ?", MB_YESNO)!=IDYES)
			return;
	}

	LaunchUpload();
}

void CDfuSeDemoDlg::LaunchUpload() 
{
	DFUThreadContext Context;
	DWORD dwRet;
	int TargetSel=m_CurrentTarget;
	HANDLE hImage;

	// prepare the asynchronous operation
	lstrcpy(Context.szDevLink, m_CurrDFUName);
	Context.DfuGUID=GUID_DFU;
	Context.AppGUID=GUID_APP;
	Context.Operation=OPERATION_UPLOAD;
	if (m_BufferedImage)
		STDFUFILES_DestroyImage(&m_BufferedImage);
	m_BufferedImage=0;
	
	CString Name; 

	Name=m_CtrlDevTargets.GetItemText(TargetSel, 1);
	STDFUFILES_CreateImageFromMapping(&hImage, m_pMapping+TargetSel);
	STDFUFILES_SetImageName(hImage, (LPSTR)(LPCSTR)Name);
	STDFUFILES_FilterImageForOperation(hImage, m_pMapping+TargetSel, OPERATION_UPLOAD, FALSE);
	Context.hImage=hImage;

	startTime = CTime::GetCurrentTime();

	UpdateData(TRUE);
	m_DataSize.Format("0 KB(0 Bytes) of %i KB(%i Bytes)", STDFUFILES_GetImageSize(Context.hImage)/1024,  STDFUFILES_GetImageSize(Context.hImage));
	UpdateData(FALSE);

	dwRet=STDFUPRT_LaunchOperation(&Context, &m_OperationCode);
	if (dwRet!=STDFUPRT_NOERROR)
	{
		Context.ErrorCode=dwRet;
		HandleError(&Context);
	}
	else
	{
		m_Progress.SetPos(0);
		m_Progress.SetWindowText("");
		m_Progress.SetShowText(TRUE);
		m_Progress.SetBkColour(COLOR_UPLOAD_BG);	
		m_Progress.SetTextBkColour(COLOR_UPLOAD_BG);
		m_Progress.SetForeColour(COLOR_UPLOAD_FG);
		m_Progress.SetTextForeColour(COLOR_UPLOAD_FG);
		m_CtrlDevices.EnableWindow(FALSE);
		m_BtnEnterApp.EnableWindow(FALSE);
		m_BtnEnterDFU.EnableWindow(FALSE);
		m_BtnUpChoose.EnableWindow(FALSE);
		m_BtnDownChoose.EnableWindow(FALSE);
		m_CtrlDevTargets.EnableWindow(FALSE);
		m_BtnUpload.EnableWindow(FALSE);
		m_BtnUpgrade.EnableWindow(FALSE);
		m_BtnVerify.EnableWindow(FALSE);
		m_BtnAbort.EnableWindow(TRUE);
	}
}

void CDfuSeDemoDlg::OnButtonverify() 
{
	if(ReadProtected)
	{
		    if (AfxMessageBox("Your device is read protected.\nWould you remove the read protection?", MB_YESNO |MB_ICONQUESTION)==IDYES)
			{
				HANDLE hdl;
                if (STDFU_Open((LPSTR)(LPCSTR)m_CurrDFUName,&hdl)==STDFU_NOERROR)
				{
				   if (STDFU_SelectCurrentConfiguration(&hdl, 0, 0,1)==STDFU_NOERROR)
				   {
					   DFUSTATUS DFUStatus;

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   while(DFUStatus.bState != STATE_DFU_IDLE)
					   {
							STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }
						 
					   LPBYTE m_pBuffer = (LPBYTE)malloc(0x10);
					   memset(m_pBuffer, 0xFF, 0x10);
					   m_pBuffer[0] = 0x92;
					
					   STDFU_Dnload(&hdl, m_pBuffer, 0x01, 0); 

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   /*while(DFUStatus.bState != STATE_DFU_IDLE)
					   {
							STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }*/
				   }
				   STDFU_Close(&hdl);
				   ReadProtected = FALSE;
				}

			}
			else 
				return;
	}

	CString Tempo, DevId, FileId;

	m_CurrentTarget=m_CtrlDevTargets.GetNextItem(-1, LVIS_SELECTED);
	if (m_CurrentTarget==-1)
	{
		HandleTxtError("Please select one or several targets before !");
		return;
	}

	m_CtrlDevAppVid.GetWindowText(DevId);
	if (DevId.IsEmpty())
	{
		if (AfxMessageBox("Your device was plugged in DFU mode. \nSo it is impossible to make sure this file is correct for this device.\n\nContinue however ?", MB_YESNO)!=IDYES)
			return;
	}
	else
	{
		m_CtrlFileVid.GetWindowText(FileId);
		if (FileId!=DevId)
		{
			if (AfxMessageBox("This file is not supposed to be used with that device.\n\nContinue however ?", MB_YESNO)!=IDYES)
				return;
		}
		else
		{
			m_CtrlDevAppPid.GetWindowText(DevId);
			m_CtrlFilePid.GetWindowText(FileId);
			if (FileId!=DevId)
			{
				if (AfxMessageBox("This file is not supposed to be used with that device.\n\nContinue however ?", MB_YESNO)!=IDYES)
					return;
			}
		}
	}

	startTime = CTime::GetCurrentTime();
	LaunchVerify();
}

void CDfuSeDemoDlg::LaunchVerify() 
{
	DFUThreadContext Context;
	BOOL bFound=FALSE;
	DWORD dwRet;
	int i, TargetSel=m_CurrentTarget;
	HANDLE hImage;
	HANDLE hFile;
	BYTE NbTargets;

	// Get the image of the selected target
	dwRet=STDFUFILES_OpenExistingDFUFile((LPSTR)(LPCSTR)m_DownFileName, &hFile, NULL, NULL, NULL, &NbTargets);
	if (dwRet==STDFUFILES_NOERROR)
	{
		for (i=0;i<NbTargets;i++)
		{
			HANDLE Image;
			BYTE Alt;

			if (STDFUFILES_ReadImageFromDFUFile(hFile, i, &Image)==STDFUFILES_NOERROR)
			{
				if (STDFUFILES_GetImageAlternate(Image, &Alt)==STDFUFILES_NOERROR)
				{
					if (Alt==TargetSel)
					{
						hImage=Image;
						bFound=TRUE;
						break;
					}
				}
				STDFUFILES_DestroyImage(&Image);
			}
		}
		STDFUFILES_CloseDFUFile(hFile);
	}
	else
	{
		Context.ErrorCode=dwRet;
		HandleError(&Context);
	}

	if (!bFound)
	{
		HandleTxtError("Unable to find data for that target in the dfu file...");
		return;
	}
	else
	{
		// prepare the asynchronous operation
		lstrcpy(Context.szDevLink, m_CurrDFUName);
		Context.DfuGUID=GUID_DFU;
		Context.AppGUID=GUID_APP;
		Context.Operation=OPERATION_UPLOAD;
		if (m_BufferedImage)
			STDFUFILES_DestroyImage(&m_BufferedImage);
		STDFUFILES_FilterImageForOperation(hImage, m_pMapping+TargetSel, OPERATION_UPLOAD, FALSE);
		Context.hImage=hImage;
		// Let's backup our data before the upload. The data will be used after the upload for comparison
		STDFUFILES_DuplicateImage(hImage, &m_BufferedImage);

		dwRet=STDFUPRT_LaunchOperation(&Context, &m_OperationCode);
		if (dwRet!=STDFUPRT_NOERROR)
		{
			Context.ErrorCode=dwRet;
			HandleError(&Context);
		}
		else
		{
			m_Progress.SetPos(0);
			m_Progress.SetWindowText("");
			m_Progress.SetShowText(TRUE);
			m_Progress.SetBkColour(COLOR_UPLOAD_BG);	
			m_Progress.SetTextBkColour(COLOR_UPLOAD_BG);
			m_Progress.SetForeColour(COLOR_UPLOAD_FG);
			m_Progress.SetTextForeColour(COLOR_UPLOAD_FG);
			m_CtrlDevices.EnableWindow(FALSE);
			m_BtnEnterApp.EnableWindow(FALSE);
			m_BtnEnterDFU.EnableWindow(FALSE);
			m_BtnUpChoose.EnableWindow(FALSE);
			m_BtnDownChoose.EnableWindow(FALSE);
			m_CtrlDevTargets.EnableWindow(FALSE);
			m_BtnUpload.EnableWindow(FALSE);
			m_BtnUpgrade.EnableWindow(FALSE);
			m_BtnVerify.EnableWindow(FALSE);
			m_BtnAbort.EnableWindow(TRUE);
		}
	}
}

void CDfuSeDemoDlg::OnButtonupgrade() 
{
	if(ReadProtected)
	{
		    if (AfxMessageBox("Your device is read protected.\nWould you remove the read protection?", MB_YESNO |MB_ICONQUESTION)==IDYES)
			{
				HANDLE hdl;
                if (STDFU_Open((LPSTR)(LPCSTR)m_CurrDFUName,&hdl)==STDFU_NOERROR)
				{
				   if (STDFU_SelectCurrentConfiguration(&hdl, 0, 0,1)==STDFU_NOERROR)
				   {
					   DFUSTATUS DFUStatus;

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   while(DFUStatus.bState != STATE_DFU_IDLE)
					   {
							STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }
						 
					   LPBYTE m_pBuffer = (LPBYTE)malloc(0x10);
					   memset(m_pBuffer, 0xFF, 0x10);
					   m_pBuffer[0] = 0x92;
					 

					   STDFU_Dnload(&hdl, m_pBuffer, 0x01, 0); 

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   /*while(DFUStatus.bState != STATE_DFU_IDLE)
					   {
							STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }*/
				   }
				   STDFU_Close(&hdl);
				   ReadProtected = FALSE;
				}

			}
			else 
				return;
	}


	CString Tempo, FileId, DevId;

	UpdateData(TRUE);
	m_CurrentTarget=m_CtrlDevTargets.GetNextItem(-1, LVIS_SELECTED);
	if (m_CurrentTarget==-1)
	{
		HandleTxtError("Please select one or several targets before !");
		return;
	}

	m_CtrlDevAppVid.GetWindowText(DevId);
	if (DevId.IsEmpty())
	{
		if (AfxMessageBox("Your device was plugged in DFU mode. \nSo it is impossible to make sure this file is correct for this device.\n\nContinue however ?", MB_YESNO)!=IDYES)
			return;
	}
	else
	{
		m_CtrlFileVid.GetWindowText(FileId);
		if (FileId!=DevId)
		{
			if (AfxMessageBox("This file is not supposed to be used with that device.\n\nContinue however ?", MB_YESNO)!=IDYES)
				return;
		}
		else
		{
			m_CtrlDevAppPid.GetWindowText(DevId);
			m_CtrlFilePid.GetWindowText(FileId);
			if (FileId!=DevId)
			{
				if (AfxMessageBox("This file is not supposed to be used with that device.\n\nContinue however ?", MB_YESNO)!=IDYES)
					return;
			}
		}
	}

	LaunchUpgrade();

	UpdateData(FALSE);
}

void CDfuSeDemoDlg::LaunchUpgrade() 
{
	DFUThreadContext Context;
	HANDLE hFile;
	BYTE NbTargets;
	BOOL bFound=FALSE;
	DWORD dwRet;
	int i, TargetSel=m_CurrentTarget;
	HANDLE hImage;
    
	

	// Get the image of the selected target
	dwRet=STDFUFILES_OpenExistingDFUFile((LPSTR)(LPCSTR)m_DownFileName, &hFile, NULL, NULL, NULL, &NbTargets);
	if (dwRet==STDFUFILES_NOERROR)
	{
		for (i=0;i<NbTargets;i++)
		{
			HANDLE Image;
			BYTE Alt;

			if (STDFUFILES_ReadImageFromDFUFile(hFile, i, &Image)==STDFUFILES_NOERROR)
			{
				if (STDFUFILES_GetImageAlternate(Image, &Alt)==STDFUFILES_NOERROR)
				{
					if (Alt==TargetSel)
					{
						hImage=Image;
						bFound=TRUE;
						break;
					}
				}
				STDFUFILES_DestroyImage(&Image);
			}
		}
		STDFUFILES_CloseDFUFile(hFile);
	}
	else
	{
		Context.ErrorCode=dwRet;
		HandleError(&Context);
	}

	if (!bFound)
	{
		HandleTxtError("Unable to find data for that device/target from the file ...");
		return;
	}
	else
	{
		// prepare the asynchronous operation: first is erase !
		lstrcpy(Context.szDevLink, m_CurrDFUName);
		Context.DfuGUID=GUID_DFU;
		Context.AppGUID=GUID_APP;
		Context.Operation=OPERATION_ERASE;
		Context.bDontSendFFTransfersForUpgrade=m_TransferOptimized;
		if (m_BufferedImage)
			STDFUFILES_DestroyImage(&m_BufferedImage);
		// Let's backup our data before the filtering for erase. The data will be used for the upgrade phase
		STDFUFILES_DuplicateImage(hImage, &m_BufferedImage);
		STDFUFILES_FilterImageForOperation(m_BufferedImage, m_pMapping+TargetSel, OPERATION_UPGRADE, m_TransferOptimized);

		STDFUFILES_FilterImageForOperation(hImage, m_pMapping+TargetSel, OPERATION_ERASE, m_TransferOptimized);
		Context.hImage=hImage;

		UpdateData(TRUE);
		m_DataSize.Format("0 KB(0 Bytes) of %i KB(%i Bytes)", STDFUFILES_GetImageSize(m_BufferedImage)/1024,  STDFUFILES_GetImageSize(m_BufferedImage));
		UpdateData(FALSE);

		startTime = CTime::GetCurrentTime();

		dwRet=STDFUPRT_LaunchOperation(&Context, &m_OperationCode);
		if (dwRet!=STDFUPRT_NOERROR)
		{
			Context.ErrorCode=dwRet;
			HandleError(&Context);
		}
		else
		{
			m_Progress.SetPos(0);
			m_Progress.SetWindowText("");
			m_Progress.SetShowText(TRUE);
			m_Progress.SetBkColour(COLOR_UPGRADE_BG);	
			m_Progress.SetTextBkColour(COLOR_UPGRADE_BG);
			m_Progress.SetForeColour(COLOR_UPGRADE_FG);
			m_Progress.SetTextForeColour(COLOR_UPGRADE_FG);
			m_CtrlDevices.EnableWindow(FALSE);
			m_BtnEnterApp.EnableWindow(FALSE);
			m_BtnEnterDFU.EnableWindow(FALSE);
			m_BtnUpChoose.EnableWindow(FALSE);
			m_BtnDownChoose.EnableWindow(FALSE);
			m_CtrlDevTargets.EnableWindow(FALSE);
			m_BtnUpload.EnableWindow(FALSE);
			m_BtnUpgrade.EnableWindow(FALSE);
			m_BtnVerify.EnableWindow(FALSE);
			m_BtnAbort.EnableWindow(TRUE);
		}
	}
}

void CDfuSeDemoDlg::OnTimer(UINT nIDEvent) 
{
	DFUThreadContext Context;
	CString Tmp;
	DWORD dwRet;


	if (m_OperationCode)  
	{

		endTime = CTime::GetCurrentTime();
        elapsedTime = endTime - startTime;
    
	    UpdateData(TRUE);
	    m_TimeDuration.Format("%.2i:%.2i:%.2i", elapsedTime.GetHours(),elapsedTime.GetMinutes(),elapsedTime.GetSeconds());
        UpdateData(FALSE);

		CString Tmp, Tmp2;

		// Get the operation status
		STDFUPRT_GetOperationStatus(m_OperationCode, &Context);
		
		if (Context.ErrorCode!=STDFUPRT_NOERROR)
		{
			STDFUPRT_StopOperation(m_OperationCode, &Context);
			if (Context.Operation==OPERATION_UPGRADE)
				m_BufferedImage=0;
			if (Context.Operation==OPERATION_UPLOAD)
			{
				if (m_BufferedImage!=0) // Verify
				{
					STDFUFILES_DestroyImage(&m_BufferedImage);
					m_BufferedImage=0;
				}
			}
			STDFUFILES_DestroyImage(&Context.hImage);

			m_OperationCode=0;
			if (Context.ErrorCode==STDFUPRT_UNSUPPORTEDFEATURE)
				AfxMessageBox("This feature is not supported by this firmware.");
			else
				HandleError(&Context);
			m_CtrlDevices.EnableWindow(TRUE);
			m_BtnUpChoose.EnableWindow(TRUE);
			m_BtnDownChoose.EnableWindow(TRUE);

			// Did we have an error: let's stop all and display the problem
			if (Context.Operation==OPERATION_DETACH)
			{
				m_DetachedDev="";
				delete m_DetachedDevs[m_CurrDFUName];
				m_DetachedDevs.RemoveKey(m_CurrDFUName);
				m_BtnEnterDFU.EnableWindow(TRUE);
				m_CtrlDevTargets.EnableWindow(TRUE);
			}
			else
			{
				if (Context.Operation==OPERATION_RETURN)
					m_DetachedDev="";

				m_BtnEnterApp.EnableWindow(TRUE);
				m_CtrlDevTargets.EnableWindow(TRUE);
				m_UpFile.GetWindowText(Tmp);
				m_BtnUpload.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
				m_DownFile.GetWindowText(Tmp);
				m_BtnUpgrade.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE));
				m_BtnVerify.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
				m_BtnAbort.EnableWindow(FALSE);
			}
			m_CurrentTarget=-1;
			Refresh();
		}
		else
		{
			switch (Context.Operation)
			{
			case OPERATION_UPLOAD:
				{
				  Tmp.Format("Target %02i: Uploading %i%%...", m_CurrentTarget, Context.Percent);

				  UpdateData(TRUE);
		          m_DataSize.Format("%i KB(%i Bytes) of %i KB(%i Bytes)", ((STDFUFILES_GetImageSize(Context.hImage)/1024)*Context.Percent)/100,  (STDFUFILES_GetImageSize(Context.hImage)*Context.Percent)/100, STDFUFILES_GetImageSize(Context.hImage)/1024,  STDFUFILES_GetImageSize(Context.hImage));
		          UpdateData(FALSE);

				  break;
				}
			case OPERATION_UPGRADE:
				{
				  Tmp.Format("Target %02i: Upgrading - Download Phase (%i%%)...", m_CurrentTarget, Context.Percent);

				  UpdateData(TRUE);
		          m_DataSize.Format("%i KB(%i Bytes) of %i KB(%i Bytes)", ((STDFUFILES_GetImageSize(Context.hImage)/1024)*Context.Percent)/100,  (STDFUFILES_GetImageSize(Context.hImage)*Context.Percent)/100, STDFUFILES_GetImageSize(Context.hImage)/1024,  STDFUFILES_GetImageSize(Context.hImage));
		          UpdateData(FALSE);

				  break;
				}
			case OPERATION_DETACH:
				Tmp.Format("Detaching %i%%...", Context.Percent);
				break;
			case OPERATION_RETURN:
				Tmp.Format("Leaving DFU mode %i%%...", Context.Percent);
				break;
			default:
				Tmp.Format("Target %02i: Upgrading - Erase Phase (%i%%)...", m_CurrentTarget, Context.Percent);
				break;
			}

			m_Progress.SetWindowText(Tmp);
			m_Progress.SetPos(Context.Percent);
			if (Context.Percent==100)
			{
				if (Context.Operation==OPERATION_ERASE)
				{
					// After the erase, relaunch the Upgrade phase !
					STDFUPRT_StopOperation(m_OperationCode, &Context);
					STDFUFILES_DestroyImage(&Context.hImage);

					Context.Operation=OPERATION_UPGRADE;
					Context.hImage=m_BufferedImage;
					dwRet=STDFUPRT_LaunchOperation(&Context, &m_OperationCode);
					if (dwRet!=STDFUPRT_NOERROR)
					{
						Context.ErrorCode=dwRet;
						HandleError(&Context);
					}
				}
				else
				{
					BOOL bAllTargetsFinished=TRUE;

					STDFUPRT_StopOperation(m_OperationCode, &Context);
					m_Progress.SetPos(100);
					m_OperationCode=0;

					int Sel=m_CtrlDevices.GetCurSel();
					if (Context.Operation==OPERATION_RETURN)
					{
						delete m_DetachedDevs[m_DetachedDev];
						m_DetachedDevs.RemoveKey(m_DetachedDev);
						if (Sel!=-1)
						{
							m_CtrlDFUDevices.InsertString(Sel, Context.szDevLink);
							m_CurrDFUName=Context.szDevLink;
						}
						HandleTxtSuccess("Successfully left DFU mode !");
					}
					if (Context.Operation==OPERATION_DETACH) 
					{
						CString Tmp=Context.szDevLink;

						Tmp.MakeUpper();
						m_DetachedDevs[Tmp]=m_DetachedDevs[m_DetachedDev];
						((PUSB_DEVICE_DESCRIPTOR)(m_DetachedDevs[Tmp]))->bLength=18;
						m_DetachedDevs.RemoveKey(m_DetachedDev);
						if (Sel!=-1)
						{
							m_CtrlDFUDevices.InsertString(Sel, Context.szDevLink);
							m_CurrDFUName=Context.szDevLink;
						}
						HandleTxtSuccess("Successfully detached !");
					}
					if (Context.Operation==OPERATION_UPLOAD)
					{
						if (m_BufferedImage==0) // This was a standard Upload
						{
							HANDLE hFile;
							PUSB_DEVICE_DESCRIPTOR Desc=NULL;

							WORD Vid, Pid, Bcd;

							Vid=m_DeviceDesc.idVendor;
							Pid=m_DeviceDesc.idProduct;
							Bcd=m_DeviceDesc.bcdDevice;

							Desc=(PUSB_DEVICE_DESCRIPTOR)(m_DetachedDevs[m_CurrDFUName]);
							if ( (Desc) && (Desc->bLength) )
							{
								Vid=Desc->idVendor;
								Pid=Desc->idProduct;
								Bcd=Desc->bcdDevice;
							}

							if (m_CtrlDevTargets.GetNextItem(-1, LVIS_SELECTED)==m_CurrentTarget)
								dwRet=STDFUFILES_CreateNewDFUFile((LPSTR)(LPCSTR)m_UpFileName, &hFile, Vid, Pid, Bcd);
							else
								dwRet=STDFUFILES_OpenExistingDFUFile((LPSTR)(LPCSTR)m_UpFileName, &hFile, NULL, NULL, NULL, NULL);
							if (dwRet==STDFUFILES_NOERROR)
							{
								dwRet=STDFUFILES_AppendImageToDFUFile(hFile, Context.hImage);
								if (dwRet==STDFUFILES_NOERROR)
								{
									HandleTxtSuccess("Upload successful !");
									m_CurrentTarget=m_CtrlDevTargets.GetNextItem(m_CurrentTarget, LVIS_SELECTED);
									if (m_CurrentTarget>=0)
									{
										bAllTargetsFinished=FALSE;
										LaunchUpload();
									}
								}
								else
									HandleTxtError("Unable to append image to DFU file...");
								STDFUFILES_CloseDFUFile(hFile);
							}
							else
								HandleTxtError("Unable to create a new DFU file...");
						}
						else // This was a verify
						{
							// We need to compare our Two images
							DWORD i,j;
							DWORD MaxElements;
							BOOL bDifferent=FALSE, bSuccess=TRUE;

							dwRet=STDFUFILES_GetImageNbElement(Context.hImage, &MaxElements);
							if (dwRet==STDFUFILES_NOERROR)
							{
								for (i=0;i<MaxElements;i++)
								{
									DFUIMAGEELEMENT ElementRead, ElementSource;

									memset(&ElementRead, 0, sizeof(DFUIMAGEELEMENT));
									memset(&ElementSource, 0, sizeof(DFUIMAGEELEMENT));

									// Get the Two elements
									dwRet=STDFUFILES_GetImageElement(Context.hImage, i, &ElementRead);
									if (dwRet==STDFUFILES_NOERROR)
									{
										ElementRead.Data=new BYTE[ElementRead.dwDataLength];
										dwRet=STDFUFILES_GetImageElement(Context.hImage, i, &ElementRead);
										if (dwRet==STDFUFILES_NOERROR)
										{
											ElementSource.Data=new BYTE[ElementRead.dwDataLength]; // Should be same lengh in source and read
											dwRet=STDFUFILES_GetImageElement(m_BufferedImage, i, &ElementSource);
											if (dwRet==STDFUFILES_NOERROR)
											{
												for (j=0;j<ElementRead.dwDataLength;j++)
												{
													if (ElementSource.Data[j]!=ElementRead.Data[j])
													{
														bDifferent=TRUE;
														HandleTxtError("Verify successful, but data not matching...");
														Tmp.Format("Matching not good. First Difference at address 0x%08X:\nFile  byte  is  0x%02X.\nRead byte is 0x%02X.", ElementSource.dwAddress+j, ElementSource.Data[j], ElementRead.Data[j]);
														AfxMessageBox(Tmp);
														break;
													}
												}
											}
											else
											{
												HandleTxtError("Unable to get data from source image...");
												bSuccess=FALSE;
												break;
											}
											delete[] ElementSource.Data;
											delete[] ElementRead.Data;
										}
										else
										{
											delete[] ElementRead.Data;
											HandleTxtError("Unable to get data from read image...");
											bSuccess=FALSE;
											break;
										}
									}
									else
									{
										HandleTxtError("Unable to get data from read image...");
										bSuccess=FALSE;
										break;
									}
									if (bDifferent)
										break;
								}
							}
							else
							{
								HandleTxtError("Unable to get elements from read image...");
								bSuccess=FALSE;
							}

							STDFUFILES_DestroyImage(&m_BufferedImage);
							m_BufferedImage=0;
							if (bSuccess)
							{
								if (!bDifferent)
									HandleTxtSuccess("Verify successful !");
								m_CurrentTarget=m_CtrlDevTargets.GetNextItem(m_CurrentTarget, LVIS_SELECTED);
								if (m_CurrentTarget>=0)
								{
									bAllTargetsFinished=FALSE;
									LaunchVerify();
								}
							}
						}

					} 
					if (Context.Operation==OPERATION_UPGRADE)
					{
						HandleTxtSuccess("Upgrade successful !");
						m_BufferedImage=0;
						m_CurrentTarget=m_CtrlDevTargets.GetNextItem(m_CurrentTarget, LVIS_SELECTED);
						if (m_CurrentTarget>=0)
						{
							bAllTargetsFinished=FALSE;
							LaunchUpgrade();
						}
					}
					if (bAllTargetsFinished)
					{
						if ( (Context.Operation==OPERATION_UPGRADE))
						{
							if (m_Verify)
							{
								// After the upgrade , relaunch the Upgrade verify !
								CString Tempo, DevId, FileId;

								m_CurrentTarget=m_CtrlDevTargets.GetNextItem(-1, LVIS_SELECTED);
								/*if (m_CurrentTarget==-1)
								{
									HandleTxtError("Please select one or several targets before !");
									return;
								}

								m_CtrlDevAppVid.GetWindowText(DevId);
								if (DevId.IsEmpty())
								{
									if (AfxMessageBox("Your device was plugged in DFU mode. \nSo it is impossible to make sure this file is correct for this device.\n\nContinue however ?", MB_YESNO)!=IDYES)
										return;
								}
								else
								{
									m_CtrlFileVid.GetWindowText(FileId);
									if (FileId!=DevId)
									{
										if (AfxMessageBox("This file is not supposed to be used with that device.\n\nContinue however ?", MB_YESNO)!=IDYES)
											return;
									}
									else
									{
										m_CtrlDevAppPid.GetWindowText(DevId);
										m_CtrlFilePid.GetWindowText(FileId);
										if (FileId!=DevId)
										{
											if (AfxMessageBox("This file is not supposed to be used with that device.\n\nContinue however ?", MB_YESNO)!=IDYES)
												return;
										}
									}
								}*/

								LaunchVerify();
							}
						}
						if ( (Context.Operation==OPERATION_UPLOAD) &&
							 (m_UpFileName.CompareNoCase(m_DownFileName)==0) )
						{
							BYTE NbTargets;
							HANDLE hFile;

							m_CtrlFileTargets.ResetContent();
							if (STDFUFILES_OpenExistingDFUFile((LPSTR)(LPCSTR)m_UpFileName, &hFile, NULL, NULL, NULL, &NbTargets)==STDFUFILES_NOERROR)
							{
								for (int i=0;i<NbTargets;i++)
								{
									HANDLE Image;
									BYTE Alt;
									CString Tempo;
									char Name[MAX_PATH];

									if (STDFUFILES_ReadImageFromDFUFile(hFile, i, &Image)==STDFUFILES_NOERROR)
									{
										if (STDFUFILES_GetImageAlternate(Image, &Alt)==STDFUFILES_NOERROR)
										{
											STDFUFILES_GetImageName(Image, Name);
											Tempo.Format("%02i\t%s", Alt, Name);

											m_CtrlFileTargets.AddString(Tempo);
										}
										STDFUFILES_DestroyImage(&Image);
									}
								}
								STDFUFILES_CloseDFUFile(hFile);
							}
						}

						if ( (Context.Operation==OPERATION_DETACH) || (Context.Operation==OPERATION_RETURN) )
						{
							m_CtrlDevices.EnableWindow(TRUE);
							m_BtnEnterApp.EnableWindow(TRUE);
							m_BtnUpChoose.EnableWindow(TRUE);
							m_BtnDownChoose.EnableWindow(TRUE);
							m_CtrlDevTargets.EnableWindow(TRUE);
							m_UpFile.GetWindowText(Tmp);
							m_BtnUpload.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
							m_DownFile.GetWindowText(Tmp);
							m_BtnUpgrade.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE));
							m_BtnVerify.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
							m_BtnAbort.EnableWindow(FALSE);
							Refresh();
						}
						else
						{
							m_CtrlDevices.EnableWindow(TRUE);
							m_BtnEnterApp.EnableWindow(TRUE);
							m_BtnUpChoose.EnableWindow(TRUE);
							m_BtnDownChoose.EnableWindow(TRUE);
							m_CtrlDevTargets.EnableWindow(TRUE);
							m_UpFile.GetWindowText(Tmp);
							m_BtnUpload.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
							m_DownFile.GetWindowText(Tmp);
							m_BtnUpgrade.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE));
							m_BtnVerify.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
							m_BtnAbort.EnableWindow(FALSE);
						}
					}					
					STDFUFILES_DestroyImage(&Context.hImage);
				}
			}
		}
	}
	CDialog::OnTimer(nIDEvent);
}

void CDfuSeDemoDlg::HandleTxtError(LPCSTR szTxt)
{
	CString Tmp;

	m_Progress.SetBkColour(COLOR_ERROR_BG);	
	m_Progress.SetTextBkColour(COLOR_ERROR_BG);
	m_Progress.SetForeColour(COLOR_ERROR_FG);
	m_Progress.SetTextForeColour(COLOR_ERROR_FG);
	if (m_CurrentTarget>=0)
	{
		Tmp.Format("Target %02i: %s", m_CurrentTarget, szTxt);
		m_Progress.SetWindowText(Tmp);
	}
	else
		m_Progress.SetWindowText(szTxt);
	m_Progress.SetShowText(TRUE);
}

void CDfuSeDemoDlg::HandleTxtSuccess(LPCSTR szTxt)
{
	CString Tmp;

	if (m_CurrentTarget>=0)
	{
		Tmp.Format("Target %02i: %s", m_CurrentTarget, szTxt);
		m_Progress.SetWindowText(Tmp);
	}
	else
		m_Progress.SetWindowText(szTxt);
	m_Progress.SetShowText(TRUE);
}

void CDfuSeDemoDlg::HandleError(PDFUThreadContext pContext)
{
	CString Alternate, Operation, TransferSize, LastDFUStatus, CurrentStateMachineTransition, CurrentRequest, StartAddress, EndAddress, CurrentNBlock, CurrentLength, ErrorCode, Percent;
	CString CurrentTarget;
	CString Tmp;

	CurrentTarget.Format("Target: %02i\n", m_CurrentTarget);
	switch (pContext->Operation)
	{
	case OPERATION_UPLOAD:
		Operation="Operation: UPLOAD\n";
		break;
	case OPERATION_UPGRADE:
		Operation="Operation: UPGRADE\n";
		break;
	case OPERATION_DETACH:
		Operation="Operation: DETACH\n";
		break;
	case OPERATION_RETURN:
		Operation="Operation: RETURN\n";
		break;
	}

	TransferSize.Format("TransferSize: %i\n", pContext->wTransferSize);
	
	switch (pContext->LastDFUStatus.bState)
	{
	case STATE_IDLE:
		LastDFUStatus+="DFU State: STATE_IDLE\n";
		break;
	case STATE_DETACH:
		LastDFUStatus+="DFU State: STATE_DETACH\n";
		break;
	case STATE_DFU_IDLE:
		LastDFUStatus+="DFU State: STATE_DFU_IDLE\n";
		break;
	case STATE_DFU_DOWNLOAD_SYNC:
		LastDFUStatus+="DFU State: STATE_DFU_DOWNLOAD_SYNC\n";
		break;
	case STATE_DFU_DOWNLOAD_BUSY:
		LastDFUStatus+="DFU State: STATE_DFU_DOWNLOAD_BUSY\n";
		break;
	case STATE_DFU_DOWNLOAD_IDLE:
		LastDFUStatus+="DFU State: STATE_DFU_DOWNLOAD_IDLE\n";
		break;
	case STATE_DFU_MANIFEST_SYNC:
		LastDFUStatus+="DFU State: STATE_DFU_MANIFEST_SYNC\n";
		break;
	case STATE_DFU_MANIFEST:
		LastDFUStatus+="DFU State: STATE_DFU_MANIFEST\n";
		break;
	case STATE_DFU_MANIFEST_WAIT_RESET:
		LastDFUStatus+="DFU State: STATE_DFU_MANIFEST_WAIT_RESET\n";
		break;
	case STATE_DFU_UPLOAD_IDLE:
		LastDFUStatus+="DFU State: STATE_DFU_UPLOAD_IDLE\n";
		break;
	case STATE_DFU_ERROR:
		LastDFUStatus+="DFU State: STATE_DFU_ERROR\n";
		break;
	default:
		Tmp.Format("DFU State: (Unknown 0x%02X)\n", pContext->LastDFUStatus.bState);
		LastDFUStatus+=Tmp;
		break;
	}
	switch (pContext->LastDFUStatus.bStatus)
	{
	case STATUS_OK:
		LastDFUStatus+="DFU Status: STATUS_OK\n";
		break;
	case STATUS_errTARGET:
		LastDFUStatus+="DFU Status: STATUS_errTARGET\n";
		break;
	case STATUS_errFILE:
		LastDFUStatus+="DFU Status: STATUS_errFILE\n";
		break;
	case STATUS_errWRITE:
		LastDFUStatus+="DFU Status: STATUS_errWRITE\n";
		break;
	case STATUS_errERASE:
		LastDFUStatus+="DFU Status: STATUS_errERASE\n";
		break;
	case STATUS_errCHECK_ERASE:
		LastDFUStatus+="DFU Status: STATUS_errCHECK_ERASE\n";
		break;
	case STATUS_errPROG:
		LastDFUStatus+="DFU Status: STATUS_errPROG\n";
		break;
	case STATUS_errVERIFY:
		LastDFUStatus+="DFU Status: STATUS_errVERIFY\n";
		break;
	case STATUS_errADDRESS:
		LastDFUStatus+="DFU Status: STATUS_errADDRESS\n";
		break;
	case STATUS_errNOTDONE:
		LastDFUStatus+="DFU Status: STATUS_errNOTDONE\n";
		break;
	case STATUS_errFIRMWARE:
		LastDFUStatus+="DFU Status: STATUS_errFIRMWARE\n";
		break;
	case STATUS_errVENDOR:
		LastDFUStatus+="DFU Status: STATUS_errVENDOR\n";
		break;
	case STATUS_errUSBR:
		LastDFUStatus+="DFU Status: STATUS_errUSBR\n";
		break;
	case STATUS_errPOR:
		LastDFUStatus+="DFU Status: STATUS_errPOR\n";
		break;
	case STATUS_errUNKNOWN:
		LastDFUStatus+="DFU Status: STATUS_errUNKNOWN\n";
		break;
	case STATUS_errSTALLEDPKT:
		LastDFUStatus+="DFU Status: STATUS_errSTALLEDPKT\n";
		break;
	default:
		Tmp.Format("DFU Status: (Unknown 0x%02X)\n", pContext->LastDFUStatus.bStatus);
		LastDFUStatus+=Tmp;
		break;
	}
	
	switch (pContext->CurrentRequest)
	{
	case STDFU_RQ_GET_DEVICE_DESCRIPTOR: 
		CurrentRequest+="Request: Getting Device Descriptor. \n";
		break;
	case STDFU_RQ_GET_DFU_DESCRIPTOR:
		CurrentRequest+="Request: Getting DFU Descriptor. \n";
		break;
	case STDFU_RQ_GET_STRING_DESCRIPTOR:
		CurrentRequest+="Request: Getting String Descriptor. \n";
		break;
	case STDFU_RQ_GET_NB_OF_CONFIGURATIONS:
		CurrentRequest+="Request: Getting amount of configurations. \n";
		break;
	case STDFU_RQ_GET_CONFIGURATION_DESCRIPTOR:
		CurrentRequest+="Request: Getting Configuration Descriptor. \n";
		break;
	case STDFU_RQ_GET_NB_OF_INTERFACES:
		CurrentRequest+="Request: Getting amount of interfaces. \n";
		break;
	case STDFU_RQ_GET_NB_OF_ALTERNATES:
		CurrentRequest+="Request: Getting amount of alternates. \n";
		break;
	case STDFU_RQ_GET_INTERFACE_DESCRIPTOR:
		CurrentRequest+="Request: Getting interface Descriptor. \n";
		break;
	case STDFU_RQ_OPEN:
		CurrentRequest+="Request: Opening device. \n";
		break;
	case STDFU_RQ_CLOSE:
		CurrentRequest+="Request: Closing device. \n";
		break;
	case STDFU_RQ_DETACH:
		CurrentRequest+="Request: Detach Request. \n";
		break;
	case STDFU_RQ_DOWNLOAD:
		CurrentRequest+="Request: Download Request. \n";
		break;
	case STDFU_RQ_UPLOAD:
		CurrentRequest+="Request: Upload Request. \n";
		break;
	case STDFU_RQ_GET_STATUS:
		CurrentRequest+="Request: Get Status Request. \n";
		break;
	case STDFU_RQ_CLR_STATUS:
		CurrentRequest+="Request: Clear Status Request. \n";
		break;
	case STDFU_RQ_GET_STATE:
		CurrentRequest+="Request: Get State Request. \n";
		break;
	case STDFU_RQ_ABORT:
		CurrentRequest+="Request: Abort Request. \n";
		break;
	case STDFU_RQ_SELECT_ALTERNATE:
		CurrentRequest+="Request: Selecting target. \n";
		break;
	case STDFU_RQ_AWAITINGPNPUNPLUGEVENT:
		CurrentRequest+="Request: Awaiting UNPLUG EVENT. \n";
		break;
	case STDFU_RQ_AWAITINGPNPPLUGEVENT:
		CurrentRequest+="Request: Awaiting PLUG EVENT. \n";
		break;
	case STDFU_RQ_IDENTIFYINGDEVICE:
		CurrentRequest+="Request: Identifying device after reenumeration. \n";
		break;
	default:
		Tmp.Format("Request: (unknown 0x%08X). \n", pContext->CurrentRequest);
		CurrentRequest+=Tmp;
		break;
	}
	
	CurrentNBlock.Format("CurrentNBlock: 0x%04X\n", pContext->CurrentNBlock);
	CurrentLength.Format("CurrentLength: 0x%04X\n", pContext->CurrentLength);
	Percent.Format("Percent: %i%%\n", pContext->Percent);
	
	switch (pContext->ErrorCode)
	{
	case STDFUPRT_NOERROR:
		ErrorCode="Error Code: no error (!)\n";
		break;
	case STDFUPRT_UNABLETOLAUNCHDFUTHREAD:
		ErrorCode="Error Code: Unable to launch operation (Thread problem)\n";
		break;
	case STDFUPRT_DFUALREADYRUNNING:
		ErrorCode="Error Code: DFU already running\n";
		break;
	case STDFUPRT_BADPARAMETER:
		ErrorCode="Error Code: Bad parameter\n";
		break;
	case STDFUPRT_BADFIRMWARESTATEMACHINE:
		ErrorCode="Error Code: Bad state machine in firmware\n";
		break;
	case STDFUPRT_UNEXPECTEDERROR:
		ErrorCode="Error Code: Unexpected error\n";
		break;
	case STDFUPRT_DFUERROR:
		ErrorCode="Error Code: DFU error\n";
		break;
	case STDFUPRT_RETRYERROR:
		ErrorCode="Error Code: Retry error\n";
		break;
	default:
		Tmp.Format("Error Code: Unknown error 0x%08X. \n", pContext->ErrorCode);
		ErrorCode=Tmp;
	}

	m_Progress.SetBkColour(COLOR_ERROR_BG);	
	m_Progress.SetTextBkColour(COLOR_ERROR_BG);
	m_Progress.SetForeColour(COLOR_ERROR_FG);
	m_Progress.SetTextForeColour(COLOR_ERROR_FG);
	if (m_CurrentTarget>=0)
	{
		Tmp.Format("Target %02i: %s", m_CurrentTarget, ErrorCode);
		m_Progress.SetWindowText(Tmp);
	}
	else
		m_Progress.SetWindowText(ErrorCode);
	m_Progress.SetShowText(TRUE);
	m_BtnAbort.EnableWindow(FALSE);
	AfxMessageBox(CurrentTarget+ErrorCode+Alternate+Operation+TransferSize+LastDFUStatus+CurrentStateMachineTransition+CurrentRequest+StartAddress+EndAddress+CurrentNBlock+CurrentLength+Percent);
}

void CDfuSeDemoDlg::OnButtonabort() 
{
	CString Tmp;
	DFUThreadContext Context;

	STDFUPRT_StopOperation(m_OperationCode, &Context);
	STDFUFILES_DestroyImage(&Context.hImage);
	if (Context.Operation==OPERATION_UPGRADE) 
		m_BufferedImage=0;
	if (Context.Operation==OPERATION_UPLOAD)
	{
		if (m_BufferedImage!=0) // Verify
		{
			STDFUFILES_DestroyImage(&m_BufferedImage);
			m_BufferedImage=0;
		}
	}

	m_OperationCode=0;
	m_Progress.SetWindowText("Operation user Aborted...");

	m_CtrlDevices.EnableWindow(TRUE);
	m_BtnEnterApp.EnableWindow(TRUE);
	m_BtnUpChoose.EnableWindow(TRUE);
	m_BtnDownChoose.EnableWindow(TRUE);
	m_CtrlDevTargets.EnableWindow(TRUE);
	m_UpFile.GetWindowText(Tmp);
	m_BtnUpload.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
	m_DownFile.GetWindowText(Tmp);
	m_BtnUpgrade.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE));
	m_BtnVerify.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
	m_BtnAbort.EnableWindow(FALSE);
}

HBRUSH CDfuSeDemoDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor) 
{
	HBRUSH hbr = CDialog::OnCtlColor(pDC, pWnd, nCtlColor);

    switch (nCtlColor) 
	{
	case CTLCOLOR_LISTBOX:
		if (pWnd->GetDlgCtrlID()==m_CtrlDevTargets.GetDlgCtrlID())
		{
			pDC->SetBkColor(GetSysColor(15));
			hbr=(HBRUSH)m_pBkBrushReadOnly->GetSafeHandle();
			break;
		}
		else
		if (pWnd->GetDlgCtrlID()==m_CtrlDevices.GetDlgCtrlID())
		{
	        CRect rect;
			CString Item;
			int i;
			int LongestWidth=0;
			SIZE Size;

            pWnd->GetWindowRect(&rect);

			for (i=0;i<m_CtrlDevices.GetCount();i++)
			{
				m_CtrlDevices.GetLBText(i, Item);
				::GetTextExtentPoint32(pDC->m_hDC, Item, Item.GetLength(), &Size);
				if (Size.cx>LongestWidth)
					LongestWidth=Size.cx-50;
			}
			if (rect.Width()<LongestWidth) 
			{
				rect.right = rect.left + LongestWidth;
                pWnd->MoveWindow(&rect);
            }
		}
	case CTLCOLOR_EDIT:
		pDC->SetBkColor(RGB_BK);
		hbr=(HBRUSH)m_pBkBrush->GetSafeHandle();
        break;
	}

	return hbr;
}

void CDfuSeDemoDlg::OnDestroy() 
{
	CDialog::OnDestroy();
	delete m_pBkBrush;
	delete m_pBkBrushReadOnly;
}

BOOL CDfuSeDemoDlg::OnDeviceChange(UINT nEventType,DWORD dwData)
{
	_DEV_BROADCAST_HEADER *hdr;

	if ((nEventType == DBT_DEVICEREMOVECOMPLETE))// || (nEventType == 0x0007))
	{
		hdr=(_DEV_BROADCAST_HEADER*)dwData;
		if (hdr->dbcd_devicetype==DBT_DEVTYP_DEVICEINTERFACE)
		{
			PDEV_BROADCAST_DEVICEINTERFACE p=(PDEV_BROADCAST_DEVICEINTERFACE)hdr;
			if (m_OperationCode==0)
				Refresh();
			else
			if ( (strcmpi(p->dbcc_name, m_CurrDFUName)==0) )//&& (m_OperationCode!=0) )
			{
				CString Tmp;
				DFUThreadContext Context;

				STDFUPRT_GetOperationStatus(m_OperationCode, &Context);
				// if operation is Detach or Return, a device removal is something standard !
				if ( (Context.Operation!=OPERATION_RETURN) && (Context.Operation!=OPERATION_DETACH) )
				{
					STDFUPRT_StopOperation(m_OperationCode, NULL);
					STDFUFILES_DestroyImage(&Context.hImage);
					if (Context.Operation==OPERATION_UPGRADE)
						m_BufferedImage=0;
					if (Context.Operation==OPERATION_UPLOAD)
					{
						if (m_BufferedImage!=0) // Verify
						{
							STDFUFILES_DestroyImage(&m_BufferedImage);
							m_BufferedImage=0;
						}
					}
					m_OperationCode=0;
					m_Progress.SetBkColour(COLOR_ERROR_BG);	
					m_Progress.SetTextBkColour(COLOR_ERROR_BG);
					m_Progress.SetForeColour(COLOR_ERROR_FG);
					m_Progress.SetTextForeColour(COLOR_ERROR_FG);
					m_Progress.SetWindowText("Device unplugged...");
					m_Progress.SetShowText(TRUE);
					m_CtrlDevices.EnableWindow(TRUE);
					m_BtnEnterApp.EnableWindow(TRUE);
					m_BtnUpChoose.EnableWindow(TRUE);
					m_BtnDownChoose.EnableWindow(TRUE);
					m_CtrlDevTargets.EnableWindow(TRUE);
					m_UpFile.GetWindowText(Tmp);
					m_BtnUpload.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
					m_DownFile.GetWindowText(Tmp);
					m_BtnUpgrade.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_DNLOAD_CAPABLE));
					m_BtnVerify.EnableWindow((Tmp.GetLength()!=0) && (m_CurrDevDFUDesc.bmAttributes & ATTR_UPLOAD_CAPABLE));
					m_BtnAbort.EnableWindow(FALSE);
					Refresh();
				}
			}
		}
	}
	if ((nEventType == DBT_DEVICEARRIVAL))
	{
		hdr=(_DEV_BROADCAST_HEADER*)dwData;
		if (hdr->dbcd_devicetype==DBT_DEVTYP_DEVICEINTERFACE)
			Refresh();
	}
	Refresh();
	return TRUE;
}



void CDfuSeDemoDlg::OnDblclkListtargets(NMHDR* pNMHDR, LRESULT* pResult) 
{
	int Sel=m_CtrlDevTargets.GetNextItem(-1, LVNI_FOCUSED);

	if (Sel!=-1)
	{
		if(ReadProtected)
		{
		    if (AfxMessageBox("Your device is read protected.\nWould you remove the read protection?", MB_YESNO |MB_ICONQUESTION)==IDYES)
			{
				HANDLE hdl;
                if (STDFU_Open((LPSTR)(LPCSTR)m_CurrDFUName,&hdl)==STDFU_NOERROR)
				{
				   if (STDFU_SelectCurrentConfiguration(&hdl, 0, 0,1)==STDFU_NOERROR)
				   {
					   DFUSTATUS DFUStatus;

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   while(DFUStatus.bState != STATE_DFU_IDLE)
					   {
							STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }
						 
					   LPBYTE m_pBuffer = (LPBYTE)malloc(0x10);
					   memset(m_pBuffer, 0xFF, 0x10);
					   m_pBuffer[0] = 0x92;
					

					   STDFU_Dnload(&hdl, m_pBuffer, 0x01, 0); 

					   STDFU_Getstatus(&hdl, &DFUStatus);
					   /*while(DFUStatus.bState != STATE_DFU_DOWNLOAD_BUSY)
					   {
							//STDFU_Clrstatus(&hdl);
							STDFU_Getstatus(&hdl, &DFUStatus);
					   }*/
				   }
				   STDFU_Close(&hdl);
				   _sleep(1000);
				   ReadProtected = FALSE;
				}

			}
		}

		CString MapName = m_CtrlDevTargets.GetItemText(Sel, 1);
		if (MapName.Compare("Option Bytes  ") == 0)
		{
			if((!ReadProtected) && (STM32Serie == 1))
			{
				COptionBytesDialog OpbDlg;
				if (STDFU_Open((LPSTR)(LPCSTR)m_CurrDFUName,&OpbDlg.m_phDevice)==STDFU_NOERROR)
				{
					OpbDlg.DoModal();
				}
			}

			if((!ReadProtected) && (STM32Serie == 2))
			{
				COptionBytesDialog_F2 OpbDlg;
				if (STDFU_Open((LPSTR)(LPCSTR)m_CurrDFUName,&OpbDlg.m_phDevice)==STDFU_NOERROR)
				{
					OpbDlg.DoModal();
				}
			}
		}
		else
		{
			CMappingDlg Map;
			Map.m_MapDesc=m_CtrlDevTargets.GetItemText(Sel, 3);
			Map.DoModal();
		}
	}
	*pResult = 0;
}

void CDfuSeDemoDlg::OnItemchangedListtargets(NMHDR* pNMHDR, LRESULT* pResult) 
{
	*pResult = 0;
}

