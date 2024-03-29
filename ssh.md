SSH
===

Tunnel
------

```bash
ssh -L 10000:127.0.0.1:10000 -N login@serveur
```

```bash
ssh -L 7000:10.16.11.1:6379 -N login@serveur
```

Proxy web
---------

```bash
ssh -ND 1080 login@serveur
```

```bash
/Applications/Google\ Chrome.app/Contents/ --proxy-server="socks5://localhost:1080"
```

Le premier port est celui en local, le second est le vrai.

Authentification par un système de clés publique/privé
------------------------------------------------------

```bash
ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub <username>@<ipaddress>
```

```bash
ssh-keygen -t ecdsa
ssh-copy-id -i ~/.ssh/id_ecdsq.pub "<username>@<ipaddress> -p 1234"
```

```bash
ssh-keygen -o -a 100 -t ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub "<username>@<ipaddress>"
```

Restriction par clé
-------------------

### authorized_keys

```
no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty,command="/home/remote/.ssh/restrict.sh" ssh-rsa AAAAB...I2hA== neolao@neolao.local
```

```
command="./restrict-git.sh",no-port-forwarding,no-agent-forwarding,no-X11-forwarding,no-pty ssh-dss AAAAB…
```

### restrict.sh

```bash
logFile=/path/to/log

echo "$SSH_ORIGINAL_COMMAND" >> $logFile
case "$SSH_ORIGINAL_COMMAND" in

    # Synchronisation d'un dossier de www online vers le local
    rsync\ --server\ --sender\ -vtre.iL\ .\ /home/remote/www/*)
        echo " ... OK" >> $logFile
        $SSH_ORIGINAL_COMMAND
        ;;

    # Synchronisation d'un dossier vers www online
    rsync\ --server\ -vtre.iL\ --delete-during\ .\ /home/remote/www/*)
        echo " ... OK" >> $logFile
        $SSH_ORIGINAL_COMMAND
        ;;

    # Copie d'un fichier txt vers le local
    scp\ -f\ /home/remote/*.txt)
        echo " ... OK" >> $logFile
        $SSH_ORIGINAL_COMMAND
        ;;

    # Action par défaut
    *)
        echo " ... Rejected" >> $logFile
        echo "Rejected"
        ;;
esac
```

### restrict-git.sh

```bash
#!/bin/sh
exec git-shell -c "$SSH_ORIGINAL_COMMAND"
```

Passer par un proxy
-------------------
Dans `~/.ssh/config`

```
Host final.server.com
ProxyCommand ssh neolao@proxy.server.com /usr/bin/nc %h %p 2> /dev/null
```


Autoriser le mot de passe pour une seule personne
-------------------------------------------------

Dans `/etc/ssh/sshd_config`, ajouter à la fin :

```
Match User nini
    PasswordAuthentication yes
```


Proxy
-----

```
Host preprod
Hostname preprod.mywebsite.com
ProxyCommand ssh www nc %h %p
User neolao
```

```
Host www
Hostname 123.123.90.90
ForwardAgent yes
User neolao
```

Autoriser la connexion sur un serveur connecté à un VPN
-------------------------------------------------------

```bash
my_public_ip=1.2.3.4
my_default_gateway=1.1.1.1

ip rule add table 128 from $my_public_ip
ip route add table 128 to $my_public_ip dev eth0
ip route add table 128 default via $my_default_gateway
```

Générer la clé publique à partir de la privée
---------------------------------------------

```bash
ssh-keygen -f private.key -y > public.key
```

Générer le fingerprint de la clé publique
-----------------------------------------

```bash
ssh-keygen -lf public.key
```

Remove known host
-----------------

```bash
ssh-keygen -f ~/.ssh/known_hosts -R "hostname"
```
