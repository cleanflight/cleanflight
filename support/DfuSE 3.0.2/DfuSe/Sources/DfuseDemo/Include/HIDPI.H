 /*++

Copyright (c) 1996      Microsoft Corporation

Module Name:

        HIDPI.H

Abstract:

   Public Interface to the HID parsing library.

Environment:

    Kernel & user mode

Revision History:

    09-29-95 : created by Kenneth D. Ray

--*/

#ifndef   __HIDPI_H__
#define   __HIDPI_H__

#include <pshpack4.h>

// Please include "hidsdi.h" to use the user space (dll / parser)
// Please include "hidpddi.h" to use the kernel space parser


typedef enum _HIDP_REPORT_TYPE
{
    HidP_Input,
    HidP_Output,
    HidP_Feature
} HIDP_REPORT_TYPE;

typedef struct _USAGE_AND_PAGE
{
    USAGE Usage;
    USAGE UsagePage;
} USAGE_AND_PAGE, *PUSAGE_AND_PAGE;

typedef struct _HIDP_BUTTON_CAPS
{
    USAGE    UsagePage;
    UCHAR    ReportID;
    BOOLEAN  IsAlias;

    USHORT   BitField;
    USHORT   LinkCollection;   // A unique internal index pointer

    USAGE    LinkUsage;
    USAGE    LinkUsagePage;

    BOOLEAN  IsRange;
    BOOLEAN  IsStringRange;
    BOOLEAN  IsDesignatorRange;
    BOOLEAN  IsAbsolute;

    ULONG    Reserved[10];
    union {
        struct {
            USAGE    UsageMin,         UsageMax;
            USHORT   StringMin,        StringMax;
            USHORT   DesignatorMin,    DesignatorMax;
            USHORT   DataIndexMin,     DataIndexMax;
        } Range;
        struct  {
            USAGE    Usage,            Reserved1;
            USHORT   StringIndex,      Reserved2;
            USHORT   DesignatorIndex,  Reserved3;
            USHORT   DataIndex,        Reserved4;
        } NotRange;
    };

} HIDP_BUTTON_CAPS, *PHIDP_BUTTON_CAPS;


typedef struct _HIDP_VALUE_CAPS
{
    USAGE    UsagePage;
    UCHAR    ReportID;
    BOOLEAN  IsAlias;

    USHORT   BitField;
    USHORT   LinkCollection;   // A unique internal index pointer

    USAGE    LinkUsage;
    USAGE    LinkUsagePage;

    BOOLEAN  IsRange;
    BOOLEAN  IsStringRange;
    BOOLEAN  IsDesignatorRange;
    BOOLEAN  IsAbsolute;

    BOOLEAN  HasNull;        // Does this channel have a null report   union
    UCHAR    Reserved;
    USHORT   BitSize;        // How many bits are devoted to this value?

    USHORT   ReportCount;    // See Note below.  Usually set to 1.
    USHORT   Reserved2[5];

    ULONG    UnitsExp;
    ULONG    Units;

    LONG     LogicalMin,       LogicalMax;
    LONG     PhysicalMin,      PhysicalMax;

    union {
        struct {
            USAGE    UsageMin,         UsageMax;
            USHORT   StringMin,        StringMax;
            USHORT   DesignatorMin,    DesignatorMax;
            USHORT   DataIndexMin,     DataIndexMax;
        } Range;

        struct {
            USAGE    Usage,            Reserved1;
            USHORT   StringIndex,      Reserved2;
            USHORT   DesignatorIndex,  Reserved3;
            USHORT   DataIndex,        Reserved4;
        } NotRange;
    };
} HIDP_VALUE_CAPS, *PHIDP_VALUE_CAPS;

//
// Notes:
//
// ReportCount:  When a report descriptor declares an Input, Output, or
// Feature main item with fewer usage declarations than the report count, then
// the last usage applies to all remaining unspecified count in that main item.
// (As an example you might have data that required many fields to describe,
// possibly buffered bytes.)  In this case, only one value cap structure is
// allocated for these associtated fields, all with the same usage, and Report
// Count reflects the number of fields involved.  Normally ReportCount is 1.
//

//
// The link collection tree consists of an array of LINK_COLLECTION_NODES
// where the index into this array is the same as the collection number.
//
// Given a collection A which contains a subcollection B, A is defined to be
// the parent B, and B is defined to be the child.
//
// Given collections A, B, and C where B and C are children of A, and B was
// encountered before C in the report descriptor, B is defined as a sibling of
// C.  (This implies, of course, that if B is a sibling of C, then C is NOT a
// sibling of B).
//
// B is defined as the NextSibling of C if and only if there exists NO
// child collection of A, call it D, such that B is a sibling of D and D
// is a sibling of C.
//
// E is defined to be the FirstChild of A if and only if for all children of A,
// F, that are not equivalent to E, F is a sibling of E.
// (This implies, of course, that the does not exist a child of A, call it G,
// where E is a sibling of G).  In other words the first sibling is the last
// link collection found in the list.
//
// With that in mind, the following describes conclusively a data structure
// that provides direct traversal up, down, and accross the link collection
// tree.
//
//
typedef struct _HIDP_LINK_COLLECTION_NODE
{
    USAGE    LinkUsage;
    USAGE    LinkUsagePage;
    USHORT   Parent;
    USHORT   NumberOfChildren;
    USHORT   NextSibling;
    USHORT   FirstChild;
    ULONG    CollectionType: 8;  // As defined in 6.2.2.6 of HID spec
    ULONG    IsAlias : 1; // This link node is an allias of the next link node.
    ULONG    Reserved: 23;
    PVOID    UserContext; // The user can hang his coat here.
} HIDP_LINK_COLLECTION_NODE, *PHIDP_LINK_COLLECTION_NODE;
//
// When a link collection is described by a delimiter, alias link collection
// nodes are created.  (One for each usage within the delimiter).
// The parser assigns each capability description listed above only one
// link collection.
//
// If a control is defined within a collection defined by
// delimited usages, then that control is said to be within multiple link
// collections, one for each usage within the open and close delimiter tokens.
// Such multiple link collecions are said to be aliases.  The first N-1 such
// collections, listed in the link collection node array, have their IsAlias
// bit set.  The last such link collection is the link collection index used
// in the capabilities described above.
// Clients wishing to set a control in an aliased collection, should walk the
// collection array once for each time they see the IsAlias flag set, and use
// the last link collection as the index for the below accessor functions.
//
// NB: if IsAlias is set, then NextSibling should be one more than the current
// link collection node index.
//

