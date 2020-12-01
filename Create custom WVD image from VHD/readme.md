[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [If you dont want to create the image using AIB](/CA-Microsoft-WVD_ARM-Workshop/Create%20custom%20WVD%20image%20from%20VHD)

# Create custom WVD image using preprep-ed image from Micha


## Prepare your environment

 - Connect to Azure using Powershell

```powershell
Connect-AzAccount
Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
```

 - Set up the base variables & create a new Resource Group

```powershell
$currentAzContext = Get-AzContext
# destination image resource group
$imageResourceGroup = "myimagebuilder-rg"
$location = "westeurope"
$subscriptionID = $currentAzContext.Subscription.Id
$imageName = "Win1020h2"
$vhdSourceLocation = "https://wvdworkshopmichawets.blob.core.windows.net/vhds/window1020h2Template01_20201124100649.vhd?sp=r&st=2020-11-24T13:22:16Z&se=2030-11-24T21:22:16Z&spr=https&sv=2019-12-12&sr=b&sig=zYbYRa%2FIesdt96Obt2ux0YzCiEBgNOPSL4EftxJZTJo%3D"
# create resource group for image and image template resource
if ($null -eq (Get-AzResourceGroup -Name $imageResourceGroup -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $imageResourceGroup -Location $location
}
```

 - Create a new Storage Account & Blob Container to copy the VHD

```powershell
$saName = ("wvdwshop{0}" -f [guid]::NewGuid().Guid.replace("-","").Substring(0,14))
$sa = New-AzStorageAccount -ResourceGroupName $imageResourceGroup -Name $saName -Location $location -SkuName Standard_LRS -Kind StorageV2
$ctx = $sa.Context
$containerName = "vhds"
$container = New-AzStoragecontainer -Name $containerName -Context $ctx
$sasToken = New-AzStorageContainerSASToken -Name $containerName -Context $ctx -Permission rwdl -ExpiryTime ([dateTime]::Now.AddHours(4))
$vhdTargetLocation = ("{0}/window1020h2Template01.vhd{1}" -f $container.CloudBlobContainer.Uri.AbsoluteUri, $sasToken)
$vhdLocation = ("{0}/window1020h2Template01.vhd" -f $container.CloudBlobContainer.Uri.AbsoluteUri)
```

- Download AzCopy<br/>
Now we have to copy the Preprep-ed image to the new Storage Account.<br/>
To do so, we need AzCopy

```powershell
$azUrl = "https://aka.ms/downloadazcopy-v10-windows"
$targetZip = ("{0}\azcopy_windows_amd64.zip" -f $env:temp)
$targetFolder = ("{0}\azcopy_windows_amd64" -f $env:temp)
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($azUrl, $targetZip)
Expand-Archive -Path $targetZip -DestinationPath $targetFolder -Force
$azCopyLocation = Get-ChildItem -Path $targetFolder -Recurse | Where-Object {$_.Name -eq "azcopy.exe"}
```

- Copy the VHD<br/>
Now we will copy the VHD to the new Storage Account

```powershell
Start-Process -FilePath $azCopyLocation.FullName -ArgumentList @("cp", $vhdSourceLocation , $vhdTargetLocation) -Wait -Passthru
```

## Create Managed Image from VHD location

- We have the VHD in a Storage Account, last step is to convert the VHD into a Managed Image so we can use it in the deployment

```powershell
$imageConfig = New-AzImageConfig -Location $location
$imageConfig = Set-AzImageOsDisk -Image $imageConfig -OsType Windows -OsState Generalized -BlobUri $vhdLocation
$image = New-AzImage -ImageName $imageName -ResourceGroupName $imageResourceGroup -Image $imageConfig
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