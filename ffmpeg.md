ffmpeg
======

Convertir audio EAC3 en AC3
---------------------------

```bash
ffmpeg  -hwaccel auto -y -i "input.mkv" -map 0 -c:s copy -c:v copy -c:a ac3 -b:a 640k "output.mkv"
```

```bash
#!/bin/bash

input=$1

fileName=$(basename "$input")
extension="${fileName##*.}"
fullPath=$(readlink -f "$input")
directory=$(dirname "$fullPath")
archiveDirectory="$directory/archives"
archiveFileName=$(date +%Y-%m-%d_%H-%M-%S.$extension)
archiveFullPath="$archiveDirectory/$archiveFileName"

echo "File to transcode: $fullPath"

mkdir -p "$archiveDirectory"
mv "$fullPath" "$archiveFullPath"

ffmpeg  -hwaccel auto -y -i "$archiveFullPath" -map 0 -c:s copy -c:v copy -c:a ac3 -b:a 640k "$fullPath"

echo "Original file: $archiveFullPath"
echo "Transcoded file: $fullPath"
```
