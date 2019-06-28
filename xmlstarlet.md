xmlstarlet
==========

Compter le nombre d'occurences 
------------------------------

```bash
xmlstarlet sel -t -v "count(/path/data/item/id)" file.xml
```

Récupérer les valeurs
---------------------

```bash
xmlstarlet sel -t -v "/path/data/item/id/text()" file.xml
```
