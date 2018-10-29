@echo off
@set /p komputer=Wklej tutaj nazwe komputera na ktorym chcesz pracowac
 

:menu

set /a counter=0
set choice=

echo  [1] 7 zip
echo  [2] Acrobat DC Pro
echo  [3] Avaya Communicator
echo  [4] Documentum
echo  [5] Ms Project 2013
echo  [6] Ms Access 2013
echo  [7] Ms Visio 2013
echo  [8] SnagIt 123
echo  [9] Winzip 112
echo [10] 
echo [11] 
echo [12] 
echo [13] 
echo [14] 
echo [15] 
echo [16] 
echo [17] 
echo [18] 
echo [19] 
echo [20] 
echo [21] 
echo ----------------------------------------
echo [99] wybierz inny komputer po hostname

set /p choice=Co chcesz sprawdzic:

set /a counter= %counter%+%choice%

if %counter% ==1   (goto :7zip)
if %counter% ==2   (goto :AdobeDCpro)
if %counter% ==3   (goto :AvayaCommunicator)
if %counter% ==4   (goto :Documentum)
if %counter% ==5   (goto :Project2013)
if %counter% ==6   (goto :Access2013)
if %counter% ==7   (goto :Visio2013)
if %counter% ==8   (goto :SnagIt123)
if %counter% ==9   (goto :Winzip)

if %counter% ==99  (goto :wyborKomputeraPoHostname)