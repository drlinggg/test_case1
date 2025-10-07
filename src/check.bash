#!/bin/bash

resolutions=("256:144:144p" "426:240:240p" "640:360:360p" "854:480:480p" "1280:720:720p" "1920:1080:1080p")

for resolution in "${resolutions[@]}"; do
    IFS=':' read -r width height name <<< "$resolution"
    echo "Вычисляем VMAF для $name..."
    
    ffmpeg -i "../output/output_${name}.mp4" \
           -i ../data/big_buck_bunny_1080p24_30s.y4m \
           -lavfi "[0:v]scale=1920:1080:flags=lanczos[scaled];[scaled][1:v]libvmaf=log_fmt=json:log_path=../output/vmaf_${name}.json" \
           -f null -
done
