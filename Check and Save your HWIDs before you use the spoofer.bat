@echo off
TITLE HWID Checker
COLOR 0F
ECHO **********************************
ECHO *       HWID Checker Tool        *
ECHO **********************************
ECHO.

REM Check if running as admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    ECHO Warning: Run this script as Administrator for full HWID access.
    ECHO.
)

REM Define output file
set "outputFile=HWID_Output.txt"

REM Start capturing output
ECHO HWID Checker - Generated on %date% %time% > "%outputFile%"
ECHO ========================================== >> "%outputFile%"
ECHO. >> "%outputFile%"

:start
cls
ECHO Checking HWIDs... Results will be saved to %outputFile%
ECHO.

ECHO Disk Drives:
ECHO Disk Drives: >> "%outputFile%"
wmic diskdrive get model,serialnumber
wmic diskdrive get model,serialnumber >> "%outputFile%"
ECHO. >> "%outputFile%"

ECHO CPU:
ECHO CPU: >> "%outputFile%"
wmic cpu get serialnumber
wmic cpu get serialnumber >> "%outputFile%"
ECHO. >> "%outputFile%"

ECHO BIOS:
ECHO BIOS: >> "%outputFile%"
wmic bios get serialnumber
wmic bios get serialnumber >> "%outputFile%"
ECHO. >> "%outputFile%"

ECHO Motherboard:
ECHO Motherboard: >> "%outputFile%"
wmic baseboard get serialnumber
wmic baseboard get serialnumber >> "%outputFile%"
ECHO. >> "%outputFile%"

ECHO SMBIOS UUID:
ECHO SMBIOS UUID: >> "%outputFile%"
wmic path win32_computersystemproduct get uuid
wmic path win32_computersystemproduct get uuid >> "%outputFile%"
ECHO. >> "%outputFile%"

ECHO MAC Address:
ECHO MAC Address: >> "%outputFile%"
getmac
getmac >> "%outputFile%"
ECHO. >> "%outputFile%"

ECHO ========================================== >> "%outputFile%"
ECHO Press any key to check HWIDs again or CTRL+C to exit.
pause >nul
goto start
