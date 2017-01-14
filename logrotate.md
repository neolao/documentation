logrotate
=========

Fichier de configuration
------------------------

```bash
sudo vim /etc/logrotate.conf
```

Exemple

```
/path/to/output.log {
    su www-data www-data
    daily
    rotate 52
    compress
    delaycompress
    size=10M
    missingok
    notifempty
    create 644 www-data www-data
}
```

Vérifier que tout marche bien
-----------------------------

```bash
sudo /usr/sbin/logrotate /etc/logrotate.conf
```
