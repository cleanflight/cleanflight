/*++

Copyright (c) 1995-1997 Microsoft Corporation

Module Name:

    setupapi.h

Abstract:

    Public header file for Windows NT Setup services Dll.

Revision History:

--*/

#ifndef _INC_SETUPAPI
#define _INC_SETUPAPI

//
// Define API decoration for direct importing of DLL references.
//
#if !defined(_SETUPAPI_)
#define WINSETUPAPI DECLSPEC_IMPORT
#else
#define WINSETUPAPI
#endif

#include <pshpack1.h>   // Assume byte packing throughout

#ifdef __cplusplus
extern "C" {
#endif

#ifndef __LPGUID_DEFINED__
#define __LPGUID_DEFINED__
typedef GUID *LPGUID;
#endif

//
// Include commctrl.h for our use of HIMAGELIST and wizard support.
//
#include <commctrl.h>


//
// Define maximum string length constants as specified by
// Windows 95.
//
#define LINE_LEN                    256 // Win95-compatible maximum for displayable
                                        // strings coming from a device INF.
#define MAX_INF_STRING_LENGTH      4096 // Actual maximum size of an INF string (including
                                        // string substitutions).
#define MAX_TITLE_LEN                60
#define MAX_INSTRUCTION_LEN         256
#define MAX_LABEL_LEN                30
#define MAX_SERVICE_NAME_LEN        256

//
// Define maximum length of a machine name in the format expected by ConfigMgr32
// CM_Connect_Machine (i.e., "\\\\MachineName\0").
//
#define SP_MAX_MACHINENAME_LENGTH   (MAX_COMPUTERNAME_LENGTH + 3)

//
// Define type for reference to loaded inf file
//
typedef PVOID HINF;

//
// Inf context structure. Applications must not interpret or
// overwrite values in these structures.
//
typedef struct _INFCONTEXT {
    PVOID Inf;
    PVOID CurrentInf;
    UINT Section;
    UINT Line;
} INFCONTEXT, *PINFCONTEXT;

//
// Inf file information structure.
//
typedef struct _SP_INF_INFORMATION {
    DWORD InfStyle;
    DWORD InfCount;
    BYTE VersionData[ANYSIZE_ARRAY];
} SP_INF_INFORMATION, *PSP_INF_INFORMATION;

//
// SP_INF_INFORMATION.InfStyle values
//
#define INF_STYLE_NONE  0       // unrecognized or non-existent
#define INF_STYLE_OLDNT 1       // winnt 3.x
#define INF_STYLE_WIN4  2       // Win95

//
// Target directory specs.
//
#define DIRID_ABSOLUTE          -1              // real 32-bit -1
#define DIRID_ABSOLUTE_16BIT     0xffff         // 16-bit -1 for compat w/setupx
#define DIRID_NULL               0
#define DIRID_SRCPATH            1
#define DIRID_WINDOWS           10
#define DIRID_SYSTEM            11              // system32
#define DIRID_DRIVERS           12
#define DIRID_IOSUBSYS          DIRID_DRIVERS
#define DIRID_INF               17
#define DIRID_HELP              18
#define DIRID_FONTS             20
#define DIRID_VIEWERS           21
#define DIRID_COLOR             23
#define DIRID_APPS              24
#define DIRID_SHARED            25
#define DIRID_BOOT              30

#define DIRID_SYSTEM16          50
#define DIRID_SPOOL             51
#define DIRID_SPOOLDRIVERS      52
#define DIRID_USERPROFILE       53
#define DIRID_LOADER            54
#define DIRID_PRINTPROCESSOR    55

#define DIRID_DEFAULT           DIRID_SYSTEM

//
// First user-definable dirid. See SetupSetDirectoryId().
//
#define DIRID_USER              0x8000


//
// Setup callback notification routine type
//
typedef UINT (CALLBACK* PSP_FILE_CALLBACK_A)(
    IN PVOID Context,
    IN UINT Notification,
    IN UINT Param1,
    IN UINT Param2
    );

typedef UINT (CALLBACK* PSP_FILE_CALLBACK_W)(
    IN PVOID Context,
    IN UINT Notification,
    IN UINT Param1,
    IN UINT Param2
    );

#ifdef UNICODE
#define PSP_FILE_CALLBACK PSP_FILE_CALLBACK_W
#else
#define PSP_FILE_CALLBACK PSP_FILE_CALLBACK_A
#endif


//
// Operation/queue start/end notification. These are ordinal values.
//
#define SPFILENOTIFY_STARTQUEUE         0x00000001
#define SPFILENOTIFY_ENDQUEUE           0x00000002
#define SPFILENOTIFY_STARTSUBQUEUE      0x00000003
#define SPFILENOTIFY_ENDSUBQUEUE        0x00000004
#define SPFILENOTIFY_STARTDELETE        0x00000005
#define SPFILENOTIFY_ENDDELETE          0x00000006
#define SPFILENOTIFY_DELETEERROR        0x00000007
#define SPFILENOTIFY_STARTRENAME        0x00000008
#define SPFILENOTIFY_ENDRENAME          0x00000009
#define SPFILENOTIFY_RENAMEERROR        0x0000000a
#define SPFILENOTIFY_STARTCOPY          0x0000000b
#define SPFILENOTIFY_ENDCOPY            0x0000000c
#define SPFILENOTIFY_COPYERROR          0x0000000d
#define SPFILENOTIFY_NEEDMEDIA          0x0000000e
#define SPFILENOTIFY_QUEUESCAN          0x0000000f
//
// These are used with SetupIterateCabinet().
//
#define SPFILENOTIFY_CABINETINFO        0x00000010
#define SPFILENOTIFY_FILEINCABINET      0x00000011
#define SPFILENOTIFY_NEEDNEWCABINET     0x00000012
#define SPFILENOTIFY_FILEEXTRACTED      0x00000013

#define SPFILENOTIFY_FILEOPDELAYED      0x00000014

//
// Copy notification. These are bit flags that may be combined.
//
#define SPFILENOTIFY_LANGMISMATCH       0x00010000
#define SPFILENOTIFY_TARGETEXISTS       0x00020000
#define SPFILENOTIFY_TARGETNEWER        0x00040000

//
// File operation codes and callback outcomes.
//
#define FILEOP_COPY                     0
#define FILEOP_RENAME                   1
#define FILEOP_DELETE                   2

#define FILEOP_ABORT                    0
#define FILEOP_DOIT                     1
#define FILEOP_SKIP                     2
#define FILEOP_RETRY                    FILEOP_DOIT
#define FILEOP_NEWPATH                  4

//
// Flags in inf copy sections
//
#define COPYFLG_WARN_IF_SKIP            0x00000001      // warn if user tries to skip file
#define COPYFLG_NOSKIP                  0x00000002      // disallow skipping this file
#define COPYFLG_NOVERSIONCHECK          0x00000004      // ignore versions and overwrite target
#define COPYFLG_FORCE_FILE_IN_USE       0x00000008      // force file-in-use behavior
#define COPYFLG_NO_OVERWRITE            0x00000010      // do not copy if file exists on target
#define COPYFLG_NO_VERSION_DIALOG       0x00000020      // do not copy if target is newer
#define COPYFLG_OVERWRITE_OLDER_ONLY    0x00000040      // leave target alone if version same as source
#define COPYFLG_REPLACEONLY             0x00000400      // copy only if file exists on target

//
// Flags in inf delete sections
// New flags go in high word
//
#define DELFLG_IN_USE                   0x00000001      // queue in-use file for delete
#define DELFLG_IN_USE1                  0x00010000      // high-word version of DELFLG_IN_USE

//
// Source and file paths. Used when notifying queue callback
// of SPFILENOTIFY_STARTxxx, SPFILENOTIFY_ENDxxx, and SPFILENOTIFY_xxxERROR.
//
typedef struct _FILEPATHS_A {
    PCSTR  Target;
    PCSTR  Source;  // not used for delete operations
    UINT   Win32Error;
    DWORD  Flags;   // such as SP_COPY_NOSKIP for copy errors
} FILEPATHS_A, *PFILEPATHS_A;

typedef struct _FILEPATHS_W {
    PCWSTR Target;
    PCWSTR Source;  // not used for delete operations
    UINT   Win32Error;
    DWORD  Flags;   // such as SP_COPY_NOSKIP for copy errors
} FILEPATHS_W, *PFILEPATHS_W;

#ifdef UNICODE
typedef FILEPATHS_W FILEPATHS;
typedef PFILEPATHS_W PFILEPATHS;
#else
typedef FILEPATHS_A FILEPATHS;
typedef PFILEPATHS_A PFILEPATHS;
#endif


//
// Structure used with SPFILENOTIFY_NEEDMEDIA
//
typedef struct _SOURCE_MEDIA_A {
    PCSTR Reserved;
    PCSTR Tagfile;          // may be NULL
    PCSTR Description;
    //
    // Pathname part and filename part of source file
    // that caused us to need the media.
    //
    PCSTR SourcePath;
    PCSTR SourceFile;
    DWORD Flags;            // subset of SP_COPY_xxx
} SOURCE_MEDIA_A, *PSOURCE_MEDIA_A;

typedef struct _SOURCE_MEDIA_W {
    PCWSTR Reserved;
    PCWSTR Tagfile;         // may be NULL
    PCWSTR Description;
    //
    // Pathname part and filename part of source file
    // that caused us to need the media.
    //
    PCWSTR SourcePath;
    PCWSTR SourceFile;
    DWORD  Flags;           // subset of SP_COPY_xxx
} SOURCE_MEDIA_W, *PSOURCE_MEDIA_W;

#ifdef UNICODE
typedef SOURCE_MEDIA_W SOURCE_MEDIA;
typedef PSOURCE_MEDIA_W PSOURCE_MEDIA;
#else
typedef SOURCE_MEDIA_A SOURCE_MEDIA;
typedef PSOURCE_MEDIA_A PSOURCE_MEDIA;
#endif

//
// Structure used with SPFILENOTIFY_CABINETINFO and
// SPFILENOTIFY_NEEDNEWCABINET
//
typedef struct _CABINET_INFO_A {
    PCSTR CabinetPath;
    PCSTR CabinetFile;
    PCSTR DiskName;
    USHORT SetId;
    USHORT CabinetNumber;
} CABINET_INFO_A, *PCABINET_INFO_A;

typedef struct _CABINET_INFO_W {
    PCWSTR CabinetPath;
    PCWSTR CabinetFile;
    PCWSTR DiskName;
    USHORT SetId;
    USHORT CabinetNumber;
} CABINET_INFO_W, *PCABINET_INFO_W;

#ifdef UNICODE
typedef CABINET_INFO_W CABINET_INFO;
typedef PCABINET_INFO_W PCABINET_INFO;
#else
typedef CABINET_INFO_A CABINET_INFO;
typedef PCABINET_INFO_A PCABINET_INFO;
#endif

//
// Structure used with SPFILENOTIFY_FILEINCABINET
//
typedef struct _FILE_IN_CABINET_INFO_A {
    PCSTR NameInCabinet;
    DWORD FileSize;
    DWORD Win32Error;
    WORD  DosDate;
    WORD  DosTime;
    WORD  DosAttribs;
    CHAR  FullTargetName[MAX_PATH];
} FILE_IN_CABINET_INFO_A, *PFILE_IN_CABINET_INFO_A;

typedef struct _FILE_IN_CABINET_INFO_W {
    PCWSTR NameInCabinet;
    DWORD  FileSize;
    DWORD  Win32Error;
    WORD   DosDate;
    WORD   DosTime;
    WORD   DosAttribs;
    WCHAR  FullTargetName[MAX_PATH];
} FILE_IN_CABINET_INFO_W, *PFILE_IN_CABINET_INFO_W;

#ifdef UNICODE
typedef FILE_IN_CABINET_INFO_W FILE_IN_CABINET_INFO;
typedef PFILE_IN_CABINET_INFO_W PFILE_IN_CABINET_INFO;
#else
typedef FILE_IN_CABINET_INFO_A FILE_IN_CABINET_INFO;
typedef PFILE_IN_CABINET_INFO_A PFILE_IN_CABINET_INFO;
#endif


//
// Define type for setup file queue
//
typedef PVOID HSPFILEQ;

//
// Define type for setup disk space list
//
typedef PVOID HDSKSPC;

//
// Define type for reference to device information set
//
typedef PVOID HDEVINFO;

//
// Device information structure (references a device instance
// that is a member of a device information set)
//
typedef struct _SP_DEVINFO_DATA {
    DWORD cbSize;
    GUID  ClassGuid;
    DWORD DevInst;    // DEVINST handle
    DWORD Reserved;
} SP_DEVINFO_DATA, *PSP_DEVINFO_DATA;

//
// Device interface information structure (references a device
// interface that is associated with the device information
// element that owns it).
//
typedef struct _SP_DEVICE_INTERFACE_DATA {
    DWORD cbSize;
    GUID  InterfaceClassGuid;
    DWORD Flags;
    DWORD Reserved;
} SP_DEVICE_INTERFACE_DATA, *PSP_DEVICE_INTERFACE_DATA;

//
// Flags for SP_DEVICE_INTERFACE_DATA.Flags field.
//
#define SPINT_ACTIVE  0x00000001
#define SPINT_DEFAULT 0x00000002
#define SPINT_REMOVED 0x00000004

//
// Backward compatibility--do not use.
//
typedef SP_DEVICE_INTERFACE_DATA  SP_INTERFACE_DEVICE_DATA;
typedef PSP_DEVICE_INTERFACE_DATA PSP_INTERFACE_DEVICE_DATA;
#define SPID_ACTIVE               SPINT_ACTIVE
#define SPID_DEFAULT              SPINT_DEFAULT
#define SPID_REMOVED              SPINT_REMOVED


typedef struct _SP_DEVICE_INTERFACE_DETAIL_DATA_A {
    DWORD  cbSize;
    CHAR   DevicePath[ANYSIZE_ARRAY];
} SP_DEVICE_INTERFACE_DETAIL_DATA_A, *PSP_DEVICE_INTERFACE_DETAIL_DATA_A;

typedef struct _SP_DEVICE_INTERFACE_DETAIL_DATA_W {
    DWORD  cbSize;
    WCHAR  DevicePath[ANYSIZE_ARRAY];
} SP_DEVICE_INTERFACE_DETAIL_DATA_W, *PSP_DEVICE_INTERFACE_DETAIL_DATA_W;

#ifdef UNICODE
typedef SP_DEVICE_INTERFACE_DETAIL_DATA_W SP_DEVICE_INTERFACE_DETAIL_DATA;
typedef PSP_DEVICE_INTERFACE_DETAIL_DATA_W PSP_DEVICE_INTERFACE_DETAIL_DATA;
#else
typedef SP_DEVICE_INTERFACE_DETAIL_DATA_A SP_DEVICE_INTERFACE_DETAIL_DATA;
typedef PSP_DEVICE_INTERFACE_DETAIL_DATA_A PSP_DEVICE_INTERFACE_DETAIL_DATA;
#endif

//
// Backward compatibility--do not use.
//
typedef SP_DEVICE_INTERFACE_DETAIL_DATA_W SP_INTERFACE_DEVICE_DETAIL_DATA_W;
typedef PSP_DEVICE_INTERFACE_DETAIL_DATA_W PSP_INTERFACE_DEVICE_DETAIL_DATA_W;
typedef SP_DEVICE_INTERFACE_DETAIL_DATA_A SP_INTERFACE_DEVICE_DETAIL_DATA_A;
typedef PSP_DEVICE_INTERFACE_DETAIL_DATA_A PSP_INTERFACE_DEVICE_DETAIL_DATA_A;
#ifdef UNICODE
typedef SP_INTERFACE_DEVICE_DETAIL_DATA_W SP_INTERFACE_DEVICE_DETAIL_DATA;
typedef PSP_INTERFACE_DEVICE_DETAIL_DATA_W PSP_INTERFACE_DEVICE_DETAIL_DATA;
#else
typedef SP_INTERFACE_DEVICE_DETAIL_DATA_A SP_INTERFACE_DEVICE_DETAIL_DATA;
typedef PSP_INTERFACE_DEVICE_DETAIL_DATA_A PSP_INTERFACE_DEVICE_DETAIL_DATA;
#endif


//
// Structure for detailed information on a device information set (used for
// SetupDiGetDeviceInfoListDetail which supercedes the functionality of
// SetupDiGetDeviceInfoListClass).
//
typedef struct _SP_DEVINFO_LIST_DETAIL_DATA_A {
    DWORD  cbSize;
    GUID   ClassGuid;
    HANDLE RemoteMachineHandle;
    CHAR   RemoteMachineName[SP_MAX_MACHINENAME_LENGTH];
} SP_DEVINFO_LIST_DETAIL_DATA_A, *PSP_DEVINFO_LIST_DETAIL_DATA_A;

typedef struct _SP_DEVINFO_LIST_DETAIL_DATA_W {
    DWORD  cbSize;
    GUID   ClassGuid;
    HANDLE RemoteMachineHandle;
    WCHAR  RemoteMachineName[SP_MAX_MACHINENAME_LENGTH];
} SP_DEVINFO_LIST_DETAIL_DATA_W, *PSP_DEVINFO_LIST_DETAIL_DATA_W;

#ifdef UNICODE
typedef SP_DEVINFO_LIST_DETAIL_DATA_W SP_DEVINFO_LIST_DETAIL_DATA;
typedef PSP_DEVINFO_LIST_DETAIL_DATA_W PSP_DEVINFO_LIST_DETAIL_DATA;
#else
typedef SP_DEVINFO_LIST_DETAIL_DATA_A SP_DEVINFO_LIST_DETAIL_DATA;
typedef PSP_DEVINFO_LIST_DETAIL_DATA_A PSP_DEVINFO_LIST_DETAIL_DATA;
#endif


//
// Class installer function codes
//
#define DIF_SELECTDEVICE            0x00000001
#define DIF_INSTALLDEVICE           0x00000002
#define DIF_ASSIGNRESOURCES         0x00000003
#define DIF_PROPERTIES              0x00000004
#define DIF_REMOVE                  0x00000005
#define DIF_FIRSTTIMESETUP          0x00000006
#define DIF_FOUNDDEVICE             0x00000007
#define DIF_SELECTCLASSDRIVERS      0x00000008
#define DIF_VALIDATECLASSDRIVERS    0x00000009
#define DIF_INSTALLCLASSDRIVERS     0x0000000A
#define DIF_CALCDISKSPACE           0x0000000B
#define DIF_DESTROYPRIVATEDATA      0x0000000C
#define DIF_VALIDATEDRIVER          0x0000000D
#define DIF_MOVEDEVICE              0x0000000E
#define DIF_DETECT                  0x0000000F
#define DIF_INSTALLWIZARD           0x00000010
#define DIF_DESTROYWIZARDDATA       0x00000011
#define DIF_PROPERTYCHANGE          0x00000012
#define DIF_ENABLECLASS             0x00000013
#define DIF_DETECTVERIFY            0x00000014
#define DIF_INSTALLDEVICEFILES      0x00000015
#define DIF_UNREMOVE                0x00000016
#define DIF_SELECTBESTCOMPATDRV     0x00000017
#define DIF_ALLOW_INSTALL           0x00000018
#define DIF_REGISTERDEVICE          0x00000019
#define DIF_INSTALLINTERFACES       0x00000020
#define DIF_DETECTCANCEL            0x00000021
#define DIF_REGISTER_COINSTALLERS   0x00000022

typedef UINT        DI_FUNCTION;    // Function type for device installer


//
// Device installation parameters structure (associated with a
// particular device information element, or globally with a device
// information set)
//
typedef struct _SP_DEVINSTALL_PARAMS_A {
    DWORD             cbSize;
    DWORD             Flags;
    DWORD             FlagsEx;
    HWND              hwndParent;
    PSP_FILE_CALLBACK InstallMsgHandler;
    PVOID             InstallMsgHandlerContext;
    HSPFILEQ          FileQueue;
    DWORD             ClassInstallReserved;
    DWORD             Reserved;
    CHAR              DriverPath[MAX_PATH];
} SP_DEVINSTALL_PARAMS_A, *PSP_DEVINSTALL_PARAMS_A;

typedef struct _SP_DEVINSTALL_PARAMS_W {
    DWORD             cbSize;
    DWORD             Flags;
    DWORD             FlagsEx;
    HWND              hwndParent;
    PSP_FILE_CALLBACK InstallMsgHandler;
    PVOID             InstallMsgHandlerContext;
    HSPFILEQ          FileQueue;
    DWORD             ClassInstallReserved;
    DWORD             Reserved;
    WCHAR             DriverPath[MAX_PATH];
} SP_DEVINSTALL_PARAMS_W, *PSP_DEVINSTALL_PARAMS_W;

#ifdef UNICODE
typedef SP_DEVINSTALL_PARAMS_W SP_DEVINSTALL_PARAMS;
typedef PSP_DEVINSTALL_PARAMS_W PSP_DEVINSTALL_PARAMS;
#else
typedef SP_DEVINSTALL_PARAMS_A SP_DEVINSTALL_PARAMS;
typedef PSP_DEVINSTALL_PARAMS_A PSP_DEVINSTALL_PARAMS;
#endif


//
// SP_DEVINSTALL_PARAMS.Flags values
//
// Flags for choosing a device
//
#define DI_SHOWOEM                  0x00000001L     // support Other... button
#define DI_SHOWCOMPAT               0x00000002L     // show compatibility list
#define DI_SHOWCLASS                0x00000004L     // show class list
#define DI_SHOWALL                  0x00000007L     // both class & compat list shown
#define DI_NOVCP                    0x00000008L     // don't create a new copy queue--use
                                                    // caller-supplied FileQueue
#define DI_DIDCOMPAT                0x00000010L     // Searched for compatible devices
#define DI_DIDCLASS                 0x00000020L     // Searched for class devices
#define DI_AUTOASSIGNRES            0x00000040L     // No UI for resources if possible

// flags returned by DiInstallDevice to indicate need to reboot/restart
#define DI_NEEDRESTART              0x00000080L     // Reboot required to take effect
#define DI_NEEDREBOOT               0x00000100L     // ""

// flags for device installation
#define DI_NOBROWSE                 0x00000200L     // no Browse... in InsertDisk

// Flags set by DiBuildDriverInfoList
#define DI_MULTMFGS                 0x00000400L     // Set if multiple manufacturers in
                                                    // class driver list

// Flag indicates that device is disabled
#define DI_DISABLED                 0x00000800L     // Set if device disabled

// Flags for Device/Class Properties
#define DI_GENERALPAGE_ADDED        0x00001000L
#define DI_RESOURCEPAGE_ADDED       0x00002000L

// Flag to indicate the setting properties for this Device (or class) caused a change
// so the Dev Mgr UI probably needs to be updatd.
#define DI_PROPERTIES_CHANGE        0x00004000L

// Flag to indicate that the sorting from the INF file should be used.
#define DI_INF_IS_SORTED            0x00008000L

// Flag to indicate that only the the INF specified by SP_DEVINSTALL_PARAMS.DriverPath
// should be searched.
#define DI_ENUMSINGLEINF            0x00010000L

// Flag that prevents ConfigMgr from removing/re-enumerating devices during device
// registration, installation, and deletion.
#define DI_DONOTCALLCONFIGMG        0x00020000L

// The following flag can be used to install a device disabled
#define DI_INSTALLDISABLED          0x00040000L

// Flag that causes SetupDiBuildDriverInfoList to build a device's compatible driver
// list from its existing class driver list, instead of the normal INF search.
#define DI_COMPAT_FROM_CLASS        0x00080000L

// This flag is set if the Class Install params should be used.
#define DI_CLASSINSTALLPARAMS       0x00100000L

// This flag is set if the caller of DiCallClassInstaller does NOT
// want the internal default action performed if the Class installer
// returns ERROR_DI_DO_DEFAULT.
#define DI_NODI_DEFAULTACTION       0x00200000L

// The setupx flag, DI_NOSYNCPROCESSING (0x00400000L) is not support in the Setup APIs.

// flags for device installation
#define DI_QUIETINSTALL             0x00800000L     // don't confuse the user with
                                                    // questions or excess info
#define DI_NOFILECOPY               0x01000000L     // No file Copy necessary
#define DI_FORCECOPY                0x02000000L     // Force files to be copied from install path
#define DI_DRIVERPAGE_ADDED         0x04000000L     // Prop provider added Driver page.
#define DI_USECI_SELECTSTRINGS      0x08000000L     // Use Class Installer Provided strings in the Select Device Dlg
#define DI_OVERRIDE_INFFLAGS        0x10000000L     // Override INF flags
#define DI_PROPS_NOCHANGEUSAGE      0x20000000L     // No Enable/Disable in General Props

#define DI_NOSELECTICONS            0x40000000L     // No small icons in select device dialogs

#define DI_NOWRITE_IDS              0x80000000L     // Don't write HW & Compat IDs on install


//
// SP_DEVINSTALL_PARAMS.FlagsEx values
//
#define DI_FLAGSEX_USEOLDINFSEARCH      0x00000001L  // Inf Search functions should not use Index Search
#define DI_FLAGSEX_AUTOSELECTRANK0      0x00000002L  // SetupDiSelectDevice doesn't prompt user if rank 0 match
#define DI_FLAGSEX_CI_FAILED            0x00000004L  // Failed to Load/Call class installer

#define DI_FLAGSEX_DIDINFOLIST          0x00000010L  // Did the Class Info List
#define DI_FLAGSEX_DIDCOMPATINFO        0x00000020L  // Did the Compat Info List

#define DI_FLAGSEX_FILTERCLASSES        0x00000040L
#define DI_FLAGSEX_SETFAILEDINSTALL     0x00000080L
#define DI_FLAGSEX_DEVICECHANGE         0x00000100L
#define DI_FLAGSEX_ALWAYSWRITEIDS       0x00000200L
#define DI_FLAGSEX_ALLOWEXCLUDEDDRVS    0x00000800L
#define DI_FLAGSEX_NOUIONQUERYREMOVE    0x00001000L
#define DI_FLAGSEX_USECLASSFORCOMPAT    0x00002000L  // Use the device's class when building compat drv list.
                                                     // (Ignored if DI_COMPAT_FROM_CLASS flag is specified.)
#define DI_FLAGSEX_OLDINF_IN_CLASSLIST  0x00004000L  // Search legacy INFs when building class driver list.
#define DI_FLAGSEX_NO_DRVREG_MODIFY     0x00008000L  // Don't run AddReg and DelReg for device's software (driver) key.
#define DI_FLAGSEX_IN_SYSTEM_SETUP      0x00010000L  // Installation is occurring during initial system setup.
#define DI_FLAGSEX_INET_DRIVER          0x00020000L  // Driver came from Windows Update
#define DI_FLAGSEX_APPENDDRIVERLIST     0x00040000L  // Cause SetupDiBuildDriverInfoList to append
                                                     // a new driver list to an existing list.


//
// Class installation parameters header.  This must be the first field of any class install
// parameter structure.  The InstallFunction field must be set to the function code
// corresponding to the structure, and the cbSize field must be set to the size of the
// header structure.  E.g.,
//
// SP_ENABLECLASS_PARAMS EnableClassParams;
//
// EnableClassParams.ClassInstallHeader.cbSize = sizeof(SP_CLASSINSTALL_HEADER);
// EnableClassParams.ClassInstallHeader.InstallFunction = DIF_ENABLECLASS;
//
typedef struct _SP_CLASSINSTALL_HEADER {
    DWORD       cbSize;
    DI_FUNCTION InstallFunction;
} SP_CLASSINSTALL_HEADER, *PSP_CLASSINSTALL_HEADER;


//
// Structure corresponding to a DIF_ENABLECLASS install function.
//
typedef struct _SP_ENABLECLASS_PARAMS {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    GUID                   ClassGuid;
    DWORD                  EnableMessage;
} SP_ENABLECLASS_PARAMS, *PSP_ENABLECLASS_PARAMS;

#define ENABLECLASS_QUERY   0
#define ENABLECLASS_SUCCESS 1
#define ENABLECLASS_FAILURE 2


//
// Structure corresponding to a DIF_MOVEDEVICE install function.
//
typedef struct _SP_MOVEDEV_PARAMS {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    SP_DEVINFO_DATA        SourceDeviceInfoData;
} SP_MOVEDEV_PARAMS, *PSP_MOVEDEV_PARAMS;


//
// Values indicating a change in a device's state
//
#define DICS_ENABLE      0x00000001
#define DICS_DISABLE     0x00000002
#define DICS_PROPCHANGE  0x00000003
#define DICS_START       0x00000004
#define DICS_STOP        0x00000005
//
// Values specifying the scope of a device property change
//
#define DICS_FLAG_GLOBAL         0x00000001  // make change in all hardware profiles
#define DICS_FLAG_CONFIGSPECIFIC 0x00000002  // make change in specified profile only
#define DICS_FLAG_CONFIGGENERAL  0x00000004  // 1 or more hardware profile-specific
                                             // changes to follow.
//
// Structure corresponding to a DIF_PROPERTYCHANGE install function.
//
typedef struct _SP_PROPCHANGE_PARAMS {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    DWORD                  StateChange;
    DWORD                  Scope;
    DWORD                  HwProfile;
} SP_PROPCHANGE_PARAMS, *PSP_PROPCHANGE_PARAMS;


//
// Structure corresponding to a DIF_REMOVE install function.
//
typedef struct _SP_REMOVEDEVICE_PARAMS {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    DWORD Scope;
    DWORD HwProfile;
} SP_REMOVEDEVICE_PARAMS, *PSP_REMOVEDEVICE_PARAMS;

#define DI_REMOVEDEVICE_GLOBAL                  0x00000001
#define DI_REMOVEDEVICE_CONFIGSPECIFIC          0x00000002


//
// Structure corresponding to a DIF_UNREMOVE install function.
//
typedef struct _SP_UNREMOVEDEVICE_PARAMS {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    DWORD Scope;
    DWORD HwProfile;
} SP_UNREMOVEDEVICE_PARAMS, *PSP_UNREMOVEDEVICE_PARAMS;

#define DI_UNREMOVEDEVICE_CONFIGSPECIFIC        0x00000002


//
// Structure corresponding to a DIF_SELECTDEVICE install function.
//
typedef struct _SP_SELECTDEVICE_PARAMS_A {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    CHAR                   Title[MAX_TITLE_LEN];
    CHAR                   Instructions[MAX_INSTRUCTION_LEN];
    CHAR                   ListLabel[MAX_LABEL_LEN];
    BYTE                   Reserved[2];                  // DWORD size alignment
} SP_SELECTDEVICE_PARAMS_A, *PSP_SELECTDEVICE_PARAMS_A;

typedef struct _SP_SELECTDEVICE_PARAMS_W {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    WCHAR                  Title[MAX_TITLE_LEN];
    WCHAR                  Instructions[MAX_INSTRUCTION_LEN];
    WCHAR                  ListLabel[MAX_LABEL_LEN];
} SP_SELECTDEVICE_PARAMS_W, *PSP_SELECTDEVICE_PARAMS_W;

#ifdef UNICODE
typedef SP_SELECTDEVICE_PARAMS_W SP_SELECTDEVICE_PARAMS;
typedef PSP_SELECTDEVICE_PARAMS_W PSP_SELECTDEVICE_PARAMS;
#else
typedef SP_SELECTDEVICE_PARAMS_A SP_SELECTDEVICE_PARAMS;
typedef PSP_SELECTDEVICE_PARAMS_A PSP_SELECTDEVICE_PARAMS;
#endif


//
// Structure corresponding to a DIF_DETECT install function.
//

typedef BOOL (CALLBACK* PDETECT_PROGRESS_NOTIFY)(
     IN PVOID ProgressNotifyParam,
     IN DWORD DetectComplete
     );

// where:
//     ProgressNotifyParam - value supplied by caller requesting detection.
//     DetectComplete - Percent completion, to be incremented by class
//                      installer, as it steps thru its detection.
//
// Return Value - If TRUE, then detection is cancelled.  Allows caller
//                requesting detection to stop detection asap.
//

typedef struct _SP_DETECTDEVICE_PARAMS {
    SP_CLASSINSTALL_HEADER  ClassInstallHeader;
    PDETECT_PROGRESS_NOTIFY DetectProgressNotify;
    PVOID                   ProgressNotifyParam;
} SP_DETECTDEVICE_PARAMS, *PSP_DETECTDEVICE_PARAMS;


//
// 'Add New Device' installation wizard structure
//
// Structure corresponding to a DIF_INSTALLWIZARD install function.
// (NOTE: This structure is also applicable for DIF_DESTROYWIZARDDATA,
// but DIF_INSTALLWIZARD is the associated function code in the class
// installation parameter structure in both cases.)
//
// Define maximum number of dynamic wizard pages that can be added to
// hardware install wizard.
//
#define MAX_INSTALLWIZARD_DYNAPAGES             20

typedef struct _SP_INSTALLWIZARD_DATA {
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    DWORD                  Flags;
    HPROPSHEETPAGE         DynamicPages[MAX_INSTALLWIZARD_DYNAPAGES];
    DWORD                  NumDynamicPages;
    DWORD                  DynamicPageFlags;
    DWORD                  PrivateFlags;
    LPARAM                 PrivateData;
    HWND                   hwndWizardDlg;
} SP_INSTALLWIZARD_DATA, *PSP_INSTALLWIZARD_DATA;

//
// SP_INSTALLWIZARD_DATA.Flags values
//
#define NDW_INSTALLFLAG_DIDFACTDEFS         0x00000001
#define NDW_INSTALLFLAG_HARDWAREALLREADYIN  0x00000002
#define NDW_INSTALLFLAG_NEEDRESTART         DI_NEEDRESTART
#define NDW_INSTALLFLAG_NEEDREBOOT          DI_NEEDREBOOT
#define NDW_INSTALLFLAG_NEEDSHUTDOWN        0x00000200
#define NDW_INSTALLFLAG_EXPRESSINTRO        0x00000400
#define NDW_INSTALLFLAG_SKIPISDEVINSTALLED  0x00000800
#define NDW_INSTALLFLAG_NODETECTEDDEVS      0x00001000
#define NDW_INSTALLFLAG_INSTALLSPECIFIC     0x00002000
#define NDW_INSTALLFLAG_SKIPCLASSLIST       0x00004000
#define NDW_INSTALLFLAG_CI_PICKED_OEM       0x00008000
#define NDW_INSTALLFLAG_PCMCIAMODE          0x00010000
#define NDW_INSTALLFLAG_PCMCIADEVICE        0x00020000
#define NDW_INSTALLFLAG_USERCANCEL          0x00040000
#define NDW_INSTALLFLAG_KNOWNCLASS          0x00080000


//
// SP_INSTALLWIZARD_DATA.DynamicPageFlags values
//
// This flag is set if a Class installer has added pages to the
// install wizard.
//
#define DYNAWIZ_FLAG_PAGESADDED             0x00000001

//
// The following flags will control the button states when displaying
// the InstallDetectedDevs dialog.
//
#define DYNAWIZ_FLAG_INSTALLDET_NEXT        0x00000002
#define DYNAWIZ_FLAG_INSTALLDET_PREV        0x00000004

// Set this flag if you jump to the analyze page, and want it to
// handle conflicts for you.  NOTE.  You will not get control back
// in the event of a conflict if you set this flag.
//
// BUGBUG (lonnym): Not currently implemented!
//
#define DYNAWIZ_FLAG_ANALYZE_HANDLECONFLICT 0x00000008

//
// Define wizard page resource IDs to be used when adding custom pages
// to the hardware install wizard.
//
// Resource ID for the first page that the install wizard will go to after
// adding the class installer pages.
//
#define IDD_DYNAWIZ_FIRSTPAGE                   10000

//
// Resource ID for the page that the Select Device page will go back to.
//
#define IDD_DYNAWIZ_SELECT_PREVPAGE             10001

//
// Resource ID for the page that the Select Device page will go forward to.
//
#define IDD_DYNAWIZ_SELECT_NEXTPAGE             10002

//
// Resource ID for the page that the Analyze dialog should go back to
// This will only be used in the event that there is a problem, and the user
// selects Back from the analyze proc.
//
#define IDD_DYNAWIZ_ANALYZE_PREVPAGE            10003

//
// Resource ID for the page that the Analyze dialog should go to if it
// continue from the analyze proc.  the wAnalyzeResult in the INSTALLDATA
// struct will contain the anaysis results.
//
#define IDD_DYNAWIZ_ANALYZE_NEXTPAGE            10004

//
// Resource ID for that page that the Install detected devices page will go
// back to.
//
#define IDD_DYNAWIZ_INSTALLDETECTED_PREVPAGE    10006

//
// Resource ID for the page that the Install detected devices page will go
// forward to.
//
#define IDD_DYNAWIZ_INSTALLDETECTED_NEXTPAGE    10007

//
// Resource ID for the page that the Install detected devices page will go
// to in the event that no devices are detected.
//
#define IDD_DYNAWIZ_INSTALLDETECTED_NODEVS      10008

//
// Resource ID of the hardware install wizard's select device page.
// This ID can be used to go directly to the hardware install wizard's select
// device page.
//
#define IDD_DYNAWIZ_SELECTDEV_PAGE              10009

//
// Resource ID of the hardware install wizard's device analysis page.
// This ID can be use to go directly to the hardware install wizard's analysis
// page.
//
#define IDD_DYNAWIZ_ANALYZEDEV_PAGE             10010

//
// Resource ID of the hardware install wizard's install detected devices page.
// This ID can be use to go directly to the hardware install wizard's install
// detected devices page.
//
#define IDD_DYNAWIZ_INSTALLDETECTEDDEVS_PAGE    10011

//
// Resource ID of the hardware install wizard's select class page.
// This ID can be use to go directly to the hardware install wizard's select
// class page.
//
#define IDD_DYNAWIZ_SELECTCLASS_PAGE            10012


//
// Driver information structure (member of a driver info list that may be associated
// with a particular device instance, or (globally) with a device information set)
//
typedef struct _SP_DRVINFO_DATA_A {
    DWORD cbSize;
    DWORD DriverType;
    DWORD Reserved;
    CHAR  Description[LINE_LEN];
    CHAR  MfgName[LINE_LEN];
    CHAR  ProviderName[LINE_LEN];
} SP_DRVINFO_DATA_A, *PSP_DRVINFO_DATA_A;

typedef struct _SP_DRVINFO_DATA_W {
    DWORD cbSize;
    DWORD DriverType;
    DWORD Reserved;
    WCHAR Description[LINE_LEN];
    WCHAR MfgName[LINE_LEN];
    WCHAR ProviderName[LINE_LEN];
} SP_DRVINFO_DATA_W, *PSP_DRVINFO_DATA_W;

#ifdef UNICODE
typedef SP_DRVINFO_DATA_W SP_DRVINFO_DATA;
typedef PSP_DRVINFO_DATA_W PSP_DRVINFO_DATA;
#else
typedef SP_DRVINFO_DATA_A SP_DRVINFO_DATA;
typedef PSP_DRVINFO_DATA_A PSP_DRVINFO_DATA;
#endif


//
// Driver information details structure (provides detailed information about a
// particular driver information structure)
//
typedef struct _SP_DRVINFO_DETAIL_DATA_A {
    DWORD    cbSize;
    FILETIME InfDate;
    DWORD    CompatIDsOffset;
    DWORD    CompatIDsLength;
    DWORD    Reserved;
    CHAR     SectionName[LINE_LEN];
    CHAR     InfFileName[MAX_PATH];
    CHAR     DrvDescription[LINE_LEN];
    CHAR     HardwareID[ANYSIZE_ARRAY];
} SP_DRVINFO_DETAIL_DATA_A, *PSP_DRVINFO_DETAIL_DATA_A;

typedef struct _SP_DRVINFO_DETAIL_DATA_W {
    DWORD    cbSize;
    FILETIME InfDate;
    DWORD    CompatIDsOffset;
    DWORD    CompatIDsLength;
    DWORD    Reserved;
    WCHAR    SectionName[LINE_LEN];
    WCHAR    InfFileName[MAX_PATH];
    WCHAR    DrvDescription[LINE_LEN];
    WCHAR    HardwareID[ANYSIZE_ARRAY];
} SP_DRVINFO_DETAIL_DATA_W, *PSP_DRVINFO_DETAIL_DATA_W;

#ifdef UNICODE
typedef SP_DRVINFO_DETAIL_DATA_W SP_DRVINFO_DETAIL_DATA;
typedef PSP_DRVINFO_DETAIL_DATA_W PSP_DRVINFO_DETAIL_DATA;
#else
typedef SP_DRVINFO_DETAIL_DATA_A SP_DRVINFO_DETAIL_DATA;
typedef PSP_DRVINFO_DETAIL_DATA_A PSP_DRVINFO_DETAIL_DATA;
#endif


//
// Driver installation parameters (associated with a particular driver
// information element)
//
typedef struct _SP_DRVINSTALL_PARAMS {
    DWORD cbSize;
    DWORD Rank;
    DWORD Flags;
    DWORD PrivateData;
    DWORD Reserved;
} SP_DRVINSTALL_PARAMS, *PSP_DRVINSTALL_PARAMS;

//
// SP_DRVINSTALL_PARAMS.Flags values
//
#define DNF_DUPDESC         0x00000001   // Multiple providers have same desc
#define DNF_OLDDRIVER       0x00000002   // Driver node specifies old/current driver
#define DNF_EXCLUDEFROMLIST 0x00000004   // If set, this driver node will not be
                                         // displayed in any driver select dialogs.
#define DNF_NODRIVER        0x00000008   // if we want to install no driver
                                         // (e.g no mouse drv)
#define DNF_LEGACYINF       0x00000010   // this driver node comes from an old-style INF


//
// Setup callback routine for comparing detection signatures
//
typedef DWORD (CALLBACK* PSP_DETSIG_CMPPROC)(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA NewDeviceData,
    IN PSP_DEVINFO_DATA ExistingDeviceData,
    IN PVOID            CompareContext      OPTIONAL
    );


//
// Define context structure handed to co-installers
//
typedef struct _COINSTALLER_CONTEXT_DATA {
    BOOL  PostProcessing;
    DWORD InstallResult;
    PVOID PrivateData;
} COINSTALLER_CONTEXT_DATA, *PCOINSTALLER_CONTEXT_DATA;


//
// Structure containing class image list information.
//
typedef struct _SP_CLASSIMAGELIST_DATA {
    DWORD      cbSize;
    HIMAGELIST ImageList;
    DWORD      Reserved;
} SP_CLASSIMAGELIST_DATA, *PSP_CLASSIMAGELIST_DATA;


//
// Structure to be passed as first parameter (LPVOID lpv) to ExtensionPropSheetPageProc
// entry point in setupapi.dll or to "EnumPropPages32" or "BasicProperties32" entry
// points provided by class/device property page providers.  Used to retrieve a handle
// (or, potentially, multiple handles) to property pages for a specified property page type.
//
typedef struct _SP_PROPSHEETPAGE_REQUEST {
    DWORD            cbSize;
    DWORD            PageRequested;
    HDEVINFO         DeviceInfoSet;
    PSP_DEVINFO_DATA DeviceInfoData;
} SP_PROPSHEETPAGE_REQUEST, *PSP_PROPSHEETPAGE_REQUEST;

//
// Property sheet codes used in SP_PROPSHEETPAGE_REQUEST.PageRequested
//
#define SPPSR_SELECT_DEVICE_RESOURCES      1    // supplied by setupapi.dll
#define SPPSR_ENUM_BASIC_DEVICE_PROPERTIES 2    // supplied by device's BasicProperties32 provider
#define SPPSR_ENUM_ADV_DEVICE_PROPERTIES   3    // supplied by class and/or device's EnumPropPages32 provider


//
// Setupapi-specific error codes
//
// Inf parse outcomes
//
#define ERROR_EXPECTED_SECTION_NAME  (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0)
#define ERROR_BAD_SECTION_NAME_LINE  (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|1)
#define ERROR_SECTION_NAME_TOO_LONG  (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|2)
#define ERROR_GENERAL_SYNTAX         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|3)
//
// Inf runtime errors
//
#define ERROR_WRONG_INF_STYLE        (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x100)
#define ERROR_SECTION_NOT_FOUND      (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x101)
#define ERROR_LINE_NOT_FOUND         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x102)
//
// Device Installer errors
//
#define ERROR_NO_ASSOCIATED_CLASS         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x200)
#define ERROR_CLASS_MISMATCH              (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x201)
#define ERROR_DUPLICATE_FOUND             (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x202)
#define ERROR_NO_DRIVER_SELECTED          (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x203)
#define ERROR_KEY_DOES_NOT_EXIST          (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x204)
#define ERROR_INVALID_DEVINST_NAME        (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x205)
#define ERROR_INVALID_CLASS               (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x206)
#define ERROR_DEVINST_ALREADY_EXISTS      (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x207)
#define ERROR_DEVINFO_NOT_REGISTERED      (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x208)
#define ERROR_INVALID_REG_PROPERTY        (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x209)
#define ERROR_NO_INF                      (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x20A)
#define ERROR_NO_SUCH_DEVINST             (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x20B)
#define ERROR_CANT_LOAD_CLASS_ICON        (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x20C)
#define ERROR_INVALID_CLASS_INSTALLER     (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x20D)
#define ERROR_DI_DO_DEFAULT               (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x20E)
#define ERROR_DI_NOFILECOPY               (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x20F)
#define ERROR_INVALID_HWPROFILE           (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x210)
#define ERROR_NO_DEVICE_SELECTED          (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x211)
#define ERROR_DEVINFO_LIST_LOCKED         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x212)
#define ERROR_DEVINFO_DATA_LOCKED         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x213)
#define ERROR_DI_BAD_PATH                 (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x214)
#define ERROR_NO_CLASSINSTALL_PARAMS      (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x215)
#define ERROR_FILEQUEUE_LOCKED            (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x216)
#define ERROR_BAD_SERVICE_INSTALLSECT     (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x217)
#define ERROR_NO_CLASS_DRIVER_LIST        (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x218)
#define ERROR_NO_ASSOCIATED_SERVICE       (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x219)
#define ERROR_NO_DEFAULT_DEVICE_INTERFACE (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x21A)
#define ERROR_DEVICE_INTERFACE_ACTIVE     (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x21B)
#define ERROR_DEVICE_INTERFACE_REMOVED    (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x21C)
#define ERROR_BAD_INTERFACE_INSTALLSECT   (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x21D)
#define ERROR_NO_SUCH_INTERFACE_CLASS     (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x21E)
#define ERROR_INVALID_REFERENCE_STRING    (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x21F)
#define ERROR_INVALID_MACHINENAME         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x220)
#define ERROR_REMOTE_COMM_FAILURE         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x221)
#define ERROR_MACHINE_UNAVAILABLE         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x222)
#define ERROR_NO_CONFIGMGR_SERVICES       (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x223)
#define ERROR_INVALID_PROPPAGE_PROVIDER   (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x224)
#define ERROR_NO_SUCH_DEVICE_INTERFACE    (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x225)
#define ERROR_DI_POSTPROCESSING_REQUIRED  (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x226)
#define ERROR_INVALID_COINSTALLER         (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x227)
#define ERROR_NO_COMPAT_DRIVERS           (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x228)
#define ERROR_NO_DEVICE_ICON              (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x229)
#define ERROR_INVALID_INF_LOGCONFIG       (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x22A)
#define ERROR_DI_DONT_INSTALL             (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x22B)
#define ERROR_INVALID_FILTER_DRIVER       (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x22C)

//
// Backward compatibility--do not use.
//
#define ERROR_NO_DEFAULT_INTERFACE_DEVICE ERROR_NO_DEFAULT_DEVICE_INTERFACE
#define ERROR_INTERFACE_DEVICE_ACTIVE     ERROR_DEVICE_INTERFACE_ACTIVE
#define ERROR_INTERFACE_DEVICE_REMOVED    ERROR_DEVICE_INTERFACE_REMOVED
#define ERROR_NO_SUCH_INTERFACE_DEVICE    ERROR_NO_SUCH_DEVICE_INTERFACE


//
// Win9x migration DLL error code
//
#define ERROR_NOT_INSTALLED               (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR|0x1000)


WINSETUPAPI
BOOL
WINAPI
SetupGetInfInformationA(
    IN  LPCVOID             InfSpec,
    IN  DWORD               SearchControl,
    OUT PSP_INF_INFORMATION ReturnBuffer,     OPTIONAL
    IN  DWORD               ReturnBufferSize,
    OUT PDWORD              RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetInfInformationW(
    IN  LPCVOID             InfSpec,
    IN  DWORD               SearchControl,
    OUT PSP_INF_INFORMATION ReturnBuffer,     OPTIONAL
    IN  DWORD               ReturnBufferSize,
    OUT PDWORD              RequiredSize      OPTIONAL
    );

//
// SearchControl flags for SetupGetInfInformation
//
#define INFINFO_INF_SPEC_IS_HINF        1
#define INFINFO_INF_NAME_IS_ABSOLUTE    2
#define INFINFO_DEFAULT_SEARCH          3
#define INFINFO_REVERSE_DEFAULT_SEARCH  4
#define INFINFO_INF_PATH_LIST_SEARCH    5

#ifdef UNICODE
#define SetupGetInfInformation SetupGetInfInformationW
#else
#define SetupGetInfInformation SetupGetInfInformationA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueryInfFileInformationA(
    IN  PSP_INF_INFORMATION InfInformation,
    IN  UINT                InfIndex,
    OUT PSTR                ReturnBuffer,     OPTIONAL
    IN  DWORD               ReturnBufferSize,
    OUT PDWORD              RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueryInfFileInformationW(
    IN  PSP_INF_INFORMATION InfInformation,
    IN  UINT                InfIndex,
    OUT PWSTR               ReturnBuffer,     OPTIONAL
    IN  DWORD               ReturnBufferSize,
    OUT PDWORD              RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupQueryInfFileInformation SetupQueryInfFileInformationW
#else
#define SetupQueryInfFileInformation SetupQueryInfFileInformationA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueryInfVersionInformationA(
    IN  PSP_INF_INFORMATION InfInformation,
    IN  UINT                InfIndex,
    IN  PCSTR               Key,              OPTIONAL
    OUT PSTR                ReturnBuffer,     OPTIONAL
    IN  DWORD               ReturnBufferSize,
    OUT PDWORD              RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueryInfVersionInformationW(
    IN  PSP_INF_INFORMATION InfInformation,
    IN  UINT                InfIndex,
    IN  PCWSTR              Key,              OPTIONAL
    OUT PWSTR               ReturnBuffer,     OPTIONAL
    IN  DWORD               ReturnBufferSize,
    OUT PDWORD              RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupQueryInfVersionInformation SetupQueryInfVersionInformationW
#else
#define SetupQueryInfVersionInformation SetupQueryInfVersionInformationA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetInfFileListA(
    IN  PCSTR  DirectoryPath,    OPTIONAL
    IN  DWORD  InfStyle,
    OUT PSTR   ReturnBuffer,     OPTIONAL
    IN  DWORD  ReturnBufferSize,
    OUT PDWORD RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetInfFileListW(
    IN  PCWSTR DirectoryPath,    OPTIONAL
    IN  DWORD  InfStyle,
    OUT PWSTR  ReturnBuffer,     OPTIONAL
    IN  DWORD  ReturnBufferSize,
    OUT PDWORD RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupGetInfFileList SetupGetInfFileListW
#else
#define SetupGetInfFileList SetupGetInfFileListA
#endif


WINSETUPAPI
HINF
WINAPI
SetupOpenInfFileW(
    IN  PCWSTR FileName,
    IN  PCWSTR InfClass,    OPTIONAL
    IN  DWORD  InfStyle,
    OUT PUINT  ErrorLine    OPTIONAL
    );

WINSETUPAPI
HINF
WINAPI
SetupOpenInfFileA(
    IN  PCSTR FileName,
    IN  PCSTR InfClass,     OPTIONAL
    IN  DWORD InfStyle,
    OUT PUINT ErrorLine     OPTIONAL
    );

#ifdef UNICODE
#define SetupOpenInfFile SetupOpenInfFileW
#else
#define SetupOpenInfFile SetupOpenInfFileA
#endif


WINSETUPAPI
HINF
WINAPI
SetupOpenMasterInf(
    VOID
    );


WINSETUPAPI
BOOL
WINAPI
SetupOpenAppendInfFileW(
    IN  PCWSTR FileName,    OPTIONAL
    IN  HINF   InfHandle,
    OUT PUINT  ErrorLine    OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupOpenAppendInfFileA(
    IN  PCSTR FileName,     OPTIONAL
    IN  HINF  InfHandle,
    OUT PUINT ErrorLine     OPTIONAL
    );

#ifdef UNICODE
#define SetupOpenAppendInfFile SetupOpenAppendInfFileW
#else
#define SetupOpenAppendInfFile SetupOpenAppendInfFileA
#endif


WINSETUPAPI
VOID
WINAPI
SetupCloseInfFile(
    IN HINF InfHandle
    );


WINSETUPAPI
BOOL
WINAPI
SetupFindFirstLineA(
    IN  HINF        InfHandle,
    IN  PCSTR       Section,
    IN  PCSTR       Key,          OPTIONAL
    OUT PINFCONTEXT Context
    );

WINSETUPAPI
BOOL
WINAPI
SetupFindFirstLineW(
    IN  HINF        InfHandle,
    IN  PCWSTR      Section,
    IN  PCWSTR      Key,          OPTIONAL
    OUT PINFCONTEXT Context
    );

#ifdef UNICODE
#define SetupFindFirstLine SetupFindFirstLineW
#else
#define SetupFindFirstLine SetupFindFirstLineA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupFindNextLine(
    IN  PINFCONTEXT ContextIn,
    OUT PINFCONTEXT ContextOut
    );


WINSETUPAPI
BOOL
WINAPI
SetupFindNextMatchLineA(
    IN  PINFCONTEXT ContextIn,
    IN  PCSTR       Key,        OPTIONAL
    OUT PINFCONTEXT ContextOut
    );

WINSETUPAPI
BOOL
WINAPI
SetupFindNextMatchLineW(
    IN  PINFCONTEXT ContextIn,
    IN  PCWSTR      Key,        OPTIONAL
    OUT PINFCONTEXT ContextOut
    );

#ifdef UNICODE
#define SetupFindNextMatchLine SetupFindNextMatchLineW
#else
#define SetupFindNextMatchLine SetupFindNextMatchLineA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetLineByIndexA(
    IN  HINF        InfHandle,
    IN  PCSTR       Section,
    IN  DWORD       Index,
    OUT PINFCONTEXT Context
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetLineByIndexW(
    IN  HINF        InfHandle,
    IN  PCWSTR      Section,
    IN  DWORD       Index,
    OUT PINFCONTEXT Context
    );

#ifdef UNICODE
#define SetupGetLineByIndex SetupGetLineByIndexW
#else
#define SetupGetLineByIndex SetupGetLineByIndexA
#endif


WINSETUPAPI
LONG
WINAPI
SetupGetLineCountA(
    IN HINF  InfHandle,
    IN PCSTR Section
    );

WINSETUPAPI
LONG
WINAPI
SetupGetLineCountW(
    IN HINF   InfHandle,
    IN PCWSTR Section
    );

#ifdef UNICODE
#define SetupGetLineCount SetupGetLineCountW
#else
#define SetupGetLineCount SetupGetLineCountA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetLineTextA(
    IN  PINFCONTEXT Context,          OPTIONAL
    IN  HINF        InfHandle,        OPTIONAL
    IN  PCSTR       Section,          OPTIONAL
    IN  PCSTR       Key,              OPTIONAL
    OUT PSTR        ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetLineTextW(
    IN  PINFCONTEXT Context,          OPTIONAL
    IN  HINF        InfHandle,        OPTIONAL
    IN  PCWSTR      Section,          OPTIONAL
    IN  PCWSTR      Key,              OPTIONAL
    OUT PWSTR       ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupGetLineText SetupGetLineTextW
#else
#define SetupGetLineText SetupGetLineTextA
#endif


WINSETUPAPI
DWORD
WINAPI
SetupGetFieldCount(
    IN PINFCONTEXT Context
    );


WINSETUPAPI
BOOL
WINAPI
SetupGetStringFieldA(
    IN  PINFCONTEXT Context,
    IN  DWORD       FieldIndex,
    OUT PSTR        ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetStringFieldW(
    IN  PINFCONTEXT Context,
    IN  DWORD       FieldIndex,
    OUT PWSTR       ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupGetStringField SetupGetStringFieldW
#else
#define SetupGetStringField SetupGetStringFieldA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetIntField(
    IN  PINFCONTEXT Context,
    IN  DWORD       FieldIndex,
    OUT PINT        IntegerValue
    );


WINSETUPAPI
BOOL
WINAPI
SetupGetMultiSzFieldA(
    IN  PINFCONTEXT Context,
    IN  DWORD       FieldIndex,
    OUT PSTR        ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT LPDWORD     RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetMultiSzFieldW(
    IN  PINFCONTEXT Context,
    IN  DWORD       FieldIndex,
    OUT PWSTR       ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT LPDWORD     RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupGetMultiSzField SetupGetMultiSzFieldW
#else
#define SetupGetMultiSzField SetupGetMultiSzFieldA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetBinaryField(
    IN  PINFCONTEXT Context,
    IN  DWORD       FieldIndex,
    OUT PBYTE       ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT LPDWORD     RequiredSize      OPTIONAL
    );


WINSETUPAPI
DWORD
WINAPI
SetupGetFileCompressionInfoA(
    IN  PCSTR   SourceFileName,
    OUT PSTR   *ActualSourceFileName,
    OUT PDWORD  SourceFileSize,
    OUT PDWORD  TargetFileSize,
    OUT PUINT   CompressionType
    );

WINSETUPAPI
DWORD
WINAPI
SetupGetFileCompressionInfoW(
    IN  PCWSTR  SourceFileName,
    OUT PWSTR  *ActualSourceFileName,
    OUT PDWORD  SourceFileSize,
    OUT PDWORD  TargetFileSize,
    OUT PUINT   CompressionType
    );

#ifdef UNICODE
#define SetupGetFileCompressionInfo SetupGetFileCompressionInfoW
#else
#define SetupGetFileCompressionInfo SetupGetFileCompressionInfoA
#endif


//
// Compression types
//
#define FILE_COMPRESSION_NONE       0
#define FILE_COMPRESSION_WINLZA     1
#define FILE_COMPRESSION_MSZIP      2


WINSETUPAPI
DWORD
WINAPI
SetupDecompressOrCopyFileA(
    IN PCSTR SourceFileName,
    IN PCSTR TargetFileName,
    IN PUINT CompressionType OPTIONAL
    );

WINSETUPAPI
DWORD
WINAPI
SetupDecompressOrCopyFileW(
    IN PCWSTR SourceFileName,
    IN PCWSTR TargetFileName,
    IN PUINT  CompressionType OPTIONAL
    );

#ifdef UNICODE
#define SetupDecompressOrCopyFile SetupDecompressOrCopyFileW
#else
#define SetupDecompressOrCopyFile SetupDecompressOrCopyFileA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetSourceFileLocationA(
    IN  HINF        InfHandle,
    IN  PINFCONTEXT InfContext,       OPTIONAL
    IN  PCSTR       FileName,         OPTIONAL
    OUT PUINT       SourceId,
    OUT PSTR        ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetSourceFileLocationW(
    IN  HINF        InfHandle,
    IN  PINFCONTEXT InfContext,       OPTIONAL
    IN  PCWSTR      FileName,         OPTIONAL
    OUT PUINT       SourceId,
    OUT PWSTR       ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupGetSourceFileLocation SetupGetSourceFileLocationW
#else
#define SetupGetSourceFileLocation SetupGetSourceFileLocationA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetSourceFileSizeA(
    IN  HINF        InfHandle,
    IN  PINFCONTEXT InfContext,     OPTIONAL
    IN  PCSTR       FileName,       OPTIONAL
    IN  PCSTR       Section,        OPTIONAL
    OUT PDWORD      FileSize,
    IN  UINT        RoundingFactor  OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetSourceFileSizeW(
    IN  HINF        InfHandle,
    IN  PINFCONTEXT InfContext,     OPTIONAL
    IN  PCWSTR      FileName,       OPTIONAL
    IN  PCWSTR      Section,        OPTIONAL
    OUT PDWORD      FileSize,
    IN  UINT        RoundingFactor  OPTIONAL
    );

#ifdef UNICODE
#define SetupGetSourceFileSize SetupGetSourceFileSizeW
#else
#define SetupGetSourceFileSize SetupGetSourceFileSizeA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupGetTargetPathA(
    IN  HINF        InfHandle,
    IN  PINFCONTEXT InfContext,       OPTIONAL
    IN  PCSTR       Section,          OPTIONAL
    OUT PSTR        ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetTargetPathW(
    IN  HINF        InfHandle,
    IN  PINFCONTEXT InfContext,       OPTIONAL
    IN  PCWSTR      Section,          OPTIONAL
    OUT PWSTR       ReturnBuffer,     OPTIONAL
    IN  DWORD       ReturnBufferSize,
    OUT PDWORD      RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupGetTargetPath SetupGetTargetPathW
#else
#define SetupGetTargetPath SetupGetTargetPathA
#endif


//
// Define flags for SourceList APIs.
//
#define SRCLIST_TEMPORARY       0x00000001
#define SRCLIST_NOBROWSE        0x00000002
#define SRCLIST_SYSTEM          0x00000010
#define SRCLIST_USER            0x00000020
#define SRCLIST_SYSIFADMIN      0x00000040
#define SRCLIST_SUBDIRS         0x00000100
#define SRCLIST_APPEND          0x00000200
#define SRCLIST_NOSTRIPPLATFORM 0x00000400


WINSETUPAPI
BOOL
WINAPI
SetupSetSourceListA(
    IN DWORD  Flags,
    IN PCSTR *SourceList,
    IN UINT   SourceCount
    );

WINSETUPAPI
BOOL
WINAPI
SetupSetSourceListW(
    IN DWORD   Flags,
    IN PCWSTR *SourceList,
    IN UINT    SourceCount
    );

#ifdef UNICODE
#define SetupSetSourceList SetupSetSourceListW
#else
#define SetupSetSourceList SetupSetSourceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupCancelTemporarySourceList(
    VOID
    );


WINSETUPAPI
BOOL
WINAPI
SetupAddToSourceListA(
    IN DWORD Flags,
    IN PCSTR Source
    );

WINSETUPAPI
BOOL
WINAPI
SetupAddToSourceListW(
    IN DWORD  Flags,
    IN PCWSTR Source
    );

#ifdef UNICODE
#define SetupAddToSourceList SetupAddToSourceListW
#else
#define SetupAddToSourceList SetupAddToSourceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupRemoveFromSourceListA(
    IN DWORD Flags,
    IN PCSTR Source
    );

WINSETUPAPI
BOOL
WINAPI
SetupRemoveFromSourceListW(
    IN DWORD  Flags,
    IN PCWSTR Source
    );

#ifdef UNICODE
#define SetupRemoveFromSourceList SetupRemoveFromSourceListW
#else
#define SetupRemoveFromSourceList SetupRemoveFromSourceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQuerySourceListA(
    IN  DWORD   Flags,
    OUT PCSTR **List,
    OUT PUINT   Count
    );

WINSETUPAPI
BOOL
WINAPI
SetupQuerySourceListW(
    IN  DWORD    Flags,
    OUT PCWSTR **List,
    OUT PUINT    Count
    );

#ifdef UNICODE
#define SetupQuerySourceList SetupQuerySourceListW
#else
#define SetupQuerySourceList SetupQuerySourceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupFreeSourceListA(
    IN OUT PCSTR **List,
    IN     UINT    Count
    );

WINSETUPAPI
BOOL
WINAPI
SetupFreeSourceListW(
    IN OUT PCWSTR **List,
    IN     UINT     Count
    );

#ifdef UNICODE
#define SetupFreeSourceList SetupFreeSourceListW
#else
#define SetupFreeSourceList SetupFreeSourceListA
#endif


WINSETUPAPI
UINT
WINAPI
SetupPromptForDiskA(
    IN  HWND   hwndParent,
    IN  PCSTR  DialogTitle,      OPTIONAL
    IN  PCSTR  DiskName,         OPTIONAL
    IN  PCSTR  PathToSource,     OPTIONAL
    IN  PCSTR  FileSought,
    IN  PCSTR  TagFile,          OPTIONAL
    IN  DWORD  DiskPromptStyle,
    OUT PSTR   PathBuffer,
    IN  DWORD  PathBufferSize,
    OUT PDWORD PathRequiredSize
    );

WINSETUPAPI
UINT
WINAPI
SetupPromptForDiskW(
    IN  HWND   hwndParent,
    IN  PCWSTR DialogTitle,      OPTIONAL
    IN  PCWSTR DiskName,         OPTIONAL
    IN  PCWSTR PathToSource,     OPTIONAL
    IN  PCWSTR FileSought,
    IN  PCWSTR TagFile,          OPTIONAL
    IN  DWORD  DiskPromptStyle,
    OUT PWSTR  PathBuffer,
    IN  DWORD  PathBufferSize,
    OUT PDWORD PathRequiredSize
    );

#ifdef UNICODE
#define SetupPromptForDisk SetupPromptForDiskW
#else
#define SetupPromptForDisk SetupPromptForDiskA
#endif


WINSETUPAPI
UINT
WINAPI
SetupCopyErrorA(
    IN  HWND   hwndParent,
    IN  PCSTR  DialogTitle,     OPTIONAL
    IN  PCSTR  DiskName,        OPTIONAL
    IN  PCSTR  PathToSource,
    IN  PCSTR  SourceFile,
    IN  PCSTR  TargetPathFile,  OPTIONAL
    IN  UINT   Win32ErrorCode,
    IN  DWORD  Style,
    OUT PSTR   PathBuffer,      OPTIONAL
    IN  DWORD  PathBufferSize,
    OUT PDWORD PathRequiredSize OPTIONAL
    );

WINSETUPAPI
UINT
WINAPI
SetupCopyErrorW(
    IN  HWND   hwndParent,
    IN  PCWSTR DialogTitle,     OPTIONAL
    IN  PCWSTR DiskName,        OPTIONAL
    IN  PCWSTR PathToSource,
    IN  PCWSTR SourceFile,
    IN  PCWSTR TargetPathFile,  OPTIONAL
    IN  UINT   Win32ErrorCode,
    IN  DWORD  Style,
    OUT PWSTR  PathBuffer,      OPTIONAL
    IN  DWORD  PathBufferSize,
    OUT PDWORD PathRequiredSize OPTIONAL
    );

#ifdef UNICODE
#define SetupCopyError SetupCopyErrorW
#else
#define SetupCopyError SetupCopyErrorA
#endif


WINSETUPAPI
UINT
WINAPI
SetupRenameErrorA(
    IN  HWND   hwndParent,
    IN  PCSTR  DialogTitle,     OPTIONAL
    IN  PCSTR  SourceFile,
    IN  PCSTR  TargetFile,
    IN  UINT   Win32ErrorCode,
    IN  DWORD  Style
    );

WINSETUPAPI
UINT
WINAPI
SetupRenameErrorW(
    IN  HWND   hwndParent,
    IN  PCWSTR DialogTitle,     OPTIONAL
    IN  PCWSTR SourceFile,
    IN  PCWSTR TargetFile,
    IN  UINT   Win32ErrorCode,
    IN  DWORD  Style
    );

#ifdef UNICODE
#define SetupRenameError SetupRenameErrorW
#else
#define SetupRenameError SetupRenameErrorA
#endif


WINSETUPAPI
UINT
WINAPI
SetupDeleteErrorA(
    IN  HWND   hwndParent,
    IN  PCSTR  DialogTitle,     OPTIONAL
    IN  PCSTR  File,
    IN  UINT   Win32ErrorCode,
    IN  DWORD  Style
    );

WINSETUPAPI
UINT
WINAPI
SetupDeleteErrorW(
    IN  HWND   hwndParent,
    IN  PCWSTR DialogTitle,     OPTIONAL
    IN  PCWSTR File,
    IN  UINT   Win32ErrorCode,
    IN  DWORD  Style
    );

#ifdef UNICODE
#define SetupDeleteError SetupDeleteErrorW
#else
#define SetupDeleteError SetupDeleteErrorA
#endif


//
// Styles for SetupPromptForDisk, SetupCopyError,
// SetupRenameError, SetupDeleteError
//
#define IDF_NOBROWSE        0x00000001
#define IDF_NOSKIP          0x00000002
#define IDF_NODETAILS       0x00000004
#define IDF_NOCOMPRESSED    0x00000008
#define IDF_CHECKFIRST      0x00000100
#define IDF_NOBEEP          0x00000200
#define IDF_NOFOREGROUND    0x00000400
#define IDF_WARNIFSKIP      0x00000800
#define IDF_OEMDISK         0x80000000

//
// Return values for SetupPromptForDisk, SetupCopyError,
// SetupRenameError, SetupDeleteError
//
#define DPROMPT_SUCCESS         0
#define DPROMPT_CANCEL          1
#define DPROMPT_SKIPFILE        2
#define DPROMPT_BUFFERTOOSMALL  3
#define DPROMPT_OUTOFMEMORY     4


WINSETUPAPI
BOOL
WINAPI
SetupSetDirectoryIdA(
    IN HINF  InfHandle,
    IN DWORD Id,            OPTIONAL
    IN PCSTR Directory      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupSetDirectoryIdW(
    IN HINF   InfHandle,
    IN DWORD  Id,           OPTIONAL
    IN PCWSTR Directory     OPTIONAL
    );

#ifdef UNICODE
#define SetupSetDirectoryId SetupSetDirectoryIdW
#else
#define SetupSetDirectoryId SetupSetDirectoryIdA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupSetDirectoryIdExA(
    IN HINF  InfHandle,
    IN DWORD Id,            OPTIONAL
    IN PCSTR Directory,     OPTIONAL
    IN DWORD Flags,
    IN DWORD Reserved1,
    IN PVOID Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupSetDirectoryIdExW(
    IN HINF   InfHandle,
    IN DWORD  Id,           OPTIONAL
    IN PCWSTR Directory,    OPTIONAL
    IN DWORD  Flags,
    IN DWORD  Reserved1,
    IN PVOID  Reserved2
    );

#ifdef UNICODE
#define SetupSetDirectoryIdEx SetupSetDirectoryIdExW
#else
#define SetupSetDirectoryIdEx SetupSetDirectoryIdExA
#endif

//
// Flags for SetupSetDirectoryIdEx
//
#define SETDIRID_NOT_FULL_PATH      0x00000001


WINSETUPAPI
BOOL
WINAPI
SetupGetSourceInfoA(
    IN  HINF   InfHandle,
    IN  UINT   SourceId,
    IN  UINT   InfoDesired,
    OUT PSTR   ReturnBuffer,     OPTIONAL
    IN  DWORD  ReturnBufferSize,
    OUT PDWORD RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupGetSourceInfoW(
    IN  HINF   InfHandle,
    IN  UINT   SourceId,
    IN  UINT   InfoDesired,
    OUT PWSTR  ReturnBuffer,     OPTIONAL
    IN  DWORD  ReturnBufferSize,
    OUT PDWORD RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupGetSourceInfo SetupGetSourceInfoW
#else
#define SetupGetSourceInfo SetupGetSourceInfoA
#endif

//
// InfoDesired values for SetupGetSourceInfo
//
#define SRCINFO_PATH            1
#define SRCINFO_TAGFILE         2
#define SRCINFO_DESCRIPTION     3


WINSETUPAPI
BOOL
WINAPI
SetupInstallFileA(
    IN HINF                InfHandle,         OPTIONAL
    IN PINFCONTEXT         InfContext,        OPTIONAL
    IN PCSTR               SourceFile,        OPTIONAL
    IN PCSTR               SourcePathRoot,    OPTIONAL
    IN PCSTR               DestinationName,   OPTIONAL
    IN DWORD               CopyStyle,
    IN PSP_FILE_CALLBACK_A CopyMsgHandler,    OPTIONAL
    IN PVOID               Context            OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupInstallFileW(
    IN HINF                InfHandle,         OPTIONAL
    IN PINFCONTEXT         InfContext,        OPTIONAL
    IN PCWSTR              SourceFile,        OPTIONAL
    IN PCWSTR              SourcePathRoot,    OPTIONAL
    IN PCWSTR              DestinationName,   OPTIONAL
    IN DWORD               CopyStyle,
    IN PSP_FILE_CALLBACK_W CopyMsgHandler,    OPTIONAL
    IN PVOID               Context            OPTIONAL
    );

#ifdef UNICODE
#define SetupInstallFile SetupInstallFileW
#else
#define SetupInstallFile SetupInstallFileA
#endif

WINSETUPAPI
BOOL
WINAPI
SetupInstallFileExA(
    IN  HINF                InfHandle,         OPTIONAL
    IN  PINFCONTEXT         InfContext,        OPTIONAL
    IN  PCSTR               SourceFile,        OPTIONAL
    IN  PCSTR               SourcePathRoot,    OPTIONAL
    IN  PCSTR               DestinationName,   OPTIONAL
    IN  DWORD               CopyStyle,
    IN  PSP_FILE_CALLBACK_A CopyMsgHandler,    OPTIONAL
    IN  PVOID               Context,           OPTIONAL
    OUT PBOOL               FileWasInUse
    );

WINSETUPAPI
BOOL
WINAPI
SetupInstallFileExW(
    IN  HINF                InfHandle,         OPTIONAL
    IN  PINFCONTEXT         InfContext,        OPTIONAL
    IN  PCWSTR              SourceFile,        OPTIONAL
    IN  PCWSTR              SourcePathRoot,    OPTIONAL
    IN  PCWSTR              DestinationName,   OPTIONAL
    IN  DWORD               CopyStyle,
    IN  PSP_FILE_CALLBACK_W CopyMsgHandler,    OPTIONAL
    IN  PVOID               Context,           OPTIONAL
    OUT PBOOL               FileWasInUse
    );

#ifdef UNICODE
#define SetupInstallFileEx SetupInstallFileExW
#else
#define SetupInstallFileEx SetupInstallFileExA
#endif

//
// CopyStyle values for copy and queue-related APIs
//
#define SP_COPY_DELETESOURCE        0x0000001   // delete source file on successful copy
#define SP_COPY_REPLACEONLY         0x0000002   // copy only if target file already present
#define SP_COPY_NEWER               0x0000004   // copy only if source newer than or same as target
#define SP_COPY_NEWER_OR_SAME       SP_COPY_NEWER
#define SP_COPY_NOOVERWRITE         0x0000008   // copy only if target doesn't exist
#define SP_COPY_NODECOMP            0x0000010   // don't decompress source file while copying
#define SP_COPY_LANGUAGEAWARE       0x0000020   // don't overwrite file of different language
#define SP_COPY_SOURCE_ABSOLUTE     0x0000040   // SourceFile is a full source path
#define SP_COPY_SOURCEPATH_ABSOLUTE 0x0000080   // SourcePathRoot is the full path
#define SP_COPY_IN_USE_NEEDS_REBOOT 0x0000100   // System needs reboot if file in use
#define SP_COPY_FORCE_IN_USE        0x0000200   // Force target-in-use behavior
#define SP_COPY_NOSKIP              0x0000400   // Skip is disallowed for this file or section
#define SP_FLAG_CABINETCONTINUATION 0x0000800   // Used with need media notification
#define SP_COPY_FORCE_NOOVERWRITE   0x0001000   // like NOOVERWRITE but no callback nofitication
#define SP_COPY_FORCE_NEWER         0x0002000   // like NEWER but no callback nofitication
#define SP_COPY_WARNIFSKIP          0x0004000   // system critical file: warn if user tries to skip
#define SP_COPY_NOBROWSE            0x0008000   // Browsing is disallowed for this file or section
#define SP_COPY_NEWER_ONLY          0x0010000   // copy only if source file newer than target


WINSETUPAPI
HSPFILEQ
WINAPI
SetupOpenFileQueue(
    VOID
    );

WINSETUPAPI
BOOL
WINAPI
SetupCloseFileQueue(
    IN HSPFILEQ QueueHandle
    );


WINSETUPAPI
BOOL
WINAPI
SetupSetPlatformPathOverrideA(
    IN PCSTR Override   OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupSetPlatformPathOverrideW(
    IN PCWSTR Override  OPTIONAL
    );

#ifdef UNICODE
#define SetupSetPlatformPathOverride SetupSetPlatformPathOverrideW
#else
#define SetupSetPlatformPathOverride SetupSetPlatformPathOverrideA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueueCopyA(
    IN HSPFILEQ QueueHandle,
    IN PCSTR    SourceRootPath,
    IN PCSTR    SourcePath,         OPTIONAL
    IN PCSTR    SourceFilename,
    IN PCSTR    SourceDescription,  OPTIONAL
    IN PCSTR    SourceTagfile,      OPTIONAL
    IN PCSTR    TargetDirectory,
    IN PCSTR    TargetFilename,     OPTIONAL
    IN DWORD    CopyStyle
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueueCopyW(
    IN HSPFILEQ QueueHandle,
    IN PCWSTR   SourceRootPath,
    IN PCWSTR   SourcePath,         OPTIONAL
    IN PCWSTR   SourceFilename,
    IN PCWSTR   SourceDescription,  OPTIONAL
    IN PCWSTR   SourceTagfile,      OPTIONAL
    IN PCWSTR   TargetDirectory,
    IN PCWSTR   TargetFilename,     OPTIONAL
    IN DWORD    CopyStyle
    );

#ifdef UNICODE
#define SetupQueueCopy SetupQueueCopyW
#else
#define SetupQueueCopy SetupQueueCopyA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueueDefaultCopyA(
    IN HSPFILEQ QueueHandle,
    IN HINF     InfHandle,
    IN PCSTR    SourceRootPath,
    IN PCSTR    SourceFilename,
    IN PCSTR    TargetFilename,
    IN DWORD    CopyStyle
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueueDefaultCopyW(
    IN HSPFILEQ QueueHandle,
    IN HINF     InfHandle,
    IN PCWSTR   SourceRootPath,
    IN PCWSTR   SourceFilename,
    IN PCWSTR   TargetFilename,
    IN DWORD    CopyStyle
    );

#ifdef UNICODE
#define SetupQueueDefaultCopy SetupQueueDefaultCopyW
#else
#define SetupQueueDefaultCopy SetupQueueDefaultCopyA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueueCopySectionA(
    IN HSPFILEQ QueueHandle,
    IN PCSTR    SourceRootPath,
    IN HINF     InfHandle,
    IN HINF     ListInfHandle,   OPTIONAL
    IN PCSTR    Section,
    IN DWORD    CopyStyle
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueueCopySectionW(
    IN HSPFILEQ QueueHandle,
    IN PCWSTR   SourceRootPath,
    IN HINF     InfHandle,
    IN HINF     ListInfHandle,   OPTIONAL
    IN PCWSTR   Section,
    IN DWORD    CopyStyle
    );

#ifdef UNICODE
#define SetupQueueCopySection SetupQueueCopySectionW
#else
#define SetupQueueCopySection SetupQueueCopySectionA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueueDeleteA(
    IN HSPFILEQ QueueHandle,
    IN PCSTR    PathPart1,
    IN PCSTR    PathPart2       OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueueDeleteW(
    IN HSPFILEQ QueueHandle,
    IN PCWSTR   PathPart1,
    IN PCWSTR   PathPart2       OPTIONAL
    );

#ifdef UNICODE
#define SetupQueueDelete SetupQueueDeleteW
#else
#define SetupQueueDelete SetupQueueDeleteA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueueDeleteSectionA(
    IN HSPFILEQ QueueHandle,
    IN HINF     InfHandle,
    IN HINF     ListInfHandle,   OPTIONAL
    IN PCSTR    Section
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueueDeleteSectionW(
    IN HSPFILEQ QueueHandle,
    IN HINF     InfHandle,
    IN HINF     ListInfHandle,   OPTIONAL
    IN PCWSTR   Section
    );

#ifdef UNICODE
#define SetupQueueDeleteSection SetupQueueDeleteSectionW
#else
#define SetupQueueDeleteSection SetupQueueDeleteSectionA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueueRenameA(
    IN HSPFILEQ QueueHandle,
    IN PCSTR    SourcePath,
    IN PCSTR    SourceFilename, OPTIONAL
    IN PCSTR    TargetPath,     OPTIONAL
    IN PCSTR    TargetFilename
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueueRenameW(
    IN HSPFILEQ QueueHandle,
    IN PCWSTR   SourcePath,
    IN PCWSTR   SourceFilename, OPTIONAL
    IN PCWSTR   TargetPath,     OPTIONAL
    IN PCWSTR   TargetFilename
    );

#ifdef UNICODE
#define SetupQueueRename SetupQueueRenameW
#else
#define SetupQueueRename SetupQueueRenameA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQueueRenameSectionA(
    IN HSPFILEQ QueueHandle,
    IN HINF     InfHandle,
    IN HINF     ListInfHandle,   OPTIONAL
    IN PCSTR    Section
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueueRenameSectionW(
    IN HSPFILEQ QueueHandle,
    IN HINF     InfHandle,
    IN HINF     ListInfHandle,   OPTIONAL
    IN PCWSTR   Section
    );

#ifdef UNICODE
#define SetupQueueRenameSection SetupQueueRenameSectionW
#else
#define SetupQueueRenameSection SetupQueueRenameSectionA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupCommitFileQueueA(
    IN HWND                Owner,         OPTIONAL
    IN HSPFILEQ            QueueHandle,
    IN PSP_FILE_CALLBACK_A MsgHandler,
    IN PVOID               Context
    );

WINSETUPAPI
BOOL
WINAPI
SetupCommitFileQueueW(
    IN HWND                Owner,         OPTIONAL
    IN HSPFILEQ            QueueHandle,
    IN PSP_FILE_CALLBACK_W MsgHandler,
    IN PVOID               Context
    );

#ifdef UNICODE
#define SetupCommitFileQueue SetupCommitFileQueueW
#else
#define SetupCommitFileQueue SetupCommitFileQueueA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupScanFileQueueA(
    IN  HSPFILEQ            FileQueue,
    IN  DWORD               Flags,
    IN  HWND                Window,            OPTIONAL
    IN  PSP_FILE_CALLBACK_A CallbackRoutine,   OPTIONAL
    IN  PVOID               CallbackContext,   OPTIONAL
    OUT PDWORD              Result
    );

WINSETUPAPI
BOOL
WINAPI
SetupScanFileQueueW(
    IN  HSPFILEQ            FileQueue,
    IN  DWORD               Flags,
    IN  HWND                Window,            OPTIONAL
    IN  PSP_FILE_CALLBACK_W CallbackRoutine,   OPTIONAL
    IN  PVOID               CallbackContext,   OPTIONAL
    OUT PDWORD              Result
    );

#ifdef UNICODE
#define SetupScanFileQueue SetupScanFileQueueW
#else
#define SetupScanFileQueue SetupScanFileQueueA
#endif

//
// Define flags for SetupScanFileQueue.
//
#define SPQ_SCAN_FILE_PRESENCE  0x00000001
#define SPQ_SCAN_FILE_VALIDITY  0x00000002
#define SPQ_SCAN_USE_CALLBACK   0x00000004
#define SPQ_SCAN_INFORM_USER    0x00000010

//
// Define flags used with Param2 for SPFILENOTIFY_QUEUESCAN
//
#define SPQ_DELAYED_COPY        0x00000001  // file was in use; registered for delayed copy


//
// Define OEM Source Type values for use in SetupCopyOEMInf.
//
#define SPOST_NONE  0
#define SPOST_PATH  1
#define SPOST_URL   2
#define SPOST_MAX   3

WINSETUPAPI
BOOL
WINAPI
SetupCopyOEMInfA(
    IN  PCSTR   SourceInfFileName,
    IN  PCSTR   OEMSourceMediaLocation,         OPTIONAL
    IN  DWORD   OEMSourceMediaType,
    IN  DWORD   CopyStyle,
    OUT PSTR    DestinationInfFileName,         OPTIONAL
    IN  DWORD   DestinationInfFileNameSize,
    OUT PDWORD  RequiredSize,                   OPTIONAL
    OUT PSTR   *DestinationInfFileNameComponent OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupCopyOEMInfW(
    IN  PCWSTR  SourceInfFileName,
    IN  PCWSTR  OEMSourceMediaLocation,         OPTIONAL
    IN  DWORD   OEMSourceMediaType,
    IN  DWORD   CopyStyle,
    OUT PWSTR   DestinationInfFileName,         OPTIONAL
    IN  DWORD   DestinationInfFileNameSize,
    OUT PDWORD  RequiredSize,                   OPTIONAL
    OUT PWSTR  *DestinationInfFileNameComponent OPTIONAL
    );

#ifdef UNICODE
#define SetupCopyOEMInf SetupCopyOEMInfW
#else
#define SetupCopyOEMInf SetupCopyOEMInfA
#endif


//
// Disk space list APIs
//
WINSETUPAPI
HDSKSPC
WINAPI
SetupCreateDiskSpaceListA(
    IN PVOID Reserved1,
    IN DWORD Reserved2,
    IN UINT  Flags
    );

WINSETUPAPI
HDSKSPC
WINAPI
SetupCreateDiskSpaceListW(
    IN PVOID Reserved1,
    IN DWORD Reserved2,
    IN UINT  Flags
    );

#ifdef UNICODE
#define SetupCreateDiskSpaceList SetupCreateDiskSpaceListW
#else
#define SetupCreateDiskSpaceList SetupCreateDiskSpaceListA
#endif

//
// Flags for SetupCreateDiskSpaceList
//
#define SPDSL_IGNORE_DISK              0x00000001  // ignore deletes and on-disk files in copies
#define SPDSL_DISALLOW_NEGATIVE_ADJUST 0x00000002


WINSETUPAPI
HDSKSPC
WINAPI
SetupDuplicateDiskSpaceListA(
    IN HDSKSPC DiskSpace,
    IN PVOID   Reserved1,
    IN DWORD   Reserved2,
    IN UINT    Flags
    );

WINSETUPAPI
HDSKSPC
WINAPI
SetupDuplicateDiskSpaceListW(
    IN HDSKSPC DiskSpace,
    IN PVOID   Reserved1,
    IN DWORD   Reserved2,
    IN UINT    Flags
    );

#ifdef UNICODE
#define SetupDuplicateDiskSpaceList SetupDuplicateDiskSpaceListW
#else
#define SetupDuplicateDiskSpaceList SetupDuplicateDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDestroyDiskSpaceList(
    IN OUT HDSKSPC DiskSpace
    );


WINSETUPAPI
BOOL
WINAPI
SetupQueryDrivesInDiskSpaceListA(
    IN  HDSKSPC DiskSpace,
    OUT PSTR    ReturnBuffer,       OPTIONAL
    IN  DWORD   ReturnBufferSize,
    OUT PDWORD  RequiredSize        OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueryDrivesInDiskSpaceListW(
    IN  HDSKSPC DiskSpace,
    OUT PWSTR   ReturnBuffer,       OPTIONAL
    IN  DWORD   ReturnBufferSize,
    OUT PDWORD  RequiredSize        OPTIONAL
    );

#ifdef UNICODE
#define SetupQueryDrivesInDiskSpaceList SetupQueryDrivesInDiskSpaceListW
#else
#define SetupQueryDrivesInDiskSpaceList SetupQueryDrivesInDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupQuerySpaceRequiredOnDriveA(
    IN  HDSKSPC   DiskSpace,
    IN  PCSTR     DriveSpec,
    OUT LONGLONG *SpaceRequired,
    IN  PVOID     Reserved1,
    IN  UINT      Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupQuerySpaceRequiredOnDriveW(
    IN  HDSKSPC   DiskSpace,
    IN  PCWSTR    DriveSpec,
    OUT LONGLONG *SpaceRequired,
    IN  PVOID     Reserved1,
    IN  UINT      Reserved2
    );

#ifdef UNICODE
#define SetupQuerySpaceRequiredOnDrive SetupQuerySpaceRequiredOnDriveW
#else
#define SetupQuerySpaceRequiredOnDrive SetupQuerySpaceRequiredOnDriveA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupAdjustDiskSpaceListA(
    IN HDSKSPC  DiskSpace,
    IN LPCSTR   DriveRoot,
    IN LONGLONG Amount,
    IN PVOID    Reserved1,
    IN UINT     Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupAdjustDiskSpaceListW(
    IN HDSKSPC  DiskSpace,
    IN LPCWSTR  DriveRoot,
    IN LONGLONG Amount,
    IN PVOID    Reserved1,
    IN UINT     Reserved2
    );

#ifdef UNICODE
#define SetupAdjustDiskSpaceList SetupAdjustDiskSpaceListW
#else
#define SetupAdjustDiskSpaceList SetupAdjustDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupAddToDiskSpaceListA(
    IN HDSKSPC  DiskSpace,
    IN PCSTR    TargetFilespec,
    IN LONGLONG FileSize,
    IN UINT     Operation,
    IN PVOID    Reserved1,
    IN UINT     Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupAddToDiskSpaceListW(
    IN HDSKSPC  DiskSpace,
    IN PCWSTR   TargetFilespec,
    IN LONGLONG FileSize,
    IN UINT     Operation,
    IN PVOID    Reserved1,
    IN UINT     Reserved2
    );

#ifdef UNICODE
#define SetupAddToDiskSpaceList SetupAddToDiskSpaceListW
#else
#define SetupAddToDiskSpaceList SetupAddToDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupAddSectionToDiskSpaceListA(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    ListInfHandle,  OPTIONAL
    IN PCSTR   SectionName,
    IN UINT    Operation,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupAddSectionToDiskSpaceListW(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    ListInfHandle,  OPTIONAL
    IN PCWSTR  SectionName,
    IN UINT    Operation,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

#ifdef UNICODE
#define SetupAddSectionToDiskSpaceList SetupAddSectionToDiskSpaceListW
#else
#define SetupAddSectionToDiskSpaceList SetupAddSectionToDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupAddInstallSectionToDiskSpaceListA(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    LayoutInfHandle,     OPTIONAL
    IN PCSTR   SectionName,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupAddInstallSectionToDiskSpaceListW(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    LayoutInfHandle,     OPTIONAL
    IN PCWSTR  SectionName,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

#ifdef UNICODE
#define SetupAddInstallSectionToDiskSpaceList SetupAddInstallSectionToDiskSpaceListW
#else
#define SetupAddInstallSectionToDiskSpaceList SetupAddInstallSectionToDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupRemoveFromDiskSpaceListA(
    IN HDSKSPC DiskSpace,
    IN PCSTR   TargetFilespec,
    IN UINT    Operation,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupRemoveFromDiskSpaceListW(
    IN HDSKSPC DiskSpace,
    IN PCWSTR  TargetFilespec,
    IN UINT    Operation,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

#ifdef UNICODE
#define SetupRemoveFromDiskSpaceList SetupRemoveFromDiskSpaceListW
#else
#define SetupRemoveFromDiskSpaceList SetupRemoveFromDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupRemoveSectionFromDiskSpaceListA(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    ListInfHandle,  OPTIONAL
    IN PCSTR   SectionName,
    IN UINT    Operation,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupRemoveSectionFromDiskSpaceListW(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    ListInfHandle,  OPTIONAL
    IN PCWSTR  SectionName,
    IN UINT    Operation,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

#ifdef UNICODE
#define SetupRemoveSectionFromDiskSpaceList SetupRemoveSectionFromDiskSpaceListW
#else
#define SetupRemoveSectionFromDiskSpaceList SetupRemoveSectionFromDiskSpaceListA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupRemoveInstallSectionFromDiskSpaceListA(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    LayoutInfHandle,     OPTIONAL
    IN PCSTR   SectionName,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupRemoveInstallSectionFromDiskSpaceListW(
    IN HDSKSPC DiskSpace,
    IN HINF    InfHandle,
    IN HINF    LayoutInfHandle,     OPTIONAL
    IN PCWSTR  SectionName,
    IN PVOID   Reserved1,
    IN UINT    Reserved2
    );

#ifdef UNICODE
#define SetupRemoveInstallSectionFromDiskSpaceList SetupRemoveInstallSectionFromDiskSpaceListW
#else
#define SetupRemoveInstallSectionFromDiskSpaceList SetupRemoveInstallSectionFromDiskSpaceListA
#endif


//
// Cabinet APIs
//

WINSETUPAPI
BOOL
WINAPI
SetupIterateCabinetA(
    IN  PCSTR               CabinetFile,
    IN  DWORD               Reserved,
    IN  PSP_FILE_CALLBACK_A MsgHandler,
    IN  PVOID               Context
    );

WINSETUPAPI
BOOL
WINAPI
SetupIterateCabinetW(
    IN  PCWSTR              CabinetFile,
    IN  DWORD               Reserved,
    IN  PSP_FILE_CALLBACK_W MsgHandler,
    IN  PVOID               Context
    );

#ifdef UNICODE
#define SetupIterateCabinet SetupIterateCabinetW
#else
#define SetupIterateCabinet SetupIterateCabinetA
#endif


WINSETUPAPI
INT
WINAPI
SetupPromptReboot(
    IN HSPFILEQ FileQueue,  OPTIONAL
    IN HWND     Owner,
    IN BOOL     ScanOnly
    );

//
// Define flags that are returned by SetupPromptReboot
//
#define SPFILEQ_FILE_IN_USE         0x00000001
#define SPFILEQ_REBOOT_RECOMMENDED  0x00000002
#define SPFILEQ_REBOOT_IN_PROGRESS  0x00000004


WINSETUPAPI
PVOID
WINAPI
SetupInitDefaultQueueCallback(
    IN HWND OwnerWindow
    );

WINSETUPAPI
PVOID
WINAPI
SetupInitDefaultQueueCallbackEx(
    IN HWND  OwnerWindow,
    IN HWND  AlternateProgressWindow, OPTIONAL
    IN UINT  ProgressMessage,
    IN DWORD Reserved1,
    IN PVOID Reserved2
    );

WINSETUPAPI
VOID
WINAPI
SetupTermDefaultQueueCallback(
    IN PVOID Context
    );

WINSETUPAPI
UINT
WINAPI
SetupDefaultQueueCallbackA(
    IN PVOID Context,
    IN UINT  Notification,
    IN UINT  Param1,
    IN UINT  Param2
    );

WINSETUPAPI
UINT
WINAPI
SetupDefaultQueueCallbackW(
    IN PVOID Context,
    IN UINT  Notification,
    IN UINT  Param1,
    IN UINT  Param2
    );

#ifdef UNICODE
#define SetupDefaultQueueCallback SetupDefaultQueueCallbackW
#else
#define SetupDefaultQueueCallback SetupDefaultQueueCallbackA
#endif


//
// Flags for AddReg section lines in INF.  The corresponding value
// is <ValueType> in the AddReg line format given below:
//
// <RegRootString>,<SubKey>,<ValueName>,<ValueType>,<Value>...
//
// The low word contains basic flags concerning the general data type
// and AddReg action. The high word contains values that more specifically
// identify the data type of the registry value.  The high word is ignored
// by the 16-bit Windows 95 SETUPX APIs.
//
#define FLG_ADDREG_BINVALUETYPE     ( 0x00000001 )
#define FLG_ADDREG_NOCLOBBER        ( 0x00000002 )
#define FLG_ADDREG_DELVAL           ( 0x00000004 )
#define FLG_ADDREG_APPEND           ( 0x00000008 ) // Currently supported only
                                                   // for REG_MULTI_SZ values.
#define FLG_ADDREG_KEYONLY          ( 0x00000010 ) // Just create the key, ignore value
#define FLG_ADDREG_OVERWRITEONLY    ( 0x00000020 ) // Set only if value already exists

#define FLG_ADDREG_TYPE_MASK        ( 0xFFFF0000 | FLG_ADDREG_BINVALUETYPE )
#define FLG_ADDREG_TYPE_SZ          ( 0x00000000                           )
#define FLG_ADDREG_TYPE_MULTI_SZ    ( 0x00010000                           )
#define FLG_ADDREG_TYPE_EXPAND_SZ   ( 0x00020000                           )
#define FLG_ADDREG_TYPE_BINARY      ( 0x00000000 | FLG_ADDREG_BINVALUETYPE )
#define FLG_ADDREG_TYPE_DWORD       ( 0x00010000 | FLG_ADDREG_BINVALUETYPE )
#define FLG_ADDREG_TYPE_NONE        ( 0x00020000 | FLG_ADDREG_BINVALUETYPE )

//
// The INF may supply any arbitrary data type ordinal in the highword except
// for the following: REG_NONE, REG_SZ, REG_EXPAND_SZ, REG_MULTI_SZ.  If this
// technique is used, then the data is given in binary format, one byte per
// field.
//


WINSETUPAPI
BOOL
WINAPI
SetupInstallFromInfSectionA(
    IN HWND                Owner,
    IN HINF                InfHandle,
    IN PCSTR               SectionName,
    IN UINT                Flags,
    IN HKEY                RelativeKeyRoot,   OPTIONAL
    IN PCSTR               SourceRootPath,    OPTIONAL
    IN UINT                CopyFlags,
    IN PSP_FILE_CALLBACK_A MsgHandler,
    IN PVOID               Context,
    IN HDEVINFO            DeviceInfoSet,     OPTIONAL
    IN PSP_DEVINFO_DATA    DeviceInfoData     OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupInstallFromInfSectionW(
    IN HWND                Owner,
    IN HINF                InfHandle,
    IN PCWSTR              SectionName,
    IN UINT                Flags,
    IN HKEY                RelativeKeyRoot,   OPTIONAL
    IN PCWSTR              SourceRootPath,    OPTIONAL
    IN UINT                CopyFlags,
    IN PSP_FILE_CALLBACK_W MsgHandler,
    IN PVOID               Context,
    IN HDEVINFO            DeviceInfoSet,     OPTIONAL
    IN PSP_DEVINFO_DATA    DeviceInfoData     OPTIONAL
    );

#ifdef UNICODE
#define SetupInstallFromInfSection SetupInstallFromInfSectionW
#else
#define SetupInstallFromInfSection SetupInstallFromInfSectionA
#endif

//
// Flags for SetupInstallFromInfSection
//
#define SPINST_LOGCONFIG                0x00000001
#define SPINST_INIFILES                 0x00000002
#define SPINST_REGISTRY                 0x00000004
#define SPINST_INI2REG                  0x00000008
#define SPINST_FILES                    0x00000010
#define SPINST_ALL                      0x0000001f
#define SPINST_SINGLESECTION            0x00010000
#define SPINST_LOGCONFIG_IS_FORCED      0x00020000
#define SPINST_LOGCONFIGS_ARE_OVERRIDES 0x00040000


WINSETUPAPI
BOOL
WINAPI
SetupInstallFilesFromInfSectionA(
    IN HINF     InfHandle,
    IN HINF     LayoutInfHandle,    OPTIONAL
    IN HSPFILEQ FileQueue,
    IN PCSTR    SectionName,
    IN PCSTR    SourceRootPath,     OPTIONAL
    IN UINT     CopyFlags
    );

WINSETUPAPI
BOOL
WINAPI
SetupInstallFilesFromInfSectionW(
    IN HINF     InfHandle,
    IN HINF     LayoutInfHandle,    OPTIONAL
    IN HSPFILEQ FileQueue,
    IN PCWSTR   SectionName,
    IN PCWSTR   SourceRootPath,     OPTIONAL
    IN UINT     CopyFlags
    );

#ifdef UNICODE
#define SetupInstallFilesFromInfSection SetupInstallFilesFromInfSectionW
#else
#define SetupInstallFilesFromInfSection SetupInstallFilesFromInfSectionA
#endif


//
// Flags for SetupInstallServicesFromInfSection(Ex).  These flags are also used in
// the flags field of AddService or DelService lines in a device INF.  Some of these
// flags are not permitted in the non-Ex API.  These flags are marked as such below.
//
#define SPSVCINST_TAGTOFRONT          (0x00000001)  // (AddService) move service's tag to front of its group order list
#define SPSVCINST_ASSOCSERVICE        (0x00000002)  // (AddService) **Ex API only** mark this service as the function
                                                    // driver for the device being installed.
#define SPSVCINST_DELETEEVENTLOGENTRY (0x00000004)  // (DelService) delete the associated event log entry for a service
                                                    // specified in a DelService entry

WINSETUPAPI
BOOL
WINAPI
SetupInstallServicesFromInfSectionA(
    IN HINF   InfHandle,
    IN PCSTR  SectionName,
    IN DWORD  Flags
    );

WINSETUPAPI
BOOL
WINAPI
SetupInstallServicesFromInfSectionW(
    IN HINF   InfHandle,
    IN PCWSTR SectionName,
    IN DWORD  Flags
    );

#ifdef UNICODE
#define SetupInstallServicesFromInfSection SetupInstallServicesFromInfSectionW
#else
#define SetupInstallServicesFromInfSection SetupInstallServicesFromInfSectionA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupInstallServicesFromInfSectionExA(
    IN HINF             InfHandle,
    IN PCSTR            SectionName,
    IN DWORD            Flags,
    IN HDEVINFO         DeviceInfoSet,  OPTIONAL
    IN PSP_DEVINFO_DATA DeviceInfoData, OPTIONAL
    IN PVOID            Reserved1,
    IN PVOID            Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupInstallServicesFromInfSectionExW(
    IN HINF             InfHandle,
    IN PCWSTR           SectionName,
    IN DWORD            Flags,
    IN HDEVINFO         DeviceInfoSet,  OPTIONAL
    IN PSP_DEVINFO_DATA DeviceInfoData, OPTIONAL
    IN PVOID            Reserved1,
    IN PVOID            Reserved2
    );

#ifdef UNICODE
#define SetupInstallServicesFromInfSectionEx SetupInstallServicesFromInfSectionExW
#else
#define SetupInstallServicesFromInfSectionEx SetupInstallServicesFromInfSectionExA
#endif


//
// Define handle type for Setup file log.
//
typedef PVOID HSPFILELOG;

WINSETUPAPI
HSPFILELOG
WINAPI
SetupInitializeFileLogA(
    IN PCSTR LogFileName,   OPTIONAL
    IN DWORD Flags
    );

WINSETUPAPI
HSPFILELOG
WINAPI
SetupInitializeFileLogW(
    IN PCWSTR LogFileName,  OPTIONAL
    IN DWORD  Flags
    );

#ifdef UNICODE
#define SetupInitializeFileLog SetupInitializeFileLogW
#else
#define SetupInitializeFileLog SetupInitializeFileLogA
#endif

//
// Flags for SetupInitializeFileLog
//
#define SPFILELOG_SYSTEMLOG     0x00000001  // use system log -- must be Administrator
#define SPFILELOG_FORCENEW      0x00000002  // not valid with SPFILELOG_SYSTEMLOG
#define SPFILELOG_QUERYONLY     0x00000004  // allows non-administrators to read system log


WINSETUPAPI
BOOL
WINAPI
SetupTerminateFileLog(
    IN HSPFILELOG FileLogHandle
    );


WINSETUPAPI
BOOL
WINAPI
SetupLogFileA(
    IN HSPFILELOG FileLogHandle,
    IN PCSTR      LogSectionName,   OPTIONAL
    IN PCSTR      SourceFilename,
    IN PCSTR      TargetFilename,
    IN DWORD      Checksum,         OPTIONAL
    IN PCSTR      DiskTagfile,      OPTIONAL
    IN PCSTR      DiskDescription,  OPTIONAL
    IN PCSTR      OtherInfo,        OPTIONAL
    IN DWORD      Flags
    );

WINSETUPAPI
BOOL
WINAPI
SetupLogFileW(
    IN HSPFILELOG FileLogHandle,
    IN PCWSTR     LogSectionName,   OPTIONAL
    IN PCWSTR     SourceFilename,
    IN PCWSTR     TargetFilename,
    IN DWORD      Checksum,         OPTIONAL
    IN PCWSTR     DiskTagfile,      OPTIONAL
    IN PCWSTR     DiskDescription,  OPTIONAL
    IN PCWSTR     OtherInfo,        OPTIONAL
    IN DWORD      Flags
    );

#ifdef UNICODE
#define SetupLogFile SetupLogFileW
#else
#define SetupLogFile SetupLogFileA
#endif

//
// Flags for SetupLogFile
//
#define SPFILELOG_OEMFILE   0x00000001


WINSETUPAPI
BOOL
WINAPI
SetupRemoveFileLogEntryA(
    IN HSPFILELOG FileLogHandle,
    IN PCSTR      LogSectionName,   OPTIONAL
    IN PCSTR      TargetFilename    OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupRemoveFileLogEntryW(
    IN HSPFILELOG FileLogHandle,
    IN PCWSTR     LogSectionName,   OPTIONAL
    IN PCWSTR     TargetFilename    OPTIONAL
    );

#ifdef UNICODE
#define SetupRemoveFileLogEntry SetupRemoveFileLogEntryW
#else
#define SetupRemoveFileLogEntry SetupRemoveFileLogEntryA
#endif


//
// Items retrievable from SetupQueryFileLog()
//
typedef enum {
    SetupFileLogSourceFilename,
    SetupFileLogChecksum,
    SetupFileLogDiskTagfile,
    SetupFileLogDiskDescription,
    SetupFileLogOtherInfo,
    SetupFileLogMax
} SetupFileLogInfo;

WINSETUPAPI
BOOL
WINAPI
SetupQueryFileLogA(
    IN  HSPFILELOG       FileLogHandle,
    IN  PCSTR            LogSectionName,   OPTIONAL
    IN  PCSTR            TargetFilename,
    IN  SetupFileLogInfo DesiredInfo,
    OUT PSTR             DataOut,          OPTIONAL
    IN  DWORD            ReturnBufferSize,
    OUT PDWORD           RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupQueryFileLogW(
    IN  HSPFILELOG       FileLogHandle,
    IN  PCWSTR           LogSectionName,   OPTIONAL
    IN  PCWSTR           TargetFilename,
    IN  SetupFileLogInfo DesiredInfo,
    OUT PWSTR            DataOut,          OPTIONAL
    IN  DWORD            ReturnBufferSize,
    OUT PDWORD           RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupQueryFileLog SetupQueryFileLogW
#else
#define SetupQueryFileLog SetupQueryFileLogA
#endif

//
// Text logging APIs
//

typedef enum {
    LogSevInformation,
    LogSevWarning,
    LogSevError,
    LogSevFatalError,
    LogSevMaximum
} LogSeverity;

WINSETUPAPI
BOOL
WINAPI
SetupOpenLog (
    BOOL Erase
    );

WINSETUPAPI
BOOL
WINAPI
SetupLogErrorA (
    IN  LPCSTR              MessageString,
    IN  LogSeverity         Severity
    );

WINSETUPAPI
BOOL
WINAPI
SetupLogErrorW (
    IN  LPCWSTR             MessageString,
    IN  LogSeverity         Severity
    );

#ifdef UNICODE
#define SetupLogError SetupLogErrorW
#else
#define SetupLogError SetupLogErrorA
#endif

WINSETUPAPI
VOID
WINAPI
SetupCloseLog (
    VOID
    );





//
// Device Installer APIs
//

WINSETUPAPI
HDEVINFO
WINAPI
SetupDiCreateDeviceInfoList(
    IN LPGUID ClassGuid, OPTIONAL
    IN HWND   hwndParent OPTIONAL
    );


WINSETUPAPI
HDEVINFO
WINAPI
SetupDiCreateDeviceInfoListExA(
    IN LPGUID ClassGuid,   OPTIONAL
    IN HWND   hwndParent,  OPTIONAL
    IN PCSTR  MachineName, OPTIONAL
    IN PVOID  Reserved
    );

WINSETUPAPI
HDEVINFO
WINAPI
SetupDiCreateDeviceInfoListExW(
    IN LPGUID ClassGuid,   OPTIONAL
    IN HWND   hwndParent,  OPTIONAL
    IN PCWSTR MachineName, OPTIONAL
    IN PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiCreateDeviceInfoListEx SetupDiCreateDeviceInfoListExW
#else
#define SetupDiCreateDeviceInfoListEx SetupDiCreateDeviceInfoListExA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInfoListClass(
    IN  HDEVINFO DeviceInfoSet,
    OUT LPGUID   ClassGuid
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInfoListDetailA(
    IN  HDEVINFO                       DeviceInfoSet,
    OUT PSP_DEVINFO_LIST_DETAIL_DATA_A DeviceInfoSetDetailData
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInfoListDetailW(
    IN  HDEVINFO                       DeviceInfoSet,
    OUT PSP_DEVINFO_LIST_DETAIL_DATA_W DeviceInfoSetDetailData
    );

#ifdef UNICODE
#define SetupDiGetDeviceInfoListDetail SetupDiGetDeviceInfoListDetailW
#else
#define SetupDiGetDeviceInfoListDetail SetupDiGetDeviceInfoListDetailA
#endif


//
// Flags for SetupDiCreateDeviceInfo
//
#define DICD_GENERATE_ID        0x00000001
#define DICD_INHERIT_CLASSDRVS  0x00000002

WINSETUPAPI
BOOL
WINAPI
SetupDiCreateDeviceInfoA(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PCSTR            DeviceName,
    IN  LPGUID           ClassGuid,
    IN  PCSTR            DeviceDescription, OPTIONAL
    IN  HWND             hwndParent,        OPTIONAL
    IN  DWORD            CreationFlags,
    OUT PSP_DEVINFO_DATA DeviceInfoData     OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiCreateDeviceInfoW(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PCWSTR           DeviceName,
    IN  LPGUID           ClassGuid,
    IN  PCWSTR           DeviceDescription, OPTIONAL
    IN  HWND             hwndParent,        OPTIONAL
    IN  DWORD            CreationFlags,
    OUT PSP_DEVINFO_DATA DeviceInfoData     OPTIONAL
    );

#ifdef UNICODE
#define SetupDiCreateDeviceInfo SetupDiCreateDeviceInfoW
#else
#define SetupDiCreateDeviceInfo SetupDiCreateDeviceInfoA
#endif


//
// Flags for SetupDiOpenDeviceInfo
//
#define DIOD_INHERIT_CLASSDRVS  0x00000002
#define DIOD_CANCEL_REMOVE      0x00000004

WINSETUPAPI
BOOL
WINAPI
SetupDiOpenDeviceInfoA(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PCSTR            DeviceInstanceId,
    IN  HWND             hwndParent,       OPTIONAL
    IN  DWORD            OpenFlags,
    OUT PSP_DEVINFO_DATA DeviceInfoData    OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiOpenDeviceInfoW(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PCWSTR           DeviceInstanceId,
    IN  HWND             hwndParent,       OPTIONAL
    IN  DWORD            OpenFlags,
    OUT PSP_DEVINFO_DATA DeviceInfoData    OPTIONAL
    );

#ifdef UNICODE
#define SetupDiOpenDeviceInfo SetupDiOpenDeviceInfoW
#else
#define SetupDiOpenDeviceInfo SetupDiOpenDeviceInfoA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInstanceIdA(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PSP_DEVINFO_DATA DeviceInfoData,
    OUT PSTR             DeviceInstanceId,
    IN  DWORD            DeviceInstanceIdSize,
    OUT PDWORD           RequiredSize          OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInstanceIdW(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PSP_DEVINFO_DATA DeviceInfoData,
    OUT PWSTR            DeviceInstanceId,
    IN  DWORD            DeviceInstanceIdSize,
    OUT PDWORD           RequiredSize          OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetDeviceInstanceId SetupDiGetDeviceInstanceIdW
#else
#define SetupDiGetDeviceInstanceId SetupDiGetDeviceInstanceIdA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiDeleteDeviceInfo(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiEnumDeviceInfo(
    IN  HDEVINFO         DeviceInfoSet,
    IN  DWORD            MemberIndex,
    OUT PSP_DEVINFO_DATA DeviceInfoData
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiDestroyDeviceInfoList(
    IN HDEVINFO DeviceInfoSet
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiEnumDeviceInterfaces(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PSP_DEVINFO_DATA          DeviceInfoData,     OPTIONAL
    IN  LPGUID                    InterfaceClassGuid,
    IN  DWORD                     MemberIndex,
    OUT PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData
    );

//
// Backward compatibility--do not use
//
#define SetupDiEnumInterfaceDevice SetupDiEnumDeviceInterfaces


WINSETUPAPI
BOOL
WINAPI
SetupDiCreateDeviceInterfaceA(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PSP_DEVINFO_DATA          DeviceInfoData,
    IN  LPGUID                    InterfaceClassGuid,
    IN  PCSTR                     ReferenceString,    OPTIONAL
    IN  DWORD                     CreationFlags,
    OUT PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiCreateDeviceInterfaceW(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PSP_DEVINFO_DATA          DeviceInfoData,
    IN  LPGUID                    InterfaceClassGuid,
    IN  PCWSTR                    ReferenceString,    OPTIONAL
    IN  DWORD                     CreationFlags,
    OUT PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData OPTIONAL
    );

#ifdef UNICODE
#define SetupDiCreateDeviceInterface SetupDiCreateDeviceInterfaceW
#else
#define SetupDiCreateDeviceInterface SetupDiCreateDeviceInterfaceA
#endif

//
// Backward compatibility--do not use.
//
#define SetupDiCreateInterfaceDeviceW SetupDiCreateDeviceInterfaceW
#define SetupDiCreateInterfaceDeviceA SetupDiCreateDeviceInterfaceA
#ifdef UNICODE
#define SetupDiCreateInterfaceDevice SetupDiCreateDeviceInterfaceW
#else
#define SetupDiCreateInterfaceDevice SetupDiCreateDeviceInterfaceA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiOpenDeviceInterfaceA(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PCSTR                     DevicePath,
    IN  DWORD                     OpenFlags,
    OUT PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiOpenDeviceInterfaceW(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PCWSTR                    DevicePath,
    IN  DWORD                     OpenFlags,
    OUT PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData OPTIONAL
    );

#ifdef UNICODE
#define SetupDiOpenDeviceInterface SetupDiOpenDeviceInterfaceW
#else
#define SetupDiOpenDeviceInterface SetupDiOpenDeviceInterfaceA
#endif

//
// Backward compatibility--do not use
//
#define SetupDiOpenInterfaceDeviceW SetupDiOpenDeviceInterfaceW
#define SetupDiOpenInterfaceDeviceA SetupDiOpenDeviceInterfaceA
#ifdef UNICODE
#define SetupDiOpenInterfaceDevice SetupDiOpenDeviceInterfaceW
#else
#define SetupDiOpenInterfaceDevice SetupDiOpenDeviceInterfaceA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInterfaceAlias(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData,
    IN  LPGUID                    AliasInterfaceClassGuid,
    OUT PSP_DEVICE_INTERFACE_DATA AliasDeviceInterfaceData
    );

//
// Backward compatibility--do not use.
//
#define SetupDiGetInterfaceDeviceAlias SetupDiGetDeviceInterfaceAlias


WINSETUPAPI
BOOL
WINAPI
SetupDiDeleteDeviceInterfaceData(
    IN HDEVINFO                  DeviceInfoSet,
    IN PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData
    );

//
// Backward compatibility--do not use.
//
#define SetupDiDeleteInterfaceDeviceData SetupDiDeleteDeviceInterfaceData


WINSETUPAPI
BOOL
WINAPI
SetupDiRemoveDeviceInterface(
    IN     HDEVINFO                  DeviceInfoSet,
    IN OUT PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData
    );

//
// Backward compatibility--do not use.
//
#define SetupDiRemoveInterfaceDevice SetupDiRemoveDeviceInterface


WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInterfaceDetailA(
    IN  HDEVINFO                           DeviceInfoSet,
    IN  PSP_DEVICE_INTERFACE_DATA          DeviceInterfaceData,
    OUT PSP_DEVICE_INTERFACE_DETAIL_DATA_A DeviceInterfaceDetailData,     OPTIONAL
    IN  DWORD                              DeviceInterfaceDetailDataSize,
    OUT PDWORD                             RequiredSize,                  OPTIONAL
    OUT PSP_DEVINFO_DATA                   DeviceInfoData                 OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInterfaceDetailW(
    IN  HDEVINFO                           DeviceInfoSet,
    IN  PSP_DEVICE_INTERFACE_DATA          DeviceInterfaceData,
    OUT PSP_DEVICE_INTERFACE_DETAIL_DATA_W DeviceInterfaceDetailData,     OPTIONAL
    IN  DWORD                              DeviceInterfaceDetailDataSize,
    OUT PDWORD                             RequiredSize,                  OPTIONAL
    OUT PSP_DEVINFO_DATA                   DeviceInfoData                 OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetDeviceInterfaceDetail SetupDiGetDeviceInterfaceDetailW
#else
#define SetupDiGetDeviceInterfaceDetail SetupDiGetDeviceInterfaceDetailA
#endif

//
// Backward compatibility--do not use.
//
#define SetupDiGetInterfaceDeviceDetailW SetupDiGetDeviceInterfaceDetailW
#define SetupDiGetInterfaceDeviceDetailA SetupDiGetDeviceInterfaceDetailA
#ifdef UNICODE
#define SetupDiGetInterfaceDeviceDetail SetupDiGetDeviceInterfaceDetailW
#else
#define SetupDiGetInterfaceDeviceDetail SetupDiGetDeviceInterfaceDetailA
#endif


//
// Default install handler for DIF_INSTALLINTERFACES.
//
WINSETUPAPI
BOOL
WINAPI
SetupDiInstallDeviceInterfaces(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData
    );

//
// Backward compatibility--do not use.
//
#define SetupDiInstallInterfaceDevices SetupDiInstallDeviceInterfaces


//
// Default install handler for DIF_REGISTERDEVICE
//

//
// Flags for SetupDiRegisterDeviceInfo
//
#define SPRDI_FIND_DUPS        0x00000001

WINSETUPAPI
BOOL
WINAPI
SetupDiRegisterDeviceInfo(
    IN     HDEVINFO           DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA   DeviceInfoData,
    IN     DWORD              Flags,
    IN     PSP_DETSIG_CMPPROC CompareProc,      OPTIONAL
    IN     PVOID              CompareContext,   OPTIONAL
    OUT    PSP_DEVINFO_DATA   DupDeviceInfoData OPTIONAL
    );


//
// Ordinal values distinguishing between class drivers and
// device drivers.
// (Passed in 'DriverType' parameter of driver information list APIs)
//
#define SPDIT_NODRIVER           0x00000000
#define SPDIT_CLASSDRIVER        0x00000001
#define SPDIT_COMPATDRIVER       0x00000002

WINSETUPAPI
BOOL
WINAPI
SetupDiBuildDriverInfoList(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData, OPTIONAL
    IN     DWORD            DriverType
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiCancelDriverInfoSearch(
    IN HDEVINFO DeviceInfoSet
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiEnumDriverInfoA(
    IN  HDEVINFO           DeviceInfoSet,
    IN  PSP_DEVINFO_DATA   DeviceInfoData, OPTIONAL
    IN  DWORD              DriverType,
    IN  DWORD              MemberIndex,
    OUT PSP_DRVINFO_DATA_A DriverInfoData
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiEnumDriverInfoW(
    IN  HDEVINFO           DeviceInfoSet,
    IN  PSP_DEVINFO_DATA   DeviceInfoData, OPTIONAL
    IN  DWORD              DriverType,
    IN  DWORD              MemberIndex,
    OUT PSP_DRVINFO_DATA_W DriverInfoData
    );

#ifdef UNICODE
#define SetupDiEnumDriverInfo SetupDiEnumDriverInfoW
#else
#define SetupDiEnumDriverInfo SetupDiEnumDriverInfoA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetSelectedDriverA(
    IN  HDEVINFO           DeviceInfoSet,
    IN  PSP_DEVINFO_DATA   DeviceInfoData, OPTIONAL
    OUT PSP_DRVINFO_DATA_A DriverInfoData
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetSelectedDriverW(
    IN  HDEVINFO           DeviceInfoSet,
    IN  PSP_DEVINFO_DATA   DeviceInfoData, OPTIONAL
    OUT PSP_DRVINFO_DATA_W DriverInfoData
    );

#ifdef UNICODE
#define SetupDiGetSelectedDriver SetupDiGetSelectedDriverW
#else
#define SetupDiGetSelectedDriver SetupDiGetSelectedDriverA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiSetSelectedDriverA(
    IN     HDEVINFO           DeviceInfoSet,
    IN     PSP_DEVINFO_DATA   DeviceInfoData, OPTIONAL
    IN OUT PSP_DRVINFO_DATA_A DriverInfoData  OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiSetSelectedDriverW(
    IN     HDEVINFO           DeviceInfoSet,
    IN     PSP_DEVINFO_DATA   DeviceInfoData, OPTIONAL
    IN OUT PSP_DRVINFO_DATA_W DriverInfoData  OPTIONAL
    );

#ifdef UNICODE
#define SetupDiSetSelectedDriver SetupDiSetSelectedDriverW
#else
#define SetupDiSetSelectedDriver SetupDiSetSelectedDriverA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetDriverInfoDetailA(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PSP_DEVINFO_DATA          DeviceInfoData,           OPTIONAL
    IN  PSP_DRVINFO_DATA_A        DriverInfoData,
    OUT PSP_DRVINFO_DETAIL_DATA_A DriverInfoDetailData,     OPTIONAL
    IN  DWORD                     DriverInfoDetailDataSize,
    OUT PDWORD                    RequiredSize              OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDriverInfoDetailW(
    IN  HDEVINFO                  DeviceInfoSet,
    IN  PSP_DEVINFO_DATA          DeviceInfoData,           OPTIONAL
    IN  PSP_DRVINFO_DATA_W        DriverInfoData,
    OUT PSP_DRVINFO_DETAIL_DATA_W DriverInfoDetailData,     OPTIONAL
    IN  DWORD                     DriverInfoDetailDataSize,
    OUT PDWORD                    RequiredSize              OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetDriverInfoDetail SetupDiGetDriverInfoDetailW
#else
#define SetupDiGetDriverInfoDetail SetupDiGetDriverInfoDetailA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiDestroyDriverInfoList(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData, OPTIONAL
    IN DWORD            DriverType
    );


//
// Flags controlling what is included in the device information set built
// by SetupDiGetClassDevs
//
#define DIGCF_DEFAULT           0x00000001  // only valid with DIGCF_DEVICEINTERFACE
#define DIGCF_PRESENT           0x00000002
#define DIGCF_ALLCLASSES        0x00000004
#define DIGCF_PROFILE           0x00000008
#define DIGCF_DEVICEINTERFACE   0x00000010

//
// Backward compatibility--do not use.
//
#define DIGCF_INTERFACEDEVICE DIGCF_DEVICEINTERFACE


WINSETUPAPI
HDEVINFO
WINAPI
SetupDiGetClassDevsA(
    IN LPGUID ClassGuid,  OPTIONAL
    IN PCSTR  Enumerator, OPTIONAL
    IN HWND   hwndParent, OPTIONAL
    IN DWORD  Flags
    );

WINSETUPAPI
HDEVINFO
WINAPI
SetupDiGetClassDevsW(
    IN LPGUID ClassGuid,  OPTIONAL
    IN PCWSTR Enumerator, OPTIONAL
    IN HWND   hwndParent, OPTIONAL
    IN DWORD  Flags
    );

#ifdef UNICODE
#define SetupDiGetClassDevs SetupDiGetClassDevsW
#else
#define SetupDiGetClassDevs SetupDiGetClassDevsA
#endif


WINSETUPAPI
HDEVINFO
WINAPI
SetupDiGetClassDevsExA(
    IN LPGUID ClassGuid,   OPTIONAL
    IN PCSTR  Enumerator,  OPTIONAL
    IN HWND   hwndParent,  OPTIONAL
    IN DWORD  Flags,
    IN PCSTR  MachineName, OPTIONAL
    IN PVOID  Reserved
    );

WINSETUPAPI
HDEVINFO
WINAPI
SetupDiGetClassDevsExW(
    IN LPGUID ClassGuid,   OPTIONAL
    IN PCWSTR Enumerator,  OPTIONAL
    IN HWND   hwndParent,  OPTIONAL
    IN DWORD  Flags,
    IN PCWSTR MachineName, OPTIONAL
    IN PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiGetClassDevsEx SetupDiGetClassDevsExW
#else
#define SetupDiGetClassDevsEx SetupDiGetClassDevsExA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetINFClassA(
    IN  PCSTR  InfName,
    OUT LPGUID ClassGuid,
    OUT PSTR   ClassName,
    IN  DWORD  ClassNameSize,
    OUT PDWORD RequiredSize   OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetINFClassW(
    IN  PCWSTR InfName,
    OUT LPGUID ClassGuid,
    OUT PWSTR  ClassName,
    IN  DWORD  ClassNameSize,
    OUT PDWORD RequiredSize   OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetINFClass SetupDiGetINFClassW
#else
#define SetupDiGetINFClass SetupDiGetINFClassA
#endif


//
// Flags controlling exclusion from the class information list built
// by SetupDiBuildClassInfoList(Ex)
//
#define DIBCI_NOINSTALLCLASS   0x00000001
#define DIBCI_NODISPLAYCLASS   0x00000002

WINSETUPAPI
BOOL
WINAPI
SetupDiBuildClassInfoList(
    IN  DWORD  Flags,
    OUT LPGUID ClassGuidList,
    IN  DWORD  ClassGuidListSize,
    OUT PDWORD RequiredSize
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiBuildClassInfoListExA(
    IN  DWORD  Flags,
    OUT LPGUID ClassGuidList,
    IN  DWORD  ClassGuidListSize,
    OUT PDWORD RequiredSize,
    IN  PCSTR  MachineName,       OPTIONAL
    IN  PVOID  Reserved
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiBuildClassInfoListExW(
    IN  DWORD  Flags,
    OUT LPGUID ClassGuidList,
    IN  DWORD  ClassGuidListSize,
    OUT PDWORD RequiredSize,
    IN  PCWSTR MachineName,       OPTIONAL
    IN  PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiBuildClassInfoListEx SetupDiBuildClassInfoListExW
#else
#define SetupDiBuildClassInfoListEx SetupDiBuildClassInfoListExA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassDescriptionA(
    IN  LPGUID ClassGuid,
    OUT PSTR   ClassDescription,
    IN  DWORD  ClassDescriptionSize,
    OUT PDWORD RequiredSize          OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassDescriptionW(
    IN  LPGUID ClassGuid,
    OUT PWSTR  ClassDescription,
    IN  DWORD  ClassDescriptionSize,
    OUT PDWORD RequiredSize          OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetClassDescription SetupDiGetClassDescriptionW
#else
#define SetupDiGetClassDescription SetupDiGetClassDescriptionA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassDescriptionExA(
    IN  LPGUID ClassGuid,
    OUT PSTR   ClassDescription,
    IN  DWORD  ClassDescriptionSize,
    OUT PDWORD RequiredSize,         OPTIONAL
    IN  PCSTR  MachineName,          OPTIONAL
    IN  PVOID  Reserved
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassDescriptionExW(
    IN  LPGUID ClassGuid,
    OUT PWSTR  ClassDescription,
    IN  DWORD  ClassDescriptionSize,
    OUT PDWORD RequiredSize,         OPTIONAL
    IN  PCWSTR MachineName,          OPTIONAL
    IN  PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiGetClassDescriptionEx SetupDiGetClassDescriptionExW
#else
#define SetupDiGetClassDescriptionEx SetupDiGetClassDescriptionExA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiCallClassInstaller(
    IN DI_FUNCTION      InstallFunction,
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData OPTIONAL
    );


//
// Default install handler for DIF_SELECTDEVICE
//
WINSETUPAPI
BOOL
WINAPI
SetupDiSelectDevice(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData OPTIONAL
    );


//
// Default install handler for DIF_SELECTBESTCOMPATDRV
//
WINSETUPAPI
BOOL
WINAPI
SetupDiSelectBestCompatDrv(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData OPTIONAL
    );


//
// Default install handler for DIF_INSTALLDEVICE
//
WINSETUPAPI
BOOL
WINAPI
SetupDiInstallDevice(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData
    );


//
// Default install handler for DIF_INSTALLDEVICEFILES
//
WINSETUPAPI
BOOL
WINAPI
SetupDiInstallDriverFiles(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData
    );


//
// Default install handler for DIF_REGISTER_COINSTALLERS
//
WINSETUPAPI
BOOL
WINAPI
SetupDiRegisterCoDeviceInstallers(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData
    );


//
// Default install handler for DIF_REMOVE
//
WINSETUPAPI
BOOL
WINAPI
SetupDiRemoveDevice(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData
    );


//
// Default install handler for DIF_UNREMOVE
//
WINSETUPAPI
BOOL
WINAPI
SetupDiUnremoveDevice(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData
    );


//
// Default install handler for DIF_MOVEDEVICE
//
WINSETUPAPI
BOOL
WINAPI
SetupDiMoveDuplicateDevice(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DestinationDeviceInfoData
    );


//
// Default install handler for DIF_PROPERTYCHANGE
//
WINSETUPAPI
BOOL
WINAPI
SetupDiChangeState(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiInstallClassA(
    IN HWND     hwndParent,  OPTIONAL
    IN PCSTR    InfFileName,
    IN DWORD    Flags,
    IN HSPFILEQ FileQueue    OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiInstallClassW(
    IN HWND     hwndParent,  OPTIONAL
    IN PCWSTR   InfFileName,
    IN DWORD    Flags,
    IN HSPFILEQ FileQueue    OPTIONAL
    );

#ifdef UNICODE
#define SetupDiInstallClass SetupDiInstallClassW
#else
#define SetupDiInstallClass SetupDiInstallClassA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiInstallClassExA(
    IN HWND     hwndParent,         OPTIONAL
    IN PCSTR    InfFileName,        OPTIONAL
    IN DWORD    Flags,
    IN HSPFILEQ FileQueue,          OPTIONAL
    IN LPGUID   InterfaceClassGuid, OPTIONAL
    IN PVOID    Reserved1,
    IN PVOID    Reserved2
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiInstallClassExW(
    IN HWND     hwndParent,         OPTIONAL
    IN PCWSTR   InfFileName,        OPTIONAL
    IN DWORD    Flags,
    IN HSPFILEQ FileQueue,          OPTIONAL
    IN LPGUID   InterfaceClassGuid, OPTIONAL
    IN PVOID    Reserved1,
    IN PVOID    Reserved2
    );

#ifdef UNICODE
#define SetupDiInstallClassEx SetupDiInstallClassExW
#else
#define SetupDiInstallClassEx SetupDiInstallClassExA
#endif


WINSETUPAPI
HKEY
WINAPI
SetupDiOpenClassRegKey(
    IN LPGUID ClassGuid, OPTIONAL
    IN REGSAM samDesired
    );


//
// Flags for SetupDiOpenClassRegKeyEx
//
#define DIOCR_INSTALLER   0x00000001    // class installer registry branch
#define DIOCR_INTERFACE   0x00000002    // interface class registry branch

WINSETUPAPI
HKEY
WINAPI
SetupDiOpenClassRegKeyExA(
    IN LPGUID ClassGuid,   OPTIONAL
    IN REGSAM samDesired,
    IN DWORD  Flags,
    IN PCSTR  MachineName, OPTIONAL
    IN PVOID  Reserved
    );

WINSETUPAPI
HKEY
WINAPI
SetupDiOpenClassRegKeyExW(
    IN LPGUID ClassGuid,   OPTIONAL
    IN REGSAM samDesired,
    IN DWORD  Flags,
    IN PCWSTR MachineName, OPTIONAL
    IN PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiOpenClassRegKeyEx SetupDiOpenClassRegKeyExW
#else
#define SetupDiOpenClassRegKeyEx SetupDiOpenClassRegKeyExA
#endif


WINSETUPAPI
HKEY
WINAPI
SetupDiCreateDeviceInterfaceRegKeyA(
    IN HDEVINFO                  DeviceInfoSet,
    IN PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData,
    IN DWORD                     Reserved,
    IN REGSAM                    samDesired,
    IN HINF                      InfHandle,           OPTIONAL
    IN PCSTR                     InfSectionName       OPTIONAL
    );

WINSETUPAPI
HKEY
WINAPI
SetupDiCreateDeviceInterfaceRegKeyW(
    IN HDEVINFO                  DeviceInfoSet,
    IN PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData,
    IN DWORD                     Reserved,
    IN REGSAM                    samDesired,
    IN HINF                      InfHandle,           OPTIONAL
    IN PCWSTR                    InfSectionName       OPTIONAL
    );

#ifdef UNICODE
#define SetupDiCreateDeviceInterfaceRegKey SetupDiCreateDeviceInterfaceRegKeyW
#else
#define SetupDiCreateDeviceInterfaceRegKey SetupDiCreateDeviceInterfaceRegKeyA
#endif

//
// Backward compatibility--do not use.
//
#define SetupDiCreateInterfaceDeviceRegKeyW SetupDiCreateDeviceInterfaceRegKeyW
#define SetupDiCreateInterfaceDeviceRegKeyA SetupDiCreateDeviceInterfaceRegKeyA
#ifdef UNICODE
#define SetupDiCreateInterfaceDeviceRegKey SetupDiCreateDeviceInterfaceRegKeyW
#else
#define SetupDiCreateInterfaceDeviceRegKey SetupDiCreateDeviceInterfaceRegKeyA
#endif


WINSETUPAPI
HKEY
WINAPI
SetupDiOpenDeviceInterfaceRegKey(
    IN HDEVINFO                  DeviceInfoSet,
    IN PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData,
    IN DWORD                     Reserved,
    IN REGSAM                    samDesired
    );

//
// Backward compatibility--do not use.
//
#define SetupDiOpenInterfaceDeviceRegKey SetupDiOpenDeviceInterfaceRegKey


WINSETUPAPI
BOOL
WINAPI
SetupDiDeleteDeviceInterfaceRegKey(
    IN HDEVINFO                  DeviceInfoSet,
    IN PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData,
    IN DWORD                     Reserved
    );

//
// Backward compatibility--do not use.
//
#define SetupDiDeleteInterfaceDeviceRegKey SetupDiDeleteDeviceInterfaceRegKey


//
// KeyType values for SetupDiCreateDevRegKey, SetupDiOpenDevRegKey, and
// SetupDiDeleteDevRegKey.
//
#define DIREG_DEV       0x00000001          // Open/Create/Delete device key
#define DIREG_DRV       0x00000002          // Open/Create/Delete driver key
#define DIREG_BOTH      0x00000004          // Delete both driver and Device key

WINSETUPAPI
HKEY
WINAPI
SetupDiCreateDevRegKeyA(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData,
    IN DWORD            Scope,
    IN DWORD            HwProfile,
    IN DWORD            KeyType,
    IN HINF             InfHandle,      OPTIONAL
    IN PCSTR            InfSectionName  OPTIONAL
    );

WINSETUPAPI
HKEY
WINAPI
SetupDiCreateDevRegKeyW(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData,
    IN DWORD            Scope,
    IN DWORD            HwProfile,
    IN DWORD            KeyType,
    IN HINF             InfHandle,      OPTIONAL
    IN PCWSTR           InfSectionName  OPTIONAL
    );

#ifdef UNICODE
#define SetupDiCreateDevRegKey SetupDiCreateDevRegKeyW
#else
#define SetupDiCreateDevRegKey SetupDiCreateDevRegKeyA
#endif


WINSETUPAPI
HKEY
WINAPI
SetupDiOpenDevRegKey(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData,
    IN DWORD            Scope,
    IN DWORD            HwProfile,
    IN DWORD            KeyType,
    IN REGSAM           samDesired
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiDeleteDevRegKey(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData,
    IN DWORD            Scope,
    IN DWORD            HwProfile,
    IN DWORD            KeyType
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiGetHwProfileList(
    OUT PDWORD HwProfileList,
    IN  DWORD  HwProfileListSize,
    OUT PDWORD RequiredSize,
    OUT PDWORD CurrentlyActiveIndex OPTIONAL
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiGetHwProfileListExA(
    OUT PDWORD HwProfileList,
    IN  DWORD  HwProfileListSize,
    OUT PDWORD RequiredSize,
    OUT PDWORD CurrentlyActiveIndex, OPTIONAL
    IN  PCSTR  MachineName,          OPTIONAL
    IN  PVOID  Reserved
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetHwProfileListExW(
    OUT PDWORD HwProfileList,
    IN  DWORD  HwProfileListSize,
    OUT PDWORD RequiredSize,
    OUT PDWORD CurrentlyActiveIndex, OPTIONAL
    IN  PCWSTR MachineName,          OPTIONAL
    IN  PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiGetHwProfileListEx SetupDiGetHwProfileListExW
#else
#define SetupDiGetHwProfileListEx SetupDiGetHwProfileListExA
#endif


//
// Device registry property codes
// (Codes marked as read-only (R) may only be used for
// SetupDiGetDeviceRegistryProperty)
//
// These values should cover the same set of registry properties
// as defined by the CM_DRP codes in cfgmgr32.h.
//
#define SPDRP_DEVICEDESC                  (0x00000000)  // DeviceDesc (R/W)
#define SPDRP_HARDWAREID                  (0x00000001)  // HardwareID (R/W)
#define SPDRP_COMPATIBLEIDS               (0x00000002)  // CompatibleIDs (R/W)
#define SPDRP_NTDEVICEPATHS               (0x00000003)  // Unsupported, DO NOT USE
#define SPDRP_SERVICE                     (0x00000004)  // Service (R/W)
#define SPDRP_CONFIGURATION               (0x00000005)  // Configuration (R)
#define SPDRP_CONFIGURATIONVECTOR         (0x00000006)  // ConfigurationVector (R)
#define SPDRP_CLASS                       (0x00000007)  // Class (R--tied to ClassGUID)
#define SPDRP_CLASSGUID                   (0x00000008)  // ClassGUID (R/W)
#define SPDRP_DRIVER                      (0x00000009)  // Driver (R/W)
#define SPDRP_CONFIGFLAGS                 (0x0000000A)  // ConfigFlags (R/W)
#define SPDRP_MFG                         (0x0000000B)  // Mfg (R/W)
#define SPDRP_FRIENDLYNAME                (0x0000000C)  // FriendlyName (R/W)
#define SPDRP_LOCATION_INFORMATION        (0x0000000D)  // LocationInformation (R/W)
#define SPDRP_PHYSICAL_DEVICE_OBJECT_NAME (0x0000000E)  // PhysicalDeviceObjectName (R)
#define SPDRP_CAPABILITIES                (0x0000000F)  // Capabilities (R)
#define SPDRP_UI_NUMBER                   (0x00000010)  // UiNumber (R)
#define SPDRP_UPPERFILTERS                (0x00000011)  // UpperFilters (R/W)
#define SPDRP_LOWERFILTERS                (0x00000012)  // LowerFilters (R/W)
#define SPDRP_MAXIMUM_PROPERTY            (0x00000013)  // Upper bound on ordinals

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceRegistryPropertyA(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PSP_DEVINFO_DATA DeviceInfoData,
    IN  DWORD            Property,
    OUT PDWORD           PropertyRegDataType, OPTIONAL
    OUT PBYTE            PropertyBuffer,
    IN  DWORD            PropertyBufferSize,
    OUT PDWORD           RequiredSize         OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceRegistryPropertyW(
    IN  HDEVINFO         DeviceInfoSet,
    IN  PSP_DEVINFO_DATA DeviceInfoData,
    IN  DWORD            Property,
    OUT PDWORD           PropertyRegDataType, OPTIONAL
    OUT PBYTE            PropertyBuffer,
    IN  DWORD            PropertyBufferSize,
    OUT PDWORD           RequiredSize         OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetDeviceRegistryProperty SetupDiGetDeviceRegistryPropertyW
#else
#define SetupDiGetDeviceRegistryProperty SetupDiGetDeviceRegistryPropertyA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiSetDeviceRegistryPropertyA(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData,
    IN     DWORD            Property,
    IN     CONST BYTE*      PropertyBuffer,
    IN     DWORD            PropertyBufferSize
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiSetDeviceRegistryPropertyW(
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData,
    IN     DWORD            Property,
    IN     CONST BYTE*      PropertyBuffer,
    IN     DWORD            PropertyBufferSize
    );

#ifdef UNICODE
#define SetupDiSetDeviceRegistryProperty SetupDiSetDeviceRegistryPropertyW
#else
#define SetupDiSetDeviceRegistryProperty SetupDiSetDeviceRegistryPropertyA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInstallParamsA(
    IN  HDEVINFO                DeviceInfoSet,
    IN  PSP_DEVINFO_DATA        DeviceInfoData,          OPTIONAL
    OUT PSP_DEVINSTALL_PARAMS_A DeviceInstallParams
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInstallParamsW(
    IN  HDEVINFO                DeviceInfoSet,
    IN  PSP_DEVINFO_DATA        DeviceInfoData,          OPTIONAL
    OUT PSP_DEVINSTALL_PARAMS_W DeviceInstallParams
    );

#ifdef UNICODE
#define SetupDiGetDeviceInstallParams SetupDiGetDeviceInstallParamsW
#else
#define SetupDiGetDeviceInstallParams SetupDiGetDeviceInstallParamsA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassInstallParamsA(
    IN  HDEVINFO                DeviceInfoSet,
    IN  PSP_DEVINFO_DATA        DeviceInfoData,         OPTIONAL
    OUT PSP_CLASSINSTALL_HEADER ClassInstallParams,     OPTIONAL
    IN  DWORD                   ClassInstallParamsSize,
    OUT PDWORD                  RequiredSize            OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassInstallParamsW(
    IN  HDEVINFO                DeviceInfoSet,
    IN  PSP_DEVINFO_DATA        DeviceInfoData,         OPTIONAL
    OUT PSP_CLASSINSTALL_HEADER ClassInstallParams,     OPTIONAL
    IN  DWORD                   ClassInstallParamsSize,
    OUT PDWORD                  RequiredSize            OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetClassInstallParams SetupDiGetClassInstallParamsW
#else
#define SetupDiGetClassInstallParams SetupDiGetClassInstallParamsA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiSetDeviceInstallParamsA(
    IN HDEVINFO                DeviceInfoSet,
    IN PSP_DEVINFO_DATA        DeviceInfoData,     OPTIONAL
    IN PSP_DEVINSTALL_PARAMS_A DeviceInstallParams
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiSetDeviceInstallParamsW(
    IN HDEVINFO                DeviceInfoSet,
    IN PSP_DEVINFO_DATA        DeviceInfoData,     OPTIONAL
    IN PSP_DEVINSTALL_PARAMS_W DeviceInstallParams
    );

#ifdef UNICODE
#define SetupDiSetDeviceInstallParams SetupDiSetDeviceInstallParamsW
#else
#define SetupDiSetDeviceInstallParams SetupDiSetDeviceInstallParamsA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiSetClassInstallParamsA(
    IN HDEVINFO                DeviceInfoSet,
    IN PSP_DEVINFO_DATA        DeviceInfoData,        OPTIONAL
    IN PSP_CLASSINSTALL_HEADER ClassInstallParams,    OPTIONAL
    IN DWORD                   ClassInstallParamsSize
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiSetClassInstallParamsW(
    IN HDEVINFO                DeviceInfoSet,
    IN PSP_DEVINFO_DATA        DeviceInfoData,        OPTIONAL
    IN PSP_CLASSINSTALL_HEADER ClassInstallParams,    OPTIONAL
    IN DWORD                   ClassInstallParamsSize
    );

#ifdef UNICODE
#define SetupDiSetClassInstallParams SetupDiSetClassInstallParamsW
#else
#define SetupDiSetClassInstallParams SetupDiSetClassInstallParamsA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetDriverInstallParamsA(
    IN  HDEVINFO              DeviceInfoSet,
    IN  PSP_DEVINFO_DATA      DeviceInfoData,     OPTIONAL
    IN  PSP_DRVINFO_DATA_A    DriverInfoData,
    OUT PSP_DRVINSTALL_PARAMS DriverInstallParams
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetDriverInstallParamsW(
    IN  HDEVINFO              DeviceInfoSet,
    IN  PSP_DEVINFO_DATA      DeviceInfoData,     OPTIONAL
    IN  PSP_DRVINFO_DATA_W    DriverInfoData,
    OUT PSP_DRVINSTALL_PARAMS DriverInstallParams
    );

#ifdef UNICODE
#define SetupDiGetDriverInstallParams SetupDiGetDriverInstallParamsW
#else
#define SetupDiGetDriverInstallParams SetupDiGetDriverInstallParamsA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiSetDriverInstallParamsA(
    IN HDEVINFO              DeviceInfoSet,
    IN PSP_DEVINFO_DATA      DeviceInfoData,     OPTIONAL
    IN PSP_DRVINFO_DATA_A    DriverInfoData,
    IN PSP_DRVINSTALL_PARAMS DriverInstallParams
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiSetDriverInstallParamsW(
    IN HDEVINFO              DeviceInfoSet,
    IN PSP_DEVINFO_DATA      DeviceInfoData,     OPTIONAL
    IN PSP_DRVINFO_DATA_W    DriverInfoData,
    IN PSP_DRVINSTALL_PARAMS DriverInstallParams
    );

#ifdef UNICODE
#define SetupDiSetDriverInstallParams SetupDiSetDriverInstallParamsW
#else
#define SetupDiSetDriverInstallParams SetupDiSetDriverInstallParamsA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiLoadClassIcon(
    IN  LPGUID  ClassGuid,
    OUT HICON  *LargeIcon,    OPTIONAL
    OUT PINT    MiniIconIndex OPTIONAL
    );


//
// Flags controlling the drawing of mini-icons
//
#define DMI_MASK      0x00000001
#define DMI_BKCOLOR   0x00000002
#define DMI_USERECT   0x00000004

WINSETUPAPI
INT
WINAPI
SetupDiDrawMiniIcon(
    IN HDC   hdc,
    IN RECT  rc,
    IN INT   MiniIconIndex,
    IN DWORD Flags
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassBitmapIndex(
    IN  LPGUID ClassGuid,    OPTIONAL
    OUT PINT   MiniIconIndex
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassImageList(
    OUT PSP_CLASSIMAGELIST_DATA ClassImageListData
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassImageListExA(
    OUT PSP_CLASSIMAGELIST_DATA ClassImageListData,
    IN  PCSTR                   MachineName,        OPTIONAL
    IN  PVOID                   Reserved
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassImageListExW(
    OUT PSP_CLASSIMAGELIST_DATA ClassImageListData,
    IN  PCWSTR                  MachineName,        OPTIONAL
    IN  PVOID                   Reserved
    );

#ifdef UNICODE
#define SetupDiGetClassImageListEx SetupDiGetClassImageListExW
#else
#define SetupDiGetClassImageListEx SetupDiGetClassImageListExA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassImageIndex(
    IN  PSP_CLASSIMAGELIST_DATA ClassImageListData,
    IN  LPGUID                  ClassGuid,
    OUT PINT                    ImageIndex
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiDestroyClassImageList(
    IN PSP_CLASSIMAGELIST_DATA ClassImageListData
    );


//
// PropertySheetType values for the SetupDiGetClassDevPropertySheets API
//
#define DIGCDP_FLAG_BASIC           0x00000001
#define DIGCDP_FLAG_ADVANCED        0x00000002

WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassDevPropertySheetsA(
    IN  HDEVINFO           DeviceInfoSet,
    IN  PSP_DEVINFO_DATA   DeviceInfoData,                  OPTIONAL
    IN  LPPROPSHEETHEADERA PropertySheetHeader,
    IN  DWORD              PropertySheetHeaderPageListSize,
    OUT PDWORD             RequiredSize,                    OPTIONAL
    IN  DWORD              PropertySheetType
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetClassDevPropertySheetsW(
    IN  HDEVINFO           DeviceInfoSet,
    IN  PSP_DEVINFO_DATA   DeviceInfoData,                  OPTIONAL
    IN  LPPROPSHEETHEADERW PropertySheetHeader,
    IN  DWORD              PropertySheetHeaderPageListSize,
    OUT PDWORD             RequiredSize,                    OPTIONAL
    IN  DWORD              PropertySheetType
    );

#ifdef UNICODE
#define SetupDiGetClassDevPropertySheets SetupDiGetClassDevPropertySheetsW
#else
#define SetupDiGetClassDevPropertySheets SetupDiGetClassDevPropertySheetsA
#endif


//
// Define ICON IDs publicly exposed from setupapi.
//
#define IDI_RESOURCEFIRST           159
#define IDI_RESOURCE                159
#define IDI_NOCFGDATA               160
#define IDI_RESOURCELAST            161
#define IDI_RESOURCEOVERLAYFIRST    161
#define IDI_RESOURCEOVERLAYLAST     161
#define IDI_CONFLICT                161

#define IDI_CLASSICON_OVERLAYFIRST  500
#define IDI_CLASSICON_OVERLAYLAST   502
#define IDI_PROBLEM_OVL             500
#define IDI_DISABLED_OVL            501
#define IDI_FORCED_OVL              502


WINSETUPAPI
BOOL
WINAPI
SetupDiAskForOEMDisk(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData OPTIONAL
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiSelectOEMDrv(
    IN     HWND             hwndParent,    OPTIONAL
    IN     HDEVINFO         DeviceInfoSet,
    IN OUT PSP_DEVINFO_DATA DeviceInfoData OPTIONAL
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiClassNameFromGuidA(
    IN  LPGUID ClassGuid,
    OUT PSTR   ClassName,
    IN  DWORD  ClassNameSize,
    OUT PDWORD RequiredSize   OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiClassNameFromGuidW(
    IN  LPGUID ClassGuid,
    OUT PWSTR  ClassName,
    IN  DWORD  ClassNameSize,
    OUT PDWORD RequiredSize   OPTIONAL
    );

#ifdef UNICODE
#define SetupDiClassNameFromGuid SetupDiClassNameFromGuidW
#else
#define SetupDiClassNameFromGuid SetupDiClassNameFromGuidA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiClassNameFromGuidExA(
    IN  LPGUID ClassGuid,
    OUT PSTR   ClassName,
    IN  DWORD  ClassNameSize,
    OUT PDWORD RequiredSize,  OPTIONAL
    IN  PCSTR  MachineName,   OPTIONAL
    IN  PVOID  Reserved
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiClassNameFromGuidExW(
    IN  LPGUID ClassGuid,
    OUT PWSTR  ClassName,
    IN  DWORD  ClassNameSize,
    OUT PDWORD RequiredSize,  OPTIONAL
    IN  PCWSTR MachineName,   OPTIONAL
    IN  PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiClassNameFromGuidEx SetupDiClassNameFromGuidExW
#else
#define SetupDiClassNameFromGuidEx SetupDiClassNameFromGuidExA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiClassGuidsFromNameA(
    IN  PCSTR  ClassName,
    OUT LPGUID ClassGuidList,
    IN  DWORD  ClassGuidListSize,
    OUT PDWORD RequiredSize
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiClassGuidsFromNameW(
    IN  PCWSTR ClassName,
    OUT LPGUID ClassGuidList,
    IN  DWORD  ClassGuidListSize,
    OUT PDWORD RequiredSize
    );

#ifdef UNICODE
#define SetupDiClassGuidsFromName SetupDiClassGuidsFromNameW
#else
#define SetupDiClassGuidsFromName SetupDiClassGuidsFromNameA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiClassGuidsFromNameExA(
    IN  PCSTR  ClassName,
    OUT LPGUID ClassGuidList,
    IN  DWORD  ClassGuidListSize,
    OUT PDWORD RequiredSize,
    IN  PCSTR  MachineName,       OPTIONAL
    IN  PVOID  Reserved
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiClassGuidsFromNameExW(
    IN  PCWSTR ClassName,
    OUT LPGUID ClassGuidList,
    IN  DWORD  ClassGuidListSize,
    OUT PDWORD RequiredSize,
    IN  PCWSTR MachineName,       OPTIONAL
    IN  PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiClassGuidsFromNameEx SetupDiClassGuidsFromNameExW
#else
#define SetupDiClassGuidsFromNameEx SetupDiClassGuidsFromNameExA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetHwProfileFriendlyNameA(
    IN  DWORD  HwProfile,
    OUT PSTR   FriendlyName,
    IN  DWORD  FriendlyNameSize,
    OUT PDWORD RequiredSize      OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetHwProfileFriendlyNameW(
    IN  DWORD  HwProfile,
    OUT PWSTR  FriendlyName,
    IN  DWORD  FriendlyNameSize,
    OUT PDWORD RequiredSize      OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetHwProfileFriendlyName SetupDiGetHwProfileFriendlyNameW
#else
#define SetupDiGetHwProfileFriendlyName SetupDiGetHwProfileFriendlyNameA
#endif


WINSETUPAPI
BOOL
WINAPI
SetupDiGetHwProfileFriendlyNameExA(
    IN  DWORD  HwProfile,
    OUT PSTR   FriendlyName,
    IN  DWORD  FriendlyNameSize,
    OUT PDWORD RequiredSize,     OPTIONAL
    IN  PCSTR  MachineName,      OPTIONAL
    IN  PVOID  Reserved
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetHwProfileFriendlyNameExW(
    IN  DWORD  HwProfile,
    OUT PWSTR  FriendlyName,
    IN  DWORD  FriendlyNameSize,
    OUT PDWORD RequiredSize,     OPTIONAL
    IN  PCWSTR MachineName,      OPTIONAL
    IN  PVOID  Reserved
    );

#ifdef UNICODE
#define SetupDiGetHwProfileFriendlyNameEx SetupDiGetHwProfileFriendlyNameExW
#else
#define SetupDiGetHwProfileFriendlyNameEx SetupDiGetHwProfileFriendlyNameExA
#endif


//
// PageType values for SetupDiGetWizardPage API
//
#define SPWPT_SELECTDEVICE      0x00000001

//
// Flags for SetupDiGetWizardPage API
//
#define SPWP_USE_DEVINFO_DATA   0x00000001

WINSETUPAPI
HPROPSHEETPAGE
WINAPI
SetupDiGetWizardPage(
    IN HDEVINFO               DeviceInfoSet,
    IN PSP_DEVINFO_DATA       DeviceInfoData,    OPTIONAL
    IN PSP_INSTALLWIZARD_DATA InstallWizardData,
    IN DWORD                  PageType,
    IN DWORD                  Flags
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiGetSelectedDevice(
    IN  HDEVINFO         DeviceInfoSet,
    OUT PSP_DEVINFO_DATA DeviceInfoData
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiSetSelectedDevice(
    IN HDEVINFO         DeviceInfoSet,
    IN PSP_DEVINFO_DATA DeviceInfoData
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiGetActualSectionToInstallA(
    IN  HINF    InfHandle,
    IN  PCSTR   InfSectionName,
    OUT PSTR    InfSectionWithExt,     OPTIONAL
    IN  DWORD   InfSectionWithExtSize,
    OUT PDWORD  RequiredSize,          OPTIONAL
    OUT PSTR   *Extension              OPTIONAL
    );

WINSETUPAPI
BOOL
WINAPI
SetupDiGetActualSectionToInstallW(
    IN  HINF    InfHandle,
    IN  PCWSTR  InfSectionName,
    OUT PWSTR   InfSectionWithExt,     OPTIONAL
    IN  DWORD   InfSectionWithExtSize,
    OUT PDWORD  RequiredSize,          OPTIONAL
    OUT PWSTR  *Extension              OPTIONAL
    );

#ifdef UNICODE
#define SetupDiGetActualSectionToInstall SetupDiGetActualSectionToInstallW
#else
#define SetupDiGetActualSectionToInstall SetupDiGetActualSectionToInstallA
#endif


#ifdef __cplusplus
}
#endif

#include <poppack.h>

#endif // _INC_SETUPAPI

