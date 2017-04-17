/*
 ______________________________________________________________________________
 *		STMicroelectronics
 *		FILE DLL
 *		Source File : FILE.C
 *
 *	FILE.C is the source file of the FILE DLL, it provides the code
 *  of all the DLL exported functions and the internal code and data 
 *  structures. 
 *
 *	This module handles all device files. It converts between a binary image
 * 	in memory and a device file or between a device file in a memory image. 
 *	A simple file expresses the binary contents of one of the device
 *	memory spaces (EPROM, FLASH, OSD, EEPROM, or Option).
 *  Its format is Intel hex or Motorola S19.
 *
 *  Compiler : Visual C++ 6.0
 *
 *	Author : G. CHARAMEL
 *  Update for Windows Epromer 32bits : A. RAMA
 *
 ______________________________________________________________________________
 */
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <windows.h>
#include <stdlib.h>
#include <io.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "..\include\global.h"
#include "..\include\eprcore.h"			// for specific target
#include "..\include\file.h"
#include "..\include\lef.h"

BOOL IntelLoad(FILE *fp, long FileSize, BYTE *bin_array);
BOOL MotorolaLoad(FILE *fp, long FileSize, BYTE *bin_array);
BOOL OsdLoad(FILE *fp, long FileSize, BYTE *bin_array);
BOOL IntelSave(FILE *fp, BYTE * bin_array,unsigned long NbAddrProcessed,unsigned long NbAddrToProcess,unsigned long first, unsigned long last);
BOOL MotorolaSave32(FILE *fp, BYTE * bin_array,unsigned long NbAddrProcessed,unsigned long NbAddrToProcess,unsigned long first, unsigned long last);
BOOL OsdSave (FILE *fp, BYTE *bin_array, unsigned long NbAddrProcessed, unsigned long NbAddrToProcess, unsigned long first, unsigned long last);
BOOL ST9OsdLoad(FILE *fp, long FileSize, BYTE *bin_array);

static unsigned long global_sum; // checksum of the file data

typedef BOOL FileLoad (FILE *,long , BYTE *);
typedef BOOL FileSave (FILE *, BYTE *,unsigned long, unsigned long, unsigned long, unsigned long);

unsigned long MaxAreaAddress;
char *LastLine[] = {"S9030000FC\n", "S804000000FB\n", "S70500000000FA\n"};

struct StrFileFormat {
	char *Extension;
	FileLoad *fp_Load;
	FileSave *fp_Save;
	char *LastRecord;
};
struct StrFileFormat FileFormat[] = 
	{
		{".HEX",IntelLoad,IntelSave,":00000001FF\n"},
		{".S19",MotorolaLoad,MotorolaSave32,"S9030000FC\n"},
		{".SX",MotorolaLoad,MotorolaSave32,"S9030000FC\n"} // LL: add for Metrowerks
	};
#define NBFILEFORMAT sizeof(FileFormat)/sizeof(struct StrFileFormat)

#define MAX_PROTECTED_ADDR	2000
unsigned long g_ulProtectedAddrArray[MAX_PROTECTED_ADDR];
int g_iNbProtectedAdd=0;

VerifCB VerifyCallBack;
int DisplayFormatError;
#define PROGRESS_STEP 5

/*_____________________________________________________________________________

				PRIVATE DLL FUNCTIONS
_____________________________________________________________________________*/
// General purpose functions

// --------------------- CheckProtection --------------------------------------
CheckProtection (unsigned long ulStartAddr, unsigned long ulEndAddr)
{
char message[100];
int i;

	for (i=0; i<g_iNbProtectedAdd; i++) {
		if ( (g_ulProtectedAddrArray[i] >= ulStartAddr) && (g_ulProtectedAddrArray[i] <= ulEndAddr)) {
			sprintf(message,"Warning: Address 0x%X is protected and will not be programmed.", \
							g_ulProtectedAddrArray[i]);
			LDisplayWarning(message);
		}
	}
}

// --------------------- RdHexDigit -------------------------------------------
RdHexDigit(unsigned char c)
{
	if (!isxdigit(c))
		return -1;
	if (islower(c))
		c = toupper(c);
	return c - (c <= '9' ? '0' : 'A' - 10);
}

// --------------------- RdHexByte --------------------------------------------
RdHexByte(char *string)
{
int h,l;

	if((h = RdHexDigit(string[0])) < 0)
		return(-1);
	if((l = RdHexDigit(string[1])) < 0)
		return(-1);
	return((h << 4) + l);
}

// --------------------- RdHexAddr --------------------------------------------
long RdHexAddr(char *string)
{
int hi,lo;

	if ((hi = RdHexByte(string)) < 0)
		return(-1);
	if ((lo = RdHexByte(string+2)) < 0)
		return(-1);
 	return ( (long) ((hi<<8) | lo));
}

// --------------------- Progress (to update progress bar) --------------------
Progress(long Total,long Current,int NextStep)
{
int Percentage;

	Percentage = (int) ((float)((float)Current/Total)*100);
	if (Percentage ==  NextStep) {
		LDisplayProgress(NextStep);
		NextStep = NextStep + PROGRESS_STEP;
	}
    return NextStep;
}

