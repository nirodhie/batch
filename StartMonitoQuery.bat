@echo off
set /p password=<cyberark.txt
psexec  -u BDX.com\cybwkseucentral03 -p %password% call "cmd /c start C:\Users\hclteska.000\Desktop\RemoteSystemInfo\monitors.bat"
exit