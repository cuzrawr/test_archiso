#!/bin/bash

# Improved installation script

# Display a welcoming message and guidance for navigation
show_welcome_message() {
    local description="USE KEYBOARD arrows AND tab TO NAVIGATE.

IN NEXT MENU USE 'Encrypt password' TO ENABLE DISK ENCRYPTION.

IN NEXT MENU JUST PRESS enter TO CONTINUE DEFAULT INSTALLATION.

DEFAULT CREDENTIALS:
USER IS 'username' WITH PASSWORD '123'
ROOT IS 'root' WITH PASSWORD '123'"

    if ! dialog --title "Installation Dialog" --clear --stdout --erase-on-exit --trim --no-shadow --beep --beep-after --msgbox "$description\n\nPress OK to continue. Press ESC to cancel". 0 0; then
        echo "Installation canceled".
        exit 1
    fi
}

# Function to collect necessary installation input
collect_installation_input() {
    while true; do
        local inputDialog=$(dialog --stdout --clear --erase-on-exit --no-cancel --trim --beep --beep-after --no-shadow --stdout --title "Installation Dialog" \
            --form "Note: Use keyboard ARROWS and TAB to navigate.\n\nLeaving the encryption password field blank will result in a non-encrypted installation.\n\nPlease provide the necessary installation credentials: " 0 0 0 \
            "Encrypt password:" 1 1 "" 1 20 35 0 \
            "User password:" 2 1 "123" 2 20 35 0 \
            "Root password:" 3 1 "123" 3 20 35 0 \
            "Username:" 4 1 "username" 4 20 35 0)

        if [[ $? -ne 0 ]]; then
            echo "User canceled the input dialog".
            exit 1
        fi

        # Read input from dialog output
        #EEEEEEEEEEEEEEEEEEEEEEERRRRRROOOOOOOOOOOOOOOOOOOR
        read -r encryptionPassword userPassword rootPassword userName <<<$inputDialog

        # Break if at least one of the fields is provided
        [[ -n "$encryptionPassword$userPassword$rootPassword" ]] && break
    done
}

# Function to setup user credentials and encryption method if applicable
setup_credentials_and_encryption() {
    local userConfFile="/root/scripts123/user_credentials.json"
    local userSetupScript="/root/scripts123/do_this_inside_chroot.sh"

    # Replace username in configuration files
    echo "[*] Setting up username"
    sed -i "s/RRRRRRREEEEEEPLACMEEUSERNAME/$userName/g" "$userSetupScript"
    sed -i "s/RRRRRRREEEEEEPLACMEEUSERNAME/$userName/g" "$userConfFile"

    # Update credentials in JSON configuration
    echo "[*] Setting up passwords"
    jq --arg rp "$rootPassword" --arg up "$userPassword" '.["!root-password"]=$rp | .["!users"][0]["!password"]=$up' "$userConfFile" > "$userConfFile".tmp && mv "$userConfFile".tmp "$userConfFile"

    echo "[*] Using proper encryption method"
    if [[ -z "$encryptionPassword" ]]; then
        echo "Encryption has been disabled because no password was provided".
    else
        echo "Encryption password provided".
        # Add encryption details to configuration
        jq '. + { "encryption_password": "'"$encryptionPassword"'" }' "$userConfFile" > "$userConfFile".tmp && mv "$userConfFile".tmp "$userConfFile"
        jq '. + {"disk_encryption": {"encryption_type": "luks", "partitions": ["95b57b0a-ca5c-416a-89ef-2c6c43bb64fa"]}}' "/root/scripts123/user_configuration.json" > "/root/scripts123/user_configuration.json".tmp && mv "/root/scripts123/user_configuration.json".tmp "/root/scripts123/user_configuration.json"
    fi
}

# Main execution flow
show_welcome_message
collect_installation_input
#setup_credentials_and_encryption
echo " root pass: $rootPassword"
echo " user pass: $userPassword"
echo " encryption: $encryptionPassword"
echo " username: $userName"
echo "[*] Running installation scripts..".
bash /root/scripts123/archinstall_offline.sh
