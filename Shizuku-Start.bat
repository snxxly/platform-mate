@echo off
chcp 866 >nul
title Shizuku Start

::Checking for adb
:check_adb
IF EXIST adb.exe (
goto adb_exist
) ELSE (
cls
echo ADB is missing, move this file to the Platform Tools folder.
pause
goto check_adb
)

::Start
:confirm
echo Starting Shizuku Service...
adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
pause
goto exit

::Exit
:exit
cls
call Platform-Mate

::Actions in case of wrong choice
:wrong
cls
echo Wrong choice.
pause
goto adb_exist

::Confirm
:adb_exist
cls
set /p var="ADB detected, do you wish to start the Shizuku service? (1 - Yes, 0 - No, go back to MATE): "
if "%var%"=="1" goto confirm
if "%var%"=="0" goto exit
goto wrong
