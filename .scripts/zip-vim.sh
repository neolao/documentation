#!/bin/bash

scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)
filePath="$currentDirectory/../vim.zip"

if [ -f $filePath ]
then
    rm $filePath
fi

cd $HOME
zip -9 -r $filePath .vim
zip -9 $filePath .vimrc

