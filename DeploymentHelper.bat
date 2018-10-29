@echo off
set /p GlobalID ="Podaj GlobalID osoby ktorej bedziemy przygotowywac laptopa: "
echo.

set /p serviceTag="Podaj numer seryjny laptopa ktorego ma dostac: "
echo Wybierz dzial w ktorym bedzie pracowal ten pracownik:
echo [1] AP -> Magda Urban-Pura, Anna Skierska, Anna Krausiewicz
echo [2] Finance Analyst -> Tomasz Tomzik
echo [3] Agata Richter, Ambra Maiano, Katarzyna Smigielska, Katarzyna Rymarczuk
echo jesli przelozonym jest ktoras z powyzszych osob to laptop musi miec Windows 7
echo Wszyscy inni moga miec Windows 10

echo %global% bedzie mial nr seryjny %serviceTag%
pause



