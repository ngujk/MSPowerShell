Get-Content -Path C:\Example.txt | ForEach-Object
{ [pscustomobject]@{ComputerName = $PSItem} } | Test-Connection