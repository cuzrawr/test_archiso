#!/bin/bash

# Get the size of /dev/sda in bytes
size=$(blockdev --getsize64 /dev/sda)

# Subtract 147849216 bytes  
# currently hardcoded in user_configuration.json
# 147849216 = boot partition size + 1 MiB
# so we subtract it from whole disk size to fit our rootfs
result=$((size - 147849216))

# Output the result
#echo "Disc partition precalcualtions autodetect: $result bytes to rootfs"



echo "-------------------------------------------------------------------------"
echo "Disc partition precalcualtions autodetect: $result bytes to rootfs"
echo "-------------------------------------------------------------------------"
sed -i "s|\"REPLACEMEREPLACEMEREPLACEMEBYTESBYTESROOTFS\"|$result|g" /root/scripts123/user_configuration.json
echo "-------------------------------------------------------------------------"
