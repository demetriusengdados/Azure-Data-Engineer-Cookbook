 $SqlCredential = Get-AutomationPSCredential -Name "sqlcredentials"
 # Query to execute
 $Query = "select getdate()"

# Execute query
 "----- Running SQL Command "
 invoke-sqlcmd -ServerInstance "azadesqlserver.database.windows.net" -Database "azadesqldb" -Credential $SqlCredential -Query "$Query" -Encrypt
 "`n ----- END SQL Command"
