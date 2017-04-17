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

#ifndef _IMAGE_H_
#define _IMAGE_H_

class CImage : public CObject 
{
private:
	char		m_LastError[1000];
	BYTE		m_bAlternate;
	CPtrArray	*m_pElements;
	BOOL		m_ImageState;
	BOOL		m_bNamed;
	char		m_Name[255];

	BOOL		LoadS19(PSTR pFilePath);
	BOOL		LoadHEX(PSTR pFilePath);

	BOOL		SaveS19(PSTR pFilePath);
	BOOL		SaveHEX(PSTR pFilePath);

	void		LDisplayError(PSTR Str) { lstrcpy(m_LastError, Str); }
	BOOL        ExistsElementsAtAddress(DWORD Address);
	
	void		CompactElements();
public:
	
	CImage(CImage *pSource);
	CImage(BYTE bAlternate, BOOL bNamed, PSTR Name);
	CImage(PMAPPING pMapping, BOOL bNamed, PSTR Name);
	CImage(BYTE bAlternate, PSTR pFilePath, BOOL bNamed, PSTR Name);
	virtual ~CImage();

	BOOL	DumpToFile(PSTR pFilePath);
	BYTE	GetAlternate() { return m_bAlternate; }
	BOOL	GetImageState() { return m_ImageState; }
	BOOL	GetName(PSTR Name) { if (m_bNamed) lstrcpy(Name, m_Name); return m_bNamed; } 
	void    SetName(PSTR Name) { lstrcpy(m_Name, Name); m_bNamed=TRUE; }
	BOOL	GetBuffer(DWORD dwAddress, DWORD dwSize, PBYTE pBuffer);

	DWORD	GetNbElements() { return m_pElements->GetSize(); }
	BOOL	SetImageElement(DWORD dwRank, BOOL bInsert, DFUIMAGEELEMENT Element);
	BOOL	GetImageElement(DWORD dwRank, PDFUIMAGEELEMENT pElement);
	BOOL	FilterImageForOperation(PMAPPING pMapping, DWORD Operation, BOOL bTruncateLeadFF);
	BOOL	DestroyImageElement(DWORD dwRank);
	DWORD   GetSize();
};

#endif
