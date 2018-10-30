@echo off
@chcp 852
net use a: /delete /yes
net use b: /delete /yes
:1
echo program trzeba uruchomic jako CybWKSEUCentral
echo program uruchomiono jako 
echo uzytkownik NIE MUSI sie wylogowywac ani zamykac zadnego programu
echo ale wtedy skopiowana wersja nie bedzie najnowsza
echo jesli dokona zmian w trakcie backupu
echo.
echo dostepne konta uzytkownikow:
echo.
rem cd /d %0\..
rem dir c:\users\  /b
rem echo.
rem echo wybierz profil ktory chcesz skopiowac z listy powyzej
rem set /p user="> "
rem echo podaj nazwe komputera na ktory przenosimy profil
rem set /p target="> "


net use B: \\enor01lx9ts3k72\c$

 
%~dp0shadowspawn.exe "c:\users\%username%" a: robocopy a:\  "b:\users\%username%" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\AppData" /XD "a:\Application Data" /XD "a:\Cookies" /XD "a:\Local Settings" /XD "a:\NetHood" /XD "a:\PrintHood" /XD "a:\SendTo" /XD "a:\Start Menu" /XD "a:\Templates" /xf "a:\desktop.ini" /xf "a:\ProfileShadowSpawnZeStaregoPC.bat" /xf "a:\ShadowSpawn.exe" /W:1 /xo
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Roaming" a: robocopy a:\  "b:\users\%username%\AppData\Roaming" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\McAffee", "a:\Media Center Programs", "a:\Sun", "a:\Microsoft" /xf "a:\desktop.ini" /W:1 /xo
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Roaming\Microsoft" a: robocopy a:\  "b:\users\%username%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "a:\Crypto", "a:\HTML Help", "a:\Protect", "a:\Windows", "a:\Internet Explorer", "a:/Outlook" /xf "a:\desktop.ini" /W:1 /xo
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Roaming\Microsoft\Windows" a: robocopy a:\  "b:\users\%username%\AppData\Roaming\Microsoft\Windows" /XD "a:\Start Menu" /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf "a:\desktop.ini" /W:1 /xo
del /S /F /Q    "c:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Local" a: robocopy a:\  "b:\users\%username%\AppData\Local" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Microsoft" /XD  "a:\Temp" /XD "a:\Application Data" /XD "a:\Temporary Internet Files" /XD "a:\Google\Chrome\User Data\Default\Cache" /xf "a:\desktop.ini" /W:1 /xo
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Local\Microsoft" a: robocopy a:\  "b:\users\%username%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /xf "a:\desktop.ini" /W:1 /xo
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Local\Microsoft\Windows" a: robocopy a:\  "b:\users\%username%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /XD "a:\Temporary Internet Files"  /xf "a:\desktop.ini" /W:1 /xo
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\LocalLow" a: robocopy a:\  "b:\users\%username%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "a:\desktop.ini" /W:1 /xo

rem %~dp0shadowspawn.exe "c:\" a: robocopy a:\  "b:" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\$RECYCLE.BIN" /XD "a:\Diskeeper" /XD "a:\Documents and Settings" /XD "a:\MSOCache" /XD "a:\Perflogs" /XD "a:\Program Files" /XD "a:\Program Files (x86)" /XD "a:\ProgramData" /XD "a:\Recovery"  /XD "a:\System Volume Information" /XD "a:\temp" /XD "a:\Users" /XD "a:\Windows" /XD "a:\BDSETUP"  /XD "a:\BDAPPS" /xf "a:\pagefile.sys" /xf "a:\hiberfil.sys" /xf "a:\desktop.ini"  /W:1 /xo
%~dp0shadowspawn.exe "c:\ProgramData" a: robocopy a:\  "b:\ProgramData" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Application Data" /XD "a:\1E" /XD "a:\Desktop" /XD "a:\Documents" /XD "a:\Favorites" /XD "a:\McAfee" /XD "a:\Package Cache" /XD "a:\Start Menu" /XD "a:\System Time" /XD "a:\Templates"  /XD "a:\Microsoft" /xf "a:\desktop.ini" /W:1 /xo
%~dp0shadowspawn.exe "c:\ProgramData\Microsoft" a: robocopy a:\  "b:\ProgramData\Microsoft" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Assistance" /XD "a:\Crypto" /XD "a:\Device Stage" /XD "a:\Device Sync" /XD "a:\Diagnosis" /XD "a:\DRM" /XD "a:\Event Viewer" /XD "a:\Group Policy" /XD "a:\Vault"   /xf "a:\desktop.ini" /W:1 /xo


del /S /F /Q  "b:\users\%username%\desktop\ProfileShadowSpawnZeStaregoPC.bat"
del /S /F /Q  "b:\users\%username%\desktop\shadowspawn.exe"
rem del %0
