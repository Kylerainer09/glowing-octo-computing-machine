$ScriptPath = "C:\Windows\System32\exitstrategy.ps1
$TaskName = "temp"
$User = "NT AUTHORITY\SYSTEM"  # This uses the SYSTEM account for admin privileges.
# Create the action to run the script
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$ScriptPath`""
# Set the task to run in 5 seconds after creation
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(5)
# Register the scheduled task with highest privileges
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $TaskName -Description "temp" -User $User -RunLevel Highest
