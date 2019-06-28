awk
===

Convertir les valeurs sur plusieurs lignes en une seule séparées par des virgules
---------------------------------------------------------------------------------

```bash
awk '{print $1}' file.txt | paste -s -d, -
```