// --------------------- INTEL BINARY FORMAT -------------------------------
/****************************************************************************
*
*   IntelLoad  	converts an Intel Hex-32bits format file to binary
*
****************************************************************************/
BOOL IntelLoad(FILE *fp, long FileSize, BYTE *bin_array)
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
int Limit = PROGRESS_STEP, NbByteRead = 0;

	last_byte = FALSE;						  /* conversion begin */
	global_sum = 0;							  /* Re-Init global checksum */

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

			switch (separator) {
				case 0x00:
					target_address = (extended_address<<16) + (base_address<<4) + address;
					sum_var = sum_var + (address >> 8) + (address % 256);
					for (i=0; i < byte_count; i++) {
						CheckProtection(target_address + i, target_address + i);
						// Verify each adr to be able to load first data if error in middle of line
						if (!VerifyCallBack( target_address + i, target_address + i)) {
							wsprintf(message, "FILE : line %i: Address between 0x%X and 0x%X is out of range ! - STOP loading.", lineno, target_address + i, target_address+byte_count-1);
							LDisplayError(message);
							return FALSE;
						}
						fscanf(fp,"%2x",&character);
						sum_var += character;
						global_sum += character;
						bin_array[target_address + i] = character;
					}
					sum_var += separator;
					fscanf(fp,"%2x",&checksum);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						return FALSE;
					}
					break;

				case 0x01:
					sum_var = sum_var + (address >> 8) + (address % 256) + separator;
					sum_var = (sum_var % 256);
					fscanf(fp,"%2x",&checksum);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						return FALSE;
					}
					else {
						last_byte = TRUE;         /* eof */
					}
					break;

				case 0x02:
					fscanf(fp,"%4x",&base_address);
					fscanf(fp,"%2x",&checksum);
					sum_var = sum_var + (address >> 8) + (address % 256) + separator \
                                      + (base_address >> 8) + (base_address % 256);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						return FALSE;
					}
					break;

				case 0x03:
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
						return FALSE;
					}
					break;

				case 0x04:
					fscanf(fp,"%4x",&extended_address);
					fscanf(fp,"%2x",&checksum);
					sum_var = sum_var + (address >> 8) + (address % 256) + separator \
                             + (extended_address >> 8) + (extended_address % 256);
					sum_var = (sum_var % 256);
					if (((checksum + sum_var) % 256) != 0) {
						wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
						LDisplayError(message);
						return FALSE;
					}
					break;

				case 0x05:
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
						return FALSE;
					}
					break;

				default:
					wsprintf(message, "FILE : line %i: Not in Intel Hex format!", lineno);
					LDisplayError(message);
					return FALSE;
			}
			// Handle progress
			NbByteRead = NbByteRead + byte_count + 1 + 4;  // +1 +4 for checksum & address
			Limit = Progress(FileSize/2,NbByteRead,Limit); // /2 to have FileSize in byte
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
			return FALSE;
		}
	}
	while (!last_byte);

	return TRUE;
}

/*************************************************************************
*                                                                        *
*   put_rec  	saves a contiguous binary image                          *
*                                                                        *
* Write a record of LEN bytes from address STR into a file in HEX format *
*                                                                        *
* Global parameter --> array bin_array[32536]                            *
*                                                                        *
* Return value w_flag : 0 --> Writing completed                          *
*                       1 --> Writing aborted (disk error)               *
**************************************************************************/
int put_rec(BYTE *bin_array, unsigned long str, unsigned long len, FILE *hexfile)
{
char record[82], buffer[10];
unsigned long k;
unsigned long w_flag, chk_sum =0;

	k = 0;
	strcpy(record,":");                              /* Start character sequence */
	sprintf(buffer, "%.2X", len);
	strcat(record,buffer);
	sprintf(buffer, "%.4X00", (unsigned short) str); /* Write number of data and address */
	strcat(record,buffer);
	chk_sum = len + (str >> 8) + (str % 256);

	while (k < len) {
		sprintf(buffer, "%.2X", bin_array[str+k]);
		strcat(record,buffer);
		chk_sum += bin_array[str+k];
		k++;
	}
	chk_sum = 0 - chk_sum;
	sprintf(buffer, "%.2X\n", chk_sum%256);
	strcat(record,buffer);

	w_flag = fprintf(hexfile, "%s", record);          /* Checks write */
	if (w_flag != strlen(record))
		return(1);
	else
		return(0);
}

/*******************************************************************************
*
* IntelSave  	saves a contiguous binary image in HEX-32 bits format
*
* Saves the contiguous binary image delimited by the argument first and last
* in Intel Hex format. Intel hex lines can only accommodate up to 32 data bytes,
* so the routine may generate more than one line (depending on how many bytes
* are to be saved).  See FintelLoad for a description of the Intel Hex format.
*
********************************************************************************/
BOOL IntelSave (FILE *fp, BYTE *bin_array, unsigned long NbAddrProcessed, \
				unsigned long NbAddrToProcess, unsigned long first, unsigned long last)
{
unsigned long k,length=0;
BYTE chk_sum;
int Limit;
unsigned long extended_address;
unsigned int w_fault;

	Limit = (int) ((float)((float)NbAddrProcessed/NbAddrToProcess)*100);
	while (first <= (last-length)) {
		extended_address = (first >> 16)&0xffff;
		fprintf(fp, ":02000004");				// Start character sequence
		chk_sum = (BYTE) (0 - ((extended_address >> 8) + (extended_address % 256) + 6) % 256) % 256;
		fprintf(fp, "%.4X", extended_address);
		fprintf(fp, "%.2X\n", chk_sum);	// Write number of data and address
		fprintf(fp, ":020000020000FC\n");
		// for progress bar
		Limit = Progress(NbAddrToProcess,NbAddrProcessed,Limit);
		// set length of record
		for (k=0;k<0x100;k++) {
			length = (last - first + 1) >= 32 ? 32 : (last - first + 1);
			// for progress bar
			NbAddrProcessed = NbAddrProcessed + length;			
			//
			w_fault = put_rec(bin_array,first,length,fp);     /* Write record in file */         
			if (w_fault) {                                    /* Checks S1 record write */
				fclose(fp);
				return TRUE;
			}  
			if (first > (last-length))
				break ;
			else
			first += length;
		}
	}
	return TRUE;
}

