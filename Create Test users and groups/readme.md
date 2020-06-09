[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Create Test users and Groups](/CA-Microsoft-WVD_ARM-Workshop/Create%20Test%20users%20and%20groups)
# Create Test users and Groups

In this step, you will
* Create users and groups
* Test synchronisation from Windows AD to Azure AD

## Create users and groups

1. Create at least 10 new users & 5 admin users in the Windows AD:<br/>
For example: <br/>
SamAccountName: *DemoUser001*<br/>
SamAccountName: *DemoUser002*<br/>
SamAccountName: *DemoUser003*<br/>
SamAccountName: *DemoUser004*<br/>
etc<br/>
SamAccountName: *AdminUser001*<br/>
SamAccountName: *AdminUser002*<br/>
etc<br/><br/>
You can run the following *Powershell script* in a Powershell console (as Administrator)<br/>
```powershell
    $ErrorActionPreference = "Stop"
    $dc = (Get-ADDomain).DistinguishedName
    $ouName = "WVD Users"
    $path = ("OU={0},{1}" -f $ouName, $dc)
    $ouObject = ""
    try {$ouObject = Get-ADOrganizationalUnit -Identity $path } catch {}
    if (($null -eq $ouObject) -or ($ouObject -eq "")) {
        New-ADOrganizationalUnit -Name $ouName -Path $dc
    }
    $username = "demouser"
    $adminname = "adminuser"
    $count = 1..10
    foreach ($i in $count) {
        $sam = ("{0}{1:D3}" -f $username, $i)
        New-AdUser -Name $sam -Path $path -Enabled $True -ChangePasswordAtLogon $false  `
            -AccountPassword (ConvertTo-SecureString "Micha&BartForProctorsOfTheYear2019" -AsPlainText -force) -PasswordNeverExpires $true -PassThru
    }
    $count=1..5
    foreach ($i in $count) {
        $sam = ("{0}{1:D3}" -f $adminname, $i)
        New-AdUser -Name $sam -Path $path -Enabled $True -ChangePasswordAtLogon $false  `
            -AccountPassword (ConvertTo-SecureString "Micha&BartForProctorsOfTheYear2019" -AsPlainText -force) -PasswordNeverExpires $true  -PassThru
    }
    $domainAdminGroup = Get-ADGroup "Domain Admins"
    $domainAdminGroup | Add-ADGroupMember -Members (Get-ADUser -Filter "name -like 'adminuser*'")
```
![DemoUser001 in Windows AD](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/WindowsAD-DemoUser001.png)

2. Create 2 AD Groups for WVD assignments later on<br/>
For example: <br/>
WVDWorkshopFullDesktopUsers<br/>
WVDWorkshopRemoteAppUsers<br/>
Assign "demouser001","demouser003","demouser004","demouser005","demouser006" to the *WVDWorkshopFullDesktopUsers* group<br/>
Assign "demouser002","demouser007","demouser008","demouser009","demouser010" to the *WVDWorkshopRemoteAppUsers* group<br/>
You can run the following *Powershell script* in a Powershell console (as Administrator)<br/>
```powershell
    $ErrorActionPreference = "Stop"
    $dc = (Get-ADDomain).DistinguishedName
    $ouName = "WVD Groups"
    $path = ("OU={0},{1}" -f $ouName, $dc)
    $ouObject = ""
    try {$ouObject = Get-ADOrganizationalUnit -Identity $path } catch {}
    if (($null -eq $ouObject) -or ($ouObject -eq "")) {
    New-ADOrganizationalUnit -Name $ouName -Path $dc
    }

    $FullDesktopGroupName = "WVDWorkshopFullDesktopUsers"
    $RemoteAppGroupName = "WVDWorkshopRemoteAppUsers"
    New-ADGroup -Name $FullDesktopGroupName -DisplayName $FullDesktopGroupName -Path $path -GroupScope Global -GroupCategory Security
    New-ADGroup -Name $RemoteAppGroupName -DisplayName $RemoteAppGroupName -Path $path -GroupScope Global -GroupCategory Security

    $FullDesktopGroup = Get-ADGroup $FullDesktopGroupName
    $RemoteAppGroup = Get-ADGroup $RemoteAppGroupName

    $FullDesktopGroup | Add-ADGroupMember -Members ("demouser001","demouser003","demouser004","demouser005","demouser006")
    $RemoteAppGroup | Add-ADGroupMember -Members ("demouser002","demouser007","demouser008","demouser009","demouser010")
```

## Test synchronisation from Windows AD to Azure AD
To test the sync from Windows AD to Azure AD, you can exec these steps:

1. Force a **AD Connect sync**<br/>
Launch a Powershell console as Administrator<br/>
Exec the following cmdlets<br/>
```powershell
Import-Module ADSync
Start-ADSyncSyncCycle -PolicyType Delta
```
 > Note: If you get an error about the ADSync Module, try <br/>
 > Import-Module "C:\Program Files\Microsoft Azure AD Sync\Bin\ADSync\ADSync.psd1"
 > Start-ADSyncSyncCycle -PolicyType Delta

![Force AD Connect sync](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/WindowsAD-ForceSync.png)

2. Open the Azure Portal from the new Azure AD Tenant, and sign in with the admin account from this tenant (admin@{tenant})
```
https://portal.azure.com/{tenant}
```
In my example, this would be 
```
https://portal.azure.com/wvdworkshopt01.onmicrosoft.com
```

3. Check if the DemoUsers appears in the Azure Active Directory users list (could take a few minutes for the sync to finish)
![Check Azure AD Connect Sync result](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzureAD-CheckAdConnectSync.png)