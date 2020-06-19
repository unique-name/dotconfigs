#!/bin/bash
   
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y install ssh meld ubuntu-restricted-extras libjsoncpp-dev gedit-plugins gitk minicom
sudo apt -y install colordiff ntfs-config libboost-dev libboost-all-dev libpcap-dev zip ccache
sudo apt -y install vlc vim-gnome vim-nox openssh-server exuberant-ctags libgnome2-bin autotools-dev
sudo apt -y install libssl-dev subversion libtool gparted libncurses5-dev libncursesw5-dev thunar
sudo apt -y install g++-multilib cmake bison flex curl repo libicu-dev autoconf automake

# Packages for Yocto host development
sudo apt -y install gawk wget git diffstat unzip texinfo gcc-multilib build-essential \
	chrpath socat xterm cpio python3 libsdl1.2-dev libelf-dev

# Packages for uboot development
#sudo apt -y install u-boot-tools lzop gnupg module-init-tools openconnect device-tree-compiler
#udo apt -y install icu-devtools expect

# install android tools
sudo apt -y install android-tools-adb android-tools-fastboot

# install audio cutters/converters
#sudo apt -y install sox libsox-fmt-mp3

# install ebook converter
#sudo apt -y install calibre

#insatll audio converter
#sudo apt install sox libsox-fmt-mp3
