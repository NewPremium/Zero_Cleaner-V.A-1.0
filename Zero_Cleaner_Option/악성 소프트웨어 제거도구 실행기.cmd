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
title "�Ǽ� ����Ʈ���� ���� ����" �����
MODE.COM CON COLS=70 LINES=20
echo.
echo. �Ǽ� ����Ʈ���� ���ŵ��� ���� ��û�� �Ͽ����ϴ�^!
echo.
echo. ENTERŰ�� �����ø� ���α׷��� ����˴ϴ�.
start mrt
pause>nul
exit