#set the parameter values
$storageaccountname="packtadestoragev2"
$resourcegroup="packtadestorage"
$sourcecontainername="logfiles"
$destcontainername="textfiles"
#Get storage account context
$storagecontext = (Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccountname).Context
# create the container
$destcontainer = New-AzStorageContainer -Name $destcontainername -Context $storagecontext
$destcontainer

#copy a single blob from one container to another

Start-CopyAzureStorageBlob -SrcBlob "Logfile1"
-SrcContainer $sourcecontainername -DestContainer
$destcontainername -Context $storagecontext -DestContext
$storagecontext

# copy all blobs in new container

Get-AzStorageBlob -Container $sourcecontainername
-Context $storagecontext | Start-CopyAzureStorageBlob
-DestContainer $destcontainername -DestContext
$storagecontext -force

# list the blobs in the destination container

(Get-AzStorageContainer -Name $destcontainername -Context
$storagecontext).CloudBlobContainer.ListBlobs()

# Get the blob reference
$blob = Get-AzStorageBlob -Blob *Logfile2* -Container $sourcecontainername -Context $storagecontext
#Get current access tier
$blob
#change access tier to cool
$blob.ICloudBlob.SetStandardBlobTier("cool")
#Get the modified access tier
Get-AzStorageBlob -Blob *Logfile2* -Container $sourcecontainername -Context $storagecontext 

#get blob reference
$blobs = Get-AzStorageBlob -Container $destcontainername -Context $storagecontext
#change the access tier of all the blobs in the container
$blobs.icloudblob.setstandardblobtier("Cool")
#verify the access tier
Get-AzStorageBlob -Container $destcontainername -Context $storagecontext

#get the storage context
$storagecontext = (Get-AzStorageAccount -ResourceGroupName
$resourcegroup -Name $storageaccountname).Context
#download the blob
Get-AzStorageBlobContent -Blob "Logfile1" -Container
$sourcecontainername -Destination C:\ADECookbook\Chapter1\ Logfiles\ -Context $storagecontext -Force 

#get the storage context

$storagecontext = (Get-AzStorageAccount -ResourceGroupName
$resourcegroup -Name $storageaccountname).Context

Remove-AzStorageBlob -Blob "Logfile2" -Container
$sourcecontainername -Context $storagecontext

