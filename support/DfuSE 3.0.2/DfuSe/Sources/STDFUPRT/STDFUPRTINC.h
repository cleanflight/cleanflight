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

#define OPERATION_DETACH	0
#define OPERATION_RETURN	1
#define OPERATION_UPLOAD	2
#define OPERATION_ERASE		3
#define	OPERATION_UPGRADE	4

#define STDFUPRT_ERROR_OFFSET				(0x12340000+0x5000)

#define STDFUPRT_NOERROR					(0x12340000)
#define STDFUPRT_UNABLETOLAUNCHDFUTHREAD	(STDFUPRT_ERROR_OFFSET+0x0001)
#define STDFUPRT_DFUALREADYRUNNING			(STDFUPRT_ERROR_OFFSET+0x0007)
#define STDFUPRT_BADPARAMETER				(STDFUPRT_ERROR_OFFSET+0x0008)
#define STDFUPRT_BADFIRMWARESTATEMACHINE	(STDFUPRT_ERROR_OFFSET+0x0009)	
#define STDFUPRT_UNEXPECTEDERROR			(STDFUPRT_ERROR_OFFSET+0x000A)	
#define STDFUPRT_DFUERROR					(STDFUPRT_ERROR_OFFSET+0x000B)	
#define STDFUPRT_RETRYERROR					(STDFUPRT_ERROR_OFFSET+0x000C)	
#define STDFUPRT_UNSUPPORTEDFEATURE		    (STDFUPRT_ERROR_OFFSET+0x000D)	

#pragma pack(push, b_align, 1)

#ifndef TYPE_DFUSTATUS
typedef struct  
{
	UCHAR bStatus;
	UCHAR bwPollTimeout[3];
	UCHAR bState;
	UCHAR iString;
}	DFUSTATUS,  *PDFUSTATUS;
#endif

#define BIT_READABLE	1
#define BIT_ERASABLE	2
#define BIT_WRITEABLE	4

typedef struct {
    DWORD		dwStartAddress;
	DWORD		dwAliasedAddress;
	DWORD		dwSectorIndex;
	DWORD		dwSectorSize;
	BYTE		bSectorType;
	BOOL		UseForOperation;
} MAPPINGSECTOR, *PMAPPINGSECTOR;

typedef struct {
	BYTE			nAlternate;
	char			Name[MAX_PATH];
	DWORD			NbSectors;
	PMAPPINGSECTOR	pSectors;	
} MAPPING, *PMAPPING;

typedef struct {
	DWORD		dwAddress;
	DWORD		dwDataLength;
	PBYTE		Data;
} DFUIMAGEELEMENT, *PDFUIMAGEELEMENT;

typedef struct {
	// Data that are driven by user
	GUID		DfuGUID;
	GUID		AppGUID;
	int			Operation;
	BOOL		bDontSendFFTransfersForUpgrade;
	HANDLE		hImage;

	// Data that are driven by user initially. But can be changed by STDFUPRT.dll
	char		szDevLink[MAX_PATH];

	// Data that are driven by the Dll that can be read by user, but never written
	DWORD		dwTag;
	BYTE		Percent;

	WORD		wTransferSize;
	DFUSTATUS	LastDFUStatus;
	int			CurrentRequest;
	UINT		CurrentNBlock;
	UINT		CurrentLength;
	DWORD		CurrentAddress;
	UINT		CurrentImageElement;
	
	DWORD		ErrorCode;
	
	HANDLE		hDevice;
} DFUThreadContext, *PDFUThreadContext;

#pragma pack(pop, b_align)

extern "C" DWORD PASCAL EXPORT STDFUPRT_CreateMappingFromDevice(PCHAR szDevLink, PMAPPING *ppMapping, PDWORD pNbAlternates);
extern "C" DWORD PASCAL EXPORT STDFUPRT_DestroyMapping(PMAPPING *ppMapping);

extern "C" DWORD PASCAL EXPORT STDFUPRT_LaunchOperation(PDFUThreadContext pContext, PDWORD pOperation);
extern "C" DWORD PASCAL EXPORT STDFUPRT_GetOperationStatus(DWORD OperationCode, PDFUThreadContext pContext);
extern "C" DWORD PASCAL EXPORT STDFUPRT_StopOperation(DWORD OperationCode, PDFUThreadContext pLastContext);
