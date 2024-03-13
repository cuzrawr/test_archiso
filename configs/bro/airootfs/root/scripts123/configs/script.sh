#!/bin/bash

cp /usr/lib/initcpio/hooks/encrypt.bak /usr/lib/initcpio/hooks/encrypt
rm /usr/lib/initcpio/hooks/encrypt.bak

plymouth-set-default-theme tribar -R
# Disable and remove systemd service
systemctl disable run-once.service

rm /etc/systemd/system/run-once.service

rm /bin/script.sh

#systemctl daemon-reload

