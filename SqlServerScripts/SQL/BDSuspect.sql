--Como reparar Bases de Datos Sospechosas (SUSPECT)

--A) Mejor opción intenta recuperar la bd:
  -- 1) Más simple
	USE master
	GO
	EXEC SP_CONFIGURE 'Allow updates',1
	GO
	RECONFIGURE WITH OVERRIDE
	GO
	EXEC sp_resetstatus 'BBDD_Suspect'
	GO
	DBCC DBRECOVER('BBDD_Suspect')
	GO
	USE master
	GO
	EXEC SP_CONFIGURE 'Allow updates',0
	GO
	RECONFIGURE WITH OVERRIDE
	GO

--   2) Si no funciona (1): 
	ALTER DATABASE BBDD_Suspect SET EMERGENCY;
	ALTER DATABASE BBDD_Suspect SET SINGLE_USER;
	DBCC CHECKDB (BBDD_Suspect , 'REPAIR_ALLOW_DATA_LOSS');
	ALTER DATABASE BBDD_Suspect  SET MULTI_USER;

--B) Sólo busca ponerla operativa, requiere reinicio del servicio con la consecuencia de dejar todos los sistemas offline:
USE master
GO
EXEC SP_CONFIGURE 'Allow updates',1
GO
RECONFIGURE WITH OVERRIDE
GO
EXEC sp_resetstatus 'BBDD_Suspect'
GO

-- “Reiniciar la instancia de SQL Server”

USE master
GO
EXEC SP_CONFIGURE 'Allow updates',0
GO
RECONFIGURE WITH OVERRIDE
GO

