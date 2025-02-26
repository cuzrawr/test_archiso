# Test Prerequisites                             DO NOT BLIND RUN THIS SCRIPT
#                                                CURRENTLY ITS JUST A COMMANDS LIST

# for the future local repository:



sudo rm configs/bro/airootfs/localrepo/localrepo.*
sudo rm -rf configs/bro/airootfs/localrepo/local
sudo rm -rf configs/bro/airootfs/localrepo/sync

# set rights:

sudo chmod -Rf 755 configs/bro/airootfs/localrepo
# kde defaults + some custom

sudo pacman --config configs/bro/pacman.conf --noconfirm -Syw --cachedir configs/bro/airootfs/localrepo --dbpath configs/bro/airootfs/localrepo base base-devel linux-firmware linux btrfs-progs efibootmgr networkmanager network-manager-applet pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber firefox nano vim openssh htop wget iwd wireless_tools wpa_supplicant smartmontools xdg-utils plasma-meta konsole kwrite dolphin ark plasma-workspace egl-wayland xorg-server xorg-xinit mesa xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware libva-mesa-driver libva-intel-driver intel-media-driver vulkan-radeon vulkan-intel sddm hunspell-en_us hunspell-de mpv libreoffice-fresh firefox-ublock-origin xdg-utils smartmontools wpa_supplicant wireless_tools iwd wget openssh vim nano amd-ucode libreoffice-fresh-de intel-ucode dialog packagekit-qt6 plasma-integration firefox-i18n-de plymouth ttf-dejavu ttf-liberation

# copy custom kernel also
sudo cp configs/bro/custom_pkgs/linux-fsync-nobara-bin-6.7.9-1-x86_64.pkg.tar.zst configs/bro/airootfs/localrepo/
# remove junk before repo-add
sudo rm -rf configs/bro/airootfs/localrepo/local
sudo rm -rf configs/bro/airootfs/localrepo/sync
# init repodb
sudo bash repo-add configs/bro/airootfs/localrepo/localrepo.db.tar.gz configs/bro/airootfs/localrepo/!(*.sig)
#
# W A R N I N G
#
# KEEP IN MIND YOUR DATABASE SHOULD EXIST AFTER THIS COMMANDS AS
# 'configs/bro/airootfs/localrepo/localrepo.db.tar.gz'
# IF NOT = SOMETHING WRONG
#
# try to run this script again
# sudo rm configs/bro/airootfs/localrepo/localrepo.*
# sudo rm -rf configs/bro/airootfs/localrepo/local
# sudo rm -rf configs/bro/airootfs/localrepo/sync
#
#
#
#sudo repo-add -n configs/bro/airootfs/localrepo/localrepo.db.tar.gz configs/bro/airootfs/localrepo/*.tar.zst
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# clean localrepo (for recreate use command above)
#./localrepo/localrepo.files.tar.gz.old
#./localrepo/localrepo.files
#./localrepo/localrepo.db
#./localrepo/localrepo.db.tar.gz.old
#./localrepo/localrepo.files.tar.gz
#./localrepo/localrepo.db.tar.gz.lck
#./localrepo/localrepo.db.tar.gz
