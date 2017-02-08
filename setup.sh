#!/bin/bash

#install neccessary apps and libs
#sudo apt-get install build-essential openssh-server gedit-plugins unzip zip subversion libssl-dev git gitk minicom autoconf automake gnupg 
#sudo apt-get install cmake flex bison gperf zip curl gcc-multilib g++-multilib libtool wget gparted ssh ncurses-dev u-boot-tools lzop 
#sudo apt-get install module-init-tools realpath openconnect phablet-tools device-tree-compiler 
sudo apt-get update 


dir=$PWD
#list of files to make symlink to them:
files=".bash_aliases .gitconfig .vimrc"


for file in $files; do
	echo "Creating symlink to $file in user's home directory"
	ln -s $dir/$file ~/$file 2>/dev/null
done

echo ""
echo "Finished"
