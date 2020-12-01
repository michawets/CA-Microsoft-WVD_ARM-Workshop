[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure WVD using Powershell](/CA-Microsoft-WVD_ARM-Workshop/Configure%20WVD%20using%20Powershell)
# Configure WVD using Powershell

In this step, we will configure the Win10 ARM WVD deployment using the new Powershell cmdlets

In this step, you will:
* Get information about the Workspace, Hostpool & Application Group
* Configure the Windows 10 ARM WVD deployment

## Connect to your WVD Tenant
- Launch a Powershell 7.1 console as Administrator

- Install the **Windows Virtual Desktop module** (if still needed)

```powershell
Install-Module -Name Az.DesktopVirtualization
```

- Import the **Windows Virtual Desktop module**

```powershell
Import-Module -Name Az.DesktopVirtualization
```

- Sign in and connect to Azure using the admin account<br/>
In my example, this would be *admin@wvdworkshopt01.onmicrosoft.com*<br/>

```powershell
Connect-AzAccount -UseDeviceAuthentication
```

- If you have multiple subscriptions, and need to change the default subscription, run this cmdlet:

```powershell
Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
```

## Get information about the Workspace, Hostpool & Application Group

- Get a list of **Workspaces** in your Resource Group:

```powershell
Get-AzWvdWorkspace -ResourceGroupName "wvd-workshop-sessionhosts-rg"
```

- Get details on a **specific Workspace**:

```powershell
$myArmWS = Get-AzWvdWorkspace -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-arm-ws"
$myArmWS | Format-List *
```

- Get a list of **Hostpools**:

```powershell
Get-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg"
```

- Get details on a **specific Hostpool**:

```powershell
$myArmHP = Get-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-arm-hp"
$myArmHP | Format-List *
```

- Get a list of **Application Groups**:

```powershell
    Get-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg"
```

- Get details on a **specific Application Group**:

```powershell
$myArmDAG = Get-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-arm-hp-DAG"
$myArmDAG | Format-List *
```

- Get a list of **Sessionhosts**

```powershell
Get-AzWvdSessionHost -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $myArmHP.Name
```

- Get details on a **specific Sessionhost**

```powershell
$myArmSH = (Get-AzWvdSessionHost -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $myArmHP.Name)[0]
$myArmSH | Format-List *
```

- Get a list of **User Sessions**

```powershell
Get-AzWvdUserSession -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $myArmHP.Name -SessionHostName $myArmSH.Name.Substring($myArmSH.Name.IndexOf("/") + 1)
```

## Create a new RemoteApp Application Group

- Create a new **RemoteApp Application Group**

```powershell
New-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-arm-hp-RAPP" -Location "eastus" -FriendlyName "My Win10 ARM Remote Apps" -Description "Apps published on the Win10 ARM deployment" -HostPoolArmPath $myArmHP.Id -ApplicationGroupType RemoteApp
$myArmRAPP = Get-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name "wvd-workshop-win10-arm-hp-RAPP"
```

- Publish applications in the new **RemoteApp Application Group**<br/>
First, you get a list of Applications, and publish a remote app using that info.

 > **IMPORTANT**<br/>
 > If you encounter an error, check the availability of your Sessionhosts in the Hostpool.<br/>
 > If they are unavailable, run this powershell script and restart the sessionshost: <br/>
 > Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\rdp-sxs" -Name "fReverseConnectMode" -Value 1 -Type DWord -Force

```powershell
$myApp = Get-AzWvdStartMenuItem -ResourceGroupName "wvd-workshop-sessionhosts-rg" -ApplicationGroupName $myArmRAPP.Name | Out-GridView -PassThru
New-AzWvdApplication -ResourceGroupName "wvd-workshop-sessionhosts-rg" -GroupName $myArmRAPP.Name -Name $myApp.AppAlias -FilePath $myApp.FilePath -FriendlyName $myApp.AppAlias -IconIndex $myApp.IconIndex -IconPath $myApp.IconPath -CommandLineSetting Allow -ShowInPortal:$true
```

- You can repeat step 2 as much as you want, publishing all applications you like.

- Assign the **RemoteApp Application Group** to the **WVDWorkshopRemoteAppUsers** group:

```powershell
$myArmRAPGroup = Get-AzADGroup -DisplayName "WVDWorkshopRemoteAppUsers"
$wvdDesktopVirtualizationUserRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "Desktop Virtualization User"}
New-AzRoleAssignment -ObjectId $myArmRAPGroup.Id -RoleDefinitionName $wvdDesktopVirtualizationUserRole.Name -Scope $myArmRAPP.Id
```

- Register the **RemoteApp Application Group** to the **Workspace**:

```powershell
Register-AzWvdApplicationGroup -ResourceGroupName "wvd-workshop-sessionhosts-rg" -WorkspaceName $myArmWS.Name -ApplicationGroupPath $myArmRAPP.Id
```

## Configure the ARM deployment

- Assign the **RemoteDesktop Application Group** to the **WVDWorkshopFullDesktopUsers** group:

```powershell
$myArmDAGGroup = Get-AzADGroup -DisplayName "WVDWorkshopFullDesktopUsers"
$wvdDesktopVirtualizationUserRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "Desktop Virtualization User"}
New-AzRoleAssignment -ObjectId $myArmDAGGroup.Id -RoleDefinitionName $wvdDesktopVirtualizationUserRole.Name -Scope $myArmDAG.Id
```

- Change the RDP Settings on the hostpool:

```powershell
Update-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name $myArmHP.Name -CustomRdpProperty "audiocapturemode:i:1;audiomode:i:0;camerastoredirect:s:*;devicestoredirect:s:*;drivestoredirect:s:*"
```

- You could also configure the Loadbalancing mechanisms using powershell if you like:

```powershell
Update-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name $myArmHP.Name -LoadBalancerType BreadthFirst
```

or

```powershell
Update-AzWvdHostPool -ResourceGroupName "wvd-workshop-sessionhosts-rg" -Name $myArmHP.Name -LoadBalancerType DepthFirst
```

- Start user sessions to the Full Desktop using DemoUser001, 003, 004, 005 & 006 one-by-one, and monitor on which sessionhost the users get as a Sessionhost.<br/>
You can monitor the sessions using Powershell

```powershell
Get-AzWvdUserSession -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $myArmHP.Name
```

- Remove a user session using powershell (replace **SessionHostName** & **SessionID**)

```powershell
Remove-AzWvdUserSession -ResourceGroupName "wvd-workshop-sessionhosts-rg" -HostPoolName $myArmHP.Name -SessionHostName <<SessionHostName>> -Id <<SessionID>>
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