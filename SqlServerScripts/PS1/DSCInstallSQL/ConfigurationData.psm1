#Para Usar con varias instancias
@{
    Allnodes = @(
            @{NodeName = "NOMBREINS" 
              Enviroment = "Test"
             },
             @{NodeName = "NOMBREINS" 
              Enviroment = "Production"
             },
             @{NodeName = "*" 
              PSDscAllowPlainTextPassword =$true
             }
            
    NonNodeData = @{
        DataDir = "D:\DBs\"
        BackupDayDir = "E:\Backups\Diario\"
        BackupDir = "E:\Backups\"
        TempDBDir = "E:\Tempdb\"
        #TestBakupDir = "D:\Backups\"
        #TestTempDBDir = "D:\TemdDB\"
        InstallDir = "F:\"
        ConfigOptions = @(
            @{
                Name = "backup compression default"
                Setting =  1
            },
            @{
                Name = "max degree of paralellism"
                Setting =  8
            }
        )
    }
         
    )
}

EnvironmentVariable_Path -OutputPath:"C:\EnvironmentVariable_Path"