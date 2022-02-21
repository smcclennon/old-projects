@shift /0
::Logging
::if %logging% == enabled (
::copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
::echo.[DATE: %date% - TIME: %time%] **TEXT**>"%programname%\%programname%.log"
::type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
::del "%programname%\%programname% Log.tmp"
::cls
::)
:reload
cls
@echo off
title Loading...
set version=4.4
set programname=Windows Optimiser
set adminerror=[Error: This utility requires administrative permissions]
set scan=[Scanning...]
set load=[Loading...]
set complete=[Task Completed!]
set defaulttitle=%programname% %version%
set loggingtitle=%defaulttitle% (Logging)
set website=https://scriptuniverse.wordpress.com/windows-optimiser

set cblack=f0
set cblue=f9
set cred=fc
set ccyan=f3
set cgreen=f2
set cpink=fd
set menucolor=%cblack%

if not exist "%programname%\" mkdir "%programname%"
set savedir=%programname%\bin\
if not exist "%savedir%\" mkdir "%savedir%"
if not exist "%savedir%logging.dat" @echo disabled> "%savedir%logging.dat"
if not exist "%programname%\README.txt" @echo Deleting files (and/or) changing values inside them may cause %programname% to stop working correctly. If this happens, delete the %programname% folder and fresh files will be generated. It is not recommended to delete the %programname% folder or any files within while %programname% is running. > "%programname%\README.txt"
if not exist "%savedir%README.txt" @echo Deleting files (and/or) changing values inside them may cause %programname% to stop working correctly. If this happens, delete the %programname% folder and fresh files will be generated. It is not recommended to delete the %programname% folder or any files within while %programname% is running. > "%savedir%README.txt"
find "enabled" "%savedir%logging.dat" >nul && set "logging=enabled" || set "logging=disabled"
if not exist "%programname%\Our Website.txt" @echo Official Website: %website% > "%programname%\Our Website.txt"
:startup
@echo off
color %menucolor%
title %defaulttitle% %load%
if %logging% == enabled title %loggingtitle% %load%
cls
echo                                                                       *****             
echo                                                                   ***---*               
echo                               *--**                            ***----*                 
echo                             *------***                       **-----**                  
echo                             *----------**                   *-------                    
echo                              *----------*                   *------*                    
echo                               *---------**                  *-------*                ** 
echo                                 *--------**                 *--------*             **-- 
echo                                  ******----**               **--------**         **---* 
echo                                        **----**              *----------***    **----*  
echo                                          **----**           *----------------------*    
echo                                            *-----**       **----------------------*     
echo                                              *---**    **-----------------------**      
echo                                                **    **-----------** **********         
echo                                                   **------------**                      
echo                                                 **-------------*                        
echo                                               **-------------*                          
echo                                             *--------------**   ***                     
echo                                          **---------------*   **---**                   
echo                                        **---------------*    *--------**                
echo                                      **---------------**   **------------*              
echo                                    *-----------------*     *---------------*            
echo                                  *-----------------*        *----------------*          
echo                                *-----------------**          **----------------*        
echo                               *----------------**              *-----------------*      
echo                              *----------------*                  *----------------*     
echo                              *--------------*                     **--------------*     
echo                              *------------*                         **-----------*      
echo                                *--------*                             **-------*        
::timeout 1 /NOBREAK>nul
::Loading Tasks

