Get-Process
$processes = Get-Process
$processes
Get-Process | Where-Object {$_.CPU -gt 5000}
Get-Process | Sort-Object WorkingSet64 -Descending 
$processes | Where-Object {$_.CPU -gt 5000}
$processes | Sort-Object WorkingSet64 -Descending 