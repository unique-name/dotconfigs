#!/bin/bash
echo "Creating image. Current size 100M"
cd ~/comm_board/tftpboot
dd if=/dev/zero of=rootfs.img bs=1M count=100 2>/dev/null
echo "Creating two partitions: 1 - 7M (fat), 2 - lefted space (ext4)"
sfdisk rootfs.img << END 1>/dev/null
,7M
;
END
device1=`losetup -f`
sudo losetup -o $((512*2048)) $device1 rootfs.img
device2=`losetup -f`
sudo losetup -o $((512*16384)) $device2 rootfs.img
echo using free loop devices: $device1 $device2
yes | sudo mkfs.vfat $device1 1>/dev/null
yes | sudo mkfs.ext4 $device2 1>/dev/null
sudo mkdir /mnt/part1 2>/dev/null
sudo mkdir /mnt/part2 2>/dev/null
sudo umount /mnt/part1 2>/dev/null
sudo umount /mnt/part2 2>/dev/null
sync
sudo mount $device1 /mnt/part1 || exit
sudo mount $device2 /mnt/part2 || exit
sudo cp uEnv.txt /mnt/part1
sudo tar -xf ~/comm_board/yocto/build/tmp/deploy/images/dra7xx-commboard/osr-image-commboard-dra7xx-commboard.tar.xz -C /mnt/part2
sudo cp ~/comm_board/yocto/build/tmp/deploy/images/dra7xx-commboard/zImage /mnt/part2/boot
sudo cp ~/comm_board/yocto/build/tmp/deploy/images/dra7xx-commboard/zImage-dra71-evm.dtb /mnt/part2/boot/dra71-evm.dtb
sync
sudo umount /mnt/part*
sudo losetup -d $device1
sudo losetup -d $device2
sudo rm -rf /mnt/part*
parted rootfs.img print 2>/dev/null
echo "Finished"
