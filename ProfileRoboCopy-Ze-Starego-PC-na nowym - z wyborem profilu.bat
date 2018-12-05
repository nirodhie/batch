@echo off
@chcp 852
:1
net use B: /delete
echo program uruchomiono jako 
echo program nalezy uruchomic na nowym laptopie
echo z konta hcl*****
echo uzytkownik musi byc wylogowany ze starego laptopa
echo.
echo podaj nazwe komputera z ktorego kopiujemy dane
set /p oldpc="\\"

net use b: \\%oldpc%\c$
echo dostepne konta uzytkownikow:
echo.
cd /d %0\..
dir b:\users\  /b

echo.
echo wybierz profil ktory chcesz skopiowac z listy powyzej
set /p user="> "





robocopy "b:\users\%user%" "c:\users\%user%" /E /ZB /XA:H /b /fft /r:0  /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "tart Menu" /XD "Templates" /xf "desktop.ini"
robocopy "b:\users\%user%\AppData\Roaming" "c:\Users\%user%\AppData\Roaming"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "McAffee" "Media Center Programs", "Sun", "Microsoft" /xf "desktop.ini"
robocopy "b:\users\%user%\AppData\Roaming\Microsoft" "c:\Users\%user%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "Crypto" /XD "HTML Help" /XD "Protect" /XD "Windows" /XD "Outlook" /xf "desktop.ini"
robocopy "b:\users\%user%\AppData\Roaming\Microsoft\Windows" "c:\Users\%user%\AppData\Roaming\Microsoft\Windows"    /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "Start Menu" /xf "desktop.ini"
del /S /F /Q    "b:\users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
robocopy "b:\users\%user%\AppData\Local" "c:\Users\%user%\AppData\Local"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Microsoft" /XD  "Spotify" /XD  "Temp" /XD "Application Data" /XD "Temporary Internet Files" /XD "Cache" /xf "desktop.ini"
robocopy "b:\users\%user%\AppData\Local\Microsoft" "c:\Users\%user%\AppData\Local\Microsoft"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /xf "desktop.ini"/xf "*.ost"
robocopy "b:\users\%user%\AppData\Local\Microsoft\Windows" "c:\Users\%user%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /XD "Temporary Internet Files"  /xf "desktop.ini"
robocopy "b:\users\%user%\AppData\LocalLow" "c:\Users\%user%\AppData\LocalLow"  /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "desktop.ini"


rem robocopy  "b:" "c:"  /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "$RECYCLE.BIN" /XD "Diskeeper" /XD "Documents and Settings" /XD "MSOCache" /XD "Perflogs" /XD "Program Files" /XD "Program Files (x86)" /XD "ProgramData" /XD "Recovery"  /XD "System Volume Information" /XD "temp" /XD "Users" /XD "Windows" /XD "BDSETUP"  /XD "BDAPPS" /xf "pagefile.sys" /xf "hiberfil.sys" /xf "desktop.ini"

robocopy "b:\Program Files (x86)\podatki.biz\delegacje" "c:\Program Files (x86)\podatki.biz\delegacje"    /b /fft /r:0  /NDL /E /MIR /ZB /NDL   
robocopy "b:\ProgramData" "c:\ProgramData"   /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "Application Data" /XD "1E" /XD "Desktop" /XD "Documents" /XD "Favorites" /XD "McAfee" /XD "Package Cache" /XD "Start Menu" /XD "System Time" /XD "Templates"  /XD "Microsoft" /xf "desktop.ini"

robocopy "b:\ProgramData\Microsoft"  "c:\ProgramData\Microsoft"  /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "Assistance" /XD "Crypto" /XD "Device Stage" /XD "Device Sync" /XD "Diagnosis" /XD "DRM" /XD "Event Viewer" /XD "Group Policy" /XD "Vault"   /xf "desktop.ini"

goto end



:end
pause
rem del %0