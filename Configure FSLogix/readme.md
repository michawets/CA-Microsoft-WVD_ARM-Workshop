[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Configure FSLogix](/CA-Microsoft-WVD_ARM-Workshop/Configure%20FSLogix)
# Configure FSLogix

We will configure the FSLogix on Domain Level in this step.

In this step, you will:
* Configure Profile datadisk & Profile share on the DC
* Install & configure FSLogix GPO's on the DC

## Configure Profile datadisk & Profile share on the DC
1. Sign in on the [Azure Portal](https://portal.azure.com) with your credentials.

2. Go to **Virtual Machines**, select **adVM**, select **Disks** & click on **+ Add data disk**<br/>
![Add data disk](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-VirtualMachine-AddDataDisk.png)

3. In the dropdown, select **Create disk**<br/>
![Create disk](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-VirtualMachine-CreateDisk.png)

4. Enter **adVM_DataDisk-FSLogix** as diskname, change the size to **128GB Premium SSD** & click on **Create**<br/>
![Create managed disk](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-VirtualMachine-CreateManagedDisk.png)

5. Change the Host Caching to **None** and click on **Save**
![Save managed disk](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-VirtualMachine-SaveDataDisk.png)

6. RDP to your DC (See Step 2 how to connect)

7. Open a Run box (Windows-Key + r), type in **diskmgmt.msc** and hit *Enter*

8. The Disk Management will popup a *Initialize Disk* window. <br/>
Keep the default settings (MBR) and Click **OK**

9. Right-Click the *Unallocated* volume and click on **New simple volume**

10. Go through the wizard:
 - Keep *Maximum Size* available
 - Change drive letter to **P** (profiles)
 - Change *File System* to **ReFS**
 - Change *Allocation Size* to **64K**
 - Change *Volume Label* to **Profiles**
 - Make sure *Quick Format* is **enabled**
 - Click **Finish** at the end

11. Create a new folder on the P-drive: **FSLogix-Profiles**

12. Change permissions on the folder to this *Best Practice* from *FSLogix*:

**User Account** | **Folder** | **Permissions**
--- | --- | ---
Users | This Folder Only | Modify
Creator/Owner | Subfolders and Files Only | Modify
Administrators | This Folder, Subfolders, and files | Full Control
Domain Admins | This Folder, Subfolders, and files | Full Control

13. Share the folder to all Domain Users using this Powershell cmdlet:
```powershell
New-SmbShare -Name "FSLogix-Profiles$" -Path "P:\FSLogix-Profiles" -FullAccess "Domain Admins" -FolderEnumerationMode AccessBased -ChangeAccess "Domain Users" -CachingMode None
```


## Install & configure FSLogix GPO's on the DC
1. Download the FSLogix installer zipfile (containing the GPO's)<br/>
Extract the zipfile <br/>
Copy the policy files to the PolicyDefinitions folder.<br/>
This can be done using Powershell:<br/>
```powershell
$url = "https://aka.ms/fslogix_download"
$destination = "c:\temp\fslogix.zip"
New-Item -Path "c:\" -Name "Temp" -ItemType "directory" -ErrorAction SilentlyContinue
Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $destination -Priority High
Expand-Archive -LiteralPath $destination -DestinationPath c:\temp\fslogix
Copy-Item -Path "C:\temp\fslogix\fslogix.admx" -Destination "C:\Windows\PolicyDefinitions\"
Copy-Item -Path "C:\temp\fslogix\fslogix.adml" -Destination "C:\Windows\PolicyDefinitions\en-US\"
```

2. Open a Run box (Windows-Key + r), type in **gpmc.msc** and hit *Enter*

3. Create a new Policy Object (below *Group Policy Objects* from your domain) and name it **FSLogix - Default Policy**.<br/>
Apply these settings:<br/>
![Create FSLogix Policy](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/WindowsAD-FSLogixPolicy.png)

4. Create a new *Organizational Unit* named **WVD Sessionhosts**<br/>
Move all Sessionhosts to the new OU<br/>
![FSLogix Sessionhost OU](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/WindowsAD-WVDSessionhosts.png)

5. Apply the **FSLogix - Default Policy** policy to the new OU<br/>
![Apply FSLogix policy on OU](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/WindowsAD-ApplyFSLogixPolicy.png)

6. Reboot all WVD servers for the policy to apply.<br/>
This can be done using this Powershell oneliner, causing the Windows FW to be disabled (for ping) & reboot server<br/>
```powershell
Get-ADComputer -Filter 'Name -like "wvd-t-*"' | Select-Object DNSHostName | foreach { Invoke-Command -ComputerName $_.DNSHostName -ScriptBlock {Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False} ; Restart-Computer -ComputerName  $_.DNSHostName; }
```
 > Tip
 > You can check for the reboot using "ping wvd-t-pool-0 -t"


## Test FSLogix Profile containering
1. Start user sessions to the Full Desktop using DemoUser001, 003 & 004 one-by-one.

2. Check on de **adVM** under the **P:\FSLogix-Profiles** if you can see folders for each user<br/>
Each folder should have a *VHDX* file for the user.<br/>
Also check the Permissions on the folders to verify the permissions

3. Check the Sessionhost, under the folder **C:\Users**.<br/>
Each user, connected to that Sessionhost, should have two folders: **&lt;Username&gt;** & **local_&lt;Username&gt;**




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