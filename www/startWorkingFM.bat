
set basedirD=D:\Develope\www\marudai\database

for /f "delims=;" %%A in ('dir /b /o-n %basedirD%\*.fmp12') do start "" "%basedirD%\%%A"

exit 

