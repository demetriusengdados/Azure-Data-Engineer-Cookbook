Select 
t1.sid, AVG(t2.total_cost),max(t1.order_count) as max_ord_cnt, t2.transaction_date
from dbo.transaction_tbl_t1 t1 inner join dbo.transaction_tbl_t2 t2
on t1.tid = t2.tid
Group by t1.sid,t2.transaction_date;

Select request_id,operation_type,step_index,row_count,total_elapsed_time,command from sys.dm_pdw_request_steps
where request_id in ( Select request_id from sys.dm_pdw_exec_requests where command like '%Select 
t1.sid, AVG(t2.total_cost),max(t1.order_count) as max_ord_cnt%'
and session_id in ( select session_id from sys.dm_pdw_exec_sessions s  ) )
and start_time between dateadd(ss,-20,getdate()) and getdate()
order by total_elapsed_time desc
