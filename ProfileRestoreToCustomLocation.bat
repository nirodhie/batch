@echo off
@chcp 852
:1
echo program uruchomiono jako %username%
echo musi byc uruchomiony z prawami administratora
echo.
echo dostepne konta uzytkownikow:
echo.
net use B: /delete
net use B: \\DTPOLBN7001\ossprv$\ProfileBackup
rem b:

dir B:\profilebackup /b
rem echo.
echo wybierz profil ktory chcesz przywrocic z listy powyzej
set /p userfrom="> "
dir c:\users /b
echo wybierz profil ktory chcesz przywrocic z listy powyzej
set /p userto="> "

robocopy "b:\%userfrom%" c:\users\%userto% /E /ZB /XA:H /b /fft /r:0 /XO /NDL 





:end

