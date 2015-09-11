@echo Executing psake build with default.ps1 configuration
@echo off


powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dp0\src\packages\psake.4.4.2\tools\psake.ps1' %* -parameters @{"packageVersion"="'%2'"}; if ($psake.build_success -eq $false) { write-host "Build Failed!" -fore RED; exit 1 } else { exit 0 }" <nul