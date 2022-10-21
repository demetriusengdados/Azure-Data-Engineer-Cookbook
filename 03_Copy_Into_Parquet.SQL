COPY INTO dbo.transaction_tbl_Parquet
FROM 'https://packatadesynapse.dfs.core.windows.net/synapse/Files/transaction-tbl.parquet'
 WITH (
    FILE_TYPE = 'Parquet',
  
    AUTO_CREATE_TABLE = 'ON'
)
Select top 100 * from dbo.transaction_tbl_Parquet
