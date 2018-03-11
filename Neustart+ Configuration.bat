@echo off
setlocal EnableDelayedExpansion
title Neustart+ - Configuration - by zlyfer
mode con cols=170 lines=60
if not exist settings.ini (
echo removepassword=false>>settings.ini
echo temporary=true>>settings.ini
)
:main
cls
set task=0
echo Neustart+ - Configuration
echo.
echo [MENU]
echo 1) Settings
echo 2) Add process
echo 3) Remove process
echo 4) Show processlist and settings
echo 5) Exit
set /P task=Choose a task: 
if %task%==1 goto settings
if %task%==2 goto add
if %task%==3 goto remove
if %task%==4 call :processlist & call :showsettings & pause >nul
if %task%==5 goto exit
goto main
:settings
echo.
call :showsettings
echo You'll now be able to set the settings.
echo Only 'false', 'true' are possible answers. Not case sensitive.
echo Press enter without input to keep the current option.
echo.

set /P svremovepassword=Remove password for the next start: 
set /P svtemporary=Delete configurations after restart: 
echo removepassword=%svremovepassword%>>settings.ini
echo temporary=%svtemporary%>>settings.ini
echo.
echo Settings saved.
pause >nul
goto main
:add
call :processlist
set "cmd=findstr /R /N "^^" list.ini | find /C ":""
for /F %%a in ('!cmd!') do set processes=%%a
echo [ADD PROCESS]
set /P pname=Processname (lowercase, like in taskmanager): 
set /P ppath=Path to process (without 'process.exe', "...\"): 
echo Process#%processes% %pname% %ppath%>>list.ini
echo Process added.
pause >nul
goto main
:remove
call :processlist
echo [REMOVE PROCESS]
set /P premove=Type processnumber (e.g #1): 
type list.ini|find "%premove%">tmp4.dat
set "cmd=findstr /R /N "^^" tmp4.dat | find /C ":""
for /F %%a in ('!cmd!') do set lines=%%a
if %lines% EQU 0 (
echo Process not found.
goto skip
)
type list.ini|find /V "%premove%">tmp5.dat
type tmp5.dat>list.ini
echo Process%premove% Removed Removed>>list.ini
echo Process removed.
:skip
pause >nul
goto main
:processlist
echo.
echo [PROCESSLIST]
type list.ini|find /V "Process#0"
echo.
exit /B
:showsettings
echo [SETTINGS]
type settings.ini|find "removepassword">tmp6.dat
set /P svremovepassword=<tmp6.dat
set svremovepassword=%svremovepassword:~15%
echo Remove password for the next start: %svremovepassword%
type settings.ini|find "temporary">tmp6.dat
set /P svtemporary=<tmp6.dat
set svtemporary=%svtemporary:~10%
echo Delete configurations after restart: %svtemporary%
echo.
exit /B
:exit
exit