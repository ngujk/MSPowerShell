<#
.SYNOPSIS
    #Initialize and manage disks and partitions using PowerShell.

.DESCRIPTION
    #This shows processes that includes initializing a raw disk, 
    creating partitions, formatting volumes, and resizing partitions.

.PARAMETER <ParameterName>
    #This script does not take any parameters.

.EXAMPLE
    #Lab9.ps1

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

Get-Disk

Get-Disk | Format-Table

Get-Disk | Format-Table -auto

Get-Disk | where PartitionStyle -eq 'raw' | Initialize-Disk -PartitionStyle GPT

Get-Disk | Format-Table -auto

New-Partition -disknumber 1 -size 5GB -AssignDriveLetter

Get-Disk | Format-Table -auto

New-Partition -disknumber 1 -UseMaximumSize -DriveLetter F

Get-Parition -disknumber 2

Get-Partition -disknumber 2

Get-Partition -disknumber 1

Format-Volume -Driveletter E -FileSystem NTFS -NewFileSystemLabel "Test-Data1"

Format-Volume -Driveletter F -FileSystem NTFS -NewFileSystemLabel "Test-Data1"

Get-Volume

Get-Disk | Format-Table -auto

Get-WmiObject Win32_LogicalDisk | Format-Table DeviceId, VolumeName,
@{n="TotalSize (GB)";e={[math]::Round($_.Size/1GB,2)}}, @{n="UsedSpace
(GB)";e={[math]::Round($_.Size/1GB - $_.FreeSpace/1GB,2)}},
@{n="FreeSpace (GB)";e={[math]::Round($_.FreeSpace/1GB,2)}}

Resize-Partition -DriveLetter F -Size 25GB

Get-PartitionSupportedSize

$supportedSize = (Get-PartitionSupportedSize -DriveLetter F)

Resize-Partition -DriveLetter F -Size $supportedSize.SizeMax

Get-WmiObject Win32_LogicalDisk | Format-Table DeviceId, VolumeName,
@{n="TotalSize (GB)";e={[math]::Round($_.Size/1GB,2)}}, @{n="UsedSpace
(GB)";e={[math]::Round($_.Size/1GB - $_.FreeSpace/1GB,2)}},
@{n="FreeSpace (GB)";e={[math]::Round($_.FreeSpace/1GB,2)}}         