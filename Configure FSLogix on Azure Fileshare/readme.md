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
You will need to install it, and restart your Powershell window

5. Restart your Powershell console as Administrator

6. Import the AzFilesHybrid module using this command<br/>
```powershell
    Import-Module -name AzFilesHybrid
```
**Important**: You will get another warning that you need Azure Powershell 2.8.0+ and Az.Storage 2.0.0+<br/>
You will need to install it, and restart your Powershell window

7. Restart your Powershell console as Administrator


https://github.com/Azure-Samples/azure-files-samples/releases/download/v0.2.0/AzFilesHybrid.zip

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