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
title %zc% �ε���. . .
color 1F
echo.    --------------------------------------------------------------------------------------
echo. 
echo.                       ������  ������  �����      ����             
echo.                             ��    ��          ��      ��  ��      ��           
echo.                           ��      �����    �����    ��      ��           
echo.                         ��        ��          ��      ��  ��      ��           
echo.                       ������  ������  ��      ��    ����             
echo. 
echo.         ����  ��        ������    ����    ��      ��  ������  �����
echo.       ��        ��        ��          ��      ��  ���    ��  ��          ��      ��
echo.       ��        ��        �����    ������  ��  ��  ��  �����    �����
echo.       ��        ��        ��          ��      ��  ��    ���  ��          ��      ��
echo.         ����  �����  ������  ��      ��  ��      ��  ������  ��      ��
echo. 
echo.    --------------------------------------------------------------------------------------
echo.
echo.   [��ø� ��ٷ� �ּ���. . .]
echo.   [�ý��� �˻���. . . . . . ]
echo.
echo.
echo.   [ %zc% ]
echo.
echo.   [ %v% ]
echo.
echo.   Ŭ���� ����� ������� �����մϴ�
echo.
echo.
echo. �� Zeronate 2018
echo. �� Zero_Cleaner 2018
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
system\messagebox\messagebox.exe /C:%zc% ���� Ȯ��^^! /T:4132 /M:%zc% ���α׷��� �����Ͻðڽ��ϱ�^?\n�̷����� ������^(�߿����� ������^)�� �����ڿ��� �����ϴ�^^!\n%zc%_Option\%zc%_Guide ��(��) �� ���� �����ϼ���!\n����� ����^^!
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
echo %zc% �������� >>%SYSTEMDRIVE%\%zc%_log\%log%
echo ����ȯ�� : x%bit% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% ������¥ : %date% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% �����ð� : %time% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% ������������ ������^(�߿����� ������^)�� ���� å���� �����ڿ��� �����ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
title ����
:selectdfiles
cls
echo.
echo. ���ͳ� ĳ�� �� �ӽ����� ��(��) �����ұ��^?
echo.
echo. 1. ��
echo. 2. �ƴϿ�
set /p afile=�����ϼ��� : 
if %afile% == 1 (goto selectoffprosess)
if %afile% == 2 (goto selectoffprosess)
if %afile% == �� (goto selectoffprosess)
if %afile% == �ƴϿ� (goto selectoffprosess)
if %afile% == no (goto selectoffprosess)
if %afile% == yes (goto selectoffprosess)
goto selectdfiles
:selectoffprosess
cls
echo.
echo. �ʿ���� ���μ��� �� ���� ��(��) �����ұ��^?
echo.
echo. 1. ��
echo. 2. �ƴϿ�
set /p dprosess=�����ϼ��� : 
if %dprosess% == 1 (goto selecttrash)
if %dprosess% == 2 (goto selecttrash)
if %dprosess% == �� (goto selecttrash)
if %dprosess% == �ƴϿ� (goto selecttrash)
if %dprosess% == no (goto selecttrash)
if %dprosess% == yes (goto selecttrash)
goto selectoffprosess
:selecttrash
cls
echo.
echo. ������ ��(��) �����^?
echo.
echo. 1. ��
echo. 2. �ƴϿ�
set /p trash=�����ϼ��� : 
if %trash% == 1 (goto selectwinlog)
if %trash% == 2 (goto selectwinlog)
if %trash% == �� (goto selectwinlog)
if %trash% == �ƴϿ� (goto selectwinlog)
if %trash% == no (goto selectwinlog)
if %trash% == yes (goto selectwinlog)
goto selecttrash
:selectwinlog
cls
echo.
echo. Windows �α� ��(��) �����ұ��^?
echo.
echo. 1. ��
echo. 2. �ƴϿ�
set /p windowslog=�����ϼ��� : 
if %windowslog% == 1 (goto selectdwinupdate)
if %windowslog% == 2 (goto selectdwinupdate)
if %windowslog% == �� (goto selectdwinupdate)
if %windowslog% == �ƴϿ� (goto selectdwinupdate)
if %windowslog% == no (goto selectdwinupdate)
if %windowslog% == yes (goto selectdwinupdate)
goto selectwinlog
:selectdwinupdate
cls
echo.
echo. �ʿ���ų� �Ǽ��� Windows ������Ʈ ��(��) �����ұ��^?
echo.
echo. 1. ��
echo. 2. �ƴϿ�
set /p windowsupdate=�����ϼ��� : 
if %windowsupdate% == 1 (goto selectstartprogram)
if %windowsupdate% == 2 (goto selectstartprogram)
if %windowsupdate% == �� (goto selectstartprogram)
if %windowsupdate% == �ƴϿ� (goto selectstartprogram)
if %windowsupdate% == no (goto selectstartprogram)
if %windowsupdate% == yes (goto selectstartprogram)
goto selectdwinupdate
:selectstartprogram
cls
echo.
echo. ���۸޴�-�������α׷� ���� ������� ��(��) �����ұ��^?
echo.
echo. 1. ��
echo. 2. �ƴϿ�
set /p dstartprogram=�����ϼ��� : 
if %dstartprogram% == 1 (goto main)
if %dstartprogram% == 2 (goto main)
if %dstartprogram% == �� (goto main)
if %dstartprogram% == �ƴϿ� (goto main)
if %dstartprogram% == no (goto main)
if %dstartprogram% == yes (goto main)
goto selectstartprogram


