# Disable classic right-click menu in Windows 11 and restore the default menu

# Define the registry path
$regPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"

# Remove the key if it exists
if (Test-Path $regPath) {
    Remove-Item -Path $regPath -Recurse -Force
    Write-Output "Classic right-click menu has been disabled."
} else {
    Write-Output "Classic context menu key not found. No changes were needed."
}

# Restart Explorer to apply changes
Write-Output "Restarting Explorer..."
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Output "Default Windows 11 right-click menu has been restored!"
