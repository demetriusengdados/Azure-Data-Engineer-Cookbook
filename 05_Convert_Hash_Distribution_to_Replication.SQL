CREATE TABLE dbo.transaction_tbl_temp WITH ( DISTRIBUTION = REPLICATE)
AS
SELECT * FROM dbo.transaction_tbl_hash;
DROP TABLE dbo.transaction_tbl_hash;
RENAME OBJECT dbo.transaction_tbl_temp to transaction_tbl_hash
GO

SELECT TOP 10 * FROM dbo.transaction_tbl_hash
GO 
