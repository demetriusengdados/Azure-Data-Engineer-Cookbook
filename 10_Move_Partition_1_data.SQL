ALTER TABLE Transaction_Partitioned SWITCH PARTITION 1 to Transaction_Partitioned_before_oct PARTITION 1
GO
Select name,boundary_id,value,rows 
from dbo.table_partition_boundary
where value = 20211001
GO
