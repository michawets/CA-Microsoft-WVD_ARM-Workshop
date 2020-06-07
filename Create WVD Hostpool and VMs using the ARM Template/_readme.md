[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create WVD Hostpool and VM for Pooled usage from the Azure Marketplace](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VM%20for%20Pooled%20usage/)
# Create WVD Hostpool and VM for Pooled usage from the Azure Marketplace

In this step, we will create a host pool within our Windows Virtual Desktop tenant (created in step 4) for Pooled usage. The tasks include:

* Create a VM in the Azure subscription.
* Join the VM to the Active Directory domain.
* Create a host pool in Windows Virtual Desktop.
* Register the VM with the Windows Virtual Desktop service.

We will perform these tasks by using the **Microsoft Azure Marketplace offering**. 

## Find the Marketplace offer

1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Click on **Resource Groups**<br/>
Select the **wvd-workshop-sessionhosts-rg** Resource Group<br/>
Click on **Add**<br/>
![Add Resource in Resource Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVDResourceGroup-Add.png)

3. Search for **Windows Virtual Desktop** and select **Windows Virtual Desktop - Provision a host pool**
![Search for WVD in Marketplace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Marketplace-SearchForWVD.png)

4. Click on **Create** to confirm

After that, follow the instructions in the next sections to enter the information for the appropriate blades.

## Enter Basic settings

1. Enter a name for the host pool (must be unique in your WVD Tenant)

2. Select the appropriate option: **Pooled**<br/>
> Select **'Pooled'**. The users will be directed to the best available session host in the pool and to utilize multi-session virtual machines.

3. Enter a comma-separated list of users who can access a full desktop after the Azure Marketplace offering finishes.<br/>
This could be: DemoUser001@{tenant}<br/>
In my example, this would be 
```
DemoUser001@wvdworkshopt01.onmicrosoft.com
```

4. The first info should already be completed, as we started from the Resource Group.<br/>
Select **Next**

![WVD Wizard - Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVDWizard-Basics.png)

## Configure virtual machines

1. Customize the number and size of the VMs.<br/>
Click **Custom**<br/>
Change the number to **2**<br/>
Change the VM size to **D4s_v3**

2. Enter a **prefix** for the names of the virtual machines<br/>
For example, *wvd-t-pool*<br/>
The virtual machines will be called "wvd-t-pool-0," "wvd-t-pool-1," and so on
 > **IMPORTANT**
 > Think about the 15 char limit of NetBIOS

3. Select **Next**

![WVD Wizard - Virtual Machines](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVDWizard-VMs.png)

## Virtual machine settings

1. At **Image Source**, select the source location of the VMs you want to deploy<br/>
In our case, this will be the **Managed Image**<br/>
Enter the **Image Name** & **wvd-workshop-infra-rg** as Resource Group name from the Image we created in *Step 5*<br/>
<br/>
If you did not complete Step 5, you could go for *Azure Marketplace Gallery*, select a blank Win10 image from the Marketplace (I would recommend the *Windows 10 with O365 ProPlus*) & select the **Image OS Version**<br/>

2. Choose your **Disk Type**<br/>
I would recommend the *Premium SSD*

3. Enter the **user principal name** and **password** for the domain account that will join the VMs to the Active Directory domain<br/>
These are the credentials created in Step 2<br/>
In my example, this would be 
```
MyAdminAccount@wvdworkshopt01.onmicrosoft.com
```

4. Select the **virtual network** that has connectivity to the Windows Active Directory server<br/>
Then choose a subnet to host the virtual machines<br/>
> If you used the GitHub Template, you should only have 1 VNET and 1 subnet.

5. Select **Next**.

![WVD Wizard - Configure Virtual Machines](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVDWizard-ConfigVMs.png)

## Windows Virtual Desktop tenant information

1. For **Windows Virtual Desktop tenant group name**, enter the name for the tenant group that contains your tenant.<br/>
You can Leave it default, as we create a WVD Tenant in Step 4 in the **Default Tenant Group**

2. For Windows Virtual Desktop tenant name, enter the name of the tenant from Step 4.<br/>
In my example, this would be 
```
WvdWorkshopT01
```

3. Specify the **credentials** that you want to use to authenticate as the **Windows Virtual Desktop tenant RDS Owner**.<br/>
Enter the credentials for the tenant admin account assigned in Step 3.<br/>
In my example, this would be 
```
admin@wvdworkshopt01.onmicrosoft.com
```

4. Select **Next**.

![WVD Wizard - WVD Settings](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVDWizard-WVDSettings.png)

## Complete setup and create the virtual machines

For the last two blades:

* On the **Summary** blade, review the setup information.<br/>
If you need to change something, go back to the appropriate blade and make your change before continuing.<br/>
If the information looks right, select **OK**.

* On the Buy blade, review the additional information about your purchase from the Azure Marketplace.<br/>
Click on **Create** to deploy your host pool.

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