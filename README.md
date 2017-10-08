# Arduino ESP32 filesystem uploader 

Arduino plugin which packs sketch data folder into SPIFFS filesystem image,
and uploads the image to ESP32 flash memory.

## Installation

- Make sure you use one of the supported versions of Arduino IDE and have ESP32 core installed.
- Download the tool archive from [releases page](https://github.com/me-no-dev/arduino-esp32fs-plugin/releases/latest).
- In your Arduino sketchbook directory, create tools directory if it doesn't exist yet.
- Unpack the tool into tools directory (the path will look like ```<home_dir>/Arduino/tools/ESP32FS/tool/esp32fs.jar```).
- Restart Arduino IDE. 

On the OS X create the tools directory in ~/Documents/Arduino/ and unpack the files there

## Usage

- Open a sketch (or create a new one and save it).
- Go to sketch directory (choose Sketch > Show Sketch Folder).
- Create a directory named `data` and any files you want in the file system there.
- Make sure you have selected a board, port, and closed Serial Monitor.
- Select *Tools > ESP32 Sketch Data Upload* menu item. This should start uploading the files into ESP32 flash file system.

  When done, IDE status bar will display SPIFFS Image Uploaded message. Might take a few minutes for large file system sizes.

## Credits and license

- Copyright (c) 2015 Hristo Gochkov (hristo at espressif dot com)
- Licensed under GPL v2 ([text](LICENSE))
- Maintained by Hristo Gochkov (hristo at espressif dot com)

## Issues and suggestions

File issues here on github, or ask your questions on the [esp32.com forum](http://esp32.com).
