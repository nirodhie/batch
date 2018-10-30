@echo off
echo program uruchomiono jako %username%
echo musi byc uruchomiony jako cybwkseucentral
echo .
goto :wyborKomputeraPoHostname


:wyborKomputeraPoHostname
@set /p komputer=Wklej tutaj nazwe komputera na ktorym chcesz pracowac 

:menu


set /a counter=0
set choice=


echo [1] dodaj kogos jako admin lokalny
echo [2] usun kogos jako admin lokalny

echo ----------------------------------------
echo [99] wybierz inny komputer po hostname

set /p choice=Co chcesz sprawdzic:

set /a counter= %counter%+%choice%


if %counter% ==1   (goto :userJakoAdminLokalnyDodaj)
if %counter% ==2   (goto :userJakoAdminLokalnyUsun)
if %counter% ==99   (goto :wyborKomputeraPoHostname)








:userJakoAdminLokalnyDodaj


psexec \\%komputer% net localgroup "Administrators"
set /p komuAdmin= komu nadac admina? 
psexec \\%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /add
@echo off
goto menu

:userJakoAdminLokalnyUsun

psexec \\%komputer% net localgroup "Administrators"
set /p komuAdmin= komu odebrac admina? 
psexec \\%komputer% net localgroup Administrators "BDX.com\%komuAdmin%" /delete
@echo off
goto menu
