@echo off
@chcp 852
:1
echo program uruchomiono jako %username%
echo musi byc uruchomiony jako hcl****** z prawami administratora
echo.
echo dostepne konta uzytkownikow:
echo.
net use B: \\DTPOLBN7001\ossprv$\ProfileBackup
rem b:

dir B:\profilebackup /b
rem echo.
rem echo wybierz profil ktory chcesz przywrocic z listy powyzej
rem set /p user="> "


robocopy "b:\%username%" c:\users\%username% /E /ZB /XA:H /b /fft /r:0 /XO /NDL 





:end
pause
