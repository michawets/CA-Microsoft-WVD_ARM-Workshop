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
 - Select **wvd-workshop-sessionhosts-rg** as *Resource group*

 5. Check the *I agree to the terms and conditions stated above* checkbox

 6. Click on **Purchase**
 ![Deploy Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-DeployWorkspace.png)

 > **IMPORTANT**<br/>
 > Wait until the deployment is finished before continuing<br/>
 > It should only take a few seconds, but it must be complete before going to the next steps

## Deploy a new WVD Hostpool with VMs using the ARM Template

1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Open a new tab in your browser and goto [Micha Wets WVD Spring update Templates - Hostpool](https://github.com/michawets/WVDTemplates/tree/master/Hostpool)

3. Click on **Deploy to Azure**<br/>
![Deploy to Azure](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Github-WVD-DeployHostpool-DeployToAzure.png)

Administrator Account Username
Administrator Account Password
Vm Custom Image Source Id

AzurePortal-WVD-DeployHostpool.png


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