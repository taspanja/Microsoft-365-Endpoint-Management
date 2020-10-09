#Start logging
Start-Transcript -Path "C:\Logs\InstallWIFNew - $(((get-date).ToUniversalTime()).ToString("yyyyMMddThhmmssZ")).log" -Force

# Determine if the WIF module needs to be installed
Write-Host "Attempting to locate WIF module"
$WIFModule = Get-WindowsOptionalFeature -Online -FeatureName "Windows-Identity-Foundation"
if ($WIFModule.State -eq "Enabled") {
    Write-Host "WIF module Enabled"
    }
Else {
    Write-Host "WIF module not installed, attempting to install WIF module"
    try {
        # Install WIF module
        Enable-WindowsOptionalFeature -Online -FeatureName Windows-Identity-Foundation -ErrorAction Stop
        Write-Host "Successfully installed WIF"
        }
    catch [System.Exception] {
        Write-Host "An error occurred while attempting to install WIF module. Error message: $($_.Exception.Message)" ; break
        }
    }
# Stop Logging
Stop-Transcript