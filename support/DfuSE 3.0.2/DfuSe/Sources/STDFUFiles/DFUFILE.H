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

#ifndef _DFU_FILE_H_
#define _DFU_FILE_H_

#pragma pack(1)

#define PREFIX_SIGNATURE_SIZE	5
#define PREFIX_SIGNATURE		"DfuSe"
#define PREFIX_VERSION			1

typedef struct
{
	char	szSignature[PREFIX_SIGNATURE_SIZE];
	BYTE	bVersion;
	DWORD	dwImageSize;
	BYTE	bTargets;
} DFUPREFIX, *PDFUPREFIX;

typedef struct
{
	BYTE bcdDeviceLo;
	BYTE bcdDeviceHi;
	BYTE idProductLo;
	BYTE idProductHi;
	BYTE idVendorLo;
	BYTE idVendorHi;
	BYTE bcdDFULo;
	BYTE bcdDFUHi;
	char ucDfuSignature[3];
	BYTE bLength;
	BYTE dwCRC[4];
} DFUSUFFIX, *PDFUSUFFIX;

#define TARGET_PREFIX_SIGNATURE_SIZE	6
#define TARGET_PREFIX_SIGNATURE		"Target"

typedef struct
{
	char	szSignature[TARGET_PREFIX_SIGNATURE_SIZE];
	BYTE	bAlternateSetting;
	BOOL	bTargetNamed;
	char	szTargetName[255];
	DWORD	dwTargetSize;
	DWORD	dwNbElements;
} TARGETPREFIX, *PTARGETPREFIX;

#pragma warning( disable : 4200 )

typedef struct
{
	DWORD	dwElementAddress;
	DWORD	dwElementSize;
	BYTE	Data[0];
} ELEMENT, *PELEMENT;

#pragma pack()

class CDFUFile : public CObject 
{
public:
	CDFUFile(PSTR szPath, UINT nOpenFlags);
	CDFUFile(PSTR szPath, UINT nOpenFlags, WORD Vid, WORD Pid, WORD Bcd);

	virtual ~CDFUFile();

	WORD GetVid() { return m_Vid; }
	WORD GetPid() { return m_Pid; }
	WORD GetBcd() { return m_Bcd; }
	DWORD GetError() { return m_Error; }
	BYTE GetNbAlternates() { return m_NbAlternates; }

	DWORD	AppendImage(HANDLE Image);
	DWORD	ReadImage(int Rank, PHANDLE pImage);
private:
	WORD	m_Vid;
	WORD	m_Pid;
	WORD	m_Bcd;
	BYTE	m_NbAlternates;
	CFile	m_File;
	DWORD	m_Error;
	BYTE	m_Version;
	DWORD	AppendSuffix();
	DWORD	CalculateCRC();
};

#endif