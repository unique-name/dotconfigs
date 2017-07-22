#!/bin/bash
   
sudo apt-get update
sudo apt autoremove
sudo apt-get -y install ssh meld ubuntu-restricted-extras texinfo python-pip
sudo apt-get -y install build-essential vlc vim vim-nox openssh-server gedit-plugins unzip zip subversion libssl-dev git gitk minicom diffstat chrpath socat
sudo apt-get -y install cmake flex bison gperf zip curl gawk gcc-multilib g++-multilib libtool wget gparted ncurses-dev u-boot-tools lzop autoconf automake gnupg 
sudo apt-get -y install module-init-tools realpath openconnect phablet-tools device-tree-compiler python-dev icu-devtools autotools-dev expect ccache
sudo apt-get -y install zlib1g:i386 libstdc++6:i386 lib32stdc++6 libisl-dev libsdl1.2-dev libbz2-dev libicu-dev

#install java
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get -y install oracle-java7-installer
#sudo apt-get install openjdk-7-jre-headless
sudo apt-get update
