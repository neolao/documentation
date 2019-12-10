mount
=====

Monter un disque "linux_raid_member"
------------------------------------

Éxaminer :
```bash
sudo mdadm --examine /dev/sdq3
```

Créer un RAID virtuel :
```bash
sudo mdadm -A -R /dev/md9 /dev/sdq3
```

Monter normalement :
```bash
sudo mount /dev/md9 /volume3/
```

Supprimer le RAID :
```bash
sudo mdadm -S /dev/md9
```
