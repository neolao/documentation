VirtualBox
==========

Kernel spécifique OVH
---------------------

On repasse sur un kernel Ubuntu
```bash
mkdir ~/ovh.d/
apt-get install linux-image-server
mv /etc/grub.d/06_OVHkernel ~/ovh.d
update-grub
apt-get install linux-headers-generic
```

On redémarre
```bash
shutdown -r -f now
```

On installe Virtualbox
```bash
apt-get install virtualbox
```
