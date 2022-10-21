# define the runbook parameters
$Params = @{"SQLSERVERNAME"="azadesqlserver";"DATABASENAME" ="azadesqldb";"CREDENTIAL"="sqlcred"}
# Create a webhook
$expiry = (Get-Date).AddDays(1)
New-AzAutomationWebhook -Name rnscaleazure -RunbookName $runbook.Name -Parameters $Params -ResourceGroupName packtadesql -AutomationAccountName $automation.AutomationAccountName -IsEnabled $true -ExpiryTime $expiry
