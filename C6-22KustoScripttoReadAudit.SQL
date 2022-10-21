AzureDiagnostics
| where Category == 'SQLSecurityAuditEvents' and action_name_s == "BATCH COMPLETED"
| project event_time_t,ResourceGroup,server_instance_name_s,database_name_s,statement_s,action_name_s,server_principal_name_s,application_name_s,duration_milliseconds_d,response_rows_d,affected_rows_d
|sort by event_time_t desc
