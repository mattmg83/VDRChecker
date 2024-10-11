@echo off
setlocal enabledelayedexpansion

echo File Integrity Checker
echo ----------------------

:prompt
set /p choice="Do you want to check the current directory or specify a different path? (C/S): "
if /i "%choice%"=="C" goto current
if /i "%choice%"=="S" goto specify
echo Invalid choice. Please enter C or S.
goto prompt

:specify
set /p customPath="Enter the full path of the directory to check: "
if not exist "%customPath%" (
    echo The specified path does not exist. Please try again.
    goto specify
)
cd /d "%customPath%"

:current
echo.
echo Checking files in: %CD%

set totalFiles=0
set corruptFiles=0
set blankFiles=0

set logFile=FileIntegrityCheck_%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt
set logFile=%logFile: =0%

(
echo Summary:
echo Total files checked: 0
echo Corrupt files: 0
echo Blank files: 0
echo Healthy files: 0
echo.
echo Corrupt Files:
echo.
echo Blank Files:
echo.
echo Detailed Log:
) > "%logFile%"

for /r %%F in (*) do (
    set /a totalFiles+=1
    set "file=%%F"
    
    REM Check if file is empty
    for %%A in ("!file!") do set size=%%~zA
    if !size! equ 0 (
        echo Blank file: !file!
        echo Blank file: !file! >> "%logFile%"
        set /a blankFiles+=1
    ) else (
        REM Try to read the file content
        type "!file!" >nul 2>&1
        if !errorlevel! neq 0 (
            echo Corrupt file: !file!
            echo Corrupt file: !file! >> "%logFile%"
            set /a corruptFiles+=1
        ) else (
            echo OK: !file!
            echo OK: !file! >> "%logFile%"
        )
    )
)

set /a healthyFiles=totalFiles-corruptFiles-blankFiles

(
echo Summary:
echo Total files checked: %totalFiles%
echo Corrupt files: %corruptFiles%
echo Blank files: %blankFiles%
echo Healthy files: %healthyFiles%
echo.
echo Corrupt Files:
findstr /C:"Corrupt file:" "%logFile%"
echo.
echo Blank Files:
findstr /C:"Blank file:" "%logFile%"
echo.
echo Detailed Log:
) > temp.txt

type temp.txt "%logFile%" > newlog.txt
move /y newlog.txt "%logFile%" > nul
del temp.txt

echo.
echo Summary:
echo Total files checked: %totalFiles%
echo Corrupt files: %corruptFiles%
echo Blank files: %blankFiles%
echo Healthy files: %healthyFiles%

echo.
echo Full log has been saved to: %CD%\%logFile%

REM Open the log file
start "" "%logFile%"

echo.
echo The log file has been opened. Press any key to exit.
pause > nul
