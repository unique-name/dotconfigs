#!/bin/bash

#disable the nautilus desktop window
#gsettings set org.gnome.desktop.background show-desktop-icons false

sudo apt-get -y install i3 i3status volumeicon-alsa
sudo apt-get -y install thunar thunar-data gnome-icon-theme gsimplecal
dir=$PWD

mkdir ~/.config/gsimplecal 2>/dev/null
echo close_on_unfocus = 1 > ~/.config/gsimplecal/config
echo show_week_numbers = 1 >> ~/.config/gsimplecal/config

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
