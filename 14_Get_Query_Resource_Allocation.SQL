SELECT req.request_id, classifier_name, group_name, 
command,resource_allocation_percentage
  FROM sys.dm_pdw_exec_requests req
  Inner join sys.dm_pdw_exec_sessions ses on req.session_id = ses.session_id   and req.request_id = ses.request_id
  ORDER BY submit_time DESC
