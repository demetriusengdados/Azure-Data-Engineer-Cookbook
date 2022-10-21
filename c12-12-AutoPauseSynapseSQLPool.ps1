$ResourceGroupName = "PacktADESynapse"
$SynapseAnalyticsWorksapce = "packtadesynapse"
$DatabaseName = "packtadesqlpool"
$instanceName = $SynapseAnalyticsWorksapce + ".sql.azuresynapse.net"

$Query = "
 select count(*) as request_count from sys.dm_pdw_exec_requests req inner join sys.dm_pdw_exec_sessions ss on ss.session_id = req.session_id
 where 
 (req.status in ('Running','Suspended') or (req.submit_time > DATEADD(minute, -30, GETDATE()) or req.start_time > DATEADD(minute, -30, GETDATE()) or req.end_time > DATEADD(minute, -30, GETDATE())))
and req.[label] not like 'SynapseAutoPause Job' and ss.app_name not in ('Internal') OPTION (LABEL = 'SynapseAutoPause Job')"

$pool = Get-AzSynapseSqlPool -ResourceGroupName $ResourceGroupName -WorkspaceName $SynapseAnalyticsWorksapce -Name $DatabaseName 

if ($pool.Status -like 'paused' )
{
Write-Output "Synapse SQL DB is already paused"
}

else
{
    $result = invoke-sqlcmd -ServerInstance $instanceName -Database $DatabaseName -Credential $SynapseCred -Query $Query -Encrypt
    if ($result.request_count -eq 0)
 {
     $msg = "SQL Pool Database " + $DatabaseName + " being paused as no active transctions found" 
    Write-Output  $msg
    Suspend-AzSynapseSqlPool -WorkspaceName $SynapseAnalyticsWorksapce -Name $DatabaseName 
     $msg = "paused azure synapse sql pool - " + $DatabaseName 
    Write-Output $msg
 }
 else 
 {
    $msg = $DatabaseName + " cant be paused as there are active transactions"
    Write-Output $msg
 }
 
}