typedef PUCHAR  PHIDP_REPORT_DESCRIPTOR;
typedef struct _HIDP_PREPARSED_DATA * PHIDP_PREPARSED_DATA;

typedef struct _HIDP_CAPS
{
    USAGE    Usage;
    USAGE    UsagePage;
    USHORT   InputReportByteLength;
    USHORT   OutputReportByteLength;
    USHORT   FeatureReportByteLength;
    USHORT   Reserved[17];

    USHORT   NumberLinkCollectionNodes;

    USHORT   NumberInputButtonCaps;
    USHORT   NumberInputValueCaps;
    USHORT   NumberInputDataIndices;

    USHORT   NumberOutputButtonCaps;
    USHORT   NumberOutputValueCaps;
    USHORT   NumberOutputDataIndices;

    USHORT   NumberFeatureButtonCaps;
    USHORT   NumberFeatureValueCaps;
    USHORT   NumberFeatureDataIndices;
} HIDP_CAPS, *PHIDP_CAPS;

typedef struct _HIDP_DATA
{
    USHORT  DataIndex;
    USHORT  Reserved;
    union {
        ULONG   RawValue; // for values
        BOOLEAN On; // for buttons MUST BE TRUE for buttons.
    };
} HIDP_DATA, *PHIDP_DATA;
//
// The HIDP_DATA structure is used with HidP_GetData and HidP_SetData
// functions.
//
// The parser contiguously assigns every control (button or value) in a hid
// device a unique data index from zero to NumberXXXDataIndices, exclusive.
// This value is found in HidP_ButtonCaps and HIDP_VALUE_CAPS and
// HIDP_BUTTON_CAPS structures.
//
// Most clients will find the Get/Set Buttons / Value accessor functions
// sufficient to their needs, as it will allow them to access the data known
// to them, while ignoring the other controls.
//
// More complex clients, which actually read the Button / Value Caps, and which
// do a value add service to these routines (EG Direct Input), will need to
// access all the data in the device without interest in the individual usage
// or link collection location.  These are the clients that will find
// HidP_Data useful.
//

NTSTATUS __stdcall
HidP_GetCaps (
   IN      PHIDP_PREPARSED_DATA      PreparsedData,
   OUT     PHIDP_CAPS                Capabilities
   );
/*++
Routine Description:
   Returns a list of capabilities of a given hid device as described by its
   preparsed data.

Arguments:
   PreparsedData    The preparsed data returned from Hidclass.
   Capabilities     a HIDP_CAPS structure

Return Value:
·  HIDP_STATUS_SUCCESS
·  HIDP_STATUS_INVALID_PREPARSED_DATA
--*/

NTSTATUS __stdcall
HidP_GetLinkCollectionNodes (
   OUT      PHIDP_LINK_COLLECTION_NODE LinkCollectionNodes,
   IN OUT   PULONG                     LinkCollectionNodesLength,
   IN       PHIDP_PREPARSED_DATA       PreparsedData
   );
/*++
Routine Description:
   Return a list of PHIDP_LINK_COLLECTION_NODEs used to describe the link
   collection tree of this hid device.  See the above description of
   struct _HIDP_LINK_COLLECTION_NODE.

Arguments:
   LinkCollectionNodes - a caller allocated array into which
                 HidP_GetLinkCollectionNodes will store the information

   LinKCollectionNodesLength - the caller sets this value to the length of the
                 the array in terms of number of elements.
                 HidP_GetLinkCollectionNodes sets this value to the actual
                 number of elements set. The total number of node required to
                 describe this HID device can be found in the
                 NumberLinkCollectionNodes field in the HIDP_CAPS structure.

--*/

NTSTATUS __stdcall
HidP_GetButtonCaps (
   IN       HIDP_REPORT_TYPE     ReportType,
   OUT      PHIDP_BUTTON_CAPS    ButtonCaps,
   IN OUT   PUSHORT              ButtonCapsLength,
   IN       PHIDP_PREPARSED_DATA PreparsedData
);
#define HidP_GetButtonCaps(_Type_, _Caps_, _Len_, _Data_) \
        HidP_GetSpecificButtonCaps (_Type_, 0, 0, 0, _Caps_, _Len_, _Data_)
