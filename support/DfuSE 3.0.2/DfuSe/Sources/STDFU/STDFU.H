#ifndef _STDFU_H_
#define _STDFU_H_

// Error Codes
//////////////////////////////////////////////////////////////////////

#ifndef STDFU_API
#define STDFU_API extern "C" DWORD PASCAL 
#endif

#define STDFU_ERROR_OFFSET				0x12340000

#define STDFU_NOERROR					STDFU_ERROR_OFFSET
#define STDFU_MEMORY					(STDFU_ERROR_OFFSET+1)
#define STDFU_BADPARAMETER				(STDFU_ERROR_OFFSET+2)

#define STDFU_NOTIMPLEMENTED			(STDFU_ERROR_OFFSET+3)
#define STDFU_ENUMFINISHED				(STDFU_ERROR_OFFSET+4)
#define STDFU_OPENDRIVERERROR			(STDFU_ERROR_OFFSET+5)

#define STDFU_ERRORDESCRIPTORBUILDING	(STDFU_ERROR_OFFSET+6)
#define STDFU_PIPECREATIONERROR			(STDFU_ERROR_OFFSET+7)
#define STDFU_PIPERESETERROR			(STDFU_ERROR_OFFSET+8)
#define STDFU_PIPEABORTERROR			(STDFU_ERROR_OFFSET+9)
#define STDFU_STRINGDESCRIPTORERROR		(STDFU_ERROR_OFFSET+0xA)

#define STDFU_DRIVERISCLOSED			(STDFU_ERROR_OFFSET+0xB)
#define STDFU_VENDOR_RQ_PB				(STDFU_ERROR_OFFSET+0xC)
#define STDFU_ERRORWHILEREADING			(STDFU_ERROR_OFFSET+0xD)
#define STDFU_ERRORBEFOREREADING		(STDFU_ERROR_OFFSET+0xE)
#define STDFU_ERRORWHILEWRITING			(STDFU_ERROR_OFFSET+0xF)
#define STDFU_ERRORBEFOREWRITING		(STDFU_ERROR_OFFSET+0x10)
#define STDFU_DEVICERESETERROR			(STDFU_ERROR_OFFSET+0x11)
#define STDFU_CANTUSEUNPLUGEVENT		(STDFU_ERROR_OFFSET+0x12)
#define STDFU_INCORRECTBUFFERSIZE		(STDFU_ERROR_OFFSET+0x13)
#define STDFU_DESCRIPTORNOTFOUND		(STDFU_ERROR_OFFSET+0x14)
#define STDFU_PIPESARECLOSED			(STDFU_ERROR_OFFSET+0x15)
#define STDFU_PIPESAREOPEN				(STDFU_ERROR_OFFSET+0x16)

#define STDFU_TIMEOUTWAITINGFORRESET	(STDFU_ERROR_OFFSET+0x17)

#define STDFU_RQ_GET_DEVICE_DESCRIPTOR			0x02000000
#define STDFU_RQ_GET_DFU_DESCRIPTOR				0x03000000
#define STDFU_RQ_GET_STRING_DESCRIPTOR			0x04000000
#define STDFU_RQ_GET_NB_OF_CONFIGURATIONS		0x05000000
#define STDFU_RQ_GET_CONFIGURATION_DESCRIPTOR	0x06000000
#define STDFU_RQ_GET_NB_OF_INTERFACES			0x07000000
#define STDFU_RQ_GET_NB_OF_ALTERNATES			0x08000000
#define STDFU_RQ_GET_INTERFACE_DESCRIPTOR		0x09000000
#define STDFU_RQ_OPEN							0x0A000000
#define STDFU_RQ_CLOSE							0x0B000000
#define STDFU_RQ_DETACH							0x0C000000
#define STDFU_RQ_DOWNLOAD						0x0D000000
#define STDFU_RQ_UPLOAD							0x0E000000
#define STDFU_RQ_GET_STATUS						0x0F000000
#define STDFU_RQ_CLR_STATUS						0x10000000
#define STDFU_RQ_GET_STATE						0x11000000
#define STDFU_RQ_ABORT							0x12000000
#define STDFU_RQ_SELECT_ALTERNATE				0x13000000
#define STDFU_RQ_AWAITINGPNPUNPLUGEVENT			0x14000000
#define STDFU_RQ_AWAITINGPNPPLUGEVENT			0x15000000
#define STDFU_RQ_IDENTIFYINGDEVICE				0x16000000

// DFU States
//////////////////////////////////////////////////////////////////////

