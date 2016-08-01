Monitoring
==========

Utilisation du disque
---------------------

```bash
df -hl | awk '/^\/dev\/sd[ab]/ { sum+=$5 } END { print sum }'
```

Dernière connexion
------------------

À mettre dans `~/.ssh/rc` :

```bash
message="$(date +"%Y-%m-%d %H:%M"): ${USER}"

curl --data-urlencode "value=$message" "http://jeedom.url/core/api/jeeApi.php?apikey=1234&type=httpRemoteEvent&eqId=40"
```


cron
----

```
@daily /home/neolao/cron/monitoring-disk-usage.sh > /dev/null 2>&1
```
