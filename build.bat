@ECHO OFF

cd app
call npm install
cd ..\

REM validate if is downloaded nodebob, else clone it
if not exist "nodebob" call git clone https://github.com/geo8bit/nodebob.git nodebob

REM  delete all nodebob\app\ files
RMDIR "nodebob\app" /S /Q

REM move all app files and folders to nodebob\app
xcopy app nodebob\app\ /E

REM build the nw app
cd nodebob
call build.bat

REM run the app!
release\nw.exe
cd ..\
PAUSE