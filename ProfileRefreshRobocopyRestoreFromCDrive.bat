@echo off
@chcp 852
:1

echo program uruchomiono jako 
echo uzytkownik musi miec admina
echo uruchamiamy na nowym koncie
echo.

rem echo dostepne konta uzytkownikow:
rem echo.
rem cd /d %0\..
rem dir b:\users\  /b
rem pause
rem echo.
rem echo wybierz stary profil  z listy powyzej
rem set /p user="> "

pause



robocopy "c:\ProfileBackup\%username%" "c:\users\%username%" /E /ZB /XA:H /b /fft /r:0  /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "tart Menu" /XD "Templates" /xf "desktop.ini"
robocopy "c:\ProfileBackup\%username%\AppData\Roaming" "c:\users\%username%\AppData\Roaming"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "McAffee" "Media Center Programs", "Sun", "Microsoft" /xf "desktop.ini"
robocopy "c:\ProfileBackup\%username%\AppData\Roaming\Microsoft" "c:\users\%username%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "Crypto" /XD "HTML Help" /XD "Protect" /XD "Windows" /XD "Outlook" /xf "desktop.ini"
robocopy "c:\ProfileBackup\%username%\AppData\Roaming\Microsoft\Windows" "c:\users\%username%\AppData\Roaming\Microsoft\Windows"   /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf "desktop.ini"
robocopy "c:\ProfileBackup\%username%\AppData\Local" "c:\users\%username%\AppData\Local" "c:\ProfileBackup\%username%\AppData\Local"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Microsoft" /XD  "Spotify" /XD  "Temp" /XD "Application Data" /XD "Temporary Internet Files" /XD "Cache" /xf "desktop.ini"
robocopy "c:\ProfileBackup\%username%\AppData\Local\Microsoft" "c:\users\%username%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /xf "desktop.ini"/xf "*.ost"
robocopy "c:\ProfileBackup\%username%\AppData\Local\Microsoft\Windows" "c:\users\%username%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /XD "Temporary Internet Files"  /xf "desktop.ini"
robocopy "c:\ProfileBackup\%username%\AppData\LocalLow" "c:\users\%username%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "desktop.ini"


goto end



:end

rem del %0