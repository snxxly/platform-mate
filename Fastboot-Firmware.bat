@echo off
chcp 866 >nul
title Fastboot flashing

::Warning
:warning
cls
echo Pay attention!
echo This file is designed for flashing Fastboot firmware for Xiaomi, POCO, Redmi devices.
echo To install, you need to move this file and the Platform Tools files to the firmware folder.
pause
goto check_fastboot

:check_fastboot
IF EXIST fastboot.exe (
goto fastboot_exist
) ELSE (
echo It looks like the file is in a folder without Platform Tools/without fastboot,
echo Check the integrity of the files.
pause
goto check_fastboot
)

:fastboot_exist
echo Fastboot.exe is detected.
pause
goto flash

:flash
if EXIST flash_all.bat (
call flash_all.bat
) ELSE (
echo Flash_all.bat firmware file not found, check the folder.
)
pause
call Platform-Mate.bat
