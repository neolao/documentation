DOCKER
======

Utiliser docker sans `sudo`
---------------------------

Il faut ajouter l'utilisateur courant dans le groupe `docker` :

```bash
sudo gpasswd -a ${USER} docker
```
