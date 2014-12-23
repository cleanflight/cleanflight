/*++

Copyright (c) 1996    Microsoft Corporation

Module Name:

    HIDDLL.H

Abstract:

    This module contains the PUBLIC definitions for the
    code that implements the driver side of the parsing library.

Environment:

    Kernel & user mode

Revision History:

    Aug-96 : created by Kenneth Ray

--*/

#ifndef _HIDPDDI_H
#define _HIDPDDI_H

#include "hidusage.h"
#include "hidpi.h"


typedef struct _HIDP_COLLECTION_DESC
{
   USAGE       UsagePage;
   USAGE       Usage;

   UCHAR       CollectionNumber;
   UCHAR       Reserved [15]; // Must be zero

   USHORT      InputLength;
   USHORT      OutputLength;
   USHORT      FeatureLength;
   USHORT      PreparsedDataLength;

   PHIDP_PREPARSED_DATA             PreparsedData;
} HIDP_COLLECTION_DESC, *PHIDP_COLLECTION_DESC;

typedef struct _HIDP_REPORT_IDS
{
   UCHAR             ReportID;
   UCHAR             CollectionNumber;
   USHORT            InputLength;
   USHORT            OutputLength;
   USHORT            FeatureLength;
} HIDP_REPORT_IDS, *PHIDP_REPORT_IDS;

typedef struct _HIDP_GETCOLDESC_DBG
{
   ULONG    BreakOffset;
   ULONG    ErrorCode;
   ULONG    Args[6];
} HIDP_GETCOLDESC_DBG, *PHIDP_GETCOLDESC_DBG;

typedef struct _HIDP_DEVICE_DESC
{
   PHIDP_COLLECTION_DESC    CollectionDesc; // Array allocated By Parser
   ULONG                    CollectionDescLength;
   PHIDP_REPORT_IDS         ReportIDs; // Array allocated By Parsre
   ULONG                    ReportIDsLength;
   HIDP_GETCOLDESC_DBG      Dbg;
} HIDP_DEVICE_DESC, *PHIDP_DEVICE_DESC;

NTSTATUS
HidP_GetCollectionDescription (
   IN  PHIDP_REPORT_DESCRIPTOR   ReportDesc,
   IN  ULONG                     DescLength,
   IN  POOL_TYPE                 PoolType,
   OUT PHIDP_DEVICE_DESC         DeviceDescription
   );
/*++
Routine Description:
   Given a RAW report descriptor return a linked list of collection descriptors
   describing the given device.  This data is allocated from NON_PAGED pool.

Arguments:
   ReportDesc            the raw report descriptor.
   DescLength            the length of the report descriptor.
   PoolType              pool type sent to ExAllocatePoolWithTag.
   CollectionDesc        Pointer an array of collection descriptors.
   CollectionDescLength  the length of said array.

Return Value:
·  STATUS_SUCCESS
·  STATUS_COULD_NOT_INTERPRET an error detected in the report descriptor.
·  STATUS_BUFFER_TOO_SMALL if while parsing an item, with additional bytes
                        of information, the library finds itself at the end of
                        the descriptor.
·  STATUS_INVALID_PARAMETER an invalid item is discovered in the report.
·  STATUS_INVALID_PARAMETER_MIX if local and global modifiers improperly
                        match up with a main item.
--*/

VOID
HidP_FreeCollectionDescription (
    IN  PHIDP_DEVICE_DESC   DeviceDescription
    );
/*++
Routine Description:
    Free the resources within PHIDP_DEVICE_DESC structure.
    Do not free the pointer to DeviceDescription itself.

--*/


//
// HIDP_POWER_EVENT is an entry point into hidparse.sys that will answer the
// Power iocontrol "IOCTL_GET_SYS_BUTTON_EVENT".
//
// HidPacket is the from the device AFTER modifying to add the
// obligatory report ID.  Remember that in order to use this parser the data
// from the device must be formated such that if the device does not return a
// report ID as the first byte that the report is appended to a report id byte
// of zero.
//
NTSTATUS
HidP_SysPowerEvent (
    IN  PCHAR                   HidPacket,
    IN  USHORT                  HidPacketLength,
    IN  PHIDP_PREPARSED_DATA    Ppd,
    OUT PULONG                  OutputBuffer
    );

