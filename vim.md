VIM
===

Redimensionner la liste des fichiers
------------------------------------

```
:vertical resize +5
:vertical resize -5
```

Déplacer les onglets
--------------------

```
:tabm 3
:tabm +1
:tabm -1
```

Redimensionner le NERDTree
--------------------------

For vertical resizing use the following command:

| Command    | Description |
| ---------- | ----------- |
| `CTRL-W -` | Decrease current window height by N (default 1). |
| `CTRL-W +` | Increase current window height by N (default 1). |

Explanation:

In command mode, press a number `N` then press `CTRL+W` then press `-` or `+` to resize the window by `N` rows.
Or just press `CTRL+W` and then press `-` or `+` to resize the window by `1` row.
Or, you can type `:res +/-N`. Like: `:res +10`

For Horizontal resizing use the following command:

| Command    | Description |
| ---------- | ----------- |
| `CTRL-W <` | Decrease current window width by N (default 1). |
| `CTRL-W >` | Increase current window width by N (default 1). |
Explanation:

In command mode, press a number `N` then press `CTRL+W` then press `<` or `>` to resize the window by `N` columns.
Or just press `CTRL+W` and then press `<` or `>` to resize the window by 1 column.
Or, you can type `:vertical res +/-N`. Like: `:vertical res +10`

Nombre de lignes visibles au scroll
-----------------------------------

```
:set scrolloff=20
```
