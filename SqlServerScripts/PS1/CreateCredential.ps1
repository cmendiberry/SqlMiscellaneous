$us = Read-Host "Insert user name" 
$pass = Read-Host "Insert user password" -AsSecureString
$credential = New-Object -TypeName System.Management.Automation.PSCredential ($us, $pass)
