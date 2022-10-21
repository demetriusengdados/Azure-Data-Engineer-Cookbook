$primarydb = Get-AzSqlDatabase -DatabaseName azadesqldb -ServerName azadesqlserver -ResourceGroupName packtadesql
$primarydb | Remove-AzSqlDatabaseSecondary -PartnerResourceGroupName packtadesql -PartnerServerName azadesqlsecondary
