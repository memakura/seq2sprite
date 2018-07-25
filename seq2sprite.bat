@echo off

rem 2018.7.21 memakura

setlocal enabledelayedexpansion

set IMG_DIR=img
set WORK_DIR=work
set JSON=%WORK_DIR%\sprite.json
set EXT=png

if not exist %IMG_DIR% (
    echo "Error: folder [%IMG_DIR%] does not exist"
    exit
)

rem Create work directory
if exist %WORK_DIR% rd /s /q %WORK_DIR%
mkdir %WORK_DIR%

if exist %JSON% del %JSON%

(
    echo {
    echo 	"objName": "myCandle",
    echo 	"costumes": [{
) > %JSON%


set i=0
for %%f in (%IMG_DIR%\*.%EXT%) do (
    echo %%f

    if not !i! == 0 (
        (
            echo 		},
            echo 		{
        ) >> %JSON%
    )

    (
    echo 			"costumeName": "%%~nf",
    echo 			"baseLayerID": !i!,
    echo 			"baseLayerMD5": "!i!.%EXT%",
    echo 			"bitmapResolution": 1,
    echo 			"rotationCenterX": 120,
    echo 			"rotationCenterY": 150
    ) >> %JSON%

    rem Copy each image file to work directory
    copy %%f %WORK_DIR%\!i!.%EXT%

    set /a i+=1
    rem @echo !i!
)


(
    echo 		}],
    echo 	"currentCostumeIndex": 0,
    echo 	"scratchX": 0,
    echo 	"scratchY": 0,
    echo 	"scale": 1,
    echo 	"direction": 90,
    echo 	"rotationStyle": "normal",
    echo 	"isDraggable": false,
    echo 	"indexInLibrary": 100000,
    echo 	"visible": true,
    echo 	"spriteInfo": {
    echo 	}
    echo }
) >> %JSON%

if exist %WORK_DIR% (
    rem Backup
    if exist %WORK_DIR%.sprite2 (
        move %WORK_DIR%.sprite2 %WORK_DIR%.sprite2.bak
    )
    if exist %WORK_DIR%.zip (
        move %WORK_DIR%.zip %WORK_DIR%.zip.bak
    )

    rem Generate a zip (sprite) file (requires powershell >=v5; Win10 default)
    (
        echo Compress-Archive -Path "%WORK_DIR%" -DestinationPath "%WORK_DIR%.zip"
    ) | powershell -c -
    if exist %WORK_DIR%.zip (
        move %WORK_DIR%.zip %WORK_DIR%.sprite2
    )
)