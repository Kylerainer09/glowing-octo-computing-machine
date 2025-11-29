# force stops the exe file
Stop-Process -Name "N0b0dy" -Force
# removes the files
Remove-Item -Path "C:\Windows\System32\N0b0dy.exe" -Force
Remove-Item -Path "C:\Windows\System32\ddrcc.ps1" -Force
Remove-Item -Path "C:\Windows\System32\chromelevator_x64.exe" -Force
# remove exclusions
Remove-MpPreference -ExclusionPath "C:\Windows\System32\N0body.exe" -Force
Remove-MpPreference -ExclusionPath "C:\Windows\System32\temp.ps1" -Force
Remove-MpPreference -ExclusionPath "C:\Windows\System32\chromelevator_x64.exe" -Force
# removes scheduled task
Unregister-ScheduledTask -TaskName "Telemetry_Prog" -Confirm:$false
# add README.md
Set-Content -Path "C:\Users\$env:USERNAME\Desktop\README.md" -Value "Mr.nobody was here"
# self destruct file
Remove-Item -Path $MyInvocation.MyCommand.Source -Force
