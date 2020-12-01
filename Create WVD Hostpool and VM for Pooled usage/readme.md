[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create WVD Workspace, Hostpool and VMs in the Azure Portal](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VM%20for%20Pooled%20usage/)

# Create WVD Workspace, Hostpool and VMs in the Azure Portal

In this step, we will create a WVD Workspace, Hostpool & VMs within our Windows Virtual Desktop subscription for Pooled usage. The task include:

* Create a WVD Workspace
* Create a WVD Hostpool
* Create VMs in the Azure subscription.
* Join the VMs to the Active Directory domain.
* Register the VMs with the Windows Virtual Desktop service.

We will perform these tasks in the Azure Portal by using the **Custom image we created in the previous step**.

## Find the Windows Virtual Desktop Service
First, we will look for the new *Azure Portal* integrated **Windows Virtual Desktop service**, which is part of the Windows Virtual Desktop **Spring update**.

 - Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

 - Search for **Windows Virtual Desktop**<br/>
![Search for WVD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop.png)

This is the overview you get in the Windows Virtual Desktop pane<br/>
![WVD pane](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop-Overview.png)


## Create a WVD Workspace

 - Click on **Workspaces**<br/>
![Open Workspaces](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace.png)

 - Click on **Add**<br/>
![Add Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Add.png)

 - Select the **wvd-workshop-sessionhosts-rg** Resource Group (if it does not exist, create a new Resource Group and name it **wvd-workshop-sessionhosts-rg**)<br/>
Fill in **wvd-workshop-win10-portal-ws** as Workspace Name<br/>
Optionally fill in the other basic settings and click on **Next: Application groups >**

 > **Note**<br>
 > At this time, only US locations are available for the WVD ARM resources (Workspace, Hostpool, ApplicationGroup)<br/>

![Create Workspace - Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Basics.png)

 - At this time, we do not have any Application Groups, so we do not register any Application Groups yet.<br/>
![Create Workspace - ApplicationGroups](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-ApplicationGroups.png)

 - Finish the wizard and click on **Create**<br/>
![Create Workspace - Create](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateWorkspace-Create.png)


## Create a WVD Hostpool with VMs for Pooled usage

 - Click on **Host Pools**, and click on **Add**<br/>
![Create Hostpool - Add](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool.png)

 - Select the **wvd-workshop-sessionhosts-rg** Resource Group<br/>
Fill in **wvd-workshop-win10-portal-hp** as the Hostpool Name<br/>
Fill in the other basic settings and click on **Next: Virtual Machines >**

 > **Note**<br>
 > At this time, only US locations are available for the WVD ARM resources (Workspace, Hostpool, ApplicationGroup)

![Create Hostpool - Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-Basics.png)

 - Select **Yes** at the option *Add virtual machines*<br/>
Select the **wvd-workshop-sessionhosts-rg** resource group<br/>
Select **West Europe** as the *Virtual Machine location*<br/>
Select **D4s v3** as *Virtual Machine size*<br/>
Enter **2** as *Number of VMs*<br/>
Enter **wvd-t-pool** as the *Name Prefix* (The virtual machines will be called "wvd-t-pool-0," "wvd-t-pool-1," and so on)<br/>

 > **IMPORTANT**<br/>
 > Think about the 15 char limit of NetBIOS

At the *Image* section, click on **Browse all images and disks**

![Create Hostpool - VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-VMs-1.png)

- Click on **My items** and select the Custom Image you have build: **Win1020h2**<br/>

![Create Hostpool - VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-VMs-2.png)

- At the *Network and security* section, select the **adVNET** and **adSubnet**<br/>
At the *Administrator account* section, enter your local admin account. In my example, this is **MyAdminAccount@wvdworkshopt01.onmicrosoft.com** and the credentials.<br/><br/>
Click on **Next: Workspace >**<br/>

![Create Hostpool - VMs](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-VMs-3.png)

 - Select **Yes** at the option *Register desktop app group*<br/>
Select the Workspace you created in the previous part: **wvd-workshop-win10-portal-ws**<br/>
Click on **Review + create**<br/>
![Create Hostpool - Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-Workspace.png)

 - Review the overview and click on **Create**<br/>
![Create Hostpool - Overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-Create.png)


Depending on how many VMs you’re creating, this process can take 25 minutes or more to complete.
![Create Hostpool - Deployment](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateHostpool-deployment.png)


## Assign a DemoUser for testing

 - After the deployment, goto the **Application Groups**<br/>
Click on **wvd-workshop-win10-portal-hp-DAG**<br/>
Click on **Assignments**<br/>
Click on **Add**<br/>
Typ in **demouser**<br/>
Select **demouser001** from the list<br/>
Click on **Select**<br/>
![Quick Assign DemoUser001](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-QuickAssignDemoUser001.png)

 - Login with Demouser001 and check if you can see the published Full Desktop.

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