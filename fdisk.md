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
