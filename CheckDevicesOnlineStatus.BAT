@Echo Off
REM   Author: Gunner999
REM  Created: 2004-02-12
REM Modified: 2009-10-21
REM  Purpose: Universal batch file to ping multiple devices on the network.
REM             
REM Input Variables: %1 is a file name containing the device Netbios name, 
REM                      DNS name, or the ip address.  One item per line.
REM                                 

rem If '%1'=='' GOTO Syntax
:beginning 
type nul > Airmedia.txt
for /f "tokens=1,5,6,7,8,9 delims=;" %%a in ("C:\Users\hclteska.BDX\OneDrive - BD\Desktop\Airmedia.csv") do Call :StartPing %%a,%%b,%%c,%%d,%%e,%%f
Goto End

:StartPing


PING %1 -n 1 | FIND "TTL" > NUL
IF NOT ERRORLEVEL 1 GOTO :Success
rem PING %1-n 1 -w 400 | FIND "TTL" > NUL
IF ERRORLEVEL 1 Goto Errormsg

:Success
Echo %3 %2 in room %6 is online as of %date% %time% 
rem >> Airmedia.txt
Goto :End

:ErrorMsg

Echo %3 %2 %1 in room %6 is offline as of %date% %time% >> "C:\Users\hclteska.BDX\OneDrive - BD\Desktop\Airmedia.txt"

Goto :End


:Syntax
Echo.
Echo Syntax:
Echo.
Echo MultiPing Filename
Echo.
Echo Examples:
Echo MultiPing Servers.txt
Echo.
Echo Press CTRL-C to quit.
Echo.

goto :beginning 

:End


