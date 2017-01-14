Apache
======

Désactiver un cache bizarre
---------------------------

Via .htaccess :

```
EnableSendfile Off
```

Virtual host
------------

```
<VirtualHost *:80>
    ServerName  domain.com

    DocumentRoot /home/www/
    <Directory /home/www/>
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>

    <Directory "/var/www/html/protected">
        AuthType Basic
        AuthName "Authentication Required"
        AuthUserFile "/etc/htpasswd/.htpasswd"
        Require valid-user

        Order allow,deny
        Allow from all
    </Directory>

    <Directory "/var/www/html/protected">
        AuthType Basic
        AuthName "Authentication Required"
        AuthUserFile "/etc/htpasswd/.htpasswd"
        Require valid-user

        Order deny,allow
        Deny from all
        Allow from 127.0.0.1
        Satisfy any
    </Directory>
</VirtualHost>
```

Exemple de config de dossier
----------------------------

```
<Directory /home/www/test/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All

        AuthType Basic
        AuthName "Acces Restreint"
        AuthUserFile /home/wwwz/.htpasswd
        AuthGroupFile /dev/null
        require valid-user
        SetEnvIf Request_URI "^/foobar/" allow
        Order allow,deny
        #Allow from env=allow
        Allow from all
        Satisfy Any

    </Directory>
```

Log conditionnel
----------------

http://httpd.apache.org/docs/2.2/logs.html

```
SetEnvIf Request_URI "mkv$" video
SetEnvIf Request_URI "avi$" video
SetEnvIf Request_URI "mp4$" video
CustomLog /path/to/access.log "%t %u %U" env=video
CustomLog /path/to/access2.log combined env=!video
```

mod_mono
--------

### Configuration d'un dossier géré par mono

```
AddMonoApplications toto "/myapp/ws:/home/sites/myapp/ws"
MonoServerPath toto /usr/bin/mod-mono-server4
MonoDebug true
<Location /myapp/ws>
    MonoSetServerAlias toto
    SetHandler mono
    Options +Indexes
</Location>
```


Erreur 1
--------

```
Could not reliably determine the server's fully qualified domain name
```

Ajouter à `/etc/apache2/apache2.conf` :

```
ServerName "NomDeDomaine.com"
```



HTTPS sur Apache MacOSX
-----------------------

Décommenter sur `/private/etc/apache2/httpd.conf` :

```
Include /private/etc/apache2/extra/httpd-ssl.conf
```

Générer le certificat

```bash
openssl req -new -x509 -nodes -out server.crt -keyout server.key
```

Activer le SSL sur un vhost

```
<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile "/etc/ssl/server.crt"
    SSLCertificateKeyFile "/etc/ssl/server.key"
    ...
</VirtualHost>
```

Authentification demandée sur un domain mais pas un autre
---------------------------------------------------------

```
<VirtualHost *:80>
    ServerName  foo.test.com
    DocumentRoot /var/www/test/

    <Directory /var/www/test/>
        AuthType Basic
        AuthName "Authentication Required"
        AuthUserFile "/var/www/.htpasswd"
        Require valid-user

        SetEnvIf Host bar\.test\.com allow
        AllowOverride All
        Order deny,allow
        Deny from all
        Satisfy any
    </Directory>
</VirtualHost>

<VirtualHost *:80>
    ServerName  bar.test.com
    DocumentRoot /var/www/test/

</VirtualHost>
```

Activer le module SSL
---------------------

```bash
sudo a2enmod ssl
```
