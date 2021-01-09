Function Find-VMachine {param ([Parameter(Mandatory = $true)][string]$VM)
    $Hosts = Get-Content -Path "Ruta\ListadoHosts"
    foreach ($item in $Hosts) 
        {$vmitem = Get-VM -ComputerName $item| Select-Object -ExpandProperty Name|Select-String  -Pattern $vm
         If ($vmitem -like $vm) {Write-Host $vmitem  " "  $item
                                Exit} }
<#
.SYNOPSIS

Dada una bd, crea o modifica el alias.Busco el host que contiene la vm
.DESCRIPTION
Tomando como base un archivo txt con el listado de host, busca la vm solicitada.
.PARAMETER VM
Nombre de la VM

.OUTPUTS

Nombre del  o los Hosts en que se encontro la VM

.EXAMPLE

PS>  Find-VM -VM VMTest
VMTEST   HostTest
#>
}