Configuration InstallSQL
{
     Import-DscResource -ModuleName PSDesiredStateConfiguration    
     Import-DscResource -ModuleName SqlServerDsc

     $saCred = (Get-Credential -Credential sa)

     node $allnodes.nodename
     {
          WindowsFeature 'NetFramework45'
          {
               Name   = 'NET-Framework-45-Core'
               Ensure = 'Present'
          }

          InstallSQL 'InstallDefaultInstance'
          {
               InstanceName        = 'MSSQLSERVER'
               Features            = 'SQLENGINE', 'FULLTEXT','CONN','IS','BC','SDK','SNAC_SDK'
               SourcePath          = 'F:\'
               SQLSysAdminAccount = "do\sqlsadm"
               ServiceAccountName = 'do\admsql'
               ServiceAccountCredential = (New-Object -TypeName System.Management.Automation.PSCredential $mockDesiredServiceAccountName, (New-Object -TypeName System.Security.SecureString))
               DefaultServiceAccountName = 'NT SERVICE\MSSQLSERVER'
               DefaultServiceAccountCredential = (New-Object -TypeName System.Management.Automation.PSCredential $mockDefaultServiceAccountName, (New-Object -TypeName System.Security.SecureString))
               LocalServiceAccountName = '$($mockSqlServer)\SqlService'
               LocalServiceAccountCredential = (New-Object -TypeName System.Management.Automation.PSCredential $mockLocalServiceAccountName, (New-Object -TypeName System.Security.SecureString))
               ManagedServiceAccountName = '$($mockSqlServer)\sqlservice$'
               ManagedServiceAccountCredential = (New-Object -TypeName System.Management.Automation.PSCredential $mockManagedServiceAccountName, (New-Object -TypeName System.Security.SecureString))
               IntegrationServicesObject = @{Name = 'MsDtsServer150'}
               SQLUserDBDir = $ConfigurationData.NonNodeData.DataDir
               SQLBackupDir = $ConfigurationData.NonNodeData.BakDir
               SQLTempdbDir = $ConfigurationData.NonNodeData.TempDir
               SecurityMode = "SQL"
               SAPwd = $saCred
               DependsOn           = '[WindowsFeature]NetFramework45'
          }
     }
}