@echo off
@chcp 852
:1
net use B: /delete /y
net use A: /delete /y
echo program uruchomiono jako 
echo program nalezy uruchomic na nowym laptopie
echo z konta hcl*****
echo uzytkownik musi byc wylogowany ze starego laptopa
echo.
echo podaj nazwe STAREGO komputera
set /p oldpc="\\"
echo podaj nazwe NOWEGO komputera
set /p newpc="\\"
net use b: \\%oldpc%\c$
net use a: \\%newpc%\c$
echo dostepne konta uzytkownikow:
echo.
cd /d %0\..
dir b:\users\  /b
pause
echo.
echo wybierz profil ktory chcesz skopiowac z listy powyzej
set /p user="> "





robocopy "b:\users\%user%" "a:\users\%user%" /E /ZB /XA:H /b /fft /r:0  /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf "desktop.ini"
robocopy "b:\users\%user%\appdata\local\Lotus" "a:\users\%user%\appdata\local\Lotus" /E /ZB /XA:H /b /fft /r:0  /NDL /XD "AppData" /XD "AppData" /XD "Application Data" /XD "Cookies" /XD "Local Settings" /XD "NetHood" /XD "PrintHood" /XD "SendTo" /XD "Start Menu" /XD "Templates" /xf "desktop.ini"
del /S /F /Q "b:\users\%user%\AppData\Local\Google\Chrome\User Data\Default\Cache\"
robocopy "b:\users\%user%\appdata\local\Google\Chrome" "a:\users\%user%\appdata\local\Google\Chrome" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"
robocopy "b:\users\%user%\appdata\local\Microsoft\office" "a:\users\%user%\appdata\local\Microsoft\office" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"
robocopy "b:\users\%user%\appdata\local\Microsoft\onenote" "a:\users\%user%\appdata\local\Microsoft\onenote" /E /ZB /XA:H /b /fft /r:0  /NDL  /xf "desktop.ini"






rem robocopy "b:\users\%username%.bdx\AppData\Roaming" "c:\Users\%username%\AppData\Roaming"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "McAffee" "Media Center Programs", "Sun", "Microsoft" /xf "desktop.ini"
rem robocopy "b:\users\%username%.bdx\AppData\Roaming\Microsoft" "c:\Users\%username%\AppData\Roaming\Microsoft"  /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "Crypto" /XD "HTML Help" /XD "Protect" /XD "Windows" /XD "Outlook" /XD "Internet Explorer"   /xf "desktop.ini"
rem robocopy "b:\users\%username%.bdx\AppData\Roaming\Microsoft\Windows" "c:\Users\%username%\AppData\Roaming\Microsoft\Windows"    /b /fft /r:0  /NDL /E /MIR /ZB /NDL  /XD "Start Menu" /xf "desktop.ini"
rem robocopy "b:\users\%username%.bdx\AppData\Local" "c:\Users\%username%\AppData\Local"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Microsoft" /XD  "Spotify" /XD  "Temp" /XD "Application Data" /XD "Temporary Internet Files" /XD "Cache" /xf "desktop.ini"
rem robocopy "b:\users\%username%.bdx\AppData\Local\Microsoft" "c:\Users\%username%\AppData\Local\Microsoft"  /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /xf "desktop.ini"/xf "*.ost"
rem robocopy "b:\users\%username%.bdx\AppData\Local\Microsoft\Windows" "c:\Users\%username%\AppData\Local\Microsoft\Windows" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  /XD "Windows" /XD "Temporary Internet Files"  /xf "desktop.ini"
rem robocopy "b:\users\%username%.bdx\AppData\LocalLow" "c:\Users\%username%\AppData\LocalLow"  /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "desktop.ini"
rem robocopy  "b:" "c:"  /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "$RECYCLE.BIN" /XD "Diskeeper" /XD "Documents and Settings" /XD "MSOCache" /XD "Perflogs" /XD "Program Files" /XD "Program Files (x86)" /XD "ProgramData" /XD "Recovery"  /XD "System Volume Information" /XD "temp" /XD "Users" /XD "Windows" /XD "BDSETUP"  /XD "BDAPPS" /xf "pagefile.sys" /xf "hiberfil.sys" /xf "desktop.ini"
rem robocopy "b:\Program Files (x86)\podatki.biz\delegacje" "c:\Program Files (x86)\podatki.biz\delegacje"    /b /fft /r:0  /NDL /E /MIR /ZB /NDL   
rem robocopy "b:\ProgramData" "c:\ProgramData"   /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "Application Data" /XD "1E" /XD "Desktop" /XD "Documents" /XD "Favorites" /XD "McAfee" /XD "Package Cache" /XD "Start Menu" /XD "System Time" /XD "Templates"  /XD "Microsoft" /xf "desktop.ini"
rem robocopy "b:\ProgramData\Microsoft"  "c:\ProgramData\Microsoft"  /E /ZB /XA:H /b /fft /r:0  /NDL  /XD "Assistance" /XD "Crypto" /XD "Device Stage" /XD "Device Sync" /XD "Diagnosis" /XD "DRM" /XD "Event Viewer" /XD "Group Policy" /XD "Vault"   /xf "desktop.ini"

goto end



:end
pause
rem del %0

rem del %0