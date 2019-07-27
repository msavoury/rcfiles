#!/bin/bash
# Creates backups of dotfiles and then symlinks them to your home directory
DATETIME=`date "+%Y%m%d%.%H_%M_%S"`

declare -a dotfiles=("bashrc" "vimrc" "gitconfig" "screenrc")

echo "Installing dotfiles..."
for i in ${dotfiles[@]};
do
    file=$i
    dotfile="~/.$file"
    backup=~/.$file.bak.$DATETIME
    echo "$dotfile"
    if [ -f ~/.$file ] || [ -L ~/.$file ] ; then
	echo "$dotfile exists, making backup: $backup"
        cp ~/.$file $backup
	rm  ~/.$file
    fi

    echo "Creating symlink: ln -s $file ~/.$file"
    source="$(cd "$(dirname "$file")"; pwd -P)/$(basename "$file")"
    ln -s $source ~/.$file 
    echo "==="
done
echo "Done."
