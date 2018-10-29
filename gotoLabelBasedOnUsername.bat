@ECHO off
if '%username%' == 'hclteska' goto run
if '%username%' == 'hclpaszkowsk' goto run

goto ender

:run
echo username OK!
pause

:ender
echo username wrong!
pause