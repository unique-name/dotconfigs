#!/bin/bash

sudo apt -y install i3 i3status
sudo apt -y install alsa-tools pulseaudio-utils fonts-font-awesome

dir=$PWD

#list of files to make symlink to them:
files="config set_monitor.sh set_language.sh set_volume.sh"

if [ ! -d "~/.config/i3" ]; then
	mkdir ~/.config/i3 2>/dev/null
fi

for file in $files; do
	echo "Creating symlink to $file in ~/.config/i3"
	ln -fs $dir/i3/$file ~/.config/i3/$file 2>/dev/null 
done

if [ ! -d "~/.config/i3status" ]; then
	mkdir ~/.config/i3status 2>/dev/null
	ln -s $dir/i3status/config ~/.config/i3status/config 2>/dev/null
fi

echo -e "\nFinished\n"
