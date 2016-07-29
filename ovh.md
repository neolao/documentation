OVH
===

Kernel de base
--------------

```bash
sudo apt-get install linux-image-server
sudo mount /dev/sda1 /mnt
sudo grub-install —root-directory=/mnt /dev/sda
sudo reboot
```

Linux headers
-------------

ftp://ftp.ovh.net/made-in-ovh/bzImage/

si tu utilise les sources d'ovh y te faut compiler le kernel 

ou alors passe sur le kernel de debian

```bash
apt-get install grub linux-image-2.6.26-2-amd64
update-grub

# par sécurité je réinstall le boot loader grub
grub-install /dev/sda
```

la je reboot et regarde au retour sur le kernel est bien installer

```bash
uname -r
```


Notification de la disponibilité d'un KIMSUFI
---------------------------------------------

```php
<?php
set_time_limit(0);

while (true) {
    $json = file_get_contents('https://ws.ovh.com/dedicated/r2/ws.dispatcher/getAvailability2');
    $data = json_decode($json);

    $available = false;
    foreach ($data->answer->availability as $availability) {
        $reference = $availability->reference;
        if ($reference !== '160sk1') {
            continue;
        }

        $metaZones = $availability->metaZones;
        foreach ($metaZones as $metaZone) {
            if (!in_array($metaZone->availability, ['unavailable', 'unknown'])) {
                $available = true;
                $date = new \DateTime;
                echo "\n", $date->format('[Y-m-d H:i:s]'), ' Available!', "\n";
                exec('osascript -e \'display notification "KIMSUFI disponible !!!" with title "OVH"\'');
                break;
            }
        }

        break;
    }

    if (!$available) {
        echo '.';
    }
    sleep(10);
}
```
