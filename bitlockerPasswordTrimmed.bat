@echo off
manage-bde -protectors -get c: | find "-" | find /v "{" > %temp%\bt.txt

setlocal enabledelayedexpansion

for /F "tokens=*" %%A in (%temp%\bt.txt) do (
    set line=%%A
    echo(!line:~1!>%temp%\bt.txt
)
rem notepad  %temp%\bt.txt
rem del %temp%\bt.txt
rem pause