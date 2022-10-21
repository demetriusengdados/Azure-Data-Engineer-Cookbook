CREATE TABLE [dbo].[Transaction_Partitioned_before_oct]
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    CLUSTERED COLUMNSTORE INDEX,
    PARTITION   (   [transaction_date] RANGE RIGHT FOR VALUES
                    (20211001
                    )
                )
)
AS
Select * from dbo.Transaction_Partitioned where 1 = 2;
