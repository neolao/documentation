MAC
===

Changer le répertoire par défaut des screenshots
------------------------------------------------

```bash
defaults write com.apple.screencapture location /Users/neolao/Screenshots
```

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

Erreur à l'installation de zsh
------------------------------

```
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
```

```bash
xcode-select --install
```

Empêcher le sleep
-----------------

Vérifier les préférences avec :
```bash
pmset -g
```

Désactiver :
```bash
sudo pmset -a disablesleep 1
```

Par défaut :
```bash
sudo pmset -a disablesleep 0
```

Forcer à quitter
----------------

Ouvrir la liste avec command + option + escape

Activer/Désactiver l'indexation Spotlight
-----------------------------------------

```bash
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
```

```bash
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
```