if not exist "%savedir%colour.dat" @echo blue> "%savedir%colour.dat"
find /c "blue" "%savedir%colour.dat">nul
if %errorlevel% equ 1 (
    goto colourcheckwhite
) else (
set programcolor=%cblue% & goto colourchecknext
)
:colourcheckwhite
find /c "white" "%savedir%colour.dat">nul
if %errorlevel% equ 1 (
    goto colourcheckred
) else (
set programcolor=%cblack% & goto colourchecknext
)
:colourcheckred
find /c "red" "%savedir%colour.dat">nul
if %errorlevel% equ 1 (
    goto colourcheckcyan
) else (
set programcolor=%cred% & goto colourchecknext
)
:colourcheckcyan
find /c "cyan" "%savedir%colour.dat">nul
if %errorlevel% equ 1 (
    goto colourcheckgreen
) else (
set programcolor=%ccyan% & goto colourchecknext
)
:colourcheckgreen
find /c "green" "%savedir%colour.dat">nul
if %errorlevel% equ 1 (
    goto colourcheckpink
) else (
set programcolor=%cgreen% & goto colourchecknext
)
:colourcheckpink
find /c "pink" "%savedir%colour.dat">nul
if %errorlevel% equ 1 (
    goto criticalerror
) else (
set programcolor=%cpink% & goto colourchecknext
)
:colourchecknext
if not exist "%programname%\%programname%.log" (
	set logpurge=purged
) else (
	set logpurge=exist
)

IF %logging% == enabled (
    copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
    echo.[DATE: %date% - TIME: %time%] %programname% ====Started on v%version%====>"%programname%\%programname%.log"
    type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
    del "%programname%\%programname% Log.tmp"
)

:main
@echo off
color %menucolor%
::tmp
title %defaulttitle%
if %logging% == enabled title %loggingtitle%
if exist "%savedir%apply_colour_changes.tmp" del "%savedir%apply_colour_changes.tmp" & goto colors
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Main Menu - Page 1 >"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
cls
echo                  *******************************************************************************
echo                  *                                   MENU 1                                    *
echo                  *                         Press a number to continue                          *
echo                  *******************************************************************************
echo                  *          1. Basic Internet Fixer                                            *
echo                  *          2. Fix slow/crashing Folders                                       *
echo                  *          3. Fix Disk Errors                                                 *
echo                  *          4. Check integrity of system files                                 *
echo                  *          5. Disk Defragmenter                                               *
echo                  *          6. External Tools                                                  *
echo                  *          7. Info                                                            *
echo                  *          8. ===Our Website: Download Latest Version / Send Bug Report===    *
echo                  *          9. Next Page                                                       *
echo                  *******************************************************************************
CHOICE>nul /C:123456789
IF ERRORLEVEL 9 GOTO main2
IF ERRORLEVEL 8 start %website% & goto main
IF ERRORLEVEL 7 GOTO info
IF ERRORLEVEL 6 GOTO expro
IF ERRORLEVEL 5 GOTO defrag
IF ERRORLEVEL 4 GOTO scan_disk
IF ERRORLEVEL 3 GOTO verify_disk
IF ERRORLEVEL 2 GOTO fix_explorer
IF ERRORLEVEL 1 GOTO fix_internet
:main2
@echo off
find "enabled" "%savedir%logging.dat" >nul && set "logging=enabled" || set "logging=disabled"
color %menucolor%
title %defaulttitle%
if %logging% == enabled title %loggingtitle%
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Main Menu - Page 2 >"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
if not exist "%programname%\%programname%.log" (
	set logpurge=purged
) else (
	set logpurge=exist
)
cls
echo                  *******************************************************************************
echo                  *                                   MENU 2                                    *
echo                  *                         Press a number to continue                          *
echo                  *******************************************************************************
IF %logging% == enabled (
    echo                  *          1. Toggle Logging [ON]                                             *
) else (
    echo                  *          1. Toggle Logging [OFF]                                            *
)
if %logpurge% == purged (
    echo                  *          2. Purge Logs [PURGED]                                             *
) else (
    echo                  *          2. Purge Logs                                                      *
)
echo                  *          3. Customise colors                                                *
echo                  *          4. Open CD Tray                                                    *
echo                  *          5.                                                                 *
echo                  *          6.                                                                 *
echo                  *          7. Reload                                                          *
echo                  *          8. Previous Page                                                   *
echo                  *          9. Next Page                                                       *
echo                  *******************************************************************************
CHOICE>nul /C:123456789
IF ERRORLEVEL 9 GOTO main2
IF ERRORLEVEL 8 GOTO main
IF ERRORLEVEL 7 GOTO reload
IF ERRORLEVEL 6 GOTO main2
IF ERRORLEVEL 5 GOTO main2
IF ERRORLEVEL 4 GOTO opencddrive
IF ERRORLEVEL 3 GOTO colors
IF ERRORLEVEL 2 del "%programname%\%programname%.log" & @echo disabled> "%savedir%logging.dat" & goto main2
IF ERRORLEVEL 1 GOTO toggle_log
:toggle_log
color %programcolor%
cls
IF %logging% == enabled (
    goto disablelogs
) else (
    goto enablelogs
)
:enablelogs
@echo enabled> "%savedir%logging.dat"
if exist "%programname%\%programname%.log" goto enablelogs_alreadyfound
@echo [DATE: %date% - TIME: %time%] ====Log file created====> "%programname%\%programname%.log"
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] ====Logging Enabled====>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
goto main2
:enablelogs_alreadyfound
@echo enabled> "%savedir%logging.dat"
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] ====Logging Enabled====>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
goto main2
:disablelogs
@echo disabled> "%savedir%logging.dat"
set logging=disabled
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] ====Logging Disabled==== >"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
goto main2


