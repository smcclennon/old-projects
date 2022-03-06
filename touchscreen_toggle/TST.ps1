# Touch Screen Toggle - Toggle touch screens on Windows devices
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# default: Restricted
cd $PSScriptRoot
if(devcon status "HID\VEN_8086&DEV_9D3E&SUBSYS_00000000&REV_21&COL05*" | find /i "Driver is running.") {
	if(devcon disable "HID\VEN_8086&DEV_9D3E&SUBSYS_00000000&REV_21&COL05*" | find /i "Disable failed") {
        New-BurntToastNotification -Text "Touch Screen Toggle Failed", "Failed to disable your touch screen (Am I running with administrator permissions? Is your hardware ID correct?)" -AppLogo image.png
    } else {
        New-BurntToastNotification -Text "Touch Screen Toggled", "Your touch screen is now disabled." -AppLogo image.png
    }
} else {
	if(devcon enable "HID\VEN_8086&DEV_9D3E&SUBSYS_00000000&REV_21&COL05*" | find /i "Enable failed") {
        New-BurntToastNotification -Text "Touch Screen Toggle Failed", "Failed to enable your touch screen (Am I running with administrator permissions? Is your hardware ID correct?)" -AppLogo image.png
    } else {
        New-BurntToastNotification -Text 'Touch Screen Toggled', "Your touch screen has been enabled." -AppLogo image.png
    }
}