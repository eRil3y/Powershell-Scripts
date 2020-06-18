<#Created by Ethan Riley
Takes a list as input, in this case a list of old AD computer entries, and removes them from AD.

Note: User will be prompted for path to list of computernames for deletion.

TROUBLESHOOT
NOTE: Be sure to trim trailing spaces in notepad++ before executing. If list entries have trailing spaces they will be skipped by the script. In notepad++ under
Edit -> Blank Operations -> Trim Trailing Spaces
#>

$list = Read-Host -Prompt "Enter path to list of computers to delete from AD"

Get-Content $list `
| % { Get-ADComputer -Filter { Name -eq $_ } } `
| Remove-ADComputer -Confirm:$False -Verbose

