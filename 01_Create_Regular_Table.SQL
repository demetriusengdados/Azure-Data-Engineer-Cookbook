CREATE TABLE dbo.transaction_tbl WITH (DISTRIBUTION = ROUND_ROBIN)
AS 
Select * from dbo.ext_transaction_tbl;
GO
Select TOP 100 *  from dbo.transaction_tbl
GO
