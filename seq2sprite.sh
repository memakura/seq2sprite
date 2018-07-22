#!/bin/bash

# 2018.7.22 memakura

IMG_DIR=img
WORK_DIR=work
JSON=$WORK_DIR/sprite.json
EXT=png

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

cat <<EOD > $JSON
{
    "objName": "myCandle",
    "costumes": [{
EOD

i=0
for f in $IMG_DIR/*.$EXT; do
    echo $f

    if [ $i -ne 0 ]; then
        cat <<EOD >> $JSON
		},
		{
EOD
    fi

    cat <<EOD >> $JSON
            "costumeName": "`basename $f .$EXT`",
            "baseLayerID": $i,
			"baseLayerMD5": "$i.$EXT",
			"bitmapResolution": 1,
			"rotationCenterX": 120,
			"rotationCenterY": 150
EOD

    # Copy each image file to work directory
    cp $f $WORK_DIR/$i.$EXT

    i=$((i += 1))
    echo $i
done

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

# Backup
if [ -f $WORK_DIR.sprite2 ];then
    mv $WORK_DIR.sprite2 $WORK_DIR.sprite2.bak
fi

# Generate a zip (sprite) file
if [ -d $WORK_DIR ]; then
    zip $WORK_DIR.zip $WORK_DIR/* && mv $WORK_DIR.zip $WORK_DIR.sprite2
fi
