
# WARNING THAT ARE ALL PIECO OF KLUDGES BUT FASTEST WAY TO WRITE IT I DONT CARE

# patching installer:

sed -i.bak 's/disk\.Size(512, disk\.Unit\.MiB, sector_size)/disk.Size(203, disk.Unit.MiB, sector_size)/g; s/disk\.Size(203, disk\.Unit\.MiB, sector_size)/disk.Size(203, disk.Unit.MiB, sector_size)/g' /usr/lib/python3.11/site-packages/archinstall/lib/interactions/disk_conf.py

sed -i '/import archinstall/a from archinstall import SysCommand' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

sed -i.bak '/# Set mirrors used by pacstrap/i\		# custom sets pacman PKGS to memdisk, for low HD space installs.\n		SysCommand(f'\''mount -t tmpfs -o size=99% tmpfs /mnt/archinstall/var/cache/pacman/pkg'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py


# patching mirrorlist to localpkgs that was prepared in .iso creation

# repo-add /localrepo/localrepo.db.tar.gz /localrepo/*.tar.zst

# add once if exist no


#############################
if ! grep -qF '[localrepo]' /etc/pacman.conf; then
    sed -i '/#\s*\[core-testing\]/i [localrepo]\nSigLevel = Optional TrustAll\nServer = file:///localrepo\n' /etc/pacman.conf
    #
    sed -i 's/#IgnoreGroup =/IgnoreGroup = base-devel/' /etc/pacman.conf
    sed -i '/#NoExtract   =$/i\NoExtract=usr/share/doc/* usr/share/doc/'  /etc/pacman.conf
    sed -i '/#NoExtract   =$/i\NoExtract=usr/share/man/* usr/share/man/'  /etc/pacman.conf
    sed -i '/#NoExtract   =$/i\NoExtract=usr/share/help/* usr/share/help/'  /etc/pacman.conf
    sed -i '/#NoExtract   =$/i\NoExtract=usr/share/info/* usr/share/info/'  /etc/pacman.conf
    #
    sed -i '/#NoExtract   =$/i\NoExtract=*README*'  /etc/pacman.conf
    sed -i '/#NoExtract   =$/i\NoExtract=*LICENSE*'  /etc/pacman.conf


    printf '%s: waiting for reflector\n' "$0"
     while       [ "$(systemctl is-active reflector.service)" != "inactive" ] &&       [ "$(systemctl is-active reflector.service)" != "failed" ]; do     sleep 1; done


    sed -i '1iServer = file:///localrepo' /etc/pacman.d/mirrorlist

fi



# archinstall  --offline  --skip-version-check  --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json





archinstall --skip-ntp --offline --skip-version-check  --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json
#

cp /root/scripts123/do_this_inside_chroot.sh /mnt/archinstall/do_this_inside_chroot.sh

chroot /mnt/archinstall bash /do_this_inside_chroot.sh




echo ' INSTALL COMPLETED.   '
echo ' REBOOT IN 10 SECONDS, PRESS  ctrl + c  TO CANCEL IF REQUIRED '

sleep 10s && reboot

#arch-chroot {installation.target} bash {script_path}

#clean test
#chroot /mnt/archinstall yes | pacman -Scc


# yes | pacman -Scc
# echo "tmpfs    /var/cache/pacman/pkg    tmpfs    defaults,size=50%    0  0" | sudo tee -a



#  sed -i.bak '/# Set mirrors used by pacstrap/i\                # custom sets pacman PKGS to memdisk, for low HD space installs.\n                SysCommand(f'\''mount -t tmpfs -o size=80% tmpfs /var/cache/pacman/pkg'\'')'
# sed -i.bak '/# Set mirrors used by pacstrap/i\                # custom sets pacman PKGS to memdisk, for low HD space installs.\n                SysCommand(f'\''mount -t tmpfs -o size=80% tmpfs /var/cache/pacman/pkg'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py
