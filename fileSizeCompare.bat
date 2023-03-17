@echo off

REM This script prints a list of file names in a directory and all contained subdirectories which have identical file sizes to other files in those directories/subdirectories
REM This is accomplished by first grouping all file names by size and then showing groups that have more than one element
REM Run this for comma separation: set "size[%%~Za]=!size[%%~Za]!,%%~Fa"
REM Run this for space separation: set "size[%%~Za]=!size[%%~Za]!, "%%~Fa""

setlocal EnableDelayedExpansion

for /R %%a in (*.*) do (
   set "size[%%~Za]=!size[%%~Za]!|   "%%~Fa"   "
)

for /F "tokens=2,3* delims=[]=|" %%a in ('set size[') do (
   if "%%c" neq "" echo [%%a]: && echo %%b^|%%c && echo.
)

PAUSE
