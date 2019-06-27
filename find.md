find
====

Effacer les fichiers commençant par `._`
----------------------------------------

```bash
find . -name "._*" -print -delete
```

Trouver les fichiers modifiés depuis 60 minutes
-----------------------------------------------

```bash
find /path/ -mmin -60
```

```bash
find / -not -path '/sys*' -not -path '/dev*' -not -path '/proc*' -mmin -60
```


OSX : effacer des fichiers
------------------------

```bash
find . -type d -name '.svn' -print -exec rm -rf {} \;
```


OSX : compter
-----------

```bash
find . -type f -name '*.jpg' | wc -l
```

Taille des fichiers d'un type
-----------------------------

```bash
find . -type f -name '*.jpg' -exec du -ch {} +
find . -type f -name '*.jpg' -exec du -ch {} + | grep total$
```
