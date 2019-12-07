fail2ban
========

Recharger la configuration
--------------------------
```bash
sudo fail2ban-client reload
```

Stopper une prison
------------------
```bash
sudo fail2ban-client stop ssh
```

Fichiers de configuration
-------------------------
```bash
vim /etc/fail2ban/jail.conf
```

Bannir manuellement une IP
--------------------------
```bash
sudo fail2ban-client -vvv set ssh banip xx.xx.xx.xx
```
Mais il va être unban après le délai configuré.
