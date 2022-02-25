xRDP
====

Configurer la connexion derrière SSH
------------------------------------
```bash
sudo vim /etc/xrdp/xrdp.ini
```

changer le port en:
```ini
port=tcp://.:3389
```

puis redémarrer le service:
```bash
sudo systemctl restart xrdp
```
