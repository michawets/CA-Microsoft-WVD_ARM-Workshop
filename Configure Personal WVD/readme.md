[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure Personal WVD](/CA-Microsoft-WVD_ARM-Workshop/Configure%20Personal%20WVD)
# Configure Personal WVD

We will configure the Personal WVD deployment further in this step.

In this step, you will:
* Connect users to their Personal Deployment
* Get information about the Hostpool & assigned desktops

## Connect to your WVD Tenant
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
![Connect to the WVD Service](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-ConnectToWVDService.png)


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