:main

:afile
::�ӽ����� ����
cls
echo.
echo.---------------------------  START  --------------------------------
echo.
if %afile% == 2 (goto dprosess)
if %afile% == �ƴϿ� (goto dprosess)
if %afile% == no (goto dprosess)
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �ӽ����� �� ������ ĳ�� ���ſ� ���� �����ϼ̽��ϴ�.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo ���ͳ� ������ ĳ�û���>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. ���ͳ� ������ ĳ�û���
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Google Chrome ������ ĳ�� ������. . . >>%SYSTEMDRIVE%\%zc%_log\%log%
title Google Chrome ������ ĳ�� ������. . .
echo. Google Chrome ������ ĳ�� ������. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data" (goto nochrome)
set ChromeDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data >Nul 2>Nul
del /q /s /f "%ChromeDir%" >Nul 2>Nul
rd /s /q "%ChromeDir%" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo.
echo. �Ϸ�^^!
goto firefox
:nochrome
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Google Chrome �������� �������� �ʽ��ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Google Chrome �������� �������� �ʽ��ϴ�^^!
timeout/t 1 /nobreak>nul
goto firefox


:firefox
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Mozilla Firefox ������ ĳ�û�����. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Mozilla Firefox ������ ĳ�û�����. . .
title Mozilla Firefox ������ ĳ�û�����. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles" (goto nofirefox)
set DataDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles >Nul 2>Nul
del /q /s /f "%DataDir%" >Nul 2>Nul
rd /s /q "%DataDir%" >Nul 2>Nul
for /d %%x in (%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 1 /nobreak>nul
goto opera
:nofirefox
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Mozilla Firefox �������� �������� �ʽ��ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Mozilla Firefox �������� �������� �ʽ��ϴ�^^!
timeout/t 1 /nobreak>nul
:opera
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Opera ������ ĳ�û�����. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Opera ������ ĳ�û�����. . .
title Opera ������ ĳ�û�����. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Opera\Opera" (goto noopera)
set DataDir=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Local\Opera\Opera >Nul 2>Nul
set DataDir2=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Opera\Opera >Nul 2>Nul
del /q /s /f "%DataDir%" >Nul 2>Nul
rd /s /q "%DataDir%" >Nul 2>Nul
del /q /s /f "%DataDir2%" >Nul 2>Nul
rd /s /q "%DataDir2%" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 1 /nobreak>nul
goto safari
:noopera
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Opera �������� �������� �ʽ��ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Opera �������� �������� �ʽ��ϴ�^^!
timeout/t 1 /nobreak>nul
:safari
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Apple Safari ������ ĳ�û�����. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Apple Safari ������ ĳ�û�����. . .
title Apple Safari ������ ĳ�û�����. . .
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
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 1 /nobreak>nul
goto ie
:nosafari
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Apple Safari �������� �������� �ʽ��ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Apple Safari �������� �������� �ʽ��ϴ�^^!
timeout/t 1 /nobreak>nul
:ie
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Microsoft Internet Explorer ������ ĳ�û�����. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Microsoft Internet Explorer ������ ĳ�û�����. . .
title Microsoft Internet Explorer ������ ĳ�û�����. . .
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
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 1 /nobreak>nul
goto flash
:noie
echo. 
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo Microsoft Internet Explorer �������� �������� �ʽ��ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Microsoft Internet Explorer �������� �������� �ʽ��ϴ�^^!
timeout/t 1 /nobreak>nul
:flash
echo. 
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo Flash Player ĳ�û�����. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Flash Player ĳ�û�����. . .
title Flash Player ĳ�û�����. . .
if not exist "%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1" (goto noflashplayer)
set FlashCookies=%SYSTEMDRIVE%\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1 >Nul 2>Nul
del /q /s /f "%FlashCookies%" >Nul 2>Nul
rd /s /q "%FlashCookies%" >Nul 2>Nul
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo ������ ĳ�� ���� �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
timeout/t 1 /nobreak>nul
goto dd
:noflashplayer
echo. 
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Flash Player ��(��) �������� �ʽ��ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. Flash Player ��(��) �������� �ʽ��ϴ�^^!
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo ������ ĳ�� ���� �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
timeout/t 1 /nobreak>nul
:dd
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo �ӽ����� ������. . .^(���� �ɸ��� �ֽ��ϴ�^)>>%SYSTEMDRIVE%\%zc%_log\%log%
title �ӽ����� ������. . .^(���� �ɸ��� �ֽ��ϴ�^)
echo. 
echo. �ӽ����� ������. . .^(���� �ɸ��� �ֽ��ϴ�^)

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

::DNS ĳ������
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
del /f /s /q ��%userprofile%\Local Settings\Temporary Internet Files\*.*�� >Nul 2>Nul
del /f /s /q ��%userprofile%\Local Settings\Temp\*.*�� >Nul 2>Nul
del /f /s /q ��%userprofile%\recent\*.*�� >Nul 2>Nul
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
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 2 /nobreak>nul
goto dprosess

::�ʿ���� ���μ����� ����
:dprosess

if %dprosess% == 2 (goto trash)
if %dprosess% == �ƴϿ� (goto trash)
if %dprosess% == no (goto trash)
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �ʿ���� ���μ����� ���� ���ῡ ���� �����ϼ̽��ϴ�.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo �ʿ���� ���μ����� ���񽺸� ������. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.
echo.--------------------------------------------------------------------
title �ʿ���� ���μ����� ���񽺸� ������. . .
echo. 
echo. �ʿ���� ���μ����� ���񽺸� ������. . .

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
	

::���񽺿� STOP ��û�� �����ϴ�.
sc stop "ApplicationSpecialManagement" >Nul 2>Nul
sc stop "TUCtlSystem" >Nul 2>Nul
sc stop "Image Protection" >Nul 2>Nul
sc stop "WebClient" >Nul 2>Nul
sc stop "IMGSF50_Svc" >Nul 2>Nul
sc stop "Innosvc7" >Nul 2>Nul
sc stop "Innosvc" >Nul 2>Nul
sc stop "I3GMainSvc" >Nul 2>Nul
sc stop "npggsvc" >Nul 2>Nul

::���񽺸� ������Ʈ������ �����մϴ�.
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
echo �ʿ���� ���񽺸� �����Ͽ����ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �ʿ���� ���μ����� �����Ͽ����ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. �ʿ���� ���񽺸� �����Ͽ����ϴ�^^!
echo.
echo. �ʿ���� ���μ����� �����Ͽ����ϴ�^^!
timeout/t 2 /nobreak>nul
goto trash

::$RECYCLE.BIN ���� ����
:trash

if %trash% == 2 (goto wineventlog)
if %trash% == �ƴϿ� (goto wineventlog)
if %trash% == no (goto wineventlog)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �������� ���µ��� �����ϼ̽��ϴ�.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo $RECYCLE.BIN ����(������) ���� ��. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
title $RECYCLE.BIN ����(������) ���� ��. . .
echo. $RECYCLE.BIN ����(������) ���� ��. . .
for %%a in (c d e f g h i j k L m n o p q r s t u v w x y z) do (
if exist %%a:\$RECYCLE.BIN for /f "tokens=* usebackq" %%b in (`"dir /a:d/b %%a:\$RECYCLE.BIN\"`) do rd /q/s "%%a:\$RECYCLE.BIN\%%~b"
if exist %%a:\RECYCLER for /f "tokens=* usebackq" %%b in (`"dir /a:d/b %%a:\RECYCLER\"`) do rd /q/s "%%a:\RECYCLER\%%~b"
)
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 2 /nobreak>nul
goto wineventlog

::Windows �̺�Ʈ�α� ����
:wineventlog

if %windowslog% == 2 (goto windowsupdate)
if %windowslog% == �ƴϿ� (goto windowsupdate)
if %windowslog% == no (goto windowsupdate)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Windows �̺�Ʈ�α� �����ϴµ��� �����ϼ̽��ϴ�.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo Windows �̺�Ʈ�α� ������. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
title Windows �̺�Ʈ�α� ������. . .
echo. Windows �̺�Ʈ�α� ������. . .
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) do (
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo ������ Windows �̺�Ʈ �αװ� �����ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title ������ Windows �̺�Ʈ �αװ� �����ϴ�^^!
echo. 
echo. ������ Windows �̺�Ʈ �αװ� �����ϴ�^^!
timeout/t 1 /nobreak>nul
goto windowsupdate
)
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
:do_clear
title �α�������. . . %1
echo  Windows �̺�Ʈ�α� ���� - %1 >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. �α�������. . .
wevtutil.exe cl %1
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 2 /nobreak>nul
goto windowsupdate

