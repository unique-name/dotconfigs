#!/bin/bash

if [[ `xrandr | grep HDMI-1 | awk  '{print $2}'` = 'connected' ]]; then
xrandr --output eDP-1 --off;
fi
if [[ `xrandr | grep HDMI1 | awk  '{print $2}'` = 'connected' ]]; then
xrandr --output eDP1 --off;
fi
