<#
.SYNOPSIS
    #Catch and handle exceptions when working with PowerShell.

.DESCRIPTION
    #This shows how to catch, try, and handling errors and exceptions in PowerShell. 
    It demonstrates the use of try/catch blocks, error handling with Write-Error, 
    and how to throw exceptions.
    
.PARAMETER <ParameterName>
    #This script does not take any parameters.

.EXAMPLE
    #Lab8.1.ps1

.NOTES
    Author: Jackson Nguyen
    Created: 2026-03-15
    Version: 1.0
    Last Modified: 2026-03-15
    Change Log:
        1.0 - Initial release

.LINK
    https://github.com/ngujk/MSPowerShell
#>
Function Start-Something{
    throw "exception happened"
}

Write-Error -Message "Houston, we have a problem." -ErrorAction Stop

try
{
Start-Something
}
catch
{
Write-Output "Something threw an exception"
Write-Output $_
}
try
{
Start-Something -ErrorAction Stop
}
catch
{
Write-Output "Something threw an exception or used Write-Error"
Write-Output $_
}

[System.IO.File]::ReadAllText( '\\test\no\filefound.log')

catch
{
Write-Output "Ran into an issue: $($PSItem.ToString())"
}
catch
{
Write-Output "Ran into an issue: $PSItem"
}


$PSItem.InvocationInfo | Format-List *

$PSItem.ScriptStackTrace

$PSItem.Exception.Message
Exception calling "ReadAllText" with "1" argument(s): "The network path was
not found."

$PSItem.Exception.InnerExceptionMessage

try
{
Start-Something -Path $path
}
catch [System.IO.FileNotFoundException]
{
Write-Output "Could not find $path"
}
catch [System.IO.IOException]
{
Write-Output "IO error with the file: $path"
}

try
{
Start-Something -Path $path -ErrorAction Stop
}
catch [System.IO.DirectoryNotFoundException],
[System.IO.FileNotFoundException]
{
Write-Output "The path or file was not found: [$path]"
}
catch [System.IO.IOException]
{
Write-Output "IO error with the file: [$path]"
}

throw "Could not find: $path"

throw [System.IO.FileNotFoundException] "Could not find: $path"

throw [System.IO.FileNotFoundException]::new()
throw [System.IO.FileNotFoundException]::new("Could not find path: $path")

throw (New-Object -TypeName System.IO.FileNotFoundException )
throw (New-Object -TypeName System.IO.FileNotFoundException -ArgumentList "Could not find path: $path")


Write-Error -Message "Could not find path: $path" -Exception ([System.IO.FileNotFoundException]::new()) -ErrorAction Stop
Write-Error -Exception ([System.IO.FileNotFoundException]::new("Could not find path: $path")) -ErrorAction Stop
Write-Error -Exception ([System.IO.FileNotFoundException]"Could not find path: $path") -ErrorAction Stop
Write-Error -Message "Could not find path: $path" -Exception ( New-Object -TypeName System.IO.FileNotFoundException ) -ErrorAction Stop


catch [System.IO.FileNotFoundException]
{
Write-Log $PSItem.ToString()
}

[System.IO.FileNotFoundException]::new("Could not find file", $path)

catch [System.IO.FileNotFoundException]
{
Write-Output $PSItem.Exception.FileName
}

{
Write-Log $PSItem.ToString()
throw $PSItem
}

catch
{
Write-Log $PSItem.ToString()
throw
}

catch
{
throw [System.MissingFieldException]::new('Could not access field',
$PSItem.Exception)
}

$PSCmdlet.ThrowTerminatingError()

$PSCmdlet.ThrowTerminatingError(
[System.Management.Automation.ErrorRecord]::new(
([System.IO.FileNotFoundException]"Could not find $Path"),
'My.ID',
[System.Management.Automation.ErrorCategory]::OpenError,
$MyObject
)
)

catch
{
$PSCmdlet.ThrowTerminatingError($PSItem)
}

function Start-Something { 1/(1-1) }

{ Start-Something; Write-Output "We did it. Send Email" }

try
{
&{ Start-Something; Write-Output "We did it. Send Email" }
}
catch
{
Write-Output "Notify Admin to fix error and send email"
}
