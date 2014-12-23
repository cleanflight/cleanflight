/*++

Copyright (c) 1995      Microsoft Corporation

Module Name:

        USBIOCTL.H

Abstract:

   structures common to the USBD and USB device drivers.

Environment:

    Kernel & user mode

Revision History:

    09-29-95 : created
    01-06-97 : added user mode hub ioctls

--*/

#ifndef   __USBIOCTL_H__
#define   __USBIOCTL_H__

#include "usb100.h"

#ifndef FAR
#define FAR
#endif

DEFINE_GUID( GUID_CLASS_USBHUB, 0xf18a0e88, 0xc30c, 0x11d0, 0x88, 0x15, 0x00, \
             0xa0, 0xc9, 0x06, 0xbe, 0xd8);

//f18a0e88-c30c-11d0-8815-00a0c906bed8


// BUGBUG we need a device type added to DEVIOCTL.H
#define FILE_DEVICE_USB         FILE_DEVICE_UNKNOWN

//
// USB IOCTLS
//

#define USB_IOCTL_INTERNAL_INDEX       0x0000
#define USB_IOCTL_INDEX                0x00ff

//
// USB Internal IOCtls
//

/* IOCTL_INTERNAL_USB_SUBMIT_URB 

   This IOCTL is used by client drivers to submit URB (USB Request Blocks)

   Parameters.Others.Argument1 = pointer to URB
   
*/

#define IOCTL_INTERNAL_USB_SUBMIT_URB  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INTERNAL_INDEX,  \
                                                METHOD_NEITHER,  \
                                                FILE_ANY_ACCESS)


/* IOCTL_INTERNAL_USB_RESET_PORT 
*/

#define IOCTL_INTERNAL_USB_RESET_PORT  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INTERNAL_INDEX+1, \
                                                METHOD_NEITHER,  \
                                                FILE_ANY_ACCESS)
                                                

/*  IOCTL_INTERNAL_USB_GET_ROOTHUB_PDO

    This IOCTL is used internally by the hub driver
    
    Parameters.Others.Argument1 = pointer to be filled in with RootHubPdo;
    Parameters.Others.Argument2 = pointer to be filled in with HcdDeviceObject;
        
*/

#define IOCTL_INTERNAL_USB_GET_ROOTHUB_PDO  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INTERNAL_INDEX+3, \
                                                METHOD_NEITHER,  \
                                                FILE_ANY_ACCESS)



/* IOCTL_INTERNAL_USB_GET_PORT_STATUS

    This IOCTL returns the current port status

    Parameters.Others.Argument1 = pointer to port status register (ULONG)

    status bits are:
    
    USBD_PORT_ENABLED
    
*/

#define  USBD_PORT_ENABLED      0x00000001
#define  USBD_PORT_CONNECTED    0x00000002


#define IOCTL_INTERNAL_USB_GET_PORT_STATUS  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INTERNAL_INDEX+4, \
                                                METHOD_NEITHER,  \
                                                FILE_ANY_ACCESS)                                                

/* IOCTL_INTERNAL_USB_ENABLE_PORT

    This IOCTL will request the hub to re-enable a disabled port
*/

#define IOCTL_INTERNAL_USB_ENABLE_PORT      CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INTERNAL_INDEX+5, \
                                                METHOD_NEITHER,  \
                                                FILE_ANY_ACCESS)                                                
                                                
/* IOCTL_INTERNAL_USB_GET_HUB_COUNT

    This IOCTL is used internally by the hub driver
    
    Parameters.Others.Argument1 = pointer to be count of hubs in chain;
    
*/
#define IOCTL_INTERNAL_USB_GET_HUB_COUNT      CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INTERNAL_INDEX+6, \
                                                METHOD_NEITHER,  \
                                                FILE_ANY_ACCESS)                                                      

/* IOCTL_INTERNAL_USB_CYCLE_PORT 

    This will simulate a plug/unplug on the port
*/

#define IOCTL_INTERNAL_USB_CYCLE_PORT  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INTERNAL_INDEX+7, \
                                                METHOD_NEITHER,  \
                                                FILE_ANY_ACCESS)
                                                
                                                
//
// USB Public IOCtls
//

//
// this ioctl is for adding debug hooks to HCDs
//

#define IOCTL_USB_HCD_GET_STATS          CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)

//
// These ioctls are used for USB diagnostic and test applications
// 

#define IOCTL_USB_DIAGNOSTIC_MODE_ON   CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+1,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)                                                

#define IOCTL_USB_DIAGNOSTIC_MODE_OFF  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+2,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)

#define IOCTL_USB_GET_ROOT_HUB_NAME  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+3,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)                                                    

/*
    Utility IOCTLS supported by the hub device
*/

//
// These ioctls are supported by the hub driver for 
// use by user mode USB utilities.
//


#define IOCTL_USB_GET_NODE_INFORMATION                  CTL_CODE(FILE_DEVICE_USB,  \
                                               USB_IOCTL_INDEX+3,  \
                                               METHOD_BUFFERED,  \
                                               FILE_ANY_ACCESS)

#define IOCTL_USB_GET_NODE_CONNECTION_INFORMATION       CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+4,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)

#define IOCTL_USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION   CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+5,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)

#define IOCTL_USB_GET_NODE_CONNECTION_NAME     CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+6,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)                                                

#define IOCTL_USB_DIAG_IGNORE_HUBS_ON   CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+7,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)                                                

#define IOCTL_USB_DIAG_IGNORE_HUBS_OFF  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+8,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)

#define IOCTL_USB_GET_NODE_CONNECTION_DRIVERKEY_NAME  CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+9,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)

