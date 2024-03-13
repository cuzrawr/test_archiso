# try to install libreoffice
echo '[*] ... blackmagic outside chroot........'
#echo 'currently install fails with libreoffice adding directly from archinstall. fixme'

#/usr/bin/pacstrap -C /etc/pacman.conf -K /mnt/archinstall firefox firefox-ublock-origin hunspell-en_us hunspell-de libreoffice-fresh libreoffice-fresh-de --noconfirm
echo "[*] patching mkinitcpio... "

sed -i '/^fallback/,$d' /mnt/archinstall/etc/mkinitcpio.d/*.preset

echo "[*] patching mkinitcpio... "
sed -i "s/PRESETS=('default' 'fallback')/PRESETS=('default')/" /mnt/archinstall/etc/mkinitcpio.d/*.preset

echo "[*] patching mkinitcpio... "
sed -i '/^HOOKS=/ s/\budev\b/plymouth udev/' /mnt/archinstall/etc/mkinitcpio.conf

echo "[*] temporary patching encrypt hook"
cp /mnt/archinstall/usr/lib/initcpio/hooks/encrypt /mnt/archinstall/usr/lib/initcpio/hooks/encrypt.bak
cp /root/scripts123/configs/encrypt /mnt/archinstall/usr/lib/initcpio/hooks/encrypt



# next stage will be inside chroot so we umount current installer hardcoded mounts
#umount /mnt/archinstall/var/cache/pacman/pkg/
