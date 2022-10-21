#Create an Azure automation account
$automation = New-AzAutomationAccount -ResourceGroupName packtadesql -Name azadeautomation -Location eastus -Plan Basic

#Create a new automation runbook of type PowerShell workflow
$runbook = New-AzAutomationRunbook -Name rnscalesql -Description "Scale up sql azure when CPU is 40%" -Type PowerShellWorkflow -ResourceGroupName packtadesql -AutomationAccountName $automation.AutomationAccountName

#Create automation credentials.
$sqladminpassword = ConvertTo-SecureString 'Sql@Server@1234' -AsPlainText -Force
$sqladmincredential = New-Object System.Management.Automation.PSCredential('sqladmin', $sqladminpassword)
$creds = New-AzAutomationCredential -Name sqlcred -Description "sql azure creds" -ResourceGroupName packtadesql -AutomationAccountName $automation.AutomationAccountName -Value $sqladmincredential

