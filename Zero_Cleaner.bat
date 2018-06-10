@echo off
pushd "%~dp0"
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion

::chack zip file
if not exist "system\cleanercheck\zerocleaner" (goto check)

::chack language
chcp.com 949 >Nul 2>Nul
if not %ERRORLEVEL% == 0 (
	cls
	echo.
	echo. Your computer does not support Korean^^!
	echo. 
	pause
	exit
)

::Chack OS version
set osver=nosupport
ver|system\grep\grep.exe -Eiq "Version 6.1." >Nul 2>Nul
if not %ERRORLEVEL% == 0 set osver=7
ver|system\grep\grep.exe -Eiq "Version 6.(2|3)." >Nul 2>Nul
if not %ERRORLEVEL% == 0 set osver=8
ver|system\grep\grep.exe -Eiq "Version 10.0." >Nul 2>Nul
if not %ERRORLEVEL% == 0 set osver=10
if /I "%osver%" == "nosupport" (
	goto nonos
)

:zerocleaner
::set system bit
set bit=86
if exist "%SystemRoot%\SysWOW64" do (
set bit=64
)

::set other
set zc=Zero_Cleaner
set v=V.A-1.0

:loading
mode.com con cols=95 lines=30
title %zc% 로딩중. . .
color 1F
echo.    --------------------------------------------------------------------------------------
echo. 
echo.                       ■■■■■  ■■■■■  ■■■■      ■■■             
echo.                             ■    ■          ■      ■  ■      ■           
echo.                           ■      ■■■■    ■■■■    ■      ■           
echo.                         ■        ■          ■      ■  ■      ■           
echo.                       ■■■■■  ■■■■■  ■      ■    ■■■             
echo. 
echo.         ■■■  ■        ■■■■■    ■■■    ■      ■  ■■■■■  ■■■■
echo.       ■        ■        ■          ■      ■  ■■    ■  ■          ■      ■
echo.       ■        ■        ■■■■    ■■■■■  ■  ■  ■  ■■■■    ■■■■
echo.       ■        ■        ■          ■      ■  ■    ■■  ■          ■      ■
echo.         ■■■  ■■■■  ■■■■■  ■      ■  ■      ■  ■■■■■  ■      ■
echo. 
echo.    --------------------------------------------------------------------------------------
echo.
echo.   [잠시만 기다려 주세요. . .]
echo.   [시스템 검사중. . . . . . ]
echo.
echo.
echo.   [ %zc% ]
echo.
echo.   [ %v% ]
echo.
echo.   클리너 사용후 재부팅을 권장합니다
echo.
echo.
echo. ⓒ Zeronate 2018
echo. ⓒ Zero_Cleaner 2018
timeout/t 2 /nobreak>nul
bcdedit > nul || (goto noroot)
if not exist "system\pro\browser_chromeprofile+nc.db" (goto nofile)
if not exist "system\pro\processkill_browser+nc.db" (goto nofile)
if not exist "system\pro\processkill_fakesystemprocess+nc.db" (goto nofile)
if not exist "system\grep\grep.exe" (goto nofile)
if not exist "system\messagebox\MessageBox.exe" (goto nofile)
if not exist "system\messagebox\ReadMe.txt" (goto nofile)
if not exist "system\tasks\taskkill.exe" (goto nofile)
if not exist "system\tasks\tasklist.exe" (goto nofile)
if not exist "system\IEhistory\regdelete.exe" (goto nofile)
if not exist "AUTORUN.INF" (goto nofile)
echo ^<meta http-equiv="refresh" content="0;url=http://blog.naver.com/ajb3296" /^> >%zc%_Option\Newpremium.html
echo ^<meta http-equiv="refresh" content="0;url=https://zerocleaner.weebly.com/" /^> >%zc%_Option\%zc%.html

SETLOCAL ENABLEDELAYEDEXPANSION
system\messagebox\messagebox.exe /C:%zc% 실행 확인^^! /T:4132 /M:%zc% 프로그램을 실행하시겠습니까^?\n이로인한 불이익^(중요파일 삭제등^)은 개발자에게 없습니다^^!\n%zc%_Option\%zc%_Guide 을(를) 꼭 보고 실행하세요!\n재배포 금지^^!
if !errorlevel! == 7 (
	endlocal
	goto off
) else (
	endlocal
)

:startlog

::make Zero_Cleaner log folder
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log"
)
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log"
)
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log"
)
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log"
)
set "strtmp=%date% %time%"
set "datetime=%strtmp%"
set "rptdate=%strtmp:-=%"
set "rptdate=%rptdate:/=%"
set "rptdate=%rptdate::=%"
set "rptdate=%rptdate:.=%"
set "rptdate=%rptdate: =%"

::chack and make Zero_Cleaner log folder
if not exist "%SYSTEMDRIVE%\%zc%_log" do (
mkdir "%SYSTEMDRIVE%\%zc%_log"
)

::set log name
set log=%zc%_log_[%rptdate%].txt
goto main1

