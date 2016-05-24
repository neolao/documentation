Raspberry PI
============

Sur Raspbian, configuration
---------------------------

```bash
sudo raspi-config
``` 

Mettre à jour les firmwares
---------------------------

```bash
sudo rpi-update
```

Configurer le terminal
----------------------

```bash
sudo dpkg-reconfigure console-setup
```

Wifi
----

http://www.raspberrypi.org/forums/viewtopic.php?p=462982#p462982
http://dl.ciph.se/raspberrypi/

Télécharger le bon fichier par rapport à la version du kernel

```bash
uname -r
```

```bash
sudo cp rtl8188eufw.bin /lib/firmware/rtlwifi/
sudo install -p -m 644 8188eu.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
sudo insmod /lib/modules/$(uname -r)/kernel/drivers/net/wireless/8188eu.ko
sudo depmod -a
```

Ou en dur dans `/etc/network/interfaces`

```
auto wlan0
iface wlan0 inet dhcp
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
    wpa-ssid lamaison
    wpa-psk monmotdepasse
```

```bash
ifup wlan0
```


Bluetooth
---------

```bash
sudo apt-get install -y bluetooth bluez-utils blueman
hcitool scan
sudo bluetooth-agent 0000 AC:22:0B:65:FD:AA
```

Editer `/etc/bluetooth/rfcomm.conf`

```
rfcomm0 {
    # Automatically bind the device at startup
    bind yes;
    # Bluetooth address of the device
    device 11:22:33:44:55:66;
    # RFCOMM channel for the connection
    channel 3;
    # Description of the connection
    comment "This is Device 1's serial port.";
}
```

```bash
sudo rfcomm connect rfcomm0
```

### Script d'auto acceptation

`/etc/init.d/bluetooth-agent`

```
### BEGIN INIT INFO
# Provides: bluetooth-agent
# Required-Start: $remote_fs $syslog bluetooth pulseaudio
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Makes Bluetooth discoverable and connectable to 0000
# Description: Start Bluetooth-Agent at boot time.
### END INIT INFO
#! /bin/sh
# /etc/init.d/bluetooth-agent
USER=root
HOME=/root
export USER HOME
case "$1" in
start)
echo "setting bluetooth discoverable"
sudo hciconfig hci0 piscan
start-stop-daemon -S -x /usr/bin/bluetooth-agent -c pi -b -- 0000
echo "bluetooth-agent startet pw: 0000"
;;
stop)
echo "Stopping bluetooth-agent"
start-stop-daemon -K -x /usr/bin/bluetooth-agent
;;
*)
echo "Usage: /etc/init.d/bluetooth-agent {start|stop}"
exit 1
;;
esac
exit 0
```




Utiliser la caméra
------------------

http://www.raspberrypi.org/documentation/usage/camera/raspicam/README.md

### Désactiver la LED

```bash
sudo vim /boot/config.txt
```

```
disable_camera_led=1
```


Sortie audio
------------

Trouver le numid pour le volume :

```bash
amixer contents
```

Modifier le volume :

```bash
amixer cset numid=1 -- 75%
```

Jouer un son WAV :

```bash
aplay /path/to/sound.wav
```

Jouer un son MP3 :

```bash
mpg321 /path/to/sound.mp3
```



Sortie vidéo
------------

```bash
sudo apt-get install omxplayer
```

```bash
omxplayer myvideo.mp4
```

Pour passer le son à travers le HDMI :

```bash
omxplayer -o hdmi myvide.mp4
```


### Raccourcis 

```
Space or p   Pause/Resume
q            Exit OMXPlayer
z            Show Info

-            Decrease Volume
+            Increase Volume

i            Previous Chapter
o            Next Chapter

Left Arrow   Seek -30
Right Arrow  Seek +30
Down Arrow   Seek -600
Up Arrow     Seek +600

1            Increase Speed
2            Decrease Speed

j            Previous Audio stream
k            Next Audio stream
n            Previous Subtitle stream
m            Next Subtitle stream
s            Toggle subtitles
d            Subtitle delay -250 ms
f            Subtitle delay +250 ms
```


Lancer Awesome
--------------

```bash
sudo apt-get install awesome
```

```bash
vim .xinitrc
```

```
ck-launch-session awesome
```

```bash
startx
```


Se connecter via Serial
-----------------------

```bash
ls -l /dev/ttyUSB0
```

```bash
sudo screen /dev/ttyUSB0 115200
```

Pour quitter : `ctrl+a k`


Raspberry Pi 3 Wifi
-------------------

```bash
sudo BRANCH=next rpi-update
sudo iwconfig wlan0 power off
```


Audio avec Hifiberry
--------------------

https://jeffskinnerbox.wordpress.com/2012/11/15/getting-audio-out-working-on-the-raspberry-pi/

```bash
sudo apt-get install alsa-utils mpg321 lame mplayer
```

```bash
speaker-test -t sine -f 440 -c 2 -s 1
```

```bash
curl "https://translate.google.com/translate_tts?ie=UTF-8&q=hello%20dear&tl=en&total=1&idx=0&textlen=10&tk=104594.502926&client=t&prev=input&ttsspeed=0.24" -o tts.mp3
mplayer -ao alsa:device=hw=0.0 tts.mp3
```

Il faut que l'utilisateur soit dans le groupe `audio` :

```
sudo adduser pi audio
```
