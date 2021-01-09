$rutaLog = "Ruta\ArchivoLog"
#Out-File -FilePath $rutaLog -Encoding ASCII -InputObject "************" -Append
Add-Content -Path $rutaLog -Value "Comienza el proceso De Validacion de reinicios [$([DateTime]::Now)]"
$dia = (Get-Date).day
#2do lunes
If ( $dia -le 14)
    {$hvs = Get-Content -Path "Grupo1"
     Add-Content -Path $rutaLog -Value "Envia correo con el grupo1"}
        #3er lunes
        elseif ($dia -ge 15) 
            {$hvs = Get-Content -Path "Grupo2"
             Add-Content -Path $rutaLog -Value "Envia correo con el grupo2"}
Add-Content -Path $rutaLog -Value "Antes del foreach"
Foreach ($item in $hvs)
    {Add-Content -Path $rutaLog -Value "Entro al foreach"
     Send-CorreoVM -Hy $item
     Start-Sleep -Seconds 5
     Add-Content -Path $rutaLog -Value "Envia correo por vm $item"}
Add-Content -Path $rutaLog -Value "Fin pedido de Validacion de reinicios"