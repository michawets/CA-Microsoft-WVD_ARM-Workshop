[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create Windows Active Directory VM](/CA-Microsoft-WVD_ARM-Workshop/Create%20Windows%20Active%20Directory%20VM)
# Create Windows Active Directory VM

In this step, you will
* Deploy a new VM using the **Template Deployment** from the Marketplace
* Connect the **Windows Active Directory** to **Azure Active Directory** using **Azure AD Connect**

You could use [**Azure Active Directory Domain Services**](https://azure.microsoft.com/en-us/services/active-directory-ds/), but this will not be covered in this workshop. If it is already enabled, you can skip this step.<br/>
<br/>
In this workshop, we will use AD Connect on a Azure VM running the Windows Active Directory role (for better understanding of the setup & to keep costs lower).

## Create Windows Active Directory VM
1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Click on **Resource Groups** & create 2 Resource Groups in **west-europe**:
* **wvd-workshop-infra-rg**
* **wvd-workshop-sessionhosts-rg**<br/>
![Create Resource Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Create-ResourceGroup.png)

3. Select the first Resource Group: **wvd-workshop-infra-rg**<br/>
Click on **Add**<br/>
![Add Resource in Resource Group](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-ResourceGroup-AddResource.png)

4. Search for **Template Deployment** and select the option **Template Deployment (deploy using custom templates)**
![Search Marketplace for Template Deployment](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Marketplace-SearchForTemplateDeployment.png)

5. Click on **Create** to confirm
![Search Marketplace for Template Deployment](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Marketplace-SearchForTemplateDeployment-Create.png)

6. Under **Load a GitHub quickstart template**, search for the template **active-directory-new-domain**
![Search GitHub for AD Deployment](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Marketplace-SearchForADDeployment.png)
Click on **Select template**<br/>
![Search GitHub for AD Deployment](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Marketplace-SearchForADDeployment-Select.png)

7. Fill in the **Create an Azure VM with a new AD Forest** wizard and click on **Purchase**<br/>
The **Basics** should already be completed due to the fact we started from the Resource Group<br/>
 > **IMPORTANT!**
 > - Remember the username & password!
 > - Use **only lowercase characters** in the domain name & DNS prefix
 > - **Use the same name as your new Azure AD.**
 > - The NetBios name cannot exceed the 15 char limit

 
![Deploy AD VM](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-Marketplace-DeployAdVM.png)
<br/>
<br/>

## Config Azure AD Connect

1. When the Deployment is finished, you go to the Resource Group and open the **adVM**
![Open AD VM](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-GoToAdVM.png)

2. Connect to the Azure VM using the **Connect** button, or by using the **DNS name** in MSTSC.EXE<br/>
In my example, this would be 
```
mstsc /v:wvdworkshopt01-dc01-vip.westeurope.cloudapp.azure.com
```
![Get AD VM DNS Name](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-GetAdVMDnsName.png)

3. Disable IE Enhanced Security Configuration<br>
This wil make the download of AD Connect easier (and make your life a little easier 😉)<br>
You can do this in the Server Manager, or by executing this Powershell script in a Elevated Powershell window:
```powershell
function Disable-IEESC
{
    $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
    Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0
    $UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
    Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0
    Stop-Process -Name Explorer
    Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green
}
Disable-IEESC
```

3. Download **AD Connect** on the adVM and execute the installer
```
https://www.microsoft.com/en-us/download/confirmation.aspx?id=47594
```

4. After the automatic installer, the **Azure AD Connect wizard** should start.
Check to agree with the License terms and click on **Continue**
![Agree the Terms](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/ADConnect-AgreeTerms.png)

5. Because we will use a basic deployment, we can use the **Express Settings**
![Use Express Settings](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/ADConnect-UseExpressSettings.png)

6. Enter your **Azure** AD Admin Account (admin@{tenant} for example) credentials and click on **Next**
![Connect to Azure AD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/ADConnect-ConnectToAzureAD.png)

7. Enter your **Windows** AD Admin Account (Created using the ARM Template & used to connect to the adVM)
![Connect to Windows AD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/ADConnect-ConnectToWindowsAD.png)

8. Again, for simplicity, we will use the .onmicrosoft.com suffix (not a custom domain).<br/>
Check **Continue without matching all UPN suffixes to verified domains** and click on **Next**<br/>
![Config Azure AD Signin configuration](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/ADConnect-AzureADSigninConfig.png)

9. Click on **Install** to start the installation of the Sync Engine & configuration<br/>
![Start Sync engine installation](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/ADConnect-StartInstallation.png)

10. Click on **Exit** to finish the installation<br/>
![Finish Config](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/ADconnect-ConfigComplete.png)
<br/>
<br/>




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