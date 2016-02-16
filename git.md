git
===

Gérer les identités
-------------------
Éditer le fichier `~/.ssh/config` :

```
Host github-neolao
    HostName github.com
    User git
    IdentityFile /home/neolao/.ssh/id_rsa

Host github-superman
    HostName github.com
    User git
    IdentityFile /home/neolao/.ssh/superman-id_rsa 
```

On peut ensuite cloner comme ça

```bash
git clone git@github-neolao:user/his_repo.git
```


Configurer le nom et le mail pour un projet
-------------------------------------------

```bash
git config user.name "neolao"
git config user.email "contact@neolao.com"
```



Initialiser un dépôt
--------------------

```bash
git --bare init
```


Mettre à jour la liste des branches
-----------------------------------
```bash
git fetch origin
```


Lister les branches
-------------------

### Toutes les branches locales et distantes

```bash
git branch -a
```

### Lister les branches distantes

```bash
git branch -r
```


Changer de branche locale
-------------------------
```bash
git checkout test
```

Reinitialiser la branche
------------------------
```bash
git reset --hard
```

```bash
git reset --hard 115a127c72a7b77879ce47a1044ef39f51bb8682
```

```bash
git clean -f -d # remove untracked files
```

Reinitialiser un seul fichier
-----------------------------
```bash
git checkout HEAD -- myFile.txt
```

Fusionner les patchs locaux avec ceux de la branche distante public
-------------------------------------------------------------------
```bash
git rebase origin/master
```


Merger une branche vers la branche courante
-------------------------------------------
```bash
git merge 1.1
```

Créer une branche locale
------------------------
```bash
git checkout -b my_feature
```

Créer une branche distante
--------------------------
```bash
git push origin origin:refs/heads/new_feature_name
git fetch origin
git branch -r
git checkout --track -b new_feature_name origin/new_feature_name
git pull
```

Supprimer une branch locale
---------------------------
```bash
git branch -d myBranch
```

Supprimer une branch distante
-----------------------------
```bash
git push origin :myBranch
```

ou

```bash
git push origin --delete <branchName>
```

Pousser et créer une branch
---------------------------
```bash
git push origin myBranch
```


Tags
----

### Créer un tag

```bash
git tag -a 1.1.0
```

### Publier un tag

```bash
git push origin master : 1.1.0
```

### Supprimer un tag

```bash
git tag -d 1.1.0
git push origin :refs/tags/1.1.0
```

Commit en spécifiant une date
-----------------------------
```bash
git commit -a --date="Fri Apr 5 20:00 2013 +0100"
```

Publier
-------
```bash
git push git.neolao.com feature/123:feature-123
```


Transformer un répertoire de travail en dépôt
---------------------------------------------
```bash
git clone --bare /path/to/work /my/new/repository.git
```


Deuxième méthode, il faut copier le contenu du dossier @.git@ dans un nouveau, et indiquer ce c'est un dépôt.

```bash
cp -r /path/to/work/.git/* /my/new/repository.git/
cd /my/new/repository.git/
git config --bool core.bare true
```


Créer une branche orpheline (sans parent)
-----------------------------------------
```bash
git checkout --orphan gh-pages
```



Effacer des stash
-----------------
```bash
git stash list
```

```bash
git stash drop stash@{2}
```


Récupérer le hash d'une branche
-------------------------------
```bash
git rev-parse origin/1.1.x
```