:info
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Info>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
cls
color %programcolor%
echo                  *******************************************************************************
echo                  *                                    Info                                     *
echo                  *                  Press any key to return to the Main Menu                   *
echo                  *******************************************************************************
echo                  *                              Coded By Shiraz                                *
echo                  *                         First released on 29/04/18                          *
echo                  *                                                                             *
echo                  *         This program was designed to make optimising your PC easier         *
echo                  *  It may be flagged as a virus by your computer because of how it was coded  *
echo                  *                          This is 100%% not a virus                           *
echo                  *******************************************************************************
pause>nul
goto main


:colors
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Customise colors>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
cls
color %programcolor%%
echo                  *******************************************************************************
echo                  *                             Customise Colours                               *
echo                  *                         Press a number to continue                          *
echo                  *******************************************************************************
echo                  *         This will change the colour of everything except Main Menu's        *
echo                  *******************************************************************************
echo                  *          1. White                                                           *
echo                  *          2. Blue                                                            *
echo                  *          3. Red                                                             *
echo                  *          4. Green                                                           *
echo                  *          5. Cyan                                                            *
echo                  *          6. Pink                                                            *
echo                  *                                                                             *
echo                  *          7. Back                                                            *
echo                  *******************************************************************************
if %programcolor% == %cblue% echo                  *                        Currently Selected: Blue                             *
if %programcolor% == %cblack% echo                  *                        Currently Selected: White                            *
if %programcolor% == %cred% echo                  *                        Currently Selected: Red                              *
if %programcolor% == %cgreen% echo                  *                        Currently Selected: Green                            *
if %programcolor% == %ccyan% echo                  *                        Currently Selected: Cyan                             *
if %programcolor% == %cpink% echo                  *                        Currently Selected: Pink                             *
echo                  *******************************************************************************
CHOICE>nul /C:1234567
IF ERRORLEVEL 7 GOTO main2
IF ERRORLEVEL 6 @echo pink> "%savedir%colour.dat" & goto colorsreload
IF ERRORLEVEL 5 @echo cyan> "%savedir%colour.dat" & goto colorsreload
IF ERRORLEVEL 4 @echo green> "%savedir%colour.dat" & goto colorsreload
IF ERRORLEVEL 3 @echo red> "%savedir%colour.dat" & goto colorsreload
IF ERRORLEVEL 2 @echo blue> "%savedir%colour.dat" & goto colorsreload
IF ERRORLEVEL 1 @echo white> "%savedir%colour.dat" & goto colorsreload
:colorsreload
cls
@echo null> "%savedir%apply_colour_changes.tmp"
goto reload


