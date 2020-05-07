[Start](/MicrosoftWVDWorkshop/) / [5. Create custom WVD image](/MicrosoftWVDWorkshop/5.%20Create%20custom%20WVD%20image)
# 5. Create custom WVD image

In this step, you will create a custom WVD image containing FSLogix, Acrobat Reader & Visual Studio Code pre-installed. In this way, your newly deployed WVD Sessionhosts will already have this software available.

We will do this in 4 sections: 
* Deploy a new VM using **Windows 10 Enterprise Multi Session** from the Marketplace
* Connect to new VM & **install the needed software**
* **Sysprep** the VM
* Create an **Azure Managed Image** from the VM

## Create new VM

1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Click on **Resource Groups** & create a new Resource Group in **west-europe**:
* **wvd-workshop-tempimagevm-rg**<br/>
![Create Resource Group](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Create-ResourceGroup.png)

3. Open the **wvd-workshop-tempimagevm-rg** Resource Group & click on **Add**.<br/>
![Add Resource](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-ResourceGroup-AddResource.png)

4. Search for **Microsoft Windows 10** and hit **Enter**<br/>
![Search for Windows 10](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-SearchWindows10.png)

5. Select the Windows 10 Version you want: with or without Office 365 ProPlus & click on **Create**
 > **IMPORTANT!**<br/>
 > Select a Windows 10 Enterprise **multi-session** from the list!

![Select Windows 10 version](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-SelectWindowsVersion.png)<br/>
![Select Windows 10 version](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-SearchWindows10MU.png)

6. Fill in the wizard fields to ...
 - Create a new VM from the Marketplace
 - Select Premium SSD disk
 - Create a new (temporary) VNET & Subnet
 - Disable Boot Diagnostics & Security Center (if requested)

![Select Windows 10 version](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-BuildWin10-Step1.png)

___

![Select Windows 10 version](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-BuildWin10-Step2.png)

___

![Select Windows 10 version](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-BuildWin10-Step3.png)

___

![Select Windows 10 version](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-BuildWin10-Step4.png)


## Connect to new VM & install software
1. When the Deployment is finished, you go to the Resource Group and open the newly created VM.<br/>
![Open Image VM](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-GoToImageVm.png)

2. Connect to the Image VM using the **Connect** button, or by using the **Public IP** in MSTSC.EXE<br/>
In my example, this would be 
```
mstsc /v:40.115.5.174
```
![Connect to Image VM](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-ConnectToImageVm.png)

3. Install all the software you want available in your image.<br/>
In our example, we will install FSLogix, Acrobat Reader & Visual Studio Code<br/>
You can find the System installers here:
 - [**FSLogix installer**](https://aka.ms/fslogix_download)<br/> Extract & run .\FSLogix_Apps_*.*.yyyy.xxxxx\x64\Release\FSLogixAppsSetup.exe"
 - [**Visual Studio Code system installer**](https://go.microsoft.com/fwlink/?Linkid=852157)
 - [**Acrobat Reader**](http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1902120049/AcroRdrDC1902120049_en_US.exe)

![Software overview](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-SoftwareOverview.png)

## Sysprep the VM

1. Open a Command Prompt window as an administrator. Change the directory to %windir%\system32\sysprep, and then run **sysprep.exe**.

2. In the System Preparation Tool dialog box, select **Enter System Out-of-Box Experience (OOBE)** and select the **Generalize** check box.

3. For Shutdown Options, select **Shutdown**.

4. Select **OK**.<br/>
![Sysprep](https://michawets.github.io/MicrosoftWVDWorkshop/images/ImageVM-Sysprep.png)

___

![Sysprep running](https://michawets.github.io/MicrosoftWVDWorkshop/images/ImageVM-SysprepRunning.png)

## Create an Azure Managed Image

1. Open the Azure portal.

2. Select the Image VM from the **Virtual Machine** list.

3. In the Virtual machine page for the VM, on the upper menu, select **Capture**.
![Capture VM](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-CaptureVm.png)

4. Complete the **Capture Wizard**
 - For Name, either accept the pre-populated name or enter a name that you would like to use for the image.
 - For Resource group, select the **wvd-workshop-infra-rg** resource group from the drop-down list.
 - Select **Automatically delete this virtual machine after creating the image**.
 - Select **Off** for Zone resiliency.
 - Type in the Image VM name (when requested)
 - Click on **Create** to create the image.<br/>
![Capture VM Wizard](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-CaptureVmWizard.png)

5. After the image is created, you can find it as an **Azure Managed Image** in the resource group.<br/>
![Azure Managed Image](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-ManagedImage.png)

6. Delete the **wvd-workshop-tempimagevm-rg** Resource Group, as this is no longer needed<br/>
![Delete Temp RG](https://michawets.github.io/MicrosoftWVDWorkshop/images/AzurePortal-Imaging-DeleteTempRG.png)





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