#!/bin/bash

# $1 - video url, ex. https://www.youtube.com/watch?v=QEKnXcPCaRg
# $2 - start timestamp, ex. 0:30
# $3 - end timestamp, ex. 2:30
# $4 - video output, ex. videos/clip
# $5 - thumbnail output, ex. thumbnails/image

url=$(youtube-dl -f 22 -g $1)
ffmpeg -y -ss $2 -to $3 -i $url -c copy "$4.mp4"
ffmpeg -i "$4.mp4" -ss 00:01 -vframes 1 "$5.png"