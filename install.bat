@echo off
taskkill /f /im adb.exe
echo =========================================================
echo " CarAPP Overlay "
echo =========================================================
echo.
echo This will set up your device to be able to easily install
echo overlay APKs through the file browser or directly.
echo Ensure you already have compiled your CarAPP Overlay apk !
echo.
SET /p _IP= enter the IP address of the device (e.g. 192.168.0.1): 
@echo connecting to device ....
:initialconnect
@echo If %_ip% cannot be connected please check IP address again
timeout 2
ping -n 1 %_ip% |find "TTL=" || goto :initialconnect
echo Answer received.
"%cd%\.compiler\adb" -s "%_inputname%" connect %_ip%:9876
"%cd%\.compiler\adb" -s "%_inputname%" root
"%cd%\.compiler\adb" -s "%_inputname%" remount
set _inputname=%_ip%:9876

:menu
cls
echo =========================================================
echo " CarAPP Overlay "
echo =========================================================
echo.
echo.  Connected IP Address: %_inputname%
echo.
echo.  Press "1" to install and enable
echo.  Press "2" to update and enable
echo.  Press "3" to enable CarAPP Overlay
echo.  Press "4" to disable CarAPP Overlay
echo.  Press "5" to reboot device
echo.
set installer=
set /P installer= Please select a number or press enter to end the script 
echo.
IF "%installer%"=="1" GOTO :installOverlay
IF "%installer%"=="2" GOTO :updateOverlay
IF "%installer%"=="3" GOTO :enableOverlayManual 
IF "%installer%"=="4" GOTO :disableOverlay
IF "%installer%"=="5" GOTO :rebooting
IF "%installer%" not defined GOTO :end

::functions

:pingloop
echo Waiting until %_ip% is reachable again...
timeout 3 >nul
ping -n 1 %_ip% |find "TTL=" || goto :pingloop
echo Answer received.
goto :eof

:connecting
echo Connecting to device...
"%cd%\.compiler\adb" -s "%_inputname%" disconnect
"%cd%\.compiler\adb" connect "%_inputname%"
timeout 1 >nul
echo Perfoming adb root
"%cd%\.compiler\adb" -s "%_inputname%" root
timeout 1 >nul
echo performing adb remount
"%cd%\.compiler\adb" -s "%_inputname%" remount
timeout 1 >nul
goto :eof

:disableverity
echo Performing disable-verity
"%cd%\.compiler\adb" -s "%_inputname%" disable-verity
timeout 1 >nul
echo rebooting device
start "" /min "%CD%\.compiler\adb.exe" reboot
timeout 1 >nul
goto :eof

:enableOverlay
echo Activating carapp.overlay ...
timeout 1 >nul
"%cd%\.compiler\adb" -s "%_inputname%" shell cmd overlay enable carapp.overlay
echo.
echo carapp.overlay enabled - you may need to reboot device to take effect
goto :eof

:filesOverlay
echo Pushing CarAPP overlay ...
"%cd%\.compiler\adb" -s "%_inputname%" push "%cd%\carappoverlay.apk" /storage/emulated/0
"%cd%\.compiler\adb" -s "%_inputname%" shell mv /storage/emulated/0/carappoverlay.apk /system/app
"%cd%\.compiler\adb" -s "%_inputname%" shell chmod 644 /system/app/carappoverlay.apk
timeout 3 >nul
goto :eof

:: scripts

:installOverlay
call :pingloop
call :connecting
call :disableverity
call :pingloop
call :connecting
call :filesOverlay
echo Rebooting device...
start "" /min "%CD%\.compiler\adb.exe" reboot
call :pingloop
call :connecting
call :enableOverlay
echo Rebooting device...
start "" /min "%CD%\.compiler\adb.exe" reboot
pause
goto :menu

:updateOverlay
call :pingloop
call :connecting
call :filesOverlay
call :enableOverlay
echo Rebooting device...
start "" /min "%CD%\.compiler\adb.exe" reboot
pause
goto :menu

:enableOverlayManual
call :connecting
call :enableOverlay
pause
goto :menu

:disableOverlay
call :connecting
echo Disabling overlay...
"%cd%\.compiler\adb" -s "%_inputname%" shell cmd overlay disable carapp.overlay
echo.
echo carapp.overlay disabled - you may need to reboot device to take effect
pause
Goto :menu

:rebooting
echo Rebooting device...
start "" /min "%CD%\.compiler\adb.exe" reboot
echo Rebooting your tablet, now wait till it boots up again
pause
goto :menu

:end
pause
exit
