:::::::::::::::::::::::::::
::adb manager            ::
::Made by Baikil         ::
::v1.2                   ::
:::::::::::::::::::::::::::
:0
call :ini
title adb manager // menu
mode 69, 16
%logo%
echo.
echo [38;5;84m//[0madbm[38;5;84m//[0m
echo.
echo [38;5;15m1.[0m apk installer
echo [38;5;15m2.[0m enable apk via adb
choice /cs /c 12C /n
goto :%errorlevel%
:1
title adb manager // apk installer
%logo%
echo.
echo [38;5;84m//[0mapk installer[38;5;84m//[0m
echo.
echo [38;5;15m1.[0m Shizuku
echo [38;5;15m2.[0m DarQ (Require Shizuku)
echo [38;5;15m3.[0m Button Mapper
echo.
echo [38;5;15m4.[0m Back
choice /c 1234 /n
call :1%errorlevel%
goto 0
:11
if not exist Shizuku.apk powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/baikil/adbmanager/raw/main/Shizuku.apk','%_cd%\Shizuku.apk')"
adb install -r Shizuku.apk
exit /b
:12
if not exist DarQ.apk powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/baikil/adbmanager/raw/main/DarQ.apk','%_cd%\DarQ.apk')"
adb install -r DarQ.apk
exit /b
:13
if not exist ButtonMapper.apk powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/baikil/adbmanager/raw/main/ButtonMapper.apk','%_cd%\ButtonManager.apk')"
adb install -r ButtonMapper.apk
exit /b
:14
exit /b
:2
title adb manager // adb enabler
%logo%
echo.
echo [38;5;84m//[0madb enabler[38;5;84m//[0m
echo.
echo [38;5;15m1.[0m Shizuku
echo [38;5;15m2.[0m Button Mapper
echo.
echo [38;5;15m3.[0m Back
choice /c 123 /n
call :2%errorlevel%
goto 0
:21
adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
exit /b
:22
adb shell sh /data/data/flar2.homebutton/logcat.sh
adb shell pm grant flar2.homebutton android.permission.WRITE_SECURE_SETTINGS
exit /b
:23
exit /b
:3
:31
title adb manager // adb custom command
%logo%
echo.
echo [0m//[38;5;84madb custom command[0m//
echo.
set /p "adbcommand=adb "
adb %adbcommand%
echo _____________________
echo [38;5;15m1.[0m adb custom command
echo [38;5;15m2.[0m Menu
choice /c 12 /n
goto 3%errorlevel%
:32
goto 0
::::::::::::::::::::
::Custom functions::
::::::::::::::::::::
:ini
@echo off
set "_cd=%cd%"
call :logo
exit /b
:logo
::https://patorjk.com/software/taag/#p=display&f=Broadway%20KB&t=adb%20manager::
set "logo1=echo [38;5;84m  __   ^ _^__  ^ _^__      [0m^ _^   ^    __   ^ _^   ^    __    __^   ^ _^___ ^ _^__  "
set "logo2=echo [38;5;84m / /\  ^| ^| \ ^| ^|_)     [0m^| ^|\/^|  / /\  ^| ^|\ ^|  / /\  / /^`_ ^| ^|_  ^| ^|_) "
set "logo3=echo [38;5;84m/_/--\ ^|_^|_/ ^|_^|_)     [0m^|_^|  ^| /_/--\ ^|_^| \^| /_/--\ \_\^_/ ^|_^|__ ^|_^| \ "
set "logo4=echo [38;5;8madb manager v1.2 [Offline][0m"
set "logo=cls&%logo1%&%logo2%&%logo3%&%logo4%"
exit /b