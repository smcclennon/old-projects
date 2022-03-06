::Touch Screen Toggle
:: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
:: default: Restricted
@echo off
cd %~dp0
devcon status "HID\VEN_8086&DEV_9D3E&SUBSYS_00000000&REV_21&COL05*" | find /i "Driver is running.">nul
if not %errorlevel%==1 (
	devcon disable "HID\VEN_8086&DEV_9D3E&SUBSYS_00000000&REV_21&COL05*"
        powershell New-BurntToastNotification -Text 'Touch Screen Toggled', 'Your touch screen is now disabled.' -AppLogo image.png
) else (
	devcon enable "HID\VEN_8086&DEV_9D3E&SUBSYS_00000000&REV_21&COL05*"
        powershell New-BurntToastNotification -Text 'Touch Screen Toggled', 'Your touch screen has been enabled.' -AppLogo image.png
)