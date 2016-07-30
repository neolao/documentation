Monitoring
==========

Utilisation du disque
---------------------

```bash
df -hl | awk '/^\/dev\/sd[ab]/ { sum+=$5 } END { print sum }'
```


cron
----

```
@daily /home/neolao/cron/monitoring-disk-usage.sh > /dev/null 2>&1
```