/****************************************************************************
*
*   OsdLoad  	converts an specific ST HEX file format to binary
*
****************************************************************************/
BOOL OsdLoad (FILE *fp, long FileSize, BYTE *bin_array)
{
DWORD address,		 		// binary address
	  sum_var;    			// calculated checksum
WORD  checksum,   			// checksum from file of the line
	  byte_count, 			// data bytes in the line
	  type,			 		// line type
	  i;
int lineno=1, Valid;
WORD value; 		 		// binary byte value
char line[512];	 		    // buffer for a file line
char message[100];		    // error message
int Limit = PROGRESS_STEP;
int NbByteRead = 0;

	while ( (fgets(line, 512, fp) != NULL) && (!LGetAbort()) ) {
		if (line[0] != ':') {
			if (DisplayFormatError) {
				wsprintf(message, "FILE : line %i: Not in Intel Hex format!", lineno);
				LDisplayError(message);
			}
			return FALSE;
		}
		// Handle progress
		NbByteRead = NbByteRead + strlen(line);
		Limit = Progress(FileSize,NbByteRead,Limit);

		if ( (byte_count = RdHexByte(line+1)) == -1) {
			wsprintf(message, "FILE : line %i: Bad hexadecimal count of byte!", lineno);
			LDisplayError(message);
			return FALSE;
		}
		sum_var = byte_count;

		if ( (address = (WORD) RdHexAddr(line+3)) == -1) {
			wsprintf(message, "FILE : line %i: Bad hexadecimal address!", lineno);
			LDisplayError(message);
			return FALSE;
		}

		sum_var += (address >> 8) + (address % 256);
		if ( (type = RdHexByte(line+7)) == -1) {
			wsprintf(message, "FILE : line %i: Bad hexadecimal record type!", lineno);
			LDisplayError(message);
			return FALSE;
		}
		sum_var += type;

		address = address - (0x1c * (lineno - 1));
		if ( (type == 0)) {
			Valid = VerifyCallBack(address, address + byte_count - 1);
			if (Valid == 0) {
				wsprintf(message, "FILE : line %i: Address out of range !", lineno);
				LDisplayError(message);
				return FALSE;
			}
			if (Valid == 2) {
				wsprintf(message, "FILE : line %i: Address in a non valid area", lineno);
				LDisplayWarning(message);
			}
		}
		for (i = 9; byte_count--; i += 2) {
			if ( (value = RdHexByte(line+i)) == -1) {
				wsprintf(message, "FILE : line %i: Bad hexadecimal digit!", lineno);
				LDisplayError(message);
				return FALSE;
			}
			sum_var += value;
			global_sum += value;
			if (type == 0)
				bin_array[address++] = (BYTE)value;
		}
		if ( (checksum = RdHexByte(line+i)) == -1) {
			wsprintf(message, "FILE : line %i: Bad hexadecimal checksum!", lineno);
			LDisplayError(message);
			return FALSE;
		}
		sum_var += checksum;
		sum_var %= 256;
		if (sum_var != 0) {
			wsprintf(message, "FILE : line %i: Checksum error!", lineno);
			LDisplayError(message);
			return FALSE;
		}
		lineno++;			// next line
		if (type == 1)
			return TRUE;
	}
	LDisplayError("FILE : Unexpected end of file!");
	return FALSE;
}

/****************************************************************************
*
*   OsdSave  	saves a contiguous binary image : specific file format ST
*
****************************************************************************/
BOOL OsdSave (FILE *fp, BYTE *bin_array, unsigned long NbAddrProcessed, \
			  unsigned long NbAddrToProcess, unsigned long first, unsigned long last)
{
char record[84], buffer[8];
unsigned long k,length,FalseAddr=0;
BYTE chk_sum;
int Limit;

	Limit = (int) ((float)((float)NbAddrProcessed/NbAddrToProcess)*100);

	while (first <= last) {
		length =  last - first + 1;
		if (length > 36)
			length = 36;

		chk_sum = (BYTE)length;
		wsprintf(record, ":%02X%04X00", (unsigned short)length, (unsigned short)FalseAddr);
		chk_sum +=   (BYTE) (FalseAddr >> 8) + (BYTE) (FalseAddr % 256);
		FalseAddr += length + 0x1c;
		NbAddrProcessed = NbAddrProcessed + length;
		Limit = Progress(NbAddrToProcess,NbAddrProcessed,Limit);

		for (k=0; k < length; k++) {
			wsprintf(buffer, "%02X", bin_array[first+k]);
			strcat(record,buffer);
			chk_sum += bin_array[first+k];
		}
		chk_sum = ~chk_sum + 1;                     // two's complement
		wsprintf(buffer, "%02X\n", chk_sum);
		strcat(record,buffer);
		fprintf(fp, record);                        //  writes to file
		first += length;
	}
	return 1;
}
 
