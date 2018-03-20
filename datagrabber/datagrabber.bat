@echo off
rem script to robocopy src to destination, then copy the new/modified only to a 3rd location
echo Running Datagrabber

rem source folders for robocopy
set source="src"
rem destination folder for mirroring
set destin="dest"
rem process folder for just the changes
set target="process"

rem logfile names
set sourcelogfile=log-from-robocopy.log
set destinlogfile=log-just-files.log

rem clear the change log file
break>%destinlogfile%

rem robocopy command to output files copied
robocopy %source% %destin% /FFT /COPY:DAT /MIR /LOG:"%sourcelogfile%" /NP /NS /NC /NDL /TEE /NJH /NJS

rem for loop through robocopy output and strip it down to just file names into new logfile
for /f "tokens=*" %%i in (%sourcelogfile%) do (
    echo %%i >> %destinlogfile%
)

rem loop the logfile and copy the files that were changed keeping path structure
for /f "usebackq delims=" %%a in (%destinlogfile%) do (
    rem copy just the changed files to target keeping dir structure
    md "%target%%%~pa" 2>nul
    copy /y "%%a" "%target%%%~pa"
)

rem end of code