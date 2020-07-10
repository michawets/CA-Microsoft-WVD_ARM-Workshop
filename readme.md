# Welcome to the Microsoft & Cloud-Architect WVD Workshop

These are the Hands-on Lab steps, part of the *Microsoft & Cloud-Architect WVD ARM (Spring update) Workshop*.<br/>
If you have any questions, just ask **Micha** <a href="https://www.cloud-architect.be" target="_blank">(blog)</a> or **Bart** <a href="https://bartroels.github.io/2020-04-21-EverythingYouNeedtoKnowOnWVD/" target="_blank">(blog)</a> for further assistance<br/>


## Slides + video
You can find the slides from the Presentation <a href="/CA-Microsoft-WVD_ARM-Workshop/Presentation/MSFT%20Workshop%20-%20Windows%20Virtual%20Desktop.pdf" target="_blank">here</a>
You can find the recordings here:<br/>
<a href="https://youtu.be/__Z4-zCNdlI" target="_blank">Part 1</a><br/>
<a href="https://youtu.be/_j3IQfPfo_Q" target="_blank">Part 2</a><br/>
<a href="https://youtu.be/6WCqaWWtyfY" target="_blank">Part 3</a><br/>

## Considerations

Before you begin, you have to determine the Azure AD Tenant & Windows AD setup for this lab.<br/>
 - **Scenario A)** is that you have a new or empty Azure AD Tenant, with an empty Azure Subscription, **without any pre-configured AD Connect** (Recommended)
 - **Scenario B)** is that you have an existing Azure AD Tenant, with a existing Azure Subscription & already have Azure AD Connect enabled. (Azure AD Domain services is not covered in this workshop but possible)

 > **IMPORTANT**<br/>
 > Please do not perform these steps in a Production environment. An Test environment is really recommended.<br/>
 > If you have to run this workshop in a Production environment, make sure not to remove or overwrite any existing objects in your environment.

 > **IMPORTANT**<br/>
 > If you share an Azure AD Tenant & Subscription with multiple Workshop attendees, make sure only 1 of you perform the PreReq tasks<br/>
 > The others need to wait until the PreReqs are completed before proceeding.

## PreRequisite Tasks
### Workshop layout
[Workshop layout](/CA-Microsoft-WVD_ARM-Workshop/Workshop%20layout)

### Scenario A)
1. [Create Windows Active Directory VM and configure Azure AD Connect](/CA-Microsoft-WVD_ARM-Workshop/Create%20Windows%20Active%20Directory%20VM)
2. [Create test users & groups](/CA-Microsoft-WVD_ARM-Workshop/Create%20Test%20users%20and%20groups)

### Scenario B)
1. [Create test users & groups](/CA-Microsoft-WVD_ARM-Workshop/Create%20Test%20users%20and%20groups)

## How to Connect
1. [How to Connect to WVD Spring edition](/CA-Microsoft-WVD_ARM-Workshop/Connect%20to%20WVD)

## Windows Virtual Desktop Tasks
If you are working alone, you can use the Resource Group names as stated in the workshop.<br/>
If you are sharing an Azure AD Tenant, subscription and Windows AD, keep in mind that each attendee needs its own Resource Groups.<br/>
The test accounts can be shared for all attendees!<br/>

1. [Create custom WVD image](/Create%20custom%20WVD%20image)
2. [Create WVD Workspace, Hostpool and VMs from the Azure Marketplace](/Create%20WVD%20Hostpool%20and%20VM%20for%20Pooled%20usage)
3. [Create WVD Workspace, Hostpool and VMs from the ARM Template](/Create%20WVD%20Hostpool%20and%20VMs%20using%20the%20ARM%20Template)
4. [Configure Pooled WVD in the Portal](/Configure%20WVD%20in%20Portal)
5. [Configure Pooled WVD using Powershell](/Configure%20WVD%20using%20Powershell)
6. [Configure FSLogix with Fileserver on the Domain Controller](/Configure%20FSLogix)
7. [Configure FSLogix on Azure Fileshare](/Configure%20FSLogix%20on%20Azure%20Fileshare)
8. [Configure Security - RBAC & MFA](/Configure%20Security%20-%20RBAC%20%26%20MFA)
9. [Optional] [Install IGEL OS on Hyper-V](/Create%20Igel%20OS%20on%20HyperV)
10. [Optional] [Install IGEL OS on VirtualBox](/Create%20Igel%20OS%20on%20VirtualBox)
11. [Troubleshooting](/Troubleshooting)

**IMPORTANT**<br/>
At this moment (17/06/2020), there is a bug in the Windows 10 2004 version.<br/>
When connecting to WVD, you will get an error in the client:<br/>
**Error code: 0x3000047**<br/>
To resolve this, you must execute this on all VMs running Windows 10 2004 and restart the VM:
```powershell
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\rdp-sxs" -Name "fReverseConnectMode" -Value 1 -Type DWord -Force
```

![Footer](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Footer.png)

<script type="text/javascript">
    setTimeout(function() { 
            document.getElementById("sidebar").style.display = "none";
            var x = document.getElementsByClassName('inner'); 
            x[0].style.width = "90%";
            var x = document.getElementsByTagName('h1'); 
            x[0].style.width = "90%";
            x[0].style.textAlign = "center"
            x[0].innerHTML = "Microsoft & Cloud-Architect WVD Workshop"
        }, 250);
</script>
