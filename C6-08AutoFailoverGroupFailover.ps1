$secondarysqlserver = Get-AzSqlServer -ResourceGroupName packtadesql -ServerName azadesqlsecondary
$secondarysqlserver | Switch-AzSqlDatabaseFailoverGroup -FailoverGroupName adefg