#define IOCTL_GET_HCD_DRIVERKEY_NAME CTL_CODE(FILE_DEVICE_USB,  \
                                                USB_IOCTL_INDEX+10,  \
                                                METHOD_BUFFERED,  \
                                                FILE_ANY_ACCESS)
//
// structures for user mode ioctls
//

#pragma pack (1)

typedef enum _USB_HUB_NODE {
    UsbHub,
    UsbMIParent
} USB_HUB_NODE;

typedef struct _USB_HUB_INFORMATION {
    //
    // copy of data from hub descriptor 
    //
    USB_HUB_DESCRIPTOR HubDescriptor;

    BOOLEAN HubIsBusPowered;

} USB_HUB_INFORMATION, *PUSB_HUB_INFORMATION;

typedef struct _USB_MI_PARENT_INFORMATION {
    ULONG NumberOfInterfaces;
} USB_MI_PARENT_INFORMATION, *PUSB_MI_PARENT_INFORMATION;

typedef struct _USB_NODE_INFORMATION {
    USB_HUB_NODE NodeType;        // hub, mi parent
    union {
        USB_HUB_INFORMATION HubInformation;
        USB_MI_PARENT_INFORMATION MiParentInformation;
    } u;
} USB_NODE_INFORMATION, *PUSB_NODE_INFORMATION;	

typedef struct _USB_PIPE_INFO {
    USB_ENDPOINT_DESCRIPTOR EndpointDescriptor;
} USB_PIPE_INFO, PUSB_PIPE_INFO;	

//
// BUGBUG
// more status codes?
//

typedef enum _USB_CONNECTION_STATUS {
    NoDeviceConnected,
    DeviceConnected,

    // failure codes, these map to fail reasons
    DeviceFailedEnumeration, 
    DeviceGeneralFailure,
    DeviceCausedOvercurrent,
    DeviceNotEnoughPower,
} USB_CONNECTION_STATUS, *PUSB_CONNECTION_STATUS;

typedef struct _USB_NODE_CONNECTION_INFORMATION {
    ULONG ConnectionIndex;
    // usb device descriptor returned by this device
    // during enumeration
    USB_DEVICE_DESCRIPTOR DeviceDescriptor;
    UCHAR CurrentConfigurationValue;
    BOOLEAN LowSpeed;

    BOOLEAN DeviceIsHub;

    USHORT DeviceAddress;
    
    ULONG NumberOfOpenPipes;
    
    USB_CONNECTION_STATUS ConnectionStatus;
    USB_PIPE_INFO PipeList[0];
} USB_NODE_CONNECTION_INFORMATION, *PUSB_NODE_CONNECTION_INFORMATION;	

typedef struct _USB_NODE_CONNECTION_DRIVERKEY_NAME {
    ULONG ConnectionIndex;  // INPUT
    ULONG ActualLength;     // OUTPUT
    // unicode name for the devnode.
    WCHAR DriverKeyName[1];      // OUTPUT
} USB_NODE_CONNECTION_DRIVERKEY_NAME, *PUSB_NODE_CONNECTION_DRIVERKEY_NAME;	

typedef struct _USB_NODE_CONNECTION_NAME {
    ULONG ConnectionIndex;  // INPUT
    ULONG ActualLength;     // OUTPUT
    // unicode symbolic name for this node if it is a hub or parent driver
    // null if this node is a device.
    WCHAR NodeName[1];      // OUTPUT
} USB_NODE_CONNECTION_NAME, *PUSB_NODE_CONNECTION_NAME;	

typedef struct _USB_ROOT_HUB_NAME {
    ULONG ActualLength;     // OUTPUT
    // NULL terminated unicode symbolic name for the root hub
    WCHAR RootHubName[1];   // OUTPUT
} USB_ROOT_HUB_NAME, *PUSB_ROOT_HUB_NAME;	

typedef struct _USB_HCD_DRIVERKEY_NAME {
    ULONG ActualLength;     // OUTPUT
    // NULL terminated unicode driverkeyname for hcd
    WCHAR DriverKeyName[1];   // OUTPUT
} USB_HCD_DRIVERKEY_NAME, *PUSB_HCD_DRIVERKEY_NAME;	

typedef struct _USB_DESCRIPTOR_REQUEST {
    ULONG ConnectionIndex;
    struct {
        UCHAR bmRequest;
        UCHAR bRequest;
        USHORT wValue;
        USHORT wIndex;
        USHORT wLength;
    } SetupPacket;
    UCHAR Data[0];
} USB_DESCRIPTOR_REQUEST, *PUSB_DESCRIPTOR_REQUEST;	


//
// Structure for returning HCD debug and statistic information to
// a user mode application.
//

typedef struct _HCD_STAT_COUNTERS {
    ULONG BytesTransferred;

    USHORT IsoMissedCount;
    USHORT DataOverrunErrorCount;

    USHORT CrcErrorCount;
    USHORT ScheduleOverrunCount;

    USHORT TimeoutErrorCount;
    USHORT InternalHcErrorCount;

    USHORT BufferOverrunErrorCount;
    USHORT SWErrorCount;

    USHORT StallPidCount;
    USHORT PortDisableCount;

} HCD_STAT_COUNTERS, *PHCD_STAT_COUNTERS;


typedef struct _HCD_STAT_INFORMATION {
    ULONG Reserved1;
    ULONG Reserved2;
    ULONG ResetCounters;
    LARGE_INTEGER TimeRead;
    //
    // stat registers
    //
    HCD_STAT_COUNTERS Counters;  

} HCD_STAT_INFORMATION, *PHCD_STAT_INFORMATION;


#pragma pack()


#endif // __USBIOCTL_H__                                               
