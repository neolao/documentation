USB UIRT
========

Installation
------------

Configuration sur un Raspberry Pi

Installer LIRC :

```bash
sudo apt-get install lirc
```

Trouver le tty de l'appareil :

```bash
dmesg | grep -i usb
```

Configurer `/etc/lirc/hardware.conf` :

```
# Arguments which will be used when launching lircd
LIRCD_ARGS="--device=/dev/ttyUSB0 --uinput"

#Don't start lircmd even if there seems to be a good config file
#START_LIRCMD=false

#Don't start irexec, even if a good config file seems to exist.
#START_IREXEC=false

#Try to load appropriate kernel modules
LOAD_MODULES=true

# Run "lircd --driver=help" for a list of supported drivers.
DRIVER="uirt2_raw"
# usually /dev/lirc0 is the correct setting for systems using udev
DEVICE=""
MODULES=""

# Default configuration files for your hardware if any
LIRCD_CONF=""
LIRCMD_CONF=""
```

Créer une télécommande et apprendre des boutons
-----------------------------------------------

```bash
irrecord --device=/dev/ttyUSB0 --driver=uirt2_raw --disable-namespace TV_PHILIPS
```

Suivre les instructions pour créer au final un fichier `TV_PHILIPS.conf`.


Déplacer le fichier dans `/etc/lirc/remotes/TV_PHILIPS.conf`.

Le fichier `/etc/lirc/lircd.conf` ressemble à ça :

```
include "/etc/lirc/remotes/TV_PHILIPS.conf"
```


Envoyer une commande
--------------------

```bash
irsend SEND_ONCE TV_PHILIPS MUTE
```