// --------------------- MOTOROLA BINARY FORMAT ----------------------------
/*********************************************************************************
*   MotorolaLoad: converts an Motorola S19 (16 or 32 bits format) file to binary
*
*   Modif LL 10/01/2001: wrong interpretation of byte count
*   Byte count = adress + data + checksum (with nb bytes adress variable)
*    S1 => adress on 2 bytes
*    S2 => adress on 3 bytes
*    S3 => adress on 4 bytes
*
*	Checksum calculation was wrong for S2 and S3 lines
*   NbByteRead for Progress Bar was wrong
*
*   Modif 2004: Verify each adr to be able to load first data if error in middle
*               of line.
*               Add S5 Header (no data) and Last line modif if S1,S2 or S3 data.
*
*********************************************************************************/
BOOL MotorolaLoad(FILE *fp, long FileSize, BYTE *bin_array)
{
char message[100];
unsigned long address,                                 /* address from file */
              target_address,                     /* address of array index */
			  checksum,                          /* line checksum from file */
			  sum_var;							   /* to calculate checksum */
unsigned char i,										   /* counter index */
			  byte_count,                         /* bytes per line in file */
              last_byte,                                  /* convertion end */
              character,                                  /* data from file */
              header[3];                                /* header from file */
unsigned short lineno=1;                             // count number of line
int Limit = PROGRESS_STEP, NbByteRead = 0;           // for progress bar

	last_byte = FALSE;                                  /* conversion begin */
	global_sum =0;
	byte_count = 0;

	if (FileSize == -1L) {
		LDisplayError("Not a Motorola S19 File !"); 			
		return FALSE;			
	}

	do {
		sum_var = 0;							/* Line checksum calculation reset */
		address = 0;

		fscanf(fp,"%1c",&header);
		if (feof(fp))  { // Detect End Of File & Exit if S9 or S8 or S7 record not found
			last_byte = TRUE;
		}
		else if (header[0] == 'S') {
			fscanf(fp,"%1c",&header[1]);
			header[2]='\0';							/* Append null char. at end of header for strcmp */

			NbByteRead = NbByteRead + byte_count + 2; // +2 for header byte & byte_count byte
			Limit = Progress(FileSize/2,NbByteRead,Limit); // Manage progress bar while loading

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
				for (i=0; i < (byte_count-3); i++) { // -3 because it is 2 adress bytes and 1 checksum byte 
					CheckProtection(address + i, address + i);
					// Verify each adr to be able to load first data if error in middle of line
					if ( !VerifyCallBack(address + i, address + i) ) {
						// -4 because adress = 2 bytes for S1 (don't keep chk byte also)
						wsprintf(message, "FILE : line %i: Address between 0x%X and 0x%X is out of range ! - STOP loading.", lineno, address + i, address + byte_count-4);
						LDisplayError(message);
						return FALSE;
					}
					fscanf(fp,"%2x",&character);	/* Read data */
					sum_var += character;
					global_sum += character;
					bin_array[target_address + i] = character;
				}
				fscanf(fp,"%2x",&checksum);
				if (((checksum + sum_var +1) % 256) != 0) {
					wsprintf(message, "FILE : line %i: Checksum error!",lineno);
					LDisplayError(message);
					return FALSE;
				}
			}
			else if (strcmp(header,"S2")==0) {
				fscanf(fp,"%2x",&byte_count);        /* Nber of Bytes */
				sum_var += byte_count;
				fscanf(fp,"%6lx",&address);          /* Starting address */
				target_address = address;
				sum_var += ((address>>16)%256) + ((address>>8)%256) + (address % 256);
				for (i=0; i < (byte_count-4); i++) { // -4 because it is 3 adress bytes and 1 checksum byte
					CheckProtection(address + i, address + i);
					// Verify each adr to be able to load first data if error in middle of line
					if ( !VerifyCallBack(address + i, address + i) ) {
						// -5 because adress = 3 bytes for S2 (don't keep chk byte also)
						wsprintf(message, "FILE : line %i: Address between 0x%X and 0x%X is out of range ! - STOP loading.", lineno, address + i, address + byte_count-5);
						LDisplayError(message);
						return FALSE;
					}
					fscanf(fp,"%2x",&character);              /*Read data */
					sum_var += character;
					global_sum += character;
					bin_array[target_address + i] = character;
				}
				fscanf(fp,"%2x",&checksum);
				if (((checksum + sum_var +1) % 256) != 0) {
					wsprintf(message, "FILE : line %i: Checksum error!",lineno);
					LDisplayError(message);
					return FALSE;
				}
			}
			else if (strcmp(header,"S3")==0) {
				fscanf(fp,"%2x",&byte_count);           /* Nber of Bytes */
				sum_var += byte_count;
				fscanf(fp,"%8lx",&address);          /* Starting address */
				target_address = address;
				sum_var += ((address>>24)%256) + ((address>>16)%256) + ((address>>8)%256) + (address % 256);
				for (i=0; i < (byte_count-5); i++) { // -5 because it is 4 adress bytes and 1 checksum byte
					CheckProtection(address + i, address + i);
					// Verify each adr to be able to load first data if error in middle of line
					if (!VerifyCallBack(address + i, address + i) ) {
						// -6 because adress = 4 bytes for S3 (don't keep chk byte also)
						wsprintf(message, "FILE : line %i: Address between 0x%X and 0x%X is out of range ! - STOP loading.", lineno, address + i, address+byte_count-6);
						LDisplayError(message);
						return FALSE;
					}
					fscanf(fp,"%2x",&character);              /* Read data */
					sum_var += character;
					global_sum += character;
					bin_array[target_address + i] = character;
				}
				fscanf(fp,"%2x",&checksum);
				if (((checksum + sum_var +1) % 256) != 0) {
					wsprintf(message, "FILE : line %i: Checksum error!",lineno);
					LDisplayError(message);
					return FALSE;
				}
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
					return FALSE;
				}
				fscanf(fp,"%2x",&checksum);
				if (((checksum + sum_var +1) % 256) != 0) {
					wsprintf(message, "FILE : line %i: Checksum error!",lineno);
					LDisplayError(message);
					return FALSE;
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
					return FALSE;
				}
				fscanf(fp,"%2x",&checksum);
				if (((checksum + sum_var +1) % 256) != 0) {
					wsprintf(message, "FILE : line %i: Checksum error!",lineno);
					LDisplayError(message);
					return FALSE;
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
					return FALSE;
				}
				fscanf(fp,"%2x",&checksum);
				if (((checksum + sum_var +1) % 256) != 0) {
					wsprintf(message, "FILE : line %i: Checksum error!",lineno);
					LDisplayError(message);
					return FALSE;
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
					return FALSE;
				}
				fscanf(fp,"%2x",&checksum);
				if (((checksum + sum_var +1) % 256) != 0) {
					wsprintf(message, "FILE : line %i: Checksum error!",lineno);
					LDisplayError(message);
					return FALSE;
				}
			}
			else { // Not a s19 known file header detected in line
				wsprintf(message, "FILE : line %i: Not in Motorola S19 format!", lineno);
				LDisplayError(message);
				return FALSE;
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
			return FALSE;
		}
	}
	while (!last_byte);

	return TRUE;
}

// Save file in Motorola 32-Bit Format
/***************************************************************************
*   Modif LL 10/01/2001: wrong interpretation of byte count
*   Byte count = adress + data + checksum (with nb bytes adress variable)
*    S1 => adress on 2 bytes
*    S2 => adress on 3 bytes
*    S3 => adress on 4 bytes
*
*   Checksum calculation was wrong: adress is either on 2,3 or 4 bytes
***************************************************************************/
BOOL MotorolaSave32(FILE *fp, BYTE *bin_array, unsigned long NbAddrProcessed, \
					unsigned long NbAddrToProcess, unsigned long first, unsigned long last)
{
char record[80], buffer[8];
unsigned long k,length;
BYTE chk_sum;
int Limit;

	Limit = (int) ((float)((float)NbAddrProcessed/NbAddrToProcess)*100);

	while (first <= last) {
		length =  last - first + 1;
		if (length > 32)
			length = 32;

		NbAddrProcessed = NbAddrProcessed + length;
		Limit = Progress(NbAddrToProcess,NbAddrProcessed,Limit);

		if (MaxAreaAddress > (unsigned long)0xFFFFFF) {
			wsprintf(record, "S3%02x%08x", (unsigned short)length+5, (unsigned long)first);
			chk_sum = (BYTE) length + 5;
			chk_sum+= (BYTE)((first>>24)%256) + (BYTE)((first>>16)%256) + \
				      (BYTE)((first>>8)%256) + (BYTE)(first%256);
		}
		else if (MaxAreaAddress > (unsigned long)0xFFFF) {
			wsprintf(record, "S2%02x%06x", (unsigned short)length+4, (unsigned long)first);
			chk_sum = (BYTE) length + 4;
			chk_sum += (BYTE)((first>>16)%256) + (BYTE)((first>>8)%256) + (BYTE)(first%256);
		}
		else {
			wsprintf(record, "S1%02x%04x", (unsigned short)length+3, (unsigned short)first);
			chk_sum =  (BYTE) length + 3;
			chk_sum += (BYTE)((first>>8)%256) + (BYTE)(first%256);
		}

		for (k=0; k < length; k++) {
			wsprintf(buffer, "%02X", bin_array[first+k]);
			strcat(record,buffer);
			chk_sum += bin_array[first+k];
		}
		chk_sum = ~(chk_sum & 0xff);                // two's complement
		wsprintf(buffer, "%02X\n", chk_sum);
		strcat(record,buffer);
		fprintf(fp, record);                        //  writes to file
		first += length;
	}
	return TRUE;
}

