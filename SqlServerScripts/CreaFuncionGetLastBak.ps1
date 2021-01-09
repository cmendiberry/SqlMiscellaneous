Function Get-LastBak {param ([Parameter(Mandatory = $true)][string]$Server), ([Parameter(Mandatory = $true)]$credential)
Invoke-DbaQuery -SqlInstance $Server -SqlCredential $credential -File "C:\Users\cmendiberry.DO\Documents\PSScripts\LastBackup.sql"
<#
.SYNOPSIS
Ultimo bak a bds del servidor.
.DESCRIPTION
Ultimo bak realizado a las bases qeu esten en linea en el servido pasado por parametro.
.PARAMETER Server
Nombre de la instancia SQL
.PARAMETER credential
credencial para acceder a la instancia.
.OUTPUTS
Server, database_name, last_db_backup_date 
.EXAMPLE
PS> Get-LastBak -server InstSQL    
Server     database_name       last_db_backup_date
------     -------------       -------------------

#>
    }
