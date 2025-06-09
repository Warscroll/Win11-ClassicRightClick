# Enable classic right-click menu in Windows 11

# Define the registry path
$regPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the default value to blank
Set-ItemProperty -Path $regPath -Name "(Default)" -Value ""

# Restart Explorer to apply changes
Write-Output "Restarting Explorer..."
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Output "Classic right-click menu has been enabled!"
