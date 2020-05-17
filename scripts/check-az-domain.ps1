if ($null -eq (Get-AzContext)) {
    Connect-AzAccount
}

$currentContext = Get-AzContext
$tokenCache = $currentContext.TokenCache.ReadItems() | Where-Object { $_.Resource -eq "https://management.core.windows.net/" -AND $_.TenantId -eq "bbd701fc-624e-40fd-ba91-1b22ff5010f6" }
$accessToken = $tokenCache.AccessToken

$reqHeaders = @{
    "Authorization" = ("Bearer {0}" -f $accessToken)
}

$response = Invoke-WebRequest -Uri "https://main.iam.ad.ext.azure.com/api/Directories/DomainAvailability/calabuser079" -Headers $reqHeaders