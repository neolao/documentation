MAC
===

Créer un ram disk
-----------------

Pour 256M, il faut calculer `256 x 2048 = 524288`:

```bash
diskutil erasevolume HFS+ 'RAMDisk' `hdiutil attach -nomount ram://524288`
```

Le disque a été monté par défaut dans `/Volumes/RAMDisk`.

Pour le monter :

```bash
mount -t hfs /dev/disk5 /Users/neolao/ram
```


Notification
------------

```bash
osascript -e 'display notification "Lorem ipsum dolor sit amet" with title "Title"'
```


Voix
----

```bash
say "hello"
```


Erreur `unable to create pipe Too many open files in system`
------------------------------------------------------------

```bash
sysctl kern.maxfiles
```

https://superuser.com/questions/433746/is-there-a-fix-for-the-too-many-open-files-in-system-error-on-os-x-10-7-1


Voir les répertoires NFS partagés d'une machine distante
--------------------------------------------------------

```bash
showmount -e 10.0.1.8
```

Touche `cmd` bloqué virtuellement
---------------------------------

https://discussions.apple.com/thread/4815782?answerId=26823873022#26823873022

- Aller dans accessibilité
- Clavier
- Activer et désactiver les touches à auto-maintien
