awk
===

Convertir les valeurs sur plusieurs lignes en une seule séparées par des virgules
---------------------------------------------------------------------------------

```bash
awk '{print $1}' file.txt | paste -s -d, -
```

Préfixer toutes les lignes d'un fichier
---------------------------------------

```bash
awk '$0="prefix;"$0' test.csv > new.csv
```

Supprimer toutes les lignes qui match un pattern
------------------------------------------------

```bash
awk '/pattern/' file.csv > new.csv
```
