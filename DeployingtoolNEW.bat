@echo off
for /f %%a in (computers.txt) do (
echo processing computer %%a
psexec \\%%a -u BDX.com\cybwkseucentral03 -p B26MuDECgbnpJ2T wscript "c:\userdata.txt"
)
pause