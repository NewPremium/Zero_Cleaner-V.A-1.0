@echo off
:startadmine
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
pushd "%CD%"
    CD /D "%~dp0"
title "악성 소프트웨어 제거 도구" 실행기
MODE.COM CON COLS=70 LINES=20
echo.
echo. 악성 소프트웨어 제거도구 실행 요청을 하였습니다^!
echo.
echo. ENTER키를 누르시면 프로그램이 종료됩니다.
start mrt
pause>nul
exit