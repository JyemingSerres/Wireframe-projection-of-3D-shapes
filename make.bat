:: Easily configure PyInstaller options to package the project into an executable
@ECHO OFF


:: Name of the output executable file
SET execname=wireframe-projection-x86-64-windows

:: icon <path relative to workpath>
SET icon=../src/assets/icon.png

:: Main script path
SET mainscript=./src/main.py

:: Where the executable is stored
SET distpath=./dist

:: Where temporary files are stored
SET workpath=./build

:: assets to include <path relative to workpath>:<runtime path>
SET data=../src/assets/*:./assets

:: Optimization level
SET level=2

@ECHO ON
:: call PyInstaller
pyinstaller %mainscript% ^
    --name %execname% ^
    --icon %icon% ^
    --onefile --noconsole ^
    --optimize %level% ^
    --distpath %distpath% ^
    --workpath %workpath% ^
    --specpath %workpath% ^
    --add-data %data%

@ECHO OFF

ECHO.
IF %ERRORLEVEL% NEQ 0 (
    ECHO PyInstaller failed to package the project.
) ELSE (
    ECHO Executable packaged successfully!
)
