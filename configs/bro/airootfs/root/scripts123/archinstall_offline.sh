#!/bin/bash

# WARNING THAT ARE ALL PIECO OF KLUDGES BUT FASTEST WAY TO WRITE IT I DONT CARE
echo "[*] patching whole archinstall installer... please wait"
# patching installer:
echo "[*] patching: disk_conf.py"
sed -i.bak 's/disk\.Size(512, disk\.Unit\.MiB, sector_size)/disk.Size(203, disk.Unit.MiB, sector_size)/g; s/disk\.Size(203, disk\.Unit\.MiB, sector_size)/disk.Size(203, disk.Unit.MiB, sector_size)/g' /usr/lib/python3.11/site-packages/archinstall/lib/interactions/disk_conf.py

echo "[*] patching: guided.py"
sed -i '/import archinstall/a from archinstall import SysCommand' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

# sed -i.bak '/# Set mirrors used by pacstrap/i\		# custom sets pacman PKGS to memdisk, for low HD space installs.\n		SysCommand(f'\''mount -t tmpfs -o size=99% tmpfs /mnt/archinstall/var/cache/pacman/pkg'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py


echo "[*] patching: guided.py"
# hack to low hd isntall
sed -i '/installation.minimal_installation(/i\		# custom sets pacman PKGS to memdisk, for low HD space installs.\n		SysCommand(f'\''mount --rbind /localrepo /mnt/archinstall/var/cache/pacman/pkg/'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

#echo "[*] patching: guided.py"
#sed -i '/installation.minimal_installation(/i\		# custom sets our own pacman.conf aaaaaaaaaaaaaaaaaatest.\n		SysCommand(f'\''mkdir -p /mnt/archinstall/etc/ && cp -p /root/scripts123/configs/insystem_pacman.conf /mnt/archinstall/etc/pacman.conf'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

echo "[*] patching: installer.py"
# works by breaking while loops (there bug with key generation stuck )
sed -i 's/time\.sleep(1)/time.sleep(5); break/g' /usr/lib/python3.11/site-packages/archinstall/lib/installer.py

echo "[*] patching: system_conf.py"
sed -i '/kernels = / s/]/, "linux-fsync-nobara-bin"]/g'  /usr/lib/python3.11/site-packages/archinstall/lib/interactions/system_conf.py

echo "[*] patching: installer.py"
sed -i '/__packages__ = / s/]/, "linux-fsync-nobara-bin"]/g' /usr/lib/python3.11/site-packages/archinstall/lib/installer.py

echo "[*] patching: kde.py"
sed -i 's/plasma-meta/plasma-desktop/g' /usr/lib/python3.11/site-packages/archinstall/default_profiles/desktops/kde.py

# removing bootloader fallback conf generation (we keep only primary)
echo "[*] patching: installer.py"
sed -i "s/'', '-fallback'/'',/g" /usr/lib/python3.11/site-packages/archinstall/lib/installer.py

echo "[*] patching: installer.py"
sed -i "s/\"\", \"-fallback\"/\"\",/g" /usr/lib/python3.11/site-packages/archinstall/lib/installer.py

echo "[*] patching: installer.py"
sed -i "s/options = 'options '/options = 'options quiet loglevel=3 systemd.show_status=auto rd.udev.log_level=3 '/g" /usr/lib/python3.11/site-packages/archinstall/lib/installer.py

#
#echo "[*] patching: guided.py"
#sed -i '/global_menu.enable/{/disk_encryption\|root-password\|install\|disk\|users/! s/^/# /}' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

#echo "[*] copy patched guided.py"
#sed -i "s/if archinstall.arguments.get('advanced', False):/#if archinstall.arguments.get('advanced', False):/g" /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

#cp -p /root/scripts123/configs/guided.py /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py

echo "[*] tune: services"
#
systemctl --quiet --no-warn stop archlinux-keyring-wkd-sync.timer
systemctl --quiet --no-warn disable archlinux-keyring-wkd-sync.timer
systemctl --quiet --no-warn stop reflector.service
systemctl --quiet --no-warn disable reflector.service
#
systemctl --quiet --no-warn stop systemd-networkd-wait-online.service
systemctl --quiet --no-warn disable systemd-networkd-wait-online.service
#
systemctl --quiet --no-warn stop systemd-networkd.service
systemctl --quiet --no-warn disable systemd-networkd.service
#
systemctl --quiet --no-warn stop systemd-time-wait-sync.service
systemctl --quiet --no-warn disable systemd-time-wait-sync.service
#
#systemctl --quiet --no-warn stop timesyncd.service
#systemctl --quiet --no-warn disable timesyncd.service
#
systemctl --quiet --no-warn daemon-reload


