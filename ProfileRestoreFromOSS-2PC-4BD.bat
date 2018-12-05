@echo off
@chcp 852
:1
echo program uruchomiono jako %username%
echo musi byc uruchomiony jako hcl****** z prawami administratora
echo.
echo dostepne konta uzytkownikow:
echo.
net use B: \\DTPOLBN7001\ossprv$\ProfileBackup
b:

dir B: /b
echo.
echo wybierz profil ktory chcesz przywrocic z listy powyzej
set /p user="> "


robocopy "b:\%user%" c:\users\%user% /E /ZB /XA:H /b /fft /r:0 /XO /NDL 





:end
pause
