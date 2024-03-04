#!/bin/bash

# ignore some pkgs provided by archinstall by default ( there currently no possible way to chage it using archinstall instaad )

#sed -i 's/#IgnorePkg.*=.*$/IgnorePkg = gdb gcc smbclient vim vim-runtime man-pages /g' /etc/pacman.conf
#sed -i 's/#IgnoreGroup.*=.*$/IgnoreGroup = base-devel /g' /etc/pacman.conf

#base-devel gcc smbclient vim vim-runtime man-pages

bash /root/scripts123/first_available_disk.sh
