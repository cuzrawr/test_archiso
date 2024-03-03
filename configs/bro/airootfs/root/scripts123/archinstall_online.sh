#!/bin/bash

# WARNING THAT ARE ALL PIECO OF KLUDGES BUT FASTEST WAY TO WRITE IT I DONT CARE

# patching installer:

sed -i.bak 's/disk\.Size(512, disk\.Unit\.MiB, sector_size)/disk.Size(203, disk.Unit.MiB, sector_size)/g; s/disk\.Size(203, disk\.Unit\.MiB, sector_size)/disk.Size(203, disk.Unit.MiB, sector_size)/g' /usr/lib/python3.11/site-packages/archinstall/lib/interactions/disk_conf.py

sed -i '/import archinstall/a from archinstall import SysCommand' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

sed -i.bak '/# Set mirrors used by pacstrap/i\		# custom sets pacman PKGS to memdisk, for low HD space installs.\n		SysCommand(f'\''mount -t tmpfs -o size=99% tmpfs /mnt/archinstall/var/cache/pacman/pkg'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py



archinstall --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json




# done

bash /root/scripts123/do_this_outside_chroot.sh

cp /root/scripts123/do_this_inside_chroot.sh /mnt/archinstall/do_this_inside_chroot.sh
chroot /mnt/archinstall bash /do_this_inside_chroot.sh
echo ' ------------------------------------------------------------------------'
echo ' ... INSTALL COMPLETED ...   '
echo ' ... REBOOT IN 10 SECONDS, PRESS  ctrl + c  TO CANCEL ...'
echo ' ------------------------------------------------------------------------'

sleep 10s && reboot
