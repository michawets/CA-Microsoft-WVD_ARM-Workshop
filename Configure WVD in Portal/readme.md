[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure Pooled WVD](/CA-Microsoft-WVD_ARM-Workshop/Configure%20WVD%20in%20Portal)

# Configure Pooled WVD in the Azure Portal

In this step, we will configure the *Portal WVD deployment* in the Azure Portal.

In this step, you will learn how to:
* Get information about your WVD Workspace, Hostpools, Application Groups, etc
* Assign users to the RemoteDesktop application group
* Create a new RemoteApp application group
* Publish application(s) to the application group
* Configure Load-balancing mechanisms on the Hostpool
* Configure RDP Settings

## Find the Windows Virtual Desktop Service

First, we will look for the new *Azure Portal* integrated **Windows Virtual Desktop service**

- Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

- Search for **Windows Virtual Desktop**

![Search for WVD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop.png)

This is the overview you get in the Windows Virtual Desktop pane

![WVD pane](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-SearchWindowsVirtualDesktop-Overview.png)

## Get information about your WVD Hostpool

- Click on **Host pools**

- Click on the **wvd-workshop-win10-portal-hp** Hostpool

- In **Overview**, you get a good summary of your deployed Hostpool

![Hostpool overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ReviewHostpoolSettings.png)

- Click on **Properties**, **Application Groups** and **Session hosts** to get an view on all settings in your Hostpool

## Get information about your WVD Workspace

- Click on **Workspaces**

- Click on the **wvd-workshop-win10-portal-ws** Workspace

- In **Overview**, you get a good summary of the deployed Workspace

![Workspace overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ReviewWorkspaceSettings.png)

- Click on **Properties** and **Application Groups** to get an view on all settings

## Get information about the default WVD Desktop Application Group

- Click on **Application Groups**

- Click on the **wvd-workshop-win10-portal-hp-DAG** Application group

- In **Overview**, you get a good summary of the default **Desktop Application Group**

![Application Group overview](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ReviewApplicationGroupSettings.png)

- Click on **Properties** and **Assignments** to get an view on all settings

## Assign users to the RemoteDesktop application group

- Click on **Application Groups**<br/>
Click on the AppGroup **wvd-workshop-win10-portal-hp-DAG**<br/>
Click on **Assignments**<br/>
Click on **Add**<br/>
Type in **WVDWorkshop**<br/>
Select the **WVDWorkshopFullDesktopUsers** from the list<br/>
Click on **Select**

![Assign group to Application Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ChangeApplicationGroup-Assignments.png)

- Sign in with **demouser001** to see if the user now has a **Full Desktop** published

## Create a new RemoteApp application group

- Click on **Application Groups**

- Click on **Add**

![Add Application Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup.png)

- Select the **wvd-workshop-sessionhosts-rg** Resource Group<br/>
Select the **wvd-workshop-win10-portal-hp** Hostpool from the list<br/>
Select **RemoteApp**<br/>
Fill in the Name **wvd-workshop-win10-portal-hp-RAP** and click on **Next: Applications >**

![Application Group Basics](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Basics.png)

- Click on **+ Add applications**<br/>
Select **Acrobat Reader DC** from the list<br/>
Click on **Save**<br/>
If you want to add more applications, like the pre-installed **Visual Studio Code**, just repeat these steps<br/>
Click on **Next: Assignments >**

![Application Group Assignments - Add applications](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Applications.png)

- Click on **+ Add Azure AD users or user groups**<br/>
Search for our RAP group *WVDWorkshopRemoteAppUsers*<br/>
Select the group from the list and click on **Select**<br/>
Click on **Next: Workspace >**

![Application Group Assignments - Add Users/Groups](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Assignments-1.png)


- Select **Yes** at the option *Register application group* to publish the application group to the users<br/>
Select the **wvd-workshop-win10-portal-ws** from the list<br/>
Click on **Review + create**

![Application Group Assignments - Workspace](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Workspace.png)

- Review the settings we configured and click on **Create**

![Application Group Assignments - Create](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-CreateApplicationGroup-Create.png)

- Sign in with **demouser002** to see if the user now has **Acrobat Reader** (and other apps) published.

## Configure Load-balancing mechanisms on the Hostpool

There are 2 Load-balancing mechanisms available:

- The default Load-balancing mechanism is Breadth-first, which will evenly distribute user sessions across the session hosts in a host pool.
- The second Load-balancing mechanism is Depth-first, which will saturate a session host with user sessions in a host pool.<br/>
Once the first session reaches its session limit threshold, the load balancer directs any new user connections to the next session host in the host pool until it reaches its limit, and so on.

### Breadth-first

- Start user sessions to the Full Desktop using DemoUser001, 003, 004, 005 & 006 one-by-one, and monitor on which sessionhost the users get as a Sessionhost.<br/>
You can monitor the sessions in the Azure portal:<br/>
Go to the Hostpool, click on **Session hosts** and monitor the session by clicking on **Refresh**

 > Tip: Use the HTML5 webclient in different browsers & use Private Browsing.<br/>
 > For example: <br/>
 > DemoUser001 in the FatClient<br/>
 > DemoUser003 in Chrome<br/>
 > DemoUser004 in Chrome Private Browsing<br/>
 > DemoUser005 in Firefox<br/>
 > DemoUSer006 in Firefox Private Browsing

- Logoff all user sessions<br/>
This can be done in the portal:<br/>
Go to the Hostpool, click on **Session hosts**, click on *each Sessionhost* in the list and click on **Log off all active users**

![Logoff Sessions](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-LogoffSessions.png)

- Validate that all *Active Sessions* on all Sessionhosts are back to 0

### Depth-first

- Change the Load-balancing mechanism on the Hostpool<br/>
In this example, we will allow 2 sessions for each Sessionhost.

- Click on **Host pools**<br/>
Click on the Hostpool **wvd-workshop-win10-portal-hp**<br/>
Click on **Properties**<br/>
Change the *Max session limit* to **2**<br/>
Change the *Load balancing algorithm* to **Depth-First** and click on **Save**

![AzurePortal-WVD-ChangeHostpoolLB](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ChangeHostpoolLB.png)

- Perform the same test as Breadth-First Load-balancing in step 2, monitoring the loadbalancing of the user sessions accross the Sessionhosts.<br/>

- Logoff all user sessions (Azure Portal)

- Change back to the default Load-balancing mechanism (Azure Portal)

## Configure RDP Settings

- Click on **Host pools**<br/>
Click on the Hostpool **wvd-workshop-win10-portal-hp**<br/>
Click on **RDP Properties**<br/>
Click on **Device redirection**<br/>
Change some settings, for example *Microphone redirection* and *Camera redirection* and click on **Save**

![AzurePortal-WVD-ChangeRDPSettings](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-WVD-ChangeRDPSettings.png)

- Connect with DemoUser001 and check if you have your camera & microphone in the WVD Session




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