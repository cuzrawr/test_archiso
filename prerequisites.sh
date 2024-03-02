# Test Prerequisites

# for the future local repository:


sudo mkdir -p configs/bro/airootfs/var/lib/pacman/sync/
sudo mkdir -p configs/bro/airootfs/var/cache/pacman/pkg/

# set rights:

sudo chmod -Rf 755 configs/bro/airootfs/var


#
# kde defaults

sudo pacman --noconfirm -Syw --cachedir configs/bro/airootfs/var/cache/pacman/pkg/ --dbpath configs/bro/airootfs/var/lib/pacman/sync/ base base-devel linux-firmware linux btrfs-progs efibootmgr networkmanager network-manager-applet pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber firefox nano vim openssh htop wget iwd wireless_tools wpa_supplicant smartmontools xdg-utils plasma-meta konsole kwrite dolphin ark plasma-wayland-session egl-wayland xorg-server xorg-xinit mesa xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware libva-mesa-driver libva-intel-driver intel-media-driver vulkan-radeon vulkan-intel sddm  hunspell-en_us  hunspell-de mpv libreoffice-fresh firefox-ublock-origin
