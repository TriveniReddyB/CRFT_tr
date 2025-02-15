@echo off
echo Running robot tests calling batch script...een ogenblik geduld!!!

@REM [Optional: Automate Cleanup: You can schedule it using Windows Task Scheduler to run daily.
@REM Or add it at the start of your test execution batch file] thus below command will first clean old reports, then execute new tests.
@REM call cleanup_reports.bat

:: Approach 1
REM Run Robot Framework tests.Create a folder named "results" if it does not exist. if not exist results mkdir results
@REM robot --outputdir ./reports src/sampletest.robot

:: Approach 2 [current in use]
REM This setup is perfect for maintaining a history of reports while keeping everything organized. Now, you can easily track changes and compare results across different test runs.
set "timestamp=%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
robot --outputdir ./reports --output output_%timestamp%.xml --report report_%timestamp%.html --log log_%timestamp%.html src/sampletest.robot

:: Approach 3:
:: or REM or @REM or ctrl + / for standard commenting to ensure compatibility across all Windows versions.
@REM @echo off
@REM set "timestamp=%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
@REM robot --outputdir "./reports /results_%timestamp%" src/sampletest.robot
:: results folder name looks like **** results_20250213_142530

:: End of script