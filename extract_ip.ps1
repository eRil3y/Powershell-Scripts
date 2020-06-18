<#
Created by Ethan Riley
This script was meant to pull IP's out of Cyber Threat Intelligence reports to easily search through other data sources. Future plans: Ideally would like to build in regex patterns for other IOC's such as hashes, filenames, etc.
#>
$input = Read-Host 'Insert path to file'
$regex = '\b(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}\b'
$outfile = Read-Host 'Insert output file path'

Select-String -Path $input -Pattern $regex -AllMatches|%{$_.Matches}|%{$_.Value}|Get-Unique > $Outfile

