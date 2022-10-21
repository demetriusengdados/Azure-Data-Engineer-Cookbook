Declare @request_id nvarchar(32),@session_id nvarchar(32)
Select 
t1.sid, AVG(t2.total_cost),max(t1.order_count) as max_ord_cnt, t2.transaction_date
from dbo.transaction_tbl t1 inner join dbo.transaction_tbl t2
on t1.tid = t2.tid
Group by t1.sid,t2.transaction_date;

Select @request_id = req.request_id,@session_id = req.session_id
from sys.dm_pdw_exec_requests req 
where req.command like 'Select 
t1.sid, AVG(t2.total_cost),max(t1.order_count) as max_ord_cnt%'
and req.start_time between dateadd(ss,-30,getdate()) and getdate()

Select  req.request_id, result_cache_hit, req.command,
 req.total_elapsed_time as total_query_elapsed_time
 from sys.dm_pdw_exec_requests req 
  where req.request_id = @request_id and req.session_id = @session_id

Select req_steps.command, req_steps.location_type,req_steps.step_index,req_steps.operation_type
From sys.dm_pdw_request_steps req_steps
WHERE req_steps.request_id = @request_id
order by req_steps.step_index 