:main1
echo %zc%  %v% >%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 가동시작 >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 가동환경 : x%bit% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 가동날짜 : %date% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 가동시각 : %time% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 실행으로인한 불이익^(중요파일 삭제등^)에 대한 책임은 개발자에게 없습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
title 선택
:selectdfiles
cls
echo.
echo. 인터넷 캐시 및 임시파일 을(를) 삭제할까요^?
echo.
echo. 1. 예
echo. 2. 아니오
set /p afile=선택하세요 : 
if %afile% == 1 (goto selectoffprosess)
if %afile% == 2 (goto selectoffprosess)
if %afile% == 예 (goto selectoffprosess)
if %afile% == 아니오 (goto selectoffprosess)
if %afile% == no (goto selectoffprosess)
if %afile% == yes (goto selectoffprosess)
goto selectdfiles
:selectoffprosess
cls
echo.
echo. 필요없는 프로세스 및 서비스 을(를) 종료할까요^?
echo.
echo. 1. 예
echo. 2. 아니오
set /p dprosess=선택하세요 : 
if %dprosess% == 1 (goto selecttrash)
if %dprosess% == 2 (goto selecttrash)
if %dprosess% == 예 (goto selecttrash)
if %dprosess% == 아니오 (goto selecttrash)
if %dprosess% == no (goto selecttrash)
if %dprosess% == yes (goto selecttrash)
goto selectoffprosess
:selecttrash
cls
echo.
echo. 휴지통 을(를) 비울까요^?
echo.
echo. 1. 예
echo. 2. 아니오
set /p trash=선택하세요 : 
if %trash% == 1 (goto selectwinlog)
if %trash% == 2 (goto selectwinlog)
if %trash% == 예 (goto selectwinlog)
if %trash% == 아니오 (goto selectwinlog)
if %trash% == no (goto selectwinlog)
if %trash% == yes (goto selectwinlog)
goto selecttrash
:selectwinlog
cls
echo.
echo. Windows 로그 을(를) 삭제할까요^?
echo.
echo. 1. 예
echo. 2. 아니오
set /p windowslog=선택하세요 : 
if %windowslog% == 1 (goto selectdwinupdate)
if %windowslog% == 2 (goto selectdwinupdate)
if %windowslog% == 예 (goto selectdwinupdate)
if %windowslog% == 아니오 (goto selectdwinupdate)
if %windowslog% == no (goto selectdwinupdate)
if %windowslog% == yes (goto selectdwinupdate)
goto selectwinlog
:selectdwinupdate
cls
echo.
echo. 필요없거나 악성인 Windows 업데이트 을(를) 삭제할까요^?
echo.
echo. 1. 예
echo. 2. 아니오
set /p windowsupdate=선택하세요 : 
if %windowsupdate% == 1 (goto selectstartprogram)
if %windowsupdate% == 2 (goto selectstartprogram)
if %windowsupdate% == 예 (goto selectstartprogram)
if %windowsupdate% == 아니오 (goto selectstartprogram)
if %windowsupdate% == no (goto selectstartprogram)
if %windowsupdate% == yes (goto selectstartprogram)
goto selectdwinupdate
:selectstartprogram
cls
echo.
echo. 시작메뉴-시작프로그램 하위 모든파일 을(를) 삭제할까요^?
echo.
echo. 1. 예
echo. 2. 아니오
set /p dstartprogram=선택하세요 : 
if %dstartprogram% == 1 (goto main)
if %dstartprogram% == 2 (goto main)
if %dstartprogram% == 예 (goto main)
if %dstartprogram% == 아니오 (goto main)
if %dstartprogram% == no (goto main)
if %dstartprogram% == yes (goto main)
goto selectstartprogram


:main

:afile
::임시파일 제거
cls
echo.
echo.---------------------------  START  --------------------------------
echo.
if %afile% == 2 (goto dprosess)
if %afile% == 아니오 (goto dprosess)
if %afile% == no (goto dprosess)
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 임시파일 및 브라우저 캐시 제거에 대해 동의하셨습니다.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 인터넷 브라우저 캐시삭제>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. 인터넷 브라우저 캐시삭제
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Google Chrome 브라우저 캐시 삭제중. . . >>%SYSTEMDRIVE%\%zc%_log\%log%
title Google Chrome 브라우저 캐시 삭제중. . .
echo. Google Chrome 브라우저 캐시 삭제중. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data" (goto nochrome)
set ChromeDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data >Nul 2>Nul
del /q /s /f "%ChromeDir%" >Nul 2>Nul
rd /s /q "%ChromeDir%" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo.
echo. 완료^^!
goto firefox
:nochrome
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Google Chrome 브라우저가 존재하지 않습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Google Chrome 브라우저가 존재하지 않습니다^^!
timeout/t 1 /nobreak>nul
goto firefox


