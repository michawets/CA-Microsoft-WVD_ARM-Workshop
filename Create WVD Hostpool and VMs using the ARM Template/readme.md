[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create WVD Workspace, Hostpool and VMs from the ARM Template](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VMs%20using%20the%20ARM%20Template/)
# Create WVD Workspace, Hostpool and VMs from the ARM Template

In this step, we will create a WVD Workspace, Hostpool & VMs within our Windows Virtual Desktop subscription for Pooled usage as we did in the previous step, but this time using the ARM Template. The task include:

* Create a WVD Workspace
* Create a WVD Hostpool
* Create VMs in the Azure subscription.
* Join the VMs to the Active Directory domain.
* Register the VMs with the Windows Virtual Desktop service.

We will perform these tasks by using the **Microsoft ARM Template**. 

## Deploy a new WVD Workspace using the ARM Template
1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Open a new tab in your browser and goto [Micha Wets WVD Spring update Templates - Workspace](https://github.com/michawets/WVDTemplates/tree/master/Workspace)

3. Click on **Deploy to Azure**<br/>
![Deploy to Azure](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Github-WVD-DeployWorkspace-DeployToAzure.png)

4. Complete the wizard:
 - Select the correct **Subscription**
 - Select **wvd-workshop-sessionhosts-rg** as *Resource group*<br/>
Check if all fields are correct. Normally, all default values should be ok, but can be modified.<br/>
 > **IMPORTANT**<br/>
 > Remember the modified values for the next steps

 5. Check the *I agree to the terms and conditions stated above* checkbox

 6. Click on **Purchase**<br/>
 ![Deploy Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-DeployWorkspace.png)

 > **IMPORTANT**<br/>
 > Wait until the deployment is finished before continuing<br/>
 > It should only take a few seconds, but it must be complete before going to the next steps

## Deploy a new WVD Hostpool with VMs using the ARM Template

1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Open a new tab in your browser and goto [Micha Wets WVD Spring update Templates - Hostpool](https://github.com/michawets/WVDTemplates/tree/master/Hostpool)

3. Click on **Deploy to Azure**<br/>
![Deploy to Azure](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Github-WVD-DeployHostpool-DeployToAzure.png)

4. Complete the wizard:
 - Select the correct **Subscription**
 - Select **wvd-workshop-sessionhosts-rg** as *Resource group*
 - Change the **Administrator Account Username** to your own.
 - Change the **Administrator Account Password**
 > **IMPORTANT**<br/>
 > If you modified the default settings in the previous task (*Deploy a new WVD Workspace using the ARM Template*), than you have to change all modified values here as well

 5. Check the *I agree to the terms and conditions stated above* checkbox

 6. Click on **Purchase**<br/>
![Deploy Hostpool with VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-DeployHostpool.png)

Depending on how many VMs you’re creating, this process can take 15 minutes or more to complete.
![Deploy Hostpool with VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-ARMdeployment.png)

 > **IMPORTANT**<br/>

 At this moment (17/06/2020), there is a bug in the Windows 10 2004 version.<br/>
 When connecting to WVD, you will get an error in the client:<br/>
** Error code: 0x3000047**<br/>
To resolve this, you must execute this on all VMs running Windows 10 2004 and restart the VM:
```powershell
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\rdp-sxs" -Name "fReverseConnectMode" -Value 1 -Type DWord -Force
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