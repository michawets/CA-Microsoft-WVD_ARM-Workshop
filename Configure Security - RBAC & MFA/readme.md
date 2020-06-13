[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure Security - RBAC & MFA](/CA-Microsoft-WVD_ARM-Workshop/Configure%20Security%20-%20RBAC%20%26%20MFA)
# Configure Security - RBAC & MFA

In this step, you will enforce MFA for a DemoUser on AzureAD level to see how easy it is.<br/>
After that, you will setup RBAC on the WVD Workspace using multiple AdminUser accounts<br/> 

We will do this in 2 sections: 
* Enable MFA for a demouser
* Configure RBAC on WVD

## Enable MFA for a demouser
1. Open the Azure Portal from the new Azure AD Tenant, and sign in with the admin account from this tenant (admin@{tenant})
```
https://portal.azure.com/{tenant}
```
In my example, this would be 
```
https://portal.azure.com/wvdworkshopt01.onmicrosoft.com
```

2. Open **Azure Active Directory**

3. Click on **Users** in the menu

4. Click on **Multi-Factor Authentication**<br/>
![Click on MFA](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ClickOnMFA.png)

5. Select **DemoUser001** from the list and click on **enable**<br/>
Confirm enabling MFA for the user<br/>
![Enable MFA](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-EnableMFA.png)

6. Select **DemoUser001** again from the list and click on **enforce**<br/>
Confirm enforcing MFA for the user<br/>
![Enforce MFA](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-EnforceMFA.png)

7. Login & try to launch the Full Desktop as **DemoUser001** using the HTML5 webclient<br/>
You will be guided through the wizard of MFA<br/>


## Configure RBAC on WVD

We are going to delegate permissions to our AdminUsers.<br/>
This is the layout:<br/>

**User Account** | **Level** | **Permissions**
--- | --- | ---
AdminUser001@wvdworkshopt01.onmicrosoft.com | Resource Group (wvd-workshop-sessionhosts-rg) | Contributor
AdminUser002@wvdworkshopt01.onmicrosoft.com | Resource Group (wvd-workshop-sessionhosts-rg) | Reader
AdminUser003@wvdworkshopt01.onmicrosoft.com | HostPool 'wvd-workshop-win10-1909-hp' | Contributor
AdminUser004@wvdworkshopt01.onmicrosoft.com | HostPool 'wvd-workshop-win10-2004-hp' | Contributor

<br/>
<br/>
You could do this in the Azure Portal, or by using Powershell.<br/>
The steps below will help you doing it in Powershell

1. Launch a Powershell console as Administrator

2. Sign in and connect to Azure using the admin account<br/>
```powershell
Connect-AzAccount
```

3. If you have multiple subscriptions, and need to change the default subscription, run this cmdlet:
```powershell
Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
```

4. Assign the correct roles to the users using this script:
```powershell
    $contributorRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "contributor"}
    $readerRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "reader"}
    $resourceGroup = Get-AzResourceGroup -Name "wvd-workshop-sessionhosts-rg"
    $wvdhostpool1909 = Get-AzWvdHostPool -Name "wvd-workshop-win10-1909-hp" -ResourceGroupName $resourceGroup.ResourceGroupName
    $wvdhostpool2004 = Get-AzWvdHostPool -Name "wvd-workshop-win10-2004-hp" -ResourceGroupName $resourceGroup.ResourceGroupName
    New-AzRoleAssignment -SignInName "AdminUser001@wvdworkshopt01.onmicrosoft.com" -RoleDefinitionName $contributorRole.Name -Scope $resourceGroup.ResourceId
    New-AzRoleAssignment -SignInName "AdminUser002@wvdworkshopt01.onmicrosoft.com" -RoleDefinitionName $readerRole.Name -Scope $resourceGroup.ResourceId
    New-AzRoleAssignment -SignInName "AdminUser003@wvdworkshopt01.onmicrosoft.com" -RoleDefinitionName $contributorRole.Name -Scope $wvdhostpool1909.Id
    New-AzRoleAssignment -SignInName "AdminUser004@wvdworkshopt01.onmicrosoft.com" -RoleDefinitionName $contributorRole.Name -Scope $wvdhostpool2004.Id
```

5. Sign in into the Azure portal with AdminUser001, 002, 003 & 004 and validate what resources you are able to see.

6. You could test even more levels if you want, but this is out of the scope of this workshop


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