:firefox
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Mozilla Firefox 브라우저 캐시삭제중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Mozilla Firefox 브라우저 캐시삭제중. . .
title Mozilla Firefox 브라우저 캐시삭제중. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles" (goto nofirefox)
set DataDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles >Nul 2>Nul
del /q /s /f "%DataDir%" >Nul 2>Nul
rd /s /q "%DataDir%" >Nul 2>Nul
for /d %%x in (%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 1 /nobreak>nul
goto opera
:nofirefox
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Mozilla Firefox 브라우저가 존재하지 않습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Mozilla Firefox 브라우저가 존재하지 않습니다^^!
timeout/t 1 /nobreak>nul
:opera
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Opera 브라우저 캐시삭제중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Opera 브라우저 캐시삭제중. . .
title Opera 브라우저 캐시삭제중. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Opera\Opera" (goto noopera)
set DataDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Opera\Opera >Nul 2>Nul
set DataDir2=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Opera\Opera >Nul 2>Nul
del /q /s /f "%DataDir%" >Nul 2>Nul
rd /s /q "%DataDir%" >Nul 2>Nul
del /q /s /f "%DataDir2%" >Nul 2>Nul
rd /s /q "%DataDir2%" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 1 /nobreak>nul
goto safari
:noopera
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Opera 브라우저가 존재하지 않습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Opera 브라우저가 존재하지 않습니다^^!
timeout/t 1 /nobreak>nul
:safari
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Apple Safari 브라우저 캐시삭제중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Apple Safari 브라우저 캐시삭제중. . .
title Apple Safari 브라우저 캐시삭제중. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Applec~1\Safari" (goto nosafari)
set DataDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Applec~1\Safari >Nul 2>Nul
set DataDir2=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Applec~1\Safari >Nul 2>Nul
del /q /s /f "%DataDir%\History" >Nul 2>Nul
rd /s /q "%DataDir%\History" >Nul 2>Nul
del /q /s /f "%DataDir%\Cache.db" >Nul 2>Nul
del /q /s /f "%DataDir%\WebpageIcons.db" >Nul 2>Nul
del /q /s /f "%DataDir2%" >Nul 2>Nul
rd /s /q "%DataDir2%" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 1 /nobreak>nul
goto ie
:nosafari
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Apple Safari 브라우저가 존재하지 않습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Apple Safari 브라우저가 존재하지 않습니다^^!
timeout/t 1 /nobreak>nul
:ie
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Microsoft Internet Explorer 브라우저 캐시삭제중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Microsoft Internet Explorer 브라우저 캐시삭제중. . .
title Microsoft Internet Explorer 브라우저 캐시삭제중. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1" (goto noie)
set DataDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1 >Nul 2>Nul
del /q /s /f "%DataDir%" >Nul 2>Nul
rd /s /q "%DataDir%" >Nul 2>Nul
set History=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History >Nul 2>Nul
del /q /s /f "%History%" >Nul 2>Nul
rd /s /q "%History%" >Nul 2>Nul
set IETemp=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Tempor~1 >Nul 2>Nul
del /q /s /f "%IETemp%" >Nul 2>Nul
rd /s /q "%IETemp%" >Nul 2>Nul
set Cookies=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies >Nul 2>Nul
del /q /s /f "%Cookies%" >Nul 2>Nul
rd /s /q "%Cookies%" >Nul 2>Nul
Del /f /s /q /a "%userprofile%\\Cookies\*.*" >>%SYSTEMDRIVE%\%zc%_log\%log% >Nul 2>Nul
IEhistory\regdelete.exe HKEY_CURRENT_USER "Software\Microsoft\Internet Explorer\TypedURLs" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 1 /nobreak>nul
goto flash
:noie
echo. 
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo Microsoft Internet Explorer 브라우저가 존재하지 않습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Microsoft Internet Explorer 브라우저가 존재하지 않습니다^^!
timeout/t 1 /nobreak>nul
:flash
echo. 
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo Flash Player 캐시삭제중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Flash Player 캐시삭제중. . .
title Flash Player 캐시삭제중. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1" (goto noflashplayer)
set FlashCookies=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1 >Nul 2>Nul
del /q /s /f "%FlashCookies%" >Nul 2>Nul
rd /s /q "%FlashCookies%" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 브라우저 캐시 삭제 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
timeout/t 1 /nobreak>nul
goto dd
:noflashplayer
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Flash Player 이(가) 존재하지 않습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Flash Player 이(가) 존재하지 않습니다^^!
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 브라우저 캐시 삭제 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
timeout/t 1 /nobreak>nul
:dd
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo 임시파일 제거중. . .^(오래 걸릴수 있습니다^)>>%SYSTEMDRIVE%\%zc%_log\%log%
title 임시파일 제거중. . .^(오래 걸릴수 있습니다^)
echo. 
echo. 임시파일 제거중. . .^(오래 걸릴수 있습니다^)

FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%SYSTEMROOT%\Temp\" 2^>Nul') DO (
	RD /Q /S "%SYSTEMROOT%\Temp\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%TEMP%\" 2^>Nul') DO (
	RD /Q /S "%TEMP%\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%SYSTEMROOT%\System32\Temp\" 2^>Nul') DO (
	RMDIR /S /Q "%SYSTEMROOT%\System32\Temp\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%SYSTEMROOT%\SysWOW64\Temp\" 2^>Nul') DO (
	RMDIR /S /Q "%SYSTEMROOT%\SysWOW64\Temp\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%TEMP%\" 2^>Nul') DO (
	RMDIR /S /Q "%TEMP%\%%A" >Nul 2>Nul
)

::DNS 캐시제거
ipconfig /flushdns >Nul 2>Nul

del /f /s /q "%systemdrive%\*.plt" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.dwl" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.dwl2" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.sc$" >Nul 2>Nul
DEL /F /Q /S /A "%TEMP%" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.err" >Nul 2>Nul
Del /f /s /q /a "%userprofile%\\recent\*.*" >Nul 2>Nul
Del /f /s /q /a "%SYSTEMROOT%\Prefetch\*.*" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.tmp" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.tmp" >Nul 2>Nul
del /f /s /q "%systemdrive%\*._mp" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.gid" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.chk" >Nul 2>Nul
del /f /s /q "%systemdrive%\*.old" >Nul 2>Nul
del /f /s /q "%systemdrive%\recycled\*.*" >Nul 2>Nul
del /f /s /q "%windir%\*.bak" >Nul 2>Nul
del /f /s /q "%windir%\prefetch\*.*" >Nul 2>Nul
rd /s /q "%windir%\temp & md %windir%\temp" >Nul 2>Nul
del /f /q "%userprofile%\cookies\*.*" >Nul 2>Nul
del /f /q "%userprofile%\recent\*.*" >Nul 2>Nul
del /f /s /q “%userprofile%\Local Settings\Temporary Internet Files\*.*” >Nul 2>Nul
del /f /s /q “%userprofile%\Local Settings\Temp\*.*” >Nul 2>Nul
del /f /s /q “%userprofile%\recent\*.*” >Nul 2>Nul
DEL /F /Q /S /A "%APPDATA%\Temp" >Nul 2>Nul
DEL /F /Q /S /A "%SYSTEMROOT%\Temp" >Nul 2>Nul
DEL /F /Q /A "%APPDATA%\*.TMP" >Nul 2>Nul
DEL /F /Q /A "%LOCALAPPDATA%\*.TMP" >Nul 2>Nul
DEL /F /Q /A "%LOCALLOWAPPDATA%\*.TMP" >Nul 2>Nul


FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%SYSTEMROOT%\Temp\" 2^>Nul') DO (
	RMDIR /S /Q "%SYSTEMROOT%\Temp\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%SYSTEMROOT%\System32\Temp\" 2^>Nul') DO (
	RMDIR /S /Q "%SYSTEMROOT%\System32\Temp\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%SYSTEMROOT%\SysWOW64\Temp\" 2^>Nul') DO (
	RMDIR /S /Q "%SYSTEMROOT%\SysWOW64\Temp\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%TEMP%\" 2^>Nul') DO (
	RMDIR /S /Q "%TEMP%\%%A" >Nul 2>Nul
)

