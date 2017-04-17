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

// STDFUFILES.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "STDFUFILES.h"
#include "../STDFUPRT/STDFUPRTINC.h"
#include "STDFUFILESINC.h"
#include "../STDFUPRT/image.h"
#include "DFUFILE.h"

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
// CSTDFUFILESApp

BEGIN_MESSAGE_MAP(CSTDFUFILESApp, CWinApp)
	//{{AFX_MSG_MAP(CSTDFUFILESApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

CObArray g_Images;
CObArray g_DFUFiles;
/////////////////////////////////////////////////////////////////////////////
// CSTDFUFILESApp construction

CSTDFUFILESApp::CSTDFUFILESApp()
{
}

int CSTDFUFILESApp::ExitInstance() 
{
	int i;
	for (i=0;i<=g_Images.GetUpperBound();i++)
	{
		CImage *pImage=(CImage*)g_Images.GetAt(i);

		delete pImage;
	}
	g_Images.RemoveAll();
	for (i=0;i<=g_DFUFiles.GetUpperBound();i++)
	{
		CDFUFile *pFile=(CDFUFile*)g_DFUFiles.GetAt(i);
		delete pFile;
	}
	g_DFUFiles.RemoveAll();
	return CWinApp::ExitInstance();
}
/////////////////////////////////////////////////////////////////////////////
// The one and only CSTDFUFILESApp object

CSTDFUFILESApp theApp;

extern "C" DWORD PASCAL EXPORT STDFUFILES_OpenExistingDFUFile(PSTR pPathFile, 
															  PHANDLE phFile, 
															  PWORD pVid, 
															  PWORD pPid, 
															  PWORD pBcd,
															  PBYTE pNbImages)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	DWORD dwRet;
	CDFUFile *pDfuFile;
	
	pDfuFile=new CDFUFile(pPathFile, CFile::modeRead);

	dwRet=pDfuFile->GetError();

	if (dwRet==STDFUPRT_NOERROR)
	{
		if (pVid)
			*pVid=pDfuFile->GetVid();
		if (pPid)
			*pPid=pDfuFile->GetPid();
		if (pBcd)
			*pBcd=pDfuFile->GetBcd();
		if (pNbImages)
			*pNbImages=pDfuFile->GetNbAlternates();
		*phFile=(PHANDLE)pDfuFile;
		g_DFUFiles.Add(pDfuFile);
	}
	else
		delete pDfuFile;

	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_CreateNewDFUFile(PSTR pPathFile,
						                                 PHANDLE phFile, 
														 WORD Vid,
														 WORD Pid,
														 WORD Bcd)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	
	DWORD dwRet;
	CDFUFile *pDfuFile;
	
	pDfuFile=new CDFUFile(pPathFile, CFile::modeCreate | CFile::modeReadWrite, Vid, Pid, Bcd);

	dwRet=pDfuFile->GetError();

	if (dwRet==STDFUPRT_NOERROR)
	{
		*phFile=(PHANDLE)pDfuFile;
		g_DFUFiles.Add(pDfuFile);
	}
	else
		delete pDfuFile;

	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_CloseDFUFile(HANDLE hFile)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUPRT_NOERROR;

	for (int i=0;i<=g_DFUFiles.GetUpperBound();i++)
	{
		if ((HANDLE)g_DFUFiles.GetAt(i)==hFile)
		{
			CDFUFile *pFile=(CDFUFile *)hFile;
			delete pFile;
			g_DFUFiles.RemoveAt(i);
			bFound=TRUE;
			break;
		}
	}
	if (!bFound)
		dwRet=STDFUPRT_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_AppendImageToDFUFile(HANDLE hFile, HANDLE Image)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUPRT_NOERROR;

	for (int i=0;i<=g_DFUFiles.GetUpperBound();i++)
	{
		if ((HANDLE)g_DFUFiles.GetAt(i)==hFile)
		{
			CDFUFile *pFile=(CDFUFile *)hFile;

			dwRet=pFile->AppendImage(Image);

			bFound=TRUE;
			break;
		}
	}
	if (!bFound)
		dwRet=STDFUPRT_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_ReadImageFromDFUFile(HANDLE hFile, 
															 int Rank, 
															 PHANDLE pImage)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUPRT_NOERROR;

	for (int i=0;i<=g_DFUFiles.GetUpperBound();i++)
	{
		if ((HANDLE)g_DFUFiles.GetAt(i)==hFile)
		{
			CDFUFile *pFile=(CDFUFile *)hFile;

			dwRet=pFile->ReadImage(Rank, pImage);

			if (dwRet==STDFUFILES_NOERROR) 
				g_Images.Add((CImage*)*pImage);
	
			bFound=TRUE;
			break;
		}
	}
	if (!bFound)
		dwRet=STDFUPRT_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_CreateImage(PHANDLE pHandle, BYTE nAlternate)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	DWORD Ret=STDFUFILES_BADPARAMETER;

	CImage *pImage=new CImage(nAlternate, FALSE, NULL);
	if (pImage)
	{
		g_Images.Add(pImage);
		*pHandle=(HANDLE)pImage;
		Ret=STDFUFILES_NOERROR;
	}
	return Ret;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_CreateImageFromMapping(PHANDLE pHandle, PMAPPING pMapping)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	DWORD Ret=STDFUFILES_BADPARAMETER;

	CImage *pImage=new CImage(pMapping, FALSE, NULL);
	if (pImage)
	{
		g_Images.Add(pImage);
		*pHandle=(HANDLE)pImage;
		Ret=STDFUFILES_NOERROR;
	}
	return Ret;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_DuplicateImage(HANDLE hSource, PHANDLE pDest)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	
	DWORD dwRet=STDFUFILES_NOERROR;
	BOOL bFound=FALSE;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==hSource)
		{
			bFound=TRUE;
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUPRT_BADPARAMETER;
	else
	{
		CImage *obImage=new CImage((CImage*)hSource);
		if (obImage->GetImageState())
		{
			g_Images.Add(obImage);
			*pDest=(HANDLE)obImage;
		}
		else
		{
			delete obImage;
			dwRet=STDFUFILES_BADFORMAT;
		}
	}
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_GetImageNbElement(HANDLE Handle, PDWORD pNbElements)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Handle)
		{
			CImage *pImage=(CImage *)Handle;
			
			bFound=TRUE;
			*pNbElements=pImage->GetNbElements();
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_SetImageElement(HANDLE Handle, DWORD dwRank, BOOL bInsert, DFUIMAGEELEMENT Element)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Handle)
		{
			CImage *pImage=(CImage *)Handle;
			
			bFound=pImage->SetImageElement(dwRank, bInsert, Element);
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_GetImageElement(HANDLE Handle, DWORD dwRank, PDFUIMAGEELEMENT pElement)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Handle)
		{
			CImage *pImage=(CImage *)Handle;
			
			bFound=pImage->GetImageElement(dwRank, pElement);
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_FilterImageForOperation(HANDLE Handle, PMAPPING pMapping, DWORD Operation, BOOL bTruncateLeadFFForUpgrade)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	if (!pMapping)
		return STDFUFILES_BADPARAMETER;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Handle)
		{
			CImage *pImage=(CImage *)Handle;
			
			bFound=pImage->FilterImageForOperation(pMapping, Operation, bTruncateLeadFFForUpgrade);
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_DestroyImageElement(HANDLE Handle, DWORD dwRank)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Handle)
		{
			CImage *pImage=(CImage *)Handle;
			
			bFound=pImage->DestroyImageElement(dwRank);
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_DestroyImage(PHANDLE pHandle)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==*pHandle)
		{
			CImage *pImage=(CImage *)(*pHandle);
			
			delete pImage;
			*pHandle=0;
			bFound=TRUE;
			g_Images.RemoveAt(i);
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}


