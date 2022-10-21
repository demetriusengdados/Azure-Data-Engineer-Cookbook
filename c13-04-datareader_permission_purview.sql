CREATE USER [packtadepurview] FROM EXTERNAL PROVIDER
GO
EXEC sp_addrolemember 'db_datareader', [packtadepurview]
GO
