--Sentencia para deshabilitar todos los jobs
SELECT 'exec msdb..sp_update_job @job_name = '''+NAME+''', @enabled = 0' FROM msdb..sysjobs
/*
exec msdb..sp_update_job @job_name = 'BorraModelos', @enabled = 0
exec msdb..sp_update_job @job_name = 'CommandLog Cleanup', @enabled = 0
exec msdb..sp_update_job @job_name = 'GetData', @enabled = 0
exec msdb..sp_update_job @job_name = 'PMBackupAO', @enabled = 0
exec msdb..sp_update_job @job_name = 'PMBackupNoAO', @enabled = 0
exec msdb..sp_update_job @job_name = 'PMBackupTRN', @enabled = 0
exec msdb..sp_update_job @job_name = 'PMBorraHistorial', @enabled = 0
exec msdb..sp_update_job @job_name = 'PMBorraHistorialAO', @enabled = 0
exec msdb..sp_update_job @job_name = 'PMIntegridadBDs', @enabled = 0
exec msdb..sp_update_job @job_name = 'PMMantenimientoIXYEstad', @enabled = 0
exec msdb..sp_update_job @job_name = 'syspolicy_purge_history', @enabled = 0
*/


--Sentencia para habilitar todos los jobs
SELECT 'exec msdb..sp_update_job @job_name = '''+NAME+''', @enabled = 1' FROM msdb..sysjobs