/****************************************************************************
*
*   ST9OsdLoad  	converts an specific OSD Font file format to binary
*
****************************************************************************/
BOOL ST9OsdLoad(FILE *fp, long FileSize, BYTE *bin_array)
{
int Limit = PROGRESS_STEP;
unsigned long target_address,		// address of array index
			  base_address=0,
			  extended_address=0;
unsigned int  i,					// counterindex
			  sum_var,				// to calculate checksum
			  error_conv,			// error code
			  byte_count;			// bytes per line in hexfile
unsigned char character,			// date from hexfile
			  colon;				// begin of line in hexfile

	error_conv = 0;
	global_sum =0;
	target_address = 0x00;          // osd
	colon = getc(fp);               // detect first char of osd file
	FileSize --;
	if (colon != '#')
		return(FALSE);				// no OSD file
	do {
		colon = getc(fp);
		FileSize --;
	}
	while (colon != 10);
	FileSize --;
	byte_count = (FileSize)/52;         // FileSize/nb char per line
	byte_count = (byte_count*40)/2;     // 40 char used per line, 2 char read per time

	if (byte_count != nbCHAR * ROWperCHAR *2)
		return(FALSE);            // no OSD file

	sum_var = 0;                          /* checksum calculation begin */
	for (i=0; i < byte_count; i++) {
		fscanf(fp,"%2x",&character);
		sum_var += character;
		global_sum +=character;
		// number of font loaded
		if (NumFont)
			Font1[target_address + i] = character;
		else
			Font0[target_address + i] = character;
		Limit = Progress(FileSize,i,Limit); // Handle progress
	}
	fclose(fp);                         /* close file */

	for (i=0;i<nb_CharTest;i++) {       /* Insert the TEST_CHARACTER at the line 33 */
		Font0[(CharTestLine*20) + i] =  TestChar[i];
		Font1[(CharTestLine*20) + i] =  TestChar[i];
	}

	OSD_EPROM1(bin_array);     /* load in RAM the eprom1 contents */
	OSD_EPROM2(bin_array);     /* load in RAM the eprom2 contents */
	OSD_EPROM3(bin_array);     /* load in RAM the eprom3 contents */

	return (TRUE);                       /* error code */
}

/************************************************************************/
/* this eprom contents the 8 lsb for the EVEVN font code                */
/*   row : nb of ODD row of character (5)                               */
/*   nb char : nb of character per Font                                 */
/************************************************************************/
void OSD_EPROM1(BYTE *bin_array)
{
int  row,k;
long i =0;
unsigned int font_st_add;
unsigned int add_font;

	font_st_add = add_font = 0;
	st_add = StartAddress[2];

	for (row=0;row<5;row++) {
		for (k=0;k < nbCHAR;k++) {        // nb_char is number of char of the osdfont
			add_font = (font_st_add + 1) + (row*4) + (k*20);
			bin_array[st_add] = Font0[add_font];
			st_add++;
			bin_array[st_add] = Font1[add_font];
			st_add++;
		}
	}
}

/************************************************************************
  this eprom2 contents the 2 MSB for the EVEN font code and the 2 MSB
  for the ODD font code with a dedicated position showing below
  add <12:10>   bit7  bit6   bit5   bit4   bit3   bit2  bit1   bit0
------------------------------------------------------------------
        000     bit9  bit8   bit9   bit8   bit9   bit8  bit9   bit8
                row2  row2   row0   row0   row1   row1  row1   row1
------------------------------------------------------------------
        001     bit9  bit8   bit9   bit8   bit9   bit8  bit9   bit8
                row4  row4   row2   row2   row1   row1  row3   row3
------------------------------------------------------------------
        010     bit9  bit8   bit9   bit8   bit9   bit8  bit9   bit8
                row6  row6   row4   row4   row3   row3  row5   row5
------------------------------------------------------------------
        011     bit9  bit8   bit9   bit8   bit9   bit8  bit9   bit8
                row8  row8   row6   row6   row5   row5  row7   row7
------------------------------------------------------------------
        100     bit9  bit8   bit9   bit8   bit9   bit8  bit9   bit8
                row2  row2   row8   row8   row7   row7  row9   row9
************************************************************************/
void OSD_EPROM2(BYTE *bin_array)
{
char row_font0[10],row_font1[10],data0,data1,add12_10;
char bf0_01,bf0_23,bf0_45,bf0_67;
char bf1_01,bf1_23,bf1_45,bf1_67;
int k,i;
unsigned int font_st_add;

	st_add = StartAddress[1];
	for (add12_10=0; add12_10 <= 4;add12_10++) {           /* address <12:10> */
		font_st_add = 0;
		for (i=0;i<nbCHAR;i++) {                           /* 512 nb char for font0/ 512 char for  font1 */
			for (k=0;k<10;k++) {                           /* read the 10 rows of a char of font0 */
				row_font0[k] = Font0[font_st_add];         /* only MSB is read , char of font0 */
				row_font1[k] = Font1[font_st_add];         /* only MSB is read , char of font1 */
				font_st_add++;                             /* skip LSB byte of char */
				font_st_add++;                             /* next MSB add */
			}
			switch (add12_10) {                            /* build data depending of add<12:10> */
				case 0:
					bf0_01 = row_font0[1]  & 0x03;         /* font1 */
					bf0_23 = (row_font0[1] << 2) & 0x0c;
					bf0_45 = (row_font0[0] << 4) & 0x30;
					bf0_67 = (row_font0[2] << 6) & 0xc0;

					bf1_01 = row_font1[1] & 0x03;          /* font2 */
					bf1_23 = (row_font1[1] << 2)  & 0x0c;
					bf1_45 = (row_font1[0] << 4)  & 0x30;
					bf1_67 = (row_font1[2] << 6)  & 0xc0;
					break;

				case 1:
					bf0_01 = row_font0[3] & 0x03;
					bf0_23 = (row_font0[1] << 2) & 0x0c;
					bf0_45 = (row_font0[2] << 4) & 0x30;
					bf0_67 = (row_font0[4] << 6) & 0xc0;

					bf1_01 = row_font1[3] & 0x03;
					bf1_23 = (row_font1[1] << 2) & 0x0c;
					bf1_45 = (row_font1[2] << 4) & 0x30;
					bf1_67 = (row_font1[4] << 6) & 0xc0;
					break;

				case 2:
					bf0_01 = row_font0[5] & 0x03;
					bf0_23 = (row_font0[3] << 2) & 0x0c;
					bf0_45 = (row_font0[4] << 4) & 0x30;
					bf0_67 = (row_font0[6] << 6) & 0xc0;

					bf1_01 = row_font1[5] & 0x03;
					bf1_23 = (row_font1[3] << 2) & 0x0c;
					bf1_45 = (row_font1[4] << 4) & 0x30;
					bf1_67 = (row_font1[6] << 6) & 0xc0;
					break;

				case 3:
					bf0_01 = row_font0[7] & 0x03;
					bf0_23 = (row_font0[5] << 2) & 0x0c;
					bf0_45 = (row_font0[6] << 4) & 0x30;
					bf0_67 = (row_font0[8] << 6) & 0xc0;

					bf1_01 = row_font1[7] & 0x03;
					bf1_23 = (row_font1[5] << 2) & 0x0c;
					bf1_45 = (row_font1[6] << 4) & 0x30;
					bf1_67 = (row_font1[8] << 6) & 0xc0;
					break;

				case 4:
					bf0_01 = row_font0[9] & 0x03;
					bf0_23 = (row_font0[7] << 2) & 0x0c;
					bf0_45 = (row_font0[8] << 4) & 0x30;
					bf0_67 = (row_font0[2] << 6) & 0xc0;

					bf1_01 = row_font1[9] & 0x03;
					bf1_23 = (row_font1[7] << 2) & 0x0c;
					bf1_45 = (row_font1[8] << 4) & 0x30;
					bf1_67 = (row_font1[2] << 6) & 0xc0;
					break;
			}
			data0 = bf0_01 | bf0_23 | bf0_45 | bf0_67;
			data1 = bf1_01 | bf1_23 | bf1_45 | bf1_67;
			bin_array[st_add] = data0;
			st_add++;
			bin_array[st_add] = data1;
			st_add++;
		}
	}
}

