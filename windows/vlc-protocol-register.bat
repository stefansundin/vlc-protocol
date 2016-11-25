@echo off
@echo.
if not exist "%~dp0vlc.exe" (
  echo Warning: Can't find vlc.exe.
  echo Please put these files in your VLC directory and then run this file.
  @echo.
  pause
  exit /b
)
echo If you see "ERROR: Access is denied." then you need to right click and use "Run as Administrator".
@echo.
echo Associating vlc:// with vlc-protocol.bat...

reg add HKCR\vlc /ve /t REG_SZ /d "URL:vlc Protocol" /f
reg add HKCR\vlc /v "URL Protocol" /t REG_SZ /d "" /f
reg add HKCR\vlc\DefaultIcon /ve /t REG_SZ /d "%~dp0vlc.exe,0" /f
reg add HKCR\vlc\shell\open\command /ve /t REG_SZ /d "\"%~dp0vlc-protocol.bat\" \"%%1\"" /f

@echo.
pause
