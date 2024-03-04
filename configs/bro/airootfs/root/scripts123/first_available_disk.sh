#!/bin/bash

# Function to check and print the first available disk
find_first_disk() {
  # Define an array of possible disk prefixes to check
  disk_types=("sd" "nvme" "md" "mmcblk" "hd" "xvd" "vd")

  for dt in "${disk_types[@]}"; do
    # Scan for available disks of the current type
    disks=$(ls /dev/${dt}* 2> /dev/null)

    # If disks are found, print the first one and return
    if [ ! -z "$disks" ]; then
      # Selecting the first disk from the list of disks found
      for disk in $disks; do
        # Ensure we pick a disk, not a partition (e.g., /dev/sda, not /dev/sda1)
        if [[ ! "$disk" =~ [0-9]$ ]]; then
          echo "$disk"
          return
        fi
      done
    fi
  done

  echo "No physical disks found!"
}

# Call the function to find and print the first available disk
first_disk=$(find_first_disk)
echo "-------------------------------------------------------------------------"
echo "Select first available disk: $first_disk"
echo "-------------------------------------------------------------------------"
sed -i "s|REPLACEMEREPLACEMEREPLACEME123|$first_disk|g" /root/scripts123/user_configuration.json
echo " <user_configuration.json> has this disk as default now: "
grep -oE "\"device\"[^,]+" /root/scripts123/user_configuration.json
echo "-------------------------------------------------------------------------"

# Optionally, you could add logic here to use $first_disk in your installation script

