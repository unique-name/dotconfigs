#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo Need to provide disk. Example: /dev/sdd
  echo Please check wich device was added using dmesg
  exit 1
fi

DEVICE=$1

echo Creating partitions on SD Card ...
sudo wipefs -a "$DEVICE"
sudo parted -s "$DEVICE" mklabel msdos
sudo parted -s "$DEVICE" mkpart primary fat32 1MiB 500MiB
sudo parted -s "$DEVICE" mkpart primary ext4 500MiB 100%

echo Creating file systems ...
sudo mkfs.vfat -F 32 -n BOOT ${DEVICE}1
sudo mkfs.ext4 -F -L ROOTFS ${DEVICE}2

echo Mounting partitions ...
sudo mkdir -p /mnt/part1 2>/dev/null
sudo mkdir -p /mnt/part2 2>/dev/null
sudo mount ${DEVICE}1 /mnt/part1
sudo mount ${DEVICE}2 /mnt/part2

echo Copying files ...
sudo cp images/linux/BOOT.BIN /mnt/part1/ 2>/dev/null || echo "BOOT.BIN not found"
sudo cp images/linux/boot.scr /mnt/part1/ 2>/dev/null || echo "boot.scr not found"
sudo cp images/linux/image.ub /mnt/part1/ 2>/dev/null || echo "image.ub not found"
sudo cp images/linux/system.bit /mnt/part1/ 2>/dev/null || echo "image.ub not found"
sudo tar -xf images/linux/rootfs.tar.gz -C /mnt/part2/ 1>/dev/null || echo "rootfs.tar.gz not found"

echo Doing fine tuning and sync
#creating .profile for aliases
CONFIG_FILE="/mnt/part2/home/root/.bashrc"
sudo touch $CONFIG_FILE
echo "alias cd..='cd ..'" | sudo tee -a $CONFIG_FILE 1> /dev/null
echo "alias f='find . -name'" | sudo tee -a $CONFIG_FILE 1> /dev/null
echo "alias ll='ls -alF'" | sudo tee -a $CONFIG_FILE 1> /dev/null
echo "alias size='du -sh'" | sudo tee -a $CONFIG_FILE 1> /dev/null
echo "alias g='grep -rn --exclude=tags --exclude=*.{o,a,i,so,map,T}'" | sudo tee -a $CONFIG_FILE 1> /dev/null

sync
sudo umount /mnt/part* 2>/dev/null
sudo rm -rf /mnt/part*
echo Finished
