$resourceGroupName = "PacktADE";
$location = 'east us'
$dataFactoryName = "ADFPacktADE2";
$DataFactory = Set-AzDataFactoryV2 -ResourceGroupName $resourceGroupName -Location $location -Name $dataFactoryName
