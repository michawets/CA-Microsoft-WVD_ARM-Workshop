[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [8. Configure Pooled WVD](/CA-Microsoft-WVD_ARM-Workshop/8.%20Configure%20Pooled%20WVD)
# 8. Configure Pooled WVD

We will configure the Pooled WVD deployment further in this step.

In this step, you will learn how to:
* Get information about your WVD Tenant, Hostpool(s), AppGroups, etc
* Create a new RemoteApp application group
* Assign users to the application group
* Publish application(s) to the application group
* Configure Load-balancing mechanisms on the Hostpool
* Configure Single- or Multi-session on the Hostpool


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


## Get information about your WVD deployment

1. Get your WVD Tenant information
```powershell
Get-RdsTenant
```
![Get-RdsTenant](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-GetRdsTenant.png)

2. Get your WVD Hostpool information
```powershell
Get-RdsHostPool -TenantName "{WVDTenantName}"
```
In my Example, this would be
```powershell
Get-RdsHostPool -TenantName "WvdWorkshopT01"
```
![Get-RdsHostPool](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-GetRdsHostpool.png)

3. Get your WVD Sessionhosts information
```powershell
Get-RdsSessionHost -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}"
```
In my Example, this would be
```powershell
Get-RdsSessionHost -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool"
```
![Get-RdsSessionHost](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-GetRdsSessionHost.png)

4. Get your WVD AppGroups information & assigned user(s)
```powershell
Get-RdsAppGroup -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}"
Get-RdsAppGroupUser -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -AppGroupName "{WVDAppGroupName}"
```
In my Example, this would be
```powershell
Get-RdsAppGroup -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool"
Get-RdsAppGroupUser -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" -AppGroupName "Desktop Application Group"
```
![Get-RdsAppGroup & Get-RdsAppGrouUser](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-GetRdsAppGroup.png)

As you can see, there is only 1 AppGroup and 1 user assigned<br/>
This is the user we entered into the WVD MArketplace Wizard in Step 5<br/>
The default AppGroup is a Desktop type, which will publish a Full Desktop to the users


## New RemoteApp application group & assign user

In this task, we will create a new RemoteApp application group and assign our second demo user

1. Create a new AppGroup with the name *MyPublishedApps*, of the *RemoteApp* type
```powershell
New-RdsAppGroup -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -Name "{new WVDAppGroupName}" -ResourceType RemoteApp
```
In my Example, this would be
```powershell
New-RdsAppGroup -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" -Name "MyPublishedApps" -ResourceType RemoteApp
```
![New-RdsAppGroup](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-NewRdsAppGroup.png)

2. Assign the 2nd demo user to the new AppGroup
```powershell
Add-RdsAppGroupUser -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -AppGroupName "{WVDAppGroupName}" -UserPrincipalName "{UPN of user}"
```
In my Example, this would be
```powershell
Add-RdsAppGroupUser -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" -AppGroupName "MyPublishedApps" -UserPrincipalName "DemoUser002@wvdworkshopt01.onmicrosoft.com"
```
![Add-RdsAppGroupUser](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-AddRdsAppGroupUser.png)


## Publish new application in RemoteApp group

1. Get a list of available applications on the Sessionhosts
```powershell
Get-RdsStartMenuApp -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -AppGroupName "{WVDAppGroupName}"
## More readable:
Get-RdsStartMenuApp -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -AppGroupName "{WVDAppGroupName}" | select Friendlyname, AppAlias
```
In my Example, this would be
```powershell
Get-RdsStartMenuApp -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" -AppGroupName "MyPublishedApps"
## More readable:
Get-RdsStartMenuApp -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" -AppGroupName "MyPublishedApps" | select Friendlyname, AppAlias
```
![Get-RdsStartMenuApp](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-GetRdsStartMenuApp.png)

2. Publish **Excel** & **Paint** in the AppGroup using the AppAlias
```powershell
New-RdsRemoteApp -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" -AppGroupName "{WVDAppGroupName}" -Name "{NewPublishedAppName}" -AppAlias "{WVDAvailableAppAlias}"
```
In my Example, this would be
```powershell
New-RdsRemoteApp -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" -AppGroupName "MyPublishedApps" -Name "Excel" -AppAlias "excel"
New-RdsRemoteApp -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" -AppGroupName "MyPublishedApps" -Name "MSPaint" -AppAlias "paint"
```
![New-RdsRemoteApp](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-NewRdsRemoteApp.png)


## Configure Load-balancing mechanisms on the Hostpool
There are 2 Load-balancing mechanisms available:<br/>
 - The default Load-balancing mechanism is Breadth-first, which will evenly distribute user sessions across the session hosts in a host pool.
 - The second Load-balancing mechanism is Depth-first, which will saturate a session host with user sessions in a host pool.<br/>
 Once the first session reaches its session limit threshold, the load balancer directs any new user connections to the next session host in the host pool until it reaches its limit, and so on.

### Breadth-first
1. Assign **DemoUser003**, **004**, **005** & **006**  to the *Desktop Application Group* AppGroup

2. Start user sessions to the Full Desktop using DemoUser001, 003, 004, 005 & 006 one-by-one, and monitor on which sessionhost the users get as a Sessionhost.<br/>
You can monitor the sessions using the Get-RdsSessionHost cmdlet as used in the previous section
 > Tip: Use the HTML5 webclient in different browsers & use Private Browsing.<br/>
 > For example: <br/>
 > DemoUser001 in the FatClient<br/>
 > DemoUser003 in Chrome<br/>
 > DemoUser004 in Chrome Private Browsing<br/>
 > DemoUser005 in Firefox<br/>
 > DemoUSer006 in Firefox Private Browsing

3. Logoff all user sessions<br/>
This can be done using Powershell:
```powershell
Get-RdsUserSession -TenantName "{WVDTenantName}" -HostPoolName "{WVDHostPoolName}" | where { $_.UserPrincipalName -like "*{username}*" } | Invoke-RdsUserSessionLogoff -NoUserPrompt
```
In my Example, this would be
```powershell
Get-RdsUserSession -TenantName "WvdWorkshopT01" -HostPoolName "MyFirstHostpool" | where { $_.UserPrincipalName -like "*demouser*" } | Invoke-RdsUserSessionLogoff -NoUserPrompt
```

4. Validate that all *Current Sessions* on all Sessionhosts are back to 0 using the Get-RdsSessionHost cmdlet

### Depth-first
1. Change the Load-balancing mechanism on the Hostpool<br/>
In this example, we will allow 2 sessions for each Sessionhost.
```powershell
Set-RdsHostPool -TenantName "{WVDTenantName}" -Name "{WVDHostPoolName}" -DepthFirstLoadBalancer -MaxSessionLimit {Amount of sessions}
```
In my Example, this would be
```powershell
Set-RdsHostPool -TenantName "WvdWorkshopT01" -Name "MyFirstHostpool" -DepthFirstLoadBalancer -MaxSessionLimit 2
```

2. Perform the same test as Breadth-First Load-balancing in step 2, monitoring the loadbalancing of the user sessions accross the Sessionhosts.<br/>

3. Logoff all user sessions (Powershell)

4. Change back to the default Load-balancing mechanism
```powershell
Set-RdsHostPool -TenantName "{WVDTenantName}" -Name "{WVDHostPoolName}" -BreadthFirstLoadBalancer
```
In my Example, this would be
```powershell
Set-RdsHostPool -TenantName "WvdWorkshopT01" -Name "MyFirstHostpool" -BreadthFirstLoadBalancer
```

## Configure Single- or Multi-session on the Hostpool

### Single Session Hostpool
In some cases, you could run into a case where only 1 user can connect to a VM in a Pooled Environment.<br/>
This is what we call a Single Session Hostpool.<br/>

1. Set the MaxSessionLimit of the Hostpool to 1
```powershell
Set-RdsHostPool -TenantName "{WVDTenantName}" -Name "{WVDHostPoolName}" -BreadthFirstLoadBalancer -MaxSessionLimit 1
```
In my Example, this would be
```powershell
Set-RdsHostPool -TenantName "WvdWorkshopT01" -Name "MyFirstHostpool" -BreadthFirstLoadBalancer -MaxSessionLimit 1
```

2. Start user sessions to the Full Desktop using DemoUser001, 003 & 004 one-by-one, and monitor on which sessionhost the users get as a Sessionhost.<br/>
You can monitor the sessions using the Get-RdsSessionHost cmdlet as used in the previous section<br/>
> Tip:<br/>
> DemoUser004 should get an error message

3. Logoff all user sessions (Powershell)

### Multi Session Hostpool
To go back to Multi Session, just remove the MaxSessionLimit on the Load-balancer mechanism

1. Change back to the default Load-balancing mechanism
```powershell
Set-RdsHostPool -TenantName "{WVDTenantName}" -Name "{WVDHostPoolName}" -BreadthFirstLoadBalancer
```
In my Example, this would be
```powershell
Set-RdsHostPool -TenantName "WvdWorkshopT01" -Name "MyFirstHostpool" -BreadthFirstLoadBalancer
```


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