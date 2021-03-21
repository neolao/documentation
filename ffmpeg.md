ffmpeg
======

Convertir audio EAC3 en AC3
---------------------------

```bash
ffmpeg  -hwaccel auto -y -i "input.mkv" -map 0 -c:s copy -c:v copy -c:a ac3 -b:a 640k "output.mkv"
```
