#!/bin/bash

description="
\n
USE KEYBOARD arrows AND tab TO NAVIGATE.\n\n
IN NEXT MENU USE Encrypt password:  TO ENABLE DISK ENCRYPTION.\n\n
IN NEXT MENU JUST PRESS enter TO CONTINUE DEFAULT INSTALLATION.\n\n
\n
DEFAULTS CREDENTIALS:
\n
 USER IS  username  WITH PASSWORD  123 \n
 ROOT IS  root      WITH PASSWORD  123 \n"

# Display dialog box to get user input
dialog --title "Installation Dialog" --clear --stdout --erase-on-exit --trim --no-shadow --beep --beep-after --msgbox "$description\n\nPress OK to continue. Press ESC to cancel." 0 0

# Check for the user's choice and exit accordingly
case $? in
  0)  # OK button pressed
    echo "Continue"
    ;;
  1)  # Cancel button pressed or ESC key
    echo "Cancelled."
    echo -ne "You've canceled the script. \nTo repeat, use:\n bash /root/scripts123/hello_dialog.sh \n Or press ctrl + d, or reboot if needed. \n"
    exit 1
    ;;
  255)  # Esc key pressed
    echo "ESC key pressed."
    echo -ne "You've canceled the script. \nTo repeat, use:\n bash /root/scripts123/hello_dialog.sh \n Or press ctrl + d, or type reboot then press enter. \n"
    exit 1
    ;;
esac


# variables

encryptionPassword=""
userPassword=123
rootPassword=123
userName=username

# Function to display the input dialog
show_input_dialog() {
    inputDialog=$(dialog --stdout --clear --erase-on-exit --no-cancel --trim --beep --beep-after --no-shadow --stdout --title "Installation Dialog" \
                    --form "Note: use keyboard  ARROWS and TAB  to navigate.\n\nNote: Leaving the encryption password field blank will result in a non-encrypted installation.\n\nNote: Username should not include any spaces or special characters..\n\n Please provide the necessary installation credentials: \n\n" 0 0 0 \
                    "Encrypt password:" 1 1 "$encryptionPassword" 1 20 35 0 \
                    "user password:" 2 1 "$userPassword" 2 20 35 0 \
                    "root password:" 3 1 "$rootPassword" 3 20 35 0 \
                    "Username:     " 4 1 "$userName" 4 20 35 0)


    # Read input from dialog output
    if [ $? -eq 0 ]; then
        read_input "$inputDialog"
    else
        exit 1  # Exit if user cancels
    fi
}

Function to read input from dialog output
read_input() {
    # echo "$1"
    encryptionPassword=$(echo "$1" | awk 'NR==1{print $NF}')
    userPassword=$(echo "$1" | awk 'NR==2{print $NF}')
    rootPassword=$(echo "$1" | awk 'NR==3{print $NF}')
    userName=$(echo "$1" | awk 'NR==4{print $NF}')
}

# Main loop
while true; do
    show_input_dialog
    # break if provided one of the field
    if [ "$encryptionPassword$userPassword$rootPassword" != "" ]; then
        break
    fi
done

# Pass input data to next script or process
# echo "Encrp password will be: $encryptionPassword"
# echo "User  password will be: $userPassword"
# echo "root  password will be: $rootPassword"
# echo "username       will be: $userName"
# Next steps here...

#echo "$(jq --arg root_pass "$rootPassword" --arg user_pass "$userPassword" '.["!root-password"]=$root_pass | .["!users"][0]["!password"]=$user_pass' 1.json )" > 1.json

# setup username
echo "[*] setup username"
sed -i "s/RRRRRRREEEEEEPLACMEEUSERNAME/$userName/g" /root/scripts123/do_this_inside_chroot.sh
sed -i "s/RRRRRRREEEEEEPLACMEEUSERNAME/$userName/g" /root/scripts123/user_credentials.json
# setup passwords
echo "[*] setup passwords"
#sed -i "s/RRRRRRREEEEEEPLACMEEUSERNAME/$userName/g" /root/scripts123/do_this_inside_chroot.sh
#sed -i "s/RRRRRRREEEEEEPLACMEEUSERNAME/$userName/g" /root/scripts123/user_credentials.json
#
echo "$(jq --arg root_pass "$rootPassword" --arg user_pass "$userPassword" '.["!root-password"]=$root_pass | .["!users"][0]["!password"]=$user_pass' /root/scripts123/user_credentials.json )" > /root/scripts123/user_credentials.json


echo "[*] using proper encryption metod"
if [ "$encryptionPassword" = "" ]; then
    echo "[*] The encryption has been disabled because no password was provided"
else
    echo "[*] The encryption password provided"
    # Perform encryption tasks if encryptionPassword is not empty
    echo "$(jq '. + { "encryption_password": "'"$encryptionPassword"'" }' /root/scripts123/user_credentials.json )"  > /root/scripts123/user_credentials.json
    #mv /root/temp.json /root/test.json
    echo "$(jq '. + {"disk_encryption": {"encryption_type": "luks", "partitions": ["95b57b0a-ca5c-416a-89ef-2c6c43bb64fa"]}}'  /root/scripts123/user_configuration.json )" > /root/scripts123/user_configuration.json
    #mv /root/temp.json /root/test.json
fi


#RRRRRRREEEEEEPLACMEE

# dialog --backtitle "Dialog Form Example" --title "Dialog - Form" \
# --form "\nDialog Sample Label and Values" 25 60 16 \
# "Form Label 1:" 1 1 "Value 1" 1 25 25 30 \
# "Form Label 2:" 2 1 "Value 2" 2 25 25 30 \
# "Form Label 3:" 3 1 "Value 3" 3 25 25 30 \
# "Form Label 4:" 4 1 "Value 4" 4 25 25 30

echo "[*] running installation scripts..."
bash /root/scripts123/archinstall_offline.sh
