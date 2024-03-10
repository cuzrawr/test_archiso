# try to install libreoffice
echo '...trying to install additionall packages........'
echo 'currently install fails with libreoffice adding directly from archinstall. fixme'

#/usr/bin/pacstrap -C /etc/pacman.conf -K /mnt/archinstall firefox firefox-ublock-origin hunspell-en_us hunspell-de libreoffice-fresh libreoffice-fresh-de --noconfirm


umount /mnt/archinstall/var/cache/pacman/pkg/
