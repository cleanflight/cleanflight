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

// STDFUPRT.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "STDFUPRT.h"
#include "STThread.h"
#include "../STDFU/STDFU.h"
#include "STDFUPRTINC.h"
#include "../STDFUFILES/STDFUFILESINC.h"
#include "DFUThread.h"
#include "UploadThread.h"
#include "DownloadThread.h"
#include "DetachThread.h"
#include "image.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

//
//	Note!
//
//		If this DLL is dynamically linked against the MFC
//		DLLs, any functions exported from this DLL which
//		call into MFC must have the AFX_MANAGE_STATE macro
//		added at the very beginning of the function.
//
//		For example:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// normal function body here
//		}
//
//		It is very important that this macro appear in each
//		function, prior to any calls into MFC.  This means that
//		it must appear as the first statement within the 
//		function, even before any object variable declarations
//		as their constructors may generate calls into the MFC
//		DLL.
//
//		Please see MFC Technical Notes 33 and 58 for additional
//		details.
//

/////////////////////////////////////////////////////////////////////////////
// CSTDFUPRTApp

BEGIN_MESSAGE_MAP(CSTDFUPRTApp, CWinApp)
	//{{AFX_MSG_MAP(CSTDFUPRTApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

CObArray g_Operations;
/////////////////////////////////////////////////////////////////////////////
// CSTDFUPRTApp construction

CSTDFUPRTApp::CSTDFUPRTApp()
{
}

int CSTDFUPRTApp::ExitInstance() 
{
	int i;

	// Take care about garbages
	for (i=0;i<=g_Operations.GetUpperBound();i++)
	{
		CDFUThread *pThread=(CDFUThread*)g_Operations.GetAt(i);

		pThread->StopThread();
		delete pThread;
	}
	g_Operations.RemoveAll();
	return CWinApp::ExitInstance();
}
/////////////////////////////////////////////////////////////////////////////
// The one and only CSTDFUPRTApp object

CSTDFUPRTApp theApp;


