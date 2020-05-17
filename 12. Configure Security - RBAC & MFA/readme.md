[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [12. Configure Security - RBAC & MFA](/CA-Microsoft-WVD_ARM-Workshop/12.%20Configure%20Security%20-%20RBAC%20%26%20MFA)
# 12. Configure Security - RBAC & MFA

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
AdminUser001@wvdworkshopt01.onmicrosoft.com | Tenant | RDS Contributor
AdminUser002@wvdworkshopt01.onmicrosoft.com | Tenant | Reader
AdminUser003@wvdworkshopt01.onmicrosoft.com | HostPool 'MyFirstHostpool' | RDS Contributor
AdminUser004@wvdworkshopt01.onmicrosoft.com | HostPool 'MyPersonalHostpool' | RDS Contributor

1. Launch a Powershell console as Administrator

2. Import the **Windows Virtual Desktop module**
```powershell
Import-Module -Name Microsoft.RDInfra.RDPowerShell
```

3. Sign in to the Windows Virtual Desktop service by using the admin account who has the TenantCreator role<br/>
In my example, this would be *admin@wvdworkshopt01.onmicrosoft.com*<br/>
```powershell
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"
```

4. Assign the permissions to the AdminUsers using the New-RdsRoleAssignment cmdlet<br/>
This is the syntax:<br/>
```powershell
New-RdsRoleAssignment -SignInName "{User to give access}" -TenantName "{WVDTenantName}" -RoleDefinitionName "{WVD Permission}"
New-RdsRoleAssignment -SignInName "{User to give access}" -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -RoleDefinitionName "{WVD Permission}"
New-RdsRoleAssignment -SignInName "{User to give access}" -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -AppGroupName "{WVDAppGroupName}" -RoleDefinitionName "WVD Permission}"
```
In my Example, this would be
```powershell
New-RdsRoleAssignment -SignInName "AdminUser001@wvdworkshopt01.onmicrosoft.com" -TenantName "WvdWorkshopT01" -RoleDefinitionName "RDS Contributor"
```

5. Open a new Powershell console for each AdminUser<br/>
Import the **Windows Virtual Desktop module**<br/>
Sign in to the Windows Virtual Desktop service by using the **AdminUserxxx** account<br/>
Test what you can see with the AdminUser, if you can create a HostPool or AppGroup<br/>
Test if you can read the **MyPersonalHostpool** using AdminUser003<br/>
Test if you can read the **MyFirstHostpool** using AdminUser004





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