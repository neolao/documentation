mdadm
=====

Désactiver le RAID
------------------

Regarder les RAID actifs et identifier les disques:
```bash
cat /proc/mdstat
```

Passer en mode rescue.

Refaire `cat /proc/mdstat` car le nom du raid a changé (mais pas les disques).

Arrêter le raid:
```bash
mdadm --stop /dev/md3
mdadm --remove /dev/md3
```

Effacer les "Superblocks"
```bash
mdadm --zero-superblock /dev/sda3 /dev/sdb3
```