/************************************************************************/
/* this eprom contents the 8 lsb for the ODD font code                  */
/*   row : nb of ODD row of character (5)                               */
/*   nb char : nb of character per Font                                 */
/************************************************************************/
void OSD_EPROM3(BYTE *bin_array)
{
int  row,k;
unsigned int font_st_add,add_font;

	font_st_add = add_font= 0;
	st_add = StartAddress[0];
	for (row=0;row<5;row++) {
		for (k=0;k < nbCHAR;k++) { /* nb_char is number of char of the osdfont */
			add_font = (font_st_add + 3) + (row*4) + (k*20);
			bin_array[st_add] = Font0[add_font];
			st_add++;
			bin_array[st_add] = Font1[add_font];
			st_add++;
		}
	}
}

// ************************************************************************
// * Create font0 and font1 in order to save current mapping font         *
// ************************************************************************
void CreateOSDFont(BYTE *bin_array)
{
unsigned long add0,add1,add2,add3;
int k,i;
char row,add12_10,bit45,bit01,data;

	add0 = 0x00;									// build  OSD FONT1
	for (i=0;i<nbCHAR;i++) {                        // 512 nb char for font0/ 512 char for  font1
		k=1;
		add1 = StartAddress[0] + 1 +(i*2);
		add3 = StartAddress[2] + 1 +(i*2);
		for (row=0;row<5;row++) {
			Font1[add0 +k +(i*20)] = bin_array[add3 + (nbCHAR*2*row)];
			k++;
			k++;
			Font1[add0 +k +(i*20)] = bin_array[add1 + (nbCHAR*2*row)];
			k++;
			k++;
		}
	}
	// build  OSD FONT1
	k=0;
	for (add12_10=0; add12_10 <= 4;add12_10++) {	//address <12:10>
		add2 = StartAddress[1] + (k*nbCHAR*2);
		for(i=0;i<nbCHAR;i++) {                     // 512 nb char for font0/ 512 char for  font1
			data = bin_array[add2+1 + (i*2)];
			bit01 = data & 0x03;
			data = data >> 4;
			bit45 = data & 0x03;
			Font1[add0 +    (k*4) +(i*20)] = bit45;
			Font1[add0 + 2 +(k*4) +(i*20)] = bit01;
		}
		k++;
	}
	// rebuid OSD FONT0
	add0 = 0x00;									// build  OSD FONT0
	for (i=0;i<nbCHAR;i++) {                        // 512 nb char for font0/ 512 char for  font1
		k=1;
		add1 = StartAddress[0] +(i*2);
		add3 = StartAddress[2] +(i*2);
		for (row=0;row<5;row++) {
			Font0[add0 +k +(i*20)] = bin_array[add3 + (nbCHAR*2*row)];
			k++;
			k++;
			Font0[add0 +k +(i*20)] = bin_array[add1 + (nbCHAR*2*row)];
			k++;
			k++;
		}
	}
	k=0;
	for (add12_10=0; add12_10 <= 4;add12_10++) {	// address <12:10>
		add2 = StartAddress[1] + (k*nbCHAR*2);
		for (i=0;i<nbCHAR;i++) {                    // 512 nb char for font0/ 512 char for  font1
			data = bin_array[add2 + (i*2)];
			bit01 = data & 0x03;
			data = data >> 4;
			bit45 = data & 0x03;
			Font0[add0 +    (k*4) +(i*20)] = bit45;
			Font0[add0 + 2 +(k*4) +(i*20)] = bit01;
		}
		k++;
	}
}

/*______________________________________________________________________________

				EXPORTED DLL FUNCTIONS
______________________________________________________________________________*/

/****************************************************************************
*
*   FSetVerifyCallBack
*
****************************************************************************/
DECL_EXPORT(int) FSetVerifyCallBack (VerifCB verify)
{
	VerifyCallBack = verify;
	return 1;
}

/****************************************************************************
*
*   FGetExtension
*
****************************************************************************/
DECL_EXPORT(int) FGetExtension (char *ExtensionList)
{
	return 1;
}

