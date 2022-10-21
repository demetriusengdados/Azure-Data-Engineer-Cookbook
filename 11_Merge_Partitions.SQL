ALTER TABLE Transaction_Partitioned MERGE RANGE('20211001')
GO
Select name,boundary_id,value 
from dbo.table_partition_boundary
where name = 'Transaction_Partitioned'
