::Touch Pad Toggle
::https://www.addictivetips.com/windows-tips/show-a-custom-toast-notification-on-windows-10/
::https://docs.microsoft.com/en-gb/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6
::Install-Module -Name BurntToast
::Import-Module -Name BurntToast
::Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
::powershell -Command "New-BurntToastNotification -Text 'Touch screen disabled', 'Body of notification'"
@echo off
cd %~dp0
devcon status "HID\MSHW0092&COL02" | find /i "Driver is running.">nul
if not %errorlevel%==1 (
	devcon disable "HID\MSHW0092&COL02"
) else (
	devcon enable "HID\MSHW0092&COL02"
)
