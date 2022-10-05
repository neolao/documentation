# Anbernic

## RG353P

Installer le dossier `~/syncthing` : https://syncthing.net/downloads/

Lancer une fois :
```bash
cd /userdata/system/syncthing
./syncthing generate
```

Créer le fichier `~/syncthing.sh` :

```bash
#!/bin/bash

cd /userdata/system/syncthing
./syncthing --gui-address 0.0.0.0:8384 &
```

Créer le fichier `~/custom.sh` :

```bash
#!/bin/bash

~/syncthing.sh
```
