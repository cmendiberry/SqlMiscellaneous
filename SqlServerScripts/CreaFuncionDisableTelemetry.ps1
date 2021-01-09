Function Disable-telemetry {param ([Parameter(Mandatory = $true)][string]$Servidor)

$pass = Get-Content Ruta\PassEncrip | ConvertTo-SecureString
$credo = New-Object -TypeName System.Management.Automation.PSCredential ('usuario', $pass)
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
Detiene y deshabilita los servicios de telemetria de SQL.
.DESCRIPTION
Detiene y deshabilita los servicios de telemetria de SQL.
.PARAMETER Servidor
Nombre del servidor. NO DE LA INSTANCIA SQL
.OUTPUTS
Nombre del servidor. Los servicios hallados deshabilitados y detenidos.
.EXAMPLE
PS> IDisable-Telemetry -Servidor ServerSQL
SERVER: ServerSQL
SQLTELEMETRY : Disabled : SQL Server CEIP service (MSSQLSERVER)
Servicio SQLTELEMETRY stopped
SSISTELEMETRY140 : Disabled : SQL Server Integration Services CEIP service 14.0
Servicio SSISTELEMETRY140 stopped
#>}