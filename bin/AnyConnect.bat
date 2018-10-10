@echo off
:: AnyConnect.bat
:: Turns the vpnagent service on or off. 
:: After turning on, will attempt to start up vpnui from default location.

set serv=vpnagent
set ui="C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe"

IF [%1] EQU [] goto user
:arg
set op=%~1
goto operation

:user
set /p op="on/OFF? "

:operation
if "%op%"=="on" goto start
if "%op%"=="ON" goto start
if "%op%"=="oN" goto start
if "%op%"=="On" goto start

:stop
echo stopping service
net stop %serv%
goto end

:start
echo starting service
net start %serv%
:: pause
echo starting UI
start "vpnui" %ui%
goto end

:end
:: clear out operation
set op=""
echo goodbye
:: pause