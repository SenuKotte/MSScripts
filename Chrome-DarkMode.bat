@echo off

whoami /groups | find "S-1-16-12288" > nul

if %errorlevel% == 0 (
 echo Welcome, Admin
 chrome.exe --force-dark-mode --enable-features=WebUIDarkMode
) else (
 echo Get lost, User
)
