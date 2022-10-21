$secondarydb = Get-AzSqlDatabase -DatabaseName azadesqldb -ServerName azadesqlsecondary -ResourceGroupName packtadesql
$secondarydb | Set-AzSqlDatabaseSecondary -PartnerResourceGroupName packtadesql -Failover
