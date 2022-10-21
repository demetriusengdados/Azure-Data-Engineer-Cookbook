$storageaccountname="packtadeadfadl"
$resourcegroup="PacktADEADF"
$containername="dataloading" 
New-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccountname -SkuName Standard_LRS -Location 'East US' -Kind StorageV2
$storagecontext = (Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccountname).Context; 
New-AzStorageContainer -Name $containername -Context $storagecontext 





