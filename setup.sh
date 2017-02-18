#!/bin/bash

dir=$PWD
#list of files to make symlink to them:
files=".bash_aliases .gitconfig .vimrc .vim"

#installing additional features:
if [ ! -d "$dir/.vim/bundle/vundle" ]; then
	echo "Installing vundle for vim"
	git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle 1>/dev/null
fi

for file in $files; do
	echo "Creating symlink to $file in user's home directory"
	ln -s $dir/$file ~/$file 2>/dev/null
done

echo ""
echo "In vim enter the command: :PluginInstall"
echo "Finished"
