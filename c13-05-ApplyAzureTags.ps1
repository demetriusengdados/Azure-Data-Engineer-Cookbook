$Tags = @{"Project"="Packt"; "Classification"="Public"}
$tr = get-Azresource | Where-Object {$_.Name -like "packt*" -or $_.ResourceGroupName -like "packt*"} 
 foreach ($Res in $tr) {
         Set-AzResource -ResourceGroupName $Res.ResourceGroupName -Name $Res.Name -ResourceType $Res.ResourceType -Tag $tags -Force
      }
