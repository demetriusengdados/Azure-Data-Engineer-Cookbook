CREATE table dbo.transaction_tbl_t1 WITH (DISTRIBUTION = HASH(pid))
AS 
SELECT *
FROM dbo.transaction_tbl

CREATE table dbo.transaction_tbl_t2 WITH (DISTRIBUTION = HASH(tid))
AS 
SELECT *
FROM dbo.transaction_tbl
