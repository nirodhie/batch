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

set /p password=<c:\users\hclteska.bdx\desktop\cyberark.txt
net use a: /delete /y
net use b: /delete /y

For /F %%i in (C:\Users\hclteska.000\Desktop\Scriptz\hosts2.txt) do Call :StartPing %%i
Goto End

:StartPing



PING %1 -n 1 | FIND "TTL"
rem  > NUL
IF NOT ERRORLEVEL 1 GOTO :Success
PING %1-n 1 -w 400 | FIND "TTL"
rem  > NUL
IF ERRORLEVEL 1 Goto Errormsg

:Success

net use z:  \\%1\c$
net use x:  \\dtpolbn7001\ossprv$\computerdata\monitors
copy C:\Users\hclteska.BDX\Desktop\Scriptz\Powershell\Monitors3.ps1 a:\temp
psexec  \\%host% -u BDX.com\cybwkseucentral03 -p %password% -i cmd /c "powershell -noninteractive -executionpolicy remotesigned  -file C:\temp\Monitors.ps1>c:\temp\%host%.txt"

del  z:\temp\Monitors.ps1
copy a:\temp\%host%.txt x:
del  z:\temp\%host%.txt
net use z: /delete /y
net use x: /delete /y


















Goto :End

:ErrorMsg
Echo %1,offline,%date% 
Goto :EOF


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
pause


:End
net use a: /delete /y
net use b: /delete /y