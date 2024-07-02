```shell
# 1
$ fdisk /dev/sda
$ n p 3 default +300M w

# 2
$ mkfs.ext4 -b 4096 /dev/sda3

# 3
$ dumpe2fs -h /dev/sda3

# 4
$ tune2fs -i 2m -c 2 /dev/sda3

# 5
$ mkdir /mnt/newdisk
$ mount -t ext4 /dev/sda3 /mnt/newdisk

# 6
$ mkdir /mnt/newdisk/folder
$ touch script.sh
$ chmod a+x script.sh

# 7
# Add to /etc/fstab:
/dev/sda3   /mnt/newdisk   ext4   noexec,noatime   0 0

# 8
$ umount /dev/sda3
$ fdisk /dev/sda
$ d 3 
$ n p 3 default +350M NoExt4 w
$ reboot
$ resize2fs /dev/sda3 350M
$ umount /mnt/newdisk
$ fsck -t ext4 /dev/sda3

# 9
$ fdisk /dev/sda
$ n p 4 default +12M
$ mkfs.ext4 /dev/sda4
$ umount /dev/sda3
$ mke2fs -O journal_dev /dev/sda4
$ mke2fs -t ext4 -J device=/dev/sda4 /dev/sda3

# 10
$ fdisk /dev/sda
$ d 3 d 4
$ n p default default +100M yes
$ n p default default +100M

# 11
$ pvcreate /dev/sda3 /dev/sda4
$ pvscan
$ vgcreate vol_grp1 /dev/sda3 /dev/sda4
$ vgdisplay
$ lvcreate -L 80M -n logical_vol1 vol_grp1
$ mkfs.ext4 /dev/vol_grp1/logical_vol1
$ mount /dev/vol_grp1/logical_vol1 /mnt/supernewdisk
```
