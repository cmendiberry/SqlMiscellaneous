-- disable all constraints
USE NOMBREBD
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

-- disable all indexes
USE NOMBREBD
EXEC sp_msforeachtable ALTER INDEX ALL ON ? DISABLE'

-- enable identity insert
exec sp_MSforeachtable 'SET IDENTITY_INSERT ? ON'

-- enable all constraints
USE NOMBREBD
exec sp_msforeachtable @command1="print '?'",@command2="ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"


-- enables all indexes
USE NOMBREBD
EXEC sp_msforeachtable 'ALTER INDEX ALL ON ? REBUILD'

-- disable identety insert de a una tabla
exec sp_MSforeachtable 'SET IDENTITY_INSERT ? on'








