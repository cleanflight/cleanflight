/******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
* File Name          : readme.txt
* Author             : MCD Application Team
* Version            : V3.0.2
* Date               : 09-May-2011
* Description        : read me file for DfuSe Demonstrator
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*******************************************************************************/

Last version 
***************

        - V3.0.2 - 09-May-2011

Package content
***************
       + Binaries :([INSTALLATION PATH]\BIN\)

         - DfuFileMgr.exe             : DFU File Manager aplication,
         - DfuSeDemo.exe              : DfuSe Demo application,
         - STDFUTester.exe            : DfuSe Tester application ,  
         - STDFUFiles.dll             : Dll that implements .dfu files
         - STDFUPRT.dll               : Dll that implements Protocol for upload and download,
         - STDFU.dll                  : Dll that issues basic DFU requests,
         - STTubeDevice30.dll         : Dll layer for easier driver access.

       + Sources :([INSTALLATION PATH]\Sources\)

         - Binary
         - DfuFileMgr 
         - DfuSeDemo  
         - Doc
         - Include
          - STDFU  (Lib files only)  
         - STDFUFiles
         - STDFUPRT   
         - Tools

       + Driver([INSTALLATION PATH]\Driver)

         - x86\STTub30.sys            : Driver to be loaded for demoboard for x86 machines
         - x64\STTub30.sys            : Driver to be loaded for demoboard for x64 machines
         - STtube.inf                 : WHQL Certified inf file for driver (W98SE/2000/XP/Vista/Seven (x86 & x64))
         - sttube.cat                 : WHQL Certified cat file
         - LogoVerificationReport.pdf : Microsoft WHQL Verification report

       + Documents:([INSTALLATION PATH]\Sources\Doc\)
          
         - UM0384 : DfuSe Application Programming Interface  
         - UM0391 : DfuSe File Format Specification          
         - UM0392 : DfuSe Application Programming Guide
         - UM0412 : DfuSe getting started

       + Additional tools([INSTALLATION PATH]\Tools)
    
         - GUID Generator application

Supported OS
***************

       + Windows 98SE, 2000, XP, Vista, Seven (x86 & x64 Windows platforms)

How to use 
***************

       1- Uninstall previous versions (Start-> Settings-> Control Panel-> Add or remove programs)

       2- run DfuSe setup.

       3- Install your device with the driver and the inf file
          
       4- Use it !


******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE******

