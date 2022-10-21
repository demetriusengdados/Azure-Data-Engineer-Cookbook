EXECUTE AS USER = 'AppUser'
Select getdate(), t1.pid,t1.c1,t2.c2,sum(t2.order_count)
FROM dbo.transaction_tbl t1 
inner join dbo.transaction_tbl t2 on t1.transaction_date = t2.transaction_date
WHERE t1.tid < 1000
Group by t1.pid,t1.c1,t2.c2
order by sum(t2.order_count)
REVERT;  
GO
