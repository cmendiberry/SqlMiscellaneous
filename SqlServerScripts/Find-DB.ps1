$database=Read-host "Ingrese el nombre, o parte del mismo, de la base de datos a buscar: "
$serversB = Get-Content  e:\AuxDoc\sqlservers.txt
foreach ($item in $serversB) {find-DbaDatabase -SqlInstance $item -Pattern $Database |Select-Object SqlInstance, Name| Format-Table}

