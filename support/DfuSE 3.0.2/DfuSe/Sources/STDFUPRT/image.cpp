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


#include "stdafx.h"
#include "stdfuprtinc.h"
#include "image.h"
#include <stdio.h>

CImage::CImage(BYTE bAlternate, BOOL bNamed, PSTR Name) 
{
	m_bAlternate=bAlternate;
	m_ImageState=TRUE;
	m_pElements=new CPtrArray();
	m_bNamed=bNamed;
	if (bNamed)
		lstrcpy(m_Name, Name);
}

CImage::CImage(CImage *pSource)
{
	int i;

	m_bAlternate=pSource->m_bAlternate;
	m_ImageState=pSource->m_ImageState;
	strcpy(m_LastError, pSource->m_LastError);
	m_bNamed=pSource->m_bNamed;
	if (m_bNamed)
		lstrcpy(m_Name, pSource->m_Name);

	m_pElements=new CPtrArray();
	for (i=0;i<pSource->m_pElements->GetSize();i++)
	{
		PDFUIMAGEELEMENT pElementSource, pElementDest;

		pElementSource=(PDFUIMAGEELEMENT)pSource->m_pElements->GetAt(i);

		pElementDest=new DFUIMAGEELEMENT;
		pElementDest->dwAddress=pElementSource->dwAddress;
		pElementDest->dwDataLength=pElementSource->dwDataLength;
		pElementDest->Data=(PBYTE)malloc(pElementDest->dwDataLength);
		memcpy(pElementDest->Data, pElementSource->Data, pElementDest->dwDataLength);
		m_pElements->Add(pElementDest);
	}
}

CImage::CImage(PMAPPING pMapping, BOOL bNamed, PSTR Name)
{
	// We need to handle each sector in mapping
	DWORD sec;

	m_bAlternate=pMapping->nAlternate;
	m_pElements=new CPtrArray();
	for (sec=0;sec<pMapping->NbSectors;sec++)
	{
		PMAPPINGSECTOR pSector=(PMAPPINGSECTOR)&pMapping->pSectors[sec];
		if (!pSector->UseForOperation)
			continue;
		PDFUIMAGEELEMENT pNewElement=new DFUIMAGEELEMENT;

		pNewElement->dwAddress=pSector->dwStartAddress;
		pNewElement->dwDataLength=pSector->dwSectorSize;
		// Allocate the memory for the data but leave it uninitialized
		pNewElement->Data=(PBYTE)malloc(pNewElement->dwDataLength);
		memset(pNewElement->Data, 0xFF, pNewElement->dwDataLength);
		m_pElements->Add(pNewElement);
	}
	m_ImageState=TRUE;
	m_bNamed=bNamed;
	if (bNamed)
		lstrcpy(m_Name, Name);
}

CImage::CImage(BYTE bAlternate, PSTR pFilePath, BOOL bNamed, PSTR Name)
{

	char Drive[3], Dir[256], Fname[256], Ext[256];
	char *ptr;
	BOOL bRet=FALSE;

	m_bAlternate=bAlternate;
	m_ImageState=TRUE;
	m_pElements=new CPtrArray();

	_splitpath(pFilePath,Drive,Dir,Fname,Ext);
	ptr=strupr(Ext);
	strcpy(Ext, ptr);

	if (strcmp(Ext, ".S19")==0)
		bRet=LoadS19(pFilePath);
	else
	if (strcmp(Ext, ".HEX")==0)
		bRet=LoadHEX(pFilePath);

	m_ImageState=bRet;
	m_bNamed=bNamed;
	if (bNamed)
		lstrcpy(m_Name, Name);
}

BOOL CImage::DumpToFile(PSTR pFilePath)
{
	char Drive[3], Dir[256], Fname[256], Ext[256];
	char *ptr;
	BOOL bRet=FALSE;

	if (!m_ImageState)
		return FALSE;

	_splitpath(pFilePath,Drive,Dir,Fname,Ext);
	ptr=strupr(Ext);
	strcpy(Ext, ptr);

	if (strcmp(Ext, ".S19")==0)
		bRet=SaveS19(pFilePath);
	else
	if (strcmp(Ext, ".HEX")==0)
		bRet=SaveHEX(pFilePath);

	return bRet;
}

