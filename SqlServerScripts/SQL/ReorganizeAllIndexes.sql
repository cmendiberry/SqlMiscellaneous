
SELECT  
'ALTER INDEX ' + i.name + ' ON ' + t.name + ' REORGANIZE;' 
FROM sys.dm_db_index_physical_stats(NULL,NULL,NULL,NULL,NULL) AS a
INNER JOIN sys.indexes AS i ON a.object_id = i.object_id AND a.index_id = i.index_id
join  sys.tables t on t.object_id=i.object_id
where i.name is not null