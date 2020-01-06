#!/bin/bash
   
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y install ssh meld ubuntu-restricted-extras python-pip python-dev libjsoncpp-dev
sudo apt -y install colordiff ntfs-config libboost-dev libboost-all-dev libpcap-dev zip
sudo apt -y install vlc vim-gnome vim-nox openssh-server exuberant-ctags libgnome2-bin
sudo apt -y install gedit-plugins gitk minicom ccache
sudo apt -y install libssl-dev subversion libtool gparted libncurses5-dev libncursesw5-dev
sudo apt -y install g++-multilib cmake bison flex curl repo libicu-dev autoconf automake autotools-dev

# Packages for Yocto host development
sudo apt -y install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential \
	chrpath socat xterm cpio python3 python3-pip libsdl1.2-dev libelf-dev


# Packages for uboot development
#sudo apt -y install u-boot-tools lzop gnupg module-init-tools openconnect device-tree-compiler icu-devtools expect

# install android tools
#sudo apt -y install android-tools-adb android-tools-fastboot

# install audio cutters/converters
#sudo apt -y install sox libsox-fmt-mp3

# install ebook converter
#sudo apt -y install calibre

# install java
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get -y install oracle-java7-installer
#sudo apt-get install openjdk-7-jre-headless