:opencddrive
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Open CD Tray>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
cls
echo                  *******************************************************************************
echo                  *                            Opening All CD Trays                             *
echo                  *                                Press wait...                                *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Open CD Tray: Generating "cdtmp.vbs"...>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo Set oWMP = CreateObject("WMPlayer.OCX.7")  >> "%savedir%cdtmp.vbs"
echo Set colCDROMs = oWMP.cdromCollection       >> "%savedir%cdtmp.vbs"
echo For i = 0 to colCDROMs.Count-1             >> "%savedir%cdtmp.vbs"
echo colCDROMs.Item(i).Eject                    >> "%savedir%cdtmp.vbs"
echo next                                       >> "%savedir%cdtmp.vbs"
echo oWMP.close                                 >> "%savedir%cdtmp.vbs"
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Open CD Tray: Generated "cdtmp.vbs">"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
"%savedir%cdtmp.vbs"
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Open CD Tray: Opened "cdtmp.vbs" (CD Tray Opened)>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
del "%savedir%cdtmp.vbs"
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Open CD Tray: Deleted "cdtmp.vbs">"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
goto main2


:fix_internet
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Basic Internet Fixer>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
cls
color %programcolor%
echo.
net session >nul 2>&1
if %errorLevel% == 0 (
    goto fix_internet1
) else (

echo                  *******************************************************************************
echo                  *                            Basic Internet Fixer                             *
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
echo                  *               This utility requires administrative permissions              *
echo                  *******************************************************************************
)
pause>nul
goto main
:fix_internet1
echo                  *******************************************************************************
echo                  *                            Basic Internet Fixer                             *
echo                  *                                   OUTPUT                                    *
echo                  *******************************************************************************
echo                  *                               Flushing DNS...                               *
ipconfig /flushdns>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Basic Internet Fixer: Flushed DNS>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
echo                  *                                    Done!                                    *
echo                  *                                                                             *
echo                  *                         Renewing Network Adapters...                        *
ipconfig /renew>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Basic Internet Fixer: Renewed Network Adapters>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
echo                  *                                    Done!                                    *
echo                  *******************************************************************************
echo                  *          1. Return to the Main Menu                                         *
echo                  *          2. Advanced Network Reset                                          *
echo                  *******************************************************************************
CHOICE>nul /C:12
IF ERRORLEVEL 2 GOTO fix_internet2
IF ERRORLEVEL 1 GOTO main

:fix_internet2
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Advanced Network Reset>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
color %programcolor%
cls
echo                  *******************************************************************************
echo                  *                            Advanced Network Reset                           *
echo                  *                                   OUTPUT                                    *
echo                  *******************************************************************************
echo                  *                               Resetting IP...                               *
netsh int ip reset reset.txt>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Advanced Network Reset: Reset IP>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo                  *                                    Done!                                    *
echo                  *                                                                             *
echo                  *                            Resetting Winsock...                             *
netsh winsock reset>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Advanced Network Reset: Reset Winsock>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo                  *                                    Done!                                    *
echo                  *                                                                             *
echo                  *                           Resetting Advfirewall...
netsh advfirewall reset>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Advanced Network Reset: Reset Advfirewall>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo                  *                                    Done!                                    *
echo                  *******************************************************************************
echo                  *              Restart required to apply changes. Restart now?                *
echo                  *          1. Restart now                                                     *
echo                  *          2. Restart in 5 minutes                                            *
echo                  *******************************************************************************
CHOICE>nul /C:12
IF ERRORLEVEL 2 GOTO restart_5min
IF ERRORLEVEL 1 GOTO restart_now

