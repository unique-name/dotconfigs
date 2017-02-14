#!/bin/bash

#need for vim updates
#sudo add-apt-repository ppa:jonathonf/vim
#sudo apt-get update

#install neccessary apps and libs
#sudo apt-get install ubuntu-restricted-extras vim vim-nox build-essential openssh-server gedit-plugins unzip zip subversion libssl-dev git gitk minicom 
#sudo apt-get install cmake flex bison gperf zip curl gcc-multilib g++-multilib libtool wget gparted ssh ncurses-dev u-boot-tools lzop autoconf automake gnupg 
#sudo apt-get install module-init-tools realpath openconnect phablet-tools device-tree-compiler 
#sudo apt-get update 

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
