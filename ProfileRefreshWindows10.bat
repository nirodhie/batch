@echo off
@chcp 852
:1

echo dostepne konta uzytkownikow:
echo.
cd /d %0\..
dir c:\users\  /b
pause
echo.
echo wybierz stary profil z listy powyzej
set /p usernameold="> "
echo wybierz nowy profil z listy powyzej
set /p usernamenew="> "




robocopy "c:\users\%usernameold%" "c:\users\%usernamenew%" /E /ZB /XA:H /b /fft /r:0 /MOV /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf "desktop.ini"
robocopy "c:\users\%usernameold%\appdata\local\Lotus" "c:\users\%usernamenew%\appdata\local\Lotus" /E /ZB /XA:H /b /fft /r:0 /mov /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf "desktop.ini"
robocopy "c:\users\%usernameold%\AppData\Roaming\Microsoft\Windows" "c:\Users\%usernamenew%\AppData\Roaming\Microsoft\Windows"    /b /fft /r:0 /MOV /NDL /E /MIR /ZB /NDL  /XD "Start Menu" /xf "desktop.ini"
del /S /F /Q    "c:\users\%usernameold%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
robocopy "c:\users\%usernameold%\AppData\Local\Google\Chrome" "c:\Users\%usernamenew%\AppData\Local\Google\Chrome"  /E /MIR /ZB /XA:H /b /fft /r:0 /MOV /NDL  /XD "Microsoft" /XD  "Spotify" /XD  "Temp" /XD "Application Data" /XD "Temporary Internet Files" /XD "Cache" /xf "desktop.ini"
robocopy "c:\users\%usernameold%\AppData\Local\Microsoft\office" "c:\Users\%usernamenew%\AppData\Local\Microsoft\office"  /E /MIR /ZB /XA:H /b /fft /r:0 /MOV /NDL  /XD "Windows" /xf "desktop.ini"/xf "*.ost"
robocopy "c:\users\%usernameold%\AppData\Local\Microsoft\onenote" "c:\Users\%usernamenew%\AppData\Local\Microsoft\onenote" /E /MIR /ZB /XA:H /b /fft /r:0 /MOV /NDL  /XD "Windows" /XD "Temporary Internet Files"  /xf "desktop.ini"







goto end
rem robocopy "b:\users\%username%" "c:\users\%username%" /E /ZB /XA:H /b /fft /r:0  /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf "desktop.ini"
rem robocopy "b:\users\%username%\appdata\local\Lotus" "c:\users\%username%\appdata\local\Lotus" /E /ZB /XA:H /b /fft /r:0  /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf "desktop.ini"
rem del /S /F /Q "b:\users\%username%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
rem robocopy "b:\users\%username%\appdata\local\Google\Chrome" "c:\users\%username%\appdata\local\Google\Chrome" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"
rem robocopy "b:\users\%username%\appdata\local\Microsoft\office" "c:\users\%username%\appdata\local\Microsoft\office" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"
rem robocopy "b:\users\%username%\appdata\local\Microsoft\onenote" "c:\users\%username%\appdata\local\Microsoft\onenote" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"



:end

rem del %0