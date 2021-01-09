$rutaLog = "RUTA\ARCHIVOLOG"
Add-Content -Path $rutaLog -Value "************************Revisa estado de vms luego del reinicio del host[$([DateTime]::Now)]***************"
$dia = (Get-Date).day
#1er domingo
If ($dia -le 7)
    {$hvs = Get-Content -Path "Grupo1"}
    #3er domingo
    elseif ( $dia -le 21)
        {$hvs = Get-Content -Path "Grupo2"}
        #4to domingo
        elseif ($dia -ge 22) 
            {$hvs = Get-Content -Path "Grupo3"}
Foreach ($item in $hvs)
      {Get-VM  -ComputerName $item| Where-Object {$_.State -eq 'saved'} | Start-VM
        Add-Content -Path $rutaLog -Value "Se inicio la VM $vm del host $item"}
Add-Content -Path $rutaLog -Value "Fin control de estado de VMs"
Send-MailMessage -to usuariosControl -Subject "Resultado Chequeo VMs" -SmtpServer ServerSMTP -From FROM -Attachments "RUTA\ARCHIVOLOG"



