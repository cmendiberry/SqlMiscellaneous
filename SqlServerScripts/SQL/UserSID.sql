select SUSER_SID ('LOGIN')
Use master
GO
CREATE Login LOGIN WITH PASSWORD = 'Password', SID = ;
GO