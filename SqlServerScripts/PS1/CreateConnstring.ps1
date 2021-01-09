$us = Read-Host "Insert user name" 
$pass = Read-Host "Insert user password" -AsSecureString
$credential = New-Object -TypeName System.Management.Automation.PSCredential ($us, $pass)
$srv = Read-Host "Instance Name"
$db = Read-Host "Database Name"
$connstring = New-DbaConnectionString -SqlInstance $srv -SqlCredential $credential -Database $db


#Connection String
$connstring