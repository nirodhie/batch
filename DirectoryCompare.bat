

@echo off

set "input.left=%~1"
set "input.rght=%~2"

if not defined input.left goto :EOF
if not defined input.rght goto :EOF

call :full.path left

if errorlevel 1 goto :EOF

call :full.path rght

if errorlevel 1 goto :EOF

REM remove back-slashes and turn into space delimited quoted strings (so we can count the directories)
set temp.left="%full.left:\=" "%"
set temp.rght="%full.rght:\=" "%"

REM remove any empty strings
set "temp.left=%temp.left:""=%"
set "temp.rght=%temp.rght:""=%"

set trim.left=0
set trim.rght=0

REM count how many directory levels there are in the parameters passed
for %%c in (%temp.left%) do set /a trim.left+=1
for %%c in (%temp.rght%) do set /a trim.rght+=1

REM scan the directories for all items and call the diff procedure to do the hard work,
REM after using the count to trim the path (simplifies the comparison process a great deal)
echo:
echo:^>^> "%full.left%" ^<^<
echo:[class  ] "relative path"
echo:

for /f "usebackq tokens=%trim.left%* delims=\" %%a in (`dir /b /s "%input.left%"`) do call :diff "%input.left%" "%input.rght%" "%%~b"

echo:
echo:
echo:^>^> "%full.rght%" ^<^<
echo:[class  ] "relative path"
echo:

for /f "usebackq tokens=%trim.rght%* delims=\" %%a in (`dir /b /s "%input.rght%"`) do call :diff "%input.rght%" "%input.left%" "%%~b"

echo:
echo:

pause

goto :EOF
************************************************************************************
:diff

REM check if same named item exists at target
if not exist "%~2\%~3"                           (echo:[unique ] "%~3" & goto :EOF)

REM check if a dir at source exists as a file at target
if not exist "%~1\%~3\" (if     exist "%~2\%~3\" (echo:[is dir ] "%~3" & goto :EOF))

REM check if a dir at target exists as a file at source
if     exist "%~1\%~3\" (if not exist "%~2\%~3\" (echo:[is file] "%~3" & goto :EOF))

REM anything that makes it this far appears to be the same in name and type (file/dir)

rem echo:[same   ] "%~3"

goto :EOF
************************************************************************************
:full.path

set "here=%cd%"
call set "var=%%input.%1%%"

if "%var:~0,2%" EQU "\\" set "full.%1=%var%" & exit /b 0

cd /d "%var%" || exit /b 1
set "full.%1=%cd%"
cd /d "%here%"

exit /b 0
pause