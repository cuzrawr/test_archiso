






# archinstall --silent --skip-ntp  --offline --skip-version-check  --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json
#

# cp /root/scripts123/do_this_inside_chroot.sh /mnt/archinstall/do_this_inside_chroot.sh

# chroot /mnt/archinstall bash /do_this_inside_chroot.sh

# echo ' INSTALL COMPLETED.   '
# echo ' REBOOT IN 10 SECONDS, PRESS  ctrl + c  TO CANCEL IF REQUIRED '

# sleep 10s && reboot

#arch-chroot {installation.target} bash {script_path}

#clean test
#chroot /mnt/archinstall yes | pacman -Scc


# yes | pacman -Scc
# echo "tmpfs    /var/cache/pacman/pkg    tmpfs    defaults,size=50%    0  0" | sudo tee -a



#  sed -i.bak '/# Set mirrors used by pacstrap/i\                # custom sets pacman PKGS to memdisk, for low HD space installs.\n                SysCommand(f'\''mount -t tmpfs -o size=80% tmpfs /var/cache/pacman/pkg'\'')'
# sed -i.bak '/# Set mirrors used by pacstrap/i\                # custom sets pacman PKGS to memdisk, for low HD space installs.\n                SysCommand(f'\''mount -t tmpfs -o size=80% tmpfs /var/cache/pacman/pkg'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py