:restart_now
color %programcolor%
cls
echo                  *******************************************************************************
echo                  *                            Advanced Network Reset                           *
echo                  *                                 Restarting...                               *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Advanced Network Reset: Initiated Restart>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
shutdown -r -t 0
pause
goto :main
:restart_5min
color %programcolor%
cls
shutdown -r -t 300 /c: "=== %programname%: A restart will occur in 5 minutes ==="
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Advanced Network Reset: Started 5 minute restart sequence>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
:restart_5min_n
cls
echo                  *******************************************************************************
echo                  *                            Advanced Network Reset                           *
echo                  *                      A restart will occur in 5 minutes                      *
echo                  *******************************************************************************
echo                  *                      To cancel the restart, type "cr"                       *
echo                  *******************************************************************************
set /P c=Command Line:>nul
if /I "%c%" EQU "cr" goto :ecshutdown
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Advanced Network Reset: Restart Abort Terminal: Invalid Command>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
goto :restart_5min_n
:ecshutdown
shutdown /a
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Advanced Network Reset: Abort Terminal: Restart Aborted>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
cls
echo                  *******************************************************************************
echo                  *                            Advanced Network Reset                           *
echo                  *                              Restart Cancelled                              *
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
echo                  *         Please note that you will need to restart to apply changes!         *
echo                  *******************************************************************************
pause>nul
goto :main


:fix_explorer
color %programcolor%
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Slow/Crashing Folder Fixer>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
cls
echo                  *******************************************************************************
echo                  *                         Slow/Crashing Folder Fixer                          *
echo                  *                         Press a number to continue                          *
echo                  *******************************************************************************
echo                  *     This will close all currently open folders. Unsaved data may be lost    *
echo                  *          1. Continue                                                        *
echo                  *          2. Cancel                                                          *
echo                  *******************************************************************************
CHOICE>nul /C:12
IF ERRORLEVEL 2 GOTO :main
IF ERRORLEVEL 1 GOTO fix_explorer1
:fix_explorer1
cls
echo                  *******************************************************************************
echo                  *                         Slow/Crashing Folder Fixer                          *
echo                  *                                   OUTPUT                                    *
echo                  *******************************************************************************
echo                  *                        Restarting "explorer.exe"...                         *
echo                  *                             [Killing task...]                               *
taskkill /f /im explorer.exe>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Slow/Crashing Folder Fixer: Killed Task "explorer.exe">"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo                  *                             [Starting task...]                              *
start explorer.exe>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Slow/Crashing Folder Fixer: Started Task "explorer.exe">"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo                  *                                    Done!                                    *
echo                  *                                                                             *
echo                  *******************************************************************************
echo                  *                  Press any key to return to the Main Menu                   *
echo                  *******************************************************************************
pause>nul
goto :main


