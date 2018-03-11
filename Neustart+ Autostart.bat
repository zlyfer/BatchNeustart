@echo off
setlocal EnableDelayedExpansion
del instance.dat 2>nul
title Neustart+ - Autostart - by zlyfer
mode con cols=170 lines=60
set tpath=%cd%
type settings.ini|find "removepassword">tmp7.dat
set /P settings2=<tmp7.dat
set settings2=%settings2:~15%
type settings.ini|find "temporary">tmp7.dat
set /P settings3=<tmp7.dat
set settings3=%settings3:~10%
if not exist autostartlist.bat (
echo No processlist found.
)
call autostartlist.bat 2>nul
echo.
cd %tpath% 2>nul
if exist autostartlist.bat (
if %settings2%==true (
echo You can now enter a new password for %username%. You can skip this by hitting Enter twice.
echo Your password will stay removed in this case then.
net user %username% *
)
)
if %settings3%==true (
echo Configurations deleted.
echo.
del done.dat 2>nul
del instance.dat 2>nul
del autostartlist.bat 2>nul
del tmp1.dat 2>nul
del tmp2.dat 2>nul
del tmp3.dat 2>nul
del tmp4.dat 2>nul
del tmp5.dat 2>nul
del tmp6.dat 2>nul
del tmp7.dat 2>nul
)
echo Finished.
ping -n 6 localhost >nul
exit