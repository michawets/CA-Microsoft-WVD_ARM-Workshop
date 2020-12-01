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
- Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

- Open a new tab in your browser and goto [Micha Wets WVD Spring update Templates - Workspace](https://github.com/michawets/WVDTemplates/tree/master/Workspace)

- Click on **Deploy to Azure**<br/>
![Deploy to Azure](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Github-WVD-DeployWorkspace-DeployToAzure.png)

- Complete the wizard:
 - Select the correct **Subscription**
 - Select **wvd-workshop-sessionhosts-rg** as *Resource group*<br/>
Check if all fields are correct. Normally, all default values should be ok, but can be modified.<br/>
 > **IMPORTANT**<br/>
 > Remember the modified values for the next steps

- Click on **Review + Create** and then on **Create**

![Deploy Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-DeployWorkspace.png)

 > **IMPORTANT**<br/>
 > Wait until the deployment is finished before continuing<br/>
 > It should only take a few seconds, but it must be complete before going to the next steps

## Get the Custom Image resource ID

If we want to use our Custom Image (created in the previous steps), we need to have the **Resource ID**

- Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

- Search for **Images**

![Search for Images](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchImages.png)

- Select the **Win1020h2** image, and copy the **Resource ID** (*paste in Notepad to keep available*)

![Copy Resource ID](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Image-ResourceId.png)

## Deploy a new WVD Hostpool with VMs using the ARM Template

- Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

- Open a new tab in your browser and goto [Micha Wets WVD Spring update Templates - Hostpool](https://github.com/michawets/WVDTemplates/tree/master/Hostpool)

- Click on **Deploy to Azure**

![Deploy to Azure](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Github-WVD-DeployHostpool-DeployToAzure.png)

- Complete the wizard:
  - Select the correct **Subscription**
  - Select **wvd-workshop-sessionhosts-rg** as *Resource group*
  - Change the **Administrator Account Username** to your own.
  - Change the **Administrator Account Password**
  - Change the **vmCustomImageSourceId** to the Resource ID from your Custom Image: **Win1020h2**

 > **IMPORTANT**<br/>
 > If you modified the default settings in the previous task (*Deploy a new WVD Workspace using the ARM Template*), than you have to change all modified values here as well

- Click on **Review + create**

- Click on **Create**

![Deploy Hostpool with VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-DeployHostpool.png)

Depending on how many VMs you’re creating, this process can take 25 minutes or more to complete.

![Deploy Hostpool with VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-ARMdeployment.png)


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