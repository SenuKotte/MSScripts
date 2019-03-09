:: Source : https://superuser.com/questions/667607/check-if-current-command-prompt-was-launched-as-the-administrator

@echo off

whoami /groups | find "S-1-16-12288" > nul

if %errorlevel% == 0 (
 echo Welcome, Admin
  if(Test-Path -Path "$env:ProgramData\Chocolatey") {
    echo Installing ruby
    choco install ruby -y
    gem install bundler
    gem install jekyll
    }
   else {
    echo Installing Chocolatey
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    choco install ruby -y
    gem install bundler
    gem install jekyll
   }
) else (
 echo Get lost, User
)
