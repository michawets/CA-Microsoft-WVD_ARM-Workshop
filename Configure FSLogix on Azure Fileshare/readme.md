[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure FSLogix on Azure Fileshare](/CA-Microsoft-WVD_ARM-Workshop/Configure%20FSLogix%20on%20Azure%20Fileshare)
# Configure FSLogix on Azure Fileshare

Before you perform these steps, you must complete the previous step to install the FSLogix GPO settings on the domain controller.

We will configure the FSLogix to store the VHDX-files on an Azure Fileshare removing the need for a Fileserver!

In this step, you will:
* Create an Azure Storage Account
* Create an Azure Fileshare on that Account
* Join the Storage account into your AD
* Assign permissions
* Configure FSLogix GPO's to store it on the Azure Fileshare

We will do as much as possible with Powershell to speed things up.<br/>

 > **IMPORTANT**<br/>
 > These steps need to be executed on a machine that is part of the target domein.<br/>
 > So most ideal would be the **AdVM**!

## Prep the AdVM

1. RDP to your AdVM

2. Launch a Powershell console as Administrator

3. Download the AzFilesHybrid module using this Powershell script:
```powershell
    $ErrorActionPreference = "Stop"
    if (!(Test-Path "c:\temp")) {
        New-Item "c:\temp" -ItemType Directory
    }
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri "https://github.com/Azure-Samples/azure-files-samples/releases/download/v0.2.0/AzFilesHybrid.zip" -OutFile c:\temp\AzFilesHybrid.zip -UseBasicParsing

    Expand-Archive -Path c:\temp\AzFilesHybrid.zip -DestinationPath C:\temp\AzFilesHybrid\

    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

    Set-Location C:\temp\AzFilesHybrid
    .\CopyToPSPath.ps1
```

4. Import the AzFilesHybrid module using this command<br/>
```powershell
    Import-Module -name AzFilesHybrid
```
**Important**: You will get an warning that you need PowershellGet 1.6.0+<br/>
You will need to install it, and restart your Powershell window<br/>
![PowershellGet Warning](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-PowershellGetWarning.png)

5. Restart your Powershell console as Administrator

6. Import the AzFilesHybrid module using this command<br/>
```powershell
    Import-Module -name AzFilesHybrid
```
**Important**: You will get another warning that you need Azure Powershell 2.8.0+ and Az.Storage 2.0.0+<br/>
You will need to install it, and restart your Powershell window<br/>
![Powershell AZ Warning](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/Powershell-AzWarning.png)

7. Restart your Powershell console as Administrator

8. Import the AzFilesHybrid module using this command<br/>
*This should not give any warnings anymore at this point*<br/>
```powershell
    Import-Module -name AzFilesHybrid
```

9. Sign in and connect to Azure using the admin account
```powershell
Connect-AzAccount
```

10. If you have multiple subscriptions, and need to change the default subscription, run this cmdlet:
```powershell
Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
```

11. We are going to create a **Storage Account** with an **Azure Fileshare** in the **wvd-workshop-infra-rg** resource group.<br/>
This can be done using this script:
```powershell
    $resourceGroup = Get-AzResourceGroup "wvd-workshop-infra-rg"

    $UniqueString = ([Guid]::NewGuid()).Guid.Substring(0,8)
    $storageAccountName = ("wvdworkshop{0}sa" -f $UniqueString)
    $storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup.ResourceGroupName -Name $storageAccountName -Location westeurope -SkuName Standard_LRS -Kind StorageV2 -EnableLargeFileShare

    $key = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroup.ResourceGroupName -AccountName $storageAccountName)[0].value

    $ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $key
    New-AzStorageShare -Name "wvdprofiles" -Context $ctx
```

12. Now we can join the **Storage Account** into the domain in a seperate OU: **WVD Storage**<br/>
Again, we're going to use a script to do this:
```powershell
    $dc = (Get-ADDomain).DistinguishedName
    $ouName = "WVD Storage"
    $path = ("OU={0},{1}" -f $ouName, $dc)
    $ouObject = ""
    try {$ouObject = Get-ADOrganizationalUnit -Identity $path } catch {}
    if (($null -eq $ouObject) -or ($ouObject -eq "")) {
        New-ADOrganizationalUnit -Name $ouName -Path $dc
    }

    join-AzStorageaccountForAuth -ResourceGroupName $resourceGroup.ResourceGroupName -Name $storageAccount.StorageAccountName -DomainAccountType "ComputerAccount" -OrganizationalUnitDistinguishedName $path
```

13. Next, we will assign the needed **"Share"** permissions on the Storage Account.<br/>
This is needed to give the users and admins to use/manage the Fileshare from within the WVD environment.<br/>
This script will give our Admin accounts **Elevated Share Contributor** permissions, and all our WVD Users **Share Contributor** permissions
```powershell
    $scope = $storageAccount.Id

    $fileShareContributorRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "Storage File Data SMB Share Contributor"} 
    $fileShareAdminRole = Get-AzRoleDefinition | Where-Object {$_.Name -eq "Storage File Data SMB Share Elevated Contributor"} 

    $WVDWorkshopFullDesktopUsers = Get-AzADGroup -DisplayName WVDWorkshopFullDesktopUsers
    $WVDWorkshopRemoteAppUsers = Get-AzADGroup -DisplayName WVDWorkshopRemoteAppUsers

    $WVDWorkshopAdmins = Get-AzADGroup -DisplayName WVDWorkshopAdmins

    New-AzRoleAssignment -ObjectId $WVDWorkshopFullDesktopUsers.Id -RoleDefinitionId $fileShareContributorRole.Id -Scope $scope
    New-AzRoleAssignment -ObjectId $WVDWorkshopRemoteAppUsers.Id -RoleDefinitionId $fileShareContributorRole.Id -Scope $scope

    New-AzRoleAssignment -ObjectId $WVDWorkshopAdmins.Id -RoleDefinitionId $fileShareAdminRole.Id -Scope $scope
```

14. Access the share as a **AdminUserxxx** account.
```powershell
    $myDomain = (Get-ADDomain).NetBIOSName
    $Username = "{0}\adminuser001" -f $myDomain
    $Password = "Micha&BartForProctorsOfTheYear2019"

    $cred = New-Object System.Management.Automation.PSCredential($Username, (ConvertTo-SecureString $Password -AsPlainText -Force))
    $filesharepath = "\\{0}.file.core.windows.net\wvdprofiles" -f $storageAccountName
    New-PSDrive -Name "S" -Root $filesharepath -Persist -PSProvider "FileSystem" -Credential $cred

    explorer s:
```

15. Create a new folder on the S-drive: **FSLogix-Profiles**

16. Change permissions on the folder to this *Best Practice* from *FSLogix*:

**User Account** | **Folder** | **Permissions**
--- | --- | ---
Users | This Folder Only | Modify
Creator/Owner | Subfolders and Files Only | Modify
Administrators | This Folder, Subfolders, and files | Full Control
Domain Admins | This Folder, Subfolders, and files | Full Control

17. Change the FSLogix policy (as seen in the previous step) and point the FSLogix share to the new **Azure Fileshare**<br/>
This will be something like **\\wvdworkshopdc144eaesa.file.core.windows.net\wvdprofiles**<br/>
You get the path from the variables from the powershell scripts:
```powershell
    Write-Host $filesharepath
```

18. Test the setup by signin in with the Testusers (demouserxxx)


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