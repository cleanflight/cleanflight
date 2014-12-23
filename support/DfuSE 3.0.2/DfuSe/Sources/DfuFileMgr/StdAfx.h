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

// stdafx.h : include file for standard system include files,
//  or project specific include files that are used frequently, but
//      are changed infrequently
//

#if !defined(AFX_STDAFX_H__B7B71B45_E7A3_4701_A107_259EE96F0381__INCLUDED_)
#define AFX_STDAFX_H__B7B71B45_E7A3_4701_A107_259EE96F0381__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define VC_EXTRALEAN		// Exclude rarely-used stuff from Windows headers

#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>			// MFC support for Windows Common Controls
#endif // _AFX_NO_AFXCMN_SUPPORT

#include "..\Include\usb100.h"
#include "..\STDFU\STDFU.h"
#include "..\STDFUPRT\STDFUPRTINC.h"
#include "..\STDFUFILES\STDFUFILESINC.h"
#include "HexEdit.h"

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STDAFX_H__B7B71B45_E7A3_4701_A107_259EE96F0381__INCLUDED_)
