#!/bin/bash

# $1 - video url, ex. https://www.youtube.com/watch?v=QEKnXcPCaRg
# $2 - start timestamp, ex. 0:30
# $3 - end timestamp, ex. 2:30
# $4 - output, ex. clip.mp4
function fetch_clip {
  urls=($(youtube-dl -g $1))
  video_url=${urls[0]}
  audio_url=${urls[1]}

  ffmpeg -nostdin -y -ss $2 -to $3 -i "$video_url" -ss $2 -to $3 -i "$audio_url" -map 0:v -map 1:a -c:v libx264 -c:a aac $4
}

fetch_clip $1 $2 $3 "$4.mp4"