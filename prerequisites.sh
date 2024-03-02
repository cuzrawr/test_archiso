# Test Prerequisites

# for the future local repository:


sudo rm -Rf configs/bro/airootfs/localrepo

sudo mkdir -p configs/bro/airootfs/localrepo
sudo mkdir -p configs/bro/airootfs/localrepo

# set rights:

sudo chmod -Rf 755 configs/bro/airootfs/localrepo


#
# kde defaults

sudo pacman --noconfirm -Syw --cachedir configs/bro/airootfs/localrepo --dbpath configs/bro/airootfs/localrepo/ base base-devel linux-firmware linux btrfs-progs efibootmgr networkmanager network-manager-applet pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber firefox nano vim openssh htop wget iwd wireless_tools wpa_supplicant smartmontools xdg-utils plasma-meta konsole kwrite dolphin ark plasma-wayland-session egl-wayland xorg-server xorg-xinit mesa xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware libva-mesa-driver libva-intel-driver intel-media-driver vulkan-radeon vulkan-intel sddm  hunspell-en_us  hunspell-de mpv libreoffice-fresh firefox-ublock-origin



#

sudo repo-add configs/bro/airootfs/localrepo/localrepo.db.tar.gz configs/bro/airootfs/localrepo/*[^sig]
