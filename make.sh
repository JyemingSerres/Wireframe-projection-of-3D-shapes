#!/bin/bash
# Easily configure PyInstaller options to package the project into an executable


# Name of the output executable file
execname=wireframe-projection-x86-64-linux

# icon <path relative to workpath>
icon=../src/assets/icon.png

# Main script path
mainscript=./src/main.py

# Where the executable is stored
distpath=./dist

# Where temporary files are stored
workpath=./build

# assets to include <path relative to workpath>:<runtime path>
data=../src/assets/*:./assets

# Optimization level
level=2

# call PyInstaller
pyinstaller $mainscript \
    --name $execname \
    --icon $icon \
    --onefile --noconsole \
    --optimize $level \
    --distpath $distpath \
    --workpath $workpath \
    --specpath $workpath \
    --add-data $data \

if [ $? -ne 0 ]; then
    echo "PyInstaller failed to package the project."
else
    echo "Executable packaged successfully!"
fi
