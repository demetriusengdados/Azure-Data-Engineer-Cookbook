CREATE TABLE dbo.transaction_tbl_copy([tid] bigint,
    [transaction_date] date,
    [order_count] bigint,
    [total_cost] bigint,
    [sid] bigint,
    [pid] bigint,
    [c1] nvarchar(200),
    [c2] nvarchar(200))
  WITH (  DISTRIBUTION  = ROUND_ROBIN);
    GO
COPY INTO dbo.transaction_tbl_copy 
FROM 'https://packatadesynapse.dfs.core.windows.net/synapse/Files/transaction-tbl.csv'
WITH 
(  
FILE_TYPE = 'CSV',
MAXERRORS = 10,
FIRSTROW = 2)
Select top 100 * from dbo.transaction_tbl_copy
