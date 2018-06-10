@echo off
MODE.COM CON COLS=90 LINES=30
bcdedit > nul || (goto noroot)
setlocal
:main
cls
title  Zero_Cleaner 인터넷속도 부스터 해제 및 부스터 하기 
echo.
echo. 이 프로그램 사용후 재부팅을 해주세요^!
echo.
echo             Zero_Cleaner 인터넷속도 부스터 해제 및 부스터 하기 
echo         
echo         
echo          1) Zero_Cleaner 인터넷속도 부스터 하기 - 부스터하기    
echo         
echo         
echo          2) Zero_Cleaner 인터넷속도 부스터 해제 - 기본 값       
echo         
echo         
echo.           - 이 프로그램은 인터넷 예약 대역폭 제한을 해제합니다 -
echo.
set /p NB=원하시는 작업을 선택해 주세요 : 
if "%NB%" == "1" goto Hi
if "%NB%" == "2" goto No
echo.
echo 올바른 번호를 선택하시기 바랍니다^!
timeout/t 2 /nobreak>nul
goto main


:Hi
netsh interface tcp set global autotuninglevel=highlyrestricted
cls
echo.
echo.
echo.  Zero_Cleaner 인터넷속도 부스터 - Highlyrestricted 수준으로 변경하였습니다 
echo.
echo. ENTER키를 누르시면 종료됩니다.
pause
EXIT

:No
netsh interface tcp set global autotuninglevel=normal
cls
echo.
echo.
echo.  Zero_Cleaner 인터넷속도 부스터 해제 - Normal(기본 값) 수준으로 변경하였습니다 
echo.
echo. ENTER키를 누르시면 종료됩니다.
pause>nul
EXIT

:windows8
cls
echo.
echo. ^! 위험 ^!
echo. 
echo. 이 OS 는 Windows8 또는 Windows8.1 입니다
echo. 
echo. Windows8 또는 Windows8.1 에서는 이 프로그램을 실행 할 수 없습니다^^!
echo. 
echo. 

:noroot
COLOR 4F
cls
echo.
echo. 프로그램이 관리자 권한으로 실행되지 않았습니다^!
echo. 관리자 권한이 주어지지 않을 경우 프로그램 오작동이 일어날 수 있습니다.
echo.
echo. ENTER키를 누르시면 종료됩니다.
pause>nul
EXIT