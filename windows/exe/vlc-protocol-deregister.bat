@echo off
@echo.
echo If you see "ERROR: Access is denied." then you need to right click and use "Run as Administrator".
@echo.
echo Removing vlc:// association...

reg delete HKCR\vlc /f

@echo.
pause