extern "C" DWORD PASCAL EXPORT STDFUFILES_ImageFromFile(PSTR pPathFile, PHANDLE pImage, BYTE nAlternate)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	
	DWORD Ret=STDFUFILES_BADPARAMETER;

	CImage *obImage=new CImage(nAlternate, pPathFile, FALSE, NULL);
	if (obImage)
	{
		if (obImage->GetImageState())
		{
			g_Images.Add(obImage);
			*pImage=(HANDLE)obImage;
			Ret=STDFUFILES_NOERROR;
		}
		else
		{
			delete obImage;
			Ret=STDFUFILES_BADFORMAT;
		}
	}
	return Ret;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_ImageToFile(PSTR pPathFile, HANDLE Image)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Image)
		{
			CImage *pImage=(CImage *)(Image);
			
			if (!pImage->DumpToFile(pPathFile)) 
				dwRet=STDFUFILES_BADPARAMETER;
			bFound=TRUE;
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_GetImageAlternate(HANDLE Image, PBYTE pAlternate)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Image)
		{
			CImage *pImage=(CImage *)(Image);
			
			*pAlternate=pImage->GetAlternate();
			bFound=TRUE;
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_GetImageName(HANDLE Image, PSTR Name)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Image)
		{
			CImage *pImage=(CImage *)(Image);
			
			if (!pImage->GetName(Name))
				lstrcpy(Name, "");
			bFound=TRUE;
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_SetImageName(HANDLE Image, PSTR Name)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	BOOL bFound=FALSE;
	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Image)
		{
			CImage *pImage=(CImage *)(Image);
			
			pImage->SetName(Name);
			bFound=TRUE;
			break;
		}
	}

	if (!bFound)
		dwRet=STDFUFILES_BADPARAMETER;
	return dwRet;
}

extern "C" DWORD PASCAL EXPORT STDFUFILES_GetImageSize(HANDLE Image)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	DWORD dwRet=STDFUFILES_NOERROR;

	for (int i=0;i<=g_Images.GetUpperBound();i++)
	{
		if ((HANDLE)g_Images.GetAt(i)==Image)
		{
			CImage *pImage=(CImage *)Image;
			
			return pImage->GetSize(); 
			break;
		}
	}
}
