@echo off
for /F "tokens=2 delims=:" %%a in ('fsutil volume diskfree C: ^| find /i "wolnych"') do set bytes=%%a
set /A MBb4=%bytes:~0,-3%/1024*1000/1024   rem /1024
IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\
IF EXIST c:\Windows\SoftwareDistribution\Download\ del /S /F /Q c:\Windows\SoftwareDistribution\Download\
IF EXIST c:\Windows\Prefetch\ del /S /F /Q c:\Windows\Prefetch\
IF EXIST "C:\windows\security\logs\winlogon.log" del /S /F /Q "C:\windows\security\logs\winlogon.log"
IF EXIST "C:\windows\Logs\Algotech Polska sp. z o.o._Algotech APC Agent-Install.log" del /S /F /Q "C:\windows\Logs\Algotech Polska sp. z o.o._Algotech APC Agent-Install.log"
IF EXIST "C:\windows\Logs\EMC_Avamar x86-Install.log" del /S /F /Q "C:\windows\Logs\EMC_Avamar x86-Install.log"
rem IF EXIST "C:\windows\Logs\IE9_NR_Setup.log" del /S /F /Q "C:\windows\Logs\IE9_NR_Setup.log"
rem IF EXIST "C:\windows\Logs\CBS\CBS.log" del /S /F /Q "C:\windows\Logs\CBS\CBS.log"
rem IF EXIST "C:\windows\Logs\WU_IE9_LangPacks.log" del /S /F /Q 
rem IF EXIST "C:\windows\Logs\CBS\CBS.log" del /S /F /Q "C:\windows\Logs\WU_IE9_LangPacks.log"
rem IF EXIST "C:\windows\Logs\CBS\DeepClean.log" del /S /F /Q "C:\windows\Logs\CBS\DeepClean.log"
rem IF EXIST "C:\windows\Logs\CBS\FilterList.log" del /S /F /Q "C:\windows\Logs\CBS\FilterList.log"
rem IF EXIST "C:\windows\Logs\DISM\dism.log" del /S /F /Q "C:\windows\Logs\DISM\dism.log"
IF EXIST "C:\windows\Microsoft.NET\Framework\v2.0.50727\ngen.log" del /S /F /Q "C:\windows\Microsoft.NET\Framework\v2.0.50727\ngen.log"
IF EXIST "C:\windows\Microsoft.NET\Framework\v2.0.50727\ngen_service.log" del /S /F /Q "C:\windows\Microsoft.NET\Framework\v2.0.50727\ngen_service.log"
IF EXIST "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen.log" del /S /F /Q "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen.log"
IF EXIST "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen.old.log" del /S /F /Q "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen.old.log"
IF EXIST "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen_service.log" del /S /F /Q "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen_service.log"
IF EXIST "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen_service.old.log" del /S /F /Q "C:\windows\Microsoft.NET\Framework\v4.0.30319\ngen_service.old.log"
IF EXIST "C:\windows\inf\setupapi.app.log" del /S /F /Q "C:\windows\inf\setupapi.app.log"
IF EXIST "C:\windows\inf\setupapi.dev.log" del /S /F /Q "C:\windows\inf\setupapi.dev.log"
IF EXIST c:\Windows\comsetup.log del /S /F /Q c:\Windows\comsetup.log
IF EXIST c:\Windows\DtcInstall.log del /S /F /Q c:\Windows\DtcInstall.log
IF EXIST c:\Windows\IE9_main.log del /S /F /Q c:\Windows\IE9_main.log
IF EXIST c:\Windows\iis7.log del /S /F /Q c:\Windows\iis7.log
IF EXIST c:\Windows\PFRO.log del /S /F /Q c:\Windows\PFRO.log
IF EXIST c:\Windows\setupact.log del /S /F /Q c:\Windows\setupact.log
IF EXIST c:\Windows\setuperr.log del /S /F /Q c:\Windows\setuperr.log
IF EXIST c:\Windows\TSSysprep.log del /S /F /Q c:\Windows\TSSysprep.log
IF EXIST c:\Windows\Debug\NetSetup.LOG del /S /F /Q c:\Windows\Debug\NetSetup.LOG
IF EXIST c:\Windows\Debug\sammui.log del /S /F /Q c:\Windows\Debug\sammui.log
IF EXIST c:\Windows\security\logs\diagnosis.log del /S /F /Q c:\Windows\security\logs\diagnosis.log
IF EXIST c:\Windows\security\logs\scesetup.log del /S /F /Q c:\Windows\security\logs\scesetup.log
IF EXIST c:\Windows\security\logs\winlogon.log del /S /F /Q c:\Windows\security\logs\winlogon.log
IF EXIST c:\Windows\security\logs\diagnosis.old del /S /F /Q c:\Windows\security\logs\diagnosis.old
IF EXIST c:\Windows\security\logs\scecomp.old del /S /F /Q c:\Windows\security\logs\scecomp.old
IF EXIST c:\Windows\security\logs\winlogon.old del /S /F /Q c:\Windows\security\logs\winlogon.old
IF EXIST "C:\Program Files\Adobe\Reader 11.0\Setup Files\" del /S /F /Q "C:\Program Files\Adobe\Reader 11.0\Setup Files\"
IF EXIST "C:\Program Files\Google\Update\Download\" del /S /F /Q "C:\Program Files\Google\Update\Download\"
IF EXIST "C:\Program Files\Google\Update\Install\" del /S /F /Q "C:\Program Files\Google\Update\Install\"
IF EXIST "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\" del /S /F /Q "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\"
IF EXIST "C:\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content" del /S /F /Q "C:\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content"
IF EXIST "C:\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData" del /S /F /Q "C:\Windows\System32\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData"
IF EXIST "C:\windows\inf\setupapi.app.log" del /S /F /Q "C:\windows\inf\setupapi.app.log"
IF EXIST "C:\windows\inf\setupapi.dev.log" del /S /F /Q "C:\windows\inf\setupapi.dev.log"
IF EXIST "C:\windows\inf\setupapi.offline.log" del /S /F /Q "C:\windows\inf\setupapi.offline.log"
IF EXIST "C:\windows\Panther\DDACLSys.log" del /S /F /Q "C:\windows\Panther\DDACLSys.log"
IF EXIST "C:\windows\System32\sysprep\Panther\IE\diagerr.xml" del /S /F /Q "C:\windows\System32\sysprep\Panther\IE\diagerr.xml"
IF EXIST "C:\windows\System32\sysprep\Panther\IE\diagwrn.xml" del /S /F /Q "C:\windows\System32\sysprep\Panther\IE\diagwrn.xml"
IF EXIST "C:\windows\Panther\UnattendGC\diagerr.xml" del /S /F /Q "C:\windows\Panther\UnattendGC\diagerr.xml"
IF EXIST "C:\windows\Panther\UnattendGC\diagwrn.xml" del /S /F /Q "C:\windows\Panther\UnattendGC\diagwrn.xml"
IF EXIST "C:\windows\SoftwareDistribution\DataStore\Logs\" del /S /F /Q "C:\windows\SoftwareDistribution\DataStore\Logs\*.log"
IF EXIST "C:\windows\SoftwareDistribution\DataStore\Logs\" del /S /F /Q "C:\windows\SoftwareDistribution\DataStore\Logs\*.jrs"
IF EXIST  %WinDir%\debug\WIA\wiatrace.log del /S /F /Q %WinDir%\debug\WIA\wiatrace.log
IF EXIST  %WinDir%\Microsoft.NET\Framework\*\*\Logs\ del /S /F /Q %WinDir%\Microsoft.NET\Framework\*\*\Logs\
IF EXIST  C:\Windows\Microsoft.NET\Framework\v4.0.30319\SetupCache\ del /S /F /Q C:\Windows\Microsoft.NET\Framework\v4.0.30319\SetupCache\
forfiles /p "C:\Program Files\altitude\altitude uCI 7.5\Altitude uAgent Windows" /m "*.*" /c "cmd /c del @file" /D -15
rem IF EXIST  %WinDir%\SoftwareDistribution\DataStore\Logs\ del /S /F /Q %WinDir%\SoftwareDistribution\DataStore\Logs\
rem ponizsze do testow
IF EXIST "%WinDir%\assembly\NativeImages_*\Temp\" del /S /F /Q "%WinDir%\assembly\NativeImages_*\Temp\"
IF EXIST "%WinDir%\assembly\temp\" del /S /F /Q "%WinDir%\assembly\temp\"
IF EXIST "%WinDir%\assembly\tmp\" del /S /F /Q "%WinDir%\assembly\tmp\"
rem %LocalAppData%\IsolatedStorage\
IF EXIST "%WinDir%\Microsoft.NET\Framework\*\*\Logs\" del /S /F /Q "%WinDir%\Microsoft.NET\Framework\*\*\Logs\"
IF EXIST "%WinDir%\System32\URTTemp\"del /S /F /Q "%WinDir%\System32\URTTemp\"
rem %LocalAppData%\Adobe\Acrobat|*.idx"
rem %LocalAppData%\Adobe\Acrobat\11.0\Cache"
rem %LocalAppData%\Adobe\Acrobat\11.0\UserCache.bin
rem %AppData%\Adobe\Flash Player\AssetCache|*.*|RECURSE
rem %AppData%\Adobe\Flash Player\AFCache|*.*|RECURSE
rem %AppData%\Adobe\Flash Player\Icon Cache|*.*|RECURSE
rem %AppData%\Adobe\Flash Player\NativeCache|*.*|RECURSE
IF EXIST "%WinDir%\System32\Macromedia\Flash\FlashInstall.log" del /S /F /Q "%WinDir%\System32\Macromedia\Flash\FlashInstall.log"
IF EXIST "%WinDir%\System32\Macromedia\Flash\install.log" del /S /F /Q "%WinDir%\System32\Macromedia\Flash\install.log"
IF EXIST "%WinDir%\SysWOW64\Macromedia\Flash\FlashInstall.log" del /S /F /Q "%WinDir%\SysWOW64\Macromedia\Flash\FlashInstall.log"
IF EXIST "%WinDir%\SysWOW64\Macromedia\Flash\install.log" del /S /F /Q "%WinDir%\SysWOW64\Macromedia\Flash\install.log"

