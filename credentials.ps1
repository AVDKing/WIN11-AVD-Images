#Variablen
 $user = "LocAdmin"
 $pass=ConvertTo-SecureString "123AVDherbei" -AsPlainText -Force
 $FSLogixUsers = "sepagoavd.onmicrosoft.com\AVDUsers"
 $ExcludeUsers = "sepagoavd.onmicrosoft.com\Domain Admins"

$secpassword = ConvertTo-SecureString "123AVDherbei" -AsPlainText –Force
 $mycreds = New-Object System.Management.Automation.PSCredential ("LocAdmin", $secpassword)
Start-Process powershell.exe -Credential Get-Credential -ArgumentList test.ps1

