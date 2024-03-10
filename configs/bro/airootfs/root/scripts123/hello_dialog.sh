
################################################################################

description="
\n OFFLINE INSTALLATION \n\n
IN NEXT MENU USE KEYBOARD ARROWS TO NAVIGATE.\n\n
IN NEXT MENU USE > Disk encryption  TO ENABLE DISK ENCRYPTION.\n\n
IN NEXT MENU JUST SELECT AND PRESS > install TO CONTINUE DEFAULT INSTALLATION.\n\n
IN NEXT MENU YOU CAN SET root AND user PASSWORDS IF NEED.\n\n
\n\n
DEFAULTS PASSWORD:
\n
 USER IS  username  WITH PASSWORD  123 \n
 ROOT IS  root      WITH PASSWORD  123 \n\n"

# Display dialog box to get user input
input=$(dialog --stdout --clear --erase-on-exit --trim --beep --beep-after --menu "$description\n\nPress continue to continue:" 0 0 0 \
	1 "CONTINUE")
    # 1 "archinstall offline WORKS" \
    # 2 "archinstall offline guided WORKS " \
    # 3 "archinstall online BROKEN " \
    # 4 "archinstall default + custom input BROKEN ")

################################################################################

description=" This ARCHINSTALL runs with these PARAMETERS:\n
archinstall --config /root/scripts123/user_configuration.json --creds /root/scripts123/user_credentials.json \n
--------------------------------------------------------------------------------\n
archinstall --help: \n
    --config <ALREADY SPECIFIED DO NOT USE>\n
    --creds: <ALREADY SPECIFIED DO NOT USE>\n
    --silent: WARNING: Disables all prompts for input and confirmation. If no configuration is provided, this is ignored\n
    --dry-run: Generates a configuration file and then exits instead of performing an installation\n
    --script: Script to run for installation\n
    --mount-point: Define an alternate mount point for installation\n
    --skip-ntp: Disables NTP checks during installation\n
    --debug: Adds debug info into the log\n
    --offline: Disabled online upstream services such as package search and key-ring auto-update.\n
    --no-pkg-lookups: Disabled package validation specifically prior to starting installation.\n
    --plugin: \n
    --skip-version-check: Skip the version check when running archinstall\n\n
    "

################################################################################

# Check for the user's input and execute the appropriate command
case $? in
  0)  # OK button pressed
    case $input in
      "1") bash /root/scripts123/archinstall_offline.sh ;;
      "2") bash /root/scripts123/archinstall_offline_guided.sh ;;
      "3") bash /root/scripts123/archinstall_online.sh ;;
      "4") bash /root/scripts123/archinstall_default.sh $(dialog --stdout --clear --erase-on-exit --trim --beep --beep-after --stdout --inputbox "$description\n\nProvide your custom command which will be passed to archinstall: " 0 0) ;;  # Custom command with input as argument
      *)   exit 1 ;;  # exiting abnormaly
    esac
    ;;
  1)  # Cancel button pressed or ESC key
    echo "Cancelled."
    echo "You've canceled the script. \n To repeat, use: \n bash /root/scripts123/hello_dialog.sh. Or press ctrl + d, or reboot if needed. "
    ;;
  255)  # Esc key pressed
    echo "ESC key pressed."
    echo "You've canceled the script. \n To repeat, use: \n bash /root/scripts123/hello_dialog.sh. Or press ctrl + d, or reboot if needed. "
    ;;
esac
