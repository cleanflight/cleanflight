/*++

Copyright (c) 1996      Microsoft Corporation

Module Name:

        HIDPI.H

Abstract:

   Public Definitions of HID USAGES.

Environment:

    Kernel & user mode

Revision History:

    Aug-1996 : created Kenneth D. Ray

--*/

#ifndef _HIDTOKEN_H
#define _HIDTOKEN_H

#define HIDP_ITEM_LONG           0xFE
#define HIDP_ITEM_LENGTH_DATA    0x03


// Main Items
// Only main items with one byte data (bSize = 1) are supported.
#define HIDP_MAIN_INPUT_1        0x81
#define HIDP_MAIN_INPUT_2        0x82
#define HIDP_MAIN_OUTPUT_1       0x91
#define HIDP_MAIN_OUTPUT_2       0x92
#define HIDP_MAIN_FEATURE_1      0xB1
#define HIDP_MAIN_FEATURE_2      0xB2
#define HIDP_MAIN_COLLECTION     0xA1
#define HIDP_MAIN_ENDCOLLECTION  0xC0
#define HIDP_ISMAIN(x) (0 == ((x) & 0x0C))
#define HIDP_MAIN_COLLECTION_LINK 0x00
#define HIDP_MAIN_COLLECTION_APP  0x01

// Global Items
#define HIDP_GLOBAL_USAGE_PAGE_1   0x05  // UsagePage of 1 byte
#define HIDP_GLOBAL_USAGE_PAGE_2   0x06  // UsagePage of 2 bytes
#define HIDP_GLOBAL_USAGE_PAGE_4   0x07  // UsagePage of 4 bytes
#define HIDP_GLOBAL_LOG_MIN_1      0x15  // minimum value of size 1 byte.
#define HIDP_GLOBAL_LOG_MIN_2      0x16  // minimum value of size 2 bytes.
#define HIDP_GLOBAL_LOG_MIN_4      0x17  // minimum value of size 4 bytes.
#define HIDP_GLOBAL_LOG_MAX_1      0X25  // maximum of size 1 byte.
#define HIDP_GLOBAL_LOG_MAX_2      0X26  // maximum of size 2 bytes.
#define HIDP_GLOBAL_LOG_MAX_4      0X27  // maximum of size 4 bytes.

#define HIDP_GLOBAL_PHY_MIN_1      0x35  // minimum value of size 1 byte.
#define HIDP_GLOBAL_PHY_MIN_2      0x36  // minimum value of size 2 bytes.
#define HIDP_GLOBAL_PHY_MIN_4      0x37  // minimum value of size 4 bytes.
#define HIDP_GLOBAL_PHY_MAX_1      0X45  // maximum of size 1 byte.
#define HIDP_GLOBAL_PHY_MAX_2      0X46  // maximum of size 2 bytes.
#define HIDP_GLOBAL_PHY_MAX_4      0X47  // maximum of size 4 bytes.

#define HIDP_GLOBAL_UNIT_EXP_1     0x55  // Exponent of size 1 byte.
#define HIDP_GLOBAL_UNIT_EXP_2     0x56  // Exponent of size 2 bytes.
#define HIDP_GLOBAL_UNIT_EXP_4     0x57  // Exponent of size 4 bytes.
#define HIDP_GLOBAL_UNIT_1         0x65  // UNIT of size 1 byte.
#define HIDP_GLOBAL_UNIT_2         0x66  // UNIT of size 2 bytes.
#define HIDP_GLOBAL_UNIT_4         0x67  // UNIT of size 4 bytes.

#define HIDP_GLOBAL_REPORT_SIZE    0x75  // Report size in bits
#define HIDP_GLOBAL_REPORT_ID      0x85  // ID only size 1 byte supported
#define HIDP_GLOBAL_REPORT_COUNT_1 0x95  // Number of data fields 1 byte
#define HIDP_GLOBAL_REPORT_COUNT_2 0x96  // Number of data fields 2 bytes
#define HIDP_GLOBAL_PUSH           0xA4  // The dreaded PUSH command
#define HIDP_GLOBAL_POP            0xB4  // And the dreaded POP command

// Local Items
#define HIDP_LOCAL_USAGE_1         0x09  //
#define HIDP_LOCAL_USAGE_2         0x0A  //
#define HIDP_LOCAL_USAGE_4         0x0B  //
#define HIDP_LOCAL_USAGE_MIN_1     0x19
#define HIDP_LOCAL_USAGE_MIN_2     0x1A
#define HIDP_LOCAL_USAGE_MIN_4     0x1B
#define HIDP_LOCAL_USAGE_MAX_1     0x29
#define HIDP_LOCAL_USAGE_MAX_2     0x2A
#define HIDP_LOCAL_USAGE_MAX_4     0x2B
#define HIDP_LOCAL_DESIG_INDEX     0x39  // Designators of byte size supported
#define HIDP_LOCAL_DESIG_MIN       0x49
#define HIDP_LOCAL_DESIG_MAX       0x59
#define HIDP_LOCAL_STRING_INDEX    0x79  // String indices of size byte supported
#define HIDP_LOCAL_STRING_MIN      0x89
#define HIDP_LOCAL_STRING_MAX      0x99
#define HIDP_LOCAL_DELIMITER       0xA9

#endif
