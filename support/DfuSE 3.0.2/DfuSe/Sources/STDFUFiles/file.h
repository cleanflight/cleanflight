/*
 ____________________________________________________________________________
 *		WINDOWS EEPROMER  SGS-THOMSON Microelectronics
 *
 *
 * 				FILE DLL WINDOW 3.1 
 *
 *
 * 				Header File : FILE.H
 *
 *	FILE.H is the header file of the FILE DLL, it provides the prototype
 *  of all the DLL exported functions and some other constant that could be
 *	used by other modules. 
 *	FILE is used to get information from the configuration Data base file.
 *
 *
 *	Date : 03/14/97
 *
 *	Author : G. CHARAMEL
 * 
 ________________________________________________________________________________
 */

typedef int (*VerifCB)(long, long);

#define	INTEL		0
#define MOTOROLA	1
#define UNKNOWN		0xFF

#include "target.h"

/* Prototypes of FILE Exported functions */
DECL_EXPORT(int) FSetVerifyCallBack (VerifCB Verify);

DECL_EXPORT(int) FGetExtension (char *ExtensionList);

DECL_EXPORT(int) FSetProtectedAddress (int iNbAddress, unsigned long *ulAddressArray, int bState);

DECL_EXPORT(int) FLoadFile (const char *FileName, char *Buffer);

DECL_EXPORT(int) FSaveFile (const char *FileName, char *Buffer, struct GAddrStr *Mapping, char NbOfMapArea);

DECL_EXPORT(int) FSpecificLoad(const char *FileName, char *Buffer, unsigned char Format);

DECL_EXPORT(int) FSpecificSave (const char *FileName, char *Buffer, struct GAddrStr *Mapping, char NbOfMapArea, unsigned char Format);

DECL_EXPORT(long) FCheckSum (void);  

DECL_EXPORT(int)	FManageST9OSDFile(unsigned char FontNumber, char *Buffer);

/* End of FILE DLL Exported functions */

// ST9_OSD_ : OSD font file management
#define  nbCHAR       512                 // number of character per font 
#define  ROWperCHAR   10                  // nuber of row per character 
#define  fontsize     16384      
#define  CLEAR		  3

#if defined(_DECLARE) || !defined(DISABLE_AUTO_DECLARE)
	unsigned char Font0[fontsize];              /* array where OSDfile is saved 8k*/
	unsigned char Font1[fontsize];             
	//int OSD;
	unsigned char NumFont;
	unsigned char  CharTestLine=32;    // 1rst line of char =0, Test Character start at line 32
	unsigned char  nb_CharTest=20;		//sizeof(TestChar)/sizeof(char)
	unsigned char TestChar[] = {0x02,0x01,0x0,0x41,0x02,0x0E1,0x02,0x54,0x02,0x08,0x02,0x14,0x02,0x42,0x03,0xC1,0x02,0x0,0x02,0x1C};
	int wrfile;
	unsigned long st_add ;
	unsigned long StartAddress[10];	// 10 areas for Mapping
#else
	extern unsigned char Font0[];              /* array where OSDfile is saved 8k*/
	extern unsigned char Font1[];             
	//int OSD;
	extern unsigned char NumFont;
	extern unsigned char  CharTestLine;    // 1rst line of char =0, Test Character start at line 32
	extern unsigned char  nb_CharTest;		//sizeof(TestChar)/sizeof(char)
	extern unsigned char TestChar[];
	extern int wrfile;
	extern unsigned long st_add ;
	extern unsigned long StartAddress[];	// 10 areas for Mapping
#endif

void OSD_EPROM1(BYTE *bin_array);
void OSD_EPROM2(BYTE *bin_array);
void OSD_EPROM3(BYTE *bin_array);

void CreateOSDFont(BYTE *bin_array);

