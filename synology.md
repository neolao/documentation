Synology
========

Monter un disque
----------------

```bash
sudo mdadm --examine --scan /dev/sdx3
```

On obtient un truc comme ça :

```
ARRAY /dev/md3 level=raid1 num-devices=2 UUID=db7c8f07:6f0f4570:852c2e22:a378fec9
```

On scanne ce qui est déjà monté pour prendre une place libre :

```bash
sudo mdadm –detail –scan
```

On obtient :

```
ARRAY /dev/md1 metadata=0.90 UUID=f07f5754:cf6f8af4:663cbd89:1480ea74
ARRAY /dev/md2 metadata=1.1 name=ds201j:2 UUID=17f442a7:d767633b:a4fc4e5b:88db9d4b
```

Donc `/dev/md3` est libre.

```bash
sudo mdadm -A –verbose –run /dev/md3 /dev/sdx3
sudo mount /dev/md3 /mnt/usb
```
