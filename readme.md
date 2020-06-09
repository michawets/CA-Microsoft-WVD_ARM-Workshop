# Welcome to the Microsoft & Cloud-Architect WVD Workshop

These are the Hands-on Lab steps, part of the *Microsoft & Cloud-Architect WVD ARM (Spring update) Workshop*.<br/>
If you have any questions, just ask **Micha** or **Bart** for further assistance<br/>

## Considerations

Before you begin, you have to determine the Azure AD Tenant & Windows AD setup for this lab.<br/>
 - **Scenario A)** is that you have a new or empty Azure AD Tenant, with an empty Azure Subscription, **without any pre-configured AD Connect** (Recommended)
 - **Scenario B)** is that you have an existing Azure AD Tenant, with a existing Azure Subscription & already have Azure AD Connect enabled. (Azure AD Domain services is not covered in this workshop but possible)

 > **IMPORTANT**
 > Please do not perform these steps in a Production environment. An Test environment is really recommended.
 > If you have to run this workshop in a Production environment, make sure not to remove or overwrite any existing objects in your environment.

 > **IMPORTANT**
 > If you share an Azure AD Tenant & Subscription with multiple Workshop attendees, make sure only 1 of you perform the PreReq tasks
 > The others need to wait until the PreReqs are completed before proceeding.

## PreRequisite Tasks
### Scenario A)
1. [Create Windows Active Directory VM](/CA-Microsoft-WVD_ARM-Workshop/Create%20Windows%20Active%20Directory%20VM)
2. [Create test users & groups](/CA-Microsoft-WVD_ARM-Workshop/Create%20Test%20users%20and%20groups)

### Scenario B)
1. [Create test users & groups](/CA-Microsoft-WVD_ARM-Workshop/Create%20Test%20users%20and%20groups)


## Windows Virtual Desktop Tasks
3. [Create custom WVD image](/CA-Microsoft-WVD_ARM-Workshop/Create%20custom%20WVD%20image)
4. [Create WVD Workspace, Hostpool and VMs from the Azure Marketplace](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VM%20for%20Pooled%20usage)
5. [Create WVD Workspace, Hostpool and VMs from the ARM Template](/CA-Microsoft-WVD_ARM-Workshop/Create%20WVD%20Hostpool%20and%20VMs%20using%20the%20ARM%20Template)
6. [Configure Pooled WVD in the Portal](/CA-Microsoft-WVD_ARM-Workshop/Configure%20Pooled%20WVD)
7. [Configure Pooled WVD using Powershell](/CA-Microsoft-WVD_ARM-Workshop/Configure%20Personal%20WVD)
8. [Configure FSLogix](/CA-Microsoft-WVD_ARM-Workshop/Configure%20FSLogix)
9. [Connect to WVD](/CA-Microsoft-WVD_ARM-Workshop/Connect%20to%20WVD)
10. [Configure Security - RBAC & MFA](/CA-Microsoft-WVD_ARM-Workshop/Configure%20Security%20-%20RBAC%20%26%20MFA)
11. [Install IGEL OS on Hyper-V](/CA-Microsoft-WVD_ARM-Workshop/Create%20Igel%20OS%20on%20HyperV)

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