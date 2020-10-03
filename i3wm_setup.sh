#!/bin/bash

sudo apt -y install i3 i3status
sudo apt -y install alsa-tools pulseaudio-utils fonts-font-awesome

dir=$PWD

if [ ! -d "~/.config/i3" ]; then
	mkdir ~/.config/i3 2>/dev/null
	ln -s $dir/i3/config ~/.config/i3/config 2>/dev/null
	ln -s $dir/i3/set_monitor.sh ~/.config/i3/set_monitor.sh 2>/dev/null
	ln -s $dir/i3/set_language.sh ~/.config/i3/set_language.sh 2>/dev/null
fi

if [ ! -d "~/.config/i3status" ]; then
	mkdir ~/.config/i3status 2>/dev/null
	ln -s $dir/i3status/config ~/.config/i3status/config 2>/dev/null
fi

echo -e "\nFinished\n"
