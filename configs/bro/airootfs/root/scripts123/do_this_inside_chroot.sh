#!/bin/bash

echo "[*] Doing stuff inside chroot..."
echo "[*] setting up system configs"

echo "[*] modifying /etc/fstab"
# with default archinstall shceme there /var/cache/pacman/pkg mounting as btrfs
# we are in low HD space system so we mounting it as ramdevice with 50% mem limit
#
sed -i '/\/var\/cache\/pacman\/pkg/ s/^/#/' /etc/fstab
echo -ne "\n\ntmpfs  /var/cache/pacman/pkg    tmpfs    defaults,size=50%    0  0" >> /etc/fstab
# this rase errors with btrfs on log with pacman updates, so we keep good old tmpfs
sed -i '/\/var\/log/ s/^/#/' /etc/fstab
echo -ne "\n\ntmpfs /var/log tmpfs defaults,size=10%,noexec,noatime,mode=1777 0 0"  >> /etc/fstab
# echo "tmpfs   /var/log     tmpfs   defaults,size=10%,noexec,noatime,mode=1777 0 0" | sudo tee -a /etc/fstab
# echo "tmpfs   /run         tmpfs   nodev,nosuid,size=5%,mode=755   0    0" | sudo tee -a /etc/fstab
# echo "tmpfs   /run/lock    tmpfs   noexec,nosuid,nodev,mode=1777   0    0 " | sudo tee -a /etc/fstab
# echo "portal  /run/user/1000/doc	fuse.portal	rw,nosuid,nodev,user_id=1000,group_id=1000	0 0" | sudo tee -a /etc/fstab

echo "[*] We need only wayland sessions"
# Xsessions are in /use/share/xsessions/ and Wayland in /usr/share/wayland-sessions/
rm -Rf /usr/share/xsessions

# pacman -S hunspell-en_us hunspell-de libreoffice-fresh --noconfirm

echo "[*] enable sddm autologin"

mkdir -p /etc/sddm.conf.d/
#User=username
echo "[Autologin]" > /etc/sddm.conf.d/autologin.conf
echo "User=RRRRRRREEEEEEPLACMEEUSERNAME" >> /etc/sddm.conf.d/autologin.conf
echo "Session=plasma" >> /etc/sddm.conf.d/autologin.conf

echo "[*] enable weston wayland sddm"
echo "[General]" > /etc/sddm.conf.d/10-wayland.conf
echo "DisplayServer=wayland" >> /etc/sddm.conf.d/10-wayland.conf

echo "[*] fixing mirrorlist"
sed -i '/localrepo/d' /etc/pacman.d/mirrorlist

echo "[*] setting journalctl tweaks"
journalctl --vacuum-size=16M
journalctl --vacuum-time=2weeks


echo "[*] remove systemd-boot timeout"
#rm /boot/loader/loader.conf
echo "timeout 0" > /boot/loader/loader.conf

echo "[*] remove unneedded fallback kernels"
rm /boot/*-fallback.img

    #mv /root/temp.json /root/test.json
##############################################################################

echo "[*] adding whitemagic to compensate blackmagic"
if [ -e /.istrulyencryptediswear ]; then

    rm /.istrulyencryptediswear
    ########

    echo "[*] set plymouth theme (rebuilding mkinitcpio with our encrypt script)"
    plymouth-set-default-theme tribar -R


    echo "[*] set script rights"
    chmod +x /bin/script.sh
    chmod 0644 /etc/systemd/system/run-once.service

    echo "[*] enable startup"
    systemctl --quiet --no-warn enable run-once.service

    ########
    # Do something here, replace this comment with your desired action

else
    echo "[*] Encryption is disabled on this install processing next..."
    echo "[*] set plymouth theme (rebuilding mkinitcpio with our encrypt script)"
    plymouth-set-default-theme tribar -R
fi
###############################################################################
echo "[*] whitemagic done"




echo "[*] clean sys packages"
pacman -Rdduns gcc vim vim-runtime kate --noconfirm

echo "[*] umount left partitions"
umount /var/cache/pacman/pkg/

echo "[*] clean pacman cache"
yes | pacman -Scc

echo "[*] chroots jobs done ... probably?"
# removing itself
rm /do_this_inside_chroot.sh
echo "[*] Exiting chroot ..."

exit


