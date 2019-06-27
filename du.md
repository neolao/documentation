du
==

Taille total des fichiers de la même extension
----------------------------------------------

```bash
du -ak | awk 'BEGIN {sum=0} /\.jpg$/ {sum+=$1} END {print sum}'
```

Taille d’un répertoire
----------------------

```bash
du -sh /path/to/directory
```

Taille d’un répertoire avec 1 niveau de détail
----------------------------------------------

```bash
du -h --max-depth=1 /path/to/directory
```

Lister les plus gros dossiers
-----------------------------

```bash
sudo du --max-depth=1 /usr/share/ | sort -n -r > du.txt
```
