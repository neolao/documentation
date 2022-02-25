fdisk
=====


Formater FAT32
--------------

```bash
sudo fdisk /dev/sdq
```

Choisir `W95 FAT32`.

```bash
sudo mkdosfs -F 32 /dev/sdq1
```

ou

```bash
sudo mkfs -t vfat /dev/sdq1
```

Créer un disque ext4
--------------------

```bash
sudo fdisk /dev/sdb
sudo mkfs.ext4 /dev/sdb1
sudo mount /dev/sdb1 /mnt
```
