@echo OFF

pushd "%~dp0"

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

if %OS%==32BIT goto  :32bit
if %OS%==64BIT goto  :64bit




:32bit
@chcp 852
rem 
net use B: /delete
:1
echo program uruchomiono jako 
echo uzytkownik NIE MUSI sie wylogowywac ani zamykac zadnego programu
echo ale wtedy skopiowana wersja nie bedzie najnowsza
echo jesli dokona zmian w trakcie backupu
echo.
rem echo podaj nazwe komputera z ktorego chcesz skopiowac dane
rem set /p source="> "

echo dostepne konta uzytkownikow:
echo.
rem cd /d %0\..
dir c:\users\  /b
echo.
echo wybierz profil ktory chcesz skopiowac z listy powyzej
set /p user="> "


net use B: \\DTPOLBN7001\ossprv$\ProfileBackup


shadowspawnx86.exe "c:\users\%user%" a: robocopy a:\  "b:\%user%" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\AppData" /XD "a:\Application Data" /XD "a:\Cookies" /XD "a:\Local Settings" /XD "a:\NetHood" /XD "a:\PrintHood" /XD "a:\SendTo" /XD "a:\Start Menu" /XD "a:\Templates" /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\Users\%user%\AppData\Roaming" a: robocopy a:\  "b:\%user%\AppData\Roaming" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\McAffee", "a:\Media Center Programs", "a:\Sun", "a:\Microsoft" /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\Users\%user%\AppData\Roaming\Microsoft" a: robocopy a:\  "b:\%user%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "a:\Crypto", "a:\HTML Help", "a:\Protect", "a:\Windows" /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\Users\%user%\AppData\Roaming\Microsoft\Windows" a: robocopy a:\  "b:\%user%\AppData\Roaming\Microsoft\Windows"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf "a:\desktop.ini"
del /S /F /Q    "c:\Users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
shadowspawnx86.exe "c:\Users\%user%\AppData\Local" a: robocopy a:\  "b:\%user%\AppData\Local" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Microsoft" /XD  "a:\Temp" /XD "a:\Application Data" /XD "a:\Temporary Internet Files" /XD "a:\Google\Chrome\User Data\Default\Cache" /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\Users\%user%\AppData\Local\Microsoft" a: robocopy a:\  "b:\%user%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\Users\%user%\AppData\Local\Microsoft\Windows" a: robocopy a:\  "b:\%user%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /XD "a:\Temporary Internet Files"  /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\Users\%user%\AppData\LocalLow" a: robocopy a:\  "b:\%user%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "a:\desktop.ini"

shadowspawnx86.exe "c:\" a: robocopy a:\  "b:\%user%\C" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\$RECYCLE.BIN" /XD "a:\Diskeeper" /XD "a:\Documents and Settings" /XD "a:\MSOCache" /XD "a:\Perflogs" /XD "a:\Program Files" /XD "a:\Program Files (x86)" /XD "a:\ProgramData" /XD "a:\Recovery"  /XD "a:\System Volume Information" /XD "a:\temp" /XD "a:\Users" /XD "a:\Windows" /XD "a:\BDSETUP"  /XD "a:\BDAPPS" /xf "a:\pagefile.sys" /xf "a:\hiberfil.sys" /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\ProgramData" a: robocopy a:\  "b:\%user%\C\ProgramData" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Application Data" /XD "a:\1E" /XD "a:\Desktop" /XD "a:\Documents" /XD "a:\Favorites" /XD "a:\McAfee" /XD "a:\Package Cache" /XD "a:\Start Menu" /XD "a:\System Time" /XD "a:\Templates"  /XD "a:\Microsoft" /xf "a:\desktop.ini"
shadowspawnx86.exe "c:\ProgramData\Microsoft" a: robocopy a:\  "b:\%user%\C\ProgramData\Microsoft" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Assistance" /XD "a:\Crypto" /XD "a:\Device Stage" /XD "a:\Device Sync" /XD "a:\Diagnosis" /XD "a:\DRM" /XD "a:\Event Viewer" /XD "a:\Group Policy" /XD "a:\Vault"   /xf "a:\desktop.ini"
goto end



goto :end