NTSTATUS __stdcall
HidP_GetSpecificButtonCaps (
   IN       HIDP_REPORT_TYPE     ReportType,
   IN       USAGE                UsagePage,      // Optional (0 => ignore)
   IN       USHORT               LinkCollection, // Optional (0 => ignore)
   IN       USAGE                Usage,          // Optional (0 => ignore)
   OUT      PHIDP_BUTTON_CAPS    ButtonCaps,
   IN OUT   PUSHORT              ButtonCapsLength,
   IN       PHIDP_PREPARSED_DATA PreparsedData
   );
/*++
Description:
   HidP_GetButtonCaps returns all the buttons (binary values) that are a part
   of the given report type for the Hid device represented by the given
   preparsed data.

Parameters:
   ReportType  One of HidP_Input, HidP_Output, or HidP_Feature.

   ButtonCaps A _HIDP_BUTTON_CAPS array contain information about all the
               binary values in the given report.  This buffer is provided by
               the caller.

   ButtonLength   Starts off as the length of the caller provided buffer, and
                  ends up the length of the button values.  Both are in units
                  array elemenst, not byte length.  The number of button caps
                  returned can be found in the HIDP_CAPS structure.

   PreparsedData  The preparsed data returned from Hidclass.


Return Value
HidP_GetButtonCaps returns the following error codes:
· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_BUFFER_TOO_SMALL

--*/

NTSTATUS __stdcall
HidP_GetValueCaps (
   IN       HIDP_REPORT_TYPE     ReportType,
   OUT      PHIDP_VALUE_CAPS     ValueCaps,
   IN OUT   PUSHORT              ValueCapsLength,
   IN       PHIDP_PREPARSED_DATA PreparsedData
);
#define HidP_GetValueCaps(_Type_, _Caps_, _Len_, _Data_) \
        HidP_GetSpecificValueCaps (_Type_, 0, 0, 0, _Caps_, _Len_, _Data_)
NTSTATUS __stdcall
HidP_GetSpecificValueCaps (
   IN       HIDP_REPORT_TYPE     ReportType,
   IN       USAGE                UsagePage,      // Optional (0 => ignore)
   IN       USHORT               LinkCollection, // Optional (0 => ignore)
   IN       USAGE                Usage,          // Optional (0 => ignore)
   OUT      PHIDP_VALUE_CAPS     ValueCaps,
   IN OUT   PUSHORT              ValueCapsLength,
   IN       PHIDP_PREPARSED_DATA PreparsedData
   );
/*++
Description:
   HidP_GetValueCaps returns all the values (non-binary) that are a part
   of the given report type for the Hid device represented by the given
   preparsed data.

Parameters:
   ReportType  One of HidP_Input, HidP_Output, or HidP_Feature.

   ValueCaps   A _HIDP_Value_CAPS array contain information about all the
               binary values in the given report.  This buffer is provided by
               the caller.

   ValueLength    Starts off as the length of the caller provided buffer, and
                  ends up the length of the button values.  Both are in units
                  array elemenst, not byte length.  The number returned
                  can be found in the HIDP_CAPS structure.

   PreparsedData  The preparsed data returned from Hidclass.


Return Value
HidP_GetValueCaps returns the following error codes:
· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_BUFFER_TOO_SMALL (all given entries however have been filled in)

--*/

NTSTATUS __stdcall
HidP_SetData (
   IN       HIDP_REPORT_TYPE      ReportType,
   IN       PHIDP_DATA            DataList,
   IN OUT   PULONG                DataLength,
   IN       PHIDP_PREPARSED_DATA  PreparsedData,
   IN OUT   PCHAR                 Report,
   IN       ULONG                 ReportLength
   );
/*++

Routine Description:

    Please Note: For obvious reasons HidP_SetData and HidP_GetData will not
    access UsageValueArrays.

Parameters:

Return Value
    HidP_SetData returns the following error codes.  Upon an error the report
    packet is in an unknown state.

· HIDP_STATUS_SUCCESS upon successful insertion of usages into the report packet.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if there exists a byte in the usage list for
            which there is no corresponding control.
· HIDP_STATUS_INVALID_REPORT_LENGTH the length of the report packet is not the
            size expected.
· HIDP_STATUS_BUFFER_TOO_SMALL if there are not enough entries in a given Main
            Array Item to list all of the given usages.  The user needs
            to split his request to set usages up.
--*/

NTSTATUS __stdcall
HidP_GetData (
   IN       HIDP_REPORT_TYPE      ReportType,
   OUT      PHIDP_DATA            DataList,
   IN OUT   PULONG                DataLength,
   IN       PHIDP_PREPARSED_DATA  PreparsedData,
   IN       PCHAR                 Report,
   IN       ULONG                 ReportLength
   );
/*++

Routine Description:

    Please Note: For obvious reasons HidP_SetData and HidP_GetData will not
    access UsageValueArrays.

Parameters:

Return Value

--*/

ULONG __stdcall
HidP_MaxDataListLength (
   IN HIDP_REPORT_TYPE      ReportType,
   IN PHIDP_PREPARSED_DATA  PreparsedData
   );
/*++
Routine Description:

   This function returns the maximum length of HIDP_DATA elements that
   HidP_GetData could return for the given report type.

Parameters:

   ReportType  One of HidP_Input or HidP_Feature.

   UsagePage   All of the usages in the usage array, for which HidP_GetUsage will
               search in the report, refer to this same usage page.

   PreparsedData the preparsed data recevied from the HidClass device object.

Return Value:

   The length of the usage list array required for the HidpGetUsage
   function call.

   If UsagePage is set to zero, then MaxUsageListLength returns the number
   of

--*/