:verify_disk
color %programcolor%
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Fix Disk Errors>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
cls
)
cls
net session >nul 2>&1
if %errorLevel% == 0 (
    goto verify_disk1
) else (
echo                  *******************************************************************************
echo                  *                               Fix Disk Errors                               *
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
echo                  *               This utility requires administrative permissions              *
echo                  ******************************************************************************* 
)
pause>nul
goto main
:verify_disk1
echo                  *******************************************************************************
echo                  *                               Fix Disk Errors                               *
echo                  *                           Select a drive to scan                            *
echo                  *******************************************************************************
echo                  *                 Your PC will reboot to perform a Disk Check                 *
echo                  *          1. C Drive                                                         *
echo                  *          2. D Drive                                                         *
echo                  *          3. All Drives                                                      *
echo                  *          4. Cancel                                                          *
echo                  *******************************************************************************
CHOICE>nul /C:1234
IF ERRORLEVEL 4 GOTO main
IF ERRORLEVEL 3 GOTO verify_disk1all
IF ERRORLEVEL 2 GOTO verify_disk1D
IF ERRORLEVEL 1 GOTO verify_disk1C
echo.
:verify_disk1C
cls
echo                  *******************************************************************************
echo                  *                               Fix Disk Errors                               *
echo                  *                                    OUTPUT                                   *
echo                  *******************************************************************************
echo                  *                            Assigning Drive C...                             *
echo y | chkdsk.exe C: /f /x>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Fix Disk Errors: Assigned Drive C>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo                  *                              Drive Assigned!                                *
echo                  *******************************************************************************
echo                  *                           Preparing to restart...                           *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Fix Disk Errors: Started 10 second shutdown sequence>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
shutdown.exe /r /t 10 /c: "%programname%: Your PC will reboot in 10 seconds and will perform a Disk Check on Drive C"
pause>nul
goto main
:verify_disk1D
cls
echo                  *******************************************************************************
echo                  *                               Fix Disk Errors                               *
echo                  *                                    OUTPUT                                   *
echo                  *******************************************************************************
echo                  *                            Assigning Drive D...                             *
echo y | chkdsk.exe D: /f /x>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Fix Disk Errors: Assigned Drive D>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo                  *                              Drive Assigned!                                *
echo                  *******************************************************************************
echo                  *                           Preparing to restart...                           *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Fix Disk Errors: Started 10 second shutdown sequence>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
shutdown.exe /r /t 10 /c: "%programname%: Your PC will reboot in 10 seconds and will perform a Disk Check on Drive D"
pause>nul
goto main
:verify_disk1all
cls
echo                  *******************************************************************************
echo                  *                               Fix Disk Errors                               *
echo                  *                                    OUTPUT                                   *
echo                  *******************************************************************************
echo                  *                           Assigning All Drives...                           *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Assigning Drives A-Z...>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo Error Log:
echo y | chkdsk.exe A: /f /x>nul
echo y | chkdsk.exe B: /f /x>nul
echo y | chkdsk.exe C: /f /x>nul
echo y | chkdsk.exe D: /f /x>nul
echo y | chkdsk.exe E: /f /x>nul
echo y | chkdsk.exe F: /f /x>nul
echo y | chkdsk.exe G: /f /x>nul
echo y | chkdsk.exe H: /f /x>nul
echo y | chkdsk.exe I: /f /x>nul
echo y | chkdsk.exe J: /f /x>nul
echo y | chkdsk.exe K: /f /x>nul
echo y | chkdsk.exe L: /f /x>nul
echo y | chkdsk.exe M: /f /x>nul
echo y | chkdsk.exe N: /f /x>nul
echo y | chkdsk.exe O: /f /x>nul
echo y | chkdsk.exe P: /f /x>nul
echo y | chkdsk.exe Q: /f /x>nul
echo y | chkdsk.exe R: /f /x>nul
echo y | chkdsk.exe S: /f /x>nul
echo y | chkdsk.exe T: /f /x>nul
echo y | chkdsk.exe U: /f /x>nul
echo y | chkdsk.exe V: /f /x>nul
echo y | chkdsk.exe W: /f /x>nul
echo y | chkdsk.exe X: /f /x>nul
echo y | chkdsk.exe Y: /f /x>nul
echo y | chkdsk.exe Z: /f /x>nul
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Fix Disk Errors: Assigned All Drives>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
cls
echo                  *******************************************************************************
echo                  *                               Fix Disk Errors                               *
echo                  *                           Discarded Invalid Drives                          *
echo                  *******************************************************************************
echo                  *                            All Drives Assigned!                             *
echo                  *******************************************************************************
echo                  *                           Preparing to restart...                           *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Fix Disk Errors: Started 10 second shutdown sequence>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
shutdown.exe /r /t 10 /c: "%programname%: Your PC will reboot in 10 seconds and will perform a Disk Check on All Drives"
pause>nul
goto main


