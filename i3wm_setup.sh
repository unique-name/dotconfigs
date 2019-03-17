#!/bin/bash

#disable the nautilus desktop window
#gsettings set org.gnome.desktop.background show-desktop-icons false

sudo apt -y install i3 i3status
sudo apt -y install thunar thunar-data gnome-icon-theme
dir=$PWD

files=".gtkrc-2.0"

for file in $files; do
	echo "Creating symlink to $file in user's home directory"
	ln -fs $dir/$file ~/$file 2>/dev/null
done

if [ ! -d "~/.config/i3" ]; then
	mkdir ~/.config/i3 2>/dev/null
	ln -s $dir/i3/config ~/.config/i3/config 2>/dev/null
	ln -s $dir/i3/set_monitor.sh ~/.config/i3/set_monitor.sh 2>/dev/null
fi

if [ ! -d "~/.config/i3status" ]; then
	mkdir ~/.config/i3status 2>/dev/null
	ln -s $dir/i3status/config ~/.config/i3status/config 2>/dev/null
fi

echo "Finished"
