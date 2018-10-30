@echo off
set /p password=<cyberark.txt
net use a: /delete /yes
net use a: \\LTPOLBN7319\c$
copy C:\Users\hclteska.bdx\Desktop\Scriptz\Powershell\Monitors.ps1 a:\temp
psexec  \\LTPOLBN7319 -u BDX.com\cybwkseucentral03 -p %password% powershell -executionpolicy remotesigned -File c:\temp\Monitors.ps1 -i

pause