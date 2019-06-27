du
==

Taille total des fichiers de la même extension
----------------------------------------------

```bash
du -ak | awk 'BEGIN {sum=0} /\.jpg$/ {sum+=$1} END {print sum}'
```
