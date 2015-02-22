#!/bin/bash

# Install the .*rc files

# Get path of this script
BASEDIR=$(pwd)

echo "(1/3): Making backups."
# Check for existing backups and remove them
if [ -e ~/.vimrc_backup ];
then
    rm ~/.vimrc_backup
fi
if [ -e ~/.zshrc_backup ];
then
    rm ~/.zshrc_backup
fi
if [ -e ~/.ideavimrc_backup ];
then
    rm ~/.ideavimrc_backup
fi
if [ -d ~/.vim/bundle_backup ];
then
    rm -rf ~/.vim/bundle_backup
fi

# Make backups
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
# Backup existing Vim Pathogen bundles
if [ -d ~/.vim/bundle ];
then
    cp -rp ~/.vim/bundle ~/.vim/bundle_backup
    rm -rf ~/.vim/bundle
fi

echo "(2/3): Symlinking ~/**.rc files."
ln -s $BASEDIR/.vimrc ~/.vimrc
ln -s $BASEDIR/.zshrc ~/.zshrc
ln -s $BASEDIR/.ideavimrc ~/.ideavimrc
# Symlink Pathogen bundles
echo "(3/3): Symlinking Vim Pathogen bundles."
ln -s $BASEDIR/vim-bundles ~/.vim/bundle

echo "Done!"
exit 0