#define HidP_SetButtons(Rty, Up, Lco, ULi, ULe, Ppd, Rep, Rle) \
        HidP_SetUsages(Rty, Up, Lco, ULi, ULe, Ppd, Rep, Rle)

NTSTATUS __stdcall
HidP_SetUsages (
   IN       HIDP_REPORT_TYPE      ReportType,
   IN       USAGE                 UsagePage,
   IN       USHORT                LinkCollection, // Optional
   IN       PUSAGE                UsageList,
   IN OUT   PULONG                UsageLength,
   IN       PHIDP_PREPARSED_DATA  PreparsedData,
   IN OUT   PCHAR                 Report,
   IN       ULONG                 ReportLength
   );
/*++

Routine Description:
   This function sets binary values (buttons) in the report.  Given an
   initialized packet of correct length, it modifies the report packet so that
   each element in the given list of usages has been set in the report packet.
   For example, in an output report with 5 LED’s, each with a given usage,
   an application could turn on any subset of these lights by placing their
   usages in any order into the byte array (usageList).  HidP_SetUsage would,
   in turn, set the appropriate bit or add the corresponding byte into the
   HID Main Array Item.

   A properly initialized Report packet is one of the correct byte length,
   and all zeros.

Parameters:
   ReportType One of HidP_Output or HidP_Feature.

   UsagePage  All of the usages in the usage array, which HidP_SetUsage will
              set in the report, refer to this same usage page.
              If the client wishes to set usages in a packet for multiple
              usage pages then that client needs to make subsequent SetUsages
              calls.

   UsageList  A byte array containing the usages that HidP_SetUsage will set in
              the report packet.

   UsageLength The length of the given byte array.
               The parser sets this value to the position in the usage array at
               where it stoped processing.  In the successful case UsageList
               will be unchanged.  In any error condition this parameter
               reflects how many of the usages in the usage list have
               actually been set by the parser.  This is useful for finding
               the usage in the list which caused the error.  However, in
               the event of an error condition, the report packet itself is in
               an unknown state.

   PreparsedData the preparsed data recevied from the HidClass device object.

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value
HidP_SetUsage returns the following error codes.  Upon an error the report
packet is in an unknown state.

· HIDP_STATUS_SUCCESS upon successful insertion of usages into the report packet.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if there exists a byte in the usage list for
            which there is no corresponding control.
· HIDP_STATUS_INVALID_REPORT_LENGTH the length of the report packet is not the
            size expected.
· HIDP_STATUS_BUFFER_TOO_SMALL if there are not enough entries in a given Main
            Array Item to list all of the given usages.  The user needs
            to split his request to set usages up.
--*/

#define HidP_UnsetButtons(Rty, Up, Lco, ULi, ULe, Ppd, Rep, Rle) \
        HidP_UnsetUsages(Rty, Up, Lco, ULi, ULe, Ppd, Rep, Rle)

NTSTATUS __stdcall
HidP_UnsetUsages (
   IN       HIDP_REPORT_TYPE      ReportType,
   IN       USAGE                 UsagePage,
   IN       USHORT                LinkCollection, // Optional
   IN       PUSAGE                UsageList,
   IN OUT   PULONG                UsageLength,
   IN       PHIDP_PREPARSED_DATA  PreparsedData,
   IN OUT   PCHAR                 Report,
   IN       ULONG                 ReportLength
   );
/*++

Routine Description:
   This function sets binary values (buttons) in the report.  Given an
   initialized packet of correct length, it modifies the report packet so that
   each element in the given list of usages has been set in the report packet.
   For example, in an output report with 5 LED’s, each with a given usage,
   an application could turn on any subset of these lights by placing their
   usages in any order into the byte array (usageList).  HidP_SetUsage would,
   in turn, set the appropriate bit or add the corresponding byte into the
   HID Main Array Item.

   A properly initialized Report packet is one of the correct byte length,
   and all zeros.

Parameters:
   ReportType One of HidP_Output or HidP_Feature.

   UsagePage  All of the usages in the usage array, which HidP_SetUsage will
              set in the report, refer to this same usage page.
              If the client wishes to set usages in a packet for multiple
              usage pages then that client needs to make subsequent SetUsages
              calls.

   UsageList  A byte array containing the usages that HidP_SetUsage will set in
              the report packet.

   UsageLength The length of the given byte array.
               The parser sets this value to the position in the usage array at
               where it stoped processing.  In the successful case UsageList
               will be unchanged.  In any error condition this parameter
               reflects how many of the usages in the usage list have
               actually been set by the parser.  This is useful for finding
               the usage in the list which caused the error.  However, in
               the event of an error condition, the report packet itself is in
               an unknown state.

   PreparsedData the preparsed data recevied from the HidClass device object.

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value
HidP_SetUsage returns the following error codes.  Upon an error the report
packet is in an unknown state.

· HIDP_STATUS_SUCCESS upon successful insertion of usages into the report packet.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if there exists a byte in the usage list for
            which there is no corresponding control.
· HIDP_STATUS_INVALID_REPORT_LENGTH the length of the report packet is not the
            size expected.
· HIDP_STATUS_BUFFER_TOO_SMALL if there are not enough entries in a given Main
            Array Item to list all of the given usages.  The user needs
            to split his request to set usages up.
--*/

#define HidP_GetButtons(Rty, UPa, LCo, ULi, ULe, Ppd, Rep, RLe) \
        HidP_GetUsages(Rty, UPa, LCo, ULi, ULe, Ppd, Rep, RLe)

