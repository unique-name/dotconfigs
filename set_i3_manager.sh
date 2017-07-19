#!/bin/bash

dir=$PWD

if [ ! -d "~/.config/i3" ]; then
	mkdir ~/.config/i3 2>/dev/null
	ln -s $dir/i3/config ~/.config/i3/config 2>/dev/null
fi

if [ ! -d "~/.config/i3status" ]; then
	mkdir ~/.config/i3status 2>/dev/null
	ln -s $dir/i3status/config ~/.config/i3status/config 2>/dev/null
fi

if [ ! -f "/etc/X11/Xsession.d/45xrandr-settings_for-i3wm" ]; then
	sudo cp $dir/45xrandr-settings_for-i3wm /etc/X11/Xsession.d/
fi

echo "Finished"
