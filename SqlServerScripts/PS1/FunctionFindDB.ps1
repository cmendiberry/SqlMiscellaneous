Function Find-DB 
    {param ([Parameter(Mandatory = $true)][string]$Database)

$listsrv = Read-Host "Path of sql servers list txt"
$servers = Get-Content  $listsrv
$us = Read-Host "User name"
$pass = Read-Host "user Password" -AsSecureString
$credential = New-Object -TypeName System.Management.Automation.PSCredential ($us, $pass)
foreach ($item in $servers) {find-DbaDatabase -SqlInstance $item -SqlCredential $credential -Pattern $Database |Select-Object SqlInstance, Name| Format-Table}


<#
.SYNOPSIS

Find a DB.

.DESCRIPTION
Looks for the database in the servers listed in the txt file.
.PARAMETER Database
Part of the database name

.OUTPUTS

Instance name and Databases found whose name matches the parameter

.EXAMPLE

PS> FIND-DB Cli
SqlInstance Name    
----------- ----
Instance1  Clients

SqlInstance Name
----------- ----
Instance2  Clients_test
#>
    }