# sed -i.bak '/# Set mirrors used by pacstrap/i\		# custom sets pacman PKGS to memdisk, for low HD space installs.\n		SysCommand(f'\''mount --rbind /var/lib/pacman/sync /mnt/archinstall/var/lib/pacman/sync/'\'')' /usr/lib/python3.11/site-packages/archinstall/scripts/guided.py



# patching mirrorlist to localpkgs that was prepared in .iso creation

# repo-add /localrepo/localrepo.db.tar.gz /localrepo/*.tar.zst

# add once if exist no


#############################
if ! grep -qF '[localrepo]' /etc/pacman.conf; then
   echo "[*] tune: pacman.conf"

   cp /root/scripts123/configs/offline_pacman.conf /etc/pacman.conf

   # sed -i '/#\s*\[core-testing\]/i [localrepo]\nSigLevel = Optional TrustAll\nServer = file:///localrepo\n' /etc/pacman.conf

    #sed -i '/CheckSpace/ s/^/#/' /etc/pacman.conf
    #add newlines after noextract
   # sed -i '/NoExtract/{s/$/\nnew text/;:a;n;ba}'  /etc/pacman.conf


    #
    # sed -i 's/#IgnoreGroup =/IgnoreGroup = base-devel/' /etc/pacman.conf
    # sed -i '/#NoExtract   =$/i\NoExtract=usr/share/doc/* usr/share/doc/'  /etc/pacman.conf
    # sed -i '/#NoExtract   =$/i\NoExtract=usr/share/man/* usr/share/man/'  /etc/pacman.conf
    # sed -i '/#NoExtract   =$/i\NoExtract=usr/share/help/* usr/share/help/'  /etc/pacman.conf
    # sed -i '/#NoExtract   =$/i\NoExtract=usr/share/info/* usr/share/info/'  /etc/pacman.conf
    #
    # sed -i '/#NoExtract   =$/i\NoExtract=*README*'  /etc/pacman.conf
    # sed -i '/#NoExtract   =$/i\NoExtract=*LICENSE*'  /etc/pacman.conf


    # disable core repo
    #sed -i "/\[core\]/,/Include/"'s/^/#/' /etc/pacman.conf

    # disable extra repo
    #sed -i "/\[extra\]/,/Include/"'s/^/#/' /etc/pacman.conf

    # wait reflector fto finish
    printf '%s: waiting for reflector\n' "$0"
     while       [ "$(systemctl is-active reflector.service)" != "inactive" ] &&       [ "$(systemctl is-active reflector.service)" != "failed" ]; do     sleep 1; done

    #remove reflector from the system (its offline install part so we just trust this )
    #rm $(which reflector)
    # for safety we make reflector broken:
    echo "test" > $(which reflector)

    #remove reflector from the system
    #rm $(which reflector)

    #
    # add our localrepo to top of mirrorlist so its used first
    sed -i '1iServer = file:///localrepo' /etc/pacman.d/mirrorlist

fi


# archinstall  --offline  --skip-version-check  --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json

echo "[*] tune: services second run"
#
systemctl --quiet --no-warn stop archlinux-keyring-wkd-sync.timer
systemctl --quiet --no-warn disable archlinux-keyring-wkd-sync.timer
systemctl --quiet --no-warn stop reflector.service
systemctl --quiet --no-warn disable reflector.service
#
systemctl --quiet --no-warn stop systemd-networkd-wait-online.service
systemctl --quiet --no-warn disable systemd-networkd-wait-online.service
#
systemctl --quiet --no-warn stop systemd-networkd.service
systemctl --quiet --no-warn disable systemd-networkd.service
#
systemctl --quiet --no-warn stop systemd-time-wait-sync.service
systemctl --quiet --no-warn disable systemd-time-wait-sync.service
#
#systemctl --quiet --no-warn stop timesyncd.service
#systemctl --quiet --no-warn disable timesyncd.service
#
systemctl --quiet --no-warn daemon-reload


echo "[*] making black magic before installer"

bash /root/scripts123/do_this_before_archinstall_execution.sh

echo "[*] installer: launching"
echo "[*] Using archinstall with this cmdline: "
echo " archinstall --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json --skip-ntp --offline --skip-version-check --no-pkg-lookups "


archinstall --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json --skip-ntp --offline --skip-version-check --no-pkg-lookups --silent



# done
echo "[*] making black magic outside chroot"

bash /root/scripts123/do_this_outside_chroot.sh

echo "[*] making black magic inside chroot"
cp /root/scripts123/do_this_inside_chroot.sh /mnt/archinstall/do_this_inside_chroot.sh
arch-chroot /mnt/archinstall bash /do_this_inside_chroot.sh
echo " "
echo "[*] installer: complete"
echo ' ------------------------------------------------------------------------'
echo ' ... INSTALL COMPLETED ...   '
echo ' ... POWEROFF IN 20 SECONDS, PRESS  ctrl + c  TO CANCEL ...'
echo ' ------------------------------------------------------------------------'

sleep 20s && poweroff
