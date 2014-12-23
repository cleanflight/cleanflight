# Microsoft Developer Studio Project File - Name="DfuSeDemo" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=DfuSeDemo - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "DfuSeDemo.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DfuSeDemo.mak" CFG="DfuSeDemo - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DfuSeDemo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "DfuSeDemo - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/SW/APP/0020.01/SOFTWARE/PC", JBICAAAA"
# PROP Scc_LocalPath ".."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "DfuSeDemo - Win32 Release"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "../include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_VS6_USED" /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40c /d "NDEBUG"
# ADD RSC /l 0x40c /d "NDEBUG" /d "_VS6_USED"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 ../STDFU/release/STDFU.lib ../STDFUFiles/Release/STDFUFiles.lib ../STDFUprt/release/STDFUprt.lib setupapi.lib lib/hid.lib /nologo /subsystem:windows /machine:I386 /out:"../binary/Release/DfuSeDemo.exe" /libpath:"../lib"

!ELSEIF  "$(CFG)" == "DfuSeDemo - Win32 Debug"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "../include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_VS6_USED" /FR /Yu"stdafx.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x40c /d "_DEBUG"
# ADD RSC /l 0x40c /d "_DEBUG" /d "_VS6_USED"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ../STDFU/debug/STDFU.lib ../STDFUFiles/debug/STDFUFiles.lib ../STDFUprt/debug/STDFUprt.lib setupapi.lib lib/hid.lib /nologo /subsystem:windows /debug /machine:I386 /out:"../Binary/Debug/DfuSeDemo.exe" /pdbtype:sept /libpath:"../lib"

!ENDIF 

# Begin Target

# Name "DfuSeDemo - Win32 Release"
# Name "DfuSeDemo - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\DfuSeDemo.cpp
# End Source File
# Begin Source File

SOURCE=.\DfuSeDemo.rc
# End Source File
# Begin Source File

SOURCE=.\DfuSeDemoDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\Enumeration.cpp
# End Source File
# Begin Source File

SOURCE=.\HexEdit.cpp
# End Source File
# Begin Source File

SOURCE=.\MappingDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\OptionBytesDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\OptionBytesDialog_f2.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\TextProgressCtrl.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\DfuSeDemo.h
# End Source File
# Begin Source File

SOURCE=.\DfuSeDemoDlg.h
# End Source File
# Begin Source File

SOURCE=.\Enumeration.h
# End Source File
# Begin Source File

SOURCE=.\HexEdit.h
# End Source File
# Begin Source File

SOURCE=.\MappingDlg.h
# End Source File
# Begin Source File

SOURCE=.\OptionBytesDialog.h
# End Source File
# Begin Source File

SOURCE=.\OptionBytesDialog_f2.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# Begin Source File

SOURCE=.\TextProgressCtrl.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=".\DfuSe Demo.ico"
# End Source File
# Begin Source File

SOURCE=.\res\DfuSeDemo.ico
# End Source File
# Begin Source File

SOURCE=.\res\DfuSeDemo.rc2
# End Source File
# Begin Source File

SOURCE=.\icon2.ico
# End Source File
# Begin Source File

SOURCE=.\idr_main.ico
# End Source File
# End Group
# End Target
# End Project
