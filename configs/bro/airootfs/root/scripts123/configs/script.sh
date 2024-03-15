#!/bin/bash

cp /usr/lib/initcpio/hooks/encrypt.bak /usr/lib/initcpio/hooks/encrypt
rm /usr/lib/initcpio/hooks/encrypt.bak

echo "[*] patching mkinitcpio... "
sed -i '/^HOOKS=/ s/\budev\b/plymouth udev/' /etc/mkinitcpio.conf

plymouth-set-default-theme tribar -R
# Disable and remove systemd service
systemctl disable run-once.service

rm /etc/systemd/system/run-once.service

rm /bin/script.sh

#systemctl daemon-reload