NTSTATUS __stdcall
HidP_GetUsages (
   IN       HIDP_REPORT_TYPE     ReportType,
   IN       USAGE                UsagePage,
   IN       USHORT               LinkCollection, // Optional
   OUT      USAGE *              UsageList,
   IN OUT   ULONG *              UsageLength,
   IN       PHIDP_PREPARSED_DATA PreparsedData,
   IN       PCHAR                Report,
   IN       ULONG                ReportLength
   );

/*++

Routine Description:
This function returns the binary values (buttons) in a HID report.
Given a report packet of correct length, it searches the report packet
for each usage for the given usage page and returns them in the usage list.

Parameters:

   ReportType One of HidP_Output or HidP_Feature.

   UsagePage  All of the usages in the usage array, which HidP_SetUsage will
              retrieve in the report, refer to this same usage page.
              If the client wishes to get usages in a packet for multiple
              usage pages then that client needs to make subsequent getUsages
              calls.

   UsageList  A byte array containing the usages that HidP_GetUsage found in
              the report packet.

   UsageLength The length of the given byte array.
               This value initially describes the length of the usage list,
               but HidP_GetUsage sets this value to the length of found usages.
               Use HidP_MaxUsageListLength to determine the maximum length list
               of usages that a given report packet may contain.

   PreparsedData the preparsed data recevied from the HidClass device object.

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value
HidpGetUsage returns the following error codes:
· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if no control for this device matches the given
                             usagePage.
· HIDP_STATUS_BUFFER_TOO_SMALL if the given usageList is not long enough to
                          hold the usages found in the given report packet.
                          HidP_MaxUsageListLength should be used to prevent
                          this error.
· HIDP_STATUS_INVALID_PREPARSED_DATA if the given preparsed data is invalid
· HIDP_STATUS_INVALID_REPORT_LENGTH if the length of the report packet is not
                        the size expected.
--*/

#define HidP_GetButtonsEx(Rty, LCo, BLi, ULe, Ppd, Rep, RLe)  \
        HidP_GetUsagesEx(Rty, LCo, BLi, ULe, Ppd, Rep, RLe)

NTSTATUS __stdcall
HidP_GetUsagesEx (
   IN       HIDP_REPORT_TYPE     ReportType,
   IN       USHORT               LinkCollection, // Optional
   OUT      PUSAGE_AND_PAGE      ButtonList,
   IN OUT   ULONG *              UsageLength,
   IN       PHIDP_PREPARSED_DATA PreparsedData,
   IN       PCHAR                Report,
   IN       ULONG                ReportLength
   );

/*++

Routine Description:
This function returns the binary values (buttons) in a HID report.
Given a report packet of correct length, it searches the report packet
for each usage for the given usage page and returns them in the usage list.

Parameters:

   ReportType One of HidP_Output or HidP_Feature.

   ButtonList An array of USAGE_AND_PAGE structures describing all the
              buttons currently ``down'' in the device.

   UsageLength The length of the given array in terms of elements.
               This value initially describes the length of the usage list,
               but HidP_GetUsage sets this value to the length of found usages.
               Use HidP_MaxUsageListLength to determine the maximum length list
               of usages that a given report packet may contain.

   PreparsedData the preparsed data recevied from the HidClass device object.

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value
HidpGetUsage returns the following error codes:
· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if no button controls are found for this device.
· HIDP_STATUS_BUFFER_TOO_SMALL if the given usageList is not long enough to
                          hold the usages found in the given report packet.
                          HidP_MaxUsageListLength should be used to prevent
                          this error.
· HIDP_STATUS_INVALID_PREPARSED_DATA if the given preparsed data is invalid
· HIDP_STATUS_INVALID_REPORT_LENGTH if the length of the report packet is not
                        the size expected.
--*/

#define HidP_GetButtonListLength(RTy, UPa, Ppd) \
        HidP_GetUsageListLength(Rty, UPa, Ppd)

ULONG __stdcall
HidP_MaxUsageListLength (
   IN HIDP_REPORT_TYPE      ReportType,
     IN USAGE                 UsagePage, // Optional
   IN PHIDP_PREPARSED_DATA  PreparsedData
   );
/*++
Routine Description:

   This function returns the maximum length of usages that a HidpGetUsage
   could return for the given HID Report and Usage Page.

Parameters:

   ReportType  One of HidP_Input or HidP_Feature.

   UsagePage   All of the usages in the usage array, for which HidP_GetUsage will
               search in the report, refer to this same usage page.

   PreparsedData the preparsed data recevied from the HidClass device object.

Return Value:

   The length of the usage list array required for the HidpGetUsage
   function call.

   If UsagePage is set to zero, then MaxUsageListLength returns the number
   of

--*/

NTSTATUS __stdcall
HidP_SetUsageValue (
   IN       HIDP_REPORT_TYPE     ReportType,
   IN       USAGE                UsagePage,
   IN       USHORT               LinkCollection, // Optional
   IN       USAGE                Usage,
   IN       ULONG                UsageValue,
   IN       PHIDP_PREPARSED_DATA PreparsedData,
   IN OUT   PCHAR                Report,
   IN       ULONG                ReportLength
   );

