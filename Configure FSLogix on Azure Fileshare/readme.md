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

We will do as much as possible with Powershell to speed things up ☺

## Create an Azure Storage Account

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