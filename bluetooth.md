Bluetooth
=========

Connexion en Low Energy
-----------------------

Scan :

```bash
sudo hcitool lescan
```

```bash
sudo hcitool -i hci0 lecc --random E7:E8:95:C7:C4:0A
```

```bash
sudo gatttool -i hci0 -b E7:E8:95:C7:C4:0A -I
```

