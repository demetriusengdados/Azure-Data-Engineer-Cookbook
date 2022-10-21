Execute the following commands to create the container in an Azure storage account:
$storageaccountname="packtadestoragev2"
$containername="logfiles"
$resourcegroup="packtadestorage"
#Get the Azure Storage account context
$storagecontext = (Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccountname).Context;
#Create a new container
New-AzStorageContainer -Name $containername -Context $storagecontext

#upload single file to container
Set-AzStorageBlobContent -File "C:\ADECookbook\Chapter1\Logfiles\Logfile1.txt" -Context $storagecontext -Blob logfile1.txt -Container $containername

#get files to be uploaded from the directory
$files = Get-ChildItem -Path "C:\ADECookbook\Chapter1\Logfiles";
#iterate through each file int the folder and upload it to the azure container
foreach($file in $files){
Set-AzStorageBlobContent -File $file.FullName -Context $storagecontext -Blob $file.BaseName -Container $containername -Force
}

