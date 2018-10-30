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


For /F %%i in (C:\Users\hclteska.bdx\Desktop\Scriptz\hosts.txt) do Call :StartPing %%i
Goto End

:StartPing
set serial=
set installdate=
set vendor=
set model=
set loggedinuser=
set bitlocker=
set osarchitecture=
set LastBootUpTime=
set baseboardManufacturer=
set baseboardproduct=
set baseboardserialnumber=
set SMBIOSBIOSVersion=
set NumberOfProcessors=
set TotalPhysicalMemory=
set SystemType=
set MemMaxCapacity=
set cpuName=
set desktopmonitormanufacturer=
set desktopmonitordescription=
set desktopmonitorcaption=
set desktopmonitorinstalldate=
set diskdrivecaption=
set diskdrivesize=
set diskdriveserialnumber=


PING %1 -n 1 | FIND "TTL"
rem  > NUL
IF NOT ERRORLEVEL 1 GOTO :Success
PING %1-n 1 -w 400 | FIND "TTL"
rem  > NUL
IF ERRORLEVEL 1 Goto Errormsg

:Success

for /f "tokens=2 delims==" %%f in ('wmic /node:%1 bios get serialnumber /value ^| find "="') do set "serial=%%f"
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 os get installdate /value ^| find "="') do set "installdate=%%f"
			rem FOR /F "tokens=* USEBACKQ" %%F IN (`%~dp0psexec \\%1 powershell "([WMI]'').ConvertToDateTime((Get-WmiObject Win32_OperatingSystem).InstallDate) " `) DO (SET installdate=%%F)
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 csproduct get vendor /value ^| find "="') do set "vendor=%%f"
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 COMPUTERSYSTEM GET MODEL /value ^| find "="') do set "model=%%f"
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 computersystem get username /value ^| find "="') do set "loggedinuser=%%f"

manage-bde -protectors c: -get -computername %1   | find "-" | find /v "ID" > c:\bitlockerKeys\%1.txt
for /f "delims=" %%x in (c:\bitlockerKeys\%1.txt) do set bitlocker=%%x

for /f "tokens=2 delims==" %%f in ('wmic /node:%1 os get osarchitecture /value ^| find "="') do set "osarchitecture=%%f"
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 os get LastBootUpTime /value ^| find "="') do set "LastBootUpTime=%%f"
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 baseboard get  manufacturer /value ^| find "="') do set "baseboardManufacturer=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 baseboard get  product /value ^| find "="') do set "baseboardproduct=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 baseboard get  serialnumber /value ^| find "="') do set "baseboardserialnumber=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 bios get SMBIOSBIOSVersion /value ^| find "="') do set "SMBIOSBIOSVersion=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 computersystem get NumberOfProcessors /value ^| find "="') do set "NumberOfProcessors=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 computersystem get TotalPhysicalMemory /value ^| find "="') do set "TotalPhysicalMemory=%%f
set /a TotalPhysicalMemoryInGB=TotalPhysicalMemory/1048576
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 computersystem get SystemType /value ^| find "="') do set "SystemType=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 MEMPHYSICAL get MaxCapacity /value ^| find "="') do set "MemMaxCapacity=%%f
set /a MemMaxCapacityInGB=MemMaxCapacity/1048576
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 cpu get name /value ^| find "="') do set "cpuName=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 desktopmonitor get manufacturer /value ^| find "="') do set "desktopmonitormanufacturer=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 desktopmonitor get description /value ^| find "="') do set "desktopmonitordescription=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 desktopmonitor get caption /value ^| find "="') do set "desktopmonitorcaption=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 desktopmonitor get installdate /value ^| find "="') do set "desktopmonitorinstalldate=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 diskdrive get caption /value ^| find "="') do set "diskdrivecaption=%%f
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 diskdrive get size /value ^| find "="') do set "diskdrivesize=%%f
set /a DiskDriveSizeInGB=diskdrivesize/1048576
for /f "tokens=2 delims==" %%f in ('wmic /node:%1 wmic diskdrive get serialnumber /value ^| find "="') do set "diskdriveserialnumber=%%f















Echo %1,online,%date%,%serial%,%installdate%,%vendor%,%model%,%loggedinuser%,%bitlocker%,%osarchitecture%,%LastBootUpTime%,%baseboardManufacturer%,%baseboardproduct%,%baseboardserialnumber%,%SMBIOSBIOSVersion%,%NumberOfProcessors%,%TotalPhysicalMemory%,%SystemType%,%MemMaxCapacity%,%cpuName%,%desktopmonitormanufacturer%,%desktopmonitordescription%,%desktopmonitorcaption%,%desktopmonitorinstalldate%,%diskdrivecaption%,%DiskDriveSize%,%diskdriveserialnumber% >> C:\Users\hclteska.BDX\Desktop\serialnumbers-wroclaw.txt

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
