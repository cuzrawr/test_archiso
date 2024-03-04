# try to install libreoffice
echo '...trying to install libreoffce........'
echo 'currently install fails with libreoffice adding directly from archinstall. fixme'

/usr/bin/pacstrap -C /etc/pacman.conf -K /mnt/archinstall  hunspell-en_us hunspell-de libreoffice-fresh --noconfirm


umount /mnt/archinstall/var/cache/pacman/pkg/
