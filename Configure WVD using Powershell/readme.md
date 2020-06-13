[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure WVD using Powershell](/CA-Microsoft-WVD_ARM-Workshop/Configure%20WVD%20using%20Powershell)
# Configure WVD using Powershell

In this step, we will configure the Win 10 2004 WVD deployment using the new Powershell cmdlets

In this step, you will:
* Get information about the Workspace, Hostpool & Application Group
* Configure the Windows 10 2004 WVD deployment

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
![Connect to Azure](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-ConnectToAzure.png)

5. If you have multiple subscriptions, and need to change the default subscription, run this cmdlet:
```powershell
Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
```


## Get information about the Workspace, Hostpool & Application Group

1. Get a list of **Workspaces** in your Resource Group:
```powershell
    Get-AzWvdWorkspace -ResourceGroupName "wvd-workshop-sessionhosts-rg"
```

2. Get details on a **specific Workspace**:
```powershell
    $my2004WS = Get-AzWvdWorkspace -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-2004-ws"
    $my2004WS | Format-List *
```

3. Get a list of **Hostpools**:
```powershell
    Get-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg"
```

4. Get details on a **specific Hostpool**:
```powershell
    $my2004HP = Get-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-2004-hp"
    $my2004HP | Format-List *
```

5. Get a list of **Application Groups**:
```powershell
    Get-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg"
```

6. Get details on a **specific Application Group**:
```powershell
    $my2004DAG = Get-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-2004-hp-DAG"
    $my2004DAG | Format-List *
```

7. Get a list of **Sessionhosts**
```powershell
    Get-AzWvdSessionHost -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $my2004HP.Name
```

8. Get details on a **specific Sessionhost**
```powershell
    $my2004SH = (Get-AzWvdSessionHost -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $my2004HP.Name)[0]
    $my2004SH | Format-List *
```

9. Get a list of **User Sessions**
```powershell
    Get-AzWvdUserSession -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $my2004HP.Name -SessionHostName $my2004SH.Name.Substring($my2004SH.Name.IndexOf("/") + 1)
```

## Create a new RemoteApp Application Group

1. Create a new **RemoteApp Application Group**
```powershell
    New-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-2004-hp-RAPP" -Location "eastus" -FriendlyName "My Win10 2004 Remote Apps" -Description "Apps published on the Win10 2004" -HostPoolArmPath $my2004HP.Id -ApplicationGroupType RemoteApp
    $my2004RAPP = Get-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-2004-hp-RAPP"
```

2. Publish applications in the new **RemoteApp Application Group**<br/>
First, you get a list of Applications, and publish a remote app using that info.<br/>
 > If you encounter an error, check the availability of your Sessionhosts in the Hostpool.<br/>
 > If they are unavailable, run this powershell script and restart the sessionshost: 
 > Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\rdp-sxs" -Name "fReverseConnectMode" -Value 1 -Type DWord -Force
```powershell
    $myApp = Get-AzWvdStartMenuItem -ResourceGroupName "wvd-workshop-sessionhosts-rg" -ApplicationGroupName $my2004RAPP.Name | Out-GridView -PassThru
    New-AzWvdApplication -ResourceGroupName "wvd-workshop-sessionhosts-rg" -GroupName $my2004RAPP.Name -Name $myApp.AppAlias -FilePath $myApp.FilePath -FriendlyName $myApp.AppAlias -IconIndex $myApp.IconIndex -IconPath $myApp.IconPath -CommandLineSetting Allow -ShowInPortal:$true
```

3. You can repeat step 2 as much as you want, publishing all applications you like.

4. Assign the **RemoteApp Application Group** to the **WVDWorkshopRemoteAppUsers** group:
```powershell
    $my2004RAPGroup = Get-AzADGroup -DisplayName "WVDWorkshopRemoteAppUsers"
    $wvdDesktopVirtualizationUserRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "Desktop Virtualization User"}
    New-AzRoleAssignment -ObjectId $my2004RAPGroup.Id -RoleDefinitionName $wvdDesktopVirtualizationUserRole.Name -Scope $my2004RAPP.Id
```

5. Register the **RemoteApp Application Group** to the **Workspace**:
```powershell
    Register-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -WorkspaceName $my2004WS.Name -ApplicationGroupPath $my2004RAPP.Id
```

## Configure the 2004 deployment

1. Assign the **RemoteDesktop Application Group** to the **WVDWorkshopFullDesktopUsers** group:
```powershell
    $my2004DAGGroup = Get-AzADGroup -DisplayName "WVDWorkshopFullDesktopUsers"
    $wvdDesktopVirtualizationUserRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "Desktop Virtualization User"}
    New-AzRoleAssignment -ObjectId $my2004DAGGroup.Id -RoleDefinitionName $wvdDesktopVirtualizationUserRole.Name -Scope $my2004DAG.Id
```

2. Change the RDP Settings on the hostpool:
```powershell
    Update-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name $my2004HP.Name -CustomRdpProperty "audiocapturemode:i:1;audiomode:i:0;camerastoredirect:s:*;devicestoredirect:s:*;drivestoredirect:s:*"
```


3. You could also configure the Loadbalancing mechanisms using powershell if you like:
```powershell
    Update-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name $my2004HP.Name -LoadBalancerType BreadthFirst
```
or
```powershell
    Update-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name $my2004HP.Name -LoadBalancerType DepthFirst
```

4. Start user sessions to the Full Desktop using DemoUser001, 003, 004, 005 & 006 one-by-one, and monitor on which sessionhost the users get as a Sessionhost.<br/>
You can monitor the sessions using Powershell
```powershell
    Get-AzWvdUserSession -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $my2004HP.Name
```

5. Remove a user session using powershell (replace **SessionHostName** & **SessionID**)
```powershell
    Remove-AzWvdUserSession -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $my2004HP.Name -SessionHostName <<SessionHostName>> -Id <<SessionID>>
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