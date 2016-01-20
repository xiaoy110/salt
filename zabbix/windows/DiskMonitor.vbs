strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
set objRefresher = CreateObject("WbemScripting.SWbemRefresher")
Set colDisks = objRefresher.AddEnum(objWMIService, "Win32_PerfFormattedData_PerfDisk_LogicalDisk").objectSet

If Wscript.Arguments.Count = 0 Then
objRefresher.Refresh
For Each objDisk in colDisks
   Wscript.Echo objDisk.Name & " " & objDisk.DiskReadBytesPerSec & " " & objDisk.DiskWriteBytesPerSec
Next
End If

If Wscript.Arguments.Count = 1 Then
Interval = CInt(Wscript.Arguments(0)) * 1000
Do While True
   objRefresher.Refresh

'   Wscript.Echo
'   Wscript.Echo "Time: " & " " & Time()
'   Wscript.Echo FormatStr("Device:", 15, 0) & FormatStr("tps", 7, 1) & FormatStr("    kB_read/s", 13, 1) & FormatStr("kB_wrtn/s", 13, 1) & FormatStr("Free Space", 13, 1)

   For Each objDisk in colDisks
    Wscript.Echo FormatStr(objDisk.Name, 15, 0) & FormatStr(objDisk.DiskTransfersPerSec, 7, 1) & FormatStr(objDisk.DiskReadBytesPerSec, 13, 1) & FormatStr(objDisk.DiskWriteBytesPerSec, 13, 1)
   Next
   Wscript.Sleep Interval
Loop
End If

If Wscript.Arguments.Count = 2 Then
i = 0
Interval = CInt(Wscript.Arguments(0)) * 1000
Count = CInt(Wscript.Arguments(1))
Do While i < Count
   objRefresher.Refresh

'   Wscript.Echo
'   Wscript.Echo "Time: " & " " & Time()
'   Wscript.Echo FormatStr("Device:", 15, 0) & FormatStr("tps", 7, 1) & FormatStr("    kB_read/s", 13, 1) & FormatStr("kB_wrtn/s", 13, 1) & FormatStr("Free Space", 13, 1)

   For Each objDisk in colDisks
    Wscript.Echo FormatStr(objDisk.Name, 15, 0) & FormatStr(objDisk.DiskTransfersPerSec, 7, 1) & FormatStr(objDisk.DiskReadBytesPerSec, 13, 1) & FormatStr(objDisk.DiskWriteBytesPerSec, 13, 1) & FormatStr(objDisk.PercentFreeSpace & "%", 13, 1)
   Next
   Wscript.Sleep Interval
   i = i + 1
Loop
End If

Function FormatStr(str, tLen, direction)
sLen = Len(str)
fStr = ""
num = tLen - sLen

j = 0
Do While j < num
   fStr = fStr & " "
   j = j + 1
Loop

If direction = 1 Then
   fStr = fStr & str
Else
   fStr = str & fStr
End If
FormatStr = fStr
End Function