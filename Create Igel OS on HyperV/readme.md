[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create Igel OS on HyperV](/CA-Microsoft-WVD_ARM-Workshop/Create%20Igel%20OS%20on%20HyperV)
# Create Igel OS on Hyper-V

In this step, you will install the IGEL OS on a Hyper-V VM.

We will do this in 2 sections: 
* Register for a free trial
* Install the IGEL OS on a Hyper-V VM


## Register for a free trial
Go to <a href="https://www.igel.com/form-download/" target="_blank">https://www.igel.com/form-download/</a>, fill in the details and register for the 30 day free trial.

You will get an email with all details. Click on the link **4. Download the IGEL OS and convert a machine**


## Install the IGEL OS on a Hyper-V VM
Start the HyperV Manager<br/>
![HyperV-Startup](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-StartUp.png)

Right-click the Hyper-V Server (local PC for example), go to **New** and select **Virtual Machine**<br/>
![HyperV-NewVM](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-NewVM.png)

Specify a name for the VM (for example **IgelVM**) and click on **Next**<br/>
![HyperV-SpecifyName&Location](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-SpecifyName&Location.png)

Select **Generation 2** for the VM and click on **Next**<br/>
![HyperV-SpecifyGeneration](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-SpecifyGeneration.png)

Assign the memory of the IgelVM (preferably 2GB or more) and click on **Next**<br/>
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

When finished, Click on **Shutdown**
![HyperV-Igel-Finished](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-Igel-Finished.png)

Make sure the ISO is disconnected, and then click on **Start** again.
![HyperV-ConnectToVm-StartVm](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/HyperV-ConnectToVm-StartVm.png)





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