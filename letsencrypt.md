Let's Encrypt
=============

[https://certbot.eff.org/](https://certbot.eff.org/)

Debian Jessie + nginx
---------------------

Installer le backport :

```
deb http://ftp.debian.org/debian jessie-backports main
```

Installer certbot :

```bash
sudo apt-get install certbot -t jessie-backports
```

Lancer la génération :

```bash
sudo certbot certonly --standalone -d example.com
```

Configurer nginx :

```
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    root /var/www/example;
    index index.html;

    server_name example.com;

    ssl on;
    ssl_certificate         /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/example.com/privkey.pem;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Configurer apache :

```
<VirtualHost *:443>
        DocumentRoot /var/www/example.com
        ServerName example.com
        Header always add Strict-Transport-Security "max-age=15768000; includeSubDomains; preload"

        SSLEngine on
        SSLCertificateFile /etc/letsencrypt/live/example.com/fullchain.pem
        SSLCertificateKeyFile /etc/letsencrypt/live/example.com/privkey.pem
</VirtualHost>
```
