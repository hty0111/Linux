#!/bin/bash


# search executable files
IFSOLD=$IFS
IFS=:
for folder in $PATH
do
	echo "$folder:"
	for file in $folder
	do
		if [ -x $file ]
		then
			echo "	$file"
		fi
	done
done | more
IFS=$IFSOLD




