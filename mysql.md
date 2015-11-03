mysql
=====

Se connecter
------------

```bash
mysql ~~u root~~p
```

Réinitialiser le mot de passe root
----------------------------------

### Stopper mysql

```bash
sudo /etc/init.d/mysql stop
```

### Redémarrer mysql avec une option spéciale

```bash
sudo mysqld_safe --skip-grant-tables
```

### Se connecter en root sur la table mysql

```bash
mysql -p -u root
```

```
mysql> UPDATE user SET Password=PASSWORD('nouveaumotdepasse') WHERE User='root';
mysql> FLUSH PRIVILEGES;
```

Quelques requêtes utiles
------------------------

### Afficher toutes les bases

    mysql> SHOW DATABASES;

### Afficher toutes les tables d’une base

    mysql> SHOW TABLES FROM mabase;

### Créer une base

    mysql> CREATE DATABASE mabase DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

### Sélectionner une base

    mysql> USE mabase;

### Afficher les colonnes d’une table

    mysql> SHOW COLUMNS FROM matable;

Créer un base de données
------------------------

    mysql> CREATE DATABASE [IF NOT EXISTS] db_name;

Ajouter un utilisateur
----------------------

[http://dev.mysql.com/doc/refman/5.0/fr/adding-users.html](http://dev.mysql.com/doc/refman/5.0/fr/adding-users.html)

    mysql> CREATE USER 'neolao'@'localhost' IDENTIFIED BY 'motdepasse';

    mysql> CREATE USER 'neolao'@'%' IDENTIFIED BY 'motdepasse';

    mysql> GRANT USAGE ON mabase.* TO 'neolao'@'%' IDENTIFIED BY 'motdepasse';

    mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON mabase.* TO 'neolao'@'localhost' IDENTIFIED BY 'motdepasse';
    mysql> FLUSH PRIVILEGES;

Importer
--------

```bash
sudo /usr/local/mysql/bin/mysql -u root -h localhost --default-character-set=utf8 myDatabase < /path/to/sql/file.sql
```

Exporter
--------

```bash
sudo mysqldump --single-transaction --host=localhost --user=root --password=plop --default-character-set=utf8 myDatabase > /path/to/file.sql
```

Changer la valeur de l’auto increment
-------------------------------------

```mysql
ALTER TABLE Persons AUTO_INCREMENT=100
```

Trouver les duplications et les supprimer
-----------------------------------------

```mysql
SELECT *, COUNT(*) AS count FROM favorites GROUP BY user_id, recipe_id HAVING count > 1
```

```mysql
ALTER IGNORE TABLE favorites ADD UNIQUE INDEX(user_id, recipe_id);
```

ou

```mysql
DELETE f1 FROM favorites f1, favorites f2 WHERE f1.id > f2.id AND f1.user_id = f2.user_id AND f1.recipe_id = f2.recipe_id
```

Afficher les éléments dupliqués et aggréger les éléments différents
-------------------------------------------------------------------

```mysql
SELECT COUNT(order_id) AS count, order_id, GROUP_CONCAT(user_id) FROM user_billing GROUP BY order_id HAVING count > 1
```

Ne pas vérifier les clés étrangères
-----------------------------------

```mysql
SET FOREIGN_KEY_CHECKS=0;
UPDATE instructions SET media_id = 3100 WHERE media_id = 752;
UPDATE media SET id = 3100 WHERE id = 752;
SET FOREIGN_KEY_CHECKS=1;
```
