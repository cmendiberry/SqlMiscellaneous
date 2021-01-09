Function Send-CorreoVM {param ([Parameter(Mandatory = $true)][string]$Hy)

# -Header "Host","Reiniciar", "vm", "correo" "Reiniciar"
$archcsv = Import-Csv "Ruta\Archivocsv" -Delimiter ";" | Where-Object {$_.host -eq $Hy}
#Las que tienen dueño
foreach ($item in $archcsv) 
          {$ho = $item.Host
          $vm = $item.vm
          $correo = $item.correo
          $body= "Estimados $correo, por medio del presente, se informa que el proximo domingo se va a reiniciar el host $ho que contiene su VM: $vm.
De existir inconvenientes, por favor, enviar un correo a area dos dias antes de la fecha prevista para el reinicio.
            Atte, Area."
            If ($Correo -ne "SinAsignar")
                {If ($correo -match "prueba") {Send-MailMessage -to $correo -Subject " = Prueba Aviso de reinicio Host $ho"  -SmtpServer "ServerSMTP" -From "FROM" -Priority High -Body $body}   
                elseIf ($correo -match "area") {Send-MailMessage -to area -Subject "Aviso de reinicio Host $ho"  -SmtpServer "ServerSMTP" -From "FROM" -Priority High -Body $body}   
                    else #$correo
                    {Send-MailMessage -to $correo -Cc area -Subject "Aviso de reinicio Host $ho"  -SmtpServer "ServerSMTP" -From "FROM" -Priority High -Body $body}  
                }
            }
    
<#
.SYNOPSIS
Envia correo a lso propietarios de las vm del host a reiniciar.

.DESCRIPTION
Envia un correo a los propietrios de las vms, de manera que si tienen una necesidad de correr la fecha de reinicio, nos lo comuniquen.
.PARAMETER Host
Host a reiniciar
.OUTPUTS
Correo al propietario con copia a Area.
.EXAMPLE
PS>  Send-CorreoVM -Hy Host
#>
}