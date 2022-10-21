$db = Get-AzSqlDatabase -DatabaseName azadesqldb -ServerName azadesqlserver -ResourceGroupName packtadesql
$db|Add-AzSqlDatabaseToFailoverGroup -ResourceGroupName packtadesql -ServerName azadesqlserver -FailoverGroupName adefg
