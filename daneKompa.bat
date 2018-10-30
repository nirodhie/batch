@echo off
echo program uruchomiono jako %username%
echo musi byc uruchomiony jako cybwkseucentral
echo .
goto :wyborKomputeraPoHostname

:wyborKomputeraPoNazwisku
set /p uzytkownik=Podaj nazwisko uzytkownika ktorego nazwe komputera chcesz ustalic 
dsquery computer "OU=EMEA,OU=BDResources,DC=BDX,DC=com" -desc *%uzytkownik%*

:wyborKomputeraPoHostname
@set /p komputer=Wklej tutaj nazwe komputera na ktorym chcesz pracowac 

:menu


set /a counter=0
set choice=

echo [1] numer seryjny komputera
echo [2] wersja BIOSu
echo [3] Dell czy HP
echo [4] jaki to model
echo [5] kiedy zainstalowano Windowsa
echo [6] jakie programy zostaly zainstalowane
echo [7] dodaj mnie jako admin lokalny
echo [8] usun mnie jako admin lokalny
echo [9] wyswietl klucz bitlocker
echo [10] lista procesow
echo [11] jakie dyski ma podpiete
echo [12] id Sesji
echo [13] remote CMD jako %username%
echo [14] przygotuj profil do migracji
echo [15] ile jest miejsca na dysku C
echo [16] pokaz adres ?IP
echo [17] pokaz kto jest zalogowany
echo [18] szybkie nadanie admina mi i natalii
echo ----------------------------------------
echo [98] wybierz inny komputer po nazwisku uzytkownika
echo [99] wybierz inny komputer po hostname

set /p choice=Co chcesz sprawdzic:

set /a counter= %counter%+%choice%

if %counter% ==1   (goto :numerSeryjny)
if %counter% ==2   (goto :model)
if %counter% ==3   (goto :marka)
if %counter% ==4   (goto :wersjaBIOSu)
if %counter% ==5   (goto :dataInstalacjiWindowsa)
if %counter% ==6   (goto :zainstalowaneProgramy)
if %counter% ==7   (goto :userJakoAdminLokalnyDodaj)
if %counter% ==8   (goto :userJakoAdminLokalnyUsun)
if %counter% ==9   (goto :kluczBitlocker)
if %counter% ==10  (goto :procesy)
if %counter% ==11  (goto :connectedShares)
if %counter% ==12  (goto :sessionID)
if %counter% ==13  (goto :remoteCMD)
if %counter% ==15  (goto :folderSizes)
if %counter% ==16  (goto :showIP)
if %counter% ==17  (goto :whoIsLogged)
if %counter% ==18  (goto :fastAdmin)
if %counter% ==98  (goto :wyborKomputeraPoNazwisku)
if %counter% ==99  (goto :wyborKomputeraPoHostname)






:numerSeryjny

wmic /node:%komputer% bios get serialnumber
goto menu

:wersjaBIOSu

WMIC /node:%komputer% bios get smbiosbiosversion
goto menu

:marka

WMIC /node:%komputer% csproduct get vendor
goto menu

:model

WMIC /node:%komputer% COMPUTERSYSTEM GET MODEL
goto menu

:dataInstalacjiWindowsa

WMIC /node:%komputer% OS GET InstallDate
goto menu

:zainstalowaneProgramy

WMIC /node:%komputer% product get name | more
goto menu


:userJakoAdminLokalnyDodaj


%~dp0psexec \\%komputer% net localgroup "Administrators"
set /p komuAdmin= komu nadac admina? 
%~dp0psexec \\%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /add
@echo off
goto menu

:userJakoAdminLokalnyUsun

%~dp0psexec \\%komputer% net localgroup "Administrators"
set /p komuAdmin= komu odebrac admina? 
%~dp0psexec \\%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /delete
@echo off
goto menu


:kluczBitlocker


 
./psexec \\%komputer% manage-bde -protectors c: -get
@echo off
goto menu

:procesy

 
./psexec \\%komputer% tasklist /v
@echo off
goto menu


:connectedShares

./psexec \\%komputer% net use
@echo off
goto menu

:sessionID
./psexec \\%komputer% Query Session
@echo off
goto menu

:remoteCMD
./psexec \\%komputer% cmd.exe
@echo off
goto menu


:folderSizes
COPY C:\Users\hclteska.000\Downloads\PSTools\FolderSize.bat \\%komputer%\c$
%~dp0psexec \\%komputer% C:\FolderSize.bat


:showIP
./psexec \\%komputer% ipconfig | findstr "IPv4"
goto menu


:whoIsLogged
WMIC /node:%komputer% COMPUTERSYSTEM GET USERNAME
goto menu

:fastAdmin
rem set /p komputer1= nazwa komputera? 
%~dp0psexec \\%komputer% net localgroup Administrators "BDX.com\hclteska" /add
%~dp0psexec \\%komputer% net localgroup Administrators "BDX.com\hclpaszkowsk" /add
goto menu