::�ʿ���� ������ ������Ʈ ����

:windowsupdate

if %windowsupdate% == 2 (goto startprogram)
if %windowsupdate% == �ƴϿ� (goto startprogram)
if %windowsupdate% == no (goto startprogram)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo �ʿ���� ������ ������Ʈ�� �����ϴµ��� �����ϼ̽��ϴ�.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo �ʿ���� ������ ������Ʈ ������. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
title �ʿ���� ������ ������Ʈ ������. . .
echo. �ʿ���� ������ ������Ʈ ������. . .

::��������
wusa /uninstall /quiet /norestart /KB:298279 
if not "%ERRORLEVEL%" == "0" (
goto kb949810
)
echo. ���� - KB298279
echo ���� - KB298279>>%SYSTEMDRIVE%\%zc%_log\%log%
::Office ��ǰ �˸�
:kb949810
wusa /uninstall /quiet /norestart /KB:949810 
if not "%ERRORLEVEL%" == "0" (
goto kb971033
)
echo. ���� - KB949810
echo ���� - KB949810>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows7 ��ǰ �˸�
:kb971033
wusa /uninstall /quiet /norestart /KB:971033 
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb976902
)
echo. ���� - KB971033
echo ���� - KB971033>>%SYSTEMDRIVE%\%zc%_log\%log%
::��������
:kb976902
wusa /uninstall /quiet /norestart /KB:976902
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2718704
)
echo. ���� - KB976902
echo ���� - KB976902>>%SYSTEMDRIVE%\%zc%_log\%log%

