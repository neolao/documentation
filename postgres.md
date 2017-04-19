Postgres
========

Créer une base
--------------

```bash
createdb mabase
```


Importer une base
-----------------
```bash
psql -d mabase -a -f mabase-20160101.sql
```


Mettre à jour les bases pour une nouvelle version du serveur
------------------------------------------------------------

Sur MacOSX :

```bash
mv /usr/local/var/postgres /usr/local/var/postgres_9.5.1
initdb /usr/local/var/postgres -E utf8
pg_upgrade -b /usr/local/Cellar/postgresql/9.5.1/bin -B /usr/local/Cellar/postgresql/9.6.2/bin -d /usr/local/var/postgres_9.5.1 -D /usr/local/var/postgres
```


