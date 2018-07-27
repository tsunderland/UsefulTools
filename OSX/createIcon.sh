#!/bin/bash

# This script creates a Mac Iconset ICNS file for a given png file
# it is expected that the png file is 1024x1024 pixels.

filename=$1
iconsetDir="$(echo "$filename" | cut -d '.' -f1).iconset"
USAGE="Usage: createIcon.sh <1024x1024pixel png file> \n Creates a OSX ICNS file from the given png"

if (  "$filename" == "") ;then
    echo $USAGE
    exit 1;
fi

echo "Creating ICNS file from $filename..."
mkdir $iconsetDir
sips -z 16 16 $filename --out $iconsetDir/icon_16x16.png
sips -z 32 32 $filename --out $iconsetDir/icon_16x16@2x.png
sips -z 32 32 $filename --out $iconsetDir/icon_32x32.png
sips -z 64 64 $filename --out $iconsetDir/icon_32x32@2x.png
sips -z 128 128 $filename --out $iconsetDir/icon_128x128.png
sips -z 256 256 $filename --out $iconsetDir/icon_128x128@2x.png
sips -z 256 256 $filename --out $iconsetDir/icon_256x256.png
sips -z 512 512 $filename --out $iconsetDir/icon_256x256@2x.png
sips -z 512 512 $filename --out $iconsetDir/icon_512x512.png
cp $filename $iconsetDir/icon_512x512@2x.png
iconutil -c icns $iconsetDir
zip $filename.zip -r $iconsetDir
rm -R $iconsetDir
echo "DONE!"
exit 0;
