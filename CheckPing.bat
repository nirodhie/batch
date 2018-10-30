@echo off
set "host=10.155.30.102"
echo pinging %host%

ping -n 1 "%host%" | findstr /r /c:"[0-9] *ms"

if %errorlevel% == 0 (
    echo Success connecting to %host%
) else (
    echo FAILURE connecting to %host%
)
pause