
@echo off
set /p komputer="Podaj nazwe \\"
rem set komputer=EPOL32LXHLFPT32

set BIOSversion=
set BIOSserialnumber=
set installdate=
set model=
set vendor=
set userID=
set bitlocker=
set osarchitecture=
set LastBootUpTime=
set NumberOfProcessors=
set NumberOfCores=
set NumberOfLogicalProcessors=
set meminfo=
set cpu=
set diskdrive=
set diskdriveSerialNumber=
set diskdriveCapacity=
rem set DiskDriveSizeInGB=
set osversion=

cls
echo connecting to %komputer%...
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% os  get installdate') do @for /f "delims=" %%b in ("%%a") do set "installdate=%%a"
rem for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% volume where "Driveletter like '%%C%%'" get label') do @for /f "delims=" %%b in ("%%a") do set "Clabel=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% bios get smbiosbiosversion') do @for /f "delims=" %%b in ("%%a") do set "BIOSversion=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% bios get serialnumber') do @for /f "delims=" %%b in ("%%a") do set "BIOSserialnumber=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% csproduct get vendor') do @for /f "delims=" %%b in ("%%a") do set "vendor=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% COMPUTERSYSTEM get MODEL') do @for /f "delims=" %%b in ("%%a") do set "model=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% COMPUTERSYSTEM get USERNAME') do @for /f "delims=" %%b in ("%%a") do set "userID=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% os get caption') do @for /f "delims=" %%b in ("%%a") do set "osversion=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% os get osarchitecture') do @for /f "delims=" %%b in ("%%a") do set "osarchitecture=%%a"
rem for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% os get LastBootUpTime') do @for /f "delims=" %%b in ("%%a") do set "LastBootUpTime=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% computersystem get NumberOfProcessors') do @for /f "delims=" %%b in ("%%a") do set "NumberOfProcessors=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% cpu get NumberOfCores') do @for /f "delims=" %%b in ("%%a") do set "NumberOfCores=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% cpu get NumberOfLogicalProcessors') do @for /f "delims=" %%b in ("%%a") do set "NumberOfLogicalProcessors=%%a"
rem for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% memorychip get DeviceLocator, MemoryType, TypeDetail, Capacity, Speed') do @for /f "delims=" %%b in ("%%a") do set "meminfo=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% cpu get name') do @for /f "delims=" %%b in ("%%a") do set "cpu=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% diskdrive get caption') do @for /f "delims=" %%b in ("%%a") do set "diskdrive=%%a"
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% diskdrive get size') do @for /f "delims=" %%b in ("%%a") do set "diskdriveCapacity=%%a"
set /a DiskDriveSizeInGB=diskdriveCapacity/1024/1024/1024
for /f "skip=1 delims=" %%a in ('wmic /node:%komputer% diskdrive get serialnumber') do @for /f "delims=" %%b in ("%%a") do set "diskdriveSerialNumber=%%a"




manage-bde -protectors c: -get -computername %komputer%   | find "-" | find /v "ID" > c:\%komputer%-bitlocker.txt
for /f "delims=" %%x in (c:\%komputer%-bitlocker.txt) do set bitlocker=%%x
for /f "tokens=* delims= " %%a in ("%bitlocker%") do set bitlocker=%%a
del c:\%komputer%-bitlocker.txt

cls
echo %DiskDriveSizeInGB%
echo %vendor% %model% servicetag %BIOSserialnumber%
echo BIOS version is %BIOSversion%
echo.
echo %osversion% %osarchitecture%
	SET _shortInstallDate=%installdate:~0,8%
echo Windows was installed on %_shortInstallDate%
echo.
echo logged in user: %userID%
echo bitlocker key: %bitlocker%
echo.
echo %cpu%
echo Number of installed physical processors is: %NumberOfProcessors%
echo Number of cores is: %NumberOfCores%
echo Number of Logical Processors: %NumberOfLogicalProcessors%
echo.
echo Information about installed RAM:
wmic /node:%komputer% MEMORYCHIP get DeviceLocator, MemoryType, TypeDetail, Capacity, Speed,serialnumber
echo.
wmic /node:%komputer% diskdrive get serialnumber,size,caption
wmic /node:%komputer% logicaldisk where "name like 'c:'" get name,size,freespace



















pause