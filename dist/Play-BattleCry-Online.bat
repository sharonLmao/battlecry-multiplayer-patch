@echo off
REM Battle Cry: Age of Myths - Multiplayer Patch launcher
REM Grants the local game permission to reach the internet (Flash local-trusted),
REM then launches it in the standalone Flash player.
set "HERE=%~dp0"
set "TRUSTDIR=%APPDATA%\Macromedia\Flash Player\#Security\FlashPlayerTrust"
if not exist "%TRUSTDIR%" mkdir "%TRUSTDIR%"
> "%TRUSTDIR%\battlecry.cfg" echo %HERE%
start "" "%HERE%flashplayer_sa.exe" "%HERE%battlecry_patched.swf"
