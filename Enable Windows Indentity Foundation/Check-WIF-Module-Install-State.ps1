#Get WIF Module
$WIFModule = Get-WindowsOptionalFeature -Online -FeatureName "Windows-Identity-Foundation"

#Check WIF Module State
if ($WIFModule.State -eq "Enabled"){
    return 0
    }