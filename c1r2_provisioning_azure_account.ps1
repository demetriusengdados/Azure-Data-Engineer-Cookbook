Connect-AzAccount
New-AzResourceGroup -Name Packtade-powershell -Location 'East US'
New-AzStorageAccount -ResourceGroupName Packtade- powershell -Name packtstoragepowershellv2 -SkuName Standard_LRS -Location 'East US' -Kind StorageV2
