Installation d’un serveur Debian
================================

Créer un utilisateur
--------------------
```bash
adduser neolao
```

Ajouter l’utilisateur dans la liste des sudoers
-----------------------------------------------
```bash
apt-get install sudo
```

```bash
vim /etc/sudoers
```
```
neolao ALL=(ALL:ALL) ALL
```

### Transférer la clé publique
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub neolao@<new.domain.com>
```

Désactiver l’authentification par mot de passe
----------------------------------------------
```bash
sudo vim /etc/ssh/sshd_config
```
```
PasswordAuthentication no
```

### Redémarrer le service SSH
```bash
sudo service ssh restart
```

Configurer le firewall
----------------------
```bash
sudo apt-get install ufw
```

### Activer
```bash
sudo ufw enable
```

### Activer l’IPv6
```bash
sudo vim /etc/default/ufw
```

### Règles à appliquer
```bash
sudo ufw allow in 22/tcp
sudo ufw allow in 53
sudo ufw allow in 80/tcp
sudo ufw allow in 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Installer fail2ban
------------------
```bash
sudo apt-get install fail2ban
```

### Configurer les prisons
```bash
sudo vim /etc/fail2ban/jail.conf
```

### Temps de bannissement de 1 heure
```
bantime = 3600
```

Modifier le hostname
--------------------
```bash
sudo hostname new.domain.com
sudo vim /etc/hostname
```

Installer zsh
-------------
```bash
sudo apt-get install zsh
```

### Importer la configuration personnalisée
```bash
cd ~/
wget http://doc.neolao.com/zsh.zip
unzip zsh.zip
```

### Modifier le shell par défaut
```bash
sudo chsh -s /usr/bin/zsh
```

Installer vim
-------------
```bash
sudo apt-get install ctags vim
```

### Importer la configuration personnalisée
```bash
curl https://vimrc.neolao.com/vimrc -o ~/.vimrc
```

Configurer exim4
----------------
```bash
sudo dpkg-reconfigure exim4-config
```
Ou installer sendmail
```bash
sudo apt-get install sendmail
```

Installer apticron
------------------
```bash
sudo apt-get install apticron
```

### Configurer pour recevoir les mails
```bash
sudo vim /etc/apticron/apticron.conf
```
