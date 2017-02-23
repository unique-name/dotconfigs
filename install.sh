#!/bin/bash
   
sudo apt-get update
sudo apt-get install ubuntu-restricted-extras vlc vim vim-nox build-essential openssh-server gedit-plugins unzip zip subversion libssl-dev git gitk minicom 
sudo apt-get install cmake flex bison gperf zip curl gcc-multilib g++-multilib libtool wget gparted ssh ncurses-dev u-boot-tools lzop autoconf automake gnupg 
sudo apt-get install module-init-tools realpath openconnect phablet-tools device-tree-compiler python-dev libbz2-dev icu-devtools libicu-dev autotools-dev
sudo apt-get update 

#install java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
#sudo apt-get install oracle-java8-installer
