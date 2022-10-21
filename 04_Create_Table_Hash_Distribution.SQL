CREATE TABLE dbo.transaction_tbl_hash WITH (DISTRIBUTION = HASH(SID))
AS 
Select * from dbo.ext_transaction_tbl;
GO
Select top 10 * from dbo.transaction_tbl_hash
