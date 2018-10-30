@echo OFF

>%temp%.\RmCMbyBIOS.ps1 echo  import-module 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1'
>>%temp%.\RmCMbyBIOS.ps1 echo cd BDP:
>>%temp%.\RmCMbyBIOS.ps1 echo $hostguid = Read-Host -Prompt 'Computer BIOSGuid to remove from SCCM '
>>%temp%.\RmCMbyBIOS.ps1 echo $found = $false
>>%temp%.\RmCMbyBIOS.ps1 echo $foundID = ""
>>%temp%.\RmCMbyBIOS.ps1 echo foreach ($computer in (get-CMdevice -name Unknown)) {
>>%temp%.\RmCMbyBIOS.ps1 echo $compID = $computer.ResourceID
>>%temp%.\RmCMbyBIOS.ps1 echo $fullcomputer = get-cmresource $compID -fast
>>%temp%.\RmCMbyBIOS.ps1 echo if ($fullcomputer.SMBIOSGUID -ieq $hostguid) {$found=$true; $foundID=$compID}
>>%temp%.\RmCMbyBIOS.ps1 echo write-host "Testing computer N°"$compID
>>%temp%.\RmCMbyBIOS.ps1 echo }
>>%temp%.\RmCMbyBIOS.ps1 echo if ($found) {Remove-CMResource $compID} else {write-host "BIOSGuid not found"}

echo Connecting to the SCCM database please wait a bit
powershell.exe %temp%.\RmCMbyBIOS.ps1

pause