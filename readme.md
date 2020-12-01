# Welcome to the Microsoft & Cloud-Architect WVD Workshop

Fast link to the workshop, generated using Github Pages: https://aka.ms/wvdworkshop

These are the Hands-on Lab steps, part of the *Microsoft & Cloud-Architect WVD ARM (Spring update) Workshop*.<br/>
**These are part of the update on 01/12/2020** <a href="https://www.microsoft.com/partner-training/we/?aid=41560" target="_blank">Registration link</a>.<br/>
If you have any questions, just ask **Micha** <a href="https://www.cloud-architect.be" target="_blank">(blog)</a> or **Bart** <a href="https://bartroels.github.io/2020-04-21-EverythingYouNeedtoKnowOnWVD/" target="_blank">(blog)</a> for further assistance
<br/>

## Prerequisites

 - Azure AD Tenant (global administrator)
 - Azure Subscription (owner on the subscription) (**not a free subscription, as this will not have enough CPU cores available**)
 - Azure Netapp services enabled on the subscription (optional, see below)


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
 - [Create Windows Active Directory VM and configure Azure AD Connect](/CA-Microsoft-WVD_ARM-Workshop/Create%20Windows%20Active%20Directory%20VM)
 - [Create test users & groups](/CA-Microsoft-WVD_ARM-Workshop/Create%20Test%20users%20and%20groups)

### Scenario B)
 - [Create test users & groups](/CA-Microsoft-WVD_ARM-Workshop/Create%20Test%20users%20and%20groups)

### Verify DNS Settings
 - [Verify your Virtual Network DNS settings](/CA-Microsoft-WVD_ARM-Workshop/Verify%20DNS%20Settings) *(new)*

### Verify your Powershell settings
 - [Verify your Powershell settings](/CA-Microsoft-WVD_ARM-Workshop/Verify%20Powershell) *(new)*

## Azure Netapp Files (Optional)
 > **IMPORTANT**<br/>
 > You need to be granted access to the Azure NetApp Files service.<br/>
 > To request access to the service, see the <a href="https://aka.ms/azurenetappfiles" target="_blank">Azure NetApp Files waitlist submission page</a>.<br/>
 > You must wait for an official confirmation email from the Azure NetApp Files team before continuing.
 
## How to Connect
When you are working in the workshop, and you have to connect to WVD, follow these steps first to setup your local device:
1. [How to Connect to WVD Spring edition](/CA-Microsoft-WVD_ARM-Workshop/Connect%20to%20WVD) *(updated)*

## Windows Virtual Desktop Tasks
If you are working alone, you can use the Resource Group names as stated in the workshop.<br/>
If you are sharing an Azure AD Tenant, subscription and Windows AD, keep in mind that each attendee needs its own Resource Groups.<br/>
The test accounts can be shared for all attendees!<br/>

1. [Create custom WVD image using Azure Image Builder](/CA-Microsoft-WVD_ARM-Workshop/Create%20custom%20WVD%20image%20with%20AIB) *(new)*<br/>
    If you dont want to create the image using AIB ==> [Preprep-ed image from Micha](/CA-Microsoft-WVD_ARM-Workshop/Create%20custom%20WVD%20image%20from%20VHD) *(new)*
2. [Create WVD Workspace, Hostpool and VMs from the Azure Portal](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VM%20for%20Pooled%20usage) *(updated)*
3. [Create WVD Workspace, Hostpool and VMs from the ARM Template](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VMs%20using%20the%20ARM%20Template) *(updated)*
4. [Configure Pooled WVD in the Portal](/CA-Microsoft-WVD_ARM-Workshop/Configure%20WVD%20in%20Portal) *(updated)*
5. [Configure Pooled WVD using Powershell](/CA-Microsoft-WVD_ARM-Workshop/Configure%20WVD%20using%20Powershell) *(updated)*
6. [Configure FSLogix with Fileserver on the Domain Controller](/CA-Microsoft-WVD_ARM-Workshop/Configure%20FSLogix)
7. [Configure FSLogix on Azure Fileshare](/CA-Microsoft-WVD_ARM-Workshop/Configure%20FSLogix%20on%20Azure%20Fileshare) *(updated)*
8. [Configure FSLogix on Azure Netapp Files](/CA-Microsoft-WVD_ARM-Workshop/Create%20ANF) *(new)*
9. [Configure Security - RBAC & MFA](/CA-Microsoft-WVD_ARM-Workshop/Configure%20Security%20-%20RBAC%20%26%20MFA)
10. [Optional] [Install IGEL OS on Hyper-V](/CA-Microsoft-WVD_ARM-Workshop/Create%20Igel%20OS%20on%20HyperV)
11. [Optional] [Install IGEL OS on VirtualBox](/CA-Microsoft-WVD_ARM-Workshop/Create%20Igel%20OS%20on%20VirtualBox)
12. [Troubleshooting](/CA-Microsoft-WVD_ARM-Workshop/Troubleshooting) *(updated)*

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
