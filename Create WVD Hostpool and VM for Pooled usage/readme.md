[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create WVD Workspace, Hostpool and VMs from the Azure Marketplace](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VM%20for%20Pooled%20usage/)
# Create WVD Workspace, Hostpool and VMs from the Azure Marketplace

In this step, we will create a WVD Workspace, Hostpool & VMs within our Windows Virtual Desktop subscription for Pooled usage. The task include:

* Create a WVD Workspace
* Create a WVD Hostpool
* Create VMs in the Azure subscription.
* Join the VMs to the Active Directory domain.
* Register the VMs with the Windows Virtual Desktop service.

We will perform these tasks by using the **Microsoft Azure Marketplace offering**.

## Find the Windows Virtual Desktop Service
First, we will look for the new *Azure Portal* integrated **Windows Virtual Desktop service**, which is part of the Windows Virtual Desktop **Spring update**.

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
 > **Note**<br>
 > At this time, only US locations are available for the WVD ARM resources (Workspace, Hostpool, ApplicationGroup)<br/>
![Create Workspace - Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Basics.png)

4. At this time, we do not have any Application Groups, so we do not register any Application Groups yet.<br/>
![Create Workspace - ApplicationGroups](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-ApplicationGroups.png)

5. Finish the wizard and click on **Create**<br/>
![Create Workspace - Create](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Create.png)


## Create a WVD Hostpool with VMs for Pooled usage

1. Click on **Host Pools**, and click on **Add**<br/>
![Create Hostpool - Add](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool.png)

2. Select the **wvd-workshop-sessionhosts-rg** Resource Group<br/>
Fill in the Basics and click on **Next: Virtual Machines >**<br/>
 > **Note**<br>
 > At this time, only US locations are available for the WVD ARM resources (Workspace, Hostpool, ApplicationGroup)<br/>
![Create Hostpool - Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-Basics.png)

3. Select **Yes** at the option *Add virtual machines* <br/>
Select the **wvd-workshop-sessionhosts-rg** resource group<br/>
Select **West Europe** as the *Virtual Machine location*<br/>
Select **D4s v3** as *Virtual Machine size*<br/>
Enter **2** as *Number of VMs*<br/>
Enter **wvd-t-pool** as the *Name Prefix*<br/><br/>
At the *Image* section, click on **Browse all images and disks**, Click on **My items** and select the Custom Image you have build: **MyCustomWVDManagedImage**<br/>
If you did not complete Step 3, you could go for an Azure Marketplace Gallery image: select *Windows 10 Enterprise multi-session, Version 1909 + Office 365 ProPlus*<br/><br/>
At the *Network and security* section, select the **adVNET** and **adSubnet**<br/>
At the *Administrator account* section, enter your local admin account. In my example, this is **MyAdminAccount@wvdworkshopt01.onmicrosoft.com** and the credentials.<br/><br/>
Click on **Next: Workspace >**<br/>
The virtual machines will be called "wvd-t-pool-0," "wvd-t-pool-1," and so on
 > **IMPORTANT**<br/>
 > Think about the 15 char limit of NetBIOS<br/>
![Create Hostpool - VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-VMs.png)

4. Select **Yes** at the option *Register desktop app group*<br/>
Select the Workspace you created in the previous part: **wvd-workshop-win10-1909-ws**<br/>
Click on **Review + create**<br/>
![Create Hostpool - Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-Workspace.png)

5. Review the overview and click on **Create**<br/>
![Create Hostpool - Overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-Create.png)


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