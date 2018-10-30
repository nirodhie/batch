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


net use B: \\EPOL32LXJ14JT32\c$

 
%~dp0shadowspawn.exe "c:\users\%username%" a: robocopy a:\  "b:\users\%username%" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "a:\AppData" /XD "a:\Application Data" /XD "a:\Cookies" /XD "a:\Local Settings" /XD "a:\NetHood" /XD "a:\PrintHood" /XD "a:\SendTo" /XD "a:\Start Menu" /XD "a:\Templates" /xf "a:\desktop.ini" /xf "a:\ProfileShadowSpawnZeStaregoPC.bat" /xf "a:\ShadowSpawn.exe" /W:1 /xo
%~dp0shadowspawn.exe "c:\users\%username%" a: robocopy a:\  "b:\users\%username%.bdx\appdata\local\Lotus" "c:\users\%username%\appdata\local\Lotus" /E /ZB /XA:H /b /fft /r:0  /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf "desktop.ini"
del /S /F /Q "b:\users\%username%.bdx\AppData\Local\Google\Chrome\User Data\Default\Cache\"
%~dp0shadowspawn.exe "c:\users\%username%" a: robocopy a:\  "b:\users\%username%.bdx\appdata\local\Google\Chrome" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"
%~dp0shadowspawn.exe "c:\users\%username%" a: robocopy a:\  "b:\users\%username%.bdx\appdata\local\Microsoft\office" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"
%~dp0shadowspawn.exe "c:\users\%username%" a: robocopy a:\  "b:\users\%username%.bdx\appdata\local\Microsoft\onenote" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"




del /S /F /Q  "b:\users\%username%\desktop\ProfileShadowSpawnZeStaregoPC.bat"
del /S /F /Q  "b:\users\%username%\desktop\shadowspawn.exe"
rem del %0
pause