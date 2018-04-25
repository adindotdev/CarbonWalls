#!/usr/bin/bash

if [[ -z "$1" ]]; then
  echo
  echo "Resolution not set."
  echo "Usage: carbonwalls.sh [720 1080]"
  echo
  return
fi

dim="$1"
logo=carbonlogos/carbon_words_white_blackshadow$dim.png
dim+="p_"
count=0

for backimg in unsplashimages/*.jpg; do
    count=$((count+1))
    convert $backimg -sample 1920x1080 tmp.jpg
    if [ "$dim" == "720p_" ]; then
        convert tmp.jpg -gravity center -crop 1280x720+0+0 tmp.jpg
    fi
    convert tmp.jpg $logo -gravity center -composite output/$dim$count.png
    rm tmp.jpg
done
