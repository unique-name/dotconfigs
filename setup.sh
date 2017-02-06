#!/bin/bash

dir=$PWD
#list of files to make symlink to them:
files=".bash_aliases"



for file in $files; do
	echo "Creating symlink to $file in user's home directory"
	ln -s $dir/$file ~/$file
done
