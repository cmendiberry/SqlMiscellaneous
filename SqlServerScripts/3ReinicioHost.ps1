Function Restart-HV{param ([string]$Hy)

$passdo = Get-Content Ruta\PassEncrip | ConvertTo-SecureString
$credo = New-Object -TypeName System.Management.Automation.PSCredential ('usuario', $passdo)
# -Header "Host", "vm", "correo" "Reiniciar"
$archcsv = Import-Csv "Ruta\ArchivoCSV" -Delimiter ";" | Where-Object {$_.host -eq $Hy}
$reinicio = "si"
$asunto = "Reinicio correcto del host $hy"
$body = "Fecha [$([DateTime]::Now)] "
 foreach ($item in $archcsv) {If ($item.Reiniciar -eq "No") {$reinicio = "no"}}
 If($reinicio -eq "no")
    {Send-MailMessage -to CorreoArea -Subject "No se reinicio el Host $hy"  -SmtpServer "ServerSMTP" -From "FROM" -Priority High -Body "Se indico la cancelacion de la tarea Atte, Area"}  
   else {try
            {Restart-Computer -ComputerName $Hy -Credential $credo -force} 
            Catch {$asunto = "Error reinicio el Host $Hy" 
                  $body = $_.Exception.Message}
         Send-MailMessage -to CorreoArea -Subject $asunto -SmtpServer "ServerSMTP" -From "FROM" -Priority High -Body $body}
   <#
    .SYNOPSIS
   Se reinicia el host    
    .DESCRIPTION
    Si todas las vm del host tienen la marca si en reinicio, se procede al reinicio del mismo
    .PARAMETER Host
    Host a reiniciar    
    .OUTPUTS    
    Correo a Area informando el resultado del reinicio
    .EXAMPLE
    PS>  Restart-hv -HOST
    #>
    }