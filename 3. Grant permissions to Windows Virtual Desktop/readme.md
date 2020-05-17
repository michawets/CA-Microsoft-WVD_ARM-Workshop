[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [3. Grant permissions to Windows Virtual Desktop](/CA-Microsoft-WVD_ARM-Workshop/3.%20Grant%20permissions%20to%20Windows%20Virtual%20Desktop)
# 3. Grant permissions to Windows Virtual Desktop

In this step, you grant permissions to the **Windows Virtual Desktop service** so it can query your newly create Azure AD for administrative and end-user tasks.
Then we will give the Admin account in the Azure AD Tenant the necessary permissions to create a WVD Tenant
> You will need the admin-account from the newly created Azure AD

We will do this in 2 sections: 
* Give consent to the Windows Virtual Desktop service
* Give the admin account TenantCreator permissions

## Give consent to the Windows Virtual Desktop service

1. Open a Notepad(++)/VS Code, and paste your Azure AD tenant name (for example wvdworkshopt01.onmicrosoft.com)

2. Paste this url, but replace {tenant} with your Azure AD tenant name
```
https://login.microsoftonline.com/{tenant}/adminconsent?client_id=5a0aa725-4958-4b0c-80a9-34562e23f3b7&redirect_uri=https%3A%2F%2Frdweb.wvd.microsoft.com%2FRDWeb%2FConsentCallback
```
In my example, this would be 
```
https://login.microsoftonline.com/wvdworkshopt01.onmicrosoft.com/adminconsent?client_id=5a0aa725-4958-4b0c-80a9-34562e23f3b7&redirect_uri=https%3A%2F%2Frdweb.wvd.microsoft.com%2FRDWeb%2FConsentCallback
```

3. Open this url in a new browser & sign in with admin-account from the newly created Azure AD

4. Select **Accept**<br/>
![Accept Server Consent](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-AcceptServerConsent.png)

5. Close the browser

6. Wait 1 minute

7. Paste this 2nd url in your Notepad(++)/VS Code, replace again the {tenant} part
```
https://login.microsoftonline.com/{tenant}/adminconsent?client_id=fa4345a4-a730-4230-84a8-7d9651b86739&redirect_uri=https%3A%2F%2Frdweb.wvd.microsoft.com%2FRDWeb%2FConsentCallback
```
In my example, this would be 
```
https://login.microsoftonline.com/wvdworkshopt01.onmicrosoft.com/adminconsent?client_id=fa4345a4-a730-4230-84a8-7d9651b86739&redirect_uri=https%3A%2F%2Frdweb.wvd.microsoft.com%2FRDWeb%2FConsentCallback
```
8. Open this 2nd url in a new browser & sign in with admin-account from the newly created Azure AD

9. Select **Accept**<br/>
![Accept Client Consent](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-AcceptClientConsent.png)
<br/>
<br/>

## Give the admin account TenantCreator permissions

1. Open the Azure Portal from the new Azure AD Tenant, and sign in with the admin account from this tenant (admin@{tenant})
```
https://portal.azure.com/{tenant}
```
In my example, this would be 
```
https://portal.azure.com/wvdworkshopt01.onmicrosoft.com
```

2. In the search bar within the Azure portal, search for **Enterprise applications** and select the entry that appears under the Services category.<br/>
![Search for Enterprise applications](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Search-EnterpriseApplications.png)

3. Within Enterprise applications, search for **Windows Virtual Desktop**.<br/>
You'll see the two applications that you provided consent for in the previous section. <br/>
Of these two apps, select **Windows Virtual Desktop**.<br/>
![Search & select Windows Virtual Desktop](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-EnterpriseApps-SelectWVD.png)

4. Select **Users and groups**<br/>
You might see that the administrator who granted consent to the application is already listed with the Default Access role assigned. This is not enough, the admin account also needs the TenantCreator role to create a Windows Virtual Desktop tenant<br/>
Click **Add User**<br/>
![Add User](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-EnterpriseApps-AddUser.png)

5. Click on **Users**, select the **Tenant Admin** on the right side, click on **Select**, and finish the wizard by clicking on **Assign**<br/>
![Assign Tenant Creator](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-AssignTenantCreator.png)

![Assigned Tenant Creator](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-EnterpriseApps-AddedWVD.png)


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