# This script is for creating shorcuts from powershell
# I got it from stackoverflow i think

param ( [string]$SourceExe, [string]$DestinationPath )

$WshShell = New-Object -COMObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($DestinationPath)
$Shortcut.TargetPath = $SourceExe
$Shortcut.Save()
