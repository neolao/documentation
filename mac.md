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