//
// HIDP_POWER_CAPS answers IOCTL_GET_SYS_POWER_BUTTON_CAPS
//
NTSTATUS
HidP_SysPowerCaps (
    IN  PHIDP_PREPARSED_DATA    Ppd,
    OUT PULONG                  OutputBuffer
    );


#define HIDP_GETCOLDESC_SUCCESS              0x00
#define HIDP_GETCOLDESC_RESOURCES            0x01
// Insufficient resources to allocate needed memory.

#define HIDP_GETCOLDESC_BUFFER               0x02
#define HIDP_GETCOLDESC_LINK_RESOURCES       0x03
#define HIDP_GETCOLDESC_UNEXP_END_COL        0x04
// An extra end collection token was found.

#define HIDP_GETCOLDESC_PREPARSE_RESOURCES   0x05
// Insufficient resources to allocate memory for preparsing.

#define HIDP_GETCOLDESC_ONE_BYTE             0x06
#define HIDP_GETCOLDESC_TWO_BYTE             0x07
#define HIDP_GETCOLDESC_FOUR_BYTE            0x08
// One two and four more byte were expected but not found.

#define HIDP_GETCOLDESC_BYTE_ALLIGN          0x09
// The top level collection was not Byte alligned.
// Args[0~2] are bit lengths of Input Output and Report to this point

#define HIDP_GETCOLDESC_MAIN_ITEM_NO_USAGE   0x0A
// A non constant main item was declaired without a corresponding usage.
// only constant main items are allowed with no usage (used of padding).

#define HIDP_GETCOLDESC_TOP_COLLECTION_USAGE 0x0B
// The top level collection (Arg[0]) was declaired with no usage
// or with more than one usage.
// This parser does not support delimiters for top level collections.

#define HIDP_GETCOLDESC_PUSH_RESOURCES       0x10
// Insufficient resources required to push more on the usage stack

#define HIDP_GETCOLDESC_ITEM_UNKNOWN         0x12
// The item in Args[0] is unknown

#define HIDP_GETCOLDESC_REPORT_ID            0x13
// Report ID outside of top level collection. Args[0] is report ID in question
#define HIDP_GETCOLDESC_BAD_REPORT_ID        0x14
// A disallowed report ID was discovered.
#define HIDP_GETCOLDESC_NO_REPORT_ID         0x15
// The parser discovered a top level collection in a complex device (more
// than one top level collection) that had no declared report ID.
// Offending Collection number in Args[0].
#define HIDP_GETCOLDESC_DEFAULT_ID_ERROR     0x16
// If there is a report ID declaration in the report descriptor, or if there
// is more than one top level collection (which would inply that there must be
// a report ID declaration) then at no time can a main item be declared that
// did not have a report ID as part of it global state information.
// The parser detects this error upon finding a second collection after a
// main item is declared with no report ID, or after seeing mutiple top level
// collections or a report ID declaration and then detecting a main item without
// a report ID declaration.  Remember a report ID cannot span a top level
// collection.
//

#define HIDP_GETCOLDESC_NO_DATA              0x1A
// No top level collections were found in this device.

#define HIDP_GETCOLDESC_INVALID_MAIN_ITEM    0x1B
// A main item was detected outside of a top level collection.

#define HIDP_GETCOLDESC_NO_CLOSE_DELIMITER   0x20
// A start token was found but no end delimiter token found
#define HIDP_GETCOLDESC_NOT_VALID_DELIMITER  0x21
// only usages, are allowed inside a delimeter.
// see arg[0] for the offending token.
#define HIDP_GETCOLDESC_MISMATCH_OC_DELIMITER   0x22

#define HIDP_GETCOLDESC_UNSUPPORTED          0x40
// The given report descriptor was found to have a valid report descriptor
// containing a scenerio that this parser does not support.
// (like for instance declairing a ARRAY style main item with delimiters.

#endif

