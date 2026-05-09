:: Easily configure pyInstaller options to package the project into an executable
@ECHO OFF


:: Name of the output executable file
SET execname=Wireframe-projection-of-3D-shapes

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

:: call pyInstaller
pyInstaller %mainscript% ^
    --name %execname% ^
    --icon %icon% ^
    --onefile --noconsole ^
    --optimize %level% ^
    --distpath %distpath% ^
    --workpath %workpath% ^
    --specpath %workpath% ^
    --add-data %data%

ECHO.
IF %ERRORLEVEL% NEQ 0 (
    ECHO pyInstaller failed to package the project.
) ELSE (
    ECHO Executable packaged successfully!
)
