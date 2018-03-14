Elasticsearch
=============

Installation sur Jessie
-----------------------

```bash
echo "deb http://http.debian.net/debian jessie-backports main" | \
      sudo tee --append /etc/apt/sources.list.d/jessie-backports.list > /dev/null
```

```bash
sudo apt-get update
sudo apt-get install -t jessie-backports openjdk-8-jdk
```

Vérifier le Java par défaut :

```bash
sudo update-alternatives --config java
```

Installer Elasticsearch :

```bash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update && sudo apt-get install elasticsearch
```

Modifier si nécessaire la mémoire de Java dans `/etc/elasticsearch/jvm.options` :

```
-Xms1g
-Xmx1g
```

```
-Xms256m
-Xmx256m
```

Tester :

```bash
curl http://localhost:9200
```
