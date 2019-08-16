crontab
=======

Chemin des crontab par user
---------------------------

```
/var/spool/cron/crontabs
```

Editer
------

```bash
crontab -e
```
```bash
env EDITOR=vim crontab -e
```

Règles
------
minutes heures jour mois jourSemaine commande > log

```
MAILTO=""
0 6 * * * /path/to/script.sh > /path/to/log.txt
@weekly /path/to/script.sh > /dev/null 2>&1
Minutes [0-59]
|   Hours [0-23]
|   |   Days [1-31]
|   |   |   Months [1-12]
|   |   |   |   Days of the Week [Numeric, 0-6]
|   |   |   |   |
*   *   *   *   * home/path/to/command/the_command.sh
```

Exemples
--------
```
0 18 * * 1-5 : Tous les lundi à vendredi à 18h00
```

Raccourcis
----------
```
@root # se lance au reboot avec les droits utilisateurs, bien commode
```

| Raccourcis | Équivalent |
| ---------- | ---------- |
| `@reboot`	| Aucun |
| `@yearly`	| `0 0 1 1 *` |
| `@annually`	| `0 0 1 1 *` |
| `@monthly`	| `0 0 1 * *` |
| `@weekly`	| `0 0 * * 0` |
| `@daily`	| `0 0 * * *` |
| `@midnight`	| `0 0 * * *` |
| `@hourly`	| `0 * * * *` |
