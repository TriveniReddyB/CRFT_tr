@REM Here’s a batch script that will delete old Robot Framework reports while keeping the most recent ones based on a custom number of days.

@REM How It Works:
@REM You set DAYS_TO_KEEP=7 (or any number of days you prefer).
@REM It scans the reports folder and deletes files older than DAYS_TO_KEEP days.
@REM It applies cleanup only to output_*.xml, report_*.html, and log_*.html, keeping everything else intact.


@echo off
setlocal

:: Set the number of days to keep
set DAYS_TO_KEEP=7

:: Folder where reports are stored
set REPORTS_DIR=.\reports

:: Ensure the folder exists
if not exist "%REPORTS_DIR%" (
    echo Reports directory does not exist. Exiting...
    exit /b
)

:: Find and delete old files
forfiles /p "%REPORTS_DIR%" /s /m "output_*.xml" /d -%DAYS_TO_KEEP% /c "cmd /c del @path"
forfiles /p "%REPORTS_DIR%" /s /m "report_*.html" /d -%DAYS_TO_KEEP% /c "cmd /c del @path"
forfiles /p "%REPORTS_DIR%" /s /m "log_*.html" /d -%DAYS_TO_KEEP% /c "cmd /c del @path"

echo Cleanup completed. Kept last %DAYS_TO_KEEP% days of reports.

endlocal