/*++
Description:
   HidpSetUsageValue inserts the given value into the given HID Report Packet,
   in the field corresponding to the given usage page and usage.
   HidP_SetUsageValue casts this value to the appropriate bit length.  If there
   are two channel in the report packet with the same usage and UsagePage, then
   they can be destinguished with the optional LinkCollection Field.

Parameters:

   ReportType  One of HidP_Output or HidP_Feature.

   UsagePage   The usage page to which the given usage refers.

   LinkCollection  (Optional)  If there are more than one channel with the
               given usage and usage page, then the client may used this field
               to distinguish them.  A LinkValue of zero is ingnored.  The
               first channel that matches the given usage page, usage page, and
               Link number is the one affected.

   Usage       The usage whose value HidP_SetUsageValue will set.

   UsageValue  The value.  This value must be within the logical range or
               null value specified by the Report Descriptor.

   PreparsedData The data retreived from the HID device

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value:
   HidpSetUsageValue returns the following error codes:

· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if the given usage does not correspond to a
                             control on the device, or if it refers to a button
                             style control.
· HIDP_STATUS_INVALID_REPORT_LENGTH if the length of the report packet is not
         the size expected given the HIDP_CHANNELS structure.
--*/



NTSTATUS __stdcall
HidP_SetScaledUsageValue (
   IN       HIDP_REPORT_TYPE     ReportType,
   IN       USAGE                UsagePage,
   IN       USHORT               LinkCollection, // Optional
   IN       USAGE                Usage,
   IN       LONG                 UsageValue,
   IN       PHIDP_PREPARSED_DATA PreparsedData,
   IN OUT   PCHAR                Report,
   IN       ULONG                ReportLength
   );

/*++
Description:
   HidpSetUsageValue inserts the given value into the given HID Report Packet,
   in the field corresponding to the given usage page and usage.
   HidP_SetUsageValue casts this value to the appropriate bit length.  If there
   are two channel in the report packet with the same usage and UsagePage, then
   they can be destinguished with the optional LinkCollection Field.
   ScaledUsageValue converts from the signed physical value given as UsageValue
   to the logical value placed in the report.

Parameters:

   ReportType  One of HidP_Output or HidP_Feature.

   UsagePage   The usage page to which the given usage refers.

   LinkCollection  (Optional)  If there are more than one channel with the
               given usage and usage page, then the client may used this field
               to distinguish them.  A LinkValue of zero is ingnored.  The
               first channel that matches the given usage page, usage page, and
               Link number is the one affected.

   Usage       The usage whose value HidP_SetUsageValue will set.

   UsageValue  The value.  This value must be within the logical range or
               null value specified by the Report Descriptor.

   PreparsedData The data retreived from the HID device

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value:
   HidpSetUsageValue returns the following error codes:

· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if the given usage does not correspond to a
                             control on the device, or if it refers to a button
                             style control.
· HIDP_STATUS_INVALID_REPORT_LENGTH if the length of the report packet is not
         the size expected given the HIDP_CHANNELS structure.
· HIDP_STATUS_VALUE_OUT_OF_RANGE The physical value given was out of range,
                    but this field does not accept null values.  In this
                    case the field remains unchanged.
· HIDP_STATUS_BAD_LOG_PHY_VALUES
· HIDP_STATUS_NULL  A null value was written into the field, because the
                    physical value given was out of range and this field
                    supports null values.  The value written was outside the
                    range of LogicalMin and LogicalMax and is specifically
                    set to the most negative value.
--*/

NTSTATUS __stdcall
HidP_SetUsageValueArray (
    IN    HIDP_REPORT_TYPE     ReportType,
    IN    USAGE                UsagePage,
    IN    USHORT               LinkCollection, // Optional
    IN    USAGE                Usage,
    IN    PCHAR                UsageValue,
    IN    USHORT               UsageValueByteLength,
    IN    PHIDP_PREPARSED_DATA PreparsedData,
    OUT   PCHAR                Report,
    IN    ULONG                ReportLength
    );

/*++
Routine Descripton:
    The last usage in the list of usages describing a main item must be
    repeated if there are less usages than there are report counts declared
    for the given main item.  In this case a single value cap is allocated
    for that usage and the report count of that value cap is set to refect the
    numer of fields to which that usage refers.

    HidP_SetUsageValueArray sets the raw bits for that usage which spans
    more than one field in a report.

Parameters:

   ReportType  One of HidP_Output or HidP_Feature.

   UsagePage   The usage page to which the given usage refers.

   LinkCollection  (Optional)  If there are more than one channel with the
               given usage and usage page, then the client may used this field
               to distinguish them.  A LinkValue of zero is ingnored.  The
               first channel that matches the given usage page, usage page, and
               Link number is the one affected.

   Usage       The usage whose value HidP_SetUsageValueArray will set.

   UsageValue  A pointer to an array characters where the value will be placed.
               The number of BITS required is found by multiplying the
               BitSize and ReportCount fields of the given Value Cap for this
               control.  The least significant bit of this control found in the
               given report will be placed in the least significan bit location
               of the array given (little-endian format), regardless of whether
               or not the field is byte alligned or if the BitSize is a multiple
               of sizeof (CHAR).

   UsageValueByteLength
               the length of the given UsageValue buffer.

   PreparsedData The data retreived from the HID device

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value:
    Same as others

    HIDP_STATUS_NOT_VALUE_ARRAY this is not a value array control use instead
    HidP_SetUsageValue.

--*/


NTSTATUS __stdcall
HidP_GetUsageValue (
   IN    HIDP_REPORT_TYPE     ReportType,
   IN    USAGE                UsagePage,
   IN    USHORT               LinkCollection, // Optional
   IN    USAGE                Usage,
   OUT   PULONG               UsageValue,
   IN    PHIDP_PREPARSED_DATA PreparsedData,
   IN    PCHAR                Report,
   IN    ULONG                ReportLength
   );