::��������
:kb2718704
wusa /uninstall /quiet /norestart /KB:2718704
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2803821
)
echo. ���� - KB2718704
echo ���� - KB2718704>>%SYSTEMDRIVE%\%zc%_log\%log%
::�׷��� ���丷���� ������ ��
:kb2803821
wusa /uninstall /quiet /norestart /KB:2803821
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2868038
)
echo. ���� - KB2803821
echo ���� - KB2803821>>%SYSTEMDRIVE%\%zc%_log\%log%
::���ʿ��� ������Ʈ
:kb2868038
wusa /uninstall /quiet /norestart /KB:2868038
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2868626
)
echo. ���� - KB2868038
echo ���� - KB2868038>>%SYSTEMDRIVE%\%zc%_log\%log%

::���ʿ��� ������Ʈ
:kb2868626
wusa /uninstall /quiet /norestart /KB:2868626
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2952664
)
echo. ���� - KB2868626 - ���� : ���ʿ��� ������Ʈ
echo ���� - KB2868626 - ���� : ���ʿ��� ������Ʈ>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 ���׷��̵� ����
:kb2952664
wusa /uninstall /quiet /norestart /KB:2952664 
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2970228
)
echo. ���� - KB2952664 - ���� : Windows10 ���׷��̵� ����
echo ���� - KB2952664 - ���� : Windows10 ���׷��̵� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::���ȭ ȭ�� ǥ�� �� ��ȣ
:kb2970228
wusa /uninstall /quiet /norestart /KB:2970228
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2975331
)
echo. ���� - KB2970228 - ���� : ���ȭ ȭ�� ǥ�� �� ��ȣ
echo ���� - KB2970228 - ���� : ���ȭ ȭ�� ǥ�� �� ��ȣ>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows RT, Windows 8, Windows ���� 2012�� 2014�� 8�� �Ѿ�
:kb2975331
wusa /uninstall /quiet /norestart /KB:2975331
if NOT "%ERRORLEVEL%" == "0" (
GOTO kb2975719
)
echo. ���� - KB2975331 - ���� : Windows RT, Windows 8, Windows ���� 2012�� 2014�� 8�� �Ѿ�
echo ���� - KB2975331 - ���� : Windows RT, Windows 8, Windows ���� 2012�� 2014�� 8�� �Ѿ�>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows RT 8.1, Windows ���� 2012 R2�� 2014�� 8�� �Ѿ�
:kb2975719
wusa /uninstall /quiet /norestart /KB:2975719 
if not "%ERRORLEVEL%" == "0" (
goto kb2976897
)
echo. ���� - KB2975719 - ���� : Windows RT 8.1, Windows ���� 2012 R2�� 2014�� 8�� �Ѿ�
echo ���� - KB2975719 - ���� : Windows RT 8.1, Windows ���� 2012 R2�� 2014�� 8�� �Ѿ�>>%SYSTEMDRIVE%\%zc%_log\%log%
::�Ǽ� ������Ʈ
:kb2976897
wusa /uninstall /quiet /norestart /KB:2976897 
if not "%ERRORLEVEL%" == "0" (
goto kb2982791
)
echo. ���� - KB2976897 - ���� : �Ǽ� ������Ʈ
echo ���� - KB2976897 - ���� : �Ǽ� ������Ʈ>>%SYSTEMDRIVE%\%zc%_log\%log%
::��罺ũ�� ����
:kb2982791
wusa /uninstall /quiet /norestart /KB:2982791 
if not "%ERRORLEVEL%" == "0" (
goto kb2984615
)
echo. ���� - KB2982791 - ���� : ��罺ũ�� ����
echo ���� - KB2982791 - ���� : ��罺ũ�� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::�Ǽ� ������Ʈ
:kb2984615
wusa /uninstall /quiet /norestart /KB:2984615 
if not "%ERRORLEVEL%" == "0" (
goto kb3021917
)
echo. ���� - KB2984615 - ���� : �Ǽ� ������Ʈ
echo ���� - KB2984615 - ���� : �Ǽ� ������Ʈ>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 ���׷��̵� �˸�
:kb3021917
wusa /uninstall /quiet /norestart /KB:3021917 
if not "%ERRORLEVEL%" == "0" (
goto kb3022345
)
echo. ���� - KB3021917 - ���� : Windows10 ���׷��̵� �˸�
echo ���� - KB3021917 - ���� : Windows10 ���׷��̵� �˸�>>%SYSTEMDRIVE%\%zc%_log\%log%
::���� ���� ����
:kb3022345
wusa /uninstall /quiet /norestart /KB:3022345 
if not "%ERRORLEVEL%" == "0" (
goto kb3035583
)
echo. ���� - KB3022345 - ���� : ���� ���� ����
echo ���� - KB3022345 - ���� : ���� ���� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 ���׷��̵� �˸�
:kb3035583
wusa /uninstall /quiet /norestart /KB:3035583 
if not "%ERRORLEVEL%" == "0" (
goto kb3068708
)
echo. ���� - KB3035583 - ���� : Windows10 ���׷��̵� �˸�
echo ���� - KB3035583 - ���� : Windows10 ���׷��̵� �˸�>>%SYSTEMDRIVE%\%zc%_log\%log%
::KB3022345���. ����� ����, ��Ȳ, ���� ����
:kb3068708
wusa /uninstall /quiet /norestart /KB:3068708 
if not "%ERRORLEVEL%" == "0" (
goto kb3075249
)
echo. ���� - KB3068708 - ���� : KB3022345���. ����� ����, ��Ȳ, ���� ����
echo ���� - KB3068708 - ���� : KB3022345���. ����� ����, ��Ȳ, ���� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::����� ���� ���� ����
:kb3075249
wusa /uninstall /quiet /norestart /KB:3075249 
if not "%ERRORLEVEL%" == "0" (
goto kb3080149
)
echo. ���� - KB3075249 - ���� : ����� ���� ���� ����
echo ���� - KB3075249 - ���� : ����� ���� ���� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::����� ����, ��Ȳ, ���� ����
:kb3080149
wusa /uninstall /quiet /norestart /KB:3080149 
if not "%ERRORLEVEL%" == "0" (
goto kb3097877
)
echo. ���� - KB3080149 - ���� : ����� ����, ��Ȳ, ���� ����
echo ���� - KB3080149 - ���� : ����� ����, ��Ȳ, ���� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows7 ��ǰ �˸�
:kb3097877
wusa /uninstall /quiet /norestart /KB:3097877 
if not "%ERRORLEVEL%" == "0" (
goto kb3101746
)
echo. ���� - KB3097877 - ���� : Windows7 ��ǰ �˸�
echo ���� - KB3097877 - ���� : Windows7 ��ǰ �˸�>>%SYSTEMDRIVE%\%zc%_log\%log%
::���ʿ��� ������Ʈ
:kb3101746
wusa /uninstall /quiet /norestart /KB:3101746 
if not "%ERRORLEVEL%" == "0" (
goto kb3109094
)
echo. ���� - KB3101746 - ���� : ���ʿ��� ������Ʈ
echo ���� - KB3101746 - ���� : ���ʿ��� ������Ʈ>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows7 ��ǰ �˸�
:kb3109094
wusa /uninstall /quiet /norestart /KB:3109094
if not "%ERRORLEVEL%" == "0" (
goto kb3112343
)
echo. ���� - KB3109094 - ���� : Windows7 ��ǰ �˸�
echo ���� - KB3109094 - ���� : Windows7 ��ǰ �˸�>>%SYSTEMDRIVE%\%zc%_log\%log%
::���� ����
:kb3112343
wusa /uninstall /quiet /norestart /KB:3112343 
if not "%ERRORLEVEL%" == "0" (
goto kb3150513
)
echo. ���� - KB3112343 - ���� : ���� ����
echo ���� - KB3112343 - ���� : ���� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows10 ���׷��̵� �˸�2
:kb3150513
wusa /uninstall /quiet /norestart /KB:3150513 
if not "%ERRORLEVEL%" == "0" (
goto kb4012219
)
echo. ���� - KB3150513 - ���� : Windows10 ���׷��̵� �˸�2
echo ���� - KB3150513 - ���� : Windows10 ���׷��̵� �˸�2>>%SYSTEMDRIVE%\%zc%_log\%log%
::���� ����
:kb4012219
wusa /uninstall /quiet /norestart /KB:4012219 
if not "%ERRORLEVEL%" == "0" (
goto kb4012218
)
echo. ���� - KB4012219 - ���� : ���� ����
echo ���� - KB4012219 - ���� : ���� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::���� ����
:kb4012218
wusa /uninstall /quiet /norestart /KB:4012218 
if not "%ERRORLEVEL%" == "0" (
goto kb3170735
)
echo. ���� - KB4012218 - ���� : ���� ����
echo ���� - KB4012218 - ���� : ���� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows 10 ���׷��̵� ����
:kb3170735
wusa /uninstall /quiet /norestart /KB:3170735
if not "%ERRORLEVEL%" == "0" (
goto kb3173040
)
echo. ���� - KB3170735 - ���� : Windows 10 ���׷��̵� ����
echo ���� - KB3170735 - ���� : Windows 10 ���׷��̵� ����>>%SYSTEMDRIVE%\%zc%_log\%log%
::Windows 10 ���׷��̵� �˸�-����� ��üȭ������
:kb3173040
wusa /uninstall /quiet /norestart /KB:3173040 
if not "%ERRORLEVEL%" == "0" (
goto kb915597
)
echo. ���� - KB3173040 - ���� : Windows 10 ���׷��̵� �˸�-����� ��üȭ������
echo ���� - KB3173040 - ���� : Windows 10 ���׷��̵� �˸�-����� ��üȭ������>>%SYSTEMDRIVE%\%zc%_log\%log%
::������ ����� ������Ʈ
:kb915597
wusa /uninstall /quiet /norestart /KB:915597 
if not "%ERRORLEVEL%" == "0" (
goto kb4056892
)
echo. ���� - KB915597 - ���� : ������ ����� ������Ʈ
echo ���� - KB915597 - ���� : ������ ����� ������Ʈ>>%SYSTEMDRIVE%\%zc%_log\%log%
::����������� ������ ������, ��Ʈ�ٿ� ��ġ
:kb4056892
wusa /uninstall /quiet /norestart /KB:4056892
if not "%ERRORLEVEL%" == "0" (
goto kb4056891
)
echo. ���� - KB4056892 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ
echo ���� - KB4056892 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056891
wusa /uninstall /quiet /norestart /KB:4056891
if not "%ERRORLEVEL%" == "0" (
goto kb4056890
)
echo. ���� - KB4056891 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ
echo ���� - KB4056891 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056890
wusa /uninstall /quiet /norestart /KB:4056890
if not "%ERRORLEVEL%" == "0" (
goto kb4056898
)
echo. ���� - KB4056890 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ
echo ���� - KB4056890 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056898
wusa /uninstall /quiet /norestart /KB:4056898
if not "%ERRORLEVEL%" == "0" (
goto kb4056897
)
echo. ���� - KB4056898 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ
echo ���� - KB4056898 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ>>%SYSTEMDRIVE%\%zc%_log\%log%
:kb4056897
wusa /uninstall /quiet /norestart /KB:4056897
if not "%ERRORLEVEL%" == "0" (
goto kbfinish
)
echo. ���� - KB4056897 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ
echo ���� - KB4056897 - ���� : ����������� ������ ������, ��Ʈ�ٿ� ��ġ>>%SYSTEMDRIVE%\%zc%_log\%log%
:kbfinish
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
timeout/t 2 /nobreak>nul
goto startprogram

