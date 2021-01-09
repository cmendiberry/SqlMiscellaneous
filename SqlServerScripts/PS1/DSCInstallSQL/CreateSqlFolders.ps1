Configuration CreateSQLFolder {
    Import-DscResource –ModuleName PSDesiredStateConfiguration
    
    Node $Allnodes.NodeName{
        File CreateDataDir {
            DestinationPath = $ConfigurationData.NonNodeData.DataDir
            Ensure =  'Present'
            Type = 'Directory'
                            }
        File CreateBackupDir {
            DestinationPath = $ConfigurationData.NonNodeData.BackupDir
            Ensure =  'Present'
            Type = 'Directory'
                            }
            
         File CreateBackupDirDiario {
            DestinationPath = $ConfigurationData.NonNodeData.BackupDayDir
            Ensure =  'Present'
            Type = 'Directory'
                            } 
            
         File CreateTempdbDir {
            DestinationPath = $ConfigurationData.NonNodeData.TempdbDir
            Ensure =  'Present'
            Type = 'Directory'
                            }
            
                        }
   # Node $Allnodes.Where{$_.Enviroment -eq 'Testing'}.NodeName {
    #    File CreateBackupDirDiario {
     #       DestinationPath = $ConfigurationData.NonNodeData.TestBackupDir
      #      Ensure =  'Present'
       #     Type = 'Directory'
        #                    } 
            
        # File CreateTempdbDir {
         #   DestinationPath = $ConfigurationData.NonNodeData.TestTempdbDir
          #  Ensure =  'Present'
           # Type = 'Directory'
             #               }
           #                 }
                        

    }

    #$Allnodes from dsc configurationdata
    #Al ejecutarlo, si luego busco los comandos que contienen Configuration, aparecera CreateSqlFolder como comando:
    # Get-Command -Commandtype Configuration

    #Then the MOF are created in the same path the module resides(\Output folder). You'll find a mof per Server in $Allnodes.name
    # CreateSQLFolder -Output .\OUtput\ -ConfigurationData  Ruta.configurationdata.psd1