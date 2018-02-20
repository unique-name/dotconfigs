#!/bin/bash

dir=$PWD
#list of files to make symlink to them:
files=".bash_aliases .gitconfig .vimrc .vim"

#installing vundle manager
if [ ! -d "$dir/.vim/bundle/vundle" ]; then
	echo "Installing vundle for vim"
	git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle 1>/dev/null
fi

for file in $files; do
	echo "Creating symlink to $file in user's home directory"
	ln -s $dir/$file ~/$file 2>/dev/null
done

echo "Creating symlink to diff-so-fancy in /usr/local/bin directory"
sudo ln -s $dir/diff-so-fancy /usr/local/bin/diff-so-fancy 2>/dev/null

if ! grep -Fq "bash-functions" ~/.bashrc; then
	echo "" >> ~/.bashrc
	echo "if [ -f ~/dotconfigs/bash-functions ]; then" >> ~/.bashrc
	echo "  . ~/dotconfigs/bash-functions" >> ~/.bashrc
	echo "fi" >> ~/.bashrc
fi

#installing additional features:
echo Installing vim Powerline plugin. Please wait... 
pip install --user git+git://github.com/Lokaltog/powerline 1>/dev/null
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf 2>/dev/null

if [ ! $? -eq 0 ]; then 
	echo Error in Powerline installation! 
	exit 1
fi

mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts 1>/dev/null
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

echo Installing vim YouCompleteMe plugin. This will take a time...
if [ ! -d "$dir/.vim/bundle/YouCompleteMe" ]; then
	cd $dir/.vim/bundle/
	git clone https://github.com/Valloric/YouCompleteMe.git 1>/dev/null
	cd YouCompleteMe
	git submodule update --init --recursive 1>/dev/null
	./install.py --clang-completer 1>/dev/null
	cd $dir
else 
	echo YouCompleteMe already installed!
fi

echo ""
echo "In vim enter the command: :PluginInstall"
echo "Finished"