:64bit
@chcp 852
net use z: /delete
net use B: /delete
:1
echo program uruchomiono jako 
echo uzytkownik NIE MUSI sie wylogowywac ani zamykac zadnego programu
echo ale wtedy skopiowana wersja nie bedzie najnowsza
echo jesli dokona zmian w trakcie backupu
echo.
rem echo podaj nazwe komputera z ktorego chcesz skopiowac dane
rem set /p source="> "

echo dostepne konta uzytkownikow:
echo.
rem cd /d %0\..
@echo on
dir c:\users\  /b
echo.
echo wybierz profil ktory chcesz skopiowac z listy powyzej
set /p user="> "


net use B: \\DTPOLBN7001\ossprv$\ProfileBackup


shadowspawn.exe "c:\users\%user%" a: robocopy a:\  "b:\%user%" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\AppData" /XD "a:\Application Data" /XD "a:\Cookies" /XD "a:\Local Settings" /XD "a:\NetHood" /XD "a:\PrintHood" /XD "a:\SendTo" /XD "a:\Start Menu" /XD "a:\Templates" /xf "a:\desktop.ini"
shadowspawn.exe "c:\Users\%user%\AppData\Roaming" a: robocopy a:\  "b:\%user%\AppData\Roaming" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\McAffee", "a:\Media Center Programs", "a:\Sun", "a:\Microsoft" /xf "a:\desktop.ini"
shadowspawn.exe "c:\Users\%user%\AppData\Roaming\Microsoft" a: robocopy a:\  "b:\%user%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "a:\Crypto", "a:\HTML Help", "a:\Protect", "a:\Windows" /xf "a:\desktop.ini"
shadowspawn.exe "c:\Users\%user%\AppData\Roaming\Microsoft\Windows" a: robocopy a:\  "b:\%user%\AppData\Roaming\Microsoft\Windows"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf "a:\desktop.ini"
del /S /F /Q    "c:\Users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
shadowspawn.exe "c:\Users\%user%\AppData\Local" a: robocopy a:\  "b:\%user%\AppData\Local" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Microsoft" /XD  "a:\Temp" /XD "a:\Application Data" /XD "a:\Temporary Internet Files" /XD "a:\Google\Chrome\User Data\Default\Cache" /xf "a:\desktop.ini"
shadowspawn.exe "c:\Users\%user%\AppData\Local\Microsoft" a: robocopy a:\  "b:\%user%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /xf "a:\desktop.ini"
shadowspawn.exe "c:\Users\%user%\AppData\Local\Microsoft\Windows" a: robocopy a:\  "b:\%user%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /XD "a:\Temporary Internet Files"  /xf "a:\desktop.ini"
shadowspawn.exe "c:\Users\%user%\AppData\LocalLow" a: robocopy a:\  "b:\%user%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "a:\desktop.ini"

shadowspawn.exe "c:\" a: robocopy a:\  "b:\%user%\C" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\$RECYCLE.BIN" /XD "a:\Diskeeper" /XD "a:\Documents and Settings" /XD "a:\MSOCache" /XD "a:\Perflogs" /XD "a:\Program Files" /XD "a:\Program Files (x86)" /XD "a:\ProgramData" /XD "a:\Recovery"  /XD "a:\System Volume Information" /XD "a:\temp" /XD "a:\Users" /XD "a:\Windows" /XD "a:\BDSETUP"  /XD "a:\BDAPPS" /xf "a:\pagefile.sys" /xf "a:\hiberfil.sys" /xf "a:\desktop.ini"
shadowspawn.exe "c:\ProgramData" a: robocopy a:\  "b:\%user%\C\ProgramData" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Application Data" /XD "a:\1E" /XD "a:\Desktop" /XD "a:\Documents" /XD "a:\Favorites" /XD "a:\McAfee" /XD "a:\Package Cache" /XD "a:\Start Menu" /XD "a:\System Time" /XD "a:\Templates"  /XD "a:\Microsoft" /xf "a:\desktop.ini"
shadowspawn.exe "c:\ProgramData\Microsoft" a: robocopy a:\  "b:\%user%\C\ProgramData\Microsoft" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Assistance" /XD "a:\Crypto" /XD "a:\Device Stage" /XD "a:\Device Sync" /XD "a:\Diagnosis" /XD "a:\DRM" /XD "a:\Event Viewer" /XD "a:\Group Policy" /XD "a:\Vault"   /xf "a:\desktop.ini"
goto end



goto :end



:end
popd
pause