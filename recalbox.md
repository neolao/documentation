Recalbox
========

Multijoueur
-----------

Editer `/etc/retroarch.cfg` et ajouter :

```
input_libretro_device_p2 = 257
```

Dans le menu retroarch, User 2 Device Type : Multitap
Configuration auto save : ON


Changer la résolution
---------------------

Dans le terminal :

```bash
tvservice -m CEA
```

Dans `recalbox.conf` :

```
global.videomode=CEA 31 HDMI
```

Montage réseau
--------------

Passer en read/write :

```bash
mount -o remount,rw /boot
```

Modifier `/boot/recalbox-boot.conf` :

```
sharedevice=NETWORK
sharenetwork_cmd1=mount -o nolock,proto=tcp 10.0.1.8:/volume2/recalbox/bios /recalbox/share/bios
sharenetwork_cmd2=mount -o nolock,proto=tcp 10.0.1.8:/volume2/recalbox/roms /recalbox/share/roms
sharenetwork_cmd3=mount -o nolock,proto=tcp 10.0.1.8:/volume2/recalbox/saves /recalbox/share/saves
sharenetwork_cmd4=mount -o nolock,proto=tcp 10.0.1.8:/volume2/recalbox/screenshots /recalbox/share/screenshots
```

Et ça c'est cadeau :

```
sharedevice=NETWORK
sharenetwork_smb1=BIOS@recalbox.neolao.com:roms:username=guest
sharenetwork_smb2=ROMS@recalbox.neolao.com:roms:username=guest
```
