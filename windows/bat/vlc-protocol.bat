Setlocal EnableDelayedExpansion
set url=%~1
set url=!url: =%%20!
start "VLC" "%~dp0vlc.exe" --open "%url:~6%"
