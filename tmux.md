TMUX
====

Reload config
-------------

```
:source-file ~/.tmux.conf
```

Appliquer xterm-keys
--------------------

```
:set-window-option xterm-keys on
```

Détacher tous les autres de cette session
---
```bash
tmux detach -a
```

Changer le working directory pendant une session
---

Dans le prompt tmux:
```
:attach-session -t . -c /new/working/dir
```
