#Create action group reciever
$whr = New-AzActionGroupReceiver -Name agrscalesql -WebhookReceiver -ServiceUri "https://e8c8271a-63e3-4bb7-b8d4-546f01d142f5.webhook.eus.azure-automation.net/webhooks?token=HE7yRO7xdgbSW6Zz08LnEGaOwv5h%2bVuDRIGEtIQdq9A%3d"

#Create a new action group
$ag = Set-AzActionGroup -ResourceGroupName packtade -Name ScaleSQLAzure -ShortName scaleazure -Receiver $whr
