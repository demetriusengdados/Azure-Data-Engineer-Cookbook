#Set Variables
$ResourceGroupName = "PacktADESynapse"
$SynapseAnalyticsWorksapce = "packtadesynapse"
$DatabaseName = "packtadesqlpool"
$label = $DatabaseName + (Get-Date -Format "yyyyMMdd")

#Login using Managed identity
$AzureContext = (Connect-AzAccount -Identity).context
$AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext

$pool = Get-AzSynapseSqlPool -ResourceGroupName $ResourceGroupName -WorkspaceName $SynapseAnalyticsWorksapce -Name $DatabaseName 
$databaseId = $pool.Id -replace "Microsoft.Synapse", "Microsoft.Sql" `
    -replace "workspaces", "servers" `
    -replace "sqlPools", "databases"

New-AzSynapseSqlPoolRestorePoint -WorkspaceName $SynapseAnalyticsWorksapce -Name $DatabaseName -RestorePointLabel $label 
# Get the latest restore point
$restorePoint = $pool | Get-AzSynapseSqlPoolRestorePoint | Select-Object -Last 1
# Restore to same workspace with source SQL pool
$restoredPool = Restore-AzSynapseSqlPool -FromRestorePoint -RestorePoint $restorePoint.RestorePointCreationDate -TargetSqlPoolName $label -ResourceGroupName $pool.ResourceGroupName -WorkspaceName $pool.WorkspaceName -ResourceId $databaseId -PerformanceLevel DW100c
# Pause the restored database
Suspend-AzSynapseSqlPool -WorkspaceName $SynapseAnalyticsWorksapce -Name $label 