IF EXIST "C:\Users\" (
    for /D %%x in ("C:\Users\*") do ( 
       		IF EXIST "%%x\AppData\Local\Temp\" del /S /F /Q "%%x\AppData\Local\Temp\"
		IF EXIST "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\" del /S /F /Q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\"
		rem IF EXIST "%%x\AppData\Roaming\Microsoft\Windows\Cookies\" del /S /F /Q "%%x\AppData\Roaming\Microsoft\Windows\Cookies\"
		IF EXIST "%%x\AppData\Roaming\Microsoft\Windows\PrivacIE\index.dat" del /S /F /Q "%%x\AppData\Roaming\Microsoft\Windows\PrivacIE\index.dat"
		IF EXIST "%%x\AppData\Roaming\Microsoft\Windows\IECompatCache\index.dat" del /S /F /Q "%%x\AppData\Roaming\Microsoft\Windows\IECompatCache\index.dat"
		rem IF EXIST "%%x\AppData\Roaming\Microsoft\Windows\Recent\" del /S /F /Q "%%x\AppData\Roaming\Microsoft\Windows\Recent\"
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\Extension State\*.log" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Extension State\*.log"		
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\*\t\Paths\" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\*\t\Paths\*.log"
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\Origins\" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\Origins\*.log"
		IF EXIST "%%x\AppData\LocalLow\Sun\Java\jre1.8.0_40\" del /S /F /Q "%%x\AppData\LocalLow\Sun\Java\jre1.8.0_40\*.cab"
		IF EXIST "%%x\AppData\LocalLow\Sun\Java\jre1.8.0_40\" del /S /F /Q "%%x\AppData\LocalLow\Sun\Java\jre1.8.0_40\*.msi"
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\Cache\" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Cache\"
		IF EXIST "%%x\AppData\Local\Google\CrashReports\" del /S /F /Q "%%x\AppData\Local\Google\CrashReports\"
		IF EXIST "%%x\AppData\Local\Adobe\Acrobat\11.0\Cache\" del /S /F /Q "%%x\AppData\Local\Adobe\Acrobat\11.0\Cache\"
		IF EXIST "%%x\AppData\Roaming\Macromedia\Flash Player\#SharedObjects\" del /S /F /Q "%%x\AppData\Roaming\Macromedia\Flash Player\#SharedObjects\"
		IF EXIST "%%x\AppData\Roaming\Adobe\Flash Player\AssetCache\" del /S /F /Q "%%x\AppData\Roaming\Adobe\Flash Player\AssetCache\"
		IF EXIST "%%x\AppData\LocalLow\Microsoft\Silverlight\is\" del /S /F /Q "%%x\AppData\LocalLow\Microsoft\Silverlight\is\"
		IF EXIST "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_1024.db" del /S /F /Q "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_1024.db"
		IF EXIST "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_256.db" del /S /F /Q "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_256.db"
		IF EXIST "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_32.db" del /S /F /Q "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_32.db"
		IF EXIST "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_96.db" del /S /F /Q "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_96.db"
		IF EXIST "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_idx.db" del /S /F /Q "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_idx.db"
		IF EXIST "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_sr.db" del /S /F /Q "%%x\AppData\Local\Microsoft\Windows\Explorer\thumbcache_sr.db"
		IF EXIST "%%x\.Thumbnails\" del /S /F /Q "%%x\.Thumbnails\"
		IF EXIST "%%x\AppData\Local\MigWiz\debug.log" del /S /F /Q "%%x\AppData\Local\MigWiz\debug.log"
		IF EXIST "%%x\AppData\Local\MigWiz\setupact.log" del /S /F /Q "%%x\AppData\Local\MigWiz\debug.log"
		IF EXIST "%%x\AppData\Local\MigWiz\setuperr.log" del /S /F /Q "%%x\AppData\Local\MigWiz\debug.log"
		IF EXIST "%%x\AppData\Local\MigWiz\diagerr.xml" del /S /F /Q "%%x\AppData\Local\MigWiz\debug.log"
		IF EXIST "%%x\AppData\Local\MigWiz\diagwrn.xml" del /S /F /Q "%%x\AppData\Local\MigWiz\debug.log"
		IF EXIST "%%x\AppData\Local\MigWiz\MigLog.xml" del /S /F /Q "%%x\AppData\Local\MigWiz\debug.log"
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\Application Cache\Cache\" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Application Cache\Cache\*.*"
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\Extension State\LOG.old" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Extension State\LOG.old"
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\*.log"
		IF EXIST "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\Origins\" del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\File System\Origins\*.log"
		

rem 	del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Visited Links\"
rem 	del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Current Tabs\"
rem 	del /S /F /Q "%%x\AppData\Local\Google\Chrome\User Data\Default\Last Tabs\"
    )
)


