CREATE TABLE [dbo].[Transaction_Partitioned]
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    CLUSTERED COLUMNSTORE INDEX,
    PARTITION   (   [transaction_date] RANGE RIGHT FOR VALUES
                    (20211001,20211101,20211201,20220101,20220201,20220301
                    )
                )
)
AS
Select * from dbo.ext_transaction_tbl
GO
Select min(transaction_date) as min_trans_dt,max(transaction_date) as max_trans_dt 
from Transaction_Partitioned;
GO
Select * from dbo.table_partition_boundary
GO
