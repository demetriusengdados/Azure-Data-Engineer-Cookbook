#define the alert trigger condition
$condition = New-AzMetricAlertRuleV2Criteria -MetricName "cpu_percent" -TimeAggregation maximum -Operator greaterthan -Threshold 40 -MetricNamespace "Microsoft.Sql/servers/databases"

#Create the alert with the condition and action defined in previous steps.
$rid = (Get-AzSqlDatabase -ServerName azadesqlserver -ResourceGroupName packtadesql -DatabaseName azadesqldb).Resourceid
Add-AzMetricAlertRuleV2 -Name monitorcpu -ResourceGroupName packtadesql -WindowSize 00:01:00 -Frequency 00:01:00 -TargetResourceId $rid -Condition $condition -Severity 1 -ActionGroupId $ag.id

