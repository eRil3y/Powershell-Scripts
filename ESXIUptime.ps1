<# Created by Ethan Riley
This script is made to check the uptime of the VMware ESXI hosts.
Use case and context for the script was to quickly check uptime after a power outage.
#>
$Server = Read-Host -Prompt "Name/IP Address of vCenter server"
Connect-VIServer -Server $Server
Write-Host "`n`n[*] Connected to:"$Server
Write-Host "[*] Gathering information from VM's..."

Get-VMHost | Select Name,@{N="Uptime"; E={New-Timespan -Start $_.ExtensionData.Summary.Runtime.BootTime -End (Get-Date) | Select -ExpandProperty Days}} | Format-Table -AutoSize

<#
Disconnect-VIServer -Server $Server -Confirm:$false
Write-Host "[*] Disconnecting from"$Server
#>