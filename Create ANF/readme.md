[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create Azure Netapp Files share](/CA-Microsoft-WVD_ARM-Workshop/Create%20ANF)

# Create Azure Netapp Files share

In this step, you will create a Azure Netapp Files share to store your FSLogix profiles.
 > **IMPORTANT**<br/>
 > You need to be granted access to the Azure NetApp Files service.<br/>
 > To request access to the service, see the <a href="https://aka.ms/azurenetappfiles" target="_blank">Azure NetApp Files waitlist submission page</a>.<br/>
 > You must wait for an official confirmation email from the Azure NetApp Files team before continuing.

 > **NOTE**<br/>
 > If you want to keep cost to a minimum, you should remove the ANF after this lab!

## Add ANF Subnet to the VNET

To be able to add an ANF Volume to your environment, ANF needs a NetApp Files Delegated Subnet.

- Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

- Open your Virtual Network (in the workshop it is normally *adVNET*), click on **Subnets** and click on **+Subnet**

![Open VNET subnets](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-AddSubnetToVNET-AddSubnet.png)

- Fill in the **Name** for the subnet, fill in the **Subnet address range** (*a /28 is sufficient!*), select **Microsoft.Netapp/volumes** and click on **Save**

![Create ANF delegated subnet](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-AddSubnetToVNET-CreateSubnet.png)

## Search for ANF

- Search for **Azure NetApp Files**

![Search for ANF](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-Search.png)

## Create ANF Account

The first step is creating an ANF account.

- Click on **Add**

![Click on Add](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-Add.png)

- Select the **wvd-workshop-infra-rg** Resource Group <br/>
Fill in the **Name** for the account, select **West Europe** as the Location and click on **Create**

![Create ANF Account](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-CreateAccount.png)

## Add the Windows AD connection

To have an ANF share available in your Windows environment, you need to add a Windows AD Connection.<br/>
This connection will be used to join a ANF Volume to your Windows environment

- Open the newly create ANF account

![Open ANF Account](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-OpenAccount.png)

- Click on **Active Directory connections**, and click on **Join**

 > **IMPORTANT**<br/>
 > This step will not join the ANF account to the Windows AD yet!<br/>
 > This will simply add the AD connection to the Account<br/>
 > The actual AD Join will only take place when we create the ANF Volume!

![Add AD Connection](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-AddADConnection.png)

- Fill in the required fields and click on **Join**

![Add AD Connection](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-AddADConnection-Join.png)

## Create an ANF Capacity Pool

Setting up a capacity pool enables you to create volumes within it. <br/>
Microsoft also bills the amount of TB you have in Capacity Pools, not Volumes! <br/>
So if you have an empty Capacity Pool of 4TB (even without Volumes), you will still pay for 4TB!

- Click on **Capacity Pools**, and click on **Add pool**

![Add Pool](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-CreatePool.png)

- Fill in the **Name**, select **Standard** (or any other level you want), and enter the **amount of TB** you want to provision (minimum of 4TB).

![Create the Capacity Pool](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-CreatePool-Add.png)

## Create an ANF Volume

Azure NetApp Files supports creating volumes using NFS (NFSv3 and NFSv4.1), SMBv3, or dual protocol (NFSv3 and SMB).<br/>
A volume's capacity consumption counts against its pool's provisioned capacity.<br/>
In this workshop, we will create an SMBv3 volume which will be joined in our Windows AD environment.

- Click on **Volumes** and click on **+Add Volume**

![Add Volume](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-CreateVolume.png)

- Fill in the Basics from the Volume: **Name**, **Quota** (I suggest put it on *4TB* for max performance), select the correct **VNET & Subnet** (with *Netapp Delegate*) and click on **Next: Protocol >**

![Add Volume - Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-CreateVolume-Basics.png)

 > Note<br/>
 > More information on the performance of the ANF Volumes can be found <a href="https://docs.microsoft.com/en-us/azure/azure-netapp-files/azure-netapp-files-service-levels#throughput-limits" target="_blank">here</a>

- Select the **SMB protocol** (as we will use it in Windows AD), select the **AD Connection** you created in the previous task, enter a **Share name** and click on **Review + Create**

![Add Volume - Protocol](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-CreateVolume-Protocol.png)

- Click on **Create**<br/>
This will start the deployment of the ANF Volume and will join the share into the Windows AD.<br/>

![Add Volume - Create](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-CreateVolume-Create.png)

- After the deployment is finished, you will see the volume in the list

![Add Volume - Created](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-VolumeCreated.png)

- You will also see a new Network Interface (NIC) in the Connected devices list in your Virtual Network

![Add Volume - NIC in VNET](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-VolumeCreated-NIC.png)

## Configure the ANF share

- RDP to your AdVM

- Browse to the ANF share (full path can be found in the portal)

- Create a new folder **FSLogix-Profiles**

- Change permissions on the folder to this *Best Practice* from *FSLogix*:

**User Account** | **Folder** | **Permissions**
--- | --- | ---
Domain Admins | This Folder, Subfolders, and files | Full Control
System | This Folder, Subfolders, and files | Full Control
Domain Users | This Folder Only | Modify
Creator/Owner | Subfolders and Files Only | Modify

- Change the FSLogix policy (as seen in the previous steps) and point the FSLogix share to the new **Azure NetApp Files share**<br/>
This will be something like **\\\wvdanf-2916.wvdworkshopt01.onmicrosoft.com\wvdanfshare\FSLogix-Profiles**

![ANF - FSLogix Permissions](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ANF-SetPermissions.png)

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