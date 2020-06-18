<#Created by Ethan Riley
Script compares two text files, finds the reference object (<=) not found in the difference object (=>) and writes to an output text file.
NOTE: Replace text files with whatever text files you want to compare.
NOTE: Change the side indicator to whatever you are looking for ("<=, ==, =>)
#>
$Ref = Read-Host -Prompt "Path to reference text file"
$Dif = Read-Host -Prompt "Path to file you want to compare against"
$Out = Read-Host -Prompt "Path to outfile"

Compare-Object -ReferenceObject $(Get-Content $Ref) -DifferenceObject $(Get-Content $Dif) `
| ?{$_.sideIndicator -eq "<="} | select inputobject `
| Out-File $Out -Append