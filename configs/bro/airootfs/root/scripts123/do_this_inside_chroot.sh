#!/bin/bash

echo Doing stuff inside chroot...



# fixing fstab

sed -i '/\/var\/cache\/pacman\/pkg/ s/^/#/' /etc/fstab

echo -ne "\n\ntmpfs  /var/cache/pacman/pkg    tmpfs    defaults,size=50%    0  0" >> /etc/fstab
# echo "tmpfs   /var/log     tmpfs   defaults,size=10%,noexec,noatime,mode=1777 0 0" | sudo tee -a /etc/fstab
# echo "tmpfs   /run         tmpfs   nodev,nosuid,size=5%,mode=755   0    0" | sudo tee -a /etc/fstab
# echo "tmpfs   /run/lock    tmpfs   noexec,nosuid,nodev,mode=1777   0    0 " | sudo tee -a /etc/fstab
# echo "portal  /run/user/1000/doc	fuse.portal	rw,nosuid,nodev,user_id=1000,group_id=1000	0 0" | sudo tee -a /etc/fstab



# pacman -S hunspell-en_us hunspell-de libreoffice-fresh --noconfirm





# fixing mirrorlist

sed -i '/localrepo/d' /etc/pacman.d/mirrorlist

rm /do_this_inside_chroot.sh




# clean sys
pacman -Rdduns base-devel gcc vim vim-runtime --noconfirm


#echo "clean cache"
yes | pacman -Scc




echo Exiting chroot ...

exit


