@echo off

rem Copyright (c) 2018 Hiroaki Kawashima (memakura)
rem This software is released under the MIT License, see LICENSE.txt.

setlocal enabledelayedexpansion

set PATH=%PATH%;%SYSTEMROOT%\System32

rem ===========================================================
rem Set your image size here. (Do not insert space around '=')
set WIDTH=240
set HEIGHT=300
rem ===========================================================

set IMG_DIR=img
set WORK_DIR=work
set JSON=%WORK_DIR%\sprite.json
set EXT=png

rem Set the center of sprite
set /a CX=%WIDTH%/2
set /a CY=%HEIGHT%/2

rem Set default scratch version
if "%SCRATCH_VER%" == "" set SCRATCH_VER=2

rem Set file extension (sprite2 or sprite3)
set SPRITE_EXT=sprite%SCRATCH_VER%

if not exist %IMG_DIR% (
    echo "Error: folder [%IMG_DIR%] does not exist"
    exit /b 1
)

rem Create work directory
if exist %WORK_DIR% rd /s /q %WORK_DIR%
mkdir %WORK_DIR%

if exist %JSON% del %JSON%

if %SCRATCH_VER% == 2 (
    (
        echo {
        echo 	"objName": "myCandle",
        echo 	"costumes": [{
    ) > %JSON%
) else (
    (
        echo {
        echo 	"isStage": false,
        echo 	"name": "myCandle",
        echo 	"variables": {},
        echo 	"lists": {},
        echo 	"broadcasts": {},
        echo 	"blocks": {},
        echo 	"comments": {},
        echo 	"currentCostume": 0,
        echo 	"costumes": [{
    ) > %JSON%
)

set i=0
for %%f in (%IMG_DIR%\*.%EXT%) do (
    echo %%f
    for /f "usebackq tokens=*" %%t in (`certutil -hashfile %%f MD5 ^| findstr /v "MD5 CertUtil ECHO"`) do (
        set _md5=%%t
    )
    rem Remove space (for Win7-8.1)
    set md5str=!_md5: =!

    if not !i! == 0 (
        (
            echo 		},
            echo 		{
        ) >> %JSON%
    )

    if %SCRATCH_VER% == 2 (
        (
            echo 			"costumeName": "%%~nf",
            echo 			"baseLayerID": !i!,
            echo 			"baseLayerMD5": "!md5str!.%EXT%",
            echo 			"bitmapResolution": 1,
            echo 			"rotationCenterX": %CX%,
            echo 			"rotationCenterY": %CY%
        ) >> %JSON%
        rem Copy each image file to work directory
        copy %%f %WORK_DIR%\!i!.%EXT%
    ) else (
        (
            echo 			"assetId": "!md5str!",
            echo 			"name": "%%~nf",
            echo 			"bitmapResolution": 1,
            echo 			"md5ext": "!md5str!.%EXT%",
            echo 			"dataFormat": "%EXT%",
            echo 			"rotationCenterX": %CX%,
            echo 			"rotationCenterY": %CY%
        ) >> %JSON%
        rem Copy each image file to work directory
        copy %%f %WORK_DIR%\!md5str!.%EXT%
    )

    set /a i+=1
    rem @echo !i!
)

if %SCRATCH_VER% == 2 (
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
) else (
    (
        echo 		}],
        echo 	"sounds": [],
        echo 	"volume": 100,
        echo 	"visible": true,
        echo 	"x": 0,
        echo 	"y": 0,
        echo 	"size": 100,
        echo 	"direction": 90,
        echo 	"draggable": false,
        echo 	"rotationStyle": "all around"
        echo }
    ) >> %JSON%
)

rem Backup
if exist %WORK_DIR%.%SPRITE_EXT% (
    move %WORK_DIR%.%SPRITE_EXT% %WORK_DIR%.%SPRITE_EXT%.bak
)
if exist %WORK_DIR%.zip (
    move %WORK_DIR%.zip %WORK_DIR%.zip.bak
)

rem Generate a zip (sprite) file (requires powershell >=v5; Win10 default)
(
    echo Compress-Archive -Path "%WORK_DIR%\*" -DestinationPath "%WORK_DIR%.zip"
) | powershell -c -
if exist %WORK_DIR%.zip (
    move %WORK_DIR%.zip %WORK_DIR%.%SPRITE_EXT%
)
