Monitoring
==========

Utilisation du disque
---------------------

```bash
df -hl | awk '/^\/dev\/sd[ab]/ { sum+=$5 } END { print sum }'
```

Dernière connexion
------------------

À mettre dans `/etc/ssh/sshrc` :

```bash
ip=$(echo $SSH_CLIENT|awk '{print $1}')
message="NS11 [$(date +"%Y-%m-%d %H:%M")] ${USER} ($ip)"

curl --data-urlencode "value=$message" "http://jeedom.url/core/api/jeeApi.php?apikey=1234&type=httpRemoteEvent&eqId=40" > /dev/null 2>&1
```

Nombre de mises à jour disponibles
----------------------------------

```bash

count=$(aptitude search '~U' | wc -l)
```

Liste des mises à jour disponibles
----------------------------------

```bash
list=$(apt list --upgradable)
```


cron
----

```
@daily /home/neolao/cron/monitoring-disk-usage.sh > /dev/null 2>&1
@daily /home/neolao/cron/monitoring-available-upgrade.sh > /dev/null 2>&1
```
