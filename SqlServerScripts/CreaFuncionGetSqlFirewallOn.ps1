function Get-SqlFirewallOn {
    param ( [string]$SQLSrv )
 
 IF ($SQLSrv -eq $null){$Servers = Get-Content -Path "C:\Users\cmendiberry.DO\Documents\PSScripts\ListaSrvSQL.txt" }   
    else {
        $Servers = $SQLSrv
    }

foreach ($item in $servers) {Invoke-Command -ComputerName VMtestSql -ScriptBlock {get-netfirewallprofile -all | Where-Object -Property Enabled -EQ True | Select-Object pscomputername, name, Enabled }} 

<#
.SYNOPSIS

Busca firewall habilitado en SQL

.DESCRIPTION
Si se pasa un sql por parametro, busca si en ese equipo está habiitado el firewall.
.PARAMETER SQLSrv
Nombres/s de servidores a Verificar. si está vacío, busca en un listado de servidores productivos.

.OUTPUTS

System.String.Lista el nombre del perfil de firewall, si está habilitado y el nombre del equipo OLO de los equipos qeu tienen algun perfil habilitado en True. Se estan todos habiñitados en False, no devuelve nada

.EXAMPLE

PS> Get-SqlFirewallOn -SQLSrv VMTestSQL
name           : Private
Enabled        : True
PSComputerName : VMtestSql
RunspaceId     : c11363ce-d9f1-4cf4-97d6-bb451f2ea5fc

name           : Public
Enabled        : True
PSComputerName : VMtestSql
RunspaceId     : c11363ce-d9f1-4cf4-97d6-bb451f2ea5fc

#>
}
}