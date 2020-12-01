[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Verify your Powershell settings](/CA-Microsoft-WVD_ARM-Workshop/Verify%20Powershell)

# Verify your Powershell settings

To be able to complete this course, it is recommended to install Powershell 7.1<br/>
Next to that, you will also need to install the AZ modules

## Install Powershell 7.1

 - Download & install the Powershell 7.1 installer

The Powershell installer can be found here: <a href="https://github.com/PowerShell/PowerShell/releases/download/v7.1.0/PowerShell-7.1.0-win-x64.msi" target="_blank">v7.1.0 Release of PowerShell</a><br/>
Download this MSI and install it on your system.

## Install AZ Modules in Powershell 7.1

 - Start a new Powershell 7.1 window **as Administrator**
 - Install the AZ modules

```powershell
Install-Module -Name AZ -Scope AllUsers -Force
Install-Module -Name Az.ManagedServiceIdentity -Scope AllUsers -Force
Install-Module -Name Az.ImageBuilder -Scope AllUsers -Force
Install-Module -Name Az.DesktopVirtualization -Scope AllUsers -Force
```



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