DEL /F /Q /S /A "%APPDATA%\Adobe\Flash Player" >Nul 2>Nul
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Chromium\User Data\" 2^>Nul^|system\GREP\GREP.EXE -Fixf system\pro\BROWSER_CHROMEPROFILE+NC.DB 2^>Nul') DO (
	DEL /F /Q /A "%LOCALAPPDATA%\Chromium\User Data\%%A\Application Cache\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\Chromium\User Data\%%A\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\Chromium\User Data\%%A\Service Worker\ScriptCache\*" >Nul 2>Nul
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\Chromium\User Data\%%A\Service Worker\CacheStorage\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\Chromium\User Data\%%A\Service Worker\CacheStorage\%%B" >Nul 2>Nul
	)
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\Chromium\User Data\%%A\Service Worker\ScriptCache\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\Chromium\User Data\%%A\Service Worker\ScriptCache\%%B" >Nul 2>Nul
	)
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Google\Chrome\User Data\" 2^>Nul^|system\GREP\GREP.EXE -Fixf system\pro\BROWSER_CHROMEPROFILE+NC.DB 2^>Nul') DO (
	DEL /F /Q /A "%LOCALAPPDATA%\Google\Chrome\User Data\%%A\Application Cache\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\Google\Chrome\User Data\%%A\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\Google\Chrome\User Data\%%A\Service Worker\ScriptCache\*" >Nul 2>Nul
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\Google\Chrome\User Data\%%A\Service Worker\CacheStorage\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\Google\Chrome\User Data\%%A\Service Worker\CacheStorage\%%B" >Nul 2>Nul
	)
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\Google\Chrome\User Data\%%A\Service Worker\ScriptCache\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\Google\Chrome\User Data\%%A\Service Worker\ScriptCache\%%B" >Nul 2>Nul
	)
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Naver\Naver Whale\User Data\" 2^>Nul^|system\GREP\GREP.EXE -Fixf system\pro\BROWSER_CHROMEPROFILE+NC.DB 2^>Nul') DO (
	DEL /F /Q /A "%LOCALAPPDATA%\Naver\Naver Whale\User Data\%%A\Application Cache\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\Naver\Naver Whale\User Data\%%A\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\Naver\Naver Whale\User Data\%%A\Service Worker\ScriptCache\*" >Nul 2>Nul
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\Naver\Naver Whale\User Data\%%A\Service Worker\CacheStorage\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\Naver\Naver Whale\User Data\%%A\Service Worker\CacheStorage\%%B" >Nul 2>Nul
	)
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\Naver\Naver Whale\User Data\%%A\Service Worker\ScriptCache\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\Naver\Naver Whale\User Data\%%A\Service Worker\ScriptCache\%%B" >Nul 2>Nul
	)
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\SwingBrowser\User Data\" 2^>Nul^|system\GREP\GREP.EXE -Fixf system\pro\BROWSER_CHROMEPROFILE+NC.DB 2^>Nul') DO (
	DEL /F /Q /A "%LOCALAPPDATA%\SwingBrowser\User Data\%%A\Application Cache\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\SwingBrowser\User Data\%%A\Cache\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\SwingBrowser\User Data\%%A\Service Worker\ScriptCache\*" >Nul 2>Nul
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\SwingBrowser\User Data\%%A\Service Worker\CacheStorage\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\SwingBrowser\User Data\%%A\Service Worker\CacheStorage\%%B" >Nul 2>Nul
	)
	FOR /F "DELIMS=" %%B IN ('DIR /B /AD "%LOCALAPPDATA%\SwingBrowser\User Data\%%A\Service Worker\ScriptCache\" 2^>Nul') DO (
		RMDIR /S /Q "%LOCALAPPDATA%\SwingBrowser\User Data\%%A\Service Worker\ScriptCache\%%B" >Nul 2>Nul
	)
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\" 2^>Nul') DO (
	DEL /F /Q /A "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%%A\Cache\Entries\*" >Nul 2>Nul
	DEL /F /Q /A "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%%A\Cache2\Entries\*" >Nul 2>Nul
)
IF EXIST "%LOCALAPPDATA%\Steam\htmlcache\" (
	DEL /F /Q /S /A "%LOCALAPPDATA%\Steam\htmlcache" >Nul 2>Nul
)
IF EXIST "%PROGRAMFILES%\Steam\appcache\httpcache\" (
	DEL /F /Q /S /A "%PROGRAMFILES%\Steam\appcache\httpcache" >Nul 2>Nul
)
IF EXIST "%PROGRAMFILES%\Steam\config\htmlcache\" (
	DEL /F /Q /S /A "%PROGRAMFILES%\Steam\config\htmlcache" >Nul 2>Nul
)
IF EXIST "%PROGRAMFILES%\Steam\config\overlayhtmlcache\" (
	DEL /F /Q /S /A "%PROGRAMFILES%\Steam\config\overlayhtmlcache" >Nul 2>Nul
)
IF EXIST "%PROGRAMFILES(x86)%\Steam\appcache\httpcache\" (
	DEL /F /Q /S /A "%PROGRAMFILES(x86)%\Steam\appcache\httpcache" >Nul 2>Nul
)
IF EXIST "%PROGRAMFILES(x86)%\Steam\config\htmlcache\" (
	DEL /F /Q /S /A "%PROGRAMFILES(x86)%\Steam\config\htmlcache" >Nul 2>Nul
)
IF EXIST "%PROGRAMFILES(x86)%\Steam\config\overlayhtmlcache\" (
	DEL /F /Q /S /A "%PROGRAMFILES(x86)%\Steam\config\overlayhtmlcache" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Microsoft\Windows\INetCache\Content.IE5\" 2^>Nul') DO (
	RMDIR /S /Q "%LOCALAPPDATA%\Microsoft\Windows\INetCache\Content.IE5\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Microsoft\Windows\INetCache\Low\Content.IE5\" 2^>Nul') DO (
	RMDIR /S /Q "%LOCALAPPDATA%\Microsoft\Windows\INetCache\Content.IE5\Low\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\Content.IE5\" 2^>Nul') DO (
	RMDIR /S /Q "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\Content.IE5\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\" 2^>Nul') DO (
	RMDIR /S /Q "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\%%A" >Nul 2>Nul
)
FOR /F "DELIMS=" %%A IN ('DIR /B /AD "%LOCALAPPDATA%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\Cache\" 2^>Nul') DO (
	RMDIR /S /Q "%LOCALAPPDATA%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\Cache\%%A" >Nul 2>Nul
)
IF EXIST "%SYSTEMROOT%\System32\InetCpl.cpl" (
	RUNDLL32.EXE InetCpl.cpl,ClearMyTracksByProcess 4 >Nul 2>Nul
)
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 2 /nobreak>nul
goto dprosess

