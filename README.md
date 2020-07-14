# Arduino ESP32 filesystem uploader 

Arduino plugin which packs sketch data folder into SPIFFS, LITTLEFS or FATFS filesystem image,
and uploads the image to ESP32 flash memory.
</br> You can have only of three filesystems on given Arduino project.

## Notes for LITTLEFS

- Uses same partition scheme as SPIFFS. 
- See [LITTLEFS esp32 library](https://github.com/lorol/LITTLEFS)

## Notes for FatFS

- On Arduino IDE menu: *Tools > Partition Scheme* select one with FAT partition
- The usable size of FAT partition is reduced with 1 sector of 4096 bytes (0x1000) to resolve wear leveling space requirement. Also file is flashed with +4096 bytes (0x1000) offset of partition address csv table entry
- To flash the data folder as FAT partition by network port (uses espota), replace your esp32-core Update library with the [modified files here](https://github.com/lorol/arduino-esp32fatfs-plugin/tree/master/extra/esp32-modified-Update-lib-ffat-espota.zip)
- You may need to decrease **maxOpenFiles** at FFat.begin() of your sketch , [see this note](http://marc.merlins.org/perso/arduino/post_2019-03-30_Using-FatFS-FFat-on-ESP32-Flash-With-Arduino.html) 
>The FFAT module uses 8KB plus 4KB per concurrent file that can be opened. By default, it allows 10 files to be opened, which means it uses 48KB. IF you want to reduce its memory use, you can tell it to only support one file, and you will save 36KB, leaving you with only 12KB used.
```
if (!FFat.begin(0, "", 1)) die("Fat FS mount failed. Not enough RAM?");
```

## Installation

- Make sure you use one of the supported versions of Arduino IDE and have ESP32 core installed.
- Download the tool from [here](https://github.com/lorol/arduino-esp32fs-plugin/releases/download/2.0/esp32fs.zip)
- In your Arduino sketchbook directory, create tools directory if it doesn't exist yet.
- Unpack the tool into tools directory (the path will look like ```<home_dir>/Arduino/tools/ESP32FS/tool/esp32fs.jar```).
- For LITTLEFS, you need an additional [mklittlefs tool](https://github.com/earlephilhower/mklittlefs)  Download the [release](https://github.com/earlephilhower/mklittlefs/releases) or see below
- For FatFS, you need additional binary files for Windows and Linux (thanks @lbernstone for compiling) or take it from the author [here - mkfatfs tool](https://github.com/labplus-cn/mkfatfs/releases/tag/v1.0)  Thanks to [labplus-cn](https://github.com/labplus-cn/mkfatfs)
- Copy **mklittlefs[.exe]** and **mkfatfs[.exe]** to **/tools** folder of esp32 platform where **espota** and **esptool** (.py or.exe) tools are located
- Alternatively see [here](https://github.com/lorol/arduino-esp32fs-plugin/releases/tag/2.0) , there are copy of the binaries. You can also use **package_esp32_index.template.json** and run get.py instead
- Restart Arduino IDE. 


## Usage

- Open a sketch (or create a new one and save it).
- Go to sketch directory (choose Sketch > Show Sketch Folder).
- Create a directory named `data` and any files you want in the file system there.
- Make sure you have selected a board, port, and closed Serial Monitor.
- Select *Tools > ESP32 Sketch Data Upload* menu item. This should start uploading the files into ESP32 flash file system.
- On drop-down list select SPIFFS, LITTLEFS or FATFS you want to make from your data folder.

  When done, IDE status bar will display the status of Image Uploaded message. Might take a few minutes for large file system sizes.

## Quick build on Win:

- Install Java JDK 
- Find the path of javac.exe and jar.exe
- Edit make_win.bat accordingly
- Copy files **arduino-core.jar , commons-codec-1.7.jar , pde.jar**  from your Arduino IDE installation to the folder where is located **make_win.bat**
- Run **make_win.bat**
- Find the **build jar** in /bin directory 

## Credits and license

- Copyright (c) 2015 Hristo Gochkov (hristo at espressif dot com)
- Licensed under GPL v2 ([text](LICENSE))
- Maintained by Hristo Gochkov (hristo at espressif dot com)

## Issues and suggestions

File issues here on github, or ask your questions on the [esp32.com forum](http://esp32.com).
