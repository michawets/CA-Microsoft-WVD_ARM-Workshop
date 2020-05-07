[Start](/MicrosoftWVDWorkshop/) / [11. Connect to WVD](/MicrosoftWVDWorkshop/11.%20Connect%20to%20WVD)
# 11. Connect to WVD

There are multiple possibilities to connect to Windows Virtual Desktop: 
* using the **Windows Virtual Desktop Client** 
* using a **web browser** and the HTML5 webclient
* using the **mobile app** on Android/IOS (not covered in the Workshop)

In this step, you will see how to connect to the WVD deployment you created & configured in the previous steps

## Using the WVD Client

### Install the client

1. Download the WVD client from the [Microsoft site](https://go.microsoft.com/fwlink/?linkid=2068602)

2. Install the WVD client on your PC

### Subscribe to the WVD Feed

1. Start the WVD client from the **Start Menu**, look for **Remote Desktop**

2. Select **Subscribe** on the main page to connect to the WVD service and retrieve the resources.<br/>
Sign in with one of the **DemoUser** accounts (created in Step 2) when prompted.

### Launching applications

After successfully authenticating, you should now see a list of resources available to that user:
* DemoUser001: Full Desktop
* DemoUser002: Excel & MSPaint

You can launch resources by one of these methods.

* In the **WVD client**, double click a resource to launch it
* Launch a resource from the **Start Menu**, as you would start an application which is installed locally
* You can search for the apps in the **search bar in your Taskbar**

## Using the WVD Webclient

The WVD webclient let you access your WVD resources from a web browser without installing the WVD Client

### Access remote resources feed

1. Open a supported browser
* Microsoft Edge (Windows)
* Internet Explorer (Windows)
* Apple Safari (macOS)
* Mozilla Firefox (Windows, macOS, Linux) (v55 or higher)
* Google Chrome (Windows, macOS, Linux, Chrome OS)

2. Navigate to the [Windows Virtual Desktop web client](https://rdweb.wvd.microsoft.com/webclient)

3. Sign in with one of the **DemoUser** accounts


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