:przygotujProfil
./psexec \\%komputer% mkdir c:\KopiaProfilu
copy shadowspawn.exe \\%komputer%\c$\KopiaProfilu

shadowspawn.exe "c:\Users\%1\AppData\Local\Microsoft\Internet Explorer" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\Microsoft\Internet Explorer"   /E /MIR /Z /XA:H /b /fft /r:0  /NDL 
shadowspawn.exe "c:\Users\%1\AppData\Local\Microsoft\Office" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\Microsoft\Office"  /E /MIR /Z /XA:H /b /fft /r:0  /NDL  
shadowspawn.exe "c:\Users\%1\AppData\Local\Microsoft\Outlook" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\Microsoft\Outlook" /E /MIR /Z /XA:H /b /fft /r:0  /NDL /xf "*.ost"
d:\shadowspawn.exe "c:\Users\%1\AppData\Local\Google" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\Google" /E /MIR /Z /XA:H /b /fft /r:0  /NDL  
d:\shadowspawn.exe "C:\Users\%1\AppData\Local\Adobe" o: robocopy o:\ c:\KopiaProfilu\%1\AppData\Local\Adobe /E /MIR /Z /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "C:\Users\%1\AppData\Local\baramundi_software_AG" o: robocopy o:\ c:\KopiaProfilu\%1\AppData\Local\baramundi_software_AG /E /MIR /Z /XA:H /b /fft /r:0 /NDL
d:\shadowspawn.exe "C:\Users\%1\AppData\Local\BAKK_sp._z_o.o" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\BAKK_sp._z_o.o" /E /MIR /Z /XA:H /b /fft /r:0 /NDL
d:\shadowspawn.exe "c:\Users\%1\Contacts" o: robocopy o:\ "c:\KopiaProfilu\%1\Contacts" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  
d:\shadowspawn.exe "c:\Users\%1\Links" o: robocopy o:\ "c:\KopiaProfilu\%1\Links" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL 
d:\shadowspawn.exe "c:\Users\%1\Pictures" o: robocopy o:\ "c:\KopiaProfilu\%1\Pictures" /E /MIR /ZB /XA:H /b /fft  /r:0  /NDL 
d:\shadowspawn.exe "c:\Users\%1\Videos" o: robocopy o:\ "c:\KopiaProfilu\%1\Videos" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL  
d:\shadowspawn.exe "c:\Users\%1\Downloads" o: robocopy o:\ "c:\KopiaProfilu\%1\Downloads" /E /MIR /ZB /XA:H /b /fft /r:0 /xf "*.exe" "*.msi"  /NDL  
d:\shadowspawn.exe "c:\Users\%1\Favorites" o: robocopy o:\ "c:\KopiaProfilu\%1\Favorite"s /E /MIR /ZB /XA:H /b /fft /r:0  /NDL 
d:\shadowspawn.exe "c:\Users\%1\Searches" o: robocopy o:\ "c:\KopiaProfilu\%1\Searches" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Adobe\Acrobat" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Adobe\Acrobat" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\FileZilla\*.xml" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\FileZilla\*.xml" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\.gimp-2.8" o: robocopy o:\ "c:\KopiaProfilu\%1\.gimp-2.8" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\LocalLow\Sun\Java\Deployment\Security" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\LocalLow\Sun\Java\Deployment\Security" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Microsoft\Excel" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Microsoft\Excel" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Local\Microsoft\OneNote" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\Microsoft\OneNote" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Microsoft\PowerPoint" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Microsoft\PowerPoint" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Microsoft\Word" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Microsoft\Word" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Microsoft\Templates" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Microsoft\Templates" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Microsoft\Windows\AccountPictures" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Microsoft\Windows\AccountPictures" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Apple Computer" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Apple Computer" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\Music\iTunes\iTunes*" o: robocopy o:\ "c:\KopiaProfilu\%1\Music\iTunes\iTunes*" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\Music\iTunes\sentinel" o: robocopy o:\ "c:\KopiaProfilu\%1\Music\iTunes\sentinel" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\Music\iTunes\iTunes Media" o: robocopy o:\ "c:\KopiaProfilu\%1\Music\iTunes\iTunes Media" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\Music\iTunes\Previous iTunes Libraries" o: robocopy o:\ "c:\KopiaProfilu\%1\Music\iTunes\Previous iTunes Libraries" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Local\Adobe" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\Adobe" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Local\Citrix" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Local\Citrix" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Locallow\Adobe" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Locallow\Adobe" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Adobe" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Adobe" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL
d:\shadowspawn.exe "c:\Users\%1\AppData\Roaming\Corel" o: robocopy o:\ "c:\KopiaProfilu\%1\AppData\Roaming\Corel" /E /MIR /ZB /XA:H /b /fft /r:0  /NDL

