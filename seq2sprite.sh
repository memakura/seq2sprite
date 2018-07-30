#!/bin/bash

# 2018.7 by memakura

# ===========================================================
# Set your image size here. (Do not insert space around '=')
WIDTH=240
HEIGHT=300
# ===========================================================

IMG_DIR=img
WORK_DIR=work
JSON=$WORK_DIR/sprite.json
EXT=png

# Set the center of sprite
CX=$((WIDTH / 2))
CY=$((HEIGHT / 2))

# Set default scratch version
SCRATCH_VER=2

usage_exit() {
    echo "Usage: $0 [-2|-3] (default -2)"
    exit 1
}

while getopts 23h OPT; do
    case $OPT in
        2)  SCRATCH_VER=2
            ;;
        3)  SCRATCH_VER=3
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

# Set file extension (sprite2 or sprite3)
SPRITE_EXT=sprite$SCRATCH_VER

# Check commands
if ! type zip > /dev/null 2>&1; then
    echo "Error: Install [zip] before using this script"
    exit 1
fi

NO_MD5SUM=0
if ! type md5sum > /dev/null 2>&1; then
    if [ $SCRATCH_VER -eq 3];then
        echo "Error: Install [md5sum] before using this script"
        echo "  (For Mac OS) If you already have Homebrew installed, try:"
        echo "        $ brew install md5sha1sum"
        exit 1
    else
        echo "Warning: [md5sum] is not installed."
        NO_MD5SUM=1
    fi
fi


if [ ! -d $IMG_DIR ]; then
    echo "Error: folder [$IMG_DIR] does not exist"
    exit 1
fi

# Create work directory
if [ -d $WORK_DIR ]; then
    rm -rf $WORK_DIR
fi
mkdir $WORK_DIR

if [ -f $JSON ]; then
    rm $JSON
fi

if [ $SCRATCH_VER -eq 2 ]; then
    cat <<EOD > $JSON
{
	"objName": "myCandle",
	"costumes": [{
EOD
else
    cat <<EOD > $JSON
{
	"isStage": false,
	"name": "myCandle",
	"variables": {},
	"lists": {},
	"broadcasts": {},
	"blocks": {},
	"comments": {},
	"currentCostume": 0,
	"costumes": [{
EOD
fi

i=0
for f in $IMG_DIR/*.$EXT; do
    echo $f
    if [ $NO_MD5SUM -eq 1 ];then
        # Only work for Scratch 2
        baseLayerName=$i.$EXT
    else
        md5str=`md5sum $f | cut -d ' ' -f 1`
        baseLayerName=$md5str.$EXT
    fi

    if [ $i -ne 0 ]; then
        cat <<EOD >> $JSON
		},
		{
EOD
    fi

    if [ $SCRATCH_VER -eq 2 ]; then
        cat <<EOD >> $JSON
			"costumeName": "`basename $f .$EXT`",
			"baseLayerID": $i,
			"baseLayerMD5": "$md5str.$EXT",
			"bitmapResolution": 1,
			"rotationCenterX": $CX,
			"rotationCenterY": $CY
EOD
        # Copy each image file to work directory
        cp $f $WORK_DIR/$i.$EXT
    else
        cat <<EOD >> $JSON
			"assetId": "$md5str",
			"name": "`basename $f .$EXT`",
			"bitmapResolution": 1,
			"md5ext": "$md5str.$EXT",
			"dataFormat": "$EXT",
			"rotationCenterX": $CX,
			"rotationCenterY": $CY
EOD
        # Copy each image file to work directory
        cp $f $WORK_DIR/$md5str.$EXT
    fi

    i=$((i += 1))
    # echo $i
done

if [ $SCRATCH_VER -eq 2 ];then
    cat <<EOD >> $JSON
		}],
	"currentCostumeIndex": 0,
	"scratchX": 0,
	"scratchY": 0,
	"scale": 1,
	"direction": 90,
	"rotationStyle": "normal",
	"isDraggable": false,
	"indexInLibrary": 100000,
	"visible": true,
	"spriteInfo": {
	}
}
EOD
else
    cat <<EOD >> $JSON
		}],
	"sounds": [],
	"volume": 100,
	"visible": true,
	"x": 0,
	"y": 0,
	"size": 100,
	"direction": 90,
	"draggable": false,
	"rotationStyle": "all around"
}
EOD
fi


# Backup
if [ -f $WORK_DIR.$SPRITE_EXT ];then
    mv $WORK_DIR.$SPRITE_EXT $WORK_DIR.$SPRITE_EXT.bak
fi
# Generate a zip (sprite) file
zip -j $WORK_DIR.$SPRITE_EXT $WORK_DIR/*

echo "Output: $WORK_DIR.$SPRITE_EXT"
