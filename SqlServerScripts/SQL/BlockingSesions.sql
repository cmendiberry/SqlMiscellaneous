select  bs.blocking_session_id BlockingSession, c.client_net_address IP, count(*) as QtyBlockedSessions, t.text SessionText
from (
	SELECT blocking_session_id, wait_duration_ms, session_id
	FROM sys.dm_os_waiting_tasks
	WHERE blocking_session_id IS NOT NULL
	) bs
	inner join sys.dm_exec_connections c on c.session_id=bs.blocking_session_id 
CROSS APPLY sys.dm_exec_sql_text (c.most_recent_sql_handle) t
group by blocking_session_id, c.client_net_address, t.text
order by QtyBlockedSessions desc

--==================================================
-- Text of blocking session
SELECT t.text
FROM sys.dm_exec_connections c
CROSS APPLY sys.dm_exec_sql_text (c.most_recent_sql_handle) t
WHERE c.session_id = 0

--kill 



--BlockingSession, qty, who is executing the blocking session
select bs.blocking_session_id, count(*) as cantidad, t.text
from (
	SELECT blocking_session_id, wait_duration_ms, session_id
	FROM sys.dm_os_waiting_tasks
	WHERE blocking_session_id IS NOT NULL
	) bs
inner join sys.dm_exec_connections c on c.session_id =blocking_session_id
CROSS APPLY sys.dm_exec_sql_text (c.most_recent_sql_handle) t
group by blocking_session_id, t.text
order by cantidad desc






--Blocked Processes, Block Type, Blocking Process, Blocking process text
USE Master
GO
SELECT a.session_id BlockedSession, a.wait_duration_ms, a.wait_type, a.blocking_session_id BlockingSession, t.text

FROM sys.dm_os_waiting_tasks a
inner join sys.dm_exec_connections c on c.session_id=a.blocking_session_id 
CROSS APPLY sys.dm_exec_sql_text (c.most_recent_sql_handle) t
WHERE blocking_session_id <> 0
order by blocking_session_id
GO


USE Master
GO
SELECT * 
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0;
GO
