<#
.SYNOPSIS
    #Validate input parameters using PowerShell's validation attributes.

.DESCRIPTION
    #This script demonstrates how to use various validation attributes such as 
    ValidatePattern, ValidateSet, and ValidateScript to ensure that input 
    parameters meet specific criteria.

.PARAMETER <ParameterName>
    #This script defines two functions, Test-ValidatePattern and Get-Computer, which
    utilize different validation attributes to validate their parameters.

.EXAMPLE
    #Lab8.2.ps1

.NOTES
    Author: Jackson Nguyen
    Created: 2026-03-15
    Version: 1.0
    Last Modified: 2026-03-15
    Change Log:
        1.0 - Initial release

.LINK
    https://link-to-related-docs-or-repo
#>

Function Test-ValidatePattern{
    [CmdletBinding()]
    param(
        [ValidatePattern('^\d{8}$', ErrorMessage = "{0} is not an 8 digit numeric value fitting the pattern {1}")]
        [String]$Digits
    )
    process{
        Write-Output $Digits
    }
}

Function Get-Computer{
    [CmdletBinding()]
    param(
        [ValidatePattern('^NET-\d{8}$',
            ErrorMessage = "{0} is not an 8 digit numeric value preceded by 'NET-' fitting the pattern {1}")]
        [String]$ComputerName,

        [ValidateSet('Desktop','Laptop','Mobile',
            ErrorMessage = "{0} is not one of the allowed device types: {1}")]
        [String]$Type,

        [ValidateScript({
            $_ -gt (Get-Date)
        }, ErrorMessage = "The expiration date {0} is not greater than the current date. Script used: {1}")]
        [DateTime]$ExpirationDate
    )

    process{
        [PSCustomObject]@{
            ComputerName = $ComputerName
            Type         = $Type
            ExpireDate   = $ExpirationDate
        }
    }
}