RESTORE DATABASE [AdventureWorksLT2019] FROM  DISK = N'c:\temp\AdventureWorksLT2019.bak' WITH  FILE = 1,  MOVE N'AdventureWorksLT2012_Data' TO N'F:\data\AdventureWorksLT2012.mdf',  MOVE N'AdventureWorksLT2012_Log' TO N'F:\log\AdventureWorksLT2012_log.ldf',  NOUNLOAD,  STATS = 5
GO
