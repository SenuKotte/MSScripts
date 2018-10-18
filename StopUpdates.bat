@echo off
echo Stopping Windows Update Services
echo.
net stop wuauserv
net stop bits
net stop cryptSvc
net stop msiserver
echo Windows Updates are now Disabled! 
