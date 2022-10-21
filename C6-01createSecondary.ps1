#create credential object for the Azure SQL Server admin credential
$sqladminpassword = ConvertTo-SecureString 'Sql@Server@1234' -AsPlainText -Force
$sqladmincredential = New-Object System.Management.Automation.PSCredential ('sqladmin', $sqladminpassword)
New-AzSQLServer -ServerName azadesqlsecondary -SqlAdministratorCredentials $sqladmincredential -Location westus -ResourceGroupName packtadesql

$primarydb = Get-AzSqlDatabase -DatabaseName azadesqldb -ServerName azadesqlserver -ResourceGroupName packtadesql
$primarydb | New-AzSqlDatabaseSecondary -PartnerResourceGroupName packtadesql -PartnerServerName azadesqlsecondary -AllowConnections "All"
