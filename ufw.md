ufw (Uncomplicated Firewall)
============================

Activer
-------
```bash
ufw enable
```

Désactiver
----------
```bash
ufw disable
```

Voir les règles
---------------
```bash
ufw status verbose
```

Retirer une règle
-----------------
```bash
ufw status numbered
ufw delete 42
```

Activer l’IPv6
--------------
```bash
vim /etc/default/ufw
```

Règles à appliquer
------------------
### Autoriser SSH
```bash
ufw allow in 22/tcp
```

### Autoriser le trafic DNS
```bash
ufw allow in 53
```

### Interdire les connexions entrantes et autoriser les sortantes
```bash
ufw default deny incoming
ufw default allow outgoing
```

### Autoriser HTTP et HTTPS
```bash
ufw allow in 80/tcp
ufw allow in 443/tcp
```

### Autoriser IMAPS (imap sécurisé, pour Gmail par exemple)
```bash
allow in imaps/tcp
```

### Autoriser le port du whois
```bash
ufw allow in 43/tcp
```

Bannir une IP
-------------
```bash
sudo ufw insert 1 deny from <ip> to any
```