::필요없는 프로세스를 종료
:dprosess

if %dprosess% == 2 (goto trash)
if %dprosess% == 아니오 (goto trash)
if %dprosess% == no (goto trash)
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 필요없는 프로세스와 서비스 종료에 대해 동의하셨습니다.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo 필요없는 프로세스및 서비스를 종료중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.
echo.--------------------------------------------------------------------
title 필요없는 프로세스및 서비스를 종료중. . .
echo. 
echo. 필요없는 프로세스및 서비스를 종료중. . .

FOR /F "DELIMS=" %%A IN (SYSTEM\PRO\PROCESSKILL_FAKESYSTEMPROCESS+NC.DB) DO (
	IF /I NOT "%%A" == "SYSTEM FILES IS FAIL" (
		system\TASKS\TASKKILL.EXE /IM "%%A" >Nul 2>Nul
		system\TASKS\TASKKILL.EXE /IM "%%A" >Nul 2>Nul
		system\TASKS\TASKKILL.EXE /IM "%%A" >Nul 2>Nul
		system\TASKS\TASKKILL.EXE /IM "%%A" >Nul 2>Nul
		system\TASKS\TASKKILL.EXE /IM "%%A" >Nul 2>Nul
	)
)
FOR /F "DELIMS=" %%A IN (SYSTEM\PRO\PROCESSKILL_BROWSER+NC.DB) DO (
	IF /I NOT "%%A" == "SYSTEM FILES IS FAIL" (
		system\TASKS\TASKKILL.EXE /F /IM "%%A" >Nul 2>Nul
	)
)
system\TASKS\TASKKILL.EXE /IM "DOPUS.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "DOPUSRT.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "EXPLORER++.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "FAR.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "FLYEXPLORER.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "FREECOMMANDER.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "MASTER COMMANDER.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "MULTICOMMANDER.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "NEXUSFILE.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "ONECOMMANDERV2.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "TOTALCMD.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "UNCOM.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "GoogleUpdate.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "wmpnetwk.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "PDVD11Serv.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "OSPPSVC.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "taskhost.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "TortoiseHgOverlayServer.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "IMEDICTUPDATE.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "mDNSResponder.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "PresentationFontCache.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "splwow64.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "sppsvc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "WmiPrvSE.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "nPStarterSVC.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "npnj5Agent.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "npmonz.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "npenkMain5.npn" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "npkcmsvc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "npkfxsvc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "nossvc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "nosstarter.npe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "CKAgent.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "I3GEX.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "SCSKSender.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "SNBTAAAA.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "EZKeytecRun.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "WLIDSVCM.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "TSVNCache.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "AYWscUpdater.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "WLIDSVC.EXE" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "ImageSAFERSvc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "ImageSAFERStart_x86.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "ImageSAFERStart_x64.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "veraport.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "AnySign4PC.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "I3GMainSvc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "I3GProc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "dllhost.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "taskeng.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "TrustedInstaller.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "MsMpEng.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "qruxaaaa.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "isbew64.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "eausvc.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "FreeAgentService.exe" >Nul 2>Nul
system\TASKS\TASKKILL.EXE /IM "AppleMobileDeviceService.exe" >Nul 2>Nul


SC.EXE START Spooler >Nul 2>Nul
SC.EXE START UXSMS >Nul 2>Nul
SC.EXE START VaultSvc >Nul 2>Nul
SCHTASKS.EXE /Run /TN "\Microsoft\Windows\Multimedia\SystemSoundsService" >Nul 2>Nul
SCHTASKS.EXE /Run /TN "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" >Nul 2>Nul
SCHTASKS.EXE /Run /TN "\Microsoft\Windows\WDI\ResolutionHost" >Nul 2>Nul
SCHTASKS.EXE /Run /TN "\Microsoft\Windows\Wininet\CacheTask" >Nul 2>Nul
	

::서비스에 STOP 요청을 보냅니다.
sc stop "ApplicationSpecialManagement" >Nul 2>Nul
sc stop "TUCtlSystem" >Nul 2>Nul
sc stop "Image Protection" >Nul 2>Nul
sc stop "WebClient" >Nul 2>Nul
sc stop "IMGSF50_Svc" >Nul 2>Nul
sc stop "Innosvc7" >Nul 2>Nul
sc stop "Innosvc" >Nul 2>Nul
sc stop "I3GMainSvc" >Nul 2>Nul
sc stop "npggsvc" >Nul 2>Nul

::서비스를 레지스트리에서 삭제합니다.
sc delete "ApplicationSpecialManagement" >Nul 2>Nul
sc delete "TUCtlSystem" >Nul 2>Nul
sc delete "Image Protection" >Nul 2>Nul
sc delete "WebClient" >Nul 2>Nul
sc delete "IMGSF50_Svc" >Nul 2>Nul
sc delete "Innosvc7" >Nul 2>Nul
sc delete "Innosvc" >Nul 2>Nul
sc delete "I3GMainSvc" >Nul 2>Nul
sc delete "npggsvc" >Nul 2>Nul

echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 필요없는 서비스를 종료하였습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 필요없는 프로세스를 종료하였습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. 필요없는 서비스를 종료하였습니다^^!
echo.
echo. 필요없는 프로세스를 종료하였습니다^^!
timeout/t 2 /nobreak>nul
goto trash

::$RECYCLE.BIN 내부 비우기
:trash