/****************************************************************************
*
*   FSetProtectedAddress
*
****************************************************************************/
DECL_EXPORT(int) FSetProtectedAddress (int iNbAddress, unsigned long *ulAddressArray, BOOL bState)
{   
unsigned long ulNewAddrArray[MAX_PROTECTED_ADDR];
int iNewNbProtectedAdd;
BOOL bAlreadyProtected;
int uiArraySize,i,j;

	switch (bState) {

		case TRUE:
			// Addresses should be added
			// first copy the current array to the array being build
			iNewNbProtectedAdd = g_iNbProtectedAdd;
			uiArraySize = sizeof(g_ulProtectedAddrArray[0])*g_iNbProtectedAdd;
			memcpy(ulNewAddrArray,g_ulProtectedAddrArray,uiArraySize);
			// Recurse on the current config and transfer to the new array
			// the address that are not already recorded
			for (i = 0; i<iNbAddress; i++) {
				bAlreadyProtected = FALSE;
				// Is there already set ...
				for (j=0; j<uiArraySize;j++) {
					if (ulAddressArray[i] == ulNewAddrArray[j]) {
						// ... Yes
						bAlreadyProtected = TRUE;
						break;
					}
				}
				if (!bAlreadyProtected) {
					// Add it to the array
					ulNewAddrArray[iNewNbProtectedAdd++] = ulAddressArray[i];
				}
			}
			break;

		case FALSE:
			// Addresses should be removed
			// Check that each address currently protected should not be disabled
			iNewNbProtectedAdd = 0;
			for (i=0; i<g_iNbProtectedAdd; i++) {
				bAlreadyProtected = FALSE;
				for (j=0;j<iNbAddress;j++) {
					if (g_ulProtectedAddrArray[i] == ulAddressArray[i]) {
						bAlreadyProtected = TRUE;
						break;
					}
				}
				if (!bAlreadyProtected) {
					// Add it to the array
					ulNewAddrArray[iNewNbProtectedAdd++] = g_ulProtectedAddrArray[i];
				}
			}
			break;

		case CLEAR:
			g_iNbProtectedAdd = 0;
			return 1;
	}

	if (iNewNbProtectedAdd > MAX_PROTECTED_ADDR) {
		g_iNbProtectedAdd = MAX_PROTECTED_ADDR;
	}
	else {
		g_iNbProtectedAdd = iNewNbProtectedAdd;
	}
	memcpy(g_ulProtectedAddrArray,ulNewAddrArray,sizeof(g_ulProtectedAddrArray[0])*g_iNbProtectedAdd);
	return 1;
}

/****************************************************************************
*
*   FLoadFile
*
****************************************************************************/
DECL_EXPORT(int) FLoadFile (const char *FileName, char *Buffer)
{                                                
char Drive[3], Dir[256], Fname[256], Ext[256];
FILE *fpointer;
char i,*ptr;
int Status;
struct _stat buf;
long FileSize=0;
	
	// Get the file size
	_stat(FileName,&buf);
	FileSize = buf.st_size;
	if (FileSize==0) // To prevent GPF when calculating the progress value
		FileSize=1;

	global_sum = 0;    
	if((fpointer = fopen(FileName, "r")) != NULL) {
		_splitpath(FileName,Drive,Dir,Fname,Ext);
		ptr = strupr(Ext);
		strcpy(Ext,ptr);
		DisplayFormatError = 1;
		for (i=0;i<NBFILEFORMAT;i++)
		{   // Try to load a file with a recognized extension
			if (strcmp(Ext,FileFormat[i].Extension) == 0)
			{ 
				Status = (FileFormat[i].fp_Load(fpointer,FileSize,Buffer));
				fclose(fpointer);
				return Status;
			}
		}
		DisplayFormatError = 0;
		for (i=0;i<NBFILEFORMAT;i++) {   
			// Try to load a file whose extension is not known
			if (FileFormat[i].fp_Load(fpointer,FileSize,Buffer) == 1) {
				fclose(fpointer);
				return 1;
			}
			else {
				// It was not the right format
				// Close the file and re-opened it to set the file pointer again
				// on the first file line
				fclose(fpointer); 
				fpointer = fopen(FileName, "r");
			}
		}
		LDisplayError("Unknown binary file format");
		fclose(fpointer);
		return 0; // Format Not found
	}
	else {
		LDisplayError (strerror(errno));
		return 0;
	}
}

/****************************************************************************
*
*   FSaveFile
*
****************************************************************************/
DECL_EXPORT(int) FSaveFile (const char *FileName, char *Buffer, struct GAddrStr *Map, char NbMapArea)
{
char Drive[3], Dir[256], Fname[256], Ext[256];
FILE *fpointer;
char i,j,*ptr;
int Status;
long NbAddrProcessed,NbAddrToProcess;

	if((fpointer = fopen(FileName, "w")) != NULL) {
		_splitpath(FileName,Drive,Dir,Fname,Ext);
		ptr = strupr(Ext);
		strcpy(Ext,ptr);
		for (i=0;i<NBFILEFORMAT;i++) {
			if (strcmp(Ext,FileFormat[i].Extension) == 0) {   
				// Calculate the Number of addresses to process 
				NbAddrToProcess = NbAddrProcessed = 0;
				for (j=0;j<NbMapArea;j++) {
					NbAddrToProcess = NbAddrToProcess + (Map[j].max - Map[j].min + 1);
				}
				Status = 1;
				// modif ar : get the address max : it is useful for Motorola saving
				MaxAreaAddress =  Map[NbMapArea-1].max ;

				for (j=0; j<NbMapArea && Status == 1; j++) {
				    // Save each map area
					Status = FileFormat[i].fp_Save(fpointer,Buffer,NbAddrProcessed,NbAddrToProcess,(unsigned long)Map[j].min,(unsigned long)Map[j].max);
					NbAddrProcessed = NbAddrProcessed + (Map[j].max - Map[j].min + 1);
				}
				// Add the last record
				if (Status == 1) {
					if ( (strcmp(".S19",FileFormat[i].Extension) == 0) || 
					     (strcmp(".SX" ,FileFormat[i].Extension) == 0) ) {
						// modif ar Start character depends on max address
						if (MaxAreaAddress > (unsigned long)0xFFFFFF) {
							fprintf(fpointer,LastLine[2]);
						}
						else if (MaxAreaAddress > (unsigned long)0xFFFF) 
							fprintf(fpointer,LastLine[1]);
						else
							fprintf(fpointer,LastLine[0]);
					}
					else
						fprintf(fpointer,FileFormat[i].LastRecord);
				}
				fclose(fpointer);
				return Status;
			}
		}
	}
	else {
		LDisplayError (strerror(errno));
		return 0;
	}
	
	return 1;
}

