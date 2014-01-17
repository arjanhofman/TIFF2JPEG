#!/bin/sh
#
#	Arjan Hofman
# loop through directories and convert all tif files to jpg
#
# Set IFS else there will be problems with spaces
IFS=$'\n' 

SOURCE_FOLDER="TIFF"
DEST_FOLDER="JPEG"

echo "Looking in $SOURCE_FOLDER"

# First create the directory structure

for i in $(find $SOURCE_FOLDER -type d -exec ls -d "{}" + )
do
	mkdir -p `echo "$i" | sed -e 's/'$SOURCE_FOLDER'\//'$DEST_FOLDER'\//g'`
done

for j in $(find $SOURCE_FOLDER -type f -iname "*.*tif*" -exec ls -d "{}" \;)
do
	convert $j `echo $j | sed -e 's/'$SOURCE_FOLDER'\//'$DEST_FOLDER'\//g' | sed -e 's/.tif$/.jpg/g'`
done