BOOL CImage::LoadS19(PSTR pFilePath)
{
	DFUIMAGEELEMENT Element, *pPrevElement;
	BOOL bRet=TRUE;
	FILE *fp;
	BOOL bConcatenate;

	fp=fopen(pFilePath, "r");
	if (!fp)
		bRet=FALSE;
	else
	{
		char message[100];
		unsigned long address,                                 /* address from file */
					  target_address,                     /* address of array index */
					  checksum,                          /* line checksum from file */
					  sum_var;							   /* to calculate checksum */
		unsigned char i,										   /* counter index */
					  byte_count,                         /* bytes per line in file */
					  last_byte,                                  /* convertion end */
					  character;                                  /* data from file */

		char header[3];                                /* header from file */
		unsigned short lineno=1;                             // count number of line
		static unsigned long global_sum;					// checksum of the file data

		last_byte = FALSE;                                  /* conversion begin */
		global_sum =0;
		byte_count = 0;

		do 
		{
			sum_var = 0;							/* Line checksum calculation reset */
			address = 0;

			fscanf(fp,"%1c",&header);
			if (feof(fp))  
			{ // Detect End Of File & Exit if S9 or S8 or S7 record not found
				last_byte = TRUE;
			}
			else if (header[0] == 'S') 
			{
				fscanf(fp,"%1c",&header[1]);
				header[2]='\0';							/* Append null char. at end of header for strcmp */

				if (strcmp(header,"S0")==0) {
					fscanf(fp,"%2x",&byte_count);       /* Nber of Bytes */
					for (i=0; i < byte_count; i++)
						fscanf(fp,"%2x",&character);    /* Read data */
				}
				else if (strcmp(header,"S1")==0) {
					fscanf(fp,"%2x",&byte_count);       /* Nber of Bytes */
					sum_var += byte_count;
					fscanf(fp,"%4x",&address);          /* Starting address */
					target_address = address;
					sum_var += (address >> 8) + (address % 256);

					Element.dwAddress=target_address;
					Element.dwDataLength=byte_count-3;
					Element.Data=(PBYTE)malloc(Element.dwDataLength);
					for (i=0; i < (byte_count-3); i++) { // -3 because it is 2 adress bytes and 1 checksum byte 
						fscanf(fp,"%2x",&character);	/* Read data */
						sum_var += character;
						global_sum += character;
						
						Element.Data[i] = character;
					}
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var +1) % 256) != 0) {
						free(Element.Data);
						wsprintf(message, "FILE : line %i: Checksum error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					// The Element is correct. Check if this element is contiguous with this one. In this case we'll not
					// create a new element but concatenate data
					bConcatenate=FALSE;
					if (GetNbElements()!=0)
					{
						pPrevElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(GetNbElements()-1);
						if (pPrevElement->dwAddress+pPrevElement->dwDataLength==Element.dwAddress)
							bConcatenate=TRUE;
						else
							bConcatenate=FALSE;
					}
					if (!bConcatenate)
						SetImageElement(GetNbElements(), TRUE, Element);
					else
					{
						pPrevElement->Data=(PBYTE)realloc(pPrevElement->Data, pPrevElement->dwDataLength+Element.dwDataLength);
						memcpy(pPrevElement->Data+pPrevElement->dwDataLength, Element.Data, Element.dwDataLength);
						pPrevElement->dwDataLength=pPrevElement->dwDataLength+Element.dwDataLength;
					}
					free(Element.Data);
				}
				else if (strcmp(header,"S2")==0) {
					fscanf(fp,"%2x",&byte_count);        /* Nber of Bytes */
					sum_var += byte_count;
					fscanf(fp,"%6lx",&address);          /* Starting address */
					target_address = address;
					sum_var += ((address>>16)%256) + ((address>>8)%256) + (address % 256);

					Element.dwAddress=target_address;
					Element.dwDataLength=byte_count-4;
					Element.Data=(PBYTE)malloc(Element.dwDataLength);
					for (i=0; i < (byte_count-4); i++) { // -4 because it is 3 adress bytes and 1 checksum byte
						fscanf(fp,"%2x",&character);              /*Read data */
						sum_var += character;
						global_sum += character;

						Element.Data[i] = character;
					}
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var +1) % 256) != 0) {
						free(Element.Data);
						wsprintf(message, "FILE : line %i: Checksum error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					// The Element is correct. Check if this element is contiguous with this one. In this case we'll not
					// create a new element but concatenate data
					bConcatenate=FALSE;
					if (GetNbElements()!=0)
					{
						pPrevElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(GetNbElements()-1);
						if (pPrevElement->dwAddress+pPrevElement->dwDataLength==Element.dwAddress)
							bConcatenate=TRUE;
						else
							bConcatenate=FALSE;
					}
					if (!bConcatenate)
						SetImageElement(GetNbElements(), TRUE, Element);
					else
					{
						pPrevElement->Data=(PBYTE)realloc(pPrevElement->Data, pPrevElement->dwDataLength+Element.dwDataLength);
						memcpy(pPrevElement->Data+pPrevElement->dwDataLength, Element.Data, Element.dwDataLength);
						pPrevElement->dwDataLength=pPrevElement->dwDataLength+Element.dwDataLength;
					}
					free(Element.Data);
				}
				else if (strcmp(header,"S3")==0) {
					fscanf(fp,"%2x",&byte_count);           /* Nber of Bytes */
					sum_var += byte_count;
					fscanf(fp,"%8lx",&address);          /* Starting address */
					target_address = address;
					sum_var += ((address>>24)%256) + ((address>>16)%256) + ((address>>8)%256) + (address % 256);

					Element.dwAddress=target_address;
					Element.dwDataLength=byte_count-5;
					Element.Data=(PBYTE)malloc(Element.dwDataLength);
					for (i=0; i < (byte_count-5); i++) { // -5 because it is 4 adress bytes and 1 checksum byte
						fscanf(fp,"%2x",&character);              /* Read data */
						sum_var += character;
						global_sum += character;
						Element.Data[i] = character;
					}
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var +1) % 256) != 0) {
						free(Element.Data);
						wsprintf(message, "FILE : line %i: Checksum error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					// The Element is correct. Check if this element is contiguous with this one. In this case we'll not
					// create a new element but concatenate data
					bConcatenate=FALSE;
					if (GetNbElements()!=0)
					{
						pPrevElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(GetNbElements()-1);
						if (pPrevElement->dwAddress+pPrevElement->dwDataLength==Element.dwAddress)
							bConcatenate=TRUE;
						else
							bConcatenate=FALSE;
					}
					if (!bConcatenate)
						SetImageElement(GetNbElements(), TRUE, Element);
					else
					{
						pPrevElement->Data=(PBYTE)realloc(pPrevElement->Data, pPrevElement->dwDataLength+Element.dwDataLength);
						memcpy(pPrevElement->Data+pPrevElement->dwDataLength, Element.Data, Element.dwDataLength);
						pPrevElement->dwDataLength=pPrevElement->dwDataLength+Element.dwDataLength;
					}
					free(Element.Data);
				}
				else if (strcmp(header,"S5")==0) { // S5 header for number of previous Sx lines
					fscanf(fp,"%2x",&byte_count);
					sum_var += byte_count;
					if (byte_count == 3) {         // S5 must have 3 bytes (2 data & chk)
						fscanf(fp,"%4x",&address); // Data is not address but number of Sx lines
						sum_var += (address >> 8) + (address % 256); // read data for chk computation
					}
					else {
						wsprintf(message, "FILE : line %i: S5 line 'byte count' error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var +1) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Checksum error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else if (strcmp(header,"S7")==0) {
					last_byte = TRUE;
					fscanf(fp,"%2x",&byte_count);
					sum_var += byte_count;
					if (byte_count == 5) {
						fscanf(fp,"%8x",&address);
						sum_var += ((address>>24)%256) + ((address>>16)%256) \
								 + ((address>>8)%256) + (address % 256);
					}
					else {
						wsprintf(message, "FILE : line %i: S7 line 'byte count' error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var +1) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Checksum error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else if (strcmp(header,"S8")==0) {
					last_byte = TRUE;
					fscanf(fp,"%2x",&byte_count);
					sum_var += byte_count;
					if (byte_count == 4) {
						fscanf(fp,"%6lx",&address);
						sum_var += ((address>>16)%256) + ((address>>8)%256) + (address % 256);
					}
					else {
						wsprintf(message, "FILE : line %i: S8 line 'byte count' error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var +1) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Checksum error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else if (strcmp(header,"S9")==0) {
					last_byte = TRUE;
					fscanf(fp,"%2x",&byte_count);
					sum_var += byte_count;
					if (byte_count == 3) { // The right format is this one S903xxxxChk
						fscanf(fp,"%4x",&address);
						sum_var += (address >> 8) + (address % 256);
					}
					else if (byte_count == 4) { // Normally not the right format but can be found
						fscanf(fp,"%6lx",&address);
						sum_var += ((address>>16)%256) + ((address>>8)%256) + (address % 256);
					}
					else {
						wsprintf(message, "FILE : line %i: S9 line 'byte count' error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var +1) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Checksum error!",lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else { // Not a s19 known file header detected in line
					wsprintf(message, "FILE : line %i: Not in Motorola S19 format!", lineno);
					LDisplayError(message);
					bRet=FALSE;
					break;
				}
			}
			else if (header[0] == '\r' || header[0] == '\n') { // Skip CR:0x0D & LF:0x0A Characters
				lineno++; // increase line number only after CR LF
				if (feof(fp))  { // Detect End Of File & Exit if S9 or S8 or S7 record not found
					last_byte = TRUE;
				}
			}
			else if (header[0] == ' ') { // Skip Space ' ' Characters
				if (feof(fp))  { // Detect End Of File & Exit
					last_byte = TRUE;
				}
			}
			else {
				wsprintf(message, "FILE : line %i: Not in Motorola S19 format!", lineno);
				LDisplayError(message);
				bRet=FALSE;
				break;
			}
		}
		while (!last_byte);
		fclose(fp);
	}
	if (bRet)
		CompactElements();
	return bRet;
}

BOOL CImage::LoadHEX(PSTR pFilePath)
{
	DFUIMAGEELEMENT Element, *pPrevElement;
	BOOL bRet=TRUE;
	FILE *fp;
	BOOL bConcatenate;

	fp=fopen(pFilePath, "r");
	if (!fp)
		bRet=FALSE;
	else
	{
		unsigned long target_address,                 /* address of array index */
					  base_address=0,
					  extended_address=0,
					  address,                        /* offset/address from hexfile */
					  i,                              /* counterindex */
					  checksum,                       /* checksum from hexfile */
					  sum_var;                        /* to calculate checksum */
		unsigned char byte_count,                     /* bytes per line in hexfile */
					  separator,                      /* separator string in hexfile */
					  last_byte,                      /* convertion end */
					  character,                      /* date from hexfile */
					  colon;                          /* begin of line in hexfile */
		unsigned short lineno=1;
		char message[100];		// error message

		last_byte = FALSE;						  /* conversion begin */

		do {
			sum_var = 0;                          /* checksum calculation begin */
			fscanf(fp,"%1c",&colon);
			if (feof(fp))  { // Detect End Of File & Exit if S9 or S8 or S7 record not found
				last_byte = TRUE;
			}
			else if (colon == ':') {                   /* do only if intel hexfile */
				fscanf(fp,"%2x",&byte_count);
				sum_var += byte_count;
				fscanf(fp,"%4x",&address);
				fscanf(fp,"%2x",&separator);

				if (separator==0x00)
				{
					target_address = (extended_address<<16) + (base_address<<4) + address;
					sum_var = sum_var + (address >> 8) + (address % 256);
					Element.dwAddress=target_address;
					Element.dwDataLength=byte_count;
					Element.Data=(PBYTE)malloc(Element.dwDataLength);
					for (i=0; i < byte_count; i++) {
						fscanf(fp,"%2x",&character);
						sum_var += character;
						Element.Data[i] = character;
					}
					sum_var += separator;
					fscanf(fp,"%2x",&checksum);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						free(Element.Data);
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					// The Element is correct. Check if this element is contiguous with this one. In this case we'll not
					// create a new element but concatenate data
					bConcatenate=FALSE;
					if (GetNbElements()!=0)
					{
						pPrevElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(GetNbElements()-1);
						if (pPrevElement->dwAddress+pPrevElement->dwDataLength==Element.dwAddress)
							bConcatenate=TRUE;
						else
							bConcatenate=FALSE;
					}
					if (!bConcatenate)
						SetImageElement(GetNbElements(), TRUE, Element);
					else
					{
						pPrevElement->Data=(PBYTE)realloc(pPrevElement->Data, pPrevElement->dwDataLength+Element.dwDataLength);
						memcpy(pPrevElement->Data+pPrevElement->dwDataLength, Element.Data, Element.dwDataLength);
						pPrevElement->dwDataLength=pPrevElement->dwDataLength+Element.dwDataLength;
					}
					free(Element.Data);
				}
				else
				if (separator==0x01)
				{
					sum_var = sum_var + (address >> 8) + (address % 256) + separator;
					sum_var = (sum_var % 256);
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
					else {
						last_byte = TRUE;         /* eof */
					}
				}
				else
				if (separator==0x02)
				{
					fscanf(fp,"%4x",&base_address);
					fscanf(fp,"%2x",&checksum);
					sum_var = sum_var + (address >> 8) + (address % 256) + separator \
									  + (base_address >> 8) + (base_address % 256);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else
				if (separator==0x03)
				{
					sum_var = sum_var + (address >> 8) + (address % 256) + separator;
					for (i=0; i < byte_count; i++) {
						fscanf(fp,"%2x",&character);
						sum_var += character;
					}
					fscanf(fp,"%2x",&checksum);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else
				if (separator==0x04)
				{
					fscanf(fp,"%4x",&extended_address);
					fscanf(fp,"%2x",&checksum);
					sum_var = sum_var + (address >> 8) + (address % 256) + separator \
							 + (extended_address >> 8) + (extended_address % 256);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else
				if (separator==0x05)
				{
					sum_var = sum_var + (address >> 8) + (address % 256) + separator;
					for (i=0; i < byte_count; i++) {
						fscanf(fp,"%2x",&character);
						sum_var += character;
					}
					fscanf(fp,"%2x",&checksum);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						bRet=FALSE;
						break;
					}
				}
				else
				{
					wsprintf(message, "FILE : line %i: Not in Intel Hex format!", lineno);
					LDisplayError(message);
					bRet=FALSE;
					break;
				}
			}
			else if ((colon == '\r') || (colon == '\n')) { // Skip CR:0x0D & LF:0x0A Characters
				lineno++; // increment number of line
				if (feof(fp))  { // Detect End Of File & Exit if last record not found
					last_byte = TRUE;         /* eof */
				}
			}
			else if (colon == ' ') { // Skip Space ' ' Characters
				if (feof(fp))  { // Detect End Of File & Exit if last record not found
					last_byte = TRUE;         /* eof */
				}
			}
			else {
				wsprintf(message, "FILE : line %i: Not in Intel Hex format!", lineno);
				LDisplayError(message);
				bRet=FALSE;
				break;
			}
		}
		while (!last_byte);

		fclose(fp);
	}
	if (bRet)
		CompactElements();
	return bRet;
}

BOOL CImage::SaveS19(PSTR pFilePath)
{
	DFUIMAGEELEMENT Element;
	BOOL bRet=TRUE;
	FILE *fp;
	DWORD i;
	DWORD MaxAreaAddress=0;
	char *LastLine[] = {"S9030000FC\n", "S804000000FB\n", "S70500000000FA\n"};

	// first, check the maximum address, in order to know which Sx we will use
	for (i=0;i<GetNbElements();i++)
	{
		memset(&Element, 0, sizeof(Element));
		if (GetImageElement(i, &Element))
			MaxAreaAddress=max(MaxAreaAddress, Element.dwAddress+Element.dwDataLength-1);
	}
	
	fp=fopen(pFilePath, "w");
	if (!fp)
		bRet=FALSE;
	else
	{
		for (i=0;i<GetNbElements();i++)
		{
			unsigned long first;
			unsigned long last;
			char record[80], buffer[8];
			unsigned long k,length;
			BYTE chk_sum;

			memset(&Element, 0, sizeof(Element));
			if (!GetImageElement(i, &Element))
				continue;
			Element.Data=(PBYTE)malloc(Element.dwDataLength);
			if (!GetImageElement(i, &Element))
			{
				free(Element.Data);
				continue;
			}

			first=Element.dwAddress;
			last=first+Element.dwDataLength-1;
			while (first <= last) {
				length =  last - first + 1;
				if (length > 32)
					length = 32;

				if (MaxAreaAddress > (unsigned long)0xFFFFFF) {
					wsprintf(record, "S3%02X%08X", (unsigned short)length+5, (unsigned long)first);
					chk_sum = (BYTE) length + 5;
					chk_sum+= (BYTE)((first>>24)%256) + (BYTE)((first>>16)%256) + \
							  (BYTE)((first>>8)%256) + (BYTE)(first%256);
				}
				else if (MaxAreaAddress > (unsigned long)0xFFFF) {
					wsprintf(record, "S2%02X%06X", (unsigned short)length+4, (unsigned long)first);
					chk_sum = (BYTE) length + 4;
					chk_sum += (BYTE)((first>>16)%256) + (BYTE)((first>>8)%256) + (BYTE)(first%256);
				}
				else {
					wsprintf(record, "S1%02X%04X", (unsigned short)length+3, (unsigned short)first);
					chk_sum =  (BYTE) length + 3;
					chk_sum += (BYTE)((first>>8)%256) + (BYTE)(first%256);
				}

				for (k=0; k < length; k++) {
					wsprintf(buffer, "%02X", Element.Data[first-Element.dwAddress+k]);
					strcat(record,buffer);
					chk_sum += Element.Data[first-Element.dwAddress+k];
				}
				chk_sum = ~(chk_sum & 0xff);                // two's complement
				wsprintf(buffer, "%02X\n", chk_sum);
				strcat(record,buffer);
				fprintf(fp, record);                        //  writes to file
				first += length;
			}
			free(Element.Data);
		}	
		if (MaxAreaAddress > (unsigned long)0xFFFFFF) {
			fprintf(fp,LastLine[2]);
		}
		else if (MaxAreaAddress > (unsigned long)0xFFFF) 
			fprintf(fp,LastLine[1]);
		else
			fprintf(fp,LastLine[0]);
		fclose(fp);
	}
	return bRet;
}

BOOL CImage::SaveHEX(PSTR pFilePath)
{
	DFUIMAGEELEMENT Element;
	BOOL bRet=TRUE;
	FILE *fp;
	DWORD i;
	DWORD MaxAreaAddress=0;

	// first, check the maximum address, in order to know which Sx we will use
	for (i=0;i<GetNbElements();i++)
	{
		memset(&Element, 0, sizeof(Element));
		if (GetImageElement(i, &Element))
			MaxAreaAddress=max(MaxAreaAddress, Element.dwAddress+Element.dwDataLength-1);
	}
	
	fp=fopen(pFilePath, "w");
	if (!fp)
		bRet=FALSE;
	else
	{
		for (i=0;i<GetNbElements();i++)
		{
			unsigned long first;
			unsigned long last;
			unsigned long k,length=0;
			BYTE chk_sum;
			unsigned long extended_address;

			memset(&Element, 0, sizeof(Element));
			if (!GetImageElement(i, &Element))
				continue;
			Element.Data=(PBYTE)malloc(Element.dwDataLength);
			if (!GetImageElement(i, &Element))
			{
				free(Element.Data);
				continue;
			}

			first=Element.dwAddress;
			last=first+Element.dwDataLength-1;
			while (first <= (last-length)) 
			{
				extended_address = (first >> 16)&0xffff;
				fprintf(fp, ":02000004");				// Start character sequence
				chk_sum = (BYTE) (0 - ((extended_address >> 8) + (extended_address % 256) + 6) % 256) % 256;
				fprintf(fp, "%.4X", extended_address);
				fprintf(fp, "%.2X\n", chk_sum);	// Write number of data and address
				fprintf(fp, ":020000020000FC\n");
				// set length of record
				for (k=0;k<0x100;k++) 
				{
					length = (last - first + 1) >= 32 ? 32 : (last - first + 1);
					
					char record[82], buffer[10];
					unsigned long k;
					unsigned long w_flag, chk_sum =0;

					k = 0;
					strcpy(record,":");                              /* Start character sequence */
					sprintf(buffer, "%.2X", length);
					strcat(record,buffer);
					sprintf(buffer, "%.4X00", (unsigned short) first); /* Write number of data and address */
					strcat(record,buffer);
					chk_sum = length + (first >> 8) + (first % 256);

					while (k < length) {
						sprintf(buffer, "%.2X", Element.Data[first-Element.dwAddress+k]);
						strcat(record,buffer);
						chk_sum += Element.Data[first-Element.dwAddress+k];
						k++;
					}
					chk_sum = 0 - chk_sum;
					sprintf(buffer, "%.2X\n", chk_sum%256);
					strcat(record,buffer);

					w_flag = fprintf(fp, "%s", record);          /* Checks write */
					if (w_flag != strlen(record))
						bRet=FALSE;
					else
						bRet=TRUE;
					
					if (!bRet) 
						break;
					if (first > (last-length))
						break ;
					else
					first += length;
				}
				if (!bRet)
					break;
			}
			free(Element.Data);
		}
		fclose(fp);
		bRet=TRUE;
	}
	return bRet;
}

CImage::~CImage()
{
	int i;
	PDFUIMAGEELEMENT pElement;

	for (i=m_pElements->GetSize()-1;i>=0;i--)
	{
		pElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(i);
		if (pElement->Data)
			free(pElement->Data);
		delete pElement;
	}
	if (m_pElements->GetSize()!=0)
		m_pElements->RemoveAll();
	delete m_pElements;
}

BOOL	CImage::SetImageElement(DWORD dwRank, BOOL bInsert, DFUIMAGEELEMENT Element)
{
	PDFUIMAGEELEMENT pNewElement;

	if (!m_ImageState)
		return FALSE;

	if (dwRank>(DWORD)m_pElements->GetSize())
		return FALSE;

	if (bInsert)
	{
		pNewElement=new DFUIMAGEELEMENT;
		pNewElement->dwAddress=Element.dwAddress;
		pNewElement->dwDataLength=Element.dwDataLength;
		pNewElement->Data=(PBYTE)malloc(Element.dwDataLength);
		memcpy(pNewElement->Data, Element.Data, Element.dwDataLength);
	
		m_pElements->InsertAt(dwRank, pNewElement);
	}
	else
	{
		pNewElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(dwRank);
		pNewElement->dwAddress=Element.dwAddress;
		pNewElement->dwDataLength=Element.dwDataLength;
		pNewElement->Data=(PBYTE)realloc(pNewElement->Data, pNewElement->dwDataLength);
		memcpy(pNewElement->Data, Element.Data, pNewElement->dwDataLength);
	}
	return TRUE;
}

BOOL	CImage::GetImageElement(DWORD dwRank, PDFUIMAGEELEMENT pElement)
{
	PDFUIMAGEELEMENT pListElement;

	if (!m_ImageState)
		return FALSE;
	if (dwRank>=(DWORD)m_pElements->GetSize())
		return FALSE;

	if (!pElement)
		return FALSE;
	pListElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(dwRank);
	pElement->dwAddress=pListElement->dwAddress;
	pElement->dwDataLength=pListElement->dwDataLength;
	if (pElement->Data)
		memcpy(pElement->Data, pListElement->Data, pElement->dwDataLength);

	return TRUE;
}

BOOL	CImage::DestroyImageElement(DWORD dwRank)
{
	PDFUIMAGEELEMENT pElement;

	if (!m_ImageState)
		return FALSE;
	if (dwRank>=(DWORD)m_pElements->GetSize())
		return FALSE;

	pElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(dwRank);
	if (pElement->Data)
		free(pElement->Data);
	delete pElement;
	m_pElements->RemoveAt(dwRank);
	if (m_pElements->GetSize()==0)
		m_pElements->RemoveAll();
	return TRUE;
}

BOOL	CImage::FilterImageForOperation(PMAPPING pMapping, DWORD Operation, BOOL bTruncateLeadFF)
{
	int el;
	int sec;
	DWORD elStart, elEnd, secStart, secEnd;
	int Cnt;

	if (!m_ImageState)
		return FALSE;

	if (Operation==OPERATION_ERASE)
	{
		// ERase is a bit different, as it relies on sectors
		CPtrArray NewElements;

		// Let's browse all the sectors
		for (sec=pMapping->NbSectors-1;sec>=0;sec--)
		{
			BYTE *Buffer;

			// We need to handle each sector in mapping
			PMAPPINGSECTOR pSector=(PMAPPINGSECTOR)&pMapping->pSectors[sec];
			PDFUIMAGEELEMENT pNewElement;
				
			if (!pSector->UseForOperation)
				continue;

			if ( (Operation==OPERATION_ERASE) && ( (pSector->bSectorType & BIT_ERASABLE)!=BIT_ERASABLE ) )
				continue;

			secStart=pSector->dwStartAddress;
			secEnd=pSector->dwStartAddress+pSector->dwSectorSize;
			Buffer=new BYTE[pSector->dwSectorSize];

			if (GetBuffer(secStart, pSector->dwSectorSize, Buffer))
			{
				DWORD i;
				BOOL bAllFFs=TRUE;
                //if (bTruncateLeadFF)
				{
				  for (i=0;i<pSector->dwSectorSize;i++)
				  {
					if (Buffer[i]!=0xFF)
					{
						bAllFFs=FALSE;
						break;
					}
				  }
				}
				//else bAllFFs = FALSE;

			    if (!bAllFFs)
				{
					pNewElement=new DFUIMAGEELEMENT;
					pNewElement->dwAddress=secStart;
					pNewElement->dwDataLength=0;
					pNewElement->Data=NULL;
					NewElements.Add(pNewElement);
				}
				
			}
			delete[] Buffer;
		}
		for (el=m_pElements->GetSize()-1;el>=0;el--)
			DestroyImageElement(el);
		for (el=NewElements.GetSize()-1;el>=0;el--)
			m_pElements->Add(NewElements.GetAt(el));
		return TRUE;
	}

	for (el=m_pElements->GetSize()-1;el>=0;el--)
	{
		Cnt=0;
		PDFUIMAGEELEMENT pElement;
		BOOL bAllFFs=TRUE;
		pElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(el);
		
		elStart=pElement->dwAddress;
		elEnd=pElement->dwDataLength+elStart;

		if (Operation==OPERATION_UPGRADE)
		{
			DWORD i;

			if (bTruncateLeadFF)
			{
			  for (i=0;i<pElement->dwDataLength;i++)
			  {
				if (pElement->Data[i]!=0xFF)
				{
					bAllFFs=FALSE;
					break;
				}
			  }
			}
			else bAllFFs = FALSE;

			if (bAllFFs)
			{
				DestroyImageElement(el+Cnt);		
				continue; // Skip all FFs elements for erase and upgrade. Useless
			}
		}

		// Let's browse all the sectors
		for (sec=pMapping->NbSectors-1;sec>=0;sec--)
		{
			// We need to handle each sector in mapping
			PMAPPINGSECTOR pSector=(PMAPPINGSECTOR)&pMapping->pSectors[sec];
			PDFUIMAGEELEMENT pNewElement;
				
			if (!pSector->UseForOperation)
				continue;

			if (Operation==OPERATION_DETACH)  // No need for any element for a detach
				continue;

			if ( ( (Operation == OPERATION_RETURN) || // We could need the readable sectors for the return in case of the state machine with DFU_DNLOAD with wLength=0 is not supported
				   (Operation == OPERATION_UPLOAD) ) &&
				 ( (pSector->bSectorType & BIT_READABLE)!=BIT_READABLE )
			   )
			   continue;

			if ( (Operation==OPERATION_UPGRADE) && ( (pSector->bSectorType & BIT_WRITEABLE)!=BIT_WRITEABLE ) )
				continue;

			secStart=pSector->dwStartAddress;
			secEnd=pSector->dwStartAddress+pSector->dwSectorSize;

			if ( (elStart>=secEnd) || (elEnd<=secStart) )
				continue;

			pNewElement=new DFUIMAGEELEMENT;

			// We can have four types of covering
			if ( (elStart<=secStart) && (elEnd>=secEnd) )
			{
				pNewElement->dwAddress=secStart;
				pNewElement->dwDataLength=secEnd-secStart;
				pNewElement->Data=(PBYTE)malloc(pNewElement->dwDataLength);
				memcpy(pNewElement->Data, pElement->Data+secStart-elStart, pNewElement->dwDataLength);
			}
			else
			if ( (elStart>=secStart) && (elEnd>=secEnd) )
			{
				pNewElement->dwAddress=elStart;
				pNewElement->dwDataLength=secEnd-elStart;
				pNewElement->Data=(PBYTE)malloc(pNewElement->dwDataLength);
				memcpy(pNewElement->Data, pElement->Data, pNewElement->dwDataLength);
			}
			else
			if ( (elStart>=secStart) && (elEnd<=secEnd) )
			{
				pNewElement->dwAddress=elStart;
				pNewElement->dwDataLength=elEnd-elStart;
				pNewElement->Data=(PBYTE)malloc(pNewElement->dwDataLength);
				memcpy(pNewElement->Data, pElement->Data, pNewElement->dwDataLength);
			}
			else
			if ( (elStart<=secStart) && (elEnd<=secEnd) )
			{
				pNewElement->dwAddress=secStart;
				pNewElement->dwDataLength=elEnd-secStart;
				pNewElement->Data=(PBYTE)malloc(pNewElement->dwDataLength);
				memcpy(pNewElement->Data, pElement->Data+secStart-elStart, pNewElement->dwDataLength);
			}

			if ( (Operation==OPERATION_UPGRADE) && bTruncateLeadFF)
			{
				// Truncate first FFs and last FFs in case of Upgrade
				DWORD FirstNonFFAddr;
		
				// Beginning
				/*if (bTruncateLeadFF)
				{
				  FirstNonFFAddr=pNewElement->dwAddress;
				  while (pNewElement->Data[FirstNonFFAddr-pNewElement->dwAddress]==0xFF)
				  	FirstNonFFAddr++;
				  if (FirstNonFFAddr!=pNewElement->dwAddress)
				  {
					PBYTE Data;
					DWORD NewLen;

					NewLen=pNewElement->dwDataLength-(FirstNonFFAddr-pNewElement->dwAddress);

					Data=(PBYTE)malloc(NewLen);
					memcpy(Data, pNewElement->Data+FirstNonFFAddr-pNewElement->dwAddress, NewLen);
					free(pNewElement->Data);

					pNewElement->dwAddress=FirstNonFFAddr;
					pNewElement->dwDataLength=NewLen;
					pNewElement->Data=Data;
				  }
				}*/
				
				// End
				if (bTruncateLeadFF)
				{
				  FirstNonFFAddr=pNewElement->dwAddress+pNewElement->dwDataLength-1;
				  while (pNewElement->Data[FirstNonFFAddr-pNewElement->dwAddress]==0xFF)
					FirstNonFFAddr--;
				  if (FirstNonFFAddr!=pNewElement->dwAddress)
				  {
					PBYTE Data;
					DWORD NewLen;

					NewLen=pNewElement->dwDataLength-(pNewElement->dwAddress+pNewElement->dwDataLength-1-FirstNonFFAddr);

					Data=(PBYTE)malloc(NewLen);
					memcpy(Data, pNewElement->Data, NewLen);
					free(pNewElement->Data);

					pNewElement->dwDataLength=NewLen;
					pNewElement->Data=Data;
				  }
				}
			}

			SetImageElement(el, TRUE, *pNewElement);
			Cnt++;
			free(pNewElement->Data);
			delete pNewElement;
		}
		// We need to remove current element, as it could have been taken into account in the upper loop
		DestroyImageElement(el+Cnt);		
	}

	if(/*Operation == OPERATION_UPGRADE|| */Operation == OPERATION_UPLOAD)
	{
		this->CompactElements();
	}

	return TRUE;
}

BOOL CImage::ExistsElementsAtAddress(DWORD Address)
{
	int el;
	BOOL bRet=FALSE;

	for (el=0;el<m_pElements->GetSize();el++)
	{
		PDFUIMAGEELEMENT pElement;
		pElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(el);
		if (pElement->dwAddress==Address)
		{
			bRet=TRUE;
			break;
		}
	}
	return bRet;
}

BOOL CImage::GetBuffer(DWORD dwAddress, DWORD dwSize, PBYTE pBuffer)
{
	int el;
	DWORD elStart, elEnd, secStart, secEnd;

	if (!m_ImageState)
		return FALSE;

	memset(pBuffer, 0xFF, dwSize);
	secStart=dwAddress;
	secEnd=dwAddress+dwSize;

	for (el=m_pElements->GetSize()-1;el>=0;el--)
	{
		PDFUIMAGEELEMENT pElement;
		pElement=(PDFUIMAGEELEMENT)m_pElements->GetAt(el);
		
		elStart=pElement->dwAddress;
		elEnd=pElement->dwDataLength+elStart;

		if ( (elStart>=secEnd) || (elEnd<=secStart) )
			continue;

		if ( (elStart<=secStart) && (elEnd<=secEnd) )
			memcpy(pBuffer, pElement->Data+secStart-elStart, elEnd-secStart);
		else
		if ( (elStart>=secStart) && (elEnd<=secEnd) )
			memcpy(pBuffer+elStart-secStart, pElement->Data, pElement->dwDataLength);
		else
		if ( (elStart>=secStart) && (elEnd>=secEnd) )
			memcpy(pBuffer+elStart-secStart, pElement->Data, secEnd-elStart);
		else
		if ( (elStart<=secStart) && (elEnd>=secEnd) )
			memcpy(pBuffer, pElement->Data+secStart-elStart, dwSize);

	}

	return TRUE;
}

int CompareElems(const void *vElem1, const void *vElem2)
{
	PDFUIMAGEELEMENT *pElem1, *pElem2;

	pElem1=(PDFUIMAGEELEMENT*)vElem1;
	pElem2=(PDFUIMAGEELEMENT*)vElem2;
	return (int)(*pElem1)->dwAddress-(int)(*pElem2)->dwAddress;
}

void CImage::CompactElements()
{
	int el;
	PDFUIMAGEELEMENT *pArray=(PDFUIMAGEELEMENT*)m_pElements->GetData();

	qsort(pArray, m_pElements->GetSize(), sizeof(PDFUIMAGEELEMENT), CompareElems); 

	for (el=m_pElements->GetSize()-1;el>0;el--)
	{
		PDFUIMAGEELEMENT pElement2, pElement1;
		pElement2=(PDFUIMAGEELEMENT)m_pElements->GetAt(el);
		pElement1=(PDFUIMAGEELEMENT)m_pElements->GetAt(el-1);

		if (pElement1->dwAddress+pElement1->dwDataLength==pElement2->dwAddress) // Contiguous ?
		{
			pElement1->Data=(PBYTE)realloc(pElement1->Data, pElement1->dwDataLength+pElement2->dwDataLength);
			memcpy(pElement1->Data+pElement1->dwDataLength, pElement2->Data, pElement2->dwDataLength);
			pElement1->dwDataLength+=pElement2->dwDataLength;
			free(pElement2->Data);
			delete pElement2;
			m_pElements->RemoveAt(el);
		}
	}
}

DWORD CImage::GetSize()
{
	DWORD size = 0;
    int el;
	
	for (el=m_pElements->GetSize()-1;el>=0;el--)
	{
		PDFUIMAGEELEMENT pElement; 
		pElement = (PDFUIMAGEELEMENT)m_pElements->GetAt(el);

		size += pElement->dwDataLength;
	}
	return size;
}

