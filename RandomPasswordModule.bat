@echo off
setlocal enabledelayedexpansion
:-------------------------------------
REM  -->  Verification des permissions
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

    REM --> Erreur vous ne possedez pas les droits admin
    if '%errorlevel%' NEQ '0' (
    echo Verification des privileges administrateur
    goto UACPrompt
    ) else ( goto gotAdmin )

    :UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit

    :gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


mkdir "C:\Program Files\WindowsPowerShell\Modules\RandomPasswordModule"
xcopy RandomPasswordModule.psm1 "C:\Program Files\WindowsPowerShell\Modules\RandomPasswordModule"
xcopy RandomPasswordModule.psd1 "C:\Program Files\WindowsPowerShell\Modules\RandomPasswordModule"
start /wait powershell -command "Set-ExecutionPolicy RemoteSigned"
start /wait powershell -noprofile -command "Import-Module RandomPasswordModule"
start /wait powershell -command "Install-Module -Name ClipboardText -Scope AllUsers"
echo Import-Module RandomPasswordModule >> C:\Windows\System32\WindowsPowerShell\V1.0/profile.ps1
del RandomPasswordModule.psm1 RandomPasswordModule.psd1
