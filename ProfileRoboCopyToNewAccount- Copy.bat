@echo off
@chcp 852
:1
net use A: /delete
net use B: /delete

echo program uruchomiono jako %username%
echo program uruchamiamy na nowym koncie i kopiujemy dane ze starego
echo uzytkownik MUSI miec uprawnienia administratora
net localgroup "Administrators"

echo dostepne konta uzytkownikow:
echo.

rem cd /d %0\..

dir c:\users\  /b
echo.
echo podaj nazwe starego konta
set /p user="> "


rem net use B: \\DTPOLBN7001\ossprv$\ProfileBackup


robocopy "c:\users\%user%" "c:\users\%username%" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\users\%user%\AppData" /XD "c:\users\%user%\Application Data" /XD "c:\users\%user%\AppData" /XD "c:\users\%user%\Application Data" /XD "c:\users\%user%\Cookies" /XD "c:\users\%user%\Local Settings" /XD "c:\users\%user%\NetHood" /XD "c:\users\%user%\PrintHood" /XD "c:\users\%user%\SendTo" /XD "c:\users\%user%\Start Menu" /XD "c:\users\%user%\Templates" /xf desktop.ini /xf *.scl /xf HELP_DECRYPT_YOUR_FILES.*
robocopy "c:\Users\%user%\AppData\Roaming" "c:\users\%username%\AppData\Roaming" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\users\%user%\McAffee", "c:\users\%user%\Media Center Programs", "c:\users\%user%\Sun", "c:\users\%user%\Microsoft" /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\Roaming\Microsoft" "c:\users\%username%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "c:\users\%user%\Crypto", "c:\users\%user%\HTML Help", "c:\users\%user%\Protect", "c:\users\%user%\Windows" /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\Roaming\Microsoft\Windows" "c:\users\%username%\AppData\Roaming\Microsoft\Windows"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf desktop.ini /xf *.scl
del /S /F /Q    "c:\Users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
robocopy "c:\Users\%user%\AppData\Local" "c:\users\%username%\AppData\Local" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\Users\%user%\AppData\Local\Microsoft" /XD  "c:\Users\%user%\AppData\Local\Temp" /XD "c:\Users\%user%\AppData\Local\Application Data" /XD "c:\Users\%user%\AppData\Local\Temporary Internet Files" /XD "c:\Users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache" /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\Local\Microsoft" "c:\users\%username%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\Users\%user%\AppData\Local\Microsoft\Windows" /xf desktop.ini"/xf *.scl
robocopy "c:\Users\%user%\AppData\Local\Microsoft\Windows" "c:\users\%username%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\Users\%user%\AppData\Local\Microsoft\Windows\Windows" /XD "c:\Users\%user%\AppData\Local\Microsoft\Windows\Temporary Internet Files"  /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\LocalLow" "c:\users\%username%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf desktop.ini /xf *.scl

goto end



:end
pause
