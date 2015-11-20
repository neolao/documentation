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
