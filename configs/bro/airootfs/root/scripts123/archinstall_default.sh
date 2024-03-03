#!/bin/bash

archinstall --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json  "$@"




# done
cp /root/scripts123/do_this_inside_chroot.sh /mnt/archinstall/do_this_inside_chroot.sh

chroot /mnt/archinstall bash /do_this_inside_chroot.sh

echo ' INSTALL COMPLETED.   '
echo ' REBOOT IN 10 SECONDS, PRESS  ctrl + c  TO CANCEL IF REQUIRED '

sleep 10s && reboot

