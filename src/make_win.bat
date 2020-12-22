del bin\*.jar
rd /S /Q bin\com
javac.exe -target 1.8 -cp ".;arduino-core.jar;commons-codec-1.7.jar;pde.jar" -d bin ESP32FS.java
cd bin
jar.exe cvfM esp32fs.jar *
pause
