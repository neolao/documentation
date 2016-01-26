dd
==

Simple way to backup your device data is to create image (.img or .iso) file. You can even create image file for your folder.

To view device file of SD card use below command

```bash
fdisk -l
```

```bash
diskutil list
```

Lets say if your SD card is /dev/sdb then you can create image using

```bash
dd if=/dev/sdb of=./SDC_Backup.img bs=4096
```

If you want to restore data then you can use same command but with input and output swapped

```bash
dd if=./SDC_Backup.img of=/dev/sdb
```

This is very simple way to backup your data. You can even create image for HDD data.


Créer un faut disque
--------------------

```bash
dd if=/dev/zero of=disk.img bs=1M count=5000
```
