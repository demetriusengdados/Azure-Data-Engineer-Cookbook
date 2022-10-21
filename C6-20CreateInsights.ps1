$ResourceGroup = "packtadesql"
$WorkspaceName = "packtadesqllgw" 
$Location = "central us"
# Create the workspace
New-AzOperationalInsightsWorkspace -Location $Location -Name $WorkspaceName -ResourceGroupName $ResourceGroup