extern "C" DWORD PASCAL EXPORT STDFUPRT_LaunchOperation(PDFUThreadContext pContext, PDWORD pOperationCode)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	
	DWORD dwRet=STDFUPRT_NOERROR;

	switch (pContext->Operation)
	{
	case OPERATION_UPLOAD: 
		{
			CUploadThread* pUpload=new CUploadThread(pContext);
			g_Operations.Add(pUpload);
			pUpload->BeginThread();
			*pOperationCode=(DWORD)pUpload;
			break;
		}
	case OPERATION_ERASE:
	case OPERATION_UPGRADE:
		{
			CDownloadThread* pDownload=new CDownloadThread(pContext);
			g_Operations.Add(pDownload);
			pDownload->BeginThread();
			*pOperationCode=(DWORD)pDownload;
			break;
		}
	case OPERATION_RETURN:
	case OPERATION_DETACH:
		{
			CDetachThread* pDetach=new CDetachThread(pContext);
			g_Operations.Add(pDetach);
			pDetach->BeginThread();
			*pOperationCode=(DWORD)pDetach;
			break;
		}
	default:
		dwRet=STDFUPRT_BADPARAMETER;
		break;
	}
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUPRT_GetOperationStatus(DWORD OperationCode, PDFUThreadContext pContext)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUPRT_NOERROR;

	for (int i=0;i<=g_Operations.GetUpperBound();i++)
	{
		if ((DWORD)g_Operations.GetAt(i)==OperationCode)
		{
			CDFUThread *pThread=(CDFUThread *)OperationCode;
			
			bFound=TRUE;
			pThread->GetCurrentContext(pContext);
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUPRT_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUPRT_StopOperation(DWORD OperationCode, PDFUThreadContext pLastContext)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUPRT_NOERROR;

	for (int i=0;i<=g_Operations.GetUpperBound();i++)
	{
		if ((DWORD)g_Operations.GetAt(i)==OperationCode)
		{
			CDFUThread *pThread=(CDFUThread *)OperationCode;

			bFound=TRUE;
			pThread->StopThread();
			if (pLastContext)
				pThread->GetCurrentContext(pLastContext);
			delete pThread;
			g_Operations.RemoveAt(i);
			break;
		}
	}
	if (!bFound)
		dwRet=STDFUPRT_BADPARAMETER;
	return dwRet;
}

#define SEPARATOR_ADDRESS_ALIASED '-'
#define SEPARATOR_ADDRESS '/'
#define SEPARATOR_NBSECTORS_SECTORSIZE '*'
#define SEPARATOR_BLOCKS ','

extern "C" DWORD PASCAL EXPORT STDFUPRT_CreateMappingFromDevice(PCHAR szDevLink, PMAPPING *ppMapping, PDWORD pNbAlternates)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	HANDLE hDle;
	DWORD Ret;
	DFU_FUNCTIONAL_DESCRIPTOR DfuDesc;
	UINT					  DfuInterfaceIdx;
	UINT					  NbOfAlternates;
	UINT i;
	PMAPPING				  pMap;
	USB_INTERFACE_DESCRIPTOR  ItfDesc;
	char					  MapDesc[512];

	Ret=STDFU_Open(szDevLink, &hDle);
	if (Ret==STDFU_NOERROR)
	{
		Ret=STDFU_GetDFUDescriptor(&hDle, &DfuInterfaceIdx, &NbOfAlternates, &DfuDesc);
		if (Ret==STDFU_NOERROR)
		{
			pMap=new MAPPING[NbOfAlternates+1];
			
			memset(pMap, 0, (NbOfAlternates+1)*sizeof(MAPPING));

			for (i=0;i<NbOfAlternates;i++)
			{
				Ret=STDFU_GetInterfaceDescriptor(&hDle, 0, DfuInterfaceIdx, i, &ItfDesc);
				if (Ret!=STDFU_NOERROR)
					break;
				
				if (ItfDesc.iInterface==0)
				{
					Ret=STDFUPRT_BADPARAMETER;
					break;
				}
				Ret=STDFU_GetStringDescriptor(&hDle, ItfDesc.iInterface, MapDesc, 512);
				if (Ret!=STDFU_NOERROR)
					break;
				
				if (MapDesc[0]!='@')
				{
					Ret=STDFUPRT_BADPARAMETER;
					break;
				}
				
				// From this stage we need to analyze the string
				
				// 1st analysis to get the quantity of sectors
				UINT	NbSectors=0, CurrentSector;
				PCHAR	pTmp1, pTmp2;
				DWORD   dwBaseAddress, dwAliasedAddress;

				pTmp1=strchr(MapDesc, SEPARATOR_ADDRESS);
				while ((pTmp1=strchr(pTmp1, SEPARATOR_NBSECTORS_SECTORSIZE))!=NULL)
				{
					pTmp2=pTmp1-1;
					while (isdigit(pTmp2[0]))
						pTmp2--;
					pTmp2++;
					pTmp1[0]='\0';

					NbSectors+=atoi(pTmp2);
					pTmp1[0]=SEPARATOR_NBSECTORS_SECTORSIZE;
					pTmp1=pTmp1+1;
				}
				
				if (NbSectors==0)
				{
					Ret=STDFUPRT_BADPARAMETER;
					break;
				}

				pMap[i].nAlternate=ItfDesc.bAlternateSetting;
				pTmp1=MapDesc+1;
				pTmp2=strchr(pTmp1, SEPARATOR_ADDRESS);
				pTmp2[0]='\0';
				lstrcpy(pMap[i].Name, pTmp1);
				pTmp2[0]=SEPARATOR_ADDRESS;
				pMap[i].NbSectors=NbSectors;
				pMap[i].pSectors=new MAPPINGSECTOR[NbSectors];

				CurrentSector=0;
				pTmp1=pTmp2;
				while (CurrentSector!=NbSectors)
				{
					char *dummy;
					if (*pTmp1=='\0') 
						break;
					pTmp1++;
					if (*pTmp1=='\0') 
						break;
					pTmp2=strchr(pTmp1, SEPARATOR_ADDRESS);
					if (pTmp2==NULL)
						break;
					pTmp2[0]='\0';
					dummy=strchr(pTmp1, SEPARATOR_ADDRESS_ALIASED);
					if (dummy==NULL)
					{
						pTmp2[0]='\0';
						dwBaseAddress=strtoul(pTmp1, &dummy, 16);
						dwAliasedAddress=dwBaseAddress;
						pTmp2[0]=SEPARATOR_BLOCKS;
						pTmp1=pTmp2;
					}
					else
					{
						pTmp2[0]='\0';
						dummy[0]='\0';
						dwBaseAddress=strtoul(pTmp1, &dummy, 16);
						dwAliasedAddress=strtoul(dummy+1, &pTmp1, 16);
						dummy[0]=SEPARATOR_ADDRESS_ALIASED;
						pTmp2[0]=SEPARATOR_BLOCKS;
						pTmp1=pTmp2;
					}
					while (pTmp1[0]==',')
					{
						DWORD dwSize, dwSectors;
						char SizeIndicator;

						pTmp1++;
						pTmp2=strchr(pTmp1, SEPARATOR_NBSECTORS_SECTORSIZE);
						if (pTmp2==NULL)
							break;
						pTmp2[0]='\0';
						dwSectors=atoi(pTmp1);
						pTmp2[0]=SEPARATOR_NBSECTORS_SECTORSIZE;
						pTmp1=pTmp2+1;
						pTmp2=pTmp1;
						while (isdigit(pTmp2[0]))
							pTmp2++;
						SizeIndicator=pTmp2[0];
						pTmp2[0]='\0';
						dwSize=atoi(pTmp1);
						pTmp2[0]=SizeIndicator;

						if (SizeIndicator=='K')
							dwSize*=1024;
						else
						if (SizeIndicator=='M')
							dwSize*=1024*1024;
						
						while (dwSectors)
						{
							pMap[i].pSectors[CurrentSector].dwStartAddress=dwBaseAddress;
							pMap[i].pSectors[CurrentSector].dwAliasedAddress=dwAliasedAddress;
							pMap[i].pSectors[CurrentSector].dwSectorIndex=CurrentSector;
							pMap[i].pSectors[CurrentSector].dwSectorSize=dwSize;
							pMap[i].pSectors[CurrentSector].UseForOperation=TRUE;
							pMap[i].pSectors[CurrentSector].bSectorType=pTmp2[1];
							dwBaseAddress+=dwSize;
							dwAliasedAddress+=dwSize;
							dwSectors--;
							CurrentSector++;
						}
						pTmp1=pTmp2+2;
					}
				}
			}

			if (Ret==STDFU_NOERROR)
			{
				*ppMapping=pMap;
				*pNbAlternates=NbOfAlternates;
			}
			else
				delete[] pMap;
		}
		STDFU_Close(&hDle);
	}
	return Ret;
}

extern "C" DWORD PASCAL EXPORT STDFUPRT_DestroyMapping(PMAPPING *ppMapping)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	DWORD Ret=STDFU_BADPARAMETER;
	PMAPPING pMap;
	UINT i;

	if ( (ppMapping) && (*ppMapping) )
	{
		pMap=*ppMapping;
		i=0;

		while (pMap[i].pSectors!=NULL)
		{
			delete[] pMap[i].pSectors;
			i++;
		}
		delete[]pMap;
		*ppMapping=NULL;
	}

	return Ret;
}

