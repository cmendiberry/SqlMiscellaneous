select top 20 login_time, nt_user_name, nt_domain, status
from sys.dm_exec_sessions
where nt_domain is not null 
order by login_time desc

SELECT s.session_id, c.connect_time, c.client_net_address,s.login_time, s.login_name, c.protocol_type , c.auth_scheme, s.HOST_NAME, s.program_name
FROM sys.dm_exec_sessions s
JOIN sys.dm_exec_connections c
    ON s.session_id = c.session_id
--where login_name like '%mccastro%'
	--where auth_scheme like'%%'
order by login_time desc