#define STATE_IDLE							0x00
#define STATE_DETACH						0x01
#define STATE_DFU_IDLE						0x02
#define STATE_DFU_DOWNLOAD_SYNC				0x03
#define STATE_DFU_DOWNLOAD_BUSY				0x04
#define STATE_DFU_DOWNLOAD_IDLE				0x05
#define STATE_DFU_MANIFEST_SYNC				0x06
#define STATE_DFU_MANIFEST					0x07
#define STATE_DFU_MANIFEST_WAIT_RESET		0x08
#define STATE_DFU_UPLOAD_IDLE				0x09
#define STATE_DFU_ERROR						0x0A

#define STATE_DFU_UPLOAD_SYNC				0x91
#define STATE_DFU_UPLOAD_BUSY				0x92

// DFU Status
//////////////////////////////////////////////////////////////////////

#define STATUS_OK							0x00
#define STATUS_errTARGET					0x01
#define STATUS_errFILE						0x02
#define STATUS_errWRITE						0x03
#define STATUS_errERASE						0x04
#define STATUS_errCHECK_ERASE				0x05
#define STATUS_errPROG						0x06
#define STATUS_errVERIFY					0x07
#define STATUS_errADDRESS					0x08
#define STATUS_errNOTDONE					0x09
#define STATUS_errFIRMWARE					0x0A
#define STATUS_errVENDOR					0x0B
#define STATUS_errUSBR						0x0C
#define STATUS_errPOR						0x0D
#define STATUS_errUNKNOWN					0x0E
#define STATUS_errSTALLEDPKT				0x0F

#define ATTR_DNLOAD_CAPABLE					0x01
#define ATTR_UPLOAD_CAPABLE					0x02
#define ATTR_MANIFESTATION_TOLERANT			0x04
#define ATTR_WILL_DETACH					0x08
#define ATTR_ST_CAN_ACCELERATE				0x80

// Structures
////////////////////////////////////////////////////////////////////////////////

#pragma pack(push, b_align, 1)

	//**************************************************************************
	//	DFUSTATUS Structure
	//**************************************************************************

#define TYPE_DFUSTATUS
	typedef struct  
	{
		UCHAR bStatus;
		UCHAR bwPollTimeout[3];
		UCHAR bState;
		UCHAR iString;
	}	DFUSTATUS,  *PDFUSTATUS;


	//**************************************************************************
	//	DFU Functional Descriptor
	//**************************************************************************
 
	typedef struct  _DFU_FUNCTIONAL_DESCRIPTOR
	{
		UCHAR bLength;
		UCHAR bDescriptorType; // Should be 0x21
		UCHAR bmAttributes;
		USHORT wDetachTimeOut;
		USHORT wTransfertSize;
		USHORT bcdDFUVersion;
	}	DFU_FUNCTIONAL_DESCRIPTOR, *PDFU_FUNCTIONAL_DESCRIPTOR;

#pragma pack(pop, b_align)

////////////////////////////////////////////////////////////////////////////////

//******************************************************************************
// STDFU_GetDeviceDescriptor : Gets the device descriptor
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   pDesc: buffer the descriptor will be copied to.
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_GetDeviceDescriptor	(PHANDLE phDle,
											 PUSB_DEVICE_DESCRIPTOR pDesc);

//******************************************************************************
// STDFU_GetDFUDescriptor :  Gets the DFU descriptor
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   pDesc: buffer the DFU descriptor will be copied to.
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_GetDFUDescriptor		(PHANDLE phDevice, 
									   PUINT pDFUInterfaceNum,
									   PUINT pNbOfAlternates,
									   PDFU_FUNCTIONAL_DESCRIPTOR pDesc);

//******************************************************************************
// STDFU_GetStringDescriptor: Gets the string descriptor
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   nIndex: desired string descriptor Index. If this index is too high, this 
//           function will return an error.
//   szString: buffer the string descriptor will be copied to
//   nStringLength: bufffer size
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_GetStringDescriptor	(PHANDLE phDle, 
											 DWORD Index, 
											 LPSTR szString, 
											 UINT nStringLength);

//******************************************************************************
// STDFU_GetNbOfConfigurations: Gets Configurations number
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   pNbOfConfigs: pointer to the configuration's number
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_GetNbOfConfigurations(PHANDLE phDle, PUINT pNbOfConfigs);

//******************************************************************************
// STDFU_GetConfigurationDescriptor: Gets the congiguration descriptor
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   nConfigIdx : Number of the selected Configuration
//   pDesc: buffer the descriptor will be copied to.
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_GetConfigurationDescriptor(PHANDLE phDle, 
												  UINT nConfigIdx, 
												  PUSB_CONFIGURATION_DESCRIPTOR pDesc);
