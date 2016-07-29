Monitoring
==========

Utilisation du disque
---------------------

```bash
df -hl | awk '/^\/dev\/sd[ab]/ { sum+=$5 } END { print sum }'
```
