Soft RAID
=========

Désactiver
----------

Vérifier les disques :

```bash
sudo fdisk -l
```

Regarder le détail:

```bash
sudo mdadm --detail /dev/md3
```

Éteindre:

```bash
sudo mdadm --stop /dev/md3
```

```bash
sudo mdadm --zero-superblock /dev/sda3
sudo mdadm --zero-superblock /dev/sdb3
sudo mdadm --remove /dev/md3
```
