[Start](/CA-Microsoft-WVD_ARM-Workshop/) / [Troubleshooting](/CA-Microsoft-WVD_ARM-Workshop/Troubleshooting)
# Troubleshooting

## Deployment failed for a new VW with Windows AD?

You can use **Redeploy** to try again, but you will get an error for the **Artifacts Location**<br/>
This is the url that you need to supply to the deployment as an Artificat location:<br/>
```
https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/active-directory-new-domain/
```

## Deployment failed for the ARM template 

If you get an error during the deployment of the ARM Template, stating that the NICs cannot be created due to the fact that the VNET/Subnet cannot be found, make sure that you create the VMs in the **same location** as your **VNET and Domain Controller**.<br/>
The WVD ARM objects are currently (18/6/2020) only available in the US regions, but your own ARM objects (Virtual Machines, Domain Controller, VNET, etc) can be in the nearest region.

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