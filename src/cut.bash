#!/bin/bash

resolutions=("256:144:144p" "320:240:240p" "640:360:360p" "854:480:480p" "1280:720:720p" "1920:1080:1080p")
mkdir -p ../output

for resolution in "${resolutions[@]}"; do
    IFS=':' read -r width height name <<< "$resolution"
    
    ffmpeg -i ../data/big_buck_bunny_1080p24_30s.y4m \
           -vf "scale=$width:$height:flags=lanczos" \
           "../output/output_${name}.mp4" \
           -c:v libx264 \
done


for resolution in "${resolutions[@]}"; do
    IFS=':' read -r width height name <<< "$resolution"
    bitrate=$(mediainfo --Output='Video;%BitRate%' "../output/output_${name}.mp4")
    echo "$bitrate" > "../output/bitrate_${name}.txt"
done

