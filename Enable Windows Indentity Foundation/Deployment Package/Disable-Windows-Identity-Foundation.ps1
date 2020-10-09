#Start logging
Start-Transcript -Path "C:\Logs\UninstallWIF - $(((get-date).ToUniversalTime()).ToString("yyyyMMddThhmmssZ")).log" -Force

# Determine if the WIF module is installed
Write-Host "Attempting to locate WIF module"
$WIFModule = Get-WindowsOptionalFeature -Online -FeatureName "Windows-Identity-Foundation"
if ($WIFModule.State -eq "Disabled") {
    Write-Host "WIF module disabled"
    }
Else {
    Write-Host "WIF module installed, attempring to uninstall WIF module"
    try {
        # Uninstall WIF module
        Disable-WindowsOptionalFeature -Online -FeatureName Windows-Identity-Foundation -ErrorAction Stop
        Write-Host "Successfully uninstalled WIF"
    }
    catch [System.Exception] {
        Write-Host "An error occurred while attempting to uninstall WIF module. Error message: $($_.Exception.Message)" ; break
    }
}
# Stop Logging
Stop-Transcript