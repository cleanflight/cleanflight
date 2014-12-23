/*++
Copyright (c) 1997  Microsoft Corporation

Module Name:

    USBHUB.C

Abstract:

    This module contains the common public declarations for the game port
    enumerator.

Author:

    Kenneth Ray

Environment:

    kernel mode only

Notes:


Revision History:


--*/


#ifndef __GAMEPORT_H
#define __GAMEPORT_H

#define FILE_DEVICE_GAMEENUM         FILE_DEVICE_BUS_EXTENDER

// ***************************************************************************
// IOCTL interface to the bus (fdo)
//
// Clients use this to tell the enumerator what gaming devices on legacy ports
// exist.  (like for instance a control panel)
// ***************************************************************************

//
// Define an Interface Guid to access the game port enumerator
//

#undef FAR
#define FAR
#undef PHYSICAL_ADDRESS
#define PHYSICAL_ADDRESS LARGE_INTEGER

DEFINE_GUID (GUID_GAMEENUM_BUS_ENUMERATOR, 0xcae56030, 0x684a, 0x11d0, 0xd6, 0xf6, 0x00, 0xa0, 0xc9, 0x0f, 0x57, 0xda);
//  cae56030-684a-11d0-b6f6-00a0c90f57da

#define GAMEENUM_IOCTL(_index_) \
    CTL_CODE (FILE_DEVICE_GAMEENUM, _index_, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define GAMEENUM_INTERNAL_IOCTL(_index_) \
    CTL_CODE (FILE_DEVICE_GAMEENUM, _index_, METHOD_NEITHER, FILE_ANY_ACCESS)

#define IOCTL_GAMEENUM_EXPOSE_HARDWARE  GAMEENUM_IOCTL (0x0)
#define IOCTL_GAMEENUM_REMOVE_HARDWARE  GAMEENUM_IOCTL (0x1)
#define IOCTL_GAMEENUM_PORT_DESC        GAMEENUM_IOCTL (0x2)

typedef struct _GAMEENUM_EXPOSE_HARDWARE
{
    IN  ULONG   Size; // sizeof (struct _GAMEENUM_HARDWARE)
    IN  PVOID   PortHandle; // The handle of the port found in the port desc
    OUT PVOID   HardwareHandle; // A handle to the exposed PDO)
    IN  USHORT  NumberJoysticks; // For legacy joysticks only
    IN  USHORT  NumberAxis; // legacy joysticks only (joysticks * axis <= 4).
    IN  USHORT  UnitID;
        USHORT  Reserved [7];
    IN  WCHAR   HardwareIDs[]; // An array of (zero terminated wide character
                           // strings).  The array itself also null terminated
} GAMEENUM_EXPOSE_HARDWARE, *PGAMEENUM_EXPOSE_HARDWARE;


typedef struct _GAMEENUM_REMOVE_HARDWARE
{
    IN ULONG   Size; // sizeof (struct _REMOVE_HARDWARE)
    IN PVOID   HardwareHandle;
} GAMEENUM_REMOVE_HARDWARE, *PGAMEENUM_REMOVE_HARDWARE;


typedef struct _GAMEENUM_PORT_DESC
{
    IN  ULONG               Size; // sizeof (struct _PORT_DESC)
    OUT PVOID               PortHandle;
    OUT PHYSICAL_ADDRESS    PortAddress;
        ULONG               Reserved [5];
} GAMEENUM_PORT_DESC, * PGAMEENUM_PORT_DESC;

// **************************************************************************
// Internal IOCTL interface for (pdo)
// The HID to legacy game port minidriver uses this interface to
// find the address of the device.
// **************************************************************************

#define GAMEENUM_INTERNAL_IOCTL_GET_PORT_PARAMETERS \
    GAMEENUM_INTERNAL_IOCTL (0x100)
#define GAMEENUM_INTERNAL_IOCTL_EXPOSE_SIBLING \
    GAMEENUM_INTERNAL_IOCTL (0x101)
#define GAMEENUM_INTERNAL_IOCTL_REMOVE_SELF \
    GAMEENUM_INTERNAL_IOCTL (0x102)

// of which IO_STACK_LOCATION->Parameters.Others.Argument1 is set to
// a pointer to struct _GAMEENUM_GAME_PARAMETERS

typedef
UCHAR
(*PGAMEENUM_READPORT) (
    PVOID  GamePortAddres
    );

typedef
VOID
(*PGAMEENUM_WRITEPORT) (
    PVOID  GamePortAddress,
    UCHAR   Value
    );

typedef enum _GAMEENUM_PORTION {
    GameenumFirstHalf,
    GameenumSecondHalf,
    GameenumWhole
} GAMEENUM_PORTION;

typedef struct _GAMEENUM_PORT_PARAMETERS
{
    IN  ULONG               Size; // sizeof (GAMEENUM_GET_PORT_PARAMETERS)

    OUT PGAMEENUM_READPORT  ReadAccessor;  // read the game port
    OUT PGAMEENUM_WRITEPORT WriteAccessor;  // write the game port
    OUT PVOID               GamePortAddress; // token to read this game port

    OUT PVOID               HardwareHandle; // a handle to this particular PDO.
    OUT GAMEENUM_PORTION    Portion;
    OUT USHORT              NumberAxis; // legacy joysticks only
    OUT USHORT              UnitID;

        ULONG               Reserved [8];
} GAMEENUM_PORT_PARAMETERS, *PGAMEENUM_PORT_PARAMETERS;

typedef struct _GAMEENUM_EXPOSE_SIBLING
{
    IN  ULONG   Size; // sizeof (struct _GAMEENUM_HARDWARE)
    OUT PVOID   HardwareHandle; // A handle to the exposed PDO)
    IN  USHORT  UnitID;
        USHORT  Reserved [3];
} GAMEENUM_EXPOSE_SIBLING, *PGAMEENUM_EXPOSE_SIBLING;

#endif