if %trash% == 2 (goto wineventlog)
if %trash% == 아니오 (goto wineventlog)
if %trash% == no (goto wineventlog)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 휴지통을 비우는데에 동의하셨습니다.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo $RECYCLE.BIN 내부(휴지통) 비우는 중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
title $RECYCLE.BIN 내부(휴지통) 비우는 중. . .
echo. $RECYCLE.BIN 내부(휴지통) 비우는 중. . .
for %%a in (c d e f g h i j k L m n o p q r s t u v w x y z) do (
if exist %%a:\$RECYCLE.BIN for /f "tokens=* usebackq" %%b in (`"dir /a:d/b %%a:\$RECYCLE.BIN\"`) do rd /q/s "%%a:\$RECYCLE.BIN\%%~b"
if exist %%a:\RECYCLER for /f "tokens=* usebackq" %%b in (`"dir /a:d/b %%a:\RECYCLER\"`) do rd /q/s "%%a:\RECYCLER\%%~b"
)
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 2 /nobreak>nul
goto wineventlog

::Windows 이벤트로그 삭제
:wineventlog

if %windowslog% == 2 (goto windowsupdate)
if %windowslog% == 아니오 (goto windowsupdate)
if %windowslog% == no (goto windowsupdate)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Windows 이벤트로그 삭제하는데에 동의하셨습니다.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Windows 이벤트로그 삭제중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
title Windows 이벤트로그 삭제중. . .
echo. Windows 이벤트로그 삭제중. . .
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) do (
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 제거할 Windows 이벤트 로그가 없습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 제거할 Windows 이벤트 로그가 없습니다^^!
echo. 
echo. 제거할 Windows 이벤트 로그가 없습니다^^!
timeout/t 1 /nobreak>nul
goto windowsupdate
)
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
:do_clear
title 로그정리중. . . %1
echo  Windows 이벤트로그 제거 - %1 >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. 로그정리중. . .
wevtutil.exe cl %1
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 2 /nobreak>nul
goto windowsupdate

::필요없는 윈도우 업데이트 삭제

:windowsupdate

if %windowsupdate% == 2 (goto startprogram)
if %windowsupdate% == 아니오 (goto startprogram)
if %windowsupdate% == no (goto startprogram)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 필요없는 윈도우 업데이트를 삭제하는데에 동의하셨습니다.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo 필요없는 윈도우 업데이트 삭제중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
title 필요없는 윈도우 업데이트 삭제중. . .
echo. 필요없는 윈도우 업데이트 삭제중. . .

::인증관련
wusa /uninstall /quiet /norestart /KB:298279 
if not "%ERRORLEVEL%" == "0" (
goto kb949810
)
echo. 제거 - KB298279
echo 제거 - KB298279>>%SYSTEMDRIVE%\%zc%_log\%log%
::Office 정품 알림
:kb949810
wusa /uninstall /quiet /norestart /KB:949810 
if not "%ERRORLEVEL%" == "0" (
goto kb971033
)
echo. 제거 - KB949810
echo 제거 - KB949810>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows7 정품 알림
:kb971033
wusa /uninstall /quiet /norestart /KB:971033 
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb976902
)
echo. 제거 - KB971033
echo 제거 - KB971033>>%SYSTEMDRIVE%\%zc%_log\%log%
::인증관련
:kb976902
wusa /uninstall /quiet /norestart /KB:976902
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2718704
)
echo. 제거 - KB976902
echo 제거 - KB976902>>%SYSTEMDRIVE%\%zc%_log\%log%

::인증관련
:kb2718704
wusa /uninstall /quiet /norestart /KB:2718704
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2803821
)
echo. 제거 - KB2718704
echo 제거 - KB2718704>>%SYSTEMDRIVE%\%zc%_log\%log%
::그래픽 반토막으로 나오게 함
:kb2803821
wusa /uninstall /quiet /norestart /KB:2803821
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2868038
)
echo. 제거 - KB2803821
echo 제거 - KB2803821>>%SYSTEMDRIVE%\%zc%_log\%log%
::불필요한 업데이트
:kb2868038
wusa /uninstall /quiet /norestart /KB:2868038
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2868626
)
echo. 제거 - KB2868038
echo 제거 - KB2868038>>%SYSTEMDRIVE%\%zc%_log\%log%

