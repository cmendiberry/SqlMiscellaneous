
#Control AG and Replicas
$us = Read-Host "Insert user name" 
$pass = Read-Host "Insert user password" -AsSecureString
$credential = New-Object -TypeName System.Management.Automation.PSCredential ($us, $pass)
$action= Read-Host "Select the correct 1. Server; 2. Pass a txt with the servers list"
If ($action = 1)
    {$srv =  Read-Host "Insert instance name" }
    else {
        $list = Read-Host "Path and file name" 
        $ServersAO = Get-Content -Path $list
         }


#If log file wanted
$LogPath = Read-Host "Insert destination Path for the LogFiles Folder"
$LogPath = $LogPath+"\LogFiles"
$fname = $srv+"_AGHealthLog_"+(Get-date).ToString('yyyyMMddhhmmss')
If (!(Test-Path $LogPath))
    {New-Item -Path $LogPath -ItemType Directory }
$rutaLog = $LogPath + "\" + $fname
Out-File -FilePath $rutaLog -Encoding ASCII -InputObject ""
Add-Content -Path $rutaLog -Value "Comienza el proceso [$([DateTime]::Now)]"


foreach ($item in $ServersAO) {
    $errorlist = Invoke-DbaQuery -SqlInstance $item -SqlCredential $credential -Database "master" -Query "SELECT b.name AGName FROM sys.dm_hadr_availability_group_states a INNER JOIN sys.availability_groups_cluster b on b.group_id = a.group_id WHERE a.synchronization_health_desc not like 'Healthy"     nputFile "C:\Users\cmendiberry.DO\Documents\PSScripts\AGSolution\ErrorQuery.sql" 
    Add-Content -Path $rutaLog -Value "Server $item , State $errorlist"
    #IF ($errorlist)
    #{
        #Send-MailMessage -to  $maillist -Subject "AG Unhealthy"  -SmtpServer $smtpServer -From $from -Priority High -Attachments $rutaLog
    #}