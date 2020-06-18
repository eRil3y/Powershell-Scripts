<# Created by Ethan Riley
 Script to connect to a vCenter server and check the Power State and VLAN of a list of VM's.
 NOTE: Have to input username and password to login to the vCenter server 'Connect-VIServer'
 NOTE: Have to specify the path and filename for the list of VM's and where you want the output to be written to.
#>

$Server = Read-Host -Prompt "Name/IP Address of vCenter server"
$list = Read-Host -Prompt "Path to list of unmanaged epo systems"
$outfile = Read-Host -Prompt "Path to where you want to write the output file"

Connect-VIServer -Server $Server
Write-Host "`n`n[*] Connected to:"$Server
Write-Host "[*] Gathering information from VM's..."

Get-Content -Path $list | foreach {Get-VM $_} | Select-Object Name,PowerState,@{n="NetworkName"; e={(Get-NetworkAdapter -VM $_ `
| %{$_.NetworkName}) -join ","}} `
| sort PowerState,NetworkName,Name | Format-Table -AutoSize `
| Out-File $outfile

Write-Host "[*] Information gathering complete"

Disconnect-VIServer -Server $Server -Confirm:$false

Write-Host "[*] Disconnecting from"$Server
Write-Host "[*] Output successflly created at:"$outfile