::불필요한 업데이트
:kb2868626
wusa /uninstall /quiet /norestart /KB:2868626
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2952664
)
echo. 제거 - KB2868626 - 사유 : 불필요한 업데이트
echo 제거 - KB2868626 - 사유 : 불필요한 업데이트>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 업그레이드 관련
:kb2952664
wusa /uninstall /quiet /norestart /KB:2952664 
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2970228
)
echo. 제거 - KB2952664 - 사유 : Windows10 업그레이드 관련
echo 제거 - KB2952664 - 사유 : Windows10 업그레이드 관련>>%SYSTEMDRIVE%\%zc%_log\%log%
::루블화 화폐 표시 새 기호
:kb2970228
wusa /uninstall /quiet /norestart /KB:2970228
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2975331
)
echo. 제거 - KB2970228 - 사유 : 루블화 화폐 표시 새 기호
echo 제거 - KB2970228 - 사유 : 루블화 화폐 표시 새 기호>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows RT, Windows 8, Windows 서버 2012용 2014년 8월 롤업
:kb2975331
wusa /uninstall /quiet /norestart /KB:2975331
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2975719
)
echo. 제거 - KB2975331 - 사유 : Windows RT, Windows 8, Windows 서버 2012용 2014년 8월 롤업
echo 제거 - KB2975331 - 사유 : Windows RT, Windows 8, Windows 서버 2012용 2014년 8월 롤업>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows RT 8.1, Windows 서버 2012 R2용 2014년 8월 롤업
:kb2975719
wusa /uninstall /quiet /norestart /KB:2975719 
if not "%ERRORLEVEL%" == "0" (
goto kb2976897
)
echo. 제거 - KB2975719 - 사유 : Windows RT 8.1, Windows 서버 2012 R2용 2014년 8월 롤업
echo 제거 - KB2975719 - 사유 : Windows RT 8.1, Windows 서버 2012 R2용 2014년 8월 롤업>>%SYSTEMDRIVE%\%zc%_log\%log%
::악성 업데이트
:kb2976897
wusa /uninstall /quiet /norestart /KB:2976897 
if not "%ERRORLEVEL%" == "0" (
goto kb2982791
)
echo. 제거 - KB2976897 - 사유 : 악성 업데이트
echo 제거 - KB2976897 - 사유 : 악성 업데이트>>%SYSTEMDRIVE%\%zc%_log\%log%
::블루스크린 유발
:kb2982791
wusa /uninstall /quiet /norestart /KB:2982791 
if not "%ERRORLEVEL%" == "0" (
goto kb2984615
)
echo. 제거 - KB2982791 - 사유 : 블루스크린 유발
echo 제거 - KB2982791 - 사유 : 블루스크린 유발>>%SYSTEMDRIVE%\%zc%_log\%log%
::악성 업데이트
:kb2984615
wusa /uninstall /quiet /norestart /KB:2984615 
if not "%ERRORLEVEL%" == "0" (
goto kb3021917
)
echo. 제거 - KB2984615 - 사유 : 악성 업데이트
echo 제거 - KB2984615 - 사유 : 악성 업데이트>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 업그레이드 알림
:kb3021917
wusa /uninstall /quiet /norestart /KB:3021917 
if not "%ERRORLEVEL%" == "0" (
goto kb3022345
)
echo. 제거 - KB3021917 - 사유 : Windows10 업그레이드 알림
echo 제거 - KB3021917 - 사유 : Windows10 업그레이드 알림>>%SYSTEMDRIVE%\%zc%_log\%log%
::진단 추적 서비스
:kb3022345
wusa /uninstall /quiet /norestart /KB:3022345 
if not "%ERRORLEVEL%" == "0" (
goto kb3035583
)
echo. 제거 - KB3022345 - 사유 : 진단 추적 서비스
echo 제거 - KB3022345 - 사유 : 진단 추적 서비스>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 업그레이드 알림
:kb3035583
wusa /uninstall /quiet /norestart /KB:3035583 
if not "%ERRORLEVEL%" == "0" (
goto kb3068708
)
echo. 제거 - KB3035583 - 사유 : Windows10 업그레이드 알림
echo 제거 - KB3035583 - 사유 : Windows10 업그레이드 알림>>%SYSTEMDRIVE%\%zc%_log\%log%
::KB3022345대용. 사용자 진단, 현황, 추적 서비스
:kb3068708
wusa /uninstall /quiet /norestart /KB:3068708 
if not "%ERRORLEVEL%" == "0" (
goto kb3075249
)
echo. 제거 - KB3068708 - 사유 : KB3022345대용. 사용자 진단, 현황, 추적 서비스
echo 제거 - KB3068708 - 사유 : KB3022345대용. 사용자 진단, 현황, 추적 서비스>>%SYSTEMDRIVE%\%zc%_log\%log%
::사용자 계정 정보 전송
:kb3075249
wusa /uninstall /quiet /norestart /KB:3075249 
if not "%ERRORLEVEL%" == "0" (
goto kb3080149
)
echo. 제거 - KB3075249 - 사유 : 사용자 계정 정보 전송
echo 제거 - KB3075249 - 사유 : 사용자 계정 정보 전송>>%SYSTEMDRIVE%\%zc%_log\%log%
::사용자 진단, 현황, 추적 서비스
:kb3080149
wusa /uninstall /quiet /norestart /KB:3080149 
if not "%ERRORLEVEL%" == "0" (
goto kb3097877
)
echo. 제거 - KB3080149 - 사유 : 사용자 진단, 현황, 추적 서비스
echo 제거 - KB3080149 - 사유 : 사용자 진단, 현황, 추적 서비스>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows7 정품 알림
:kb3097877
wusa /uninstall /quiet /norestart /KB:3097877 
if not "%ERRORLEVEL%" == "0" (
goto kb3101746
)
echo. 제거 - KB3097877 - 사유 : Windows7 정품 알림
echo 제거 - KB3097877 - 사유 : Windows7 정품 알림>>%SYSTEMDRIVE%\%zc%_log\%log%
::불필요한 업데이트
:kb3101746
wusa /uninstall /quiet /norestart /KB:3101746 
if not "%ERRORLEVEL%" == "0" (
goto kb3109094
)
echo. 제거 - KB3101746 - 사유 : 불필요한 업데이트
echo 제거 - KB3101746 - 사유 : 불필요한 업데이트>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows7 정품 알림
:kb3109094
wusa /uninstall /quiet /norestart /KB:3109094
if not "%ERRORLEVEL%" == "0" (
goto kb3112343
)
echo. 제거 - KB3109094 - 사유 : Windows7 정품 알림
echo 제거 - KB3109094 - 사유 : Windows7 정품 알림>>%SYSTEMDRIVE%\%zc%_log\%log%
::인증 관련
:kb3112343
wusa /uninstall /quiet /norestart /KB:3112343 
if not "%ERRORLEVEL%" == "0" (
goto kb3150513
)
echo. 제거 - KB3112343 - 사유 : 인증 관련
echo 제거 - KB3112343 - 사유 : 인증 관련>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 업그레이드 알림2
:kb3150513
wusa /uninstall /quiet /norestart /KB:3150513 
if not "%ERRORLEVEL%" == "0" (
goto kb4012219
)
echo. 제거 - KB3150513 - 사유 : Windows10 업그레이드 알림2
echo 제거 - KB3150513 - 사유 : Windows10 업그레이드 알림2>>%SYSTEMDRIVE%\%zc%_log\%log%
::오류 유발
:kb4012219
wusa /uninstall /quiet /norestart /KB:4012219 
if not "%ERRORLEVEL%" == "0" (
goto kb4012218
)
echo. 제거 - KB4012219 - 사유 : 오류 유발
echo 제거 - KB4012219 - 사유 : 오류 유발>>%SYSTEMDRIVE%\%zc%_log\%log%
::오류 유발
:kb4012218
wusa /uninstall /quiet /norestart /KB:4012218 
if not "%ERRORLEVEL%" == "0" (
goto kb3170735
)
echo. 제거 - KB4012218 - 사유 : 오류 유발
echo 제거 - KB4012218 - 사유 : 오류 유발>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows 10 업그레이드 관련
:kb3170735
wusa /uninstall /quiet /norestart /KB:3170735
if not "%ERRORLEVEL%" == "0" (
goto kb3173040
)
echo. 제거 - KB3170735 - 사유 : Windows 10 업그레이드 관련
echo 제거 - KB3170735 - 사유 : Windows 10 업그레이드 관련>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows 10 업그레이드 알림-종료시 전체화면으로
:kb3173040
wusa /uninstall /quiet /norestart /KB:3173040 
if not "%ERRORLEVEL%" == "0" (
goto kb915597
)
echo. 제거 - KB3173040 - 사유 : Windows 10 업그레이드 알림-종료시 전체화면으로
echo 제거 - KB3173040 - 사유 : Windows 10 업그레이드 알림-종료시 전체화면으로>>%SYSTEMDRIVE%\%zc%_log\%log%
::윈도우 디펜더 업데이트
:kb915597
wusa /uninstall /quiet /norestart /KB:915597 
if not "%ERRORLEVEL%" == "0" (
goto kb4056892
)
echo. 제거 - KB915597 - 사유 : 윈도우 디펜더 업데이트
echo 제거 - KB915597 - 사유 : 윈도우 디펜더 업데이트>>%SYSTEMDRIVE%\%zc%_log\%log%
::재부팅현상을 가져온 스펙터, 멜트다운 패치
:kb4056892
wusa /uninstall /quiet /norestart /KB:4056892
if not "%ERRORLEVEL%" == "0" (
goto kb4056891
)
echo. 제거 - KB4056892 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치
echo 제거 - KB4056892 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056891
wusa /uninstall /quiet /norestart /KB:4056891
if not "%ERRORLEVEL%" == "0" (
goto kb4056890
)
echo. 제거 - KB4056891 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치
echo 제거 - KB4056891 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056890
wusa /uninstall /quiet /norestart /KB:4056890
if not "%ERRORLEVEL%" == "0" (
goto kb4056898
)
echo. 제거 - KB4056890 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치
echo 제거 - KB4056890 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056898
wusa /uninstall /quiet /norestart /KB:4056898
if not "%ERRORLEVEL%" == "0" (
goto kb4056897
)
echo. 제거 - KB4056898 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치
echo 제거 - KB4056898 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056897
wusa /uninstall /quiet /norestart /KB:4056897
if not "%ERRORLEVEL%" == "0" (
goto kbfinish
)
echo. 제거 - KB4056897 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치
echo 제거 - KB4056897 - 사유 : 재부팅현상을 가져온 스펙터, 멜트다운 패치>>%SYSTEMDRIVE%\%zc%_log\%log%
:kbfinish
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 2 /nobreak>nul
goto startprogram

