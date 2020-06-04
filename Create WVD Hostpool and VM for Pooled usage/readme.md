[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create WVD Workspace, Hostpool and VMs from the Azure Marketplace](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VM%20for%20Pooled%20usage/)
# Create WVD Workspace, Hostpool and VMs from the Azure Marketplace

In this step, we will create a WVD Workspace, Hostpool & VMs within our Windows Virtual Desktop subscription for Pooled usage. The tasks include:

* Create a WVD Workspace
* Create a WVD Hostpool
* Create VMs in the Azure subscription.
* Join the VMs to the Active Directory domain.
* Register the VMs with the Windows Virtual Desktop service.

We will perform these tasks by using the **Microsoft Azure Marketplace offering**.

## Find the Marketplace offer

1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Search for **Windows Virtual Desktop**<br/>
![Search for WVD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop.png)

This is the overview you get in the Windows Virtual Desktop pane<br/>
![WVD pane](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop-Overview.png)


## Create a WVD Workspace

1. Click on **Workspaces**<br/>
![Open Workspaces](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace.png)

2. Click on **Add**<br/>
![Add Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Add.png)

3. Select the **wvd-workshop-sessionhosts-rg** Resource Group<br/>
Fill in the Basics and click on **Next: Application groups >**<br/>
 > **Note**<br/>
 > At this time, only US locations are available for the WVD ARM resources (Workspace, Hostpool, ApplicationGroup)

![Create Workspace - Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Basics.png)

4. At this time, we do not have any Application Groups, so we do not register any Application Groups yet.<br/>
![Create Workspace - ApplicationGroups](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-ApplicationGroups.png)

5. Finish the wizard and click on **Create**<br/>
![Create Workspace - Create](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Create.png)

Depending on how many VMs you’re creating, this process can take 30 minutes or more to complete.



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