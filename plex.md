Plex
====

Après l'installation sur un serveur, il faut pouvoir accéder au site web via 127.0.0.1.

```bash
ssh -i key.pem -f -L 32400:127.0.0.1:32400 user@mywebsite.com sleep 10; open http://127.0.0.1:32400
```
