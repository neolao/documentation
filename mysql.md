mysql
=====

Se connecter
------------

bc(bash). mysql ~~u root~~p

Réinitialiser le mot de passe root
----------------------------------

### Stopper mysql

bc(bash). sudo /etc/init.d/mysql stop

### Redémarrer mysql avec une option spéciale

bc(bash). sudo mysqld\_safe ~~~~skip-grant-tables
\
h3. Se connecter en root sur la table mysql
\
bc. mysql~~p~~u root

bc.. mysql\> UPDATE user SET Password=PASSWORD(‘nouveaumotdepasse’)
WHERE User=‘root’;\
mysql\> FLUSH PRIVILEGES;

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

bc.. mysql\> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON mabase.\*
TO ‘neolao’@‘localhost’ IDENTIFIED BY ‘motdepasse’;\
mysql\> FLUSH PRIVILEGES;

Importer
--------

bc(bash). sudo /usr/local/mysql/bin/mysql ~~u root~~h localhost
~~~~default-character-set=utf8 myDatabase \< /path/to/sql/file.sql
\
h2. Exporter
\
bc. sudo mysqldump~~~~single-transaction ~~~~host=localhost~~~~user=root
~~~~password=plop~~~~default-character-set=utf8 myDatabase \>
/path/to/file.sql

Changer la valeur de l’auto increment
-------------------------------------

bc(sql). ALTER TABLE Persons AUTO\_INCREMENT=100

Trouver les duplications et les supprimer
-----------------------------------------

bc(sql). SELECT \*, COUNT (\*) AS count FROM favorites GROUP BY
user\_id, recipe\_id HAVING count \> 1

bc(sql). ALTER IGNORE TABLE favorites ADD UNIQUE
INDEX (user\_id, recipe\_id);

ou

bc(sql). DELETE f1 FROM favorites f1, favorites f2 WHERE f1.id \> f2.id
AND f1.user\_id = f2.user\_id AND f1.recipe\_id = f2.recipe\_id

Afficher les éléments dupliqués et aggréger les éléments différents
-------------------------------------------------------------------

bc(sql). SELECT COUNT (order\_id) AS count, order\_id,
GROUP\_CONCAT(user\_id) FROM user\_billing GROUP BY order\_id HAVING
count \> 1

Ne pas vérifier les clés étrangères
-----------------------------------

bc(sql).. SET FOREIGN\_KEY\_CHECKS=0;\
UPDATE instructions SET media\_id = 3100 WHERE media\_id = 752;\
UPDATE media SET id = 3100 WHERE id = 752;\
SET FOREIGN\_KEY\_CHECKS=1;
