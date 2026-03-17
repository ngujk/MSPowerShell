Import-Module ActiveDirectory

$Domain = "DC=hiddenzone,DC=local"

$Departments = @{
    "IT-Toronto"        = @("Max","Bob")
    "HR-Vancouver"      = @("Maggie","Linda")
    "Sales-Calgary"     = @("Andrew","Philip")
    "Warehouse-Toronto" = @("Craig","Larry")
}
$DefaultPassword = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force

foreach ($Department in $Departments.Keys) {

    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$Department'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $Department -Path $Domain
        Write-Host "Created OU: $Department"
    } else {
        Write-Host "OU already exists: $Department"
    }

    foreach ($User in $Departments[$Department]) {

        if (-not (Get-ADUser -Filter "SamAccountName -eq '$User'" -ErrorAction SilentlyContinue)) {

            New-ADUser `
                -EmployeeID $User `
                -Name $User `
                -SamAccountName $User `
                -UserPrincipalName "$User@hiddenzone.local" `
                -AccountPassword $DefaultPassword `
                -Enabled $true `
                -Path "OU=$Department,$Domain"

            Write-Host "Created user: $User in $Department"
        } else {
            Write-Host "User already exists: $User"
        }
    }
}
Write-Host "`nActive Directory setup completed successfully."