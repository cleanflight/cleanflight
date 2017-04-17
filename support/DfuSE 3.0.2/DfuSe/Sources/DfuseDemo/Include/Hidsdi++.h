/*++

Copyright (c) 1996    Microsoft Corporation

Module Name:

    HIDDLL.H

Abstract:

    This module contains the PUBLIC definitions for the
    code that implements the HID dll.

Environment:

    Kernel & user mode

Revision History:

    Aug-96 : created by Kenneth Ray

--*/


#ifndef _HIDSDI_H
#define _HIDSDI_H

//#include "wtypes.h"

//#include <windef.h>
//#include <win32.h>
//#include <basetyps.h>

typedef LONG NTSTATUS;
#include "hidusage.h"
#include "hidpi++.h"

typedef struct _HIDD_CONFIGURATION {
    PVOID    cookie;
    ULONG    size;
    ULONG    RingBufferSize;
} HIDD_CONFIGURATION, *PHIDD_CONFIGURATION;

typedef struct _HIDD_ATTRIBUTES {
    ULONG   Size; // = sizeof (struct _HIDD_ATTRIBUTES)

    //
    // Vendor ids of this hid device
    //
    USHORT  VendorID;
    USHORT  ProductID;
    USHORT  VersionNumber;

    //
    // Additional fields will be added to the end of this structure.
    //
} HIDD_ATTRIBUTES, *PHIDD_ATTRIBUTES;


extern "C" BOOLEAN __stdcall
HidD_GetAttributes (
    IN  HANDLE              HidDeviceObject,
    OUT PHIDD_ATTRIBUTES    Attributes
    );
/*++
Routine Description:
    Fill in the given HIDD_ATTRIBUTES structure with the attributes of the
    given hid device.

--*/


extern "C" void __stdcall
HidD_GetHidGuid (
   OUT   LPGUID   HidGuid
   );

extern "C" BOOLEAN __stdcall
HidD_GetPreparsedData (
   IN    HANDLE                  HidDeviceObject,
   OUT   PHIDP_PREPARSED_DATA  * PreparsedData
   );
/*++
Routine Description:
   Given a handle to a valid Hid Class Device Oject retrieve the preparsed data.
   This routine will ``malloc'' the apropriately size buffer to hold this
   preparsed data.  It is up to the caller to then free that data at the
   caller's conveniance.

Arguments:
   HidDeviceObject a handle to a HidDeviceObject.  The client can obtain this
                   handle via a create file on a string name of a Hid device.
                   This string name can be obtained using standard PnP calls.
   PreparsedData   an opaque data used by other functions in this library to
                   retreive information about a given device.

Return Value:
   TRUE if successful.

   errors returned by DeviceIoControl

--*/

extern "C" BOOLEAN __stdcall
HidD_FreePreparsedData (
   IN    PHIDP_PREPARSED_DATA PreparsedData
   );


extern "C" BOOLEAN __stdcall
HidD_FlushQueue (
   IN    HANDLE                HidDeviceObject
   );
/*++
Routine Description:
   Flush the input queue for the given HID device.

Arguments:
   HidDeviceObject a handle to a HidDeviceObject.  The client can obtain this
                   handle via a create file on a string name of a Hid device.
                   This string name can be obtained using standard PnP calls.

Return Value:
   TRUE if successful

   errors returned by DeviceIoControl
--*/


extern "C" BOOLEAN __stdcall
HidD_GetConfiguration (
   IN   HANDLE               HidDeviceObject,
   OUT  PHIDD_CONFIGURATION  Configuration,
   IN   ULONG                ConfigurationLength
   );
/*++
Routine Description:
   Get the configuration information for this hid device

Arguments:
   HidDeviceObject a handle to a HidDeviceObject.
   Configuration a configuration structure.  You MUST call HidD_GetConfiguration
                 before you can modify the configuration and use
                 HidD_SetConfiguration.
   ConfigurationLength that is ``sizeof (HIDD_CONFIGURATION)'' using this
                 parameter we can later increase the length of the configuration
                 array and maybe not break older apps.

Return Value:
same as others
--*/

extern "C" BOOLEAN __stdcall
HidD_SetConfiguration (
   IN   HANDLE               HidDeviceObject,
   IN   PHIDD_CONFIGURATION  Configuration,
   IN   ULONG                ConfigurationLength
   );
/*++
Routine Description:
   Set the configuration information for this hid device

Arguments:
   HidDeviceObject a handle to a HidDeviceObject.
   Configuration a configuration structure.  You MUST call HidD_GetConfiguration
                 before you can modify the configuration and use
                 HidD_SetConfiguration.
   ConfigurationLength that is ``sizeof (HIDD_CONFIGURATION)'' using this
                 parameter will allow us later to inclrease the size of the
                 configuration structure.


Return Value:
same as others
--*/

extern "C" BOOLEAN __stdcall
HidD_GetFeature (
   IN    HANDLE   HidDeviceObject,
   OUT   PVOID    ReportBuffer,
   IN    ULONG    ReportBufferLength
   );
/*++
Routine Description:
   Retrieve a feature report from a HID device.

--*/

extern "C" BOOLEAN __stdcall
HidD_SetFeature (
   IN    HANDLE   HidDeviceObject,
   IN    PVOID    ReportBuffer,
   IN    ULONG    ReportBufferLength
   );
/*++
Routine Description:
   Send a feature report to a HID device.

--*/

extern "C" BOOLEAN __stdcall
HidD_GetNumInputBuffers (
    IN  HANDLE  HidDeviceObject,
    OUT PULONG  NumberBuffers
    );
extern "C" BOOLEAN __stdcall
HidD_SetNumInputBuffers (
    IN  HANDLE HidDeviceObject,
    OUT ULONG  NumberBuffers
    );
/*++

Routine Description:
    Number of hid packets actually retained

--*/

extern "C" BOOLEAN __stdcall
HidD_GetPhysicalDescriptor (
   IN    HANDLE   HidDeviceObject,
   OUT   PVOID    Buffer,
   IN    ULONG    BufferLength
   );

extern "C" BOOLEAN __stdcall
HidD_GetManufacturerString (
   IN    HANDLE   HidDeviceObject,
   OUT   PVOID    Buffer,
   IN    ULONG    BufferLength
   );

extern "C" BOOLEAN __stdcall
HidD_GetProductString (
   IN    HANDLE   HidDeviceObject,
   OUT   PVOID    Buffer,
   IN    ULONG    BufferLength
   );

extern "C" BOOLEAN __stdcall
HidD_GetSerialNumberString (
   IN    HANDLE   HidDeviceObject,
   OUT   PVOID    Buffer,
   IN    ULONG    BufferLength
   );


#endif