::시작프로그램 삭제
:startprogram

if %dstartprogram% == 2 (goto finish)
if %dstartprogram% == 아니오 (goto finish)
if %dstartprogram% == no (goto finish)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 시작메뉴-시작프로그램 하위 모든파일을 제거하는데에 동의하셨습니다.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo 시작메뉴-시작프로그램 하위 모든파일 제거중. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
title 시작메뉴-시작프로그램 하위 모든파일 제거중. . .
echo. 
echo. 시작메뉴-시작프로그램 하위 모든파일 제거중. . .
del "%allusersprofile%\Microsoft\Windows\Start Menu\Programs\StartUp" /f /q >Nul 2>Nul
del "%appdata%\Microsoft\Windows\Start Menu\Programs\StartUp" /f /q >Nul 2>Nul
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo 완료^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
title 완료^^!
echo. 
echo. 완료^^!
timeout/t 2 /nobreak>nul
goto finish


:nofile
COLOR 4F
cls
title The file system is corrupted.
echo. 
echo. The file system is corrupted^^!
echo. 
echo. Please reinstall %zc%.
echo. 
echo. Press the ENTER key to exit.
pause>nul
exit

:noroot
COLOR 4F
SETLOCAL ENABLEDELAYEDEXPANSION
system\MESSAGEBOX\MESSAGEBOX.EXE /C:%zc% 관리자 권한 확인^^! /T:4132 /M:%zc%가 관리자 권한으로 실행되지 않았습니다^^!\n%zc%종료후 관리자 권한으로 실행하여 주세요^^!\n관리자 권한이 주어지지 않을 경우 프로그램 오작동이 일어날 수 있습니다.\n예 키를 누르시면 %zc%가 관리자권한으로 시작됩니다.\n아니오 키를 누르시면 %zc%가 종료됩니다.
IF !ERRORLEVEL! EQU 7 (
	ENDLOCAL
	SET ERRCODE=999
	system\TASKS\TASKKILL.EXE /F /IM "CMD.EXE" >Nul 2>Nul
) ELSE (
	ENDLOCAL
)
goto startadmine
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
exit

:check
COLOR 4F
cls
title Please unzip the file properly and execute it.
echo.
echo. Please unzip the file properly and execute it.
echo.
echo. Press the ENTER key to exit the program.
PAUSE>NUL
exit

:nonos
COLOR 4F
cls
title This OS isn't supported
echo.
echo. This OS isn't supported
echo.
echo. Supported OS : Windows 7~10
echo.
echo. Press the ENTER key to exit the program.
pause>nul
exit

:finish
echo.
echo.------------------------------  FINISH  ----------------------------
title %zc% 을(를) 안전하게 끝마쳤습니다^^!
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo ------------------------------  FINISH  ---------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 종료 >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 종료날짜 : %date% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 종료시각 : %time% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 을(를) 안전하게 끝마쳤습니다^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% 종료후 재부팅을 권장합니다.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.
echo. %zc% 종료날짜 : %date%
echo. %zc% 종료시각 : %time%
echo.
echo. %zc% 을(를) 안전하게 끝마쳤습니다^^!
echo. %zc% 종료후 재부팅을 권장합니다^^!
echo.
echo. ENTER키를 누르시면 프로그램이 종료됩니다.
start %SYSTEMDRIVE%\%zc%_log\%log%
pause>nul
system\TASKS\TASKKILL.EXE /F /IM "CMD.EXE" >Nul 2>Nul
:off
cls
title 프로그램 종료.
echo. 
echo. ENTER키를 누르시면 프로그램이 종료됩니다.
echo. 
pause>nul
system\TASKS\TASKKILL.EXE /F /IM "CMD.EXE" >Nul 2>Nul