/*
Description
   HidP_GetUsageValue retrieves the given value from the given HID Report
   Packet, for the specified usage.

Parameters:

   ReportType  One of HidP_Output or HidP_Feature.

   UsagePage   The usage page to which the given usage refers.

   LinkCollection  (Optional)  If there are more than one channel with the
               given usage and usage page, then the client may used this field
               to distinguish them.  A LinkValue of zero is ingnored.  The
               first channel that matches the given usage page, usage page, and
               Link number is the one affected.

   Usage       The usage whose value HidP_GetUsageValue will retreive.

   UsageValue  The value.  This value must be within the logical range or
               null value specified by the Report Descriptor.

   PreparsedData The data retreived from the HID device

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value:
   HidpSetUsageValue returns the following error codes:

· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if the given usage does not correspond to a
                             control on the device, or if it refers to a button
                             style control.
· HIDP_STATUS_INVALID_REPORT_LENGTH if the length of the report packet is
                      not the size expected given the HIDP_CHANNELS structure.
--*/


NTSTATUS __stdcall
HidP_GetScaledUsageValue (
   IN    HIDP_REPORT_TYPE     ReportType,
   IN    USAGE                UsagePage,
   IN    USHORT               LinkCollection, // Optional
   IN    USAGE                Usage,
   OUT   PLONG                UsageValue,
   IN    PHIDP_PREPARSED_DATA PreparsedData,
   IN    PCHAR                Report,
   IN    ULONG                ReportLength
   );

/*++
Description
   HidP_GetScaledUsageValue retrieves the given value from the given HID Report
   Packet, for the specified usage.  This function assums a linear
   extrapolation between the physical Max/min and the Logical Max/min.
   (Where logical is the values reported by the device, and physical is the
    value returned by this function.)
   If the data field requested is of fewer bytes than 32, then
   HidP_GetScaledUsageValue will sign extend those bits to 32.


Parameters:

   ReportType  One of HidP_Output or HidP_Feature.

   UsagePage   The usage page to which the given usage refers.

   LinkCollection  (Optional)  If there are more than one channel with the
               given usage and usage page, then the client may used this field
               to distinguish them.  A LinkValue of zero is ingnored.  The
               first channel that matches the given usage page, usage page, and
               Link number is the one affected.

   Usage       The usage whose value HidP_GetUsageValue will retreive.

   UsageValue  The value.  This value must be within the logical range or
               null value specified by the Report Descriptor.

   PreparsedData The data retreived from the HID device

   Report      The report packet.

   ReportLength   Length of the given report packet.


Return Value:
   HidpSetUsageValue returns the following error codes:

· HIDP_STATUS_SUCCESS.
· HIDP_STATUS_INVALID_REPORT_TYPE if reportType is not valid.
· HIDP_STATUS_USAGE_NOT_FOUND if the given usage does not correspond to a
                             control on the device, or if it refers to a button
                             style control.
· HIDP_STATUS_INVALID_REPORT_LENGTH if the length of the report packet is
                      not the size expected given the HIDP_CHANNELS structure.
· HIDP_STATUS_VALUE_OUT_OF_RANGE
· HIDP_STATUS_BAD_LOG_PHY_VALUES
· HIDP_STATUS_NULL
--*/

NTSTATUS __stdcall
HidP_GetUsageValueArray (
    IN    HIDP_REPORT_TYPE     ReportType,
    IN    USAGE                UsagePage,
    IN    USHORT               LinkCollection, // Optional
    IN    USAGE                Usage,
    OUT   PCHAR                UsageValue,
    IN    USHORT               UsageValueByteLength,
    IN    PHIDP_PREPARSED_DATA PreparsedData,
    IN    PCHAR                Report,
    IN    ULONG                ReportLength
    );

/*++
Routine Descripton:
    The last usage in the list of usages describing a main item must be
    repeated if there are less usages than there are report counts declared
    for the given main item.  In this case a single value cap is allocated
    for that usage and the report count of that value cap is set to refect the
    numer of fields to which that usage refers.

    HidP_GetUsageValueArray retrieved the raw bits for that usage which spans
    more than one field in a report.

Parameters:

   ReportType  One of HidP_Output or HidP_Feature.

   UsagePage   The usage page to which the given usage refers.

   LinkCollection  (Optional)  If there are more than one channel with the
               given usage and usage page, then the client may used this field
               to distinguish them.  A LinkValue of zero is ingnored.  The
               first channel that matches the given usage page, usage page, and
               Link number is the one affected.

   Usage       The usage whose value HidP_GetUsageValueArray will retreive.

   UsageValue  A pointer to an array characters where the value will be placed.
               The number of BITS required is found by multiplying the
               BitSize and ReportCount fields of the given Value Cap for this
               control.  The least significant bit of this control found in the
               given report will be placed in the least significan bit location
               of the array given (little-endian format), regardless of whether
               or not the field is byte alligned or if the BitSize is a multiple
               of sizeof (CHAR).

   UsageValueByteLength
               the length of the given UsageValue buffer.

   PreparsedData The data retreived from the HID device

   Report      The report packet.

   ReportLength   Length of the given report packet.



--*/

NTSTATUS __stdcall
HidP_UsageListDifference (
    IN    PUSAGE   PreviousUsageList,
    IN    PUSAGE   CurrentUsageList,
    OUT   PUSAGE   BreakUsageList,
    OUT   PUSAGE   MakeUsageList,
    IN    ULONG    UsageListLength
    );
