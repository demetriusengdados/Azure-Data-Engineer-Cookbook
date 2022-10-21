CREATE table dbo.transaction_tbl_skew WITH (DISTRIBUTION = HASH(pid_skew))
AS 
SELECT tid,sid, case when pid > 2 then 8 else pid end as pid_skew,
transaction_date,
order_count,c1,c2 
FROM dbo.transaction_tbl
