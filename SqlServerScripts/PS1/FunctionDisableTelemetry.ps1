Function Disable-telemetry {param ([Parameter(Mandatory = $true)][string]$Servidor)

$us = Read-Host "Insert user name"
$pass = Read-Host "User Password" -AsSecureString 
$credo = New-Object -TypeName System.Management.Automation.PSCredential ($us, $pass)
Write-Host "SERVER: $servidor"
Invoke-Command -ComputerName $servidor -Credential $credo -ScriptBlock{ `
    Get-Service | 
    Where-Object { $_.Name -like '*telemetry*' -or $_.DisplayName -like '*CEIP*' } | 
    ForEach-Object { 
        $servicename = $_.Name; 
        $displayname = $_.DisplayName; 
        Set-Service -Name $servicename  -StartupType Disabled 
        $serviceinfo = Get-Service -Name $servicename 
        $startup = $serviceinfo.StartType
        Write-Host "$servicename : $startup : $displayname";  
        Stop-Service -Name $servicename 
        Write-Host "Servicio $servicename stopped"
        }
    }


<#
.SYNOPSIS
Stop and disable SQL Telemtry services.
.DESCRIPTION
Stop and disable SQL Telemtry services.
.PARAMETER Servidor
Server Name, NOT INSTANCE NAME
.OUTPUTS
Server name. List of services found and disabled
.EXAMPLE
PS> IDisable-Telemetry -Servidor SqlServer
SERVER: SQLServer
SQLTELEMETRY : Disabled : SQL Server CEIP service (MSSQLSERVER)
Servicio SQLTELEMETRY stopped
SSISTELEMETRY140 : Disabled : SQL Server Integration Services CEIP service 14.0
Servicio SSISTELEMETRY140 stopped
#>
}