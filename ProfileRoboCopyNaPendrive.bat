@echo off
@chcp 852
:1
net use A: /delete
net use B: /delete

echo program uruchomiono jako %username%
echo uzytkownik NIE MUSI sie wylogowywac ani zamykac zadnego programu
echo ale wtedy skopiowana wersja nie bedzie najnowsza
echo jesli dokona zmian w trakcie backupu
echo.
rem echo podaj nazwe komputera z ktorego trzeba skopiowac dane na \\DTPOLBN7001\ossprv$\ProfileBackup
rem set /p source ="> "
rem net use a: \\ltpolan7161\C$
echo dostepne konta uzytkownikow:
echo.

rem cd /d %0\..

dir c:\users\  /b
echo.
echo wybierz profil ktory chcesz skopiowac z listy powyzej
set /p user="> "
echo wybierz litere napedu na jaki kopiujemy dane uzytkownika
set /p drive="> "

robocopy "c:\users\%user%" "%drive%:\Profilebackup\%user%" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\users\%user%\AppData" /XD "c:\users\%user%\Application Data" /XD "c:\users\%user%\AppData" /XD "c:\users\%user%\Application Data" /XD "c:\users\%user%\Cookies" /XD "c:\users\%user%\Local Settings" /XD "c:\users\%user%\NetHood" /XD "c:\users\%user%\PrintHood" /XD "c:\users\%user%\SendTo" /XD "c:\users\%user%\Start Menu" /XD "c:\users\%user%\Templates" /xf desktop.ini /xf *.scl /xf HELP_DECRYPT_YOUR_FILES.*
robocopy "c:\Users\%user%\AppData\Roaming" "%drive%:\Profilebackup\%user%\AppData\Roaming" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\users\%user%\McAffee", "c:\users\%user%\Media Center Programs", "c:\users\%user%\Sun", "c:\users\%user%\Microsoft" /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\Roaming\Microsoft" "%drive%:\Profilebackup\%user%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "c:\users\%user%\Crypto", "c:\users\%user%\HTML Help", "c:\users\%user%\Protect", "c:\users\%user%\Windows" /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\Roaming\Microsoft\Windows" "%drive%:\Profilebackup\%user%\AppData\Roaming\Microsoft\Windows"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL   /xf desktop.ini /xf *.scl
del /S /F /Q    "c:\Users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
robocopy "c:\Users\%user%\AppData\Local" "%drive%:\Profilebackup\%user%\AppData\Local" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\Users\%user%\AppData\Local\Microsoft" /XD  "c:\Users\%user%\AppData\Local\Temp" /XD "c:\Users\%user%\AppData\Local\Application Data" /XD "c:\Users\%user%\AppData\Local\Temporary Internet Files" /XD "c:\Users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache" /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\Local\Microsoft" "%drive%:\Profilebackup\%user%\AppData\Local\Microsoft" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\Users\%user%\AppData\Local\Microsoft\Windows" /xf desktop.ini"/xf *.scl
robocopy "c:\Users\%user%\AppData\Local\Microsoft\Windows" "%drive%:\Profilebackup\%user%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\Users\%user%\AppData\Local\Microsoft\Windows\Windows" /XD "c:\Users\%user%\AppData\Local\Microsoft\Windows\Temporary Internet Files"  /xf desktop.ini /xf *.scl
robocopy "c:\Users\%user%\AppData\LocalLow" "%drive%:\Profilebackup\%user%\AppData\LocalLow" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf desktop.ini /xf *.scl
robocopy "c:\" "%drive%:\Profilebackup\%user%\C" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\$RECYCLE.BIN" /XD "c:\Diskeeper" /XD "c:\Documents and Settings" /XD "c:\MSOCache" /XD "c:\Perflogs" /XD "c:\Program Files" /XD "c:\Program Files (x86)" /XD "c:\ProgramData" /XD "c:\Recovery"  /XD "c:\System Volume Information" /XD "c:\temp" /XD "c:\Users" /XD "c:\Windows" /XD "c:\BDSETUP"  /XD "c:\BDAPPS" /xf "c:\pagefile.sys" /xf "c:\hiberfil.sys" /xf desktop.ini /xf *.scl
robocopy "c:\ProgramData" "%drive%:\Profilebackup\%user%\C\ProgramData" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\ProgramData\Application Data" /XD "c:\ProgramData\1E" /XD "c:\ProgramData\Desktop" /XD "c:\ProgramData\Documents" /XD "c:\ProgramData\Favorites" /XD "c:\ProgramData\McAfee" /XD "c:\ProgramData\Package Cache" /XD "c:\ProgramData\Start Menu" /XD "c:\ProgramData\System Time" /XD "c:\ProgramData\Templates"  /XD "c:\ProgramData\Microsoft" /xf desktop.ini /xf *.scl
robocopy "c:\ProgramData\Microsoft" "%drive%:\Profilebackup\%user%\C\ProgramData\Microsoft" /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "c:\ProgramData\Microsoft\Assistance" /XD "c:\ProgramData\Microsoft\Crypto" /XD "c:\ProgramData\Microsoft\Device Stage" /XD "c:\ProgramData\Microsoft\Device Sync" /XD "c:\ProgramData\Microsoft\Diagnosis" /XD "c:\DRM" /XD "c:\ProgramData\Microsoft\Event Viewer" /XD "c:\ProgramData\Microsoft\Group Policy" /XD "c:\ProgramData\Microsoft\Vault"   /xf desktop.ini /xf *.scl

goto end



:end
pause
