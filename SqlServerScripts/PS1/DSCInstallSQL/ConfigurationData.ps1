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
        DataDir = "D:\DBs"
        BakDir = "E:\Backups"
        TempDir = "E:\Tempdb"
        TestBakDir = "D:\Backups"
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