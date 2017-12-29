DOCKER
======

Utiliser docker sans `sudo`
---------------------------

Il faut ajouter l'utilisateur courant dans le groupe `docker` :

```bash
sudo gpasswd -a ${USER} docker
```

Erreur `Can't set cookie dm_task_set_cookie failed`
---------------------------------------------------

Exécuter :
```bash
echo 'y' | sudo dmsetup udevcomplete_all
```