/****************************************************************************
*
*   FSpecificLoad and FSpecificSave for special file format like OSD ....
*
*****************************************************************************/
DECL_EXPORT(int) FSpecificLoad (const char *FileName, char *Buffer, unsigned char Format)
{
char Drive[3], Dir[256], Fname[256], Ext[256];
FILE *fpointer;
char i,*ptr;
int Status;
struct _stat buf;
long FileSize=0;

	// Get the file size
	_stat(FileName,&buf);
	FileSize = buf.st_size;
	if (FileSize==0) // To prevent GPF when calculating the progress value
		FileSize=1;
	global_sum = 0;

	if ((fpointer = fopen(FileName, "r")) != NULL) {
		_splitpath(FileName,Drive,Dir,Fname,Ext);
		ptr = strupr(Ext);
		strcpy(Ext,ptr);
		DisplayFormatError = 1;
		for (i=0;i<NBFILEFORMAT;i++) { // ST9_OSD_ : load specific ST9 OSD font file
			if ( (strcmp(Ext,".osd") == 0) || (strcmp(Ext,".OSD") == 0) ||
				 (strcmp(Ext,".os0") == 0) || (strcmp(Ext,".OS0") == 0) ||
				 (strcmp(Ext,".os1") == 0) || (strcmp(Ext,".OS1") == 0) ) {
				Status = ST9OsdLoad(fpointer,FileSize,Buffer);
				fclose(fpointer);
				return Status;
			}
		}
		DisplayFormatError = 0;
		for (i=0;i<NBFILEFORMAT;i++) {
			// Try to load a file whose extension is not known
			if (FileFormat[i].fp_Load(fpointer,FileSize,Buffer) == 1) {
				fclose(fpointer);
				return 1;
			}
			else {
				// It was not the right format
				// Close the file and re-opened it to set the file pointer again
				// on the first file line
				fclose(fpointer);
				fpointer = fopen(FileName, "r");
			}
		}
		LDisplayError("Unknown binary file format");
		fclose(fpointer);
		return 0; // Format Not found
	}
	else {
		LDisplayError (strerror(errno));
		return 0;
	}
}

/****************************************************************************
*
*   FSpecificSave
*
****************************************************************************/
DECL_EXPORT(int) FSpecificSave (const char *FileName, char *Buffer, \
								struct GAddrStr *Map, char NbMapArea, unsigned char Format)
{
char Drive[3], Dir[256], Fname[256], Ext[256];
FILE *fpointer;
char i,j,k,*ptr;
int Status;
long NbAddrProcessed,NbAddrToProcess;
unsigned int ind, w_fault, w_flag;
unsigned long add;
char record[50], buf[10];

	if ((fpointer = fopen(FileName, "w")) != NULL) {
		_splitpath(FileName,Drive,Dir,Fname,Ext);
		ptr = strupr(Ext);
		strcpy(Ext,ptr);
	
		// Save ST9 OSD file ST9_OSD_
		if ((strcmp(Ext,".OSD")==0) || (strcmp(Ext,".OS0")==0) || (strcmp(Ext,".OS1")==0)) {
			CreateOSDFont(Buffer);
			ind=0; w_fault=0; add=0x00; // init
			// writing osd file ...
			fprintf(fpointer, "#\n");
			for (ind=0;ind<nbCHAR;ind++)	{
				strcpy(record,"");								// Start character sequence
				for (k=0; k < ROWperCHAR; k++) {
					if (NumFont) {	// generate FONT1 file
						sprintf(buf, "%.2X", Font1[add++]);
						strcat(record,buf);
						sprintf(buf, "%.2X", Font1[add++]);
						strcat(record,buf);
					}
					else {	        // generate FONT0 file
						sprintf(buf, "%.2X", Font0[add++]);
						strcat(record,buf);
						sprintf(buf, "%.2X", Font0[add++]);
						strcat(record,buf);
					}
					sprintf(buf, " ");
					strcat(record,buf);
				}
				sprintf(buf, "\n");
				strcat(record,buf);

				w_flag =fprintf(fpointer, "%s", record);		// Checks write
				if (w_flag != strlen(record)) {					// Checks S1 record write
					fclose(fpointer);
					return(0);
				}
			}
			w_fault = fprintf(fpointer, "\n");					// Last record
			fclose(fpointer);
			return 1;
		}
		else {
			for (i=0;i<NBFILEFORMAT;i++) {
				if (strcmp(Ext,FileFormat[i].Extension) == 0) {
					// Calculate the Number of addresses to process
					NbAddrToProcess = NbAddrProcessed = 0;
					for (j=0;j<NbMapArea;j++) {
						NbAddrToProcess = NbAddrToProcess + (Map[j].max - Map[j].min + 1);
					}
					Status = 1;
					for (j=0; j<NbMapArea && Status == 1; j++) {
						// Save each map area
						Status = OsdSave(fpointer,Buffer,NbAddrProcessed,NbAddrToProcess,(unsigned long)Map[j].min,(unsigned long)Map[j].max);
						NbAddrProcessed = NbAddrProcessed + (Map[j].max - Map[j].min + 1);
					}
					// Add the last record
					if (Status == 1)
						fprintf(fpointer,FileFormat[i].LastRecord);
					fclose(fpointer);
					return Status;
				}
			}
		}
	}
	else {
		LDisplayError (strerror(errno));
	}
	return 1;
}

/****************************************************************************
*
*   FManageST9OSDFile
*
****************************************************************************/
DECL_EXPORT(int) FManageST9OSDFile(unsigned char FontNumber, char *Buffer)
{
const char TokenSep[] = "\n";
long MinAddress,MaxAddress;
char *pCurrentMap;
int i=0;

	NumFont = FontNumber; // set the current number of Font
	if (NumFont==0) // init Font to 0xFF for the first load
		for (i=0; i < fontsize;i++) {
			Font0[i] = 0xFF;
			Font1[i] = 0xFF;
		}
	// Set Mapping address
	if (Buffer != NULL) {
		//Parse the mapping
		pCurrentMap = strtok(Buffer, TokenSep);
		if (pCurrentMap) {
			i=0;	// init
			while (pCurrentMap != NULL) {
				sscanf(pCurrentMap, " [%lx-%lx]", &MinAddress, &MaxAddress);
				StartAddress[i++] = MinAddress;
				pCurrentMap = strtok(NULL, TokenSep); // Next Section
			}
			return 1;
		}
		else
			return 0;
	}
	else {
		LDisplayError ("OSD Mapping not found");
		return 0;
	}
}

/****************************************************************************
*
*   Fchecksum returns the last computed checksum
*
*****************************************************************************/
DECL_EXPORT(long) FCheckSum(void)
{
	return (global_sum);
}


/****************************************************************************
*
*   DllMain
*
****************************************************************************/
BOOL WINAPI DllMain(HANDLE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
	switch( ul_reason_for_call ) {
		case DLL_PROCESS_ATTACH:
			break;

		case DLL_THREAD_ATTACH:
			break;

		case DLL_THREAD_DETACH:
			break;

		case DLL_PROCESS_DETACH:
			break;
    }
	return TRUE;
}
