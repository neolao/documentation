Linux
=====

Déterminer l'encodage d'un fichier texte
----------------------------------------

```bash
file -bi mon-fichier.txt
```

Convertir l'encodage d'un fichier texte
---------------------------------------

```bash
iconv -f ISO_8859-1 -t UTF8 mon-fichier.txt > mon-nouveau-fichier.txt
```

Changer le mot de passe
-----------------------

```bash
passwd toto
```

Changer le disque d'installation de GRUB
----------------------------------------

```bash
sudo upgrade-from-grub-legacy
```

Dynamic Kernel Module Support
-----------------------------

```bash
apt-get install dkms linux-source
```

Afficher le nom du serveur
--------------------------

```bash
hostname
```

Changer le nom du serveur
-------------------------

```bash
hostname newName
```

Configurer le clavier
---------------------

```bash
loadkeys fr
```

Configurer le terminal
----------------------

```bash
apt-get install console-tools
dpkg-reconfigure console-data
```

Reconfigurer la locale
----------------------

```bash
apt-get install locales
dpkg-reconfigure locales
```

Vérifier le nombre de check disk
--------------------------------

```bash
tune2fs -l /dev/hda1
```

Désactiver le check disk
------------------------

```bash
tune2fs -c 0 -i 0 /dev/hda1
```

Liste des raccourcis clavier
----------------------------

```bash
bind -P
```

Désactiver l'économiseur d'écran console
----------------------------------------

```bash
vim /etc/console-tools/config
```

Trouver les liens symboliques
-----------------------------

```bash
find -type l
```

Afficher les adresses IP de la machine
--------------------------------------

```bash
ifconfig -a | grep 'inet addr:' | cut -f2 -d: | awk '{print "IP       : " $1}'
```

Attribuer une adresse IP à une interface réseau
-----------------------------------------------

```bash
ifconfig eth1 192.168.56.101
```

Changer le timezone
-------------------

```bash
dpkg-reconfigure tzdata
```

Mettre à jour l'heure
---------------------

```bash
sudo apt-get install ntp ntpdate
sudo /usr/sbin/ntpdate fr.pool.ntp.org
```

Changer le timezone
-------------------

```bash
tzselect
```

Installer Gnome sur une Debian
------------------------------

```bash
sudo apt-get install aptitude tasksel
sudo tasksel install gnome-desktop --new-install
```


Mettre à jour la liste des IDs USB
----------------------------------

```bash
update-usbids
```


Lister les USB connecté
-----------------------

```bash
lsusb
```


Configurer le wifi
------------------

Faire une recherche Google sur http://wiki.debian.org/ pour trouver ce qu'il faut installer.

```bash
sudo apt-get install wireless-tools firmware-ralink firmware-realtek firmware-iwlwifi
```

```bash
ifconfig wlan0 up
iwlist wlan0 scan
```

Configurer l'auto connexion

```bash
vim /etc/network/interfaces
```

Ajouter :

```
auto wlan0
iface wlan0 inet dhcp
    wpa-ssid monreseau
    wpa-psk monmotdepasse
```

Relancer le réseau :

```bash
service networking restart
```




Changer de shell
----------------

```bash
chsh -s /bin/bash
```

```bash
chsh -s /usr/local/bin/fish
```

Lister les paquets inutilisés
-----------------------------

```bash
deborphan
```

Créer un faux fichier avec une taille
-------------------------------------

```bash
fallocate -l 10G plop
```

Problème d'écran noir au bout de 10 min
---------------------------------------

```bash
sudo xset -display :0 s off -dpms
```

### Reactiver

```bash
sudo xset -display :0 s on +dpms
```


Créer un montage RAM
--------------------

```bash
sudo mkdir -p /ram
sudo mount -t tmpfs -o size=100m tmpfs /ram
```


Problème de locale PERL
-----------------------

Éditer @/etc/default/locale@ :

```
LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
```

Sinon :

```bash
sudo apt-get purge locales
sudo aptitude install locales
sudo dpkg-reconfigure locales
```

Connaitre la version de debian
------------------------------

```bash
lsb_release -d
```


Créer un SOCKS Proxy
--------------------

Sur la machine distante :

```bash
ssh -N -D 0.0.0.0:1080 localhost
```

Puis modifier la config du navigateur pour utiliser la machine distante sur le port `1080`.


Augmenter le nombre de fichier qu'on peut watch
-----------------------------------------------

```bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```
