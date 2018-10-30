' ******************** Data collection script **********************************
'Script to colect data for computers.


Dim objWMI : Set objWMI = GetObject("winmgmts:")
Dim colSettingsComp : Set colSettings = objWMI.ExecQuery("Select * from Win32_ComputerSystem")
Dim colSettingsBios : Set colSettingsBios = objWMI.ExecQuery("Select * from Win32_BIOS")
Dim objComputer, strModel, strSerial, strVendor, strSerial2                              


For Each objComputer in colSettings
strModel = objComputer.Model
strVendor = objComputer.Manufacturer                             
Next

For Each objComputer in colSettingsBios
strSerial = objComputer.SerialNumber
Next


'###########################

strQuery = "SELECT * FROM Win32_NetworkAdapterConfiguration WHERE MACAddress > ''"

Set objWMIService = GetObject( "winmgmts://./root/CIMV2" )
Set colItems      = objWMIService.ExecQuery( strQuery, "WQL", 48 )

For Each objItem In colItems
    If IsArray( objItem.IPAddress ) Then
        If UBound( objItem.IPAddress ) = 0 Then
            strIP = objItem.IPAddress(0)
        Else
            strIP = Join( objItem.IPAddress, ";" )
        End If
    End If
Next

'###########################

Set oShell = CreateObject("WScript.Shell")
strValue = "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows\Device"
strPrinter = oShell.RegRead(strValue)
strPrinter = Split(strPrinter, ",")(0)


'###########################

Set objNetwork = CreateObject("Wscript.Network")
strComputer = objNetwork.ComputerName
strUser = objNetwork.UserName
ifadmin = "NOT_Admin"
Set objGroup = GetObject("WinNT://" & strComputer & "/Administrators")
For Each objUser in objGroup.Members
    If objUser.Name = strUser Then
        ifadmin = "ADMIN"
    End If
Next

'###########################



Dim objShell, WshNetwork, PCName, UserName, strMessage, strContents, logDate, logTime
Dim strQuery, objWMIService, colItems, strIP, rowCount

' Constants for type of event log entry
const EVENTLOG_AUDIT_SUCCESS = 8

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")
Set WshNetwork = WScript.CreateObject("WScript.Network")

logDate = Date()
logTime = Time()
PCName = WshNetwork.ComputerName 
UserName = WshNetwork.UserName  
pathfilename = "//LTPOLBN7241/Users/10138638/OneDrive%20-%20BD/ScriptsSHARED/CheckIT.csv"

strMessage = UserName & chr(59) & PCName & chr(59) & strIP & chr(59) & strVendor & chr(59) & strModel & chr(59) & strSerial & chr(59) & strPrinter & chr(59) & ifadmin & chr(59) &logDate & chr(59) & logTime

If (objFSO.FileExists(pathfilename)) Then
'WScript.Echo("File exists!")
Const ForReading = 1, ForWriting = 2, ForAppending = 8 
Set csvFile = objFSO.OpenTextFile(pathfilename, ForAppending)

csvFile.Write strMessage
csvFile.Writeline
csvFile.Close 

Else
rowCount = rowCount + 1
'WScript.Echo("File does not exist! File Created!")
Set csvFile = objFSO.CreateTextFile(pathfilename)

csvFile.Write strMessage
csvFile.Writeline
csvFile.Close 

End If  
'WScript.Echo("Data colected, Thank you!")