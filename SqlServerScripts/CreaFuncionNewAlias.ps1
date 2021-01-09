Function New-DBAlias {param ([Parameter(Mandatory = $true)][string]$ServerDest, [Parameter(Mandatory = $true)][string]$BDName)
    $existe =  Get-DnsServerResourceRecord -ZoneName "scba.net" -RRType CName -ComputerName do.scba.gov.ar | where-object hostname -Like $BDName|Select-Object -Property hostname
    If ($BDName -eq $Existe.hostname) 
    {Remove-DnsServerResourceRecord -ZoneName scba.net -Name $BDName -RRType cname -ComputerName do.scba.gov.ar -Force}
    Add-DnsServerResourceRecordCName -ZoneName "scba.net" -HostNameAlias $ServerDest -Name $BDName -ComputerName do.scba.gov.ar
    Get-DnsServerResourceRecord -ZoneName "scba.net" -RRType CName -ComputerName do.scba.gov.ar | where-object hostname -Like $BDName
<#
.SYNOPSIS

Dada una bd, crea o modifica el alias.

.DESCRIPTION
Busca el alias para una bd, si tiene uno creado, lo elimina y crea el nuevo, si no, lo crea.
.PARAMETER ServerDest
UPN del sevidor en el que está la bd.

.PARAMETER BDName
Nombre alias a la bd y servidor.

.OUTPUTS

informe del alias creado.

.EXAMPLE

PS>  New-DBAlias -ServerDest "sqlomdo.do.scba.gov.ar" -BDName "DBP-DiGestion"

HostName                  RecordType Type       Timestamp            TimeToLive      RecordData
--------                  ---------- ----       ---------            ----------      ----------
DBP-DiGestion             CNAME      5          0                    00:02:00        sqlomdo.do.scba.gov.ar.
#>
}