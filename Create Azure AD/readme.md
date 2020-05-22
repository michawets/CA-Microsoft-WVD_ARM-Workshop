[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create new Azure AD](/CA-Microsoft-WVD_ARM-Workshop/Create%20Azure%20AD)
# Create Azure AD Tenant

First step is creating a seperate Azure AD Tenant, with a new Admin account in that Tenant.
We will use this tenant to store the WVD users, by using **Azure AD Connect** in our "OnPrem" Windows Active Directory.

We will do this in 2 sections: 
* Create the Azure AD
* Create new Azure AD admin account
* Sign in with the new Azure AD admin account

## Create Azure AD

1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Click on **Create a Resource**
![Create a new Azure Resource](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-CreateResource.png)

3. Typ in **Azure Active Directory** and click on the Azure AD option
![Create a new Azure AD Resource](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-AddResource-AzureAD.png)

4. Click on **Create**<br>
![Create AzureAD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Create-AzureAD.png)

5. Complete the **Azure AD creation wizard** and click on **Create**
> **IMPORTANT!**<br/>
> * The **Initial Domain Name** (NetBios later on) **cannot exceed the 15 char limit** (first part of the domainname - before .onmicrosoft.com)

![Create Azure AD Wizard](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Create-AzureADWizard.png)

<br/>
<br/>

## Create new Azure AD admin account

1. Open the Azure Portal from this new Azure AD Tenant, and sign in with the user you used to create the new Azure AD tenant
```
https://portal.azure.com/{tenant}
```
In my example, this would be 
```
https://portal.azure.com/wvdworkshopt01.onmicrosoft.com
```

2. Click on **Azure Active Directory** - **Users**<br>
![Open Azure AD - Users](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-OpenUsers.png)

3. Click on **New User**<br>
![New Azure AD User](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-AddUser.png)

4. Fill in the **New user** wizard, creating a new **Admin@{tenant.onmicrosoft.com}**<br>
Check **Show Password** and copy this password to your Notepad<br>
Click **Create**<br>
![Create New Azure AD User Wizard](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Create-AzureADUserWizard.png)

5. Click on the newly create Admin user<br>
![Open Azure AD User](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Open-AzureAdUser.png)

6. Click on **Directory role** - **Add Assignment**<br>
![Directory Role - Add Assignment](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-AzureADUser-DirectoryRole-AddAssignment.png)

7. Select **Global Administrator** and click on **Add**<br>
> **Warning!** This is not (always) a best practice, but for this workshop the easiest way<br>
> You should consider carefully who to make Global Administrator


![Assign Global Administrator rights](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-AssignGlobalAdmin.png)


## Sign in with the new Azure AD admin account

A new Azure AD user always has to change it's password at first logon. <br/>
We need to use the new Azure AD admin account in the next step, so we first login with the admin account to set a new password.

1. Open a new browser window or open a Private Browser session in your browser

2. Sign in on the [Azure Portal](https://portal.azure.com) with the new Azure AD Admin credentials (**admin@{tenant.onmicrosoft.com}**).<br/>
In my example, this would be 
```
**admin@wvdworkshopt01.onmicrosoft.com**
```

3. You will be promted to change the password by providing the current password & a new password.<br/>
Provide the password you got from section 2 and provide a new password.<br/>
Note this new password down, as this will be the credentials you will need in the next sections
![Change new admin user password](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ChangeAdminPassword.png)

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