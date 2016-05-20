gammu
=====

[http://fr.wammu.eu/phones/](http://fr.wammu.eu/phones/)

Avec la clé Huawei E220
-----------------------

```
[gammu]
GammuCoding = utf8
GammuLoc = fr_FR.UTF8
device = /dev/ttyUSB0
name = Phone on USB serial port HUAWEI_Technologies HUAWEI_Mobile
connection = at19200

[gammu1]
GammuCoding = utf8
GammuLoc = fr_FR.UTF8
device = /dev/ttyUSB1
name = Phone on USB serial port HUAWEI_Technologies HUAWEI_Mobile
connection = at19200

# SMSD configuration, see gammu-smsdrc(5)
[smsd]
service = files
logfile = /var/log/gammu-smsd.log
#logfile = syslog
# Increase for debugging information
debuglevel = 0
RunOnReceive = /var/www/html/RaspiSMS/parseSMS.sh
# Paths where messages are stored
inboxpath = /var/spool/gammu/inbox/
outboxpath = /var/spool/gammu/outbox/
sentsmspath = /var/spool/gammu/sent/
errorsmspath = /var/spool/gammu/error/
PIN = 0000
```

Avec la clé Huawei E353
-----------------------

```
[gammu]
GammuCoding = utf8
GammuLoc = fr_FR.UTF8
device = /dev/ttyUSB0
name = Phone on USB serial port HUAWEI_Technologies HUAWEI_Mobile
connection = at115200

[gammu1]
GammuCoding = utf8
GammuLoc = fr_FR.UTF8
device = /dev/ttyUSB1
name = Phone on USB serial port HUAWEI_Technologies HUAWEI_Mobile
connection = at115200

[gammu2]
GammuCoding = utf8
GammuLoc = fr_FR.UTF8
device = /dev/ttyUSB2
name = Phone on USB serial port HUAWEI_Technologies HUAWEI_Mobile
connection = at115200

# SMSD configuration, see gammu-smsdrc(5)
[smsd]
service = files
logfile = /var/log/gammu-smsd.log
#logfile = syslog
# Increase for debugging information
debuglevel = 0
RunOnReceive = /var/www/html/RaspiSMS/parseSMS.sh
# Paths where messages are stored
inboxpath = /var/spool/gammu/inbox/
outboxpath = /var/spool/gammu/outbox/
sentsmspath = /var/spool/gammu/sent/
errorsmspath = /var/spool/gammu/error/
PIN = 0000
```
