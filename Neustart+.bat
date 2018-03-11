@echo off
setlocal EnableDelayedExpansion
title Neustart+ - by zlyfer
preparing.vbs
cd "E:\Batchscripts\Neustart+"
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
type settings.ini|find "removepassword">tmp7.dat
set /P settings2=<tmp7.dat
set settings2=%settings2:~15%
if %settings2%==true echo.|net user %username% *>nul
qprocess *>tmp1.dat
set "cmd=findstr /R /N "^^" list.ini | find /C ":""
for /F %%a in ('!cmd!') do set collector=%%a
set /A collector=%collector%-1
set loop=0
:loop
del done.dat 2>nul
set /a loop=%loop%+1
type list.ini|find "Process#%loop%">tmp2.dat
set /P process=<tmp2.dat
start collector.exe %process%
:semiloop
if not exist done.dat goto semiloop
if not %loop%==%collector% goto loop
del done.dat 2>nul
echo.>instance.dat
done.vbs
exit