:scan_disk
color %programcolor%
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Check Integrity Of System Files>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
cls
net session >nul 2>&1
if %errorLevel% == 0 (
    goto scan_disk1
) else (
echo                  *******************************************************************************
echo                  *                       Check Integrity Of System Files                       *
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
echo                  *               This utility requires administrative permissions              *
echo                  ******************************************************************************* 
)
pause>nul
goto main
:scan_disk1
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Check Integrity Of System Files: Scanning...>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
cls
title %defaulttitle% %scan%
echo                  *******************************************************************************
echo                  *                      Check Integrity Of System Files                        *
echo                  *                                Scanning...                                  *
echo                  *******************************************************************************
echo                  *   Scans the integrity of all protected system files and replaces incorrect  *
echo                  *                  versions with correct Microsoft versions                   *
echo                  *           It may take some time for the visual interface to load            *
echo                  *******************************************************************************
echo                  *                                  OUTPUT                                     *
echo                  *******************************************************************************
echo.
sfc /SCANNOW
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Check Integrity Of System Files: Scan Complete>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo.
title %defaulttitle% %complete%
echo                  *******************************************************************************
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
pause>nul
goto main


:defrag
color %programcolor%
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: Disk Defragmenter>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
cls
net session >nul 2>&1
if %errorLevel% == 0 (
    goto defrag1
) else (

echo                  *******************************************************************************
echo                  *                              Disk Defragmenter                              *
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
echo                  *               This utility requires administrative permissions              *
echo                  ******************************************************************************* 
)
pause>nul
goto main
:defrag1
cls
echo                  *******************************************************************************
echo                  *                             Disk Defragmenter                               *
echo                  *                         Select a drive to defrag                            *
echo                  *******************************************************************************
echo                  *          1. C Drive                                                         *
echo                  *          2. D Drive                                                         *
echo                  *          3. All Drives                                                      *
echo                  *          4. Cancel                                                          *
echo                  *******************************************************************************
CHOICE>nul /C:1234
IF ERRORLEVEL 4 GOTO main
IF ERRORLEVEL 3 GOTO defrag1all
IF ERRORLEVEL 2 GOTO defrag1D
IF ERRORLEVEL 1 GOTO defrag1C
:defrag1C
cls
title %defaulttitle% %scan%
echo                  *******************************************************************************
echo                  *                             Disk Defragmenter                               *
echo                  *                             Scanning Drive C                                *
echo                  *******************************************************************************
echo                  *                          This may take some time                            *
echo                  *     If you wish to cancel, press [CTRL+C] at any time to safely cancel      *
echo                  *               Terminating this task may result in data loss!                *
echo                  *******************************************************************************
echo                  *                                  OUTPUT                                     *
echo                  *******************************************************************************
echo.
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Disk Defragmenter: Scanning Drive C...>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
defrag C: /U /V
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Disk Defragmenter: Scan Complete>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo.
title %defaulttitle% %complete%
echo                  *******************************************************************************
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
pause>nul
goto main
:defrag1D
cls
title %defaulttitle% %scan%
echo                  *******************************************************************************
echo                  *                             Disk Defragmenter                               *
echo                  *                             Scanning Drive D                                *
echo                  *******************************************************************************
echo                  *                          This may take some time                            *
echo                  *     If you wish to cancel, press [CTRL+C] at any time to safely cancel      *
echo                  *               Terminating this task may result in data loss!                *
echo                  *******************************************************************************
echo                  *                                  OUTPUT                                     *
echo                  *******************************************************************************
echo.
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Disk Defragmenter: Scanning Drive D...>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
defrag D: /U /V
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Disk Defragmenter: Scan Complete>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo.
title %defaulttitle% %complete%
echo                  *******************************************************************************
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
pause>nul
goto main
:defrag1all
cls
title %defaulttitle% %scan%
echo                  *******************************************************************************
echo                  *                             Disk Defragmenter                               *
echo                  *                            Scanning All Drives                              *
echo                  *******************************************************************************
echo                  *                          This may take some time                            *
echo                  *     If you wish to cancel, press [CTRL+C] at any time to safely cancel      *
echo                  *               Terminating this task may result in data loss!                *
echo                  *******************************************************************************
echo                  *                                  OUTPUT                                     *
echo                  *******************************************************************************
echo.
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Disk Defragmenter: Scanning All Drives...>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
defrag /C /U /V
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Disk Defragmenter: Scan Complete>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
echo.
title %defaulttitle% %complete%
echo                  *******************************************************************************
echo                  *                   Press any key to return to the Main Menu                  *
echo                  *******************************************************************************
pause>nul
goto main


