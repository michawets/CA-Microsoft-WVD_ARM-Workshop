[Start](/CA-Microsoft-WVD_ARM-Workshop-update/) / [Verify your Virtual Network DNS settings](/CA-Microsoft-WVD_ARM-Workshop/Verify%20DNS%20Settings)

# Verify your Virtual Network (VNET) DNS settings

 - Open the Azure Portal

 - Go to **Virtual Networks**

 - Open your Virtual Network (if you deployed the Windows VM with AD, the VNET will be named *adVNET*)

 - Click on **DNS Servers**

 - Validate that a custom DNS server IP is filled in, and that the IP is your Domain Controller. <br/>
If you deployed the Windows VM with AD, the IP address should be *10.0.0.4*)

![Validate Virtual Network DNS settings](https://michawets.github.io/CA-Microsoft-WVD_ARM-Workshop/images/AzurePortal-VirtualNetwork-ValidateDNS.png)


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