[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure Pooled WVD](/CA-Microsoft-WVD_ARM-Workshop/Configure%20WVD%20in%20Portal)
# Configure Pooled WVD in the Azure Portal

In this step, we will configure the Pooled WVD deployment in the Azure Portal.


In this step, you will learn how to:
* Get information about your WVD Workspace, Hostpools, Application Groups, etc
* Assign users to the RemoteDesktop application group
* Create a new RemoteApp application group
* Publish application(s) to the application group
* Configure Load-balancing mechanisms on the Hostpool
* Configure Single- or Multi-session on the Hostpool

## Find the Windows Virtual Desktop Service
First, we will look for the new *Azure Portal* integrated **Windows Virtual Desktop service**

1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Search for **Windows Virtual Desktop**<br/>
![Search for WVD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop.png)

This is the overview you get in the Windows Virtual Desktop pane<br/>
![WVD pane](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop-Overview.png)

## Get information about your WVD Hostpool

1. Click on **Host pools**

2. Click on the **wvd-workshop-win10-1909-hp** Hostpool

3. In **Overview**, you get a good summary of your deployed Hostpool<br/>
![Hostpool overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ReviewHostpoolSettings.png)

4. Click on **Properties**, **Application Groups** and **Session hosts** to get an view on all settings in your Hostpool

## Get information about your WVD Workspace

1. Click on **Workspaces**

2. Click on the **wvd-workshop-win10-1909-ws** Workspace

3. In **Overview**, you get a good summary of the deployed Workspace<br/>
![Workspace overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ReviewWorkspaceSettings.png)

4. Click on **Properties** and **Application Groups** to get an view on all settings

## Get information about the default WVD Desktop Application Group

1. Click on **Application Groups**

2. Click on the **wvd-workshop-win10-1909-hp-DAG** Application group

3. In **Overview**, you get a good summary of the default **Desktop Application Group**<br/>
![Application Group overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ReviewApplicationGroupSettings.png)

4. Click on **Properties** and **Assignments** to get an view on all settings

## Assign users to the RemoteDesktop application group

1. Click on **Application Groups**<br/>
Click on the AppGroup **wvd-workshop-win10-1909-hp-DAG**<br/>
Click on **Assignments**<br/>
Click on **Add**<br/>
Type in **WVDWorkshop**<br/>
Select the **WVDWorkshopFullDesktopUsers** from the list<br/>
Click on **Select**<br/>
![Assign group to Application Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ChangeApplicationGroup-Assignments.png)

2. Sign in with **demouser001** to see if the user now has a **Full Desktop** published

## Create a new RemoteApp application group

1. Click on **Application Groups**

2. Click on **Add**<br/>
![Add Application Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup.png)

3. Select the **wvd-workshop-sessionhosts-rg** Resource Group<br/>
Fill in the Basics and click on **Next: Assignments >**<br/>
![Application Group Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Basics.png)

4. Click on **+ Add Azure AD users or user groups**<br/>
Search for our RAP group *WVDWorkshopRemoteAppUsers*<br/>
Select the group from the list and click on **Select**<br/>
Click on **Next: Applications >**<br/>
![Application Group Assignments - Add Users/Groups](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Assignments-1.png)

5. Click on **+ Add applications**<br/>
Select **Acrobat Reader DC** from the list<br/>
You can change the Display name if you like<br/>
Click on **Save**<br/>
If you want to add more applications, just repeat these steps<br/>
Click on **Next: Workspace >**<br/>
![Application Group Assignments - Add applications](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Applications.png)

6. Select **Yes** at the option *Register application group* to publish the application group to the users<br/>
You will not be able to change the *Workspace*, as we already have an Application Group in the 1909 Hostpool, registered to a Workspace.<br/>
Therefor, this new Application Group will be registered to the same workspace<br/>
Click on **Review + create**<br/>
![Application Group Assignments - Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Workspace.png)

7. Review the settings we configured and click on **Create**<br/>
![Application Group Assignments - Create](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Create.png)

8. Sign in with **demouser002** to see if the user now has **Acrobat Reader** (and other apps) published.

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