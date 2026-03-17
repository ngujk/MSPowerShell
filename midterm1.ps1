Get-ChildItem env:
$env:COMPUTERNAME
$env:USERNAME
$path = Read-Host -Prompt 'Enter a path to search for large files'
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | Where-Object {$_.Length -gt 100MB}
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "You have $largeFilesCount large file(s) in $path"