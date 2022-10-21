#create credential object for the Azure SQL Server admin credential
$sqladminpassword = ConvertTo-SecureString 'Sql@Server@1234' -AsPlainText -Force
$sqladmincredential = New-Object System.Management.Automation.PSCredential ('sqladmin', $sqladminpassword)
New-AzSQLServer -ServerName azadesqlsecondary -SqlAdministratorCredentials $sqladmincredential -Location westus -ResourceGroupName packtadesql

New-AzSqlDatabaseFailoverGroup -ServerName azadesqlserver -FailoverGroupName adefg -PartnerResourceGroupName packtadesql -PartnerServerName azadesqlsecondary -FailoverPolicy Automatic -ResourceGroupName packtadesql

