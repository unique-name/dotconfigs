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

echo Installing vim powerline plugin 
pip install --user git+git://github.com/Lokaltog/powerline

pip install --user git+git://github.com/Lokaltog/powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
echo ""
echo "In vim enter the command: :PluginInstall"
echo "Finished"
