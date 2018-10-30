@echo off
echo Removing old printers...
echo.
rundll32 printui.dll,PrintUIEntry /dn /n\\pweur019print01\Secureprint-EUR01
rundll32 printui.dll,PrintUIEntry /dn /n"\\eubelcsaveq01\SHARP MX-5112N PCL6 SafeQ" 
echo This script will install a printer closest to your department:
echo.
echo.
:menu

echo Please select your department
echo.
echo 1- "Cash & Collection"
echo 2 - "Procurement, Indirect Procurement, Freight, T&E"
echo 3 - "Scanning, HCL, EPMO"
echo 4 - "AP"
echo 5 - "Order Entry, Instruments Complaints, GCS"
echo 6 - "BP&E, UAA, Commercial Compl, SBC"
echo 7 - "Payroll, HR"
echo 8 - "Customer Serv. Comp., CMDO +, Athena, Product Complaints"
echo 9 - "E-BIZ, Technical Services"
echo 11 - "Reception"
echo.
set /a counter=0
set choice=

set /p choice=Please select number corresponding to your department.

set /a counter= %counter%+%choice%


if %counter% ==1   (goto :pol32print01)
if %counter% ==2   (goto :pol32print02)
if %counter% ==3   (goto :pol32print03)
if %counter% ==4   (goto :pol32print04)
if %counter% ==5   (goto :pol32print05)
if %counter% ==6   (goto :pol32print06)
if %counter% ==7   (goto :pol32print07)
if %counter% ==8   (goto :pol32print08)
if %counter% ==9   (goto :pol32print09)
if %counter% ==10  (goto :pol32print10)
if %counter% ==11  (goto :pol32print11)


:pol32print01
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print01
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print01
goto :success

:pol32print02
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print02
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print02
goto :success

:pol32print03
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print03
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print03
goto :success

:pol32print04
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print04
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print04
goto :success

:pol32print05
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print05
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print05
goto :success

:pol32print06
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print06
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print06
goto :success

:pol32print07
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print07
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print07
goto :success

:pol32print08
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print08
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print08
goto :success

:pol32print09
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print09
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print09
goto :success

:pol32print10
REM rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print10
REM rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print10
goto :success

:pol32print11
rundll32 printui.dll PrintUIEntry /in /n\\pwpol329print01\pol32print11
rundll32 printui.dll,PrintUIEntry /y /n\\pwpol329print01\pol32print11
goto :success

:success
