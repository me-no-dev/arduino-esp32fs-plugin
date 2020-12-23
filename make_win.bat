cd %~dp0\src
set PATH=your\java\bin;%PATH%
set ALP=your\arduino\lib
IF EXIST bin GOTO NODIR
mkdir bin
:NODIR
del bin\*.jar
rd /S /Q bin\com
javac.exe -target 1.8 -cp ".;%ALP%\arduino-core.jar;%ALP%\commons-codec-1.7.jar;%ALP%\pde.jar" -d bin ESP32FS.java
cd bin
jar.exe cvfM esp32fs.jar *
pause
