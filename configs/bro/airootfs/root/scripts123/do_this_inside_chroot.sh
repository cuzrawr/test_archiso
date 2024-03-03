echo Doing stuff inside chroot...

#yes | pacman -Scc

# echo "tmpfs  /var/cache/pacman/pkg    tmpfs    defaults,size=50%    0  0" | sudo tee -a /etc/fstab
# echo "tmpfs   /var/log     tmpfs   defaults,size=10%,noexec,noatime,mode=1777 0 0" | sudo tee -a /etc/fstab
# echo "tmpfs   /run         tmpfs   nodev,nosuid,size=5%,mode=755   0    0" | sudo tee -a /etc/fstab
# echo "tmpfs   /run/lock    tmpfs   noexec,nosuid,nodev,mode=1777   0    0 " | sudo tee -a /etc/fstab
# echo "portal              	/run/user/1000/doc	fuse.portal	rw,nosuid,nodev,user_id=1000,group_id=1000	0 0" | sudo tee -a /etc/fstab


#pacman -R gcc --noconfirm
#pacman -Rdduns  base-devel smbclient vim vim-runtime man-pages --noconfirm


#pacman -S hunspell-en_us hunspell-de mpv libreoffice-fresh --noconfirm


rm /do_this_inside_chroot.sh

echo Exiting chroot ...

exit