:expro
color %programcolor%
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] Accessed: External Programs>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
cls
echo                  *******************************************************************************
echo                  *                            External Programs                                *
echo                  *                            Select a program                                 *
echo                  *******************************************************************************
echo                  *          1. System Configuration                                            *
echo                  *          2. Disk Cleanup                                                    *
echo                  *          3. Display Settings                                                *
echo                  *          4. Graphics Diagnostics                                            *
echo                  *          5. Return to the Main Menu                                         *
echo                  *******************************************************************************
CHOICE>nul /C:12345
IF ERRORLEVEL 5 GOTO main
IF ERRORLEVEL 4 GOTO expro4
IF ERRORLEVEL 3 GOTO expro3
IF ERRORLEVEL 2 GOTO expro2
IF ERRORLEVEL 1 GOTO expro1
:expro1
cls
echo                  *******************************************************************************
echo                  *                            External Programs                                *
echo                  *                           System Configuration                              *
echo                  *******************************************************************************
echo                  * Boot options, including what services start when you turn on your computer  *
echo                  * which can be extremely useful if you're plagued with slow startup times or  *
echo                  *              general lag while you're using your computer                   *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] External Programs: Opened System Configuration>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
msconfig
goto expro
:expro2
cls
echo                  *******************************************************************************
echo                  *                            External Programs                                *
echo                  *                              Disc Cleanup                                   *
echo                  *******************************************************************************
echo                  *       Free up space on your hard drive and may also boost performance       *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] External Programs: Opened Disc Cleanup>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
cleanmgr.exe
goto expro
:expro3
cls
echo                  *******************************************************************************
echo                  *                            External Programs                                *
echo                  *                            Display Settings                                 *
echo                  *******************************************************************************
echo                  * System setting that allows you to change your display, display orientation, *
echo                  *                          and display resolution                             *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] External Programs: Opened Display Settings>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
desk.cpl
goto expro
:expro4
cls
echo                  *******************************************************************************
echo                  *                            External Programs                                *
echo                  *                          Graphics Diagnostics                               *
echo                  *******************************************************************************
echo                  *         Helpful diagnostics that can help you fix graphical issues          *
echo                  *******************************************************************************
if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] External Programs: Opened Graphics Diagnostics>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
)
dxdiag
goto expro









:criticalerror
title %defaulttitle% [CRITICAL ERROR!]
if %logging% == enabled title %loggingtitle% [CRITICAL ERROR!]
::if %logging% == enabled (
copy "%programname%\%programname%.log" "%programname%\%programname% Log.tmp">nul
echo.[DATE: %date% - TIME: %time%] ===CRITICAL ERROR! NO ERROR INFO AVAILABLE===>"%programname%\%programname%.log"
type "%programname%\%programname% Log.tmp" >>"%programname%\%programname%.log"
del "%programname%\%programname% Log.tmp"
::)
cls
color ce
echo                  *******************************************************************************
echo                  *                              CRITICAL ERROR!                                *
echo                  *******************************************************************************
echo                  *          1. Generate Fresh Config                                           *
echo                  *          2. Restart                                                         *
echo                  *          3. Exit                                                            *
echo                  *******************************************************************************
CHOICE>nul /C:123
IF ERRORLEVEL 3 exit
IF ERRORLEVEL 2 GOTO reload
IF ERRORLEVEL 1 rd /S /Q "%programname%" & goto reload
