Capifony
========

Installation
------------

[https://rvm.io/rvm/install](https://rvm.io/rvm/install)

```bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo curl -sSL https://get.rvm.io | bash

gem install capifony
```

Problème de connexion au serveur
--------------------------------

Utiliser la version `3.1.1` de `net-ssh` :

```bash
sudo gem install net-ssh --version 3.1.1
sudo gem uninstall net-ssh
```

Et retirer les autres versions

Erreur no tty
-------------

`sudo : no tty present and no askpass program specified`

Rajouter ce paramètre :

```
default_run_options[:pty] = true
```
