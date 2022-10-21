$Resourcegroup = "PacktADESynapse"
$Synapse_ws_name = "packtadesynapse"
$storage_name = "packtadesynapse"
$purview = "packtadepurview"
$role = Get-AzADServicePrincipal -DisplayName $purview
$storage = Get-AzStorageAccount -ResourceGroupName $Resourcegroup -Name $storage_name
New-AzRoleAssignment -ObjectId $role.id -RoleDefinitionName "Storage Blob Data Reader" -Scope $storage.id
$synapse = Get-AzSynapseWorkspace -ResourceGroupName $Resourcegroup -Name $Synapse_ws_name
New-AzRoleAssignment -ObjectId $role.id -RoleDefinitionName "Reader" -Scope $synapse.id
