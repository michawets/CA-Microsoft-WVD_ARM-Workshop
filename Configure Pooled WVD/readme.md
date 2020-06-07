[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure Pooled WVD](/CA-Microsoft-WVD_ARM-Workshop/Configure%20Pooled%20WVD)
# Configure Pooled WVD in the Azure Portal

In this step, we will configure the Pooled WVD deployment in the Azure Portal.


In this step, you will learn how to:
* Get information about your WVD Workspace, Hostpools, Application Groups, etc
* Create a new RemoteApp application group
* Assign users to the application group
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

## Create a new RemoteApp application group

1. Click on **Application Groups**

2. Click on **Add**<br/>
![Add Application Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup.png)

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