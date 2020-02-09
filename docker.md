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

Monter un volume en SSHFS
-------------------------

Installer le plugin
```bash
docker plugin install vieux/sshfs sshkey.source=/home/<user>/.ssh/
```

Dans `docker-compose.yml` :

```yaml
volumes:
  ssh_volume_test:
    driver: vieux/sshfs:latest
    driver_opts:
      sshcmd: "login@host:/path"
      allow_other: ""
```
