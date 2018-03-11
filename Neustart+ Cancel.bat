@echo off
setlocal EnableDelayedExpansion
title Neustart+ - Cancel - by zlyfer
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
cancel.vbs
exit