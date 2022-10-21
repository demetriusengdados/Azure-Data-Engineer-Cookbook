 Select s.supplier_name,sum(total_cost)
 FROM [dbo].[transaction_tbl] t INNER JOIN dbo.supplier s 
on t.sid = s.sid
 Group by s.supplier_name

Select request_id,operation_type,step_index,row_count,
total_elapsed_time,command from sys.dm_pdw_request_steps
where request_id in ( Select request_id from sys.dm_pdw_exec_requests where command like '%Select s.supplier_name,sum(total_cost)%'
and session_id in ( select session_id from sys.dm_pdw_exec_sessions s  ) )
and start_time between dateadd(ss,-20,getdate()) and getdate()
order by step_index 
