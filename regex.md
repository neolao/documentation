Regex
=====

Une chaine excluant un caractère
--------------------------------

Interdit `a` :
```
[^a]+
```

Une chaine excluant une séquence de caractères
----------------------------------------------

Interdit `ab` :
```
(?:(?!ab).)+
```
