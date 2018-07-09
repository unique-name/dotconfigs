#!/bin/bash
   
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y install ssh meld ubuntu-restricted-extras python-pip net-tools
sudo apt -y install scolordiff ntfs-config libboost-all-dev zip
sudo apt -y install vlc vim-gnome vim-nox openssh-server exuberant-ctags libgnome2-bin
sudo apt-get -y install gedit-plugins gitk minicom ccache
# Packages for Yocto host development
sudo apt -y install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential \
	chrpath socat xterm cpio python3 python3-pip libsdl1.2-dev libelf-dev
sudo apt -y install libssl-dev subversion libtool gparted ncurses-dev
sudo apt -y install cmake flex bison gperf zip curl
sudo apt -y install g++-multilib u-boot-tools lzop autoconf automake gnupg
sudo apt -y install module-init-tools realpath openconnect repo python-dev
sudo apt -y install device-tree-compiler icu-devtools autotools-dev expect

#sudo apt-get -y install zlib1g:i386 libstdc++6:i386 lib32stdc++6 libisl-dev
#sudo apt-get -y install libsdl1.2-dev libbz2-dev libicu-dev

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
