[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create Windows Virtual Desktop tenant](/CA-Microsoft-WVD_ARM-Workshop/Create%20Windows%20Virtual%20Desktop%20tenant)
# Create Windows Virtual Desktop tenant

Now that you've granted the Windows Virtual Desktop service permissions to query Azure Active Directory and assigned the TenantCreator role to a user account, you can create a Windows Virtual Desktop tenant.

Before we continue to create the Windows Virtual Desktop tenant, you need two pieces of information:
* Your Azure Active Directory tenant ID (or Directory ID)
* Your Azure Subscription ID

> **NOTE** <br/>
> Due to the fact we do this in a workshop, the Subscription ID is less important. This becomes relevant when you start using Azure Monitor & Log Analytics. But this would take to much time today to include in the workshop, so this can be skipped

So for this workshop, we will simply use this Subscription ID: 1ab54fac-2bbe-4282-9c5b-561b8df622ab

After that, we can create the Windows Virtual Desktop tenant

## Azure Active Directory tenant ID (or Directory ID):

1. Open the Azure Portal from the new Azure AD Tenant, and sign in with the admin account from this tenant (admin@{tenant})
```
https://portal.azure.com/{tenant}
```
In my example, this would be 
```
https://portal.azure.com/wvdworkshopt01.onmicrosoft.com
```

2. Search for **Azure Active Directory** in the search bar and select the entry that appears under the Services category.<br/>
![Search Azure Active Directory](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Search-AzureAD.png)

3. Scroll down in the menu and click on **Properties**<br />
Look for **Directory ID**, and then select the **clipboard icon**.<br />
Paste this in your Notepad(++)/VS Code as the **AadTenantId** value.<br/>
![Copy Azure AD Directory ID to clipboard](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-CopyAzureADDirID.png)
<br/>
<br/>

## Create the **Windows Virtual Desktop** tenant

1. Launch a Powershell console as Administrator

2. [Optional] Download and install the **Windows Virtual Desktop module** to use in your PowerShell session (if not done before)
```PowerShell
Install-Module -Name Microsoft.RDInfra.RDPowerShell
```

3. Import the **Windows Virtual Desktop module**
```PowerShell
Import-Module -Name Microsoft.RDInfra.RDPowerShell
```

4. Sign in to the Windows Virtual Desktop service by using the admin account who has the TenantCreator role<br/>
In my example, this would be *admin@wvdworkshopt01.onmicrosoft.com*<br/>
```PowerShell
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"
```

5. Create a new Windows Virtual Desktop tenant, linked to the new Azure Active Directory tenant
```PowerShell
New-RdsTenant -Name <TenantName> -AadTenantId <DirectoryID> -AzureSubscriptionId <SubscriptionID>
```
Replace the bracketed values with our workshop values.<br/>
In our Example, this would be:
```PowerShell
New-RdsTenant -Name "WvdWorkshopT01" -AadTenantId "f4e6b597-ff88-4b44-9768-376dd6ccac94" -AzureSubscriptionId (([System.Guid]::NewGuid()).Guid)
```

> **Note**<br/>
> The name you choose for your new Windows Virtual Desktop tenant should be globally unique. 

![Powershell: Create new WVD Tenant](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-NewRdsTenant.png)



<script type="text/javascript">
    setTimeout(function() { 
            document.getElementById("sidebar").style.display = "none";
            document.getElementById("main-content").style.width = "90%"
            var x = document.getElementsByClassName('inner clearfix'); 
            x[0].style.width = "75%";
            var x = document.getElementsByClassName('inner'); 
            x[0].style.width = "90%";
            var x = document.getElementsByTagName('h1'); 
            x[0].style.width = "90%";
            x[0].style.textAlign = "center"
            x[0].innerHTML = "Microsoft & Cloud-Architect WVD Workshop"
        }, 250);
</script>