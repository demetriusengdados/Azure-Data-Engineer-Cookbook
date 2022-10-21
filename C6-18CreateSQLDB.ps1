# create the resource group
New-AzResourceGroup -Name packtadesql -Location "central us" -force
#create credential object for the Azure SQL Server admin credential
$sqladminpassword = ConvertTo-SecureString 'Sql@Server@1234' -AsPlainText -Force
$sqladmincredential = New-Object System.Management.Automation.PSCredential ('sqladmin', $sqladminpassword)
# create the azure sql server
New-AzSqlServer -ServerName azadesqlserver -SqlAdministratorCredentials $sqladmincredential -Location "central us" -ResourceGroupName packtadesql
#Create the SQL Database
New-AzSqlDatabase -DatabaseName adeawlt -Edition basic -ServerName azadesqlserver -ResourceGroupName packtadesql -SampleName AdventureWorksLT

$clientip = (Invoke-RestMethod -Uri https://ipinfo.io/json).ip
New-AzSqlServerFirewallRule -FirewallRuleName "home" -StartIpAddress $clientip -EndIpAddress $clientip -ServerName azadesqlserver -ResourceGroupName packtadesql

