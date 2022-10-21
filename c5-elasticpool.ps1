#create credential object for the Azure SQL Server admin credential
$sqladminpassword = ConvertTo-SecureString 'Sql@Server@1234' -AsPlainText -Force
$sqladmincredential = New-Object System.Management.Automation.PSCredential('sqladmin', $sqladminpassword)
# create the azure sql server
New-AzSqlServer -ServerName azadesqlserver -SqlAdministratorCredentials $sqladmincredential -Location "eastus" -ResourceGroupName packtadesql
#Execute the following query to create an elastic pool.
#Create an elastic pool
New-AzSqlElasticPool -ElasticPoolName adepool -ServerName azadesqlserver -Edition standard -Dtu 100 -DatabaseDtuMin 20 -DatabaseDtuMax 100 -ResourceGroupName packtadesql

#create and add db to elastic pool
New-AzSqlDatabase -DatabaseName azadedb1 -ElasticPoolName adepool -ServerName azadesqlserver -ResourceGroupName packtadesql

#create outside of elastic pool
New-AzSqlDatabase -DatabaseName azadedb2 -Edition Standard -RequestedServiceObjectiveName S3 -ServerName azadesqlserver -ResourceGroupName packtadesql


#Add an existing database to the elastic pool
$db = Get-AzSqlDatabase -DatabaseName azadedb2 -ServerName azadesqlserver -ResourceGroupName packtadesql
$db | Set-AzSqlDatabase -ElasticPoolName adepool

#remove a database from an elastic pool
$db = Get-AzSqlDatabase -DatabaseName azadedb2 -ServerName azadesqlserver -ResourceGroupName packtadesql
$db | Set-AzSqlDatabase -Edition Standard -RequestedServiceObjectiveName S3

#remove elastic pool
# get elastic pool object
$epool = Get-AzSqlElasticPool -ElasticPoolName adepool -ServerName azadesqlserver -ResourceGroupName packtadesql
# get all databases in an elastic pool
$epdbs = $epool | Get-AzSqlElasticPoolDatabase
# change the edition of all databases in an elastic pool to standard S3
foreach($db in $epdbs) { 
$db | Set-AzSqlDatabase -Edition Standard -RequestedServiceObjectiveName S3 
}
# Remove an elastic pool
$epool | Remove-AzSqlElasticPool

