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
	ln -fs $dir/$file ~/$file 2>/dev/null
done

echo "Creating symlink to diff-so-fancy in /usr/local/bin directory"
sudo ln -fs $dir/diff-so-fancy /usr/local/bin/diff-so-fancy 2>/dev/null

if ! grep -Fq "bash-functions" ~/.bashrc; then
	echo "" >> ~/.bashrc
	echo "if [ -f ~/dotconfigs/bash-functions ]; then" >> ~/.bashrc
	echo "  . ~/dotconfigs/bash-functions" >> ~/.bashrc
	echo "fi" >> ~/.bashrc
	# Adding dirtrim by the way
	echo "" >> ~/.bashrc
	echo "PROMPT_DIRTRIM=2" >> ~/.bashrc
fi

echo Installing vim Powerline plugin. Please wait... 
sudo apt install -y python3-pip
pip3 install -U pip
pip3 install powerline-status

if [ ! $? -eq 0 ]; then 
	echo Error in Powerline installation! 
	exit 1
fi

echo Installing vim YouCompleteMe plugin. This will take a time...
if [ ! -d "$dir/.vim/bundle/YouCompleteMe" ]; then
	cd $dir/.vim/bundle/
	git clone --quiet https://github.com/Valloric/YouCompleteMe.git 1>/dev/null
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
