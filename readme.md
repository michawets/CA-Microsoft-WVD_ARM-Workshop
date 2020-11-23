# Welcome to the Microsoft & Cloud-Architect WVD Workshop

These are the Hands-on Lab steps, part of the *Microsoft & Cloud-Architect WVD ARM (Spring update) Workshop*.<br/>
**These are part of the update on 01/12/2020** <a href="https://www.microsoft.com/partner-training/we/?aid=41560" target="_blank">Registration link</a>.<br/>
<!-- If you have any questions, just ask **Micha** <a href="https://www.cloud-architect.be" target="_blank">(blog)</a> or **Bart** <a href="https://bartroels.github.io/2020-04-21-EverythingYouNeedtoKnowOnWVD/" target="_blank">(blog)</a> for further assistance<br/> -->


## Slides + video from previous edition
You can find the slides from the Presentation <a href="/CA-Microsoft-WVD_ARM-Workshop/Presentation/MSFT%20Workshop%20-%20Windows%20Virtual%20Desktop.pdf" target="_blank">here</a>
You can find the recordings here:<br/>
<a href="https://youtu.be/__Z4-zCNdlI" target="_blank">Part 1</a><br/>
<a href="https://youtu.be/_j3IQfPfo_Q" target="_blank">Part 2</a><br/>
<a href="https://youtu.be/6WCqaWWtyfY" target="_blank">Part 3</a><br/>

## Prerequisites

 - Azure AD Tenant
 - Azure Subscription
 - Azure Netapp enabled subscription

 > **IMPORTANT**<br/>
 > You need to be granted access to the Azure NetApp Files service.<br/>
 > To request access to the service, see the <a href="https://aka.ms/azurenetappfiles" target="_blank">Azure NetApp Files waitlist submission page</a>.<br/>
 > You must wait for an official confirmation email from the Azure NetApp Files team before continuing.


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