@echo off
chcp 866 >nul
title Platofrm Mate

::Greet and variants
:m
cls
echo Hello! Platofrm Mate is a program that allows you to easily work with Platofrm Tools!
goto var

::Display variants
:var
echo What you wanna do?
echo [t.me/snxly]
echo 1. Start Shizuku
echo 2. Reboot
echo 3. Fastboot flashing
echo 4. Start Recovery
echo 0. Exit
goto f

::If the choice is wrong
:t
cls
echo Wrong choice.
pause
cls
goto var

::Choose
:f
set /p var="Your choice: "
if "%var%"=="1" call Shizuku-Start.bat
if "%var%"=="2" call System-Reboot.bat
if "%var%"=="3" call Fastboot-Firmware.bat
if "%var%"=="4" call Recovery-Launch.bat
if "%var%"=="0" exit
goto t