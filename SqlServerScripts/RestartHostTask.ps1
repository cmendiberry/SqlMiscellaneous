$rutaLog = "Ruta\ArchivoLog"
Add-Content -Path $rutaLog -Value "************Comienza el proceso de reinicios [$([DateTime]::Now)]************"
$dia = (Get-Date).day
#3er domingo
If ($dia -le 21)
    {$hvs = Get-Content -Path "Grupo1"
     Add-Content -Path $rutaLog -Value "Reinicia hosts del grupo1"}
        #4to domingo
        elseif ($dia -ge 22)
            {$hvs = Get-Content -Path "Grupo2"
             Add-Content -Path $rutaLog -Value "Reinicia hosts del grupo2"}
Foreach ($item in $hvs)
    {Restart-HV -Hy $item
     Start-Sleep -Seconds 300
     Add-Content -Path $rutaLog -Value "Reinicia host $item"}    
Add-Content -Path $rutaLog -Value "************Fin pedido de Validacion de reinicios************"