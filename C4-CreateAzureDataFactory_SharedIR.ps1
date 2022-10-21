$resourceGroupName = "PacktADE";
$location = 'east us'
$dataFactoryName = "ADFPacktSharedIR";
$DataFactory = Set-AzDataFactoryV2 -ResourceGroupName $resourceGroupName -Location $location -Name $dataFactoryName
