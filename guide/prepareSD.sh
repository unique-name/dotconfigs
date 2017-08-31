#!/bin/bash
sudo mkdir /mnt/part1 2>/dev/null
sudo mkdir /mnt/part2 2>/dev/null
sudo umount /mnt/part1 2>/dev/null
sudo umount /mnt/part2 2>/dev/null
sync
#sudo mount /dev/mmcblk0p1 /mnt/part1	#in case loading from SD card
sudo mount /dev/mmcblk0p2 /mnt/part2 || exit
sudo rm -rf /mnt/part2/*
sync
cd yocto/build/tmp/deploy/images/dra7xx-commboard
echo copying files to SD ...
#sudo cp MLO /mnt/part1/	#in case loading from SD card
#sudo cp u-boot.img /mnt/part1	#in case loading from SD card
sudo tar -xf osr-image-commboard-dra7xx-commboard.tar.xz -C /mnt/part2/
sudo cp zImage /mnt/part2/boot/
sudo cp zImage-dra71-evm.dtb /mnt/part2/boot/dra71-evm.dtb
&>/dev/null cd -

#creating .profile for aliases
sudo touch /mnt/part2/home/root/.profile
echo "alias cd..='cd ..'" | sudo tee -a /mnt/part2/home/root/.profile 1> /dev/null
echo "alias f='find . -name'" | sudo tee -a /mnt/part2/home/root/.profile 1> /dev/null
echo "alias ll='ls -alF'" | sudo tee -a /mnt/part2/home/root/.profile 1> /dev/null
echo "alias size='du -sh'" | sudo tee -a /mnt/part2/home/root/.profile 1> /dev/null

#sudo cp uenv.txt /mnt/part1	#in case loading from SD card
sync
sudo umount /mnt/part* 2>/dev/null
sudo rm -rf /mnt/part*
echo Finished
