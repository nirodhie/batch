@echo off
echo program uruchomiono jako %username%
echo musi byc uruchomiony jako cybwkseucentral
echo .
goto :wyborKomputeraPoHostname

:wyborKomputeraPoNazwisku
set /p uzytkownik=Podaj nazwisko uzytkownika ktorego nazwe komputera chcesz ustalic 
dsquery computer "OU=EMEA,OU=BDResources,DC=BDX,DC=com" -desc *%uzytkownik%*

:wyborKomputeraPoHostname
@set /p komputer=Wklej tutaj nazwe komputera na ktorym chcesz pracowac \\EPOL32LX

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
echo [19] nadanie admina i skopwianie DeployScript Wroclaw
echo [20] nadanie admina i skopwianie DeployScript Warszawa
echo [21] nadanie admina i skopwianie DeployScript Czechy
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
if %counter% ==19  (goto :AutoStartScript)
if %counter% ==20  (goto :AutoStartScriptWarsaw)
if %counter% ==21  (goto :AutoStartScriptCzechia)
if %counter% ==98  (goto :wyborKomputeraPoNazwisku)
if %counter% ==99  (goto :wyborKomputeraPoHostname)






:numerSeryjny

wmic /node:EPOL32LX%komputer% bios get serialnumber
goto menu

:wersjaBIOSu

WMIC /node:EPOL32LX%komputer% bios get smbiosbiosversion
goto menu

:marka

WMIC /node:EPOL32LX%komputer% csproduct get vendor
goto menu

:model

WMIC /node:EPOL32LX%komputer% COMPUTERSYSTEM GET MODEL
goto menu

:dataInstalacjiWindowsa

WMIC /node:EPOL32LX%komputer% OS GET InstallDate
goto menu

:zainstalowaneProgramy

WMIC /node:EPOL32LX%komputer% product get name | more
goto menu


:userJakoAdminLokalnyDodaj


%~dp0psexec \\EPOL32LX%komputer% net localgroup "Administrators"
set /p komuAdmin= komu nadac admina? 
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /add
@echo off
goto menu

:userJakoAdminLokalnyUsun

%~dp0psexec \\EPOL32LX%komputer% net localgroup "Administrators"
set /p komuAdmin= komu odebrac admina? 
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /delete
@echo off
goto menu


:kluczBitlocker


 
./psexec \\EPOL32LX%komputer% manage-bde -protectors c: -get
@echo off
goto menu

:procesy

 
./psexec \\EPOL32LX%komputer% tasklist /v
@echo off
goto menu


:connectedShares

./psexec \\EPOL32LX%komputer% net use
@echo off
goto menu

:sessionID
./psexec \\EPOL32LX%komputer% Query Session
@echo off
goto menu

:remoteCMD
./psexec \\EPOL32LX%komputer% cmd.exe
@echo off
goto menu


:folderSizes
COPY C:\Users\hclteska.000\Downloads\PSTools\FolderSize.bat \\EPOL32LX%komputer%\c$
%~dp0psexec \\EPOL32LX%komputer% C:\FolderSize.bat


:showIP
./psexec \\EPOL32LX%komputer% ipconfig | findstr "IPv4"
goto menu


:whoIsLogged
WMIC /node:EPOL32LX%komputer% COMPUTERSYSTEM GET USERNAME
goto menu

:fastAdmin
rem set /p komputer1= nazwa komputera? 
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclteska" /add
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclpaszkowsk" /add
goto menu

:AutoStartScript

copy 
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclteska" /add
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclpaszkowsk" /add
net use a: /delete /yes
net use b: /delete /yes

net use a: \\dtpolbn7001\oss$\BDOSSDeploy

net use b: "\\EPOL32LX%komputer%\c$\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
copy a:\NewScript-Windows10.bat  b:\

%~dp0psexec \\EPOL32LX%komputer% net localgroup "Administrators"
set /p komuAdmin= komu jeszcze nadac admina? 
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /add
net use a: /delete /yes
net use b: /delete /yes
goto menu


:AutoStartScriptWarsaw
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclteska" /add
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclpaszkowsk" /add
net use a: /delete /yes
net use b: /delete /yes

net use a: \\dtpolbn7001\oss$\BDOSSDeploy\Scripts\Common\AutostartScript

net use b: "\\EPOL32LX%komputer%\c$\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
copy a:\Autoconfiguration-Warszawa.bat  b:\

%~dp0psexec \\EPOL32LX%komputer% net localgroup "Administrators"
set /p komuAdmin= komu nadac admina? 
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /add
net use a: /delete /yes
net use b: /delete /yes
goto menu

:AutoStartScriptCzechia
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclteska" /add
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\hclpaszkowsk" /add
net use a: /delete /yes
net use b: /delete /yes

net use a: \\dtpolbn7001\oss$\BDOSSDeploy\Scripts\Common\AutostartScript

net use b: "\\EPOL32LX%komputer%\c$\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
copy a:\Autoconfiguration-Czechia.bat  b:\

%~dp0psexec \\EPOL32LX%komputer% net localgroup "Administrators"
set /p komuAdmin= komu nadac admina? 
%~dp0psexec \\EPOL32LX%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /add
net use a: /delete /yes
net use b: /dele



:przygotujProfil
