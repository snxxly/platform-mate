@echo off
chcp 866 >nul
title Reboot

::Checking for Fastboot
:check_fastboot
cls
IF EXIST fastboot.exe (
goto fastboot_exist
) ELSE (
cls
echo Fastboot is missing, move this file to the Platform Tools folder.
pause
goto check_fastboot
)

::Checking for a device
:fastboot_exist
echo Fastboot is detected.
fastboot devices
echo If you see fastboot (a set of letters and numbers) above, the device is connected.
pause
goto choose

::Rebooting into the system
:reboot_system
echo Rebooting into the system...
fastboot reboot system
pause
exit

::Rebooting into the Fastboot
:reboot_fastboot
echo Rebooting into the Fastboot...
fastboot reboot fastboot
pause
exit

::Rebooting into the Recovery
:reboot_recovery
echo Rebooting into the Recovery...
fastboot reboot recovery
pause
exit

::Actions in case of wrong choice
:wrong
cls
echo Wrong choice.
pause
goto choose

::Selecting a reboot
:choose
cls
set /p var="What to reboot the device into? (1 - System, 2 - Fastboot, 3 - Recovery, 0 - Go back to MATE): "
if "%var%"=="1" goto reboot_system
if "%var%"=="2" goto reboot_fastboot
if "%var%"=="3" goto reboot_recovery
if "%var%"=="0" call Platform-Mate.bat
goto wrong
