
ALTER DATABASE DBName SET EMERGENCY 

ALTER DATABASE DBName SET SINGLE_USER --;– La ponemos en modo de usuario único.

DBCC CHECKDB (DBName , REPAIR_ALLOW_DATA_LOSS )WITH NO_INFOMSGS 

ALTER DATABASE DBName SET MULTI_USER 
