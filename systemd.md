systemd
=======

Créer un service
----------------

Créer le fichier `/etc/systemd/system/resilio.service` :

```
[Unit]
Description=Resilio

[Service]
ExecStart=/var/www/resilio-start.sh
StandardOutput=null

[Install]
WantedBy=multi-user.target
Alias=resilio.service
```

