@echo off
setlocal EnableDelayedExpansion
if %2==Removed (
if %3==Removed (
goto skip
)
)
set insert=0
type tmp1.dat|find "%2">tmp3.dat
set "cmd=findstr /R /N "^^" tmp3.dat | find /C ":""
for /F %%a in ('!cmd!') do set insert=%%a
if %insert% LSS 1 goto skip
type settings.ini|find "removepassword">tmp7.dat
set /P settings2=<tmp7.dat
set settings2=%settings2:~15%
echo echo Starting %2..>>autostartlist.bat
echo cd /D %3>>autostartlist.bat
echo start %2.exe>>autostartlist.bat
:skip
echo.>done.dat
exit