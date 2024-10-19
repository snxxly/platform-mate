@echo off
chcp 866 >nul 
title Recovery Launch

cls
echo I found this code in YouTube, its authors are guys from XiaomiSir,
echo so I decided to integrate it with their mention :)
pause
goto check_fastboot

::Fastboot service check
:check_fastboot
IF EXIST fastboot.exe (
goto check_recovery
) ELSE (
cls
echo Fastboot service is missing. Unzip the folder from the downloaded archive completely and try again.
pause
goto check_fastboot
)

::Recovery Launch
:start
cls
echo The device must be connected in Fastboot mode.
echo Waiting for the device and starting Recovery...
echo.
fastboot boot recovery.img
echo.
echo.
echo The device should automatically start in Recovery. If it does not, try another Recovery or check the installation details for your model.
pause

::recovery.img check
:check_recovery
IF EXIST recovery.img (
goto launch
) ELSE (
cls
echo The file "recovery.img" is missing. Download it, rename it appropriately, place it in the current folder and try again.
pause
goto exit
)

:exit
exit

::Actions in case of wrong choice
:wrong
cls
echo Wrong choice.
pause
goto launch

::Confirm
:launch
cls
echo The file "recovery.img" was detected. Do you want to run it on the device?
echo.
echo 1. Yeah, run it
echo 0. No, go back to MATE
echo __________________
set /p var=Confirm running: 

if "%var%"=="1" goto start
if "%var%"=="0" goto exit
goto wrong


