[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create WVD Workspace, Hostpool and VMs from the ARM Template](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VM%20for%20Personal%20usage/)
# Create WVD Workspace, Hostpool and VMs from the ARM Template

In this step, we will create a WVD Workspace, Hostpool & VMs within our Windows Virtual Desktop subscription for Pooled usage as we did in the previous step, but this time using the ARM Template. The task include:

* Create a WVD Workspace
* Create a WVD Hostpool
* Create VMs in the Azure subscription.
* Join the VMs to the Active Directory domain.
* Register the VMs with the Windows Virtual Desktop service.

We will perform these tasks by using the **Microsoft ARM Template**. 

## Deploy the ARM Template
1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Open a new tab in your browser and goto [GitHub WVD Templates](https://github.com/Azure/RDS-Templates/tree/master/wvd-templates/Create%20and%20provision%20WVD%20host%20pool)

3. Click on **Deploy to Azure**<br/>
![Deploy to Azure](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/GitHub-WVD-DeployToAzure.png)

4. Complete the wizard:
 - Select the correct **Subscription**
 - Select **wvd-workshop-sessionhosts-rg** as *Resource group*
 - Select **CustomImage** as *Rdsh Image Source*
 - Enter your Azure Managed Image name as the *Rdsh Custom Image Source Name* name (my example: **MyCustomWVDManagedImage**)
 - Enter **wvd-workshop-infra-rg** as the *Rdsh Custom Image Source Resource Group* name
 - Enter **wvd-t-pers** as the *Rdsh Name Prefix* name
 - Enter **2** as the *Rdsh Number Of Instances*
 - *Rdsh VM Disk Type* = **Premium_LRS**
 - *Rdsh Vm Size* = **Standard_D4s_v3**
 - Enter your Windows Active Directory Name as *Domain To Join* from Step 2 (my example: **wvdworkshopt01.onmicrosoft.com**)
 - Enter your Local Admin UserPrincipalName as *Existing Domain UPN* from Step 2 (my example: **MyAdminAccount@wvdworkshopt01.onmicrosoft.com**)
 - Enter your Local Admin Password as *Existing Domain Password* (my example: #NiceTryAttendee)
 - Enter the VNET name you want to use for the WVD Sessionhosts as *Existing Vnet Name* (when using the Template deployed AD: **adVNET**)
 - Enter the subnet name you want to use for the WVD Sessionhosts as *Existing Subnet Name* (when using the Template deployed AD: **adSubnet**)
 - Enter the Resource Group name containing the VNET as *Virtual Network Resource Group Name* (my example: **wvd-workshop-infra-rg**)
 - Enter the WVD Tenant Name you created in Step 4 as *Existing Tenant Name* (my example: **WvdWorkshopT01**)
 - Enter the WVD Hostpool name you want to give to the Personal Hostpool as *Host Pool Name* (for example: **MyPersonalHostpool**)
 - Set the *Enable Persistent Desktop* to **true** to enable Personal Desktops
 - [Optional] Enter the demousers you want to enable for Personal Desktops as *Default Desktop Users* (comma seperated)
 - Enter your Tenant Creator User UPN as *Tenant Admin Upn Or Application Id* from Step 1 (my example: **admin@wvdworkshopt01.onmicrosoft.com**)
 - Enter your Tenant Creator User Password ad *Tenant Admin Password* from Step 1 (my example: #NotAChance)

 5. Check the *I agree to the terms and conditions stated above* checkbox

 6. Click on **Purchase**

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
