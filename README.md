# test_case1

С помощью ffmpeg вырезал 30 секунд: 
```
ffmpeg -i big_buck_bunny_1080p24.y4m -t 30 -c copy big_buck_bunny_1080p24_30s.y4m
```

## src/cut.bash
Используя кодек h264 нарезал исходное видео в разрешения 144p, 240p, 360p,... 1080p
## src/check.bash
Оценил качество полученных видеороликов с помощью VMAF
## src/graph.py
Построил график VMAF от битрейта
