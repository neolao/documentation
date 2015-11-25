Redis
=====

Lancer sur OSX
--------------

```bash
redis-server /usr/local/etc/redis.conf
```

Voir les infos
--------------

Se connecter avec :

```bash
redis-cli -p 6379 -h 127.0.0.1
```

Puis taper :

```
info
```

Augmenter la mémoire
--------------------

Se connecter avec :

```bash
redis-cli -p 6379 -h 127.0.0.1
```

Puis taper :

```
config set maxmemory "1024000000"
```



