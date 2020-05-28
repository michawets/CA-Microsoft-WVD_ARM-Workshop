[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create IGEL OS on Hyper-V](/CA-Microsoft-WVD_ARM-Workshop/Create%20Igel%20OS%20on%20HyperV)
# Create IGEL OS on Hyper-V

In this step, you will install the IGEL OS on a Hyper-V VM, run it and connect to the WVD service (even with MFA enabled!)

We will do this in 3 sections: 
* Register for a free trial
* Install the IGEL OS on a Hyper-V VM
* Configure your IGEL OS


## Register for a free trial
Go to <a href="https://www.igel.com/form-download/" target="_blank">https://www.igel.com/form-download/</a>, fill in the details and register for the 30 day free trial.

You will get an email with all details. Click on the link **4. Download the IGEL OS and convert a machine**<br/>
![IgelEmail](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/IgelEmail.png)

Download the Zip-file, extract the zip-file and remember the location

## Install the IGEL OS on a Hyper-V VM
Start the HyperV Manager<br/>
![HyperV-Startup](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-StartUp.png)

Right-click the Hyper-V Server (local PC for example), go to **New** and select **Virtual Machine**<br/>
![HyperV-NewVM](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-NewVM.png)

Specify a name for the VM (for example **IgelVM**) and click on **Next**<br/>
![HyperV-SpecifyName&Location](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-SpecifyName&Location.png)

Select **Generation 2** for the VM and click on **Next**<br/>
![HyperV-SpecifyGeneration](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-SpecifyGeneration.png)

Assign the memory of the IgelVM (preferably *2GB* or more) and click on **Next**<br/>
![HyperV-AssignMemory](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-AssignMemory.png)

Select the correct *Virtual Switch* (depending on the HyperV Switch setup) and click on **Next**<br/>
![HyperV-ConfigureNetworking](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConfigureNetworking.png)

Configure the Disk settings from the VM (for example *32GB*) and click on **Next**<br/>
![HyperV-ConfigureHDD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConfigureHDD.png)

Select **Install an operating system from a bootable image file**, click on **Browse**, select the **IGEL ISO** that was downloaded & extracting at the beginning and click on **Next**<br/>
![HyperV-InstallOptions](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-InstallOptions.png)

Review the *Summary* and click on **Finish**<br/>
![HyperV-Finish](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Finish.png)

Right-click the Hyper-V Server and select **Virtual Switch Manager**<br/>
![HyperV-OpenSwitchManager](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-OpenSwitchManager.png)

Go to **Global Network Settings** and note the **MAC Address Range** configured. You will need this in one of the next steps<br/>
![HyperV-OpenSwitchManager-MACaddress](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-OpenSwitchManager-MACaddress.png)

Open the *IgelVM* Settings<br/>
![HyperV-OpenIgelVMSettings](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-OpenIgelVMSettings.png)

Configure a **Static MAC address** using an address in the range you noted from the **MAC Address Range** in the **Virtual Switch Manager** and click on **Apply**<br/>
![HyperV-OpenIgelVMSettings-ConfigNIC](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-OpenIgelVMSettings-ConfigNIC.png)

Disable **Checkpoints** for the VM and click on **Apply**<br/>
![HyperV-OpenIgelVMSettings-DisableCheckpoints](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-OpenIgelVMSettings-DisableCheckpoints.png)

Disable **Secure Boot** for the VM and click on **Apply**<br/>
![HyperV-OpenIgelVMSettings-DisableSecureBoot](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-OpenIgelVMSettings-DisableSecureBoot.png)

Verify the **Boot order** to make sure the VM will first boot from the ISO and click on **OK**<br/>
![HyperV-ConnectToVm-VerifyBootOrder](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConnectToVm-VerifyBootOrder.png)

Right-click the **IgelVM** and select **Connect**<br/>
![HyperV-ConnectToVm](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConnectToVm.png)

Click on **Start** to start the IgelVM<br/>
![HyperV-ConnectToVm-StartVm](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConnectToVm-StartVm.png)

Select the default option: **Standard Installation + Recovery**<br/>
![HyperV-ConnectToVm-SelectStandardOption](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConnectToVm-SelectStandardOption.png)

Select your preferred language and click on **OK**<br/>
![HyperV-Igel-English](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-English.png)

Review the EULA and click on **I agree**<br/>
![HyperV-Igel-AgreeTaC](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-AgreeTaC.png)

Confirm the warning by clicking on **Install firmware**<br/>
![HyperV-Igel-InstallFirmware](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-InstallFirmware.png)

The **IGEL OS** will now be installed on the Hyper-V VM<br/>
![HyperV-Igel-InstallationProgress](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-InstallationProgress.png)

When finished, Click on **Shutdown**<br/>
![HyperV-Igel-Finished](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-Finished.png)



## Configure your IGEL OS
<!--
In the email from IGEL, click on the link **7. Click here to activate your software licenses and download the license file.**<br/>
![IgelEmail-2](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/IgelEmail-2.png)

On the IGEL page, enter the MAC Address you assigned to your VM<br/>
![IgelActivateMAC](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/IgelActivateMAC.png)

Right-click on the **download license** button and select **Copy Link address** (or your browser alternative option)<br/>
Keep that License url in a notepad<br/>
![IgelSaveLink](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/IgelSaveLink.png)

-->
Make sure the ISO is disconnected, and then click on **Start** again.<br/>
![HyperV-ConnectToVm-StartVm](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConnectToVm-StartVm.png)

Select your preferred language and click on **Next**<br/>
![HyperV-Igel-SelectLanguage](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-SelectLanguage.png)

Select your **Keyboard Layout** and click on **Next**<br/>
![HyperV-Igel-SelectKeyboardLayout](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-SelectKeyboardLayout.png)

Select your **Timezone & Location** and click on **Next**<br/>
![HyperV-Igel-ConfigureTimezone](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-ConfigureTimezone.png)

Configure the correct **Date & Time**, click on **Apply** and click on **Next**<br/>
![HyperV-Igel-ConfigureDateTime](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-ConfigureDateTime.png)

<!--
![HyperV-Igel-ActivateYourIgel](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-ActivateYourIgel.png)
-->
Select **Continue with Starter License** (or other option if applicable for you) and click on **Next**<br/>
![HyperV-Igel-ActivateYourIgel](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-ActivateYourIgel-starter.png)

Skip the Cloud Gateway Agent Setup by clicking on **Skip**<br/>
![HyperV-Igel-SkipCloudGateway](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-SkipCloudGateway.png)

Confirm all changes by clicking on **Restart**<br/>
![HyperV-Igel-restart](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-restart.png)


After the reboot, you can configure the IGEL OS WVD setup. <br/>
Detailed steps how to do this can be found here: <a href="https://kb.igel.com/igelos-11.03.500/en/how-to-connect-igel-os-to-windows-virtual-desktop-28251665.html" target="_blank">https://kb.igel.com/igelos-11.03.500/en/how-to-connect-igel-os-to-windows-virtual-desktop-28251665.html</a>


Once configured, you will see the **WVD session** name. Double click on it to launch<br/>
![HyperV-Igel-StartWVD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-StartWVD.png)

When you have **MFA** configured for your account, you will get the MFA popup & request<br/>
![HyperV-Igel-EvenMFASupport](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-EvenMFASupport.png)

Select the Remote Application or Remote Desktop configured for your user account to launch it <br/>
![HyperV-Igel-SelectYourApplicationOrDesktop](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-SelectYourApplicationOrDesktop.png)







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