::�������α׷� ����
:startprogram

if %dstartprogram% == 2 (goto finish)
if %dstartprogram% == �ƴϿ� (goto finish)
if %dstartprogram% == no (goto finish)
echo.
echo.--------------------------------------------------------------------
echo.
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo ���۸޴�-�������α׷� ���� ��������� �����ϴµ��� �����ϼ̽��ϴ�.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo. >>%SYSTEMDRIVE%\%zc%_log\%log%
echo ���۸޴�-�������α׷� ���� ������� ������. . .>>%SYSTEMDRIVE%\%zc%_log\%log%
title ���۸޴�-�������α׷� ���� ������� ������. . .
echo. 
echo. ���۸޴�-�������α׷� ���� ������� ������. . .
del "%allusersprofile%\Microsoft\Windows\Start Menu\Programs\StartUp" /f /q >Nul 2>Nul
del "%appdata%\Microsoft\Windows\Start Menu\Programs\StartUp" /f /q >Nul 2>Nul
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo �Ϸ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
title �Ϸ�^^!
echo. 
echo. �Ϸ�^^!
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
system\MESSAGEBOX\MESSAGEBOX.EXE /C:%zc% ������ ���� Ȯ��^^! /T:4132 /M:%zc%�� ������ �������� ������� �ʾҽ��ϴ�^^!\n%zc%������ ������ �������� �����Ͽ� �ּ���^^!\n������ ������ �־����� ���� ��� ���α׷� ���۵��� �Ͼ �� �ֽ��ϴ�.\n�� Ű�� �����ø� %zc%�� �����ڱ������� ���۵˴ϴ�.\n�ƴϿ� Ű�� �����ø� %zc%�� ����˴ϴ�.
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
title %zc% ��(��) �����ϰ� �����ƽ��ϴ�^^!
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo ------------------------------  FINISH  ---------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% ���� >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% ���ᳯ¥ : %date% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% ����ð� : %time% >>%SYSTEMDRIVE%\%zc%_log\%log%
echo -------------------------------------------------------------------- >>%SYSTEMDRIVE%\%zc%_log\%log%
echo.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% ��(��) �����ϰ� �����ƽ��ϴ�^^! >>%SYSTEMDRIVE%\%zc%_log\%log%
echo %zc% ������ ������� �����մϴ�.>>%SYSTEMDRIVE%\%zc%_log\%log%
echo.
echo. %zc% ���ᳯ¥ : %date%
echo. %zc% ����ð� : %time%
echo.
echo. %zc% ��(��) �����ϰ� �����ƽ��ϴ�^^!
echo. %zc% ������ ������� �����մϴ�^^!
echo.
echo. ENTERŰ�� �����ø� ���α׷��� ����˴ϴ�.
start %SYSTEMDRIVE%\%zc%_log\%log%
pause>nul
system\TASKS\TASKKILL.EXE /F /IM "CMD.EXE" >Nul 2>Nul
:off
cls
title ���α׷� ����.
echo. 
echo. ENTERŰ�� �����ø� ���α׷��� ����˴ϴ�.
echo. 
pause>nul
system\TASKS\TASKKILL.EXE /F /IM "CMD.EXE" >Nul 2>Nul