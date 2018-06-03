Linux
=====

Désactiver IPV6 avec la méthode SYSCTL
--------------------------------------

Il faut passer plusieurs instructions à sysctl pour désactiver IPV6. On désactive ipv6 pour toutes les interfaces :

sysctl -w net.ipv6.conf.all.disable_ipv6=1
On désactive l’auto configuration pour toutes les interfaces :

sysctl -w net.ipv6.conf.all.autoconf=0
On désactive ipv6 de la configuration par défaut :

sysctl -w net.ipv6.conf.default.disable_ipv6=1
On désactive l’auto configuration par défaut :

sysctl -w net.ipv6.conf.default.autoconf=0
Bonne nouvelle, la configuration est prise en compte en temps réel. Il suffit de refaire un ifconfig ou un more /proc/net/if_inet6 pour vérifier que inet6 n’apparait plus pour le premier et que le fichier est vide pour le second.

 Graver dans le marbre
Dernière étape, écrire ces instructions en dur dans le fichier /etc/sysctl.conf. D’abord vérifier qu’il n’y a pas déjà des instructions à ce sujet dans le fichier, et si tout est ok, ajouter en fin de fichier les instructions suivantes :

# désactivation de ipv6 pour toutes les interfaces
net.ipv6.conf.all.disable_ipv6 = 1

# désactivation de l’auto configuration pour toutes les interfaces
net.ipv6.conf.all.autoconf = 0

# désactivation de ipv6 pour les nouvelles interfaces (ex:si ajout de carte réseau)
net.ipv6.conf.default.disable_ipv6 = 1

# désactivation de l’auto configuration pour les nouvelles interfaces
net.ipv6.conf.default.autoconf = 0
Pour que les modifications soient prises en compte immédiatement :

# sysctl -p
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.all.autoconf = 0
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.default.autoconf = 0
Dernière étape, je pense optionnelle, mais dans le doute… Commenter les instructions ipv6 du fichier /etc/network/interfaces

# more /etc/network/interfaces 
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 91.121.196.109
    netmask 255.255.255.0
    network 91.121.196.0
    broadcast 91.121.196.255
    gateway 91.121.196.254

#iface eth0 inet6 static
#    address 2001:41D0:1:CD6b::1
#    netmask 128
#    post-up /sbin/ip -f inet6 route add 2001:41D0:1:CDef:ff:ff:ff:ff dev eth0
#    post-up /sbin/ip -f inet6 route add default via 2001:41D0:1:Ceff:ff:ff:ff:ff
#    pre-down /sbin/ip -f inet6 route del default via 2001:41D0:1:Ceff:ff:ff:ff:ff
#    pre-down /sbin/ip -f inet6 route del 2001:41D0:1:Ceff:ff:ff:ff:ff dev eth0
Et voilà. Un reboot pour la forme et vérifier que tout est bien en place.
