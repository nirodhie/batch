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
robocopy "c:\users\%usernameold%\AppData\Roaming" "c:\Users\%usernamenew%\AppData\Roaming"  /E /MIR /ZB /XA:H /b /fft /r:0 /MOV /NDL  /XD "McAffee" "Media Center Programs", "Sun", "Microsoft" /xf "desktop.ini"
robocopy "c:\users\%usernameold%\AppData\Roaming\Microsoft" "c:\Users\%usernamenew%\AppData\Roaming\Microsoft"  /b /fft /r:0 /MOV /NDL /E /MIR /ZB /NDL  /XD "Crypto" /XD "HTML Help" /XD "Protect" /XD "Windows" /XD "Outlook" /XD "Internet Explorer"   /xf "desktop.ini"
robocopy "c:\users\%usernameold%\AppData\Roaming\Microsoft\Windows" "c:\Users\%usernamenew%\AppData\Roaming\Microsoft\Windows"    /b /fft /r:0 /MOV /NDL /E /MIR /ZB /NDL  /XD "Start Menu" /xf "desktop.ini"
del /S /F /Q    "c:\users\%usernameold%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
robocopy "c:\users\%usernameold%\AppData\Local" "c:\Users\%usernamenew%\AppData\Local"  /E /MIR /ZB /XA:H /b /fft /r:0 /MOV /NDL  /XD "Microsoft" /XD  "Spotify" /XD  "Temp" /XD "Application Data" /XD "Temporary Internet Files" /XD "Cache" /xf "desktop.ini"
robocopy "c:\users\%usernameold%\AppData\Local\Microsoft" "c:\Users\%usernamenew%\AppData\Local\Microsoft"  /E /MIR /ZB /XA:H /b /fft /r:0 /MOV /NDL  /XD "Windows" /xf "desktop.ini"/xf "*.ost"
robocopy "c:\users\%usernameold%\AppData\Local\Microsoft\Windows" "c:\Users\%usernamenew%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0 /MOV /NDL  /XD "Windows" /XD "Temporary Internet Files"  /xf "desktop.ini"
robocopy "c:\users\%usernameold%\AppData\LocalLow" "c:\Users\%usernamenew%\AppData\LocalLow"  /E /MIR /Z /XA:H /b /fft /r:0 /MOV /NDL /xf "desktop.ini"


goto end



:end

rem del %0