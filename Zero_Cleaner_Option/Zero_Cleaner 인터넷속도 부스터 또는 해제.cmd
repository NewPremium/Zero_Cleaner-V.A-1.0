@echo off
MODE.COM CON COLS=90 LINES=30
bcdedit > nul || (goto noroot)
setlocal
:main
cls
title  Zero_Cleaner ���ͳݼӵ� �ν��� ���� �� �ν��� �ϱ� 
echo.
echo. �� ���α׷� ����� ������� ���ּ���^!
echo.
echo             Zero_Cleaner ���ͳݼӵ� �ν��� ���� �� �ν��� �ϱ� 
echo         
echo         
echo          1) Zero_Cleaner ���ͳݼӵ� �ν��� �ϱ� - �ν����ϱ�    
echo         
echo         
echo          2) Zero_Cleaner ���ͳݼӵ� �ν��� ���� - �⺻ ��       
echo         
echo         
echo.           - �� ���α׷��� ���ͳ� ���� �뿪�� ������ �����մϴ� -
echo.
set /p NB=���Ͻô� �۾��� ������ �ּ��� : 
if "%NB%" == "1" goto Hi
if "%NB%" == "2" goto No
echo.
echo �ùٸ� ��ȣ�� �����Ͻñ� �ٶ��ϴ�^!
timeout/t 2 /nobreak>nul
goto main


:Hi
netsh interface tcp set global autotuninglevel=highlyrestricted
cls
echo.
echo.
echo.  Zero_Cleaner ���ͳݼӵ� �ν��� - Highlyrestricted �������� �����Ͽ����ϴ� 
echo.
echo. ENTERŰ�� �����ø� ����˴ϴ�.
pause
EXIT

:No
netsh interface tcp set global autotuninglevel=normal
cls
echo.
echo.
echo.  Zero_Cleaner ���ͳݼӵ� �ν��� ���� - Normal(�⺻ ��) �������� �����Ͽ����ϴ� 
echo.
echo. ENTERŰ�� �����ø� ����˴ϴ�.
pause>nul
EXIT

:windows8
cls
echo.
echo. ^! ���� ^!
echo. 
echo. �� OS �� Windows8 �Ǵ� Windows8.1 �Դϴ�
echo. 
echo. Windows8 �Ǵ� Windows8.1 ������ �� ���α׷��� ���� �� �� �����ϴ�^^!
echo. 
echo. 

:noroot
COLOR 4F
cls
echo.
echo. ���α׷��� ������ �������� ������� �ʾҽ��ϴ�^!
echo. ������ ������ �־����� ���� ��� ���α׷� ���۵��� �Ͼ �� �ֽ��ϴ�.
echo.
echo. ENTERŰ�� �����ø� ����˴ϴ�.
pause>nul
EXIT