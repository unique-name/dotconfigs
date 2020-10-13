#!/bin/bash

sink=$(pactl list short sinks | awk '{print $1;}')

case "$1" in
	up ) pactl set-sink-volume $sink +2% ;;
	down ) pactl set-sink-volume $sink -2% ;;
	mute ) pactl set-sink-mute $sink toggle ;;
esac

