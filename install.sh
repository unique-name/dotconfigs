#!/bin/bash
   
sudo apt-get update
sudo apt-get upgrade
sudo apt autoremove
sudo apt-get -y install ssh meld ubuntu-restricted-extras texinfo python-pip
sudo apt-get -y install scolordiff ntfs-config libboost-all-dev unzip zip
sudo apt-get -y install build-essential vlc vim vim-nox openssh-server socat
sudo apt-get -y install gedit-plugins git gitk minicom diffstat chrpath ccache
sudo apt-get -y install libssl-dev subversion libtool wget gparted ncurses-dev
sudo apt-get -y install cmake flex bison gperf zip curl gawk gcc-multilib  
sudo apt-get -y install g++-multilib u-boot-tools lzop autoconf automake gnupg
sudo apt-get -y install module-init-tools realpath openconnect repo python-dev
sudo apt-get -y install device-tree-compiler icu-devtools autotools-dev expect 
sudo apt-get -y install exuberant-ctags libgnome2-bin
sudo apt-get -y install zlib1g:i386 libstdc++6:i386 lib32stdc++6 libisl-dev 
sudo apt-get -y install libsdl1.2-dev libbz2-dev libicu-dev

#install audio cutters/converters
#sudo apt -y install audacity sox libsox-fmt-mp3

#install ebook converter
#sudo apt -y install calibre

#install java
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get -y install oracle-java7-installer
#sudo apt-get install openjdk-7-jre-headless
