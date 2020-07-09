# Arduino ESP32 filesystem uploader 

Arduino plugin which packs sketch data folder into SPIFFS or LittleFS filesystem image,
and uploads the image to ESP32 flash memory.
</br> You can use either LITTLEFS or SPIFFS but not both simultaneously on given Arduino project.

## Installation

- Make sure you use one of the supported versions of Arduino IDE and have ESP32 core installed.
- Download the tool from [here](https://github.com/lorol/arduino-esp32fs-plugin/releases/download/1.0%2C1/esp32fs.zip)
- In your Arduino sketchbook directory, create tools directory if it doesn't exist yet.
- Unpack the tool into tools directory (the path will look like ```<home_dir>/Arduino/tools/ESP32FS/tool/esp32fs.jar```).
- If not already installed, for LITTLEFS you need an additional [mklittlefs tool](https://github.com/earlephilhower/mklittlefs)  Download the [release](https://github.com/earlephilhower/mklittlefs/releases) and copy it to 
packages\esp32\tools\mkspiffs\<mklittlefs rev. x.x.x>\ or on checkout (dev) environment to: packages\esp32\hardware\esp32\<release>\tools\mklittlefs\
- Restart Arduino IDE. 


On the OS X create the tools directory in ~/Documents/Arduino/ and unpack the files there

## Usage

- Open a sketch (or create a new one and save it).
- Go to sketch directory (choose Sketch > Show Sketch Folder).
- Create a directory named `data` and any files you want in the file system there.
- Make sure you have selected a board, port, and closed Serial Monitor.
- Select *Tools > ESP32 Sketch Data Upload* menu item. This should start uploading the files into ESP32 flash file system.
- When prompted, select SPIFFS or LITTLEFS image you want to make from your data folder.

  When done, IDE status bar will display SPIFFS or LITTLEFS Image Uploaded message. Might take a few minutes for large file system sizes.

## Credits and license

- Copyright (c) 2015 Hristo Gochkov (hristo at espressif dot com)
- Licensed under GPL v2 ([text](LICENSE))
- Maintained by Hristo Gochkov (hristo at espressif dot com)

## Issues and suggestions

File issues here on github, or ask your questions on the [esp32.com forum](http://esp32.com).
