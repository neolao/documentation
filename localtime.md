localtime
=========

Changer la timezone en modifiant le lien symbolique :

```bash
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

