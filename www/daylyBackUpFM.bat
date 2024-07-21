
set basedirC=C:\Develope\www\marudai\database
set basedirD=D:\Develope\www\marudai\database

set destinationdirC=%basedirC%\fm_bak
set destinationdirD=%basedirD%\fm_bak

set today=%date%
set daydir=%today:~0,4%%today:~5,2%%today:~8,2%

set bakdirC=%destinationdirC%\%daydir%
set bakdirD=%destinationdirD%\%daydir%

mkdir %bakdirC%
mkdir %bakdirD%

xcopy /y %basedirC%\*.fmp12 %bakdirC%
xcopy /y %basedirD%\*.fmp12 %bakdirD%

for /f "delims=; skip=14" %%A in ('dir /b /ad /o-d %destinationdirC%') do rd /s /q "%destinationdirC%\%%A"
for /f "delims=; skip=14" %%A in ('dir /b /ad /o-d %destinationdirD%') do rd /s /q "%destinationdirD%\%%A"

exit

