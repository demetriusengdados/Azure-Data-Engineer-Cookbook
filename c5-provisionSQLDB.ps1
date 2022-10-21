New-AzResourceGroup -Name packtadesql -Location "eastus"    
#create credential object for the Azure SQL Server admin credential
$sqladminpassword = ConvertTo-SecureString 'Sql@Server@1234' -AsPlainText -Force
$sqladmincredential = New-Object System.Management.Automation.PSCredential('sqladmin', $sqladminpassword)
# create the azure sql server
New-AzSqlServer   -ServerName azadesqlserver -SqlAdministratorCredentials $sqladmincredential -ResourceGroupName packtadesql -Location "eastus"
New-AzSqlDatabase -DatabaseName azadesqldb -Edition basic -ServerName azadesqlserver -ResourceGroupName packtadesql

#connect to SQL DB
$clientip = (Invoke-RestMethod -Uri https://ipinfo.io/json).ip
New-AzSqlServerFirewallRule -FirewallRuleName "home" -StartIpAddress $clientip -EndIpAddress $clientip -ServerName azadesqlserver -ResourceGroupName packtadesql

