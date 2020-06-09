[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure WVD using Powershell](/CA-Microsoft-WVD_ARM-Workshop/Configure%20WVD%20using%20Powershell)
# Configure WVD using Powershell

In this step, we will configure the Win 10 2004 WVD deployment using the new Powershell cmdlets

In this step, you will:
* Get information about the Workspace, Hostpool & Application Group
* Configure the WVD deployment

## Connect to your WVD Tenant
1. Launch a Powershell console as Administrator

2. Install the **Windows Virtual Desktop module**
```powershell
Install-Module -Name Az.DesktopVirtualization
```

3. Import the **Windows Virtual Desktop module**
```powershell
Import-Module -Name Az.DesktopVirtualization
```

4. Sign in and connect to Azure using the admin account<br/>
In my example, this would be *admin@wvdworkshopt01.onmicrosoft.com*<br/>
```powershell
Connect-AzAccount
```
![Connect to the WVD Service](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-ConnectToWVDService.png)

5. If you have multiple subscriptions, and need to change the default subscription, run this cmdlet:
```powershell
Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
```

## Connect users to their Personal sessionhosts.
1. Assign the **DemoUser007** & **008** users to the new **Desktop Application Group** in the Personal Hostpool **MyPersonalHostpool**
```powershell
Add-RdsAppGroupUser -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -AppGroupName "{WVDAppGroupName}" -UserPrincipalName "{UPN of user}"
```
In my Example, this would be
```powershell
Add-RdsAppGroupUser -TenantName "WvdWorkshopT01" -HostPoolName "MyPersonalHostpool" -AppGroupName "Desktop Application Group" -UserPrincipalName "DemoUser007@wvdworkshopt01.onmicrosoft.com"
Add-RdsAppGroupUser -TenantName "WvdWorkshopT01" -HostPoolName "MyPersonalHostpool" -AppGroupName "Desktop Application Group" -UserPrincipalName "DemoUser008@wvdworkshopt01.onmicrosoft.com"
```

2. Sign in with **DemoUser007** & **008** and connect to the Published Desktop.

3. You can monitor the sessions & assignments using the Get-RdsSessionHost cmdlet as used in the previous step<br/>
 > Tip:
 > The property that will change is **AssignedUser**

4. Logoff all user sessions (Powershell)






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