rem 							wersja dla XP
IF EXIST "C:\Documents and Settings\" (
     for /D %%x in ("C:\Documents and Settings\*") do ( 
         del /f /s /q "%%x\Ustawienia lokalne\Temp\" 
         del /f /s /q "%%x\Ustawienia lokalne\Temporary Internet Files\" 
	IF EXIST "%%x\Ustawienia lokalne\Dane aplikacji\Google\Chrome\User Data\Default\Application Cache\Cache\" del /S /F /Q "%%x\Ustawienia lokalne\Dane aplikacji\Google\Chrome\User Data\Default\Application Cache\Cache\*.*"
		IF EXIST "%%x\Ustawienia lokalne\Dane aplikacji\Google\Chrome\User Data\Default\Extension State\LOG.old" del /S /F /Q "%%x\Ustawienia lokalne\Dane aplikacjil\Google\Chrome\User Data\Default\Extension State\LOG.old"
		IF EXIST "%%x\Ustawienia lokalne\Dane aplikacji\Google\Chrome\User Data\Default\File System\" del /S /F /Q "%%x\Ustawienia lokalne\Dane aplikacji\Google\Chrome\User Data\Default\File System\*.log"
		IF EXIST "%%x\Ustawienia lokalne\Dane aplikacji\Google\Chrome\User Data\Default\File System\Origins\" del /S /F /Q "%%x\Ustawienia lokalne\Dane aplikacji\Google\Chrome\User Data\Default\File System\Origins\*.log"
	 rem del /f /s /q "%%x\Ustawienia lokalne\
	
     

	)
)

cd\
del thumbs.db /a /s
del .DS_Store /a /s
for /F "tokens=2 delims=:" %%a in ('fsutil volume diskfree C: ^| find /i "wolnych"') do set bytes=%%a
set /A MBafter=%bytes:~0,-3%/1024*1000/1024   rem /1024
echo Ilosc wolnego miejsca na dysku C przed zmiana %MBb4% Megabajtow
echo Ilosc wolnego miejsca na dysku C po zmianie %MBafter% Megabajtow
set /a roznica = "%MBafter%-%MBb4%"
echo Odzyskanych Megabajtow: %roznica% 
pause


