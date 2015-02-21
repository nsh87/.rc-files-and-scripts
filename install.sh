#!/bin/bash

# Install the .*rc files

BASEDIR=$(pwd)

echo "Backing up existing files..."
if [ -e ~/.vimrc ];
then
    mv ~/.vimrc ~/.vimrc_backup
fi
if [ -e ~/.zshrc ];
then
    mv ~/.zshrc ~/.zshrc_backup
fi
if [ -e ~/.ideavimrc ];
then
    mv ~/.ideavimrc ~/.ideavimrc_backup
fi

echo "Symlinking ~/**.rc files to files in this repo..."
ln -s $BASEDIR/.vimrc ~/.vimrc
ln -s $BASEDIR/.zshrc ~/.zshrc
ln -s $BASEDIR/.ideavimrc ~/.ideavimrc

echo "Done!"
exit 0

