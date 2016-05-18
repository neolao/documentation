OpenELEC
========

tvheadend: no free adapter
--------------------------

Il faut créer le fichier `/storage/.config/autostart.sh` :

```bash
#!/bin/bash

hdhomerun_config discover
tvheadend.start
```


