@echo off
@chcp 852
:1
echo program trzeba uruchomic jako hcl**********
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

net use b: /delete 
net use B: \\dtpolbn7001\ossprv$\profilebackup

 
%~dp0shadowspawn.exe "c:\users\%username%" a: robocopy a:\  "b:\%username%" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\AppData" /XD "a:\Application Data" /XD "a:\Cookies" /XD "a:\Local Settings" /XD "a:\NetHood" /XD "a:\PrintHood" /XD "a:\SendTo" /XD "a:\Start Menu" /XD "a:\Templates" /xf "a:\desktop.ini" /xf "a:\ProfileShadowSpawnZeStaregoPC.bat" /xf "a:\ShadowSpawn.exe" 
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Roaming" a: robocopy a:\  "b:\%username%\AppData\Roaming" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\McAffee", "a:\Media Center Programs", "a:\Sun", "a:\Microsoft" /xf "a:\desktop.ini"
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Roaming\Microsoft" a: robocopy a:\  "b:\%username%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "a:\Crypto", "a:\HTML Help", "a:\Protect", "a:\Windows" /xf "a:\desktop.ini"
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Roaming\Microsoft\Windows" a: robocopy a:\  "b:\%username%\AppData\Roaming\Microsoft\Windows"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf "a:\desktop.ini"
del /S /F /Q    "c:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Local" a: robocopy a:\  "b:\%username%\AppData\Local" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Microsoft" /XD  "a:\Temp" /XD "a:\Application Data" /XD "a:\Temporary Internet Files" /XD "a:\Google\Chrome\User Data\Default\Cache" /xf "a:\desktop.ini"
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Local\Microsoft" a: robocopy a:\  "b:\%username%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /xf "a:\desktop.ini"
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\Local\Microsoft\Windows" a: robocopy a:\  "b:\%username%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\Windows" /XD "a:\Temporary Internet Files"  /xf "a:\desktop.ini"
%~dp0shadowspawn.exe "c:\Users\%username%\AppData\LocalLow" a: robocopy a:\  "b:\%username%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "a:\desktop.ini"


del /S /F /Q  "b:\users\%username%\desktop\ProfileBackupUsingShadowSpawnToOSSserver.bat"
del /S /F /Q  "b:\users\%username%\desktop\shadowspawn.exe"