/*++
Routine Description:
   Given two list of usages (as might be returned from HidP_GetUsages),
   determine the difference; that is, return a list of usages that are in
   the current list but not in the previous list (NewUsageList), as well as a
   list of usages that are in the previous list but not the current list
   (OldUsageList).

Parameters:

   PreviousUsageList The list of usages before.
   CurrentUsageList  The list of usages now.
   BreakUsageList      Previous - Current.
   MakeUsageList       Current - Previous.

   All usage lists have a maximum of UsageListLength bytes.
   Any zero found in the list indicates early termination of the list.
   Any characters found after the first zero will be ignored.

--*/

//
// Produce Make or Break Codes
//
typedef enum _HIDP_KEYBOARD_DIRECTION {
    HidP_Keyboard_Break,
    HidP_Keyboard_Make
} HIDP_KEYBOARD_DIRECTION;

//
// A bitmap of the current shift state of the keyboard when using the
// below keyboard usages to i8042 translation function.
//
typedef struct _HIDP_KEYBOARD_MODIFIER_STATE {
   union {
      struct {
         ULONG LeftControl: 1;
         ULONG LeftShift: 1;
         ULONG LeftAlt: 1;
         ULONG LeftGUI: 1;
         ULONG RightControl: 1;
         ULONG RightShift: 1;
         ULONG RightAlt: 1;
         ULONG RigthGUI: 1;
         ULONG CapsLock: 1;
         ULONG ScollLock: 1;
         ULONG NumLock: 1;
         ULONG Reserved: 21;
      };
      ULONG ul;
   };

} HIDP_KEYBOARD_MODIFIER_STATE, * PHIDP_KEYBOARD_MODIFIER_STATE;

//
// A call back function to give the i8042 scan codes to the caller of
// the below translation function.
//
typedef BOOLEAN (* PHIDP_INSERT_SCANCODES) (
                  IN PVOID Context,  // Some caller supplied context.
                  IN PCHAR NewScanCodes, // A list of i8042 scan codes.
                  IN ULONG Length // the length of the scan codes.
                  );

NTSTATUS __stdcall
HidP_TranslateUsagesToI8042ScanCodes (
   IN     PUSAGE                        ChangedUsageList,
   IN     ULONG                         UsageListLength,
   IN     HIDP_KEYBOARD_DIRECTION       KeyAction,
   IN OUT PHIDP_KEYBOARD_MODIFIER_STATE ModifierState,
   IN     PHIDP_INSERT_SCANCODES        InsertCodesProcedure,
   IN     PVOID                         InsertCodesContext
   );
/*++
Routine Description:
Parameters:
--*/



//
// Define NT Status codes with Facility Code of FACILITY_HID_ERROR_CODE
//

// BUGBUG defined in ntstatus.h
#ifndef FACILITY_HID_ERROR_CODE
#define FACILITY_HID_ERROR_CODE 0x11
#endif

#define HIDP_ERROR_CODES(SEV, CODE) \
        ((NTSTATUS) (((SEV) << 28) | (FACILITY_HID_ERROR_CODE << 16) | (CODE)))

#define HIDP_STATUS_SUCCESS                  (HIDP_ERROR_CODES(0x0,0))
#define HIDP_STATUS_NULL                     (HIDP_ERROR_CODES(0x8,1))
#define HIDP_STATUS_INVALID_PREPARSED_DATA   (HIDP_ERROR_CODES(0xC,1))
#define HIDP_STATUS_INVALID_REPORT_TYPE      (HIDP_ERROR_CODES(0xC,2))
#define HIDP_STATUS_INVALID_REPORT_LENGTH    (HIDP_ERROR_CODES(0xC,3))
#define HIDP_STATUS_USAGE_NOT_FOUND          (HIDP_ERROR_CODES(0xC,4))
#define HIDP_STATUS_VALUE_OUT_OF_RANGE       (HIDP_ERROR_CODES(0xC,5))
#define HIDP_STATUS_BAD_LOG_PHY_VALUES       (HIDP_ERROR_CODES(0xC,6))
#define HIDP_STATUS_BUFFER_TOO_SMALL         (HIDP_ERROR_CODES(0xC,7))
#define HIDP_STATUS_INTERNAL_ERROR           (HIDP_ERROR_CODES(0xC,8))
#define HIDP_STATUS_I8242_TRANS_UNKNOWN      (HIDP_ERROR_CODES(0xC,9))
#define HIDP_STATUS_INCOMPATIBLE_REPORT_ID   (HIDP_ERROR_CODES(0xC,0xA))
#define HIDP_STATUS_NOT_VALUE_ARRAY          (HIDP_ERROR_CODES(0xC,0xB))
#define HIDP_STATUS_IS_VALUE_ARRAY           (HIDP_ERROR_CODES(0xC,0xC))
#define HIDP_STATUS_DATA_INDEX_NOT_FOUND     (HIDP_ERROR_CODES(0xC,0xD))
#define HIDP_STATUS_DATA_INDEX_OUT_OF_RANGE  (HIDP_ERROR_CODES(0xC,0xE))
#define HIDP_STATUS_BUTTON_NOT_PRESSED       (HIDP_ERROR_CODES(0xC,0xF))
#define HIDP_STATUS_REPORT_DOES_NOT_EXIST    (HIDP_ERROR_CODES(0xC,0x10))
#define HIDP_STATUS_NOT_IMPLEMENTED          (HIDP_ERROR_CODES(0xC,0x20))

#include <poppack.h>

#endif