//******************************************************************************
// STDFU_GetNbOfInterfaces: Gets Interfaces Number
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   nConfigIdx : Number of the selected Configuration
//   pNbOfInterfaces: pointer to Interfaces Number
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************


STDFU_API STDFU_GetNbOfInterfaces(PHANDLE phDle, 
										 UINT nConfigIdx, 
										 PUINT pNbOfInterfaces);

//******************************************************************************
// STDFU_GetNbOfAlternates: Gets Alternate Setting's Number
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   nConfigIdx : Number of the selected Configuration
//   nInterfaceIdx : Number of the selected Interface
//   pNbOfAltSets: pointer to Alternate Setting's Number
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_GetNbOfAlternates(PHANDLE phDle, 
										 UINT nConfigIdx, 
										 UINT nInterfaceIdx, 
										 PUINT pNbOfAltSets);

//******************************************************************************
// STDFU_GetInterfaceDescriptor: Gets the interface descriptor
// Parameters:
//   Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//   nConfigIdx : Number of the selected Configuration
//   nInterfaceIdx : Number of the selected Interface
//   nAltSetIdx : Number of the selected Alternate Setting
//   pDesc: buffer the descriptor will be copied to.
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_GetInterfaceDescriptor(PHANDLE phDle, 
											  UINT nConfigIdx, 
											  UINT nInterfaceIdx, 
											  UINT nAltSetIdx, 
											  PUSB_INTERFACE_DESCRIPTOR pDesc);





//******************************************************************************
// STDFU_Open: Opens the DFU driver, giving access to its descriptor
// Parameters:
//	Num: Number of the selected DFU Device (Given by STDFU_EnumGetNbDevices)
//                 
//  phDevice: handle returned by the function while the driver is successfully
//             open
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Open			(LPSTR szDevicePath, PHANDLE phDevice);

//******************************************************************************
// STDFU_Close: Closes the DFU driver
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
// Returned: STDFU_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Close		(PHANDLE phDevice);

//******************************************************************************
// STDFU_Detach: issues a Detach request on the Control Pipe (Endpoint0)
//                             
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Detach		(PHANDLE phDevice, UCHAR DFUInterfaceNumber );

//******************************************************************************
// STDFU_SelectCurrentConfiguration: selects the currently active mode for
//              a device, giving the configuration, the interface and the 
//              alternate setting. The pipes must be in closed state for this
//              function to success
// Parameters:
//   hDevice: handle returned by the function STDevice_Open
//   nConfigIdx: number of the desired configuration 
//   nInterfaceIdx: number of the desired interface
//   nAltSetIdx: number of the desired alternate setting
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_SelectCurrentConfiguration(PHANDLE phDevice,
												  UINT nConfigIdx,
												  UINT nInterfaceIdx,
												  UINT nAltSetIdx);
//******************************************************************************
// STDFU_Dnload: issues a Download request on the Control Pipe (Endpoint0)
//                             
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
//   Buffer: Buffer of Data
//   nBytes: Number of data to be downloaded
//   nBlock: Number of data block to be downloaded  
//   nAlternate: Number of Alternate Settings
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Dnload		(PHANDLE phDevice, UCHAR *pBuffer, 
									 ULONG nBytes, USHORT nBlock);

//******************************************************************************
// STDFU_Upload: issues an Upload request on the Control Pipe (Endpoint0)
//                             
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
//   Buffer: Buffer of Data
//   nBytes: Number of data to be uploaded
//   nBlock: Number of data block to be uploaded  
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Upload		(PHANDLE phDevice, UCHAR *pBuffer, 
									 ULONG nBytes, USHORT nBlock);
	
//******************************************************************************
// STDFU_Getstatus: issues a GetStatus request on the Control Pipe (Endpoint0)
//                             
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
//   DfuStatus: structure containing DFU Status structure  
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Getstatus	(PHANDLE phDevice, DFUSTATUS *DfuStatus);

//******************************************************************************
// STDFU_Clrstatus: issues a ClearStatus request on the Control Pipe (Endpoint0)
//                             
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Clrstatus	(PHANDLE phDevice);

//******************************************************************************
// STDFU_Getstate: issues a GetState request on the Control Pipe (Endpoint0)
//                             
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
//	 pState  : pointer to a DFU State
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Getstate		(PHANDLE phDevice, UCHAR *pState);

//******************************************************************************
// STDFU_Abort: issues an Abort request on the Control Pipe (Endpoint0)
//                             
// Parameters:
//   phDevice: pointer to handle returned by the function STDevice_Open
// Returned: STDEVICE_NOERROR = SUCCESS, Error otherwise (Error Code)
//******************************************************************************

STDFU_API STDFU_Abort		(PHANDLE phDevice);

#endif // _STDFU_H_