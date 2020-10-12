#!/bin/bash

sink=$(pactl list short sinks | awk '{print $1;}')
level="+0%"

case "$1" in
	up ) level="+2%" ;;
	down ) level="-2%" ;;
esac

pactl set-sink-volume $sink $level
