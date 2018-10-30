@echo off
@chcp 852
:1


echo program musi byc uruchomiony z konta z prawami admina
echo.

echo dostepne konta uzytkownikow:
echo.






robocopy "c:\users\%username%.old" "c:\users\%username%"/E /ZB /XA:H /b /fft /r:0  /NDL  /XD "AppData" /XD "Application Data"  /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf desktop.ini /xf *.scl /xf HELP_DECRYPT_YOUR_FILES.* /mov
robocopy "c:\Users\%username%.old\AppData\Roaming" "c:\users\%username%\AppData\Roaming" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "McAffee", "Media Center Programs", "Sun", "Microsoft" /xf desktop.ini /xf *.scl /mov
robocopy "c:\Users\%username%.old\AppData\Roaming\Microsoft" "c:\users\%username%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "Crypto", "HTML Help", "Protect", "Windows" /xf desktop.ini /xf *.scl /mov
robocopy "c:\Users\%username%.old\AppData\Roaming\Microsoft\Windows" "c:\users\%username%\AppData\Roaming\Microsoft\Windows"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf desktop.ini /xf *.scl /mov

del /S /F /Q    "c:\Users\%username%.old\AppData\Local\Google\Chrome\User Data\Default\Cache\"

robocopy "c:\Users\%username%.old\AppData\Local" "c:\users\%username%\AppData\Local" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Microsoft" /XD  "Temp" /XD "Application Data" /XD "Temporary Internet Files" /XD "c:\users\%usernew%\AppData\Local\Google\Chrome\User Data\Default\Cache" /xf desktop.ini /xf *.scl /xf *.ost /mov
robocopy "c:\Users\%username%.old\AppData\Local\Microsoft" "c:\users\%username%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /xf desktop.ini"/xf *.scl /xf *.ost /mov
robocopy "c:\Users\%username%.old\AppData\Local\Microsoft\Windows" "c:\users\%username%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /XD "Temporary Internet Files"  /xf desktop.ini /xf *.scl /mov
robocopy "c:\Users\%username%.old\AppData\LocalLow" "c:\users\%username%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf desktop.ini /xf *.scl /mov

goto end



:end

