Elastic Block Store
===================

Monter un disque attaché à une instance EC2
-------------------------------------------

Lister les disques disponibles :

```bash
lsblk
```

Formater en ext4 :

```bash
sudo mkfs -t ext4 /dev/xvdf
```

Monter le volume :

```bash
sudo mount /dev/xvdf /newvolume/
```

Activer le montage automatique :

```bash
sudo cp /etc/fstab /etc/fstab.bak
sudo vim /etc/fstab
```

```
/dev/xvdf       /newvolume   ext4    defaults,nofail
```

Vérifier qu'il n'y a pas d'erreur :

```bash
sudo mount -a
```
