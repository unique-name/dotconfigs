#!/bin/bash

abort()
{
	echo -e "\nFailed to install some packages\n" 
}

trap 'abort' 0
set -e
   
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y install ssh meld ubuntu-restricted-extras gedit-plugins gitk minicom wget unzip zip \
	colordiff ccache vim openssh-server universal-ctags autotools-dev libssl-dev subversion \
	libtool gparted thunar cmake flex curl libicu-dev

# Boost libray
#sudo apt -y install libboost-all-dev

# Packages for Yocto host development
#sudo apt -y install gawk diffstat texinfo g++-multilib gcc-multilib bison chrpath socat xterm \
#cpio libsdl1.2-dev libelf-dev

# Packages for uboot development
#sudo apt -y install u-boot-tools lzop gnupg module-init-tools openconnect device-tree-compiler \
#icu-devtools expect

# install android tools
sudo apt -y install android-tools-adb android-tools-fastboot

# install ebook converter
#sudo apt -y install calibre

#insatll audio converter
#sudo apt install sox libsox-fmt-mp3

sleep 1
echo -e "\nInstallation finished\n"

trap : 0
