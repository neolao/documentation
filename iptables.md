iptables
========

[http://doc.ubuntu-fr.org/iptables](http://doc.ubuntu-fr.org/iptables)

Voir les règles
---------------
```bash
sudo iptables -L -v -n
```

Block the IP for 60 seconds after three failed ssh connections
--------------------------------------------------------------
```bash
iptables -N SSH_WHITELIST
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --name SSH
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_WHITELIST
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --rttl --name SSH -j ULOG --ulog-prefix SSH_brute_force
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --rttl --name SSH -j DROP
```

Bloquer une IP
--------------
```bash
sudo iptables -A INPUT -s 213.108.216.41 -j DROP -m state --state NEW
```

Supprimer une règle
-------------------

Repérer le numéro de ligne :
```bash
sudo iptables -L -v -n --line-numbers
```

Supprimer la ligne 2 de la chaine INPUT
```bash
sudo iptables -D INPUT 2
```
