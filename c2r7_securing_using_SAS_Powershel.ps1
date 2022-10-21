$resourcegroup = "packtadestorage"
	 
  $storageaccount = "packtadestoragev2"
	 
  #get storage context
	 
  $storagecontext = (Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccount). Context

#set the token expiry time
  $starttime = Get-Date
  $endtime = $starttime.AddDays(1)
  # get the SAS token into a variable
  $sastoken = New-AzStorageBlobSASToken -Container "logfiles" -Blob "logfile1.txt" -Permission lr -StartTime $starttime -ExpiryTime $endtime -Context $storagecontext
# view the SAS token.

$sastoken

#get storage account context using the SAS token
$ctx = New-AzStorageContext -StorageAccountName $storageaccount -SasToken $sastoken
#list the blob details
Get-AzStorageBlob -blob "logfile1.txt" -Container "logfiles" -Context $ctx


Set-AzStorageBlobContent -File C:\ADECookbook\Chapter1\ Logfiles\Logfile1.txt -Container logfiles -Context $ctx

$resourcegroup = "packtadestorage"
	 
$storageaccount = "packtadestoragev2"
	 
#get storage context
 
$storagecontext = (Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccount). Context
$starttime = Get-Date
$endtime = $starttime.AddDays(1)
New-AzStorageContainerStoredAccessPolicy -Container logfiles -Policy writepolicy -Permission lw -StartTime $starttime -ExpiryTime $endtime -Context $storagecontext

get the SAS token
$sastoken = New-AzStorageContainerSASToken -Name logfiles -Policy writepolicy -Context $storagecontext

#get the storage context with SAS token
$ctx = New-AzStorageContext -StorageAccountName $storageaccount -SasToken $sastoken
#list blobs using SAS token
Get-AzStorageBlob -Container logfiles -Context $ctx

