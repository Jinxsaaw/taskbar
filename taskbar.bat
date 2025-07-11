@REM kill taskbar and delete its catche then restart it

taskkill /f /im explorer.exe
del /f /s /q /a "%localappdata%\IconCache.db"
start explorer.exe

@REM re-register taskbar with shell

Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth

@REM then restart