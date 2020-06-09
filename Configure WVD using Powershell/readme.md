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