#!/bin/bash

pactl list short sinks | awk '{print $1;}' | while read devid; do
	case "$1" in
		up ) pactl set-sink-volume $devid +2% ;;
		down ) pactl set-sink-volume $devid -2% ;;
		mute ) pactl set-sink-mute $devid toggle ;;
	esac
done

