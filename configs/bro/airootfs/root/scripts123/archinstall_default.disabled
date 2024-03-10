#!/bin/bash


bash /root/scripts123/do_this_before_archinstall_execution.sh

archinstall --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json  "$@"




# done

bash /root/scripts123/do_this_outside_chroot.sh

cp /root/scripts123/do_this_inside_chroot.sh /mnt/archinstall/do_this_inside_chroot.sh
chroot /mnt/archinstall bash /do_this_inside_chroot.sh


echo ' ------------------------------------------------------------------------'
echo ' ... INSTALL COMPLETED ...   '
echo ' ... REBOOT IN 10 SECONDS, PRESS  ctrl + c  TO CANCEL ...'
echo ' ------------------------------------------------------------------------'

sleep 10s && reboot
