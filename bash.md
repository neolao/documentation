# Bash

## Options

```bash
usage() {
cat <<USAGE
Usage: $0 [OPTIONS] [-d directory] [-t test] file
  -h   Show help
USAGE
}

while getopts "hd:t:" options; do
    case $options in
       h ) usage
           exit;;
       d ) directory=$OPTARG;;
       t ) test=OPTARG;;
       * ) usage
           exit;;
    esac
done
```

## Paramètres venant d’un fichier
```bash
list=""
while IFS= read -r file
do
   [ -f "$file" ] && list="$list $file"
done < "mon-fichier.txt"

echo $list
```

## Le premier argument
```bash
file=$1
```

## Tester l’existence d’un dossier
```bash
if [ ! -e "/path/to/directory" ]
then
    echo "Le dossier n'existe pas";
    exit;
fi
if [[ -d $from && -d $to ]]
then
    echo "Les dossiers existent";
    exit;
fi
```


## Tester une chaine
```bash
if echo "$chaine" | grep -Eq '.*truc.*'
then
    echo "ok"
else
    echo "ko"
fi
```

## Tester une URL
```bash
function isLive {
    wget -q --spider $1
    if [ $? -eq 0 ]; then
        echo "[OK] $1"
    else
        echo "[  ] $1"
    fi
}

isLive "http://neolao.com"
```

## Envoyer un mail
```bash
echo "message" | mail contact@hostname
```

## Effacer tous les dossiers .svn
```bash
find . -name ".svn" -type d -exec rm -rf {} \;
find . -name ".svn" -type d -delete
```

## Trouver tous les fichiers contenant “Toto”
```bash
find . -name "description.xml" -type f -exec grep -l "Toto" {} \;
```

## Copier d’après une recherche sur un des fichiers
```bash
find . -name "description.xml" -type f -exec grep -l "Toto" {} \; | while read filename; do cp /path/to/file $(dirname $filename); done
```

## Afficher les clients qui ont un pattern dans leur config
```bash
for client in /path/to/dir/*;
do
    grep -q "contentPattern" $client/config.xml && echo $(basename $client);
done
```

## Poser une question
```bash
read -p "Dry run ? [y/n]" answer
case $answer in
    [Yy]* ) echo "Yes";;
    [Nn]* ) echo "No";;
        * ) echo "I don't understand, bye bye ...";;
esac
```

## Trouver le type d’un fichier
```bash
file -skz /path/to/file
```

## Script à plusieurs options
```bash
#!/bin/bash

scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)

# Colors
Reset='\e[0m'           # Text Reset
Yellow='\e[1;33m'       # Yellow
Green='\e[1;32m'        # Green

# Usage display
usage() {
    echo -e "${Yellow}USAGE${Reset}"
    echo -e "${Yellow}-----${Reset}"
    echo -e "    $0 [${Green}action${Reset}]"
    echo ""
    echo -e "${Yellow}ACTIONS${Reset}"
    echo -e "${Yellow}-------${Reset}"

    echo -e "    - ${Green}action1${Reset}      : Action 1"
    echo -e "    - ${Green}action2]${Reset}     : Action 2"
    echo ""
}

# Switch
case $1 in
    action1 ) echo "Action 1 !!!"
        exit;;

    action2 ) echo "Action 2 !!!"
        exit;;

    * ) usage
        exit;;
esac
```

## Script qui complète les sous-titres
```bash
#!/bin/bash

scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)

target=$(readlink -e "$1")
createMerge=$2

if [[ -d $target ]]
then
    filePaths=$(find $target -type f \( -name "*.mkv" ! -name "*VOSTFR*" -or -name "*.avi" ! -name "*VOSTFR*" -or -name "*.mp4" ! -name "*VOSTFR*" \) )
    for filePath in $filePaths
    do
        file=${filePath##*/}
        name=${file%.*}
        extension=${file##*.}
        directory=${filePath%$file}

        # Check subtitle
        subtitle="$directory$name.srt"
        subtitle2="$directory$name.fr.srt"
        subtitle3="$directory$name.fra.srt"
        if [[ ! -f $subtitle && ! -f $subtitle2 && ! -f $subtitle3 ]]
        then
            echo "The subtitle is missing: $filePath"
            subliminal -l fr --addic7ed-username neolao --addic7ed-password tototo $filePath
        fi

        # Check merged version
        if [[ $createMerge == "merge" ]]
        then
            merged="$directory$name.VOSTFR.mkv"
            if [[ ! -f $merged ]]
            then
                $currentDirectory/create-mkv.sh $filePath
            fi
        fi
    done
fi
```

## Quitter un script
```bash
trap ctrl_c INT

function ctrl_c() {
    echo "** Trapped CTRL-C"
}
```

```bash
trap "exit" INT
```

## Chemin absolu

```bash
DIRECTORY_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
```
