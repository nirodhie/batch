@echo off
:start
set /p LaptopName="podaj nazwe laptopa na ktory zgramy skrypt "
set /p globalID="podaj GlobalID osoby ktora ma miec sciezke "
echo.

:menu
set /a counter=0
set choice=

echo proponowane dyski sieciowe:
echo [1] \\EUBELCCFS01\REGIONAL
echo [2] \\EUBELCCFS01\REGIONAL\EREMBODEGEM\SSC_SHARED 
echo [3] \\EUBELCCFS01\REGIONAL\Erembodegem\FACE_Standard_Reporting  
echo [4] \\bdxxxi3\eisemav7.eur
echo [5] \\eubelccfs01\regional\erembodegem\Service_Income
echo [6] \\eubelccfs01\personal
echo [7] \\Eubelccfs01\regional\EREMBODEGEM\FACE_Belgium
echo [8] \\Eubelccfs01\regional\EREMBODEGEM\FACE_Standard_Reporting
echo [9] \\eubelccfs01\REGIONAL\Erembodegem\Global_Product_Stewardship
echo [10] \\eubelccfs01\REGIONAL\Plymouth\departmt\Payroll\ASC
echo [11] \\PAGBR100NAS01\DEPT\HR\PERSONNEL 
echo [12] \\eubelccfs01\REGIONAL\Erembodegem\Technical_Support_OFFICE 
echo [13] \\Eufrabfile01\face_france
echo [14] \\eugbrafile2\FACE_UK
echo [15] \\Eugbrafile2\face_lt
echo [16] \\eubelccfs01\REGIONAL\Heidelberg
echo [17] \\EUBELCCFS01\REGIONAL\WROCLAW
echo [18] \\pache020nas01\Dept\CFN-BD_Finance_Share
echo [19] \\EUFRABFILE01\FACE_FRANCE\Hubs\Central Europe\GSA\Actual
echo [20] \\Eubelccfs01\REGIONAL\Erembodegem
echo [21] \\Eufrabfile01\face_france\FACE Space\Meetings\Country Analyst Forum\CAF Calls 
echo [22] \\eubelccfs01\regional\plymouth\departmt\Payroll\ASC & PSC\ASC - Payroll To Do\UK
echo [23] \\PAGBR100NAS01\DEPT\HR\PERSONNEL FILES  
echo [24] \\pache020nas01\hr$\1 Employees Files
echo [25] \\vmhost\4 Dokumente MA
echo [26] \\Eubelccfs01\regional\HEIDELBERG\HRXXXDEU\Personal Files Germany
echo [27] \\carefusion.com\shared\EUR01\HR\Germany\03 Personaladministration\17-PERSONNEL FILES\12-CFN 326\10-Regular Employees
echo [28] \\carefusion.com\shared\EUR01\HR\Germany
echo. 

set /p choice=Co chcesz sprawdzic:
set /a counter= %counter%+%choice%

rem set /p sharedDrivePath="podaj nr sciezki ktora chcemy przyporadkowac "
set /p letter="podaj litere dysku do ktorej przyporzadkujemy sciezke sieciowa "




net use a: /delete /yes
net use a: "\\%LaptopName%\c$\Users\%globalID%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

if %counter% ==1   ( set sharedDrivePath=EUBELCCFS01\REGIONAL)
if %counter% ==2   ( set sharedDrivePath=EUBELCCFS01\REGIONAL\EREMBODEGEM\SSC_SHARED)
if %counter% ==3   ( set sharedDrivePath=EUBELCCFS01\REGIONAL\Erembodegem\FACE_Standard_Reporting)
if %counter% ==4   ( set sharedDrivePath=bdxxxi3\eisemav7.eur)
if %counter% ==5   ( set sharedDrivePath=eubelccfs01\regional\erembodegem\Service_Income)
if %counter% ==6   ( set sharedDrivePath=eubelccfs01\personal\%globalID%)
if %counter% ==7   ( set sharedDrivePath=Eubelccfs01\regional\EREMBODEGEM\FACE_Belgium)
if %counter% ==8   ( set sharedDrivePath=Eubelccfs01\regional\EREMBODEGEM\FACE_Standard_Reporting)
if %counter% ==9   ( set sharedDrivePath=eubelccfs01\REGIONAL\Erembodegem\Global_Product_Stewardship)
if %counter% ==10  ( set sharedDrivePath="eubelccfs01\regional\Plymouth\departmt\Payroll\ASC & PSC\ASC - Payroll To Do\UK")
if %counter% ==11  ( set sharedDrivePath=PAGBR100NAS01\DEPT\HR\Personnel Files\UK)
if %counter% ==12  ( set sharedDrivePath=eubelccfs01\REGIONAL\Erembodegem\Technical_Support_OFFICE)
if %counter% ==13  ( set sharedDrivePath=Eufrabfile01\face_france)
if %counter% ==14  ( set sharedDrivePath=Eubelccfs01\REGIONAL\Erembodegem)
if %counter% ==15  ( set sharedDrivePath="\\Eufrabfile01\face_france\FACE Space\Meetings\Country Analyst Forum\CAF Calls")
if %counter% ==16  ( set sharedDrivePath=eubelccfs01\REGIONAL\Heidelberg)
if %counter% ==17  ( set sharedDrivePath=EUBELCCFS01\REGIONAL\WROCLAW)
if %counter% ==18  ( set sharedDrivePath=pache020nas01\Dept\CFN-BD_Finance_Share)
if %counter% ==19  ( set sharedDrivePath=EUFRABFILE01\FACE_FRANCE\Hubs\Central Europe\GSA\Actual)
if %counter% ==20  ( set sharedDrivePath=Eubelccfs01\REGIONAL\Erembodegem)
if %counter% ==21  ( set sharedDrivePath="Eufrabfile01\face_france\FACE Space\Meetings\Country Analyst Forum\CAF Calls")
if %counter% ==22  ( set sharedDrivePath="eubelccfs01\regional\plymouth\departmt\Payroll\ASC & PSC\ASC - Payroll To Do\UK")
if %counter% ==23  ( set sharedDrivePath="PAGBR100NAS01\DEPT\HR\PERSONNEL FILES")
if %counter% ==24  ( set sharedDrivePath="pache020nas01\hr$\1 Employees Files")
if %counter% ==25  ( set sharedDrivePath="vmhost\4 Dokumente MA")
if %counter% ==26  ( set sharedDrivePath="Eubelccfs01\regional\HEIDELBERG\HRXXXDEU\Personal Files Germany")
if %counter% ==27  ( set sharedDrivePath="carefusion.com\shared\EUR01\HR\Germany\03 Personaladministration\17-PERSONNEL FILES\12-CFN 326\10-Regular Employees")
if %counter% ==28  ( set sharedDrivePath="carefusion.com\shared\EUR01\HR\Germany")
if %counter% ==29  ( set sharedDrivePath="\\Eufrabfile01\020gefra.d0\data\Xchange_SCHSSC\1. Team")
if %counter% ==30  ( set sharedDrivePath="\\Eufrabfile01\020gefra.d0\data\Xchange_SCHSSC\5. Data Share SCHSSC & Experts")




echo %shareddrivepath%

echo net use %letter%: \\%sharedDrivePath% > "a:\SharedDrive-%letter%.bat"
explorer.exe a:
goto menu

