# try to install libreoffice
echo '[*] ... blackmagic outside chroot........'
#echo 'currently install fails with libreoffice adding directly from archinstall. fixme'

#/usr/bin/pacstrap -C /etc/pacman.conf -K /mnt/archinstall firefox firefox-ublock-origin hunspell-en_us hunspell-de libreoffice-fresh libreoffice-fresh-de --noconfirm



# next stage will be inside chroot so we umount current installer hardcoded mounts
umount /mnt/archinstall/var/cache/pacman/pkg/
